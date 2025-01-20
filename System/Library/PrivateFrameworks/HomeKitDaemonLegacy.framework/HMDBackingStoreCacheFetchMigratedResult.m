@interface HMDBackingStoreCacheFetchMigratedResult
- (BOOL)migration;
- (BOOL)update;
- (HMDBackingStoreCacheFetchMigratedResult)initWithGroup:(id)a3 update:(BOOL)a4 migration:(BOOL)a5 fetchResult:(id)a6;
- (HMDBackingStoreCacheGroup)group;
- (id)fetchResult;
- (id)mainReturningError;
- (void)setFetchResult:(id)a3;
- (void)setGroup:(id)a3;
@end

@implementation HMDBackingStoreCacheFetchMigratedResult

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (void)setFetchResult:(id)a3
{
}

- (id)fetchResult
{
  return self->_fetchResult;
}

- (BOOL)migration
{
  return self->_migration;
}

- (BOOL)update
{
  return self->_update;
}

- (void)setGroup:(id)a3
{
}

- (HMDBackingStoreCacheGroup)group
{
  return self->_group;
}

- (id)mainReturningError
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v3 = +[HMDBackingStoreSingleton sharedInstance];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [(HMDBackingStoreCacheFetchMigratedResult *)self group];
  v6 = (void *)[v5 groupID];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v8 = v7;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__16722;
  v44 = __Block_byref_object_dispose__16723;
  id v45 = 0;
  objc_initWeak(&location, self);
  if ([(HMDBackingStoreCacheFetchMigratedResult *)self migration])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__HMDBackingStoreCacheFetchMigratedResult_mainReturningError__block_invoke;
    aBlock[3] = &unk_1E6A07E18;
    objc_copyWeak(v38, &location);
    v36 = &v40;
    id v9 = v3;
    v38[1] = v6;
    id v35 = v9;
    v37 = &v46;
    v10 = _Block_copy(aBlock);
    v11 = [(HMDBackingStoreOperation *)self store];
    v12 = [v11 local];
    [v12 _fetchRecordTypeSchemaWithGroupID:v6 callback:v10];

    objc_destroyWeak(v38);
  }
  if (![(HMDBackingStoreCacheFetchMigratedResult *)self migration] || *((unsigned char *)v47 + 24))
  {
    v13 = [MEMORY[0x1E4F1CA48] array];

    v14 = (void *)v41[5];
    v41[5] = 0;

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __61__HMDBackingStoreCacheFetchMigratedResult_mainReturningError__block_invoke_413;
    v29[3] = &unk_1E6A07E40;
    objc_copyWeak(v33, &location);
    v32 = &v40;
    v33[1] = v6;
    id v30 = v3;
    id v4 = v13;
    id v31 = v4;
    v15 = _Block_copy(v29);
    v16 = [(HMDBackingStoreOperation *)self store];
    v17 = [v16 local];
    [v17 _fetchRecordsWithGroupID:v6 callback:v15];

    objc_destroyWeak(v33);
  }
  uint64_t v18 = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v20 = v19;
  v21 = (void *)MEMORY[0x1D9452090](v18);
  v22 = self;
  HMFGetOSLogHandle();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v51 = v24;
    __int16 v52 = 2048;
    double v53 = v20 - v8;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@time to fetch migrated records: %.4f s", buf, 0x16u);
  }
  if (v41[5])
  {

    id v4 = 0;
  }
  v25 = [(HMDBackingStoreCacheFetchMigratedResult *)v22 fetchResult];

  if (v25)
  {
    v26 = [(HMDBackingStoreCacheFetchMigratedResult *)v22 fetchResult];
    ((void (**)(void, id, uint64_t))v26)[2](v26, v4, v41[5]);
  }
  id v27 = (id)v41[5];
  objc_destroyWeak(&location);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v27;
}

