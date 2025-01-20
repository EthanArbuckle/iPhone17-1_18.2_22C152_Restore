@interface HDUnitPreferencesManager
- (BOOL)removePreferredUnitForType:(id)a3 error:(id *)a4;
- (BOOL)setPreferredUnit:(id)a3 forType:(id)a4 error:(id *)a5;
- (HDUnitPreferencesManager)initWithProfile:(id)a3;
- (__CFString)_domainForVersion:(__CFString *)a1;
- (id)_lock_generateVersionedUnitPreferencesWithError:(uint64_t)a1;
- (id)_lock_unitForType:(void *)a3 versionedUnitPreferences:(uint64_t)a4 version:(void *)a5 locale:;
- (id)_stringFromQuantityType:(void *)a1;
- (id)preferredUnitForType:(id)a3 error:(id *)a4;
- (id)unitPreferencesDictionaryForTypes:(id)a3 version:(int64_t)a4 authorizationOracle:(id)a5 error:(id *)a6;
- (uint64_t)_lock_notifyObserversWithUnitPreferences;
- (void)_localeDidChange:(id)a3;
- (void)_lock_setUnit:(void *)a3 forType:;
- (void)addUnitPreferenceObserver:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)removeUnitPreferenceObserver:(id)a3;
- (void)setPreferredUnitToDefaultIfNotSetForType:(id)a3;
- (void)unitTesting_resetUnits;
@end

@implementation HDUnitPreferencesManager

- (void)removeUnitPreferenceObserver:(id)a3
{
}

void __77__HDUnitPreferencesManager__unitPreferencesDictionaryFromKeyValueDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (*(void *)(a1 + 32))
    {
      v6 = (objc_class *)MEMORY[0x1E4F28FE8];
      id v7 = v18;
      v8 = (void *)[[v6 alloc] initWithString:v7];

      *(void *)buf = -1;
      if [v8 scanInteger:buf] && (_HKValidDataTypeCode())
      {
        v9 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:*(void *)buf];

        if (v9)
        {
          uint64_t v10 = *(void *)(a1 + 32);
          id v11 = v5;
          id v12 = v9;
          if (v10)
          {
            v13 = [MEMORY[0x1E4F2B618] unitFromString:v11];
            if ([v12 isCompatibleWithUnit:v13])
            {
LABEL_14:

              if (v13) {
                [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v12];
              }

              goto LABEL_19;
            }
            _HKInitializeLogging();
            v14 = HKLogInfrastructure();
            BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

            if (v15)
            {
              v16 = HKLogInfrastructure();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v17 = objc_opt_class();
                *(_DWORD *)buf = 138543874;
                *(void *)&buf[4] = v17;
                __int16 v20 = 2112;
                id v21 = v11;
                __int16 v22 = 2112;
                id v23 = v12;
                _os_log_debug_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Unit string (%@) not compatible with quantity type (%@)", buf, 0x20u);
              }
            }
          }
          v13 = 0;
          goto LABEL_14;
        }
      }
      else
      {
      }
    }
    id v12 = 0;
LABEL_19:
  }
}

