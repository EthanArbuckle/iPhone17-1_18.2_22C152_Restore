@interface IPRegexToolbox
+ (BOOL)isRangeInsideQuotationMarks:(_NSRange)a3 text:(id)a4 limitToSurroundingText:(BOOL)a5;
+ (BOOL)isRangeNearbyExclusionKeyword:(_NSRange)a3 text:(id)a4 limitToSurroundingText:(BOOL)a5 language:(id)a6;
+ (id)emailSubjectPrefixRegex;
+ (id)firstMatchingKeywordForRegex:(id)a3 inString:(id)a4 needsToLowercase:(BOOL)a5;
+ (id)matchingKeywordResultsForRegex:(id)a3 inString:(id)a4 needsToLowercase:(BOOL)a5;
+ (id)regexPatternByUncapturingPattern:(id)a3;
+ (id)regexPatternForLanguageID:(id)a3 eventVocabularyArray:(id)a4;
+ (id)regexPatternWithPrefix:(id)a3 suffix:(id)a4 choices:(id)a5;
+ (id)regularExpressionWithKey:(id)a3 generator:(id)a4;
+ (unint64_t)numberOfMatchesForRegex:(id)a3 inString:(id)a4 needsToLowercase:(BOOL)a5;
@end

@implementation IPRegexToolbox

+ (id)regexPatternByUncapturingPattern:(id)a3
{
  id v3 = a3;
  char v11 = 0;
  uint64_t v4 = lengthOfPatternAfterUncapturing(v3, &v11, 0);
  if (v11)
  {
    uint64_t v5 = v4;
    v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
    if (!v6) {
      +[IPRegexToolbox regexPatternByUncapturingPattern:]();
    }
    v7 = v6;
    if (v5 != lengthOfPatternAfterUncapturing(v3, 0, (uint64_t)v6)) {
      +[IPRegexToolbox regexPatternByUncapturingPattern:]();
    }
    uint64_t v8 = [[NSString alloc] initWithCharactersNoCopy:v7 length:v5 freeWhenDone:1];
  }
  else
  {
    uint64_t v8 = [v3 copy];
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)regexPatternWithPrefix:(id)a3 suffix:(id)a4 choices:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = lengthOfPatternAfterUncapturing(v7, 0, 0);
  uint64_t v11 = lengthOfPatternAfterUncapturing(v8, 0, 0) + v10;
  if ([v9 count])
  {
    v32 = v8;
    v33 = v7;
    unint64_t v12 = [v9 count];
    if (v12)
    {
      unint64_t v13 = 0;
      Mutable = 0;
      do
      {
        if (Mutable && CFBitVectorGetBitAtIndex(Mutable, v13))
        {
          ++v13;
        }
        else
        {
          v15 = [v9 objectAtIndexedSubscript:v13];
          uint64_t v16 = lengthOfPatternAfterUncapturing(v15, 0, 0);
          CFIndex v17 = ++v13;
          if (v13 < v12)
          {
            do
            {
              if (!Mutable || !CFBitVectorGetBitAtIndex(Mutable, v17))
              {
                v18 = [v9 objectAtIndexedSubscript:v17];
                if (([v18 isEqual:v15] & 1) != 0
                  || [v18 hasPrefix:v15]
                  && ((int v19 = objc_msgSend(v18, "characterAtIndex:", objc_msgSend(v15, "length")),
                       (v19 - 63) > 0x3D)
                   || ((1 << (v19 - 63)) & 0x3000000000000001) == 0)
                  && v19 != 42)
                {
                  if (!Mutable)
                  {
                    Mutable = CFBitVectorCreateMutable(0, v12);
                    CFBitVectorSetCount(Mutable, v12);
                  }
                  CFBitVectorSetBitAtIndex(Mutable, v17, 1u);
                }
              }
              ++v17;
            }
            while (v12 != v17);
          }
          v11 += v16;
        }
      }
      while (v13 != v12);
      uint64_t v20 = v12 + v11 - 1;
      if (Mutable)
      {
        v35.location = 0;
        v35.length = v12;
        char v21 = 0;
        v20 -= CFBitVectorGetCountOfBit(Mutable, v35, 1u);
LABEL_30:
        v26 = malloc_type_malloc(2 * v20, 0x1000040BDFB0063uLL);
        if (!v26) {
          +[IPRegexToolbox regexPatternWithPrefix:suffix:choices:]();
        }
        v27 = v26;
        uint64_t v28 = lengthOfPatternAfterUncapturing(v33, 0, (uint64_t)v26);
        if (v12)
        {
          for (CFIndex i = 0; i != v12; ++i)
          {
            if ((v21 & 1) != 0 || !CFBitVectorGetBitAtIndex(Mutable, i))
            {
              if (i) {
                v27[v28++] = 124;
              }
              v30 = [v9 objectAtIndexedSubscript:i];
              v28 += lengthOfPatternAfterUncapturing(v30, 0, (uint64_t)&v27[v28]);
            }
          }
        }
        if ((v21 & 1) == 0) {
          CFRelease(Mutable);
        }
        id v8 = v32;
        if (lengthOfPatternAfterUncapturing(v32, 0, (uint64_t)&v27[v28]) + v28 != v20) {
          +[IPRegexToolbox regexPatternWithPrefix:suffix:choices:].cold.4();
        }
        v25 = (__CFString *)[[NSString alloc] initWithCharactersNoCopy:v27 length:v20 freeWhenDone:1];
        id v7 = v33;
        goto LABEL_43;
      }
    }
    else
    {
      Mutable = 0;
      uint64_t v20 = v11 - 1;
    }
    char v21 = 1;
    goto LABEL_30;
  }
  if (v11)
  {
    v22 = malloc_type_malloc(2 * v11, 0x1000040BDFB0063uLL);
    if (!v22) {
      +[IPRegexToolbox regexPatternWithPrefix:suffix:choices:]();
    }
    v23 = v22;
    uint64_t v24 = lengthOfPatternAfterUncapturing(v7, 0, (uint64_t)v22);
    if (lengthOfPatternAfterUncapturing(v8, 0, (uint64_t)v23 + 2 * v24) + v24 != v11) {
      +[IPRegexToolbox regexPatternWithPrefix:suffix:choices:]();
    }
    v25 = (__CFString *)[[NSString alloc] initWithCharactersNoCopy:v23 length:v11 freeWhenDone:1];
  }
  else
  {
    v25 = &stru_26D895C60;
  }
LABEL_43:

  return v25;
}

