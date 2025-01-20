@interface CKContextRecentsCache
- (BOOL)_constellationResult:(id)a3 intersectsWithRecent:(id)a4;
- (BOOL)_recent:(id)a3 matchesKeywords:(id)a4;
- (CKContextRecentsCache)initWithCacheConfiguration:(unint64_t)a3;
- (CKContextRecentsCacheDelegate)delegate;
- (id)_associatedTopicIdsForRecent:(id)a3;
- (id)_associatedTopicTitlesForRecent:(id)a3;
- (id)_modeUUIDStringForComputedModeEvent:(id)a3;
- (id)_relativeDateStringForRecent:(id)a3;
- (unint64_t)_maximumNumberOfItemsToRetrieve;
- (void)_groupActivitiesByAppIntoSectionsWithRecents:(id)a3 limit:(unint64_t)a4 reply:(id)a5;
- (void)_groupActivitiesByConstellationIntoSectionsWithRecents:(id)a3 limit:(unint64_t)a4 reply:(id)a5;
- (void)_groupActivitiesByDateIntoSectionsWithRecents:(id)a3 limit:(unint64_t)a4 reply:(id)a5;
- (void)_groupActivitiesByModeIntoSectionsWithRecents:(id)a3 limit:(unint64_t)a4 reply:(id)a5;
- (void)_modeDidChangeToModeWithModeUUIDString:(id)a3;
- (void)_performMaintenanceTasks;
- (void)_performMaintenanceTasksForRecents:(id)a3;
- (void)_pruneRecentsFromUnusedAppsForRecents:(id)a3;
- (void)_registerComputedModeStream;
- (void)_scheduleDeferredMaintenanceTasks;
- (void)_updateLatestFocusMode;
- (void)allRecentsWithReply:(id)a3;
- (void)dealloc;
- (void)insertUserActivityData:(id)a3 preferredTitle:(id)a4 bundleId:(id)a5 topics:(id)a6 hasAssociatedImageRepresentation:(BOOL)a7 uuid:(id)a8;
- (void)pruneRecentsForBundleIdentifiers:(id)a3;
- (void)removeAllRecentsWithReply:(id)a3;
- (void)removeRecentWithUUID:(id)a3;
- (void)removeRecentsMatchingRecent:(id)a3;
- (void)retrieveRecentMatchingUUID:(id)a3 withReply:(id)a4;
- (void)retrieveRecentsBetweenStartDate:(id)a3 endDate:(id)a4 withReply:(id)a5;
- (void)retrieveRecentsCatalogWithStyle:(unint64_t)a3 withReply:(id)a4;
- (void)retrieveRecentsForPredictionWithReply:(id)a3;
- (void)retrieveRecentsMatchingBundleIdentifier:(id)a3 withReply:(id)a4;
- (void)retrieveRecentsMatchingMode:(id)a3 withReply:(id)a4;
- (void)retrieveRecentsMatchingStrings:(id)a3 withReply:(id)a4;
- (void)retrieveRecentsMatchingTopicIds:(id)a3 titles:(id)a4 withReply:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation CKContextRecentsCache

- (CKContextRecentsCache)initWithCacheConfiguration:(unint64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKContextRecentsCache;
  v4 = [(CKContextRecentsCache *)&v15 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("CKContextRecentsCache Stream Modification Queue", 0);
    biomeQueue = v4->_biomeQueue;
    v4->_biomeQueue = (OS_dispatch_queue *)v5;

    v7 = (BMUserActivityMetadataStream *)objc_alloc_init(MEMORY[0x263F2A9F0]);
    stream = v4->_stream;
    v4->_stream = v7;

    v4->_configuration = a3;
    v9 = (BMUserFocusComputedModeStream *)objc_alloc_init(MEMORY[0x263F2A9F8]);
    computedModeStream = v4->_computedModeStream;
    v4->_computedModeStream = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("CKContextRecentsCache Focus Mode Queue", v11);
    computedFocusModeQueue = v4->_computedFocusModeQueue;
    v4->_computedFocusModeQueue = (OS_dispatch_queue *)v12;

    [(CKContextRecentsCache *)v4 _registerComputedModeStream];
    [(CKContextRecentsCache *)v4 _updateLatestFocusMode];
    [(CKContextRecentsCache *)v4 _scheduleDeferredMaintenanceTasks];
  }
  return v4;
}

- (void)insertUserActivityData:(id)a3 preferredTitle:(id)a4 bundleId:(id)a5 topics:(id)a6 hasAssociatedImageRepresentation:(BOOL)a7 uuid:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __117__CKContextRecentsCache_insertUserActivityData_preferredTitle_bundleId_topics_hasAssociatedImageRepresentation_uuid___block_invoke;
  v24[3] = &unk_2647D2F18;
  objc_copyWeak(&v30, &location);
  id v19 = v15;
  id v25 = v19;
  id v20 = v14;
  id v26 = v20;
  id v21 = v16;
  id v27 = v21;
  id v22 = v17;
  id v28 = v22;
  BOOL v31 = a7;
  id v23 = v18;
  id v29 = v23;
  [v20 _createUserActivityDataWithOptions:0 completionHandler:v24];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __117__CKContextRecentsCache_insertUserActivityData_preferredTitle_bundleId_topics_hasAssociatedImageRepresentation_uuid___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (!v5 || a3)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __117__CKContextRecentsCache_insertUserActivityData_preferredTitle_bundleId_topics_hasAssociatedImageRepresentation_uuid___block_invoke_cold_1();
      }
    }
    else
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if ([*(id *)(a1 + 32) length])
      {
        v8 = (__CFString *)*(id *)(a1 + 32);
      }
      else
      {
        v8 = [*(id *)(a1 + 40) title];
      }
      v9 = v8;
      uint64_t v10 = [*(id *)(a1 + 40) activityType];
      v11 = [*(id *)(a1 + 40) webpageURL];
      dispatch_queue_t v12 = *(void **)(a1 + 40);
      if (v11) {
        [v12 webpageURL];
      }
      else {
      v13 = [v12 referrerURL];
      }
      id v28 = [v13 absoluteString];

      id v14 = (objc_class *)MEMORY[0x263F2A9E8];
      id v15 = (__CFString *)*((id *)WeakRetained + 5);
      id v29 = v15;
      id v16 = [v14 alloc];
      id v17 = &stru_26DAC3360;
      if (v9) {
        id v18 = v9;
      }
      else {
        id v18 = &stru_26DAC3360;
      }
      if (v10) {
        id v19 = (__CFString *)v10;
      }
      else {
        id v19 = &stru_26DAC3360;
      }
      BOOL v31 = v9;
      uint64_t v20 = *(void *)(a1 + 48);
      if ([(__CFString *)v15 length]) {
        id v17 = v15;
      }
      id v30 = (void *)v10;
      char v21 = *(unsigned char *)(a1 + 80);
      uint64_t v22 = *(void *)(a1 + 56);
      id v23 = [*(id *)(a1 + 64) UUIDString];
      LOBYTE(v27) = v21;
      v24 = (void *)[v16 initWithAbsoluteTimestamp:v5 userActivityData:v18 title:v19 activityType:v20 associatedBundleId:v28 associatedURLString:v17 modeIdentifier:Current topics:v22 hasAssociatedImageRepresentation:v27 uuid:v23];

      id v25 = *((void *)WeakRetained + 2);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __117__CKContextRecentsCache_insertUserActivityData_preferredTitle_bundleId_topics_hasAssociatedImageRepresentation_uuid___block_invoke_26;
      block[3] = &unk_2647D2EF0;
      block[4] = WeakRetained;
      id v33 = v24;
      id v26 = v24;
      dispatch_async(v25, block);
    }
  }
}

