@interface HDDeviceManager
- (BOOL)deleteDevice:(id)a3 error:(id *)a4;
- (HDDeviceManager)init;
- (HDDeviceManager)initWithProfile:(id)a3;
- (id)_noneDevice;
- (id)allDevicesWithError:(id *)a3;
- (id)currentDeviceEntityWithError:(id *)a3;
- (id)deviceEntitiesForDevice:(id)a3 error:(id *)a4;
- (id)deviceEntitiesWithProperty:(id)a3 matchingValues:(id)a4 error:(id *)a5;
- (id)deviceEntityForDevice:(id)a3 error:(id *)a4;
- (id)deviceEntityForNoDeviceWithError:(id *)a3;
- (id)deviceForPersistentID:(id)a3 error:(id *)a4;
- (id)devicesWithProperty:(id)a3 matchingValues:(id)a4 error:(id *)a5;
@end

@implementation HDDeviceManager

- (id)currentDeviceEntityWithError:(id *)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__150;
  v15 = __Block_byref_object_dispose__150;
  id v16 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = [WeakRetained database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__HDDeviceManager_currentDeviceEntityWithError___block_invoke;
  v10[3] = &unk_1E62F9108;
  v10[4] = self;
  v10[5] = &v11;
  LODWORD(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:a3 block:v10];

  if (a3) {
    v7 = (void *)v12[5];
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)deviceEntityForDevice:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__150;
    v22 = __Block_byref_object_dispose__150;
    id v23 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v9 = [WeakRetained database];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__HDDeviceManager_deviceEntityForDevice_error___block_invoke;
    v15[3] = &unk_1E62F3DD8;
    v17 = &v18;
    v15[4] = self;
    id v16 = v7;
    BOOL v10 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v9 error:a4 block:v15];

    if (v10) {
      uint64_t v11 = (void *)v19[5];
    }
    else {
      uint64_t v11 = 0;
    }
    id v13 = v11;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForNilArgument:class:selector:", @"device", objc_opt_class(), a2);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (a4) {
        *a4 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v13 = 0;
  }

  return v13;
}

BOOL __47__HDDeviceManager_deviceEntityForDevice_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  v6 = (void *)a1[5];
  id v7 = *(void **)(a1[4] + 24);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__HDDeviceManager_deviceEntityForDevice_error___block_invoke_2;
  v15[3] = &unk_1E6307318;
  id v8 = v6;
  uint64_t v9 = a1[4];
  id v16 = v8;
  uint64_t v17 = v9;
  uint64_t v10 = [v7 fetchObjectForKey:v8 transaction:a2 error:a3 faultHandler:v15];
  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  BOOL v13 = *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
  return v13;
}

- (id)deviceEntityForNoDeviceWithError:(id *)a3
{
  if (self && (id v5 = objc_getProperty(self, a2, 32, 1)) != 0)
  {
    v6 = v5;
    id v7 = -[HDSQLiteEntity initWithPersistentID:]([HDDeviceEntity alloc], "initWithPersistentID:", [v5 longLongValue]);
  }
  else
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__150;
    uint64_t v18 = __Block_byref_object_dispose__150;
    id v19 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v9 = [WeakRetained database];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__HDDeviceManager_deviceEntityForNoDeviceWithError___block_invoke;
    v13[3] = &unk_1E62F9108;
    v13[4] = self;
    v13[5] = &v14;
    BOOL v10 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v9 error:a3 block:v13];

    if (v10) {
      uint64_t v11 = (void *)v15[5];
    }
    else {
      uint64_t v11 = 0;
    }
    id v7 = v11;
    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

- (id)deviceForPersistentID:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7
    && (!self ? (id Property = 0) : (id Property = objc_getProperty(self, v6, 32, 1)),
        ([v7 isEqual:Property] & 1) == 0))
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__150;
    id v23 = __Block_byref_object_dispose__150;
    id v24 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    BOOL v10 = [WeakRetained database];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__HDDeviceManager_deviceForPersistentID_error___block_invoke;
    v16[3] = &unk_1E62F3DD8;
    uint64_t v18 = &v19;
    v16[4] = self;
    id v11 = v7;
    id v17 = v11;
    +[HDHealthEntity performReadTransactionWithHealthDatabase:v10 error:a4 block:v16];

    id v12 = (void *)v20[5];
    BOOL v13 = -[HDDeviceManager _noneDevice](self);
    LODWORD(v12) = [v12 isEqual:v13];

    if (v12)
    {
      if (self)
      {
        objc_setProperty_atomic_copy(self, v14, v11, 32);
        self = 0;
      }
    }
    else
    {
      self = (HDDeviceManager *)(id)v20[5];
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    self = 0;
  }

  return self;
}

