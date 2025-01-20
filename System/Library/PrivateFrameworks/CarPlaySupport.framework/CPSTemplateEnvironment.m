@interface CPSTemplateEnvironment
- (BOOL)_applicationRecord:(id)a3 supportsIntentWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_applicationRecord:(id)a3 supportsIntentWithIdentifierInExtensions:(id)a4 error:(id *)a5;
- (BOOL)applicationSupportsIntentWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)canBecomeNowPlayingApp;
- (BOOL)hasAnyTemplateEntitlement;
- (BOOL)hasAudioEntitlement;
- (BOOL)hasChargingEntitlement;
- (BOOL)hasCommunicationEntitlement;
- (BOOL)hasDrivingTaskEntitlement;
- (BOOL)hasFuelingEntitlement;
- (BOOL)hasNavigationEntitlement;
- (BOOL)hasParkingEntitlement;
- (BOOL)hasPublicSafetyEntitlement;
- (BOOL)hasQuickOrderingEntitlement;
- (BOOL)isNowPlayingApp;
- (BOOL)isUserApplication;
- (BOOL)rightHandDrive;
- (BOOL)supportsInstrumentCluster;
- (CARObserverHashTable)environmentObservers;
- (CARSessionStatus)sessionStatus;
- (CPSTemplateEnvironment)initWithConnection:(id)a3 templateProvider:(id)a4;
- (CPTemplateProviding)templateProvider;
- (CPUINowPlayingManager)nowPlayingManager;
- (NSSet)allowedTemplateClasses;
- (NSString)bundleIdentifier;
- (NSXPCConnection)connection;
- (unint64_t)maximumClientHierarchyDepth;
- (unint64_t)maximumTabs;
- (void)addTemplateEnvironmentDelegate:(id)a3;
- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4;
- (void)setEnvironmentObservers:(id)a3;
@end

@implementation CPSTemplateEnvironment

