@interface HDSourceOrderManager
- (BOOL)_updateOrderedSourceIDsForWrappedSource:(void *)a3 transactionCache:(void *)a4 transaction:(uint64_t)a5 error:;
- (BOOL)_updateSourceOrder:(uint64_t)a1 type:(void *)a2 syncIdentity:(void *)a3 transactionCache:(uint64_t)a4 transaction:(void *)a5 error:(uint64_t)a6;
- (BOOL)addOrderedSource:(id)a3 objectTypes:(id)a4 error:(id *)a5;
- (BOOL)createSourceOrdersWithCodables:(id)a3 error:(id *)a4;
- (BOOL)resetCacheWithError:(id *)a3;
- (BOOL)updateOrderedSources:(id)a3 forObjectType:(id)a4 error:(id *)a5;
- (HDSourceOrderManager)initWithProfile:(id)a3;
- (char)_sourceOrderForCodableSourceOrder:(void *)a3 transactionCache:(void *)a4 transaction:(uint64_t)a5 error:;
- (id)_sourceCacheItemForObjectType:(void *)a3 transactionCache:(void *)a4 transaction:(uint64_t)a5 error:;
- (id)orderedSourceIDsForObjectType:(id)a3 error:(id *)a4;
- (id)orderedSourceIDsWithUnorderedIDs:(id)a3 objectType:(id)a4 error:(id *)a5;
- (id)orderedSourcesForObjectType:(id)a3 error:(id *)a4;
- (uint64_t)_mergedSourceOrderForExistingOrder:incomingOrder:existingSyncIdentity:incomingSyncIdentity:;
- (void)_mergedSourceOrderForExistingOrder:(void *)a3 incomingOrder:(void *)a4 existingSyncIdentity:(void *)a5 incomingSyncIdentity:(void *)a6;
- (void)resetCacheWithTransaction:(id)a3;
@end

@implementation HDSourceOrderManager

BOOL __60__HDSourceOrderManager__sourceCacheItemForObjectType_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [_HDSourceOrderTransactionCache alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v8 = -[_HDSourceOrderTransactionCache initWithProfile:]((id *)&v6->super.isa, WeakRetained);

  uint64_t v9 = -[HDSourceOrderManager _sourceCacheItemForObjectType:transactionCache:transaction:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), v8, v5, a3);
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  BOOL v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v12;
}

- (HDSourceOrderManager)initWithProfile:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HDSourceOrderManager.mm", 101, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)HDSourceOrderManager;
  v6 = [(HDSourceOrderManager *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_profile, v5);
    v8 = [HDDatabaseValueCache alloc];
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = [(HDDatabaseValueCache *)v8 initWithName:v10];
    sourceOrdersForTypeCache = v7->_sourceOrdersForTypeCache;
    v7->_sourceOrdersForTypeCache = (HDDatabaseValueCache *)v11;
  }
  return v7;
}

- (BOOL)resetCacheWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = [WeakRetained database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__HDSourceOrderManager_resetCacheWithError___block_invoke;
  v8[3] = &unk_1E62FC978;
  v8[4] = self;
  LOBYTE(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:a3 block:v8];

  return (char)a3;
}

uint64_t __44__HDSourceOrderManager_resetCacheWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void)resetCacheWithTransaction:(id)a3
{
}

- (BOOL)createSourceOrdersWithCodables:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v8 = [WeakRetained database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HDSourceOrderManager_createSourceOrdersWithCodables_error___block_invoke;
  v11[3] = &unk_1E62FCBE0;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v8 error:a4 block:v11];

  return (char)a4;
}

uint64_t __61__HDSourceOrderManager_createSourceOrdersWithCodables_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  v3 = [_HDSourceOrderTransactionCache alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = -[_HDSourceOrderTransactionCache initWithProfile:]((id *)&v3->super.isa, WeakRetained);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        v14 = v5;
        id v15 = v13;
        int v9 = HKWithAutoreleasePool();

        if (!v9)
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

BOOL __61__HDSourceOrderManager_createSourceOrdersWithCodables_error___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
  v8 = *(void **)(a1 + 56);
  id v9 = v4;
  id v45 = v6;
  id v10 = WeakRetained;
  id v46 = v8;
  if (!v5) {
    goto LABEL_19;
  }
  if (([v9 hasSyncIdentity] & 1) == 0)
  {
    uint64_t v11 = [v10 syncIdentityManager];
    id v12 = [v11 legacySyncIdentity];
    id v13 = [v12 identity];
    v14 = [v13 codableSyncIdentity];
    [v9 setSyncIdentity:v14];
  }
  id v15 = v9;
  if (![v15 hasObjectType]
    || ![v15 hasUserOrdered]
    || ![v15 hasSourceUUIDs]
    || ([v15 hasSyncIdentity] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a2, 3, @"Invalid codable source order %@", v15);

LABEL_19:
    uint64_t v23 = 0;
LABEL_20:

    goto LABEL_21;
  }

  [v15 decodedDataTypeCode];
  if ((_HKValidDataTypeCode() & 1) == 0)
  {
    _HKInitializeLogging();
    v33 = (id)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v15 objectType];
      _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "Ignoring source order for invalid data type code %lld", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v23 = 2;
    goto LABEL_20;
  }
  long long v16 = objc_msgSend(MEMORY[0x1E4F2B2C0], "dataTypeWithCode:", objc_msgSend(v15, "decodedDataTypeCode"));
  if (!v16)
  {
    _HKInitializeLogging();
    v34 = (id)*MEMORY[0x1E4F29F18];
    v44 = v34;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v15 objectType];
      _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "Ignoring source order for unknown data type code %lld", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v23 = 2;
    goto LABEL_39;
  }
  uint64_t v17 = -[HDSourceOrderManager _sourceCacheItemForObjectType:transactionCache:transaction:error:](v5, v16, v45, v46, (uint64_t)a2);
  if (v17)
  {
    v44 = (void *)v17;
    uint64_t v18 = +[HDLogicalSourceOrderEntity syncIdentityForType:v16 profile:v10 transaction:v46 error:a2];
    if (!v18)
    {
      v41 = v16;
      id v19 = objc_loadWeakRetained((id *)(v5 + 8));
      v20 = [v19 syncIdentityManager];
      uint64_t v21 = [v20 currentSyncIdentity];

      long long v16 = v41;
      uint64_t v18 = v21;
    }
    v43 = (void *)v18;
    uint64_t v22 = -[HDSourceOrderManager _sourceOrderForCodableSourceOrder:transactionCache:transaction:error:](v5, v15, v45, v46, (uint64_t)a2);
    uint64_t v23 = 0;
    v42 = (void *)v22;
    if (v22 && (void *)v22 != v44)
    {
      v24 = [v15 syncIdentity];
      uint64_t v25 = +[HDSyncIdentity syncIdentityWithCodable:v24 error:a2];

      v40 = (void *)v25;
      if (v25)
      {
        id v26 = objc_loadWeakRetained((id *)(v5 + 8));
        v27 = [v26 syncIdentityManager];
        v28 = [v27 concreteIdentityForIdentity:v25 shouldCreate:1 transaction:v46 error:a2];

        if (v28)
        {
          [(HDSourceOrderManager *)(uint64_t)&buf _mergedSourceOrderForExistingOrder:v44 incomingOrder:v42 existingSyncIdentity:v43 incomingSyncIdentity:v28];
          id v39 = (id)buf;
          id v29 = *((id *)&buf + 1);
          v30 = [v29 entity];
          BOOL v31 = -[HDSourceOrderManager _updateSourceOrder:type:syncIdentity:transactionCache:transaction:error:](v5, v39, v16, [v30 persistentID], v46, (uint64_t)a2);

          uint64_t v23 = v31;
        }
        else
        {
          v28 = 0;
          _HKInitializeLogging();
          v36 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
          {
            uint64_t v38 = *a2;
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v38;
            _os_log_fault_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", (uint8_t *)&buf, 0xCu);
          }
          uint64_t v23 = 0;
        }
      }
      else
      {
        _HKInitializeLogging();
        v35 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
        {
          uint64_t v37 = *a2;
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v37;
          _os_log_fault_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", (uint8_t *)&buf, 0xCu);
        }
        uint64_t v23 = 0;
      }
    }
LABEL_39:

    goto LABEL_40;
  }
  uint64_t v23 = 0;

LABEL_40:
  if ((v23 | 2) == 2) {
    return v23 != 0;
  }
  objc_msgSend(MEMORY[0x1E4F2B2C0], "dataTypeWithCode:", objc_msgSend(*(id *)(a1 + 40), "decodedDataTypeCode"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10) {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v10 transaction:*(void *)(a1 + 56)];
  }
LABEL_21:

  return v23 != 0;
}

- (id)orderedSourcesForObjectType:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__69;
    uint64_t v21 = __Block_byref_object_dispose__69;
    id v22 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v8 = [WeakRetained database];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__HDSourceOrderManager__sourceCacheItemForObjectType_error___block_invoke;
    v14[3] = &unk_1E62FCCF8;
    v14[4] = self;
    long long v16 = &v17;
    id v15 = v6;
    BOOL v9 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:a4 block:v14];

    if (v9) {
      id v10 = (void *)v18[5];
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v11 = 0;
  }

  id v12 = -[_HDCachedSourceOrder sources]((uint64_t)v11);

  return v12;
}

- (id)orderedSourceIDsForObjectType:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__69;
  uint64_t v19 = __Block_byref_object_dispose__69;
  id v20 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v8 = [WeakRetained database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__HDSourceOrderManager_orderedSourceIDsForObjectType_error___block_invoke;
  v12[3] = &unk_1E62FCC08;
  v14 = &v15;
  id v9 = v6;
  id v13 = v9;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:a4 block:v12];

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

BOOL __60__HDSourceOrderManager_orderedSourceIDsForObjectType_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = +[HDLogicalSourceOrderEntity sourceIDsWithDataType:*(void *)(a1 + 32) transaction:v5 error:a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  BOOL v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
  return v9;
}

- (id)orderedSourceIDsWithUnorderedIDs:(id)a3 objectType:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__69;
  v24 = __Block_byref_object_dispose__69;
  id v25 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__HDSourceOrderManager_orderedSourceIDsWithUnorderedIDs_objectType_error___block_invoke;
  v16[3] = &unk_1E62FCC30;
  uint64_t v19 = &v20;
  id v12 = v9;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:v11 error:a5 block:v16];

  id v14 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v14;
}

