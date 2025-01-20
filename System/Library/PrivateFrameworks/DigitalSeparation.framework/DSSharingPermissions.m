@interface DSSharingPermissions
+ (void)initialize;
- (BOOL)shouldAllowBundleIDWithNoPolicy:(id)a3;
- (DSMe)me;
- (DSSharingPermissions)init;
- (DSSourceRepository)repo;
- (NSArray)allPeople;
- (NSArray)allPublicSharingTypes;
- (NSArray)allReadOnlySharingPeople;
- (NSArray)allReadOnlySharingTypes;
- (NSArray)allSharingTypes;
- (NSDictionary)elapsedUnfinishedFetchesBySource;
- (NSMutableDictionary)fetchStartTimesBySource;
- (NSMutableOrderedSet)people;
- (NSMutableOrderedSet)publicSharingTypes;
- (NSMutableOrderedSet)readOnlySharingPeople;
- (NSMutableOrderedSet)readOnlySharingTypes;
- (NSMutableOrderedSet)sharingTypes;
- (NSOrderedSet)filteredPeople;
- (NSOrderedSet)filteredReadOnlySharingPeople;
- (NSOrderedSet)filteredReadOnlySharingTypes;
- (NSOrderedSet)filteredSharingTypes;
- (OS_dispatch_queue)dataUsageQueue;
- (OS_dispatch_queue)workQueue;
- (id)person:(int64_t)a3 withFilter:(BOOL)a4;
- (id)publicSharingType:(int64_t)a3;
- (id)readOnlySharingPerson:(int64_t)a3 withFilter:(BOOL)a4;
- (id)readOnlySharingType:(int64_t)a3 withFilter:(BOOL)a4;
- (id)sharingType:(int64_t)a3 withFilter:(BOOL)a4;
- (int64_t)peopleCountWithFilter:(BOOL)a3;
- (int64_t)publicSharingTypesCount;
- (int64_t)readOnlySharingPeopleCountWithFilter:(BOOL)a3;
- (int64_t)readOnlySharingTypesCountWithFilter:(BOOL)a3;
- (int64_t)sharingTypesCountWithFilter:(BOOL)a3;
- (void)_trackResourceForPublicAccess:(id)a3 source:(id)a4;
- (void)addParticipant:(id)a3 forSource:(id)a4 sharedResource:(id)a5 deviceOwnerRole:(int64_t)a6;
- (void)fetchCompletedForSource:(id)a3;
- (void)fetchPermissionsFromSources:(id)a3 includingErrors:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)fetchPermissionsOnQueue:(id)a3 completion:(id)a4;
- (void)fetchStartedForSource:(id)a3;
- (void)filterPeopleWithPredicate:(id)a3;
- (void)filterReadOnlySharingPeopleWithPredicate:(id)a3;
- (void)filterReadOnlySharingTypesWithPredicate:(id)a3;
- (void)filterSharingTypesWithPredicate:(id)a3;
- (void)removePerson:(id)a3;
- (void)removePerson:(id)a3 sources:(id)a4;
- (void)removePublicSharingType:(id)a3;
- (void)removeSharingType:(id)a3;
- (void)removeSharingType:(id)a3 people:(id)a4;
- (void)setDataUsageQueue:(id)a3;
- (void)setFetchStartTimesBySource:(id)a3;
- (void)setFilteredPeople:(id)a3;
- (void)setFilteredReadOnlySharingPeople:(id)a3;
- (void)setFilteredReadOnlySharingTypes:(id)a3;
- (void)setFilteredSharingTypes:(id)a3;
- (void)setMe:(id)a3;
- (void)setPeople:(id)a3;
- (void)setPublicSharingTypes:(id)a3;
- (void)setReadOnlySharingPeople:(id)a3;
- (void)setReadOnlySharingTypes:(id)a3;
- (void)setRepo:(id)a3;
- (void)setSharingTypes:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)sort;
- (void)stopAllSharingOnQueue:(id)a3 completion:(id)a4;
- (void)verifyDataUsagePoliciesForSources:(id)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation DSSharingPermissions

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLogSharingPermissions = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSSharingPermissions");
    MEMORY[0x270F9A758]();
  }
}

- (DSSharingPermissions)init
{
  v16.receiver = self;
  v16.super_class = (Class)DSSharingPermissions;
  v2 = [(DSSharingPermissions *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v2->_permissionsLock._os_unfair_lock_opaque = 0;
    v4 = [MEMORY[0x263EFF9B0] orderedSet];
    [(DSSharingPermissions *)v3 setPeople:v4];

    v5 = [MEMORY[0x263EFF9B0] orderedSet];
    [(DSSharingPermissions *)v3 setReadOnlySharingPeople:v5];

    v6 = [MEMORY[0x263EFF9B0] orderedSet];
    [(DSSharingPermissions *)v3 setSharingTypes:v6];

    v7 = [MEMORY[0x263EFF9B0] orderedSet];
    [(DSSharingPermissions *)v3 setPublicSharingTypes:v7];

    v8 = [MEMORY[0x263EFF9B0] orderedSet];
    [(DSSharingPermissions *)v3 setReadOnlySharingTypes:v8];

    v9 = [MEMORY[0x263EFF9A0] dictionary];
    [(DSSharingPermissions *)v3 setFetchStartTimesBySource:v9];

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.DigitalSeparation.SharingPermissions", 0);
    [(DSSharingPermissions *)v3 setWorkQueue:v10];

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.DigitalSeparation.DataUsageQueue", 0);
    [(DSSharingPermissions *)v3 setDataUsageQueue:v11];

    v12 = [(DSSharingPermissions *)v3 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__DSSharingPermissions_init__block_invoke;
    block[3] = &unk_264C9E900;
    v15 = v3;
    dispatch_async(v12, block);
  }
  return v3;
}

void __28__DSSharingPermissions_init__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(DSMe);
  [*(id *)(a1 + 32) setMe:v2];
}

- (BOOL)shouldAllowBundleIDWithNoPolicy:(id)a3
{
  id v3 = a3;
  v4 = +[DSUtilities allApps];
  BOOL v5 = ![v3 isEqualToString:@"com.apple.Health"]
    || [v4 containsObject:v3];

  return v5;
}

- (void)verifyDataUsagePoliciesForSources:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v7 = a3;
  queue = a4;
  id v36 = a5;
  v40 = [MEMORY[0x263EFF980] array];
  v41 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v58 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v15 = [v14 name];
        objc_super v16 = +[DSSourceDescriptor sourceDescriptorForSource:v15];

        v17 = [v16 dataUsageBundleIdentifier];
        if (v17
          && [(DSSharingPermissions *)self shouldAllowBundleIDWithNoPolicy:v17])
        {
          v18 = [v14 name];
          [v41 setObject:v18 forKeyedSubscript:v17];
        }
        v19 = [v14 name];
        [v8 setObject:v14 forKeyedSubscript:v19];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v11);
  }

  v20 = v41;
  if ([v41 count])
  {
    id v35 = v9;
    id v21 = objc_alloc(MEMORY[0x263F02D30]);
    v22 = [(DSSharingPermissions *)self dataUsageQueue];
    v23 = (void *)[v21 initWithQueue:v22];

    v24 = dispatch_group_create();
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obja = [v41 allKeys];
    uint64_t v25 = [obja countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v53 != v27) {
            objc_enumerationMutation(obja);
          }
          uint64_t v29 = *(void *)(*((void *)&v52 + 1) + 8 * j);
          dispatch_group_enter(v24);
          v30 = [MEMORY[0x263EFFA08] setWithObject:v29];
          v46[0] = MEMORY[0x263EF8330];
          v46[1] = 3221225472;
          v46[2] = __75__DSSharingPermissions_verifyDataUsagePoliciesForSources_queue_completion___block_invoke;
          v46[3] = &unk_264C9E928;
          id v47 = v41;
          uint64_t v48 = v29;
          id v49 = v40;
          v50 = v24;
          id v51 = v8;
          [v23 getLocalPolicies:v30 completion:v46];
        }
        uint64_t v26 = [obja countByEnumeratingWithState:&v52 objects:v61 count:16];
      }
      while (v26);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__DSSharingPermissions_verifyDataUsagePoliciesForSources_queue_completion___block_invoke_18;
    block[3] = &unk_264C9E418;
    v31 = v36;
    id v45 = v36;
    id v43 = v8;
    v32 = v40;
    id v44 = v40;
    v33 = queue;
    dispatch_group_notify(v24, queue, block);

    v20 = v41;
    id v9 = v35;
  }
  else
  {
    v34 = DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236090000, v34, OS_LOG_TYPE_INFO, "All sources have required data usage policies", buf, 2u);
    }
    v31 = v36;
    v32 = v40;
    (*((void (**)(id, id, void *))v36 + 2))(v36, v9, v40);
    v33 = queue;
  }
}

