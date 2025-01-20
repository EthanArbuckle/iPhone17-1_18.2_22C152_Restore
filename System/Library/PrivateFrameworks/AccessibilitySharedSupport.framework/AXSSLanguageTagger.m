@interface AXSSLanguageTagger
+ ($1230CF39250A084FEEB876D19862D23B)_createLanguageHintWithHighProbInDefault:(id)a3;
+ ($1230CF39250A084FEEB876D19862D23B)_createLanguageHintsEvenlyDistributedWithProbability:(float)a3 excludingHints:(id)a4;
+ ($1230CF39250A084FEEB876D19862D23B)_createLanguageHintsForContent:(id)a3;
+ ($1230CF39250A084FEEB876D19862D23B)_createLanguageHintsForContent:(id)a3 probInSystemLanguage:(float)a4;
+ (BOOL)_isNewline:(id)a3;
+ (BOOL)isSupportedLanguage:(id)a3;
+ (_NSRange)_extendRange:(_NSRange)a3 forContent:(id)a4 withRange:(_NSRange)a5;
+ (_NSRange)_manuallyProcessContent:(id)a3 tokenRange:(_NSRange)a4 currentRange:(_NSRange)a5;
+ (float)_systemLanguageProbabilityForContent:(id)a3;
+ (id)_allLangIDs;
+ (id)_createTagForContent:(id)a3 tokenRange:(_NSRange)a4 document:(id)a5 createdFromNewline:(BOOL)a6;
+ (id)_dialectWithHighestProbability:(id *)a3;
+ (id)_languageTagForDateIfNecessary:(id)a3;
+ (id)_overrideLanguageDetection:(id)a3;
+ (id)_secondaryDialects:(id *)a3;
+ (id)combineLanguageProbability:(id *)a3 primaryLanguageID:(int)a4 secondaryLanguageID:(int)a5 dialectMap:(id)a6;
+ (id)langCodeForlangId:(int)a3;
+ (id)languageTagsForContent:(id)a3;
+ (id)markupLanguageTagForAttributedString:(id)a3;
+ (id)primaryLanguageForContent:(id)a3;
+ (id)primaryLanguageForContent:(id)a3 hints:(id *)a4;
+ (id)primaryLanguageWithHigherProbInDefaultLanguage:(id)a3;
+ (id)systemLocale;
+ (int)langIDforLangCode:(id)a3;
+ (void)_hypothesesForContent:(id)a3 withHints:(id *)a4 guesses:(id *)a5;
+ (void)_languageTaggerForContent:(id)a3;
+ (void)_scriptTaggerForContent:(id)a3;
+ (void)_tagRange:(_NSRange)a3 document:(id)a4 tags:(id)a5 createdFromNewline:(BOOL)a6;
+ (void)_taggerForContent:(id)a3 tagScheme:(id)a4;
+ (void)_tokenTaggerForContent:(id)a3;
+ (void)initialize;
+ (void)setSystemLocale:(id)a3;
@end

@implementation AXSSLanguageTagger

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _nlLanguageIdentifier = NLLanguageIdentifierCreate();
    _nlLanguageIdentifierLock = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);
    MEMORY[0x1F41817F8]();
  }
}

+ (id)systemLocale
{
  v2 = (void *)_systemLocale;
  if (!_systemLocale)
  {
    v3 = objc_alloc_init(AXSSSystemLocale);
    v4 = (void *)_systemLocale;
    _systemLocale = (uint64_t)v3;

    v2 = (void *)_systemLocale;
  }

  return v2;
}

+ (id)languageTagsForContent:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  uint64_t v6 = [a1 _scriptTaggerForContent:v4];
  id v7 = 0;
  if ([v4 length] && v6)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3010000000;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    v21 = &unk_1B3BF0419;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__6;
    v16[4] = __Block_byref_object_dispose__6;
    id v17 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    char v15 = 0;
    [v4 length];
    id v8 = v4;
    v13 = v8;
    id v9 = v5;
    NLTaggerEnumerateTokens();
    uint64_t v10 = v19[4];
    uint64_t v11 = v19[5];
    if (v11 + v10 == [v8 length]) {
      objc_msgSend(a1, "_tagRange:document:tags:createdFromNewline:", v19[4], v19[5], v8, v9, 1);
    }
    id v7 = v9;

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);

    _Block_object_dispose(&v18, 8);
  }

  return v7;
}

