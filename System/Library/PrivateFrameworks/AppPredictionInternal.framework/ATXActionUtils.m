@interface ATXActionUtils
@end

@implementation ATXActionUtils

uint64_t __52___ATXActionUtils_limitParameterCombinations_limit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 >= [v5 count])
  {
    unint64_t v8 = [v4 count];
    if (v8 <= [v5 count])
    {
      v9 = [v4 allObjects];
      v10 = [v9 sortedArrayUsingSelector:sel_compare_];

      v11 = [v5 allObjects];
      v12 = [v11 sortedArrayUsingSelector:sel_compare_];

      if ([v10 count])
      {
        uint64_t v13 = 0;
        while (1)
        {
          v14 = [v10 objectAtIndexedSubscript:v13];
          v15 = [v12 objectAtIndexedSubscript:v13];
          uint64_t v7 = [v14 compare:v15];

          if (v7) {
            break;
          }
          if ([v10 count] <= (unint64_t)++v13) {
            goto LABEL_9;
          }
        }
      }
      else
      {
LABEL_9:
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __49___ATXActionUtils_slotSetsForAction_intentCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([v6 containsObject:@"buckets"] & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

BOOL __49___ATXActionUtils_filterContainersWithNilAction___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 scoredAction];
  BOOL v3 = v2 != 0;

  return v3;
}

void __66___ATXActionUtils_fetchDataAndUpdateContentAttributeSetForAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_action_prediction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66___ATXActionUtils_fetchDataAndUpdateContentAttributeSetForAction___block_invoke_cold_1((uint64_t)v3, v4);
  }

  if ([v3 count])
  {
    id v5 = [v3 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      if ([v6 count])
      {
        uint64_t v7 = [v6 objectAtIndexedSubscript:0];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
          v9 = [*(id *)(a1 + 32) contentAttributeSet];
          [v9 setThumbnailURL:v8];
        }
      }
      if ((unint64_t)[v6 count] >= 2)
      {
        v10 = [v6 objectAtIndexedSubscript:1];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [*(id *)(a1 + 32) contentAttributeSet];
          [v11 setContentDescription:v10];
        }
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __87___ATXActionUtils_actionKeyFilterForCandidateBundleIds_candidateActionTypes_blacklist___block_invoke(void *a1, uint64_t a2)
{
  id v3 = +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:a2];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 first];
    id v6 = [v4 second];
    uint64_t v7 = (void *)a1[4];
    if (v7 && ![v7 containsObject:v5]
      || (unint64_t v8 = (void *)a1[5]) != 0 && ![v8 containsObject:v6])
    {
      uint64_t v10 = 0;
    }
    else
    {
      v9 = (void *)a1[6];
      if (v9) {
        uint64_t v10 = [v9 shouldPredictBundleId:v5 action:v6];
      }
      else {
        uint64_t v10 = 1;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __54___ATXActionUtils_atxActionsFromProactiveSuggestions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) atxActionFromProactiveSuggestion:a2];
}

void __66___ATXActionUtils_fetchDataAndUpdateContentAttributeSetForAction___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "CBE: attributeValues: %@", (uint8_t *)&v2, 0xCu);
}

@end