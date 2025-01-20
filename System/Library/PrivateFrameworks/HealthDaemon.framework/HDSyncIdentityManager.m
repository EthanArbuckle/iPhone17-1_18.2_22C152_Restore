@interface HDSyncIdentityManager
+ (void)unitTest_resetCachedHardwareIdentifier;
- (BOOL)enumerateConcreteIdentitiesError:(id *)a3 enumerationHandler:(id)a4;
- (BOOL)rollCurrentSyncIdentityWithReason:(id)a3 error:(id *)a4;
- (BOOL)updateIsChild:(BOOL)a3 concreteIdentity:(id)a4 error:(id *)a5;
- (HDConcreteSyncIdentity)currentSyncIdentity;
- (HDConcreteSyncIdentity)legacySyncIdentity;
- (HDProfile)profile;
- (HDSyncIdentityManager)initWithProfile:(id)a3;
- (NSString)description;
- (id)childIdentitiesForCurrentSyncIdentityWithError:(id *)a3;
- (id)childIdentitiesForCurrentSyncIdentityWithTransaction:(id)a3 error:(id *)a4;
- (id)concreteIdentityForIdentity:(id)a3 shouldCreate:(BOOL)a4 transaction:(id)a5 error:(id *)a6;
- (id)identityForEntityID:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
- (void)profileDidInitialize:(id)a3;
@end

@implementation HDSyncIdentityManager

- (HDSyncIdentityManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDSyncIdentityManager;
  v5 = [(HDSyncIdentityManager *)&v14 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    id v8 = v7;
    [v4 registerProfileInitializedObserver:v6 queue:0];

    v9 = [[HDDatabaseValueCache alloc] initWithName:@"sync-identity-to-concrete-sync-identity" cacheScope:1];
    entityByIdentityCache = v6->_entityByIdentityCache;
    v6->_entityByIdentityCache = v9;

    v11 = [[HDDatabaseValueCache alloc] initWithName:@"entity-to-concrete-sync-identity" cacheScope:1];
    identityByEntityPersistentIDCache = v6->_identityByEntityPersistentIDCache;
    v6->_identityByEntityPersistentIDCache = v11;
  }
  return v6;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = [WeakRetained profileIdentifier];
  id v7 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v6];

  return (NSString *)v7;
}

- (HDConcreteSyncIdentity)currentSyncIdentity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_currentSyncIdentity;
  os_unfair_lock_unlock(p_lock);
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"HDSyncIdentityManager.m", 71, @"Attempt to call %@ prior to first transaction.", v8 object file lineNumber description];
  }

  return v5;
}

- (HDConcreteSyncIdentity)legacySyncIdentity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_legacySyncIdentity;
  os_unfair_lock_unlock(p_lock);
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"HDSyncIdentityManager.m", 80, @"Attempt to call %@ prior to first transaction.", v8 object file lineNumber description];
  }

  return v5;
}

- (id)concreteIdentityForIdentity:(id)a3 shouldCreate:(BOOL)a4 transaction:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  v13 = v12;
  if (v8 && ([v12 isWriteTransaction] & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDSyncIdentityManager.m", 90, @"Invalid parameter not satisfying: %@", @"transaction.isWriteTransaction" object file lineNumber description];
  }
  entityByIdentityCache = self->_entityByIdentityCache;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__HDSyncIdentityManager_concreteIdentityForIdentity_shouldCreate_transaction_error___block_invoke;
  v19[3] = &unk_1E630B0A8;
  id v20 = v11;
  BOOL v21 = v8;
  id v15 = v11;
  v16 = [(HDDatabaseValueCache *)entityByIdentityCache fetchObjectForKey:v15 transaction:v13 error:a6 faultHandler:v19];

  return v16;
}

id __84__HDSyncIdentityManager_concreteIdentityForIdentity_shouldCreate_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[HDSyncIdentityEntity concreteIdentityForIdentity:*(void *)(a1 + 32) transaction:v5 error:a3];
  id v7 = v6;
  if (v6 || !*(unsigned char *)(a1 + 40))
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:*(void *)(a1 + 32) transaction:v5 error:a3];
  }
  v9 = v8;

  return v9;
}

