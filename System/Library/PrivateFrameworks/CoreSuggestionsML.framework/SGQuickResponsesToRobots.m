@interface SGQuickResponsesToRobots
+ (BOOL)insignificantSender:(id)a3;
+ (BOOL)presentInContext:(id)a3 context:(id)a4 startIdx:(int64_t)a5 endIdx:(int64_t)a6;
+ (float)allCapsRatio:(id)a3;
+ (id)contactStore;
+ (id)repliesToRobot:(id)a3 language:(id)a4 recipients:(id)a5;
+ (id)repliesToRobot:(id)a3 language:(id)a4 recipients:(id)a5 config:(id)a6;
+ (void)warmup;
@end

@implementation SGQuickResponsesToRobots

+ (id)repliesToRobot:(id)a3 language:(id)a4 recipients:(id)a5 config:(id)a6
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    v51 = [MEMORY[0x263F08690] currentHandler];
    [v51 handleFailureInMethod:a2, a1, @"SGQuickResponsesToRobots.m", 114, @"Invalid parameter not satisfying: %@", @"config" object file lineNumber description];
  }
  if (([v14 enableFeature] & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v46 = &_os_log_internal;
      v47 = "SGQuickResponsesToRobots: Replies to robots feature disabled";
LABEL_45:
      uint32_t v48 = 2;
LABEL_46:
      _os_log_debug_impl(&dword_226E32000, v46, OS_LOG_TYPE_DEBUG, v47, buf, v48);
    }
LABEL_48:
    id v49 = 0;
    goto LABEL_49;
  }
  if (!v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v46 = &_os_log_internal;
      v47 = "SGQuickResponsesToRobots: Not running replies to robots if recipients is nil";
      goto LABEL_45;
    }
    goto LABEL_48;
  }
  if (([v12 isEqualToString:@"en"] & 1) == 0)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 138412290;
    id v61 = v12;
    v46 = &_os_log_internal;
    v47 = "SGQuickResponsesToRobots: Not running replies to robots for language %@";
    uint32_t v48 = 12;
    goto LABEL_46;
  }
  v15 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  v16 = +[SGStringSplitter splitString:v11 withCharacterSet:v15];

  if (![v16 count])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "SGQuickResponsesToRobots: Can't reply to empty message", buf, 2u);
    }
    id v49 = 0;
    goto LABEL_62;
  }
  v57 = objc_opt_new();
  v58 = objc_opt_new();
  if (![v16 count]) {
    goto LABEL_60;
  }
  id v59 = a1;
  id v53 = v13;
  id v54 = v11;
  id v56 = v12;
  unint64_t v17 = 0;
  char v18 = 0;
  v19 = v57;
  do
  {
    v20 = (void *)MEMORY[0x22A66BDC0]();
    v21 = [v14 supportedKeysAndContext];
    v22 = [v16 objectAtIndexedSubscript:v17];
    v23 = [v21 objectForKeyedSubscript:v22];

    if (!v23) {
      goto LABEL_32;
    }
    v24 = [v16 objectAtIndexedSubscript:v17];
    char v25 = [v19 containsObject:v24];

    if (v25) {
      goto LABEL_32;
    }
    if (v18)
    {
      char v26 = 0;
    }
    else
    {
      v27 = [v14 triggerWords];
      char v26 = objc_msgSend(v59, "presentInContext:context:startIdx:endIdx:", v16, v27, v17 - objc_msgSend(v14, "triggerContext"), v17);
    }
    v18 |= v26;
    if (([v14 relaxContext] & 1) == 0)
    {
      if ([v14 useGeneralContext])
      {
        v30 = [v14 generalContextWords];
        unint64_t v31 = v17 + 1;
        int v32 = objc_msgSend(v59, "presentInContext:context:startIdx:endIdx:", v16, v30, v17 + 1, v17 + 1 + objc_msgSend(v14, "generalContextRight"));

        if (v32)
        {
          [v14 relaxContext];
          v19 = v57;
LABEL_31:
          v36 = [v16 objectAtIndexedSubscript:v17];
          [v19 addObject:v36];

          v37 = [SGQuickResponse alloc];
          v38 = [v16 objectAtIndexedSubscript:v17];
          BYTE2(v52) = 1;
          LOWORD(v52) = 256;
          v39 = -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:](v37, "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:", v38, v56, -1, -1, -1, -1, -1, v52);
          [v58 addObject:v39];

          goto LABEL_32;
        }
      }
      else
      {
        unint64_t v31 = v17 + 1;
      }
      v33 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v23];
      char v29 = objc_msgSend(v59, "presentInContext:context:startIdx:endIdx:", v16, v33, v31, v31 + objc_msgSend(v14, "rightContext"));
      if (v29)
      {
        int v28 = 0;
LABEL_27:

        v19 = v57;
        goto LABEL_28;
      }
      int v34 = [v14 useGeneralContext];
      if (v34
        && ([v14 generalContextWords],
            v55 = objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v59, "presentInContext:context:startIdx:endIdx:", v16, v55, v17 - objc_msgSend(v14, "generalContextLeft"), v17) & 1) != 0))
      {
        int v28 = 1;
      }
      else
      {
        int v28 = objc_msgSend(v59, "presentInContext:context:startIdx:endIdx:", v16, v33, v17 - objc_msgSend(v14, "leftContext"), v17);
        if (!v34) {
          goto LABEL_27;
        }
      }

      goto LABEL_27;
    }
    int v28 = 0;
    char v29 = 0;