void __75__DSSharingPermissions_verifyDataUsagePoliciesForSources_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v37[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  obuint64_t j = v5;
  if (v6)
  {
    id v7 = DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_ERROR)) {
      __75__DSSharingPermissions_verifyDataUsagePoliciesForSources_queue_completion___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }
    v8 = +[DSError errorWithCode:5];
    id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    v37[0] = v8;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
    uint64_t v11 = +[DSError errorWithCode:1 sourceName:v9 underlyingErrors:v10];

    [*(id *)(a1 + 48) addObject:v11];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

    id v5 = obj;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v12 = [v5 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(obj);
          }
          objc_super v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v17 = *(void **)(a1 + 32);
          v18 = [v16 bundleId];
          v19 = [v17 objectForKeyedSubscript:v18];

          v20 = DSLogSharingPermissions;
          if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v33 = v19;
            __int16 v34 = 2114;
            id v35 = v16;
            _os_log_impl(&dword_236090000, v20, OS_LOG_TYPE_INFO, "Got data usage policy for %{public}@: %{public}@", buf, 0x16u);
          }
          id v21 = objc_msgSend(MEMORY[0x263F02C58], "ds_DataUsagePolicyWithPolicy:sourceName:", v16, v19);
          if (v21)
          {
            v22 = DSLogSharingPermissions;
            if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v33 = v21;
              __int16 v34 = 2114;
              id v35 = v19;
              _os_log_impl(&dword_236090000, v22, OS_LOG_TYPE_DEFAULT, "Required policy %{public}@ for %{public}@ not met.", buf, 0x16u);
            }
            [*(id *)(a1 + 64) setObject:0 forKeyedSubscript:v19];
            v23 = +[DSError errorWithCode:5];
            v31 = v23;
            v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
            uint64_t v25 = +[DSError errorWithCode:1 sourceName:v19 underlyingErrors:v24];

            [*(id *)(a1 + 48) addObject:v25];
          }
        }
        id v5 = obj;
        uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v13);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    id v6 = 0;
  }
}

void __75__DSSharingPermissions_verifyDataUsagePoliciesForSources_queue_completion___block_invoke_18(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) allValues];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (void)fetchPermissionsFromSources:(id)a3 includingErrors:(id)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v26 = a4;
  queue = a5;
  id v11 = a6;
  os_signpost_id_t v12 = os_signpost_id_generate((os_log_t)DSLogSharingPermissions);
  uint64_t v13 = (id)DSLogSharingPermissions;
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_236090000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "fetch", " enableTelemetry=YES ", buf, 2u);
  }

  v15 = [MEMORY[0x263EFF980] arrayWithArray:v26];
  dispatch_group_t v16 = dispatch_group_create();
  objc_initWeak(&location, self);
  v17 = DSLogSharingPermissions;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v39 = v10;
    _os_log_impl(&dword_236090000, v17, OS_LOG_TYPE_INFO, "Fetching sharing permissions from sources: %{public}@", buf, 0xCu);
  }
  size_t v18 = [v10 count];
  v19 = [(DSSharingPermissions *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke;
  block[3] = &unk_264C9E978;
  dispatch_group_t v32 = v16;
  id v33 = v10;
  id v24 = v10;
  v20 = v16;
  objc_copyWeak(&v36, &location);
  id v21 = v15;
  id v34 = v21;
  id v35 = self;
  dispatch_apply(v18, v19, block);

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_24;
  v27[3] = &unk_264C9E9A0;
  id v29 = v11;
  os_signpost_id_t v30 = v12;
  id v28 = v21;
  id v22 = v11;
  id v23 = v21;
  dispatch_group_notify(v20, queue, v27);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  id v5 = (char *)os_signpost_id_generate((os_log_t)DSLogSharingPermissions);
  id v6 = [v4 name];
  int v7 = [v6 isEqualToString:@"com.apple.DigitalSeparation.Calendars"];

  if (v7)
  {
    v8 = (id)DSLogSharingPermissions;
    id v9 = v8;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Calendars", " enableTelemetry=YES ", buf, 2u);
    }
LABEL_55:

    goto LABEL_61;
  }
  id v10 = [v4 name];
  int v11 = [v10 isEqualToString:@"com.apple.DigitalSeparation.FindMy"];

  if (v11)
  {
    os_signpost_id_t v12 = (id)DSLogSharingPermissions;
    id v9 = v12;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.FindMy", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  uint64_t v13 = [v4 name];
  int v14 = [v13 isEqualToString:@"com.apple.DigitalSeparation.Photos"];

  if (v14)
  {
    v15 = (id)DSLogSharingPermissions;
    id v9 = v15;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Photos", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  dispatch_group_t v16 = [v4 name];
  int v17 = [v16 isEqualToString:@"com.apple.DigitalSeparation.HomeKit.HomeSharing"];

  if (v17)
  {
    size_t v18 = (id)DSLogSharingPermissions;
    id v9 = v18;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Home", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  v19 = [v4 name];
  int v20 = [v19 isEqualToString:@"com.apple.DigitalSeparation.HealthKit.HealthSharing"];

  if (v20)
  {
    id v21 = (id)DSLogSharingPermissions;
    id v9 = v21;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Health", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  id v22 = [v4 name];
  int v23 = [v22 isEqualToString:@"com.apple.DigitalSeparation.Notes"];

  if (v23)
  {
    id v24 = (id)DSLogSharingPermissions;
    id v9 = v24;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Notes", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  uint64_t v25 = [v4 name];
  int v26 = [v25 isEqualToString:@"com.apple.DigitalSeparation.Zelkova"];

  if (v26)
  {
    long long v27 = (id)DSLogSharingPermissions;
    id v9 = v27;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Zelkova", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  id v28 = [v4 name];
  int v29 = [v28 isEqualToString:@"com.apple.DigitalSeparation.Fitness"];

  if (v29)
  {
    os_signpost_id_t v30 = (id)DSLogSharingPermissions;
    id v9 = v30;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Activity", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  v31 = [v4 name];
  int v32 = [v31 isEqualToString:@"com.apple.DigitalSeparation.PassKeys"];

  if (v32)
  {
    id v33 = (id)DSLogSharingPermissions;
    id v9 = v33;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Passkeys", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  id v34 = [v4 name];
  int v35 = [v34 isEqualToString:@"com.apple.DigitalSeparation.ItemSharing"];

  if (v35)
  {
    id v36 = (id)DSLogSharingPermissions;
    id v9 = v36;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.ItemSharing", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  v37 = [v4 name];
  int v38 = [v37 isEqualToString:@"com.apple.DigitalSeparation.Maps"];

  id v39 = (id)DSLogSharingPermissions;
  id v9 = v39;
  if (v38)
  {
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Maps", " enableTelemetry=YES ", buf, 2u);
    }
    goto LABEL_55;
  }
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_236090000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "fetch.Notes", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v40 = (void *)DSLogSharingPermissions;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
    __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_cold_1(v40, v4);
  }
LABEL_61:
  v41 = DSLogSharingPermissions;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    long long v55 = v4;
    _os_log_impl(&dword_236090000, v41, OS_LOG_TYPE_INFO, "Fetching sharing permissions from %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v43 = [v4 name];
  [WeakRetained fetchStartedForSource:v43];

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19;
  v47[3] = &unk_264C9E950;
  id v44 = v4;
  id v48 = v44;
  id v49 = WeakRetained;
  id v45 = *(id *)(a1 + 48);
  uint64_t v46 = *(void *)(a1 + 56);
  id v50 = v45;
  uint64_t v51 = v46;
  id v52 = *(id *)(a1 + 32);
  objc_copyWeak(v53, (id *)(a1 + 64));
  v53[1] = v5;
  [v44 fetchSharedResourcesWithCompletion:v47];
  objc_destroyWeak(v53);
}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)DSLogSharingPermissions;
  uint64_t v92 = a1;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
  {
    v8 = *(void **)(a1 + 32);
    id v9 = v7;
    id v10 = [v8 name];
    *(_DWORD *)buf = 138543875;
    v110 = v10;
    __int16 v111 = 2113;
    id v112 = v5;
    __int16 v113 = 2050;
    uint64_t v114 = [v5 count];
    _os_log_impl(&dword_236090000, v9, OS_LOG_TYPE_INFO, "Finished fetching sharing permissions from %{public}@ with %{private}@ resources (%{public}lu)", buf, 0x20u);
  }
  int v11 = *(void **)(a1 + 40);
  os_signpost_id_t v12 = (id *)(a1 + 32);
  uint64_t v13 = [*(id *)(a1 + 32) name];
  [v11 fetchCompletedForSource:v13];

  int v14 = (void *)MEMORY[0x263F087E8];
  v15 = [*(id *)(a1 + 32) name];
  dispatch_group_t v16 = objc_msgSend(v14, "ds_errorFromIgnorableError:sourceName:", v6, v15);

  if (v16)
  {
    int v17 = (void *)DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_ERROR)) {
      __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_3((void **)(a1 + 32), v17);
    }
    size_t v18 = [*(id *)(a1 + 32) name];
    v108 = v16;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v108 count:1];
    int v20 = +[DSError errorWithCode:1 sourceName:v18 underlyingErrors:v19];

    [*(id *)(a1 + 48) addObject:v20];
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v21 = v5;
  uint64_t v86 = [v21 countByEnumeratingWithState:&v101 objects:v107 count:16];
  if (v86)
  {
    uint64_t v22 = *(void *)v102;
    int v23 = (id *)(a1 + 72);
    v88 = v21;
    v89 = v16;
    uint64_t v85 = *(void *)v102;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v102 != v22) {
          objc_enumerationMutation(v21);
        }
        uint64_t v87 = v24;
        uint64_t v25 = *(void **)(*((void *)&v101 + 1) + 8 * v24);
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        objc_msgSend(v25, "participants", v85);
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = [obj countByEnumeratingWithState:&v97 objects:v106 count:16];
        if (!v26)
        {
          unint64_t v28 = 0;
          goto LABEL_30;
        }
        uint64_t v27 = v26;
        unint64_t v28 = 0;
        uint64_t v91 = *(void *)v98;
        while (2)
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v98 != v91) {
              objc_enumerationMutation(obj);
            }
            os_signpost_id_t v30 = *(void **)(*((void *)&v97 + 1) + 8 * i);
            v31 = [[DSSharingPerson alloc] initWithSource:*(void *)(a1 + 32) sharedResource:v25 participant:v30 deviceOwnerRole:v28];
            int v32 = [*(id *)(a1 + 56) me];

            if (!v32)
            {
              if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
                __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_2();
              }
              dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

              id v21 = v88;
              dispatch_group_t v16 = v89;
              goto LABEL_89;
            }
            id v33 = [*(id *)(a1 + 56) me];
            BOOL v34 = [(DSSharingPerson *)v31 isMe:v33];

            if (!v34) {
              goto LABEL_25;
            }
            uint64_t v35 = [v30 role];
            if (v35 == 2)
            {
              if (v28 == 1) {
                unint64_t v28 = 1;
              }
              else {
                unint64_t v28 = 2;
              }
LABEL_25:
              a1 = v92;
              goto LABEL_26;
            }
            a1 = v92;
            if (v35 == 1) {
              unint64_t v28 = 1;
            }
LABEL_26:
          }
          uint64_t v27 = [obj countByEnumeratingWithState:&v97 objects:v106 count:16];
          if (v27) {
            continue;
          }
          break;
        }
LABEL_30:

        if (v28 <= 1) {
          uint64_t v36 = 1;
        }
        else {
          uint64_t v36 = v28;
        }
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        v37 = [v25 participants];
        uint64_t v38 = [v37 countByEnumeratingWithState:&v93 objects:v105 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v94;
          do
          {
            for (uint64_t j = 0; j != v39; ++j)
            {
              if (*(void *)v94 != v40) {
                objc_enumerationMutation(v37);
              }
              uint64_t v42 = *(void *)(*((void *)&v93 + 1) + 8 * j);
              id WeakRetained = objc_loadWeakRetained(v23);
              [WeakRetained addParticipant:v42 forSource:*v12 sharedResource:v25 deviceOwnerRole:v36];
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v93 objects:v105 count:16];
          }
          while (v39);
        }

        a1 = v92;
        [*(id *)(v92 + 56) _trackResourceForPublicAccess:v25 source:*(void *)(v92 + 32)];
        uint64_t v24 = v87 + 1;
        id v21 = v88;
        dispatch_group_t v16 = v89;
        uint64_t v22 = v85;
      }
      while (v87 + 1 != v86);
      uint64_t v86 = [v88 countByEnumeratingWithState:&v101 objects:v107 count:16];
    }
    while (v86);
  }

  id v44 = [*v12 name];
  int v45 = [v44 isEqualToString:@"com.apple.DigitalSeparation.Calendars"];

  if (v45)
  {
    uint64_t v46 = (id)DSLogSharingPermissions;
    id v47 = v46;
    uint64_t v48 = v92;
    os_signpost_id_t v49 = *(void *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v46)) {
      goto LABEL_87;
    }
    *(_WORD *)buf = 0;
    id v50 = "fetch.Calendars";
    goto LABEL_85;
  }
  uint64_t v51 = [*v12 name];
  int v52 = [v51 isEqualToString:@"com.apple.DigitalSeparation.FindMy"];

  if (v52)
  {
    long long v53 = (id)DSLogSharingPermissions;
    id v47 = v53;
    uint64_t v48 = v92;
    os_signpost_id_t v49 = *(void *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v53)) {
      goto LABEL_87;
    }
    *(_WORD *)buf = 0;
    id v50 = "fetch.FindMy";
    goto LABEL_85;
  }
  long long v54 = [*v12 name];
  int v55 = [v54 isEqualToString:@"com.apple.DigitalSeparation.Photos"];

  if (v55)
  {
    uint64_t v56 = (id)DSLogSharingPermissions;
    id v47 = v56;
    uint64_t v48 = v92;
    os_signpost_id_t v49 = *(void *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v56)) {
      goto LABEL_87;
    }
    *(_WORD *)buf = 0;
    id v50 = "fetch.Photos";
    goto LABEL_85;
  }
  long long v57 = [*v12 name];
  int v58 = [v57 isEqualToString:@"com.apple.DigitalSeparation.HomeKit.HomeSharing"];

  if (v58)
  {
    long long v59 = (id)DSLogSharingPermissions;
    id v47 = v59;
    uint64_t v48 = v92;
    os_signpost_id_t v49 = *(void *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v59)) {
      goto LABEL_87;
    }
    *(_WORD *)buf = 0;
    id v50 = "fetch.Home";
    goto LABEL_85;
  }
  long long v60 = [*v12 name];
  int v61 = [v60 isEqualToString:@"com.apple.DigitalSeparation.HealthKit.HealthSharing"];

  if (v61)
  {
    v62 = (id)DSLogSharingPermissions;
    id v47 = v62;
    uint64_t v48 = v92;
    os_signpost_id_t v49 = *(void *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v62)) {
      goto LABEL_87;
    }
    *(_WORD *)buf = 0;
    id v50 = "fetch.Health";
    goto LABEL_85;
  }
  uint64_t v63 = [*v12 name];
  int v64 = [v63 isEqualToString:@"com.apple.DigitalSeparation.Notes"];

  if (v64)
  {
    v65 = (id)DSLogSharingPermissions;
    id v47 = v65;
    uint64_t v48 = v92;
    os_signpost_id_t v49 = *(void *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v65)) {
      goto LABEL_87;
    }
    *(_WORD *)buf = 0;
    id v50 = "fetch.Notes";
    goto LABEL_85;
  }
  v66 = [*v12 name];
  int v67 = [v66 isEqualToString:@"com.apple.DigitalSeparation.Zelkova"];

  if (v67)
  {
    v68 = (id)DSLogSharingPermissions;
    id v47 = v68;
    uint64_t v48 = v92;
    os_signpost_id_t v49 = *(void *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v68)) {
      goto LABEL_87;
    }
    *(_WORD *)buf = 0;
    id v50 = "fetch.Zelkova";
    goto LABEL_85;
  }
  v69 = [*v12 name];
  int v70 = [v69 isEqualToString:@"com.apple.DigitalSeparation.Fitness"];

  if (v70)
  {
    v71 = (id)DSLogSharingPermissions;
    id v47 = v71;
    uint64_t v48 = v92;
    os_signpost_id_t v49 = *(void *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v71)) {
      goto LABEL_87;
    }
    *(_WORD *)buf = 0;
    id v50 = "fetch.Activity";
    goto LABEL_85;
  }
  v72 = [*v12 name];
  int v73 = [v72 isEqualToString:@"com.apple.DigitalSeparation.PassKeys"];

  if (v73)
  {
    v74 = (id)DSLogSharingPermissions;
    id v47 = v74;
    uint64_t v48 = v92;
    os_signpost_id_t v49 = *(void *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v74)) {
      goto LABEL_87;
    }
    *(_WORD *)buf = 0;
    id v50 = "fetch.Passkeys";
    goto LABEL_85;
  }
  v75 = [*v12 name];
  int v76 = [v75 isEqualToString:@"com.apple.DigitalSeparation.ItemSharing"];

  if (v76)
  {
    v77 = (id)DSLogSharingPermissions;
    id v47 = v77;
    uint64_t v48 = v92;
    os_signpost_id_t v49 = *(void *)(v92 + 80);
    if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v77)) {
      goto LABEL_87;
    }
    *(_WORD *)buf = 0;
    id v50 = "fetch.ItemSharing";
