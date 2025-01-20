@interface HDSourceManager
+ (uint64_t)_isLocalDeviceBundleIdentifier:(uint64_t)a1;
- (BOOL)_deleteSourcesWithUUIDs:(id)a3 localSourceEntityCacheKey:(id)a4 syncIdentity:(id)a5 deleteSamples:(BOOL)a6 transaction:(id)a7 error:(id *)a8;
- (BOOL)createSourcesWithCodables:(id)a3 provenance:(int64_t)a4 error:(id *)a5;
- (BOOL)deleteSourceWithBundleIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setLocalDeviceSourceUUID:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)updateCurrentDeviceNameWithError:(id *)a3;
- (HDSourceManager)init;
- (HDSourceManager)initWithProfile:(id)a3;
- (id)_clientSourcesWithPredicate:(uint64_t)a3 error:;
- (id)_createSourceEntityForBundleIdentifier:(void *)a3 owningAppBundleIdentifier:(void *)a4 name:(uint64_t)a5 options:(uint64_t)a6 isCurrentDevice:(void *)a7 productType:(uint64_t)a8 error:;
- (id)_createSourceEntityForLocalDeviceWithError:(id *)a3;
- (id)_sourceForBundleIdentifier:(void *)a3 createSourceBlock:(void *)a4 modifySourceBlock:(uint64_t)a5 error:;
- (id)_sourceFromEphemeralSource:(uint64_t)a3 provenance:(int)a4 createOrUpdateIfNecessary:(uint64_t)a5 error:;
- (id)_sourceUUIDsForBundleIdentifier:(uint64_t)a3 error:;
- (id)allSourcesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)allSourcesWithError:(id *)a3;
- (id)allWatchSourcesWithError:(id *)a3;
- (id)clientSourceForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)clientSourceForPersistentID:(id)a3 error:(id *)a4;
- (id)clientSourceForSourceEntities:(id)a3 error:(id *)a4;
- (id)clientSourceForSourceEntity:(id)a3 error:(id *)a4;
- (id)clientSourceForUUID:(id)a3 error:(id *)a4;
- (id)clientSourcesForSourceIDs:(id)a3 error:(id *)a4;
- (id)createOrUpdateSourceForClient:(id)a3 error:(id *)a4;
- (id)insertCodableSource:(id)a3 provenance:(int64_t)a4 profile:(id)a5 error:(id *)a6;
- (id)insertSourceWithBundleIdentifier:(id)a3 owningAppBundleIdentifier:(id)a4 UUID:(id)a5 name:(id)a6 options:(unint64_t)a7 isCurrentDevice:(BOOL)a8 productType:(id)a9 modificationDate:(id)a10 provenance:(int64_t)a11 error:(id *)a12;
- (id)localDeviceSourceWithError:(id *)a3;
- (id)localSourceForBundleIdentifier:(id)a3 copyIfNecessary:(BOOL)a4 error:(id *)a5;
- (id)localSourceForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)localSourceForSourceID:(id)a3 copyIfNecessary:(BOOL)a4 error:(id *)a5;
- (id)privateSourceForClinicalAccountIdentifier:(id)a3 provenance:(int64_t)a4 createOrUpdateIfNecessary:(BOOL)a5 nameOnCreateOrUpdate:(id)a6 error:(id *)a7;
- (id)publicSourceForClinicalExternalIdentifier:(id)a3 provenance:(int64_t)a4 createOrUpdateIfNecessary:(BOOL)a5 nameOnCreateOrUpdate:(id)a6 error:(id *)a7;
- (id)sourceEntityForClientSource:(id)a3 createOrUpdateIfNecessary:(BOOL)a4 error:(id *)a5;
- (id)sourceForAppleDeviceWithUUID:(id)a3 identifier:(id)a4 name:(id)a5 productType:(id)a6 createIfNecessary:(BOOL)a7 error:(id *)a8;
- (id)sourceForApplicationIdentifier:(id)a3 createOrUpdateIfNecessary:(BOOL)a4 entitlements:(id)a5 name:(id)a6 error:(id *)a7;
- (id)sourceForClient:(id)a3 error:(id *)a4;
- (id)sourceForCodableSource:(id)a3 provenance:(int64_t)a4 createIfNecessary:(BOOL)a5 isDeleted:(BOOL *)a6 error:(id *)a7;
- (id)sourceUUIDForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)uncachedClientSourceForPersistentID:(id)a3 transaction:(id)a4 error:(id *)a5;
- (uint64_t)_createSourcesWithCodables:(uint64_t)a3 provenance:(void *)a4 sourceUUIDSToDelete:(unsigned int)a5 deleteSamples:(void *)a6 transaction:(uint64_t)a7 error:;
- (void)_applicationsUninstalledNotification:(id)a3;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
@end

@implementation HDSourceManager

- (id)allSourcesWithError:(id *)a3
{
  return -[HDSourceManager _clientSourcesWithPredicate:error:]((uint64_t)self, 0, (uint64_t)a3);
}

- (id)clientSourcesForSourceIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v6, "count"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v9 = [WeakRetained database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__HDSourceManager_clientSourcesForSourceIDs_error___block_invoke;
  v15[3] = &unk_1E62F5A88;
  id v16 = v6;
  v17 = self;
  id v18 = v7;
  id v10 = v7;
  id v11 = v6;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v9 error:a4 block:v15];

  if (a4) {
    v12 = v10;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  return v13;
}

uint64_t __51__HDSourceManager_clientSourcesForSourceIDs_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = *(void **)(v12 + 32);
      v19[5] = v11;
      id v20 = 0;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __51__HDSourceManager_clientSourcesForSourceIDs_error___block_invoke_2;
      v19[3] = &unk_1E62FFF78;
      v19[4] = v12;
      v14 = [v13 fetchObjectForKey:v11 transaction:v5 error:&v20 faultHandler:v19];
      id v15 = v20;
      id v16 = v15;
      if (v14)
      {
        [*(id *)(a1 + 48) addObject:v14];
      }
      else
      {
        if (v15)
        {
          id v16 = v15;
LABEL_11:
          if (a3) {
            *a3 = v16;
          }
          else {
            _HKLogDroppedError();
          }

          goto LABEL_15;
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 118, @"No source for %@", v11);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        if (v16) {
          goto LABEL_11;
        }
      }
LABEL_15:

      if (!v14)
      {
        uint64_t v17 = 0;
        goto LABEL_20;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  uint64_t v17 = 1;
LABEL_20:

  return v17;
}

- (id)clientSourceForPersistentID:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v12 = a3;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a3;
    uint64_t v8 = [v6 arrayWithObjects:&v12 count:1];

    uint64_t v9 = -[HDSourceManager clientSourcesForSourceIDs:error:](self, "clientSourcesForSourceIDs:error:", v8, a4, v12, v13);
    uint64_t v10 = [v9 anyObject];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_sourceForBundleIdentifier:(void *)a3 createSourceBlock:(void *)a4 modifySourceBlock:(uint64_t)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = 0;
  if (a1 && v9)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__90;
    v31 = __Block_byref_object_dispose__90;
    id v32 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__HDSourceManager__sourceForBundleIdentifier_createSourceBlock_modifySourceBlock_error___block_invoke;
    aBlock[3] = &unk_1E62FFF30;
    uint64_t v26 = &v27;
    aBlock[4] = a1;
    id v23 = v9;
    unint64_t v13 = (unint64_t)v10;
    id v24 = (id)v13;
    unint64_t v14 = (unint64_t)v11;
    id v25 = (id)v14;
    id v15 = _Block_copy(aBlock);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v17 = WeakRetained;
    if (v13 | v14)
    {
      id v18 = [WeakRetained database];
      BOOL v19 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v18 error:a5 block:v15];

      if (v19)
      {
LABEL_8:
        id v12 = (id)v28[5];

        _Block_object_dispose(&v27, 8);
        goto LABEL_9;
      }
      uint64_t v17 = (void *)v28[5];
      v28[5] = 0;
    }
    else
    {
      id v20 = [WeakRetained database];
      +[HDHealthEntity performReadTransactionWithHealthDatabase:v20 error:a5 block:v15];
    }
    goto LABEL_8;
  }
LABEL_9:

  return v12;
}

uint64_t __88__HDSourceManager__sourceForBundleIdentifier_createSourceBlock_modifySourceBlock_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 24);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __88__HDSourceManager__sourceForBundleIdentifier_createSourceBlock_modifySourceBlock_error___block_invoke_2;
  v22[3] = &unk_1E62FFF08;
  id v23 = v7;
  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 32);
  id v24 = v9;
  uint64_t v25 = v10;
  id v26 = *(id *)(a1 + 48);
  uint64_t v11 = [v8 fetchObjectForKey:v23 transaction:v5 error:a3 faultHandler:v22];
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  unint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v17)
  {
    uint64_t v18 = *(void *)(a1 + 56);
    if (v18)
    {
      if (((*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16))(v18, v17, v5, a3, v14, v15, v16) & 1) == 0)
      {
        uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
        id v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = 0;
      }
    }
  }

  return 1;
}

- (id)allSourcesForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__90;
  uint64_t v19 = __Block_byref_object_dispose__90;
  id v20 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v8 = [WeakRetained database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__HDSourceManager_allSourcesForBundleIdentifier_error___block_invoke;
  v12[3] = &unk_1E62F5CB0;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = &v15;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:a4 block:v12];

  if (a4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v16[5]];
  }
  else
  {
    uint64_t v10 = 0;
  }

  _Block_object_dispose(&v15, 8);

  return v10;
}

+ (uint64_t)_isLocalDeviceBundleIdentifier:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F2BEC8]];

  return v3;
}

