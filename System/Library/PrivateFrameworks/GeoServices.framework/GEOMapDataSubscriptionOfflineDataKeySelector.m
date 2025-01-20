@interface GEOMapDataSubscriptionOfflineDataKeySelector
- (GEOMapDataSubscriptionOfflineDataKeySelector)initWithSubscription:(id)a3 requestOptions:(unint64_t)a4 auditToken:(id)a5 requiredLayers:(id)a6 log:(id)a7 logPrefix:(id)a8;
- (NSDictionary)layerVersions;
- (void)_determineKeysToLoadIfNecessary;
- (void)determineNextRequestsWithMaximumCount:(unint64_t)a3 callbackQueue:(id)a4 callback:(id)a5;
- (void)determineTotalCountWithCallbackQueue:(id)a3 callback:(id)a4;
@end

@implementation GEOMapDataSubscriptionOfflineDataKeySelector

- (GEOMapDataSubscriptionOfflineDataKeySelector)initWithSubscription:(id)a3 requestOptions:(unint64_t)a4 auditToken:(id)a5 requiredLayers:(id)a6 log:(id)a7 logPrefix:(id)a8
{
  id v33 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)GEOMapDataSubscriptionOfflineDataKeySelector;
  v19 = [(GEOMapDataSubscriptionOfflineDataKeySelector *)&v34 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_subscription, a3);
    objc_storeStrong((id *)&v20->_log, a7);
    uint64_t v21 = [v18 copy];
    logPrefix = v20->_logPrefix;
    v20->_logPrefix = (NSString *)v21;

    v23 = objc_alloc_init(GEOOfflineDataKeysServiceRequester);
    dataKeyRequester = v20->_dataKeyRequester;
    v20->_dataKeyRequester = v23;

    v20->_requestOptions = a4;
    objc_storeStrong((id *)&v20->_auditToken, a5);
    uint64_t v25 = [v16 copy];
    requiredLayers = v20->_requiredLayers;
    v20->_requiredLayers = (NSArray *)v25;

    uint64_t v27 = geo_dispatch_queue_create_with_workloop_qos();
    workQueue = v20->_workQueue;
    v20->_workQueue = (OS_dispatch_queue *)v27;

    v20->_startedPreparing.lock._os_unfair_lock_opaque = 0;
    v20->_startedPreparing.didRun = 0;
    dispatch_group_t v29 = dispatch_group_create();
    preparationGroup = v20->_preparationGroup;
    v20->_preparationGroup = (OS_dispatch_group *)v29;

    v31 = v20;
  }

  return v20;
}

- (void)_determineKeysToLoadIfNecessary
{
  if (a1)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __79__GEOMapDataSubscriptionOfflineDataKeySelector__determineKeysToLoadIfNecessary__block_invoke;
    v1[3] = &unk_1E53D79D8;
    v1[4] = a1;
    GEOOnce(a1 + 72, v1);
  }
}

void __79__GEOMapDataSubscriptionOfflineDataKeySelector__determineKeysToLoadIfNecessary__block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 80));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__GEOMapDataSubscriptionOfflineDataKeySelector__determineKeysToLoadIfNecessary__block_invoke_2;
  block[3] = &unk_1E53D79D8;
  block[4] = v2;
  dispatch_async(v3, block);
}

