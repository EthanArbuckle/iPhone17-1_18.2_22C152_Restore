@interface GEOMapDataSubscriptionBatchTileRequester
@end

@implementation GEOMapDataSubscriptionBatchTileRequester

void __166___GEOMapDataSubscriptionBatchTileRequester_initWithSubscription_diskCache_reason_auditToken_requestOptions_manifestManager_log_logPrefix_tileRequesterCreationBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  BOOL v7 = a2 == 4;
  v8 = *(void **)(*(void *)(a1 + 32) + 232);
  id v9 = a3;
  v10 = [v8 region];
  GEOTileKeyEnumeratorForRegion(v10, v9, v7);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) addObject:v21];
  v11 = *(void **)(a1 + 48);
  v12 = [NSNumber numberWithUnsignedInteger:a2];
  v13 = [v11 objectForKeyedSubscript:v12];

  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA48] array];
    v15 = *(void **)(a1 + 48);
    v16 = [NSNumber numberWithUnsignedInteger:a2];
    [v15 setObject:v14 forKeyedSubscript:v16];
  }
  v17 = *(void **)(a1 + 48);
  v18 = [NSNumber numberWithUnsignedInteger:a2];
  v19 = [v17 objectForKeyedSubscript:v18];
  v20 = [NSNumber numberWithUnsignedInt:a4];
  [v19 addObject:v20];
}

void __82___GEOMapDataSubscriptionBatchTileRequester_determineNextBatchWithQueue_callback___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82___GEOMapDataSubscriptionBatchTileRequester_determineNextBatchWithQueue_callback___block_invoke_2;
  v3[3] = &unk_1E53EA428;
  id v7 = *(id *)(a1 + 64);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async(v2, v3);
}

uint64_t __82___GEOMapDataSubscriptionBatchTileRequester_determineNextBatchWithQueue_callback___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

unint64_t __113___GEOMapDataSubscriptionBatchTileRequester__addMoreKeysToListIfNeeded_cachedETags_cachedData_completionHandler___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  [*(id *)(a1 + 32) addKey:a2];
  unint64_t result = [*(id *)(a1 + 32) count];
  *a3 = result >= *(void *)(a1 + 40);
  return result;
}

uint64_t __113___GEOMapDataSubscriptionBatchTileRequester__addMoreKeysToListIfNeeded_cachedETags_cachedData_completionHandler___block_invoke_28(uint64_t a1, uint64_t a2, void *a3, char a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "completedUnitCount") + 1);
LABEL_7:
    [*(id *)(a1 + 56) addKey:a2];
    goto LABEL_8;
  }
  if ((a4 & 1) == 0)
  {
    if (v10)
    {
      [*(id *)(a1 + 40) setObject:v10 forKey:a2];
      [*(id *)(a1 + 48) setObject:v9 forKey:a2];
    }
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "completedUnitCount") + 1);
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 184);
  v14 = [*(id *)(v12 + 232) identifier];
  [v13 trackSubscriptionAssociationForKey:a2 subscriptionIdentifier:v14];

LABEL_8:
  return 1;
}

uint64_t __113___GEOMapDataSubscriptionBatchTileRequester__addMoreKeysToListIfNeeded_cachedETags_cachedData_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _addMoreKeysToListIfNeeded:*(void *)(a1 + 40) cachedETags:*(void *)(a1 + 48) cachedData:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
  }
}

@end