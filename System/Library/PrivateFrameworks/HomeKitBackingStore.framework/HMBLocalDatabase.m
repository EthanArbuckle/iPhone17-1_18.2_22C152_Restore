@interface HMBLocalDatabase
+ (id)logCategory;
- (BOOL)removeLocalDataForZone:(id)a3 error:(id *)a4;
- (BOOL)reopenZone:(id)a3 error:(id *)a4;
- (HMBLocalDatabase)initWithDatastorePath:(id)a3 configuration:(id)a4;
- (HMBLocalDatabase)initWithLocalSQLContext:(id)a3 configuration:(id)a4;
- (HMBLocalDatabaseDelegate)delegate;
- (HMBLocalSQLContext)local;
- (HMBModelContainer)modelContainer;
- (NSMapTable)openZonesByZoneID;
- (NSOperationQueue)queue;
- (id)_openZoneWithZoneID:(id)a3 mirror:(id)a4 configuration:(id)a5 existingLocalZone:(id)a6 error:(id *)a7;
- (id)fetchZonesWithError:(id *)a3;
- (id)localZoneFactory;
- (id)logIdentifier;
- (id)openZoneWithMirror:(id)a3 configuration:(id)a4 error:(id *)a5;
- (id)openZoneWithZoneID:(id)a3 configuration:(id)a4 error:(id *)a5;
- (id)removeZone:(id)a3;
- (void)dealloc;
- (void)handleLocalZoneShutdown:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocal:(id)a3;
- (void)setLocalZoneFactory:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation HMBLocalDatabase

- (void).cxx_destruct
{
  objc_storeStrong(&self->_localZoneFactory, 0);
  objc_storeStrong((id *)&self->_openZonesByZoneID, 0);
  objc_storeStrong((id *)&self->_local, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modelContainer, 0);
}

- (void)setLocalZoneFactory:(id)a3
{
}

- (id)localZoneFactory
{
  return self->_localZoneFactory;
}

- (NSMapTable)openZonesByZoneID
{
  return self->_openZonesByZoneID;
}

- (void)setLocal:(id)a3
{
}

- (HMBLocalSQLContext)local
{
  return self->_local;
}

- (void)setQueue:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (HMBLocalDatabaseDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMBLocalDatabaseDelegate *)WeakRetained;
}

- (HMBModelContainer)modelContainer
{
  return self->_modelContainer;
}

- (id)logIdentifier
{
  v2 = [(HMBLocalDatabase *)self local];
  v3 = [v2 logIdentifier];

  return v3;
}

- (void)handleLocalZoneShutdown:(id)a3
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMBLocalDatabase *)self openZonesByZoneID];
  v6 = [v8 zoneID];
  v7 = [v6 token];
  [v5 removeObjectForKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)removeLocalDataForZone:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v27 = v10;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing local data for zone: %@", buf, 0x16u);
  }
  v11 = [(HMBLocalDatabase *)v8 delegate];
  if (objc_opt_respondsToSelector())
  {
    v12 = [v6 zoneID];
    [v11 localDatabase:v8 willRemoveZoneWithID:v12];
  }
  os_unfair_lock_lock_with_options();
  id v25 = 0;
  char v13 = [v6 destroyWithError:&v25];
  id v14 = v25;
  v15 = [(HMBLocalDatabase *)v8 openZonesByZoneID];
  v16 = [v6 zoneID];
  v17 = [v16 token];
  [v15 removeObjectForKey:v17];

  os_unfair_lock_unlock(&v8->_lock);
  v18 = (void *)MEMORY[0x1D944CB30]();
  v19 = v8;
  v20 = HMFGetOSLogHandle();
  v21 = v20;
  if (v13)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_INFO, "%{public}@Successfully removed local data for zone: %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v27 = v23;
      __int16 v28 = 2112;
      id v29 = v6;
      __int16 v30 = 2112;
      id v31 = v14;
      _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove local data for zone %@: %@", buf, 0x20u);
    }
    if (a4) {
      *a4 = v14;
    }
  }

  return v13;
}