- (id)localDeviceSourceWithError:(id *)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__90;
  uint64_t v15 = __Block_byref_object_dispose__90;
  id v16 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__HDSourceManager_localDeviceSourceWithError___block_invoke;
  v10[3] = &unk_1E62F9108;
  v10[4] = self;
  v10[5] = &v11;
  LODWORD(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:a3 block:v10];

  if (a3) {
    id v7 = (void *)v12[5];
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __46__HDSourceManager_localDeviceSourceWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];

  id v16 = 0;
  uint64_t v7 = +[HDSourceEntity sourceForLocalDeviceWithDatabase:v6 error:&v16];
  id v8 = v16;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    goto LABEL_2;
  }
  if (!v8)
  {
    uint64_t v13 = [*(id *)(a1 + 32) _createSourceEntityForLocalDeviceWithError:a3];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

LABEL_2:
    uint64_t v11 = 1;
    goto LABEL_3;
  }
  if (a3)
  {
    uint64_t v11 = 0;
    *a3 = v8;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v11 = 0;
  }
LABEL_3:

  return v11;
}

- (BOOL)updateCurrentDeviceNameWithError:(id *)a3
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v7 = [WeakRetained profileType];

  if (v7 == 2) {
    return 1;
  }
  id v9 = objc_loadWeakRetained((id *)p_profile);
  uint64_t v10 = [v9 daemon];
  uint64_t v11 = [v10 behavior];
  uint64_t v12 = [v11 currentDeviceDisplayName];

  uint64_t v13 = [HDKeyValueDomain alloc];
  id v14 = objc_loadWeakRetained((id *)p_profile);
  uint64_t v15 = [(HDKeyValueDomain *)v13 initWithCategory:0 domainName:@"source-manager" profile:v14];

  id v26 = 0;
  id v16 = [(HDKeyValueDomain *)v15 stringForKey:@"HKSourceLastObservedDeviceName" error:&v26];
  id v17 = v26;
  uint64_t v18 = v17;
  if (v16 || !v17)
  {
    if (v16 && ([v12 isEqualToString:v16] & 1) != 0)
    {
      BOOL v8 = 1;
    }
    else
    {
      id v19 = objc_loadWeakRetained((id *)p_profile);
      id v20 = [v19 database];

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __52__HDSourceManager_updateCurrentDeviceNameWithError___block_invoke;
      v22[3] = &unk_1E62F5A88;
      id v23 = v12;
      id v24 = self;
      uint64_t v25 = v15;
      BOOL v8 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v20 error:a3 block:v22];
    }
  }
  else if (a3)
  {
    BOOL v8 = 0;
    *a3 = v17;
  }
  else
  {
    _HKLogDroppedError();
    BOOL v8 = 0;
  }

  return v8;
}

- (id)clientSourceForSourceEntity:(id)a3 error:(id *)a4
{
  id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a3, "persistentID"));
  uint64_t v7 = [(HDSourceManager *)self clientSourceForPersistentID:v6 error:a4];

  return v7;
}

id __51__HDSourceManager_clientSourcesForSourceIDs_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = +[HDSQLiteEntity entityWithPersistentID:*(void *)(a1 + 40)];
    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
      uint64_t v7 = [v5 sourceWithProfile:WeakRetained error:a3];

      if ([v7 _isApplication] & 1) != 0 || (objc_msgSend(v7, "_isConnectedGymSource"))
      {
        char v8 = 0;
        if (!v7) {
          goto LABEL_16;
        }
LABEL_9:
        if ((v8 & 1) == 0)
        {
          id v9 = objc_msgSend(MEMORY[0x1E4F2B560], "hd_getNameForSource:", v7);
          if ([v9 length])
          {
            uint64_t v10 = [v7 name];
            char v11 = [v10 isEqualToString:v9];

            if ((v11 & 1) == 0)
            {
              _HKInitializeLogging();
              uint64_t v12 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v15 = 138412546;
                *(void *)&void v15[4] = v9;
                *(_WORD *)&v15[12] = 2112;
                *(void *)&v15[14] = v7;
                _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "Updating name to \"%@\" for source %@", v15, 0x16u);
              }
              [v7 _setName:v9];
              uint64_t v13 = *(NSObject **)(v3 + 16);
              *(void *)uint64_t v15 = MEMORY[0x1E4F143A8];
              *(void *)&v15[8] = 3221225472;
              *(void *)&v15[16] = __59__HDSourceManager__fetchClientSourceForPersistentID_error___block_invoke;
              id v16 = &unk_1E62F6A40;
              id v17 = v5;
              id v18 = v9;
              uint64_t v19 = v3;
              id v20 = v7;
              dispatch_async(v13, v15);
            }
          }
        }
        goto LABEL_16;
      }
      char v8 = [v7 _isResearchStudy] ^ 1;
      if (v7) {
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 118, @"No source entity for specified persistent ID.");
      uint64_t v7 = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v7 = 0;
LABEL_17:

  return v7;
}

id __88__HDSourceManager__sourceForBundleIdentifier_createSourceBlock_modifySourceBlock_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (+[HDSourceManager _isLocalDeviceBundleIdentifier:]((uint64_t)HDSourceManager, *(void **)(a1 + 32)))+[HDSourceEntity sourceForLocalDeviceWithDatabase:*(void *)(a1 + 40) error:a3]; {
  else
  }
  id v6 = [*(id *)(a1 + 48) localSourceForBundleIdentifier:*(void *)(a1 + 32) error:a3];
  if (!v6)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7)
    {
      id v6 = (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v5, a3);
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (HDSourceManager)initWithProfile:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"HDSourceManager.m", 80, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];
  }
  v30.receiver = self;
  v30.super_class = (Class)HDSourceManager;
  id v6 = [(HDSourceManager *)&v30 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_profile, v5);
    uint64_t v8 = HKCreateSerialDispatchQueue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [HDDatabaseValueCache alloc];
    char v11 = [(HDSourceManager *)v7 hk_classNameWithTag:@"entities"];
    uint64_t v12 = [(HDDatabaseValueCache *)v10 initWithName:v11 cacheScope:2];
    sourceEntityByBundleIdentifierCache = v7->_sourceEntityByBundleIdentifierCache;
    v7->_sourceEntityByBundleIdentifierCache = (HDDatabaseValueCache *)v12;

    id v14 = [HDDatabaseValueCache alloc];
    uint64_t v15 = [(HDSourceManager *)v7 hk_classNameWithTag:@"client-sources"];
    uint64_t v16 = [(HDDatabaseValueCache *)v14 initWithName:v15 cacheScope:2];
    clientSourceCache = v7->_clientSourceCache;
    v7->_clientSourceCache = (HDDatabaseValueCache *)v16;

    id v18 = [HDDatabaseValueCache alloc];
    uint64_t v19 = [(HDSourceManager *)v7 hk_classNameWithTag:@"local-entities"];
    uint64_t v20 = [(HDDatabaseValueCache *)v18 initWithName:v19 cacheScope:2];
    localSourceForBundleIdentifierCache = v7->_localSourceForBundleIdentifierCache;
    v7->_localSourceForBundleIdentifierCache = (HDDatabaseValueCache *)v20;

    long long v22 = [HDDatabaseValueCache alloc];
    id v23 = [(HDSourceManager *)v7 hk_classNameWithTag:@"local-entities-by-id"];
    uint64_t v24 = [(HDDatabaseValueCache *)v22 initWithName:v23 cacheScope:1];
    localSourceForSourceID = v7->_localSourceForSourceID;
    v7->_localSourceForSourceID = (HDDatabaseValueCache *)v24;

    id v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v7 selector:sel__applicationsUninstalledNotification_ name:@"HDHealthDaemonApplicationsUninstalledNotification" object:0];

    id WeakRetained = objc_loadWeakRetained((id *)&v7->_profile);
    [WeakRetained registerProfileReadyObserver:v7 queue:v7->_queue];
  }
  return v7;
}

- (HDSourceManager)init
{
  return 0;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HDSourceManager;
  [(HDSourceManager *)&v4 dealloc];
}

uint64_t __52__HDSourceManager_updateCurrentDeviceNameWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];
  id v17 = 0;
  uint64_t v7 = +[HDSourceEntity sourceForLocalDeviceWithDatabase:v6 error:&v17];
  id v8 = v17;
  id v9 = v8;
  if (!v7)
  {
    id v15 = v8;
    id v13 = v15;
    if (v15)
    {
      if (a3)
      {
        id v13 = v15;
        uint64_t v12 = 0;
        *a3 = v13;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v12 = 0;
      }
      goto LABEL_11;
    }
LABEL_8:
    uint64_t v12 = 1;
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  uint64_t v12 = [v7 setName:v10 profile:WeakRetained error:a3];

  if (v12)
  {
    if ([*(id *)(a1 + 48) setString:*(void *)(a1 + 32) forKey:@"HKSourceLastObservedDeviceName" error:a3])
    {
      [*(id *)(*(void *)(a1 + 40) + 32) removeAllObjectsWithTransaction:v5];
      [*(id *)(*(void *)(a1 + 40) + 24) removeAllObjectsWithTransaction:v5];
      [*(id *)(*(void *)(a1 + 40) + 40) removeAllObjectsWithTransaction:v5];
      id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      id v14 = [v13 sourceOrderManager];
      [v14 resetCacheWithTransaction:v5];

      goto LABEL_8;
    }
    uint64_t v12 = 0;
  }
LABEL_12:

  return v12;
}

- (BOOL)setLocalDeviceSourceUUID:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  char v11 = v10;
  if (!v9)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDSourceManager.m", 176, @"Invalid parameter not satisfying: %@", @"UUID != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HDSourceManager.m", 177, @"Invalid parameter not satisfying: %@", @"bundleIdentifier != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v13 = [WeakRetained database];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__HDSourceManager_setLocalDeviceSourceUUID_bundleIdentifier_error___block_invoke;
  v20[3] = &unk_1E62F5A88;
  id v21 = v9;
  long long v22 = self;
  id v23 = v11;
  id v14 = v11;
  id v15 = v9;
  BOOL v16 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v13 error:a5 block:v20];

  return v16;
}