- (id)identityForEntityID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  identityByEntityPersistentIDCache = self->_identityByEntityPersistentIDCache;
  id v8 = NSNumber;
  id v9 = a4;
  v10 = [v8 numberWithLongLong:a3];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__HDSyncIdentityManager_identityForEntityID_transaction_error___block_invoke;
  v13[3] = &__block_descriptor_40_e59___HDConcreteSyncIdentity_24__0__HDDatabaseTransaction_8__16l;
  v13[4] = a3;
  id v11 = [(HDDatabaseValueCache *)identityByEntityPersistentIDCache fetchObjectForKey:v10 transaction:v9 error:a5 faultHandler:v13];

  return v11;
}

id __63__HDSyncIdentityManager_identityForEntityID_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [(HDSQLiteEntity *)[HDSyncIdentityEntity alloc] initWithPersistentID:*(void *)(a1 + 32)];
  id v7 = [(HDSyncIdentityEntity *)v6 concreteIdentityWithTransaction:v5 error:a3];

  return v7;
}

- (BOOL)enumerateConcreteIdentitiesError:(id *)a3 enumerationHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(HDSyncIdentityManager *)self profile];
  id v8 = [v7 database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__HDSyncIdentityManager_enumerateConcreteIdentitiesError_enumerationHandler___block_invoke;
  v11[3] = &unk_1E62F8050;
  v11[4] = self;
  id v12 = v6;
  id v9 = v6;
  LOBYTE(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:a3 block:v11];

  return (char)a3;
}

BOOL __77__HDSyncIdentityManager_enumerateConcreteIdentitiesError_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__HDSyncIdentityManager_enumerateConcreteIdentitiesError_enumerationHandler___block_invoke_2;
  v10[3] = &unk_1E630B0F0;
  id v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v7 = v5;
  BOOL v8 = +[HDSyncIdentityEntity enumerateConcreteIdentitiesWithTransaction:v7 error:a3 enumerationHandler:v10];

  return v8;
}

uint64_t __77__HDSyncIdentityManager_enumerateConcreteIdentitiesError_enumerationHandler___block_invoke_2(void *a1, void *a2)
{
  v3 = *(void **)(a1[4] + 40);
  uint64_t v4 = NSNumber;
  id v5 = a2;
  id v6 = [v5 entity];
  id v7 = objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v6, "persistentID"));
  [v3 setObject:v5 forKey:v7 transaction:a1[5]];

  BOOL v8 = *(void **)(a1[4] + 32);
  id v9 = [v5 identity];
  [v8 setObject:v5 forKey:v9 transaction:a1[5]];

  uint64_t v10 = (*(uint64_t (**)(void))(a1[6] + 16))();
  return v10;
}

- (BOOL)updateIsChild:(BOOL)a3 concreteIdentity:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(HDSyncIdentityManager *)self profile];
  uint64_t v10 = [v9 database];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__HDSyncIdentityManager_updateIsChild_concreteIdentity_error___block_invoke;
  v13[3] = &unk_1E630B118;
  BOOL v16 = a3;
  id v14 = v8;
  id v15 = self;
  id v11 = v8;
  LOBYTE(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v10 error:a5 block:v13];

  return (char)a5;
}

