@interface HKLookUpAppPrivacyPolicyURLOperation
- (AMSPromise)outstandingPromise;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (HKLookUpAppPrivacyPolicyURLOperation)init;
- (HKLookUpAppPrivacyPolicyURLOperation)initWithBundleIdentifier:(id)a3;
- (NSError)error;
- (NSString)bundleIdentifier;
- (NSURL)privacyPolicyURL;
- (id)debugDescription;
- (id)description;
- (void)_performLookup;
- (void)cancel;
- (void)setError:(id)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setOutstandingPromise:(id)a3;
- (void)setPrivacyPolicyURL:(id)a3;
- (void)start;
@end

@implementation HKLookUpAppPrivacyPolicyURLOperation

- (HKLookUpAppPrivacyPolicyURLOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKLookUpAppPrivacyPolicyURLOperation)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKLookUpAppPrivacyPolicyURLOperation;
  v5 = [(HKLookUpAppPrivacyPolicyURLOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(HKLookUpAppPrivacyPolicyURLOperation *)self bundleIdentifier];
  uint64_t v6 = HKSensitiveLogItem();
  v7 = (void *)[v3 initWithFormat:@"<%@:%p bundleIdentifier: %@>", v4, self, v6];

  return v7;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(HKLookUpAppPrivacyPolicyURLOperation *)self bundleIdentifier];
  uint64_t v6 = HKSensitiveLogItem();
  v10.receiver = self;
  v10.super_class = (Class)HKLookUpAppPrivacyPolicyURLOperation;
  v7 = [(HKLookUpAppPrivacyPolicyURLOperation *)&v10 debugDescription];
  v8 = (void *)[v3 initWithFormat:@"<%@:%p bundleIdentifier: %@, operationDescription: %@>", v4, self, v6, v7];

  return v8;
}

- (void)cancel
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (![(HKLookUpAppPrivacyPolicyURLOperation *)v2 isFinished])
  {
    v5.receiver = v2;
    v5.super_class = (Class)HKLookUpAppPrivacyPolicyURLOperation;
    [(HKLookUpAppPrivacyPolicyURLOperation *)&v5 cancel];
    id v3 = [(HKLookUpAppPrivacyPolicyURLOperation *)v2 outstandingPromise];
    [v3 cancel];

    [(HKLookUpAppPrivacyPolicyURLOperation *)v2 setOutstandingPromise:0];
    _HKInitializeLogging();
    uint64_t v4 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v7 = v2;
      _os_log_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_INFO, "%{public}@ did cancel", buf, 0xCu);
    }
    [(HKLookUpAppPrivacyPolicyURLOperation *)v2 setExecuting:0];
    [(HKLookUpAppPrivacyPolicyURLOperation *)v2 setFinished:1];
  }
  objc_sync_exit(v2);
}

- (void)_performLookup
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F4DBD8];
  uint64_t v4 = [MEMORY[0x1E4F4DD40] bagSubProfile];
  objc_super v5 = [MEMORY[0x1E4F4DD40] bagSubProfileVersion];
  uint64_t v6 = [v3 bagForProfile:v4 profileVersion:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F4DD40]);
  uint64_t v8 = (void *)[v7 initWithType:0 clientIdentifier:*MEMORY[0x1E4F2BDC0] clientVersion:@"1" bag:v6];
  objc_super v9 = [(HKLookUpAppPrivacyPolicyURLOperation *)self bundleIdentifier];
  v13[0] = v9;
  objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v8 setBundleIdentifiers:v10];

  [v8 setAdditionalQueryParams:&unk_1F3C22C88];
  v11 = [v8 perform];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__HKLookUpAppPrivacyPolicyURLOperation__performLookup__block_invoke;
  v12[3] = &unk_1E6D53AF0;
  v12[4] = self;
  [v11 addFinishBlock:v12];
  [(HKLookUpAppPrivacyPolicyURLOperation *)self setOutstandingPromise:v11];
}