void __117__CKContextRecentsCache_insertUserActivityData_preferredTitle_bundleId_topics_hasAssociatedImageRepresentation_uuid___block_invoke_26(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) source];
  [v2 sendEvent:*(void *)(a1 + 40)];
}

- (void)allRecentsWithReply:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    biomeQueue = self->_biomeQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__CKContextRecentsCache_allRecentsWithReply___block_invoke;
    v6[3] = &unk_2647D2F90;
    objc_copyWeak(&v8, &location);
    v6[4] = self;
    id v7 = v4;
    dispatch_async(biomeQueue, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __45__CKContextRecentsCache_allRecentsWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained _maximumNumberOfItemsToRetrieve];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_cold_1();
    }
    id v5 = [*(id *)(*(void *)(a1 + 32) + 8) publisherFromStartTime:0.0];
    v6 = [v5 bufferWithSize:v4 prefetch:1 whenFull:1];

    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__0;
    v12[4] = __Block_byref_object_dispose__0;
    id v13 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_30;
    v9[3] = &unk_2647D2F40;
    v11 = v12;
    id v10 = *(id *)(a1 + 40);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_32;
    v8[3] = &unk_2647D2F68;
    v8[4] = v12;
    id v7 = (id)[v6 sinkWithCompletion:v9 receiveInput:v8];

    _Block_object_dispose(v12, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_30(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "event", (void)v11);
        if (v8) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
    __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_30_cold_1(v2);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_32(uint64_t a1, void *a2)
{
  id v4 = [a2 eventBody];
  id v3 = objc_alloc_init(CKContextUserFacingUniversalRecent);
  [(CKContextUserFacingUniversalRecent *)v3 setEvent:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) insertObject:v3 atIndex:0];
}

- (unint64_t)_maximumNumberOfItemsToRetrieve
{
  if (self->_configuration == 1) {
    return 10;
  }
  else {
    return 1000;
  }
}

- (void)retrieveRecentsBetweenStartDate:(id)a3 endDate:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = v10;
  if (v10)
  {
    if (v8 && v9)
    {
      long long v12 = [MEMORY[0x263EFF910] date];
      [v8 timeIntervalSinceReferenceDate];
      long long v14 = v13;
      objc_initWeak(&location, self);
      biomeQueue = self->_biomeQueue;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke;
      v18[3] = &unk_2647D3008;
      objc_copyWeak(v22, &location);
      id v16 = v11;
      v22[1] = v14;
      id v21 = v16;
      id v19 = v12;
      id v20 = v9;
      id v17 = v12;
      dispatch_async(biomeQueue, v18);

      objc_destroyWeak(v22);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

void __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained _maximumNumberOfItemsToRetrieve];
    uint64_t v5 = [v3[1] publisherFromStartTime:*(double *)(a1 + 64)];
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__0;
    v15[4] = __Block_byref_object_dispose__0;
    id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke_2;
    v11[3] = &unk_2647D2FB8;
    long long v14 = v15;
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke_37;
    v7[3] = &unk_2647D2FE0;
    id v8 = *(id *)(a1 + 40);
    id v9 = v15;
    uint64_t v10 = v4;
    id v6 = (id)[v5 sinkWithCompletion:v11 shouldContinue:v7];

    _Block_object_dispose(v15, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
    __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke_2_cold_1(a1);
  }
  uint64_t v4 = [MEMORY[0x263EFF9D8] orderedSetWithArray:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "event", (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke_37(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x22A6640A0]();
  id v5 = [v3 eventBody];
  id v6 = (void *)MEMORY[0x263EFF910];
  [v5 absoluteTimestamp];
  uint64_t v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v8 = v7;
  if (!v5
    || ([v7 earlierDate:a1[4]],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = (void *)a1[4],
        v9,
        v9 == v10))
  {
    uint64_t v12 = 0;
  }
  else
  {
    long long v11 = objc_alloc_init(CKContextUserFacingUniversalRecent);
    [(CKContextUserFacingUniversalRecent *)v11 setEvent:v5];
    [*(id *)(*(void *)(a1[5] + 8) + 40) insertObject:v11 atIndex:0];
    if ((unint64_t)[*(id *)(*(void *)(a1[5] + 8) + 40) count] >= a1[6]) {
      [*(id *)(*(void *)(a1[5] + 8) + 40) removeLastObject];
    }

    uint64_t v12 = 1;
  }

  return v12;
}

- (void)retrieveRecentMatchingUUID:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    if (v6)
    {
      objc_initWeak(&location, self);
      biomeQueue = self->_biomeQueue;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __62__CKContextRecentsCache_retrieveRecentMatchingUUID_withReply___block_invoke;
      v10[3] = &unk_2647D2F90;
      objc_copyWeak(&v13, &location);
      id v12 = v8;
      id v11 = v6;
      dispatch_async(biomeQueue, v10);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

void __62__CKContextRecentsCache_retrieveRecentMatchingUUID_withReply___block_invoke(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[1] publisherFromStartTime:0.0];
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__0;
    v12[4] = __Block_byref_object_dispose__0;
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __62__CKContextRecentsCache_retrieveRecentMatchingUUID_withReply___block_invoke_2;
    v9[3] = &unk_2647D2F40;
    id v11 = v12;
    id v10 = a1[5];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__CKContextRecentsCache_retrieveRecentMatchingUUID_withReply___block_invoke_3;
    v6[3] = &unk_2647D3030;
    id v7 = a1[4];
    uint64_t v8 = v12;
    id v5 = (id)[v4 sinkWithCompletion:v9 receiveInput:v6];

    _Block_object_dispose(v12, 8);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

void __62__CKContextRecentsCache_retrieveRecentMatchingUUID_withReply___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) firstObject];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__CKContextRecentsCache_retrieveRecentMatchingUUID_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = [a2 eventBody];
  id v3 = [v5 uuid];
  int v4 = [v3 isEqual:*(void *)(a1 + 32)];

  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
  }
}

