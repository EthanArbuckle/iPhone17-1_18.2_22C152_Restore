@interface DDSAssertionTracker
- (DDSAssertionDataHandling)dataHandler;
- (DDSAssertionTracker)initWithDataHandler:(id)a3;
- (DDSAssetTrackingDelegate)delegate;
- (NSMutableArray)trackedAssertions;
- (NSMutableDictionary)assertionUpdateStatus;
- (NSMutableDictionary)trackedAssertionSets;
- (OS_dispatch_queue)queue;
- (double)intervalForDownloadFrequency:(int64_t)a3;
- (id)allAssertions;
- (id)assertionDueForUpdateFrom:(id)a3 SinceDate:(id)a4;
- (id)assertionDueForUpdateSinceDate:(id)a3;
- (id)assertionForQuery:(id)a3;
- (id)assertionIDsForClientID:(id)a3;
- (id)trackedAssetTypes;
- (int64_t)updateStatusForAssertion:(id)a3;
- (void)addAssertionForQuery:(id)a3 policy:(id)a4 assertionID:(id)a5 clientID:(id)a6;
- (void)didUpdateAssertion:(id)a3 atDate:(id)a4;
- (void)modifyUpdateStatusForAssertion:(id)a3 toStatus:(int64_t)a4;
- (void)removeAssertionWithID:(id)a3;
- (void)resetAssertionDueDatesForAssetType:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DDSAssertionTracker

- (DDSAssertionTracker)initWithDataHandler:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DDSAssertionTracker;
  v6 = [(DDSAssertionTracker *)&v14 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.DataDeliveryServices.DDSAssertionTracker", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_dataHandler, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assertionUpdateStatus = v6->_assertionUpdateStatus;
    v6->_assertionUpdateStatus = v11;
  }
  return v6;
}

- (id)allAssertions
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  v3 = [(DDSAssertionTracker *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__DDSAssertionTracker_allAssertions__block_invoke;
  v6[3] = &unk_1E6E3A7F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __36__DDSAssertionTracker_allAssertions__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) trackedAssertions];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)assertionDueForUpdateSinceDate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  id v5 = [(DDSAssertionTracker *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__DDSAssertionTracker_assertionDueForUpdateSinceDate___block_invoke;
  block[3] = &unk_1E6E3A818;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __54__DDSAssertionTracker_assertionDueForUpdateSinceDate___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v6 = [v2 trackedAssertions];
  uint64_t v3 = [v2 assertionDueForUpdateFrom:v6 SinceDate:a1[5]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)assertionDueForUpdateFrom:(id)a3 SinceDate:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "policy", (void)v25);
        uint64_t v16 = [v15 preferredDownloadFrequency];

        [(DDSAssertionTracker *)self intervalForDownloadFrequency:v16];
        double v18 = v17;
        uint64_t v19 = [v14 lastUpdated];
        if (v19)
        {
          v20 = (void *)v19;
          v21 = [v14 lastUpdated];
          [v7 timeIntervalSinceDate:v21];
          double v23 = v22;

          if (v23 <= v18) {
            continue;
          }
        }
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)resetAssertionDueDatesForAssetType:(id)a3
{
  id v4 = a3;
  id v5 = [(DDSAssertionTracker *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__DDSAssertionTracker_resetAssertionDueDatesForAssetType___block_invoke;
  v7[3] = &unk_1E6E39F58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __58__DDSAssertionTracker_resetAssertionDueDatesForAssetType___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "trackedAssertions", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = [v7 query];
        id v9 = [v8 assetType];
        int v10 = [v9 isEqualToString:*(void *)(a1 + 40)];

        if (v10) {
          [v7 setLastUpdated:0];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  uint64_t v11 = [*(id *)(a1 + 32) dataHandler];
  uint64_t v12 = [*(id *)(a1 + 32) trackedAssertions];
  [v11 saveAssertionData:v12];
}

- (void)addAssertionForQuery:(id)a3 policy:(id)a4 assertionID:(id)a5 clientID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__4;
  v48 = __Block_byref_object_dispose__4;
  id v49 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4;
  v38 = __Block_byref_object_dispose__4;
  id v39 = 0;
  long long v14 = [(DDSAssertionTracker *)self queue];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __72__DDSAssertionTracker_addAssertionForQuery_policy_assertionID_clientID___block_invoke;
  long long v25 = &unk_1E6E3A840;
  long long v26 = self;
  id v15 = v10;
  id v27 = v15;
  v31 = &v34;
  id v16 = v12;
  id v28 = v16;
  id v17 = v13;
  id v29 = v17;
  id v18 = v11;
  id v30 = v18;
  v32 = &v40;
  v33 = &v44;
  dispatch_sync(v14, &v22);

  if (!*((unsigned char *)v41 + 24))
  {
    uint64_t v19 = [(DDSAssertionTracker *)self delegate];
    v20 = [MEMORY[0x1E4F1CAD0] setWithObject:v45[5]];
    [v19 handleNewAssertions:v20];
  }
  if (v35[5])
  {
    v21 = [(DDSAssertionTracker *)self delegate];
    [v21 handleAddedNewDescriptor:v35[5] forAssertion:v45[5]];
  }
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

void __72__DDSAssertionTracker_addAssertionForQuery_policy_assertionID_clientID___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "trackedAssertions", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v8 = [v7 query];
        int v9 = [v8 isEqualToAssetQuery:*(void *)(a1 + 40)];

        if (v9)
        {
          uint64_t v10 = [v7 addDescriptorWithAssertionID:*(void *)(a1 + 48) clientID:*(void *)(a1 + 56) policy:*(void *)(a1 + 64)];
          uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
          id v12 = *(void **)(v11 + 40);
          *(void *)(v11 + 40) = v10;

          *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    id v13 = [[DDSAssertion alloc] initWithQuery:*(void *)(a1 + 40)];
    uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) addDescriptorWithAssertionID:*(void *)(a1 + 48) clientID:*(void *)(a1 + 56) policy:*(void *)(a1 + 64)];
    uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    uint64_t v19 = [*(id *)(a1 + 32) trackedAssertions];
    [v19 addObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  }
  v20 = DefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    uint64_t v22 = *(void *)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = v21;
    __int16 v32 = 2114;
    uint64_t v33 = v22;
    __int16 v34 = 2114;
    uint64_t v35 = v23;
    _os_log_impl(&dword_1E41D6000, v20, OS_LOG_TYPE_DEFAULT, "Add assertion (%{public}@) with id (%{public}@) for client (%{public}@)", buf, 0x20u);
  }

  v24 = [*(id *)(a1 + 32) dataHandler];
  long long v25 = [*(id *)(a1 + 32) trackedAssertions];
  [v24 saveAssertionData:v25];
}

