@interface IPFeatureSentence
+ (_NSRange)_rangeExcludingLeadingAndTrailingCharacters:(id)a3 inRange:(_NSRange)a4 ofString:(id)a5;
+ (id)_substringWithRange:(_NSRange)a3 ofString:(id)a4 removingCharactersFromSet:(id)a5;
+ (id)bestLanguageIDFromText:(id)a3;
+ (id)bestLanguageIDFromText:(id)a3 linesElided:(unint64_t)a4;
+ (id)buildRegexForType:(id)a3 languageID:(id)a4;
+ (id)eventVocabularyIgnoreDateKeywordInString:(id)a3 languageID:(id)a4;
+ (id)eventVocabularyIgnoreDateRegexForLanguageID:(id)a3;
+ (id)eventVocabularyPositiveRegexForLanguageID:(id)a3;
+ (id)eventVocabularyRegexForType:(id)a3 languageID:(id)a4;
+ (id)eventVocabularyRejectionKeywordInString:(id)a3 languageID:(id)a4;
+ (id)eventVocabularyRejectionRegexForLanguageID:(id)a3;
+ (id)eventVocabularySubjectTitleInString:(id)a3 languageID:(id)a4;
+ (id)eventVocabularySubjectTitleRegexForLanguageID:(id)a3;
+ (id)humanReadableFeaturePolarity:(unint64_t)a3;
+ (id)regexArrayForType:(id)a3 languageID:(id)a4;
+ (unint64_t)numberOfMatchesForEventVocabularySubjectTitleInString:(id)a3 languageID:(id)a4;
- (BOOL)isQuoteAttributionLine;
- (IPFeatureSentence)initWithLanguageID:(id)a3 responseKitSentence:(id)a4;
- (NSArray)fragments;
- (NSString)eventVocabularyIgnoreDateKeyword;
- (NSString)eventVocabularyRejectionKeyword;
- (NSString)languageID;
- (NSString)storedEventVocabularyIgnoreDateKeyword;
- (NSString)storedEventVocabularyRejectionKeyword;
- (RKText)responseKitSentence;
- (id)description;
- (id)descriptionForFragment:(id)a3;
- (id)descriptionForFragmentAtIndex:(unint64_t)a3;
- (unint64_t)clusterType;
- (unint64_t)polarity;
- (unint64_t)polarityForRange:(_NSRange)a3;
- (unint64_t)polarityForRange:(_NSRange)a3 confidence:(double *)a4;
- (unint64_t)storedPolarity;
- (void)addFragment:(id)a3;
- (void)checkEventVocabularyKeywordsIfNeeded;
- (void)setFragments:(id)a3;
- (void)setLanguageID:(id)a3;
- (void)setResponseKitSentence:(id)a3;
- (void)setStoredEventVocabularyIgnoreDateKeyword:(id)a3;
- (void)setStoredEventVocabularyRejectionKeyword:(id)a3;
- (void)setStoredPolarity:(unint64_t)a3;
@end

@implementation IPFeatureSentence

