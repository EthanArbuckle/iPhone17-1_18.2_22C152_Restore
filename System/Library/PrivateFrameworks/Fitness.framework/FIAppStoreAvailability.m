@interface FIAppStoreAvailability
+ (BOOL)_isDeviceTablet;
+ (void)_isSupportedDeviceAvailableWithCompletion:(id)a3;
+ (void)fetchIsFitnessAvailableForDeviceWithCompletion:(id)a3;
+ (void)isFitnessPlusStorefrontContentAvailableWithCompletion:(id)a3;
@end

@implementation FIAppStoreAvailability

uint64_t __41__FIAppStoreAvailability__isDeviceTablet__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  _isDeviceTablet___isDeviceTablet = result == 3;
  return result;
}

+ (void)fetchIsFitnessAvailableForDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  if ([a1 _isDeviceTablet])
  {
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke;
    v7[3] = &unk_26441C930;
    id v9 = a1;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C74B000, v6, OS_LOG_TYPE_DEFAULT, "FIAppStoreAvailability - device not tablet; calling completion with YES",
        buf,
        2u);
    }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

+ (BOOL)_isDeviceTablet
{
  if (_isDeviceTablet_onceToken != -1) {
    dispatch_once(&_isDeviceTablet_onceToken, &__block_literal_global);
  }
  return _isDeviceTablet___isDeviceTablet;
}

void __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke(uint64_t a1)
{
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v3 = *(void **)(a1 + 40);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke_2;
  v19[3] = &unk_26441C908;
  v21 = &v22;
  id v4 = v2;
  v20 = v4;
  [v3 isFitnessPlusStorefrontContentAvailableWithCompletion:v19];
  dispatch_group_enter(v4);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v5 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke_3;
  v12[3] = &unk_26441C908;
  v14 = &v15;
  v6 = v4;
  v13 = v6;
  [v5 _isSupportedDeviceAvailableWithCompletion:v12];
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v6, v7))
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
      __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke_cold_1(v10);
    }
  }
  if (*((unsigned char *)v23 + 24)) {
    BOOL v11 = *((unsigned char *)v16 + 24) != 0;
  }
  else {
    BOOL v11 = 0;
  }
  (*(void (**)(void, BOOL, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v11, v8, v9);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v22, 8);
}

void __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)isFitnessPlusStorefrontContentAvailableWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F27B28] bagForProfile:@"Fitness" profileVersion:@"1"];
  v5 = [v4 BOOLForKey:@"fitnessPlusEnabled"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__FIAppStoreAvailability_isFitnessPlusStorefrontContentAvailableWithCompletion___block_invoke;
  v7[3] = &unk_26441C978;
  id v8 = v3;
  id v6 = v3;
  [v5 valueWithCompletion:v7];
}

void __80__FIAppStoreAvailability_isFitnessPlusStorefrontContentAvailableWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a2)
  {
    int v7 = [a2 BOOLValue];
    _HKInitializeLogging();
    id v8 = *MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v7;
      _os_log_impl(&dword_21C74B000, v8, OS_LOG_TYPE_DEFAULT, "FIAppStoreAvailability fetched fitness plus enabled value: %d", (uint8_t *)v11, 8u);
    }
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
      __80__FIAppStoreAvailability_isFitnessPlusStorefrontContentAvailableWithCompletion___block_invoke_cold_1(v10, v6);
    }
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

+ (void)_isSupportedDeviceAvailableWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F290F0];
  id v4 = (void (**)(id, BOOL))a3;
  v5 = [v3 sharedInstance];
  id v6 = objc_alloc_init(MEMORY[0x263F29118]);
  int v7 = [v5 allAuthKitAccounts];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  _DWORD v11[2] = __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke;
  v11[3] = &unk_26441C9E8;
  id v8 = v6;
  id v12 = v8;
  uint64_t v9 = objc_msgSend(v7, "hk_firstObjectPassingTest:", v11);

  _HKInitializeLogging();
  v10 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v14 = v9 != 0;
    _os_log_impl(&dword_21C74B000, v10, OS_LOG_TYPE_DEFAULT, "FIAppStoreAvailability - isSupportedDeviceAvailable: %d", buf, 8u);
  }
  v4[2](v4, v9 != 0);
}

BOOL __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v25[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(v3, "ams_altDSID");

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F291C8]);
    id v6 = objc_msgSend(v3, "ams_altDSID");
    [v5 setAltDSID:v6];

    v25[0] = @"iOS";
    v25[1] = @"watchOS";
    int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    [v5 setOperatingSystems:v7];

    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy__0;
    v23 = __Block_byref_object_dispose__0;
    id v24 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v9 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_323;
    v16[3] = &unk_26441C9A0;
    char v18 = &v19;
    v10 = v8;
    uint64_t v17 = v10;
    [v9 fetchDeviceListWithContext:v5 completion:v16];
    dispatch_time_t v11 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v10, v11))
    {
      _HKInitializeLogging();
      id v12 = *MEMORY[0x263F098C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
        __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_cold_1(v12);
      }
      BOOL v13 = 0;
    }
    else
    {
      BOOL v14 = objc_msgSend((id)v20[5], "hk_firstObjectPassingTest:", &__block_literal_global_328);
      BOOL v13 = v14 != 0;
    }
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_323(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      _HKInitializeLogging();
      dispatch_semaphore_t v8 = (void *)*MEMORY[0x263F098C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
        __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_323_cold_1(v8, v7);
      }
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_325(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = a2;
  _HKInitializeLogging();
  id v3 = (void *)*MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = [v2 model];
    id v6 = [v2 operatingSystemVersion];
    int v17 = 138412546;
    char v18 = v5;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_21C74B000, v4, OS_LOG_TYPE_DEFAULT, "FIAppStoreAvailability remoteDevice model:%@ version:%@", (uint8_t *)&v17, 0x16u);
  }
  int v7 = [v2 model];
  if ([v7 hasPrefix:@"iPhone"])
  {
    dispatch_semaphore_t v8 = [v2 operatingSystemName];
    if ([v8 isEqualToString:@"iOS"])
    {
      uint64_t v9 = [v2 operatingSystemVersion];
      [v9 doubleValue];
      BOOL v11 = v10 >= 16.1;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  id v12 = [v2 operatingSystemName];
  if ([v12 isEqualToString:@"watchOS"])
  {
    BOOL v13 = [v2 operatingSystemVersion];
    [v13 doubleValue];
    BOOL v15 = v14 >= 7.0;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v11 | v15;
}

void __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C74B000, log, OS_LOG_TYPE_ERROR, "FIAppStoreAvailability failed to fetch Fitness availability for device; dispatch group timed out",
    v1,
    2u);
}

void __80__FIAppStoreAvailability_isFitnessPlusStorefrontContentAvailableWithCompletion___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0(&dword_21C74B000, v5, v6, "FIAppStoreAvailability failed to fetch fitness plus enabled value: %@", v7, v8, v9, v10, 2u);
}

void __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C74B000, log, OS_LOG_TYPE_ERROR, "FIAppStoreAvailability failed to fetch device list; semaphore timed out",
    v1,
    2u);
}

void __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_323_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0(&dword_21C74B000, v5, v6, "FIAppStoreAvailability failed to fetch device list: %@", v7, v8, v9, v10, 2u);
}

@end