@interface AXFirstResponderValueChangeManager
+ (id)sharedInstance;
- (id)_handleApostropheIfNeeded:(id)a3;
- (id)_outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 isFirstResponderValid:(BOOL)a5 selectedTextRange:(_NSRange)a6 oldSelectedTextRange:(_NSRange)a7 shouldEchoDeletion:(BOOL)a8 optionalValueChangeType:(unint64_t)a9 derivedValueChangeType:(unint64_t *)a10 didHitBorder:(BOOL *)a11 isBreakSpaceCharacter:(BOOL *)a12 isSingleInsert:(BOOL)a13 selectionDeleted:(BOOL)a14 feedbackType:(unint64_t)a15 textOperationOccurred:(BOOL *)a16 lastKeyboardKeyPress:(double)a17 isSingleCharacterInsertOrDelete:(BOOL *)a18 singleInsertDeleteAttString:(id *)a19 singleInsertDeleteString:(id *)a20 isSingleCharacterUpdate:(BOOL *)a21 wordRangeToFindMisspelled:(_NSRange *)a22 pasteOperationSucceeded:(BOOL *)a23 shouldOutputSingleCharactersOnly:(BOOL)a24 processApostrophes:(BOOL)a25;
- (id)outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 isFirstResponderValid:(BOOL)a5 selectedTextRange:(_NSRange)a6 oldSelectedTextRange:(_NSRange)a7 shouldEchoDeletion:(BOOL)a8 optionalValueChangeType:(unint64_t)a9 derivedValueChangeType:(unint64_t *)a10 didHitBorder:(BOOL *)a11 isBreakSpaceCharacter:(BOOL *)a12 isSingleInsert:(BOOL)a13 selectionDeleted:(BOOL)a14 feedbackType:(unint64_t)a15 textOperationOccurred:(BOOL *)a16 lastKeyboardKeyPress:(double)a17 isSingleCharacterInsertOrDelete:(BOOL *)a18 singleInsertDeleteAttString:(id *)a19 singleInsertDeleteString:(id *)a20 isSingleCharacterUpdate:(BOOL *)a21 wordRangeToFindMisspelled:(_NSRange *)a22 pasteOperationSucceeded:(BOOL *)a23 processApostrophes:(BOOL)a24;
- (id)outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 selectedTextRange:(_NSRange)a5 oldSelectedTextRange:(_NSRange)a6 shouldEchoDeletion:(BOOL)a7 isSingleInsert:(BOOL)a8 feedbackType:(unint64_t)a9 lastKeyboardKeyPress:(double)a10;
- (id)outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 selectedTextRange:(_NSRange)a5 shouldEchoDeletion:(BOOL)a6 isSingleInsert:(BOOL)a7 feedbackType:(unint64_t)a8 lastKeyboardKeyPress:(double)a9;
- (id)outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 selectedTextRange:(_NSRange)a5 shouldEchoDeletion:(BOOL)a6 isSingleInsert:(BOOL)a7 feedbackType:(unint64_t)a8 lastKeyboardKeyPress:(double)a9 shouldOutputSingleCharactersOnly:(BOOL)a10;
- (id)wordBreakSet;
- (void)_handleAttributedApostropheIfNeeded:(id)a3;
@end

@implementation AXFirstResponderValueChangeManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_SharedInstance;

  return v2;
}

uint64_t __52__AXFirstResponderValueChangeManager_sharedInstance__block_invoke()
{
  sharedInstance_SharedInstance = objc_alloc_init(AXFirstResponderValueChangeManager);

  return MEMORY[0x1F41817F8]();
}

- (id)outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 selectedTextRange:(_NSRange)a5 shouldEchoDeletion:(BOOL)a6 isSingleInsert:(BOOL)a7 feedbackType:(unint64_t)a8 lastKeyboardKeyPress:(double)a9
{
  BYTE1(v10) = a7;
  LOBYTE(v10) = a6;
  return -[AXFirstResponderValueChangeManager outputValueChangeForNewValue:oldValue:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:isSingleInsert:feedbackType:lastKeyboardKeyPress:](self, "outputValueChangeForNewValue:oldValue:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:isSingleInsert:feedbackType:lastKeyboardKeyPress:", a3, a4, a5.location, a5.length, 0x7FFFFFFFLL, 0, a9, v10, a8);
}

