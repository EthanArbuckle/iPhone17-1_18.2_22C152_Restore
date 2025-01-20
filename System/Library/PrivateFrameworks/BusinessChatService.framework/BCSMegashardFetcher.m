@interface BCSMegashardFetcher
- (BCSMegashardFetcher)initWithShardType:(int64_t)a3 configCache:(id)a4 shardCache:(id)a5 shardCacheSkipper:(id)a6 shardInstantiator:(id)a7 megashardRemoteFetcher:(id)a8 userDefaults:(id)a9 metricFactory:(id)a10;
- (void)addFetchTrigger:(id)a3;
@end

@implementation BCSMegashardFetcher

- (BCSMegashardFetcher)initWithShardType:(int64_t)a3 configCache:(id)a4 shardCache:(id)a5 shardCacheSkipper:(id)a6 shardInstantiator:(id)a7 megashardRemoteFetcher:(id)a8 userDefaults:(id)a9 metricFactory:(id)a10
{
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v24 = a9;
  id v17 = a10;
  v30.receiver = self;
  v30.super_class = (Class)BCSMegashardFetcher;
  v18 = [(BCSMegashardFetcher *)&v30 init];
  v19 = v18;
  if (v18)
  {
    v18->_shardType = a3;
    if ((unint64_t)(a3 - 2) > 3) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = qword_215570A58[a3 - 2];
    }
    v18->_type = v20;
    objc_storeStrong((id *)&v18->_configCache, a4);
    objc_storeStrong((id *)&v19->_shardCache, a5);
    objc_storeStrong((id *)&v19->_shardCacheSkipper, a6);
    objc_storeStrong((id *)&v19->_megashardRemoteFetcher, a8);
    objc_storeStrong((id *)&v19->_shardInstantiator, a7);
    objc_storeStrong((id *)&v19->_userDefaults, a9);
    objc_storeStrong((id *)&v19->_metricFactory, a10);
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9C0], "set", v24, v25, v26, v27, v28, v29);
    triggers = v19->_triggers;
    v19->_triggers = (NSMutableSet *)v21;
  }
  return v19;
}