void __45__AXSSLanguageTagger_languageTagsForContent___block_invoke(uint64_t a1, NSUInteger *a2)
{
  NSUInteger v4 = *a2;
  NSUInteger v3 = a2[1];
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *a2, v3);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)NLTaggerCopyTagForCurrentToken();
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void *)(v6 + 40);
  id v7 = (id *)(v6 + 40);
  if (!v8) {
    objc_storeStrong(v7, v5);
  }
  uint64_t v9 = [*(id *)(a1 + 80) _isNewline:v16];
  if (v5)
  {
    uint64_t v10 = v9;
    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToString:v5])
    {
      v18.location = v4;
      v18.length = v3;
      *(NSRange *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = NSUnionRange(*(NSRange *)(*(void *)(*(void *)(a1 + 56)+ 8)+ 32), v18);
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 80), "_tagRange:document:tags:createdFromNewline:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(void *)(a1 + 32), *(void *)(a1 + 40), 1);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
    }
    else
    {
      if (v10)
      {
        v19.location = v4;
        v19.length = v3;
        *(NSRange *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = NSUnionRange(*(NSRange *)(*(void *)(*(void *)(a1 + 56)+ 8)+ 32), v19);
      }
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v15 = *(void *)(v14 + 40);
      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 80), "_tagRange:document:tags:createdFromNewline:", *(void *)(v14 + 32), v15, *(void *)(a1 + 32), *(void *)(a1 + 40), v10);
        uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      }
      *(void *)(v14 + 32) = v4;
      *(void *)(v14 + 40) = v3;
    }
    if ([v5 length]) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 80), "_manuallyProcessContent:tokenRange:currentRange:", *(void *)(a1 + 32), v4, v3, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    *(void *)(v12 + 32) = v11;
    *(void *)(v12 + 40) = v13;
  }
}

+ (id)primaryLanguageForContent:(id)a3 hints:(id *)a4
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 length])
  {
    memset(v15, 0, 24);
    [a1 _hypothesesForContent:v6 withHints:a4 guesses:v15];
    id v7 = +[AXSSLanguageManager shared];
    uint64_t v8 = [v7 dialectForSystemLanguage];

    LODWORD(v9) = HIDWORD(v15[0]);
    if (*((float *)v15 + 1) <= 0.8)
    {
      uint64_t v10 = objc_msgSend(a1, "combineLanguageProbability:primaryLanguageID:secondaryLanguageID:dialectMap:", v15, 4, 5, v8, v9);

      uint64_t v12 = [a1 combineLanguageProbability:v15 primaryLanguageID:2 secondaryLanguageID:34 dialectMap:v10];
    }
    else
    {
      uint64_t v10 = +[AXSSLanguageManager shared];
      uint64_t v11 = [a1 langCodeForlangId:LODWORD(v15[0])];
      uint64_t v12 = [v10 dialectForLanguageID:v11];
    }
    uint64_t v13 = [v12 specificLanguageID];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)combineLanguageProbability:(id *)a3 primaryLanguageID:(int)a4 secondaryLanguageID:(int)a5 dialectMap:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  uint64_t v11 = v10;
  BOOL v12 = a3->var0 == v7 || a3->var0 == a5;
  uint64_t v13 = v10;
  if (v12)
  {
    int var0 = a3[1].var0;
    BOOL v15 = var0 == v7 || var0 == a5;
    uint64_t v13 = v10;
    if (v15)
    {
      id v16 = +[AXSSLanguageManager shared];
      id v17 = [a1 langCodeForlangId:v7];
      uint64_t v13 = [v16 dialectForLanguageID:v17];
    }
  }

  return v13;
}

+ (id)primaryLanguageForContent:(id)a3
{
  id v4 = a3;
  v5 = (void *)[a1 _createLanguageHintsForContent:v4];
  id v6 = [a1 primaryLanguageForContent:v4 hints:v5];

  if (v5) {
    free(v5);
  }

  return v6;
}

