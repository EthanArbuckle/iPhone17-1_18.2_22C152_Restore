@interface AIDAServiceOwnersManager
+ (NSArray)supportedServices;
+ (NSSet)serviceOwnerBundles;
+ (id)_loadServiceOwnerBundles;
+ (id)_loadServiceOwnerBundlesIfNeeded;
+ (id)_rejectionlistedBundleIDs;
+ (id)_sharedTelemetryReporter;
+ (id)_supplementalServiceTypes;
+ (void)_set_loadServiceOwnerBundlesIfNeeded_onceToken:(int64_t)a3;
+ (void)configureProcessSpecificServiceOwnerRejectionlist:(id)a3;
+ (void)configureProcessSpecificSupplementalServiceTypes:(id)a3;
+ (void)supportedServices;
- (AIDAServiceOwnersManager)init;
- (AIDAServiceOwnersManager)initWithAccountStore:(id)a3;
- (NSDictionary)serviceOwners;
- (id)DSIDForAccount:(id)a3 service:(id)a4;
- (id)_buildServiceOwnerMapping;
- (id)_postCloudSupportedServicesForAltDSID:(id)a3;
- (id)accountForService:(id)a3;
- (id)altDSIDForAccount:(id)a3 service:(id)a4;
- (id)nameComponentsForAccount:(id)a3 service:(id)a4;
- (void)_completeSignInSignpost:(id)a3 forService:(id)a4 context:(id)a5 success:(BOOL)a6 error:(id)a7;
- (void)_publishSignInTelemetryEventForContext:(id)a3;
- (void)setServiceOwners:(id)a3;
- (void)signInService:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)signInToAllServicesInBackground:(BOOL)a3 usingContext:(id)a4 completion:(id)a5;
- (void)signInToAllServicesInBackgroundUsingContext:(id)a3 completion:(id)a4;
- (void)signInToServices:(id)a3 usingContext:(id)a4 completion:(id)a5;
- (void)signOutOfAllServicesUsingContext:(id)a3 completion:(id)a4;
- (void)signOutOfServices:(id)a3 usingContext:(id)a4 completion:(id)a5;
- (void)signOutService:(id)a3 withContext:(id)a4 completion:(id)a5;
@end

@implementation AIDAServiceOwnersManager

- (id)accountForService:(id)a3
{
  id v4 = a3;
  v5 = [(AIDAServiceOwnersManager *)self serviceOwners];
  v6 = [v5 objectForKeyedSubscript:v4];
  v7 = [v6 accountForService:v4];

  return v7;
}

- (NSDictionary)serviceOwners
{
  serviceOwners = self->_serviceOwners;
  if (!serviceOwners)
  {
    os_unfair_lock_lock(&self->_serviceOwnersLock);
    if (!self->_serviceOwners)
    {
      id v4 = [(AIDAServiceOwnersManager *)self _buildServiceOwnerMapping];
      v5 = self->_serviceOwners;
      self->_serviceOwners = v4;
    }
    os_unfair_lock_unlock(&self->_serviceOwnersLock);
    serviceOwners = self->_serviceOwners;
  }
  return serviceOwners;
}

- (id)_buildServiceOwnerMapping
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  accountStore = self->_accountStore;
  if (accountStore)
  {
    v3 = accountStore;
  }
  else
  {
    v3 = [MEMORY[0x1E4F179C8] defaultStore];
  }
  id v4 = v3;
  v5 = [(id)objc_opt_class() _loadServiceOwnerBundlesIfNeeded];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke;
  v10[3] = &unk_1E6CBED90;
  v6 = v4;
  v11 = v6;
  v7 = objc_msgSend(v5, "aaf_map:", v10);
  v8 = _AIDALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1DD36A000, v8, OS_LOG_TYPE_DEFAULT, "Finished building service owner mapping: %@", buf, 0xCu);
  }

  return v7;
}

+ (id)_loadServiceOwnerBundlesIfNeeded
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AIDAServiceOwnersManager__loadServiceOwnerBundlesIfNeeded__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_loadServiceOwnerBundlesIfNeededOnceToken != -1) {
    dispatch_once(&_loadServiceOwnerBundlesIfNeededOnceToken, block);
  }
  v2 = (void *)_loadServiceOwnerBundlesIfNeeded_bundles;
  return v2;
}

uint64_t __60__AIDAServiceOwnersManager__loadServiceOwnerBundlesIfNeeded__block_invoke(uint64_t a1)
{
  _loadServiceOwnerBundlesIfNeeded_bundles = [*(id *)(a1 + 32) _loadServiceOwnerBundles];
  return MEMORY[0x1F41817F8]();
}

