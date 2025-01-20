@interface HKKeyValueDomain
+ (id)clientInterface;
+ (id)emergencyDefaultsDomainWithHealthStore:(id)a3;
+ (id)healthAppDefaultsDomainWithHealthStore:(id)a3;
+ (id)healthArticlesDefaultsDomainWithHealthStore:(id)a3;
+ (id)heartRhythmDefaultsDomainWithHealthStore:(id)a3;
+ (id)safetyDefaultsDomainWithHealthStore:(id)a3;
+ (id)safetyDefaultsLocalDomainWithHealthStore:(id)a3;
+ (id)serverInterface;
- (BOOL)_synchronouslyRegisterToObserveKeyValueDomainChanges:(id *)a3;
- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setDate:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setNumber:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setPropertyListValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setString:(id)a3 forKey:(id)a4 error:(id *)a5;
- (HKHealthStore)healthStore;
- (HKKeyValueDomain)initWithCategory:(int64_t)a3 domainName:(id)a4 healthStore:(id)a5;
- (NSString)domainName;
- (id)_dataFromPropertyListValue:(id)a3 error:(id *)a4;
- (id)_dataWithErrorNoDataForKey:(id)a3 error:(id *)a4;
- (id)_dateWithErrorNoDataForKey:(id)a3 error:(id *)a4;
- (id)_numberWithErrorNoDataForKey:(id)a3 error:(id *)a4;
- (id)_propertyListValueFromData:(id)a3 error:(id *)a4;
- (id)_propertyListValueWithErrorNoDataForKey:(id)a3 error:(id *)a4;
- (id)_stringWithErrorNoDataForKey:(id)a3 error:(id *)a4;
- (id)allValuesWithError:(id *)a3;
- (id)dataForKey:(id)a3 error:(id *)a4;
- (id)dateForKey:(id)a3 error:(id *)a4;
- (id)exportedInterface;
- (id)hkhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:(id *)a3;
- (id)numberForKey:(id)a3 error:(id *)a4;
- (id)propertyListValueForKey:(id)a3 error:(id *)a4;
- (id)remoteInterface;
- (id)stringForKey:(id)a3 error:(id *)a4;
- (int64_t)category;
- (void)_handleAutomaticProxyReconnection;
- (void)_observeKeyValueDomainChanges:(BOOL)a3 completion:(id)a4;
- (void)_registerFirstObserverWithCompletion:(id)a3;
- (void)_startObservation:(id)a3 withCompletion:(id)a4;
- (void)_unregisterLastObserver;
- (void)allValuesWithCompletion:(id)a3;
- (void)clientRemote_didUpdate;
- (void)dataForKey:(id)a3 completion:(id)a4;
- (void)dateForKey:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)numberForKey:(id)a3 completion:(id)a4;
- (void)propertyListValueForKey:(id)a3 completion:(id)a4;
- (void)removeValuesForKeys:(id)a3 completion:(id)a4;
- (void)setData:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setDate:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setNumber:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setPropertyListValue:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setValueForAllKeys:(id)a3 completion:(id)a4;
- (void)setValuesWithDictionary:(id)a3 completion:(id)a4;
- (void)startObservation:(id)a3;
- (void)stopObservation:(id)a3;
- (void)stringForKey:(id)a3 completion:(id)a4;
@end

@implementation HKKeyValueDomain

+ (id)heartRhythmDefaultsDomainWithHealthStore:(id)a3
{
  id v3 = a3;
  v4 = [[HKKeyValueDomain alloc] initWithCategory:0 domainName:@"com.apple.private.health.heart-rhythm" healthStore:v3];

  return v4;
}

- (id)hkhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v16 = 0;
  v5 = [(HKKeyValueDomain *)self dateForKey:@"HKElectrocardiogramFirstOnboardingCompleted" error:&v16];
  id v6 = v16;
  v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    id v9 = v5;
  }
  else
  {
    int v10 = objc_msgSend(v6, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v11 = (void *)HKLogHeartRhythm;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v18 = v13;
        id v14 = v13;
        _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database is inaccessible; can't determine first ECG onboarding completion date",
          buf,
          0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
    {
      [(HKKeyValueDomain(HKHeartRhythmAdditions) *)v11 hkhr_electrocardiogramRecordingFirstOnboardingCompletedDateWithError:(uint64_t)v7];
    }
    if (a3)
    {
      id v9 = 0;
      *a3 = v7;
    }
    else
    {
      _HKLogDroppedError(v7);
      id v9 = 0;
    }
  }

  return v9;
}

