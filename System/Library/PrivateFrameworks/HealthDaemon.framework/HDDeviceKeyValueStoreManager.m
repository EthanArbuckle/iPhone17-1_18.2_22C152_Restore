@interface HDDeviceKeyValueStoreManager
- (BOOL)deleteProtectedKVEntriesForDeviceContext:(id)a3 error:(id *)a4;
- (BOOL)enumerateAllEntriesForSyncIdentity:(id)a3 protectionCategory:(int64_t)a4 error:(id *)a5 enumerationHandler:(id)a6;
- (BOOL)insertOrUpdateData:(id)a3 forKey:(id)a4 transaction:(id)a5 domainName:(id)a6 protectionCategory:(int64_t)a7 deviceContext:(id)a8 modificationDate:(id)a9 error:(id *)a10;
- (BOOL)replaceOldSyncIdentity:(id)a3 newSyncIdentity:(id)a4 error:(id *)a5;
- (BOOL)setData:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 deviceContext:(id)a7 modificationDate:(id)a8 error:(id *)a9;
- (BOOL)setData:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 error:(id *)a7;
- (BOOL)setDate:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 error:(id *)a7;
- (BOOL)setNumber:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 error:(id *)a7;
- (BOOL)setString:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 error:(id *)a7;
- (BOOL)updateKeyValuePairsForRemoteEntries:(id)a3 deviceContexts:(id)a4 error:(id *)a5;
- (HDDeviceKeyValueStoreManager)initWithProfile:(id)a3;
- (HDProfile)profile;
- (id)_fetchEntriesForDomain:(void *)a3 key:(uint64_t)a4 protectionCategory:(char)a5 latest:(uint64_t)a6 error:;
- (id)fetchEntriesForDomain:(id)a3 key:(id)a4 protectionCategory:(int64_t)a5 error:(id *)a6;
- (id)fetchEntryForKey:(id)a3 domain:(id)a4 syncIdentity:(id)a5 category:(int64_t)a6 error:(id *)a7;
- (id)mostRecentEntryForDomain:(id)a3 key:(id)a4 protectionCategory:(int64_t)a5 error:(id *)a6;
- (void)_journalOrSetData:(void *)a3 forKey:(void *)a4 domainName:(uint64_t)a5 protectionCategory:(void *)a6 deviceContext:(void *)a7 modificationDate:(uint64_t)a8 error:;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setProfile:(id)a3;
@end

@implementation HDDeviceKeyValueStoreManager

- (HDDeviceKeyValueStoreManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDDeviceKeyValueStoreManager;
  v5 = [(HDDeviceKeyValueStoreManager *)&v12 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    uint64_t v9 = [v6 initWithName:v8 loggingCategory:*MEMORY[0x1E4F29FA8]];
    observers = v5->_observers;
    v5->_observers = (HKObserverSet *)v9;

    objc_storeWeak((id *)&v5->_profile, v4);
    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (id)fetchEntriesForDomain:(id)a3 key:(id)a4 protectionCategory:(int64_t)a5 error:(id *)a6
{
  return -[HDDeviceKeyValueStoreManager _fetchEntriesForDomain:key:protectionCategory:latest:error:](self, a3, a4, a5, 0, (uint64_t)a6);
}

- (id)_fetchEntriesForDomain:(void *)a3 key:(uint64_t)a4 protectionCategory:(char)a5 latest:(uint64_t)a6 error:
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  if (a1)
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__110;
    v36 = __Block_byref_object_dispose__110;
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v12)
    {
      v38[0] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    }
    else
    {
      v13 = 0;
    }
    v14 = objc_opt_class();
    v15 = [a1 profile];
    v16 = [v15 database];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __91__HDDeviceKeyValueStoreManager__fetchEntriesForDomain_key_protectionCategory_latest_error___block_invoke;
    v25 = &unk_1E63024A8;
    v29 = v14;
    id v17 = v13;
    id v26 = v17;
    char v31 = a5;
    uint64_t v30 = a4;
    id v27 = v11;
    v28 = &v32;
    int v18 = [v14 performReadTransactionWithHealthDatabase:v16 error:a6 block:&v22];

    if (v18 && objc_msgSend((id)v33[5], "count", v22, v23, v24, v25, v26)) {
      v19 = (void *)v33[5];
    }
    else {
      v19 = 0;
    }
    id v20 = v19;

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)mostRecentEntryForDomain:(id)a3 key:(id)a4 protectionCategory:(int64_t)a5 error:(id *)a6
{
  v7 = -[HDDeviceKeyValueStoreManager _fetchEntriesForDomain:key:protectionCategory:latest:error:](self, a3, a4, a5, 1, (uint64_t)a6);
  v8 = v7;
  if (v7)
  {
    if ((unint64_t)[v7 count] < 2)
    {
      if ([v8 count] == 1)
      {
        v10 = [v8 firstObject];
        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Multiple storage groups retrived while fetching the most recent entry.");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if (a6) {
          *a6 = v9;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)enumerateAllEntriesForSyncIdentity:(id)a3 protectionCategory:(int64_t)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = objc_opt_class();
  id v12 = [(HDDeviceKeyValueStoreManager *)self profile];
  v13 = [v12 database];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __111__HDDeviceKeyValueStoreManager_enumerateAllEntriesForSyncIdentity_protectionCategory_error_enumerationHandler___block_invoke;
  v17[3] = &unk_1E6302300;
  id v19 = v10;
  id v20 = v11;
  id v18 = v9;
  id v14 = v10;
  id v15 = v9;
  LOBYTE(a5) = [v11 performReadTransactionWithHealthDatabase:v13 error:a5 block:v17];

  return (char)a5;
}

uint64_t __111__HDDeviceKeyValueStoreManager_enumerateAllEntriesForSyncIdentity_protectionCategory_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) enumerateAllEntriesForSyncIdentity:*(void *)(a1 + 32) transaction:a2 error:a3 enumerationHandler:*(void *)(a1 + 40)];
}