uint64_t __47__HDDeviceManager_deviceForPersistentID_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  v6 = (void *)a1[5];
  id v7 = *(void **)(a1[4] + 16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__HDDeviceManager_deviceForPersistentID_error___block_invoke_2;
  v14[3] = &unk_1E63072F0;
  id v8 = v6;
  uint64_t v9 = a1[4];
  id v15 = v8;
  uint64_t v16 = v9;
  uint64_t v10 = [v7 fetchObjectForKey:v8 transaction:a2 error:a3 faultHandler:v14];
  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  return 1;
}

- (id)_noneDevice
{
  if (a1)
  {
    if (qword_1EBA18E00 != -1) {
      dispatch_once(&qword_1EBA18E00, &__block_literal_global_180);
    }
    a1 = (id)_MergedGlobals_220;
    uint64_t v1 = vars8;
  }
  return a1;
}

id __47__HDDeviceManager_deviceForPersistentID_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = +[HDSQLiteEntity entityWithPersistentID:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v7 = [WeakRetained database];
  id v8 = [v5 deviceInHealthDatabase:v7 error:a3];

  return v8;
}

id __47__HDDeviceManager_deviceEntityForDevice_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  uint64_t v7 = [WeakRetained currentSyncIdentityPersistentID];
  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  uint64_t v9 = [v8 database];
  uint64_t v10 = +[HDDeviceEntity deviceEntityWithDevice:v5 syncIdentity:v7 healthDatabase:v9 error:a3];

  return v10;
}

- (HDDeviceManager)initWithProfile:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDDeviceManager.m", 46, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)HDDeviceManager;
  v6 = [(HDDeviceManager *)&v18 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_profile, v5);
    id v8 = [HDDatabaseValueCache alloc];
    uint64_t v9 = [(HDDeviceManager *)v7 hk_classNameWithTag:@"devices"];
    uint64_t v10 = [(HDDatabaseValueCache *)v8 initWithName:v9];
    devicesByPersistentID = v7->_devicesByPersistentID;
    v7->_devicesByPersistentID = (HDDatabaseValueCache *)v10;

    id v12 = [HDDatabaseValueCache alloc];
    BOOL v13 = [(HDDeviceManager *)v7 hk_classNameWithTag:@"entities"];
    uint64_t v14 = [(HDDatabaseValueCache *)v12 initWithName:v13];
    deviceEntitiesByDevice = v7->_deviceEntitiesByDevice;
    v7->_deviceEntitiesByDevice = (HDDatabaseValueCache *)v14;
  }
  return v7;
}

- (HDDeviceManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

void *__52__HDDeviceManager_deviceEntityForNoDeviceWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = -[HDDeviceManager _noneDevice](*(id *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v7 = [WeakRetained currentSyncIdentityPersistentID];
  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v9 = [v8 database];
  uint64_t v10 = +[HDDeviceEntity deviceEntityWithDevice:v5 syncIdentity:v7 healthDatabase:v9 error:a3];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  result = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    id v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(result, "persistentID"));
    uint64_t v16 = *(void **)(a1 + 32);
    if (v16) {
      objc_setProperty_atomic_copy(v16, v14, v15, 32);
    }

    return (void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0);
  }
  return result;
}

BOOL __48__HDDeviceManager_currentDeviceEntityWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [MEMORY[0x1E4F2AEF8] localDevice];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v7 = [WeakRetained currentSyncIdentityPersistentID];
  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v9 = [v8 database];
  uint64_t v10 = +[HDDeviceEntity deviceEntityWithDevice:v5 syncIdentity:v7 healthDatabase:v9 error:a3];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (id)deviceEntitiesForDevice:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v9 = [WeakRetained database];
    uint64_t v10 = +[HDDeviceEntity deviceEntitiesWithDevice:v7 healthDatabase:v9 error:a4];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForNilArgument:class:selector:", @"device", objc_opt_class(), a2);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v12;
    if (v12)
    {
      if (a4)
      {
        id v9 = v12;
        uint64_t v10 = 0;
        *a4 = v9;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v10 = 0;
      }
      id WeakRetained = v9;
    }
    else
    {
      id WeakRetained = 0;
      uint64_t v10 = 0;
    }
  }

  return v10;
}

- (id)deviceEntitiesWithProperty:(id)a3 matchingValues:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9)
  {
    if (![v10 count])
    {
      uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F299D0]];

      uint64_t v11 = (void *)v12;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v14 = [WeakRetained database];
    id v15 = +[HDDeviceEntity deviceEntitiesWithProperty:v9 matchingValues:v11 healthDatabase:v14 error:a5];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForNilArgument:class:selector:", @"property", objc_opt_class(), a2);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v17;
    if (v17)
    {
      if (a5)
      {
        id v14 = v17;
        id v15 = 0;
        *a5 = v14;
      }
      else
      {
        _HKLogDroppedError();
        id v15 = 0;
      }
      id WeakRetained = v14;
    }
    else
    {
      id WeakRetained = 0;
      id v15 = 0;
    }
  }

  return v15;
}