uint64_t __67__HDSourceManager_setLocalDeviceSourceUUID_bundleIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = HDSourceEntityPredicateForSourceWithUUID(*(void **)(a1 + 32), 1);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v8 = +[HDSourceEntity sourcesWithPredicate:v6 includeDeleted:1 profile:WeakRetained error:a3];

  if (v8)
  {
    [*(id *)(*(void *)(a1 + 40) + 24) removeAllObjectsWithTransaction:v5];
    [*(id *)(*(void *)(a1 + 40) + 40) removeAllObjectsWithTransaction:v5];
    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    id v10 = [v9 daemon];
    char v11 = [v10 behavior];
    id v32 = [v11 currentDeviceProductType];

    id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    id v13 = [v12 daemon];
    id v14 = [v13 behavior];
    v31 = [v14 currentDeviceDisplayName];

    id v15 = +[HDLogicalSourceEntity lookUpOrCreateLogicalSourceWithBundleIdentifier:*(void *)(a1 + 48) owningAppBundleIdentifier:0 transaction:v5 error:a3];
    BOOL v16 = [v8 firstObject];
    id v17 = v16;
    if (v16)
    {
      id v18 = *(void **)(*(void *)(a1 + 40) + 32);
      uint64_t v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
      [v18 removeObjectForKey:v19 transaction:v5];

      uint64_t v20 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v15, "persistentID"));
      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      uint64_t v23 = v21;
      uint64_t v25 = v31;
      uint64_t v24 = v32;
      uint64_t v26 = [v17 adoptAsLocalSourceWithLogicalSourceID:v20 UUID:v23 name:v31 productType:v32 profile:v22 error:a3];
    }
    else
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__HDSourceManager_setLocalDeviceSourceUUID_bundleIdentifier_error___block_invoke_2;
      aBlock[3] = &unk_1E62FFDA0;
      aBlock[4] = *(void *)(a1 + 40);
      objc_super v30 = _Block_copy(aBlock);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __67__HDSourceManager_setLocalDeviceSourceUUID_bundleIdentifier_error___block_invoke_3;
      v33[3] = &unk_1E62FFDC8;
      v33[4] = *(void *)(a1 + 40);
      id v34 = v15;
      id v35 = *(id *)(a1 + 32);
      uint64_t v25 = v31;
      id v36 = v31;
      uint64_t v24 = v32;
      id v37 = v32;
      uint64_t v27 = _Block_copy(v33);
      v28 = -[HDSourceManager _sourceForBundleIdentifier:createSourceBlock:modifySourceBlock:error:](*(void *)(a1 + 40), (void *)*MEMORY[0x1E4F2BEC8], v30, v27, a3);
      uint64_t v26 = v28 != 0;
    }
  }
  else
  {
    uint64_t v26 = 0;
  }

  return v26;
}

uint64_t __67__HDSourceManager_setLocalDeviceSourceUUID_bundleIdentifier_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createSourceEntityForLocalDeviceWithError:");
}

uint64_t __67__HDSourceManager_setLocalDeviceSourceUUID_bundleIdentifier_error___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 32);
  id v8 = NSNumber;
  id v9 = a3;
  id v10 = a2;
  char v11 = objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v10, "persistentID"));
  [v7 removeObjectForKey:v11 transaction:v9];

  id v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v17 = [v10 adoptAsLocalSourceWithLogicalSourceID:v12 UUID:v13 name:v14 productType:v15 profile:WeakRetained error:a4];

  return v17;
}

BOOL __55__HDSourceManager_allSourcesForBundleIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  if (v5)
  {
    if (+[HDSourceManager _isLocalDeviceBundleIdentifier:]((uint64_t)HDSourceManager, v6)) {
      HDSourceEntityPredicateForLocalDeviceSource();
    }
    else {
    id v5 = HDSourceEntityPredicateForSourceWithBundleIdentifier((uint64_t)v6);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v8 = +[HDSourceEntity sourcesWithPredicate:v5 includeDeleted:0 profile:WeakRetained error:a3];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  BOOL v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v11;
}

- (id)localSourceForBundleIdentifier:(id)a3 error:(id *)a4
{
  return [(HDSourceManager *)self localSourceForBundleIdentifier:a3 copyIfNecessary:0 error:a4];
}

- (id)localSourceForBundleIdentifier:(id)a3 copyIfNecessary:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__90;
  id v32 = __Block_byref_object_dispose__90;
  id v33 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __72__HDSourceManager_localSourceForBundleIdentifier_copyIfNecessary_error___block_invoke;
  uint64_t v23 = &unk_1E62FFE18;
  uint64_t v26 = &v28;
  uint64_t v24 = self;
  id v9 = v8;
  id v25 = v9;
  BOOL v27 = v6;
  id v10 = _Block_copy(&v20);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v12 = WeakRetained;
  if (v6)
  {
    uint64_t v13 = objc_msgSend(WeakRetained, "database", v20, v21, v22, v23, v24);
    BOOL v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v13 error:a5 block:v10];

    if (!v14)
    {
LABEL_3:
      uint64_t v15 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v16 = objc_msgSend(WeakRetained, "database", v20, v21, v22, v23, v24);
    BOOL v17 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v16 error:a5 block:v10];

    if (!v17) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = (void *)v29[5];
LABEL_6:
  id v18 = v15;

  _Block_object_dispose(&v28, 8);

  return v18;
}

BOOL __72__HDSourceManager_localSourceForBundleIdentifier_copyIfNecessary_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 40);
  id v21 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__HDSourceManager_localSourceForBundleIdentifier_copyIfNecessary_error___block_invoke_2;
  v17[3] = &unk_1E62FFDF0;
  id v8 = v6;
  char v20 = *(unsigned char *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  id v18 = v8;
  uint64_t v19 = v9;
  uint64_t v10 = [v7 fetchObjectForKey:v8 transaction:a2 error:&v21 faultHandler:v17];
  id v11 = v21;
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v10;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    BOOL v14 = 1;
  }
  else
  {
    id v15 = v11;
    BOOL v14 = v15 == 0;
    if (v15)
    {
      if (a3) {
        *a3 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v14;
}

id __72__HDSourceManager_localSourceForBundleIdentifier_copyIfNecessary_error___block_invoke_2(uint64_t a1, void *a2, unint64_t *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v36 = 0;
  uint64_t v7 = +[HDLogicalSourceEntity logicalSourceIDForBundleIdentifier:v6 transaction:v5 error:&v36];
  id v8 = v36;
  uint64_t v9 = v8;
  if (!v7)
  {
    unint64_t v13 = (unint64_t)v8;
    if (!v13)
    {
LABEL_21:

      goto LABEL_22;
    }
    if (!a3)
    {
LABEL_20:
      _HKLogDroppedError();
      goto LABEL_21;
    }
LABEL_10:
    unint64_t v13 = (unint64_t) (id) v13;
    *a3 = v13;
    goto LABEL_21;
  }
  uint64_t v10 = *MEMORY[0x1E4F2BEC8];
  uint64_t v11 = [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F2BEC8]];
  id v35 = v9;
  uint64_t v12 = +[HDSourceEntity sourceForLogicalSourceID:v7 localDeviceBundleIdentifier:v11 localOnly:1 transaction:v5 error:&v35];
  unint64_t v13 = (unint64_t)v35;

  if (!(v12 | v13))
  {
    if (!*(unsigned char *)(a1 + 48))
    {
      unint64_t v13 = 0;
      goto LABEL_22;
    }
    BOOL v14 = *(void **)(a1 + 32);
    id v15 = *(id **)(a1 + 40);
    BOOL v16 = v15 + 1;
    id v34 = 0;
    id v17 = objc_loadWeakRetained(v15 + 1);
    id v32 = v15;
    id v33 = v17;
    if (v15)
    {
      id v18 = v17;
      id v19 = v5;
      id v20 = v7;
      id v21 = +[HDSourceEntity sourceForLogicalSourceID:localDeviceBundleIdentifier:localOnly:transaction:error:](HDSourceEntity, "sourceForLogicalSourceID:localDeviceBundleIdentifier:localOnly:transaction:error:", v20, [v14 isEqualToString:v10], 0, v19, &v34);

      if (v21)
      {
        id WeakRetained = objc_loadWeakRetained(v16);
        uint64_t v23 = [v21 codableSourceWithProfile:WeakRetained error:&v34];

        if (v23)
        {
          uint64_t v24 = [v18 syncIdentityManager];
          id v25 = [v24 currentSyncIdentity];
          uint64_t v26 = [v25 identity];
          BOOL v27 = [v26 codableSyncIdentity];
          [v23 setSyncIdentity:v27];

          uint64_t v28 = [MEMORY[0x1E4F29128] UUID];
          uint64_t v29 = objc_msgSend(v28, "hk_dataForUUIDBytes");
          [v23 setUuid:v29];

          id v30 = objc_loadWeakRetained(v16);
          uint64_t v12 = [v32 insertCodableSource:v23 provenance:0 profile:v30 error:&v34];
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }

    unint64_t v13 = (unint64_t)v34;
  }
  if (v12) {
    goto LABEL_23;
  }
  unint64_t v13 = (unint64_t)(id)v13;
  if (v13)
  {
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
LABEL_22:
  uint64_t v12 = 0;
LABEL_23:

  return (id)v12;
}

- (id)insertCodableSource:(id)a3 provenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [v9 decodedUUID];
  if (v11)
  {
    if ([v9 hasOptions]) {
      uint64_t v12 = [v9 options];
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = __Block_byref_object_copy__90;
    uint64_t v29 = __Block_byref_object_dispose__90;
    id v30 = 0;
    BOOL v14 = [v10 database];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__HDSourceManager_insertCodableSource_provenance_profile_error___block_invoke;
    v18[3] = &unk_1E62FF240;
    id v19 = v9;
    id v20 = v10;
    id v22 = &v25;
    id v21 = v11;
    uint64_t v23 = v12;
    int64_t v24 = a4;
    BOOL v15 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v14 error:a6 block:v18];

    if (v15) {
      BOOL v16 = (void *)v26[5];
    }
    else {
      BOOL v16 = 0;
    }
    id v13 = v16;

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a6, 3, @"missing source UUID during decoding");
    id v13 = 0;
  }

  return v13;
}

BOOL __64__HDSourceManager_insertCodableSource_provenance_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) deleted])
  {
    uint64_t v6 = &stru_1F1728D60;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) bundleIdentifier];
  }
  if ([*(id *)(a1 + 32) deleted])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) owningAppBundleIdentifier];
  }
  id v8 = +[HDLogicalSourceEntity lookUpOrCreateLogicalSourceWithBundleIdentifier:v6 owningAppBundleIdentifier:v7 transaction:v5 error:a3];
  id v9 = [*(id *)(a1 + 40) syncIdentityManager];
  id v10 = [v9 legacySyncIdentity];

  if (![*(id *)(a1 + 32) hasSyncIdentity])
  {
    id v49 = v5;
    v51 = a3;
    v47 = v7;
    v48 = v6;
    id v52 = 0;
    goto LABEL_12;
  }
  uint64_t v11 = v10;
  uint64_t v12 = [*(id *)(a1 + 32) syncIdentity];
  id v54 = 0;
  uint64_t v13 = +[HDSyncIdentity syncIdentityWithCodable:v12 error:&v54];
  id v14 = v54;

  if (!v13)
  {
    v50 = 0;
    _HKInitializeLogging();
    id v35 = *MEMORY[0x1E4F29F18];
    id v32 = v11;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v56 = v14;
      _os_log_fault_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
    }
    id v36 = v14;
    id v34 = v36;
    if (!v36)
    {
      uint64_t v27 = v8;
      goto LABEL_29;
    }
    if (!a3)
    {
      uint64_t v27 = v8;
      _HKLogDroppedError();
      goto LABEL_29;
    }
    id v37 = a3;
    uint64_t v27 = v8;
    id v38 = v36;
    id v34 = v38;