- (CPSTemplateEnvironment)initWithConnection:(id)a3 templateProvider:(id)a4
{
  v65 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v63 = 0;
  objc_storeStrong(&v63, a4);
  v4 = v65;
  v65 = 0;
  v59 = [(CPSTemplateEnvironment *)v4 init];
  v65 = v59;
  objc_storeStrong((id *)&v65, v59);
  if (v59)
  {
    objc_storeWeak((id *)&v65->_connection, location[0]);
    objc_storeWeak((id *)&v65->_templateProvider, v63);
    v5 = (NSString *)(id)objc_msgSend(location[0], "cp_bundleIdentifier");
    bundleIdentifier = v65->_bundleIdentifier;
    v65->_bundleIdentifier = v5;

    id v49 = (id)[location[0] valueForEntitlement:@"com.apple.developer.carplay-maps"];
    char v7 = [v49 BOOLValue];
    v65->_hasNavigationEntitlement = v7 & 1;

    id v50 = (id)[location[0] valueForEntitlement:@"com.apple.developer.carplay-audio"];
    char v8 = [v50 BOOLValue];
    v65->_hasAudioEntitlement = v8 & 1;

    id v51 = (id)[location[0] valueForEntitlement:@"com.apple.developer.carplay-communication"];
    char v9 = [v51 BOOLValue];
    v65->_hasCommunicationEntitlement = v9 & 1;

    id v52 = (id)[location[0] valueForEntitlement:@"com.apple.developer.carplay-charging"];
    char v10 = [v52 BOOLValue];
    v65->_hasChargingEntitlement = v10 & 1;

    id v53 = (id)[location[0] valueForEntitlement:@"com.apple.developer.carplay-parking"];
    char v11 = [v53 BOOLValue];
    v65->_hasParkingEntitlement = v11 & 1;

    id v54 = (id)[location[0] valueForEntitlement:@"com.apple.developer.carplay-quick-ordering"];
    char v12 = [v54 BOOLValue];
    v65->_hasQuickOrderingEntitlement = v12 & 1;

    id v55 = (id)[location[0] valueForEntitlement:@"com.apple.developer.carplay-public-safety"];
    char v13 = [v55 BOOLValue];
    v65->_char hasPublicSafetyEntitlement = v13 & 1;

    id v56 = (id)[location[0] valueForEntitlement:@"com.apple.developer.carplay-fueling"];
    char v14 = [v56 BOOLValue];
    v65->_hasFuelingEntitlement = v14 & 1;

    id v57 = (id)[location[0] valueForEntitlement:@"com.apple.developer.carplay-driving-task"];
    char v15 = [v57 BOOLValue];
    v65->_hasDrivingTaskEntitlement = v15 & 1;

    uint64_t v16 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26DF171D8];
    environmentObservers = v65->_environmentObservers;
    v65->_environmentObservers = (CARObserverHashTable *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x263F30E50]) initWithOptions:5];
    sessionStatus = v65->_sessionStatus;
    v65->_sessionStatus = (CARSessionStatus *)v18;

    if (v65->_hasNavigationEntitlement)
    {
      v20 = (NSSet *)CPSNavigationTemplateClasses();
      allowedTemplateClasses = v65->_allowedTemplateClasses;
      v65->_allowedTemplateClasses = v20;
    }
    else if (v65->_hasAudioEntitlement)
    {
      v22 = (NSSet *)CPSAudioTemplateClasses();
      v23 = v65->_allowedTemplateClasses;
      v65->_allowedTemplateClasses = v22;
    }
    else if (v65->_hasCommunicationEntitlement)
    {
      v24 = (NSSet *)CPSCommunicationTemplateClasses();
      v25 = v65->_allowedTemplateClasses;
      v65->_allowedTemplateClasses = v24;
    }
    else if (v65->_hasChargingEntitlement || v65->_hasParkingEntitlement)
    {
      v26 = (NSSet *)CPSChargingParkingTemplateClasses();
      v27 = v65->_allowedTemplateClasses;
      v65->_allowedTemplateClasses = v26;
    }
    else if (v65->_hasQuickOrderingEntitlement)
    {
      v28 = (NSSet *)CPSQuickOrderingTemplateClasses();
      v29 = v65->_allowedTemplateClasses;
      v65->_allowedTemplateClasses = v28;
    }
    else if (v65->_hasPublicSafetyEntitlement)
    {
      v30 = (NSSet *)CPSPublicSafetyTemplateClasses();
      v31 = v65->_allowedTemplateClasses;
      v65->_allowedTemplateClasses = v30;
    }
    else if (v65->_hasFuelingEntitlement)
    {
      v32 = (NSSet *)CPSFuelingTemplateClasses();
      v33 = v65->_allowedTemplateClasses;
      v65->_allowedTemplateClasses = v32;
    }
    else if (v65->_hasDrivingTaskEntitlement)
    {
      v34 = (NSSet *)CPSDrivingTaskTemplateClasses();
      v35 = v65->_allowedTemplateClasses;
      v65->_allowedTemplateClasses = v34;
    }
    char hasPublicSafetyEntitlement = 1;
    if (!v65->_hasAudioEntitlement)
    {
      char hasPublicSafetyEntitlement = 1;
      if (!v65->_hasCommunicationEntitlement) {
        char hasPublicSafetyEntitlement = v65->_hasPublicSafetyEntitlement;
      }
    }
    v65->_canBecomeNowPlayingApp = hasPublicSafetyEntitlement & 1;
    v43 = (void *)MEMORY[0x263F01868];
    v44 = [(CPSTemplateEnvironment *)v65 bundleIdentifier];
    id v62 = (id)objc_msgSend(v43, "applicationProxyForIdentifier:");

    id v45 = (id)[v62 bundleType];
    char v36 = [v45 isEqualToString:*MEMORY[0x263F01848]];
    v65->_isUserApplication = v36 & 1;

    id v46 = (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:");
    id v61 = (id)objc_msgSend(v62, "objectsForInfoDictionaryKeys:");

    id v60 = (id)[v61 dictionaryForKey:@"UIApplicationSceneManifest"];
    id v47 = (id)[v60 objectForKey:@"CPSupportsInstrumentClusterNavigationScene"];
    char v37 = [v47 BOOLValue];
    v65->_supportsInstrumentCluster = v37 & 1;

    if ([(CPSTemplateEnvironment *)v65 canBecomeNowPlayingApp])
    {
      v38 = (CPUINowPlayingManager *)(id)[MEMORY[0x263F313A0] sharedManager];
      nowPlayingManager = v65->_nowPlayingManager;
      v65->_nowPlayingManager = v38;

      BOOL v40 = [(CPSTemplateEnvironment *)v65 isUserApplication];
      [(CPUINowPlayingManager *)v65->_nowPlayingManager setThrottleBehavior:v40];
      [(CPUINowPlayingManager *)v65->_nowPlayingManager addNowPlayingObserver:v65];
    }
    objc_storeStrong(&v60, 0);
    objc_storeStrong(&v61, 0);
    objc_storeStrong(&v62, 0);
  }
  v42 = v65;
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v65, 0);
  return v42;
}