+ (id)_loadServiceOwnerBundles
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() serviceOwnerBundles];
  id v4 = _AIDALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v3;
    _os_log_impl(&dword_1DD36A000, v4, OS_LOG_TYPE_DEFAULT, "Building AIDA service owner bundle mapping for bundles: %@", buf, 0xCu);
  }

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = [a1 _rejectionlistedBundleIDs];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __52__AIDAServiceOwnersManager__loadServiceOwnerBundles__block_invoke;
  v15 = &unk_1E6CBEDD8;
  id v16 = v6;
  id v7 = v5;
  id v17 = v7;
  id v8 = v6;
  [v3 enumerateObjectsUsingBlock:&v12];
  v9 = _AIDALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v7;
    _os_log_impl(&dword_1DD36A000, v9, OS_LOG_TYPE_DEFAULT, "Completed building AIDA service owner mapping with result: %@", buf, 0xCu);
  }

  v10 = objc_msgSend(v7, "copy", v12, v13, v14, v15);
  return v10;
}

+ (NSSet)serviceOwnerBundles
{
  if (serviceOwnerBundles_onceToken != -1) {
    dispatch_once(&serviceOwnerBundles_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)serviceOwnerBundles_serviceOwnerBundles;
  return (NSSet *)v2;
}

+ (id)_rejectionlistedBundleIDs
{
  v2 = (void *)[(id)_AIDAServiceOwnersManagerRejectionlist copy];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceOwners, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

void __52__AIDAServiceOwnersManager__loadServiceOwnerBundles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 bundleIdentifier];
  int v6 = [v4 containsObject:v5];

  id v7 = _AIDALogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v3;
      _os_log_impl(&dword_1DD36A000, v7, OS_LOG_TYPE_DEFAULT, "Skipping rejectionlisted AIDA bundle: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v3;
      _os_log_impl(&dword_1DD36A000, v7, OS_LOG_TYPE_DEFAULT, "Loading AIDA service owner bundle: %@", buf, 0xCu);
    }

    id v24 = 0;
    char v9 = [v3 loadAndReturnError:&v24];
    id v7 = v24;
    v10 = _AIDALogSystem();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v3;
        _os_log_impl(&dword_1DD36A000, v11, OS_LOG_TYPE_DEFAULT, "Loaded bundle: %@", buf, 0xCu);
      }

      uint64_t v12 = (void *)[v3 principalClass];
      if ([v12 conformsToProtocol:&unk_1F3891158])
      {
        v11 = [v12 supportedServices];
        uint64_t v13 = [v11 count];
        uint64_t v14 = _AIDALogSystem();
        v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v27 = v3;
            __int16 v28 = 2112;
            v29 = v12;
            __int16 v30 = 2112;
            v31 = v11;
            _os_log_impl(&dword_1DD36A000, v15, OS_LOG_TYPE_DEFAULT, "Loaded AIDA service owner bundle (%@) with principal class (%@) for services: %@", buf, 0x20u);
          }

          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          v15 = v11;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v21;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v21 != v18) {
                  objc_enumerationMutation(v15);
                }
                objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
            }
            while (v17);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          __52__AIDAServiceOwnersManager__loadServiceOwnerBundles__block_invoke_cold_1();
        }
      }
      else
      {
        v11 = _AIDALogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_2();
        }
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __52__AIDAServiceOwnersManager__loadServiceOwnerBundles__block_invoke_cold_3();
    }
  }
}

NSObject *__53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AIDALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = v4;
    _os_log_impl(&dword_1DD36A000, v5, OS_LOG_TYPE_DEFAULT, "Building service owner for bundle: %@", (uint8_t *)&v12, 0xCu);
  }

  if (([v4 isLoaded] & 1) == 0)
  {
    id v7 = _AIDALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_3();
    }
    goto LABEL_13;
  }
  int v6 = (void *)[v4 principalClass];
  if (([v6 conformsToProtocol:&unk_1F3891158] & 1) == 0)
  {
    id v7 = _AIDALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_2();
    }
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  id v7 = [objc_alloc((Class)v6) initWithAccountStore:*(void *)(a1 + 32)];
  BOOL v8 = _AIDALogSystem();
  char v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1DD36A000, v9, OS_LOG_TYPE_DEFAULT, "Allocated and initialized service owner: %@", (uint8_t *)&v12, 0xCu);
    }

    id v7 = v7;
    v10 = v7;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_1();
    }

    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (AIDAServiceOwnersManager)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AIDAServiceOwnersManager;
  int v6 = [(AIDAServiceOwnersManager *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    serviceOwners = v6->_serviceOwners;
    v6->_serviceOwners = 0;

    v7->_serviceOwnersLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v7->_accountStore, a3);
  }

  return v7;
}

uint64_t __47__AIDAServiceOwnersManager_serviceOwnerBundles__block_invoke()
{
  serviceOwnerBundles_serviceOwnerBundles = [MEMORY[0x1E4F17A00] pluginBundlesAtSubpath:@"ServiceOwners"];
  return MEMORY[0x1F41817F8]();
}

- (AIDAServiceOwnersManager)init
{
  return 0;
}