- (id)outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 selectedTextRange:(_NSRange)a5 shouldEchoDeletion:(BOOL)a6 isSingleInsert:(BOOL)a7 feedbackType:(unint64_t)a8 lastKeyboardKeyPress:(double)a9 shouldOutputSingleCharactersOnly:(BOOL)a10
{
  BYTE1(v13) = 1;
  LOBYTE(v13) = a10;
  LOWORD(v12) = a7;
  LOBYTE(v11) = a6;
  return -[AXFirstResponderValueChangeManager _outputValueChangeForNewValue:oldValue:isFirstResponderValid:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:optionalValueChangeType:derivedValueChangeType:didHitBorder:isBreakSpaceCharacter:isSingleInsert:selectionDeleted:feedbackType:textOperationOccurred:lastKeyboardKeyPress:isSingleCharacterInsertOrDelete:singleInsertDeleteAttString:singleInsertDeleteString:isSingleCharacterUpdate:wordRangeToFindMisspelled:pasteOperationSucceeded:shouldOutputSingleCharactersOnly:processApostrophes:](self, "_outputValueChangeForNewValue:oldValue:isFirstResponderValid:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:optionalValueChangeType:derivedValueChangeType:didHitBorder:isBreakSpaceCharacter:isSingleInsert:selectionDeleted:feedbackType:textOperationOccurred:lastKeyboardKeyPress:isSingleCharacterInsertOrDelete:singleInsertDeleteAttString:singleInsertDeleteString:isSingleCharacterUpdate:wordRangeToFindMisspelled:pasteOperationSucceeded:shouldOutputSingleCharactersOnly:processApostrophes:", a3, a4, 1, a5.location, a5.length, a9, 0x7FFFFFFFLL, 0, v11, 0, 0, 0, 0,
           v12,
           a8,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           v13);
}

- (id)outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 selectedTextRange:(_NSRange)a5 oldSelectedTextRange:(_NSRange)a6 shouldEchoDeletion:(BOOL)a7 isSingleInsert:(BOOL)a8 feedbackType:(unint64_t)a9 lastKeyboardKeyPress:(double)a10
{
  LOBYTE(v13) = 1;
  LOWORD(v12) = a8;
  LOBYTE(v11) = a7;
  return -[AXFirstResponderValueChangeManager outputValueChangeForNewValue:oldValue:isFirstResponderValid:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:optionalValueChangeType:derivedValueChangeType:didHitBorder:isBreakSpaceCharacter:isSingleInsert:selectionDeleted:feedbackType:textOperationOccurred:lastKeyboardKeyPress:isSingleCharacterInsertOrDelete:singleInsertDeleteAttString:singleInsertDeleteString:isSingleCharacterUpdate:wordRangeToFindMisspelled:pasteOperationSucceeded:processApostrophes:](self, "outputValueChangeForNewValue:oldValue:isFirstResponderValid:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:optionalValueChangeType:derivedValueChangeType:didHitBorder:isBreakSpaceCharacter:isSingleInsert:selectionDeleted:feedbackType:textOperationOccurred:lastKeyboardKeyPress:isSingleCharacterInsertOrDelete:singleInsertDeleteAttString:singleInsertDeleteString:isSingleCharacterUpdate:wordRangeToFindMisspelled:pasteOperationSucceeded:processApostrophes:", a3, a4, 1, a5.location, a5.length, a10, a6.location, a6.length, v11, 0, 0, 0, 0,
           v12,
           a9,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           v13);
}

- (id)outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 isFirstResponderValid:(BOOL)a5 selectedTextRange:(_NSRange)a6 oldSelectedTextRange:(_NSRange)a7 shouldEchoDeletion:(BOOL)a8 optionalValueChangeType:(unint64_t)a9 derivedValueChangeType:(unint64_t *)a10 didHitBorder:(BOOL *)a11 isBreakSpaceCharacter:(BOOL *)a12 isSingleInsert:(BOOL)a13 selectionDeleted:(BOOL)a14 feedbackType:(unint64_t)a15 textOperationOccurred:(BOOL *)a16 lastKeyboardKeyPress:(double)a17 isSingleCharacterInsertOrDelete:(BOOL *)a18 singleInsertDeleteAttString:(id *)a19 singleInsertDeleteString:(id *)a20 isSingleCharacterUpdate:(BOOL *)a21 wordRangeToFindMisspelled:(_NSRange *)a22 pasteOperationSucceeded:(BOOL *)a23 processApostrophes:(BOOL)a24
{
  BYTE1(v27) = a24;
  LOBYTE(v27) = 0;
  LOWORD(v26) = __PAIR16__(a14, a13);
  LOBYTE(v25) = a8;
  return -[AXFirstResponderValueChangeManager _outputValueChangeForNewValue:oldValue:isFirstResponderValid:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:optionalValueChangeType:derivedValueChangeType:didHitBorder:isBreakSpaceCharacter:isSingleInsert:selectionDeleted:feedbackType:textOperationOccurred:lastKeyboardKeyPress:isSingleCharacterInsertOrDelete:singleInsertDeleteAttString:singleInsertDeleteString:isSingleCharacterUpdate:wordRangeToFindMisspelled:pasteOperationSucceeded:shouldOutputSingleCharactersOnly:processApostrophes:](self, "_outputValueChangeForNewValue:oldValue:isFirstResponderValid:selectedTextRange:oldSelectedTextRange:shouldEchoDeletion:optionalValueChangeType:derivedValueChangeType:didHitBorder:isBreakSpaceCharacter:isSingleInsert:selectionDeleted:feedbackType:textOperationOccurred:lastKeyboardKeyPress:isSingleCharacterInsertOrDelete:singleInsertDeleteAttString:singleInsertDeleteString:isSingleCharacterUpdate:wordRangeToFindMisspelled:pasteOperationSucceeded:shouldOutputSingleCharactersOnly:processApostrophes:", a3, a4, a5, a6.location, a6.length, a17, a7.location, a7.length, v25, a9, a10, a11, a12,
           v26,
           a15,
           a16,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           v27);
}

