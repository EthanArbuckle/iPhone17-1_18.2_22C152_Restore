@interface HDFeatureSettingsManager
- (BOOL)_performWriteTransactionAndNotifyObserversWithError:(uint64_t)a1 suppressNotificationsToObserver:(uint64_t)a2 block:(void *)a3 inaccessibilityHandler:(void *)a4;
- (BOOL)removeFeatureSettingsValueForKey:(id)a3 featureIdentifier:(id)a4 error:(id *)a5;
- (BOOL)resetFeatureSettingsForFeatureIdentifier:(id)a3 suppressNotificationsToObserver:(id)a4 error:(id *)a5;
- (BOOL)setFeatureSettingsData:(id)a3 forKey:(id)a4 featureIdentifier:(id)a5 error:(id *)a6;
- (BOOL)setFeatureSettingsNumber:(id)a3 forKey:(id)a4 featureIdentifier:(id)a5 suppressNotificationsToObserver:(id)a6 error:(id *)a7;
- (BOOL)setFeatureSettingsString:(id)a3 forKey:(id)a4 featureIdentifier:(id)a5 error:(id *)a6;
- (BOOL)setFeatureSettingsValues:(id)a3 featureIdentifier:(id)a4 suppressNotificationsToObserver:(id)a5 error:(id *)a6;
- (HDFeatureSettingsManager)initWithProfile:(id)a3;
- (id)_featureSettingsKeyValueDomainWithFeatureIdentifier:(id *)a1;
- (id)featureSettingsForFeatureIdentifier:(id)a3 error:(id *)a4;
- (uint64_t)_setFeatureSettingsValue:(void *)a3 forKey:(void *)a4 keyValueDomain:(void *)a5 error:;
- (void)_lock_unregisterObserver:(void *)a3 featureIdentifier:;
- (void)_notifyObserversOfFeatureIdentifier:(void *)a3 excludingObserver:;
- (void)_settingsDidSyncNotification:(id)a3;
- (void)dealloc;
- (void)registerObserver:(id)a3 featureIdentifier:(id)a4 queue:(id)a5;
- (void)unregisterObserver:(id)a3;
- (void)unregisterObserver:(id)a3 featureIdentifier:(id)a4;
@end

@implementation HDFeatureSettingsManager

- (HDFeatureSettingsManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDFeatureSettingsManager;
  v5 = [(HDFeatureSettingsManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_lock._os_unfair_lock_opaque = 0;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersByFeatureIdentifier = v6->_observersByFeatureIdentifier;
    v6->_observersByFeatureIdentifier = v9;

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v6 selector:sel__settingsDidSyncNotification_ name:@"HDUnprotectedFeatureSettingsSyncEntityDidSync" object:v4];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HDFeatureSettingsManager;
  [(HDFeatureSettingsManager *)&v4 dealloc];
}

- (id)featureSettingsForFeatureIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v6);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__161;
  v30 = __Block_byref_object_dispose__161;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__161;
  v24 = __Block_byref_object_dispose__161;
  id v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HDFeatureSettingsManager_featureSettingsForFeatureIdentifier_error___block_invoke;
  block[3] = &unk_1E62F9270;
  v18 = &v26;
  id v9 = v7;
  id v17 = v9;
  v19 = &v20;
  dispatch_sync(queue, block);
  v10 = (void *)v21[5];
  if (v10)
  {
    id v11 = v10;
    v12 = v11;
    if (a4) {
      *a4 = v11;
    }
    else {
      _HKLogDroppedError();
    }

    v14 = 0;
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F2B058]);
    v14 = (void *)[v13 initWithDictionary:v27[5]];
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (id)_featureSettingsKeyValueDomainWithFeatureIdentifier:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    objc_super v4 = [HDKeyValueDomain alloc];
    id WeakRetained = objc_loadWeakRetained(v2 + 1);
    v2 = [(HDKeyValueDomain *)v4 initWithCategory:4 domainName:v3 profile:WeakRetained];
  }

  return v2;
}