+ (void)_set_loadServiceOwnerBundlesIfNeeded_onceToken:(int64_t)a3
{
  _loadServiceOwnerBundlesIfNeededOnceToken = a3;
}

+ (void)configureProcessSpecificServiceOwnerRejectionlist:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _AIDALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1DD36A000, v4, OS_LOG_TYPE_DEFAULT, "Configuring process-specific rejectionlist: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = [v3 copy];
  int v6 = (void *)_AIDAServiceOwnersManagerRejectionlist;
  _AIDAServiceOwnersManagerRejectionlist = v5;
}

+ (void)configureProcessSpecificSupplementalServiceTypes:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _AIDALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1DD36A000, v4, OS_LOG_TYPE_DEFAULT, "Configuring process-specific supplemental services: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = [v3 copy];
  int v6 = (void *)_AIDAServiceOwnersManagerSupplementalServiceTypes;
  _AIDAServiceOwnersManagerSupplementalServiceTypes = v5;
}

+ (id)_supplementalServiceTypes
{
  v2 = (void *)[(id)_AIDAServiceOwnersManagerSupplementalServiceTypes copy];
  return v2;
}

+ (NSArray)supportedServices
{
  id v3 = [a1 _loadServiceOwnerBundlesIfNeeded];
  id v4 = (void *)MEMORY[0x1E4F1CA70];
  uint64_t v5 = [v3 allKeys];
  int v6 = [v4 orderedSetWithArray:v5];

  int v7 = [a1 _supplementalServiceTypes];
  if (v7) {
    [v6 unionSet:v7];
  }
  if ([v6 containsObject:@"com.apple.AppleID.Service.Cloud"])
  {
    [v6 removeObject:@"com.apple.AppleID.Service.Cloud"];
    [v6 insertObject:@"com.apple.AppleID.Service.Cloud" atIndex:0];
  }
  id v8 = _AIDALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[AIDAServiceOwnersManager supportedServices]();
  }

  uint64_t v9 = [v6 array];

  return (NSArray *)v9;
}

- (id)altDSIDForAccount:(id)a3 service:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AIDAServiceOwnersManager *)self serviceOwners];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];
  objc_super v10 = [v9 altDSIDForAccount:v7 service:v6];

  return v10;
}

- (id)DSIDForAccount:(id)a3 service:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AIDAServiceOwnersManager *)self serviceOwners];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];
  objc_super v10 = [v9 DSIDForAccount:v7 service:v6];

  return v10;
}

- (id)nameComponentsForAccount:(id)a3 service:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AIDAServiceOwnersManager *)self serviceOwners];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];
  objc_super v10 = [v9 nameComponentsForAccount:v7 service:v6];

  return v10;
}

- (void)signInService:(id)a3 withContext:(id)a4 completion:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v33 = a5;
  objc_super v10 = [(AIDAServiceOwnersManager *)self serviceOwners];
  v11 = [v10 objectForKeyedSubscript:v8];

  if (v11)
  {
    int v12 = [MEMORY[0x1E4F4EF40] sharedInstance];
    uint64_t v13 = (void *)MEMORY[0x1E4F46FC8];
    uint64_t v14 = [v9 authenticationResults];
    uint64_t v32 = objc_msgSend(v13, "aida_analyticsStartEventForAIDAServiceType:accountManager:authenticationResults:", v8, v12, v14);

    v15 = +[AIDAAnalyticsReporterRTC sharedTelemetryReporter];
    [v15 sendEvent:v32];

    uint64_t v16 = (void *)MEMORY[0x1E4F46FC8];
    uint64_t v17 = [v9 authenticationResults];
    v31 = objc_msgSend(v16, "aida_analyticsDurationEventForAIDAServiceType:accountManager:authenticationResults:", v8, v12, v17);

    uint64_t v18 = _os_activity_create(&dword_1DD36A000, "AIDA/signInService", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v18, &state);
    id v19 = _AIDASignpostLogSystem();
    os_signpost_id_t v20 = _AIDASignpostCreate(v19);
    uint64_t v22 = v21;

    long long v23 = _AIDASignpostLogSystem();
    id v24 = v23;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)buf = 138543362;
      os_signpost_id_t v45 = (os_signpost_id_t)v8;
      _os_signpost_emit_with_name_impl(&dword_1DD36A000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v20, "SignInService", " ServiceType=%{public,signpost.telemetry:string1,name=ServiceType}@  enableTelemetry=YES ", buf, 0xCu);
    }

    v25 = _AIDASignpostLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      os_signpost_id_t v45 = v20;
      __int16 v46 = 2114;
      id v47 = v8;
      _os_log_impl(&dword_1DD36A000, v25, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInService  ServiceType=%{public,signpost.telemetry:string1,name=ServiceType}@  enableTelemetry=YES ", buf, 0x16u);
    }

    v26 = (void *)[v9 copy];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __65__AIDAServiceOwnersManager_signInService_withContext_completion___block_invoke;
    v34[3] = &unk_1E6CBEE00;
    id v27 = v31;
    id v35 = v27;
    v36 = self;
    os_signpost_id_t v41 = v20;
    uint64_t v42 = v22;
    id v37 = v8;
    id v28 = v26;
    id v38 = v28;
    id v40 = v33;
    id v29 = v12;
    id v39 = v29;
    [v11 signInService:v37 withContext:v28 completion:v34];

    os_activity_scope_leave(&state);
  }
  else
  {
    __int16 v30 = _AIDALogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[AIDAServiceOwnersManager signInService:withContext:completion:]();
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "aida_errorWithCode:", -1001);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v33 + 2))(v33, 0, v29);
  }
}