- (void)removeAllRecentsWithReply:(id)a3
{
  int v4 = (objc_class *)MEMORY[0x263F2A990];
  id v5 = (void (**)(id, uint64_t))a3;
  id v6 = [v4 alloc];
  id v7 = [(BMUserActivityMetadataStream *)self->_stream identifier];
  id v8 = (id)[v6 initWithRestrictedStreamIdentifier:v7];

  [v8 pruneWithPredicateBlock:&__block_literal_global_0];
  v5[2](v5, 1);
}

uint64_t __51__CKContextRecentsCache_removeAllRecentsWithReply___block_invoke()
{
  return 1;
}

- (void)removeRecentWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F2A990]);
  id v6 = [(BMUserActivityMetadataStream *)self->_stream identifier];
  id v7 = (void *)[v5 initWithRestrictedStreamIdentifier:v6];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__CKContextRecentsCache_removeRecentWithUUID___block_invoke;
  v9[3] = &unk_2647D3078;
  id v10 = v4;
  id v8 = v4;
  [v7 pruneWithPredicateBlock:v9];
}

uint64_t __46__CKContextRecentsCache_removeRecentWithUUID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 eventBody];
  id v6 = [v5 uuid];
  uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7) {
    *a3 = 1;
  }

  return v7;
}

- (void)removeRecentsMatchingRecent:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__0;
  id v13 = __Block_byref_object_dispose__0;
  long long v14 = objc_alloc_init(CKContextUserFacingUniversalRecent);
  [(id)v10[5] setEvent:v4];
  id v5 = objc_alloc(MEMORY[0x263F2A990]);
  id v6 = [(BMUserActivityMetadataStream *)self->_stream identifier];
  uint64_t v7 = (void *)[v5 initWithRestrictedStreamIdentifier:v6];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__CKContextRecentsCache_removeRecentsMatchingRecent___block_invoke;
  v8[3] = &unk_2647D30A0;
  v8[4] = &v9;
  [v7 pruneWithPredicateBlock:v8];

  _Block_object_dispose(&v9, 8);
}

uint64_t __53__CKContextRecentsCache_removeRecentsMatchingRecent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x22A6640A0]();
  id v5 = objc_alloc_init(CKContextUserFacingUniversalRecent);
  id v6 = [v3 eventBody];
  [(CKContextUserFacingUniversalRecent *)v5 setEvent:v6];

  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isEqual:v5];

  return v7;
}

- (void)pruneRecentsForBundleIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F2A990]);
  id v6 = [(BMUserActivityMetadataStream *)self->_stream identifier];
  uint64_t v7 = (void *)[v5 initWithRestrictedStreamIdentifier:v6];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__CKContextRecentsCache_pruneRecentsForBundleIdentifiers___block_invoke;
  v9[3] = &unk_2647D3078;
  id v10 = v4;
  id v8 = v4;
  [v7 pruneWithPredicateBlock:v9];
}

uint64_t __58__CKContextRecentsCache_pruneRecentsForBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 associatedBundleId];
  uint64_t v6 = [v4 containsObject:v5];

  return v6;
}

- (void)retrieveRecentsCatalogWithStyle:(unint64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __67__CKContextRecentsCache_retrieveRecentsCatalogWithStyle_withReply___block_invoke;
    v8[3] = &unk_2647D30C8;
    id v9 = v6;
    unint64_t v10 = a3;
    v8[4] = self;
    [(CKContextRecentsCache *)self allRecentsWithReply:v8];
  }
}

void __67__CKContextRecentsCache_retrieveRecentsCatalogWithStyle_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    switch(*(void *)(a1 + 48))
    {
      case 0:
        [*(id *)(a1 + 32) _groupActivitiesByDateIntoSectionsWithRecents:v3 limit:4 reply:*(void *)(a1 + 40)];
        break;
      case 1:
        [*(id *)(a1 + 32) _groupActivitiesByAppIntoSectionsWithRecents:v3 limit:4 reply:*(void *)(a1 + 40)];
        break;
      case 2:
        [*(id *)(a1 + 32) _groupActivitiesByConstellationIntoSectionsWithRecents:v3 limit:4 reply:*(void *)(a1 + 40)];
        break;
      case 3:
        [*(id *)(a1 + 32) _groupActivitiesByModeIntoSectionsWithRecents:v3 limit:4 reply:*(void *)(a1 + 40)];
        break;
      default:
        break;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)retrieveRecentsMatchingBundleIdentifier:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    objc_initWeak(&location, self);
    biomeQueue = self->_biomeQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke;
    v9[3] = &unk_2647D2F90;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    id v10 = v6;
    dispatch_async(biomeQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained _maximumNumberOfItemsToRetrieve];
    id v5 = [v3[1] publisherFromStartTime:0.0];
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__0;
    v15[4] = __Block_byref_object_dispose__0;
    id v16 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke_2;
    v13[3] = &unk_2647D30F0;
    id v14 = a1[4];
    id v6 = [v5 filterWithIsIncluded:v13];
    id v7 = [v6 bufferWithSize:v4 prefetch:1 whenFull:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke_3;
    v10[3] = &unk_2647D2F40;
    id v12 = v15;
    id v11 = a1[5];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke_4;
    v9[3] = &unk_2647D2F68;
    void v9[4] = v15;
    id v8 = (id)[v7 sinkWithCompletion:v10 receiveInput:v9];

    _Block_object_dispose(v15, 8);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

uint64_t __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  uint64_t v4 = [v3 associatedBundleId];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v7), "event", (void)v13);
        if (v8) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [v2 array];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
}

