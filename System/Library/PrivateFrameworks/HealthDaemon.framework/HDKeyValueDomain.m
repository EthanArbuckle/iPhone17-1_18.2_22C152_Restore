@interface HDKeyValueDomain
+ (id)_wristTemperatureIdentifierDomainWithProfile:(id)a3;
+ (id)healthAppUserDefaultsDomainWithProfile:(id)a3;
- (BOOL)removeValuesForKeys:(id)a3 error:(id *)a4;
- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setData:(id)a3 forKey:(id)a4 syncIdentity:(int64_t)a5 error:(id *)a6;
- (BOOL)setDate:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setNumber:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setPropertyListValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setQuantity:(id)a3 unit:(id)a4 forKey:(id)a5 error:(id *)a6;
- (BOOL)setString:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setValueForAllKeys:(id)a3 error:(id *)a4;
- (BOOL)setValuesWithDictionary:(id)a3 error:(id *)a4;
- (HDKeyValueDomain)initWithCategory:(int64_t)a3 domainName:(id)a4 profile:(id)a5;
- (NSString)domainName;
- (id)_wristTemperatureResolvedSourceIdentifiersBySourceIdentifier;
- (id)_wristTemperatureSerialNumbersBySourceIdentifier;
- (id)allValuesWithError:(id *)a3;
- (id)dataForKey:(id)a3 error:(id *)a4;
- (id)dateForKey:(id)a3 error:(id *)a4;
- (id)modificationDatesForKeys:(id)a3 error:(id *)a4;
- (id)numberForKey:(id)a3 error:(id *)a4;
- (id)propertyListValueForKey:(id)a3 error:(id *)a4;
- (id)quantityForKey:(id)a3 unit:(id)a4 error:(id *)a5;
- (id)stringForKey:(id)a3 error:(id *)a4;
- (id)valuesForKeys:(id)a3 error:(id *)a4;
- (int64_t)category;
- (unint64_t)_unitTest_countOfObservers;
- (void)notifyObservers;
- (void)startObservation:(id)a3;
- (void)stopObservation:(id)a3;
@end

@implementation HDKeyValueDomain

- (id)dateForKey:(id)a3 error:(id *)a4
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  v11 = [(objc_class *)entityClass dateForKey:v9 domain:domainName category:category profile:WeakRetained entity:0 error:a4];

  return v11;
}

- (HDKeyValueDomain)initWithCategory:(int64_t)a3 domainName:(id)a4 profile:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HDKeyValueDomain;
  v10 = [(HDKeyValueDomain *)&v20 init];
  v11 = v10;
  if (v10)
  {
    v10->_int64_t category = a3;
    uint64_t v12 = [v8 copy];
    domainName = v11->_domainName;
    v11->_domainName = (NSString *)v12;

    objc_storeWeak((id *)&v11->_profile, v9);
    v11->_Class entityClass = +[HDKeyValueEntity _entityClassForKeyValueCategory:a3];
    id v14 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    uint64_t v17 = [v14 initWithName:v16 loggingCategory:*MEMORY[0x1E4F29F28]];
    observers = v11->_observers;
    v11->_observers = (HKObserverSet *)v17;
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v11 = a4;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a5) = [(objc_class *)entityClass setData:v12 forKey:v11 domain:domainName category:category profile:WeakRetained error:a5];

  return (char)a5;
}

- (id)numberForKey:(id)a3 error:(id *)a4
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v11 = [(objc_class *)entityClass numberForKey:v9 domain:domainName category:category profile:WeakRetained entity:0 error:a4];

  return v11;
}

- (BOOL)setNumber:(id)a3 forKey:(id)a4 error:(id *)a5
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v11 = a4;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a5) = [(objc_class *)entityClass setNumber:v12 forKey:v11 domain:domainName category:category profile:WeakRetained error:a5];

  return (char)a5;
}

- (BOOL)setDate:(id)a3 forKey:(id)a4 error:(id *)a5
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v11 = a4;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a5) = [(objc_class *)entityClass setDate:v12 forKey:v11 domain:domainName category:category profile:WeakRetained error:a5];

  return (char)a5;
}

