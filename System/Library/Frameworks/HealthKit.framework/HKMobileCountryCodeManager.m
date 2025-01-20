@interface HKMobileCountryCodeManager
+ (BOOL)isOverridePresent;
+ (id)overrideMobileCountryCode;
+ (void)setOverrideMobileCountryCode:(id)a3;
- (BOOL)_isLocationAvailableWithError:(id *)a3;
- (HKMobileCountryCodeManager)init;
- (id)_wrapperWithMobileCountryCode:(id)a3 error:(id *)a4;
- (id)copyISOCountryCodeForMobileCountryCode:(id)a3 error:(id *)a4;
- (id)currentCountryCode;
- (id)currentEstimate;
- (id)mobileCountryCodeFromCellularWithError:(id *)a3;
- (void)_submitAnalyticsForError:(id)a3 mobileCountryCode:(id)a4;
- (void)dealloc;
- (void)fetchISOCountryCodeFromCellularWithCompletion:(id)a3;
- (void)fetchMobileCountryCodeFromCellularWithCompletion:(id)a3;
@end

@implementation HKMobileCountryCodeManager

- (HKMobileCountryCodeManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)HKMobileCountryCodeManager;
  v2 = [(HKMobileCountryCodeManager *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v4 = HKCreateSerialDispatchQueue(v2, @"mobile-country-code.telephony");
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v4];
    coreTelephonyClient = v3->_coreTelephonyClient;
    v3->_coreTelephonyClient = (CoreTelephonyClient *)v5;

    [(CoreTelephonyClient *)v3->_coreTelephonyClient setDelegate:v3];
    v3->_coreTelephonyServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
    v7 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x1E4F4BE78]);
    radiosPreferences = v3->_radiosPreferences;
    v3->_radiosPreferences = v7;
  }
  return v3;
}

- (void)dealloc
{
  coreTelephonyServerConnection = self->_coreTelephonyServerConnection;
  if (coreTelephonyServerConnection) {
    CFRelease(coreTelephonyServerConnection);
  }
  v4.receiver = self;
  v4.super_class = (Class)HKMobileCountryCodeManager;
  [(HKMobileCountryCodeManager *)&v4 dealloc];
}

- (void)fetchISOCountryCodeFromCellularWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__HKMobileCountryCodeManager_fetchISOCountryCodeFromCellularWithCompletion___block_invoke;
  v6[3] = &unk_1E58C9C48;
  id v7 = v4;
  id v5 = v4;
  [(HKMobileCountryCodeManager *)self fetchMobileCountryCodeFromCellularWithCompletion:v6];
}

void __76__HKMobileCountryCodeManager_fetchISOCountryCodeFromCellularWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 ISOCode];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)fetchMobileCountryCodeFromCellularWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void, HKMobileCountryCode *))a3;
  id v14 = 0;
  BOOL v5 = [(HKMobileCountryCodeManager *)self _isLocationAvailableWithError:&v14];
  id v6 = (HKMobileCountryCode *)v14;
  if (v5)
  {
    id v7 = [(id)objc_opt_class() _overrideISOCountryCode];
    if (v7)
    {
      _HKInitializeLogging();
      v8 = HKLogInfrastructure();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v16 = v9;
        __int16 v17 = 2114;
        v18 = v7;
        _os_log_impl(&dword_19C023000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Returning ISO country code override override: %{public}@", buf, 0x16u);
      }

      if ([v7 isEqualToString:@"NONE"])
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 109, @"OVERRIDE: No estimate available");
        objc_super v10 = (HKMobileCountryCode *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, 0, v10);
      }
      else
      {
        objc_super v10 = [[HKMobileCountryCode alloc] initWithMobileCountryCode:&stru_1EEC60288 ISOCode:v7 isOverridden:1];
        ((void (**)(id, HKMobileCountryCode *, HKMobileCountryCode *))v4)[2](v4, v10, 0);
      }
    }
    else
    {
      coreTelephonyClient = self->_coreTelephonyClient;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke;
      v12[3] = &unk_1E58C4B40;
      v12[4] = self;
      v13 = v4;
      [(CoreTelephonyClient *)coreTelephonyClient getCurrentDataSubscriptionContext:v12];
    }
  }
  else
  {
    v4[2](v4, 0, v6);
  }
}

