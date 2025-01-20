@interface DSTCCStorePassThrough
+ (void)initialize;
- (BOOL)isEntityClassApplication:(id)a3;
- (BOOL)isServiceGranted:(id)a3 forApp:(id)a4;
- (NEConfiguration)pathControllerConfiguration;
- (id)appsWithLocationService;
- (id)deleteApp:(id)a3 forTest:(BOOL)a4;
- (id)pathRuleForBundleID:(id)a3 create:(BOOL)a4;
- (id)resetTCCCategory:(id)a3 forApp:(id)a4;
- (id)resetTCCPermission:(id)a3 forApp:(id)a4;
- (unint64_t)locationAuthorizationForApp:(id)a3;
- (void)allAppsWithLocalNetworkAccess:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)appsWithPermissionGrantedForService:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)healthAuthorizationForApp:(id)a3 andAuthorizationStore:(id)a4 withCompletionHandler:(id)a5;
- (void)loadConfigurations:(id)a3 handler:(id)a4;
- (void)resetHealthPermissionsForApp:(id)a3 withAuthorizationStore:(id)a4 andCompletionHandler:(id)a5;
- (void)resetLocalNetworkPermissionForApp:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)resetLocationPermissionForApp:(id)a3;
- (void)saveConfiguration:(id)a3 handler:(id)a4;
- (void)setPathControllerConfiguration:(id)a3;
@end

@implementation DSTCCStorePassThrough

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLog_7 = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSTCCStore");
    MEMORY[0x270F9A758]();
  }
}

- (BOOL)isServiceGranted:(id)a3 forApp:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToString:@"DSHealth"] & 1) != 0
    || [v6 isEqualToString:@"DSLocalNetwork"])
  {
    v8 = DSLog_7;
    if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_FAULT)) {
      -[DSTCCStorePassThrough isServiceGranted:forApp:](v8);
    }
    BOOL v9 = 0;
  }
  else
  {
    if (([v6 isEqualToString:@"DSLocationAlways"] & 1) != 0
      || [v6 isEqualToString:@"DSLocationWhenInUse"])
    {
      v10 = [(DSTCCStorePassThrough *)self appsWithLocationService];
      id v11 = [v10 objectForKey:v7];

      if (v11) {
        BOOL v9 = [(DSTCCStorePassThrough *)self locationAuthorizationForApp:v11] != 0;
      }
      else {
        BOOL v9 = 0;
      }
    }
    else
    {
      v12 = (void *)TCCAccessCopyInformationForBundleId();
      id v13 = v6;
      if ([v13 isEqualToString:@"DSContacts"])
      {
        id v14 = (id)*MEMORY[0x263F7C4F8];

        id v13 = v14;
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v11 = v12;
      uint64_t v15 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v11);
            }
            v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v20 = objc_msgSend(v19, "valueForKey:", @"kTCCInfoGranted", (void)v24);
            char v21 = [v20 BOOLValue];

            v22 = [v19 objectForKeyedSubscript:@"kTCCInfoService"];
            LODWORD(v20) = [v22 isEqualToString:v13];

            if v20 && (v21)
            {
              BOOL v9 = 1;
              goto LABEL_24;
            }
          }
          uint64_t v16 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
      BOOL v9 = 0;
LABEL_24:
    }
  }

  return v9;
}

- (void)appsWithPermissionGrantedForService:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  v8 = (void *)tcc_server_create();
  BOOL v9 = tcc_service_singleton_for_CF_name();
  id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v14 = v6;
  uint64_t v15 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v13;
  tcc_server_message_get_authorization_records_by_service();
}

void __85__DSTCCStorePassThrough_appsWithPermissionGrantedForService_queue_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (v5)
  {
    id v6 = tcc_authorization_record_get_subject_identity();
    uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
    v8 = (void *)[[NSString alloc] initWithCString:tcc_identity_get_identifier() encoding:4];
    if (v8) {
      BOOL v9 = (authorization_right & 0xFFFFFFFFFFFFFFFELL) == 2;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9) {
      [*(id *)(a1 + 32) addObject:v8];
    }
  }
  else
  {
    id v10 = DSLog_7;
    if (a3)
    {
      if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_ERROR)) {
        __85__DSTCCStorePassThrough_appsWithPermissionGrantedForService_queue_completionHandler___block_invoke_cold_1(a1, a3, v10);
      }
      uint64_t v11 = *(void *)(a1 + 48);
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObject:a3];
      id v13 = +[DSError errorWithCode:3 appName:0 serviceName:@"DSHealth" underlyingErrors:v12];
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v13);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        int v15 = 138412290;
        uint64_t v16 = v14;
        _os_log_impl(&dword_236090000, v10, OS_LOG_TYPE_INFO, "Finished getting authorization for service: %@", (uint8_t *)&v15, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (id)appsWithLocationService
{
  v2 = (void *)CLCopyAppsUsingLocation();
  return v2;
}

- (BOOL)isEntityClassApplication:(id)a3
{
  return [MEMORY[0x263F00A60] primaryEntityClassForLocationDictionary:a3] == 1;
}

- (unint64_t)locationAuthorizationForApp:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F00A60] entityAuthorizationForLocationDictionary:a3];
  if (v3 == 4) {
    return 2;
  }
  else {
    return v3 == 2;
  }
}