- (id)_dataWithErrorNoDataForKey:(id)a3 error:(id *)a4
{
  id v8 = 0;
  v5 = [(HKKeyValueDomain *)self dataForKey:a3 error:&v8];
  id v6 = v8;
  SetNoDataErrorIfNeeded(v5, v6, a4);
  objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_dateWithErrorNoDataForKey:(id)a3 error:(id *)a4
{
  id v8 = 0;
  v5 = [(HKKeyValueDomain *)self dateForKey:a3 error:&v8];
  id v6 = v8;
  SetNoDataErrorIfNeeded(v5, v6, a4);
  objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_stringWithErrorNoDataForKey:(id)a3 error:(id *)a4
{
  id v8 = 0;
  v5 = [(HKKeyValueDomain *)self stringForKey:a3 error:&v8];
  id v6 = v8;
  SetNoDataErrorIfNeeded(v5, v6, a4);
  objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_numberWithErrorNoDataForKey:(id)a3 error:(id *)a4
{
  id v8 = 0;
  v5 = [(HKKeyValueDomain *)self numberForKey:a3 error:&v8];
  id v6 = v8;
  SetNoDataErrorIfNeeded(v5, v6, a4);
  objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_propertyListValueWithErrorNoDataForKey:(id)a3 error:(id *)a4
{
  id v8 = 0;
  v5 = [(HKKeyValueDomain *)self propertyListValueForKey:a3 error:&v8];
  id v6 = v8;
  SetNoDataErrorIfNeeded(v5, v6, a4);
  objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HKKeyValueDomain)initWithCategory:(int64_t)a3 domainName:(id)a4 healthStore:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = [[HKKeyValueDomainServerConfiguration alloc] initWithCategory:a3 domainName:v8];
  v30.receiver = self;
  v30.super_class = (Class)HKKeyValueDomain;
  v11 = [(HKKeyValueDomain *)&v30 init];
  v12 = v11;
  if (v11)
  {
    v11->_category = a3;
    uint64_t v13 = [v8 copy];
    domainName = v12->_domainName;
    v12->_domainName = (NSString *)v13;

    objc_storeStrong((id *)&v12->_healthStore, a5);
    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v15;

    v17 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v12->_healthStore taskIdentifier:@"HKKeyValueDomainServerIdentifier" exportedObject:v12 taskUUID:v12->_identifier];
    proxyProvider = v12->_proxyProvider;
    v12->_proxyProvider = v17;

    [(HKTaskServerProxyProvider *)v12->_proxyProvider setTaskConfiguration:v10];
    objc_initWeak(&location, v12);
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __60__HKKeyValueDomain_initWithCategory_domainName_healthStore___block_invoke;
    v27 = &unk_1E58BE428;
    objc_copyWeak(&v28, &location);
    [(HKProxyProvider *)v12->_proxyProvider setAutomaticProxyReconnectionHandler:&v24];
    -[HKProxyProvider setShouldRetryOnInterruption:](v12->_proxyProvider, "setShouldRetryOnInterruption:", 1, v24, v25, v26, v27);
    uint64_t v19 = [HKObserverSet alloc];
    v20 = NSStringFromProtocol((Protocol *)&unk_1EED533F0);
    uint64_t v21 = [(HKObserverSet *)v19 initWithName:v20 loggingCategory:HKLogDefault];
    observers = v12->_observers;
    v12->_observers = (HKKeyValueDomainObserver *)v21;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __60__HKKeyValueDomain_initWithCategory_domainName_healthStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAutomaticProxyReconnection];
}

- (void)invalidate
{
}

- (BOOL)setNumber:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"HKKeyValueDomain.m", 61, @"Invalid parameter not satisfying: %@", @"number == nil || ([number isKindOfClass:[NSNumber class]])" object file lineNumber description];
    }
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__37;
  v29 = __Block_byref_object_dispose__37;
  id v30 = 0;
  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __43__HKKeyValueDomain_setNumber_forKey_error___block_invoke;
  v20[3] = &unk_1E58C5520;
  id v12 = v9;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  v23 = &v31;
  uint64_t v24 = &v25;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __43__HKKeyValueDomain_setNumber_forKey_error___block_invoke_3;
  v19[3] = &unk_1E58BDBD8;
  v19[4] = &v25;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v20 errorHandler:v19];
  if (*((unsigned char *)v32 + 24))
  {
    BOOL v14 = 1;
  }
  else
  {
    id v15 = (id)v26[5];
    id v16 = v15;
    if (v15)
    {
      if (a5) {
        *a5 = v15;
      }
      else {
        _HKLogDroppedError(v15);
      }
    }

    BOOL v14 = *((unsigned char *)v32 + 24) != 0;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v14;
}