LABEL_85:
    v78 = v47;
    os_signpost_id_t v79 = v49;
LABEL_86:
    _os_signpost_emit_with_name_impl(&dword_236090000, v78, OS_SIGNPOST_INTERVAL_END, v79, v50, " enableTelemetry=YES ", buf, 2u);
    goto LABEL_87;
  }
  v80 = [*(id *)(v92 + 32) name];
  int v81 = [v80 isEqualToString:@"com.apple.DigitalSeparation.Maps"];

  uint64_t v48 = v92;
  v82 = (id)DSLogSharingPermissions;
  id v47 = v82;
  os_signpost_id_t v83 = *(void *)(v92 + 80);
  if (!v81)
  {
    if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v47, OS_SIGNPOST_INTERVAL_END, v83, "fetch.Notes", " enableTelemetry=YES ", buf, 2u);
    }

    v84 = (void *)DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
      __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_1(v12, v84);
    }
    goto LABEL_88;
  }
  if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
  {
    *(_WORD *)buf = 0;
    id v50 = "fetch.Maps";
    v78 = v47;
    os_signpost_id_t v79 = v83;
    goto LABEL_86;
  }
LABEL_87:

LABEL_88:
  dispatch_group_leave(*(dispatch_group_t *)(v48 + 64));
LABEL_89:
}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_24(uint64_t a1)
{
  uint64_t v2 = (id)DSLogSharingPermissions;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_236090000, v3, OS_SIGNPOST_INTERVAL_END, v4, "fetch", " enableTelemetry=YES ", v6, 2u);
  }

  if ([*(id *)(a1 + 32) count])
  {
    id v5 = +[DSError errorWithCode:1 underlyingErrors:*(void *)(a1 + 32)];
  }
  else
  {
    id v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchPermissionsOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(DSSourceRepository);
  [(DSSharingPermissions *)self setRepo:v8];

  os_unfair_lock_lock(&self->_permissionsLock);
  id v9 = [(DSSharingPermissions *)self people];
  [v9 removeAllObjects];

  id v10 = [(DSSharingPermissions *)self readOnlySharingPeople];
  [v10 removeAllObjects];

  int v11 = [(DSSharingPermissions *)self sharingTypes];
  [v11 removeAllObjects];

  os_signpost_id_t v12 = [(DSSharingPermissions *)self publicSharingTypes];
  [v12 removeAllObjects];

  uint64_t v13 = [(DSSharingPermissions *)self readOnlySharingTypes];
  [v13 removeAllObjects];

  os_unfair_lock_unlock(&self->_permissionsLock);
  objc_initWeak(&location, self);
  int v14 = [(DSSharingPermissions *)self repo];
  v15 = [v14 sources];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __59__DSSharingPermissions_fetchPermissionsOnQueue_completion___block_invoke;
  v18[3] = &unk_264C9E9C8;
  objc_copyWeak(&v21, &location);
  id v16 = v6;
  id v19 = v16;
  id v17 = v7;
  id v20 = v17;
  [(DSSharingPermissions *)self verifyDataUsagePoliciesForSources:v15 queue:v16 completion:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __59__DSSharingPermissions_fetchPermissionsOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 48);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained fetchPermissionsFromSources:v7 includingErrors:v6 queue:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_trackResourceForPublicAccess:(id)a3 source:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 visibility] == 2) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v6 participationAccess] & 2) != 0)
  {
    id v9 = v6;

    id v8 = v9;
  }
  if (v8)
  {
    p_permissionsLock = &self->_permissionsLock;
    os_unfair_lock_lock(&self->_permissionsLock);
    int v11 = [[DSPublicSharingType alloc] initWithSource:v7];
    os_signpost_id_t v12 = [(DSSharingPermissions *)self publicSharingTypes];
    uint64_t v13 = [v12 indexOfObject:v11];

    int v14 = [(DSSharingPermissions *)self publicSharingTypes];
    v15 = v14;
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v14 addObject:v11];

      [(DSPublicSharingType *)v11 addPublicResource:v8];
      id v16 = DSLogSharingPermissions;
      if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
      {
        int v19 = 138478083;
        id v20 = v8;
        __int16 v21 = 2114;
        uint64_t v22 = v11;
        _os_log_impl(&dword_236090000, v16, OS_LOG_TYPE_INFO, "Adding public resource %{private}@ to new sharing type %{public}@", (uint8_t *)&v19, 0x16u);
      }
    }
    else
    {
      id v17 = [v14 objectAtIndexedSubscript:v13];

      [(DSPublicSharingType *)v17 addPublicResource:v8];
      size_t v18 = DSLogSharingPermissions;
      if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
      {
        int v19 = 138478083;
        id v20 = v8;
        __int16 v21 = 2114;
        uint64_t v22 = v17;
        _os_log_impl(&dword_236090000, v18, OS_LOG_TYPE_INFO, "Adding public resource %{private}@ to existing sharing type %{public}@", (uint8_t *)&v19, 0x16u);
      }
    }
    os_unfair_lock_unlock(p_permissionsLock);
  }
}

