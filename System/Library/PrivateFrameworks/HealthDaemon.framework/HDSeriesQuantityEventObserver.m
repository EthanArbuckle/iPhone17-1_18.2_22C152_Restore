@interface HDSeriesQuantityEventObserver
- (HDSeriesQuantityEventObserver)initWithProfile:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
@end

@implementation HDSeriesQuantityEventObserver

- (HDSeriesQuantityEventObserver)initWithProfile:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDSeriesQuantityEventObserver;
  v5 = [(HDSeriesQuantityEventObserver *)&v14 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_profile, v4);
    v8 = [v4 dataManager];
    v9 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297A8]];
    [v8 addObserver:v6 forDataType:v9];

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v11 = [WeakRetained dataManager];
    v12 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297C8]];
    [v11 addObserver:v6 forDataType:v12];
  }
  return v6;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v33 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297A8]];
  v32 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297C8]];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v42;
    uint64_t v10 = *MEMORY[0x1E4F2A820];
    uint64_t v11 = *MEMORY[0x1E4F2A7F0];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        objc_super v14 = objc_msgSend(v13, "_source", v32);
        if (![v14 _isLocalDevice]) {
          goto LABEL_11;
        }
        v15 = [v13 endDate];
        [v15 timeIntervalSinceNow];
        double v17 = v16;

        if (v17 >= -600.0)
        {
          v18 = [v13 sampleType];
          char v19 = [v18 isEqual:v33];

          uint64_t v20 = v11;
          if ((v19 & 1) != 0
            || (objc_msgSend(v13, "sampleType", v11),
                v21 = objc_claimAutoreleasedReturnValue(),
                int v22 = [v21 isEqual:v32],
                v21,
                uint64_t v20 = v10,
                v22))
          {
            objc_super v14 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:v20];
            [v6 addObject:v14];
LABEL_11:

            continue;
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v8);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v34 = v6;
  uint64_t v23 = [v34 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v36 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v38 != v36) {
          objc_enumerationMutation(v34);
        }
        id v26 = *(id *)(*((void *)&v37 + 1) + 8 * j);
        if (self)
        {
          _HKInitializeLogging();
          v27 = *MEMORY[0x1E4F29F10];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v50 = self;
            __int16 v51 = 2114;
            id v52 = v26;
            _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Observed addition of notification event. Requesting series data of type %{public}@ to get frozen.", buf, 0x16u);
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
          v29 = [WeakRetained dataCollectionManager];
          v30 = [MEMORY[0x1E4F1C9C8] date];
          v31 = [MEMORY[0x1E4F1CAD0] setWithObject:v26];
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __54__HDSeriesQuantityEventObserver__freezeSeriesForType___block_invoke;
          v45[3] = &unk_1E62F5D48;
          v45[4] = self;
          id v46 = v26;
          [v29 requestAggregationThroughDate:v30 types:v31 mode:0 options:3 completion:v45];
        }
      }
      uint64_t v24 = [v34 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v24);
  }
}

void __54__HDSeriesQuantityEventObserver__freezeSeriesForType___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v7 = [WeakRetained daemon];
    uint64_t v8 = [v7 behavior];
    int v9 = [v8 isAppleWatch];

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      uint64_t v11 = [v10 nanoSyncManager];
      [v11 syncHealthDataWithOptions:0 reason:@"audio-exposure-event" completion:0];
    }
  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v13;
      __int16 v17 = 2114;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Error freezing series of type %{public}@. %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void).cxx_destruct
{
}

@end