BOOL __74__HDSourceOrderManager_orderedSourceIDsWithUnorderedIDs_objectType_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = +[HDLogicalSourceOrderEntity sourceIDsWithDataType:a1[4] unorderedIDs:a1[5] transaction:v5 error:a3];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  BOOL v9 = *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
  return v9;
}

- (BOOL)updateOrderedSources:(id)a3 forObjectType:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__HDSourceOrderManager_updateOrderedSources_forObjectType_error___block_invoke;
  v15[3] = &unk_1E62FC928;
  v15[4] = self;
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:a5 block:v15];

  return (char)a5;
}

BOOL __65__HDSourceOrderManager_updateOrderedSources_forObjectType_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  id v5 = [_HDSourceOrderTransactionCache alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v20 = -[_HDSourceOrderTransactionCache initWithProfile:]((id *)&v5->super.isa, WeakRetained);

  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x4812000000;
  v33 = __Block_byref_object_copy__292;
  v34 = __Block_byref_object_dispose__293;
  v35 = &unk_1BD44B655;
  memset(v36, 0, sizeof(v36));
  std::vector<_HDWrappedSource>::reserve(v36, [*(id *)(a1 + 40) count]);
  uint64_t v7 = [v18 databaseForEntityClass:objc_opt_class()];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (char *)*(id *)(a1 + 40);
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v21[3] = MEMORY[0x1E4F143A8];
        v21[4] = 3221225472;
        v21[5] = (uint64_t)__65__HDSourceOrderManager_updateOrderedSources_forObjectType_error___block_invoke_294;
        v21[6] = (uint64_t)&unk_1E62FCC58;
        uint64_t v22 = v20;
        uint64_t v23 = v11;
        id v24 = v7;
        id v25 = &v30;
        LODWORD(v11) = HKWithAutoreleasePool();

        if (!v11)
        {
          BOOL v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v12 = [_HDCachedSourceOrder alloc];
  memset(v21, 0, 24);
  std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)v21, v31[6], v31[7], 0xAAAAAAAAAAAAAAABLL * ((v31[7] - v31[6]) >> 3));
  id obj = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v12, v21, 1, 0);
  uint64_t v37 = (void **)v21;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100](&v37);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(a1 + 48);
  id v15 = objc_loadWeakRetained((id *)(v13 + 8));
  BOOL v16 = -[HDSourceOrderManager _updateSourceOrder:type:syncIdentity:transactionCache:transaction:error:](v13, obj, v14, [v15 currentSyncIdentityPersistentID], v18, a3);

LABEL_11:
  _Block_object_dispose(&v30, 8);
  uint64_t v37 = (void **)v36;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100](&v37);

  return v16;
}

BOOL __65__HDSourceOrderManager_updateOrderedSources_forObjectType_error___block_invoke_294(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v6 = -[_HDSourceOrderTransactionCache orderedSourceIDsForBundleIdentifier:database:error:](v4, v5, *(void **)(a1 + 48), a2);

  if (v6)
  {
    id v7 = *(id *)(a1 + 40);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(int64x2_t **)(*(void *)(a1 + 56) + 8);
    unint64_t v10 = v9[3].u64[1];
    unint64_t v11 = v9[4].u64[0];
    if (v10 >= v11)
    {
      uint64_t v13 = v9[3].i64[0];
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - v13) >> 3);
      if (v14 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v13) >> 3);
      uint64_t v16 = 2 * v15;
      if (2 * v15 <= v14 + 1) {
        uint64_t v16 = v14 + 1;
      }
      if (v15 >= 0x555555555555555) {
        unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v17 = v16;
      }
      v33 = v9 + 4;
      if (v17)
      {
        id v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v17);
        uint64_t v20 = v19;
      }
      else
      {
        id v18 = 0;
        uint64_t v20 = 0;
      }
      uint64_t v21 = (CFAbsoluteTime *)&v18[24 * v14];
      *(void *)uint64_t v21 = v7;
      v21[1] = Current;
      *((unsigned char *)v21 + 16) = 1;
      uint64_t v23 = v9[3].i64[0];
      unint64_t v22 = v9[3].u64[1];
      if (v22 == v23)
      {
        int64x2_t v27 = vdupq_n_s64(v22);
        id v24 = v21;
      }
      else
      {
        id v24 = v21;
        do
        {
          uint64_t v25 = *(void *)(v22 - 24);
          v22 -= 24;
          *(void *)unint64_t v22 = 0;
          *((void *)v24 - 3) = v25;
          v24 -= 3;
          uint64_t v26 = *(void *)(v22 + 8);
          *((unsigned char *)v24 + 16) = *(unsigned char *)(v22 + 16);
          *((void *)v24 + 1) = v26;
        }
        while (v22 != v23);
        int64x2_t v27 = v9[3];
      }
      id v12 = (char *)(v21 + 3);
      v9[3].i64[0] = (uint64_t)v24;
      v9[3].i64[1] = (uint64_t)v12;
      int64x2_t v31 = v27;
      uint64_t v28 = v9[4].i64[0];
      v9[4].i64[0] = (uint64_t)&v18[24 * v20];
      uint64_t v32 = v28;
      uint64_t v30 = v27.i64[0];
      std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v30);
    }
    else
    {
      *(void *)unint64_t v10 = v7;
      *(CFAbsoluteTime *)(v10 + 8) = Current;
      *(unsigned char *)(v10 + 16) = 1;
      id v12 = (char *)(v10 + 24);
    }
    v9[3].i64[1] = (uint64_t)v12;
  }
  return v6 != 0;
}

- (BOOL)_updateSourceOrder:(uint64_t)a1 type:(void *)a2 syncIdentity:(void *)a3 transactionCache:(uint64_t)a4 transaction:(void *)a5 error:(uint64_t)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  if (a1)
  {
    unint64_t v14 = [*(id *)(a1 + 16) objectForKey:v12];
    if ([v14 isEqual:v11])
    {
      BOOL v15 = 1;
    }
    else
    {
      [*(id *)(a1 + 16) setObject:v11 forKey:v12 transaction:v13];
      _HKInitializeLogging();
      uint64_t v16 = (os_log_t *)MEMORY[0x1E4F29F18];
      unint64_t v17 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
      {
        id v18 = v17;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v21 = -[_HDCachedSourceOrder sources]((uint64_t)v11);
          unint64_t v22 = [v21 componentsJoinedByString:@", "];
          *(_DWORD *)long long buf = 138412546;
          id v28 = v12;
          __int16 v29 = 2112;
          uint64_t v30 = v22;
          _os_log_debug_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEBUG, "Updating source order for type %@ sources (%@)", buf, 0x16u);
        }
      }
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __96__HDSourceOrderManager__updateSourceOrder_type_syncIdentity_transactionCache_transaction_error___block_invoke;
      v23[3] = &unk_1E62FCCD0;
      id v24 = v11;
      id v25 = v13;
      uint64_t v26 = a4;
      BOOL v15 = +[HDLogicalSourceOrderEntity updateOrderedLogicalSourcesForType:v12 transaction:v25 error:a6 updateHandler:v23];
      if (!v15)
      {
        _HKInitializeLogging();
        uint64_t v19 = *v16;
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          id v28 = v12;
          __int16 v29 = 2114;
          uint64_t v30 = 0;
          _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "Failed to update source order for type %@: %{public}@.", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (char)_sourceOrderForCodableSourceOrder:(void *)a3 transactionCache:(void *)a4 transaction:(uint64_t)a5 error:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v27 = a3;
  id v28 = a4;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v10 = [v9 sourceUUIDs];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __93__HDSourceOrderManager__sourceOrderForCodableSourceOrder_transactionCache_transaction_error___block_invoke;
  v48[3] = &unk_1E62FCC80;
  id v22 = v9;
  id v49 = v22;
  id v26 = v20;
  id v50 = v26;
  id v23 = v21;
  id v51 = v23;
  BOOL v11 = +[HDSourceEntity enumerateBundleIdentifiersForSourcesForUUIDData:v10 transaction:v28 error:a5 enumerationHandler:v48];

  if (v11)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x4812000000;
    v44 = __Block_byref_object_copy__292;
    id v45 = __Block_byref_object_dispose__293;
    id v46 = &unk_1BD44B655;
    memset(v47, 0, sizeof(v47));
    std::vector<_HDWrappedSource>::reserve(v47, [v23 count]);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v25 = [WeakRetained sourceManager];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v23;
    uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          v29[3] = MEMORY[0x1E4F143A8];
          v29[4] = 3221225472;
          v29[5] = (uint64_t)__93__HDSourceOrderManager__sourceOrderForCodableSourceOrder_transactionCache_transaction_error___block_invoke_2;
          v29[6] = (uint64_t)&unk_1E62FCCA8;
          id v30 = v25;
          uint64_t v31 = v16;
          id v32 = v26;
          uint64_t v33 = a1;
          id v34 = v27;
          id v35 = v28;
          v36 = &v41;
          LODWORD(v16) = HKWithAutoreleasePool();

          if (!v16)
          {

            id v18 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v53 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    unint64_t v17 = [_HDCachedSourceOrder alloc];
    memset(v29, 0, 24);
    std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)v29, v42[6], v42[7], 0xAAAAAAAAAAAAAAABLL * ((v42[7] - v42[6]) >> 3));
    id v18 = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v17, v29, [v22 userOrdered], 0);
    v52 = (void **)v29;
    std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100](&v52);
LABEL_13:

    _Block_object_dispose(&v41, 8);
    v52 = (void **)v47;
    std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100](&v52);
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

void __93__HDSourceOrderManager__sourceOrderForCodableSourceOrder_transactionCache_transaction_error___block_invoke(id *a1, unint64_t a2, void *a3)
{
  id v12 = a3;
  double v5 = 0.0;
  if ([a1[4] modificationDatesCount] > a2) {
    double v5 = *(double *)([a1[4] modificationDates] + 8 * a2);
  }
  uint64_t v6 = [a1[5] objectForKeyedSubscript:v12];
  id v7 = v6;
  uint64_t v8 = NSNumber;
  if (v6)
  {
    [v6 doubleValue];
    if (v9 < v5) {
      double v9 = v5;
    }
    unint64_t v10 = [v8 numberWithDouble:v9];
    [a1[5] setObject:v10 forKeyedSubscript:v12];
  }
  else
  {
    BOOL v11 = [NSNumber numberWithDouble:v5];
    [a1[5] setObject:v11 forKeyedSubscript:v12];

    [a1[6] addObject:v12];
  }
}