void __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 8);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_29;
    v10[3] = &unk_1E58C4B18;
    v10[4] = v6;
    id v11 = *(id *)(a1 + 40);
    [v7 copyMobileCountryCode:a2 completion:v10];
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 109, @"Failed to get current data subscription context", v5);
    _HKInitializeLogging();
    uint64_t v9 = HKLogInfrastructure();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) _submitAnalyticsForError:@"Nil data subscription context" mobileCountryCode:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 109, @"Failed to get mobile country code", v5);
    _HKInitializeLogging();
    v8 = HKLogInfrastructure();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_29_cold_2();
    }

    [*(id *)(a1 + 32) _submitAnalyticsForError:@"Error getting mobile country code" mobileCountryCode:0];
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    objc_super v10 = *(void **)(a1 + 32);
    id v12 = 0;
    id v7 = [v10 _wrapperWithMobileCountryCode:a2 error:&v12];
    id v6 = v12;
    if (v6)
    {
      _HKInitializeLogging();
      id v11 = HKLogInfrastructure();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_29_cold_1();
      }

      uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
  }
  v9();
}

- (id)mobileCountryCodeFromCellularWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (-[HKMobileCountryCodeManager _isLocationAvailableWithError:](self, "_isLocationAvailableWithError:"))
  {
    id v5 = [(id)objc_opt_class() _overrideISOCountryCode];
    if (v5)
    {
      _HKInitializeLogging();
      id v6 = HKLogInfrastructure();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = objc_opt_class();
        __int16 v21 = 2114;
        v22 = v5;
        _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Returning ISO country code override override: %{public}@", buf, 0x16u);
      }

      if ([v5 isEqualToString:@"NONE"])
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 109, @"OVERRIDE: No estimate available");
        id v7 = 0;
      }
      else
      {
        id v7 = [[HKMobileCountryCode alloc] initWithMobileCountryCode:&stru_1EEC60288 ISOCode:v5 isOverridden:1];
      }
    }
    else
    {
      coreTelephonyClient = self->_coreTelephonyClient;
      id v18 = 0;
      uint64_t v9 = [(CoreTelephonyClient *)coreTelephonyClient getCurrentDataSubscriptionContextSync:&v18];
      id v10 = v18;
      if (v9)
      {
        id v11 = self->_coreTelephonyClient;
        id v17 = v10;
        id v12 = (void *)[(CoreTelephonyClient *)v11 copyMobileCountryCode:v9 error:&v17];
        id v13 = v17;

        if (v13)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a3, 109, @"Failed to get mobile country code", v13);
          _HKInitializeLogging();
          id v14 = HKLogInfrastructure();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[HKMobileCountryCodeManager mobileCountryCodeFromCellularWithError:]();
          }

          [(HKMobileCountryCodeManager *)self _submitAnalyticsForError:@"Error getting mobile country code" mobileCountryCode:0];
          id v7 = 0;
        }
        else
        {
          id v7 = [(HKMobileCountryCodeManager *)self _wrapperWithMobileCountryCode:v12 error:a3];
        }

        id v10 = v13;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a3, 109, @"Failed to get current data subscription context", v10);
        _HKInitializeLogging();
        v15 = HKLogInfrastructure();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[HKMobileCountryCodeManager mobileCountryCodeFromCellularWithError:]();
        }

        [(HKMobileCountryCodeManager *)self _submitAnalyticsForError:@"Nil data subscription context" mobileCountryCode:0];
        id v7 = 0;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_isLocationAvailableWithError:(id *)a3
{
  [(RadiosPreferences *)self->_radiosPreferences refresh];
  int v5 = [(RadiosPreferences *)self->_radiosPreferences airplaneMode];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 109, @"Location not available");
    _HKInitializeLogging();
    id v6 = HKLogInfrastructure();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[HKMobileCountryCodeManager _isLocationAvailableWithError:]((uint64_t)self, v6);
    }
  }
  return v5 ^ 1;
}

- (id)_wrapperWithMobileCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(id)objc_opt_class() overrideMobileCountryCode];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;

    id v6 = v9;
  }
  id v10 = objc_msgSend(v6, "hk_copyNonEmptyString");

  if (v10 && [v10 integerValue] != 0xFFFF)
  {
    id v12 = [(HKMobileCountryCodeManager *)self copyISOCountryCodeForMobileCountryCode:v10 error:a4];
    if (v12)
    {
      id v11 = [[HKMobileCountryCode alloc] initWithMobileCountryCode:v10 ISOCode:v12 isOverridden:v8 != 0];
    }
    else
    {
      [(HKMobileCountryCodeManager *)self _submitAnalyticsForError:@"Nil ISO country code" mobileCountryCode:v10];
      id v11 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 109, @"MCC is unknown");
    [(HKMobileCountryCodeManager *)self _submitAnalyticsForError:@"Nil mobile country code" mobileCountryCode:0];
    id v11 = 0;
  }

  return v11;
}