BOOL __62__HDSyncIdentityManager_updateIsChild_concreteIdentity_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v20 = 0;
  id v8 = +[HDSyncIdentityEntity updateIsChild:v6 concreteIdentity:v7 transaction:v5 error:&v20];
  id v9 = v20;
  uint64_t v10 = v9;
  if (v8)
  {
    id v11 = *(void **)(*(void *)(a1 + 40) + 40);
    id v12 = NSNumber;
    v13 = [v8 entity];
    id v14 = objc_msgSend(v12, "numberWithLongLong:", objc_msgSend(v13, "persistentID"));
    [v11 setObject:v8 forKey:v14 transaction:v5];

    id v15 = *(void **)(*(void *)(a1 + 40) + 32);
    id v16 = [v8 identity];
    [v15 setObject:v8 forKey:v16 transaction:v5];
  }
  else
  {
    v17 = (void *)*MEMORY[0x1E4F29FA8];
    id v16 = v9;
    id v18 = v17;
    if (v16)
    {
      if (a3) {
        *a3 = v16;
      }
      else {
        _HKLogDroppedErrorWithReason();
      }
    }
  }
  return v8 != 0;
}

- (id)childIdentitiesForCurrentSyncIdentityWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__177;
  v17 = __Block_byref_object_dispose__177;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  uint64_t v7 = [(HDSyncIdentityManager *)self profile];
  id v8 = [v7 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__HDSyncIdentityManager_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke;
  v12[3] = &unk_1E62F82A8;
  v12[4] = &v13;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:a4 block:v12];

  if (a4) {
    id v9 = (void *)v14[5];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __84__HDSyncIdentityManager_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v14 = 0;
  id v5 = +[HDSyncIdentityEntity childIdentitiesForCurrentSyncIdentityWithTransaction:a2 error:&v14];
  id v6 = v14;
  uint64_t v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else if (a3)
  {
    *a3 = v6;
  }
  else
  {
    _HKLogDroppedError();
  }

  return v9;
}

- (id)childIdentitiesForCurrentSyncIdentityWithError:(id *)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__177;
  uint64_t v15 = __Block_byref_object_dispose__177;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  id v5 = [(HDSyncIdentityManager *)self profile];
  id v6 = [v5 database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__HDSyncIdentityManager_childIdentitiesForCurrentSyncIdentityWithError___block_invoke;
  v10[3] = &unk_1E62F82A8;
  v10[4] = &v11;
  LODWORD(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v6 error:a3 block:v10];

  if (a3) {
    uint64_t v7 = (void *)v12[5];
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __72__HDSyncIdentityManager_childIdentitiesForCurrentSyncIdentityWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v14 = 0;
  id v5 = +[HDSyncIdentityEntity childIdentitiesForCurrentSyncIdentityWithTransaction:a2 error:&v14];
  id v6 = v14;
  uint64_t v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else if (a3)
  {
    *a3 = v6;
  }
  else
  {
    _HKLogDroppedError();
  }

  return v9;
}

+ (void)unitTest_resetCachedHardwareIdentifier
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_223);
  v2 = (void *)qword_1EBA18E38;
  qword_1EBA18E38 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_223);
}

- (BOOL)rollCurrentSyncIdentityWithReason:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)[(HDConcreteSyncIdentity *)self->_currentSyncIdentity copy];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  BOOL v21 = __Block_byref_object_copy__177;
  v22 = __Block_byref_object_dispose__177;
  id v23 = 0;
  _HKInitializeLogging();
  BOOL v8 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = self;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: sync identity rollover required: %{public}@", buf, 0x16u);
  }
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v11 = [WeakRetained database];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__HDSyncIdentityManager_rollCurrentSyncIdentityWithReason_error___block_invoke;
  v17[3] = &unk_1E62F3DB0;
  v17[4] = self;
  v17[5] = &v18;
  BOOL v12 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:a4 block:v17];

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)p_profile);
    id v14 = [v13 deviceKeyValueStoreManager];
    char v15 = [v14 replaceOldSyncIdentity:v7 newSyncIdentity:v19[5] error:a4];
  }
  else
  {
    char v15 = 0;
  }
  _Block_object_dispose(&v18, 8);

  return v15;
}

