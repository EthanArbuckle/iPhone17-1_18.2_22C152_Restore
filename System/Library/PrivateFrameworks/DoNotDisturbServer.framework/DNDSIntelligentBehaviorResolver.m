@interface DNDSIntelligentBehaviorResolver
- (int64_t)intelligentInterruptionBehaviorForClientEventDetails:(id)a3;
- (int64_t)llmIntelligentBehavior:(id)a3;
@end

@implementation DNDSIntelligentBehaviorResolver

- (int64_t)intelligentInterruptionBehaviorForClientEventDetails:(id)a3
{
  id v4 = a3;
  v5 = [v4 forwardingBehavior];

  if (v5)
  {
    v6 = [v4 forwardingBehavior];
    int64_t v7 = [v6 intelligentBehavior];
  }
  else if (+[DNDSPlatformEligibility isIntelligenceAvailable])
  {
    int64_t v7 = [(DNDSIntelligentBehaviorResolver *)self llmIntelligentBehavior:v4];
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (int64_t)llmIntelligentBehavior:(id)a3
{
  id v3 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 1;
  id v4 = objc_alloc_init(MEMORY[0x1E4F23830]);
  [v4 setLive:0];
  [v4 setFetchAttributes:&unk_1F2A5E008];
  v5 = NSString;
  v6 = [v3 bundleIdentifier];
  int64_t v7 = [v3 identifier];
  v8 = [v5 stringWithFormat:@"%@:%@", v6, v7];

  v9 = NSString;
  v10 = [v3 bundleIdentifier];
  v11 = [v9 stringWithFormat:@"%@ == %@ && %@ == %@", *MEMORY[0x1E4F22D28], @"com.apple.usernotifications", *MEMORY[0x1E4F22C98], v10];

  v12 = [NSString stringWithFormat:@"%@ == \"%@\"", *MEMORY[0x1E4F23670], v8];
  [v4 setFilterQuery:v12];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v11 queryContext:v4];
  if (v13)
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__6;
    v25[4] = __Block_byref_object_dispose__6;
    id v26 = [MEMORY[0x1E4F1C978] array];
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    [v13 setBundleIDs:&unk_1F2A5E020];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __58__DNDSIntelligentBehaviorResolver_llmIntelligentBehavior___block_invoke;
    v24[3] = &unk_1E69742C8;
    v24[4] = v25;
    [v13 setFoundItemsHandler:v24];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__DNDSIntelligentBehaviorResolver_llmIntelligentBehavior___block_invoke_2;
    v19[3] = &unk_1E69742F0;
    v22 = v25;
    id v20 = v3;
    v23 = &v27;
    v15 = v14;
    v21 = v15;
    [v13 setCompletionHandler:v19];
    [v13 start];
    dispatch_time_t v16 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v15, v16);

    _Block_object_dispose(v25, 8);
  }
  int64_t v17 = v28[3];

  _Block_object_dispose(&v27, 8);
  return v17;
}

void __58__DNDSIntelligentBehaviorResolver_llmIntelligentBehavior___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 count])
  {
    uint64_t v3 = [v6 copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

void __58__DNDSIntelligentBehaviorResolver_llmIntelligentBehavior___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
    {
      if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] < 2)
      {
        v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) firstObject];
        int64_t v7 = v13;
        if (!v13
          || ([v13 attributeSet],
              dispatch_semaphore_t v14 = objc_claimAutoreleasedReturnValue(),
              [v14 isUrgent],
              v8 = objc_claimAutoreleasedReturnValue(),
              v14,
              !v8))
        {
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          goto LABEL_18;
        }
        int v15 = [v8 BOOLValue];
        uint64_t v16 = 2;
        if (!v15) {
          uint64_t v16 = 3;
        }
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v16;
LABEL_16:

LABEL_18:
        goto LABEL_19;
      }
      v5 = (void *)DNDSLogResolver;
      if (!os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      id v6 = *(void **)(a1 + 32);
      int64_t v7 = v5;
      v8 = [v6 identifier];
      v9 = [*(id *)(a1 + 32) bundleIdentifier];
      int v17 = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      v10 = "Intelligent interruption spotlight query found more than one match for %@, %@";
    }
    else
    {
      v11 = (void *)DNDSLogResolver;
      if (!os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      v12 = *(void **)(a1 + 32);
      int64_t v7 = v11;
      v8 = [v12 identifier];
      v9 = [*(id *)(a1 + 32) bundleIdentifier];
      int v17 = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      v10 = "Intelligent interruption spotlight query found no matches for %@, %@";
    }
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, 0x16u);

    goto LABEL_16;
  }
  uint64_t v4 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v3;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Intelligent interruption spotlight query | Error: %@", (uint8_t *)&v17, 0xCu);
  }
LABEL_19:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end