+ (id)buildRegexForType:(id)a3 languageID:(id)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:400];
  v9 = [a1 regexArrayForType:v6 languageID:@"common"];
  [v8 addObjectsFromArray:v9];

  v10 = [a1 regexArrayForType:v6 languageID:v7];
  [v8 addObjectsFromArray:v10];

  v11 = [MEMORY[0x263EFF960] currentLocale];
  id v12 = [v11 objectForKey:*MEMORY[0x263EFF508]];

  if (v12 != v7)
  {
    v13 = [a1 regexArrayForType:v6 languageID:v12];
    [v8 addObjectsFromArray:v13];
  }
  if (([v7 hasPrefix:@"zh"] & 1) != 0
    || [v12 hasPrefix:@"zh"])
  {
    v14 = [a1 regexArrayForType:v6 languageID:@"zh-Hans"];
    [v8 addObjectsFromArray:v14];

    v15 = [a1 regexArrayForType:v6 languageID:@"zh-Hant-TW"];
    [v8 addObjectsFromArray:v15];

    v16 = [a1 regexArrayForType:v6 languageID:@"zh-Hant-HK"];
    [v8 addObjectsFromArray:v16];
  }
  v17 = (void *)MEMORY[0x22A632550]();
  v18 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"self" ascending:1];
  v28[0] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
  v20 = [v8 sortedArrayUsingDescriptors:v19];

  v21 = +[IPRegexToolbox regexPatternForLanguageID:v7 eventVocabularyArray:v20];
  v22 = (void *)MEMORY[0x22A632550]();
  id v27 = 0;
  v23 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v21 options:64 error:&v27];
  id v24 = v27;
  if (v24)
  {
    NSLog(&cfstr_CanTBuildRegex.isa, v6, v7, v24);
    id v25 = 0;
  }
  else
  {
    id v25 = v23;
  }

  return v25;
}

+ (id)bestLanguageIDFromText:(id)a3
{
  return (id)[a1 bestLanguageIDFromText:a3 linesElided:0];
}

id __60__IPFeatureSentence_eventVocabularyRegexForType_languageID___block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x263F61E70]);
  v1 = (void *)[objc_alloc(MEMORY[0x263F61E50]) initWithCountLimit:50];
  v2 = (void *)[v0 initWithGuardedData:v1];

  return v2;
}

+ (id)eventVocabularyRejectionKeywordInString:(id)a3 languageID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    if (!v7)
    {
      id v7 = [a1 bestLanguageIDFromText:v6];
    }
    v8 = [a1 eventVocabularyRejectionRegexForLanguageID:v7];
    v9 = +[IPRegexToolbox firstMatchingKeywordForRegex:v8 inString:v6 needsToLowercase:1];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)regexArrayForType:(id)a3 languageID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x22A632550]();
  v8 = [NSString stringWithFormat:@"Patterns-%@-%@", v5, v6];
  v9 = +[X objectForKeyedSubscript:v8];

  return v9;
}

- (IPFeatureSentence)initWithLanguageID:(id)a3 responseKitSentence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IPFeatureSentence;
  v8 = [(IPFeatureSentence *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(IPFeatureSentence *)v8 setLanguageID:v6];
    [(IPFeatureSentence *)v9 setResponseKitSentence:v7];
    [(IPFeatureSentence *)v9 setStoredPolarity:0];
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IPFeatureSentence;
  v4 = [(IPFeature *)&v9 description];
  id v5 = +[IPFeatureSentence humanReadableFeaturePolarity:[(IPFeatureSentence *)self storedPolarity]];
  id v6 = +[IPEventClassificationType humanReadableClusterType:[(IPFeatureSentence *)self clusterType]];
  id v7 = [v3 stringWithFormat:@"%@ Polarity:%@ Cluster:%@", v4, v5, v6];

  return v7;
}

- (void)addFragment:(id)a3
{
  id v7 = a3;
  if (!self->_fragments)
  {
    v4 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
    fragments = self->_fragments;
    self->_fragments = v4;
  }
  id v6 = [(IPFeatureSentence *)self fragments];
  [v6 addObject:v7];
}

- (unint64_t)clusterType
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F08760]) initWithCapacity:5];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v4 = [(IPFeatureSentence *)self fragments];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v29 + 1) + 8 * i) clusterType];
        if (v10)
        {
          uint64_t v11 = v10;
          id v12 = [NSNumber numberWithUnsignedInteger:v10];
          [v3 addObject:v12];

          v7 |= v11 == 6;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v3;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    unint64_t v16 = 0;
    unint64_t v17 = 0;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v13);
        }
        v20 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        uint64_t v21 = objc_msgSend(v20, "integerValue", (void)v25);
        unint64_t v22 = [v13 countForObject:v20];
        if (v21 != 6 && v22 > v16)
        {
          unint64_t v16 = v22;
          unint64_t v17 = v21;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v15);

    uint64_t v23 = 6;
    if ((v7 & 1) == 0) {
      uint64_t v23 = 0;
    }
    if (!v17) {
      unint64_t v17 = v23;
    }
  }
  else
  {

    if (v7) {
      unint64_t v17 = 6;
    }
    else {
      unint64_t v17 = 0;
    }
  }

  return v17;
}