BOOL __65__HDSyncIdentityManager_rollCurrentSyncIdentityWithReason_error___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [HDKeyValueDomain alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  BOOL v8 = [(HDKeyValueDomain *)v6 initWithCategory:0 domainName:@"sync-identity" profile:WeakRetained];

  uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = [v9 UUIDString];

  if ([(HDKeyValueDomain *)v8 setString:v10 forKey:@"instance-discriminator" error:a3])
  {
    uint64_t v11 = [HDSyncIdentity alloc];
    BOOL v12 = [*(id *)(*(void *)(a1 + 32) + 16) identity];
    id v13 = [v12 hardwareIdentifier];
    id v14 = [*(id *)(*(void *)(a1 + 32) + 16) identity];
    char v15 = [v14 databaseIdentifier];
    id v16 = [(HDSyncIdentity *)v11 initWithHardwareIdentifier:v13 databaseIdentifier:v15 instanceDiscriminator:v10];

    uint64_t v17 = +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:v16 transaction:v5 error:a3];
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = *(void *)(*(void *)(v20 + 8) + 40);
    BOOL v22 = v21 != 0;
    if (v21)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __65__HDSyncIdentityManager_rollCurrentSyncIdentityWithReason_error___block_invoke_331;
      v28[3] = &unk_1E62F6E80;
      v28[4] = *(void *)(a1 + 32);
      v28[5] = v20;
      [v5 onCommit:v28 orRollback:0];
    }
    else
    {
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = *a3;
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v27;
        _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "Failed to create rolled current sync identity: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v23 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *a3;
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v26;
      _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "Failed to save new instance discriminator in key-value domain: %{public}@", buf, 0xCu);
    }
    BOOL v22 = 0;
  }

  return v22;
}

void __65__HDSyncIdentityManager_rollCurrentSyncIdentityWithReason_error___block_invoke_331(uint64_t a1)
{
}

- (void)profileDidInitialize:(id)a3
{
  id v4 = a3;
  id v5 = [v4 database];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HDSyncIdentityManager_profileDidInitialize___block_invoke;
  v7[3] = &unk_1E62F2AE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performInFirstUnprotectedWriteTransaction:v7];
}