LABEL_23:
    *id v37 = v38;
LABEL_29:

    BOOL v33 = 0;
    goto LABEL_30;
  }
  v51 = a3;
  BOOL v15 = [*(id *)(a1 + 40) syncIdentityManager];
  id v53 = v14;
  [v15 concreteIdentityForIdentity:v13 shouldCreate:1 transaction:v5 error:&v53];
  v17 = BOOL v16 = (void *)v13;
  id v52 = v53;

  if (!v17)
  {
    v50 = v16;
    v39 = v7;
    _HKInitializeLogging();
    v40 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v56 = v52;
      _os_log_fault_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
    }
    id v41 = v52;
    id v34 = v41;
    uint64_t v7 = v39;
    if (v41)
    {
      if (v51)
      {
        id v37 = v51;
        uint64_t v27 = v8;
        id v38 = v41;
        id v34 = v38;
        id v32 = 0;
        goto LABEL_23;
      }
      uint64_t v27 = v8;
      _HKLogDroppedError();
    }
    else
    {
      uint64_t v27 = v8;
    }
    id v32 = 0;
    goto LABEL_29;
  }
  v47 = v7;
  v48 = v6;
  id v49 = v5;

  id v10 = (void *)v17;
LABEL_12:
  uint64_t v46 = *(void *)(a1 + 48);
  uint64_t v45 = [v8 persistentID];
  id v18 = [*(id *)(a1 + 32) name];
  uint64_t v19 = *(void *)(a1 + 64);
  id v20 = [*(id *)(a1 + 32) productType];
  char v21 = [*(id *)(a1 + 32) deleted];
  id v22 = [*(id *)(a1 + 32) decodedModificationDate];
  uint64_t v23 = *(void *)(a1 + 72);
  [v10 entity];
  v25 = int64_t v24 = v10;
  uint64_t v26 = [v25 persistentID];
  uint64_t v44 = v23;
  uint64_t v27 = v8;
  LOBYTE(v43) = v21;
  uint64_t v28 = v19;
  id v5 = v49;
  uint64_t v29 = +[HDSourceEntity insertSourceWithUUID:v46 logicalSourceID:v45 name:v18 options:v28 isCurrentDevice:0 productType:v20 deleted:v43 modificationDate:v22 provenance:v44 syncIdentity:v26 transaction:v49 error:v51];
  uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
  v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v29;

  id v32 = v24;
  BOOL v33 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
  uint64_t v7 = v47;
  uint64_t v6 = v48;
  id v34 = v52;
LABEL_30:

  return v33;
}

- (id)localSourceForSourceID:(id)a3 copyIfNecessary:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__90;
  id v32 = __Block_byref_object_dispose__90;
  id v33 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __64__HDSourceManager_localSourceForSourceID_copyIfNecessary_error___block_invoke;
  uint64_t v23 = &unk_1E62FFE18;
  uint64_t v26 = &v28;
  int64_t v24 = self;
  id v9 = v8;
  id v25 = v9;
  BOOL v27 = v6;
  id v10 = _Block_copy(&v20);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v12 = WeakRetained;
  if (v6)
  {
    uint64_t v13 = objc_msgSend(WeakRetained, "database", v20, v21, v22, v23, v24);
    BOOL v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v13 error:a5 block:v10];

    if (!v14)
    {
LABEL_3:
      BOOL v15 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v16 = objc_msgSend(WeakRetained, "database", v20, v21, v22, v23, v24);
    BOOL v17 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v16 error:a5 block:v10];

    if (!v17) {
      goto LABEL_3;
    }
  }
  BOOL v15 = (void *)v29[5];
LABEL_6:
  id v18 = v15;

  _Block_object_dispose(&v28, 8);

  return v18;
}

BOOL __64__HDSourceManager_localSourceForSourceID_copyIfNecessary_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 48);
  id v21 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__HDSourceManager_localSourceForSourceID_copyIfNecessary_error___block_invoke_2;
  v17[3] = &unk_1E62FFDF0;
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 32);
  id v18 = v8;
  uint64_t v19 = v9;
  char v20 = *(unsigned char *)(a1 + 56);
  uint64_t v10 = [v7 fetchObjectForKey:v8 transaction:a2 error:&v21 faultHandler:v17];
  id v11 = v21;
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v10;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    BOOL v14 = 1;
  }
  else
  {
    id v15 = v11;
    BOOL v14 = v15 == 0;
    if (v15)
    {
      if (a3) {
        *a3 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v14;
}

id __64__HDSourceManager_localSourceForSourceID_copyIfNecessary_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  BOOL v6 = -[HDSQLiteEntity initWithPersistentID:]([HDSourceEntity alloc], "initWithPersistentID:", [*(id *)(a1 + 32) longLongValue]);
  uint64_t v7 = [v5 databaseForEntityClass:objc_opt_class()];

  id v8 = [(HDSourceEntity *)v6 sourceBundleIdentifierInDatabase:v7 error:a3];
  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 40) localSourceForBundleIdentifier:v8 copyIfNecessary:*(unsigned __int8 *)(a1 + 48) error:a3];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)privateSourceForClinicalAccountIdentifier:(id)a3 provenance:(int64_t)a4 createOrUpdateIfNecessary:(BOOL)a5 nameOnCreateOrUpdate:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  id v11 = [MEMORY[0x1E4F2B560] _privateSourceForClinicalAccountIdentifier:a3 name:a6];
  uint64_t v12 = -[HDSourceManager _sourceFromEphemeralSource:provenance:createOrUpdateIfNecessary:error:]((uint64_t)self, v11, a4, v8, (uint64_t)a7);

  return v12;
}

- (id)_sourceFromEphemeralSource:(uint64_t)a3 provenance:(int)a4 createOrUpdateIfNecessary:(uint64_t)a5 error:
{
  id v9 = a2;
  uint64_t v10 = v9;
  if (a1)
  {
    if (a4)
    {
      id v11 = [v9 name];

      if (!v11)
      {
        id v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:sel__sourceFromEphemeralSource_provenance_createOrUpdateIfNecessary_error_, a1, @"HDSourceManager.m", 501, @"Invalid parameter not satisfying: %@", @"source.name" object file lineNumber description];
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __89__HDSourceManager__sourceFromEphemeralSource_provenance_createOrUpdateIfNecessary_error___block_invoke;
      aBlock[3] = &unk_1E62FFE40;
      aBlock[4] = a1;
      id v12 = v10;
      id v23 = v12;
      uint64_t v24 = a3;
      uint64_t v13 = _Block_copy(aBlock);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __89__HDSourceManager__sourceFromEphemeralSource_provenance_createOrUpdateIfNecessary_error___block_invoke_2;
      v19[3] = &unk_1E62FFE68;
      id v20 = v12;
      uint64_t v21 = a1;
      BOOL v14 = _Block_copy(v19);
    }
    else
    {
      uint64_t v13 = 0;
      BOOL v14 = 0;
    }
    id v15 = [v10 bundleIdentifier];
    BOOL v16 = -[HDSourceManager _sourceForBundleIdentifier:createSourceBlock:modifySourceBlock:error:](a1, v15, v13, v14, a5);
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)publicSourceForClinicalExternalIdentifier:(id)a3 provenance:(int64_t)a4 createOrUpdateIfNecessary:(BOOL)a5 nameOnCreateOrUpdate:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  id v11 = [MEMORY[0x1E4F2B560] _publicSourceForClinicalExternalIdentifier:a3 name:a6];
  id v12 = -[HDSourceManager _sourceFromEphemeralSource:provenance:createOrUpdateIfNecessary:error:]((uint64_t)self, v11, a4, v8, (uint64_t)a7);

  return v12;
}

id __89__HDSourceManager__sourceFromEphemeralSource_provenance_createOrUpdateIfNecessary_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  BOOL v6 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v7 = [*(id *)(a1 + 40) _owningAppBundleIdentifier];
  BOOL v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [*(id *)(a1 + 40) name];
  uint64_t v10 = [*(id *)(a1 + 40) _options];
  id v11 = [*(id *)(a1 + 40) _productType];
  id v12 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v13 = [v5 insertSourceWithBundleIdentifier:v6 owningAppBundleIdentifier:v7 UUID:v8 name:v9 options:v10 isCurrentDevice:0 productType:v11 modificationDate:v12 provenance:*(void *)(a1 + 48) error:a3];

  return v13;
}