BOOL __93__HDSourceOrderManager__sourceOrderForCodableSourceOrder_transactionCache_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) clientSourceForBundleIdentifier:*(void *)(a1 + 40) error:a2];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v34 = v6;
    id v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
    [v7 doubleValue];
    uint64_t v35 = v8;

    char v36 = 1;
    BOOL v9 = -[HDSourceOrderManager _updateOrderedSourceIDsForWrappedSource:transactionCache:transaction:error:](*(void *)(a1 + 56), &v34, *(void **)(a1 + 64), *(void **)(a1 + 72), a2);
    if (v9)
    {
      unint64_t v10 = *(int64x2_t **)(*(void *)(a1 + 80) + 8);
      unint64_t v11 = v10[3].u64[1];
      unint64_t v12 = v10[4].u64[0];
      if (v11 >= v12)
      {
        uint64_t v15 = v10[3].i64[0];
        unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v15) >> 3);
        if (v16 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - v15) >> 3);
        uint64_t v18 = 2 * v17;
        if (2 * v17 <= v16 + 1) {
          uint64_t v18 = v16 + 1;
        }
        if (v17 >= 0x555555555555555) {
          unint64_t v19 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v19 = v18;
        }
        long long v40 = v10 + 4;
        if (v19)
        {
          id v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v19);
          uint64_t v22 = v21;
        }
        else
        {
          id v20 = 0;
          uint64_t v22 = 0;
        }
        id v23 = &v20[24 * v16];
        id v24 = v6;
        v23[16] = v36;
        uint64_t v25 = v35;
        *(void *)id v23 = v24;
        *((void *)v23 + 1) = v25;
        uint64_t v27 = v10[3].i64[0];
        unint64_t v26 = v10[3].u64[1];
        if (v26 == v27)
        {
          id v6 = v24;
          int64x2_t v31 = vdupq_n_s64(v26);
          id v28 = v23;
        }
        else
        {
          id v28 = v23;
          do
          {
            uint64_t v29 = *(void *)(v26 - 24);
            v26 -= 24;
            *(void *)unint64_t v26 = 0;
            *((void *)v28 - 3) = v29;
            v28 -= 24;
            uint64_t v30 = *(void *)(v26 + 8);
            v28[16] = *(unsigned char *)(v26 + 16);
            *((void *)v28 + 1) = v30;
          }
          while (v26 != v27);
          int64x2_t v31 = v10[3];
          id v6 = v34;
        }
        uint64_t v14 = v23 + 24;
        v10[3].i64[0] = (uint64_t)v28;
        v10[3].i64[1] = (uint64_t)(v23 + 24);
        int64x2_t v38 = v31;
        uint64_t v32 = v10[4].i64[0];
        v10[4].i64[0] = (uint64_t)&v20[24 * v22];
        uint64_t v39 = v32;
        uint64_t v37 = v31.i64[0];
        std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v37);
      }
      else
      {
        id v6 = v6;
        uint64_t v13 = v35;
        *(void *)unint64_t v11 = v6;
        *(void *)(v11 + 8) = v13;
        *(unsigned char *)(v11 + 16) = v36;
        uint64_t v14 = (char *)(v11 + 24);
      }
      v10[3].i64[1] = (uint64_t)v14;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_updateOrderedSourceIDsForWrappedSource:(void *)a3 transactionCache:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    unint64_t v11 = [*a2 bundleIdentifier];
    unint64_t v12 = [v10 databaseForEntityClass:objc_opt_class()];
    uint64_t v13 = -[_HDSourceOrderTransactionCache orderedSourceIDsForBundleIdentifier:database:error:]((uint64_t)v9, v11, v12, a5);

    BOOL v14 = v13 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_mergedSourceOrderForExistingOrder:(void *)a3 incomingOrder:(void *)a4 existingSyncIdentity:(void *)a5 incomingSyncIdentity:(void *)a6
{
  id v10 = a3;
  unint64_t v11 = a4;
  id v148 = a5;
  id v147 = a6;
  unint64_t v12 = (id *)(a2 + 8);
  id WeakRetained = objc_loadWeakRetained((id *)(a2 + 8));
  BOOL v14 = [WeakRetained syncIdentityManager];
  uint64_t v15 = [v14 currentSyncIdentity];
  id location = v15;

  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  if (v10[9])
  {
    *(void *)a1 = v11;
    *(void *)(a1 + 8) = v147;
    goto LABEL_120;
  }
  v123 = v11;
  v124 = v10;
  if ((v10[8] != 0) == (v11[8] != 0))
  {
    id v26 = objc_loadWeakRetained(v12);
    uint64_t v27 = [v26 syncIdentityManager];
    uint64_t v144 = [v27 currentSyncIdentity];

    v142 = 0;
    id v143 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v141 = 0uLL;
    [(_HDCachedSourceOrder *)(char *)v140 orderedSources];
    [(_HDCachedSourceOrder *)(char *)&v138 orderedSources];
    id v28 = (id *)v140[0];
    uint64_t v29 = v138;
    v136 = v138;
    for (uint64_t i = (id *)v140[0]; ; v28 = i)
    {
      if (v28 == (id *)v140[1])
      {
        if (v29 == v139)
        {
          v120 = [_HDCachedSourceOrder alloc];
          memset(v126, 0, sizeof(v126));
          std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)v126, v141, *((uint64_t *)&v141 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v141 + 1) - v141) >> 3));
          id v10 = v124;
          v121 = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v120, v126, v124[8], 0);
          p_uint64_t i = v126;
          std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);
          *(void *)a1 = v121;
          *(void *)(a1 + 8) = location;
          p_uint64_t i = (uint64_t *)&v138;
          std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);
          p_uint64_t i = v140;
          std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);
          p_uint64_t i = (uint64_t *)&v141;
          std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);

          v119 = (void *)v144;
          goto LABEL_119;
        }
        if (([v143 containsObject:*v29] & 1) == 0)
        {
          uint64_t v32 = v136;
          uint64_t v33 = *((void *)&v141 + 1);
          if (*((void *)&v141 + 1) >= (unint64_t)v142)
          {
            unint64_t v40 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v141 + 1) - v141) >> 3);
            unint64_t v41 = v40 + 1;
            if (v40 + 1 > 0xAAAAAAAAAAAAAAALL) {
              goto LABEL_121;
            }
            if (0x5555555555555556 * ((uint64_t)&v142[-v141] >> 3) > v41) {
              unint64_t v41 = 0x5555555555555556 * ((uint64_t)&v142[-v141] >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v142[-v141] >> 3) >= 0x555555555555555) {
              unint64_t v42 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v42 = v41;
            }
            p_id location = (id *)&v142;
            if (v42)
            {
              uint64_t v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v42);
              uint64_t v45 = v44;
            }
            else
            {
              uint64_t v43 = 0;
              uint64_t v45 = 0;
            }
            v56 = &v43[24 * v40];
            *(void *)v56 = *v32;
            id v57 = v32[1];
            v56[16] = *((unsigned char *)v32 + 16);
            *((void *)v56 + 1) = v57;
            uint64_t v58 = *((void *)&v141 + 1);
            uint64_t v59 = v141;
            if (*((void *)&v141 + 1) == (void)v141)
            {
              int64x2_t v63 = vdupq_n_s64(*((unint64_t *)&v141 + 1));
              v60 = v56;
            }
            else
            {
              v60 = v56;
              do
              {
                uint64_t v61 = *(void *)(v58 - 24);
                v58 -= 24;
                *(void *)uint64_t v58 = 0;
                *((void *)v60 - 3) = v61;
                v60 -= 24;
                uint64_t v62 = *(void *)(v58 + 8);
                v60[16] = *(unsigned char *)(v58 + 16);
                *((void *)v60 + 1) = v62;
              }
              while (v58 != v59);
              int64x2_t v63 = (int64x2_t)v141;
            }
            uint64_t v35 = v56 + 24;
            *(void *)&long long v141 = v60;
            *((void *)&v141 + 1) = v56 + 24;
            int64x2_t v130 = v63;
            v64 = v142;
            v142 = &v43[24 * v45];
            v131 = v64;
            p_uint64_t i = (uint64_t *)v63.i64[0];
            std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&p_i);
          }
          else
          {
            *(void *)uint64_t v33 = *v136;
            char v34 = *((unsigned char *)v32 + 16);
            *(void *)(v33 + 8) = v32[1];
            *(unsigned char *)(v33 + 16) = v34;
            uint64_t v35 = (char *)(v33 + 24);
          }
          *((void *)&v141 + 1) = v35;
          [v143 addObject:*v136];
          if (location == v147) {
            id v65 = v147;
          }
          else {
            id v65 = (id)v144;
          }
          objc_storeStrong(&location, v65);
        }
