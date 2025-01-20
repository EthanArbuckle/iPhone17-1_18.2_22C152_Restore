@interface HMUserActionPredictionProvider
+ (id)logCategory;
- (HMDarwinNotificationProvider)darwinNotificationProvider;
- (HMFMessageDispatcher)messageDispatcher;
- (HMUserActionPredictionDuetDataSource)duetDataSource;
- (HMUserActionPredictionProvider)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4 UUID:(id)a5 dataSource:(id)a6 duetDataSource:(id)a7 predictionTransformer:(id)a8 darwinNotificationProvider:(id)a9;
- (HMUserActionPredictionProviderDataSource)dataSource;
- (HMUserActionPredictionTransformer)predictionTransformer;
- (NSMutableDictionary)lastMappedPredictionsPerHome;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (void)_fetchPredictionsFromDuetAndUpdateHomes;
- (void)_handleRefreshPredictionsMessage:(id)a3;
- (void)_recalculatePredictions;
- (void)addSubscriber:(id)a3 forHomeIdentifier:(id)a4;
- (void)configure;
- (void)dealloc;
- (void)fetchPredictionsForHomeWithIdentifier:(id)a3 completion:(id)a4;
- (void)notifySubscribersOfChangedPredictions:(void *)a3 forHomeWithIdentifier:;
- (void)recalculatePredictions;
- (void)removeSubscriber:(id)a3 forHomeIdentifier:(id)a4;
@end

@implementation HMUserActionPredictionProvider