uint64_t __43__HKKeyValueDomain_setNumber_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__HKKeyValueDomain_setNumber_forKey_error___block_invoke_2;
  v5[3] = &unk_1E58BE050;
  long long v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_setNumber:forKey:completion:", v2, v3, v5);
}

void __43__HKKeyValueDomain_setNumber_forKey_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __43__HKKeyValueDomain_setNumber_forKey_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)setNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"HKKeyValueDomain.m", 85, @"Invalid parameter not satisfying: %@", @"number == nil || ([number isKindOfClass:[NSNumber class]])" object file lineNumber description];
    }
  }
  id v12 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v11];

  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48__HKKeyValueDomain_setNumber_forKey_completion___block_invoke;
  v20[3] = &unk_1E58C5548;
  id v21 = v9;
  id v22 = v10;
  id v23 = v12;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__HKKeyValueDomain_setNumber_forKey_completion___block_invoke_2;
  v18[3] = &unk_1E58BBD88;
  id v19 = v23;
  id v14 = v23;
  id v15 = v10;
  id v16 = v9;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v20 errorHandler:v18];
}

uint64_t __48__HKKeyValueDomain_setNumber_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setNumber:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __48__HKKeyValueDomain_setNumber_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"HKKeyValueDomain.m", 96, @"Invalid parameter not satisfying: %@", @"data == nil || ([data isKindOfClass:[NSData class]])" object file lineNumber description];
    }
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__37;
  v29 = __Block_byref_object_dispose__37;
  id v30 = 0;
  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __41__HKKeyValueDomain_setData_forKey_error___block_invoke;
  v20[3] = &unk_1E58C5520;
  id v12 = v9;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  id v23 = &v31;
  uint64_t v24 = &v25;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __41__HKKeyValueDomain_setData_forKey_error___block_invoke_3;
  v19[3] = &unk_1E58BDBD8;
  v19[4] = &v25;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v20 errorHandler:v19];
  if (*((unsigned char *)v32 + 24))
  {
    BOOL v14 = 1;
  }
  else
  {
    id v15 = (id)v26[5];
    id v16 = v15;
    if (v15)
    {
      if (a5) {
        *a5 = v15;
      }
      else {
        _HKLogDroppedError(v15);
      }
    }

    BOOL v14 = *((unsigned char *)v32 + 24) != 0;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v14;
}

uint64_t __41__HKKeyValueDomain_setData_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__HKKeyValueDomain_setData_forKey_error___block_invoke_2;
  v5[3] = &unk_1E58BE050;
  long long v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_setData:forKey:completion:", v2, v3, v5);
}

void __41__HKKeyValueDomain_setData_forKey_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __41__HKKeyValueDomain_setData_forKey_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)setData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"HKKeyValueDomain.m", 120, @"Invalid parameter not satisfying: %@", @"data == nil || ([data isKindOfClass:[NSData class]])" object file lineNumber description];
    }
  }
  id v12 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v11];

  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__HKKeyValueDomain_setData_forKey_completion___block_invoke;
  v20[3] = &unk_1E58C5548;
  id v21 = v9;
  id v22 = v10;
  id v23 = v12;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__HKKeyValueDomain_setData_forKey_completion___block_invoke_2;
  v18[3] = &unk_1E58BBD88;
  id v19 = v23;
  id v14 = v23;
  id v15 = v10;
  id v16 = v9;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v20 errorHandler:v18];
}

uint64_t __46__HKKeyValueDomain_setData_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setData:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __46__HKKeyValueDomain_setData_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)setDate:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"HKKeyValueDomain.m", 131, @"Invalid parameter not satisfying: %@", @"date == nil || ([date isKindOfClass:[NSDate class]])" object file lineNumber description];
    }
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__37;
  v29 = __Block_byref_object_dispose__37;
  id v30 = 0;
  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __41__HKKeyValueDomain_setDate_forKey_error___block_invoke;
  v20[3] = &unk_1E58C5520;
  id v12 = v9;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  id v23 = &v31;
  uint64_t v24 = &v25;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __41__HKKeyValueDomain_setDate_forKey_error___block_invoke_3;
  v19[3] = &unk_1E58BDBD8;
  v19[4] = &v25;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v20 errorHandler:v19];
  if (*((unsigned char *)v32 + 24))
  {
    BOOL v14 = 1;
  }
  else
  {
    id v15 = (id)v26[5];
    id v16 = v15;
    if (v15)
    {
      if (a5) {
        *a5 = v15;
      }
      else {
        _HKLogDroppedError(v15);
      }
    }

    BOOL v14 = *((unsigned char *)v32 + 24) != 0;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v14;
}