- (void)sort
{
  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  os_signpost_id_t v4 = [(DSSharingPermissions *)self people];
  [v4 sortUsingComparator:&__block_literal_global_1];

  id v5 = [(DSSharingPermissions *)self sharingTypes];
  [v5 sortUsingComparator:&__block_literal_global_33];

  id v6 = [(DSSharingPermissions *)self publicSharingTypes];
  [v6 sortUsingComparator:&__block_literal_global_36];

  os_unfair_lock_unlock(p_permissionsLock);
}

uint64_t __28__DSSharingPermissions_sort__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 score];
  if (v6 >= [v5 score])
  {
    uint64_t v8 = [v4 score];
    if (v8 <= [v5 score])
    {
      id v9 = [v4 displayName];
      id v10 = [v5 displayName];
      uint64_t v7 = [v9 localizedStandardCompare:v10];
    }
    else
    {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __28__DSSharingPermissions_sort__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 score];
  if (v6 >= [v5 score])
  {
    uint64_t v8 = [v4 score];
    if (v8 <= [v5 score])
    {
      id v9 = [v4 displayName];
      id v10 = [v5 displayName];
      uint64_t v7 = [v9 localizedStandardCompare:v10];
    }
    else
    {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __28__DSSharingPermissions_sort__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 score];
  if (v6 >= [v5 score])
  {
    uint64_t v8 = [v4 score];
    if (v8 <= [v5 score])
    {
      id v9 = [v4 displayName];
      id v10 = [v5 displayName];
      uint64_t v7 = [v9 localizedStandardCompare:v10];
    }
    else
    {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)addParticipant:(id)a3 forSource:(id)a4 sharedResource:(id)a5 deviceOwnerRole:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [[DSSharingPerson alloc] initWithSource:v11 sharedResource:v12 participant:v10 deviceOwnerRole:a6];
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __80__DSSharingPermissions_addParticipant_forSource_sharedResource_deviceOwnerRole___block_invoke;
  v23[3] = &unk_264C9EA30;
  objc_copyWeak(v29, &location);
  int v14 = v13;
  uint64_t v24 = v14;
  uint64_t v25 = self;
  id v15 = v10;
  id v26 = v15;
  id v16 = v11;
  id v27 = v16;
  id v17 = v12;
  id v28 = v17;
  v29[1] = (id)a6;
  size_t v18 = (void (**)(void))MEMORY[0x237DFC200](v23);
  int v19 = [(DSSharingPermissions *)self me];

  if (v19)
  {
    v18[2](v18);
  }
  else
  {
    id v20 = [(DSSharingPermissions *)self workQueue];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __80__DSSharingPermissions_addParticipant_forSource_sharedResource_deviceOwnerRole___block_invoke_38;
    v21[3] = &unk_264C9E4B8;
    v21[4] = self;
    uint64_t v22 = v18;
    dispatch_async(v20, v21);
  }
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
}

void __80__DSSharingPermissions_addParticipant_forSource_sharedResource_deviceOwnerRole___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) me];
  LODWORD(v3) = [v3 isMe:v4];

  if (v3)
  {
    id v5 = (void *)DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v6 = *(void **)(a1 + 56);
      uint64_t v8 = v5;
      id v9 = [v6 name];
      int v36 = 138478083;
      uint64_t v37 = v7;
      __int16 v38 = 2114;
      uint64_t v39 = v9;
      id v10 = "Skipping participant %{private}@ for source %{public}@ because they match the me card";
LABEL_9:
      _os_log_impl(&dword_236090000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v36, 0x16u);
    }
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) displayName];

    if (v11)
    {
      os_unfair_lock_lock(WeakRetained + 2);
      id v12 = (DSSharingType *)*(id *)(a1 + 32);
      uint64_t v13 = [*(id *)(a1 + 40) people];
      uint64_t v14 = [v13 indexOfObject:*(void *)(a1 + 32)];

      id v15 = [*(id *)(a1 + 40) people];
      id v16 = v15;
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v15 addObject:v12];

        id v17 = v12;
      }
      else
      {
        id v17 = [v15 objectAtIndexedSubscript:v14];

        [(DSSharingType *)v17 addSource:*(void *)(a1 + 56) sharedResource:*(void *)(a1 + 64) participant:*(void *)(a1 + 48) deviceOwnerRole:*(void *)(a1 + 80)];
        __int16 v21 = (void *)DSLogSharingPermissions;
        if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = *(void *)(a1 + 48);
          uint64_t v22 = *(void **)(a1 + 56);
          uint64_t v24 = v21;
          uint64_t v25 = [v22 name];
          int v36 = 138478339;
          uint64_t v37 = v23;
          __int16 v38 = 2114;
          uint64_t v39 = v17;
          __int16 v40 = 2114;
          v41 = v25;
          _os_log_impl(&dword_236090000, v24, OS_LOG_TYPE_INFO, "Adding participant %{private}@ to existing person %{public}@ for source %{public}@", (uint8_t *)&v36, 0x20u);
        }
      }
      id v26 = [[DSSharingType alloc] initWithSource:*(void *)(a1 + 56)];
      id v27 = [*(id *)(a1 + 40) sharingTypes];
      uint64_t v28 = [v27 indexOfObject:v26];

      int v29 = [*(id *)(a1 + 40) sharingTypes];
      os_signpost_id_t v30 = v29;
      if (v28 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v29 addObject:v26];

        [(DSSharingType *)v26 addPerson:v17];
        v31 = DSLogSharingPermissions;
        if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = *(void *)(a1 + 32);
          int v36 = 138478083;
          uint64_t v37 = v32;
          __int16 v38 = 2114;
          uint64_t v39 = v26;
          _os_log_impl(&dword_236090000, v31, OS_LOG_TYPE_INFO, "Adding person %{private}@ to new sharing type %{public}@", (uint8_t *)&v36, 0x16u);
        }
      }
      else
      {
        id v33 = [v29 objectAtIndexedSubscript:v28];

        [(DSSharingType *)v33 addPerson:v17];
        BOOL v34 = DSLogSharingPermissions;
        if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
        {
          uint64_t v35 = *(void *)(a1 + 32);
          int v36 = 138478083;
          uint64_t v37 = v35;
          __int16 v38 = 2114;
          uint64_t v39 = v33;
          _os_log_impl(&dword_236090000, v34, OS_LOG_TYPE_INFO, "Adding person %{private}@ to existing sharing type %{public}@", (uint8_t *)&v36, 0x16u);
        }
      }
      os_unfair_lock_unlock(WeakRetained + 2);
    }
    else
    {
      size_t v18 = (void *)DSLogSharingPermissions;
      if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 48);
        int v19 = *(void **)(a1 + 56);
        uint64_t v8 = v18;
        id v9 = [v19 name];
        int v36 = 138478083;
        uint64_t v37 = v20;
        __int16 v38 = 2114;
        uint64_t v39 = v9;
        id v10 = "Skipping participant %{private}@ for source %{public}@ because they do not have a display name";
        goto LABEL_9;
      }
    }
  }
}