void __79__GEOMapDataSubscriptionOfflineDataKeySelector__determineKeysToLoadIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 64));
    uint64_t v2 = objc_alloc_init(GEOPBOfflineDataBatchesRequest);
    v3 = [*(id *)(v1 + 8) region];
    if (![v3 vertexsCount])
    {
      v4 = (void *)[v3 copy];

      v5 = [GEOLatLng alloc];
      [v4 northLat];
      double v7 = v6;
      [v4 westLng];
      v9 = [(GEOLatLng *)v5 initWithLatitude:v7 longitude:v8];
      [v4 addVertex:v9];

      v10 = [GEOLatLng alloc];
      [v4 northLat];
      double v12 = v11;
      [v4 eastLng];
      v14 = [(GEOLatLng *)v10 initWithLatitude:v12 longitude:v13];
      [v4 addVertex:v14];

      id v15 = [GEOLatLng alloc];
      [v4 southLat];
      double v17 = v16;
      [v4 eastLng];
      v19 = [(GEOLatLng *)v15 initWithLatitude:v17 longitude:v18];
      [v4 addVertex:v19];

      v20 = [GEOLatLng alloc];
      [v4 southLat];
      double v22 = v21;
      [v4 westLng];
      v24 = [(GEOLatLng *)v20 initWithLatitude:v22 longitude:v23];
      [v4 addVertex:v24];

      uint64_t v25 = [GEOLatLng alloc];
      [v4 northLat];
      double v27 = v26;
      [v4 westLng];
      dispatch_group_t v29 = [(GEOLatLng *)v25 initWithLatitude:v27 longitude:v28];
      [v4 addVertex:v29];

      v3 = v4;
    }
    [(GEOPBOfflineDataBatchesRequest *)v2 setRegion:v3];

    v30 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    v31 = (void *)[v30 mutableCopy];
    [(GEOPBOfflineDataBatchesRequest *)v2 setSupportedLanguages:v31];

    uint64_t Uint64 = GEOConfigGetUint64(GeoOfflineConfig_OfflineClientVersionModifier, (uint64_t)off_1E91159D8);
    if (Uint64) {
      [(GEOPBOfflineDataBatchesRequest *)v2 setClientVersionModifier:Uint64];
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v33 = *(id *)(v1 + 56);
    uint64_t v34 = [v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v45 != v36) {
            objc_enumerationMutation(v33);
          }
          -[GEOPBOfflineDataBatchesRequest addLayers:](v2, "addLayers:", objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "intValue", (void)v44));
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v35);
    }

    v38 = *(NSObject **)(v1 + 24);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v39 = *(void *)(v1 + 32);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v39;
      _os_log_impl(&dword_188D96000, v38, OS_LOG_TYPE_DEBUG, "%{public}@ Fetching list of keys from data service", (uint8_t *)&buf, 0xCu);
    }
    v40 = *(void **)(v1 + 40);
    v41 = *(void **)(v1 + 16);
    v42 = v41;
    if (!v41)
    {
      v42 = +[GEOApplicationAuditToken currentProcessAuditToken];
    }
    uint64_t v43 = *(void *)(v1 + 48);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v49 = __68__GEOMapDataSubscriptionOfflineDataKeySelector__determineKeysToLoad__block_invoke;
    v50 = &unk_1E53E0B98;
    uint64_t v51 = v1;
    objc_msgSend(v40, "startWithRequest:traits:auditToken:options:completionHandler:", v2, 0, v42, v43, &buf, (void)v44);
    if (!v41) {
  }
    }
}

void __68__GEOMapDataSubscriptionOfflineDataKeySelector__determineKeysToLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 24);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(v8 + 32);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v71 = v10;
      __int16 v72 = 2114;
      id v73 = v7;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch offline data key list: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    double v11 = [v6 layerBatchs];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v14 = 0;
      uint64_t v15 = *(void *)v65;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v65 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v64 + 1) + 8 * v16);
          if (v17) {
            uint64_t v18 = [*(id *)(v17 + 32) count];
          }
          else {
            uint64_t v18 = 0;
          }
          v14 += v18;
          ++v16;
        }
        while (v13 != v16);
        uint64_t v19 = [v11 countByEnumeratingWithState:&v64 objects:v76 count:16];
        uint64_t v13 = v19;
      }
      while (v19);
    }
    else
    {
      v14 = 0;
    }

    uint64_t v20 = *(void *)(a1 + 32);
    double v21 = *(NSObject **)(v20 + 24);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = *(void *)(v20 + 32);
      double v23 = v21;
      uint64_t v24 = [v6 layerBatchsCount];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v71 = v22;
      __int16 v72 = 2050;
      id v73 = v14;
      __int16 v74 = 2050;
      uint64_t v75 = v24;
      _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_INFO, "%{public}@ Fetched offline data key list. %{public}llu total keys across %{public}llu layers", buf, 0x20u);
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), a2);
  if (v6)
  {
    v55 = v7;
    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "layerBatchsCount"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    double v26 = [v6 layerBatchs];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v61;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v61 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v60 + 1) + 8 * v30);
          if (v31)
          {
            uint64_t v32 = v31 + 8;
            LODWORD(v31) = *(_DWORD *)(v31 + 8);
            uint64_t v33 = *(void *)(v32 + 8);
            int v34 = *(unsigned __int8 *)(v32 + 16);
          }
          else
          {
            uint64_t v33 = 0;
            int v34 = 0;
          }
          uint64_t v35 = (v34 << 31 >> 31) & v31;
          uint64_t v36 = [NSNumber numberWithUnsignedLongLong:v33];
          v37 = [NSNumber numberWithInt:v35];
          [v25 setObject:v36 forKeyedSubscript:v37];

          ++v30;
        }
        while (v28 != v30);
        uint64_t v38 = [v26 countByEnumeratingWithState:&v60 objects:v69 count:16];
        uint64_t v28 = v38;
      }
      while (v38);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), v25);
    uint64_t v39 = [v25 allKeys];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v40 = *(id *)(*(void *)(a1 + 32) + 56);
    uint64_t v41 = [v40 countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v57;
      id v7 = v55;
      while (2)
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v57 != v43) {
            objc_enumerationMutation(v40);
          }
          long long v45 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          if (([v39 containsObject:v45] & 1) == 0)
          {
            uint64_t v46 = *(void *)(a1 + 32);
            long long v47 = *(NSObject **)(v46 + 24);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              uint64_t v48 = *(void *)(v46 + 32);
              *(_DWORD *)long long buf = 138543618;
              uint64_t v71 = v48;
              __int16 v72 = 2114;
              id v73 = v45;
              _os_log_impl(&dword_188D96000, v47, OS_LOG_TYPE_ERROR, "%{public}@ Fetched offline data key list does not include required layer %{public}@", buf, 0x16u);
            }
            uint64_t v49 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Offline key list is missing required layer"];

            uint64_t v50 = *(void *)(a1 + 32);
            uint64_t v51 = *(void **)(v50 + 88);
            *(void *)(v50 + 88) = 0;

            id v7 = (id)v49;
            goto LABEL_44;
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v42) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v7 = v55;
    }