- (id)fetchEntryForKey:(id)a3 domain:(id)a4 syncIdentity:(id)a5 category:(int64_t)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__110;
  v33 = __Block_byref_object_dispose__110;
  id v34 = 0;
  id v14 = objc_opt_class();
  id v15 = [(HDDeviceKeyValueStoreManager *)self profile];
  v16 = [v15 database];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__HDDeviceKeyValueStoreManager_fetchEntryForKey_domain_syncIdentity_category_error___block_invoke;
  v23[3] = &unk_1E6302328;
  v23[4] = self;
  id v17 = v13;
  id v24 = v17;
  id v27 = &v29;
  v28 = v14;
  id v18 = v11;
  id v25 = v18;
  id v19 = v12;
  id v26 = v19;
  LODWORD(a7) = [v14 performReadTransactionWithHealthDatabase:v16 error:a7 block:v23];

  if (a7) {
    id v20 = (void *)v30[5];
  }
  else {
    id v20 = 0;
  }
  id v21 = v20;

  _Block_object_dispose(&v29, 8);

  return v21;
}

uint64_t __84__HDDeviceKeyValueStoreManager_fetchEntryForKey_domain_syncIdentity_category_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) profile];
  v7 = [v6 syncIdentityManager];
  uint64_t v8 = *(void *)(a1 + 40);
  id v22 = 0;
  id v9 = [v7 concreteIdentityForIdentity:v8 shouldCreate:0 transaction:v5 error:&v22];
  id v10 = v22;

  if (v9)
  {
    id v11 = *(void **)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    id v14 = [v9 entity];
    id v21 = v10;
    uint64_t v15 = objc_msgSend(v11, "fetchEntryForKey:domain:syncEntityIdentity:transaction:error:", v12, v13, objc_msgSend(v14, "persistentID"), v5, &v21);
    id v16 = v21;

    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v15;

    if (v16)
    {
      if (a3)
      {
        id v10 = v16;
        uint64_t v19 = 0;
        *a3 = v10;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v19 = 0;
        id v10 = v16;
      }
    }
    else
    {
      id v10 = 0;
      uint64_t v19 = 1;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (BOOL)setDate:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    uint64_t v15 = 0;
    goto LABEL_5;
  }
  uint64_t v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:0 error:a7];
  if (v15)
  {
LABEL_5:
    BOOL v16 = [(HDDeviceKeyValueStoreManager *)self setData:v15 forKey:v13 domainName:v14 protectionCategory:a6 error:a7];

    goto LABEL_6;
  }
  BOOL v16 = 0;
LABEL_6:

  return v16;
}

- (BOOL)setNumber:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    uint64_t v15 = 0;
    goto LABEL_5;
  }
  uint64_t v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:0 error:a7];
  if (v15)
  {
LABEL_5:
    BOOL v16 = [(HDDeviceKeyValueStoreManager *)self setData:v15 forKey:v13 domainName:v14 protectionCategory:a6 error:a7];

    goto LABEL_6;
  }
  BOOL v16 = 0;