- (unint64_t)polarityForRange:(_NSRange)a3
{
  return -[IPFeatureSentence polarityForRange:confidence:](self, "polarityForRange:confidence:", a3.location, a3.length, 0);
}

- (unint64_t)polarityForRange:(_NSRange)a3 confidence:(double *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v48 = *MEMORY[0x263EF8340];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  char v7 = [(IPFeatureSentence *)self fragments];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (!v8)
  {

    double v16 = 0.0;
LABEL_24:
    if (a4) {
      *a4 = v16;
    }
    return 1;
  }
  uint64_t v9 = v8;
  v39 = a4;
  BOOL v10 = 0;
  unint64_t v11 = 0;
  uint64_t v12 = *(void *)v42;
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  do
  {
    uint64_t v17 = 0;
    do
    {
      BOOL v18 = v10;
      if (*(void *)v42 != v12) {
        objc_enumerationMutation(v7);
      }
      v19 = *(void **)(*((void *)&v41 + 1) + 8 * v17);
      v50.NSUInteger location = [v19 range];
      v50.NSUInteger length = v20;
      v49.NSUInteger location = location;
      v49.NSUInteger length = length;
      NSRange v21 = NSIntersectionRange(v49, v50);
      BOOL v10 = v21.length != 0;
      if (v21.length)
      {
        objc_msgSend(v19, "probability_None");
        double v23 = v22;
        objc_msgSend(v19, "probability_Rejection");
        double v25 = v24;
        objc_msgSend(v19, "probability_Proposal");
        double v27 = v26;
        objc_msgSend(v19, "probability_Confirmation");
        double v29 = v28;
        if (IPDebuggingModeEnabled_once_1 != -1) {
          dispatch_once(&IPDebuggingModeEnabled_once_1, &__block_literal_global_279);
        }
        double v16 = v16 + v23;
        double v15 = v15 + v25;
        double v14 = v14 + v27;
        ++v11;
        double v13 = v13 + v29;
        if (IPDebuggingModeEnabled_sEnabled_1)
        {
          long long v30 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            long long v30 = _IPLogHandle;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            long long v31 = v30;
            long long v32 = [(IPFeatureSentence *)self descriptionForFragment:v19];
            *(_DWORD *)buf = 138412290;
            v46 = v32;
            _os_log_impl(&dword_225684000, v31, OS_LOG_TYPE_INFO, "FRAGMENT: %@ #Generic", buf, 0xCu);
          }
        }
      }
      else if (v18)
      {
        goto LABEL_17;
      }
      ++v17;
    }
    while (v9 != v17);
    uint64_t v9 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
  }
  while (v9);
LABEL_17:

  if (!v11)
  {
    a4 = v39;
    goto LABEL_24;
  }
  double v33 = (double)v11;
  double v34 = v15 / (double)v11;
  if (v34 > 0.35)
  {
    if (v39) {
      double *v39 = v34;
    }
    return 4;
  }
  double v36 = v14 / v33;
  double v37 = v13 / v33;
  double v38 = v13 / v33 + v14 / v33;
  a4 = v39;
  if (v38 < 0.66)
  {
    if (v36 > 0.54 && v36 > v37 && v36 > v34)
    {
      if (v39) {
        double *v39 = v36;
      }
      return 2;
    }
    double v16 = v16 / v33;
    if (v37 > 0.54 && v37 > v36 && v37 > v34)
    {
      if (v39) {
        double *v39 = v37;
      }
      return 3;
    }
    goto LABEL_24;
  }
  if (v39) {
    double *v39 = v38;
  }
  if (v37 <= v36) {
    return 2;
  }
  else {
    return 3;
  }
}