LABEL_63:
        v136 += 3;
        goto LABEL_76;
      }
      id v30 = *v28;
      if (v29 == v139) {
        break;
      }
      if ([v143 containsObject:v30]) {
        goto LABEL_75;
      }
      if ([v143 containsObject:*v136]) {
        goto LABEL_63;
      }
      p_uint64_t i = (uint64_t *)&i;
      v130.i64[0] = (uint64_t)&v136;
      v130.i64[1] = (uint64_t)&v143;
      v131 = (char *)&v141;
      p_id location = &location;
      v133 = &v148;
      v134 = &v144;
      v135 = &v147;
      *(void *)&long long v127 = &i;
      *((void *)&v127 + 1) = &v136;
      v128[0] = &v143;
      v128[1] = &v141;
      v128[2] = &location;
      v128[3] = &v148;
      v128[4] = &v144;
      v128[5] = &v147;
      if (v124[8])
      {
        if (-[HDSourceOrderManager _mergedSourceOrderForExistingOrder:incomingOrder:existingSyncIdentity:incomingSyncIdentity:]::$_2::operator()(&p_i)) {
          goto LABEL_76;
        }
        char v31 = -[HDSourceOrderManager _mergedSourceOrderForExistingOrder:incomingOrder:existingSyncIdentity:incomingSyncIdentity:]::$_3::operator()((HKSource ****)&v127);
      }
      else
      {
        if (-[HDSourceOrderManager _mergedSourceOrderForExistingOrder:incomingOrder:existingSyncIdentity:incomingSyncIdentity:]::$_3::operator()((HKSource ****)&v127)) {
          goto LABEL_76;
        }
        char v31 = -[HDSourceOrderManager _mergedSourceOrderForExistingOrder:incomingOrder:existingSyncIdentity:incomingSyncIdentity:]::$_2::operator()(&p_i);
      }
      if ((v31 & 1) == 0)
      {
        [v143 addObject:*i];
        v52 = i;
        uint64_t v53 = *((void *)&v141 + 1);
        if (*((void *)&v141 + 1) >= (unint64_t)v142)
        {
          unint64_t v76 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v141 + 1) - v141) >> 3);
          unint64_t v77 = v76 + 1;
          if (v76 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * ((uint64_t)&v142[-v141] >> 3) > v77) {
            unint64_t v77 = 0x5555555555555556 * ((uint64_t)&v142[-v141] >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v142[-v141] >> 3) >= 0x555555555555555) {
            unint64_t v78 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v78 = v77;
          }
          v152 = &v142;
          if (v78)
          {
            v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v78);
            uint64_t v81 = v80;
          }
          else
          {
            v79 = 0;
            uint64_t v81 = 0;
          }
          v82 = &v79[24 * v76];
          *(void *)v82 = *v52;
          id v83 = v52[1];
          v82[16] = *((unsigned char *)v52 + 16);
          *((void *)v82 + 1) = v83;
          uint64_t v84 = *((void *)&v141 + 1);
          uint64_t v85 = v141;
          if (*((void *)&v141 + 1) == (void)v141)
          {
            int64x2_t v89 = vdupq_n_s64(*((unint64_t *)&v141 + 1));
            v86 = v82;
          }
          else
          {
            v86 = v82;
            do
            {
              uint64_t v87 = *(void *)(v84 - 24);
              v84 -= 24;
              *(void *)uint64_t v84 = 0;
              *((void *)v86 - 3) = v87;
              v86 -= 24;
              uint64_t v88 = *(void *)(v84 + 8);
              v86[16] = *(unsigned char *)(v84 + 16);
              *((void *)v86 + 1) = v88;
            }
            while (v84 != v85);
            int64x2_t v89 = (int64x2_t)v141;
          }
          v55 = v82 + 24;
          *(void *)&long long v141 = v86;
          *((void *)&v141 + 1) = v82 + 24;
          int64x2_t v150 = v89;
          v90 = v142;
          v142 = &v79[24 * v81];
          v151 = v90;
          uint64_t v149 = v89.i64[0];
          std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v149);
        }
        else
        {
          *(void *)uint64_t v53 = *i;
          char v54 = *((unsigned char *)v52 + 16);
          *(void *)(v53 + 8) = v52[1];
          *(unsigned char *)(v53 + 16) = v54;
          v55 = (char *)(v53 + 24);
        }
        *((void *)&v141 + 1) = v55;
        i += 3;
        if (location == v148) {
          id v91 = v148;
        }
        else {
          id v91 = (id)v144;
        }
        objc_storeStrong(&location, v91);
      }
LABEL_76:
      uint64_t v29 = v136;
    }
    if (([v143 containsObject:v30] & 1) == 0)
    {
      char v36 = i;
      uint64_t v37 = *((void *)&v141 + 1);
      if (*((void *)&v141 + 1) >= (unint64_t)v142)
      {
        unint64_t v46 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v141 + 1) - v141) >> 3);
        unint64_t v47 = v46 + 1;
        if (v46 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_121:
        }
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * ((uint64_t)&v142[-v141] >> 3) > v47) {
          unint64_t v47 = 0x5555555555555556 * ((uint64_t)&v142[-v141] >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v142[-v141] >> 3) >= 0x555555555555555) {
          unint64_t v48 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v48 = v47;
        }
        p_id location = (id *)&v142;
        if (v48)
        {
          id v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v48);
          uint64_t v51 = v50;
        }
        else
        {
          id v49 = 0;
          uint64_t v51 = 0;
        }
        v66 = &v49[24 * v46];
        *(void *)v66 = *v36;
        id v67 = v36[1];
        v66[16] = *((unsigned char *)v36 + 16);
        *((void *)v66 + 1) = v67;
        uint64_t v68 = *((void *)&v141 + 1);
        uint64_t v69 = v141;
        if (*((void *)&v141 + 1) == (void)v141)
        {
          int64x2_t v73 = vdupq_n_s64(*((unint64_t *)&v141 + 1));
          v70 = v66;
        }
        else
        {
          v70 = v66;
          do
          {
            uint64_t v71 = *(void *)(v68 - 24);
            v68 -= 24;
            *(void *)uint64_t v68 = 0;
            *((void *)v70 - 3) = v71;
            v70 -= 24;
            uint64_t v72 = *(void *)(v68 + 8);
            v70[16] = *(unsigned char *)(v68 + 16);
            *((void *)v70 + 1) = v72;
          }
          while (v68 != v69);
          int64x2_t v73 = (int64x2_t)v141;
        }
        uint64_t v39 = v66 + 24;
        *(void *)&long long v141 = v70;
        *((void *)&v141 + 1) = v66 + 24;
        int64x2_t v130 = v73;
        v74 = v142;
        v142 = &v49[24 * v51];
        v131 = v74;
        p_uint64_t i = (uint64_t *)v73.i64[0];
        std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&p_i);
      }
      else
      {
        *(void *)uint64_t v37 = *i;
        char v38 = *((unsigned char *)v36 + 16);
        *(void *)(v37 + 8) = v36[1];
        *(unsigned char *)(v37 + 16) = v38;
        uint64_t v39 = (char *)(v37 + 24);
      }
      *((void *)&v141 + 1) = v39;
      [v143 addObject:*i];
      if (location == v148) {
        id v75 = v148;
      }
      else {
        id v75 = (id)v144;
      }
      objc_storeStrong(&location, v75);
    }
LABEL_75:
    i += 3;
    goto LABEL_76;
  }
  if (v10[8]) {
    unint64_t v16 = v10;
  }
  else {
    unint64_t v16 = v11;
  }
  if (v10[8]) {
    unint64_t v17 = v11;
  }
  else {
    unint64_t v17 = v10;
  }
  if (v10[8]) {
    uint64_t v18 = &v148;
  }
  else {
    uint64_t v18 = &v147;
  }
  unint64_t v19 = v16;
  id v20 = v17;
  id location = *v18;

  long long v127 = 0uLL;
  v128[0] = 0;
  v122 = v20;
  std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)&v127, v19[2], v19[3], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v19[3] - v19[2]) >> 3));
  id v21 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v22 = (void *)[v21 initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v127 + 1) - v127) >> 3)];
  id v24 = (id *)*((void *)&v127 + 1);
  for (j = (id *)v127; j != v24; j += 3)
  {
    id v25 = *j;
    [v22 addObject:v25];
  }
  [(_HDCachedSourceOrder *)(char *)&v149 orderedSources];
  uint64_t v92 = v149;
  for (uint64_t k = v150.i64[0]; v92 != k; v92 += 24)
  {
    id v94 = *(id *)v92;
    *(void *)&long long v141 = *(void *)(v92 + 8);
    BYTE8(v141) = *(unsigned char *)(v92 + 16);
    if (([v22 containsObject:v94] & 1) == 0)
    {
      id v95 = objc_loadWeakRetained(v12);
      v96 = [v95 syncIdentityManager];
      v97 = [v96 currentSyncIdentity];
      id v98 = location;
      id location = v97;

      uint64_t v99 = *((void *)&v127 + 1);
      if (*((void *)&v127 + 1) >= v128[0])
      {
        unint64_t v101 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v127 + 1) - v127) >> 3);
        unint64_t v102 = v101 + 1;
        if (v101 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * ((uint64_t)(v128[0] - v127) >> 3) > v102) {
          unint64_t v102 = 0x5555555555555556 * ((uint64_t)(v128[0] - v127) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v128[0] - v127) >> 3) >= 0x555555555555555) {
          unint64_t v103 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v103 = v102;
        }
        p_id location = (id *)v128;
        if (v103)
        {
          v104 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v103);
          uint64_t v106 = v105;
        }
        else
        {
          v104 = 0;
          uint64_t v106 = 0;
        }
        v107 = &v104[24 * v101];
        *(void *)v107 = v94;
        v107[16] = BYTE8(v141);
        *((void *)v107 + 1) = v141;
        uint64_t v108 = *((void *)&v127 + 1);
        uint64_t v109 = v127;
        if (*((void *)&v127 + 1) == (void)v127)
        {
          int64x2_t v113 = vdupq_n_s64(*((unint64_t *)&v127 + 1));
          v110 = v107;
        }
        else
        {
          v110 = v107;
          do
          {
            uint64_t v111 = *(void *)(v108 - 24);
            v108 -= 24;
            *(void *)uint64_t v108 = 0;
            *((void *)v110 - 3) = v111;
            v110 -= 24;
            uint64_t v112 = *(void *)(v108 + 8);
            v110[16] = *(unsigned char *)(v108 + 16);
            *((void *)v110 + 1) = v112;
          }
          while (v108 != v109);
          int64x2_t v113 = (int64x2_t)v127;
        }
        v100 = v107 + 24;
        *(void *)&long long v127 = v110;
        *((void *)&v127 + 1) = v100;
        int64x2_t v130 = v113;
        v114 = (char *)v128[0];
        v128[0] = &v104[24 * v106];
        v131 = v114;
        p_uint64_t i = (uint64_t *)v113.i64[0];
        std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&p_i);
      }
      else
      {
        *(void *)uint64_t v99 = v94;
        *(void *)(v99 + 8) = v141;
        *(unsigned char *)(v99 + 16) = BYTE8(v141);
        v100 = (char *)(v99 + 24);
      }
      *((void *)&v127 + 1) = v100;
    }
  }
  p_uint64_t i = &v149;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);
  v115 = [_HDCachedSourceOrder alloc];
  memset(v145, 0, sizeof(v145));
  std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)v145, v127, *((uint64_t *)&v127 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v127 + 1) - v127) >> 3));
  unint64_t v11 = v123;
  id v10 = v124;
  v116 = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v115, v145, 1, 0);
  p_uint64_t i = v145;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);
  v117 = *(void **)a1;
  *(void *)a1 = v116;
  v118 = v116;

  objc_storeStrong((id *)(a1 + 8), location);
  p_uint64_t i = (uint64_t *)&v127;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_i);

  v119 = v19;
LABEL_119:

LABEL_120:
}

