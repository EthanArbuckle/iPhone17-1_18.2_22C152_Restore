@interface SABundleManager
+ (id)approvedBundleIdsForService:(__CFString *)a3;
+ (id)bundleURLForAuditToken:(id *)a3;
+ (id)bundleURLForCurrentConnection;
+ (id)crashDetectionManager;
+ (id)locationBundle;
+ (id)reasonToAttributeName:(int64_t)a3;
+ (id)remoteApplicationWithBundleId:(id)a3 error:(id *)a4;
+ (void)getRemoteApplicationNameWithBundleId:(id)a3 withCompletion:(id)a4;
- (SABundleManager)initWithServiceName:(__CFString *)a3;
- (id)approvedApps;
- (id)pairedDeviceBundleIdForId:(id)a3;
- (void)approvedApps;
- (void)openApplicationInBackgroundWithBundleId:(id)a3 withReason:(int64_t)a4 completion:(id)a5;
- (void)openApplicationInForegroundWithBundleId:(id)a3 withReason:(int64_t)a4 completion:(id)a5;
- (void)wakeApprovedAppsWithReason:(int64_t)a3 completion:(id)a4;
@end

@implementation SABundleManager

+ (id)crashDetectionManager
{
  if (crashDetectionManager_onceToken != -1) {
    dispatch_once(&crashDetectionManager_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)crashDetectionManager_manager;

  return v2;
}

void __31__SABundleManager_approvedApps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v9 = v3;
    v4 = tcc_authorization_record_get_subject_identity();
    if (!tcc_identity_get_type() && tcc_authorization_record_get_authorization_right() == 2)
    {
      v5 = [NSString stringWithCString:tcc_identity_get_identifier() encoding:4];
      v6 = tcc_authorization_record_get_subject_attributed_entity();
      BOOL v7 = v6 == 0;

      v8 = [[SABundleManagerApp alloc] initWithBundleId:v5 deviceType:v7];
      [(SABundleManagerApp *)v8 setAuthorizationDate:tcc_authorization_record_get_last_modified_date()];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
    }
    id v3 = v9;
  }
}

- (id)approvedApps
{
  v29 = self;
  uint64_t v58 = *MEMORY[0x263EF8340];
  v2 = sa_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    [(SABundleManager *)(uint64_t)v29 approvedApps];
  }

  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  id v50 = (id)objc_opt_new();
  uint64_t v40 = MEMORY[0x263EF8330];
  uint64_t v41 = 3221225472;
  v42 = __31__SABundleManager_approvedApps__block_invoke;
  v43 = &unk_2651C93F0;
  v44 = &v45;
  tcc_server_message_get_authorization_records_by_service();
  if (![(id)v46[5] count])
  {
    v27 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_33;
  }
  id v3 = [(id)v46[5] sortedArrayUsingComparator:&__block_literal_global_54];
  v31 = +[SAAuthorization SASyncedBundleId];
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  v5 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend((id)v46[5], "count") - 1);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v3;
  id v6 = 0;
  uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v57 count:16];
  if (!v7) {
    goto LABEL_18;
  }
  uint64_t v8 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v37 != v8) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      if (!v6)
      {
        id v6 = v10;
        continue;
      }
      v11 = [*(id *)(*((void *)&v36 + 1) + 8 * i) bundleId];
      if ([v11 isEqualToString:v31])
      {

LABEL_14:
        objc_msgSend(v5, "addObject:", v6, v29);
        id v15 = v10;

        id v6 = v15;
        continue;
      }
      v12 = [v10 bundleId];
      v13 = [(SABundleManager *)v29 pairedDeviceBundleIdForId:v31];
      int v14 = [v12 isEqualToString:v13];

      if (v14) {
        goto LABEL_14;
      }
      [v5 addObject:v6];
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v57 count:16];
  }
  while (v7);