void __70__HDFeatureSettingsManager_featureSettingsForFeatureIdentifier_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 allValuesWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)setFeatureSettingsValues:(id)a3 featureIdentifier:(id)a4 suppressNotificationsToObserver:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v11);
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__161;
  v35 = __Block_byref_object_dispose__161;
  id v36 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__HDFeatureSettingsManager_setFeatureSettingsValues_featureIdentifier_suppressNotificationsToObserver_error___block_invoke;
  block[3] = &unk_1E6308980;
  v29 = &v37;
  v30 = &v31;
  void block[4] = self;
  id v15 = v12;
  id v25 = v15;
  id v16 = v13;
  id v26 = v16;
  id v17 = v10;
  id v27 = v17;
  id v18 = v11;
  id v28 = v18;
  dispatch_sync(queue, block);
  v19 = (void *)v32[5];
  if (v19)
  {
    id v20 = v19;
    v21 = v20;
    if (a6) {
      *a6 = v20;
    }
    else {
      _HKLogDroppedError();
    }
  }
  char v22 = *((unsigned char *)v38 + 24);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

void __109__HDFeatureSettingsManager_setFeatureSettingsValues_featureIdentifier_suppressNotificationsToObserver_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 80) + 8);
  id v14 = *(id *)(v2 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __109__HDFeatureSettingsManager_setFeatureSettingsValues_featureIdentifier_suppressNotificationsToObserver_error___block_invoke_2;
  v9[3] = &unk_1E6308958;
  id v10 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v6;
  long long v8 = *(_OWORD *)(a1 + 64);
  id v7 = (id)v8;
  long long v13 = v8;
  LOBYTE(v3) = -[HDFeatureSettingsManager _performWriteTransactionAndNotifyObserversWithError:suppressNotificationsToObserver:block:inaccessibilityHandler:](v3, (uint64_t)&v14, v4, v9);
  objc_storeStrong((id *)(v2 + 40), v14);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3;
}

id __109__HDFeatureSettingsManager_setFeatureSettingsValues_featureIdentifier_suppressNotificationsToObserver_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v51 = 0;
  id v7 = [v6 allValuesWithError:&v51];
  id v8 = v51;
  if (v8)
  {
    id v9 = v8;
    if (a3)
    {
      id v9 = v8;
      id v10 = 0;
      *a3 = v9;
    }
    else
    {
      _HKLogDroppedError();
      id v10 = 0;
    }
    goto LABEL_38;
  }
  uint64_t v39 = a3;
  id v41 = v5;
  id v11 = [*(id *)(a1 + 40) keyValueStorage];
  char v40 = v7;
  uint64_t v12 = (void *)[v7 mutableCopy];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v52 count:16];
  v42 = v13;
  v43 = v12;
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = 0;
    uint64_t v17 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v48 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v20 = [v12 objectForKeyedSubscript:v19];
        v21 = [v13 objectForKeyedSubscript:v19];
        char v22 = v21;
        if (v20)
        {
          if ([v21 isEqual:v20])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
          }
          else
          {
            uint64_t v27 = *(void *)(a1 + 48);
            id v28 = *(void **)(a1 + 32);
            id v46 = v16;
            char v29 = -[HDFeatureSettingsManager _setFeatureSettingsValue:forKey:keyValueDomain:error:](v27, v22, v19, v28, &v46);
            id v30 = v46;

            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v29;
            id v16 = v30;
            id v13 = v42;
            uint64_t v12 = v43;
          }
          [v12 removeObjectForKey:v19];
        }
        else
        {
          uint64_t v23 = *(void *)(a1 + 48);
          v24 = *(void **)(a1 + 32);
          id v45 = v16;
          char v25 = -[HDFeatureSettingsManager _setFeatureSettingsValue:forKey:keyValueDomain:error:](v23, v22, v19, v24, &v45);
          id v26 = v45;

          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v25;
          id v16 = v26;
          id v13 = v42;
          uint64_t v12 = v43;
        }
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
        {
          id v31 = v16;
          id v9 = v31;
          id v7 = v40;
          id v5 = v41;
          if (v31)
          {
            if (v39) {
              *uint64_t v39 = v31;
            }
            else {
              _HKLogDroppedError();
            }
          }

          id v36 = v42;
          id v10 = 0;
          goto LABEL_37;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v16 = 0;
  }

  if (![v12 count])
  {
    id v9 = v16;
    id v7 = v40;
    id v5 = v41;
    goto LABEL_28;
  }
  id v32 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v33 = [v12 allKeys];
  v34 = (void *)[v32 initWithArray:v33];

  v35 = *(void **)(a1 + 32);
  id v44 = v16;
  LOBYTE(v32) = [v35 removeValuesForKeys:v34 error:&v44];
  id v9 = v44;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (_BYTE)v32;
  id v7 = v40;
  id v5 = v41;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {

LABEL_28:
    id v10 = *(id *)(a1 + 56);
    goto LABEL_36;
  }
  id v37 = v9;
  id v9 = v37;
  if (v37)
  {
    if (v39) {
      *uint64_t v39 = v37;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v10 = 0;
LABEL_36:
  id v36 = v42;
LABEL_37:

LABEL_38:

  return v10;
}

- (uint64_t)_setFeatureSettingsValue:(void *)a3 forKey:(void *)a4 keyValueDomain:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = 0;
      a1 = [v11 setData:v9 forKey:v10 error:&v17];
      uint64_t v12 = v17;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = 0;
        a1 = [v11 setNumber:v9 forKey:v10 error:&v16];
        uint64_t v12 = v16;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__setFeatureSettingsValue_forKey_keyValueDomain_error_, @"Value (%@) has an invalid type, expected NSData, NSNumber or NSString."", v9);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          a1 = 0;
          if (v13)
          {
LABEL_9:
            if (a5) {
              *a5 = v13;
            }
            else {
              _HKLogDroppedError();
            }
          }
LABEL_12:

          goto LABEL_13;
        }
        uint64_t v15 = 0;
        a1 = [v11 setString:v9 forKey:v10 error:&v15];
        uint64_t v12 = v15;
      }
    }
    id v13 = v12;
    if (v13) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