- (HDUnitPreferencesManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDUnitPreferencesManager;
  id v5 = [(HDUnitPreferencesManager *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    id v7 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = HKLogInfrastructure();
    uint64_t v11 = [v7 initWithName:v9 loggingCategory:v10];
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v11;

    v6->_lock._os_unfair_lock_opaque = 0;
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v6 selector:sel__localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HDUnitPreferencesManager;
  [(HDUnitPreferencesManager *)&v4 dealloc];
}

- (id)unitPreferencesDictionaryForTypes:(id)a3 version:(int64_t)a4 authorizationOracle:(id)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v49;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 3, @"Object (%@) is not of class %@", v15, objc_opt_class());
          id v23 = 0;
          __int16 v22 = v10;
          goto LABEL_39;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v16 = v10;
  id v17 = v9;
  id v18 = v17;
  if (!self)
  {
    __int16 v22 = 0;
    goto LABEL_21;
  }
  id v52 = 0;
  int v19 = [v17 isAuthorizationStatusDeterminedForTypes:v16 error:&v52];
  id v20 = v52;
  id v21 = v20;
  if (v19)
  {
    __int16 v22 = [v18 readAuthorizationStatusesForTypes:v16 error:a6];
    goto LABEL_16;
  }
  if (!v20)
  {
    id v21 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 5, @"Authorization status is not determined for all types provided.");
    __int16 v22 = 0;
LABEL_16:
    id v24 = v21;
    if (!v24) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  id v24 = v20;
  __int16 v22 = 0;
LABEL_17:
  if (a6) {
    *a6 = v24;
  }
  else {
    _HKLogDroppedError();
  }

LABEL_21:
  if (!v22)
  {
    id v23 = 0;
    goto LABEL_39;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v40 = v10;
  if (self)
  {
    versionedUnitPreferences = self->_versionedUnitPreferences;
    if (versionedUnitPreferences)
    {
      v41 = versionedUnitPreferences;
LABEL_27:
      id v39 = v9;
      v29 = [MEMORY[0x1E4F1CA20] currentLocale];
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v30 = v16;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v45 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = *(void **)(*((void *)&v44 + 1) + 8 * j);
            v36 = [v22 objectForKey:v35];
            if ([v36 canRead]) {
              -[HDUnitPreferencesManager _lock_unitForType:versionedUnitPreferences:version:locale:](self, v35, v41, a4, v29);
            }
            else {
            v37 = _HKGenerateDefaultUnitForQuantityTypeWithVersion();
            }
            [v23 setObject:v37 forKeyedSubscript:v35];
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v44 objects:v53 count:16];
        }
        while (v32);
      }

      p_lock = &self->_lock;
      id v9 = v39;
      goto LABEL_38;
    }
    -[HDUnitPreferencesManager _lock_generateVersionedUnitPreferencesWithError:]((uint64_t)self, a6);
    v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v28 = self->_versionedUnitPreferences;
    self->_versionedUnitPreferences = v27;

    v41 = self->_versionedUnitPreferences;
    if (v41) {
      goto LABEL_27;
    }
  }
  v41 = 0;
  id v23 = 0;
LABEL_38:
  os_unfair_lock_unlock(p_lock);

  id v10 = v40;
LABEL_39:

  return v23;
}

- (id)_lock_unitForType:(void *)a3 versionedUnitPreferences:(uint64_t)a4 version:(void *)a5 locale:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    if (a4 < 0)
    {
LABEL_7:
      a1 = _HKGenerateDefaultUnitForQuantityTypeWithVersion();
    }
    else
    {
      uint64_t v12 = a4;
      while (1)
      {
        uint64_t v13 = [v10 objectAtIndexedSubscript:v12];
        a1 = [v13 objectForKeyedSubscript:v9];

        if (a1) {
          break;
        }
        if (v12-- <= 0) {
          goto LABEL_7;
        }
      }
    }
  }

  return a1;
}

- (BOOL)setPreferredUnit:(id)a3 forType:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [v9 isCompatibleWithUnit:v8];
  if (v10)
  {
    os_unfair_lock_lock(&self->_lock);
    -[HDUnitPreferencesManager _lock_setUnit:forType:]((__CFString *)self, (uint64_t)v8, v9);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Unit (%@) is not compatible with the provided type (%@)", v8, v9);
  }

  return v10;
}