void __80__DSSharingPermissions_addParticipant_forSource_sharedResource_deviceOwnerRole___block_invoke_38(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) me];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = MEMORY[0x263EF83A0];
    dispatch_async(v4, v3);
  }
  else if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT))
  {
    __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_2();
  }
}

- (void)removePerson:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allSources];
  [(DSSharingPermissions *)self removePerson:v4 sources:v5];
}

- (void)removePerson:(id)a3 sources:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v6 = a4;
  id v27 = [MEMORY[0x263EFF980] array];
  os_unfair_lock_lock(&self->_permissionsLock);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [[DSSharingType alloc] initWithSource:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        uint64_t v13 = [(DSSharingPermissions *)self sharingTypes];
        uint64_t v14 = [v13 indexOfObject:v12];

        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v15 = v12;
        }
        else
        {
          id v16 = [(DSSharingPermissions *)self sharingTypes];
          id v15 = [v16 objectAtIndexedSubscript:v14];

          [v15 removePerson:v28];
          id v17 = [v15 allPeople];
          uint64_t v18 = [v17 count];

          if (!v18) {
            [v27 addObject:v15];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);
  }

  int v19 = [v28 allSources];
  uint64_t v20 = [v19 count];

  if (!v20)
  {
    __int16 v21 = [(DSSharingPermissions *)self people];
    [v21 removeObject:v28];
  }
  os_unfair_lock_unlock(&self->_permissionsLock);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v22 = v27;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        [(DSSharingPermissions *)self removeSharingType:*(void *)(*((void *)&v29 + 1) + 8 * j)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v24);
  }
}

- (void)removeSharingType:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allPeople];
  [(DSSharingPermissions *)self removeSharingType:v4 people:v5];
}

- (void)removeSharingType:(id)a3 people:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v30 = [MEMORY[0x263EFF980] array];
  os_unfair_lock_t lock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * v12);
        uint64_t v14 = [(DSSharingPermissions *)self people];
        uint64_t v15 = [v14 indexOfObject:v13];

        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v16 = [(DSSharingPermissions *)self people];
          id v17 = [v16 objectAtIndexedSubscript:v15];

          uint64_t v18 = [v6 source];
          [v17 removeSource:v18];

          int v19 = [v17 allSources];
          uint64_t v20 = [v19 count];

          if (!v20) {
            [v30 addObject:v17];
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v10);
  }

  __int16 v21 = [v6 allPeople];
  uint64_t v22 = [v21 count];

  if (!v22)
  {
    uint64_t v23 = [(DSSharingPermissions *)self sharingTypes];
    [v23 removeObject:v6];
  }
  os_unfair_lock_unlock(lock);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v24 = v30;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        -[DSSharingPermissions removePerson:](self, "removePerson:", *(void *)(*((void *)&v31 + 1) + 8 * v28++), lock);
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v26);
  }
}

- (void)removePublicSharingType:(id)a3
{
  p_permissionsLock = &self->_permissionsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  id v6 = [(DSSharingPermissions *)self publicSharingTypes];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_permissionsLock);
}

- (void)filterPeopleWithPredicate:(id)a3
{
  p_permissionsLock = &self->_permissionsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  id v6 = [(DSSharingPermissions *)self people];
  id v7 = [v6 filteredOrderedSetUsingPredicate:v5];

  [(DSSharingPermissions *)self setFilteredPeople:v7];
  os_unfair_lock_unlock(p_permissionsLock);
}

- (void)filterReadOnlySharingPeopleWithPredicate:(id)a3
{
  p_permissionsLock = &self->_permissionsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  id v6 = [(DSSharingPermissions *)self readOnlySharingPeople];
  id v7 = [v6 filteredOrderedSetUsingPredicate:v5];

  [(DSSharingPermissions *)self setFilteredReadOnlySharingPeople:v7];
  os_unfair_lock_unlock(p_permissionsLock);
}

- (void)filterSharingTypesWithPredicate:(id)a3
{
  p_permissionsLock = &self->_permissionsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  id v6 = [(DSSharingPermissions *)self sharingTypes];
  id v7 = [v6 filteredOrderedSetUsingPredicate:v5];

  [(DSSharingPermissions *)self setFilteredSharingTypes:v7];
  os_unfair_lock_unlock(p_permissionsLock);
}

- (void)filterReadOnlySharingTypesWithPredicate:(id)a3
{
  p_permissionsLock = &self->_permissionsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  id v6 = [(DSSharingPermissions *)self readOnlySharingTypes];
  id v7 = [v6 filteredOrderedSetUsingPredicate:v5];

  [(DSSharingPermissions *)self setFilteredReadOnlySharingTypes:v7];
  os_unfair_lock_unlock(p_permissionsLock);
}

- (id)person:(int64_t)a3 withFilter:(BOOL)a4
{
  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a4) {
    [(DSSharingPermissions *)self filteredPeople];
  }
  else {
  id v8 = [(DSSharingPermissions *)self people];
  }
  uint64_t v9 = v8;
  if (a3 < 0 || [v8 count] <= a3)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
      -[DSSharingPermissions person:withFilter:]();
    }
    os_unfair_lock_unlock(p_permissionsLock);
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v9 objectAtIndexedSubscript:a3];
    os_unfair_lock_unlock(p_permissionsLock);
  }

  return v10;
}

- (id)readOnlySharingPerson:(int64_t)a3 withFilter:(BOOL)a4
{
  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a4) {
    [(DSSharingPermissions *)self filteredReadOnlySharingPeople];
  }
  else {
  id v8 = [(DSSharingPermissions *)self readOnlySharingPeople];
  }
  uint64_t v9 = v8;
  if (a3 < 0 || [v8 count] <= a3)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
      -[DSSharingPermissions readOnlySharingPerson:withFilter:]();
    }
    os_unfair_lock_unlock(p_permissionsLock);
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v9 objectAtIndexedSubscript:a3];
    os_unfair_lock_unlock(p_permissionsLock);
  }

  return v10;
}

- (id)sharingType:(int64_t)a3 withFilter:(BOOL)a4
{
  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a4) {
    [(DSSharingPermissions *)self filteredSharingTypes];
  }
  else {
  id v8 = [(DSSharingPermissions *)self sharingTypes];
  }
  uint64_t v9 = v8;
  if (a3 < 0 || [v8 count] <= a3)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
      -[DSSharingPermissions person:withFilter:]();
    }
    os_unfair_lock_unlock(p_permissionsLock);
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v9 objectAtIndexedSubscript:a3];
    os_unfair_lock_unlock(p_permissionsLock);
  }

  return v10;
}

- (id)publicSharingType:(int64_t)a3
{
  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  id v6 = [(DSSharingPermissions *)self publicSharingTypes];
  id v7 = v6;
  if (a3 < 0 || [v6 count] <= a3)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
      -[DSSharingPermissions person:withFilter:]();
    }
    os_unfair_lock_unlock(p_permissionsLock);
    id v8 = 0;
  }
  else
  {
    id v8 = [v7 objectAtIndexedSubscript:a3];
    os_unfair_lock_unlock(p_permissionsLock);
  }

  return v8;
}

- (id)readOnlySharingType:(int64_t)a3 withFilter:(BOOL)a4
{
  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a4) {
    [(DSSharingPermissions *)self filteredReadOnlySharingTypes];
  }
  else {
  id v8 = [(DSSharingPermissions *)self readOnlySharingTypes];
  }
  uint64_t v9 = v8;
  if (a3 < 0 || [v8 count] <= a3)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
      -[DSSharingPermissions readOnlySharingPerson:withFilter:]();
    }
    os_unfair_lock_unlock(p_permissionsLock);
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v9 objectAtIndexedSubscript:a3];
    os_unfair_lock_unlock(p_permissionsLock);
  }

  return v10;
}