LABEL_44:
  }
  uint64_t v52 = *(void *)(a1 + 32);
  uint64_t v53 = *(void **)(v52 + 96);
  *(void *)(v52 + 96) = v7;
  id v54 = v7;

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 80));
}

- (void)determineTotalCountWithCallbackQueue:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[GEOMapDataSubscriptionOfflineDataKeySelector _determineKeysToLoadIfNecessary]((uint64_t)self);
  preparationGroup = self->_preparationGroup;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__GEOMapDataSubscriptionOfflineDataKeySelector_determineTotalCountWithCallbackQueue_callback___block_invoke;
  block[3] = &unk_1E53D7F70;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify(preparationGroup, workQueue, block);
}

void __94__GEOMapDataSubscriptionOfflineDataKeySelector_determineTotalCountWithCallbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v18 = *(id *)(*(void *)(a1 + 32) + 96);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 88) layerBatchs];
  uint64_t v21 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  uint64_t v1 = 0;
  uint64_t v2 = 0;
  if (v21)
  {
    uint64_t v20 = *(void *)v32;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(obj);
        }
        v4 = *(id **)(*((void *)&v31 + 1) + 8 * v3);
        if (v4) {
          uint64_t v5 = [v4[4] count];
        }
        else {
          uint64_t v5 = 0;
        }
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v6 = -[GEOPBOfflineDataLayerBatches batchReferences](v4);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v28;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v28 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * v10);
              if (v11)
              {
                if ((*(unsigned char *)(v11 + 60) & 2) == 0 || v1 == -1)
                {
                  if ((*(unsigned char *)(v11 + 60) & 2) == 0) {
                    uint64_t v1 = -1;
                  }
                }
                else
                {
                  v1 += *(void *)(v11 + 32);
                }
              }
              else
              {
                uint64_t v1 = -1;
              }
              ++v10;
            }
            while (v8 != v10);
            uint64_t v12 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
            uint64_t v8 = v12;
          }
          while (v12);
        }
        v2 += v5;

        ++v3;
      }
      while (v3 != v21);
      uint64_t v13 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      uint64_t v21 = v13;
    }
    while (v13);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__GEOMapDataSubscriptionOfflineDataKeySelector_determineTotalCountWithCallbackQueue_callback___block_invoke_2;
  block[3] = &unk_1E53E0BC0;
  id v14 = *(NSObject **)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  uint64_t v25 = v2;
  uint64_t v26 = v1;
  id v23 = v18;
  id v24 = v15;
  id v16 = v18;
  dispatch_async(v14, block);
}

uint64_t __94__GEOMapDataSubscriptionOfflineDataKeySelector_determineTotalCountWithCallbackQueue_callback___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[7], a1[4]);
}

- (void)determineNextRequestsWithMaximumCount:(unint64_t)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  -[GEOMapDataSubscriptionOfflineDataKeySelector _determineKeysToLoadIfNecessary]((uint64_t)self);
  preparationGroup = self->_preparationGroup;
  workQueue = self->_workQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__GEOMapDataSubscriptionOfflineDataKeySelector_determineNextRequestsWithMaximumCount_callbackQueue_callback___block_invoke;
  v14[3] = &unk_1E53D8C60;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  dispatch_group_notify(preparationGroup, workQueue, v14);
}