uint64_t __41__HKKeyValueDomain_setDate_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__HKKeyValueDomain_setDate_forKey_error___block_invoke_2;
  v5[3] = &unk_1E58BE050;
  long long v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_setDate:forKey:completion:", v2, v3, v5);
}

void __41__HKKeyValueDomain_setDate_forKey_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __41__HKKeyValueDomain_setDate_forKey_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)setDate:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"HKKeyValueDomain.m", 155, @"Invalid parameter not satisfying: %@", @"date == nil || ([date isKindOfClass:[NSDate class]])" object file lineNumber description];
    }
  }
  id v12 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v11];

  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__HKKeyValueDomain_setDate_forKey_completion___block_invoke;
  v20[3] = &unk_1E58C5548;
  id v21 = v9;
  id v22 = v10;
  id v23 = v12;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__HKKeyValueDomain_setDate_forKey_completion___block_invoke_2;
  v18[3] = &unk_1E58BBD88;
  id v19 = v23;
  id v14 = v23;
  id v15 = v10;
  id v16 = v9;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v20 errorHandler:v18];
}

uint64_t __46__HKKeyValueDomain_setDate_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setDate:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __46__HKKeyValueDomain_setDate_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)setString:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"HKKeyValueDomain.m", 166, @"Invalid parameter not satisfying: %@", @"string == nil || ([string isKindOfClass:[NSString class]])" object file lineNumber description];
    }
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__37;
  v29 = __Block_byref_object_dispose__37;
  id v30 = 0;
  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __43__HKKeyValueDomain_setString_forKey_error___block_invoke;
  v20[3] = &unk_1E58C5520;
  id v12 = v9;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  id v23 = &v31;
  uint64_t v24 = &v25;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __43__HKKeyValueDomain_setString_forKey_error___block_invoke_3;
  v19[3] = &unk_1E58BDBD8;
  v19[4] = &v25;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v20 errorHandler:v19];
  if (*((unsigned char *)v32 + 24))
  {
    BOOL v14 = 1;
  }
  else
  {
    id v15 = (id)v26[5];
    id v16 = v15;
    if (v15)
    {
      if (a5) {
        *a5 = v15;
      }
      else {
        _HKLogDroppedError(v15);
      }
    }

    BOOL v14 = *((unsigned char *)v32 + 24) != 0;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v14;
}

uint64_t __43__HKKeyValueDomain_setString_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__HKKeyValueDomain_setString_forKey_error___block_invoke_2;
  v5[3] = &unk_1E58BE050;
  long long v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_setString:forKey:completion:", v2, v3, v5);
}

void __43__HKKeyValueDomain_setString_forKey_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __43__HKKeyValueDomain_setString_forKey_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"HKKeyValueDomain.m", 190, @"Invalid parameter not satisfying: %@", @"string == nil || ([string isKindOfClass:[NSString class]])" object file lineNumber description];
    }
  }
  id v12 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:v11];

  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48__HKKeyValueDomain_setString_forKey_completion___block_invoke;
  v20[3] = &unk_1E58C5548;
  id v21 = v9;
  id v22 = v10;
  id v23 = v12;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__HKKeyValueDomain_setString_forKey_completion___block_invoke_2;
  v18[3] = &unk_1E58BBD88;
  id v19 = v23;
  id v14 = v23;
  id v15 = v10;
  id v16 = v9;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v20 errorHandler:v18];
}

uint64_t __48__HKKeyValueDomain_setString_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setString:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __48__HKKeyValueDomain_setString_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)setPropertyListValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__37;
  uint64_t v27 = __Block_byref_object_dispose__37;
  id v28 = 0;
  if (v8)
  {
    id v10 = [(HKKeyValueDomain *)self _dataFromPropertyListValue:v8 error:a5];
    if (!v10)
    {
      BOOL v11 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    id v10 = 0;
  }
  proxyProvider = self->_proxyProvider;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__HKKeyValueDomain_setPropertyListValue_forKey_error___block_invoke;
  v18[3] = &unk_1E58C5520;
  id v13 = v10;
  id v19 = v13;
  id v20 = v9;
  id v21 = &v29;
  id v22 = &v23;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__HKKeyValueDomain_setPropertyListValue_forKey_error___block_invoke_3;
  v17[3] = &unk_1E58BDBD8;
  v17[4] = &v23;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v18 errorHandler:v17];
  if (*((unsigned char *)v30 + 24))
  {
    BOOL v11 = 1;
  }
  else
  {
    id v14 = (id)v24[5];
    id v15 = v14;
    if (v14)
    {
      if (a5) {
        *a5 = v14;
      }
      else {
        _HKLogDroppedError(v14);
      }
    }

    BOOL v11 = *((unsigned char *)v30 + 24) != 0;
  }