+ (id)regexPatternForLanguageID:(id)a3 eventVocabularyArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 hasPrefix:@"ja"] & 1) != 0
    || ([v6 hasPrefix:@"zh"] & 1) != 0
    || ([v6 hasPrefix:@"ko"] & 1) != 0
    || ([v6 hasPrefix:@"th"] & 1) != 0)
  {
    id v8 = @"");
    id v9 = CFSTR("(?:");
  }
  else if ([v6 hasPrefix:@"fr"])
  {
    id v8 = @"\\b");
    id v9 = CFSTR("(?:\\b|[dljt]['’])(?:");
  }
  else
  {
    if ([v6 hasPrefix:@"it"]) {
      id v9 = CFSTR("(?:\\b|[lnmcdst]['’])(?:");
    }
    else {
      id v9 = CFSTR("\\b(?:");
    }
    id v8 = @"\\b");
  }
  uint64_t v10 = [a1 regexPatternWithPrefix:v9 suffix:v8 choices:v7];

  return v10;
}

+ (unint64_t)numberOfMatchesForRegex:(id)a3 inString:(id)a4 needsToLowercase:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if ([v8 length])
  {
    id v9 = (void *)MEMORY[0x22A632550]();
    if (v5 && ([v7 options] & 1) == 0)
    {
      uint64_t v10 = [v8 lowercaseString];

      id v8 = (id)v10;
    }
    unint64_t v11 = [v8 length];
    if (v11 >= 0x2710) {
      uint64_t v12 = 10000;
    }
    else {
      uint64_t v12 = v11;
    }
    unint64_t v13 = objc_msgSend(v7, "numberOfMatchesInString:options:range:", v8, 2, 0, v12);
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

+ (id)firstMatchingKeywordForRegex:(id)a3 inString:(id)a4 needsToLowercase:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x22A632550]();
  if (!v8) {
    goto LABEL_11;
  }
  if (v5)
  {
    if ([v7 options])
    {
      int v12 = 1;
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x22A632550]();
      uint64_t v11 = [v8 lowercaseString];

      int v12 = 0;
      id v8 = (id)v11;
    }
  }
  else
  {
    int v12 = 0;
  }
  unint64_t v13 = [v8 length];
  uint64_t v14 = v13 >= 0x2710 ? 10000 : v13;
  uint64_t v15 = objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v8, 2, 0, v14);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = v15;
    uint64_t v19 = v16;
    uint64_t v20 = (void *)MEMORY[0x22A632550]();
    char v21 = objc_msgSend(v8, "substringWithRange:", v18, v19);
    CFIndex v17 = v21;
    if (v12)
    {
      uint64_t v22 = [v21 lowercaseString];

      CFIndex v17 = (void *)v22;
    }
  }
  else
  {
LABEL_11:
    CFIndex v17 = 0;
  }

  return v17;
}