LABEL_6:

  return v16;
}

- (BOOL)setString:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    uint64_t v15 = 0;
    goto LABEL_5;
  }
  uint64_t v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:0 error:a7];
  if (v15)
  {
LABEL_5:
    BOOL v16 = [(HDDeviceKeyValueStoreManager *)self setData:v15 forKey:v13 domainName:v14 protectionCategory:a6 error:a7];

    goto LABEL_6;
  }
  BOOL v16 = 0;
LABEL_6:

  return v16;
}

- (BOOL)setData:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = +[HDDeviceContext localProductTypeEnumWithError:a7];
  if (v15)
  {
    int64_t v25 = a6;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__110;
    uint64_t v31 = __Block_byref_object_dispose__110;
    id v32 = 0;
    BOOL v16 = [(HDDeviceKeyValueStoreManager *)self profile];
    uint64_t v17 = [v16 database];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __83__HDDeviceKeyValueStoreManager_setData_forKey_domainName_protectionCategory_error___block_invoke;
    v26[3] = &unk_1E62F9108;
    v26[4] = self;
    v26[5] = &v27;
    BOOL v18 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v17 error:a7 block:v26];

    if (v18)
    {
      uint64_t v19 = [HDDeviceContext alloc];
      unsigned int v20 = [v15 unsignedIntValue];
      id v21 = [(HDDeviceContext *)v19 initForLocalDeviceWithType:v20 syncIdentity:v28[5]];
      if (v21)
      {
        id v22 = [MEMORY[0x1E4F1C9C8] now];
        unsigned __int8 v23 = -[HDDeviceKeyValueStoreManager _journalOrSetData:forKey:domainName:protectionCategory:deviceContext:modificationDate:error:](self, v12, v13, v14, v25, v21, v22, (uint64_t)a7);
      }
      else
      {
        unsigned __int8 v23 = 0;
      }
    }
    else
    {
      unsigned __int8 v23 = 0;
    }
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    unsigned __int8 v23 = 0;
  }

  return v23;
}

BOOL __83__HDDeviceKeyValueStoreManager_setData_forKey_domainName_protectionCategory_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) profile];
  v3 = [v2 syncIdentityManager];
  id v4 = [v3 currentSyncIdentity];
  uint64_t v5 = [v4 identity];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)_journalOrSetData:(void *)a3 forKey:(void *)a4 domainName:(uint64_t)a5 protectionCategory:(void *)a6 deviceContext:(void *)a7 modificationDate:(uint64_t)a8 error:
{
  if (result)
  {
    id v14 = result;
    id v15 = a7;
    id v16 = a6;
    id v17 = a4;
    id v18 = a3;
    id v19 = a2;
    unsigned int v20 = [[HDInsertOrUpdateDeviceKeyValueEntryOperation alloc] initWithCategory:a5 key:v18 value:v19 domain:v17 deviceContext:v16 modificationDate:v15];

    id v21 = [v14 profile];
    uint64_t v22 = [(HDJournalableOperation *)v20 performOrJournalWithProfile:v21 error:a8];

    return (void *)v22;
  }
  return result;
}

- (BOOL)deleteProtectedKVEntriesForDeviceContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [HDDeleteAllDeviceContextKeyValueEntriesOperation alloc];
  uint64_t v8 = [v6 syncIdentity];

  id v9 = [(HDDeleteAllDeviceContextKeyValueEntriesOperation *)v7 initWithSyncIdentity:v8];
  id v10 = [(HDDeviceKeyValueStoreManager *)self profile];
  LOBYTE(a4) = [(HDJournalableOperation *)v9 performOrJournalWithProfile:v10 error:a4];

  return (char)a4;
}