+ (id)primaryLanguageWithHigherProbInDefaultLanguage:(id)a3
{
  id v4 = a3;
  v5 = (void *)[a1 _createLanguageHintWithHighProbInDefault:v4];
  id v6 = [a1 primaryLanguageForContent:v4 hints:v5];

  if (v5) {
    free(v5);
  }

  return v6;
}

+ (id)markupLanguageTagForAttributedString:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v4];
  id v6 = [v4 string];
  uint64_t v7 = [a1 languageTagsForContent:v6];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "dialect", (void)v20);
        BOOL v15 = [v14 specificLanguageID];

        if (v15)
        {
          uint64_t v16 = [v13 taggedRange];
          objc_msgSend(v5, "addAttribute:value:range:", @"AXLanguage", v15, v16, v17);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  NSRange v18 = (void *)[v5 copy];

  return v18;
}

+ (void)_scriptTaggerForContent:(id)a3
{
  return (void *)[a1 _taggerForContent:a3 tagScheme:*MEMORY[0x1E4F5C918]];
}

+ (void)_languageTaggerForContent:(id)a3
{
  return (void *)[a1 _taggerForContent:a3 tagScheme:*MEMORY[0x1E4F5C8F8]];
}

+ (void)_tokenTaggerForContent:(id)a3
{
  return (void *)[a1 _taggerForContent:a3 tagScheme:*MEMORY[0x1E4F5C920]];
}

+ (void)_taggerForContent:(id)a3 tagScheme:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v10[0] = a4;
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = a3;
  [v5 arrayWithObjects:v10 count:1];

  id v8 = (const void *)NLTaggerCreate();
  NLTaggerSetString();

  return (void *)CFAutorelease(v8);
}

+ (void)_tagRange:(_NSRange)a3 document:(id)a4 tags:(id)a5 createdFromNewline:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v14 = a5;
  id v11 = a4;
  BOOL v12 = objc_msgSend(v11, "substringWithRange:", location, length);
  uint64_t v13 = objc_msgSend(a1, "_createTagForContent:tokenRange:document:createdFromNewline:", v12, location, length, v11, v6);

  if (v13) {
    [v14 addObject:v13];
  }
}

+ (id)_createTagForContent:(id)a3 tokenRange:(_NSRange)a4 document:(id)a5 createdFromNewline:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v25[3] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  BOOL v12 = (void *)MEMORY[0x1E4F28B88];
  id v13 = a3;
  id v14 = [v12 newlineCharacterSet];
  BOOL v15 = [v13 stringByTrimmingCharactersInSet:v14];

  uint64_t v16 = objc_msgSend(v11, "substringWithRange:", location, length);
  uint64_t v17 = [a1 _languageTagForDateIfNecessary:v16];

  if (v17)
  {
    NSRange v18 = -[AXSSLanguageTag initWithDialect:range:content:createdFromNewline:]([AXSSLanguageTag alloc], "initWithDialect:range:content:createdFromNewline:", v17, location, length, v11, v6);
  }
  else
  {
    NSRange v19 = (void *)[a1 _createLanguageHintsForContent:v15];
    memset(v25, 0, 24);
    [a1 _hypothesesForContent:v15 withHints:v19 guesses:v25];
    long long v20 = [a1 _dialectWithHighestProbability:v25];
    long long v21 = [a1 combineLanguageProbability:v25 primaryLanguageID:2 secondaryLanguageID:34 dialectMap:v20];

    if (!v21)
    {
      long long v22 = +[AXSSLanguageManager shared];
      long long v21 = [v22 dialectForSystemLanguage];
    }
    NSRange v18 = -[AXSSLanguageTag initWithDialect:range:content:createdFromNewline:]([AXSSLanguageTag alloc], "initWithDialect:range:content:createdFromNewline:", v21, location, length, v11, v6);
    long long v23 = [a1 _secondaryDialects:v25];
    [(AXSSLanguageTag *)v18 setPredictedSecondaryDialects:v23];

    if (v19) {
      free(v19);
    }
  }

  return v18;
}