void __109__GEOMapDataSubscriptionOfflineDataKeySelector_determineNextRequestsWithMaximumCount_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 96))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__GEOMapDataSubscriptionOfflineDataKeySelector_determineNextRequestsWithMaximumCount_callbackQueue_callback___block_invoke_2;
    block[3] = &unk_1E53D7C50;
    uint64_t v2 = *(NSObject **)(a1 + 40);
    id v3 = *(id *)(a1 + 48);
    void block[4] = *(void *)(a1 + 32);
    id v59 = v3;
    dispatch_async(v2, block);
    v4 = v59;
    goto LABEL_56;
  }
  v4 = GEOGetURLWithSource(62, 0);
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(void *)(a1 + 56)];
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(void *)(v6 + 104);
  id v8 = 0;
  if (v7 >= [*(id *)(v6 + 88) layerBatchsCount]) {
    goto LABEL_55;
  }
  uint64_t v9 = 0;
  uint64_t v10 = &OBJC_IVAR___GEOArrivalTimeAndDistanceInfo__distanceRemainingToEndOfRoute;
  while ((unint64_t)[v5 count] < *(void *)(a1 + 56))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v9) {
      goto LABEL_17;
    }
    id v12 = [*(id *)(v11 + 88) layerBatchs];
    uint64_t v9 = [v12 objectAtIndexedSubscript:*(void *)(*(void *)(a1 + 32) + 104)];

    uint64_t v11 = *(void *)(a1 + 32);
    if (!*(void *)(v11 + 112))
    {
      id v13 = *(id *)(v11 + 24);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 32);
        if (v9)
        {
          uint64_t v15 = *(int *)(v9 + 8);
          if (v15 >= 0x15)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(v9 + 8));
            id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v16 = off_1E53E0BE0[v15];
          }
          unint64_t v17 = v16;
          uint64_t v18 = [*(id *)(v9 + v10[338]) count];
        }
        else
        {
          unint64_t v17 = @"LAYER_UNKNOWN";
          uint64_t v50 = @"LAYER_UNKNOWN";
          uint64_t v18 = 0;
          id v16 = @"LAYER_UNKNOWN";
        }
        *(_DWORD *)long long buf = 138543874;
        uint64_t v61 = v14;
        __int16 v62 = 2114;
        long long v63 = v16;
        __int16 v64 = 2048;
        uint64_t v65 = v18;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, "%{public}@ Starting offline layer %{public}@ (%llu keys)", buf, 0x20u);
      }
      uint64_t v11 = *(void *)(a1 + 32);
    }
    if (v9)
    {
LABEL_17:
      unint64_t v19 = *(void *)(v11 + 112);
      if (v19 >= [*(id *)(v9 + v10[338]) count])
      {
        if ([*(id *)(v9 + v10[338]) count]
          && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: currentLayerKeys.batchReferencesCount == 0", buf, 2u);
        }
        char v25 = 0;
        goto LABEL_22;
      }
      uint64_t v20 = -[GEOPBOfflineDataLayerBatches batchReferences]((id *)v9);
      uint64_t v21 = [v20 objectAtIndexedSubscript:*(void *)(*(void *)(a1 + 32) + 112)];

      uint64_t v22 = -[GEOPBOfflineDataBatchReference batchIdentifier]((id *)v21);
      id v23 = v22;
      if (v22)
      {
        id v24 = v22;
      }
      else
      {
        long long v30 = -[GEOPBOfflineDataBatchReference url]((id *)v21);
        id v24 = [v30 dataUsingEncoding:4];
      }
      long long v31 = -[GEOPBOfflineDataBatchReference url]((id *)v21);
      long long v32 = v4;
      long long v33 = [v4 URLByAppendingPathComponent:v31];

      if (v33)
      {
        long long v34 = [[GEOOfflineDataBatchKey alloc] initWithLayer:*(unsigned int *)(v9 + 8) key:v24];
        uint64_t v35 = [GEOOfflineDataRequest alloc];
        if (v21 && (*(unsigned char *)(v21 + 60) & 2) != 0) {
          uint64_t v36 = *(void *)(v21 + 32);
        }
        else {
          uint64_t v36 = 0;
        }
        id v40 = (__CFString *)-[GEOOfflineDataRequest initWithKey:version:url:expectedSizeInBytes:](v35, v34, *(void *)(v9 + 16), v33, v36);
        [v5 addObject:v40];
        goto LABEL_35;
      }
      uint64_t v37 = *(void *)(a1 + 32);
      uint64_t v38 = *(NSObject **)(v37 + 24);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = *(void *)(v37 + 32);
        long long v34 = v38;
        -[GEOPBOfflineDataBatchReference url]((id *)v21);
        id v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)long long buf = 138543618;
        uint64_t v61 = v39;
        __int16 v62 = 2112;
        long long v63 = v40;
        _os_log_impl(&dword_188D96000, &v34->super, OS_LOG_TYPE_ERROR, "%{public}@ Missing/invalid URL for key: %@", buf, 0x16u);