LABEL_28:
    char v35 = [v14 relaxContext];
    if ((v29 & 1) != 0 || (v35 & 1) != 0 || v28) {
      goto LABEL_31;
    }
LABEL_32:

    ++v17;
  }
  while ([v16 count] > v17);
  if (v18)
  {
    id v12 = v56;
    if ([v58 count])
    {
      id v13 = v53;
      if ([v14 insignificantSender]
        && ([v59 insignificantSender:v53] & 1) == 0)
      {
        id v11 = v54;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v44 = &_os_log_internal;
          v45 = "SGQuickResponsesToRobots: Not running replies to robots for significant sender";
LABEL_64:
          _os_log_debug_impl(&dword_226E32000, v44, OS_LOG_TYPE_DEBUG, v45, buf, 2u);
        }
LABEL_60:
        id v49 = 0;
      }
      else
      {
        [v14 capsWordsRatioMax];
        id v11 = v54;
        if (v40 < 1.0)
        {
          +[SGQuickResponsesToRobots allCapsRatio:v16];
          float v42 = v41;
          [v14 capsWordsRatioMax];
          if (v42 > v43)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              v44 = &_os_log_internal;
              v45 = "SGQuickResponsesToRobots: Capital words threshold condition not met";
              goto LABEL_64;
            }
            goto LABEL_60;
          }
        }
        id v49 = v58;
      }
    }
    else
    {
      id v49 = 0;
      id v13 = v53;
      id v11 = v54;
    }
  }
  else
  {
    id v49 = 0;
    id v13 = v53;
    id v11 = v54;
    id v12 = v56;
  }

LABEL_62:
LABEL_49:

  return v49;
}

+ (id)repliesToRobot:(id)a3 language:(id)a4 recipients:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x22A66BDC0]();
  id v11 = +[SGQuickResponsesToRobotsConfig sharedInstance];
  if (v11)
  {
    id v12 = +[SGQuickResponsesToRobots repliesToRobot:v7 language:v8 recipients:v9 config:v11];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "SGQuickResponsesToRobots: Could not load assets for making replies to robots prediction", v14, 2u);
    }
    id v12 = 0;
  }

  return v12;
}

+ (BOOL)presentInContext:(id)a3 context:(id)a4 startIdx:(int64_t)a5 endIdx:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  int64_t v11 = a5 & ~(a5 >> 63);
  if ([v9 count] <= (unint64_t)a6) {
    a6 = [v9 count];
  }
  if (v11 >= a6)
  {
    BOOL v15 = 0;
  }
  else
  {
    id v12 = [v9 objectAtIndexedSubscript:v11];
    id v13 = [v12 lowercaseString];
    char v14 = [v10 containsObject:v13];

    if (v14)
    {
      BOOL v15 = 1;
    }
    else
    {
      int64_t v16 = v11 + 1;
      while (a6 != v16)
      {
        unint64_t v17 = [v9 objectAtIndexedSubscript:v16];
        char v18 = [v17 lowercaseString];
        int v19 = [v10 containsObject:v18];

        ++v16;
        if (v19)
        {
          int64_t v20 = v16 - 1;
          goto LABEL_12;
        }
      }
      int64_t v20 = a6;
LABEL_12:
      BOOL v15 = v20 < a6;
    }
  }

  return v15;
}