- (uint64_t)_mergedSourceOrderForExistingOrder:incomingOrder:existingSyncIdentity:incomingSyncIdentity:
{
  uint64_t v2 = _HDDefaultSourceOrderCompare(***a1, **a1[1]);
  if (!v2)
  {
    v3 = [(HKSource *)***a1 bundleIdentifier];
    uint64_t v4 = [(HKSource *)**a1[1] bundleIdentifier];
    uint64_t v2 = [v3 compare:v4];
  }
  if (v2 == 1)
  {
    [*a1[2] addObject:**a1[1]];
    unint64_t v11 = a1[3];
    uint64_t v12 = (uint64_t)*a1[1];
    uint64_t v13 = v11[1];
    BOOL v14 = v11[2];
    if (v13 >= v14)
    {
      unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * (v13 - *v11);
      if (v25 + 1 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_46;
      }
      unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * (v14 - *v11);
      uint64_t v27 = 2 * v26;
      if (2 * v26 <= v25 + 1) {
        uint64_t v27 = v25 + 1;
      }
      if (v26 >= 0x555555555555555) {
        unint64_t v28 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v28 = v27;
      }
      uint64_t v59 = v11 + 2;
      if (v28)
      {
        uint64_t v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v28);
        uint64_t v31 = v30;
      }
      else
      {
        uint64_t v29 = 0;
        uint64_t v31 = 0;
      }
      unint64_t v40 = &v29[24 * v25];
      *(void *)unint64_t v40 = *(id *)v12;
      uint64_t v41 = *(void *)(v12 + 8);
      v40[16] = *(unsigned char *)(v12 + 16);
      *((void *)v40 + 1) = v41;
      uint64_t v43 = *v11;
      unint64_t v42 = v11[1];
      if (v42 == *v11)
      {
        unint64_t v47 = v11[1];
        uint64_t v44 = v40;
      }
      else
      {
        uint64_t v44 = v40;
        do
        {
          uint64_t v45 = (uint64_t)*(v42 - 3);
          v42 -= 3;
          uint64_t *v42 = 0;
          *((void *)v44 - 3) = v45;
          v44 -= 24;
          unint64_t v46 = v42[1];
          v44[16] = *((unsigned char *)v42 + 16);
          *((void *)v44 + 1) = v46;
        }
        while (v42 != v43);
        unint64_t v47 = *v11;
        unint64_t v42 = v11[1];
      }
      unint64_t v16 = v40 + 24;
      unsigned char *v11 = (HKSource **)v44;
      v55 = v47;
      v56 = v47;
      v11[1] = (HKSource **)(v40 + 24);
      id v57 = v42;
      v52 = v11[2];
      v11[2] = (HKSource **)&v29[24 * v31];
      uint64_t v58 = v52;
      std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v55);
    }
    else
    {
      *uint64_t v13 = (HKSource *)*(id *)v12;
      char v15 = *(unsigned char *)(v12 + 16);
      v13[1] = *(HKSource **)(v12 + 8);
      *((unsigned char *)v13 + 16) = v15;
      unint64_t v16 = (char *)(v13 + 3);
    }
    v11[1] = (HKSource **)v16;
    *a1[1] += 3;
    uint64_t v50 = (void **)a1[4];
    uint64_t v51 = *v50;
    id v49 = (void **)a1[7];
    goto LABEL_42;
  }
  if (v2 != -1) {
    return 0;
  }
  [*a1[2] addObject:***a1];
  double v5 = a1[3];
  id v6 = **a1;
  id v7 = v5[1];
  uint64_t v8 = v5[2];
  if (v7 >= v8)
  {
    unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * (v7 - *v5);
    if (v18 + 1 <= 0xAAAAAAAAAAAAAAALL)
    {
      unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * (v8 - *v5);
      uint64_t v20 = 2 * v19;
      if (2 * v19 <= v18 + 1) {
        uint64_t v20 = v18 + 1;
      }
      if (v19 >= 0x555555555555555) {
        unint64_t v21 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v21 = v20;
      }
      uint64_t v59 = v5 + 2;
      if (v21)
      {
        uint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v21);
        uint64_t v24 = v23;
      }
      else
      {
        uint64_t v22 = 0;
        uint64_t v24 = 0;
      }
      uint64_t v32 = &v22[24 * v18];
      *(void *)uint64_t v32 = *v6;
      uint64_t v33 = v6[1];
      v32[16] = *((unsigned char *)v6 + 16);
      *((void *)v32 + 1) = v33;
      uint64_t v35 = *v5;
      char v34 = v5[1];
      if (v34 == *v5)
      {
        uint64_t v39 = v5[1];
        char v36 = v32;
      }
      else
      {
        char v36 = v32;
        do
        {
          uint64_t v37 = (uint64_t)*(v34 - 3);
          v34 -= 3;
          NSObject *v34 = 0;
          *((void *)v36 - 3) = v37;
          v36 -= 24;
          char v38 = v34[1];
          v36[16] = *((unsigned char *)v34 + 16);
          *((void *)v36 + 1) = v38;
        }
        while (v34 != v35);
        uint64_t v39 = *v5;
        char v34 = v5[1];
      }
      id v10 = v32 + 24;
      *double v5 = (HKSource **)v36;
      v55 = v39;
      v56 = v39;
      v5[1] = (HKSource **)(v32 + 24);
      id v57 = v34;
      unint64_t v48 = v5[2];
      v5[2] = (HKSource **)&v22[24 * v24];
      uint64_t v58 = v48;
      std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v55);
      goto LABEL_38;
    }
LABEL_46:
    std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
  }
  void *v7 = *v6;
  char v9 = *((unsigned char *)v6 + 16);
  v7[1] = v6[1];
  *((unsigned char *)v7 + 16) = v9;
  id v10 = (char *)(v7 + 3);
LABEL_38:
  v5[1] = (HKSource **)v10;
  **a1 += 3;
  uint64_t v50 = (void **)a1[4];
  id v49 = (void **)a1[5];
  uint64_t v51 = *v50;
LABEL_42:
  if (v51 != *v49) {
    uint64_t v51 = *a1[6];
  }
  id v53 = v51;
  char v54 = *v50;
  *uint64_t v50 = v53;

  return 1;
}

- (id)_sourceCacheItemForObjectType:(void *)a3 transactionCache:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    uint64_t v12 = *(void **)(a1 + 16);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __89__HDSourceOrderManager__sourceCacheItemForObjectType_transactionCache_transaction_error___block_invoke;
    v15[3] = &unk_1E62FCD20;
    v15[4] = a1;
    id v16 = v9;
    id v17 = v10;
    uint64_t v13 = [v12 fetchObjectForKey:v16 transaction:v11 error:a5 faultHandler:v15];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

BOOL __54__HDSourceOrderManager__updateSourceOrder_type_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [_HDSourceOrderTransactionCache alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  uint64_t v8 = -[_HDSourceOrderTransactionCache initWithProfile:]((id *)&v6->super.isa, WeakRetained);

  uint64_t v9 = a1[4];
  id v10 = (void *)a1[5];
  id v11 = (void *)a1[6];
  id v12 = objc_loadWeakRetained((id *)(v9 + 8));
  BOOL v13 = -[HDSourceOrderManager _updateSourceOrder:type:syncIdentity:transactionCache:transaction:error:](v9, v10, v11, [v12 currentSyncIdentityPersistentID], v5, a3);

  return v13;
}

void __96__HDSourceOrderManager__updateSourceOrder_type_syncIdentity_transactionCache_transaction_error___block_invoke(uint64_t *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  [(_HDCachedSourceOrder *)(char *)&v16 orderedSources];
  uint64_t v4 = v16;
  uint64_t v5 = v17;
  if (v16 == v17) {
    goto LABEL_13;
  }
  while (!*(unsigned char *)(v4 + 16))
  {
LABEL_7:
    v4 += 24;
    if (v4 == v5) {
      goto LABEL_13;
    }
  }
  id v6 = [*(id *)v4 bundleIdentifier];
  uint64_t v7 = a1[5];
  id v15 = 0;
  uint64_t v8 = +[HDLogicalSourceEntity logicalSourceIDForBundleIdentifier:v6 transaction:v7 error:&v15];
  id v9 = v15;

  if (v8)
  {
    uint64_t v10 = [v8 longLongValue];
    uint64_t v11 = a1[4];
    if (v11) {
      BOOL v12 = *(unsigned __int8 *)(v11 + 8) != 0;
    }
    else {
      BOOL v12 = 0;
    }
    v3[2](v3, v10, v12, 0, a1[6], *(double *)(v4 + 8));

    goto LABEL_7;
  }
  _HKInitializeLogging();
  BOOL v13 = (id)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    BOOL v14 = [*(id *)v4 bundleIdentifier];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v14;
    __int16 v19 = 2114;
    id v20 = v9;
    _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch logical source ID for bundle ID %@, %{public}@.", buf, 0x16u);
  }
LABEL_13:
  *(void *)long long buf = &v16;
  std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
}