+ (id)matchingKeywordResultsForRegex:(id)a3 inString:(id)a4 needsToLowercase:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x22A632550]();
  if (v5)
  {
    uint64_t v10 = [v8 lowercaseString];

    id v8 = (id)v10;
  }
  unint64_t v11 = [v8 length];
  if (v11 >= 0x2710) {
    uint64_t v12 = 10000;
  }
  else {
    uint64_t v12 = v11;
  }
  unint64_t v13 = objc_msgSend(v7, "matchesInString:options:range:", v8, 2, 0, v12);

  return v13;
}

+ (BOOL)isRangeNearbyExclusionKeyword:(_NSRange)a3 text:(id)a4 limitToSurroundingText:(BOOL)a5 language:(id)a6
{
  BOOL v7 = a5;
  NSUInteger location = a3.location;
  id v10 = a4;
  id v11 = a6;
  if ([v11 isEqualToString:@"en"])
  {
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __85__IPRegexToolbox_isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___block_invoke;
    uint64_t v28 = &__block_descriptor_40_e5_v8__0l;
    id v29 = a1;
    if (isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___onceToken != -1) {
      dispatch_once(&isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___onceToken, &block);
    }
    uint64_t v12 = &isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___ipExprOnceResult;
  }
  else
  {
    if (![v11 isEqualToString:@"fr"])
    {
      BOOL v18 = 0;
      goto LABEL_17;
    }
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __85__IPRegexToolbox_isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___block_invoke_2;
    v23 = &__block_descriptor_40_e5_v8__0l;
    id v24 = a1;
    if (isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___onceToken_77 != -1) {
      dispatch_once(&isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___onceToken_77, &v20);
    }
    uint64_t v12 = &isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___ipExprOnceResult_76;
  }
  id v13 = (id)*v12;
  uint64_t v14 = v13;
  BOOL v15 = location > 0x32;
  if (v7 && v15) {
    NSUInteger v16 = location - 50;
  }
  else {
    NSUInteger v16 = 0;
  }
  if (v7 && v15) {
    uint64_t v17 = 50;
  }
  else {
    uint64_t v17 = location;
  }
  BOOL v18 = objc_msgSend(v13, "rangeOfFirstMatchInString:options:range:", v10, 0, v16, v17, v20, v21, v22, v23, v24, block, v26, v27, v28, v29) != 0x7FFFFFFFFFFFFFFFLL;

LABEL_17:
  return v18;
}

void __85__IPRegexToolbox_isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A632550]();
  id v3 = [*(id *)(a1 + 32) regexPatternForLanguageID:@"en" eventVocabularyArray:&unk_26D8CDAC8];
  uint64_t v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v3 options:0 error:0];

  BOOL v5 = (void *)isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___ipExprOnceResult;
  isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___ipExprOnceResult = v4;
}

void __85__IPRegexToolbox_isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A632550]();
  id v3 = [*(id *)(a1 + 32) regexPatternForLanguageID:@"fr" eventVocabularyArray:&unk_26D8CDAE0];
  uint64_t v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v3 options:0 error:0];

  BOOL v5 = (void *)isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___ipExprOnceResult_76;
  isRangeNearbyExclusionKeyword_text_limitToSurroundingText_language___ipExprOnceResult_76 = v4;
}