void __75__CKContextRecentsCache_retrieveRecentsMatchingBundleIdentifier_withReply___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = [a2 eventBody];
  id v3 = objc_alloc_init(CKContextUserFacingUniversalRecent);
  [(CKContextUserFacingUniversalRecent *)v3 setEvent:v4];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) insertObject:v3 atIndex:0];
}

- (void)retrieveRecentsMatchingMode:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __63__CKContextRecentsCache_retrieveRecentsMatchingMode_withReply___block_invoke;
    v8[3] = &unk_2647D3118;
    id v10 = v7;
    id v9 = v6;
    [(CKContextRecentsCache *)self allRecentsWithReply:v8];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __63__CKContextRecentsCache_retrieveRecentsMatchingMode_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "modeIdentifier", (void)v13);
          int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

          if (v12) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)retrieveRecentsForPredictionWithReply:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    biomeQueue = self->_biomeQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke;
    block[3] = &unk_2647D31B0;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(biomeQueue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained _maximumNumberOfItemsToRetrieve];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_cold_1();
    }
    id v5 = [v3[1] publisherFromStartTime:0.0];
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__0;
    v17[4] = __Block_byref_object_dispose__0;
    id v18 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__0;
    v15[4] = __Block_byref_object_dispose__0;
    id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v6 = [v5 filterWithIsIncluded:&__block_literal_global_45];
    id v7 = [v6 bufferWithSize:v4 prefetch:1 whenFull:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_2;
    v10[3] = &unk_2647D3160;
    int v12 = v19;
    long long v13 = v17;
    long long v14 = v15;
    id v11 = *(id *)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_46;
    v9[3] = &unk_2647D3188;
    void v9[4] = v19;
    void v9[5] = v17;
    v9[6] = v15;
    id v8 = (id)[v7 sinkWithCompletion:v10 receiveInput:v9];

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(v17, 8);

    _Block_object_dispose(v19, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_43()
{
  return 1;
}

void __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_2(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v19 = a2;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
    __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_2_cold_1((uint64_t)a1);
  }
  id v3 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = *(id *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v11 = [v10 event];
        int v12 = [v11 uuid];

        if (v12)
        {
          [v3 addObject:v11];
          long long v13 = [*(id *)(*(void *)(a1[7] + 8) + 40) objectForKeyedSubscript:v10];
          long long v14 = [v11 uuid];
          [v4 setObject:v13 forKeyedSubscript:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  uint64_t v15 = *(void *)(a1[6] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;

  uint64_t v17 = *(void *)(a1[7] + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

void __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_46(void *a1, void *a2)
{
  id v7 = [a2 eventBody];
  id v3 = objc_alloc_init(CKContextUserFacingUniversalRecent);
  [(CKContextUserFacingUniversalRecent *)v3 setEvent:v7];
  if (v3)
  {
    ++*(void *)(*(void *)(a1[4] + 8) + 24);
    [*(id *)(*(void *)(a1[5] + 8) + 40) insertObject:v3 atIndex:0];
    id v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:v3];
    id v5 = v4;
    if (v4)
    {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "intValue") + 1);
    }
    else
    {
      uint64_t v6 = &unk_26DAC3C68;
    }
    [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v6 forKeyedSubscript:v3];
    if (v5) {
  }
    }
}

- (void)retrieveRecentsMatchingStrings:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__CKContextRecentsCache_retrieveRecentsMatchingStrings_withReply___block_invoke;
  v10[3] = &unk_2647D31D8;
  id v11 = v6;
  id v12 = v7;
  void v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(CKContextRecentsCache *)self allRecentsWithReply:v10];
}

void __66__CKContextRecentsCache_retrieveRecentsMatchingStrings_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 32), "_recent:matchesKeywords:", v10, *(void *)(a1 + 40), (void)v11))objc_msgSend(v4, "addObject:", v10); {
        }
          }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)retrieveRecentsMatchingTopicIds:(id)a3 titles:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if ([v8 count] || objc_msgSend(v9, "count"))
    {
      objc_initWeak(&location, self);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __74__CKContextRecentsCache_retrieveRecentsMatchingTopicIds_titles_withReply___block_invoke;
      v11[3] = &unk_2647D3200;
      objc_copyWeak(&v15, &location);
      id v14 = v10;
      id v12 = v8;
      id v13 = v9;
      [(CKContextRecentsCache *)self allRecentsWithReply:v11];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

void __74__CKContextRecentsCache_retrieveRecentsMatchingTopicIds_titles_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && [v3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v21 = v3;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v32;
      uint64_t v24 = a1;
      id v25 = WeakRetained;
      uint64_t v22 = *(void *)v32;
      id v23 = v6;
      do
      {
        uint64_t v10 = 0;
        uint64_t v26 = v8;
        do
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
          if (v11)
          {
            id v12 = [WeakRetained _associatedTopicIdsForRecent:*(void *)(*((void *)&v31 + 1) + 8 * v10)];
            id v13 = [WeakRetained _associatedTopicTitlesForRecent:v11];
            if (([v12 intersectsOrderedSet:*(void *)(a1 + 32)] & 1) != 0
              || [v13 intersectsOrderedSet:*(void *)(a1 + 40)])
            {
              objc_msgSend(v5, "addObject:", v11, v21);
            }
            else
            {
              id v14 = [v11 title];
              long long v27 = 0u;
              long long v28 = 0u;
              long long v29 = 0u;
              long long v30 = 0u;
              id v15 = *(id *)(a1 + 40);
              uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v18 = *(void *)v28;
                while (2)
                {
                  id v19 = v5;
                  for (uint64_t i = 0; i != v17; ++i)
                  {
                    if (*(void *)v28 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    if (objc_msgSend(v14, "localizedCaseInsensitiveContainsString:", *(void *)(*((void *)&v27 + 1) + 8 * i), v21))
                    {
                      id v5 = v19;
                      [v19 addObject:v11];
                      goto LABEL_22;
                    }
                  }
                  uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
                  id v5 = v19;
                  if (v17) {
                    continue;
                  }
                  break;
                }
              }
LABEL_22:

              a1 = v24;
              id WeakRetained = v25;
              uint64_t v9 = v22;
              id v6 = v23;
              uint64_t v8 = v26;
            }
          }
          ++v10;
        }
        while (v10 != v8);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v3 = v21;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_modeDidChangeToModeWithModeUUIDString:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
    -[CKContextRecentsCache _modeDidChangeToModeWithModeUUIDString:]();
  }
  id v5 = (NSString *)[v4 copy];
  latestActivity = self->_latestActivity;
  self->_latestActivity = v5;

  uint64_t v7 = [(CKContextRecentsCache *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CKContextRecentsCache *)self delegate];
    [v9 modeDidChangeToModeWithUUIDString:self->_latestActivity forCache:self];
  }
}

