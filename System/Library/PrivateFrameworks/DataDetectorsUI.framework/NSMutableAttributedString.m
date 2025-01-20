@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

void __129__NSMutableAttributedString_DataDetectorsSupport__dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 type];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F5F0A0]];

    if (v6)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v7 = objc_msgSend(v4, "subResults", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(a1 + 32), "dd_urlifyResult:withBlock:referenceDate:context:", *(void *)(*((void *)&v16 + 1) + 8 * i), *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48));
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "dd_urlifyResult:withBlock:referenceDate:context:", v4, *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48)))
    {
      if (*(unsigned char *)(a1 + 72))
      {
        [v4 coreResult];
        if (DDResultGetCategory() == 4)
        {
          v12 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          if (!v12)
          {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
            v15 = *(void **)(v14 + 40);
            *(void *)(v14 + 40) = v13;

            v12 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          }
          [v12 addObject:v4];
        }
      }
    }
  }
}

void __95__NSMutableAttributedString_DataDetectorsSupport__dd_appendUrl_context_range_backedAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    v4 = [*(id *)(a1 + 32) scheme];
    if ([v4 isEqualToString:*MEMORY[0x1E4F5F140]])
    {
      uint64_t v23 = a3;
      uint64_t v24 = a4;

LABEL_8:
      id v13 = [v8 objectForKeyedSubscript:@"DDAttributeBackup"];

      if (!v13)
      {
        v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v22 = a1;
        id v14 = *(id *)(a1 + 40);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v26 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              v20 = [v8 objectForKeyedSubscript:v19];
              if (v20)
              {
                [v4 setObject:v20 forKeyedSubscript:v19];
              }
              else
              {
                uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
                [v4 setObject:v21 forKeyedSubscript:v19];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v16);
        }

        objc_msgSend(*(id *)(v22 + 48), "addAttribute:value:range:", @"DDAttributeBackup", v4, v23, v24);
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
  uint64_t v10 = [v8 valueForKey:*MEMORY[0x1E4F5F118]];
  if (v10)
  {
    uint64_t v23 = a3;
    uint64_t v24 = a4;
    v11 = [v8 valueForKey:@"DDFoundExistingLink"];
    char v12 = [v11 BOOLValue];

    if (v9) {
    if (v12)
    }
      goto LABEL_22;
    goto LABEL_8;
  }

  if (v9) {
LABEL_21:
  }

LABEL_22:
}

uint64_t __99__NSMutableAttributedString_DataDetectorsSupport__dd_urlifyResult_withBlock_referenceDate_context___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    result = objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", @"DDFoundExistingLink", MEMORY[0x1E4F1CC38], a3, a4);
    *a5 = 1;
  }
  return result;
}