uint64_t __89__HDSourceManager__sourceFromEphemeralSource_provenance_createOrUpdateIfNecessary_error___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) name];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  uint64_t v11 = [v7 setName:v9 profile:WeakRetained error:a4];

  if (v11)
  {
    id v12 = *(void **)(*(void *)(a1 + 40) + 32);
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    [v12 removeObjectForKey:v13 transaction:v8];
  }
  return v11;
}

- (id)sourceForClient:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 sourceBundleIdentifier];
  if (v7)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F2B560], "hd_sourceForClient:", v6);
    id v9 = [(HDSourceManager *)self sourceEntityForClientSource:v8 createOrUpdateIfNecessary:0 error:a4];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 4, @"Missing application-identifier entitlement");
    id v9 = 0;
  }

  return v9;
}

- (id)createOrUpdateSourceForClient:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 sourceBundleIdentifier];
  if (v7)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F2B560], "hd_sourceForClient:", v6);
    id v12 = 0;
    uint64_t v9 = [(HDSourceManager *)self sourceEntityForClientSource:v8 createOrUpdateIfNecessary:1 error:&v12];
    uint64_t v10 = (uint64_t)v12;

    if (!(v9 | v10))
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failed to create source for client %@", v7);
    }
    if (a4) {
      *a4 = (id) v10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 4, @"Missing application-identifier entitlement");
    uint64_t v9 = 0;
  }

  return (id)v9;
}

- (id)sourceForApplicationIdentifier:(id)a3 createOrUpdateIfNecessary:(BOOL)a4 entitlements:(id)a5 name:(id)a6 error:(id *)a7
{
  BOOL v8 = a4;
  uint64_t v10 = [MEMORY[0x1E4F2B560] _sourceWithBundleIdentifier:a3 defaultBundleIdentifier:a3 appEntitlements:a5 name:a6];
  uint64_t v11 = [(HDSourceManager *)self sourceEntityForClientSource:v10 createOrUpdateIfNecessary:v8 error:a7];

  return v11;
}

- (id)sourceEntityForClientSource:(id)a3 createOrUpdateIfNecessary:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 bundleIdentifier];
  if (v10)
  {
    if (v6)
    {
LABEL_3:
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __79__HDSourceManager_sourceEntityForClientSource_createOrUpdateIfNecessary_error___block_invoke;
      aBlock[3] = &unk_1E62FFE90;
      id v21 = v10;
      id v22 = self;
      id v11 = v9;
      id v23 = v11;
      id v12 = _Block_copy(aBlock);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __79__HDSourceManager_sourceEntityForClientSource_createOrUpdateIfNecessary_error___block_invoke_2;
      v17[3] = &unk_1E62FFE68;
      id v18 = v11;
      uint64_t v19 = self;
      uint64_t v13 = _Block_copy(v17);

      goto LABEL_6;
    }
  }
  else
  {
    BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HDSourceManager.m", 594, @"Invalid parameter not satisfying: %@", @"bundleIdentifier != nil" object file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
  }
  id v12 = 0;
  uint64_t v13 = 0;
LABEL_6:
  id v15 = -[HDSourceManager _sourceForBundleIdentifier:createSourceBlock:modifySourceBlock:error:]((uint64_t)self, v10, v12, v13, (uint64_t)a5);

  return v15;
}

id __79__HDSourceManager_sourceEntityForClientSource_createOrUpdateIfNecessary_error___block_invoke(void **a1, uint64_t a2, uint64_t a3)
{
  if (+[HDSourceManager _isLocalDeviceBundleIdentifier:]((uint64_t)HDSourceManager, a1[4]))
  {
    id v5 = [a1[5] _createSourceEntityForLocalDeviceWithError:a3];
  }
  else if (objc_msgSend(MEMORY[0x1E4F2B560], "hd_isSpartanDeviceBundleIdentifier:", a1[4]))
  {
    BOOL v6 = a1[5];
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F2B560] _connectedGymSource];
      BOOL v8 = [v7 bundleIdentifier];
      id v9 = [v7 _owningAppBundleIdentifier];
      uint64_t v10 = [v7 name];
      uint64_t v11 = [v7 _options];
      id v12 = [v7 _productType];
      id v5 = -[HDSourceManager _createSourceEntityForBundleIdentifier:owningAppBundleIdentifier:name:options:isCurrentDevice:productType:error:](v6, v8, v9, v10, v11, 0, v12, a3);
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    uint64_t v13 = [a1[6] name];
    if (!v13)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F2B560], "hd_getNameForSource:", a1[6]);
    }
    id v15 = a1[4];
    BOOL v14 = a1[5];
    BOOL v16 = [a1[6] _owningAppBundleIdentifier];
    uint64_t v17 = [a1[6] _options];
    uint64_t v18 = [a1[6] _isLocalDevice];
    uint64_t v19 = [a1[6] _productType];
    id v5 = -[HDSourceManager _createSourceEntityForBundleIdentifier:owningAppBundleIdentifier:name:options:isCurrentDevice:productType:error:](v14, v15, v16, v13, v17, v18, v19, a3);
  }

  return v5;
}

- (id)_createSourceEntityForBundleIdentifier:(void *)a3 owningAppBundleIdentifier:(void *)a4 name:(uint64_t)a5 options:(uint64_t)a6 isCurrentDevice:(void *)a7 productType:(uint64_t)a8 error:
{
  if (a1)
  {
    id v15 = (void *)MEMORY[0x1E4F29128];
    id v16 = a7;
    id v17 = a4;
    id v18 = a3;
    id v19 = a2;
    id v20 = [v15 UUID];
    id v21 = [MEMORY[0x1E4F1C9C8] date];
    id v22 = [a1 insertSourceWithBundleIdentifier:v19 owningAppBundleIdentifier:v18 UUID:v20 name:v17 options:a5 isCurrentDevice:a6 productType:v16 modificationDate:v21 provenance:0 error:a8];
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

uint64_t __79__HDSourceManager_sourceEntityForClientSource_createOrUpdateIfNecessary_error___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  char v16 = 0;
  uint64_t v9 = [*(id *)(a1 + 32) _options];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  uint64_t v11 = [v7 setOptions:v9 profile:WeakRetained didUpdate:&v16 error:a4];

  if (v11) {
    BOOL v12 = v16 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    uint64_t v13 = *(void **)(*(void *)(a1 + 40) + 32);
    BOOL v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    [v13 removeObjectForKey:v14 transaction:v8];
  }
  return v11;
}

- (id)sourceForAppleDeviceWithUUID:(id)a3 identifier:(id)a4 name:(id)a5 productType:(id)a6 createIfNecessary:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (v9)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __100__HDSourceManager_sourceForAppleDeviceWithUUID_identifier_name_productType_createIfNecessary_error___block_invoke;
    aBlock[3] = &unk_1E62FFEB8;
    void aBlock[4] = self;
    id v22 = v15;
    id v23 = v14;
    id v24 = v16;
    id v25 = v17;
    id v18 = _Block_copy(aBlock);
  }
  else
  {
    id v18 = 0;
  }
  id v19 = -[HDSourceManager _sourceForBundleIdentifier:createSourceBlock:modifySourceBlock:error:]((uint64_t)self, v15, v18, 0, (uint64_t)a8);

  return v19;
}

id __100__HDSourceManager_sourceForAppleDeviceWithUUID_identifier_name_productType_createIfNecessary_error___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v8 = a1[7];
  uint64_t v9 = HKSourceOptionsForAppleDevice();
  uint64_t v10 = a1[8];
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  id v19 = 0;
  BOOL v12 = [v5 insertSourceWithBundleIdentifier:v6 owningAppBundleIdentifier:0 UUID:v7 name:v8 options:v9 isCurrentDevice:0 productType:v10 modificationDate:v11 provenance:0 error:&v19];
  id v13 = v19;

  if (!v12)
  {
    _HKInitializeLogging();
    id v14 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = a1[5];
      uint64_t v18 = a1[6];
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      uint64_t v23 = v18;
      __int16 v24 = 2114;
      id v25 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "Failed to insert local source for %@ %@: %{public}@", buf, 0x20u);
    }
    id v15 = v13;
    if (v15)
    {
      if (a3) {
        *a3 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }

  return v12;
}

- (id)sourceForCodableSource:(id)a3 provenance:(int64_t)a4 createIfNecessary:(BOOL)a5 isDeleted:(BOOL *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__90;
  v31 = __Block_byref_object_dispose__90;
  id v32 = 0;
  id v13 = [v12 decodedUUID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v15 = [WeakRetained database];

  if (v13)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__HDSourceManager_sourceForCodableSource_provenance_createIfNecessary_isDeleted_error___block_invoke;
    aBlock[3] = &unk_1E62FFEE0;
    uint64_t v23 = &v27;
    __int16 v24 = a6;
    BOOL v26 = v9;
    id v20 = v13;
    uint64_t v21 = self;
    id v22 = v12;
    int64_t v25 = a4;
    id v16 = _Block_copy(aBlock);
    if (v9) {
      +[HDHealthEntity performWriteTransactionWithHealthDatabase:v15 error:a7 block:v16];
    }
    else {
      +[HDHealthEntity performReadTransactionWithHealthDatabase:v15 error:a7 block:v16];
    }
    id v17 = (id)v28[5];
  }
  else
  {
    id v17 = 0;
  }

  _Block_object_dispose(&v27, 8);

  return v17;
}