char *__89__HDSourceOrderManager__sourceCacheItemForObjectType_transactionCache_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v59 = v6;
  id v8 = a2;
  v56 = v7;
  uint64_t v58 = v8;
  if (v5)
  {
    id v9 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
    uint64_t v11 = [WeakRetained sourceManager];

    uint64_t v80 = 0;
    uint64_t v81 = &v80;
    uint64_t v82 = 0x4812000000;
    id v83 = __Block_byref_object_copy__310;
    uint64_t v84 = __Block_byref_object_dispose__311;
    uint64_t v85 = &unk_1BD44B655;
    memset(v86, 0, sizeof(v86));
    uint64_t v72 = 0;
    int64x2_t v73 = &v72;
    uint64_t v74 = 0x5812000000;
    id v75 = __Block_byref_object_copy__313;
    memset(v77, 0, sizeof(v77));
    unint64_t v76 = __Block_byref_object_dispose__314;
    uint64_t v78 = 0;
    int v79 = 1065353216;
    uint64_t v68 = 0;
    uint64_t v69 = &v68;
    uint64_t v70 = 0x2020000000;
    char v71 = 0;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __94__HDSourceOrderManager__fetchSourceCacheItemForObjectType_transactionCache_transaction_error___block_invoke;
    v62[3] = &unk_1E62FCD70;
    id v65 = &v68;
    id v63 = v11;
    id v12 = v9;
    id v64 = v12;
    v66 = &v72;
    id v67 = &v80;
    id v57 = v63;
    if (!+[HDLogicalSourceOrderEntity enumerateOrderedSourceIDsForType:v7 transaction:v12 error:a3 block:v62])
    {
      uint64_t v37 = 0;
LABEL_44:

      _Block_object_dispose(&v68, 8);
      _Block_object_dispose(&v72, 8);
      std::__hash_table<std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,std::__unordered_map_hasher<HKSource * {__strong},std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,HDNSObjectHash,HDNSObjectEqual,true>,std::__unordered_map_equal<HKSource * {__strong},std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,HDNSObjectEqual,HDNSObjectHash,true>,std::allocator<std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>>>::~__hash_table((uint64_t)&v77[8]);
      _Block_object_dispose(&v80, 8);
      uint64_t v72 = (void **)v86;
      std::vector<HKSource * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v72);

      goto LABEL_45;
    }
    uint64_t v13 = v81[7] - v81[6];
    if (v13)
    {
      long long v96 = 0uLL;
      v97[0] = 0;
      std::vector<_HDWrappedSource>::reserve(&v96, v13 >> 3);
      BOOL v14 = (id *)v81[6];
      for (uint64_t i = (id *)v81[7]; v14 != i; ++v14)
      {
        *(void *)&long long v92 = *v14;
        v100 = (id *)&v92;
        uint64_t v16 = (id *)std::__hash_table<std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,std::__unordered_map_hasher<HKSource * {__strong},std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,HDNSObjectHash,HDNSObjectEqual,true>,std::__unordered_map_equal<HKSource * {__strong},std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,HDNSObjectEqual,HDNSObjectHash,true>,std::allocator<std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>>>::__emplace_unique_key_args<HKSource * {__strong},std::piecewise_construct_t const&,std::tuple<HKSource * const {__strong}&>,std::tuple<>>((uint64_t *)v73 + 6, (id *)&v92, &v100);
        uint64_t v17 = v16;
        uint64_t v18 = *((void *)&v96 + 1);
        if (*((void *)&v96 + 1) >= v97[0])
        {
          unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v96 + 1) - v96) >> 3);
          unint64_t v22 = v21 + 1;
          if (v21 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * ((uint64_t)(v97[0] - v96) >> 3) > v22) {
            unint64_t v22 = 0x5555555555555556 * ((uint64_t)(v97[0] - v96) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v97[0] - v96) >> 3) >= 0x555555555555555) {
            unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v23 = v22;
          }
          unint64_t v103 = v97;
          if (v23)
          {
            uint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v23);
            uint64_t v26 = v25;
          }
          else
          {
            uint64_t v24 = 0;
            uint64_t v26 = 0;
          }
          uint64_t v27 = &v24[24 * v21];
          *(void *)uint64_t v27 = v17[3];
          id v28 = v17[4];
          v27[16] = *((unsigned char *)v17 + 40);
          *((void *)v27 + 1) = v28;
          uint64_t v29 = *((void *)&v96 + 1);
          uint64_t v30 = v96;
          if (*((void *)&v96 + 1) == (void)v96)
          {
            int64x2_t v34 = vdupq_n_s64(*((unint64_t *)&v96 + 1));
            uint64_t v31 = v27;
          }
          else
          {
            uint64_t v31 = v27;
            do
            {
              uint64_t v32 = *(void *)(v29 - 24);
              v29 -= 24;
              *(void *)uint64_t v29 = 0;
              *((void *)v31 - 3) = v32;
              v31 -= 24;
              uint64_t v33 = *(void *)(v29 + 8);
              v31[16] = *(unsigned char *)(v29 + 16);
              *((void *)v31 + 1) = v33;
            }
            while (v29 != v30);
            int64x2_t v34 = (int64x2_t)v96;
          }
          id v20 = v27 + 24;
          *(void *)&long long v96 = v31;
          *((void *)&v96 + 1) = v27 + 24;
          int64x2_t v101 = v34;
          uint64_t v35 = v97[0];
          v97[0] = &v24[24 * v26];
          uint64_t v102 = v35;
          v100 = (id *)v34.i64[0];
          std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v100);
        }
        else
        {
          *(void *)uint64_t v18 = v16[3];
          char v19 = *((unsigned char *)v17 + 40);
          *(void *)(v18 + 8) = v17[4];
          *(unsigned char *)(v18 + 16) = v19;
          id v20 = (char *)(v18 + 24);
        }
        *((void *)&v96 + 1) = v20;
      }
      char v36 = [_HDCachedSourceOrder alloc];
      v100 = 0;
      int64x2_t v101 = 0uLL;
      std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)&v100, v96, *((uint64_t *)&v96 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v96 + 1) - v96) >> 3));
      uint64_t v37 = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v36, (uint64_t *)&v100, *((unsigned char *)v69 + 24), 0);
      *(void *)&long long v92 = &v100;
      std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&v92);
      *(void *)&long long v92 = &v96;
      std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&v92);
      goto LABEL_44;
    }
    char v38 = [v12 databaseForEntityClass:objc_opt_class()];
    uint64_t v39 = (id *)v59;
    v60 = v39;
    id v61 = v38;
    if (v39)
    {
      id v40 = v39[2];
      if (v40)
      {
        id v55 = v40;

LABEL_32:
        *(void *)&long long v96 = 0;
        *((void *)&v96 + 1) = &v96;
        v97[0] = 0x4812000000;
        v97[1] = __Block_byref_object_copy__292;
        v97[2] = __Block_byref_object_dispose__293;
        v97[3] = &unk_1BD44B655;
        memset(v98, 0, 24);
        std::vector<_HDWrappedSource>::reserve(v98, objc_msgSend(v55, "count", v98));
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v46 = v55;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v92 objects:&v100 count:16];
        if (v47)
        {
          uint64_t v48 = *(void *)v93;
          while (2)
          {
            for (uint64_t j = 0; j != v47; ++j)
            {
              if (*(void *)v93 != v48) {
                objc_enumerationMutation(v46);
              }
              uint64_t v50 = *(void *)(*((void *)&v92 + 1) + 8 * j);
              v87[3] = MEMORY[0x1E4F143A8];
              v87[4] = 3221225472;
              v87[5] = (uint64_t)__83__HDSourceOrderManager__defaultSourceCacheItemWithTransactionCache_database_error___block_invoke;
              v87[6] = (uint64_t)&unk_1E62FCC58;
              uint64_t v88 = v60;
              uint64_t v89 = v50;
              id v90 = v61;
              id v91 = &v96;
              LODWORD(v50) = HKWithAutoreleasePool();

              if (!v50)
              {

                uint64_t v37 = 0;
                uint64_t v51 = v54;
                goto LABEL_42;
              }
            }
            uint64_t v47 = [v46 countByEnumeratingWithState:&v92 objects:&v100 count:16];
            if (v47) {
              continue;
            }
            break;
          }
        }

        uint64_t v51 = v54;
        v52 = [_HDCachedSourceOrder alloc];
        memset(v87, 0, 24);
        std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)v87, *(void *)(*((void *)&v96 + 1) + 48), *(void *)(*((void *)&v96 + 1) + 56), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(void *)(*((void *)&v96 + 1) + 56) - *(void *)(*((void *)&v96 + 1) + 48)) >> 3));
        uint64_t v37 = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v52, v87, 0, 1);
        uint64_t v99 = (void **)v87;
        std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100](&v99);
LABEL_42:
        _Block_object_dispose(&v96, 8);
        uint64_t v99 = v51;
        std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100](&v99);
        goto LABEL_43;
      }
      uint64_t v41 = [v39[1] sourceManager];
      unint64_t v42 = [v41 allSourcesWithError:a3];

      if (v42)
      {
        id v43 = v42;
        self;
        uint64_t v44 = [v43 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_72];

        id v45 = v39[2];
        v39[2] = (id)v44;

        id v55 = v39[2];
      }
      else
      {
        id v55 = 0;
      }

      if (v55) {
        goto LABEL_32;
      }
    }
    else
    {
    }
    id v46 = 0;
    uint64_t v37 = 0;
LABEL_43:

    goto LABEL_44;
  }
  uint64_t v37 = 0;
LABEL_45:

  return v37;
}

uint64_t __94__HDSourceOrderManager__fetchSourceCacheItemForObjectType_transactionCache_transaction_error___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  char v5 = HKWithAutoreleasePool();
  id v6 = 0;
  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218242;
      uint64_t v12 = a2;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_INFO, "Failed to lookup source order information for %lld: %{public}@", buf, 0x16u);
    }
  }

  return 1;
}

BOOL __94__HDSourceOrderManager__fetchSourceCacheItemForObjectType_transactionCache_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  char v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 64)];
  id v6 = [v4 uncachedClientSourceForPersistentID:v5 transaction:*(void *)(a1 + 40) error:a2];
  id obj = v6;

  if (v6)
  {
    id v7 = (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 48);
    p_id obj = &obj;
    id v8 = (char *)std::__hash_table<std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,std::__unordered_map_hasher<HKSource * {__strong},std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,HDNSObjectHash,HDNSObjectEqual,true>,std::__unordered_map_equal<HKSource * {__strong},std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>,HDNSObjectEqual,HDNSObjectHash,true>,std::allocator<std::__hash_value_type<HKSource * {__strong},_HDWrappedSource>>>::__emplace_unique_key_args<HKSource * {__strong},std::piecewise_construct_t const&,std::tuple<HKSource * const {__strong}&>,std::tuple<>>(v7, &obj, &p_obj);
    id v9 = (double *)v8;
    id v10 = (id *)(v8 + 24);
    if (*((void *)v8 + 3))
    {
      double v11 = *((double *)v8 + 4);
    }
    else
    {
      uint64_t v12 = *(void **)(*(void *)(a1 + 56) + 8);
      id v13 = obj;
      uint64_t v15 = (void *)v12[7];
      unint64_t v14 = v12[8];
      if ((unint64_t)v15 >= v14)
      {
        uint64_t v17 = v12[6];
        uint64_t v18 = ((uint64_t)v15 - v17) >> 3;
        if ((unint64_t)(v18 + 1) >> 61) {
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v19 = v14 - v17;
        uint64_t v20 = v19 >> 2;
        if (v19 >> 2 <= (unint64_t)(v18 + 1)) {
          uint64_t v20 = v18 + 1;
        }
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v20;
        }
        if (v21)
        {
          if (v21 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v22 = (char *)operator new(8 * v21);
        }
        else
        {
          unint64_t v22 = 0;
        }
        unint64_t v23 = &v22[8 * v18];
        uint64_t v24 = &v22[8 * v21];
        *(void *)unint64_t v23 = v13;
        uint64_t v16 = v23 + 8;
        uint64_t v25 = (void *)v12[6];
        uint64_t v26 = (void *)v12[7];
        if (v26 == v25)
        {
          v12[6] = v23;
          v12[7] = v16;
          v12[8] = v24;
        }
        else
        {
          do
          {
            uint64_t v27 = *--v26;
            *uint64_t v26 = 0;
            *((void *)v23 - 1) = v27;
            v23 -= 8;
          }
          while (v26 != v25);
          uint64_t v26 = (void *)v12[6];
          id v28 = (void *)v12[7];
          v12[6] = v23;
          v12[7] = v16;
          v12[8] = v24;
          while (v28 != v26)
          {
            uint64_t v29 = (void *)*--v28;
          }
        }
        if (v26) {
          operator delete(v26);
        }
      }
      else
      {
        *uint64_t v15 = obj;
        uint64_t v16 = v15 + 1;
      }
      v12[7] = v16;
      objc_storeStrong(v10, obj);
      double v11 = *(double *)(a1 + 72);
      v9[4] = v11;
      *((unsigned char *)v9 + 40) = 1;
    }
    if (v11 < *(double *)(a1 + 72)) {
      double v11 = *(double *)(a1 + 72);
    }
    v9[4] = v11;
  }
  return v6 != 0;
}