- (int64_t)peopleCountWithFilter:(BOOL)a3
{
  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a3) {
    [(DSSharingPermissions *)self filteredPeople];
  }
  else {
  id v6 = [(DSSharingPermissions *)self people];
  }
  int64_t v7 = [v6 count];

  os_unfair_lock_unlock(p_permissionsLock);
  if (v7 < 0)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
      -[DSSharingPermissions peopleCountWithFilter:]();
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (int64_t)readOnlySharingPeopleCountWithFilter:(BOOL)a3
{
  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a3) {
    [(DSSharingPermissions *)self filteredReadOnlySharingPeople];
  }
  else {
  id v6 = [(DSSharingPermissions *)self readOnlySharingPeople];
  }
  int64_t v7 = [v6 count];

  os_unfair_lock_unlock(p_permissionsLock);
  if (v7 < 0)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
      -[DSSharingPermissions readOnlySharingPeopleCountWithFilter:]();
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (int64_t)sharingTypesCountWithFilter:(BOOL)a3
{
  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a3) {
    [(DSSharingPermissions *)self filteredSharingTypes];
  }
  else {
  id v6 = [(DSSharingPermissions *)self sharingTypes];
  }
  int64_t v7 = [v6 count];

  os_unfair_lock_unlock(p_permissionsLock);
  if (v7 < 0)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
      -[DSSharingPermissions peopleCountWithFilter:]();
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (int64_t)publicSharingTypesCount
{
  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  id v4 = [(DSSharingPermissions *)self publicSharingTypes];
  int64_t v5 = [v4 count];

  os_unfair_lock_unlock(p_permissionsLock);
  if (v5 < 0)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
      -[DSSharingPermissions readOnlySharingPeopleCountWithFilter:]();
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (int64_t)readOnlySharingTypesCountWithFilter:(BOOL)a3
{
  p_permissionsLock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  if (a3) {
    [(DSSharingPermissions *)self filteredReadOnlySharingTypes];
  }
  else {
  id v6 = [(DSSharingPermissions *)self readOnlySharingTypes];
  }
  int64_t v7 = [v6 count];

  os_unfair_lock_unlock(p_permissionsLock);
  if (v7 < 0)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
      -[DSSharingPermissions readOnlySharingPeopleCountWithFilter:]();
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (NSArray)allPeople
{
  uint64_t v2 = [(DSSharingPermissions *)self people];
  id v3 = [v2 array];

  return (NSArray *)v3;
}

- (NSArray)allReadOnlySharingPeople
{
  uint64_t v2 = [(DSSharingPermissions *)self readOnlySharingPeople];
  id v3 = [v2 array];

  return (NSArray *)v3;
}

- (NSArray)allSharingTypes
{
  uint64_t v2 = [(DSSharingPermissions *)self sharingTypes];
  id v3 = [v2 array];

  return (NSArray *)v3;
}

- (NSArray)allPublicSharingTypes
{
  uint64_t v2 = [(DSSharingPermissions *)self publicSharingTypes];
  id v3 = [v2 array];

  return (NSArray *)v3;
}

- (NSArray)allReadOnlySharingTypes
{
  uint64_t v2 = [(DSSharingPermissions *)self readOnlySharingTypes];
  id v3 = [v2 array];

  return (NSArray *)v3;
}

- (NSDictionary)elapsedUnfinishedFetchesBySource
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  __uint64_t v4 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  os_unfair_lock_t lock = &self->_permissionsLock;
  os_unfair_lock_lock(&self->_permissionsLock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = [(DSSharingPermissions *)self fetchStartTimesBySource];
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [(DSSharingPermissions *)self fetchStartTimesBySource];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];
        uint64_t v12 = [v11 unsignedLongLongValue];

        uint64_t v13 = [NSNumber numberWithDouble:(double)(v4 - v12) / 1000000000.0];
        [v3 setObject:v13 forKeyedSubscript:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
  uint64_t v14 = [NSDictionary dictionaryWithDictionary:v3];

  return (NSDictionary *)v14;
}

- (void)fetchStartedForSource:(id)a3
{
  p_permissionsLock = &self->_permissionsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW)];
  uint64_t v7 = [(DSSharingPermissions *)self fetchStartTimesBySource];
  [v7 setObject:v6 forKeyedSubscript:v5];

  os_unfair_lock_unlock(p_permissionsLock);
}

- (void)fetchCompletedForSource:(id)a3
{
  p_permissionsLock = &self->_permissionsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_permissionsLock);
  uint64_t v6 = [(DSSharingPermissions *)self fetchStartTimesBySource];
  [v6 setObject:0 forKeyedSubscript:v5];

  os_unfair_lock_unlock(p_permissionsLock);
}