BOOL __87__HDSourceManager_sourceForCodableSource_provenance_createIfNecessary_isDeleted_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 databaseForEntityClass:objc_opt_class()];

  uint64_t v7 = HDSourceEntityPredicateForSourceWithUUID(*(void **)(a1 + 32), 1);
  id v23 = 0;
  uint64_t v8 = +[HDSourceEntity firstSourceWithPredicate:v7 database:v6 error:&v23];
  id v9 = v23;
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  id v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v12)
  {
    if (*(void *)(a1 + 64)) {
      **(unsigned char **)(a1 + 64) = [v12 BOOLeanForProperty:@"deleted" database:v6];
    }
    goto LABEL_4;
  }
  BOOL v13 = v9 == 0;
  if (v9)
  {
    id v14 = v9;
    if (a3) {
      *a3 = v14;
    }
    else {
      _HKLogDroppedError();
    }
    goto LABEL_13;
  }
  if (!*(unsigned char *)(a1 + 80))
  {
LABEL_13:

    goto LABEL_14;
  }
  id v15 = *(id **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained(v15 + 1);
  uint64_t v19 = [v15 insertCodableSource:v16 provenance:v17 profile:WeakRetained error:a3];
  uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    BOOL v13 = 0;
    goto LABEL_14;
  }
  if (*(void *)(a1 + 64))
  {
    **(unsigned char **)(a1 + 64) = [*(id *)(a1 + 48) deleted];
    BOOL v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
    goto LABEL_14;
  }
LABEL_4:
  BOOL v13 = 1;
LABEL_14:

  return v13;
}

- (id)clientSourceForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v26 = 0;
  id v7 = [(HDSourceManager *)self localSourceForBundleIdentifier:v6 error:&v26];
  id v8 = v26;
  id v9 = v8;
  if (v7) {
    goto LABEL_2;
  }
  if (!v8)
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__90;
    __int16 v24 = __Block_byref_object_dispose__90;
    id v25 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v15 = [WeakRetained database];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__HDSourceManager_clientSourceForBundleIdentifier_error___block_invoke;
    v17[3] = &unk_1E62F3DB0;
    id v18 = v6;
    uint64_t v19 = &v20;
    BOOL v16 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v15 error:a4 block:v17];

    if (v16) {
      id v7 = (id)v21[5];
    }
    else {
      id v7 = 0;
    }

    _Block_object_dispose(&v20, 8);
    if (!v7)
    {
      uint64_t v11 = 0;
      goto LABEL_3;
    }
LABEL_2:
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    uint64_t v11 = [(HDSourceManager *)self clientSourceForPersistentID:v10 error:a4];

LABEL_3:
    id v12 = v11;

    goto LABEL_4;
  }
  if (a4)
  {
    id v12 = 0;
    *a4 = v8;
  }
  else
  {
    _HKLogDroppedError();
    id v12 = 0;
  }
LABEL_4:

  return v12;
}

uint64_t __57__HDSourceManager_clientSourceForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  id v7 = +[HDLogicalSourceEntity logicalSourceIDForBundleIdentifier:v5 transaction:v6 error:a3];
  uint64_t v8 = +[HDSourceEntity sourceForLogicalSourceID:localDeviceBundleIdentifier:localOnly:transaction:error:](HDSourceEntity, "sourceForLogicalSourceID:localDeviceBundleIdentifier:localOnly:transaction:error:", v7, [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F2BEC8]], 0, v6, a3);

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return 1;
}

- (id)uncachedClientSourceForPersistentID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(HDDatabaseValueCache *)self->_clientSourceCache fetchObjectForKey:v8 transaction:a4 error:a5 faultHandler:&__block_literal_global_95];
  if (!v9)
  {
    uint64_t v10 = -[HDSQLiteEntity initWithPersistentID:]([HDSourceEntity alloc], "initWithPersistentID:", [v8 longLongValue]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v9 = [(HDSourceEntity *)v10 sourceWithProfile:WeakRetained error:a5];
  }

  return v9;
}

uint64_t __73__HDSourceManager_uncachedClientSourceForPersistentID_transaction_error___block_invoke()
{
  return 0;
}

- (id)clientSourceForSourceEntities:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = NSNumber;
    id v8 = [v6 anyObject];
    uint64_t v9 = objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
    uint64_t v10 = [(HDSourceManager *)self clientSourceForPersistentID:v9 error:a4];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)sourceUUIDForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = -[HDSourceManager localSourceForBundleIdentifier:error:](self, "localSourceForBundleIdentifier:error:", a3);
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v8 = [v6 sourceUUIDWithProfile:WeakRetained error:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)clientSourceForUUID:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HDSourceManager.m", 893, @"Invalid parameter not satisfying: %@", @"sourceUUID != nil" object file lineNumber description];
  }
  id v8 = HDSourceEntityPredicateForSourceWithUUID(v7, 0);
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v11 = +[HDSourceEntity firstSourceWithPredicate:v8 profile:WeakRetained error:a4];

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)p_profile);
    BOOL v13 = [v11 sourceWithProfile:v12 error:a4];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)_clientSourcesWithPredicate:(uint64_t)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v8 = [WeakRetained database];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__HDSourceManager__clientSourcesWithPredicate_error___block_invoke;
    v13[3] = &unk_1E62F5A88;
    id v14 = v5;
    uint64_t v15 = a1;
    id v9 = v6;
    id v16 = v9;
    BOOL v10 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:a3 block:v13];

    if (v10) {
      uint64_t v11 = (void *)[v9 copy];
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)allWatchSourcesWithError:(id *)a3
{
  id v5 = HDSourceEntityPredicateForAppleWatchSources();
  id v6 = -[HDSourceManager _clientSourcesWithPredicate:error:]((uint64_t)self, v5, (uint64_t)a3);

  return v6;
}

BOOL __53__HDSourceManager__clientSourcesWithPredicate_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__HDSourceManager__clientSourcesWithPredicate_error___block_invoke_2;
  v11[3] = &unk_1E62FFFA0;
  uint64_t v7 = a1[4];
  id v8 = (void *)a1[6];
  v11[4] = a1[5];
  id v12 = v8;
  BOOL v9 = +[HDSourceEntity enumerateBundleIdentifiersForSourcesWithPredicate:v7 database:v6 error:a3 enumerationHandler:v11];

  return v9;
}

BOOL __53__HDSourceManager__clientSourcesWithPredicate_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v4 = [*(id *)(a1 + 32) clientSourceForBundleIdentifier:a2 error:a3];
  if (v4) {
    [*(id *)(a1 + 40) addObject:v4];
  }

  return v4 != 0;
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = 0;
  BOOL v4 = [(HDSourceManager *)self updateCurrentDeviceNameWithError:&v10];
  id v5 = v10;
  if (!v4)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = v6;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      BOOL v9 = [WeakRetained profileIdentifier];
      *(_DWORD *)buf = 138543618;
      id v12 = v9;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Current device source name update failed for profile with identifier %{public}@: %{public}@", buf, 0x16u);
    }
  }
}

- (id)insertSourceWithBundleIdentifier:(id)a3 owningAppBundleIdentifier:(id)a4 UUID:(id)a5 name:(id)a6 options:(unint64_t)a7 isCurrentDevice:(BOOL)a8 productType:(id)a9 modificationDate:(id)a10 provenance:(int64_t)a11 error:(id *)a12
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  id v33 = a10;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__90;
  id v52 = __Block_byref_object_dispose__90;
  id v53 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v22 = [WeakRetained database];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __158__HDSourceManager_insertSourceWithBundleIdentifier_owningAppBundleIdentifier_UUID_name_options_isCurrentDevice_productType_modificationDate_provenance_error___block_invoke;
  v36[3] = &unk_1E62FFFC8;
  id v23 = v16;
  id v37 = v23;
  id v24 = v17;
  id v38 = v24;
  v39 = self;
  uint64_t v44 = &v48;
  id v25 = v18;
  id v40 = v25;
  id v26 = v19;
  id v41 = v26;
  unint64_t v45 = a7;
  BOOL v47 = a8;
  id v27 = v20;
  id v42 = v27;
  id v28 = v33;
  id v43 = v28;
  int64_t v46 = a11;
  BOOL v29 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v22 error:a12 block:v36];

  if (v29) {
    uint64_t v30 = (void *)v49[5];
  }
  else {
    uint64_t v30 = 0;
  }
  id v31 = v30;

  _Block_object_dispose(&v48, 8);

  return v31;
}

BOOL __158__HDSourceManager_insertSourceWithBundleIdentifier_owningAppBundleIdentifier_UUID_name_options_isCurrentDevice_productType_modificationDate_provenance_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[HDLogicalSourceEntity lookUpOrCreateLogicalSourceWithBundleIdentifier:*(void *)(a1 + 32) owningAppBundleIdentifier:*(void *)(a1 + 40) transaction:v5 error:a3];
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
    id v8 = [WeakRetained syncIdentityManager];
    BOOL v9 = [v8 currentSyncIdentity];
    id v10 = [v9 entity];
    uint64_t v11 = [v10 persistentID];

    LOBYTE(v17) = 0;
    uint64_t v12 = +[HDSourceEntity insertSourceWithUUID:logicalSourceID:name:options:isCurrentDevice:productType:deleted:modificationDate:provenance:syncIdentity:transaction:error:](HDSourceEntity, "insertSourceWithUUID:logicalSourceID:name:options:isCurrentDevice:productType:deleted:modificationDate:provenance:syncIdentity:transaction:error:", *(void *)(a1 + 56), [v6 persistentID], *(void *)(a1 + 64), *(void *)(a1 + 96), *(unsigned __int8 *)(a1 + 112), *(void *)(a1 + 72), v17, *(void *)(a1 + 80), *(void *)(a1 + 104), v11, v5, a3);
    uint64_t v13 = *(void *)(*(void *)(a1 + 88) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    BOOL v15 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) != 0;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)createSourcesWithCodables:(id)a3 provenance:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = objc_msgSend(v8, "hk_mapToSet:", &__block_literal_global_364_1);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v11 = [WeakRetained database];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke_2;
  v20[3] = &unk_1E62F2E18;
  void v20[4] = self;
  id v21 = v8;
  int64_t v23 = a4;
  id v22 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke_3;
  v15[3] = &unk_1E6300010;
  id v16 = v22;
  uint64_t v17 = self;
  id v18 = v21;
  int64_t v19 = a4;
  id v12 = v21;
  id v13 = v22;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:a5 block:v20 inaccessibilityHandler:v15];

  return (char)a5;
}