- (void)_lock_setUnit:(void *)a3 forType:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  v3 = a1;
  id v4 = a3;
  _HKUnitPreferencesVersionToUnitDictionaryForQuantityType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v4;
  id v7 = -[HDUnitPreferencesManager _lock_generateVersionedUnitPreferencesWithError:]((uint64_t)v3, 0);
  id v8 = (void *)[v7 mutableCopy];

  if ([v8 count])
  {
    unint64_t v9 = 0;
    do
    {
      char v10 = [v8 objectAtIndex:v9];
      id v11 = (void *)[v10 mutableCopy];

      uint64_t v12 = [NSNumber numberWithUnsignedInteger:v9];
      uint64_t v13 = [v5 objectForKeyedSubscript:v12];

      if (v13) {
        [v11 setObject:v13 forKey:v6];
      }
      else {
        [v11 removeObjectForKey:v6];
      }
      [v8 setObject:v11 atIndexedSubscript:v9];

      ++v9;
    }
    while (v9 < [v8 count]);
  }
  data = v3->data;
  v3->data = (char *)v8;

  id v33 = v5;
  uint64_t v31 = v6;
  uint64_t v15 = -[HDUnitPreferencesManager _stringFromQuantityType:](v6);
  id v16 = 0;
  uint64_t v17 = 0;
  location = (id *)&v3->info;
  do
  {
    uint64_t v18 = (uint64_t)v3;
    int v19 = -[HDUnitPreferencesManager _domainForVersion:](v3, v17);
    id v20 = [NSNumber numberWithInteger:v17];
    id v21 = [v33 objectForKeyedSubscript:v20];

    if (v21)
    {
      __int16 v22 = [v21 unitString];
      id WeakRetained = objc_loadWeakRetained(location);
      id v35 = v16;
      BOOL v24 = +[HDKeyValueEntity setString:v22 forKey:v15 domain:v19 category:104 profile:WeakRetained error:&v35];
      id v25 = v35;

      id v16 = v25;
      if (v24) {
        goto LABEL_16;
      }
    }
    else
    {
      id v26 = objc_loadWeakRetained(location);
      id v34 = v16;
      BOOL v27 = +[HDKeyValueEntity setString:0 forKey:v15 domain:v19 category:104 profile:v26 error:&v34];
      id v28 = v34;

      id v16 = v28;
      if (v27) {
        goto LABEL_16;
      }
    }
    _HKInitializeLogging();
    v29 = HKLogInfrastructure();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v30;
      __int16 v38 = 2114;
      id v39 = v16;
      _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "%{public}@: Error persisting unit preferences: %{public}@", buf, 0x16u);
    }

LABEL_16:
    ++v17;
    v3 = (__CFString *)v18;
  }
  while (v17 != 3);

  -[HDUnitPreferencesManager _lock_notifyObserversWithUnitPreferences](v18);
}

- (BOOL)removePreferredUnitForType:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  id v8 = v7;
  unint64_t v9 = v8;
  if (self)
  {
    char v10 = -[HDUnitPreferencesManager _stringFromQuantityType:](v8);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v12 = [WeakRetained database];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __67__HDUnitPreferencesManager__lock_removePreferredUnitForType_error___block_invoke;
    BOOL v24 = &unk_1E62F2AE0;
    id v25 = self;
    id v13 = v10;
    id v26 = v13;
    BOOL v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v12 error:a4 block:&v21];

    if (v14)
    {
      uint64_t v15 = (NSArray *)[(NSArray *)self->_versionedUnitPreferences mutableCopy];
      if ([(NSArray *)v15 count])
      {
        unint64_t v16 = 0;
        do
        {
          uint64_t v17 = [(NSArray *)v15 objectAtIndexedSubscript:v16];
          uint64_t v18 = (void *)[v17 mutableCopy];

          [v18 removeObjectForKey:v9];
          [(NSArray *)v15 setObject:v18 atIndexedSubscript:v16];

          ++v16;
        }
        while (v16 < [(NSArray *)v15 count]);
      }
      versionedUnitPreferences = self->_versionedUnitPreferences;
      self->_versionedUnitPreferences = v15;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (void)setPreferredUnitToDefaultIfNotSetForType:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    os_unfair_lock_lock(&self->_lock);
    id v4 = -[HDUnitPreferencesManager _lock_generateVersionedUnitPreferencesWithError:]((uint64_t)self, 0);
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
      id v7 = v15;
      if (self)
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v6 = v6;
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v17;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v17 != v10) {
                objc_enumerationMutation(v6);
              }
              uint64_t v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) objectForKey:v7];

              if (v12)
              {

                goto LABEL_15;
              }
            }
            uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
      }
      id v13 = [MEMORY[0x1E4F1CA20] currentLocale];
      BOOL v14 = _HKGenerateDefaultUnitForQuantityTypeWithVersion();

      -[HDUnitPreferencesManager _lock_setUnit:forType:]((__CFString *)self, (uint64_t)v14, v7);
    }