uint64_t __61__HMDBackingStoreCacheFetchMigratedResult_mainReturningError__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v11 = WeakRetained;
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
LABEL_3:
    uint64_t v12 = 0;
    goto LABEL_4;
  }
  uint64_t v12 = 1;
  if (v7 && WeakRetained)
  {
    v14 = +[HMDBackingStoreSingleton sharedInstance];
    v15 = [v14 nameToClassTransform];
    v16 = (objc_class *)[v15 objectForKey:v7];

    if (v16 || (v16 = NSClassFromString(v7)) != 0)
    {
      if ([(objc_class *)v16 isSubclassOfClass:objc_opt_class()])
      {
        id v17 = [v16 alloc];
        uint64_t v18 = [MEMORY[0x1E4F29128] UUID];
        double v19 = (void *)[v17 initWithUUID:v18];

        if (v19)
        {
          double v20 = [*(id *)(a1 + 32) schemaHashForObject:v19];
          if (!v8 || ([v8 isEqual:v20] & 1) == 0)
          {
            v21 = (void *)MEMORY[0x1D9452090]();
            id v22 = v11;
            v23 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v24 = v26 = v21;
              uint64_t v25 = *(void *)(a1 + 64);
              *(_DWORD *)buf = 138543618;
              v28 = v24;
              __int16 v29 = 2048;
              uint64_t v30 = v25;
              _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@detected migrations is need for %lu", buf, 0x16u);

              v21 = v26;
            }

            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

            goto LABEL_3;
          }
        }
      }
    }
    uint64_t v12 = 1;
  }
LABEL_4:

  return v12;
}

uint64_t __61__HMDBackingStoreCacheFetchMigratedResult_mainReturningError__block_invoke_413(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v18 = a3;
  id v19 = a5;
  id v52 = a6;
  id v51 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v24 = WeakRetained;
  if (v22)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a10);
    uint64_t v25 = 1;
    goto LABEL_22;
  }
  uint64_t v25 = 0;
  if (v17 && WeakRetained)
  {
    id v53 = 0;
    v26 = +[HMDBackingStoreModelObject objectFromData:v19 encoding:a4 record:v18 error:&v53];
    id v50 = v53;
    if (v50 || !v26)
    {
      char v49 = v26;
      v47 = (void *)MEMORY[0x1D9452090]();
      id v36 = v24;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = HMFGetLogIdentifier();
        uint64_t v39 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138543874;
        uint64_t v55 = v38;
        uint64_t v40 = (void *)v38;
        __int16 v56 = 2048;
        uint64_t v57 = v39;
        __int16 v58 = 2112;
        id v59 = v17;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@unable to decode object for %lu / %@", buf, 0x20u);
      }
      uint64_t v25 = 0;
      v26 = v49;
      goto LABEL_21;
    }
    if ([v24 migration])
    {
      uint64_t v46 = [*(id *)(a1 + 32) schemaHashForObject:v26];
      if (!v21 || ([v21 isEqual:v46] & 1) == 0)
      {
        uint64_t v48 = v26;
        context = (void *)MEMORY[0x1D9452090]();
        id v45 = v24;
        id v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          uint64_t v42 = *(void *)(a1 + 64);
          v43 = (void *)v28;
          __int16 v29 = objc_opt_class();
          *(_DWORD *)buf = 138544642;
          uint64_t v55 = v28;
          __int16 v56 = 2048;
          uint64_t v57 = v42;
          __int16 v58 = 2112;
          id v59 = v17;
          __int16 v60 = 2112;
          v61 = v29;
          __int16 v62 = 2112;
          id v63 = v21;
          __int16 v64 = 2112;
          v65 = v46;
          id v30 = v29;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@detected a schema change for %lu / %@/%@ from %@ to %@", buf, 0x3Eu);
        }
        v26 = v48;
        [*(id *)(a1 + 40) addObject:v48];
        if ([v45 update])
        {
          uint64_t v31 = [v45 store];
          v32 = [v31 local];
          uint64_t v33 = [v32 _updateRecordWithGroupID:*(void *)(a1 + 64) name:v17 schema:v46];
          uint64_t v34 = *(void *)(*(void *)(a1 + 48) + 8);
          id v35 = *(void **)(v34 + 40);
          *(void *)(v34 + 40) = v33;

          v26 = v48;
          if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
          {

            uint64_t v25 = 1;
LABEL_21:

            goto LABEL_22;
          }
        }
      }
    }
    else
    {
      [*(id *)(a1 + 40) addObject:v26];
    }
    uint64_t v25 = 0;
    goto LABEL_21;
  }
LABEL_22:

  return v25;
}

- (HMDBackingStoreCacheFetchMigratedResult)initWithGroup:(id)a3 update:(BOOL)a4 migration:(BOOL)a5 fetchResult:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDBackingStoreCacheFetchMigratedResult;
  v13 = [(HMDBackingStoreOperation *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_group, a3);
    v14->_update = a4;
    v14->_migration = a5;
    v15 = _Block_copy(v12);
    id fetchResult = v14->_fetchResult;
    v14->_id fetchResult = v15;

    id v17 = v14;
  }

  return v14;
}

@end