+ (float)allCapsRatio:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unint64_t v4 = 0;
    float v5 = 0.0;
    do
    {
      v6 = [v3 objectAtIndexedSubscript:v4];
      id v7 = [v6 uppercaseString];
      id v8 = [v3 objectAtIndexedSubscript:v4];
      int v9 = [v7 isEqualToString:v8];

      if (v9) {
        float v5 = v5 + 1.0;
      }
      ++v4;
    }
    while (v4 < [v3 count]);
  }
  else
  {
    float v5 = 0.0;
  }
  float v10 = v5 / (float)(unint64_t)[v3 count];

  return v10;
}

+ (BOOL)insignificantSender:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = v4;
  if (v4 && [v4 count] == 1)
  {
    v6 = [v5 firstObject];
    uint64_t v7 = [v6 rangeOfString:@"@"];
    uint64_t v8 = *MEMORY[0x263EFE070];
    uint64_t v9 = *MEMORY[0x263EFDF80];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      float v10 = (void *)*MEMORY[0x263EFE070];
    }
    else {
      float v10 = (void *)*MEMORY[0x263EFDF80];
    }
    id v11 = v10;
    if ([v11 isEqualToString:v8])
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x263EFEB28]) initWithStringValue:v6];
      if (v12)
      {
        id v13 = (void *)v12;
        char v14 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingPhoneNumber:v12];

LABEL_14:
        v30[0] = *MEMORY[0x263EFDFE0];
        int64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
        unint64_t v17 = [a1 contactStore];
        id v25 = 0;
        char v18 = [v17 unifiedContactsMatchingPredicate:v14 keysToFetch:v16 error:&v25];
        id v19 = v25;
        int64_t v20 = [v18 firstObject];

        if (v19)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v27 = v6;
            __int16 v28 = 2112;
            id v29 = v19;
            _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "SGQuickResponsesToRobots: Error fetching contact with %@: %@", buf, 0x16u);
          }
          BOOL v15 = 0;
        }
        else
        {
          BOOL v15 = v20 == 0;
        }

        goto LABEL_24;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      v21 = &_os_log_internal;
      v22 = "SGQuickResponsesToRobots: CNPhoneNumber initWithStringValue returned nil";
      uint32_t v23 = 2;
    }
    else
    {
      if ([v11 isEqualToString:v9])
      {
        char v14 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingEmailAddress:v6];
        goto LABEL_14;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
LABEL_23:
        BOOL v15 = 0;
LABEL_24:

        goto LABEL_25;
      }
      *(_DWORD *)buf = 138412290;
      id v27 = v11;
      v21 = &_os_log_internal;
      v22 = "Unsupported handleType: %@";
      uint32_t v23 = 12;
    }
    _os_log_error_impl(&dword_226E32000, v21, OS_LOG_TYPE_ERROR, v22, buf, v23);
    goto LABEL_23;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "SGQuickResponsesToRobots: Either 0 or more than 1 recipient found.", buf, 2u);
  }
  BOOL v15 = 0;
LABEL_25:

  return v15;
}

+ (id)contactStore
{
  if (contactStore_onceToken != -1) {
    dispatch_once(&contactStore_onceToken, &__block_literal_global_1591);
  }
  v2 = (void *)contactStore__instance;
  return v2;
}

uint64_t __40__SGQuickResponsesToRobots_contactStore__block_invoke()
{
  contactStore__instance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (void)warmup
{
  id v4 = +[SGQuickResponsesToRobotsConfig sharedInstance];
  if (!v4)
  {
    float v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, a1, @"SGQuickResponsesToRobots.m", 25, @"Invalid parameter not satisfying: %@", @"repliesToRobotsConfig" object file lineNumber description];

    id v4 = 0;
  }
}

@end