- (BOOL)replaceOldSyncIdentity:(id)a3 newSyncIdentity:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [HDRollSyncIdentityDeviceKeyValueEntriesOperation alloc];
  id v11 = [v9 identity];

  id v12 = [v8 identity];

  id v13 = [(HDRollSyncIdentityDeviceKeyValueEntriesOperation *)v10 initWithOldSyncIdentity:v11 newSyncIdentity:v12];
  id v14 = [(HDDeviceKeyValueStoreManager *)self profile];
  LOBYTE(a5) = [(HDJournalableOperation *)v13 performOrJournalWithProfile:v14 error:a5];

  return (char)a5;
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(HKObserverSet *)self->_observers registerObserver:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(HKObserverSet *)self->_observers unregisterObserver:v5];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)insertOrUpdateData:(id)a3 forKey:(id)a4 transaction:(id)a5 domainName:(id)a6 protectionCategory:(int64_t)a7 deviceContext:(id)a8 modificationDate:(id)a9 error:(id *)a10
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v51 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v53 = a9;
  int64_t v50 = a7;
  id v19 = objc_opt_class();
  unsigned int v20 = [(HDDeviceKeyValueStoreManager *)self profile];
  id v21 = [v20 syncIdentityManager];
  uint64_t v22 = [v18 syncIdentity];
  unsigned __int8 v23 = [v21 concreteIdentityForIdentity:v22 shouldCreate:1 transaction:v16 error:a10];

  if (!v23) {
    goto LABEL_7;
  }
  v49 = self;
  id v24 = [(HDDeviceKeyValueStoreManager *)self profile];
  int64_t v25 = [v24 deviceContextManager];
  int v26 = [v25 insertOrUpdateDeviceContext:v18 transaction:v16 error:a10];

  if (v26)
  {
    uint64_t v27 = [v23 entity];
    v28 = +[HDDeviceContextEntity deviceContextEntityWithSyncIdentity:transaction:error:](HDDeviceContextEntity, "deviceContextEntityWithSyncIdentity:transaction:error:", [v27 persistentID], v16, a10);

    if (v28)
    {
      v48 = v28;
      uint64_t v29 = [v28 persistentID];
      uint64_t v30 = [v23 entity];
      uint64_t v31 = [v30 persistentID];
      v33 = v51;
      id v32 = v52;
      id v34 = v17;
      id v35 = v17;
      v36 = v53;
      int v37 = [v19 setData:v52 forKey:v51 domain:v35 deviceContextID:v29 syncEntityIdentity:v31 modificationDate:v53 transaction:v16 error:a10];

      if (v37 == 1)
      {
        v38 = [HDDeviceKeyValueStorageEntry alloc];
        v39 = [v23 identity];
        v40 = [(HDDeviceKeyValueStorageEntry *)v38 initWithDomain:v34 key:v51 value:v52 modificationDate:v53 syncIdentity:v39 category:v50];

        v41 = [HDDeviceKeyValueStorageGroup alloc];
        v57[0] = v40;
        v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
        v43 = [(HDDeviceKeyValueStorageGroup *)v41 initWithDeviceContext:v18 storageEntries:v42];

        observers = v49->_observers;
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __137__HDDeviceKeyValueStoreManager_insertOrUpdateData_forKey_transaction_domainName_protectionCategory_deviceContext_modificationDate_error___block_invoke;
        v54[3] = &unk_1E6302350;
        v55 = v43;
        id v56 = v34;
        v45 = v43;
        [(HKObserverSet *)observers notifyObservers:v54];

        v36 = v53;
      }
      BOOL v46 = v37 != 0;
      v28 = v48;
    }
    else
    {
      BOOL v46 = 0;
      v33 = v51;
      id v32 = v52;
      id v34 = v17;
      v36 = v53;
    }
  }
  else
  {
LABEL_7:
    BOOL v46 = 0;
    v33 = v51;
    id v32 = v52;
    id v34 = v17;
    v36 = v53;
  }

  return v46;
}

void __137__HDDeviceKeyValueStoreManager_insertOrUpdateData_forKey_transaction_domainName_protectionCategory_deviceContext_modificationDate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v4, "deviceKeyValueStoreDidUpdateForStorageGroup:domain:", v5, *(void *)(a1 + 40), v6, v7);
}

- (BOOL)updateKeyValuePairsForRemoteEntries:(id)a3 deviceContexts:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = objc_msgSend(a4, "hk_mapToDictionary:", &__block_literal_global_117);
  id v10 = v8;
  id v11 = v9;
  id v12 = v11;
  if (!self)
  {

LABEL_8:
    char v17 = 0;
    goto LABEL_10;
  }
  uint64_t v32 = 0;
  uint64_t v33 = (uint64_t)&v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__110;
  v36 = __Block_byref_object_dispose__110;
  id v37 = 0;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  uint64_t v27 = __83__HDDeviceKeyValueStoreManager__updateRemoteEntries_deviceContextByIdentity_error___block_invoke;
  v28 = &unk_1E6302438;
  uint64_t v29 = self;
  id v13 = (HDDeviceKeyValueStoreManager *)v11;
  uint64_t v30 = v13;
  uint64_t v31 = &v32;
  [v10 enumerateObjectsUsingBlock:&aBlock];
  id v14 = *(void **)(v33 + 40);
  if (v14)
  {
    id v15 = v14;
    id v16 = v15;
    if (a5) {
      *a5 = v15;
    }
    else {
      _HKLogDroppedError();
    }

    _Block_object_dispose(&v32, 8);
    goto LABEL_8;
  }

  _Block_object_dispose(&v32, 8);
  id v18 = v10;
  id v19 = v13;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  uint64_t v27 = __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke;
  v28 = &unk_1E63023E8;
  unsigned int v20 = v19;
  uint64_t v29 = v20;
  uint64_t v30 = self;
  id v21 = _Block_copy(&aBlock);
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  uint64_t v34 = (uint64_t)__83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke_303;
  id v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6302410;
  id v37 = v21;
  uint64_t v22 = (void (*)(uint64_t))v18;
  v36 = v22;
  id v23 = v21;
  char v17 = HKWithAutoreleasePool();