- (id)_modeUUIDStringForComputedModeEvent:(id)a3
{
  return (id)[a3 mode];
}

- (void)_updateLatestFocusMode
{
  objc_initWeak(&location, self);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__0;
  void v8[4] = __Block_byref_object_dispose__0;
  id v9 = 0;
  id v3 = [(BMUserFocusComputedModeStream *)self->_computedModeStream publisherFromStartTime:0.0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__CKContextRecentsCache__updateLatestFocusMode__block_invoke;
  v6[3] = &unk_2647D3228;
  objc_copyWeak(&v7, &location);
  void v6[4] = v8;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__CKContextRecentsCache__updateLatestFocusMode__block_invoke_2;
  v5[3] = &unk_2647D2F68;
  v5[4] = v8;
  id v4 = (id)[v3 sinkWithCompletion:v6 receiveInput:v5];

  objc_destroyWeak(&v7);
  _Block_object_dispose(v8, 8);

  objc_destroyWeak(&location);
}

void __47__CKContextRecentsCache__updateLatestFocusMode__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isStarting])
    {
      id v3 = [v4 _modeUUIDStringForComputedModeEvent:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
      [v4 _modeDidChangeToModeWithModeUUIDString:v3];
    }
    else
    {
      [v4 _modeDidChangeToModeWithModeUUIDString:0];
    }
    id WeakRetained = v4;
  }
}

uint64_t __47__CKContextRecentsCache__updateLatestFocusMode__block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 eventBody];
  return MEMORY[0x270F9A758]();
}

- (void)_registerComputedModeStream
{
  id v3 = NSString;
  id v4 = [MEMORY[0x263F08AB0] processInfo];
  id v5 = [v4 processName];
  id v6 = [v3 stringWithFormat:@"%@.%@", @"CKContextRecentsCache.Modes", v5];

  objc_initWeak(&location, self);
  id v7 = [(BMUserFocusComputedModeStream *)self->_computedModeStream publisher];
  char v8 = (void *)[objc_alloc(MEMORY[0x263F2A758]) initWithIdentifier:v6 targetQueue:self->_computedFocusModeQueue];
  id v9 = [v7 subscribeOn:v8];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__CKContextRecentsCache__registerComputedModeStream__block_invoke_62;
  v12[3] = &unk_2647D3270;
  objc_copyWeak(&v13, &location);
  uint64_t v10 = [v9 sinkWithCompletion:&__block_literal_global_61 receiveInput:v12];
  computedModeSink = self->_computedModeSink;
  self->_computedModeSink = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __52__CKContextRecentsCache__registerComputedModeStream__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state])
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __52__CKContextRecentsCache__registerComputedModeStream__block_invoke_cold_2(v2);
    }
  }
  else
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
    if (v3) {
      __52__CKContextRecentsCache__registerComputedModeStream__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void __52__CKContextRecentsCache__registerComputedModeStream__block_invoke_62(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = [v6 eventBody];
    if ([v4 isStarting])
    {
      uint64_t v5 = [WeakRetained _modeUUIDStringForComputedModeEvent:v4];
      [WeakRetained _modeDidChangeToModeWithModeUUIDString:v5];
    }
    else
    {
      [WeakRetained _modeDidChangeToModeWithModeUUIDString:0];
    }
  }
}

- (void)_groupActivitiesByDateIntoSectionsWithRecents:(id)a3 limit:(unint64_t)a4 reply:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v9)
  {
    id v23 = (void (**)(void, void *, id, id))v9;
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v24 = v8;
    id obj = v8;
    uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v18 = [(CKContextRecentsCache *)self _relativeDateStringForRecent:v17];
          id v19 = [v12 objectForKeyedSubscript:v18];
          long long v20 = v19;
          if (!a4 || [v19 count] < a4)
          {
            if (v20) {
              [v20 arrayByAddingObject:v17];
            }
            else {
            id v21 = [MEMORY[0x263EFF8C0] arrayWithObject:v17];
            }
            [v12 setObject:v21 forKeyedSubscript:v18];

            [v11 setObject:v18 forKeyedSubscript:v18];
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v14);
    }

    uint64_t v22 = [v12 keysSortedByValueUsingComparator:&__block_literal_global_66];
    uint64_t v10 = v23;
    v23[2](v23, v22, v11, v12);

    id v8 = v24;
  }
}

