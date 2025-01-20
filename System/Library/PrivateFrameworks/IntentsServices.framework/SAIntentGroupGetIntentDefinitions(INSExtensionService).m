@interface SAIntentGroupGetIntentDefinitions(INSExtensionService)
- (uint64_t)_matchesIntentDefinition:()INSExtensionService;
- (void)ins_getIntentDefinitionsWithCompletionHandler:()INSExtensionService;
@end

@implementation SAIntentGroupGetIntentDefinitions(INSExtensionService)

- (uint64_t)_matchesIntentDefinition:()INSExtensionService
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x263F0F810];
  v6 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[SAIntentGroupGetIntentDefinitions(INSExtensionService) _matchesIntentDefinition:]";
    __int16 v67 = 2112;
    id v68 = v4;
    _os_log_debug_impl(&dword_2163DF000, v6, OS_LOG_TYPE_DEBUG, "%s Checking if Intent Definition at %@ matches query", buf, 0x16u);
  }
  v7 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v4];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 objectForKeyedSubscript:@"INIntents"];
    v10 = v9;
    if (v9)
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v11 = v9;
      uint64_t v46 = [v11 countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v59;
        v43 = v11;
        id v44 = v4;
        v41 = v10;
        v42 = v8;
        v39 = a1;
        do
        {
          for (uint64_t i = 0; i != v46; ++i)
          {
            if (*(void *)v59 != v47) {
              objc_enumerationMutation(v11);
            }
            v13 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            v14 = [v13 objectForKeyedSubscript:@"INIntentEntity"];
            uint64_t v15 = [v13 objectForKeyedSubscript:@"INIntentVerbAssociations"];
            v16 = (void *)v15;
            if (v14) {
              BOOL v17 = v15 == 0;
            }
            else {
              BOOL v17 = 1;
            }
            if (v17)
            {
              v18 = *v5;
              if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v66 = "-[SAIntentGroupGetIntentDefinitions(INSExtensionService) _matchesIntentDefinition:]";
                __int16 v67 = 2112;
                id v68 = v4;
                _os_log_debug_impl(&dword_2163DF000, v18, OS_LOG_TYPE_DEBUG, "%s Intent Definition at %@ has no entity or verb section", buf, 0x16u);
              }
            }
            else
            {
              long long v56 = 0u;
              long long v57 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              obuint64_t j = [a1 queries];
              uint64_t v19 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
              uint64_t v48 = v19;
              if (v19)
              {
                uint64_t v45 = *(void *)v55;
                v40 = v16;
                do
                {
                  uint64_t v20 = 0;
                  uint64_t v21 = v45;
                  do
                  {
                    if (*(void *)v55 != v21) {
                      objc_enumerationMutation(obj);
                    }
                    v22 = *(void **)(*((void *)&v54 + 1) + 8 * v20);
                    v23 = [v22 entity];
                    uint64_t v24 = [v14 caseInsensitiveCompare:v23];

                    if (!v24)
                    {
                      long long v52 = 0u;
                      long long v53 = 0u;
                      long long v50 = 0u;
                      long long v51 = 0u;
                      id v25 = v16;
                      uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v62 count:16];
                      if (v26)
                      {
                        uint64_t v27 = v26;
                        uint64_t v28 = *(void *)v51;
                        while (2)
                        {
                          for (uint64_t j = 0; j != v27; ++j)
                          {
                            if (*(void *)v51 != v28) {
                              objc_enumerationMutation(v25);
                            }
                            v30 = *(void **)(*((void *)&v50 + 1) + 8 * j);
                            v31 = [v22 verb];
                            uint64_t v32 = [v30 caseInsensitiveCompare:v31];

                            if (!v32)
                            {
                              v36 = *MEMORY[0x263F0F810];
                              id v4 = v44;
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_DEBUG))
                              {
                                *(_DWORD *)buf = 136315394;
                                v66 = "-[SAIntentGroupGetIntentDefinitions(INSExtensionService) _matchesIntentDefinition:]";
                                __int16 v67 = 2112;
                                id v68 = v44;
                                _os_log_debug_impl(&dword_2163DF000, v36, OS_LOG_TYPE_DEBUG, "%s Intent Definition at %@ matches current request", buf, 0x16u);
                              }

                              uint64_t v35 = 1;
                              v10 = v41;
                              v8 = v42;
                              goto LABEL_47;
                            }
                          }
                          uint64_t v27 = [v25 countByEnumeratingWithState:&v50 objects:v62 count:16];
                          if (v27) {
                            continue;
                          }
                          break;
                        }
                      }

                      v16 = v40;
                      uint64_t v21 = v45;
                    }
                    ++v20;
                  }
                  while (v20 != v48);
                  uint64_t v33 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
                  id v11 = v43;
                  id v4 = v44;
                  a1 = v39;
                  v5 = (os_log_t *)MEMORY[0x263F0F810];
                  uint64_t v48 = v33;
                }
                while (v33);
              }
            }
          }
          v10 = v41;
          v8 = v42;
          uint64_t v46 = [v11 countByEnumeratingWithState:&v58 objects:v64 count:16];
        }
        while (v46);
      }

      v34 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v66 = "-[SAIntentGroupGetIntentDefinitions(INSExtensionService) _matchesIntentDefinition:]";
        __int16 v67 = 2112;
        id v68 = v4;
        _os_log_debug_impl(&dword_2163DF000, v34, OS_LOG_TYPE_DEBUG, "%s Intent Definition at %@ does not match", buf, 0x16u);
      }
    }
    else
    {
      v37 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v66 = "-[SAIntentGroupGetIntentDefinitions(INSExtensionService) _matchesIntentDefinition:]";
        __int16 v67 = 2112;
        id v68 = v4;
        _os_log_impl(&dword_2163DF000, v37, OS_LOG_TYPE_INFO, "%s Intent Definition at %@ has no INIntents section", buf, 0x16u);
      }
    }
    uint64_t v35 = 0;