- (void)healthAuthorizationForApp:(id)a3 andAuthorizationStore:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  int v15 = __95__DSTCCStorePassThrough_healthAuthorizationForApp_andAuthorizationStore_withCompletionHandler___block_invoke;
  uint64_t v16 = &unk_264C9ED80;
  id v17 = v7;
  id v18 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = a4;
  id v12 = (void *)MEMORY[0x237DFC200](&v13);
  objc_msgSend(v11, "fetchAuthorizationRecordsForBundleIdentifier:completion:", v10, v12, v13, v14, v15, v16);
}

void __95__DSTCCStorePassThrough_healthAuthorizationForApp_andAuthorizationStore_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObject:v6];
    id v9 = +[DSError errorWithCode:3 appName:v7 serviceName:@"DSHealth" underlyingErrors:v8];
  }
  else
  {
    id v9 = 0;
  }
  if ([v5 count])
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    char v12 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __95__DSTCCStorePassThrough_healthAuthorizationForApp_andAuthorizationStore_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_264C9ED58;
    v10[4] = v11;
    [v5 enumerateKeysAndObjectsUsingBlock:v10];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    _Block_object_dispose(v11, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __95__DSTCCStorePassThrough_healthAuthorizationForApp_andAuthorizationStore_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 status];
  if ((unint64_t)(result - 101) <= 2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (void)loadConfigurations:(id)a3 handler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x263F145C0];
  id v8 = a3;
  id v9 = [v7 sharedManagerForAllUsers];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__DSTCCStorePassThrough_loadConfigurations_handler___block_invoke;
  void v11[3] = &unk_264C9EDA8;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 loadConfigurationsWithCompletionQueue:v8 handler:v11];
}

void __52__DSTCCStorePassThrough_loadConfigurations_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_ERROR)) {
    __52__DSTCCStorePassThrough_loadConfigurations_handler___block_invoke_cold_1();
  }
  uint64_t v7 = [MEMORY[0x263F145C0] networkPrivacyConfigurationName];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "name", (void)v16);
        if ([v14 isEqualToString:v7])
        {
          int v15 = [v13 pathController];

          if (v15) {
            [*(id *)(a1 + 32) setPathControllerConfiguration:v13];
          }
        }
        else
        {
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)pathRuleForBundleID:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(DSTCCStorePassThrough *)self pathControllerConfiguration];
  id v8 = [v7 pathController];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = objc_msgSend(v8, "pathRules", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v15 = [v14 matchSigningIdentifier];
        int v16 = [v15 isEqualToString:v6];

        if (v16)
        {
          id v17 = v14;
          goto LABEL_13;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    id v17 = (id)[objc_alloc(MEMORY[0x263F145F8]) initWithSigningIdentifier:v6];
    long long v18 = [v8 pathRules];

    if (v18)
    {
      uint64_t v9 = [v8 pathRules];
      long long v19 = [v9 arrayByAddingObject:v17];
      [v8 setPathRules:v19];
    }
    else
    {
      id v25 = v17;
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
      [v8 setPathRules:v9];
    }
LABEL_13:
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)allAppsWithLocalNetworkAccess:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (objc_class *)MEMORY[0x263EFF9C0];
  id v11 = a4;
  id v12 = objc_alloc_init(v10);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__DSTCCStorePassThrough_allAppsWithLocalNetworkAccess_queue_handler___block_invoke;
  v16[3] = &unk_264C9EDD0;
  id v17 = v8;
  long long v18 = self;
  id v19 = v12;
  id v20 = v9;
  id v13 = v9;
  id v14 = v12;
  id v15 = v8;
  [(DSTCCStorePassThrough *)self loadConfigurations:v11 handler:v16];
}

void __69__DSTCCStorePassThrough_allAppsWithLocalNetworkAccess_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_ERROR)) {
      __69__DSTCCStorePassThrough_allAppsWithLocalNetworkAccess_queue_handler___block_invoke_cold_1();
    }
    BOOL v4 = +[DSError errorWithCode:3];
  }
  else
  {
    BOOL v4 = 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v11 = objc_msgSend(*(id *)(a1 + 40), "pathRuleForBundleID:create:", v10, 0, (void)v12);
        if ([v11 multicastPreferenceSet] && (objc_msgSend(v11, "denyMulticast") & 1) == 0) {
          [*(id *)(a1 + 48) addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)deleteApp:(id)a3 forTest:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F4BED8]);
  [v6 setRequestUserConfirmation:!v4];
  [v6 setWaitForDeletion:1];
  uint64_t v7 = (void *)MEMORY[0x263F4BE78];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F4BE88]) initWithBundleIdentifier:v5];
  id v12 = 0;
  [v7 uninstallAppWithIdentity:v8 options:v6 disposition:0 error:&v12];
  id v9 = v12;

  if (v9)
  {
    if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_ERROR)) {
      -[DSTCCStorePassThrough deleteApp:forTest:]();
    }
    id v10 = v9;
  }

  return v9;
}