- (void)addFetchTrigger:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [v4 description];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __39__BCSMegashardFetcher_addFetchTrigger___block_invoke;
  v12 = &unk_264248860;
  objc_copyWeak(&v15, &location);
  id v6 = v5;
  id v13 = v6;
  v14 = self;
  [v4 scheduleFetchBlock:&v9];
  if (self) {
    triggers = self->_triggers;
  }
  else {
    triggers = 0;
  }
  v8 = triggers;
  -[NSMutableSet addObject:](v8, "addObject:", v4, v9, v10, v11, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __39__BCSMegashardFetcher_addFetchTrigger___block_invoke(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
  uint64_t v10 = ABSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (WeakRetained) {
      uint64_t v12 = *((void *)WeakRetained + 2);
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = NSStringFromBCSShardType(v12);
    v14 = NSStringFromBCSFetchReason(a3);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    v56 = v14;
    _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%@ triggered a fetch of the megashard for type %{public}@ - %{public}@", buf, 0x20u);
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (!v15) {
    goto LABEL_31;
  }
  uint64_t v16 = *(void *)(v15 + 16);
  id v17 = *(id *)(v15 + 40);
  v18 = v17;
  unint64_t v19 = v16 - 2;
  uint64_t v20 = (unint64_t)(v16 - 2) > 3 ? 1 : qword_215570A58[v19];
  char v21 = [v17 shouldSkipCacheForShardItemOfType:v20];

  if (a3 != 6
    || (v21 & 1) != 0
    || ![*(id *)(v15 + 32) countOfShardsOfType:v16]
    || [*(id *)(v15 + 32) countOfExpiredShardsOfType:v16] > 0)
  {
    goto LABEL_15;
  }
  id v42 = *(id *)(v15 + 24);
  v43 = v42;
  uint64_t v44 = v19 > 3 ? 1 : qword_215570A58[v19];
  v45 = [v42 configItemForType:v44];

  if (!v45 || (int v46 = [v45 isExpired], v45, v46))
  {
LABEL_15:
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __39__BCSMegashardFetcher_addFetchTrigger___block_invoke_10;
    v50[3] = &unk_264248838;
    id v51 = v8;
    v22 = v50;
    if (WeakRetained)
    {
      uint64_t v23 = *((void *)WeakRetained + 1);
      id v24 = *((id *)WeakRetained + 9);
      id v25 = v7;
      id v26 = [v24 megashardFetchMetricForType:v23];

      unint64_t v27 = *((void *)WeakRetained + 1) - 1;
      if (v27 > 3 || ([*((id *)WeakRetained + 8) doubleForKey:off_264248920[v27]], v28 == 0.0))
      {
        uint64_t v29 = -1;
      }
      else
      {
        double v40 = v28;
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        uint64_t v29 = (uint64_t)((v41 - v40) / 60.0 / 60.0);
      }
      id v49 = v8;
      [v26 setHoursSinceLastSuccessfulFetch:v29];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke;
      v56 = &unk_264248888;
      id v57 = WeakRetained;
      id v58 = v26;
      unint64_t v60 = a3;
      v59 = v22;
      id v30 = v26;
      v31 = (void *)MEMORY[0x2166BDB40](buf);
      unint64_t v32 = *((void *)WeakRetained + 2) - 2;
      id v33 = v7;
      if (v32 > 3) {
        uint64_t v34 = 1;
      }
      else {
        uint64_t v34 = qword_215570A58[v32];
      }
      v35 = (void *)MEMORY[0x263F086E0];
      id v36 = *((id *)WeakRetained + 6);
      v37 = [v35 mainBundle];
      v38 = [v37 bundleIdentifier];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke_2;
      v52[3] = &unk_264248900;
      id v53 = v31;
      uint64_t v54 = v34;
      v52[4] = WeakRetained;
      id v39 = v31;
      [v36 fetchMegashardItemWithType:v34 clientBundleID:v38 systemTask:v25 completion:v52];

      id v7 = v33;
      id v8 = v49;
    }
  }
  else
  {
LABEL_31:
    v47 = ABSLogCommon();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v48 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v48;
      _os_log_impl(&dword_2154F4000, v47, OS_LOG_TYPE_DEFAULT, "%@ Megashard fetch not required. Bailing.", buf, 0xCu);
    }

    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

uint64_t __39__BCSMegashardFetcher_addFetchTrigger___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = *(void *)(v4 + 8);
    id v7 = a3;
    switch(v6)
    {
      case 1:
        if (a2)
        {
          id v8 = *(void **)(v4 + 64);
          uint64_t v9 = (void *)MEMORY[0x263EFF910];
          id v10 = v8;
          [v9 timeIntervalSinceReferenceDate];
          uint64_t v11 = @"BCSMegashardPrefetchLastSuccessfulFetchChatSuggest";
          goto LABEL_11;
        }
        break;
      case 2:
        if (a2)
        {
          uint64_t v12 = *(void **)(v4 + 64);
          id v13 = (void *)MEMORY[0x263EFF910];
          id v10 = v12;
          [v13 timeIntervalSinceReferenceDate];
          uint64_t v11 = @"BCSMegashardPrefetchLastSuccessfulFetchBusinessLink";
          goto LABEL_11;
        }
        break;
      case 3:
        if (a2)
        {
          v14 = *(void **)(v4 + 64);
          uint64_t v15 = (void *)MEMORY[0x263EFF910];
          id v10 = v14;
          [v15 timeIntervalSinceReferenceDate];
          uint64_t v11 = @"BCSMegashardPrefetchLastSuccessfulFetchBusinessCaller";
          goto LABEL_11;
        }
        break;
      case 4:
        if (a2)
        {
          uint64_t v16 = *(void **)(v4 + 64);
          id v17 = (void *)MEMORY[0x263EFF910];
          id v10 = v16;
          [v17 timeIntervalSinceReferenceDate];
          uint64_t v11 = @"BCSMegashardPrefetchLastSuccessfulFetchBusinessEmail";
LABEL_11:
          objc_msgSend(v10, "setDouble:forKey:", v11);
        }
        break;
      default:
        break;
    }
  }
  else
  {
    id v18 = a3;
  }
  [*(id *)(a1 + 40) setReason:*(void *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 40), "setErrorCode:", objc_msgSend(a3, "code"));
  [*(id *)(a1 + 40) submitForPostProcessing];
  (*(void (**)(void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a3 == 0);
}

void __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke_2(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = ABSLogCommon();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = (void *)a1[6];
      *(_DWORD *)buf = 136315650;
      v37 = "-[BCSMegashardFetcher _fetchMegashardForReason:withBGSystemTask:completion:]_block_invoke";
      __int16 v38 = 2048;
      id v39 = v15;
      __int16 v40 = 2112;
      id v41 = v12;
      _os_log_error_impl(&dword_2154F4000, v14, OS_LOG_TYPE_ERROR, "%s failed to prefetch bloom filter + config item for type:%ld error: %@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = NSStringFromBCSType(a1[6]);
      *(_DWORD *)buf = 136315394;
      v37 = "-[BCSMegashardFetcher _fetchMegashardForReason:withBGSystemTask:completion:]_block_invoke_2";
      __int16 v38 = 2112;
      id v39 = v16;
      _os_log_impl(&dword_2154F4000, v14, OS_LOG_TYPE_DEFAULT, "%s successfully prefetched bloom filter + config item for type: %@", buf, 0x16u);
    }
    uint64_t v17 = a1[4];
    if (v17) {
      id v18 = *(void **)(v17 + 24);
    }
    else {
      id v18 = 0;
    }
    [v18 updateConfigItem:v11 withType:a1[6]];
    if ([v9 count])
    {
      unint64_t v19 = a1[6] - 2;
      if (v19 > 2) {
        uint64_t v20 = 1;
      }
      else {
        uint64_t v20 = qword_215570A78[v19];
      }
      uint64_t v21 = a1[4];
      if (v21) {
        v22 = *(void **)(v21 + 32);
      }
      else {
        v22 = 0;
      }
      [v22 deleteShardItemsOfType:v20];
      uint64_t v23 = a1[4];
      if (v23) {
        id v24 = *(void **)(v23 + 32);
      }
      else {
        id v24 = 0;
      }
      [v24 beginBatch];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke_14;
      v35[3] = &unk_2642488B0;
      v35[4] = a1[4];
      v35[5] = v20;
      [v9 enumerateObjectsUsingBlock:v35];
      uint64_t v25 = a1[4];
      if (v25) {
        id v26 = *(void **)(v25 + 32);
      }
      else {
        id v26 = 0;
      }
      [v26 endBatch];
    }
    if ([v10 count])
    {
      uint64_t v27 = a1[4];
      if (v27) {
        double v28 = *(void **)(v27 + 32);
      }
      else {
        double v28 = 0;
      }
      [v28 deleteShardItemsOfType:3];
      uint64_t v29 = a1[4];
      if (v29) {
        id v30 = *(void **)(v29 + 32);
      }
      else {
        id v30 = 0;
      }
      [v30 beginBatch];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke_2_16;
      v34[3] = &unk_2642488D8;
      v34[4] = a1[4];
      [v10 enumerateObjectsUsingBlock:v34];
      uint64_t v31 = a1[4];
      if (v31) {
        unint64_t v32 = *(void **)(v31 + 32);
      }
      else {
        unint64_t v32 = 0;
      }
      [v32 endBatch];
    }
    v14 = ABSLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = NSStringFromBCSType(a1[6]);
      *(_DWORD *)buf = 136315394;
      v37 = "-[BCSMegashardFetcher _fetchMegashardForReason:withBGSystemTask:completion:]_block_invoke_3";
      __int16 v38 = 2112;
      id v39 = v33;
      _os_log_impl(&dword_2154F4000, v14, OS_LOG_TYPE_DEFAULT, "%s successfully cached bloom filter + config item for type: %@", buf, 0x16u);
    }
  }

  (*(void (**)(void))(a1[5] + 16))();
}

void __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke_14(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = (void *)MEMORY[0x2166BD910]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v5 = *(void **)(v4 + 56);
  }
  else {
    v5 = 0;
  }
  uint64_t v6 = [v5 shardItemFromURL:v9 type:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    id v8 = *(void **)(v7 + 32);
  }
  else {
    id v8 = 0;
  }
  [v8 updateShardItem:v6 withShardIdentifier:v6];
}

void __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke_2_16(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = (void *)MEMORY[0x2166BD910]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v5 = *(void **)(v4 + 56);
  }
  else {
    v5 = 0;
  }
  uint64_t v6 = [v5 shardItemFromURL:v9 type:3];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    id v8 = *(void **)(v7 + 32);
  }
  else {
    id v8 = 0;
  }
  [v8 updateShardItem:v6 withShardIdentifier:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_shardInstantiator, 0);
  objc_storeStrong((id *)&self->_megashardRemoteFetcher, 0);
  objc_storeStrong((id *)&self->_shardCacheSkipper, 0);
  objc_storeStrong((id *)&self->_shardCache, 0);

  objc_storeStrong((id *)&self->_configCache, 0);
}

@end