- (id)allValuesWithError:(id *)a3
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [(objc_class *)entityClass allValuesForDomain:domainName category:category profile:WeakRetained error:a3];

  return v8;
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v11 = [(objc_class *)entityClass dataForKey:v9 domain:domainName category:category profile:WeakRetained entity:0 error:a4];

  return v11;
}

- (id)stringForKey:(id)a3 error:(id *)a4
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v11 = [(objc_class *)entityClass stringForKey:v9 domain:domainName category:category profile:WeakRetained entity:0 error:a4];

  return v11;
}

+ (id)_wristTemperatureIdentifierDomainWithProfile:(id)a3
{
  id v3 = a3;
  v4 = [[HDKeyValueDomain alloc] initWithCategory:105 domainName:@"wrist-temperature-identifiers" profile:v3];

  return v4;
}

- (id)_wristTemperatureSerialNumbersBySourceIdentifier
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = [v3 isAppleInternalInstall];

  if (v4)
  {
    id v11 = 0;
    v5 = [(HDKeyValueDomain *)self allValuesWithError:&v11];
    id v6 = v11;
    v7 = v5;
    if (!v5)
    {
      _HKInitializeLogging();
      id v8 = *MEMORY[0x1E4F29F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F60], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[Wrist Temperature] Failed to retrieve serial numbers by source identifier: %{public}@", buf, 0xCu);
      }
      v7 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v9 = v7;
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

- (id)_wristTemperatureResolvedSourceIdentifiersBySourceIdentifier
{
  v2 = [(HDKeyValueDomain *)self _wristTemperatureSerialNumbersBySourceIdentifier];
  id v3 = objc_msgSend(v2, "hk_sortedKeys");
  int v4 = [v2 allValues];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __109__HDKeyValueDomain_WristTemperatureIdentifiers___wristTemperatureResolvedSourceIdentifiersBySourceIdentifier__block_invoke;
  v13[3] = &unk_1E62F55E8;
  id v14 = v3;
  id v15 = v2;
  id v5 = v2;
  id v6 = v3;
  v7 = objc_msgSend(v4, "hk_mapToDictionary:", v13);

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __109__HDKeyValueDomain_WristTemperatureIdentifiers___wristTemperatureResolvedSourceIdentifiersBySourceIdentifier__block_invoke_3;
  v11[3] = &unk_1E62F5610;
  id v12 = v7;
  id v8 = v7;
  id v9 = objc_msgSend(v5, "hk_map:", v11);

  return v9;
}

void __109__HDKeyValueDomain_WristTemperatureIdentifiers___wristTemperatureResolvedSourceIdentifiersBySourceIdentifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __109__HDKeyValueDomain_WristTemperatureIdentifiers___wristTemperatureResolvedSourceIdentifiersBySourceIdentifier__block_invoke_2;
  v10[3] = &unk_1E62F55C0;
  id v6 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  id v7 = v5;
  id v8 = a3;
  id v9 = objc_msgSend(v6, "hk_firstObjectPassingTest:", v10);
  v8[2](v8, v7, v9);
}

uint64_t __109__HDKeyValueDomain_WristTemperatureIdentifiers___wristTemperatureResolvedSourceIdentifiersBySourceIdentifier__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

  return v4;
}

void __109__HDKeyValueDomain_WristTemperatureIdentifiers___wristTemperatureResolvedSourceIdentifiersBySourceIdentifier__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void, void))
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a2;
  id v10 = [v7 objectForKeyedSubscript:a3];
  ((void (**)(void, id, id))a4)[2](v8, v9, v10);
}

- (id)quantityForKey:(id)a3 unit:(id)a4 error:(id *)a5
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v11 = a4;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v14 = [(objc_class *)entityClass quantityForKey:v12 unit:v11 domain:domainName category:category profile:WeakRetained entity:0 error:a5];

  return v14;
}

- (id)propertyListValueForKey:(id)a3 error:(id *)a4
{
  id v5 = -[HDKeyValueDomain dataForKey:error:](self, "dataForKey:error:", a3);
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:a4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)valuesForKeys:(id)a3 error:(id *)a4
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v11 = [(objc_class *)entityClass valuesForKeys:v9 domain:domainName category:category profile:WeakRetained error:a4];

  return v11;
}