- (id)removeZone:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing local zone: %@", buf, 0x16u);
  }
  v9 = [v4 mirror];
  if (v9)
  {
    v10 = (void *)MEMORY[0x1D944CB30]();
    v11 = v6;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      char v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing local zone mirror: %@", buf, 0x16u);
    }
    id v14 = [v9 destroy];
  }
  else
  {
    id v18 = 0;
    BOOL v15 = [(HMBLocalDatabase *)v6 removeLocalDataForZone:v4 error:&v18];
    id v16 = v18;
    if (v15) {
      [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
    else {
    id v14 = [MEMORY[0x1E4F7A0D8] futureWithError:v16];
    }
  }
  return v14;
}

- (BOOL)reopenZone:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    id v8 = [v6 configuration];
    v9 = (void *)[v8 mutableCopy];

    [v9 setCreateIfNeeded:1];
    v10 = [v7 zoneID];
    v11 = [v7 mirror];
    v12 = [(HMBLocalDatabase *)self _openZoneWithZoneID:v10 mirror:v11 configuration:v9 existingLocalZone:v7 error:a4];
    BOOL v13 = v12 != 0;

    return v13;
  }
  else
  {
    BOOL v15 = (HMBLocalDatabase *)_HMFPreconditionFailure();
    return [(HMBLocalDatabase *)v15 openZoneWithMirror:v17 configuration:v18 error:v19];
  }
}

- (id)openZoneWithMirror:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_7:
    id v14 = (HMBLocalDatabase *)_HMFPreconditionFailure();
    return [(HMBLocalDatabase *)v14 openZoneWithZoneID:v16 configuration:v17 error:v18];
  }
  v11 = [v8 zoneID];
  v12 = [(HMBLocalDatabase *)self _openZoneWithZoneID:v11 mirror:v8 configuration:v10 existingLocalZone:0 error:a5];

  return v12;
}

- (id)openZoneWithZoneID:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_7:
    BOOL v13 = (HMBLocalDatabase *)_HMFPreconditionFailure();
    return [(HMBLocalDatabase *)v13 _openZoneWithZoneID:v15 mirror:v16 configuration:v17 existingLocalZone:v18 error:v19];
  }
  v11 = [(HMBLocalDatabase *)self _openZoneWithZoneID:v8 mirror:0 configuration:v9 existingLocalZone:0 error:a5];

  return v11;
}

- (id)_openZoneWithZoneID:(id)a3 mirror:(id)a4 configuration:(id)a5 existingLocalZone:(id)a6 error:(id *)a7
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  id v71 = a4;
  id v74 = a5;
  id v73 = a6;
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v11 = [(HMBLocalDatabase *)self openZonesByZoneID];
  v12 = [v75 token];
  id v13 = [v11 objectForKey:v12];

  if (v13)
  {
    id v14 = [v13 delegate];
    id v15 = [v74 delegate];
    id v16 = (void *)MEMORY[0x1D944CB30]();
    id v17 = self;
    if (v14 && v15 && v14 != v15)
    {
      HMFGetOSLogHandle();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v75;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot set a new delegate on local zone with identifier %@ because that local zone has already been opened with a different delegate", buf, 0x16u);
      }
      if (a7)
      {
        [MEMORY[0x1E4F28C58] hmfErrorWithCode:1];
        id v20 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v20 = 0;
      }
    }
    else
    {
      HMFGetOSLogHandle();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_INFO, "%{public}@Returning existing HMBLocalZone instance: %@", buf, 0x16u);
      }
      id v20 = v13;
    }