- (unint64_t)polarity
{
  if (![(IPFeatureSentence *)self storedPolarity])
  {
    double v5 = 0.0;
    [(IPFeature *)self matchRange];
    -[IPFeatureSentence setStoredPolarity:](self, "setStoredPolarity:", -[IPFeatureSentence polarityForRange:confidence:](self, "polarityForRange:confidence:", 0, v3, &v5));
    [(IPFeature *)self setConfidence:v5];
  }
  return [(IPFeatureSentence *)self storedPolarity];
}

- (NSString)eventVocabularyRejectionKeyword
{
  [(IPFeatureSentence *)self checkEventVocabularyKeywordsIfNeeded];
  return [(IPFeatureSentence *)self storedEventVocabularyRejectionKeyword];
}

- (NSString)eventVocabularyIgnoreDateKeyword
{
  if (!self->_hasCheckedEventVocabularyIgnoreDateKeyword)
  {
    uint64_t v3 = objc_opt_class();
    v4 = [(IPFeature *)self matchString];
    double v5 = [(IPFeatureSentence *)self languageID];
    uint64_t v6 = [v3 eventVocabularyIgnoreDateKeywordInString:v4 languageID:v5];
    [(IPFeatureSentence *)self setStoredEventVocabularyIgnoreDateKeyword:v6];

    self->_hasCheckedEventVocabularyIgnoreDateKeyword = 1;
  }
  return [(IPFeatureSentence *)self storedEventVocabularyIgnoreDateKeyword];
}

- (void)checkEventVocabularyKeywordsIfNeeded
{
  if (!self->_hasCheckedEventVocabularyKeyword)
  {
    self->_hasCheckedEventVocabularyKeyword = 1;
    uint64_t v3 = objc_opt_class();
    id v6 = [(IPFeature *)self matchString];
    v4 = [(IPFeatureSentence *)self languageID];
    double v5 = [v3 eventVocabularyRejectionKeywordInString:v6 languageID:v4];
    [(IPFeatureSentence *)self setStoredEventVocabularyRejectionKeyword:v5];
  }
}

- (BOOL)isQuoteAttributionLine
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x22A632550](self, a2);
  v4 = +[IPRegexToolbox regularExpressionWithKey:@"isQuoteAttributionLine" generator:&__block_literal_global_7];
  double v5 = [(IPFeature *)self matchString];
  if (objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v5, 2, 0, objc_msgSend(v5, "length")) != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_9;
  }
  if (IPLocalizedString_once_0 != -1) {
    dispatch_once(&IPLocalizedString_once_0, &__block_literal_global_285);
  }
  id v6 = [(id)IPLocalizedString_bundle_0 localizedStringForKey:@"Sent" value:&stru_26D895C60 table:@"DataDetectorsNaturalLanguage"];
  if ([v5 hasPrefix:v6])
  {

LABEL_9:
    BOOL v8 = 1;
    goto LABEL_10;
  }
  if (([v5 hasSuffix:@":\n"] & 1) != 0
    || [v5 hasSuffix:@":"])
  {
    char v7 = [v5 containsString:@"@"];

    if (v7) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (IPLocalizedString_once_0 != -1) {
    dispatch_once(&IPLocalizedString_once_0, &__block_literal_global_285);
  }
  BOOL v10 = [(id)IPLocalizedString_bundle_0 localizedStringForKey:@"Sent" value:&stru_26D895C60 table:@"DataDetectorsNaturalLanguage"];
  if ([v5 hasPrefix:v10])
  {
    id v11 = v10;
  }
  else
  {
    if (IPLocalizedString_once_0 != -1) {
      dispatch_once(&IPLocalizedString_once_0, &__block_literal_global_285);
    }
    uint64_t v12 = [(id)IPLocalizedString_bundle_0 localizedStringForKey:@"Subject" value:&stru_26D895C60 table:@"DataDetectorsNaturalLanguage"];
    if ([v5 hasPrefix:v12]) {
      id v11 = v12;
    }
    else {
      id v11 = 0;
    }
  }
  v19 = v10;
  if (v11
    && (long long v22 = 0u,
        long long v23 = 0u,
        long long v20 = 0u,
        long long v21 = 0u,
        (uint64_t v13 = [&unk_26D8D4A70 countByEnumeratingWithState:&v20 objects:v24 count:16]) != 0))
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    BOOL v18 = v3;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(&unk_26D8D4A70);
        }
        objc_msgSend(v5, "rangeOfString:options:range:", *(void *)(*((void *)&v20 + 1) + 8 * i), 8, objc_msgSend(v11, "length", v18, v19), objc_msgSend(v5, "length") - objc_msgSend(v11, "length"));
        if (v17)
        {
          BOOL v8 = 1;
          uint64_t v3 = v18;
          goto LABEL_34;
        }
      }
      uint64_t v14 = [&unk_26D8D4A70 countByEnumeratingWithState:&v20 objects:v24 count:16];
      BOOL v8 = 0;
      uint64_t v3 = v18;
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_34:

