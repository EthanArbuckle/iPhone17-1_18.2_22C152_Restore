@interface ACHBackCompatLegacyAchievementSyncEntity
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)supportsSyncStore:(id)a3;
+ (HDSyncEntityIdentifier)syncEntityIdentifier;
+ (id)decodeSyncObjectWithData:(id)a3;
+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3;
+ (int)nanoSyncObjectType;
+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3;
+ (void)setEarnedInstanceStore:(id)a3;
@end

@implementation ACHBackCompatLegacyAchievementSyncEntity

+ (void)setEarnedInstanceStore:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&ivarLock);
  objc_storeWeak(&_earnedInstanceStore, v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&ivarLock);
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return [a3 syncStoreType] == 1;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  id v2 = objc_alloc(MEMORY[0x263F433C8]);
  id v3 = (void *)[v2 initWithEntityIdentifier:*MEMORY[0x263F234B8] schemaIdentifier:0];
  return (HDSyncEntityIdentifier *)v3;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F23688];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithData:v4];

  return v5;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  return 1;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  return 0;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = ACHLogSync();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    *(_DWORD *)buf = 138543362;
    v48 = v13;
    _os_log_impl(&dword_21F5DA000, v12, OS_LOG_TYPE_DEFAULT, "Legacy Achievement Entity received sync objects, count: %{public}@", buf, 0xCu);
  }
  if ([v9 count])
  {
    v39 = v10;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v43;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v42 + 1) + 8 * v19);
          v21 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
          v22 = ACHEarnedInstanceFromBackCompatCodableAchievement();

          if (v22)
          {
            [v14 addObject:v22];
          }
          else
          {
            v23 = ACHLogDatabase();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v48 = v20;
              _os_log_error_impl(&dword_21F5DA000, v23, OS_LOG_TYPE_ERROR, "Failed to create earned instance for legacy achievement: %{public}@", buf, 0xCu);
            }
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v17);
    }

    uint64_t v24 = [v14 count];
    v25 = ACHLogSync();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      id v10 = v39;
      if (v26)
      {
        v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v14, "count"));
        *(_DWORD *)buf = 138543362;
        v48 = v27;
        _os_log_impl(&dword_21F5DA000, v25, OS_LOG_TYPE_DEFAULT, "Decoded %{public}@ legacy achievement instances from sync.", buf, 0xCu);
      }
      os_unfair_lock_lock((os_unfair_lock_t)&ivarLock);
      id WeakRetained = objc_loadWeakRetained(&_earnedInstanceStore);

      v29 = ACHLogSync();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      if (WeakRetained)
      {
        if (v30)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F5DA000, v29, OS_LOG_TYPE_DEFAULT, "Legacy Achievement Entity received sync objects and earned instance store is set, passing to the store", buf, 2u);
        }

        id v31 = objc_loadWeakRetained(&_earnedInstanceStore);
        v32 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v14];
        id v40 = 0;
        char v33 = [v31 addEarnedInstances:v32 error:&v40];
        id v34 = v40;

        if (v33) {
          goto LABEL_38;
        }
        v35 = ACHLogDatabase();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          +[ACHBackCompatLegacyAchievementSyncEntity receiveSyncObjects:version:syncStore:profile:error:]((uint64_t)v34, v35);
        }
      }
      else
      {
        if (v30)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F5DA000, v29, OS_LOG_TYPE_DEFAULT, "Legacy Achievement Entity received sync objects, but earned instance store is not registered yet. Writing directly to database.", buf, 2u);
        }

        v35 = [MEMORY[0x263EFFA08] setWithArray:v14];
        id v41 = 0;
        id v36 = (id)objc_msgSend((id)objc_opt_class(), "insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:", v35, objc_msgSend(v39, "syncProvenance"), 1, v11, 0, &v41);
        id v34 = v41;
        if (v34)
        {
          v37 = ACHLogSync();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            +[ACHBackCompatLegacyAchievementSyncEntity receiveSyncObjects:version:syncStore:profile:error:]((uint64_t)v34, v37);
          }
        }
      }

LABEL_38:
      os_unfair_lock_unlock((os_unfair_lock_t)&ivarLock);
      goto LABEL_39;
    }
    id v10 = v39;
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v25, OS_LOG_TYPE_DEFAULT, "Received zero decodable legacy achievement instances from sync, nothing to do.", buf, 2u);
    }
  }
  else
  {
    v14 = ACHLogSync();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v14, OS_LOG_TYPE_DEFAULT, "Received zero Legacy Achievement sync objects, nothing to do.", buf, 2u);
    }
  }
LABEL_39:

  return 0;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int)nanoSyncObjectType
{
  return 5;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 2 * (a3 < 8);
}

+ (void)receiveSyncObjects:(uint64_t)a1 version:(NSObject *)a2 syncStore:profile:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Error directly applying legacy achievement sync objects to database (doesn't fail sync though): %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)receiveSyncObjects:(uint64_t)a1 version:(NSObject *)a2 syncStore:profile:error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Error adding synced legacy achievements (but that doesn't fail sync): %{public}@", (uint8_t *)&v2, 0xCu);
}

@end