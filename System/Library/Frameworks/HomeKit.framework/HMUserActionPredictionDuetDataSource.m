@interface HMUserActionPredictionDuetDataSource
+ (id)logCategory;
- (HMUserActionPredictionDuetDataSource)initWithCacheManager:(id)a3;
- (HMUserActionPredictionDuetDataSource)initWithCacheManager:(id)a3 suggestionProvider:(id)a4;
- (NSArray)predictions;
- (id)fetchPredictionsFromCache;
- (id)fetchPredictionsFromDuet;
- (void)openCacheIfNeeded;
@end

@implementation HMUserActionPredictionDuetDataSource

- (NSArray)predictions
{
  if (self)
  {
    self = (HMUserActionPredictionDuetDataSource *)objc_getProperty(self, a2, 24, 1);
    uint64_t v2 = vars8;
  }
  return (NSArray *)self;
}

- (id)fetchPredictionsFromCache
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(HMUserActionPredictionDuetDataSource *)self openCacheIfNeeded];
  if (self && objc_getProperty(self, v3, 32, 1))
  {
    v5 = objc_msgSend(objc_getProperty(self, v4, 32, 1), "dataForKey:", @"HMUserActionPredictionDuetDataSourceCacheKey");
    if (v5)
    {
      v6 = [[HMUserActionPredictionDuetPredictionStore alloc] initWithData:v5];
      v7 = (void *)MEMORY[0x19F3A64A0]();
      v8 = self;
      v9 = HMFGetOSLogHandle();
      v10 = v9;
      if (v6)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v11 = HMFGetLogIdentifier();
          v12 = NSNumber;
          v13 = [(HMUserActionPredictionDuetPredictionStore *)v6 predictions];
          v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
          int v27 = 138543618;
          v28 = v11;
          __int16 v29 = 2112;
          id Property = v14;
          _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Loaded %@ duet predictions from cache", (uint8_t *)&v27, 0x16u);
        }
        v15 = [(HMUserActionPredictionDuetPredictionStore *)v6 predictions];
        v16 = (void *)[v15 copy];
        objc_setProperty_atomic_copy(v8, v17, v16, 24);

        id v19 = objc_getProperty(v8, v18, 24, 1);
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v25 = HMFGetLogIdentifier();
          int v27 = 138543362;
          v28 = v25;
          _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to load cached predictions from duet prediction store data.", (uint8_t *)&v27, 0xCu);
        }
        id v19 = (id)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x19F3A64A0]();
      v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = HMFGetLogIdentifier();
        int v27 = 138543874;
        v28 = v23;
        __int16 v29 = 2112;
        id Property = objc_getProperty(v21, v24, 32, 1);
        __int16 v31 = 2112;
        v32 = @"HMUserActionPredictionDuetDataSourceCacheKey";
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@No duet prediction data found in cache (%@) for key: %@", (uint8_t *)&v27, 0x20u);
      }
      id v19 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v19 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

- (id)fetchPredictionsFromDuet
{
  uint64_t v2 = self;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (HMUserActionPredictionDuetDataSource *)objc_getProperty(self, a2, 16, 1);
  }
  v3 = [(HMUserActionPredictionDuetDataSource *)self suggestionsWithMaxSuggestions:-1];
  v4 = (void *)MEMORY[0x19F3A64A0]();
  v5 = v2;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    *(_DWORD *)buf = 138543874;
    v23 = v7;
    __int16 v24 = 2112;
    v25 = v8;
    __int16 v26 = 2112;
    int v27 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetched %@ predictions from duet: %@", buf, 0x20u);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__HMUserActionPredictionDuetDataSource_fetchPredictionsFromDuet__block_invoke;
  v21[3] = &unk_1E5942278;
  v21[4] = v5;
  objc_msgSend(v3, "na_map:", v21);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v2)
  {
    [(HMUserActionPredictionDuetDataSource *)v5 openCacheIfNeeded];
    if (objc_getProperty(v5, v12, 32, 1))
    {
      v13 = objc_alloc_init(HMUserActionPredictionDuetPredictionStore);
      v14 = (void *)[v11 mutableCopy];
      [(HMUserActionPredictionDuetPredictionStore *)v13 setPredictions:v14];

      id v16 = objc_getProperty(v5, v15, 32, 1);
      SEL v17 = [(HMUserActionPredictionDuetPredictionStore *)v13 data];
      [v16 setData:v17 forKey:@"HMUserActionPredictionDuetDataSourceCacheKey"];
    }
    SEL v18 = (void *)[v11 copy];
    objc_setProperty_atomic_copy(v5, v19, v18, 24);
  }
  else
  {

    SEL v18 = (void *)[v11 copy];
  }

  return v11;
}