LABEL_18:

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v56 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v33;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(void **)(*((void *)&v32 + 1) + 8 * v19);
        v21 = sa_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          v25 = [v20 bundleId];
          *(_DWORD *)buf = 136315394;
          v53 = "-[SABundleManager approvedApps]";
          __int16 v54 = 2112;
          v55 = v25;
          _os_log_fault_impl(&dword_245182000, v21, OS_LOG_TYPE_FAULT, "%s - Found more than one approved app for service, revoking access for duplicate app, bundleId: %@", buf, 0x16u);
        }
        v22 = [v20 bundleId];
        BOOL v23 = TCCAccessSetForBundleId() == 0;

        if (v23)
        {
          v24 = sa_default_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v26 = [v20 bundleId];
            *(_DWORD *)buf = 136315394;
            v53 = "-[SABundleManager approvedApps]";
            __int16 v54 = 2112;
            v55 = v26;
            _os_log_error_impl(&dword_245182000, v24, OS_LOG_TYPE_ERROR, "%s - Unable to revoke access for duplicate app, bundleId: %@", buf, 0x16u);
          }
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v56 count:16];
    }
    while (v17);
  }

  id v51 = v6;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];

LABEL_33:
  _Block_object_dispose(&v45, 8);

  return v27;
}

uint64_t __40__SABundleManager_crashDetectionManager__block_invoke()
{
  v0 = [SABundleManager alloc];
  crashDetectionManager_manager = [(SABundleManager *)v0 initWithServiceName:*MEMORY[0x263F7C530]];

  return MEMORY[0x270F9A758]();
}

- (SABundleManager)initWithServiceName:(__CFString *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SABundleManager;
  id v3 = [(SABundleManager *)&v13 init];
  if (v3)
  {
    id v4 = objc_alloc_init(SAPhoneApplicationLauncher);
    applicationLauncher = v3->_applicationLauncher;
    v3->_applicationLauncher = (SAApplicationLauncher *)v4;

    uint64_t v6 = tcc_server_create();
    server = v3->_server;
    v3->_server = (OS_tcc_server *)v6;

    uint64_t v8 = tcc_service_singleton_for_CF_name();
    service = v3->_service;
    v3->_service = (OS_tcc_service *)v8;

    uint64_t v10 = tcc_message_options_create();
    options = v3->_options;
    v3->_options = (OS_tcc_message_options *)v10;

    tcc_message_options_set_reply_handler_policy();
    tcc_message_options_set_request_prompt_policy();
  }
  return v3;
}

+ (id)approvedBundleIdsForService:(__CFString *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = sa_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[SABundleManager approvedBundleIdsForService:]();
  }

  id v4 = objc_opt_new();
  v5 = (void *)TCCAccessCopyInformation();
  if (v5)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      uint64_t v10 = (void *)MEMORY[0x263F7C4C8];
      v11 = (void *)MEMORY[0x263F7C4D8];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v14 = objc_msgSend(v13, "objectForKeyedSubscript:", *v10, (void)v20);

          if (v14)
          {
            id v15 = CFBundleGetIdentifier((CFBundleRef)v14);
            id v16 = [v13 objectForKeyedSubscript:*v11];
            int v17 = [v16 BOOLValue];

            if (v17) {
              [v4 addObject:v15];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }
  }
  uint64_t v18 = objc_msgSend(v4, "allObjects", (void)v20);

  return v18;
}

uint64_t __31__SABundleManager_approvedApps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 authorizationDate];
  id v6 = [v4 authorizationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)bundleURLForCurrentConnection
{
  v2 = [MEMORY[0x263F08D68] currentConnection];
  id v3 = v2;
  long long v7 = 0u;
  long long v8 = 0u;
  if (v2) {
    [v2 auditToken];
  }
  v6[0] = v7;
  v6[1] = v8;
  id v4 = +[SABundleManager bundleURLForAuditToken:v6];

  return v4;
}

+ (id)bundleURLForAuditToken:(id *)a3
{
  id v13 = 0;
  long long v3 = *(_OWORD *)&a3->var0[4];
  v12[0] = *(_OWORD *)a3->var0;
  v12[1] = v3;
  id v4 = [MEMORY[0x263F01890] bundleRecordForAuditToken:v12 error:&v13];
  id v5 = v13;
  id v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7
    && ([v4 bundleIdentifier], long long v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    uint64_t v9 = [v4 URL];
  }
  else
  {
    uint64_t v10 = sa_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SABundleManager bundleURLForAuditToken:]();
    }

    uint64_t v9 = 0;
  }

  return v9;
}