void __83__HMUserActionPredictionProvider_fetchPredictionsForHomeWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    os_unfair_lock_lock_with_options();
    if (*((unsigned char *)WeakRetained + 24))
    {
      *((unsigned char *)WeakRetained + 24) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
      v3 = (void *)MEMORY[0x19F3A64A0]();
      id v4 = WeakRetained;
      v5 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = HMFGetLogIdentifier();
        int v13 = 138543362;
        v14 = v6;
        _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Running deferred fetch from duet before returning predictions", (uint8_t *)&v13, 0xCu);
      }
      -[HMUserActionPredictionProvider _fetchPredictionsFromDuetAndUpdateHomes]((uint64_t)v4);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
    }
    v7 = [WeakRetained lastMappedPredictionsPerHome];
    v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v9 = [v8 copy];
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1E4F1CBF0];
    if (v9) {
      v11 = (void *)v9;
    }
    id v12 = v11;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchPredictionsForHomeWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(HMUserActionPredictionProvider *)self workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__HMUserActionPredictionProvider_fetchPredictionsForHomeWithIdentifier_completion___block_invoke;
  v11[3] = &unk_1E5943C90;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_recalculatePredictions
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    v2 = [a1 workQueue];
    dispatch_assert_queue_V2(v2);

    v3 = [v1 duetDataSource];
    id v4 = [v3 predictions];

    v58 = v4;
    v5 = objc_msgSend(v4, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_49326);
    id v6 = [v1 dataSource];
    id v7 = [v6 homesForUserActionPredictionProvider:v1];

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    obuint64_t j = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
    v62 = v5;
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v61 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v68 != v61) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          id v12 = [v11 uniqueIdentifier];
          id v13 = [v5 objectForKeyedSubscript:v12];

          if (v13)
          {
            id v14 = [v11 uniqueIdentifier];
            uint64_t v15 = [v5 objectForKeyedSubscript:v14];

            id v16 = v15;
            id v17 = v11;
            if (!v16) {
              goto LABEL_39;
            }
            if (!v11) {
              goto LABEL_37;
            }
          }
          else
          {
            id v16 = (id)MEMORY[0x1E4F1CBF0];
            id v18 = MEMORY[0x1E4F1CBF0];
            id v19 = v11;
            if (!v11) {
              goto LABEL_37;
            }
          }
          v20 = [v1 workQueue];
          dispatch_assert_queue_V2(v20);

          v21 = [v1 predictionTransformer];
          v22 = [v21 predictionsWithDuetPredictions:v16 forHome:v11];

          v23 = [v11 uniqueIdentifier];
          id v24 = v22;
          id v25 = v23;
          if (!v25)
          {
LABEL_36:
            _HMFPreconditionFailure();
LABEL_37:
            _HMFPreconditionFailure();
LABEL_38:
            _HMFPreconditionFailure();
LABEL_39:
            _HMFPreconditionFailure();
          }
          if (!v24) {
            goto LABEL_38;
          }
          v26 = v25;
          v27 = [v1 workQueue];
          dispatch_assert_queue_V2(v27);

          v28 = [v1 lastMappedPredictionsPerHome];
          uint64_t v29 = [v28 objectForKeyedSubscript:v26];
          v30 = (void *)v29;
          v31 = (void *)MEMORY[0x1E4F1CBF0];
          if (v29) {
            v31 = (void *)v29;
          }
          id v32 = v31;

          char v33 = [v32 isEqualToArray:v24];
          if ((v33 & 1) == 0)
          {
            v34 = (void *)[v24 copy];
            v35 = [v1 lastMappedPredictionsPerHome];
            [v35 setObject:v34 forKeyedSubscript:v26];

            -[HMUserActionPredictionProvider notifySubscribersOfChangedPredictions:forHomeWithIdentifier:]((uint64_t)v1, v24, v26);
          }

          v5 = v62;
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
      }
      while (v9);
    }

    v36 = objc_msgSend(obj, "na_map:", &__block_literal_global_35);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v37 = [v1 lastMappedPredictionsPerHome];
    v38 = (void *)[v37 copy];

    uint64_t v39 = [v38 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v64;
      v59 = v1;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v64 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(void **)(*((void *)&v63 + 1) + 8 * j);
          if (([v36 containsObject:v43] & 1) == 0)
          {
            id v44 = v43;
            if (!v44) {
              goto LABEL_36;
            }
            v45 = v44;
            v46 = [v1 workQueue];
            dispatch_assert_queue_V2(v46);

            v47 = (void *)MEMORY[0x19F3A64A0]();
            id v48 = v1;
            v49 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              uint64_t v50 = v40;
              uint64_t v51 = v41;
              v52 = v36;
              v54 = v53 = v38;
              *(_DWORD *)buf = 138543618;
              v74 = v54;
              __int16 v75 = 2112;
              v76 = v45;
              _os_log_impl(&dword_19D1A8000, v49, OS_LOG_TYPE_INFO, "%{public}@Removing all predictions for home: %@", buf, 0x16u);

              v38 = v53;
              v36 = v52;
              uint64_t v41 = v51;
              uint64_t v40 = v50;
              v1 = v59;
            }

            v55 = [v48 lastMappedPredictionsPerHome];
            v56 = [v55 objectForKeyedSubscript:v45];

            v57 = [v48 lastMappedPredictionsPerHome];
            [v57 setObject:0 forKeyedSubscript:v45];

            if ([v56 count]) {
              -[HMUserActionPredictionProvider notifySubscribersOfChangedPredictions:forHomeWithIdentifier:]((uint64_t)v48, MEMORY[0x1E4F1CBF0], v45);
            }
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v63 objects:v71 count:16];
      }
      while (v40);
    }
  }
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)lastMappedPredictionsPerHome
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (HMUserActionPredictionDuetDataSource)duetDataSource
{
  return (HMUserActionPredictionDuetDataSource *)objc_getProperty(self, a2, 64, 1);
}

- (HMUserActionPredictionProviderDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (HMUserActionPredictionProviderDataSource *)WeakRetained;
}

- (HMUserActionPredictionTransformer)predictionTransformer
{
  return (HMUserActionPredictionTransformer *)objc_getProperty(self, a2, 72, 1);
}

uint64_t __57__HMUserActionPredictionProvider__recalculatePredictions__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

void __43__HMUserActionPredictionProvider_configure__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) duetDataSource];
  id v3 = (id)[v2 fetchPredictionsFromCache];

  id v4 = *(void **)(a1 + 32);

  -[HMUserActionPredictionProvider _recalculatePredictions](v4);
}