LABEL_13:
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v11;
}

uint64_t __54__HKKeyValueDomain_setPropertyListValue_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__HKKeyValueDomain_setPropertyListValue_forKey_error___block_invoke_2;
  v5[3] = &unk_1E58BE050;
  long long v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "remote_setData:forKey:completion:", v2, v3, v5);
}

void __54__HKKeyValueDomain_setPropertyListValue_forKey_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __54__HKKeyValueDomain_setPropertyListValue_forKey_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)setPropertyListValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  if (v8)
  {
    id v21 = 0;
    BOOL v11 = [(HKKeyValueDomain *)self _dataFromPropertyListValue:v8 error:&v21];
    id v12 = v21;
    id v13 = v12;
    if (!v11)
    {
      ((void (**)(void, void, id))v10)[2](v10, 0, v12);
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__HKKeyValueDomain_setPropertyListValue_forKey_completion___block_invoke;
  v17[3] = &unk_1E58C5548;
  id v18 = v11;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__HKKeyValueDomain_setPropertyListValue_forKey_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v13 = v11;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];

LABEL_7:
}

uint64_t __59__HKKeyValueDomain_setPropertyListValue_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setData:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __59__HKKeyValueDomain_setPropertyListValue_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setValuesWithDictionary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__HKKeyValueDomain_setValuesWithDictionary_completion___block_invoke;
  v13[3] = &unk_1E58C5570;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HKKeyValueDomain_setValuesWithDictionary_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __55__HKKeyValueDomain_setValuesWithDictionary_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setValuesWithDictionary:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __55__HKKeyValueDomain_setValuesWithDictionary_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeValuesForKeys:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__HKKeyValueDomain_removeValuesForKeys_completion___block_invoke;
  v13[3] = &unk_1E58C5570;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__HKKeyValueDomain_removeValuesForKeys_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __51__HKKeyValueDomain_removeValuesForKeys_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removeValuesForKeys:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __51__HKKeyValueDomain_removeValuesForKeys_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setValueForAllKeys:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__HKKeyValueDomain_setValueForAllKeys_completion___block_invoke;
  v13[3] = &unk_1E58C5570;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__HKKeyValueDomain_setValueForAllKeys_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __50__HKKeyValueDomain_setValueForAllKeys_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setValueForAllKeys:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __50__HKKeyValueDomain_setValueForAllKeys_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)numberForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__37;
  uint64_t v29 = __Block_byref_object_dispose__37;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__37;
  uint64_t v23 = __Block_byref_object_dispose__37;
  id v24 = 0;
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__HKKeyValueDomain_numberForKey_error___block_invoke;
  v15[3] = &unk_1E58C5598;
  id v8 = v6;
  id v16 = v8;
  v17 = &v25;
  id v18 = &v19;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__HKKeyValueDomain_numberForKey_error___block_invoke_3;
  v14[3] = &unk_1E58BDBD8;
  v14[4] = &v19;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v15 errorHandler:v14];
  id v9 = (void *)v26[5];
  if (!v9)
  {
    id v10 = (id)v20[5];
    BOOL v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError(v10);
      }
    }

    id v9 = (void *)v26[5];
  }
  id v12 = v9;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

uint64_t __39__HKKeyValueDomain_numberForKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__HKKeyValueDomain_numberForKey_error___block_invoke_2;
  v4[3] = &unk_1E58C5318;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_numberForKey:completion:", v2, v4);
}

void __39__HKKeyValueDomain_numberForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __39__HKKeyValueDomain_numberForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)numberForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__HKKeyValueDomain_numberForKey_completion___block_invoke;
  v13[3] = &unk_1E58C5570;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__HKKeyValueDomain_numberForKey_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __44__HKKeyValueDomain_numberForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_numberForKey:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __44__HKKeyValueDomain_numberForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__37;
  uint64_t v29 = __Block_byref_object_dispose__37;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__37;
  uint64_t v23 = __Block_byref_object_dispose__37;
  id v24 = 0;
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __37__HKKeyValueDomain_dataForKey_error___block_invoke;
  v15[3] = &unk_1E58C5598;
  id v8 = v6;
  id v16 = v8;
  v17 = &v25;
  id v18 = &v19;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__HKKeyValueDomain_dataForKey_error___block_invoke_3;
  v14[3] = &unk_1E58BDBD8;
  v14[4] = &v19;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v15 errorHandler:v14];
  id v9 = (void *)v26[5];
  if (!v9)
  {
    id v10 = (id)v20[5];
    id v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError(v10);
      }
    }

    id v9 = (void *)v26[5];
  }
  id v12 = v9;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