id __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 deleted])
  {
    uint64_t v3 = [v2 decodedUUID];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDSourceManager _createSourcesWithCodables:provenance:sourceUUIDSToDelete:deleteSamples:transaction:error:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 56), *(void **)(a1 + 48), 1u, a2, a3);
}

- (uint64_t)_createSourcesWithCodables:(uint64_t)a3 provenance:(void *)a4 sourceUUIDSToDelete:(unsigned int)a5 deleteSamples:(void *)a6 transaction:(uint64_t)a7 error:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v23 = a4;
  id v12 = a6;
  id v24 = v11;
  if (a1)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          id v25 = v12;
          char v18 = HKWithAutoreleasePool();

          if ((v18 & 1) == 0)
          {

            goto LABEL_12;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    int64_t v19 = v23;
    uint64_t v20 = [a1 _deleteSourcesWithUUIDs:v23 localSourceEntityCacheKey:0 syncIdentity:0 deleteSamples:a5 transaction:v12 error:a7];
  }
  else
  {
LABEL_12:
    uint64_t v20 = 0;
    int64_t v19 = v23;
  }

  return v20;
}

BOOL __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (![*(id *)(a1 + 32) count]) {
    goto LABEL_3;
  }
  id v5 = [[_HDDeleteSourcesWithUUIDsEntry alloc] initWithUUIDs:*(void *)(a1 + 32) bundleIdentifier:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  uint64_t v7 = [WeakRetained database];
  int v8 = [v7 addJournalEntry:v5 error:a3];

  if (!v8) {
    return 0;
  }
LABEL_3:
  id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v10 = [v9 database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke_4;
  v16[3] = &unk_1E62F2E18;
  id v11 = *(void **)(a1 + 48);
  v16[4] = *(void *)(a1 + 40);
  id v12 = v11;
  uint64_t v13 = *(void *)(a1 + 56);
  id v17 = v12;
  uint64_t v19 = v13;
  id v18 = *(id *)(a1 + 32);
  BOOL v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v10 error:a3 block:v16];

  return v14;
}

uint64_t __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDSourceManager _createSourcesWithCodables:provenance:sourceUUIDSToDelete:deleteSamples:transaction:error:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 56), *(void **)(a1 + 48), 0, a2, a3);
}

uint64_t __109__HDSourceManager__createSourcesWithCodables_provenance_sourceUUIDSToDelete_deleteSamples_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [*(id *)(a1 + 32) decodedUUID];
  uint64_t v5 = 1;
  id v6 = HDSourceEntityPredicateForSourceWithUUID(v4, 1);
  uint64_t v7 = [*(id *)(a1 + 40) databaseForEntityClass:objc_opt_class()];
  int v8 = +[HDSourceEntity firstSourceWithPredicate:v6 database:v7 error:a2];
  if (!v8)
  {
    int v8 = [*(id *)(a1 + 48) sourceForCodableSource:*(void *)(a1 + 32) provenance:*(void *)(a1 + 56) createIfNecessary:1 isDeleted:0 error:a2];
    if (!v8)
    {
      _HKInitializeLogging();
      id v9 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = 138543618;
        uint64_t v13 = v4;
        __int16 v14 = 2112;
        uint64_t v15 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "Failed to create source %{public}@ with codable source %@", (uint8_t *)&v12, 0x16u);
      }
      int v8 = 0;
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (BOOL)deleteSourceWithBundleIdentifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDSourceManager.m", 1091, @"Invalid parameter not satisfying: %@", @"bundleIdentifier != nil" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v9 = [WeakRetained database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__HDSourceManager_deleteSourceWithBundleIdentifier_error___block_invoke;
  v16[3] = &unk_1E62F2AE0;
  v16[4] = self;
  id v17 = v7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__HDSourceManager_deleteSourceWithBundleIdentifier_error___block_invoke_2;
  v14[3] = &unk_1E62F6C20;
  v14[4] = self;
  id v15 = v17;
  id v10 = v17;
  BOOL v11 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v9 error:a4 block:v16 inaccessibilityHandler:v14];

  return v11;
}

uint64_t __58__HDSourceManager_deleteSourceWithBundleIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = -[HDSourceManager _sourceUUIDsForBundleIdentifier:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), a3);
  if (v6)
  {
    int v8 = *(id **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained(v8 + 1);
    id v10 = [WeakRetained syncIdentityManager];
    BOOL v11 = [v10 currentSyncIdentity];
    uint64_t v12 = [v8 _deleteSourcesWithUUIDs:v6 localSourceEntityCacheKey:v7 syncIdentity:v11 deleteSamples:1 transaction:v5 error:a3];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)_sourceUUIDsForBundleIdentifier:(uint64_t)a3 error:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = [a1 allSourcesForBundleIdentifier:v5 error:a3];
    uint64_t v7 = v6;
    if (v6)
    {
      if ([v6 count])
      {
        id v20 = v5;
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v9 = v7;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          uint64_t v13 = a1 + 1;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              id WeakRetained = objc_loadWeakRetained(v13);
              id v17 = [v15 sourceUUIDWithProfile:WeakRetained error:a3];

              if (!v17)
              {

                id v18 = 0;
                goto LABEL_14;
              }
              [v8 addObject:v17];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        id v18 = v8;
LABEL_14:

        id v5 = v20;
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"No sources with bundle identifier \"%@\"", v5);
    }
    id v18 = 0;
LABEL_17:

    goto LABEL_18;
  }
  id v18 = 0;
LABEL_18:

  return v18;
}

BOOL __58__HDSourceManager_deleteSourceWithBundleIdentifier_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v6 = [WeakRetained database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__HDSourceManager_deleteSourceWithBundleIdentifier_error___block_invoke_3;
  v10[3] = &unk_1E62F2AE0;
  uint64_t v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v7;
  BOOL v8 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:a3 block:v10];

  return v8;
}

uint64_t __58__HDSourceManager_deleteSourceWithBundleIdentifier_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = -[HDSourceManager _sourceUUIDsForBundleIdentifier:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), a3);
  if (v6)
  {
    uint64_t v7 = [[_HDDeleteSourcesWithUUIDsEntry alloc] initWithUUIDs:v6 bundleIdentifier:*(void *)(a1 + 40)];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v9 = [WeakRetained database];
    int v10 = [v9 addJournalEntry:v7 error:a3];

    if (v10)
    {
      uint64_t v12 = *(id **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      id v13 = objc_loadWeakRetained(v12 + 1);
      __int16 v14 = [v13 syncIdentityManager];
      id v15 = [v14 currentSyncIdentity];
      uint64_t v16 = [v12 _deleteSourcesWithUUIDs:v6 localSourceEntityCacheKey:v11 syncIdentity:v15 deleteSamples:0 transaction:v5 error:a3];
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (BOOL)_deleteSourcesWithUUIDs:(id)a3 localSourceEntityCacheKey:(id)a4 syncIdentity:(id)a5 deleteSamples:(BOOL)a6 transaction:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v41 = a4;
  id v15 = a5;
  id v16 = a7;
  id v43 = v14;
  if ([v14 count])
  {
    v39 = self;
    id v44 = v16;
    id v17 = [v16 databaseForEntityClass:objc_opt_class()];
    id v40 = HDSourceEntityPredicateForSourcesWithUUIDs(v43);
    id v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = +[HDSourceEntity sourcesWithPredicate:v40 includeDeleted:1 database:v17 error:a8];
    id v20 = [v18 setWithArray:v19];

    long long v21 = v20;
    if (v20)
    {
      if ([v20 count])
      {
        if (!v10) {
          goto LABEL_9;
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v60 = __Block_byref_object_copy__90;
        v61 = __Block_byref_object_dispose__90;
        id v62 = 0;
        uint64_t v49 = MEMORY[0x1E4F143A8];
        uint64_t v50 = 3221225472;
        v51 = __114__HDSourceManager__deleteSourcesWithUUIDs_localSourceEntityCacheKey_syncIdentity_deleteSamples_transaction_error___block_invoke;
        id v52 = &unk_1E6300038;
        id v53 = v39;
        id v54 = v40;
        id v55 = v17;
        id v20 = v20;
        id v56 = v20;
        uint64_t v57 = buf;
        int v22 = HKWithAutoreleasePool();
        if ((v22 & 1) != 0 && [*(id *)(*(void *)&buf[8] + 40) count])
        {
          uint64_t v23 = [v20 setByAddingObjectsFromArray:*(void *)(*(void *)&buf[8] + 40)];

          id v20 = (id)v23;
        }

        _Block_object_dispose(buf, 8);
        if (!v22)
        {
          long long v21 = v20;
        }
        else
        {
LABEL_9:
          long long v24 = +[HDLogicalSourceEntity lookUpOrCreateLogicalSourceWithBundleIdentifier:&stru_1F1728D60 owningAppBundleIdentifier:0 transaction:v44 error:a8];
          _HKInitializeLogging();
          id v25 = (void *)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = v25;
            uint64_t v27 = [v20 count];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v43;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v27;
            _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "Deleting sources with UUIDs %{public}@ (%lu entities)", buf, 0x16u);
          }
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id obj = v20;
          uint64_t v28 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
          if (v28)
          {
            uint64_t v29 = *(void *)v46;
            while (2)
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v46 != v29) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v31 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                if (v15)
                {
                  id v32 = [v15 entity];
                  uint64_t v33 = [v32 persistentID];
                }
                else
                {
                  id v32 = [*(id *)(*((void *)&v45 + 1) + 8 * i) valueForProperty:@"sync_identity" database:v17];
                  uint64_t v33 = [v32 integerValue];
                }
                uint64_t v34 = v33;

                if (!objc_msgSend(v31, "deleteSourceWithTombstoneLogicalSourceID:syncIdentity:database:transaction:error:", objc_msgSend(v24, "persistentID"), v34, v17, v44, a8))
                {
                  LOBYTE(v22) = 0;
                  id WeakRetained = obj;
                  goto LABEL_33;
                }
              }
              uint64_t v28 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
              if (v28) {
                continue;
              }
              break;
            }
          }

          if (+[HDLogicalSourceEntity deleteLogicalSourceEntitiesIfNecessaryWithTransaction:v44 error:a8])
          {
            sourceEntityByBundleIdentifierCache = v39->_sourceEntityByBundleIdentifierCache;
            if (v41) {
              [(HDDatabaseValueCache *)sourceEntityByBundleIdentifierCache removeObjectForKey:v41 transaction:v44];
            }
            else {
              [(HDDatabaseValueCache *)sourceEntityByBundleIdentifierCache removeAllObjectsWithTransaction:v44];
            }
            [(HDDatabaseValueCache *)v39->_clientSourceCache removeAllObjectsWithTransaction:v44];
            [(HDDatabaseValueCache *)v39->_localSourceForBundleIdentifierCache removeAllObjectsWithTransaction:v44];
            id WeakRetained = objc_loadWeakRetained((id *)&v39->_profile);
            id v37 = [WeakRetained sourceOrderManager];
            [v37 resetCacheWithTransaction:v44];

            LOBYTE(v22) = 1;
LABEL_33:
          }
          else
          {
            LOBYTE(v22) = 0;
          }

          long long v21 = obj;
        }
        goto LABEL_35;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a8, 3, @"No sources with UUIDs %@", v43);
    }
    LOBYTE(v22) = 0;