void __65__AIDAServiceOwnersManager_signInService_withContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  objc_msgSend(v5, "aida_updateEventWithSuccess:error:", a2, v6);
  id v7 = +[AIDAAnalyticsReporterRTC sharedTelemetryReporter];
  [v7 sendEvent:*(void *)(a1 + 32)];

  objc_msgSend(*(id *)(a1 + 40), "_completeSignInSignpost:forService:context:success:error:", *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 48), *(void *)(a1 + 56), a2, v6);
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  id v8 = (void *)MEMORY[0x1E4F46FC8];
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 48);
  v11 = [*(id *)(a1 + 56) authenticationResults];
  objc_msgSend(v8, "aida_analyticsFinishEventForAIDAServiceType:accountManager:authenticationResults:success:error:", v10, v9, v11, a2, v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  int v12 = +[AIDAAnalyticsReporterRTC sharedTelemetryReporter];
  [v12 sendEvent:v13];
}

- (void)signInToAllServicesInBackgroundUsingContext:(id)a3 completion:(id)a4
{
}

- (id)_postCloudSupportedServicesForAltDSID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(AIDAServiceOwnersManager *)self accountForService:@"com.apple.AppleID.Service.Cloud"];
    if (v5)
    {
      id v6 = [(AIDAServiceOwnersManager *)self altDSIDForAccount:v5 service:@"com.apple.AppleID.Service.Cloud"];
      if (v6 && [v4 isEqualToString:v6])
      {
        id v7 = +[AIDAServiceOwnersManager supportedServices];
        id v8 = (void *)[v7 mutableCopy];

        [v8 removeObject:@"com.apple.AppleID.Service.Cloud"];
        uint64_t v9 = (void *)[v8 copy];
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)signInToAllServicesInBackground:(BOOL)a3 usingContext:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = _AIDALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AIDAServiceOwnersManager signInToAllServicesInBackground:usingContext:completion:](v8);
  }

  v11 = _AIDALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AIDAServiceOwnersManager signInToAllServicesInBackground:usingContext:completion:](v8);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke;
  v14[3] = &unk_1E6CBEEA0;
  id v15 = v8;
  id v16 = v9;
  v14[4] = self;
  BOOL v17 = a3;
  id v12 = v8;
  id v13 = v9;
  [(AIDAServiceOwnersManager *)self signInService:@"com.apple.AppleID.Service.Cloud" withContext:v12 completion:v14];
}

void __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  if (v23)
  {
    uint64_t v5 = _AIDALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD36A000, v5, OS_LOG_TYPE_DEFAULT, "Failed global signin with authentication results for cloud service.", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    char v21 = a2;
    uint64_t v22 = a1;
    id v7 = *(void **)(a1 + 32);
    id v6 = (id *)(a1 + 32);
    id v8 = [v6[1] authenticationResults];
    id v9 = [v8 objectForKeyedSubscript:@"AKAltDSID"];
    uint64_t v10 = [v7 _postCloudSupportedServicesForAltDSID:v9];

    v25 = (void *)[v6[1] mutableCopy];
    [v25 setOperationUIPermissions:0];
    v11 = dispatch_group_create();
    *(void *)buf = 0;
    os_signpost_id_t v41 = buf;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy_;
    v44 = __Block_byref_object_dispose_;
    id v45 = *v6;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v10;
    uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          dispatch_group_enter(v11);
          id v16 = dispatch_get_global_queue(33, 0);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke_101;
          block[3] = &unk_1E6CBEE50;
          block[4] = v15;
          id v35 = buf;
          id v33 = v25;
          v34 = v11;
          dispatch_async(v16, block);
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v12);
    }

    if (*(unsigned char *)(v22 + 56))
    {
      char v17 = a2;
      (*(void (**)(void))(*(void *)(v22 + 48) + 16))();
      char v18 = *(unsigned char *)(v22 + 56);
    }
    else
    {
      char v18 = 0;
      char v17 = v21;
    }
    id v19 = dispatch_get_global_queue(33, 0);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke_106;
    v26[3] = &unk_1E6CBEE78;
    char v30 = v18;
    id v20 = *(id *)(v22 + 48);
    char v31 = v17;
    id v27 = 0;
    id v28 = v20;
    id v29 = buf;
    dispatch_group_notify(v11, v19, v26);

    _Block_object_dispose(buf, 8);
  }
}