LABEL_35:
      }
      unint64_t v41 = ++*(void *)(*(void *)(a1 + 32) + 112);
      if (v41 >= [*(id *)(v9 + 32) count])
      {
        uint64_t v42 = *(id *)(*(void *)(a1 + 32) + 24);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v43 = *(void *)(*(void *)(a1 + 32) + 32);
          uint64_t v44 = *(int *)(v9 + 8);
          if (v44 >= 0x15)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(v9 + 8));
            long long v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            long long v45 = off_1E53E0BE0[v44];
          }
          *(_DWORD *)long long buf = 138543618;
          uint64_t v61 = v43;
          __int16 v62 = 2114;
          long long v63 = v45;
          _os_log_impl(&dword_188D96000, v42, OS_LOG_TYPE_DEBUG, "%{public}@ Finished enumerating keys for layer %{public}@", buf, 0x16u);
        }
        ++*(void *)(*(void *)(a1 + 32) + 104);

        uint64_t v9 = 0;
        *(void *)(*(void *)(a1 + 32) + 112) = 0;
      }

      uint64_t v48 = *(void *)(a1 + 32);
      unint64_t v49 = *(void *)(v48 + 104);
      id v8 = (void *)v9;
      v4 = v32;
      uint64_t v10 = &OBJC_IVAR___GEOArrivalTimeAndDistanceInfo__distanceRemainingToEndOfRoute;
      if (v49 >= [*(id *)(v48 + 88) layerBatchsCount]) {
        goto LABEL_55;
      }
    }
    else
    {
      char v25 = 1;
LABEL_22:
      uint64_t v26 = *(id *)(*(void *)(a1 + 32) + 24);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 32);
        if (v25)
        {
          long long v29 = @"LAYER_UNKNOWN";
        }
        else
        {
          uint64_t v28 = *(int *)(v9 + 8);
          if (v28 >= 0x15)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(v9 + 8));
            long long v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            long long v29 = off_1E53E0BE0[v28];
          }
        }
        *(_DWORD *)long long buf = 138543618;
        uint64_t v61 = v27;
        __int16 v62 = 2114;
        long long v63 = v29;
        _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_DEBUG, "%{public}@ Finished enumerating keys for layer %{public}@", buf, 0x16u);
      }
      ++*(void *)(*(void *)(a1 + 32) + 104);

      *(void *)(*(void *)(a1 + 32) + 112) = 0;
      uint64_t v46 = *(void *)(a1 + 32);
      unint64_t v47 = *(void *)(v46 + 104);
      uint64_t v9 = 0;
      id v8 = 0;
      if (v47 >= [*(id *)(v46 + 88) layerBatchsCount]) {
        goto LABEL_55;
      }
    }
  }
  id v8 = (void *)v9;
LABEL_55:
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __109__GEOMapDataSubscriptionOfflineDataKeySelector_determineNextRequestsWithMaximumCount_callbackQueue_callback___block_invoke_13;
  v54[3] = &unk_1E53D95B8;
  uint64_t v51 = *(NSObject **)(a1 + 40);
  id v52 = *(id *)(a1 + 48);
  id v56 = v5;
  id v57 = v52;
  id v55 = 0;
  id v53 = v5;
  dispatch_async(v51, v54);

LABEL_56:
}

uint64_t __109__GEOMapDataSubscriptionOfflineDataKeySelector_determineNextRequestsWithMaximumCount_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(*(void *)(a1 + 32) + 96));
}

uint64_t __109__GEOMapDataSubscriptionOfflineDataKeySelector_determineNextRequestsWithMaximumCount_callbackQueue_callback___block_invoke_13(void *a1)
{
  uint64_t v2 = a1[6];
  if (a1[4]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a1[5];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (NSDictionary)layerVersions
{
  return self->_layerVersions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerVersions, 0);
  objc_storeStrong((id *)&self->_keysLoadError, 0);
  objc_storeStrong((id *)&self->_keysToLoad, 0);
  objc_storeStrong((id *)&self->_preparationGroup, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_requiredLayers, 0);
  objc_storeStrong((id *)&self->_dataKeyRequester, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);

  objc_storeStrong((id *)&self->_subscription, 0);
}

@end