LABEL_35:

    id v16 = v44;
    goto LABEL_36;
  }
  LOBYTE(v22) = 1;
LABEL_36:

  return v22;
}

uint64_t __114__HDSourceManager__deleteSourcesWithUUIDs_localSourceEntityCacheKey_syncIdentity_deleteSamples_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)(a1 + 32);
  BOOL v4 = *(void **)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  id v6 = v5;
  if (!v3)
  {

    goto LABEL_13;
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F65D00];
  id v8 = v4;
  uint64_t v30 = [v7 predicateWithProperty:@"deleted" notEqualToValue:MEMORY[0x1E4F1CC38]];
  id v9 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v6 otherPredicate:v30];

  BOOL v10 = NSString;
  uint64_t v11 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v12 = [v9 SQLForEntityClass:objc_opt_class()];
  id v13 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v14 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"logical_source_id"];
  id v15 = [v10 stringWithFormat:@"SELECT DISTINCT %@ FROM %@ WHERE %@ AND NOT EXISTS (SELECT 1 FROM %@ s WHERE s.%@=%@ AND NOT s.%@ AND s.%@=?)", @"logical_source_id", v11, v12, v13, @"logical_source_id", v14, @"deleted", @"provenance"];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __93__HDSourceManager__logicalSourceIDsWithoutLocalSourceForSourcesWithPredicate_database_error___block_invoke;
  v34[3] = &unk_1E62F43C8;
  id v17 = v9;
  id v35 = v17;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __93__HDSourceManager__logicalSourceIDsWithoutLocalSourceForSourcesWithPredicate_database_error___block_invoke_2;
  v32[3] = &unk_1E62F3D38;
  id v33 = v16;
  id v3 = v16;
  LODWORD(v16) = [v8 executeUncachedSQL:v15 error:a2 bindingHandler:v34 enumerationHandler:v32];

  if (v16) {
    id v18 = v3;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  if (!v19)
  {
    id v3 = 0;
LABEL_13:
    uint64_t v28 = 0;
    goto LABEL_14;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  long long v21 = [WeakRetained dataManager];
  int v22 = [v21 deleteSamplesWithSourceEntities:*(void *)(a1 + 56) error:a2];

  if (!v22) {
    goto LABEL_13;
  }
  if ([v19 count])
  {
    if (*(void *)(a1 + 32))
    {
      id v23 = *(id *)(a1 + 48);
      long long v24 = HDSourceEntityPredicateForLocalSourcesWithLogicalSourceIDs((uint64_t)v19);
      uint64_t v25 = +[HDSourceEntity sourcesWithPredicate:v24 includeDeleted:0 database:v23 error:a2];
    }
    else
    {
      uint64_t v25 = 0;
    }
    uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
      goto LABEL_13;
    }
  }
  uint64_t v28 = 1;
LABEL_14:

  return v28;
}

uint64_t __93__HDSourceManager__logicalSourceIDsWithoutLocalSourceForSourcesWithPredicate_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  int v5 = 1;
  [*(id *)(a1 + 32) bindToStatement:a2 bindingIndex:&v5];
  int v3 = v5++;
  return sqlite3_bind_int64(a2, v3, 0);
}

uint64_t __93__HDSourceManager__logicalSourceIDsWithoutLocalSourceForSourcesWithPredicate_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v3 = MEMORY[0x1C1879F70](a2, 0);
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

void __59__HDSourceManager__fetchClientSourceForPersistentID_error___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 8));
  id v9 = 0;
  LOBYTE(v3) = [v2 setName:v3 profile:WeakRetained error:&v9];
  id v5 = v9;

  if ((v3 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[5];
      uint64_t v8 = a1[7];
      *(_DWORD *)buf = 138412802;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to set name \"%@\" for source %@: %{public}@", buf, 0x20u);
    }
  }
}

- (id)_createSourceEntityForLocalDeviceWithError:(id *)a3
{
  id v5 = [MEMORY[0x1E4F2B560] _generateIdentifierForAppleDevice];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v7 = [WeakRetained daemon];
  uint64_t v8 = [v7 behavior];
  id v9 = [v8 currentDeviceProductType];

  BOOL v10 = objc_msgSend(MEMORY[0x1E4F2B560], "hd_currentDeviceSourceName");
  uint64_t v11 = HKSourceOptionsForAppleDevice();
  __int16 v12 = -[HDSourceManager _createSourceEntityForBundleIdentifier:owningAppBundleIdentifier:name:options:isCurrentDevice:productType:error:](self, v5, 0, v10, v11, 1, v9, (uint64_t)a3);

  return v12;
}

- (void)_applicationsUninstalledNotification:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"HDHealthDaemonApplicationsUninstalledBundleIdentifiersKey"];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    uint64_t v7 = HDSourceEntityPredicateForSourcesWithBundleIdentifiers((uint64_t)v6);
    uint64_t v8 = HDSourceEntityPredicateForSourcesWithOwnerBundleIdentifiers((uint64_t)v6);
    id v9 = [MEMORY[0x1E4F65D58] disjunctionWithPredicate:v7 otherPredicate:v8];
    id v46 = 0;
    BOOL v10 = -[HDSourceManager _clientSourcesWithPredicate:error:]((uint64_t)self, v9, (uint64_t)&v46);
    id v11 = v46;
    if (v10)
    {
      if (![v10 count]) {
        goto LABEL_33;
      }
      id v33 = v11;
      uint64_t v34 = v9;
      id v35 = v8;
      id v36 = v7;
      id v37 = v6;
      id v38 = v5;
      id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v32 = v10;
      id obj = v10;
      uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (!v12) {
        goto LABEL_25;
      }
      uint64_t v13 = v12;
      uint64_t v41 = *(void *)v43;
      p_profile = &self->_profile;
      while (1)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v43 != v41) {
            objc_enumerationMutation(obj);
          }
          if (self)
          {
            uint64_t v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            id v17 = [v16 bundleIdentifier];
            id WeakRetained = objc_loadWeakRetained((id *)p_profile);
            [WeakRetained dataManager];
            id v20 = v19 = self;
            id v48 = 0;
            uint64_t v21 = [v20 hasSampleWithBundleIdentifier:v17 error:&v48];
            id v22 = v48;

            self = v19;
            if (v21 == 1) {
              goto LABEL_14;
            }
            if (!v21)
            {
              _HKInitializeLogging();
              id v23 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                id v51 = v17;
                __int16 v52 = 2114;
                id v53 = v22;
                _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "Error while checking if application %{public}@ has samples: %{public}@", buf, 0x16u);
              }
LABEL_14:

              continue;
            }
            id v47 = 0;
            BOOL v24 = [(HDSourceManager *)v19 deleteSourceWithBundleIdentifier:v17 error:&v47];
            id v25 = v47;
            _HKInitializeLogging();
            uint64_t v26 = *MEMORY[0x1E4F29F18];
            uint64_t v27 = *MEMORY[0x1E4F29F18];
            if (v24)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v51 = v17;
                _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "Successfully deleted source without data for uninstalled application %{public}@", buf, 0xCu);
              }

              uint64_t v28 = [v16 bundleIdentifier];
              [v39 addObject:v28];
            }
            else
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                id v51 = v17;
                __int16 v52 = 2114;
                id v53 = v25;
                _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "Failed to delete source without data for uninstalled application %{public}@: %{public}@", buf, 0x16u);
              }
            }
            self = v19;
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
        if (!v13)
        {
LABEL_25:

          _HKInitializeLogging();
          uint64_t v29 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v51 = v39;
            _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "Application(s) uninstalled, deleted sources without data: %{public}@", buf, 0xCu);
          }

          id v6 = v37;
          id v5 = v38;
          uint64_t v8 = v35;
          uint64_t v7 = v36;
          id v11 = v33;
          id v9 = v34;
          BOOL v10 = v32;
          goto LABEL_33;
        }
      }
    }
    if ((HKIsUnitTesting() & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v31 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v51 = v11;
        _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "Failed to look up sources to delete for uninstalled applications: %{public}@", buf, 0xCu);
      }
    }
LABEL_33:
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v30 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_DEFAULT, "Application uninstallation notification missing bundle identifiers", buf, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSourceForSourceID, 0);
  objc_storeStrong((id *)&self->_localSourceForBundleIdentifierCache, 0);
  objc_storeStrong((id *)&self->_clientSourceCache, 0);
  objc_storeStrong((id *)&self->_sourceEntityByBundleIdentifierCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end