- (BOOL)hasAnyTemplateEntitlement
{
  BOOL v3 = 1;
  if (![(CPSTemplateEnvironment *)self hasNavigationEntitlement])
  {
    BOOL v3 = 1;
    if (![(CPSTemplateEnvironment *)self hasAudioEntitlement])
    {
      BOOL v3 = 1;
      if (![(CPSTemplateEnvironment *)self hasCommunicationEntitlement])
      {
        BOOL v3 = 1;
        if (![(CPSTemplateEnvironment *)self hasChargingEntitlement])
        {
          BOOL v3 = 1;
          if (![(CPSTemplateEnvironment *)self hasParkingEntitlement])
          {
            BOOL v3 = 1;
            if (![(CPSTemplateEnvironment *)self hasQuickOrderingEntitlement])
            {
              BOOL v3 = 1;
              if (![(CPSTemplateEnvironment *)self hasPublicSafetyEntitlement])
              {
                BOOL v3 = 1;
                if (![(CPSTemplateEnvironment *)self hasFuelingEntitlement]) {
                  return [(CPSTemplateEnvironment *)self hasDrivingTaskEntitlement];
                }
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

- (unint64_t)maximumTabs
{
  if ([(CPSTemplateEnvironment *)self hasAudioEntitlement]) {
    return 4;
  }
  else {
    return 5;
  }
}

- (unint64_t)maximumClientHierarchyDepth
{
  if ([(CPSTemplateEnvironment *)self hasQuickOrderingEntitlement]
    || [(CPSTemplateEnvironment *)self hasDrivingTaskEntitlement])
  {
    return 2;
  }
  if ([(CPSTemplateEnvironment *)self hasFuelingEntitlement]) {
    return 3;
  }
  return 5;
}

- (void)addTemplateEnvironmentDelegate:(id)a3
{
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = [(CPSTemplateEnvironment *)v12 environmentObservers];
  [(CARObserverHashTable *)v4 addObserver:location[0]];

  if ([(CPSTemplateEnvironment *)v12 isNowPlayingApp])
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v5 = MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    char v8 = __57__CPSTemplateEnvironment_addTemplateEnvironmentDelegate___block_invoke;
    char v9 = &unk_2648A3BE0;
    id v10 = location[0];
    dispatch_async(queue, &v5);

    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(location, 0);
}

uint64_t __57__CPSTemplateEnvironment_addTemplateEnvironmentDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applicationDidBecomeNowPlayingApp:", 1, a1, a1);
}

- (BOOL)rightHandDrive
{
  uint64_t v5 = [(CPSTemplateEnvironment *)self sessionStatus];
  id v4 = (id)[(CARSessionStatus *)v5 currentSession];
  id v3 = (id)[v4 configuration];
  char v6 = [v3 rightHandDrive];

  return v6 & 1;
}

- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4
{
  char v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v7 = (id)[v9 bundleIdentifier];
  char v6 = [(CPSTemplateEnvironment *)v11 bundleIdentifier];
  char v4 = objc_msgSend(v7, "isEqualToString:");
  v11->_isNowPlayingApp = v4 & 1;

  char v8 = [(CPSTemplateEnvironment *)v11 environmentObservers];
  [(CARObserverHashTable *)v8 applicationDidBecomeNowPlayingApp:[(CPSTemplateEnvironment *)v11 isNowPlayingApp]];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)applicationSupportsIntentWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = a4;
  id v14 = objc_alloc(MEMORY[0x263F01878]);
  char v15 = [(CPSTemplateEnvironment *)v27 bundleIdentifier];
  id v24 = (id)objc_msgSend(v14, "initWithBundleIdentifier:allowPlaceholder:error:");

  if (v24)
  {
    if ([(CPSTemplateEnvironment *)v27 _applicationRecord:v24 supportsIntentWithIdentifierInExtensions:location[0] error:v25])
    {
      id v20 = CarPlaySupportGeneralLogging();
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
        char v11 = [(CPSTemplateEnvironment *)v27 bundleIdentifier];
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v33, (uint64_t)v11, (uint64_t)location[0]);
        _os_log_impl(&dword_22B689000, (os_log_t)v20, v19, "Application %{public}@ supports intent %{public}@ in extensions", v33, 0x16u);
      }
      objc_storeStrong(&v20, 0);
      char v28 = 1;
      int v21 = 1;
    }
    else if ([(CPSTemplateEnvironment *)v27 _applicationRecord:v24 supportsIntentWithIdentifier:location[0] error:v25])
    {
      os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [(CPSTemplateEnvironment *)v27 bundleIdentifier];
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v32, (uint64_t)v10, (uint64_t)location[0]);
        _os_log_impl(&dword_22B689000, oslog, v17, "Application %{public}@ supports intent %{public}@ in app", v32, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      char v28 = 1;
      int v21 = 1;
    }
    else
    {
      os_log_t v16 = (os_log_t)CarPlaySupportGeneralLogging();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(CPSTemplateEnvironment *)v27 bundleIdentifier];
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v31, (uint64_t)v9, (uint64_t)location[0]);
        _os_log_impl(&dword_22B689000, v16, OS_LOG_TYPE_DEFAULT, "Application %{public}@ does not support intent %{public}@", v31, 0x16u);
      }
      objc_storeStrong((id *)&v16, 0);
      if (v25)
      {
        char v6 = (void *)MEMORY[0x263F087E8];
        uint64_t v29 = *MEMORY[0x263F08320];
        id v8 = (id)[NSString stringWithFormat:@"Application does not support required intent: %@", location[0]];
        id v30 = v8;
        id v7 = (id)[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        id v4 = (id)objc_msgSend(v6, "errorWithDomain:code:userInfo:", @"CPSErrorDomain", -1);
        id *v25 = v4;
      }
      char v28 = 0;
      int v21 = 1;
    }
  }
  else
  {
    id v23 = CarPlaySupportGeneralLogging();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      char v12 = [(CPSTemplateEnvironment *)v27 bundleIdentifier];
      __os_log_helper_16_2_1_8_66((uint64_t)v34, (uint64_t)v12);
      _os_log_impl(&dword_22B689000, (os_log_t)v23, v22, "Failed to lookup app record for %{public}@", v34, 0xCu);
    }
    objc_storeStrong(&v23, 0);
    char v28 = 0;
    int v21 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  return v28 & 1;
}

- (BOOL)_applicationRecord:(id)a3 supportsIntentWithIdentifierInExtensions:(id)a4 error:(id *)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  os_log_type_t v22 = a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  int v19 = 0x20000000;
  int v20 = 32;
  char v21 = 0;
  id v16 = (id)[location[0] applicationExtensionRecords];
  if ([v16 count])
  {
    id v7 = v16;
    uint64_t v10 = MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    char v13 = __92__CPSTemplateEnvironment__applicationRecord_supportsIntentWithIdentifierInExtensions_error___block_invoke;
    id v14 = &unk_2648A4030;
    v15[0] = v23;
    v15[1] = &v17;
    [v7 enumerateObjectsUsingBlock:&v10];
    objc_storeStrong(v15, 0);
  }
  char v6 = *((unsigned char *)v18 + 24);
  objc_storeStrong(&v16, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

void __92__CPSTemplateEnvironment__applicationRecord_supportsIntentWithIdentifierInExtensions_error___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = (id)[location[0] supportedIntents];
  char v6 = [v5 containsObject:a1[4]];

  if (v6)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    *a3 = 1;
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_applicationRecord:(id)a3 supportsIntentWithIdentifier:(id)a4 error:(id *)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v7 = (id)[location[0] supportedIntents];
  char v8 = [v7 containsObject:v9];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (CPTemplateProviding)templateProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateProvider);

  return (CPTemplateProviding *)WeakRetained;
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (CPUINowPlayingManager)nowPlayingManager
{
  return self->_nowPlayingManager;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)canBecomeNowPlayingApp
{
  return self->_canBecomeNowPlayingApp;
}

- (BOOL)isNowPlayingApp
{
  return self->_isNowPlayingApp;
}

- (BOOL)hasNavigationEntitlement
{
  return self->_hasNavigationEntitlement;
}

- (BOOL)hasAudioEntitlement
{
  return self->_hasAudioEntitlement;
}

- (BOOL)hasCommunicationEntitlement
{
  return self->_hasCommunicationEntitlement;
}

- (BOOL)hasChargingEntitlement
{
  return self->_hasChargingEntitlement;
}

- (BOOL)hasParkingEntitlement
{
  return self->_hasParkingEntitlement;
}

- (BOOL)hasQuickOrderingEntitlement
{
  return self->_hasQuickOrderingEntitlement;
}

- (BOOL)hasPublicSafetyEntitlement
{
  return self->_hasPublicSafetyEntitlement;
}

- (BOOL)hasFuelingEntitlement
{
  return self->_hasFuelingEntitlement;
}

- (BOOL)hasDrivingTaskEntitlement
{
  return self->_hasDrivingTaskEntitlement;
}

- (BOOL)supportsInstrumentCluster
{
  return self->_supportsInstrumentCluster;
}

- (NSSet)allowedTemplateClasses
{
  return self->_allowedTemplateClasses;
}

- (BOOL)isUserApplication
{
  return self->_isUserApplication;
}

- (CARObserverHashTable)environmentObservers
{
  return self->_environmentObservers;
}

- (void)setEnvironmentObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end