LABEL_10:
  return v8;
}

id __43__IPFeatureSentence_isQuoteAttributionLine__block_invoke()
{
  id v0 = (void *)MEMORY[0x22A632550]();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:@"[ -\\/,]2\\d{3}(.{0,4}) \\d{1,2}[:hH]\\d{2}()?(am|AM|pm|PM)?, ", @"在 2\\d{3}年\\d{1,2}月\\d{1,2}日，下午\\d{1,2}:\\d{2}", 0];
  v2 = NSString;
  uint64_t v3 = objc_msgSend(v1, "_pas_componentsJoinedByString:", @"|");
  v4 = [v2 stringWithFormat:@"\\b(%@)\\b", v3];

  uint64_t v7 = 0;
  double v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v4 options:65 error:&v7];

  return v5;
}

+ (id)eventVocabularyRegexForType:(id)a3 languageID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v9 = [v8 objectForKey:*MEMORY[0x263EFF508]];

  if (!v7) {
    id v7 = v9;
  }
  BOOL v10 = [NSString stringWithFormat:@"%@-%@", v6, v7];
  if (eventVocabularyRegexForType_languageID___pasOnceToken3 != -1) {
    dispatch_once(&eventVocabularyRegexForType_languageID___pasOnceToken3, &__block_literal_global_126_0);
  }
  id v11 = [(id)eventVocabularyRegexForType_languageID___pasExprOnceResult result];
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  double v26 = __Block_byref_object_copy__3;
  double v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__IPFeatureSentence_eventVocabularyRegexForType_languageID___block_invoke_133;
  v17[3] = &unk_264723178;
  long long v21 = &v23;
  id v12 = v10;
  id v18 = v12;
  id v22 = a1;
  id v13 = v6;
  id v19 = v13;
  id v14 = v7;
  id v20 = v14;
  [v11 runWithLockAcquired:v17];
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __60__IPFeatureSentence_eventVocabularyRegexForType_languageID___block_invoke()
{
  id v0 = (void *)MEMORY[0x22A632550]();
  uint64_t v1 = [objc_alloc(MEMORY[0x263F61E60]) initWithBlock:&__block_literal_global_130 idleTimeout:1.0];
  v2 = (void *)eventVocabularyRegexForType_languageID___pasExprOnceResult;
  eventVocabularyRegexForType_languageID___pasExprOnceResult = v1;
}