- (id)_outputValueChangeForNewValue:(id)a3 oldValue:(id)a4 isFirstResponderValid:(BOOL)a5 selectedTextRange:(_NSRange)a6 oldSelectedTextRange:(_NSRange)a7 shouldEchoDeletion:(BOOL)a8 optionalValueChangeType:(unint64_t)a9 derivedValueChangeType:(unint64_t *)a10 didHitBorder:(BOOL *)a11 isBreakSpaceCharacter:(BOOL *)a12 isSingleInsert:(BOOL)a13 selectionDeleted:(BOOL)a14 feedbackType:(unint64_t)a15 textOperationOccurred:(BOOL *)a16 lastKeyboardKeyPress:(double)a17 isSingleCharacterInsertOrDelete:(BOOL *)a18 singleInsertDeleteAttString:(id *)a19 singleInsertDeleteString:(id *)a20 isSingleCharacterUpdate:(BOOL *)a21 wordRangeToFindMisspelled:(_NSRange *)a22 pasteOperationSucceeded:(BOOL *)a23 shouldOutputSingleCharactersOnly:(BOOL)a24 processApostrophes:(BOOL)a25
{
  NSUInteger location = a6.location;
  BOOL v27 = a5;
  id v180 = a3;
  id v29 = a4;
  if (a16) {
    BOOL v175 = *a16;
  }
  else {
    BOOL v175 = 0;
  }
  BOOL v30 = a24;
  v31 = [MEMORY[0x1E4F488F0] string];
  id v179 = [NSString string];
  uint64_t v32 = [v29 length];
  uint64_t v33 = [v180 length];
  v177 = v31;
  v178 = v29;
  if ([v180 isAXAttributedString])
  {
    NSUInteger v34 = location;
    uint64_t v183 = 0;
    uint64_t v184 = 0;
    v35 = [v180 attributesAtIndex:0 effectiveRange:&v183];
    v36 = [v35 objectForKey:*MEMORY[0x1E4F48A88]];
    char v37 = [v36 BOOLValue];

    if (v37)
    {
      v38 = +[AXValueChangeUtilities phoneNumberWithoutFormattingCharacters:v29];
      uint64_t v39 = [v38 length];

      v40 = +[AXValueChangeUtilities phoneNumberWithoutFormattingCharacters:v180];
      uint64_t v41 = [v40 length];

      BOOL v30 = a24;
      if (v39 <= v41)
      {
        if (v41 <= v39)
        {
          unint64_t v168 = 0;
          v42 = &stru_1EDC3DEF8;
          goto LABEL_103;
        }
        v42 = +[AXValueChangeUtilities handleValueChangeForPhoneDeletionWithOldString:v180 newString:v29];
        uint64_t v43 = 1;
      }
      else
      {
        v42 = +[AXValueChangeUtilities handleValueChangeForPhoneDeletionWithOldString:v29 newString:v180];
        uint64_t v43 = 2;
      }
      unint64_t v168 = v43;
LABEL_103:
      v54 = [(__CFString *)v42 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1EDC3DEF8];

LABEL_104:
      BOOL v57 = 0;
      BOOL v172 = 0;
LABEL_105:
      BOOL v63 = 0;
      BOOL v64 = 0;
      NSUInteger v65 = 0;
      BOOL v166 = 0;
      goto LABEL_106;
    }

    BOOL v30 = a24;
    NSUInteger location = v34;
  }
  BOOL v45 = a9 == 2 || v32 > v33;
  if (a9 != 1 && v45 && a8)
  {
    if (a9 == 2)
    {
      if (v27) {
        int64_t v46 = location;
      }
      else {
        int64_t v46 = 0;
      }
    }
    else
    {
      int64_t v46 = +[AXValueChangeUtilities findLocationOfDifferenceInOldString:v29 withNewString:v180];
    }
    if (v46 >= v32)
    {
      BOOL v57 = 0;
    }
    else
    {
      v54 = &stru_1EDC3DEF8;
      if ([&stru_1EDC3DEF8 length])
      {
        BOOL v57 = 0;
LABEL_61:
        BOOL v172 = [(__CFString *)v54 length]
            && (([(__CFString *)v54 isEqualToString:@" "] & 1) != 0
             || [(__CFString *)v54 characterAtIndex:0] == 160);
        if ([(__CFString *)v54 length])
        {
LABEL_67:
          BOOL v63 = 0;
          BOOL v64 = 0;
          NSUInteger v65 = 0;
          BOOL v166 = 0;
          unint64_t v168 = 2;
LABEL_106:
          NSUInteger v77 = 0x7FFFFFFFLL;
          goto LABEL_153;
        }
        NSUInteger v65 = 0;
        BOOL v63 = 0;
        if (v32 < 1 || v33 < 1)
        {
          unint64_t v168 = 2;
          BOOL v64 = 0;
          BOOL v166 = 0;
          goto LABEL_106;
        }
        if (v32 != v33)
        {
          if (v32 - v33 == 1)
          {
            v87 = objc_msgSend(v29, "substringFromIndex:", objc_msgSend(v29, "length") - 1);
            v88 = [v87 decomposedStringWithCanonicalMapping];

            [v88 rangeOfComposedCharacterSequenceAtIndex:0];
            uint64_t v90 = [v88 substringFromIndex:v89 - 1];

            BOOL v63 = 0;
            NSUInteger v65 = 0;
            BOOL v166 = 0;
            unint64_t v168 = 2;
            NSUInteger v77 = 0x7FFFFFFFLL;
            v54 = (__CFString *)v90;
            BOOL v64 = 0;
            goto LABEL_153;
          }
          goto LABEL_67;
        }
        v66 = objc_msgSend(v29, "substringFromIndex:", objc_msgSend(v29, "length") - 1);
        v67 = [v66 decomposedStringWithCanonicalMapping];

        v68 = objc_msgSend(v180, "substringFromIndex:", objc_msgSend(v180, "length") - 1);
        v69 = [v68 decomposedStringWithCanonicalMapping];

        [v67 rangeOfComposedCharacterSequenceAtIndex:0];
        unint64_t v71 = v70;
        [v69 rangeOfComposedCharacterSequenceAtIndex:0];
        if (v71 <= v72)
        {
          if ([v29 isEqualToString:v180])
          {
            unint64_t v168 = 2;
LABEL_235:

            goto LABEL_105;
          }
          uint64_t v113 = objc_msgSend(v29, "substringWithRange:", 0, objc_msgSend(v29, "length") - 1);
          v114 = objc_msgSend(v180, "substringWithRange:", 0, objc_msgSend(v180, "length") - 1);
          if ([v114 isEqualToString:v113])
          {
            v115 = v69;

            uint64_t v74 = 1;
            v54 = v115;
          }
          else
          {
            uint64_t v74 = 2;
          }
          uint64_t v73 = (uint64_t)v54;

          v54 = (__CFString *)v113;
        }
        else
        {
          uint64_t v73 = [v67 substringFromIndex:v71 - 1];
          uint64_t v74 = 2;
        }
        unint64_t v168 = v74;

        v54 = (__CFString *)v73;
        goto LABEL_235;
      }
      int v78 = [v180 isEqualToString:v29];
      if (v46) {
        BOOL v57 = 0;
      }
      else {
        BOOL v57 = v78;
      }
      if (v32 <= v33) {
        uint64_t v79 = v78 ^ 1u;
      }
      else {
        uint64_t v79 = v32 - v33;
      }
      if (v32 == v33) {
        uint64_t v80 = v78 ^ 1u;
      }
      else {
        uint64_t v80 = v79;
      }
      if (v80 + v46 <= (unint64_t)[v29 length])
      {
        objc_msgSend(v29, "substringWithRange:", v46, v80);
        v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_61;
      }
    }
    v54 = &stru_1EDC3DEF8;
    goto LABEL_61;
  }
  int v171 = v32 - v33;
  BOOL v48 = a9 == 1 || v32 < v33;
  if (a9 != 2 && v48)
  {
    NSUInteger v167 = location;
    BOOL v164 = v30;
    unint64_t v49 = location - 1;
    if (location == 0x80000000 || (unint64_t v50 = location - 1, v49 > [v180 length])) {
      unint64_t v50 = +[AXValueChangeUtilities findLocationOfDifferenceInOldString:v180 withNewString:v29];
    }
    v51 = [(AXFirstResponderValueChangeManager *)self wordBreakSet];
    uint64_t v52 = v33 - v32;
    if ((int)v33 - (int)v32 >= 0) {
      unsigned int v53 = v33 - v32;
    }
    else {
      unsigned int v53 = v32 - v33;
    }
    if (v53 >= 2 && !a13 && !a14)
    {
      if ((uint64_t)v50 < v33)
      {
        v54 = &stru_1EDC3DEF8;
        unint64_t v55 = v50;
        while ((objc_msgSend(v51, "characterIsMember:", objc_msgSend(v180, "characterAtIndex:", v55)) & 1) == 0)
        {
          if (v33 == ++v55)
          {
            char v56 = 0;
            char v162 = 0;
            unint64_t v55 = v33;
            goto LABEL_118;
          }
        }
        v109 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        char v56 = objc_msgSend(v109, "characterIsMember:", objc_msgSend(v180, "characterAtIndex:", v55)) ^ 1;

        char v162 = 0;
        goto LABEL_117;
      }
      goto LABEL_78;
    }
    if (!a13 && !a14)
    {
LABEL_78:
      char v56 = 0;
      char v162 = 0;
LABEL_116:
      unint64_t v55 = v50;
LABEL_117:
      v54 = &stru_1EDC3DEF8;
      goto LABEL_118;
    }
    if ((v50 & 0x8000000000000000) != 0 || v50 >= [v180 length])
    {
      char v56 = 0;
      char v162 = 0;
      BOOL v175 = 0;
      goto LABEL_116;
    }
    unsigned __int16 v182 = [v180 characterAtIndex:v50];
    v176 = (void *)[objc_allocWithZone(NSString) initWithCharacters:&v182 length:1];
    v81 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    int v82 = [v81 characterIsMember:v182];

    int v83 = 0;
    if (v82)
    {
      if (!v50) {
        goto LABEL_262;
      }
      uint64_t v84 = [v180 rangeOfComposedCharacterSequenceAtIndex:v50 - 1];
      v86 = objc_msgSend(v180, "substringWithRange:", v84, v85);
      if ([v86 length] == 1) {
        int v83 = objc_msgSend(v51, "characterIsMember:", objc_msgSend(v86, "characterAtIndex:", 0));
      }
      else {
        int v83 = 0;
      }
    }
    if ((a15 & 0xFFFFFFFFFFFFFFFDLL) != 1 && !v83)
    {
      char v162 = 0;
      v54 = &stru_1EDC3DEF8;
      v142 = v176;
LABEL_268:

      char v56 = 0;
      BOOL v175 = 0;
      unint64_t v55 = v50;
LABEL_118:
      if ((uint64_t)v55 >= v33 && v33 > 0) {
        unint64_t v55 = v33 - 1;
      }
      if (v55 < [v180 length] && v55 < objc_msgSend(v29, "length"))
      {
        unint64_t v92 = [v180 length];
        if (v92 < [v29 length]
          && [v180 characterAtIndex:v55] == 8230
          && [v29 characterAtIndex:v55] == 46)
        {
          uint64_t v93 = 0;
          BOOL v166 = 0;
          v94 = @"…";
LABEL_230:
          BOOL v30 = v164;
LABEL_231:

          NSUInteger v65 = 0;
          NSUInteger v77 = 0x7FFFFFFFLL;
          v54 = v94;
          goto LABEL_149;
        }
      }
      if ((v55 & 0x8000000000000000) == 0 && v55 < [v180 length])
      {
        int v95 = objc_msgSend(v51, "characterIsMember:", objc_msgSend(v180, "characterAtIndex:", v55));
        int v96 = v171 >= 0 ? v171 : -v171;
        if (v95 && v96 == 1)
        {
          if (v55)
          {
            uint64_t v97 = 0;
            int v98 = 0;
            BOOL v30 = v164;
            NSUInteger v99 = v167;
            while (1)
            {
              int v100 = objc_msgSend(v51, "characterIsMember:", objc_msgSend(v180, "characterAtIndex:", v55 + v97 - 1));
              if (v100 && v97 == 0) {
                break;
              }
              if (v100 & v98)
              {
                uint64_t v102 = v55 + v97 - 1;
                goto LABEL_224;
              }
              v98 |= v100 ^ 1;
              --v97;
              if ((uint64_t)(v55 + v97) <= 0)
              {
                uint64_t v102 = -1;
                goto LABEL_224;
              }
            }
          }
          else
          {
            uint64_t v102 = -1;
            BOOL v30 = v164;
            NSUInteger v99 = v167;
LABEL_224:
            if ((a15 & 0xFFFFFFFFFFFFFFFELL) == 2)
            {
              uint64_t v122 = v102 & ~(v102 >> 63);
              NSUInteger v65 = v55 - v122;
              v123 = [v180 substringWithRange:v122];

              if (v123)
              {
                if ([v180 isAXAttributedString])
                {
                  v124 = [v180 attributeValueForKey:*MEMORY[0x1E4F48928]];
                }
                else
                {
                  v124 = 0;
                }
                v125 = [(__CFString *)v123 stringByTrimmingEmptySpaceEdges];
                uint64_t v126 = [v124 length];
                unint64_t v173 = v126 - [v125 length];
                v127 = [(__CFString *)v177 string];
                if ([v127 length] == 1)
                {
                  [(__CFString *)v177 string];
                  v128 = v169 = v123;
                  [v128 stringByTrimmingEmptySpaceEdges];
                  uint64_t v129 = v122;
                  NSUInteger v130 = v99;
                  v131 = v125;
                  v133 = v132 = v124;
                  int v161 = [v133 isEqualToString:&stru_1EDC3DEF8];

                  v124 = v132;
                  v125 = v131;
                  NSUInteger v99 = v130;
                  uint64_t v122 = v129;

                  v123 = v169;
                }
                else
                {
                  int v161 = 0;
                }

                if ((v173 & 0x8000000000000000) == 0 && v173 < [v124 length])
                {
                  v170 = v123;
                  v134 = [v124 substringFromIndex:v173];
                  int v135 = [v134 isEqualToString:v125];

                  if ((v161 & v135) == 1 && v99 - a7.location >= 2)
                  {
                    v136 = +[AXSettings sharedInstance];
                    char v137 = [v136 voiceOverInlineTextCompletionInsertionFeedback];

                    v138 = [MEMORY[0x1E4F488F0] axAttributedStringWithString:v124];
                    if ((v137 & 2) != 0)
                    {
                      v123 = v170;
                    }
                    else
                    {

                      v123 = 0;
                    }
                    if ((v137 & 8) != 0) {
                      [v138 setAttribute:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F489E8]];
                    }
                    if ((v137 & 2) != 0)
                    {
                      v155 = v138;
                      v156 = v123;
                      v123 = v155;
                    }
                  }
                  else
                  {
                    v123 = v170;
                  }
                }

                v54 = v123;
              }
              else
              {
                v54 = 0;
              }
              uint64_t v157 = [(__CFString *)v54 length];
              if (v157)
              {
                uint64_t v158 = v157;
                NSUInteger v159 = v122;
                uint64_t v160 = 0;
                v94 = &stru_1EDC3DEF8;
                while ((objc_msgSend(v51, "characterIsMember:", -[__CFString characterAtIndex:](v54, "characterAtIndex:", v160)) & 1) != 0)
                {
                  if (v158 == ++v160)
                  {
                    uint64_t v93 = 0;
                    BOOL v166 = 0;
                    goto LABEL_231;
                  }
                }
                uint64_t v93 = 0;
                BOOL v166 = 0;
                NSUInteger v77 = v159;
                goto LABEL_149;
              }
              uint64_t v93 = 0;
              BOOL v166 = 0;
              v94 = &stru_1EDC3DEF8;
              goto LABEL_231;
            }
          }
          uint64_t v93 = 0;
          BOOL v166 = 0;
          NSUInteger v65 = 0;
          NSUInteger v77 = 0x7FFFFFFFLL;
LABEL_149:
          if ([(__CFString *)v54 length] == 1) {
            uint64_t v103 = 1;
          }
          else {
            uint64_t v103 = v93;
          }
          unint64_t v168 = v103;

          BOOL v57 = 0;
          BOOL v172 = 0;
          BOOL v63 = 0;
          BOOL v64 = v162;
          goto LABEL_153;
        }
      }
      if (a13 || [(__CFString *)v54 length]) {
        goto LABEL_147;
      }
      if (v175)
      {
        if (v50 + v52 <= [v180 length])
        {
          objc_msgSend(v180, "substringWithRange:", v50, v52);
          v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v93 = 0;
          BOOL v166 = 1;
          goto LABEL_230;
        }
LABEL_147:
        uint64_t v93 = 0;
        BOOL v166 = 0;
        NSUInteger v65 = 0;
        NSUInteger v77 = 0x7FFFFFFFLL;
LABEL_148:
        BOOL v30 = v164;
        goto LABEL_149;
      }
      if (a15 - 1 > 2 || [(__CFString *)v54 length] && CFAbsoluteTimeGetCurrent() - a17 >= 0.5)
      {
        BOOL v166 = 0;
        uint64_t v93 = 0;
        if ((v56 & 1) == 0)
        {
          v94 = &stru_1EDC3DEF8;
          goto LABEL_230;
        }
        NSUInteger v77 = 0x7FFFFFFFLL;
        NSUInteger v65 = 0;
        goto LABEL_148;
      }
      NSUInteger v112 = a7.location;
      if (!v52 && v167 && v167 == a7.location)
      {
        uint64_t v52 = 1;
        BOOL v30 = v164;
      }
      else
      {
        BOOL v30 = v164;
        if (a7.location != 0x7FFFFFFF) {
          goto LABEL_275;
        }
        unint64_t v49 = v167 - v52;
        if (v167 < v52)
        {
          BOOL v166 = 0;
          NSUInteger v65 = 0;
          NSUInteger v77 = 0x7FFFFFFFLL;
LABEL_274:
          uint64_t v93 = 1;
          goto LABEL_149;
        }
      }
      NSUInteger v77 = 0x7FFFFFFFLL;
      NSUInteger v112 = v49;
      if (v49 == 0x7FFFFFFF)
      {
        BOOL v166 = 0;
        NSUInteger v65 = 0;
        goto LABEL_274;
      }
LABEL_275:
      if (v52 >= 1 && v112 + v52 <= [v180 length])
      {
        objc_msgSend(v180, "substringWithRange:", v112, v52);
        v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v94 = v54;
      }
      if ([(__CFString *)v94 isEqualToString:&stru_1EDC3DEF8])
      {
        if ((uint64_t)(v112 + 1) < 0 || v112 + 1 >= [v180 length])
        {
          v54 = 0;
        }
        else
        {
          v54 = [v180 substringFromIndex:v112 + 1];
        }
      }
      else
      {
        v54 = v94;
      }
      if (![(__CFString *)v54 isAXAttributedString]) {
        goto LABEL_294;
      }
      v150 = [(__CFString *)v54 attributeValueForKey:*MEMORY[0x1E4F48930]];
      int v151 = [(__CFString *)v54 isEqualToString:v150];

      if (!v151) {
        goto LABEL_294;
      }
      v152 = +[AXSettings sharedInstance];
      char v153 = [v152 voiceOverInlineTextCompletionAppearanceFeedback];

      if ((v153 & 2) != 0)
      {
        if ((v153 & 8) != 0)
        {
LABEL_290:
          [(__CFString *)v54 setAttribute:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F48A48]];
          if ((v153 & 2) != 0)
          {
LABEL_291:
            v54 = v54;

            BOOL v166 = 0;
            uint64_t v93 = 1;
            v94 = v54;
            goto LABEL_231;
          }
LABEL_294:
          BOOL v166 = 0;
          uint64_t v93 = 1;
          goto LABEL_231;
        }
      }
      else
      {

        v94 = 0;
        if ((v153 & 8) != 0) {
          goto LABEL_290;
        }
      }
      if ((v153 & 2) != 0) {
        goto LABEL_291;
      }
      goto LABEL_294;
    }