LABEL_47:
  }
  else
  {
    uint64_t v35 = 0;
  }

  return v35;
}

- (void)ins_getIntentDefinitionsWithCompletionHandler:()INSExtensionService
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v4 = (void *)*MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_DEBUG))
  {
    v22 = v4;
    v23 = [a1 queries];
    *(_DWORD *)buf = 136315394;
    uint64_t v33 = "-[SAIntentGroupGetIntentDefinitions(INSExtensionService) ins_getIntentDefinitionsWithCompletionHandler:]";
    __int16 v34 = 2112;
    uint64_t v35 = v23;
    _os_log_debug_impl(&dword_2163DF000, v22, OS_LOG_TYPE_DEBUG, "%s Finding intent definitions for GetIntentDefinition query: %@", buf, 0x16u);
  }
  v5 = INIntentDefinitionURLsForInstalledApps();
  id v6 = objc_alloc_init(MEMORY[0x263F649A8]);
  v7 = [a1 aceId];
  id v24 = v6;
  [v6 setRefId:v7];

  v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if ([a1 _matchesIntentDefinition:v14])
        {
          id v15 = objc_alloc(MEMORY[0x263EFF8F8]);
          id v26 = 0;
          v16 = (void *)[v15 initWithContentsOfURL:v14 options:1 error:&v26];
          id v17 = v26;
          if (v17)
          {
            uint64_t v21 = v17;
            uint64_t v20 = v25;
            (*((void (**)(id, void, id))v25 + 2))(v25, 0, v17);

            uint64_t v19 = v24;
            goto LABEL_15;
          }
          id v18 = objc_alloc_init(MEMORY[0x263F649C0]);
          [v18 setIntentDefinition:v16];
          [v8 addObject:v18];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v19 = v6;
  [v6 setIntentDefinitionInfos:v8];
  uint64_t v20 = v25;
  (*((void (**)(id, id, void))v25 + 2))(v25, v24, 0);
LABEL_15:
}

@end