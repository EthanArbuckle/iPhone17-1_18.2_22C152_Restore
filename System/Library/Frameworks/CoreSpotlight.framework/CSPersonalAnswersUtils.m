@interface CSPersonalAnswersUtils
+ (void)dataForLocale:(id)a3;
+ (void)filterCandidateAttributeIntents:(id)a3 withCategoryIntents:(id)a4 attributeIntents:(id)a5;
+ (void)getCategoryAttributeMap;
+ (void)intentsForStringTokens:(id)a3 filteredTokens:(id)a4 categoryIntents:(id)a5 attributeIntents:(id)a6 locale:(id)a7;
+ (void)processIntentSet:(id)a3 withPhrase:(id)a4 filteredTokens:(id)a5 categoryIntents:(id)a6 candidateAttributeIntents:(id)a7 hasAmbiguousDateIntent:(BOOL *)a8 hasStartDateIntent:(BOOL *)a9 hasEndDateIntent:(BOOL *)a10;
@end

@implementation CSPersonalAnswersUtils

+ (void)dataForLocale:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)localizedData;
  if (!localizedData)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    v6 = (void *)localizedData;
    localizedData = v5;

    v4 = (void *)localizedData;
  }
  v7 = [v4 objectForKeyedSubscript:v3];

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSpotlight"];
    v9 = [v8 pathForResource:@"mapPersonalAnswersIntentToPhrase" ofType:@"plist" inDirectory:0 forLocalization:v3];
    if (v9)
    {
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v9];
      if (v10)
      {
        v28 = v9;
        v29 = v8;
        v11 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v27 = v10;
        v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v39;
          uint64_t v30 = *(void *)v39;
          v31 = v12;
          do
          {
            uint64_t v16 = 0;
            uint64_t v32 = v14;
            do
            {
              if (*(void *)v39 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * v16);
              v18 = -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v17, v27);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v36 = 0u;
                long long v37 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                v33 = v18;
                id v19 = v18;
                uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
                if (v20)
                {
                  uint64_t v21 = v20;
                  uint64_t v22 = *(void *)v35;
                  do
                  {
                    for (uint64_t i = 0; i != v21; ++i)
                    {
                      if (*(void *)v35 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      uint64_t v24 = *(void *)(*((void *)&v34 + 1) + 8 * i);
                      v25 = [v11 objectForKeyedSubscript:v24];

                      if (v25)
                      {
                        v26 = [v11 objectForKeyedSubscript:v24];
                        [v26 addObject:v17];
                      }
                      else
                      {
                        v26 = [MEMORY[0x1E4F1CA80] setWithObject:v17];
                        [v11 setObject:v26 forKeyedSubscript:v24];
                      }
                    }
                    uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
                  }
                  while (v21);
                }

                uint64_t v15 = v30;
                v12 = v31;
                uint64_t v14 = v32;
                v18 = v33;
              }

              ++v16;
            }
            while (v16 != v14);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
          }
          while (v14);
        }

        [(id)localizedData setObject:v11 forKeyedSubscript:v3];
        v9 = v28;
        v8 = v29;
        v10 = v27;
      }
      else
      {
        v11 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          +[CSPersonalAnswersUtils dataForLocale:]((uint64_t)v3, v11);
        }
      }
    }
    else
    {
      v10 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[CSPersonalAnswersUtils dataForLocale:]();
      }
    }
  }
}

+ (void)getCategoryAttributeMap
{
  if (getCategoryAttributeMap_onceToken != -1) {
    dispatch_once(&getCategoryAttributeMap_onceToken, &__block_literal_global_23);
  }
}