- (void)wakeApprovedAppsWithReason:(int64_t)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = sa_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SABundleManager wakeApprovedAppsWithReason:completion:]((uint64_t)self, a3, v7);
  }

  long long v8 = [(SABundleManager *)self approvedApps];
  if ([v8 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v18 = v8;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (!v10) {
      goto LABEL_18;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        id v15 = sa_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          int v17 = [v14 bundleId];
          *(_DWORD *)buf = 136315394;
          v24 = "-[SABundleManager wakeApprovedAppsWithReason:completion:]";
          __int16 v25 = 2112;
          v26 = v17;
          _os_log_debug_impl(&dword_245182000, v15, OS_LOG_TYPE_DEBUG, "%s - Need to wake app, app: %@", buf, 0x16u);
        }
        if ((unint64_t)a3 >= 2)
        {
          if (a3 != 2) {
            goto LABEL_16;
          }
          id v16 = [v14 bundleId];
          [(SABundleManager *)self openApplicationInForegroundWithBundleId:v16 withReason:2 completion:v6];
        }
        else
        {
          id v16 = [v14 bundleId];
          [(SABundleManager *)self openApplicationInBackgroundWithBundleId:v16 withReason:a3 completion:v6];
        }

LABEL_16:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (!v11)
      {
LABEL_18:

        long long v8 = v18;
        goto LABEL_21;
      }
    }
  }
  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
LABEL_21:
}

- (void)openApplicationInBackgroundWithBundleId:(id)a3 withReason:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = sa_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SABundleManager openApplicationInBackgroundWithBundleId:withReason:completion:]();
  }

  [(SAApplicationLauncher *)self->_applicationLauncher openApplicationInBackgroundWithBundleId:v8 withReason:a4 completion:v9];
}

- (void)openApplicationInForegroundWithBundleId:(id)a3 withReason:(int64_t)a4 completion:(id)a5
{
  v17[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = sa_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SABundleManager openApplicationInForegroundWithBundleId:withReason:completion:]();
  }

  id v8 = [(id)objc_opt_class() reasonToAttributeName:a4];
  id v9 = objc_opt_new();
  v16[0] = @"__LaunchOrigin";
  v16[1] = @"__PromptUnlockDevice";
  v17[0] = v8;
  v17[1] = &unk_26F9E90E8;
  v16[2] = @"__UnlockDevice ";
  v17[2] = &unk_26F9E90E8;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  [v9 setFrontBoardOptions:v10];

  uint64_t v11 = [MEMORY[0x263F01880] defaultWorkspace];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__SABundleManager_openApplicationInForegroundWithBundleId_withReason_completion___block_invoke;
  v13[3] = &unk_2651C9438;
  id v14 = v6;
  int64_t v15 = a4;
  id v12 = v6;
  [v11 openApplicationWithBundleIdentifier:v12 usingConfiguration:v9 completionHandler:v13];
}

void __81__SABundleManager_openApplicationInForegroundWithBundleId_withReason_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = sa_default_log();
  BOOL v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 136315650;
      uint64_t v11 = "-[SABundleManager openApplicationInForegroundWithBundleId:withReason:completion:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v9;
      _os_log_impl(&dword_245182000, v7, OS_LOG_TYPE_DEFAULT, "%s - Successfully launched bundle application in foreground, bundleId: %@, reason: %lu", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __81__SABundleManager_openApplicationInForegroundWithBundleId_withReason_completion___block_invoke_cold_1(a1, (uint64_t)v5, v7);
  }
}

+ (void)getRemoteApplicationNameWithBundleId:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x263F57730] sharedInstance];
  uint64_t v8 = [v7 getActivePairedDevice];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__SABundleManager_getRemoteApplicationNameWithBundleId_withCompletion___block_invoke;
    v10[3] = &unk_2651C9460;
    id v11 = v5;
    id v12 = v6;
    [v9 fetchApplicationOnPairedDevice:v8 withBundleID:v11 completion:v10];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __71__SABundleManager_getRemoteApplicationNameWithBundleId_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = sa_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__SABundleManager_getRemoteApplicationNameWithBundleId_withCompletion___block_invoke_cold_1(a1);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [v5 applicationName];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

