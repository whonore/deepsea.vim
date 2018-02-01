if exists('b:current_syntax')
    finish
endif

syn keyword dsModifier      const external ghost logical trusted
syn keyword dsConditional   if then else
syn keyword dsMatch         match with end
syn keyword dsLoop          for to do first fold
syn keyword dsBlock         begin end
syn keyword dsLet           let in
syn keyword dsDeclaration   object layer signature type
syn keyword dsBaseType      array bool globalpointer int uint unit
syn keyword dsBool          true false
syn keyword dsUndefPtr      GLOBUndef
syn keyword dsAssertion     assert deny fail

syn keyword dsOperator  mod
syn match dsOperator    '[-+*/]'
syn match dsOperator    '[!~&^]\|||'
syn match dsOperator    '/\\\|\\/'
syn match dsOperator    '<<\|>>'
syn match dsOperator    '[<>]=\?'
syn match dsOperator    '=\|<>'
syn match dsOperator    '@'
syn match dsOperator    ':[=>]\?'
syn match dsOperator    '=>\||'
syn match dsOperator    '[,.;]'

syn match dsParen '[][(){}]'

syn match dsInteger '\<\%(0u\)\?\%([1-9][0-9_]*\|0\)\>'
syn match dsInteger '\<\%(0u\)\?0[xX][0-9A-Fa-f_]\+\>'
syn match dsInteger '\<\%(0u\)\?0[oO]\?[0-7_]\+\>'
syn match dsInteger '\<\%(0u\)\?0[bB][0-1_]\+\>'

syn keyword dsTodo      FIXME TODO XXX contained
syn region dsComment    start='(\*' end='\*)' contains=dsTodo,dsComment

syn region dsString     start='"' end='"' skip='\\\\\|\\"'

" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists('did_coq_syntax_inits')
    if version < 508
        let did_coq_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink dsModifier       Type
    HiLink dsConditional    Conditional
    HiLink dsMatch          Statement
    HiLink dsLoop           Repeat
    HiLink dsBlock          Statement
    HiLink dsLet            Statement
    HiLink dsDeclaration    Statement
    HiLink dsBaseType       Type
    HiLink dsBool           Boolean
    HiLink dsUndefPtr       Constant
    HiLink dsAssertion      Statement
    HiLink dsOperator       Operator
    HiLink dsParen          Operator
    HiLink dsInteger        Number
    HiLink dsTodo           Todo
    HiLink dsComment        Comment
    HiLink dsString         String

    delcommand HiLink
endif

let b:current_syntax = 'deepsea'