void __49__CSPersonalAnswersUtils_getCategoryAttributeMap__block_invoke()
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v0 = &off_1E91AD000;
  if (!categoryAttributeMap)
  {
    uint64_t v1 = [MEMORY[0x1E4F1CA60] dictionary];
    v2 = (void *)categoryAttributeMap;
    categoryAttributeMap = v1;

    id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSpotlight"];
    v4 = [v3 pathForResource:@"mapPersonalAnswersCategoryToAttributes" ofType:@"plist" inDirectory:0];
    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
      v6 = v5;
      if (v5)
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v26 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v26)
        {
          v23 = v4;
          uint64_t v24 = v3;
          uint64_t v7 = *(void *)v32;
          unint64_t v8 = 0x1E4F28000uLL;
          unint64_t v9 = 0x1E4F1C000uLL;
          uint64_t v25 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v32 != v7) {
                objc_enumerationMutation(v6);
              }
              v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              v12 = [*(id *)(v8 + 3792) numberWithInteger:CategoryIntentFromString(v11)];
              uint64_t v13 = [v6 objectForKeyedSubscript:v11];
              uint64_t v14 = [*(id *)(v9 + 2688) set];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v15 = v6;
                uint64_t v16 = v0;
                long long v29 = 0u;
                long long v30 = 0u;
                long long v27 = 0u;
                long long v28 = 0u;
                id v17 = v13;
                uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
                if (v18)
                {
                  uint64_t v19 = v18;
                  uint64_t v20 = *(void *)v28;
                  do
                  {
                    for (uint64_t j = 0; j != v19; ++j)
                    {
                      if (*(void *)v28 != v20) {
                        objc_enumerationMutation(v17);
                      }
                      objc_msgSend(v14, "addObject:", *(void *)(*((void *)&v27 + 1) + 8 * j), v23, v24);
                    }
                    uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
                  }
                  while (v19);
                }

                v0 = v16;
                v6 = v15;
                uint64_t v7 = v25;
                unint64_t v8 = 0x1E4F28000;
                unint64_t v9 = 0x1E4F1C000;
              }
              objc_msgSend(v0[324], "setObject:forKey:", v14, v12, v23, v24);
            }
            uint64_t v26 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
          }
          while (v26);
          v4 = v23;
          id v3 = v24;
        }
      }
      else
      {
        uint64_t v22 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          __49__CSPersonalAnswersUtils_getCategoryAttributeMap__block_invoke_cold_2(v22);
        }
      }
    }
    else
    {
      v6 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __49__CSPersonalAnswersUtils_getCategoryAttributeMap__block_invoke_cold_1();
      }
    }
  }
}

+ (void)filterCandidateAttributeIntents:(id)a3 withCategoryIntents:(id)a4 attributeIntents:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!categoryAttributeMap) {
    +[CSPersonalAnswersUtils getCategoryAttributeMap];
  }
  v10 = [MEMORY[0x1E4F1CA80] set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [(id)categoryAttributeMap objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        [v10 unionSet:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v13);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v17 = v7;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v23 + 1) + 8 * j);
        if (objc_msgSend(v10, "containsObject:", v22, (void)v23)) {
          [v9 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v19);
  }
}

+ (void)processIntentSet:(id)a3 withPhrase:(id)a4 filteredTokens:(id)a5 categoryIntents:(id)a6 candidateAttributeIntents:(id)a7 hasAmbiguousDateIntent:(BOOL *)a8 hasStartDateIntent:(BOOL *)a9 hasEndDateIntent:(BOOL *)a10
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v32 = a7;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v18 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v18) {
    goto LABEL_22;
  }
  uint64_t v19 = v18;
  id v29 = v16;
  id v30 = v15;
  int v20 = 0;
  uint64_t v21 = *(void *)v34;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v34 != v21) {
        objc_enumerationMutation(v14);
      }
      long long v23 = *(void **)(*((void *)&v33 + 1) + 8 * v22);
      if (objc_msgSend(v23, "hasPrefix:", @"CAT_", v29, v30))
      {
        uint64_t v24 = CategoryIntentFromString(v23);
        if (v24 != 7)
        {
          long long v25 = [NSNumber numberWithInteger:v24];
          long long v26 = v17;
LABEL_9:
          [v26 addObject:v25];

          int v20 = 1;
        }
      }
      else if ([v23 hasPrefix:@"ATTR_"])
      {
        int v20 = 1;
        switch(AttributeIntentFromString(v23))
        {
          case 13:
            long long v27 = a8;
            goto LABEL_16;
          case 14:
            long long v27 = a9;
            goto LABEL_16;
          case 15:
            long long v27 = a10;
LABEL_16:
            BOOL *v27 = 1;
            break;
          case 16:
            break;
          default:
            long long v25 = [v23 substringFromIndex:5];
            long long v26 = v32;
            goto LABEL_9;
        }
      }
      else
      {
        v20 |= [v23 isEqualToString:@"STOPWORDS"];
      }
      ++v22;
    }
    while (v19 != v22);
    uint64_t v28 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
    uint64_t v19 = v28;
  }
  while (v28);
  id v16 = v29;
  id v15 = v30;
  if ((v20 & 1) == 0) {
LABEL_22:
  }
    [v16 addObject:v15];
}