uint64_t __46__HDSyncIdentityManager_profileDidInitialize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = +[HDSyncIdentity legacySyncIdentity];
  uint64_t v7 = +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:v6 transaction:v5 error:a3];

  if (v7)
  {
    id v8 = [[HDKeyValueDomain alloc] initWithCategory:0 domainName:@"sync-identity" profile:*(void *)(a1 + 40)];
    id v92 = 0;
    uint64_t v9 = [(HDKeyValueDomain *)v8 dataForKey:@"database-identifier" error:&v92];
    id v10 = v92;
    id v11 = v10;
    if (v9) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v10 == 0;
    }
    if (!v12)
    {
      _HKInitializeLogging();
      id v16 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v97 = v40;
        __int16 v98 = 2114;
        id v99 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch fetch raw database identifier: %{public}@", buf, 0x16u);
        if (a3) {
          goto LABEL_14;
        }
      }
      else if (a3)
      {
LABEL_14:
        id v11 = v11;
        uint64_t v15 = 0;
        *a3 = v11;
LABEL_85:

        goto LABEL_86;
      }
      _HKLogDroppedError();
      uint64_t v15 = 0;
      goto LABEL_85;
    }
    if (v9) {
      objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v9);
    }
    else {
    uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
    }
    uint64_t v18 = (void *)v13;
    if (v9) {
      BOOL v19 = v13 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    int v20 = v19;
    int v84 = v20;
    if (!v13)
    {
      _HKInitializeLogging();
      uint64_t v21 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
      {
        uint64_t v66 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v97 = v66;
        _os_log_fault_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_FAULT, "%{public}@: Failed to decode existing database identifier data; creating a fresh database identifier. This wil"
          "l roll sync identity.",
          buf,
          0xCu);
      }
      uint64_t v18 = [MEMORY[0x1E4F29128] UUID];
    }

    id v91 = 0;
    uint64_t v22 = [(HDKeyValueDomain *)v8 stringForKey:@"instance-discriminator" error:&v91];
    id v23 = v91;
    id v11 = v23;
    v85 = (__CFString *)v22;
    if (!v22 && v23)
    {
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v65 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v97 = v65;
        __int16 v98 = 2114;
        id v99 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch fetch instance discriminator: %{public}@", buf, 0x16u);
      }
      v25 = 0;
      if (a3)
      {
        id v11 = v11;
        uint64_t v15 = 0;
        *a3 = v11;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v15 = 0;
      }
      goto LABEL_84;
    }
    v81 = [HDSyncIdentity alloc];
    uint64_t v79 = a1;
    id v26 = [*(id *)(a1 + 40) daemon];
    uint64_t v27 = self;
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_223);
    v83 = v8;
    v80 = v26;
    if (qword_1EBA18E38)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_223);
      id v28 = (id)qword_1EBA18E38;
    }
    else
    {
      uint64_t v76 = v27;
      id v29 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
      uint64_t v30 = [v26 localContentURL];
      id v93 = 0;
      v72 = v29;
      LOBYTE(v29) = [v29 createDirectoryAtURL:v30 withIntermediateDirectories:1 attributes:0 error:&v93];
      id v73 = v93;
      if ((v29 & 1) == 0)
      {
        _HKInitializeLogging();
        uint64_t v31 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v97 = v27;
          __int16 v98 = 2114;
          id v99 = v73;
          _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create local content directory: %{public}@", buf, 0x16u);
        }
      }
      v71 = v30;
      id v32 = [v30 URLByAppendingPathComponent:@"SyncIdentityHardwareIdentifier.uuid" isDirectory:0];
      uint64_t v33 = self;
      id v95 = 0;
      v34 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v32 error:&v95];
      v77 = v32;

      id v35 = v95;
      v36 = v35;
      if (v34)
      {
        id v94 = 0;
        v74 = v34;
        v37 = [v34 readDataUpToLength:16 error:&v94];
        id v69 = v94;

        if (v37)
        {
          v38 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v37);
        }
        else
        {
          _HKInitializeLogging();
          v41 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v97 = v33;
            __int16 v98 = 2114;
            id v99 = v69;
            _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read from existing hardware identifier file: %{public}@", buf, 0x16u);
          }
          v38 = 0;
        }

        v34 = v74;
        v36 = v69;
      }
      else if (objc_msgSend(v35, "hk_isCocoaNoSuchFileError"))
      {
        v38 = 0;
      }
      else
      {
        _HKInitializeLogging();
        v42 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v97 = v33;
          __int16 v98 = 2114;
          id v99 = v36;
          _os_log_error_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Failed to open existing hardware identifier file for reading: %{public}@", buf, 0x16u);
        }
        v38 = 0;
        v34 = 0;
      }

      v43 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v44 = [v43 objectForKey:@"SyncIdentityHardwareIdentifier"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v44 = 0;
      }
      v45 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v44, v44);
      v75 = v38;
      if (v45 && [v38 isEqual:v45])
      {
        v46 = v45;
        objc_storeStrong((id *)&qword_1EBA18E38, v45);
        os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_223);
        id v28 = (id)qword_1EBA18E38;
      }
      else
      {
        v46 = v45;
        uint64_t v47 = [MEMORY[0x1E4F29128] UUID];
        v48 = (void *)qword_1EBA18E38;
        qword_1EBA18E38 = v47;

        _HKInitializeLogging();
        v49 = (os_log_t *)MEMORY[0x1E4F29FA8];
        v50 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          uint64_t v97 = v76;
          __int16 v98 = 2112;
          id v99 = v75;
          __int16 v100 = 2112;
          v101 = v45;
          __int16 v102 = 2112;
          uint64_t v103 = qword_1EBA18E38;
          _os_log_impl(&dword_1BCB7D000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: File identifier (%@) and defaults identifier (%@) do not match. Generating fresh hardware identifier: %@", buf, 0x2Au);
        }
        v51 = objc_msgSend((id)qword_1EBA18E38, "hk_dataForUUIDBytes");
        v52 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v52 setObject:v51 forKey:@"SyncIdentityHardwareIdentifier"];

        if (([v51 writeToURL:v77 atomically:1] & 1) == 0)
        {
          _HKInitializeLogging();
          v53 = *v49;
          if (os_log_type_enabled(*v49, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v97 = v76;
            _os_log_error_impl(&dword_1BCB7D000, v53, OS_LOG_TYPE_ERROR, "%{public}@: Failed to write hardware identifier to file", buf, 0xCu);
          }
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_223);
        id v28 = (id)qword_1EBA18E38;
      }
    }
    v25 = v85;

    if (v85) {
      v54 = v85;
    }
    else {
      v54 = &stru_1F1728D60;
    }
    uint64_t v55 = [(HDSyncIdentity *)v81 initWithHardwareIdentifier:v28 databaseIdentifier:v18 instanceDiscriminator:v54];

    id v90 = v11;
    v82 = (void *)v55;
    v56 = +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:v55 transaction:v5 error:&v90];
    id v57 = v90;

    if (v56)
    {
      if (!v84)
      {
LABEL_71:
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __46__HDSyncIdentityManager_profileDidInitialize___block_invoke_337;
        v86[3] = &unk_1E62F30F8;
        v86[4] = *(void *)(v79 + 32);
        id v87 = v56;
        id v88 = v7;
        [v5 onCommit:v86 orRollback:0];

        uint64_t v15 = 1;
        id v11 = v57;
        id v8 = v83;
LABEL_83:

LABEL_84:
        goto LABEL_85;
      }
      v78 = v18;
      v58 = objc_msgSend(v18, "hk_dataForUUIDBytes");
      v59 = [v56 entity];
      id v89 = v57;
      BOOL v60 = -[HDKeyValueDomain setData:forKey:syncIdentity:error:](v83, "setData:forKey:syncIdentity:error:", v58, @"database-identifier", [v59 persistentID], &v89);
      id v61 = v89;

      if (v60)
      {
        id v57 = v61;
        uint64_t v18 = v78;
        v25 = v85;
        goto LABEL_71;
      }
      _HKInitializeLogging();
      v63 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v68 = *(void *)(v79 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v97 = v68;
        __int16 v98 = 2114;
        id v99 = v61;
        _os_log_error_impl(&dword_1BCB7D000, v63, OS_LOG_TYPE_ERROR, "%{public}@: Failed to store updated database identifier: %{public}@", buf, 0x16u);
      }
      id v11 = v61;
      id v8 = v83;
      uint64_t v18 = v78;
      v25 = v85;
      if (!v11)
      {
LABEL_82:

        uint64_t v15 = 0;
        goto LABEL_83;
      }
    }
    else
    {
      _HKInitializeLogging();
      v62 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v67 = *(void *)(v79 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v97 = v67;
        __int16 v98 = 2114;
        id v99 = v57;
        _os_log_error_impl(&dword_1BCB7D000, v62, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create or read current sync identity: %{public}@", buf, 0x16u);
      }
      id v11 = v57;
      id v8 = v83;
      if (!v11) {
        goto LABEL_82;
      }
    }
    if (a3) {
      *a3 = v11;
    }
    else {
      _HKLogDroppedError();
    }
    goto LABEL_82;
  }
  _HKInitializeLogging();
  id v14 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v39 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v97 = v39;
    __int16 v98 = 2114;
    id v99 = 0;
    _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create or read legacy sync identity: %{public}@", buf, 0x16u);
  }
  id v11 = 0;
  uint64_t v15 = 0;
LABEL_86:

  return v15;
}

void __46__HDSyncIdentityManager_profileDidInitialize___block_invoke_337(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  v3 = (id *)(*(void *)(a1 + 32) + 24);

  objc_storeStrong(v3, v2);
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_identityByEntityPersistentIDCache, 0);
  objc_storeStrong((id *)&self->_entityByIdentityCache, 0);
  objc_storeStrong((id *)&self->_legacySyncIdentity, 0);

  objc_storeStrong((id *)&self->_currentSyncIdentity, 0);
}

@end