- (id)modificationDatesForKeys:(id)a3 error:(id *)a4
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v11 = [(objc_class *)entityClass modificationDatesForKeys:v9 domain:domainName category:category profile:WeakRetained error:a4];

  return v11;
}

- (BOOL)setData:(id)a3 forKey:(id)a4 syncIdentity:(int64_t)a5 error:(id *)a6
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v13 = a4;
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a6) = [(objc_class *)entityClass setData:v14 forKey:v13 domain:domainName category:category syncIdentity:a5 profile:WeakRetained error:a6];

  return (char)a6;
}

- (BOOL)setQuantity:(id)a3 unit:(id)a4 forKey:(id)a5 error:(id *)a6
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a6) = [(objc_class *)entityClass setQuantity:v15 unit:v14 forKey:v13 domain:domainName category:category profile:WeakRetained error:a6];

  return (char)a6;
}

- (BOOL)setString:(id)a3 forKey:(id)a4 error:(id *)a5
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v11 = a4;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a5) = [(objc_class *)entityClass setString:v12 forKey:v11 domain:domainName category:category profile:WeakRetained error:a5];

  return (char)a5;
}

- (BOOL)setPropertyListValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v10 = 0;
    goto LABEL_5;
  }
  id v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:a5];
  if (v10)
  {
LABEL_5:
    BOOL v11 = [(HDKeyValueDomain *)self setData:v10 forKey:v9 error:a5];

    goto LABEL_6;
  }
  BOOL v11 = 0;
LABEL_6:

  return v11;
}

- (BOOL)setValuesWithDictionary:(id)a3 error:(id *)a4
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a4) = [(objc_class *)entityClass setValuesWithDictionary:v9 domain:domainName category:category profile:WeakRetained error:a4];

  return (char)a4;
}

- (BOOL)setValueForAllKeys:(id)a3 error:(id *)a4
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a4) = [(objc_class *)entityClass setValueForAllKeys:v9 domain:domainName category:category profile:WeakRetained error:a4];

  return (char)a4;
}

- (BOOL)removeValuesForKeys:(id)a3 error:(id *)a4
{
  Class entityClass = self->_entityClass;
  int64_t category = self->_category;
  domainName = self->_domainName;
  id v9 = [a3 allObjects];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a4) = [(objc_class *)entityClass removeValuesForDomain:domainName category:category keys:v9 profile:WeakRetained error:a4];

  return (char)a4;
}

- (void)startObservation:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__HDKeyValueDomain_startObservation___block_invoke;
  v4[3] = &unk_1E62F3208;
  v4[4] = self;
  [(HKObserverSet *)observers registerObserver:a3 queue:0 runIfFirstObserver:v4];
}

void __37__HDKeyValueDomain_startObservation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v2 = [WeakRetained keyValueDomainManager];
  [v2 startObservationForDomain:*(void *)(a1 + 32)];
}

- (void)stopObservation:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__HDKeyValueDomain_stopObservation___block_invoke;
  v4[3] = &unk_1E62F3208;
  v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

void __36__HDKeyValueDomain_stopObservation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v2 = [WeakRetained keyValueDomainManager];
  [v2 stopObservationForDomain:*(void *)(a1 + 32)];
}

- (void)notifyObservers
{
  observers = self->_observers;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__HDKeyValueDomain_notifyObservers__block_invoke;
  v3[3] = &unk_1E6305258;
  v3[4] = self;
  [(HKObserverSet *)observers notifyObservers:v3];
}

uint64_t __35__HDKeyValueDomain_notifyObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didUpdateKeyValueDomain:*(void *)(a1 + 32)];
}

- (unint64_t)_unitTest_countOfObservers
{
  v2 = [(HKObserverSet *)self->_observers allObservers];
  unint64_t v3 = [v2 count];

  return v3;
}

+ (id)healthAppUserDefaultsDomainWithProfile:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [HDKeyValueDomain alloc];
  id v5 = [(HDKeyValueDomain *)v4 initWithCategory:102 domainName:*MEMORY[0x1E4F2BDC0] profile:v3];

  return v5;
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)domainName
{
  return self->_domainName;
}

@end