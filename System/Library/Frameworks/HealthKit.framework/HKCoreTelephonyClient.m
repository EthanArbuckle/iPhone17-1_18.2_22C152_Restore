@interface HKCoreTelephonyClient
- (BOOL)isEmergencyServicePhoneNumber:(id)a3;
- (HKCoreTelephonyClient)init;
- (HKCoreTelephonyClient)initWithQueue:(id)a3;
- (void)activeSubscriptionsDidChange;
- (void)dealloc;
- (void)fetchMobileCountryCodeFromCellularWithCompletion:(id)a3;
- (void)invalidateCachedCountryCode;
- (void)onForeground:(id)a3;
- (void)plmnChanged:(id)a3 plmn:(id)a4;
- (void)simLessSubscriptionsDidChange;
- (void)subscriptionInfoDidChange;
@end

@implementation HKCoreTelephonyClient

- (HKCoreTelephonyClient)initWithQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKCoreTelephonyClient;
  v6 = [(HKCoreTelephonyClient *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v7->_queue];
    client = v7->_client;
    v7->_client = (CoreTelephonyClient *)v8;

    [(CoreTelephonyClient *)v7->_client setDelegate:v7];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel_onForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
  }
  return v7;
}

- (HKCoreTelephonyClient)init
{
  v3 = HKCreateSerialDispatchQueue(self, @"HKCoreTelephonyClient");
  v4 = [(HKCoreTelephonyClient *)self initWithQueue:v3];

  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKCoreTelephonyClient;
  [(HKCoreTelephonyClient *)&v4 dealloc];
}

- (void)fetchMobileCountryCodeFromCellularWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, void *, void))a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (void *)[(NSString *)self->_cachedCountryCode copy];
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    v4[2](v4, v5, 0);
  }
  else
  {
    client = self->_client;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__HKCoreTelephonyClient_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke;
    v7[3] = &unk_1E58C4B40;
    v7[4] = self;
    uint64_t v8 = v4;
    [(CoreTelephonyClient *)client getCurrentDataSubscriptionContext:v7];
  }
}

void __74__HKCoreTelephonyClient_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(v3 + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__HKCoreTelephonyClient_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_2;
  v5[3] = &unk_1E58C4B18;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  [v4 copyMobileCountryCode:a2 completion:v5];
}

void __74__HKCoreTelephonyClient_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  id v6 = a3;
  id v10 = a2;
  os_unfair_lock_lock(v5);
  uint64_t v7 = [v10 copy];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v7;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)isEmergencyServicePhoneNumber:(id)a3
{
  id v4 = a3;
  client = self->_client;
  id v15 = 0;
  id v6 = [(CoreTelephonyClient *)client getCurrentDataSubscriptionContextSync:&v15];
  id v7 = v15;
  if (v7)
  {
    _HKInitializeLogging();
    uint64_t v8 = HKLogMedicalID;
    if (os_log_type_enabled((os_log_t)HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
      -[HKCoreTelephonyClient isEmergencyServicePhoneNumber:]((uint64_t)v7, v8);
    }
    char v9 = 0;
  }
  else
  {
    id v10 = self->_client;
    id v14 = 0;
    char v9 = [(CoreTelephonyClient *)v10 isEmergencyNumberWithWhitelistIncluded:v6 number:v4 error:&v14];
    id v11 = v14;
    if (v11)
    {
      _HKInitializeLogging();
      objc_super v12 = HKLogMedicalID;
      if (os_log_type_enabled((os_log_t)HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
        -[HKCoreTelephonyClient isEmergencyServicePhoneNumber:]((uint64_t)v11, v12);
      }
      char v9 = 0;
    }
  }
  return v9;
}

- (void)invalidateCachedCountryCode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedCountryCode = self->_cachedCountryCode;
  self->_cachedCountryCode = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)onForeground:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v4 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2082;
    char v9 = "-[HKCoreTelephonyClient onForeground:]";
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_INFO, "[%{public}@.%{public}s] flushing caches", (uint8_t *)&v6, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  cachedCountryCode = self->_cachedCountryCode;
  self->_cachedCountryCode = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)plmnChanged:(id)a3 plmn:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v5 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2082;
    char v9 = "-[HKCoreTelephonyClient plmnChanged:plmn:]";
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_INFO, "[%{public}@.%{public}s]", (uint8_t *)&v6, 0x16u);
  }
  [(HKCoreTelephonyClient *)self invalidateCachedCountryCode];
}

- (void)subscriptionInfoDidChange
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v3 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543618;
    id v5 = self;
    __int16 v6 = 2082;
    id v7 = "-[HKCoreTelephonyClient subscriptionInfoDidChange]";
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_INFO, "[%{public}@.%{public}s]", (uint8_t *)&v4, 0x16u);
  }
  [(HKCoreTelephonyClient *)self invalidateCachedCountryCode];
}

- (void)activeSubscriptionsDidChange
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v3 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543618;
    id v5 = self;
    __int16 v6 = 2082;
    id v7 = "-[HKCoreTelephonyClient activeSubscriptionsDidChange]";
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_INFO, "[%{public}@.%{public}s]", (uint8_t *)&v4, 0x16u);
  }
  [(HKCoreTelephonyClient *)self invalidateCachedCountryCode];
}

- (void)simLessSubscriptionsDidChange
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v3 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543618;
    id v5 = self;
    __int16 v6 = 2082;
    id v7 = "-[HKCoreTelephonyClient simLessSubscriptionsDidChange]";
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_INFO, "[%{public}@.%{public}s]", (uint8_t *)&v4, 0x16u);
  }
  [(HKCoreTelephonyClient *)self invalidateCachedCountryCode];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCountryCode, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)isEmergencyServicePhoneNumber:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Error validating if number is emergency number with error, %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)isEmergencyServicePhoneNumber:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Failed to get CTXPCServiceSubscriptionInfo with error, %{public}@", (uint8_t *)&v2, 0xCu);
}

@end