void __54__HKLookUpAppPrivacyPolicyURLOperation__performLookup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v24 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v6 = (id *)(a1 + 32);
  id v8 = v7;
  objc_sync_enter(v8);
  if (([*v6 isCancelled] & 1) == 0)
  {
    if (v5)
    {
      objc_super v9 = [v5 responseDataItems];
      objc_super v10 = [v9 firstObject];
      v11 = [v10 objectForKeyedSubscript:@"attributes"];
      v12 = [v11 objectForKeyedSubscript:@"platformAttributes"];
      v13 = [v12 objectForKeyedSubscript:@"ios"];
      v14 = [v13 objectForKeyedSubscript:@"privacyPolicyUrl"];
      objc_opt_class();
      v23 = HKSafeObject();
      id v15 = 0;

      v16 = (os_log_t *)MEMORY[0x1E4F29F38];
      if (v15)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR)) {
          __54__HKLookUpAppPrivacyPolicyURLOperation__performLookup__block_invoke_cold_2();
        }
      }
      if (v23)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
        if (v17)
        {
          _HKInitializeLogging();
          os_log_t v18 = *v16;
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_INFO))
          {
            v19 = v18;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              id v20 = *v6;
              v21 = [*v6 privacyPolicyURL];
              v22 = HKSensitiveLogItem();
              *(_DWORD *)buf = 138543618;
              id v26 = v20;
              __int16 v27 = 2112;
              v28 = v22;
              _os_log_impl(&dword_1E0B26000, v19, OS_LOG_TYPE_INFO, "%{public}@ did finish with privacy policy URL: %@", buf, 0x16u);
            }
          }
        }
      }
      else
      {
        v17 = 0;
      }
      [*v6 setPrivacyPolicyURL:v17];
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
        __54__HKLookUpAppPrivacyPolicyURLOperation__performLookup__block_invoke_cold_1();
      }
      id v15 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://www.apple.com/healthcare/health-records/"];
      [*v6 setPrivacyPolicyURL:v15];
    }

    [*v6 setError:v24];
    [*v6 setExecuting:0];
    [*v6 setFinished:1];
    [*v6 setOutstandingPromise:0];
  }
  objc_sync_exit(v8);
}

- (void)start
{
  obj = self;
  objc_sync_enter(obj);
  if (([(HKLookUpAppPrivacyPolicyURLOperation *)obj isReady] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"-start received by operation %@", obj format];
  }
  if ([(HKLookUpAppPrivacyPolicyURLOperation *)obj isCancelled])
  {
    [(HKLookUpAppPrivacyPolicyURLOperation *)obj setFinished:1];
  }
  else
  {
    [(HKLookUpAppPrivacyPolicyURLOperation *)obj setExecuting:1];
    [(HKLookUpAppPrivacyPolicyURLOperation *)obj _performLookup];
  }
  objc_sync_exit(obj);
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)setExecuting:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  [(HKLookUpAppPrivacyPolicyURLOperation *)obj willChangeValueForKey:@"isExecuting"];
  obj->_executing = a3;
  [(HKLookUpAppPrivacyPolicyURLOperation *)obj didChangeValueForKey:@"isExecuting"];
  objc_sync_exit(obj);
}

- (BOOL)isExecuting
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL executing = v2->_executing;
  objc_sync_exit(v2);

  return executing;
}

- (void)setFinished:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  [(HKLookUpAppPrivacyPolicyURLOperation *)obj willChangeValueForKey:@"isFinished"];
  obj->_finished = a3;
  [(HKLookUpAppPrivacyPolicyURLOperation *)obj didChangeValueForKey:@"isFinished"];
  objc_sync_exit(obj);
}

- (BOOL)isFinished
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL finished = v2->_finished;
  objc_sync_exit(v2);

  return finished;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)privacyPolicyURL
{
  return (NSURL *)objc_getProperty(self, a2, 264, 1);
}

- (void)setPrivacyPolicyURL:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 272, 1);
}

- (void)setError:(id)a3
{
}

- (AMSPromise)outstandingPromise
{
  return (AMSPromise *)objc_getProperty(self, a2, 280, 1);
}

- (void)setOutstandingPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingPromise, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

void __54__HKLookUpAppPrivacyPolicyURLOperation__performLookup__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "%{public}@ failed to look up privacy policy URL: %{public}@");
}

void __54__HKLookUpAppPrivacyPolicyURLOperation__performLookup__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, v0, v1, "%{public}@ encountered error parsing the privacy policy URL: %{public}@");
}

@end