LABEL_13:

  return a1;
}

- (BOOL)_performWriteTransactionAndNotifyObserversWithError:(uint64_t)a1 suppressNotificationsToObserver:(uint64_t)a2 block:(void *)a3 inaccessibilityHandler:(void *)a4
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__161;
    v17[4] = __Block_byref_object_dispose__161;
    id v18 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v10 = [WeakRetained database];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __141__HDFeatureSettingsManager__performWriteTransactionAndNotifyObserversWithError_suppressNotificationsToObserver_block_inaccessibilityHandler___block_invoke;
    v13[3] = &unk_1E6308A20;
    id v16 = v17;
    id v15 = v8;
    v13[4] = a1;
    id v14 = v7;
    BOOL v11 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v10 error:a2 block:v13 inaccessibilityHandler:0];

    _Block_object_dispose(v17, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)setFeatureSettingsData:(id)a3 forKey:(id)a4 featureIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v12);
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__161;
  uint64_t v33 = __Block_byref_object_dispose__161;
  id v34 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__HDFeatureSettingsManager_setFeatureSettingsData_forKey_featureIdentifier_error___block_invoke;
  block[3] = &unk_1E6301AC8;
  uint64_t v27 = &v35;
  id v15 = v13;
  id v24 = v15;
  id v16 = v10;
  id v25 = v16;
  id v17 = v11;
  id v26 = v17;
  id v28 = &v29;
  dispatch_sync(queue, block);
  id v18 = (void *)v30[5];
  if (v18)
  {
    id v19 = v18;
    id v20 = v19;
    if (a6) {
      *a6 = v19;
    }
    else {
      _HKLogDroppedError();
    }
  }
  if (*((unsigned char *)v36 + 24))
  {
    -[HDFeatureSettingsManager _notifyObserversOfFeatureIdentifier:excludingObserver:]((uint64_t)self, v12, 0);
    BOOL v21 = *((unsigned char *)v36 + 24) != 0;
  }
  else
  {
    BOOL v21 = 0;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v21;
}

void __82__HDFeatureSettingsManager_setFeatureSettingsData_forKey_featureIdentifier_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [v2 setData:v3 forKey:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

- (void)_notifyObserversOfFeatureIdentifier:(void *)a3 excludingObserver:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__HDFeatureSettingsManager__notifyObserversOfFeatureIdentifier_excludingObserver___block_invoke;
    v8[3] = &unk_1E6308A48;
    id v9 = v6;
    uint64_t v10 = a1;
    id v11 = v5;
    [v7 notifyObservers:v8];

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
}

- (BOOL)setFeatureSettingsNumber:(id)a3 forKey:(id)a4 featureIdentifier:(id)a5 suppressNotificationsToObserver:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v14);
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__161;
  id v36 = __Block_byref_object_dispose__161;
  id v37 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__HDFeatureSettingsManager_setFeatureSettingsNumber_forKey_featureIdentifier_suppressNotificationsToObserver_error___block_invoke;
  block[3] = &unk_1E6301AC8;
  id v30 = &v38;
  id v18 = v16;
  id v27 = v18;
  id v19 = v12;
  id v28 = v19;
  id v20 = v13;
  id v29 = v20;
  uint64_t v31 = &v32;
  dispatch_sync(queue, block);
  BOOL v21 = (void *)v33[5];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = v22;
    if (a7) {
      *a7 = v22;
    }
    else {
      _HKLogDroppedError();
    }
  }
  if (*((unsigned char *)v39 + 24))
  {
    -[HDFeatureSettingsManager _notifyObserversOfFeatureIdentifier:excludingObserver:]((uint64_t)self, v14, v15);
    BOOL v24 = *((unsigned char *)v39 + 24) != 0;
  }
  else
  {
    BOOL v24 = 0;
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v24;
}