- (void)addSubscriber:(id)a3 forHomeIdentifier:(id)a4
{
  v29[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)v27 = 138543874;
    *(void *)&v27[4] = v11;
    *(_WORD *)&v27[12] = 2112;
    *(void *)&v27[14] = v6;
    *(_WORD *)&v27[22] = 2112;
    v28 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding subscriber (%@) for predictions in home: %@", v27, 0x20u);
  }
  os_unfair_lock_lock_with_options();
  id v12 = [(NSMapTable *)v9->_subscribers objectForKey:v6];
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v15 = v14;

  if ([v15 containsObject:v7])
  {

    os_unfair_lock_unlock(&v9->_lock);
    id v16 = 0;
  }
  else
  {
    id v16 = [v15 setByAddingObject:v7];
    [(NSMapTable *)v9->_subscribers setObject:v16 forKey:v6];
    BOOL shouldRefetchFromDuet = v9->_shouldRefetchFromDuet;
    if (v9->_shouldRefetchFromDuet) {
      v9->_BOOL shouldRefetchFromDuet = 0;
    }

    os_unfair_lock_unlock(&v9->_lock);
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = v9;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)v27 = 138544130;
      *(void *)&v27[4] = v21;
      *(_WORD *)&v27[12] = 2112;
      *(void *)&v27[14] = v6;
      *(_WORD *)&v27[22] = 2112;
      v28 = v7;
      LOWORD(v29[0]) = 2112;
      *(void *)((char *)v29 + 2) = v16;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Added subscriber (%@) for predictions in home: %@, and updated subscribed homes to: %@", v27, 0x2Au);
    }
    if (shouldRefetchFromDuet)
    {
      v22 = (void *)MEMORY[0x19F3A64A0]();
      v23 = v19;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        *(_DWORD *)v27 = 138543362;
        *(void *)&v27[4] = v25;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_INFO, "%{public}@Running fetch from duet on subscriber addition", v27, 0xCu);
      }
      v26 = [(HMUserActionPredictionProvider *)v23 workQueue];
      *(void *)v27 = MEMORY[0x1E4F143A8];
      *(void *)&v27[8] = 3221225472;
      *(void *)&v27[16] = __72__HMUserActionPredictionProvider_fetchPredictionsFromDuetAndUpdateHomes__block_invoke;
      v28 = &unk_1E59452E8;
      v29[0] = v23;
      dispatch_async(v26, v27);
    }
  }
}

- (void)_fetchPredictionsFromDuetAndUpdateHomes
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [(id)a1 workQueue];
    dispatch_assert_queue_V2(v2);

    id v3 = [(id)a1 dataSource];
    char v4 = [v3 deviceUnlockedSinceBootForUserActionPredictionProvider:a1];

    if (v4)
    {
      v5 = [(id)a1 duetDataSource];
      id v6 = (id)[v5 fetchPredictionsFromDuet];

      -[HMUserActionPredictionProvider _recalculatePredictions]((void *)a1);
    }
    else
    {
      os_unfair_lock_lock_with_options();
      *(unsigned char *)(a1 + 24) = 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      id v7 = [(id)a1 workQueue];
      dispatch_assert_queue_V2(v7);

      uint64_t v8 = a1 + 12;
      BOOL v9 = *(_DWORD *)(a1 + 12) == -1;
      id v10 = (void *)MEMORY[0x19F3A64A0]();
      id v11 = (id)a1;
      id v12 = HMFGetOSLogHandle();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (v9)
      {
        if (v13)
        {
          uint64_t v15 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v21 = v15;
          _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Device has not been unlocked once, registering for first unlock notification", buf, 0xCu);
        }
        objc_initWeak((id *)buf, v11);
        id v16 = [v11 darwinNotificationProvider];
        id v17 = [v11 workQueue];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __53__HMUserActionPredictionProvider__waitForFirstUnlock__block_invoke;
        v18[3] = &unk_1E5943C28;
        objc_copyWeak(&v19, (id *)buf);
        [v16 notifyRegisterDispatch:"com.apple.mobile.keybagd.lock_status" outToken:v8 queue:v17 handler:v18];

        objc_destroyWeak(&v19);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (v13)
        {
          id v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v21 = v14;
          _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Device has not been unlocked once, waiting for first unlock notification", buf, 0xCu);
        }
      }
    }
  }
}

