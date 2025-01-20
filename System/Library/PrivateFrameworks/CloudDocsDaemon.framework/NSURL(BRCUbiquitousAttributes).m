@interface NSURL(BRCUbiquitousAttributes)
- (id)brc_attributesValues:()BRCUbiquitousAttributes lookup:;
@end

@implementation NSURL(BRCUbiquitousAttributes)

- (id)brc_attributesValues:()BRCUbiquitousAttributes lookup:
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v56 = a4;
  v6 = brc_bread_crumbs();
  v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v65 = (uint64_t)v56;
    __int16 v66 = 2112;
    id v67 = v5;
    __int16 v68 = 2112;
    v69 = v6;
    _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] lookup: %@ for attributes %@%@", buf, 0x20u);
  }

  id v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v5;
  uint64_t v55 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v60;
    uint64_t v51 = *MEMORY[0x1E4F28798];
    *(void *)&long long v8 = 138412802;
    long long v49 = v8;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v60 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = ubiquitousGetterForAttribute_onceToken;
        id v11 = *(id *)(*((void *)&v59 + 1) + 8 * v9);
        if (v10 != -1) {
          dispatch_once(&ubiquitousGetterForAttribute_onceToken, &__block_literal_global_7);
        }
        v12 = objc_msgSend((id)ubiquitousGetterForAttribute_ubiquitousAttributeToFunction, "objectForKeyedSubscript:", v11, v49);

        v13 = (void (*)(id))[v12 pointerValue];
        if (v13)
        {
          v14 = v13(v56);
          goto LABEL_30;
        }
        v15 = +[BRCUbiquitousAttributes brc_getterForAttribute:v11];
        if (!v15)
        {
          v18 = brc_bread_crumbs();
          v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v65 = (uint64_t)v11;
            __int16 v66 = 2112;
            id v67 = v18;
            _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] unsupported attribute: %@%@", buf, 0x16u);
          }

          goto LABEL_32;
        }
        v16 = [v56 session];
        v17 = [v16 personaIdentifier];
        if ([v17 isEqualToString:@"__defaultPersonaID__"])
        {
        }
        else
        {
          v20 = [v56 session];
          id v21 = [v20 personaIdentifier];

          if (v21)
          {
            int v22 = 0;
            goto LABEL_23;
          }
        }
        if (brc_attributesValues_lookup____personaOnceToken != -1) {
          dispatch_once(&brc_attributesValues_lookup____personaOnceToken, &__block_literal_global_52);
        }
        id v21 = (id)brc_attributesValues_lookup____personalPersona;
        int v22 = 1;
LABEL_23:
        v23 = [MEMORY[0x1E4FB36F8] sharedManager];
        v24 = [v23 currentPersona];

        id v58 = 0;
        id v25 = [v24 userPersonaUniqueString];
        v26 = v25;
        if (v25 == v21 || ([v25 isEqualToString:v21] & 1) != 0)
        {
          v27 = 0;
        }
        else
        {
          if (voucher_process_can_use_arbitrary_personas())
          {
            id v57 = 0;
            v34 = (void *)[v24 copyCurrentPersonaContextWithError:&v57];
            id v35 = v57;
            id v36 = v58;
            id v58 = v34;

            if (v35)
            {
              v37 = brc_bread_crumbs();
              v38 = brc_default_log();
              if (os_log_type_enabled(v38, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v65 = (uint64_t)v35;
                __int16 v66 = 2112;
                id v67 = v37;
                _os_log_error_impl(&dword_1D353B000, v38, (os_log_type_t)0x90u, "[ERROR] won't restore persona: %@%@", buf, 0x16u);
              }
            }
            v27 = [v24 generateAndRestorePersonaContextWithPersonaUniqueString:v21];

            if (!v27) {
              goto LABEL_26;
            }
            v39 = brc_bread_crumbs();
            v40 = brc_default_log();
            if (os_log_type_enabled(v40, (os_log_type_t)0x90u))
            {
              v41 = [v56 session];
              uint64_t v42 = [v41 personaIdentifier];
              *(_DWORD *)buf = v49;
              uint64_t v65 = v42;
              __int16 v66 = 2112;
              id v67 = v27;
              __int16 v68 = 2112;
              v69 = v39;
              v50 = (void *)v42;
              _os_log_error_impl(&dword_1D353B000, v40, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
            }
          }
          else
          {
            if (!v22 || ([v24 isDataSeparatedPersona] & 1) != 0)
            {
              v43 = brc_bread_crumbs();
              v44 = brc_default_log();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v65 = (uint64_t)v43;
                _os_log_debug_impl(&dword_1D353B000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", buf, 0xCu);
              }

              v27 = [MEMORY[0x1E4F28C58] errorWithDomain:v51 code:22 userInfo:0];
              goto LABEL_26;
            }
            v39 = brc_bread_crumbs();
            v40 = brc_default_log();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v65 = (uint64_t)v39;
              _os_log_debug_impl(&dword_1D353B000, v40, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", buf, 0xCu);
            }
            v27 = 0;
          }
        }
LABEL_26:
        v28 = [v56 byIDLocalItem];
        v29 = v28;
        if (v28)
        {
          id v30 = v28;
        }
        else
        {
          id v30 = [v56 faultedLocalItem];
        }
        v31 = v30;

        v32 = [v56 db];
        v14 = v15(v31, v32);

        _BRRestorePersona();
LABEL_30:
        if (v14)
        {
          [v53 setObject:v14 forKeyedSubscript:v11];
          goto LABEL_35;
        }
LABEL_32:
        v14 = brc_bread_crumbs();
        v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v65 = (uint64_t)v11;
          __int16 v66 = 2112;
          id v67 = v14;
          _os_log_debug_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] No value for attribute: %@%@", buf, 0x16u);
        }

LABEL_35:
        ++v9;
      }
      while (v55 != v9);
      uint64_t v45 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
      uint64_t v55 = v45;
    }
    while (v45);
  }

  v46 = brc_bread_crumbs();
  v47 = brc_default_log();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
    -[NSURL(BRCUbiquitousAttributes) brc_attributesValues:lookup:]();
  }

  return v53;
}

- (void)brc_attributesValues:()BRCUbiquitousAttributes lookup:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] returning %@%@", v1, 0x16u);
}

@end