void __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke_101(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _AIDALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1DD36A000, v2, OS_LOG_TYPE_DEFAULT, "Logging into service %{public}@", buf, 0xCu);
  }

  id v4 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke_102;
  v7[3] = &unk_1E6CBEE28;
  v7[4] = v5;
  id v8 = *(id *)(a1 + 48);
  [v4 signInService:v5 withContext:v6 completion:v7];
}

void __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke_102(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _AIDALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"NO";
    int v9 = 138412802;
    if (a2) {
      id v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1DD36A000, v6, OS_LOG_TYPE_DEFAULT, "Log in to service %@ completed with result: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __84__AIDAServiceOwnersManager_signInToAllServicesInBackground_usingContext_completion___block_invoke_106(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)signInToServices:(id)a3 usingContext:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke;
  v25[3] = &unk_1E6CBEF40;
  v25[4] = self;
  id v11 = v9;
  id v26 = v11;
  id v28 = v29;
  id v12 = v10;
  id v27 = v12;
  __int16 v13 = (void (**)(void, void))MEMORY[0x1E01B3300](v25);
  id v14 = (void *)[v8 mutableCopy];
  if (![v14 containsObject:@"com.apple.AppleID.Service.Cloud"])
  {
    id v16 = v8;
    goto LABEL_7;
  }
  uint64_t v15 = @"com.apple.AppleID.Service.Cloud";
  [v14 removeObject:v15];
  id v16 = (void *)[v14 copy];

  if (!v15)
  {
LABEL_7:
    ((void (**)(void, void *))v13)[2](v13, v14);
    goto LABEL_8;
  }
  char v17 = _AIDALogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v15;
    _os_log_impl(&dword_1DD36A000, v17, OS_LOG_TYPE_DEFAULT, "signInToServices - Logging into service %{public}@", buf, 0xCu);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_111;
  v19[3] = &unk_1E6CBEF68;
  id v24 = v29;
  char v18 = v15;
  id v20 = v18;
  id v22 = v12;
  id v23 = v13;
  id v21 = v14;
  [(AIDAServiceOwnersManager *)self signInService:v18 withContext:v11 completion:v19];

LABEL_8:
  _Block_object_dispose(v29, 8);
}

void __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 1;
  id v4 = dispatch_group_create();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * v7);
        dispatch_group_enter(v4);
        id v9 = dispatch_get_global_queue(33, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_2;
        block[3] = &unk_1E6CBEEF0;
        uint64_t v10 = *(void *)(a1 + 32);
        id v11 = *(void **)(a1 + 40);
        block[4] = v8;
        void block[5] = v10;
        id v21 = v11;
        uint64_t v12 = *(void *)(a1 + 56);
        id v23 = v29;
        uint64_t v24 = v12;
        id v22 = v4;
        dispatch_async(v9, block);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v5);
  }

  __int16 v13 = dispatch_get_global_queue(33, 0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_2_109;
  v17[3] = &unk_1E6CBEF18;
  id v19 = v29;
  long long v15 = *(_OWORD *)(a1 + 48);
  id v14 = (id)v15;
  long long v18 = v15;
  dispatch_group_notify(v4, v13, v17);

  _Block_object_dispose(v29, 8);
}

void __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _AIDALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1DD36A000, v2, OS_LOG_TYPE_DEFAULT, "signInToServices - Logging into service %{public}@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_107;
  v9[3] = &unk_1E6CBEEC8;
  uint64_t v11 = *(void *)(a1 + 72);
  v9[4] = v5;
  long long v8 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v8;
  long long v10 = v8;
  [v4 signInService:v5 withContext:v6 completion:v9];
}

void __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_107(void *a1, uint64_t a2, void *a3)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  id v5 = a3;
  uint64_t v6 = [[AIDAServiceOperationResult alloc] initWithSuccess:a2 error:v5 type:a1[4]];

  [*(id *)(*(void *)(a1[7] + 8) + 40) setObject:v6 forKeyedSubscript:a1[4]];
  id v7 = a1[5];
  dispatch_group_leave(v7);
}

void __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_2_109(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1[5] + 8) + 40) copy];
  uint64_t v3 = _AIDALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    int v5 = 138412546;
    uint64_t v6 = v4;
    __int16 v7 = 2112;
    long long v8 = v2;
    _os_log_impl(&dword_1DD36A000, v3, OS_LOG_TYPE_DEFAULT, "signInToServices completed with success %@ and results: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __69__AIDAServiceOwnersManager_signInToServices_usingContext_completion___block_invoke_111(void *a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [[AIDAServiceOperationResult alloc] initWithSuccess:a2 error:v5 type:a1[4]];

  [*(id *)(*(void *)(a1[8] + 8) + 40) setObject:v6 forKeyedSubscript:a1[4]];
  if (a2)
  {
    __int16 v7 = *(void (**)(void))(a1[7] + 16);
    v7();
  }
  else
  {
    long long v8 = _AIDALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(a1[8] + 8) + 40);
      int v12 = 138412290;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1DD36A000, v8, OS_LOG_TYPE_DEFAULT, "signInToServices failed sign in for primary account with results: %@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v10 = a1[6];
    uint64_t v11 = (void *)[*(id *)(*(void *)(a1[8] + 8) + 40) copy];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
}