uint64_t __37__HKKeyValueDomain_dataForKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__HKKeyValueDomain_dataForKey_error___block_invoke_2;
  v4[3] = &unk_1E58C55C0;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_dataForKey:completion:", v2, v4);
}

void __37__HKKeyValueDomain_dataForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __37__HKKeyValueDomain_dataForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)dataForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__HKKeyValueDomain_dataForKey_completion___block_invoke;
  v13[3] = &unk_1E58C5570;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__HKKeyValueDomain_dataForKey_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __42__HKKeyValueDomain_dataForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_dataForKey:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __42__HKKeyValueDomain_dataForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)dateForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__37;
  uint64_t v29 = __Block_byref_object_dispose__37;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__37;
  uint64_t v23 = __Block_byref_object_dispose__37;
  id v24 = 0;
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __37__HKKeyValueDomain_dateForKey_error___block_invoke;
  v15[3] = &unk_1E58C5598;
  id v8 = v6;
  id v16 = v8;
  v17 = &v25;
  id v18 = &v19;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__HKKeyValueDomain_dateForKey_error___block_invoke_3;
  v14[3] = &unk_1E58BDBD8;
  v14[4] = &v19;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v15 errorHandler:v14];
  id v9 = (void *)v26[5];
  if (!v9)
  {
    id v10 = (id)v20[5];
    id v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError(v10);
      }
    }

    id v9 = (void *)v26[5];
  }
  id v12 = v9;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

uint64_t __37__HKKeyValueDomain_dateForKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__HKKeyValueDomain_dateForKey_error___block_invoke_2;
  v4[3] = &unk_1E58BE078;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_dateForKey:completion:", v2, v4);
}

void __37__HKKeyValueDomain_dateForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __37__HKKeyValueDomain_dateForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)dateForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__HKKeyValueDomain_dateForKey_completion___block_invoke;
  v13[3] = &unk_1E58C5570;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__HKKeyValueDomain_dateForKey_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __42__HKKeyValueDomain_dateForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_dateForKey:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __42__HKKeyValueDomain_dateForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)stringForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__37;
  uint64_t v29 = __Block_byref_object_dispose__37;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__37;
  uint64_t v23 = __Block_byref_object_dispose__37;
  id v24 = 0;
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__HKKeyValueDomain_stringForKey_error___block_invoke;
  v15[3] = &unk_1E58C5598;
  id v8 = v6;
  id v16 = v8;
  v17 = &v25;
  id v18 = &v19;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__HKKeyValueDomain_stringForKey_error___block_invoke_3;
  v14[3] = &unk_1E58BDBD8;
  v14[4] = &v19;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v15 errorHandler:v14];
  id v9 = (void *)v26[5];
  if (!v9)
  {
    id v10 = (id)v20[5];
    id v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError(v10);
      }
    }

    id v9 = (void *)v26[5];
  }
  id v12 = v9;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

uint64_t __39__HKKeyValueDomain_stringForKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__HKKeyValueDomain_stringForKey_error___block_invoke_2;
  v4[3] = &unk_1E58C55E8;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_stringForKey:completion:", v2, v4);
}

void __39__HKKeyValueDomain_stringForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __39__HKKeyValueDomain_stringForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)stringForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__HKKeyValueDomain_stringForKey_completion___block_invoke;
  v13[3] = &unk_1E58C5570;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__HKKeyValueDomain_stringForKey_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __44__HKKeyValueDomain_stringForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stringForKey:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __44__HKKeyValueDomain_stringForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)propertyListValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__37;
  uint64_t v29 = __Block_byref_object_dispose__37;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__37;
  uint64_t v23 = __Block_byref_object_dispose__37;
  id v24 = 0;
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__HKKeyValueDomain_propertyListValueForKey_error___block_invoke;
  v15[3] = &unk_1E58C5598;
  id v8 = v6;
  id v16 = v8;
  v17 = &v25;
  id v18 = &v19;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__HKKeyValueDomain_propertyListValueForKey_error___block_invoke_3;
  v14[3] = &unk_1E58BDBD8;
  v14[4] = &v19;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v15 errorHandler:v14];
  uint64_t v9 = v26[5];
  if (v9)
  {
    id v10 = [(HKKeyValueDomain *)self _propertyListValueFromData:v9 error:a4];
  }
  else
  {
    id v11 = (id)v20[5];
    id v12 = v11;
    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      else {
        _HKLogDroppedError(v11);
      }
    }

    id v10 = 0;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v10;
}