void __67__NSMutableAttributedString_DataDetectorsSupport__dd_resetResults___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = *MEMORY[0x1E4F42530];
  uint64_t v9 = [v7 valueForKey:*MEMORY[0x1E4F42530]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
  }
  else
  {
    id v10 = v9;
  }
  v11 = v10;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v12 = [v11 scheme];
    if ([v12 isEqualToString:*MEMORY[0x1E4F5F140]])
    {
LABEL_9:

LABEL_19:
      uint64_t v21 = [v7 objectForKeyedSubscript:@"DDAttributeBackup"];
      [*(id *)(a1 + 32) removeAllObjects];
      [*(id *)(a1 + 40) removeAllObjects];
      id v44 = v7;
      v46 = v21;
      v42 = v9;
      v43 = v11;
      if (v21)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v41 = v8;
          uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          uint64_t v23 = [v21 keyEnumerator];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v51 objects:v56 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v52;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v52 != v26) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v28 = *(void *)(*((void *)&v51 + 1) + 8 * i);
                v29 = [v46 objectForKeyedSubscript:v28];
                if ([v29 isEqual:v22]) {
                  [*(id *)(a1 + 32) addObject:v28];
                }
                else {
                  [*(id *)(a1 + 40) setObject:v29 forKeyedSubscript:v28];
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v51 objects:v56 count:16];
            }
            while (v25);
          }

          v11 = v43;
          id v7 = v44;
          uint64_t v8 = v41;
        }
        [*(id *)(a1 + 32) addObject:@"DDAttributeBackup"];
      }
      if (v11) {
        [*(id *)(a1 + 32) addObject:v8];
      }
      uint64_t v30 = [v7 objectForKeyedSubscript:@"DDContext"];
      if (v30) {
        [*(id *)(a1 + 32) addObject:@"DDContext"];
      }
      if (!*(unsigned char *)(a1 + 64))
      {
        [*(id *)(a1 + 32) addObject:*MEMORY[0x1E4F5F118]];
        [*(id *)(a1 + 32) addObject:@"DDFoundExistingLink"];
      }
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v31 = *(id *)(a1 + 32);
      uint64_t v32 = [v31 countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v48 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = *(void *)(*((void *)&v47 + 1) + 8 * j);
            if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
            {
              [*(id *)(a1 + 48) beginEditing];
              *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
            }
            objc_msgSend(*(id *)(a1 + 48), "removeAttribute:range:", v36, a3, a4);
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v47 objects:v55 count:16];
        }
        while (v33);
      }

      v11 = v43;
      id v7 = v44;
      uint64_t v9 = v42;
      if ([*(id *)(a1 + 40) count])
      {
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {
          [*(id *)(a1 + 48) beginEditing];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
        objc_msgSend(*(id *)(a1 + 48), "addAttributes:range:", *(void *)(a1 + 40), a3, a4);
      }

      v20 = v46;
      goto LABEL_53;
    }
    id v13 = [v11 scheme];
    if ([v13 isEqualToString:@"x-apple-data-detectors-clientdefined"])
    {

      goto LABEL_9;
    }
    v39 = v13;
    v40 = v12;
    char v14 = 1;
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F5F118], v39);
  }
  else
  {
    char v14 = 0;
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F5F118], v37);
  uint64_t v15 = };
  if (!v15) {
    goto LABEL_14;
  }
  uint64_t v16 = (void *)v15;
  uint64_t v17 = v8;
  long long v18 = v9;
  uint64_t v19 = [v7 objectForKeyedSubscript:@"DDFoundExistingLink"];
  if ([v19 BOOLValue])
  {

    uint64_t v9 = v18;
LABEL_14:
    if (v14)
    {

      v20 = v40;
LABEL_53:

      goto LABEL_54;
    }
    goto LABEL_54;
  }
  char v45 = dd_urlLooksSuspicious(v11);

  if (v14)
  {
  }
  uint64_t v9 = v18;
  uint64_t v8 = v17;
  if ((v45 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_54:
}

void __67__NSMutableAttributedString_DataDetectorsSupport__dd_resetResults___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v8 = v7;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      [*(id *)(a1 + 32) beginEditing];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *(void *)(a1 + 40), a3, a4);
    id v7 = v8;
  }
}

uint64_t __86__NSMutableAttributedString_DataDetectorsSupport__dd_urlifyClientRange_index_context___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void __129__NSMutableAttributedString_DataDetectorsSupport__dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __129__NSMutableAttributedString_DataDetectorsSupport__dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___block_invoke_2_cold_1(v2);
  }
  double Helper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics = gotLoadHelper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics(v3);
  objc_msgSend(*(id *)(v5 + 2744), "shownViaDataDetectorsLinkInApp:", 2, Helper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics);
}

id __109__NSMutableAttributedString_DataDetectorsSupport__dd_replaceResultAttributesWithSimpleLinksForTypes_context___block_invoke(uint64_t a1, void *a2)
{
  int Category = DDResultGetCategory();
  if (Category == 1)
  {
    if ((*(unsigned char *)(a1 + 32) & 2) == 0) {
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v9 = (void *)DDResultCopyExtractedURL();
    goto LABEL_11;
  }
  if (Category != 2)
  {
    if (Category == 3 && (*(unsigned char *)(a1 + 32) & 4) != 0)
    {
      uint64_t v5 = DDMapURLForResult(a2);
      if (v5)
      {
        int v6 = (void *)v5;
        id v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        id v8 = [v7 URLOverrideForURL:v6];
      }
      else
      {
        id v8 = 0;
      }
      uint64_t v9 = [v8 absoluteString];

      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (*(unsigned char *)(a1 + 32)) {
    goto LABEL_8;
  }
LABEL_10:
  uint64_t v9 = 0;
LABEL_11:
  return v9;
}

void __129__NSMutableAttributedString_DataDetectorsSupport__dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___block_invoke_2_cold_1(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 matchedString];
  OUTLINED_FUNCTION_2_3();
  uint64_t v6 = v3;
  __int16 v7 = v4;
  id v8 = a1;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Date/time result(s) haven't been registered before for being shown (in cache %p). Will log Display event for result '%@': %@ #DDUINLEventMetrics", v5, 0x20u);
}

@end