LABEL_41:
    goto LABEL_42;
  }
  __int16 v21 = self;
  id v68 = v75;
  os_unfair_lock_assert_owner(lock);
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__3371;
  v86 = __Block_byref_object_dispose__3372;
  id v87 = 0;
  v69 = v21;
  id v22 = [(HMBLocalDatabase *)v21 local];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = ____fetchStoreInfo_block_invoke;
  v81[3] = &unk_1E69EACB8;
  v81[4] = &v82;
  uint64_t v23 = [v22 sqlBlockWithActivity:0 block:v81];

  if (v23)
  {
    v24 = 0;
  }
  else
  {
    v27 = [v68 token];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v28 = (id)v83[5];
    v24 = (HMBLocalSQLContextRowZone *)[v28 countByEnumeratingWithState:&v77 objects:buf count:16];
    if (v24)
    {
      uint64_t v29 = *(void *)v78;
      while (2)
      {
        for (i = 0; i != v24; i = (HMBLocalSQLContextRowZone *)((char *)i + 1))
        {
          if (*(void *)v78 != v29) {
            objc_enumerationMutation(v28);
          }
          id v31 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          uint64_t v32 = [v31 identifier];
          v33 = [v32 token];
          char v34 = [v33 isEqual:v27];

          if (v34)
          {
            v24 = v31;
            goto LABEL_26;
          }
        }
        v24 = (HMBLocalSQLContextRowZone *)[v28 countByEnumeratingWithState:&v77 objects:buf count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }
LABEL_26:
  }
  _Block_object_dispose(&v82, 8);

  if (v24)
  {
LABEL_28:
    v35 = (void *)MEMORY[0x1D944CB30]();
    v36 = v69;
    if (v73)
    {
      HMFGetOSLogHandle();
      v37 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v73;
        _os_log_impl(&dword_1D4693000, v37, OS_LOG_TYPE_INFO, "%{public}@Using re-opened HMBLocalZone instance: %@", buf, 0x16u);
      }
      id v39 = v73;
      objc_msgSend(v39, "setZoneRow:", -[HMBLocalSQLContextRowZone zoneRow](v24, "zoneRow"));
    }
    else
    {
      HMFGetOSLogHandle();
      v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v51 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v51;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v68;
        _os_log_impl(&dword_1D4693000, v50, OS_LOG_TYPE_INFO, "%{public}@Creating new HMBLocalZone instance with ID: %@", buf, 0x16u);
      }
      v52 = [(HMBLocalDatabase *)v36 localZoneFactory];
      v53 = [(HMBLocalSQLContextRowZone *)v24 identifier];
      ((void (**)(void, HMBLocalDatabase *, void *, unint64_t, id, id))v52)[2](v52, v36, v53, [(HMBLocalSQLContextRowZone *)v24 zoneRow], v74, v71);
      id v39 = (id)objc_claimAutoreleasedReturnValue();
    }
    v54 = [(HMBLocalDatabase *)v36 openZonesByZoneID];
    v55 = [v39 zoneID];
    v56 = [v55 token];
    [v54 setObject:v39 forKey:v56];

    id v13 = v39;
    id v14 = v24;
    id v20 = v13;
    goto LABEL_41;
  }
  if ([v74 createIfNeeded])
  {
    v40 = (void *)MEMORY[0x1D944CB30]();
    v41 = v69;
    HMFGetOSLogHandle();
    v42 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v43;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v68;
      _os_log_impl(&dword_1D4693000, v42, OS_LOG_TYPE_INFO, "%{public}@Creating new state for local zone with ID: %@", buf, 0x16u);
    }
    id v76 = 0;
    id v44 = v68;
    v45 = v41;
    os_unfair_lock_assert_owner(lock);
    v46 = objc_alloc_init(HMBLocalSQLContextRowZone);
    v47 = [(HMBLocalDatabase *)v45 local];

    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ____createZone_block_invoke;
    v89 = &unk_1E69EADA8;
    v48 = v46;
    v90 = v48;
    id v49 = v44;
    id v91 = v49;
    [v47 sqlBlockWithActivity:0 error:&v76 block:buf];

    if ([(HMBLocalSQLContextRowZone *)v48 zoneRow])
    {
      [(HMBLocalSQLContextRowZone *)v48 setIdentifier:v49];
      v24 = v48;
    }
    else
    {
      v24 = 0;
    }

    id v63 = v76;
    id v14 = v63;
    if (!v24)
    {
      v64 = (void *)MEMORY[0x1D944CB30]();
      v65 = v45;
      HMFGetOSLogHandle();
      v66 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        v67 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v67;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v49;
        *(_WORD *)&buf[22] = 2112;
        v89 = v14;
        _os_log_impl(&dword_1D4693000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new state for local zone with ID %@: %@", buf, 0x20u);
      }
      if (a7)
      {
        id v14 = v14;
        id v13 = 0;
        id v20 = 0;
        *a7 = v14;
      }
      else
      {
        id v13 = 0;
        id v20 = 0;
      }
      goto LABEL_41;
    }

    goto LABEL_28;
  }
  if (a7)
  {
    *a7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
  }
  v58 = (void *)MEMORY[0x1D944CB30]();
  v59 = v69;
  HMFGetOSLogHandle();
  v60 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    id v61 = (id)objc_claimAutoreleasedReturnValue();
    v62 = [v68 name];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v61;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v62;
    _os_log_impl(&dword_1D4693000, v60, OS_LOG_TYPE_ERROR, "%{public}@Unable to open local zone that does not already exist and can't be created: %@", buf, 0x16u);
  }
  id v13 = 0;
  id v20 = 0;