- (void)stopAllSharingOnQueue:(id)a3 completion:(id)a4
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  queue = a3;
  id v92 = a4;
  uint64_t v6 = dispatch_group_create();
  long long v98 = [MEMORY[0x263EFF980] array];
  long long v97 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [(DSSharingPermissions *)self allSharingTypes];
  id v8 = (void *)[v7 copy];

  objc_initWeak(&location, self);
  uint64_t v9 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v10 = [(DSSharingPermissions *)self allPublicSharingTypes];
  uint64_t v11 = (void *)[v10 copy];
  long long v96 = [v9 setWithArray:v11];

  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v124 objects:v133 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v125;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v125 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v124 + 1) + 8 * i);
        id v17 = [DSPublicSharingType alloc];
        long long v18 = [v16 source];
        long long v19 = [(DSPublicSharingType *)v17 initWithSource:v18];

        [v96 removeObject:v19];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v124 objects:v133 count:16];
    }
    while (v13);
  }

  os_signpost_id_t v20 = os_signpost_id_generate((os_log_t)DSLogSharingPermissions);
  long long v21 = (id)DSLogSharingPermissions;
  uint64_t v22 = v21;
  os_signpost_id_t spid = v20;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_236090000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "stopAll", " enableTelemetry=YES ", buf, 2u);
  }

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  obuint64_t j = v12;
  uint64_t v23 = [obj countByEnumeratingWithState:&v120 objects:v132 count:16];
  if (v23)
  {
    uint64_t v95 = *(void *)v121;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v121 != v95) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v120 + 1) + 8 * v24);
        dispatch_group_enter(v6);
        uint64_t v26 = (char *)os_signpost_id_generate((os_log_t)DSLogSharingPermissions);
        uint64_t v27 = [v25 source];
        uint64_t v28 = [v27 name];
        int v29 = [v28 isEqualToString:@"com.apple.DigitalSeparation.Calendars"];

        if (v29)
        {
          long long v30 = (id)DSLogSharingPermissions;
          long long v31 = v30;
          if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
          {
            *(_WORD *)buf = 0;
            long long v32 = v31;
            os_signpost_id_t v33 = (os_signpost_id_t)v26;
            long long v34 = "stopAll.Calendars";
LABEL_60:
            _os_signpost_emit_with_name_impl(&dword_236090000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v33, v34, " enableTelemetry=YES ", buf, 2u);
          }
        }
        else
        {
          long long v35 = [v25 source];
          long long v36 = [v35 name];
          int v37 = [v36 isEqualToString:@"com.apple.DigitalSeparation.FindMy"];

          if (v37)
          {
            long long v38 = (id)DSLogSharingPermissions;
            long long v31 = v38;
            if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
            {
              *(_WORD *)buf = 0;
              long long v32 = v31;
              os_signpost_id_t v33 = (os_signpost_id_t)v26;
              long long v34 = "stopAll.FindMy";
              goto LABEL_60;
            }
          }
          else
          {
            uint64_t v39 = [v25 source];
            __int16 v40 = [v39 name];
            int v41 = [v40 isEqualToString:@"com.apple.DigitalSeparation.Photos"];

            if (v41)
            {
              uint64_t v42 = (id)DSLogSharingPermissions;
              long long v31 = v42;
              if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
              {
                *(_WORD *)buf = 0;
                long long v32 = v31;
                os_signpost_id_t v33 = (os_signpost_id_t)v26;
                long long v34 = "stopAll.Photos";
                goto LABEL_60;
              }
            }
            else
            {
              id v43 = [v25 source];
              id v44 = [v43 name];
              int v45 = [v44 isEqualToString:@"com.apple.DigitalSeparation.HomeKit.HomeSharing"];

              if (v45)
              {
                uint64_t v46 = (id)DSLogSharingPermissions;
                long long v31 = v46;
                if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
                {
                  *(_WORD *)buf = 0;
                  long long v32 = v31;
                  os_signpost_id_t v33 = (os_signpost_id_t)v26;
                  long long v34 = "stopAll.Home";
                  goto LABEL_60;
                }
              }
              else
              {
                id v47 = [v25 source];
                uint64_t v48 = [v47 name];
                int v49 = [v48 isEqualToString:@"com.apple.DigitalSeparation.HealthKit.HealthSharing"];

                if (v49)
                {
                  id v50 = (id)DSLogSharingPermissions;
                  long long v31 = v50;
                  if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
                  {
                    *(_WORD *)buf = 0;
                    long long v32 = v31;
                    os_signpost_id_t v33 = (os_signpost_id_t)v26;
                    long long v34 = "stopAll.Health";
                    goto LABEL_60;
                  }
                }
                else
                {
                  uint64_t v51 = [v25 source];
                  int v52 = [v51 name];
                  int v53 = [v52 isEqualToString:@"com.apple.DigitalSeparation.Notes"];

                  if (v53)
                  {
                    long long v54 = (id)DSLogSharingPermissions;
                    long long v31 = v54;
                    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
                    {
                      *(_WORD *)buf = 0;
                      long long v32 = v31;
                      os_signpost_id_t v33 = (os_signpost_id_t)v26;
                      long long v34 = "stopAll.Notes";
                      goto LABEL_60;
                    }
                  }
                  else
                  {
                    int v55 = [v25 source];
                    uint64_t v56 = [v55 name];
                    int v57 = [v56 isEqualToString:@"com.apple.DigitalSeparation.Zelkova"];

                    if (v57)
                    {
                      int v58 = (id)DSLogSharingPermissions;
                      long long v31 = v58;
                      if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
                      {
                        *(_WORD *)buf = 0;
                        long long v32 = v31;
                        os_signpost_id_t v33 = (os_signpost_id_t)v26;
                        long long v34 = "stopAll.Zelkova";
                        goto LABEL_60;
                      }
                    }
                    else
                    {
                      long long v59 = [v25 source];
                      long long v60 = [v59 name];
                      int v61 = [v60 isEqualToString:@"com.apple.DigitalSeparation.Fitness"];

                      if (v61)
                      {
                        v62 = (id)DSLogSharingPermissions;
                        long long v31 = v62;
                        if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
                        {
                          *(_WORD *)buf = 0;
                          long long v32 = v31;
                          os_signpost_id_t v33 = (os_signpost_id_t)v26;
                          long long v34 = "stopAll.Activity";
                          goto LABEL_60;
                        }
                      }
                      else
                      {
                        uint64_t v63 = [v25 source];
                        int v64 = [v63 name];
                        int v65 = [v64 isEqualToString:@"com.apple.DigitalSeparation.PassKeys"];

                        if (v65)
                        {
                          v66 = (id)DSLogSharingPermissions;
                          long long v31 = v66;
                          if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
                          {
                            *(_WORD *)buf = 0;
                            long long v32 = v31;
                            os_signpost_id_t v33 = (os_signpost_id_t)v26;
                            long long v34 = "stopAll.Passkeys";
                            goto LABEL_60;
                          }
                        }
                        else
                        {
                          int v67 = [v25 source];
                          v68 = [v67 name];
                          int v69 = [v68 isEqualToString:@"com.apple.DigitalSeparation.ItemSharing"];

                          if (v69)
                          {
                            int v70 = (id)DSLogSharingPermissions;
                            long long v31 = v70;
                            if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
                            {
                              *(_WORD *)buf = 0;
                              long long v32 = v31;
                              os_signpost_id_t v33 = (os_signpost_id_t)v26;
                              long long v34 = "stopAll.ItemSharing";
                              goto LABEL_60;
                            }
                          }
                          else
                          {
                            v71 = [v25 source];
                            v72 = [v71 name];
                            int v73 = [v72 isEqualToString:@"com.apple.DigitalSeparation.Maps"];

                            v74 = (id)DSLogSharingPermissions;
                            long long v31 = v74;
                            if (v73)
                            {
                              if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
                              {
                                *(_WORD *)buf = 0;
                                long long v32 = v31;
                                os_signpost_id_t v33 = (os_signpost_id_t)v26;
                                long long v34 = "stopAll.Maps";
                                goto LABEL_60;
                              }
                            }
                            else
                            {
                              if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
                              {
                                *(_WORD *)buf = 0;
                                _os_signpost_emit_with_name_impl(&dword_236090000, v31, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v26, "stopAll.Notes", " enableTelemetry=YES ", buf, 2u);
                              }

                              long long v31 = (id)DSLogSharingPermissions;
                              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                              {
                                int v81 = [v25 source];
                                v82 = [v81 name];
                                *(_DWORD *)buf = 138543362;
                                v131 = v82;
                                _os_log_fault_impl(&dword_236090000, v31, OS_LOG_TYPE_FAULT, "Signpost for unsupported source name %{public}@", buf, 0xCu);
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }

        v75 = (id)DSLogSharingPermissions;
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          int v76 = [v25 source];
          v77 = [v76 name];
          *(_DWORD *)buf = 138543362;
          v131 = v77;
          _os_log_impl(&dword_236090000, v75, OS_LOG_TYPE_INFO, "Stopping all sharing for type %{public}@", buf, 0xCu);
        }
        v78 = [v25 allPeople];
        os_signpost_id_t v79 = (void *)[v78 copy];

        v114[0] = MEMORY[0x263EF8330];
        v114[1] = 3221225472;
        v114[2] = __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke;
        v114[3] = &unk_264C9EA58;
        v114[4] = v25;
        id v115 = v98;
        objc_copyWeak(v119, &location);
        id v116 = v97;
        id v80 = v79;
        id v117 = v80;
        v119[1] = v26;
        v118 = v6;
        [v25 stopAllSharingOnQueue:queue completion:v114];

        objc_destroyWeak(v119);
        ++v24;
      }
      while (v23 != v24);
      uint64_t v83 = [obj countByEnumeratingWithState:&v120 objects:v132 count:16];
      uint64_t v23 = v83;
    }
    while (v83);
  }

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v84 = v96;
  uint64_t v85 = [v84 countByEnumeratingWithState:&v110 objects:v129 count:16];
  if (v85)
  {
    uint64_t v86 = *(void *)v111;
    do
    {
      for (uint64_t j = 0; j != v85; ++j)
      {
        if (*(void *)v111 != v86) {
          objc_enumerationMutation(v84);
        }
        v88 = *(void **)(*((void *)&v110 + 1) + 8 * j);
        dispatch_group_enter(v6);
        v105[0] = MEMORY[0x263EF8330];
        v105[1] = 3221225472;
        v105[2] = __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_43;
        v105[3] = &unk_264C9EA80;
        v105[4] = v88;
        id v106 = v98;
        objc_copyWeak(&v109, &location);
        id v107 = v97;
        v108 = v6;
        [v88 stopAllSharingOnQueue:queue completion:v105];

        objc_destroyWeak(&v109);
      }
      uint64_t v85 = [v84 countByEnumeratingWithState:&v110 objects:v129 count:16];
    }
    while (v85);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_44;
  block[3] = &unk_264C9EAA8;
  id v103 = v92;
  os_signpost_id_t v104 = spid;
  id v101 = v97;
  id v102 = v98;
  id v89 = v98;
  id v90 = v97;
  id v91 = v92;
  dispatch_group_notify(v6, queue, block);

  objc_destroyWeak(&location);
}

void __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v3 = a2;
  __uint64_t v4 = (void *)DSLogSharingPermissions;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 source];
    id v8 = [v7 name];
    int v68 = 138543362;
    int v69 = v8;
    _os_log_impl(&dword_236090000, v6, OS_LOG_TYPE_INFO, "Finished stop all sharing for type %{public}@", (uint8_t *)&v68, 0xCu);
  }
  if (v3)
  {
    uint64_t v9 = (void *)DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_ERROR)) {
      __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_cold_2(a1, v9);
    }
    [*(id *)(a1 + 40) addObject:v3];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    uint64_t v11 = *(void **)(a1 + 48);
    id v12 = [*(id *)(a1 + 32) source];
    uint64_t v13 = [v12 name];
    [v11 addObject:v13];

    [WeakRetained removeSharingType:*(void *)(a1 + 32) people:*(void *)(a1 + 56)];
    uint64_t v14 = [DSPublicSharingType alloc];
    uint64_t v15 = [*(id *)(a1 + 32) source];
    id v16 = [(DSPublicSharingType *)v14 initWithSource:v15];

    [WeakRetained removePublicSharingType:v16];
  }
  id v17 = (id *)(a1 + 32);
  long long v18 = [*(id *)(a1 + 32) source];
  long long v19 = [v18 name];
  int v20 = [v19 isEqualToString:@"com.apple.DigitalSeparation.Calendars"];

  if (v20)
  {
    long long v21 = (id)DSLogSharingPermissions;
    uint64_t v22 = v21;
    os_signpost_id_t v23 = *(void *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21)) {
      goto LABEL_49;
    }
    LOWORD(v68) = 0;
    uint64_t v24 = "stopAll.Calendars";
LABEL_48:
    _os_signpost_emit_with_name_impl(&dword_236090000, v22, OS_SIGNPOST_INTERVAL_END, v23, v24, " enableTelemetry=YES ", (uint8_t *)&v68, 2u);
LABEL_49:

    goto LABEL_50;
  }
  uint64_t v25 = [*v17 source];
  uint64_t v26 = [v25 name];
  int v27 = [v26 isEqualToString:@"com.apple.DigitalSeparation.FindMy"];

  if (v27)
  {
    uint64_t v28 = (id)DSLogSharingPermissions;
    uint64_t v22 = v28;
    os_signpost_id_t v23 = *(void *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v28)) {
      goto LABEL_49;
    }
    LOWORD(v68) = 0;
    uint64_t v24 = "stopAll.FindMy";
    goto LABEL_48;
  }
  int v29 = [*v17 source];
  long long v30 = [v29 name];
  int v31 = [v30 isEqualToString:@"com.apple.DigitalSeparation.Photos"];

  if (v31)
  {
    long long v32 = (id)DSLogSharingPermissions;
    uint64_t v22 = v32;
    os_signpost_id_t v23 = *(void *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v32)) {
      goto LABEL_49;
    }
    LOWORD(v68) = 0;
    uint64_t v24 = "stopAll.Photos";
    goto LABEL_48;
  }
  os_signpost_id_t v33 = [*v17 source];
  long long v34 = [v33 name];
  int v35 = [v34 isEqualToString:@"com.apple.DigitalSeparation.HomeKit.HomeSharing"];

  if (v35)
  {
    long long v36 = (id)DSLogSharingPermissions;
    uint64_t v22 = v36;
    os_signpost_id_t v23 = *(void *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v36)) {
      goto LABEL_49;
    }
    LOWORD(v68) = 0;
    uint64_t v24 = "stopAll.Home";
    goto LABEL_48;
  }
  int v37 = [*v17 source];
  long long v38 = [v37 name];
  int v39 = [v38 isEqualToString:@"com.apple.DigitalSeparation.HealthKit.HealthSharing"];

  if (v39)
  {
    __int16 v40 = (id)DSLogSharingPermissions;
    uint64_t v22 = v40;
    os_signpost_id_t v23 = *(void *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v40)) {
      goto LABEL_49;
    }
    LOWORD(v68) = 0;
    uint64_t v24 = "stopAll.Health";
    goto LABEL_48;
  }
  int v41 = [*v17 source];
  uint64_t v42 = [v41 name];
  int v43 = [v42 isEqualToString:@"com.apple.DigitalSeparation.Notes"];

  if (v43)
  {
    id v44 = (id)DSLogSharingPermissions;
    uint64_t v22 = v44;
    os_signpost_id_t v23 = *(void *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v44)) {
      goto LABEL_49;
    }
    LOWORD(v68) = 0;
    uint64_t v24 = "stopAll.Notes";
    goto LABEL_48;
  }
  int v45 = [*v17 source];
  uint64_t v46 = [v45 name];
  int v47 = [v46 isEqualToString:@"com.apple.DigitalSeparation.Zelkova"];

  if (v47)
  {
    uint64_t v48 = (id)DSLogSharingPermissions;
    uint64_t v22 = v48;
    os_signpost_id_t v23 = *(void *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v48)) {
      goto LABEL_49;
    }
    LOWORD(v68) = 0;
    uint64_t v24 = "stopAll.Zelkova";
    goto LABEL_48;
  }
  int v49 = [*v17 source];
  id v50 = [v49 name];
  int v51 = [v50 isEqualToString:@"com.apple.DigitalSeparation.Fitness"];

  if (v51)
  {
    int v52 = (id)DSLogSharingPermissions;
    uint64_t v22 = v52;
    os_signpost_id_t v23 = *(void *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v52)) {
      goto LABEL_49;
    }
    LOWORD(v68) = 0;
    uint64_t v24 = "stopAll.Activity";
    goto LABEL_48;
  }
  int v53 = [*v17 source];
  long long v54 = [v53 name];
  int v55 = [v54 isEqualToString:@"com.apple.DigitalSeparation.PassKeys"];

  if (v55)
  {
    uint64_t v56 = (id)DSLogSharingPermissions;
    uint64_t v22 = v56;
    os_signpost_id_t v23 = *(void *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v56)) {
      goto LABEL_49;
    }
    LOWORD(v68) = 0;
    uint64_t v24 = "stopAll.Passkeys";
    goto LABEL_48;
  }
  int v57 = [*v17 source];
  int v58 = [v57 name];
  int v59 = [v58 isEqualToString:@"com.apple.DigitalSeparation.ItemSharing"];

  if (v59)
  {
    long long v60 = (id)DSLogSharingPermissions;
    uint64_t v22 = v60;
    os_signpost_id_t v23 = *(void *)(a1 + 80);
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v60)) {
      goto LABEL_49;
    }
    LOWORD(v68) = 0;
    uint64_t v24 = "stopAll.ItemSharing";
    goto LABEL_48;
  }
  int v61 = [*(id *)(a1 + 32) source];
  v62 = [v61 name];
  int v63 = [v62 isEqualToString:@"com.apple.DigitalSeparation.Maps"];

  int v64 = (id)DSLogSharingPermissions;
  int v65 = v64;
  os_signpost_id_t v66 = *(void *)(a1 + 80);
  if (v63)
  {
    if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
    {
      LOWORD(v68) = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v65, OS_SIGNPOST_INTERVAL_END, v66, "stopAll.Maps", " enableTelemetry=YES ", (uint8_t *)&v68, 2u);
    }
  }
  else
  {
    if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
    {
      LOWORD(v68) = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v65, OS_SIGNPOST_INTERVAL_END, v66, "stopAll.Notes", " enableTelemetry=YES ", (uint8_t *)&v68, 2u);
    }

    int v67 = (void *)DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_FAULT)) {
      __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_cold_1((void **)(a1 + 32), v67);
    }
  }