void __60__IPFeatureSentence_eventVocabularyRegexForType_languageID___block_invoke_133(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v7 = (void *)MEMORY[0x22A632550]();
    uint64_t v8 = [*(id *)(a1 + 64) buildRegexForType:*(void *)(a1 + 40) languageID:*(void *)(a1 + 48)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    BOOL v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = *(void *)(a1 + 56);
    if (*(void *)(*(void *)(v11 + 8) + 40))
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __60__IPFeatureSentence_eventVocabularyRegexForType_languageID___block_invoke_2_134;
      v12[3] = &unk_264723150;
      v12[4] = v11;
      [v3 enumerateKeysAndObjectsUsingBlock:v12];
      [v3 setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:*(void *)(a1 + 32)];
    }
  }
}

void __60__IPFeatureSentence_eventVocabularyRegexForType_languageID___block_invoke_2_134(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([v7 isEqual:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

+ (id)eventVocabularyPositiveRegexForLanguageID:(id)a3
{
  return (id)[a1 eventVocabularyRegexForType:@"Positive" languageID:a3];
}

+ (id)eventVocabularyRejectionRegexForLanguageID:(id)a3
{
  return (id)[a1 eventVocabularyRegexForType:@"Rejection" languageID:a3];
}

+ (id)eventVocabularyIgnoreDateRegexForLanguageID:(id)a3
{
  return (id)[a1 eventVocabularyRegexForType:@"IgnoreDate" languageID:a3];
}

+ (id)eventVocabularySubjectTitleRegexForLanguageID:(id)a3
{
  return (id)[a1 eventVocabularyRegexForType:@"Subject-title" languageID:a3];
}

+ (_NSRange)_rangeExcludingLeadingAndTrailingCharacters:(id)a3 inRange:(_NSRange)a4 ofString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  NSUInteger v10 = location + length;
  if (v10)
  {
    NSUInteger v11 = 0;
    while (objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v11)))
    {
      if (v10 == ++v11)
      {
        NSUInteger v11 = v10;
        goto LABEL_7;
      }
    }
  }
  else
  {
    NSUInteger v11 = 0;
  }
  do
  {
LABEL_7:
    NSUInteger v12 = v10 - v11;
    if (v10 <= v11) {
      break;
    }
    --v10;
  }
  while ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v10)) & 1) != 0);

  NSUInteger v13 = v11;
  NSUInteger v14 = v12;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

+ (id)_substringWithRange:(_NSRange)a3 ofString:(id)a4 removingCharactersFromSet:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  id v9 = a5;
  if (length
    && (uint64_t v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v9, 2, location, length),
        v10 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v13 = v10;
    uint64_t v14 = v11;
    id v24 = v9;
    unint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    NSUInteger v18 = location + length;
    size_t v19 = 2 * length - 2;
    do
    {
      if (!v17)
      {
        uint64_t v17 = (char *)malloc_type_malloc(v19, 0x31FF56CBuLL);
        unint64_t v15 = v19;
        if (!v17) {
          +[IPFeatureSentence _substringWithRange:ofString:removingCharactersFromSet:]();
        }
      }
      objc_msgSend(v8, "getCharacters:range:", &v17[2 * v16], location, v13 - location);
      v16 += v13 - location;
      NSUInteger location = v13 + v14;
      NSUInteger v20 = v18 - (v13 + v14);
      uint64_t v13 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v24, 2, v13 + v14, v20);
      uint64_t v14 = v21;
    }
    while (v13 != 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v8, "getCharacters:range:", &v17[2 * v16], location, v20);
    uint64_t v22 = v20 + v16;
    if (v20 + v16)
    {
      if (2 * v22 >= v15)
      {
        id v9 = v24;
      }
      else
      {
        uint64_t v17 = (char *)malloc_type_realloc(v17, 2 * v22, 0x1000040BDFB0063uLL);
        id v9 = v24;
        if (!v17) {
          +[IPFeatureSentence _substringWithRange:ofString:removingCharactersFromSet:]();
        }
      }
      NSUInteger v12 = (__CFString *)[[NSString alloc] initWithCharactersNoCopy:v17 length:v20 + v16 freeWhenDone:1];
    }
    else
    {
      free(v17);
      NSUInteger v12 = &stru_26D895C60;
      id v9 = v24;
    }
  }
  else
  {
    NSUInteger v12 = 0;
  }

  return v12;
}