- (id)copyISOCountryCodeForMobileCountryCode:(id)a3 error:(id *)a4
{
  if (self->_coreTelephonyServerConnection)
  {
    if (!_CTServerConnectionCopyISOForMCC())
    {
      id v7 = [0 uppercaseString];

      return v7;
    }
    int v5 = (void *)MEMORY[0x1E4F28C58];
    id v6 = @"CoreTelephony server copying ISO from MCC failed";
  }
  else
  {
    int v5 = (void *)MEMORY[0x1E4F28C58];
    id v6 = @"CoreTelephony server connection was NULL";
  }
  objc_msgSend(v5, "hk_assignError:code:description:", a4, 100, v6);
  return 0;
}

+ (BOOL)isOverridePresent
{
  v3 = [a1 overrideMobileCountryCode];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    int v5 = [a1 _overrideISOCountryCode];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

+ (void)setOverrideMobileCountryCode:(id)a3
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFPreferencesSetAppValue(@"HKMobileCountryCodeOverride", a3, (CFStringRef)*MEMORY[0x1E4F1D3B8]);

  CFPreferencesAppSynchronize(v3);
}

+ (id)overrideMobileCountryCode
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (+[_HKBehavior isAppleInternalInstall])
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    CFStringRef v3 = [v2 stringForKey:@"HKMobileCountryCodeOverride"];
    BOOL v4 = objc_msgSend(v3, "hk_copyNonEmptyString");

    if (v4)
    {
      _HKInitializeLogging();
      int v5 = HKLogInfrastructure();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543618;
        uint64_t v8 = objc_opt_class();
        __int16 v9 = 2114;
        id v10 = v4;
        _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning overridden MCC %{public}@.", (uint8_t *)&v7, 0x16u);
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_submitAnalyticsForError:(id)a3 mobileCountryCode:(id)a4
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (__CFString *)a4;
  int v7 = [(id)objc_opt_class() overrideMobileCountryCode];

  if (!v7)
  {
    v12[0] = @"Error";
    v12[1] = @"MobileCountryCode";
    uint64_t v8 = @"-1";
    if (v6) {
      uint64_t v8 = v6;
    }
    v13[0] = v5;
    v13[1] = v8;
    v12[2] = @"UserLocale";
    __int16 v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v10 = [v9 localeIdentifier];
    v13[2] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    AnalyticsSendEvent();
  }
}

- (id)currentCountryCode
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  v2 = [(HKMobileCountryCodeManager *)self mobileCountryCodeFromCellularWithError:&v9];
  id v3 = v9;
  if (!v2)
  {
    _HKInitializeLogging();
    BOOL v4 = HKLogInfrastructure();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v5;
      __int16 v12 = 2114;
      id v13 = v3;
      id v6 = v5;
      _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to retrieve country code: %{public}@", buf, 0x16u);
    }
  }
  int v7 = [v2 ISOCode];

  return v7;
}

- (id)currentEstimate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  v2 = [(HKMobileCountryCodeManager *)self mobileCountryCodeFromCellularWithError:&v11];
  id v3 = v11;
  if (v2)
  {
    BOOL v4 = [HKRegulatoryDomainEstimate alloc];
    id v5 = [v2 ISOCode];
    id v6 = [v2 timestamp];
    int v7 = -[HKRegulatoryDomainEstimate initWithISOCode:timestamp:provenance:](v4, "initWithISOCode:timestamp:provenance:", v5, v6, [v2 provenance]);
  }
  else
  {
    _HKInitializeLogging();
    id v5 = HKLogInfrastructure();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v13 = v8;
      __int16 v14 = 2114;
      id v15 = v3;
      id v9 = v8;
      _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to retrieve country code: %{public}@", buf, 0x16u);
    }
    int v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radiosPreferences, 0);

  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

void __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0_20();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v0, v1, "[%{public}@]: Failed to get current data subscription context with error: %{public}@", v2, v3, v4, v5, v6);
}

void __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0_20();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v0, v1, "[%{public}@]: Failed to retrieve ISO code for MCC with error: %{public}@", v2, v3, v4, v5, v6);
}

void __79__HKMobileCountryCodeManager_fetchMobileCountryCodeFromCellularWithCompletion___block_invoke_29_cold_2()
{
  OUTLINED_FUNCTION_2_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0_20();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v0, v1, "[%{public}@]: Failed to get mobile country code with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)mobileCountryCodeFromCellularWithError:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0_20();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v0, v1, "[%{public}@]: Failed to get current data subscription context with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)mobileCountryCodeFromCellularWithError:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0_20();
  OUTLINED_FUNCTION_1_2(&dword_19C023000, v0, v1, "[%{public}@]: Failed to get mobile country code with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_isLocationAvailableWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = objc_opt_class();
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "[%{public}@]: Location not available, airplane mode turned on.", (uint8_t *)&v3, 0xCu);
}

@end