LABEL_50:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  __uint64_t v4 = (void *)DSLogSharingPermissions;
  if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 source];
    id v8 = [v7 name];
    int v14 = 138543362;
    uint64_t v15 = v8;
    _os_log_impl(&dword_236090000, v6, OS_LOG_TYPE_INFO, "Finished stop all public sharing for type %{public}@", (uint8_t *)&v14, 0xCu);
  }
  if (v3)
  {
    uint64_t v9 = (void *)DSLogSharingPermissions;
    if (os_log_type_enabled((os_log_t)DSLogSharingPermissions, OS_LOG_TYPE_ERROR)) {
      __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_43_cold_1(a1, v9);
    }
    [*(id *)(a1 + 40) addObject:v3];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v11 = *(void **)(a1 + 48);
    id v12 = [*(id *)(a1 + 32) source];
    uint64_t v13 = [v12 name];
    [v11 addObject:v13];

    [WeakRetained removePublicSharingType:*(void *)(a1 + 32)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_44(uint64_t a1)
{
  uint64_t v2 = (id)DSLogSharingPermissions;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_236090000, v3, OS_SIGNPOST_INTERVAL_END, v4, "stopAll", " enableTelemetry=YES ", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (NSMutableOrderedSet)people
{
  return self->_people;
}

- (void)setPeople:(id)a3
{
}

- (NSOrderedSet)filteredPeople
{
  return self->_filteredPeople;
}

- (void)setFilteredPeople:(id)a3
{
}

- (NSMutableOrderedSet)readOnlySharingPeople
{
  return self->_readOnlySharingPeople;
}

- (void)setReadOnlySharingPeople:(id)a3
{
}

- (NSOrderedSet)filteredReadOnlySharingPeople
{
  return self->_filteredReadOnlySharingPeople;
}

- (void)setFilteredReadOnlySharingPeople:(id)a3
{
}

- (NSMutableOrderedSet)sharingTypes
{
  return self->_sharingTypes;
}

- (void)setSharingTypes:(id)a3
{
}

- (NSOrderedSet)filteredSharingTypes
{
  return self->_filteredSharingTypes;
}

- (void)setFilteredSharingTypes:(id)a3
{
}

- (NSMutableOrderedSet)readOnlySharingTypes
{
  return self->_readOnlySharingTypes;
}

- (void)setReadOnlySharingTypes:(id)a3
{
}

- (NSOrderedSet)filteredReadOnlySharingTypes
{
  return self->_filteredReadOnlySharingTypes;
}

- (void)setFilteredReadOnlySharingTypes:(id)a3
{
}

- (NSMutableOrderedSet)publicSharingTypes
{
  return self->_publicSharingTypes;
}

- (void)setPublicSharingTypes:(id)a3
{
}

- (NSMutableDictionary)fetchStartTimesBySource
{
  return self->_fetchStartTimesBySource;
}

- (void)setFetchStartTimesBySource:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)dataUsageQueue
{
  return self->_dataUsageQueue;
}

- (void)setDataUsageQueue:(id)a3
{
}

- (DSSourceRepository)repo
{
  return self->_repo;
}

- (void)setRepo:(id)a3
{
}

- (DSMe)me
{
  return (DSMe *)objc_getProperty(self, a2, 120, 1);
}

- (void)setMe:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_repo, 0);
  objc_storeStrong((id *)&self->_dataUsageQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_fetchStartTimesBySource, 0);
  objc_storeStrong((id *)&self->_publicSharingTypes, 0);
  objc_storeStrong((id *)&self->_filteredReadOnlySharingTypes, 0);
  objc_storeStrong((id *)&self->_readOnlySharingTypes, 0);
  objc_storeStrong((id *)&self->_filteredSharingTypes, 0);
  objc_storeStrong((id *)&self->_sharingTypes, 0);
  objc_storeStrong((id *)&self->_filteredReadOnlySharingPeople, 0);
  objc_storeStrong((id *)&self->_readOnlySharingPeople, 0);
  objc_storeStrong((id *)&self->_filteredPeople, 0);
  objc_storeStrong((id *)&self->_people, 0);
}

void __75__DSSharingPermissions_verifyDataUsagePoliciesForSources_queue_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_236090000, log, OS_LOG_TYPE_ERROR, "Failed to get data usage policies for %{public}@ because %{public}@", (uint8_t *)&v4, 0x16u);
}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  int v4 = [a2 name];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_236090000, v3, OS_LOG_TYPE_FAULT, "Signpost for unsupported source name %{public}@", v5, 0xCu);
}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_1(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  int v4 = [v2 name];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_236090000, v5, v6, "Signpost for unsupported source name %{public}@", v7, v8, v9, v10, v11);
}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_236090000, v0, v1, "DSMe should always be initialized before being used", v2, v3, v4, v5, v6);
}

void __85__DSSharingPermissions_fetchPermissionsFromSources_includingErrors_queue_completion___block_invoke_19_cold_3(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  uint64_t v4 = [v2 name];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_236090000, v5, v6, "Failed to fetch shared resources from %{public}@ because %{public}@", v7, v8, v9, v10, v11);
}

- (void)person:withFilter:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_236090000, v0, v1, "Failed to find a person for index path %{public}ld", v2, v3, v4, v5, v6);
}

- (void)readOnlySharingPerson:withFilter:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_236090000, v0, v1, "Failed to find a read only sharing type for index path %{public}ld", v2, v3, v4, v5, v6);
}

- (void)peopleCountWithFilter:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_236090000, v0, v1, "Too many people to count", v2, v3, v4, v5, v6);
}

- (void)readOnlySharingPeopleCountWithFilter:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_236090000, v0, v1, "Too many rows to count", v2, v3, v4, v5, v6);
}

void __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  uint64_t v4 = [v2 source];
  uint64_t v5 = [v4 name];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_236090000, v6, v7, "Signpost for unsupported source name %{public}@", v8, v9, v10, v11, v12);
}

void __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 source];
  uint64_t v5 = [v4 name];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_236090000, v6, v7, "Failed to stop all sharing for sharing type %{public}@ because %{public}@", v8, v9, v10, v11, v12);
}

void __57__DSSharingPermissions_stopAllSharingOnQueue_completion___block_invoke_43_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 source];
  uint64_t v5 = [v4 name];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_236090000, v6, v7, "Failed to stop all public sharing for type %{public}@ because %{public}@", v8, v9, v10, v11, v12);
}

@end