@interface IPKeywordFeatureExtractor
- (id)_matchingKeywordsForRegex:(id)a3 inText:(id)a4 message:(id)a5 eventType:(id)a6 keywordType:(unint64_t)a7;
- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 context:(id)a5;
- (id)matchesForTextString:(id)a3 inMessageUnit:(id)a4 eventType:(id)a5;
- (id)matchesForTextString:(id)a3 inMessageUnit:(id)a4 eventType:(id)a5 keywordType:(unint64_t)a6;
- (id)queue;
@end

@implementation IPKeywordFeatureExtractor

- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 context:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v7 = a4;
  id v30 = a5;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v39 = v7;
  v32 = [v7 bestLanguageID];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v33 = [&unk_26D8CDAB0 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v49;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(&unk_26D8CDAB0);
        }
        uint64_t v36 = v9;
        v10 = *(void **)(*((void *)&v48 + 1) + 8 * v9);
        context = (void *)MEMORY[0x22A632550]();
        v34 = +[IPEventClassificationType taxonomyForLanguageID:clusterType:](IPEventClassificationType, "taxonomyForLanguageID:clusterType:", v32, [v10 integerValue]);
        v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v34, 0);
        if ([v11 count])
        {
          v37 = v11;
          do
          {
            v12 = (void *)MEMORY[0x22A632550]();
            v13 = [v11 firstObject];
            [v11 removeObjectAtIndex:0];
            v14 = [(IPKeywordFeatureExtractor *)self matchesForTextString:v40 inMessageUnit:v39 eventType:v13];
            if ([v14 count])
            {
              v41 = v14;
              v42 = v12;
              long long v46 = 0u;
              long long v47 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              id obj = v14;
              uint64_t v15 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v45;
                do
                {
                  for (uint64_t i = 0; i != v16; ++i)
                  {
                    if (*(void *)v45 != v17) {
                      objc_enumerationMutation(obj);
                    }
                    v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                    v20 = (void *)MEMORY[0x22A632550]();
                    v21 = NSString;
                    uint64_t v22 = [v19 matchRange];
                    [v19 matchRange];
                    v24 = objc_msgSend(v21, "stringWithFormat:", @"%lu-%lu-%lu", v22, v23, objc_msgSend(v19, "type"));
                    v25 = [v8 objectForKeyedSubscript:v24];

                    if (!v25) {
                      [v8 setObject:v19 forKeyedSubscript:v24];
                    }
                    v26 = [v8 objectForKeyedSubscript:v24];
                    [v26 addEventType:v13];
                  }
                  uint64_t v16 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
                }
                while (v16);
              }

              v27 = [v13 children];
              v11 = v37;
              [v37 addObjectsFromArray:v27];

              v14 = v41;
              v12 = v42;
            }
          }
          while ([v11 count]);
        }

        uint64_t v9 = v36 + 1;
      }
      while (v36 + 1 != v33);
      uint64_t v33 = [&unk_26D8CDAB0 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v33);
  }
  v28 = [v8 allValues];

  return v28;
}

- (id)matchesForTextString:(id)a3 inMessageUnit:(id)a4 eventType:(id)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(IPKeywordFeatureExtractor *)self matchesForTextString:v8 inMessageUnit:v9 eventType:v10 keywordType:2];
  long long v50 = (void *)[v11 mutableCopy];

  long long v44 = v8;
  long long v45 = self;
  v42 = v10;
  v43 = v9;
  [(IPKeywordFeatureExtractor *)self matchesForTextString:v8 inMessageUnit:v9 eventType:v10 keywordType:0];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v48 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v64 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v16 = v50;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v59 objects:v69 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v60;
          while (2)
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v60 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v59 + 1) + 8 * j);
              NSUInteger v22 = [v15 matchRange];
              NSUInteger v24 = v23;
              v75.location = [v21 matchRange];
              v75.length = v25;
              v73.location = v22;
              v73.length = v24;
              if (NSIntersectionRange(v73, v75).length)
              {

                goto LABEL_16;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v59 objects:v69 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        [v16 addObject:v15];
LABEL_16:
        ;
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
    }
    while (v13);
  }
  [(IPKeywordFeatureExtractor *)v45 matchesForTextString:v44 inMessageUnit:v43 eventType:v42 keywordType:1];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [v46 countByEnumeratingWithState:&v55 objects:v68 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v49 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v56 != v49) {
          objc_enumerationMutation(v46);
        }
        v29 = *(void **)(*((void *)&v55 + 1) + 8 * k);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v30 = v50;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v51 objects:v67 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v52;
          while (2)
          {
            for (uint64_t m = 0; m != v32; ++m)
            {
              if (*(void *)v52 != v33) {
                objc_enumerationMutation(v30);
              }
              v35 = *(void **)(*((void *)&v51 + 1) + 8 * m);
              NSUInteger v36 = [v29 matchRange];
              NSUInteger v38 = v37;
              v76.location = [v35 matchRange];
              v76.length = v39;
              v74.location = v36;
              v74.length = v38;
              if (NSIntersectionRange(v74, v76).length)
              {

                goto LABEL_33;
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v51 objects:v67 count:16];
            if (v32) {
              continue;
            }
            break;
          }
        }

        [v30 addObject:v29];
LABEL_33:
        ;
      }
      uint64_t v27 = [v46 countByEnumeratingWithState:&v55 objects:v68 count:16];
    }
    while (v27);
  }
  id v40 = (void *)[v50 copy];

  return v40;
}