- (void)openCacheIfNeeded
{
  if (a1)
  {
    id v3 = objc_getProperty(a1, a2, 32, 1);
    if (!v3)
    {
      if (!objc_getProperty(a1, v4, 8, 1)) {
        return;
      }
      objc_msgSend(objc_getProperty(a1, v5, 8, 1), "cacheWithName:", @"HMUserActionPredictionDuetDataSourceCacheName");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(a1, v6, v7, 32);
      id v3 = v7;
    }
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_32910 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_32910, &__block_literal_global_32911);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v7_32912;

  return v2;
}

- (HMUserActionPredictionDuetDataSource)initWithCacheManager:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F49EF0];
  id v5 = a3;
  SEL v6 = [v4 suggester];
  id v7 = [(HMUserActionPredictionDuetDataSource *)self initWithCacheManager:v5 suggestionProvider:v6];

  return v7;
}

- (HMUserActionPredictionDuetDataSource)initWithCacheManager:(id)a3 suggestionProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMUserActionPredictionDuetDataSource;
  id v9 = [(HMUserActionPredictionDuetDataSource *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cacheManager, a3);
    lastFetchedPredictions = v10->_lastFetchedPredictions;
    v10->_lastFetchedPredictions = (NSArray *)MEMORY[0x1E4F1CBF0];

    objc_storeStrong((id *)&v10->_suggestionProvider, a4);
  }

  return v10;
}

uint64_t __51__HMUserActionPredictionDuetDataSource_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7_32912;
  logCategory__hmf_once_v7_32912 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionCache, 0);
  objc_storeStrong((id *)&self->_lastFetchedPredictions, 0);
  objc_storeStrong((id *)&self->_suggestionProvider, 0);

  objc_storeStrong((id *)&self->_cacheManager, 0);
}

HMUserActionPredictionDuetPredictionValue *__64__HMUserActionPredictionDuetDataSource_fetchPredictionsFromDuet__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 homeUUID];
  if (v4
    && (id v5 = (void *)v4,
        [v3 targetUUID],
        SEL v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = objc_alloc_init(HMUserActionPredictionDuetPredictionValue);
    id v8 = (void *)MEMORY[0x1E4F654E8];
    id v9 = [v3 homeUUID];
    v10 = objc_msgSend(v8, "hmf_cachedInstanceForString:", v9);
    [(HMUserActionPredictionDuetPredictionValue *)v7 setHomeIdentifier:v10];

    v11 = (void *)MEMORY[0x1E4F654E8];
    SEL v12 = [v3 targetUUID];
    objc_super v13 = objc_msgSend(v11, "hmf_cachedInstanceForString:", v12);
    [(HMUserActionPredictionDuetPredictionValue *)v7 setTargetIdentifier:v13];

    v14 = (void *)MEMORY[0x1E4F654E8];
    SEL v15 = [v3 accessoryServiceUUID];
    id v16 = objc_msgSend(v14, "hmf_cachedInstanceForString:", v15);
    [(HMUserActionPredictionDuetPredictionValue *)v7 setTargetAccessoryServiceIdentifier:v16];

    [v3 score];
    -[HMUserActionPredictionDuetPredictionValue setScore:](v7, "setScore:");
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = [v3 type];
    unsigned int v19 = 2 * (v18 == 0);
    if (v18 == 1) {
      unsigned int v19 = 1;
    }
    if (v17) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    [(HMUserActionPredictionDuetPredictionValue *)v7 setPredictionType:v20];
    if ([(HMUserActionPredictionDuetPredictionValue *)v7 predictionType])
    {
      v21 = v7;
    }
    else
    {
      uint64_t v28 = (void *)MEMORY[0x19F3A64A0]();
      id v29 = *(id *)(a1 + 32);
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        __int16 v31 = HMFGetLogIdentifier();
        int v33 = 138543618;
        v34 = v31;
        __int16 v35 = 2112;
        id v36 = v3;
        _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@Skipping prediction (%@) of unknown type from duet", (uint8_t *)&v33, 0x16u);
      }
      v21 = 0;
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x19F3A64A0]();
    id v23 = *(id *)(a1 + 32);
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      __int16 v26 = [v3 homeUUID];
      int v27 = [v3 targetUUID];
      int v33 = 138544130;
      v34 = v25;
      __int16 v35 = 2112;
      id v36 = v26;
      __int16 v37 = 2112;
      v38 = v27;
      __int16 v39 = 2112;
      id v40 = v3;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@No home identifier (%@) or target identifier (%@) in duet prediction: %@", (uint8_t *)&v33, 0x2Au);
    }
    v21 = 0;
  }

  return v21;
}

@end