+ (id)remoteApplicationWithBundleId:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x263F57730] sharedInstance];
  BOOL v7 = [v6 getActivePairedDevice];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
    id v18 = 0;
    uint64_t v9 = [v8 applicationOnPairedDevice:v7 withBundleID:v5 error:&v18];
    id v10 = v18;
    id v11 = v18;

    if (v11 && [v11 code] != 19)
    {
      id v12 = sa_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[SABundleManager remoteApplicationWithBundleId:error:]((uint64_t)v5);
      }

      objc_storeStrong(a4, v10);
    }
    if (v9)
    {
      uint64_t v13 = [[SABundleManagerApp alloc] initWithBundleId:v5 deviceType:1];
      __int16 v14 = [v9 companionAppBundleID];
      [(SABundleManagerApp *)v13 setPairedBundleId:v14];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v15 = +[SAError errorWithCode:4];
    id v16 = *a4;
    *a4 = v15;

    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)locationBundle
{
  if (locationBundle_onceToken != -1) {
    dispatch_once(&locationBundle_onceToken, &__block_literal_global_80);
  }
  v2 = (void *)locationBundle___bundle;

  return v2;
}

void __33__SABundleManager_locationBundle__block_invoke()
{
  v0 = [MEMORY[0x263F08850] defaultManager];
  v1 = [v0 URLsForDirectory:5 inDomains:8];
  id v6 = [v1 objectAtIndexedSubscript:0];

  v2 = [v6 URLByAppendingPathComponent:@"LocationBundles"];
  long long v3 = [v2 URLByAppendingPathComponent:@"Emergency SOS.bundle"];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleWithURL:v3];
  id v5 = (void *)locationBundle___bundle;
  locationBundle___bundle = v4;
}

+ (id)reasonToAttributeName:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_2651C9480[a3];
  }
}

- (id)pairedDeviceBundleIdForId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F57730] sharedInstance];
  id v5 = [v4 getActivePairedDevice];

  id v6 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
  id v12 = 0;
  BOOL v7 = [v6 locallyAvailableApplicationWithBundleID:v3 forPairedDevice:v5 error:&v12];
  id v8 = v12;

  uint64_t v9 = [v7 bundleIdentifier];
  if (v8)
  {
    id v10 = sa_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SABundleManager remoteApplicationWithBundleId:error:]((uint64_t)v3);
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_server, 0);

  objc_storeStrong((id *)&self->_applicationLauncher, 0);
}

+ (void)approvedBundleIdsForService:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s, service: %@", v2, v3, v4, v5, 2u);
}

- (void)approvedApps
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  tcc_service_get_CF_name();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_245182000, a2, OS_LOG_TYPE_DEBUG, "%s, service: %@", (uint8_t *)v3, 0x16u);
}

+ (void)bundleURLForAuditToken:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_245182000, v0, OS_LOG_TYPE_ERROR, "%s - unable to get bundle information for audit token, error: %@", (uint8_t *)v1, 0x16u);
}

- (void)wakeApprovedAppsWithReason:(NSObject *)a3 completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = 136315650;
  uint64_t v5 = "-[SABundleManager wakeApprovedAppsWithReason:completion:]";
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 2112;
  uint64_t CF_name = tcc_service_get_CF_name();
  _os_log_debug_impl(&dword_245182000, a3, OS_LOG_TYPE_DEBUG, "%s, reason: %lu, service: %@", (uint8_t *)&v4, 0x20u);
}

- (void)openApplicationInBackgroundWithBundleId:withReason:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s - attempting to launch app in background, bundleId: %@", v2, v3, v4, v5, 2u);
}

- (void)openApplicationInForegroundWithBundleId:withReason:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_245182000, v0, v1, "%s - attempting to launch app in foreground, bundleId: %@", v2, v3, v4, v5, 2u);
}

void __81__SABundleManager_openApplicationInForegroundWithBundleId_withReason_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 136315906;
  __int16 v6 = "-[SABundleManager openApplicationInForegroundWithBundleId:withReason:completion:]_block_invoke";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_245182000, log, OS_LOG_TYPE_ERROR, "%s - Unable to launch bundle application in foreground, bundleId: %@, reason: %lu, error: %@", (uint8_t *)&v5, 0x2Au);
}

void __71__SABundleManager_getRemoteApplicationNameWithBundleId_withCompletion___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_245182000, v1, v2, "Unable to get remote app for fromBundleId: %@, error: %@", (void)v3, DWORD2(v3));
}

+ (void)remoteApplicationWithBundleId:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_245182000, v1, v2, "Unable to get remote app for fromBundleId: %@, error: %@", (void)v3, DWORD2(v3));
}

@end