+ (BOOL)isRangeInsideQuotationMarks:(_NSRange)a3 text:(id)a4 limitToSurroundingText:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (isRangeInsideQuotationMarks_text_limitToSurroundingText__onceToken != -1) {
    dispatch_once(&isRangeInsideQuotationMarks_text_limitToSurroundingText__onceToken, &__block_literal_global_4);
  }
  BOOL v11 = 0;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v8 = location > 0x96;
    uint64_t v9 = v5 && v8 ? 150 : location;
    uint64_t v10 = v5 && v8 ? location - 150 : 0;
    if (objc_msgSend(v7, "rangeOfCharacterFromSet:options:range:", isRangeInsideQuotationMarks_text_limitToSurroundingText__firstQuotationMarkCharacterSet, 4, v10, v9) != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v7 length];
      if (objc_msgSend(v7, "rangeOfCharacterFromSet:options:range:", isRangeInsideQuotationMarks_text_limitToSurroundingText__lastQuotationMarkCharacterSet, 0) != 0x7FFFFFFFFFFFFFFFLL)BOOL v11 = 1; {
    }
      }
  }

  return v11;
}

uint64_t __74__IPRegexToolbox_isRangeInsideQuotationMarks_text_limitToSurroundingText___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\"‘«“„﹃﹁『"];
  v1 = (void *)isRangeInsideQuotationMarks_text_limitToSurroundingText__firstQuotationMarkCharacterSet;
  isRangeInsideQuotationMarks_text_limitToSurroundingText__firstQuotationMarkCharacterSet = v0;

  isRangeInsideQuotationMarks_text_limitToSurroundingText__lastQuotationMarkCharacterSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\"‘»”﹄﹂』"];
  return MEMORY[0x270F9A758]();
}

+ (id)emailSubjectPrefixRegex
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__IPRegexToolbox_emailSubjectPrefixRegex__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (emailSubjectPrefixRegex__pasOnceToken6 != -1) {
    dispatch_once(&emailSubjectPrefixRegex__pasOnceToken6, block);
  }
  v2 = [(id)emailSubjectPrefixRegex__pasExprOnceResult result];
  return v2;
}

void __41__IPRegexToolbox_emailSubjectPrefixRegex__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A632550]();
  id v3 = objc_alloc(MEMORY[0x263F61E60]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__IPRegexToolbox_emailSubjectPrefixRegex__block_invoke_2;
  v6[3] = &__block_descriptor_40_e26___NSRegularExpression_8__0l;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = [v3 initWithBlock:v6];
  BOOL v5 = (void *)emailSubjectPrefixRegex__pasExprOnceResult;
  emailSubjectPrefixRegex__pasExprOnceResult = v4;
}

id __41__IPRegexToolbox_emailSubjectPrefixRegex__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__IPRegexToolbox_emailSubjectPrefixRegex__block_invoke_3;
  v3[3] = &__block_descriptor_40_e26___NSRegularExpression_8__0l;
  v3[4] = *(void *)(a1 + 32);
  v1 = +[IPRegexToolbox regularExpressionWithKey:@"subjectAbbreviationRegex" generator:v3];
  return v1;
}

id __41__IPRegexToolbox_emailSubjectPrefixRegex__block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) regexPatternWithPrefix:@"^((" suffix:@") ?[：:])+" choices:&unk_26D8CDAF8];
  v2 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v1 options:0 error:0];

  return v2;
}

+ (id)regularExpressionWithKey:(id)a3 generator:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = (void *)MEMORY[0x22A632550]();
  BOOL v8 = v6[2](v6);

  return v8;
}

+ (void)regexPatternByUncapturingPattern:.cold.1()
{
}

+ (void)regexPatternByUncapturingPattern:.cold.2()
{
}

+ (void)regexPatternWithPrefix:suffix:choices:.cold.1()
{
}

+ (void)regexPatternWithPrefix:suffix:choices:.cold.2()
{
  __assert_rtn("+[IPRegexToolbox regexPatternWithPrefix:suffix:choices:]", "IPRegexToolbox.m", 136, "shortCircuitOutputCursor == patternLength");
}

+ (void)regexPatternWithPrefix:suffix:choices:.cold.3()
{
}

+ (void)regexPatternWithPrefix:suffix:choices:.cold.4()
{
  __assert_rtn("+[IPRegexToolbox regexPatternWithPrefix:suffix:choices:]", "IPRegexToolbox.m", 198, "cursor == patternLength");
}

@end