- (void)recalculatePredictions
{
  id v3 = [(HMUserActionPredictionProvider *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HMUserActionPredictionProvider_recalculatePredictions__block_invoke;
  block[3] = &unk_1E59452E8;
  block[4] = self;
  dispatch_async(v3, block);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_49387 != -1) {
    dispatch_once(&logCategory__hmf_once_t18_49387, &__block_literal_global_50);
  }
  v2 = (void *)logCategory__hmf_once_v19_49388;

  return v2;
}

void __72__HMUserActionPredictionProvider_fetchPredictionsFromDuetAndUpdateHomes__block_invoke(uint64_t a1)
{
}

void __56__HMUserActionPredictionProvider_recalculatePredictions__block_invoke(uint64_t a1)
{
}

- (HMUserActionPredictionProvider)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4 UUID:(id)a5 dataSource:(id)a6 duetDataSource:(id)a7 predictionTransformer:(id)a8 darwinNotificationProvider:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  obuint64_t j = a5;
  id v18 = a5;
  id v19 = a6;
  id v36 = a7;
  id v20 = a7;
  id v37 = a8;
  id v21 = a8;
  id v22 = a9;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v20)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v19)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v21)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  v23 = v22;
  if (!v22)
  {
LABEL_17:
    v31 = (HMCameraRecordingReachabilityEventManager *)_HMFPreconditionFailure();
    return (HMUserActionPredictionProvider *)[(HMCameraRecordingReachabilityEventManager *)v31 initWithContext:v33 uniqueIdentifier:v34];
  }
  v38.receiver = self;
  v38.super_class = (Class)HMUserActionPredictionProvider;
  id v24 = [(HMUserActionPredictionProvider *)&v38 init];
  id v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_workQueue, a3);
    objc_storeWeak((id *)&v25->_dataSource, v19);
    uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
    lastMappedPredictionsPerHome = v25->_lastMappedPredictionsPerHome;
    v25->_lastMappedPredictionsPerHome = (NSMutableDictionary *)v26;

    objc_storeStrong((id *)&v25->_messageDispatcher, a4);
    objc_storeStrong((id *)&v25->_uuid, obj);
    objc_storeStrong((id *)&v25->_duetDataSource, v36);
    uint64_t v28 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    subscribers = v25->_subscribers;
    v25->_subscribers = (NSMapTable *)v28;

    objc_storeStrong((id *)&v25->_predictionTransformer, v37);
    *(void *)&v25->_lock._os_unfair_lock_opaque = 0xFFFFFFFF00000000;
    objc_storeStrong((id *)&v25->_darwinNotificationProvider, a9);
    v25->_BOOL shouldRefetchFromDuet = 1;
  }

  return v25;
}

uint64_t __45__HMUserActionPredictionProvider_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v19_49388;
  logCategory__hmf_once_v19_49388 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)configure
{
  id v3 = [(HMUserActionPredictionProvider *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__HMUserActionPredictionProvider_configure__block_invoke;
  block[3] = &unk_1E59452E8;
  block[4] = self;
  dispatch_async(v3, block);

  char v4 = [(HMUserActionPredictionProvider *)self messageDispatcher];
  [v4 registerForMessage:@"HMUserActionPredictionRefreshMessage" receiver:self selector:sel__handleRefreshPredictionsMessage_];
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinNotificationProvider, 0);
  objc_storeStrong((id *)&self->_lastMappedPredictionsPerHome, 0);
  objc_storeStrong((id *)&self->_predictionTransformer, 0);
  objc_storeStrong((id *)&self->_duetDataSource, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_subscribers, 0);
}

- (HMDarwinNotificationProvider)darwinNotificationProvider
{
  return (HMDarwinNotificationProvider *)objc_getProperty(self, a2, 88, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)notifySubscribersOfChangedPredictions:(void *)a3 forHomeWithIdentifier:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5) {
    _HMFPreconditionFailure();
  }
  id v7 = v6;
  id v20 = [MEMORY[0x1E4F1CA48] array];
  lock = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock_with_options();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = *(id *)(a1 + 16);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        BOOL v13 = objc_msgSend(*(id *)(a1 + 16), "objectForKey:", v12, lock);
        int v14 = [v13 containsObject:v7];

        if (v14) {
          [v20 addObject:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(lock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = v20;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "didUpdatePredictions:forHomeWithIdentifier:", v5, v7, lock);
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }
}

id __57__HMUserActionPredictionProvider__recalculatePredictions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 homeIdentifier];

  id v6 = (void *)[v4 initWithUUIDString:v5];

  return v6;
}