+ (void)intentsForStringTokens:(id)a3 filteredTokens:(id)a4 categoryIntents:(id)a5 attributeIntents:(id)a6 locale:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v31 = a5;
  id v30 = a6;
  id v13 = a7;
  +[CSPersonalAnswersUtils dataForLocale:v13];
  id v29 = v13;
  id v14 = [(id)localizedData objectForKeyedSubscript:v13];
  id v15 = [MEMORY[0x1E4F1CA80] set];
  __int16 v33 = 0;
  char v32 = 0;
  if ([v11 count])
  {
    unint64_t v16 = 0;
    while (v16 < [v11 count] - 1)
    {
      id v17 = NSString;
      uint64_t v18 = [v11 objectAtIndexedSubscript:v16];
      uint64_t v19 = [v11 objectAtIndexedSubscript:v16 + 1];
      int v20 = [v17 stringWithFormat:@"%@ %@", v18, v19];

      if (!v20) {
        goto LABEL_8;
      }
      uint64_t v21 = [v14 objectForKeyedSubscript:v20];

      if (!v21) {
        goto LABEL_8;
      }
      uint64_t v22 = [v14 objectForKeyedSubscript:v20];
      +[CSPersonalAnswersUtils processIntentSet:v22 withPhrase:v20 filteredTokens:v12 categoryIntents:v31 candidateAttributeIntents:v15 hasAmbiguousDateIntent:(char *)&v33 + 1 hasStartDateIntent:&v33 hasEndDateIntent:&v32];
      ++v16;
LABEL_11:

      if (++v16 >= [v11 count]) {
        goto LABEL_12;
      }
    }
    int v20 = 0;
LABEL_8:
    long long v23 = [v11 objectAtIndexedSubscript:v16];
    uint64_t v24 = [v14 objectForKeyedSubscript:v23];

    [v11 objectAtIndexedSubscript:v16];
    if (v24) {
      uint64_t v22 = {;
    }
      long long v25 = [v14 objectForKeyedSubscript:v22];
      long long v26 = [v11 objectAtIndexedSubscript:v16];
      +[CSPersonalAnswersUtils processIntentSet:v25 withPhrase:v26 filteredTokens:v12 categoryIntents:v31 candidateAttributeIntents:v15 hasAmbiguousDateIntent:(char *)&v33 + 1 hasStartDateIntent:&v33 hasEndDateIntent:&v32];
    }
    else {
      uint64_t v22 = {;
    }
      [v12 addObject:v22];
    }
    goto LABEL_11;
  }
LABEL_12:
  +[CSPersonalAnswersUtils filterCandidateAttributeIntents:v15 withCategoryIntents:v31 attributeIntents:v30];
  if (v32)
  {
    long long v27 = @"kMDItemEndDate";
    uint64_t v28 = v29;
LABEL_16:
    [v30 addObject:v27];
    goto LABEL_17;
  }
  uint64_t v28 = v29;
  if (HIBYTE(v33) | v33)
  {
    long long v27 = @"kMDItemStartDate";
    goto LABEL_16;
  }
LABEL_17:
}

+ (void)dataForLocale:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 138412802;
  OUTLINED_FUNCTION_0_7();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_18D0E3000, v2, OS_LOG_TYPE_ERROR, "%@ file for bundle ID %@ and locale %@ not found.", (uint8_t *)v3, 0x20u);
}

+ (void)dataForLocale:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_ERROR, "Failed to load the PersonalAnswers plist dictionary for locale %@", (uint8_t *)&v2, 0xCu);
}

void __49__CSPersonalAnswersUtils_getCategoryAttributeMap__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_0_7();
  _os_log_error_impl(&dword_18D0E3000, v0, OS_LOG_TYPE_ERROR, "%@ file for bundle ID %@ not found.", (uint8_t *)v1, 0x16u);
}

void __49__CSPersonalAnswersUtils_getCategoryAttributeMap__block_invoke_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = @"mapPersonalAnswersCategoryToAttributes";
  _os_log_error_impl(&dword_18D0E3000, log, OS_LOG_TYPE_ERROR, "Failed to load plist dictionary from file: %@", (uint8_t *)&v1, 0xCu);
}

@end