- (void)signOutService:(id)a3 withContext:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _AIDASignpostLogSystem();
  os_signpost_id_t v12 = _AIDASignpostCreate(v11);
  uint64_t v14 = v13;

  long long v15 = _AIDASignpostLogSystem();
  id v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v8;
    _os_signpost_emit_with_name_impl(&dword_1DD36A000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SignOutService", " ServiceType=%{public,signpost.telemetry:string1,name=ServiceType}@  enableTelemetry=YES ", buf, 0xCu);
  }

  char v17 = _AIDASignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_1DD36A000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignOutService  ServiceType=%{public,signpost.telemetry:string1,name=ServiceType}@  enableTelemetry=YES ", buf, 0x16u);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__AIDAServiceOwnersManager_signOutService_withContext_completion___block_invoke;
  v24[3] = &unk_1E6CBEF90;
  os_signpost_id_t v26 = v12;
  uint64_t v27 = v14;
  id v18 = v10;
  id v25 = v18;
  id v19 = (void (**)(void, void, void))MEMORY[0x1E01B3300](v24);
  id v20 = [(AIDAServiceOwnersManager *)self serviceOwners];
  id v21 = [v20 objectForKeyedSubscript:v8];

  if (v21)
  {
    id v22 = _os_activity_create(&dword_1DD36A000, "AIDA/signOutService", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = 0;
    os_activity_scope_enter(v22, (os_activity_scope_state_t)buf);
    id v23 = (void *)[v9 copy];
    [v21 signOutService:v8 withContext:v23 completion:v19];

    os_activity_scope_leave((os_activity_scope_state_t)buf);
  }
  else
  {
    id v22 = objc_msgSend(MEMORY[0x1E4F28C58], "aida_errorWithCode:", -1001);
    ((void (**)(void, void, NSObject *))v19)[2](v19, 0, v22);
  }
}

void __66__AIDAServiceOwnersManager_signOutService_withContext_completion___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t Nanoseconds = _AIDASignpostGetNanoseconds(a1[5], a1[6]);
  __int16 v7 = _AIDASignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v14 = 67240448;
    *(_DWORD *)long long v15 = a2;
    *(_WORD *)&v15[4] = 1026;
    *(_DWORD *)&v15[6] = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_1DD36A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SignOutService", " Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v14, 0xEu);
  }

  id v10 = _AIDASignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[5];
    int v13 = [v5 code];
    int v14 = 134218752;
    *(void *)long long v15 = v12;
    *(_WORD *)&v15[8] = 2048;
    double v16 = v11;
    __int16 v17 = 1026;
    int v18 = a2;
    __int16 v19 = 1026;
    int v20 = v13;
    _os_log_impl(&dword_1DD36A000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignOutService  Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v14, 0x22u);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)signOutOfAllServicesUsingContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[AIDAServiceOwnersManager supportedServices];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__AIDAServiceOwnersManager_signOutOfAllServicesUsingContext_completion___block_invoke;
  v10[3] = &unk_1E6CBEFB8;
  id v11 = v6;
  id v9 = v6;
  [(AIDAServiceOwnersManager *)self signOutOfServices:v8 usingContext:v7 completion:v10];
}

void __72__AIDAServiceOwnersManager_signOutOfAllServicesUsingContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 objectForKeyedSubscript:@"com.apple.AppleID.Service.Cloud"];
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 success];
    id v7 = [v8 error];
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, 1, 0);
  }
}

- (void)signOutOfServices:(id)a3 usingContext:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  void v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke;
  v25[3] = &unk_1E6CBEF40;
  v25[4] = self;
  id v11 = v9;
  id v26 = v11;
  long long v28 = v29;
  id v12 = v10;
  id v27 = v12;
  int v13 = (void (**)(void, void))MEMORY[0x1E01B3300](v25);
  int v14 = (void *)[v8 mutableCopy];
  if (![v14 containsObject:@"com.apple.AppleID.Service.Cloud"])
  {
    double v16 = v8;
    goto LABEL_7;
  }
  long long v15 = @"com.apple.AppleID.Service.Cloud";
  [v14 removeObject:v15];
  double v16 = (void *)[v14 copy];

  if (!v15)
  {
LABEL_7:
    ((void (**)(void, void *))v13)[2](v13, v14);
    goto LABEL_8;
  }
  __int16 v17 = _AIDALogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v15;
    _os_log_impl(&dword_1DD36A000, v17, OS_LOG_TYPE_DEFAULT, "signOutOfServices - Logging out of primary service %{public}@", buf, 0xCu);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_115;
  v19[3] = &unk_1E6CBEF68;
  uint64_t v24 = v29;
  int v18 = v15;
  int v20 = v18;
  id v22 = v12;
  id v23 = v13;
  id v21 = v14;
  [(AIDAServiceOwnersManager *)self signOutService:v18 withContext:v11 completion:v19];