+ (id)_languageTagForDateIfNecessary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:8 error:0];
  uint64_t v5 = [v3 length];
  id v7 = 0;
  if (objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 0, 0, v5)) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6 == v5;
  }
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v11 = +[AXSSLanguageManager shared];
    BOOL v12 = [v11 dialectForSystemLanguage];

    id v13 = (void *)MEMORY[0x1E4F1CA20];
    id v14 = [v12 specificLanguageID];
    BOOL v15 = [v13 localeWithLocaleIdentifier:v14];
    [v10 setLocale:v15];

    uint64_t v16 = [v10 shortMonthSymbols];
    [v9 addObjectsFromArray:v16];

    uint64_t v17 = [v10 shortWeekdaySymbols];
    [v9 addObjectsFromArray:v17];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v18 = v9;
    id v7 = (id)[v18 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v19 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v18);
          }
          if (objc_msgSend(v3, "containsString:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22))
          {
            id v7 = v12;
            goto LABEL_16;
          }
        }
        id v7 = (id)[v18 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }

  return v7;
}

+ ($1230CF39250A084FEEB876D19862D23B)_createLanguageHintsForContent:(id)a3
{
  id v4 = a3;
  [a1 _systemLanguageProbabilityForContent:v4];
  uint64_t v5 = ($1230CF39250A084FEEB876D19862D23B *)objc_msgSend(a1, "_createLanguageHintsForContent:probInSystemLanguage:", v4);

  return v5;
}

+ ($1230CF39250A084FEEB876D19862D23B)_createLanguageHintWithHighProbInDefault:(id)a3
{
  LODWORD(v3) = 1063675494;
  return ($1230CF39250A084FEEB876D19862D23B *)[a1 _createLanguageHintsForContent:a3 probInSystemLanguage:v3];
}

+ ($1230CF39250A084FEEB876D19862D23B)_createLanguageHintsForContent:(id)a3 probInSystemLanguage:(float)a4
{
  uint64_t v6 = objc_msgSend(a1, "systemLocale", a3);
  id v7 = [v6 preferredLanguages];

  unint64_t v8 = [v7 count];
  if (v8 >= 3) {
    unint64_t v9 = 3;
  }
  else {
    unint64_t v9 = v8;
  }
  id v10 = objc_opt_new();
  if (v9)
  {
    uint64_t v12 = 0;
    float v13 = (float)((v9 + v9 * v9) >> 1);
    do
    {
      *(float *)&double v11 = (float)((float)v9 * a4) / v13;
      id v14 = [NSNumber numberWithFloat:v11];
      BOOL v15 = NSNumber;
      uint64_t v16 = [v7 objectAtIndexedSubscript:v12];
      uint64_t v17 = objc_msgSend(v15, "numberWithUnsignedInt:", objc_msgSend(a1, "langIDforLangCode:", v16));
      [v10 setObject:v14 forKeyedSubscript:v17];

      ++v12;
      --v9;
    }
    while (v9);
  }
  *(float *)&double v11 = 1.0 - a4;
  id v18 = ($1230CF39250A084FEEB876D19862D23B *)[a1 _createLanguageHintsEvenlyDistributedWithProbability:v10 excludingHints:v11];

  return v18;
}

+ (float)_systemLanguageProbabilityForContent:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  [a1 _tokenTaggerForContent:v4];
  [v4 length];
  NLTaggerEnumerateTokens();
  uint64_t v5 = v10[3];
  if (v5 > 39) {
    double v6 = 0.600000024;
  }
  else {
    double v6 = (float)((float)((float)v5 / -100.0) + 1.0);
  }
  if (v6 > 0.95) {
    double v6 = 0.95;
  }
  float v7 = v6;
  _Block_object_dispose(&v9, 8);

  return v7;
}

uint64_t __59__AXSSLanguageTagger__systemLanguageProbabilityForContent___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = NLTaggerCopyTagForCurrentToken();
  if (result == *MEMORY[0x1E4F5C750] && (uint64_t)++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 41) {
    *a3 = 1;
  }
  return result;
}