- (id)matchesForTextString:(id)a3 inMessageUnit:(id)a4 eventType:(id)a5 keywordType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  switch(a6)
  {
    case 2uLL:
      uint64_t v14 = [v12 titleKeywords];
      goto LABEL_7;
    case 1uLL:
      uint64_t v14 = [v12 genericPatternKeywords];
      goto LABEL_7;
    case 0uLL:
      uint64_t v14 = [v12 patternKeywords];
LABEL_7:
      uint64_t v15 = (void *)v14;
      goto LABEL_9;
  }
  uint64_t v15 = (void *)MEMORY[0x263EFFA68];
LABEL_9:
  if ([v15 count])
  {
    id v16 = NSString;
    uint64_t v17 = [v13 identifier];
    uint64_t v18 = [v13 language];
    uint64_t v19 = [v16 stringWithFormat:@"%@-%@-%@-%lu", v17, v18, @"keywords", a6];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __86__IPKeywordFeatureExtractor_matchesForTextString_inMessageUnit_eventType_keywordType___block_invoke;
    v25[3] = &unk_264722F50;
    id v20 = v13;
    id v26 = v20;
    id v27 = v15;
    v21 = +[IPRegexToolbox regularExpressionWithKey:v19 generator:v25];
    NSUInteger v22 = [v11 originalMessage];
    NSUInteger v23 = [(IPKeywordFeatureExtractor *)self _matchingKeywordsForRegex:v21 inText:v10 message:v22 eventType:v20 keywordType:a6];
  }
  else
  {
    NSUInteger v23 = (void *)MEMORY[0x263EFFA68];
  }

  return v23;
}

id __86__IPKeywordFeatureExtractor_matchesForTextString_inMessageUnit_eventType_keywordType___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) language];
  v3 = +[IPRegexToolbox regexPatternForLanguageID:v2 eventVocabularyArray:*(void *)(a1 + 40)];

  id v12 = 0;
  v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v3 options:64 error:&v12];
  id v5 = v12;
  if (v5)
  {
    v6 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v6 = _IPLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = v6;
      id v9 = [v7 language];
      id v10 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      id v16 = v10;
      __int16 v17 = 2114;
      uint64_t v18 = v3;
      _os_log_impl(&dword_225684000, v8, OS_LOG_TYPE_ERROR, "Can't compile regex: [language=%{public}@ identifier=%{public}@]\n%{public}@ #EventClassification", buf, 0x20u);
    }
  }

  return v4;
}

- (id)_matchingKeywordsForRegex:(id)a3 inText:(id)a4 message:(id)a5 eventType:(id)a6 keywordType:(unint64_t)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v36 = a6;
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v33 = v9;
  +[IPRegexToolbox matchingKeywordResultsForRegex:v9 inString:v10 needsToLowercase:0];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(obj);
        }
        __int16 v15 = *(void **)(*((void *)&v38 + 1) + 8 * v14);
        uint64_t v16 = [v15 range];
        if (!+[IPRegexToolbox isRangeInsideQuotationMarks:text:limitToSurroundingText:](IPRegexToolbox, "isRangeInsideQuotationMarks:text:limitToSurroundingText:", v16, v17, v10, 1))
        {
          uint64_t v18 = [v15 range];
          uint64_t v20 = v19;
          v21 = [v36 language];
          BOOL v22 = +[IPRegexToolbox isRangeNearbyExclusionKeyword:text:limitToSurroundingText:language:](IPRegexToolbox, "isRangeNearbyExclusionKeyword:text:limitToSurroundingText:language:", v18, v20, v10, 1, v21);

          if (!v22)
          {
            uint64_t v28 = [v15 range];
            NSUInteger v24 = objc_msgSend(v10, "substringWithRange:", v28, v29);
            uint64_t v30 = [v15 range];
            id v27 = +[IPFeatureKeyword featureKeywordWithType:string:matchRange:](IPFeatureKeyword, "featureKeywordWithType:string:matchRange:", a7, v24, v30, v31);
            [v27 setTextUnit:v10];
            [v35 addObject:v27];
            goto LABEL_16;
          }
          if (IPDebuggingModeEnabled_once_0 != -1) {
            dispatch_once(&IPDebuggingModeEnabled_once_0, &__block_literal_global_36);
          }
          if (IPDebuggingModeEnabled_sEnabled_0)
          {
            NSUInteger v23 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              NSUInteger v23 = _IPLogHandle;
            }
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              NSUInteger v24 = v23;
              uint64_t v25 = [v15 range];
              id v27 = objc_msgSend(v10, "substringWithRange:", v25, v26);
              *(_DWORD *)buf = 138412290;
              v43 = v27;
              _os_log_impl(&dword_225684000, v24, OS_LOG_TYPE_INFO, "      --> not counted because too close to an exclusion keyword [%@] #EventClassification", buf, 0xCu);
LABEL_16:
            }
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v12);
  }

  return v35;
}

- (id)queue
{
  if (queue__onceToken != -1) {
    dispatch_once(&queue__onceToken, &__block_literal_global_2);
  }
  v2 = (void *)queue__ipExprOnceResult;
  return v2;
}

void __34__IPKeywordFeatureExtractor_queue__block_invoke()
{
  v0 = (void *)MEMORY[0x22A632550]();
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("IPKeywordFeatureExtractor", v1);
  v3 = (void *)queue__ipExprOnceResult;
  queue__ipExprOnceResult = (uint64_t)v2;
}

@end