uint64_t __50__HKKeyValueDomain_propertyListValueForKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__HKKeyValueDomain_propertyListValueForKey_error___block_invoke_2;
  v4[3] = &unk_1E58C55C0;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_dataForKey:completion:", v2, v4);
}

void __50__HKKeyValueDomain_propertyListValueForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __50__HKKeyValueDomain_propertyListValueForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)propertyListValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__HKKeyValueDomain_propertyListValueForKey_completion___block_invoke;
  v13[3] = &unk_1E58C5548;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HKKeyValueDomain_propertyListValueForKey_completion___block_invoke_3;
  v11[3] = &unk_1E58BBD88;
  id v12 = v16;
  id v9 = v16;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

void __55__HKKeyValueDomain_propertyListValueForKey_completion___block_invoke(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__HKKeyValueDomain_propertyListValueForKey_completion___block_invoke_2;
  v5[3] = &unk_1E58C5610;
  uint64_t v3 = a1[4];
  v4 = (void *)a1[6];
  void v5[4] = a1[5];
  id v6 = v4;
  objc_msgSend(a2, "remote_dataForKey:completion:", v3, v5);
}

void __55__HKKeyValueDomain_propertyListValueForKey_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    id v8 = v5;
    a2 = [v6 _propertyListValueFromData:a2 error:&v8];
    id v7 = v8;

    id v5 = v7;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __55__HKKeyValueDomain_propertyListValueForKey_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_dataFromPropertyListValue:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:a4];
}

- (id)_propertyListValueFromData:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:a4];
}

- (id)allValuesWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__37;
  id v22 = __Block_byref_object_dispose__37;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__37;
  id v16 = __Block_byref_object_dispose__37;
  id v17 = 0;
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__HKKeyValueDomain_allValuesWithError___block_invoke;
  v11[3] = &unk_1E58C5638;
  void v11[4] = &v18;
  v11[5] = &v12;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__HKKeyValueDomain_allValuesWithError___block_invoke_3;
  v10[3] = &unk_1E58BDBD8;
  v10[4] = &v12;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v11 errorHandler:v10];
  id v5 = (void *)v19[5];
  if (!v5)
  {
    id v6 = (id)v13[5];
    id v7 = v6;
    if (v6)
    {
      if (a3) {
        *a3 = v6;
      }
      else {
        _HKLogDroppedError(v6);
      }
    }

    id v5 = (void *)v19[5];
  }
  id v8 = v5;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

uint64_t __39__HKKeyValueDomain_allValuesWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__HKKeyValueDomain_allValuesWithError___block_invoke_2;
  v3[3] = &unk_1E58C4050;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_allValuesWithCompletion:", v3);
}

void __39__HKKeyValueDomain_allValuesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __39__HKKeyValueDomain_allValuesWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)allValuesWithCompletion:(id)a3
{
  long long v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__HKKeyValueDomain_allValuesWithCompletion___block_invoke;
  v9[3] = &unk_1E58C5660;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HKKeyValueDomain_allValuesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __44__HKKeyValueDomain_allValuesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_allValuesWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __44__HKKeyValueDomain_allValuesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startObservation:(id)a3
{
}

- (void)_startObservation:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  observers = self->_observers;
  uint64_t v9 = [(HKProxyProvider *)self->_proxyProvider clientQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__HKKeyValueDomain__startObservation_withCompletion___block_invoke;
  v11[3] = &unk_1E58C5688;
  id v13 = &v14;
  void v11[4] = self;
  id v10 = v7;
  id v12 = v10;
  [(HKKeyValueDomainObserver *)observers registerObserver:v6 queue:v9 runIfFirstObserver:v11];

  if (!*((unsigned char *)v15 + 24)) {
    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
  }

  _Block_object_dispose(&v14, 8);
}

uint64_t __53__HKKeyValueDomain__startObservation_withCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return [*(id *)(a1 + 32) _registerFirstObserverWithCompletion:*(void *)(a1 + 40)];
}

- (void)stopObservation:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__HKKeyValueDomain_stopObservation___block_invoke;
  v4[3] = &unk_1E58BBA00;
  void v4[4] = self;
  [(HKKeyValueDomainObserver *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __36__HKKeyValueDomain_stopObservation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterLastObserver];
}

- (void)_registerFirstObserverWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HKKeyValueDomain__registerFirstObserverWithCompletion___block_invoke;
  v6[3] = &unk_1E58BBA50;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKKeyValueDomain *)self _observeKeyValueDomainChanges:1 completion:v6];
}