LABEL_15:
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (id)_lock_generateVersionedUnitPreferencesWithError:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    long long v17 = 0;
    goto LABEL_18;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = 0;
  while (1)
  {
    id v5 = -[HDUnitPreferencesManager _domainForVersion:]((__CFString *)a1, v4);
    id v21 = 0;
    id v6 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v8 = +[HDKeyValueEntity allValuesForDomain:v6 category:104 profile:WeakRetained error:&v21];

    if (v8)
    {
      uint64_t v9 = (objc_class *)MEMORY[0x1E4F1CA60];
      id v10 = v8;
      id v11 = objc_alloc_init(v9);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __77__HDUnitPreferencesManager__unitPreferencesDictionaryFromKeyValueDictionary___block_invoke;
      id v23 = &unk_1E62FAE48;
      uint64_t v24 = a1;
      id v12 = v11;
      id v25 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:buf];

      id v13 = v25;
      id v14 = v12;
    }
    else
    {
      id v14 = 0;
    }

    id v15 = v21;
    long long v16 = v15;
    if (!v14) {
      break;
    }
    [v3 addObject:v14];
LABEL_9:

    if (++v4 == 3)
    {
      long long v17 = (void *)[v3 copy];
      goto LABEL_17;
    }
  }
  if (!v15) {
    goto LABEL_9;
  }
  _HKInitializeLogging();
  long long v18 = HKLogInfrastructure();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&unsigned char buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    id v23 = v16;
    _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Received error when getting unit preferences for domain %{public}@: %{public}@", buf, 0x20u);
  }

  if (a2) {
    *a2 = v16;
  }
  else {
    _HKLogDroppedError();
  }

  long long v17 = 0;
LABEL_17:

LABEL_18:

  return v17;
}

- (id)preferredUnitForType:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v8 = -[HDUnitPreferencesManager _lock_generateVersionedUnitPreferencesWithError:]((uint64_t)self, a4);
  uint64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v10 = -[HDUnitPreferencesManager _lock_unitForType:versionedUnitPreferences:version:locale:](self, v7, v8, 2, v9);

  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)unitTesting_resetUnits
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  versionedUnitPreferences = self->_versionedUnitPreferences;
  self->_versionedUnitPreferences = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)addUnitPreferenceObserver:(id)a3 queue:(id)a4
{
}

- (uint64_t)_lock_notifyObserversWithUnitPreferences
{
  if (result)
  {
    v1 = *(void **)(result + 24);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __68__HDUnitPreferencesManager__lock_notifyObserversWithUnitPreferences__block_invoke;
    v2[3] = &unk_1E62FAE20;
    v2[4] = result;
    return [v1 notifyObservers:v2];
  }
  return result;
}

uint64_t __68__HDUnitPreferencesManager__lock_notifyObserversWithUnitPreferences__block_invoke(uint64_t a1, void *a2)
{
  return [a2 unitPreferencesManagerDidUpdateUnitPreferences:*(void *)(a1 + 32)];
}

- (id)_stringFromQuantityType:(void *)a1
{
  v1 = (objc_class *)NSString;
  id v2 = a1;
  id v3 = [v1 alloc];
  uint64_t v4 = [v2 code];

  id v5 = objc_msgSend(v3, "initWithFormat:", @"%ld", v4);

  return v5;
}

BOOL __67__HDUnitPreferencesManager__lock_removePreferredUnitForType_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  BOOL v5 = 0;
  unint64_t v6 = 0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  while (1)
  {
    id v7 = -[HDUnitPreferencesManager _domainForVersion:](*(__CFString **)(a1 + 32), v6);
    uint64_t v8 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    BOOL v10 = +[HDKeyValueEntity setString:0 forKey:v8 domain:v7 category:104 profile:WeakRetained error:a3];

    if (!v10) {
      break;
    }

    BOOL v5 = v6++ > 1;
    if (v6 == 3) {
      return 1;
    }
  }
  _HKInitializeLogging();
  id v11 = HKLogInfrastructure();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = *a3;
    int v15 = 138543618;
    uint64_t v16 = v13;
    __int16 v17 = 2114;
    uint64_t v18 = v14;
    _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Error removing unit preferences: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  return v5;
}

- (__CFString)_domainForVersion:(__CFString *)a1
{
  if (!a1)
  {
LABEL_4:
    return a1;
  }
  if (a2)
  {
    a1 = [NSString stringWithFormat:@"%@%ld", @"Version", a2];
    uint64_t v2 = vars8;
    goto LABEL_4;
  }
  a1 = &stru_1F1728D60;
  return a1;
}

- (void)_localeDidChange:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDUnitPreferencesManager _lock_notifyObserversWithUnitPreferences]((uint64_t)self);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_versionedUnitPreferences, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end