LABEL_8:
  _Block_object_dispose(v29, 8);
}

void __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 1;
  id v4 = dispatch_group_create();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * v7);
        dispatch_group_enter(v4);
        id v9 = dispatch_get_global_queue(33, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_2;
        block[3] = &unk_1E6CBEEF0;
        uint64_t v10 = *(void *)(a1 + 32);
        id v11 = *(void **)(a1 + 40);
        block[4] = v8;
        void block[5] = v10;
        id v21 = v11;
        uint64_t v12 = *(void *)(a1 + 56);
        id v23 = v29;
        uint64_t v24 = v12;
        id v22 = v4;
        dispatch_async(v9, block);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v5);
  }

  int v13 = dispatch_get_global_queue(33, 0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_2_114;
  v17[3] = &unk_1E6CBEF18;
  __int16 v19 = v29;
  long long v15 = *(_OWORD *)(a1 + 48);
  id v14 = (id)v15;
  long long v18 = v15;
  dispatch_group_notify(v4, v13, v17);

  _Block_object_dispose(v29, 8);
}

void __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _AIDALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1DD36A000, v2, OS_LOG_TYPE_DEFAULT, "signOutOfServices - Logging out of service %{public}@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_113;
  v9[3] = &unk_1E6CBEEC8;
  uint64_t v11 = *(void *)(a1 + 72);
  v9[4] = v5;
  long long v8 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v8;
  long long v10 = v8;
  [v4 signOutService:v5 withContext:v6 completion:v9];
}

void __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_113(void *a1, uint64_t a2, void *a3)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  id v5 = a3;
  uint64_t v6 = [[AIDAServiceOperationResult alloc] initWithSuccess:a2 error:v5 type:a1[4]];

  [*(id *)(*(void *)(a1[7] + 8) + 40) setObject:v6 forKeyedSubscript:a1[4]];
  id v7 = a1[5];
  dispatch_group_leave(v7);
}

void __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_2_114(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1[5] + 8) + 40) copy];
  uint64_t v3 = _AIDALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    int v5 = 138412546;
    uint64_t v6 = v4;
    __int16 v7 = 2112;
    long long v8 = v2;
    _os_log_impl(&dword_1DD36A000, v3, OS_LOG_TYPE_DEFAULT, "signOutOfServices completed with success %@ and results: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __70__AIDAServiceOwnersManager_signOutOfServices_usingContext_completion___block_invoke_115(void *a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [[AIDAServiceOperationResult alloc] initWithSuccess:a2 error:v5 type:a1[4]];

  [*(id *)(*(void *)(a1[8] + 8) + 40) setObject:v6 forKeyedSubscript:a1[4]];
  if (a2)
  {
    __int16 v7 = *(void (**)(void))(a1[7] + 16);
    v7();
  }
  else
  {
    long long v8 = _AIDALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(a1[8] + 8) + 40);
      int v12 = 138412290;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1DD36A000, v8, OS_LOG_TYPE_DEFAULT, "signOutOfServices failed sign out for primary account with results: %@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v10 = a1[6];
    uint64_t v11 = (void *)[*(id *)(*(void *)(a1[8] + 8) + 40) copy];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
}

+ (id)_sharedTelemetryReporter
{
  if (_sharedTelemetryReporter_once != -1) {
    dispatch_once(&_sharedTelemetryReporter_once, &__block_literal_global_117);
  }
  uint64_t v2 = (void *)_sharedTelemetryReporter_reporter;
  return v2;
}

void __52__AIDAServiceOwnersManager__sharedTelemetryReporter__block_invoke()
{
  id v2 = (id)objc_opt_new();
  uint64_t v0 = [MEMORY[0x1E4F46FD0] analyticsReporterWithTransport:v2];
  v1 = (void *)_sharedTelemetryReporter_reporter;
  _sharedTelemetryReporter_reporter = v0;
}