void __53__HMUserActionPredictionProvider__waitForFirstUnlock__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained dataSource];
    if ([v3 deviceUnlockedSinceBootForUserActionPredictionProvider:v2])
    {
      int v4 = v2[3];

      if (v4 != -1)
      {
        id v5 = (void *)MEMORY[0x19F3A64A0]();
        id v6 = v2;
        id v7 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          id v8 = HMFGetLogIdentifier();
          int v10 = 138543362;
          id v11 = v8;
          _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Notified that device has been unlocked for the first time, fetching predictions from duet", (uint8_t *)&v10, 0xCu);
        }
        uint64_t v9 = [(os_unfair_lock_s *)v6 darwinNotificationProvider];
        [v9 notifyCancel:v2[3]];

        v2[3] = -1;
        os_unfair_lock_lock_with_options();
        LOBYTE(v6[6]._os_unfair_lock_opaque) = 0;
        os_unfair_lock_unlock(v6 + 2);
        -[HMUserActionPredictionProvider _fetchPredictionsFromDuetAndUpdateHomes](v6);
      }
    }
    else
    {
    }
  }
}

- (void)_handleRefreshPredictionsMessage:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMUserActionPredictionProvider *)self workQueue];
  dispatch_assert_queue_V2(v5);

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(NSMapTable *)self->_subscribers count])
  {
    self->_BOOL shouldRefetchFromDuet = 0;
    os_unfair_lock_unlock(&self->_lock);
    -[HMUserActionPredictionProvider _fetchPredictionsFromDuetAndUpdateHomes]((uint64_t)self);
  }
  else
  {
    self->_BOOL shouldRefetchFromDuet = 1;
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = self;
    HMFGetOSLogHandle();
    uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@No active prediction subscribers, will fetch from duet later.", (uint8_t *)&v11, 0xCu);
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)removeSubscriber:(id)a3 forHomeIdentifier:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v24 = 138543874;
    long long v25 = v11;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing subscriber (%@) for predictions in home: %@", (uint8_t *)&v24, 0x20u);
  }
  os_unfair_lock_lock_with_options();
  uint64_t v12 = [(NSMapTable *)v9->_subscribers objectForKey:v6];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v15 = v14;

  if ([v15 containsObject:v7])
  {
    uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    uint64_t v17 = objc_msgSend(v15, "na_setByRemovingObjectsFromSet:", v16);

    uint64_t v18 = [v17 count];
    subscribers = v9->_subscribers;
    if (v18) {
      [(NSMapTable *)subscribers setObject:v17 forKey:v6];
    }
    else {
      [(NSMapTable *)subscribers removeObjectForKey:v6];
    }

    os_unfair_lock_unlock(&v9->_lock);
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    long long v21 = v9;
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      long long v23 = HMFGetLogIdentifier();
      int v24 = 138544130;
      long long v25 = v23;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = v7;
      __int16 v30 = 2112;
      uint64_t v31 = v17;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Removed subscriber (%@) for predictions in home: %@, and updated subscribed homes to: %@", (uint8_t *)&v24, 0x2Au);
    }
  }
  else
  {

    os_unfair_lock_unlock(&v9->_lock);
  }
}

- (void)dealloc
{
  if (self->_firstUnlockToken != -1) {
    -[HMDarwinNotificationProvider notifyCancel:](self->_darwinNotificationProvider, "notifyCancel:");
  }
  v3.receiver = self;
  v3.super_class = (Class)HMUserActionPredictionProvider;
  [(HMUserActionPredictionProvider *)&v3 dealloc];
}

@end