- (id)devicesWithProperty:(id)a3 matchingValues:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__150;
  v25 = __Block_byref_object_dispose__150;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v11 = [WeakRetained database];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__HDDeviceManager_devicesWithProperty_matchingValues_error___block_invoke;
  v17[3] = &unk_1E6307340;
  v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  uint64_t v20 = &v21;
  LODWORD(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v11 error:a5 block:v17];

  if (a5) {
    id v14 = (void *)v22[5];
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  _Block_object_dispose(&v21, 8);

  return v15;
}

BOOL __60__HDDeviceManager_devicesWithProperty_matchingValues_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1 + 32) deviceEntitiesWithProperty:*(void *)(a1 + 40) matchingValues:*(void *)(a1 + 48) error:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        id v12 = [WeakRetained database];
        id v13 = [v10 deviceInHealthDatabase:v12 error:a3];

        if (v13) {
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v13];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v5 != 0;
}

void __30__HDDeviceManager__noneDevice__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2AEF8]), "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", @"__NONE__", 0);
  uint64_t v1 = (void *)_MergedGlobals_220;
  _MergedGlobals_220 = v0;
}

- (id)allDevicesWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v7 = [WeakRetained database];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __39__HDDeviceManager_allDevicesWithError___block_invoke;
  id v14 = &unk_1E62F2AE0;
  long long v15 = self;
  id v8 = v5;
  id v16 = v8;
  LODWORD(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v7 error:a3 block:&v11];

  if (a3)
  {
    uint64_t v9 = objc_msgSend(v8, "allObjects", v11, v12, v13, v14, v15);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __39__HDDeviceManager_allDevicesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = [v4 databaseForEntityClass:objc_opt_class()];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v38[0] = *MEMORY[0x1E4F65C70];
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  id v8 = +[HDSQLiteEntity queryWithDatabase:v5 predicate:0];
  id v36 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __39__HDDeviceManager_allDevicesWithError___block_invoke_2;
  v34[3] = &unk_1E62F4CC0;
  id v9 = v6;
  id v35 = v9;
  char v10 = [v8 enumeratePersistentIDsAndProperties:v7 error:&v36 enumerationHandler:v34];
  id v11 = v36;
  id v12 = v11;
  if (v10)
  {
    v27 = v7;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      v25 = v5;
      id v26 = v4;
      uint64_t v16 = *(void *)v31;
      while (2)
      {
        uint64_t v17 = 0;
        long long v18 = v12;
        do
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * v17);
          uint64_t v20 = *(void **)(a1 + 32);
          id v29 = v18;
          uint64_t v21 = [v20 deviceForPersistentID:v19 error:&v29];
          id v12 = v29;

          if (v21)
          {
            [*(id *)(a1 + 40) addObject:v21];
          }
          else if (v12)
          {
            if (a3)
            {
              id v12 = v12;
              uint64_t v22 = 0;
              *a3 = v12;
            }
            else
            {
              _HKLogDroppedError();
              uint64_t v22 = 0;
            }
            goto LABEL_23;
          }

          ++v17;
          long long v18 = v12;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v37 count:16];
        if (v15) {
          continue;
        }
        break;
      }
      uint64_t v22 = 1;
LABEL_23:
      id v5 = v25;
      id v4 = v26;
    }
    else
    {
      uint64_t v22 = 1;
    }
    uint64_t v7 = v27;
  }
  else
  {
    id v23 = v11;
    id v13 = v23;
    if (v23)
    {
      if (a3)
      {
        id v13 = v23;
        uint64_t v22 = 0;
        *a3 = v13;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v22 = 0;
      }
      id v12 = v13;
    }
    else
    {
      id v12 = 0;
      uint64_t v22 = 0;
    }
  }

  return v22;
}

uint64_t __39__HDDeviceManager_allDevicesWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsInt64();
  v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithLongLong:v2];
  [v3 addObject:v4];

  return 1;
}

- (BOOL)deleteDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__HDDeviceManager_deleteDevice_error___block_invoke;
  v11[3] = &unk_1E62F6130;
  id v12 = v6;
  id v9 = v6;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v8 error:a4 block:v11];

  return (char)a4;
}

uint64_t __38__HDDeviceManager_deleteDevice_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[HDDeviceEntity deviceEntityWithDevice:*(void *)(a1 + 32) transaction:v5 error:a3];
  if (v6)
  {
    uint64_t v7 = [v5 databaseForEntityClass:objc_opt_class()];
    uint64_t v8 = [v6 deleteFromDatabase:v7 error:a3];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noneDeviceID, 0);
  objc_storeStrong((id *)&self->_deviceEntitiesByDevice, 0);
  objc_storeStrong((id *)&self->_devicesByPersistentID, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end