uint64_t __83__CKContextRecentsCache__groupActivitiesByDateIntoSectionsWithRecents_limit_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [a2 firstObject];
  [v6 absoluteTimestamp];
  uint64_t v7 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");

  id v8 = (void *)MEMORY[0x263EFF910];
  id v9 = [v5 firstObject];

  [v9 absoluteTimestamp];
  uint64_t v10 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");

  uint64_t v11 = [v10 compare:v7];
  return v11;
}

- (void)_groupActivitiesByAppIntoSectionsWithRecents:(id)a3 limit:(unint64_t)a4 reply:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    id v23 = (void (**)(void, void *, id, id))v8;
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v24 = v7;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v17, "associatedBundleId", v23);
          id v19 = [v11 objectForKeyedSubscript:v18];
          long long v20 = v19;
          if (!a4 || [v19 count] < a4)
          {
            if (v20) {
              [v20 arrayByAddingObject:v17];
            }
            else {
            id v21 = [MEMORY[0x263EFF8C0] arrayWithObject:v17];
            }
            [v11 setObject:v21 forKeyedSubscript:v18];

            [v10 setObject:v18 forKeyedSubscript:v18];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }

    uint64_t v22 = [v11 keysSortedByValueUsingComparator:&__block_literal_global_68];
    id v9 = v23;
    v23[2](v23, v22, v10, v11);

    id v7 = v24;
  }
}

uint64_t __82__CKContextRecentsCache__groupActivitiesByAppIntoSectionsWithRecents_limit_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [a2 firstObject];
  [v6 absoluteTimestamp];
  id v7 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");

  id v8 = (void *)MEMORY[0x263EFF910];
  id v9 = [v5 firstObject];

  [v9 absoluteTimestamp];
  id v10 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");

  uint64_t v11 = [v10 compare:v7];
  return v11;
}

- (void)_groupActivitiesByConstellationIntoSectionsWithRecents:(id)a3 limit:(unint64_t)a4 reply:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v7 = a5;
  if (v7)
  {
    long long v33 = (void *)a4;
    id v34 = v7;
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v35;
    uint64_t v39 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v39)
    {
      uint64_t v37 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v46 != v37) {
            objc_enumerationMutation(obj);
          }
          id v10 = -[CKContextRecentsCache _associatedTopicIdsForRecent:](self, "_associatedTopicIdsForRecent:", *(void *)(*((void *)&v45 + 1) + 8 * i), v33);
          uint64_t v11 = [v10 array];

          unint64_t v12 = [v11 count];
          if (v12 >= 4) {
            uint64_t v13 = 4;
          }
          else {
            uint64_t v13 = v12;
          }
          if (v13)
          {
            for (unint64_t j = 0; j < v20; ++j)
            {
              uint64_t v15 = [v11 objectAtIndexedSubscript:j];
              uint64_t v16 = [v8 objectForKeyedSubscript:v15];
              uint64_t v17 = v16;
              if (v16)
              {
                uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "intValue") + 1);
                [v8 setObject:v18 forKeyedSubscript:v15];
              }
              else
              {
                [v8 setObject:&unk_26DAC3C68 forKeyedSubscript:v15];
              }

              unint64_t v19 = [v11 count];
              if (v19 >= 4) {
                unint64_t v20 = 4;
              }
              else {
                unint64_t v20 = v19;
              }
            }
          }
        }
        uint64_t v39 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v39);
    }

    id v21 = [v8 allKeys];
    uint64_t v22 = [v21 sortedArrayUsingSelector:sel_compare_];

    unint64_t v23 = [v22 count];
    if (v23 >= 0x32) {
      uint64_t v24 = 50;
    }
    else {
      uint64_t v24 = v23;
    }
    id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v24)
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        long long v27 = objc_msgSend(v22, "objectAtIndexedSubscript:", k, v33);
        long long v28 = [v8 objectForKeyedSubscript:v27];
        [v25 setObject:v28 forKeyedSubscript:v27];
      }
    }
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2050000000;
    long long v29 = (void *)getCKContextClientClass_softClass;
    uint64_t v53 = getCKContextClientClass_softClass;
    if (!getCKContextClientClass_softClass)
    {
      location[0] = (id)MEMORY[0x263EF8330];
      location[1] = (id)3221225472;
      location[2] = __getCKContextClientClass_block_invoke;
      location[3] = &unk_2647D2E60;
      location[4] = &v50;
      __getCKContextClientClass_block_invoke((uint64_t)location);
      long long v29 = (void *)v51[3];
    }
    id v30 = v29;
    _Block_object_dispose(&v50, 8);
    uint64_t v31 = [v30 clientWithDefaultRequestType:5];
    long long v32 = (void *)[v31 newRequest];
    [v32 setIncludeHigherLevelTopics:1];
    [v32 setMaxConstellationTopics:15];
    [v32 setItemIds:v25];
    objc_initWeak(location, self);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __92__CKContextRecentsCache__groupActivitiesByConstellationIntoSectionsWithRecents_limit_reply___block_invoke;
    v40[3] = &unk_2647D32B8;
    objc_copyWeak(v44, location);
    id v43 = v34;
    id v41 = obj;
    v42 = self;
    v44[1] = v33;
    [v32 executeWithReply:v40];

    objc_destroyWeak(v44);
    objc_destroyWeak(location);

    id v7 = v34;
  }
}