uint64_t __52__HDSourceOrderManager__defaultOrderingWithSources___block_invoke(int a1, HKSource *a2, HKSource *a3)
{
  return _HDDefaultSourceOrderCompare(a2, a3);
}

BOOL __83__HDSourceOrderManager__defaultSourceCacheItemWithTransactionCache_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = [*(id *)(a1 + 40) bundleIdentifier];
  id v6 = -[_HDSourceOrderTransactionCache orderedSourceIDsForBundleIdentifier:database:error:](v4, v5, *(void **)(a1 + 48), a2);

  if (v6)
  {
    id v7 = *(id *)(a1 + 40);
    id v8 = v7;
    id v9 = *(int64x2_t **)(*(void *)(a1 + 56) + 8);
    id v10 = (void *)v9[3].i64[1];
    unint64_t v11 = v9[4].u64[0];
    if ((unint64_t)v10 >= v11)
    {
      uint64_t v13 = v9[3].i64[0];
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v10 - v13) >> 3);
      if (v14 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v13) >> 3);
      uint64_t v16 = 2 * v15;
      if (2 * v15 <= v14 + 1) {
        uint64_t v16 = v14 + 1;
      }
      if (v15 >= 0x555555555555555) {
        unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v17 = v16;
      }
      uint64_t v33 = v9 + 4;
      if (v17)
      {
        uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v17);
        uint64_t v20 = v19;
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v20 = 0;
      }
      unint64_t v21 = &v18[24 * v14];
      *(void *)unint64_t v21 = v8;
      *((void *)v21 + 1) = 0;
      uint64_t v23 = v9[3].i64[0];
      unint64_t v22 = v9[3].u64[1];
      if (v22 == v23)
      {
        int64x2_t v27 = vdupq_n_s64(v22);
        uint64_t v24 = v21;
      }
      else
      {
        uint64_t v24 = v21;
        do
        {
          uint64_t v25 = *(void *)(v22 - 24);
          v22 -= 24;
          *(void *)unint64_t v22 = 0;
          *((void *)v24 - 3) = v25;
          v24 -= 24;
          uint64_t v26 = *(void *)(v22 + 8);
          v24[16] = *(unsigned char *)(v22 + 16);
          *((void *)v24 + 1) = v26;
        }
        while (v22 != v23);
        int64x2_t v27 = v9[3];
      }
      uint64_t v12 = v21 + 24;
      v9[3].i64[0] = (uint64_t)v24;
      v9[3].i64[1] = (uint64_t)v12;
      int64x2_t v31 = v27;
      uint64_t v28 = v9[4].i64[0];
      v9[4].i64[0] = (uint64_t)&v18[24 * v20];
      uint64_t v32 = v28;
      uint64_t v30 = v27.i64[0];
      std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v30);
    }
    else
    {
      *id v10 = v7;
      v10[1] = 0;
      uint64_t v12 = v10 + 3;
    }
    v9[3].i64[1] = (uint64_t)v12;
  }
  return v6 != 0;
}

- (BOOL)addOrderedSource:(id)a3 objectTypes:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  unint64_t v11 = [WeakRetained database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__HDSourceOrderManager_addOrderedSource_objectTypes_error___block_invoke;
  v15[3] = &unk_1E62FC928;
  v15[4] = self;
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v17 = v13;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:a5 block:v15];

  return (char)a5;
}