LABEL_10:
  return v17;
}

void __89__HDDeviceKeyValueStoreManager_updateKeyValuePairsForRemoteEntries_deviceContexts_error___block_invoke(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [v6 syncIdentity];
  ((void (**)(void, id, id))a3)[2](v5, v7, v6);
}

BOOL __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a4;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__110;
  id v35 = __Block_byref_object_dispose__110;
  id v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  id v8 = [*(id *)(a1 + 32) allKeys];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke_2;
  unsigned int v20 = &unk_1E63023C0;
  uint64_t v9 = *(void *)(a1 + 40);
  id v24 = &v27;
  int64_t v25 = &v31;
  uint64_t v21 = v9;
  uint64_t v26 = a3 ^ 1u;
  id v10 = v7;
  id v22 = v10;
  id v23 = *(id *)(a1 + 32);
  [v8 enumerateObjectsUsingBlock:&v17];

  int v11 = *((unsigned __int8 *)v28 + 24);
  if (!*((unsigned char *)v28 + 24))
  {
    id v12 = (void *)v32[5];
    if (v12)
    {
      id v13 = v12;
    }
    else
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Error deleting local kv pairs", v17, v18, v19, v20, v21, v22);
      id v15 = (void *)v32[5];
      v32[5] = v14;

      id v13 = (id)v32[5];
      if (!v13)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    if (a2)
    {
      id v13 = v13;
      *a2 = v13;
    }
    else
    {
      _HKLogDroppedError();
    }
    goto LABEL_8;
  }
LABEL_9:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v11 != 0;
}

void __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) profile];
  id v5 = [v4 deviceKeyValueStoreManager];
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v16 = *(id *)(v7 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke_3;
  v11[3] = &unk_1E6302398;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v12 = v8;
  uint64_t v13 = v9;
  id v14 = *(id *)(a1 + 48);
  id v15 = v3;
  id v10 = v3;
  LOBYTE(v6) = [v5 enumerateAllEntriesForSyncIdentity:v10 protectionCategory:v6 error:&v16 enumerationHandler:v11];
  objc_storeStrong((id *)(v7 + 40), v16);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
}

uint64_t __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = [v5 key];
    id v8 = [v5 domain];
    uint64_t v9 = [v5 protectionCategory];
    id v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 56)];
    int v11 = [v5 modificationDate];
    id v17 = 0;
    LOBYTE(v9) = [v6 setData:0 forKey:v7 domainName:v8 protectionCategory:v9 deviceContext:v10 modificationDate:v11 error:&v17];
    id v12 = v17;

    if ((v9 & 1) == 0)
    {
      id v13 = v12;
      if (v13)
      {
        if (a3) {
          *a3 = v13;
        }
        else {
          _HKLogDroppedError();
        }
      }

      _HKInitializeLogging();
      id v14 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v19 = v16;
        __int16 v20 = 2114;
        id v21 = v5;
        __int16 v22 = 2114;
        id v23 = v13;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Error deleting key value entry (%{public}@) %{public}@", buf, 0x20u);
      }
    }
  }
  return 1;
}