void __116__HDFeatureSettingsManager_setFeatureSettingsNumber_forKey_featureIdentifier_suppressNotificationsToObserver_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [v2 setNumber:v3 forKey:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

- (BOOL)setFeatureSettingsString:(id)a3 forKey:(id)a4 featureIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v12);
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__161;
  uint64_t v33 = __Block_byref_object_dispose__161;
  id v34 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__HDFeatureSettingsManager_setFeatureSettingsString_forKey_featureIdentifier_error___block_invoke;
  block[3] = &unk_1E6301AC8;
  id v27 = &v35;
  id v15 = v13;
  id v24 = v15;
  id v16 = v10;
  id v25 = v16;
  id v17 = v11;
  id v26 = v17;
  id v28 = &v29;
  dispatch_sync(queue, block);
  id v18 = (void *)v30[5];
  if (v18)
  {
    id v19 = v18;
    id v20 = v19;
    if (a6) {
      *a6 = v19;
    }
    else {
      _HKLogDroppedError();
    }
  }
  if (*((unsigned char *)v36 + 24))
  {
    -[HDFeatureSettingsManager _notifyObserversOfFeatureIdentifier:excludingObserver:]((uint64_t)self, v12, 0);
    BOOL v21 = *((unsigned char *)v36 + 24) != 0;
  }
  else
  {
    BOOL v21 = 0;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v21;
}

void __84__HDFeatureSettingsManager_setFeatureSettingsString_forKey_featureIdentifier_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [v2 setString:v3 forKey:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

- (BOOL)removeFeatureSettingsValueForKey:(id)a3 featureIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v9);
  id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__161;
  uint64_t v29 = __Block_byref_object_dispose__161;
  id v30 = 0;
  queue = self->_queue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__HDFeatureSettingsManager_removeFeatureSettingsValueForKey_featureIdentifier_error___block_invoke;
  v20[3] = &unk_1E62F93D8;
  uint64_t v23 = &v31;
  id v13 = v10;
  id v21 = v13;
  id v14 = v11;
  id v22 = v14;
  id v24 = &v25;
  dispatch_sync(queue, v20);
  id v15 = (void *)v26[5];
  if (v15)
  {
    id v16 = v15;
    id v17 = v16;
    if (a5) {
      *a5 = v16;
    }
    else {
      _HKLogDroppedError();
    }
  }
  if (*((unsigned char *)v32 + 24))
  {
    -[HDFeatureSettingsManager _notifyObserversOfFeatureIdentifier:excludingObserver:]((uint64_t)self, v9, 0);
    BOOL v18 = *((unsigned char *)v32 + 24) != 0;
  }
  else
  {
    BOOL v18 = 0;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v18;
}

void __85__HDFeatureSettingsManager_removeFeatureSettingsValueForKey_featureIdentifier_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 removeValuesForKeys:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)resetFeatureSettingsForFeatureIdentifier:(id)a3 suppressNotificationsToObserver:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v8);
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__161;
  id v30 = __Block_byref_object_dispose__161;
  id v31 = 0;
  queue = self->_queue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __107__HDFeatureSettingsManager_resetFeatureSettingsForFeatureIdentifier_suppressNotificationsToObserver_error___block_invoke;
  v20[3] = &unk_1E63089D0;
  id v24 = &v32;
  uint64_t v25 = &v26;
  void v20[4] = self;
  id v12 = v9;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  id v14 = v8;
  id v23 = v14;
  dispatch_sync(queue, v20);
  id v15 = (void *)v27[5];
  if (v15)
  {
    id v16 = v15;
    id v17 = v16;
    if (a5) {
      *a5 = v16;
    }
    else {
      _HKLogDroppedError();
    }
  }
  char v18 = *((unsigned char *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

void __107__HDFeatureSettingsManager_resetFeatureSettingsForFeatureIdentifier_suppressNotificationsToObserver_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 72) + 8);
  id v9 = *(id *)(v2 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __107__HDFeatureSettingsManager_resetFeatureSettingsForFeatureIdentifier_suppressNotificationsToObserver_error___block_invoke_2;
  v5[3] = &unk_1E63089A8;
  uint64_t v8 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  LOBYTE(v3) = -[HDFeatureSettingsManager _performWriteTransactionAndNotifyObserversWithError:suppressNotificationsToObserver:block:inaccessibilityHandler:](v3, (uint64_t)&v9, v4, v5);
  objc_storeStrong((id *)(v2 + 40), v9);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
}