+ (id)bestLanguageIDFromText:(id)a3 linesElided:(unint64_t)a4
{
  id v6 = a3;
  if (bestLanguageIDFromText_linesElided___onceToken != -1) {
    dispatch_once(&bestLanguageIDFromText_linesElided___onceToken, &__block_literal_global_155_0);
  }
  id v7 = (id)bestLanguageIDFromText_linesElided___ipExprOnceResult;
  objc_sync_enter(v7);
  id v8 = [v7 objectForKey:v6];
  if (v8)
  {
    id v9 = v8;
    objc_sync_exit(v7);
  }
  else
  {
    objc_sync_exit(v7);

    uint64_t v10 = (void *)MEMORY[0x22A632550]();
    uint64_t v11 = (__CFString *)v6;
    uint64_t v12 = [(__CFString *)v11 length];
    uint64_t v13 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t location = objc_msgSend(a1, "_rangeExcludingLeadingAndTrailingCharacters:inRange:ofString:", v13, 0, v12, v11);
    NSUInteger length = v15;

    if (a4 <= 1
      && [(__CFString *)v11 rangeOfString:@"\n", 2, location, length options range] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v35 = 0;
      double v36 = &v35;
      uint64_t v37 = 0x2020000000;
      unint64_t v38 = a4;
      uint64_t v31 = 0;
      long long v32 = &v31;
      uint64_t v33 = 0x2020000000;
      NSUInteger v34 = location + length;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __56__IPFeatureSentence_bestLanguageIDFromText_linesElided___block_invoke_2;
      v30[3] = &unk_2647231A0;
      v30[4] = &v35;
      v30[5] = &v31;
      -[__CFString enumerateSubstringsInRange:options:usingBlock:](v11, "enumerateSubstringsInRange:options:usingBlock:", location, length, 256, v30);
      if ((unint64_t)v36[3] >= 5)
      {
        v42.NSUInteger length = v32[3];
        v40.uint64_t location = location;
        v40.NSUInteger length = length;
        v42.uint64_t location = 0;
        NSRange v17 = NSIntersectionRange(v40, v42);
        uint64_t location = v17.location;
        NSUInteger length = v17.length;
      }
      _Block_object_dispose(&v31, 8);
      _Block_object_dispose(&v35, 8);
    }
    if (length >= 0x200) {
      NSUInteger length = 512;
    }
    NSUInteger v18 = (void *)MEMORY[0x22A632550]();
    size_t v19 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"-–—_"];
    CFIndex v20 = objc_msgSend(a1, "_rangeExcludingLeadingAndTrailingCharacters:inRange:ofString:", v19, location, length, v11);
    CFIndex v22 = v21;
    uint64_t v23 = objc_msgSend(a1, "_substringWithRange:ofString:removingCharactersFromSet:", v20, v21, v11, v19);
    id v24 = v23;
    if (v23)
    {
      CFIndex v22 = [v23 length];
      uint64_t v25 = v24;

      CFIndex v20 = 0;
    }
    else
    {
      uint64_t v25 = v11;
    }
    v41.uint64_t location = v20;
    v41.NSUInteger length = v22;
    double v26 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v25, v41);
    if (!v26)
    {
      double v27 = [MEMORY[0x263EFF960] currentLocale];
      double v26 = [v27 objectForKey:*MEMORY[0x263EFF508]];
    }
    if ([(__CFString *)v26 isEqualToString:@"yue"])
    {

      double v26 = @"zh-Hant";
    }
    id v28 = v7;
    objc_sync_enter(v28);
    if ((unint64_t)[v28 count] >= 5) {
      [v28 removeAllObjects];
    }
    [v28 setObject:v26 forKey:v11];
    objc_sync_exit(v28);

    id v9 = v26;
  }

  return v9;
}

