@interface CDIntentSpotlightIndex
@end

@implementation CDIntentSpotlightIndex

void __69___CDIntentSpotlightIndex_triggerIndexIncludingAdditions_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) indexer];
  char v3 = [v2 isIndexing];

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [v4 delay];
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    v7 = [*(id *)(a1 + 32) activityQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69___CDIntentSpotlightIndex_triggerIndexIncludingAdditions_completion___block_invoke_2;
    block[3] = &unk_1E560EFF8;
    v8 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    char v15 = *(unsigned char *)(a1 + 48);
    id v14 = v8;
    dispatch_after(v6, v7, block);
  }
  else
  {
    id v9 = v4;
    objc_sync_enter(v9);
    if ([*(id *)(a1 + 32) includeAdditions]) {
      uint64_t v10 = [*(id *)(a1 + 32) batchSize];
    }
    else {
      uint64_t v10 = 0;
    }
    id v12 = [*(id *)(a1 + 32) completion];
    [*(id *)(a1 + 32) setIncludeAdditions:0];
    [*(id *)(a1 + 32) setCompletion:0];
    objc_sync_exit(v9);

    v11 = [*(id *)(a1 + 32) indexer];
    [v11 beginIndexingWithBatchSize:v10 completion:v12];
  }
}

uint64_t __69___CDIntentSpotlightIndex_triggerIndexIncludingAdditions_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerIndexIncludingAdditions:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

@end