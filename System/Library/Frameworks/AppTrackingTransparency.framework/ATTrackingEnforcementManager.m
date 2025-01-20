@interface ATTrackingEnforcementManager
+ (BOOL)isDefaultReturned;
+ (BOOL)lastEnforcement;
+ (BOOL)shouldEnforceTrackingWithReasonCode:(int64_t *)a3;
+ (NSDate)lastBagLookup;
+ (int64_t)lastReasonCode;
+ (void)setIsDefaultReturned:(BOOL)a3;
+ (void)setLastBagLookup:(id)a3;
+ (void)setLastEnforcement:(BOOL)a3;
+ (void)setLastReasonCode:(int64_t)a3;
@end

@implementation ATTrackingEnforcementManager

void __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke_6()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138412290;
    id v2 = (id)objc_opt_class();
    id v0 = v2;
    _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] Connection was invalidated.", (uint8_t *)&v1, 0xCu);
  }
}

void __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke_10(uint64_t a1, int a2, uint64_t a3, char a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    id v8 = v10;
    _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] EnforcementService call completed successfully: enforced: %d reason code: %ld.", (uint8_t *)&v9, 0x1Cu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  _isDefaultReturned = a4;
  objc_storeStrong((id *)&_lastBagLookup, *(id *)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  **(void **)(a1 + 80) = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
}

+ (BOOL)shouldEnforceTrackingWithReasonCode:(int64_t *)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 1;
  *a3 = _lastReasonCode;
  v5 = [MEMORY[0x263EFF910] date];
  v6 = v5;
  if (_lastBagLookup)
  {
    int v7 = _isDefaultReturned;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    if (v8 <= dbl_2156BFEB0[v7 == 0])
    {
      id v9 = a1;
      objc_sync_enter(v9);
      goto LABEL_11;
    }
  }
  id v9 = a1;
  objc_sync_enter(v9);
  if (_shouldEnforceTrackingInProgress == 1)
  {
LABEL_11:
    *a3 = _lastReasonCode;
    int v18 = _lastEnforcement;
    objc_sync_exit(v9);
    goto LABEL_16;
  }
  _shouldEnforceTrackingInProgress = 1;
  objc_sync_exit(v9);

  id v10 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.AppTrackingTransparency.EnforcementService"];
  if (v10)
  {
    __int16 v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C643C00];
    [v10 setRemoteObjectInterface:v11];

    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke;
    v46[3] = &__block_descriptor_40_e5_v8__0l;
    v46[4] = v9;
    [v10 setInterruptionHandler:v46];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke_6;
    v45[3] = &__block_descriptor_40_e5_v8__0l;
    v45[4] = v9;
    [v10 setInvalidationHandler:v45];
    [v10 resume];
    *(void *)&long long v53 = 0;
    *((void *)&v53 + 1) = &v53;
    uint64_t v54 = 0x2020000000;
    char v55 = 0;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = _lastEnforcement;
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = _lastReasonCode;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke_7;
    v36[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v36[4] = v9;
    int v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v36];
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke_10;
    v28 = &unk_2642562F8;
    id v34 = v9;
    v30 = &v41;
    v31 = &v37;
    id v29 = v6;
    v32 = &v47;
    v33 = &v53;
    v35 = a3;
    [v12 appTrackingEnforcement:&v25];

    __int16 v13 = &_os_log_internal;
    id v14 = &_os_log_internal;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v52 = v15;
      id v16 = v15;
      _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] Returned from synchronous remote call to EnforcementService", buf, 0xCu);
    }
    if (!*(unsigned char *)(*((void *)&v53 + 1) + 24))
    {
      *((unsigned char *)v48 + 24) = _lastEnforcement;
      *a3 = _lastReasonCode;
    }
    id v17 = v9;
    objc_sync_enter(v17);
    _lastEnforcement = *((unsigned char *)v42 + 24);
    _lastReasonCode = v38[3];
    _shouldEnforceTrackingInProgress = 0;
    objc_sync_exit(v17);

    objc_msgSend(v10, "invalidate", v25, v26, v27, v28);
    int v18 = *((unsigned __int8 *)v48 + 24);

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v53, 8);
  }
  else
  {
    v19 = &_os_log_internal;
    id v20 = &_os_log_internal;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_opt_class();
      LODWORD(v53) = 138412290;
      *(void *)((char *)&v53 + 4) = v21;
      id v22 = v21;
      _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] Failed to create connection to EnforcementService. Using default values.", (uint8_t *)&v53, 0xCu);
    }
    id v23 = v9;
    objc_sync_enter(v23);
    *a3 = _lastReasonCode;
    _shouldEnforceTrackingInProgress = 0;
    int v18 = _lastEnforcement;
    objc_sync_exit(v23);
  }
  id v9 = v10;
LABEL_16:

  _Block_object_dispose(&v47, 8);
  return v18 != 0;
}

+ (void)setLastBagLookup:(id)a3
{
}

+ (NSDate)lastBagLookup
{
  return (NSDate *)(id)_lastBagLookup;
}

+ (void)setLastEnforcement:(BOOL)a3
{
  _lastEnforcement = a3;
}

+ (BOOL)lastEnforcement
{
  return _lastEnforcement;
}

+ (void)setLastReasonCode:(int64_t)a3
{
  _lastReasonCode = a3;
}

+ (int64_t)lastReasonCode
{
  return _lastReasonCode;
}

+ (void)setIsDefaultReturned:(BOOL)a3
{
  _isDefaultReturned = a3;
}

+ (BOOL)isDefaultReturned
{
  return _isDefaultReturned;
}

void __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138412290;
    id v2 = (id)objc_opt_class();
    id v0 = v2;
    _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] Connection was interrupted.", (uint8_t *)&v1, 0xCu);
  }
}

void __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a2;
    v4 = objc_opt_class();
    id v5 = v4;
    uint64_t v6 = [v3 code];
    int v7 = [v3 localizedDescription];

    int v8 = 138412802;
    id v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = v7;
    _os_log_impl(&dword_2156BC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[%@] Received error code %ld from remote call to EnforcementService: %@", (uint8_t *)&v8, 0x20u);
  }
}

@end