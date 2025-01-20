@interface NSArray
@end

@implementation NSArray

uint64_t __32__NSArray_HealthKit__hk_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __37__NSArray_HKUUID__hk_dataForAllUUIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __44__NSArray_HealthKit__hk_foldRightFrom_with___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return MEMORY[0x1F41817F8]();
}

void __137__NSArray_HealthKit__hk_partitionArrayWithPartitionSetupBlock_partitionMembershipCheckBlock_partitionExtendBlock_partitionFinalizeBlock___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
  {
    (*(void (**)(void))(a1[4] + 16))();
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
  }
  if (((*(uint64_t (**)(void))(a1[5] + 16))() & 1) == 0)
  {
    (*(void (**)(void))(a1[6] + 16))();
    (*(void (**)(void))(a1[4] + 16))();
  }
  (*(void (**)(void))(a1[7] + 16))();
}

uint64_t __41__NSArray_HealthKit__hk_mapToDictionary___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3) {
      return [*(id *)(result + 32) setObject:a3 forKeyedSubscript:a2];
    }
  }
  return result;
}

uint64_t __56__NSArray_HealthKit__hk_enumeratePermutationsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return 1;
}

void __50__NSArray_HKCodedObject__codingsForKeyPath_error___block_invoke(uint64_t a1, void *a2, unsigned __int8 a3, unsigned char *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if ([v7 conformsToProtocol:*(void *)(a1 + 32)])
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v9 + 40);
    v10 = [v7 codingsForKeyPath:v8 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    if (v10)
    {
      v22 = a4;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
            id v23 = *(id *)(v17 + 40);
            v18 = [v16 indexableObjectCollectingPushingIndex:a3 error:&v23];
            objc_storeStrong((id *)(v17 + 40), v23);
            if (!v18)
            {
              unsigned char *v22 = 1;
              goto LABEL_14;
            }
            [*(id *)(a1 + 48) addObject:v18];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    else
    {
      *a4 = 1;
    }
  }
  else
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Loop object %@ does not conform to HKCodedObject protocol", NSClassFromString((NSString *)v7));
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    *a4 = 1;
  }
}

void __57__NSArray_HKCodedObject__applyConcepts_forKeyPath_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 conformsToProtocol:&unk_1EECEB508])
  {
    id v8 = v7;
    uint64_t v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v11 + 40);
    char v12 = [v8 applyConcepts:v9 forKeyPath:v10 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);

    if ((v12 & 1) == 0) {
      *a4 = 1;
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Loop object %@ does not conform to HKCodedObject protocol", NSClassFromString((NSString *)v7));
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *a4 = 1;
  }
}

@end