uint64_t __59__HDSourceOrderManager_addOrderedSource_objectTypes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v114 = a2;
  uint64_t v4 = [_HDSourceOrderTransactionCache alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v115 = -[_HDSourceOrderTransactionCache initWithProfile:]((id *)&v4->super.isa, WeakRetained);

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v6 = [obj countByEnumeratingWithState:&v121 objects:v139 count:16];
  unsigned int v108 = 1;
  if (!v6) {
    goto LABEL_117;
  }
  uint64_t v112 = *(void *)v122;
  uint64_t v110 = a1;
  while (2)
  {
    uint64_t v7 = 0;
    uint64_t v111 = v6;
    do
    {
      if (*(void *)v122 != v112) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v121 + 1) + 8 * v7);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(id *)(a1 + 48);
      id v11 = v8;
      id v12 = v115;
      id v13 = v114;
      v116 = v10;
      if (!v9)
      {

LABEL_116:
        unsigned int v108 = 0;
        goto LABEL_117;
      }
      id v132 = 0;
      v118 = v12;
      v119 = v13;
      v117 = v11;
      uint64_t v14 = -[HDSourceOrderManager _sourceCacheItemForObjectType:transactionCache:transaction:error:](v9, v11, v12, v13, (uint64_t)&v132);
      id v15 = v132;
      id v16 = v15;
      v120 = (unsigned char *)v14;
      if (v14)
      {
        unint64_t v131 = 0;
        long long v130 = 0uLL;
        if (!*(unsigned char *)(v14 + 9))
        {
          memset(buf, 0, sizeof(buf));
          std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)buf, *(void *)(v14 + 16), *(void *)(v14 + 24), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v14 + 24) - *(void *)(v14 + 16)) >> 3));
          std::vector<_HDWrappedSource>::__vdeallocate((void **)&v130);
          long long v130 = *(_OWORD *)buf;
          unint64_t v131 = *(void *)&buf[16];
          memset(buf, 0, sizeof(buf));
          v134 = buf;
          std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&v134);
          uint64_t v28 = (uint64_t *)*((void *)&v130 + 1);
          uint64_t v29 = (id *)v130;
          if ((void)v130 != *((void *)&v130 + 1))
          {
            uint64_t v30 = v130 + 24;
            while (*(unsigned char *)(v30 - 8))
            {
              BOOL v31 = v30 == *((void *)&v130 + 1);
              v30 += 24;
              if (v31) {
                goto LABEL_76;
              }
            }
            uint64_t v56 = v30 - 24;
            if (v30 - 24 != *((void *)&v130 + 1) && v30 != *((void *)&v130 + 1))
            {
              do
              {
                if (*(unsigned char *)(v30 + 16))
                {
                  uint64_t v57 = *(void *)v30;
                  *(void *)uint64_t v30 = 0;
                  uint64_t v58 = *(void **)v56;
                  *(void *)uint64_t v56 = v57;

                  uint64_t v59 = *(void *)(v30 + 8);
                  *(unsigned char *)(v56 + 16) = *(unsigned char *)(v30 + 16);
                  *(void *)(v56 + 8) = v59;
                  v56 += 24;
                }
                v30 += 24;
              }
              while ((uint64_t *)v30 != v28);
              uint64_t v28 = (uint64_t *)*((void *)&v130 + 1);
              uint64_t v29 = (id *)v130;
            }
            if ((uint64_t *)v56 != v28)
            {
              uint64_t v28 = (uint64_t *)std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,_HDWrappedSource *,_HDWrappedSource *,_HDWrappedSource *,0>(v28, v28, v56);
              for (uint64_t i = (uint64_t *)*((void *)&v130 + 1); i != v28; i -= 3)
              {
                id v61 = (void *)*(i - 3);
              }
              *((void *)&v130 + 1) = v28;
              uint64_t v29 = (id *)v130;
            }
LABEL_76:
            while (v29 != (id *)v28)
            {
              if ([*v29 isEqual:v10])
              {
                id v19 = v16;
                goto LABEL_105;
              }
              v29 += 3;
            }
          }
        }
        id v17 = (HKSource *)v10;
        id v127 = v17;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        char v129 = 1;
        id v126 = v16;
        BOOL v18 = -[HDSourceOrderManager _updateOrderedSourceIDsForWrappedSource:transactionCache:transaction:error:](v9, &v127, v118, v119, (uint64_t)&v126);
        id v19 = v126;

        if (v18)
        {
          uint64_t v20 = (HKSource **)*((void *)&v130 + 1);
          unint64_t v21 = (HKSource **)v130;
          if ((void)v130 == *((void *)&v130 + 1))
          {
            uint64_t v23 = (HKSource **)v130;
            unint64_t v22 = (HKSource **)v130;
          }
          else
          {
            while (_HDDefaultSourceOrderCompare(v17, *v21) == 1)
            {
              v21 += 3;
              if (v21 == v20)
              {
                unint64_t v21 = v20;
                break;
              }
            }
            unint64_t v22 = v21;
            unint64_t v21 = (HKSource **)*((void *)&v130 + 1);
            uint64_t v23 = (HKSource **)v130;
          }
          uint64_t v35 = ((char *)v22 - (char *)v23) / 24;
          unint64_t v36 = (unint64_t)&v23[3 * v35];
          if ((unint64_t)v21 >= v131)
          {
            unint64_t v53 = 1 - 0x5555555555555555 * (v21 - v23);
            if (v53 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * ((uint64_t)(v131 - (void)v23) >> 3) > v53) {
              unint64_t v53 = 0x5555555555555556 * ((uint64_t)(v131 - (void)v23) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v131 - (void)v23) >> 3) >= 0x555555555555555) {
              unint64_t v54 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v54 = v53;
            }
            v138 = &v131;
            if (v54) {
              unint64_t v54 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v54);
            }
            else {
              uint64_t v55 = 0;
            }
            uint64_t v64 = v54 + 24 * v35;
            v134 = (uint8_t *)v54;
            v135 = (void **)v64;
            uint64_t v136 = v64;
            v137 = (void **)(v54 + 24 * v55);
            if (v35 == v55)
            {
              if ((char *)v22 - (char *)v23 < 1)
              {
                if (v23 == v22) {
                  unint64_t v67 = 1;
                }
                else {
                  unint64_t v67 = 2 * v35;
                }
                v142 = &v131;
                uint64_t v68 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawDistanceSample>>(v67);
                uint64_t v70 = v135;
                uint64_t v71 = v136;
                uint64_t v72 = v135;
                uint64_t v73 = (uint64_t)&v68[3 * (v67 >> 2)];
                if ((void **)v136 != v135)
                {
                  uint64_t v73 = (uint64_t)&v68[3 * (v67 >> 2)] + v136 - (void)v135;
                  uint64_t v74 = &v68[3 * (v67 >> 2)];
                  id v75 = v135;
                  do
                  {
                    unint64_t v76 = *v75;
                    *id v75 = 0;
                    char *v74 = v76;
                    unint64_t v77 = v75[1];
                    *((unsigned char *)v74 + 16) = *((unsigned char *)v75 + 16);
                    v74[1] = v77;
                    v74 += 3;
                    v75 += 3;
                  }
                  while (v74 != (void **)v73);
                  uint64_t v72 = (void **)v71;
                }
                uint64_t v78 = v134;
                int v79 = v137;
                v134 = (uint8_t *)v68;
                v135 = &v68[3 * (v67 >> 2)];
                *(void *)long long buf = v78;
                *(void *)&buf[8] = v70;
                uint64_t v136 = v73;
                v137 = &v68[3 * v69];
                *(void *)&buf[16] = v72;
                long long v141 = v79;
                std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)buf);
                uint64_t v64 = v136;
              }
              else
              {
                uint64_t v65 = v35 + 2;
                if (v35 >= -1) {
                  uint64_t v65 = v35 + 1;
                }
                uint64_t v66 = v64 - 24 * (v65 >> 1);
                uint64_t v64 = std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,_HDWrappedSource *,_HDWrappedSource *,_HDWrappedSource *,0>((uint64_t *)(v54 + 24 * v35), (uint64_t *)v64, v66);
                v135 = (void **)v66;
                uint64_t v136 = v64;
                id v17 = (HKSource *)v127;
              }
            }
            *(void *)uint64_t v64 = v17;
            char v80 = v129;
            *(CFAbsoluteTime *)(v64 + 8) = Current;
            *(unsigned char *)(v64 + 16) = v80;
            uint64_t v81 = v135;
            uint64_t v82 = v136 + 24;
            v136 += 24;
            uint64_t v83 = v130;
            if ((void)v130 != v36)
            {
              unint64_t v84 = v36;
              do
              {
                uint64_t v85 = *(void **)(v84 - 24);
                v84 -= 24;
                *(void *)unint64_t v84 = 0;
                *(v81 - 3) = v85;
                v81 -= 3;
                v86 = *(void **)(v84 + 8);
                *((unsigned char *)v81 + 16) = *(unsigned char *)(v84 + 16);
                v81[1] = v86;
              }
              while (v84 != v83);
              uint64_t v82 = v136;
            }
            v135 = v81;
            uint64_t v87 = *((void *)&v130 + 1);
            if (*((void *)&v130 + 1) != v36)
            {
              do
              {
                uint64_t v88 = *(void *)v36;
                *(void *)unint64_t v36 = 0;
                *(void *)uint64_t v82 = v88;
                uint64_t v89 = *(void *)(v36 + 8);
                *(unsigned char *)(v82 + 16) = *(unsigned char *)(v36 + 16);
                *(void *)(v82 + 8) = v89;
                v82 += 24;
                v36 += 24;
              }
              while (v36 != v87);
              uint64_t v81 = v135;
              unint64_t v36 = *((void *)&v130 + 1);
            }
            id v90 = (void **)v130;
            id v91 = (void **)v131;
            *(void *)&long long v130 = v81;
            *((void *)&v130 + 1) = v82;
            unint64_t v131 = (unint64_t)v137;
            uint64_t v136 = v36;
            v137 = v91;
            v134 = (uint8_t *)v90;
            v135 = v90;
            std::__split_buffer<_HDWrappedSource>::~__split_buffer((uint64_t)&v134);
          }
          else if ((HKSource **)v36 == v21)
          {
            *unint64_t v21 = v17;
            uint64_t v62 = &v23[3 * v35];
            CFAbsoluteTime v63 = Current;
            *((unsigned char *)v62 + 16) = v129;
            *((CFAbsoluteTime *)v62 + 1) = v63;
            *((void *)&v130 + 1) = v21 + 3;
          }
          else
          {
            uint64_t v37 = v21 - 3;
            unint64_t v38 = (unint64_t)v21;
            uint64_t v39 = v21 - 3;
            if ((unint64_t)v21 >= 0x18)
            {
              do
              {
                id v40 = *v39;
                *uint64_t v39 = 0;
                *(void *)unint64_t v38 = v40;
                uint64_t v41 = v39[1];
                *(unsigned char *)(v38 + 16) = *((unsigned char *)v39 + 16);
                *(void *)(v38 + 8) = v41;
                v38 += 24;
                v39 += 3;
              }
              while (v39 < v21);
            }
            *((void *)&v130 + 1) = v38;
            if (v21 != (HKSource **)(v36 + 24))
            {
              unint64_t v42 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v21 - v36 - 24) >> 3);
              uint64_t v43 = (uint64_t)&v23[3 * v35 - 3];
              uint64_t v44 = 24 * v42;
              do
              {
                id v45 = *(HKSource **)(v43 + v44);
                *(void *)(v43 + v44) = 0;
                id v46 = *v37;
                *uint64_t v37 = v45;

                uint64_t v47 = *(HKSource **)(v43 + v44 + 8);
                *((unsigned char *)v37 + 16) = *(unsigned char *)(v43 + v44 + 16);
                v37[1] = v47;
                v37 -= 3;
                v44 -= 24;
              }
              while (v44);
              unint64_t v38 = *((void *)&v130 + 1);
            }
            BOOL v49 = v36 <= (unint64_t)&v127 && v38 > (unint64_t)&v127;
            objc_storeStrong((id *)&v23[3 * v35], v127);
            uint64_t v50 = &v127 + 3 * v49;
            uint64_t v51 = (HKSource *)v50[1];
            v52 = &v23[3 * v35];
            *((unsigned char *)v52 + 16) = *((unsigned char *)v50 + 16);
            v52[1] = v51;
          }

LABEL_105:
          long long v92 = v120;
          _HKInitializeLogging();
          long long v93 = (void *)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
          {
            long long v94 = v93;
            if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v105 = [v116 bundleIdentifier];
              *(_DWORD *)long long buf = 138412546;
              *(void *)&uint8_t buf[4] = v105;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v117;
              _os_log_debug_impl(&dword_1BCB7D000, v94, OS_LOG_TYPE_DEBUG, "Will add ordered source %@ for type %@", buf, 0x16u);
            }
            long long v92 = v120;
          }
          long long v95 = [_HDCachedSourceOrder alloc];
          memset(v125, 0, sizeof(v125));
          std::vector<_HDWrappedSource>::__init_with_size[abi:ne180100]<_HDWrappedSource*,_HDWrappedSource*>((char *)v125, v130, *((uint64_t *)&v130 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v130 + 1) - v130) >> 3));
          long long v96 = -[_HDCachedSourceOrder initWithSources:userOrdered:isDefaultOrder:](v95, v125, v92[8], 0);
          *(void *)long long buf = v125;
          std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          v97 = v96;
          id v98 = v117;
          id v99 = objc_loadWeakRetained((id *)(v9 + 8));
          v100 = [v99 database];
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __54__HDSourceOrderManager__updateSourceOrder_type_error___block_invoke;
          long long v141 = (void **)&unk_1E62FC928;
          v142 = (void *)v9;
          int64x2_t v101 = v97;
          id v143 = v101;
          id v102 = v98;
          id v144 = v102;
          BOOL v103 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v100 error:a3 block:buf];

          BOOL v133 = v103;
          goto LABEL_110;
        }
        if (objc_msgSend(v19, "hk_isDatabaseAccessibilityError"))
        {
          _HKInitializeLogging();
          uint64_t v25 = (void *)*MEMORY[0x1E4F29F18];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
          {
LABEL_36:
            id v34 = v19;
            id v19 = v34;
            if (v34)
            {
              if (a3) {
                *a3 = v34;
              }
              else {
                _HKLogDroppedError();
              }
            }

            BOOL v133 = 0;
LABEL_110:
            *(void *)long long buf = &v130;
            std::vector<_HDWrappedSource>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
            goto LABEL_111;
          }
          uint64_t v26 = v25;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            int64x2_t v27 = [(HKSource *)v17 bundleIdentifier];
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v27;
            *(_WORD *)&unsigned char buf[12] = 2114;
            *(void *)&buf[14] = v19;
            _os_log_debug_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEBUG, "Failed to update ordered source IDs for bundle identifier %{public}@: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v26 = (id)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v106 = [(HKSource *)v17 bundleIdentifier];
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v106;
            *(_WORD *)&unsigned char buf[12] = 2114;
            *(void *)&buf[14] = v19;
            _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "Failed to update ordered source IDs for bundle identifier %{public}@: %{public}@", buf, 0x16u);
          }
        }

        goto LABEL_36;
      }
      if (objc_msgSend(v15, "hk_isDatabaseAccessibilityError"))
      {
        _HKInitializeLogging();
        uint64_t v24 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&unsigned char buf[12] = 2114;
          *(void *)&buf[14] = v16;
          _os_log_debug_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEBUG, "Failed to fetch ordered sources for type %@: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v32 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&unsigned char buf[12] = 2114;
          *(void *)&buf[14] = v16;
          _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "Failed to fetch ordered sources for type %@: %{public}@", buf, 0x16u);
        }
      }
      id v33 = v16;
      id v19 = v33;
      if (v33)
      {
        if (a3) {
          *a3 = v33;
        }
        else {
          _HKLogDroppedError();
        }
      }

      BOOL v133 = 0;
LABEL_111:

      BOOL v104 = v133;
      if (!v104) {
        goto LABEL_116;
      }
      ++v7;
      a1 = v110;
    }
    while (v7 != v111);
    uint64_t v6 = [obj countByEnumeratingWithState:&v121 objects:v139 count:16];
    if (v6) {
      continue;
    }
    break;
  }
  unsigned int v108 = 1;
LABEL_117:

  return v108;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceOrdersForTypeCache, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end