- (void)removeAssertionWithID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15[0] = &v14;
  v15[1] = 0x3032000000;
  v15[2] = __Block_byref_object_copy__4;
  v15[3] = __Block_byref_object_dispose__4;
  id v16 = 0;
  uint64_t v5 = [(DDSAssertionTracker *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__DDSAssertionTracker_removeAssertionWithID___block_invoke;
  block[3] = &unk_1E6E3A7C8;
  id v6 = v4;
  id v11 = v6;
  id v12 = self;
  id v13 = &v14;
  dispatch_sync(v5, block);

  id v7 = DefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DDSAssertionTracker removeAssertionWithID:]((uint64_t)v15, v7);
  }

  if (*(void *)(v15[0] + 40))
  {
    id v8 = [(DDSAssertionTracker *)self delegate];
    int v9 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(v15[0] + 40)];
    [v8 handleRemovedAssertions:v9];
  }
  _Block_object_dispose(&v14, 8);
}

void __45__DDSAssertionTracker_removeAssertionWithID___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v3;
    _os_log_impl(&dword_1E41D6000, v2, OS_LOG_TYPE_DEFAULT, "Remove assertion with id: %{public}@", buf, 0xCu);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [*(id *)(a1 + 40) trackedAssertions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v24;
    *(void *)&long long v6 = 138543362;
    long long v22 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "assertionIdentifiers", v22);
        int v12 = [v11 containsObject:*(void *)(a1 + 32)];

        if (v12)
        {
          [v10 removeDescriptorWithAssertionID:*(void *)(a1 + 32)];
          id v13 = DefaultLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v17 = *(void *)(a1 + 32);
            *(_DWORD *)buf = v22;
            uint64_t v31 = v17;
            _os_log_debug_impl(&dword_1E41D6000, v13, OS_LOG_TYPE_DEBUG, "Removed descriptor id: %{public}@", buf, 0xCu);
          }
        }
        uint64_t v14 = [v10 descriptors];
        uint64_t v15 = [v14 count];

        if (!v15)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v10);
          id v18 = DefaultLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            __45__DDSAssertionTracker_removeAssertionWithID___block_invoke_cold_1(a1 + 48, v18);
          }

          goto LABEL_21;
        }
        id v16 = DefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          __45__DDSAssertionTracker_removeAssertionWithID___block_invoke_cold_2(v27, v10, &v28, v16);
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v19 = [*(id *)(a1 + 40) trackedAssertions];
    [v19 removeObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  v20 = [*(id *)(a1 + 40) dataHandler];
  uint64_t v21 = [*(id *)(a1 + 40) trackedAssertions];
  [v20 saveAssertionData:v21];
}

- (void)didUpdateAssertion:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DDSAssertionTracker *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__DDSAssertionTracker_didUpdateAssertion_atDate___block_invoke;
  block[3] = &unk_1E6E3A7A0;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __49__DDSAssertionTracker_didUpdateAssertion_atDate___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1E41D6000, v2, OS_LOG_TYPE_DEFAULT, "Setting last updated for assertion (%{public}@) set to (%{public}@)", (uint8_t *)&v7, 0x16u);
  }

  [*(id *)(a1 + 32) setLastUpdated:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(a1 + 48) dataHandler];
  id v6 = [*(id *)(a1 + 48) trackedAssertions];
  [v5 saveAssertionData:v6];
}