void __56__IPFeatureSentence_bestLanguageIDFromText_linesElided___block_invoke()
{
  id v0 = (void *)MEMORY[0x22A632550]();
  uint64_t v1 = [MEMORY[0x263F08968] mapTableWithKeyOptions:517 valueOptions:0];
  v2 = (void *)bestLanguageIDFromText_linesElided___ipExprOnceResult;
  bestLanguageIDFromText_linesElided___ipExprOnceResult = v1;
}

uint64_t __56__IPFeatureSentence_bestLanguageIDFromText_linesElided___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  unint64_t v7 = ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  if (v7 == 2)
  {
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  }
  else if (v7 >= 5)
  {
    *a7 = 1;
  }
  return result;
}

+ (id)eventVocabularyIgnoreDateKeywordInString:(id)a3 languageID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    if (!v7)
    {
      id v7 = [a1 bestLanguageIDFromText:v6];
    }
    id v8 = [a1 eventVocabularyIgnoreDateRegexForLanguageID:v7];
    id v9 = +[IPRegexToolbox firstMatchingKeywordForRegex:v8 inString:v6 needsToLowercase:1];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)eventVocabularySubjectTitleInString:(id)a3 languageID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    if (!v7)
    {
      id v7 = [a1 bestLanguageIDFromText:v6];
    }
    id v8 = [a1 eventVocabularySubjectTitleRegexForLanguageID:v7];
    id v9 = +[IPRegexToolbox firstMatchingKeywordForRegex:v8 inString:v6 needsToLowercase:1];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (unint64_t)numberOfMatchesForEventVocabularySubjectTitleInString:(id)a3 languageID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    if (!v7)
    {
      id v7 = [a1 bestLanguageIDFromText:v6];
    }
    id v8 = [a1 eventVocabularySubjectTitleRegexForLanguageID:v7];
    unint64_t v9 = +[IPRegexToolbox numberOfMatchesForRegex:v8 inString:v6 needsToLowercase:1];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)descriptionForFragment:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  id v6 = [(IPFeature *)self matchString];
  uint64_t v7 = [v5 range];
  unint64_t v9 = objc_msgSend(v6, "substringWithRange:", v7, v8);
  uint64_t v10 = [v4 stringWithFormat:@"[%@]   %@", v9, v5];

  return v10;
}

- (id)descriptionForFragmentAtIndex:(unint64_t)a3
{
  id v5 = [(IPFeatureSentence *)self fragments];
  id v6 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v7 = [(IPFeatureSentence *)self descriptionForFragment:v6];

  return v7;
}

+ (id)humanReadableFeaturePolarity:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"undefined";
  }
  else {
    return off_2647231C0[a3 - 1];
  }
}

- (RKText)responseKitSentence
{
  return (RKText *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResponseKitSentence:(id)a3
{
}

- (NSArray)fragments
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFragments:(id)a3
{
}

- (NSString)languageID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLanguageID:(id)a3
{
}

- (unint64_t)storedPolarity
{
  return self->_storedPolarity;
}

- (void)setStoredPolarity:(unint64_t)a3
{
  self->_storedPolarity = a3;
}

- (NSString)storedEventVocabularyRejectionKeyword
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStoredEventVocabularyRejectionKeyword:(id)a3
{
}

- (NSString)storedEventVocabularyIgnoreDateKeyword
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStoredEventVocabularyIgnoreDateKeyword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedEventVocabularyIgnoreDateKeyword, 0);
  objc_storeStrong((id *)&self->_storedEventVocabularyRejectionKeyword, 0);
  objc_storeStrong((id *)&self->_languageID, 0);
  objc_storeStrong((id *)&self->_fragments, 0);
  objc_storeStrong((id *)&self->_responseKitSentence, 0);
}

+ (void)_substringWithRange:ofString:removingCharactersFromSet:.cold.1()
{
}

+ (void)_substringWithRange:ofString:removingCharactersFromSet:.cold.2()
{
}

@end