LABEL_42:

  os_unfair_lock_unlock(lock);
  return v20;
}

- (id)fetchZonesWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3371;
  id v28 = __Block_byref_object_dispose__3372;
  id v29 = 0;
  id v4 = [(HMBLocalDatabase *)self local];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __40__HMBLocalDatabase_fetchZonesWithError___block_invoke;
  v23[3] = &unk_1E69EACB8;
  v23[4] = &v24;
  id v17 = [v4 sqlBlockWithActivity:0 block:v23];

  if (v17)
  {
    v5 = 0;
    if (a3) {
      *a3 = v17;
    }
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend((id)v25[5], "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = (id)v25[5];
    uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v10 = [HMBLocalZoneIDRow alloc];
          v11 = [v9 identifier];
          v12 = [v11 name];
          id v13 = [v9 identifier];
          id v14 = [v13 token];
          id v15 = [(HMBLocalZoneIDRow *)v10 initWithName:v12 token:v14];
          [v5 addObject:v15];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v30 count:16];
      }
      while (v6);
    }
  }
  _Block_object_dispose(&v24, 8);

  return v5;
}

id __40__HMBLocalDatabase_fetchZonesWithError___block_invoke(uint64_t a1, void *a2)
{
  id v8 = 0;
  uint64_t v3 = [a2 _fetchAllZones:&v8];
  id v4 = v8;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  return v4;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D944CB30](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMBLocalDatabase", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMBLocalDatabase;
  [(HMBLocalDatabase *)&v7 dealloc];
}

- (HMBLocalDatabase)initWithLocalSQLContext:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v9 = v8;
  if (!v8)
  {
LABEL_7:
    uint64_t v21 = _HMFPreconditionFailure();
    return (HMBLocalDatabase *)__58__HMBLocalDatabase_initWithLocalSQLContext_configuration___block_invoke(v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)HMBLocalDatabase;
  uint64_t v10 = [(HMBLocalDatabase *)&v22 init];
  if (v10)
  {
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v10->_queue;
    v10->_queue = v11;

    [(NSOperationQueue *)v10->_queue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v10->_queue setQualityOfService:25];
    id v13 = [NSString stringWithFormat:@"com.apple.HomeKitBackingStore.LocalDatabase"];
    [(NSOperationQueue *)v10->_queue setName:v13];

    uint64_t v14 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    openZonesByZoneID = v10->_openZonesByZoneID;
    v10->_openZonesByZoneID = (NSMapTable *)v14;

    uint64_t v16 = [v9 modelContainer];
    modelContainer = v10->_modelContainer;
    v10->_modelContainer = (HMBModelContainer *)v16;

    objc_storeStrong((id *)&v10->_local, a3);
    id localZoneFactory = v10->_localZoneFactory;
    v10->_id localZoneFactory = &__block_literal_global_3389;

    long long v19 = v10;
  }

  return v10;
}

HMBLocalZone *__58__HMBLocalDatabase_initWithLocalSQLContext_configuration___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = a2;
  uint64_t v14 = [[HMBLocalZone alloc] initWithLocalDatabase:v13 zoneID:v12 zoneRow:a4 configuration:v11 mirror:v10];

  return v14;
}

- (HMBLocalDatabase)initWithDatastorePath:(id)a3 configuration:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  if (!v7) {
    goto LABEL_10;
  }
  id v17 = 0;
  id v9 = +[HMBLocalSQLContext openWithURL:v6 error:&v17];
  id v10 = v17;
  if (v9)
  {
    id v11 = [(HMBLocalDatabase *)self initWithLocalSQLContext:v9 configuration:v8];
    id v12 = v11;
  }
  else
  {
    id v13 = (void *)MEMORY[0x1D944CB30]();
    id v11 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v19 = v15;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to create our local storage: %@.", buf, 0x16u);
    }
    id v12 = 0;
  }

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19 != -1) {
    dispatch_once(&logCategory__hmf_once_t19, &__block_literal_global_35);
  }
  v2 = (void *)logCategory__hmf_once_v20;
  return v2;
}

uint64_t __31__HMBLocalDatabase_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v20;
  logCategory__hmf_once___int16 v20 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end