- (id)assertionForQuery:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  uint64_t v5 = [(DDSAssertionTracker *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__DDSAssertionTracker_assertionForQuery___block_invoke;
  block[3] = &unk_1E6E3A7C8;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __41__DDSAssertionTracker_assertionForQuery___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "trackedAssertions", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = [v7 query];
        int v9 = [v8 isEqualToAssetQuery:*(void *)(a1 + 40)];

        if (v9)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (NSMutableArray)trackedAssertions
{
  trackedAssertions = self->_trackedAssertions;
  if (!trackedAssertions)
  {
    uint64_t v4 = [(DDSAssertionTracker *)self dataHandler];
    uint64_t v5 = [v4 loadAssertionData];
    id v6 = (NSMutableArray *)[v5 mutableCopy];
    id v7 = self->_trackedAssertions;
    self->_trackedAssertions = v6;

    trackedAssertions = self->_trackedAssertions;
  }
  return trackedAssertions;
}

- (double)intervalForDownloadFrequency:(int64_t)a3
{
  double result = 86400.0;
  if (a3 != 1) {
    double result = 0.0;
  }
  if (a3 == 2) {
    return 604800.0;
  }
  return result;
}

- (id)trackedAssetTypes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(DDSAssertionTracker *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__DDSAssertionTracker_trackedAssetTypes__block_invoke;
  v9[3] = &unk_1E6E39F58;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(v4, v9);

  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __40__DDSAssertionTracker_trackedAssetTypes__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "trackedAssertions", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v6) query];
        int v9 = [v8 assetType];
        [v7 addObject:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (id)assertionIDsForClientID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = [(DDSAssertionTracker *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__DDSAssertionTracker_assertionIDsForClientID___block_invoke;
  block[3] = &unk_1E6E3A7A0;
  void block[4] = self;
  id v7 = v5;
  id v13 = v7;
  id v14 = v4;
  id v8 = v4;
  dispatch_sync(v6, block);

  int v9 = v14;
  id v10 = v7;

  return v10;
}

void __47__DDSAssertionTracker_assertionIDsForClientID___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "trackedAssertions", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) assertionIDsForClientID:*(void *)(a1 + 48)];
        [v7 unionSet:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)modifyUpdateStatusForAssertion:(id)a3 toStatus:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(DDSAssertionTracker *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__DDSAssertionTracker_modifyUpdateStatusForAssertion_toStatus___block_invoke;
  block[3] = &unk_1E6E3A868;
  id v10 = v6;
  int64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __63__DDSAssertionTracker_modifyUpdateStatusForAssertion_toStatus___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) assertionUpdateStatus];
  uint64_t v2 = (void *)[objc_alloc(NSNumber) initWithInteger:*(void *)(a1 + 48)];
  id v3 = objc_alloc(NSNumber);
  uint64_t v4 = [*(id *)(a1 + 40) query];
  uint64_t v5 = objc_msgSend(v3, "initWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  [v6 setObject:v2 forKey:v5];
}

- (int64_t)updateStatusForAssertion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v5 = [(DDSAssertionTracker *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__DDSAssertionTracker_updateStatusForAssertion___block_invoke;
  block[3] = &unk_1E6E3A818;
  uint64_t v14 = &v15;
  void block[4] = self;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync(v5, block);

  id v7 = DefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 assertionIdentifiers];
    uint64_t v9 = v16[3];
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = v9;
    _os_log_impl(&dword_1E41D6000, v7, OS_LOG_TYPE_DEFAULT, "Asset Download UI updateStatusForAssertion for Assertion: (%{public}@), status: (%ld)", buf, 0x16u);
  }
  int64_t v10 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __48__DDSAssertionTracker_updateStatusForAssertion___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) assertionUpdateStatus];
  id v2 = objc_alloc(NSNumber);
  id v3 = [*(id *)(a1 + 40) query];
  id v4 = objc_msgSend(v2, "initWithUnsignedInteger:", objc_msgSend(v3, "hash"));
  uint64_t v5 = [v6 objectForKey:v4];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (int)[v5 intValue];
}

- (DDSAssetTrackingDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)assertionUpdateStatus
{
  return self->_assertionUpdateStatus;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)trackedAssertionSets
{
  return self->_trackedAssertionSets;
}

- (DDSAssertionDataHandling)dataHandler
{
  return self->_dataHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataHandler, 0);
  objc_storeStrong((id *)&self->_trackedAssertionSets, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assertionUpdateStatus, 0);
  objc_storeStrong((id *)&self->_trackedAssertions, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)removeAssertionWithID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_DEBUG, "Calling delegate to remove assertion: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __45__DDSAssertionTracker_removeAssertionWithID___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_DEBUG, "Removing assertion: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __45__DDSAssertionTracker_removeAssertionWithID___block_invoke_cold_2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 descriptors];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_debug_impl(&dword_1E41D6000, a4, OS_LOG_TYPE_DEBUG, "Descriptors: %{public}@", a1, 0xCu);
}

@end