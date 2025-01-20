@interface CDInteractionCache
@end

@implementation CDInteractionCache

void __80___CDInteractionCache_initWithInteractionStore_size_queryPredicate_filterBlock___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 15;
    v3 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 15);
    [(os_unfair_lock_s *)v3 _refetch];
    os_unfair_lock_unlock(v2);
    WeakRetained = v3;
  }
}

void __31___CDInteractionCache__refetch__block_invoke()
{
  v0 = (void *)MEMORY[0x192FB2F20]();
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("CDInteractionCache refetch", v1);
  v3 = (void *)_refetch__pasExprOnceResult;
  _refetch__pasExprOnceResult = (uint64_t)v2;
}

void __31___CDInteractionCache__refetch__block_invoke_206(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v2 = [*(id *)(a1 + 32) interactionStore];
  v3 = [*(id *)(a1 + 32) predicate];
  v14[0] = *(void *)(a1 + 40);
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v5 = [*(id *)(a1 + 32) size];
  id v13 = 0;
  uint64_t v6 = [v2 queryInteractionsUsingPredicate:v3 sortDescriptors:v4 limit:v5 error:&v13];
  id v7 = v13;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v10 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __31___CDInteractionCache__refetch__block_invoke_206_cold_1((uint64_t)v7, v10);
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = MEMORY[0x1E4F1CBF0];
  }
}

uint64_t __76___CDInteractionCache__updateMostRecentInteractionsWithInteraction_deleted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v11 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    uint64_t v6 = v5;
    if (*(unsigned char *)(a1 + 48))
    {
      if ([*(id *)(a1 + 40) isEqual:v5])
      {
        id v7 = +[_CDUncachedSentinel sharedInstance]();
        [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v11];
      }
    }
    else if (!v5 {
           || ([v5 isUncachedSentinel] & 1) == 0
    }
           && ([v6 interactionIfCached],
               uint64_t v8 = objc_claimAutoreleasedReturnValue(),
               uint64_t v9 = _CDStartDateCompare(v8, *(void **)(a1 + 40)),
               v8,
               v9 == -1))
    {
      [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:v11];
    }

    id v4 = v11;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

void __31___CDInteractionCache__refetch__block_invoke_206_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Error fetching interactions for interaction cache: %@", (uint8_t *)&v2, 0xCu);
}

@end