- (void)_completeSignInSignpost:(id)a3 forService:(id)a4 context:(id)a5 success:(BOOL)a6 error:(id)a7
{
  BOOL v29 = a6;
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  char v30 = [v11 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
  uint64_t v14 = [NSString stringWithFormat:@"%s_%@", "SignInService", v30];
  long long v15 = [NSString stringWithFormat:@"%@_errorCode", v14];
  double v16 = [NSString stringWithFormat:@"%@_errorDomain", v14];
  if (v13)
  {
    __int16 v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "code"));
  }
  else
  {
    __int16 v17 = 0;
  }
  long long v18 = [v12 _telemetryTimeSeries];
  [v18 setObject:v17 forKeyedSubscript:v15];

  if (v13) {
  __int16 v19 = [v13 domain];
  }
  int v20 = [v12 _telemetryTimeSeries];
  [v20 setObject:v19 forKeyedSubscript:v16];

  double Nanoseconds = (double)_AIDASignpostGetNanoseconds(var0, var1);
  id v22 = _AIDASignpostLogSystem();
  id v23 = v22;
  if (var0 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138543874;
    unint64_t v33 = (unint64_t)v11;
    __int16 v34 = 1026;
    *(_DWORD *)id v35 = v29;
    *(_WORD *)&v35[4] = 1026;
    *(_DWORD *)&v35[6] = [v13 code];
    _os_signpost_emit_with_name_impl(&dword_1DD36A000, v23, OS_SIGNPOST_INTERVAL_END, var0, "SignInService", " ServiceType=%{public,signpost.telemetry:string2,name=ServiceType}@  Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x18u);
  }
  double v24 = Nanoseconds / 1000000000.0;

  long long v25 = _AIDASignpostLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = [v13 code];
    *(_DWORD *)buf = 134219010;
    unint64_t v33 = var0;
    __int16 v34 = 2048;
    *(double *)id v35 = v24;
    *(_WORD *)&v35[8] = 2114;
    id v36 = v11;
    __int16 v37 = 1026;
    BOOL v38 = v29;
    __int16 v39 = 1026;
    int v40 = v26;
    _os_log_impl(&dword_1DD36A000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInService  ServiceType=%{public,signpost.telemetry:string2,name=ServiceType}@  Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x2Cu);
  }

  long long v27 = [v12 _telemetryTimeSeries];
  long long v28 = [NSNumber numberWithDouble:v24];
  [v27 setObject:v28 forKeyedSubscript:v14];

  [(AIDAServiceOwnersManager *)self _publishSignInTelemetryEventForContext:v12];
}

- (void)_publishSignInTelemetryEventForContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 _telemetryTimeSeries];
  id v5 = (void *)[v4 copy];

  uint64_t v6 = _AIDALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_1DD36A000, v6, OS_LOG_TYPE_DEFAULT, "Publishing AIDA sign in telemetry event for context (%@) with time series: %@", (uint8_t *)&v10, 0x16u);
  }

  __int16 v7 = [MEMORY[0x1E4F46FC8] analyticsEventWithName:@"com.apple.com.apple.appleidauthentication.sign-in-service" eventCategory:0 initData:v5];
  long long v8 = +[AIDAServiceOwnersManager _sharedTelemetryReporter];
  [v8 sendEvent:v7];

  uint64_t v9 = _AIDALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1DD36A000, v9, OS_LOG_TYPE_DEFAULT, "Published AIDA sign in telemetry event for context (%@)", (uint8_t *)&v10, 0xCu);
  }
}

- (void)setServiceOwners:(id)a3
{
}

void __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD36A000, v0, v1, "Failed to allocate service owner for bundle: %{public}@", v2, v3, v4, v5, v6);
}

void __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD36A000, v0, v1, "Non-conformant principal class for bundle: %{public}@", v2, v3, v4, v5, v6);
}

void __53__AIDAServiceOwnersManager__buildServiceOwnerMapping__block_invoke_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1DD36A000, v0, OS_LOG_TYPE_FAULT, "Bundle already expected to be loaded: %@", v1, 0xCu);
}

void __52__AIDAServiceOwnersManager__loadServiceOwnerBundles__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD36A000, v0, v1, "Missing supported services for bundle: %{public}@", v2, v3, v4, v5, v6);
}

void __52__AIDAServiceOwnersManager__loadServiceOwnerBundles__block_invoke_cold_3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1DD36A000, v1, OS_LOG_TYPE_ERROR, "Failed to load bundle (%{public}@), error: %@", v2, 0x16u);
}

+ (void)supportedServices
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1DD36A000, v0, OS_LOG_TYPE_DEBUG, "AIDA returning supported services: %@", v1, 0xCu);
}

- (void)signInService:withContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DD36A000, v0, v1, "Sign in service attempted with an unsupported service type: %@", v2, v3, v4, v5, v6);
}

- (void)signInToAllServicesInBackground:(void *)a1 usingContext:completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 aaSignInFlowControllerDelegate];
  OUTLINED_FUNCTION_2(&dword_1DD36A000, v2, v3, "AAFlowControllerDelegate set on context: %@", v4, v5, v6, v7, 2u);
}

- (void)signInToAllServicesInBackground:(void *)a1 usingContext:completion:.cold.2(void *a1)
{
  uint64_t v1 = [a1 cdpUiProvider];
  OUTLINED_FUNCTION_2(&dword_1DD36A000, v2, v3, "CDP provider set on context: %@", v4, v5, v6, v7, 2u);
}

@end