void __92__CKContextRecentsCache__groupActivitiesByConstellationIntoSectionsWithRecents_limit_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (!WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_36;
  }
  id v26 = WeakRetained;
  id v27 = v3;
  id v30 = [v3 level2Topics];
  id v33 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v31 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (!v31) {
    goto LABEL_32;
  }
  uint64_t v29 = *(void *)v40;
  do
  {
    for (uint64_t i = 0; i != v31; ++i)
    {
      if (*(void *)v40 != v29) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void *)(*((void *)&v39 + 1) + 8 * i);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v8 = v30;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (!v9)
      {

LABEL_26:
        unint64_t v20 = [v34 objectForKeyedSubscript:@"Other"];
        id v21 = v20;
        if (v20) {
          [v20 arrayByAddingObject:v7];
        }
        else {
        uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObject:v7];
        }
        [v34 setObject:v22 forKeyedSubscript:@"Other"];

        [v33 setObject:@"Other" forKeyedSubscript:@"Other"];
        continue;
      }
      uint64_t v10 = v9;
      uint64_t v32 = i;
      char v11 = 0;
      uint64_t v12 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          uint64_t v15 = [v14 topicId];
          if ([v15 length]
            && [*(id *)(a1 + 40) _constellationResult:v14 intersectsWithRecent:v7])
          {
            uint64_t v16 = [v34 objectForKeyedSubscript:v15];
            uint64_t v17 = v16;
            if (!*(void *)(a1 + 64) || (unint64_t)[v16 count] < *(void *)(a1 + 64))
            {
              if (v17) {
                [v17 arrayByAddingObject:v7];
              }
              else {
              uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObject:v7];
              }
              [v34 setObject:v18 forKeyedSubscript:v15];

              unint64_t v19 = [v14 title];
              [v33 setObject:v19 forKeyedSubscript:v15];
            }
            char v11 = 1;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v10);

      uint64_t i = v32;
      if ((v11 & 1) == 0) {
        goto LABEL_26;
      }
    }
    uint64_t v31 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  }
  while (v31);
LABEL_32:

  unint64_t v23 = [v34 keysSortedByValueUsingComparator:&__block_literal_global_75];
  uint64_t v24 = [MEMORY[0x263EFF980] arrayWithArray:v23];
  uint64_t v25 = [v24 indexOfObject:@"Other"];
  if (v25 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v24 removeObjectAtIndex:v25];
    [v24 addObject:@"Other"];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  id v5 = v26;
  id v3 = v27;
LABEL_36:
}

uint64_t __92__CKContextRecentsCache__groupActivitiesByConstellationIntoSectionsWithRecents_limit_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [a2 firstObject];
  [v6 absoluteTimestamp];
  uint64_t v7 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");

  id v8 = (void *)MEMORY[0x263EFF910];
  uint64_t v9 = [v5 firstObject];

  [v9 absoluteTimestamp];
  uint64_t v10 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");

  uint64_t v11 = [v10 compare:v7];
  return v11;
}

- (void)_groupActivitiesByModeIntoSectionsWithRecents:(id)a3 limit:(unint64_t)a4 reply:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v24 = (void (**)(void, void *, id, id))v8;
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v25 = v7;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v17, "modeIdentifier", v24);
          if ([v18 length])
          {
            unint64_t v19 = [v17 modeIdentifier];
          }
          else
          {
            unint64_t v19 = @"Other";
          }

          unint64_t v20 = [v11 objectForKeyedSubscript:v19];
          id v21 = v20;
          if (!a4 || [v20 count] < a4)
          {
            if (v21) {
              [v21 arrayByAddingObject:v17];
            }
            else {
            uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObject:v17];
            }
            [v11 setObject:v22 forKeyedSubscript:v19];

            [v10 setObject:v19 forKeyedSubscript:v19];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v14);
    }

    unint64_t v23 = [v11 keysSortedByValueUsingComparator:&__block_literal_global_78];
    uint64_t v9 = v24;
    v24[2](v24, v23, v10, v11);

    id v7 = v25;
  }
}

uint64_t __83__CKContextRecentsCache__groupActivitiesByModeIntoSectionsWithRecents_limit_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [a2 firstObject];
  [v6 absoluteTimestamp];
  id v7 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");

  id v8 = (void *)MEMORY[0x263EFF910];
  uint64_t v9 = [v5 firstObject];

  [v9 absoluteTimestamp];
  id v10 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");

  uint64_t v11 = [v10 compare:v7];
  return v11;
}

- (BOOL)_constellationResult:(id)a3 intersectsWithRecent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  char v9 = 0;
  if (v6 && v7)
  {
    id v10 = [(CKContextRecentsCache *)self _associatedTopicTitlesForRecent:v7];
    uint64_t v11 = [v6 title];
    char v12 = [v10 containsObject:v11];

    if (v12)
    {
      char v9 = 1;
    }
    else
    {
      uint64_t v13 = [v6 topicId];
      if ([v13 length])
      {
        uint64_t v14 = [(CKContextRecentsCache *)self _associatedTopicIdsForRecent:v8];
        uint64_t v15 = [v6 relatedItems];
        if ([v15 intersectsOrderedSet:v14]) {
          char v9 = 1;
        }
        else {
          char v9 = [v14 containsObject:v13];
        }
      }
      else
      {
        char v9 = 0;
      }
    }
  }

  return v9;
}

- (BOOL)_recent:(id)a3 matchesKeywords:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && [v7 count])
  {
    char v9 = [(CKContextRecentsCache *)self _associatedTopicTitlesForRecent:v6];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v6, "title", (void)v20);
          char v17 = [v16 localizedCaseInsensitiveContainsString:v15];

          if (v17 & 1) != 0 || ([v9 containsObject:v15])
          {
            BOOL v18 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        BOOL v18 = 0;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
LABEL_16:
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)_relativeDateStringForRecent:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = (void *)MEMORY[0x263EFF910];
  [v4 absoluteTimestamp];
  double v8 = v7;

  char v9 = [v6 dateWithTimeIntervalSinceReferenceDate:v8];
  [v5 setTimeStyle:0];
  [v5 setDateStyle:3];
  [v5 setDoesRelativeDateFormatting:1];
  id v10 = [v5 stringFromDate:v9];

  return v10;
}