- (id)resetTCCCategory:(id)a3 forApp:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    uint64_t v12 = MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (!TCCAccessResetForBundleId())
        {
          long long v15 = +[DSError errorWithCode:appName:serviceName:underlyingErrors:](DSError, "errorWithCode:appName:serviceName:underlyingErrors:", 4, v6, v14, v12, (void)v17);
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)resetTCCPermission:(id)a3 forApp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"DSContacts"])
  {
    id v8 = +[DSUtilities contactsServices];
    id v9 = [(DSTCCStorePassThrough *)self resetTCCCategory:v8 forApp:v7];
LABEL_3:

    goto LABEL_7;
  }
  if (+[DSApp skipTCCCheck:v6])
  {
    id v9 = 0;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (!TCCAccessResetForBundleId())
    {
      id v8 = +[DSError errorWithCode:4 appName:v7 serviceName:v6 underlyingErrors:MEMORY[0x263EFFA68]];
      [v9 addObject:v8];
      goto LABEL_3;
    }
  }
LABEL_7:

  return v9;
}

- (void)resetLocationPermissionForApp:(id)a3
{
  id v4 = a3;
  id v6 = [(DSTCCStorePassThrough *)self appsWithLocationService];
  id v5 = [v6 objectForKey:v4];

  if (v5) {
    [MEMORY[0x263F00A60] setEntityAuthorization:0 forLocationDictionary:v5];
  }
}

- (void)resetHealthPermissionsForApp:(id)a3 withAuthorizationStore:(id)a4 andCompletionHandler:(id)a5
{
}

- (void)saveConfiguration:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DSTCCStorePassThrough *)self pathControllerConfiguration];
  id v9 = [MEMORY[0x263F145C0] sharedManagerForAllUsers];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__DSTCCStorePassThrough_saveConfiguration_handler___block_invoke;
  v12[3] = &unk_264C9EDF8;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 saveConfiguration:v11 withCompletionQueue:v7 handler:v12];
}

void __51__DSTCCStorePassThrough_saveConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v3)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:@"NEConfigurationErrorDomain"])
    {
      uint64_t v6 = [v3 code];

      if (v6 != 9)
      {
        id v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v3, 0);
        id v8 = +[DSError errorWithCode:4 appName:0 serviceName:@"DSLocalNetwork" underlyingErrors:v7];
        [v4 addObject:v8];

        if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_ERROR)) {
          __51__DSTCCStorePassThrough_saveConfiguration_handler___block_invoke_cold_1();
        }
      }
    }
    else
    {
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resetLocalNetworkPermissionForApp:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__DSTCCStorePassThrough_resetLocalNetworkPermissionForApp_queue_handler___block_invoke;
  v12[3] = &unk_264C9EE20;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(DSTCCStorePassThrough *)self loadConfigurations:a4 handler:v12];
}

void __73__DSTCCStorePassThrough_resetLocalNetworkPermissionForApp_queue_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pathRuleForBundleID:*(void *)(a1 + 40) create:1];
  if ([v2 multicastPreferenceSet])
  {
    [v2 setDenyMulticast:1];
    [v2 setMulticastPreferenceSet:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (NEConfiguration)pathControllerConfiguration
{
  return self->_pathControllerConfiguration;
}

- (void)setPathControllerConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)isServiceGranted:(os_log_t)log forApp:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_236090000, log, OS_LOG_TYPE_FAULT, "DSTCCStore isServiceGranted:forApp: should not be used to check non-restricted permissions", v1, 2u);
}

void __85__DSTCCStorePassThrough_appsWithPermissionGrantedForService_queue_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_3(&dword_236090000, a2, a3, "Error when requesting TCC for service: %@ error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __52__DSTCCStorePassThrough_loadConfigurations_handler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_236090000, v0, OS_LOG_TYPE_ERROR, "Failed to load NE configuration with error %@", v1, 0xCu);
}

void __69__DSTCCStorePassThrough_allAppsWithLocalNetworkAccess_queue_handler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_236090000, v0, OS_LOG_TYPE_ERROR, "Fetching apps with local network access failed with error %@", v1, 0xCu);
}

- (void)deleteApp:forTest:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_236090000, v0, v1, "Error deleting app %{public}@: %{public}@");
}

void __51__DSTCCStorePassThrough_saveConfiguration_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_236090000, v0, v1, "NE configuration save error %@ for %@");
}

@end