uint64_t __83__HDDeviceKeyValueStoreManager__deleteRemoteEntries_deviceContextByIdentity_error___block_invoke_303(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  return v2 & (*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__HDDeviceKeyValueStoreManager__updateRemoteEntries_deviceContextByIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 syncIdentity];
  id v5 = [*(id *)(a1 + 32) profile];
  uint64_t v6 = [v5 syncIdentityManager];
  uint64_t v7 = [v6 currentSyncIdentity];
  id v8 = [v7 identity];
  char v9 = [v4 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = *(void **)(a1 + 40);
    int v11 = [v3 syncIdentity];
    id v12 = [v10 objectForKey:v11];

    if (v12)
    {
      id v13 = *(void **)(a1 + 32);
      id v14 = [v3 value];
      id v15 = [v3 key];
      uint64_t v16 = [v3 domain];
      uint64_t v17 = [v3 protectionCategory];
      uint64_t v18 = [v3 modificationDate];
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v19 + 40);
      LOBYTE(v13) = [v13 setData:v14 forKey:v15 domainName:v16 protectionCategory:v17 deviceContext:v12 modificationDate:v18 error:&obj];
      objc_storeStrong((id *)(v19 + 40), obj);

      if (v13) {
        goto LABEL_7;
      }
      _HKInitializeLogging();
      __int16 v20 = *MEMORY[0x1E4F29FA8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v21;
      __int16 v32 = 2114;
      uint64_t v33 = v22;
      id v23 = "%{public}@: Error updating local key value entry from remote entry %{public}@";
    }
    else
    {
      uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Found no corresponding device context for remote key value pair");
      uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;

      _HKInitializeLogging();
      __int16 v20 = *MEMORY[0x1E4F29FA8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v27 = *(void *)(a1 + 32);
      uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v27;
      __int16 v32 = 2114;
      uint64_t v33 = v28;
      id v23 = "%{public}@: %{public}@";
    }
    _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
    goto LABEL_7;
  }
LABEL_8:
}

BOOL __91__HDDeviceKeyValueStoreManager__fetchEntriesForDomain_key_protectionCategory_latest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v23 = 0;
  id v9 = [v6 fetchEntriesForKeys:v7 domain:v8 transaction:v5 error:&v23];
  id v10 = v23;
  if (v10)
  {
    if (a3)
    {
      BOOL v11 = 0;
      *a3 = v10;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v11 = 0;
    }
  }
  else if (v9 && [v9 count])
  {
    if (*(unsigned char *)(a1 + 72))
    {
      id v12 = objc_msgSend(v9, "hk_firstSortedObjectWithComparison:", &__block_literal_global_312);
      id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v24[0] = v12;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      uint64_t v15 = [v13 initWithArray:v14];

      id v9 = (id)v15;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__HDDeviceKeyValueStoreManager__fetchEntriesForDomain_key_protectionCategory_latest_error___block_invoke_3;
    v19[3] = &unk_1E6302480;
    id v9 = v9;
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 48);
    id v20 = v9;
    uint64_t v21 = v17;
    uint64_t v22 = v16;
    BOOL v11 = +[HDDeviceContextEntity enumerateDeviceContextWithTransaction:v5 error:a3 enumerationHandler:v19];
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

uint64_t __91__HDDeviceKeyValueStoreManager__fetchEntriesForDomain_key_protectionCategory_latest_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 modificationDate];
  uint64_t v6 = [v4 modificationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __91__HDDeviceKeyValueStoreManager__fetchEntriesForDomain_key_protectionCategory_latest_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v22 = a1;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v9 = [v3 syncIdentity];
        id v10 = [v8 syncIdentity];
        int v11 = [v9 isEqual:v10];

        if (v11)
        {
          id v12 = [HDDeviceKeyValueStorageEntry alloc];
          id v13 = [v8 domain];
          id v14 = [v8 key];
          uint64_t v15 = [v8 value];
          uint64_t v16 = [v8 modificationDate];
          uint64_t v17 = [v8 syncIdentity];
          uint64_t v18 = [(HDDeviceKeyValueStorageEntry *)v12 initWithDomain:v13 key:v14 value:v15 modificationDate:v16 syncIdentity:v17 category:*(void *)(v22 + 48)];
          [v23 addObject:v18];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }

  if ([v23 count])
  {
    uint64_t v19 = *(void **)(*(void *)(*(void *)(v22 + 40) + 8) + 40);
    id v20 = [[HDDeviceKeyValueStorageGroup alloc] initWithDeviceContext:v3 storageEntries:v23];
    [v19 addObject:v20];
  }
  return 1;
}

- (BOOL)setData:(id)a3 forKey:(id)a4 domainName:(id)a5 protectionCategory:(int64_t)a6 deviceContext:(id)a7 modificationDate:(id)a8 error:(id *)a9
{
  return -[HDDeviceKeyValueStoreManager _journalOrSetData:forKey:domainName:protectionCategory:deviceContext:modificationDate:error:](self, a3, a4, a5, a6, a7, a8, (uint64_t)a9);
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end