- (id)_associatedTopicIdsForRecent:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(v3, "topics", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) topicIdentifier];
        if ([v10 length] && objc_msgSend(v10, "hasPrefix:", @"Q")) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_associatedTopicTitlesForRecent:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(v3, "topics", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) title];
        if ([v10 length]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_scheduleDeferredMaintenanceTasks
{
  deferredMaintenanceTaskBlocuint64_t k = self->_deferredMaintenanceTaskBlock;
  if (deferredMaintenanceTaskBlock) {
    dispatch_block_cancel(deferredMaintenanceTaskBlock);
  }
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__CKContextRecentsCache__scheduleDeferredMaintenanceTasks__block_invoke;
  v8[3] = &unk_2647D2DE8;
  objc_copyWeak(&v9, &location);
  dispatch_block_t v4 = dispatch_block_create((dispatch_block_flags_t)0, v8);
  id v5 = self->_deferredMaintenanceTaskBlock;
  self->_deferredMaintenanceTaskBlocuint64_t k = v4;

  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  uint64_t v7 = dispatch_get_global_queue(9, 0);
  dispatch_after(v6, v7, self->_deferredMaintenanceTaskBlock);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__CKContextRecentsCache__scheduleDeferredMaintenanceTasks__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _performMaintenanceTasks];
    id v2 = (void *)v3[3];
    v3[3] = 0;

    id WeakRetained = v3;
  }
}

- (void)_performMaintenanceTasks
{
}

void __49__CKContextRecentsCache__performMaintenanceTasks__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_block_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _performMaintenanceTasksForRecents:v5];
  }
}

- (void)_performMaintenanceTasksForRecents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    [(CKContextRecentsCache *)self _pruneRecentsFromUnusedAppsForRecents:v4];
    objc_initWeak(location, self);
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    dispatch_time_t v6 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__CKContextRecentsCache__performMaintenanceTasksForRecents___block_invoke;
    block[3] = &unk_2647D2DE8;
    objc_copyWeak(&v9, location);
    dispatch_after(v5, v6, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "There was nothing new to prune", (uint8_t *)location, 2u);
    }
    deferredMaintenanceTransaction = self->_deferredMaintenanceTransaction;
    self->_deferredMaintenanceTransaction = 0;
  }
}

void __60__CKContextRecentsCache__performMaintenanceTasksForRecents___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;
    id v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  deferredMaintenanceTaskBlocuint64_t k = self->_deferredMaintenanceTaskBlock;
  if (deferredMaintenanceTaskBlock) {
    dispatch_block_cancel(deferredMaintenanceTaskBlock);
  }
  [(BPSSink *)self->_computedModeSink cancel];
  v4.receiver = self;
  v4.super_class = (Class)CKContextRecentsCache;
  [(CKContextRecentsCache *)&v4 dealloc];
}

- (void)_pruneRecentsFromUnusedAppsForRecents:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
  if (v4) {
    -[CKContextRecentsCache _pruneRecentsFromUnusedAppsForRecents:](v4, v5, v6, v7, v8, v9, v10, v11);
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        BOOL v18 = [*(id *)(*((void *)&v24 + 1) + 8 * v17) associatedBundleId];
        if ([v18 length] && (objc_msgSend(v13, "containsObject:", v18) & 1) == 0)
        {
          [v13 addObject:v18];
          uint64_t v29 = 0;
          id v30 = &v29;
          uint64_t v31 = 0x2050000000;
          unint64_t v19 = (void *)getLSApplicationRecordClass_softClass;
          uint64_t v32 = getLSApplicationRecordClass_softClass;
          if (!getLSApplicationRecordClass_softClass)
          {
            v28[0] = MEMORY[0x263EF8330];
            v28[1] = 3221225472;
            v28[2] = __getLSApplicationRecordClass_block_invoke;
            v28[3] = &unk_2647D2E60;
            v28[4] = &v29;
            __getLSApplicationRecordClass_block_invoke((uint64_t)v28);
            unint64_t v19 = (void *)v30[3];
          }
          id v20 = v19;
          _Block_object_dispose(&v29, 8);
          uint64_t v23 = 0;
          long long v21 = [v20 bundleRecordWithApplicationIdentifier:v18 error:&v23];
          if (!v21 || v23) {
            [v12 addObject:v18];
          }
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v15);
  }

  [(CKContextRecentsCache *)self pruneRecentsForBundleIdentifiers:v12];
}

- (CKContextRecentsCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CKContextRecentsCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_computedModeSink, 0);
  objc_storeStrong((id *)&self->_computedFocusModeQueue, 0);
  objc_storeStrong((id *)&self->_computedModeStream, 0);
  objc_storeStrong((id *)&self->_latestActivity, 0);
  objc_storeStrong((id *)&self->_deferredMaintenanceTransaction, 0);
  objc_storeStrong(&self->_deferredMaintenanceTaskBlock, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

void __117__CKContextRecentsCache_insertUserActivityData_preferredTitle_bundleId_topics_hasAssociatedImageRepresentation_uuid___block_invoke_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Could not create user activity data: %@", v0, 0xCu);
}

void __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226BEC000, MEMORY[0x263EF8438], v0, "Retrieving up to %lu number of items from Biome", v1, v2, v3, v4, v5);
}

void __45__CKContextRecentsCache_allRecentsWithReply___block_invoke_30_cold_1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226BEC000, MEMORY[0x263EF8438], v1, "Retrieved %lu unique items from Biome", v2, v3, v4, v5, v6);
}

void __75__CKContextRecentsCache_retrieveRecentsBetweenStartDate_endDate_withReply___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
  int v5 = 134218240;
  uint64_t v6 = v2;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Retrieved %lu activities from Biome. Took %f seconds.", (uint8_t *)&v5, 0x16u);
}

void __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226BEC000, MEMORY[0x263EF8438], v0, "Retrieving up to %lu number of items from Biome for Kettle predictions", v1, v2, v3, v4, v5);
}

void __63__CKContextRecentsCache_retrieveRecentsForPredictionWithReply___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
  int v3 = 134218240;
  uint64_t v4 = v1;
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_debug_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Retrieved %lu items from Biome for Kettle predictions (%lu unique items)", (uint8_t *)&v3, 0x16u);
}

- (void)_modeDidChangeToModeWithModeUUIDString:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226BEC000, MEMORY[0x263EF8438], v0, "Mode did change to mode with UUID: %@", v1, v2, v3, v4, v5);
}

void __52__CKContextRecentsCache__registerComputedModeStream__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__CKContextRecentsCache__registerComputedModeStream__block_invoke_cold_2(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_226BEC000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Error listening to computed focus mode stream with error: %@", v2, 0xCu);
}

- (void)_pruneRecentsFromUnusedAppsForRecents:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end