+ (void)_hypothesesForContent:(id)a3 withHints:(id *)a4 guesses:(id *)a5
{
  double v6 = (void *)_nlLanguageIdentifierLock;
  id v7 = a3;
  [v6 lock];
  NLLanguageIdentifierReset();
  [v7 length];
  NLLanguageIdentifierConsumeString();

  unint64_t v8 = [a1 _allLangIDs];
  [v8 count];
  NLLanguageIdentifierSetLanguageHints();

  NLLanguageIdentifierGetTopHypotheses();
  uint64_t v9 = (void *)_nlLanguageIdentifierLock;

  [v9 unlock];
}

+ (id)_dialectWithHighestProbability:(id *)a3
{
  double v3 = [a1 langCodeForlangId:a3->var0];
  if (v3)
  {
    id v4 = +[AXSSLanguageManager shared];
    uint64_t v5 = [v4 dialectForLanguageID:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)_secondaryDialects:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  for (uint64_t i = 1; i != 3; ++i)
  {
    if (a3[i].var0 < 2u) {
      break;
    }
    if (a3[i].var1 > 0.2)
    {
      id v7 = objc_msgSend(a1, "langCodeForlangId:");
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      unint64_t v8 = objc_msgSend(a1, "systemLocale", 0);
      uint64_t v9 = [v8 preferredLanguages];

      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        while (2)
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            if ([*(id *)(*((void *)&v17 + 1) + 8 * j) hasPrefix:v7])
            {
              id v14 = +[AXSSLanguageManager shared];
              BOOL v15 = [v14 dialectForLanguageID:v7];

              if (v15) {
                [v5 addObject:v15];
              }

              goto LABEL_16;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
  }

  return v5;
}

+ (id)_overrideLanguageDetection:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSSLanguageManager shared];
  uint64_t v5 = [v4 dialectForSystemLanguage];
  double v6 = [v5 specificLanguageID];

  if ([v3 hasPrefix:@"zh"]
    && ([v6 hasPrefix:@"ja"] & 1) != 0
    || [v3 hasPrefix:@"ja"]
    && [v6 hasPrefix:@"zh"])
  {
    id v7 = +[AXSSLanguageManager shared];
    unint64_t v8 = [v7 dialectForSystemLanguage];
    uint64_t v9 = [v8 specificLanguageID];
  }
  else
  {
    if (([v6 hasPrefix:@"zh"] & 1) == 0
      && ([v6 hasPrefix:@"ja"] & 1) == 0
      && ![v6 hasPrefix:@"ko"])
    {
      goto LABEL_12;
    }
    uint64_t v10 = +[AXSSLanguageManager shared];
    uint64_t v11 = [v10 dialectForSystemLanguage];
    uint64_t v12 = [v11 languageMap];
    float v13 = [v12 generalLanguageID];
    char v14 = [v3 hasPrefix:v13];

    if (v14) {
      goto LABEL_12;
    }
    BOOL v15 = +[AXSSLanguageManager shared];
    uint64_t v16 = [v15 dialectForLanguageID:v3];
    long long v17 = [v16 languageMap];
    int v18 = [v17 isWestern];

    if (v18) {
      id v19 = v6;
    }
    else {
LABEL_12:
    }
      id v19 = v3;
    uint64_t v9 = v19;
  }

  return v9;
}

+ (_NSRange)_manuallyProcessContent:(id)a3 tokenRange:(_NSRange)a4 currentRange:(_NSRange)a5
{
  NSUInteger v5 = objc_msgSend(a1, "_extendRange:forContent:withRange:", a5.location, a5.length, a3, a4.location, a4.length);
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

+ (_NSRange)_extendRange:(_NSRange)a3 forContent:(id)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a3.length;
  NSUInteger v8 = a3.location;
  id v9 = a4;
  uint64_t v10 = +[AXSSLanguageManager shared];
  if (length)
  {
    NSUInteger v11 = length;
    do
    {
      uint64_t v12 = [v9 rangeOfComposedCharacterSequenceAtIndex:location];
      char v14 = objc_msgSend(v9, "substringWithRange:", v12, v13);
      uint64_t v15 = [v14 characterAtIndex:0];
      if ([v14 length] == 1) {
        [v10 isCharacterCommon:v15];
      }

      ++location;
      --v11;
    }
    while (v11);
    v7 += length;
  }

  NSUInteger v16 = v8;
  NSUInteger v17 = v7;
  result.NSUInteger length = v17;
  result.NSUInteger location = v16;
  return result;
}

+ (BOOL)_isNewline:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 1)
  {
    id v4 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    char v5 = objc_msgSend(v4, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", 0));
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ ($1230CF39250A084FEEB876D19862D23B)_createLanguageHintsEvenlyDistributedWithProbability:(float)a3 excludingHints:(id)a4
{
  id v6 = a4;
  NSUInteger v7 = [a1 _allLangIDs];
  NSUInteger v8 = ($1230CF39250A084FEEB876D19862D23B *)malloc_type_malloc(8 * [v7 count], 0x100004000313F17uLL);
  uint64_t v9 = [v7 count];
  uint64_t v10 = [v6 count];
  float v11 = 0.0;
  if (v9 != v10) {
    float v11 = a3 / (float)(unint64_t)(v9 - v10);
  }
  if ([v7 count])
  {
    unint64_t v12 = 0;
    p_var1 = &v8->var1;
    do
    {
      char v14 = [v7 objectAtIndexedSubscript:v12];
      *((_DWORD *)p_var1 - 1) = [v14 intValue];

      uint64_t v15 = [v7 objectAtIndexedSubscript:v12];
      NSUInteger v16 = [v6 objectForKey:v15];

      if (v16)
      {
        NSUInteger v17 = [v7 objectAtIndexedSubscript:v12];
        int v18 = [v6 objectForKey:v17];
        [v18 floatValue];
        *(_DWORD *)p_var1 = v19;
      }
      else
      {
        float *p_var1 = v11;
      }
      ++v12;
      p_var1 += 2;
    }
    while (v12 < [v7 count]);
  }

  return v8;
}

+ (id)_allLangIDs
{
  return &unk_1F0C670E0;
}

+ (id)langCodeForlangId:(int)a3
{
  if ((a3 - 2) > 0x38) {
    return @"und";
  }
  else {
    return off_1E606D820[a3 - 2];
  }
}

+ (int)langIDforLangCode:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"ar"])
  {
    int v4 = 2;
  }
  else if ([v3 hasPrefix:@"bg"])
  {
    int v4 = 3;
  }
  else if ([v3 hasPrefix:@"zh-Hans"])
  {
    int v4 = 4;
  }
  else if ([v3 hasPrefix:@"zh-Hant"])
  {
    int v4 = 5;
  }
  else if ([v3 hasPrefix:@"zh-Hant-HK"])
  {
    int v4 = 54;
  }
  else if ([v3 hasPrefix:@"hr"])
  {
    int v4 = 6;
  }
  else if ([v3 hasPrefix:@"cs"])
  {
    int v4 = 7;
  }
  else if ([v3 hasPrefix:@"da"])
  {
    int v4 = 8;
  }
  else if ([v3 hasPrefix:@"nl"])
  {
    int v4 = 9;
  }
  else if ([v3 hasPrefix:@"en"])
  {
    int v4 = 10;
  }
  else if ([v3 hasPrefix:@"fi"])
  {
    int v4 = 11;
  }
  else if ([v3 hasPrefix:@"fr"])
  {
    int v4 = 12;
  }
  else if ([v3 hasPrefix:@"de"])
  {
    int v4 = 13;
  }
  else if ([v3 hasPrefix:@"el"])
  {
    int v4 = 14;
  }
  else if ([v3 hasPrefix:@"he"])
  {
    int v4 = 15;
  }
  else if ([v3 hasPrefix:@"hi"])
  {
    int v4 = 16;
  }
  else if ([v3 hasPrefix:@"hu"])
  {
    int v4 = 17;
  }
  else if ([v3 hasPrefix:@"is"])
  {
    int v4 = 18;
  }
  else if ([v3 hasPrefix:@"it"])
  {
    int v4 = 19;
  }
  else if ([v3 hasPrefix:@"ja"])
  {
    int v4 = 20;
  }
  else if ([v3 hasPrefix:@"ko"])
  {
    int v4 = 21;
  }
  else if ([v3 hasPrefix:@"mr"])
  {
    int v4 = 22;
  }
  else if ([v3 hasPrefix:@"nb"])
  {
    int v4 = 23;
  }
  else if ([v3 hasPrefix:@"pl"])
  {
    int v4 = 24;
  }
  else if ([v3 hasPrefix:@"pt"])
  {
    int v4 = 25;
  }
  else if ([v3 hasPrefix:@"ro"])
  {
    int v4 = 26;
  }
  else if ([v3 hasPrefix:@"ru"])
  {
    int v4 = 27;
  }
  else if ([v3 hasPrefix:@"sk"])
  {
    int v4 = 28;
  }
  else if ([v3 hasPrefix:@"es"])
  {
    int v4 = 29;
  }
  else if ([v3 hasPrefix:@"sv"])
  {
    int v4 = 30;
  }
  else if ([v3 hasPrefix:@"th"])
  {
    int v4 = 31;
  }
  else if ([v3 hasPrefix:@"tr"])
  {
    int v4 = 32;
  }
  else if ([v3 hasPrefix:@"uk"])
  {
    int v4 = 33;
  }
  else if ([v3 hasPrefix:@"ur"])
  {
    int v4 = 34;
  }
  else if ([v3 hasPrefix:@"hy"])
  {
    int v4 = 35;
  }
  else if ([v3 hasPrefix:@"bn"])
  {
    int v4 = 36;
  }
  else if ([v3 hasPrefix:@"pa"])
  {
    int v4 = 37;
  }
  else if ([v3 hasPrefix:@"gu"])
  {
    int v4 = 38;
  }
  else if ([v3 hasPrefix:@"or"])
  {
    int v4 = 39;
  }
  else if ([v3 hasPrefix:@"ta"])
  {
    int v4 = 40;
  }
  else if ([v3 hasPrefix:@"te"])
  {
    int v4 = 41;
  }
  else if ([v3 hasPrefix:@"kn"])
  {
    int v4 = 42;
  }
  else if ([v3 hasPrefix:@"ml"])
  {
    int v4 = 43;
  }
  else if ([v3 hasPrefix:@"si"])
  {
    int v4 = 44;
  }
  else if ([v3 hasPrefix:@"lo"])
  {
    int v4 = 45;
  }
  else if ([v3 hasPrefix:@"bo"])
  {
    int v4 = 46;
  }
  else if ([v3 hasPrefix:@"my"])
  {
    int v4 = 47;
  }
  else if ([v3 hasPrefix:@"ka"])
  {
    int v4 = 48;
  }
  else if ([v3 hasPrefix:@"am"])
  {
    int v4 = 49;
  }
  else if ([v3 hasPrefix:@"chr"])
  {
    int v4 = 50;
  }
  else if ([v3 hasPrefix:@"iu"])
  {
    int v4 = 51;
  }
  else if ([v3 hasPrefix:@"km"])
  {
    int v4 = 52;
  }
  else if ([v3 hasPrefix:@"mn"])
  {
    int v4 = 53;
  }
  else if ([v3 hasPrefix:@"vi"])
  {
    int v4 = 55;
  }
  else if ([v3 hasPrefix:@"fa"])
  {
    int v4 = 56;
  }
  else if ([v3 hasPrefix:@"id"])
  {
    int v4 = 57;
  }
  else if ([v3 hasPrefix:@"kk"])
  {
    int v4 = 58;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

+ (BOOL)isSupportedLanguage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[AXSSLanguageTagger langIDforLangCode:v4];
  id v6 = [a1 _allLangIDs];
  NSUInteger v7 = [NSNumber numberWithUnsignedInteger:v5];
  char v8 = [v6 containsObject:v7];

  if (v8) {
    char v9 = 1;
  }
  else {
    char v9 = [v4 hasPrefix:@"zh"];
  }

  return v9;
}

+ (void)setSystemLocale:(id)a3
{
}

@end