id __107__HDFeatureSettingsManager_resetFeatureSettingsForFeatureIdentifier_suppressNotificationsToObserver_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  char v5 = *(void **)(a1 + 32);
  id v10 = 0;
  char v6 = [v5 setValueForAllKeys:0 error:&v10];
  id v7 = v10;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
  if (v7)
  {
    if (a3)
    {
      id v8 = 0;
      *a3 = v7;
    }
    else
    {
      _HKLogDroppedError();
      id v8 = 0;
    }
  }
  else
  {
    id v8 = *(id *)(a1 + 40);
  }

  return v8;
}

BOOL __141__HDFeatureSettingsManager__performWriteTransactionAndNotifyObserversWithError_suppressNotificationsToObserver_block_inaccessibilityHandler___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1[6];
  char v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  id v7 = a2;
  uint64_t v8 = v6(v5, v7, a3);
  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __141__HDFeatureSettingsManager__performWriteTransactionAndNotifyObserversWithError_suppressNotificationsToObserver_block_inaccessibilityHandler___block_invoke_2;
  v15[3] = &unk_1E63089F8;
  uint64_t v11 = a1[7];
  id v12 = (void *)a1[5];
  v15[4] = a1[4];
  uint64_t v17 = v11;
  id v16 = v12;
  [v7 onCommit:v15 orRollback:0];

  BOOL v13 = *(void *)(*(void *)(a1[7] + 8) + 40) != 0;
  return v13;
}

void __141__HDFeatureSettingsManager__performWriteTransactionAndNotifyObserversWithError_suppressNotificationsToObserver_block_inaccessibilityHandler___block_invoke_2(uint64_t a1)
{
}

void __82__HDFeatureSettingsManager__notifyObserversOfFeatureIdentifier_excludingObserver___block_invoke(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1[4] && objc_msgSend(v3, "isEqual:"))
  {
    _HKInitializeLogging();
    uint64_t v5 = (void *)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEBUG))
    {
      char v6 = v5;
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2114;
      uint64_t v11 = v4;
      id v7 = v9;
      _os_log_debug_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Observer %{public}@ was skipped", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    [v4 featureSettingsManager:a1[5] didUpdateSettingsForFeatureIdentifier:a1[6]];
  }
}

- (void)registerObserver:(id)a3 featureIdentifier:(id)a4 queue:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  __int16 v10 = [(NSMutableDictionary *)self->_observersByFeatureIdentifier objectForKeyedSubscript:v8];
  if (!v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    uint64_t v12 = HKLogInfrastructure();
    __int16 v10 = (void *)[v11 initWithName:v8 loggingCategory:v12];

    [(NSMutableDictionary *)self->_observersByFeatureIdentifier setObject:v10 forKeyedSubscript:v8];
  }
  [v10 registerObserver:v13 queue:v9];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)unregisterObserver:(id)a3 featureIdentifier:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDFeatureSettingsManager _lock_unregisterObserver:featureIdentifier:]((uint64_t)self, v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_unregisterObserver:(void *)a3 featureIdentifier:
{
  if (a1)
  {
    uint64_t v5 = (const os_unfair_lock *)(a1 + 24);
    id v6 = a3;
    id v7 = a2;
    os_unfair_lock_assert_owner(v5);
    id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

    [v8 unregisterObserver:v7];
  }
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_observersByFeatureIdentifier allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HDFeatureSettingsManager _lock_unregisterObserver:featureIdentifier:]((uint64_t)self, v4, *(void **)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_settingsDidSyncNotification:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = (void *)*MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    uint64_t v9 = [v4 name];
    *(_DWORD *)buf = 138543618;
    id v23 = v7;
    __int16 v24 = 2114;
    uint64_t v25 = v9;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Feature settings notification received (%{public}@)", buf, 0x16u);
  }
  long long v10 = [v4 userInfo];
  long long v11 = [v10 objectForKeyedSubscript:@"HDUnprotectedFeatureSettingsSyncEntityDidSyncNotificationDomainNamesKey"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[HDFeatureSettingsManager _notifyObserversOfFeatureIdentifier:excludingObserver:]((uint64_t)self, *(void **)(*((void *)&v17 + 1) + 8 * v16++), 0);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByFeatureIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end