LABEL_262:
    if ([v180 isAXAttributedString])
    {
      uint64_t v183 = 0;
      uint64_t v184 = 0;
      v143 = [v180 attributesAtIndex:v50 effectiveRange:&v183];
      v181[0] = 0;
      v181[1] = 0;
      v144 = (void *)MEMORY[0x1E4F48A28];
      v163 = [v180 attribute:*MEMORY[0x1E4F48A28] atIndex:v50 effectiveRange:v181];
      if (v163 && v50 != v181[0])
      {
        v145 = (void *)[v143 mutableCopy];
        [v145 removeObjectForKey:*v144];
        [v145 removeObjectForKey:*MEMORY[0x1E4F48A30]];
        uint64_t v146 = [v145 copy];

        v143 = (void *)v146;
      }
      v142 = v176;
      v147 = [MEMORY[0x1E4F488F0] axAttributedStringWithString:v176];
      [v147 setAttributes:v143];
      id v148 = v147;

      v54 = (__CFString *)v148;
      char v162 = 1;
      v177 = v54;
    }
    else
    {
      v142 = v176;
      v149 = (void *)[v176 copy];

      v54 = v149;
      char v162 = 1;
      id v179 = v54;
    }
    goto LABEL_268;
  }
  int v58 = [v29 isEqualToString:v180];
  if ((a15 & 0xFFFFFFFFFFFFFFFDLL) != 1 || !v58 || v33 != 1 || location == a7.location)
  {
    int v75 = [v29 isEqualToString:v180];
    NSUInteger v65 = 0;
    BOOL v57 = 0;
    if (v33 > 0) {
      int v76 = v75;
    }
    else {
      int v76 = 0;
    }
    v54 = &stru_1EDC3DEF8;
    NSUInteger v77 = 0x7FFFFFFFLL;
    if ((a15 & 0xFFFFFFFFFFFFFFFDLL) != 1
      || v76
      || v32 != v33
      || v33 < 1
      || (v65 = 0, BOOL v57 = 0, v77 = 0x7FFFFFFFLL, !location)
      || location == 0x7FFFFFFF)
    {
      BOOL v172 = 0;
      BOOL v63 = 0;
      BOOL v64 = 0;
      BOOL v166 = 0;
      unint64_t v168 = 0;
      goto LABEL_153;
    }
    if ([v178 length] >= location)
    {
      v110 = [v178 substringToIndex:location];
    }
    else
    {
      v110 = 0;
    }
    BOOL v165 = v30;
    if ([v180 length] >= location)
    {
      v116 = [v180 substringToIndex:location];
    }
    else
    {
      v116 = 0;
    }
    uint64_t v117 = location - 1;
    if ([v110 length] >= location - 1)
    {
      v118 = [v110 substringFromIndex:location - 1];
      v119 = [v110 substringToIndex:location - 1];
    }
    else
    {
      v118 = 0;
      v119 = 0;
    }
    if ([v116 length] >= (unint64_t)v117)
    {
      v120 = [v116 substringFromIndex:location - 1];
      v121 = [v116 substringToIndex:location - 1];
    }
    else
    {
      v120 = 0;
      v121 = 0;
    }
    if ([v119 length]
      && [v121 length]
      && [v118 length]
      && [v120 length]
      && [v119 isEqualToString:v121]
      && ([v118 isEqualToString:v120] & 1) == 0)
    {
      v154 = v120;
    }
    else
    {
      if (![v118 length]
        || ![v120 length]
        || ([v118 isEqualToString:v120] & 1) != 0)
      {
        unint64_t v168 = 0;
LABEL_222:
        BOOL v30 = v165;

        goto LABEL_104;
      }
      if ((v117 & 0x8000000000000000) == 0)
      {
        uint64_t v117 = location;
        while (1)
        {
          uint64_t v139 = v117 - 1;
          if ([v180 length] >= (unint64_t)(v117 - 1)
            && [v178 length] >= (unint64_t)v139)
          {
            int v140 = [v180 characterAtIndex:v117 - 1];
            if (v140 == [v178 characterAtIndex:v117 - 1]) {
              break;
            }
          }
          --v117;
          if (v139 <= 0)
          {
            uint64_t v117 = -1;
            break;
          }
        }
      }
      if ([v180 length] < location || (unint64_t v141 = v117 & ~(v117 >> 63), objc_msgSend(v180, "length") < v141))
      {
        unint64_t v168 = 0;
        v54 = &stru_1EDC3DEF8;
        goto LABEL_222;
      }
      objc_msgSend(v180, "substringWithRange:", v117 & ~(v117 >> 63), location - v141);
      v154 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v54 = v154;
    unint64_t v168 = 1;
    goto LABEL_222;
  }
  unint64_t v59 = location - 1;
  if (location == 0x80000000 || v59 > [v180 length]) {
    unint64_t v59 = +[AXValueChangeUtilities findLocationOfDifferenceInOldString:v180 withNewString:v29];
  }
  if ((v59 & 0x8000000000000000) == 0 && v59 < [v180 length])
  {
    LOWORD(v181[0]) = [v180 characterAtIndex:v59];
    v60 = (void *)[objc_allocWithZone(NSString) initWithCharacters:v181 length:1];
    if ([v180 isAXAttributedString])
    {
      uint64_t v183 = 0;
      uint64_t v184 = 0;
      v61 = [v180 attributesAtIndex:v59 effectiveRange:&v183];
      v62 = [MEMORY[0x1E4F488F0] axAttributedStringWithString:v60];
      [v62 setAttributes:v61];
      v54 = v62;

      v177 = v54;
    }
    else
    {
      v111 = (void *)[v60 copy];

      v54 = v111;
      id v179 = v54;
    }

    BOOL v57 = 0;
    BOOL v172 = 0;
    BOOL v64 = 0;
    NSUInteger v65 = 0;
    BOOL v166 = 0;
    unint64_t v168 = 0;
    BOOL v63 = 1;
    goto LABEL_106;
  }
  BOOL v57 = 0;
  BOOL v172 = 0;
  BOOL v63 = 0;
  BOOL v64 = 0;
  NSUInteger v65 = 0;
  BOOL v166 = 0;
  unint64_t v168 = 0;
  NSUInteger v77 = 0x7FFFFFFFLL;
  v54 = &stru_1EDC3DEF8;
LABEL_153:
  if (v30 && (AXLanguageIsSpeakableEmojiString() & 1) == 0)
  {
    [(__CFString *)v54 rangeOfComposedCharacterSequenceAtIndex:0];
    if (v104 < [(__CFString *)v54 length])
    {

      v54 = 0;
    }
  }
  if (a25)
  {
    uint64_t v105 = [(AXFirstResponderValueChangeManager *)self _handleApostropheIfNeeded:v54];

    uint64_t v106 = [(AXFirstResponderValueChangeManager *)self _handleApostropheIfNeeded:v179];

    [(AXFirstResponderValueChangeManager *)self _handleAttributedApostropheIfNeeded:v177];
    v54 = (__CFString *)v105;
    id v179 = (id)v106;
  }
  if (a11) {
    *a11 = v57;
  }
  if (a12) {
    *a12 = v172;
  }
  if (a16) {
    *a16 = v175;
  }
  if (a18) {
    *a18 = v64;
  }
  if (a21) {
    *a21 = v63;
  }
  if (a19) {
    *a19 = v177;
  }
  if (a20) {
    *a20 = v179;
  }
  if (a22)
  {
    a22->NSUInteger location = v77;
    a22->length = v65;
  }
  if (a23) {
    *a23 = v166;
  }
  if (a10) {
    *a10 = v168;
  }
  v107 = v54;

  return v107;
}

- (id)_handleApostropheIfNeeded:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"‘"])
  {
    uint64_t v10 = @"typing.feedback.opening.single.quotation.mark";
  }
  else
  {
    if (![v3 isEqualToString:@"’"]) {
      goto LABEL_6;
    }
    uint64_t v10 = @"typing.feedback.closing.single.quotation.mark";
  }
  uint64_t v11 = AXParameterizedLocalizedString(1, v10, v4, v5, v6, v7, v8, v9, v13);

  id v3 = (id)v11;
LABEL_6:

  return v3;
}

- (void)_handleAttributedApostropheIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 string];
  objc_msgSend(v4, "replaceString:", -[AXFirstResponderValueChangeManager _handleApostropheIfNeeded:](self, "_handleApostropheIfNeeded:", v5));
}

- (id)wordBreakSet
{
  v2 = [MEMORY[0x1E4F28B88] wordBreakCharacterSet];
  id v3 = (void *)[v2 mutableCopy];

  [v3 removeCharactersInString:@"'’"];

  return v3;
}

@end