void __57__HKKeyValueDomain__registerFirstObserverWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      __57__HKKeyValueDomain__registerFirstObserverWithCompletion___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_unregisterLastObserver
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__HKKeyValueDomain__unregisterLastObserver__block_invoke;
  v2[3] = &unk_1E58BBE28;
  v2[4] = self;
  [(HKKeyValueDomain *)self _observeKeyValueDomainChanges:0 completion:v2];
}

void __43__HKKeyValueDomain__unregisterLastObserver__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_INFO, "%{public}@: unable to unregister observing changes: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_observeKeyValueDomainChanges:(BOOL)a3 completion:(id)a4
{
  id v6 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HKKeyValueDomain__observeKeyValueDomainChanges_completion___block_invoke;
  v11[3] = &unk_1E58C56B0;
  BOOL v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HKKeyValueDomain__observeKeyValueDomainChanges_completion___block_invoke_2;
  v9[3] = &unk_1E58BBD88;
  id v10 = v12;
  id v8 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v11 errorHandler:v9];
}

uint64_t __61__HKKeyValueDomain__observeKeyValueDomainChanges_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_observeChanges:completion:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __61__HKKeyValueDomain__observeKeyValueDomainChanges_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleAutomaticProxyReconnection
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_19C023000, a2, a3, "[%{public}@] Failed to resume observation on server reconnection: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

uint64_t __53__HKKeyValueDomain__handleAutomaticProxyReconnection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didUpdateKeyValueDomain:*(void *)(a1 + 32)];
}

- (BOOL)_synchronouslyRegisterToObserveKeyValueDomainChanges:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__37;
  id v15 = __Block_byref_object_dispose__37;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__HKKeyValueDomain__synchronouslyRegisterToObserveKeyValueDomainChanges___block_invoke;
  v10[3] = &unk_1E58C5638;
  v10[4] = &v17;
  void v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__HKKeyValueDomain__synchronouslyRegisterToObserveKeyValueDomainChanges___block_invoke_3;
  v9[3] = &unk_1E58BDBD8;
  void v9[4] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError(v5);
    }
  }

  char v7 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __73__HKKeyValueDomain__synchronouslyRegisterToObserveKeyValueDomainChanges___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__HKKeyValueDomain__synchronouslyRegisterToObserveKeyValueDomainChanges___block_invoke_2;
  v3[3] = &unk_1E58BE050;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_observeChanges:completion:", 1, v3);
}

void __73__HKKeyValueDomain__synchronouslyRegisterToObserveKeyValueDomainChanges___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __73__HKKeyValueDomain__synchronouslyRegisterToObserveKeyValueDomainChanges___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)clientRemote_didUpdate
{
  observers = self->_observers;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__HKKeyValueDomain_clientRemote_didUpdate__block_invoke;
  v3[3] = &unk_1E58C56D8;
  void v3[4] = self;
  [(HKKeyValueDomainObserver *)observers notifyObservers:v3];
}

uint64_t __42__HKKeyValueDomain_clientRemote_didUpdate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didUpdateKeyValueDomain:*(void *)(a1 + 32)];
}

+ (id)serverInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53450];
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED534B0];
}

- (id)exportedInterface
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 clientInterface];
}

- (id)remoteInterface
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 serverInterface];
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)healthAppDefaultsDomainWithHealthStore:(id)a3
{
  id v3 = a3;
  long long v4 = [[HKKeyValueDomain alloc] initWithCategory:2 domainName:@"com.apple.Health" healthStore:v3];

  return v4;
}

+ (id)healthArticlesDefaultsDomainWithHealthStore:(id)a3
{
  id v3 = a3;
  long long v4 = [[HKKeyValueDomain alloc] initWithCategory:2 domainName:@"com.apple.Health.Articles" healthStore:v3];

  return v4;
}

+ (id)safetyDefaultsDomainWithHealthStore:(id)a3
{
  id v3 = a3;
  long long v4 = [[HKKeyValueDomain alloc] initWithCategory:2 domainName:@"com.apple.Safety" healthStore:v3];

  return v4;
}

+ (id)safetyDefaultsLocalDomainWithHealthStore:(id)a3
{
  id v3 = a3;
  long long v4 = [[HKKeyValueDomain alloc] initWithCategory:1 domainName:@"com.apple.Safety" healthStore:v3];

  return v4;
}

+ (id)emergencyDefaultsDomainWithHealthStore:(id)a3
{
  id v3 = a3;
  long long v4 = [[HKKeyValueDomain alloc] initWithCategory:2 domainName:@"com.apple.Health.Emergency" healthStore:v3];

  return v4;
}

void __57__HKKeyValueDomain__registerFirstObserverWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&void v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_19C023000, a2, a3, "%{public}@: unable to register to observe changes: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end