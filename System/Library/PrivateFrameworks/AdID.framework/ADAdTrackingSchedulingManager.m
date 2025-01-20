@interface ADAdTrackingSchedulingManager
+ (id)sharedInstance;
- (ADAdTrackingSchedulingManager)init;
- (ADLoggingProfileMonitor)loggingProfileMonitor;
- (APSConnection)pushConnection;
- (BOOL)_shouldSaveConfig;
- (BOOL)isAdEnabledLocality;
- (BOOL)isConfigRequestInFlight;
- (BOOL)isNewsOrStocksEnabledLocality;
- (BOOL)isSearchAdsEnabled;
- (BOOL)isSearchOrSegmentEnabled;
- (NSObject)accountChangedNotifyToken;
- (NSObject)storeFrontNotifyToken;
- (id)currentBundleID;
- (id)retrieveNewsRecord:(id *)a3;
- (int64_t)latestPersonalizedConsentVersion;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
- (void)forceExpiration;
- (void)handleAccountChange;
- (void)handleConfiguration;
- (void)migratePersonalizedAdsFromLAT;
- (void)migratePersonalizedAdsOnboarding;
- (void)pushDisable;
- (void)pushEnable;
- (void)refreshConfiguration:(id)a3;
- (void)registerForLockStateNotification;
- (void)setAccountChangedNotifyToken:(id)a3;
- (void)setIsConfigRequestInFlight:(BOOL)a3;
- (void)setLoggingProfileMonitor:(id)a3;
- (void)setPushConnection:(id)a3;
- (void)setStoreFrontNotifyToken:(id)a3;
@end

@implementation ADAdTrackingSchedulingManager

void __54__ADAdTrackingSchedulingManager_refreshConfiguration___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v13 = a2;
  [*(id *)(a1 + 32) setIsConfigRequestInFlight:0];
  if (!a4)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F241B0]) initWithData:v13];
    v7 = NSString;
    v8 = objc_msgSend(v6, "AD_jsonString");
    v9 = [v7 stringWithFormat:@"Received an ADConfigurationResponse: %@", v8];
    _ADLog();

    [*(id *)(a1 + 40) buildConfigurationDictionary:v6];
    uint64_t v10 = ADWriteDataToKeychain();
    [*(id *)(a1 + 40) saveConfig];
    [*(id *)(a1 + 40) saveProxyURL];
    if (v10)
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"There was an error writing the Configuration Response to the keychain: %d", v10);
      _ADLog();
    }
    else
    {
      v11 = [MEMORY[0x263F087C8] defaultCenter];
      [v11 postNotificationName:@"ADConfigurationDidChangeNotification" object:*MEMORY[0x263F24130]];
    }
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);
  }
}

void __54__ADAdTrackingSchedulingManager_refreshConfiguration___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isConfigRequestInFlight])
  {
    v2 = [NSString stringWithFormat:@"Configuration Message is already in flight."];
    _ADLog();

    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setIsConfigRequestInFlight:1];
    id v5 = objc_alloc_init(MEMORY[0x263F241A8]);
    v6 = [MEMORY[0x263F241C0] sharedInstance];
    v7 = [v6 defaultConfigurationServerURL];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__ADAdTrackingSchedulingManager_refreshConfiguration___block_invoke_2;
    v9[3] = &unk_264669E28;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    id v11 = *(id *)(a1 + 48);
    [v10 handleRequest:v5 serverURL:v7 responseHandler:v9];
  }
}

- (void)setIsConfigRequestInFlight:(BOOL)a3
{
  self->_isConfigRequestInFlight = a3;
}

- (BOOL)isConfigRequestInFlight
{
  return self->_isConfigRequestInFlight;
}

uint64_t __52__ADAdTrackingSchedulingManager_handleConfiguration__block_invoke(uint64_t a1)
{
  v2 = [NSString stringWithFormat:@"Force config expiration notification received."];
  _ADLog();

  [*(id *)(a1 + 32) forceExpiration];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 refreshConfiguration:0];
}

- (void)forceExpiration
{
  v2 = [NSString stringWithFormat:@"Expiring and Refreshing the configuration message now."];
  _ADLog();

  uint64_t v3 = [MEMORY[0x263F241B8] sharedInstance];
  [v3 setBool:0 forKey:@"ForceExpireConfiguration"];

  id v4 = [MEMORY[0x263F24230] sharedInstance];
  [v4 setConfigurationExpirationTime:0];
}

- (BOOL)isNewsOrStocksEnabledLocality
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v37 = 0;
  v2 = [(ADAdTrackingSchedulingManager *)self retrieveNewsRecord:&v37];
  id v31 = v37;
  uint64_t v3 = [v2 URL];
  id v4 = [v3 URLByAppendingPathComponent:@"MCRestrictions.plist"];
  if (!v4)
  {
    LOBYTE(v15) = 0;
    v6 = @"is not";
    goto LABEL_21;
  }
  uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4];
  v6 = @"is not";
  if (!v5) {
    goto LABEL_16;
  }
  v7 = (void *)v5;
  v8 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:0 format:0 error:0];
  v9 = v8;
  if (!v8
    || ([v8 objectForKeyedSubscript:@"MCWhitelistedLocales"],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {

LABEL_16:
    LOBYTE(v15) = 0;
    goto LABEL_21;
  }
  id v11 = [v9 objectForKeyedSubscript:@"MCWhitelistedLocales"];
  uint64_t v12 = [MEMORY[0x263EFF960] currentLocale];
  id v13 = [v12 objectForKey:*MEMORY[0x263EFF4D0]];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v15)
  {
    v30 = v2;
    uint64_t v16 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v14);
        }
        if ([v13 isEqualToString:*(void *)(*((void *)&v33 + 1) + 8 * i)])
        {
          LODWORD(v15) = 1;
          goto LABEL_18;
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v15) {
        continue;
      }
      break;
    }
LABEL_18:
    v2 = v30;
  }

  if (v15) {
    v6 = @"is";
  }
LABEL_21:
  v18 = [NSString stringWithFormat:@"This country %@ News enabled", v6];
  _ADLog();

  v19 = [MEMORY[0x263F241B8] sharedInstance];
  int v20 = [v19 BOOLForKey:@"StocksEnabled"];

  id v32 = 0;
  v21 = [MEMORY[0x263F01878] bundleRecordWithBundleIdentifier:@"com.apple.stocks" allowPlaceholder:0 error:&v32];
  id v22 = v32;
  v23 = v22;
  if (!v20)
  {
LABEL_26:
    char v25 = 0;
    v24 = @"is not";
    goto LABEL_27;
  }
  if (!v21 || v22)
  {
    v26 = [MEMORY[0x263F241B8] sharedInstance];
    [v26 setBool:0 forKey:@"StocksEnabled"];

    v27 = [NSString stringWithFormat:@"Stocks was set to enabled but cannot be found due to %@. Disabling...", v23];
    _ADLog();

    goto LABEL_26;
  }
  v24 = @"is";
  char v25 = 1;
LABEL_27:
  v28 = [NSString stringWithFormat:@"This country %@ Stocks enabled", v24];
  _ADLog();

  return v15 | v25;
}

- (id)retrieveNewsRecord:(id *)a3
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:@"com.apple.news" allowPlaceholder:0 error:a3];

  return v3;
}

- (void)refreshConfiguration:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(ADAdTrackingSchedulingManager *)self isAdEnabledLocality])
  {
    uint64_t v5 = [MEMORY[0x263F24230] sharedInstance];
    v6 = [MEMORY[0x263EFF910] date];
    uint64_t v7 = objc_msgSend(v6, "AD_toServerTime");

    uint64_t v8 = [v5 configurations];
    if (v8 && (v9 = (void *)v8, int v10 = [v5 configurationExpirationTime], v9, v10 > (int)v7))
    {
      id v11 = [NSString stringWithFormat:@"Checking if config data has been saved to promotedcontentd key"];
      _ADLog();

      if ([(ADAdTrackingSchedulingManager *)self _shouldSaveConfig]) {
        [v5 saveConfig];
      }
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Configuration Data has not yet expired. (%d > %d)", objc_msgSend(v5, "configurationExpirationTime"), v7);
      _ADLog();

      if (v4) {
        v4[2](v4, 0);
      }
    }
    else
    {
      id v14 = [MEMORY[0x263F24230] workQueue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __54__ADAdTrackingSchedulingManager_refreshConfiguration___block_invoke;
      v15[3] = &unk_264669E50;
      v15[4] = self;
      v17 = v4;
      id v16 = v5;
      [v14 addOperationWithBlock:v15];
    }
  }
  else
  {
    id v13 = [NSString stringWithFormat:@"[%@]: Not refreshing configuration because this is not an Ad-enabled locality", objc_opt_class()];
    _ADLog();

    if (v4) {
      v4[2](v4, 0);
    }
  }
}

- (BOOL)isAdEnabledLocality
{
  if (MGGetBoolAnswer()
    && ([MEMORY[0x263F241B8] sharedInstance],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 BOOLForKey:@"ForceNonAdLocale"],
        v3,
        v4))
  {
    uint64_t v5 = [NSString stringWithFormat:@"[%@]: isAdEnabledLocality is forced OFF by internal default.", objc_opt_class()];
    _ADLog();
    char v6 = 0;
  }
  else
  {
    uint64_t v7 = +[ADAMSBagManager sharedInstance];
    uint64_t v8 = [v7 retrieveLatestPersonalizedAdsConsentVersionFromAMSBag];

    id v9 = objc_alloc(MEMORY[0x263EFFA40]);
    uint64_t v5 = (void *)[v9 initWithSuiteName:*MEMORY[0x263F24150]];
    [v5 setInteger:v8 forKey:@"LatestPAVersion"];
    LOBYTE(v8) = [(ADAdTrackingSchedulingManager *)self isSearchOrSegmentEnabled];
    BOOL v10 = [(ADAdTrackingSchedulingManager *)self isNewsOrStocksEnabledLocality];
    objc_msgSend(v5, "setBool:forKey:", -[ADAdTrackingSchedulingManager isSearchAdsEnabled](self, "isSearchAdsEnabled") | v10, @"AdPlatformsPAAvailable");
    char v6 = v8 | v10;
  }

  return v6;
}

- (BOOL)isSearchOrSegmentEnabled
{
  v2 = +[ADAMSBagManager sharedInstance];
  int v3 = [v2 retrieveIsSponsoredAdsEnabledValueFromAMSBag];

  if (v3)
  {
    int v4 = [NSString stringWithFormat:@"This country is Toro enabled"];
    LOBYTE(v5) = 1;
  }
  else
  {
    char v6 = +[ADAMSBagManager sharedInstance];
    int v5 = [v6 retrieveIsSponsoredAdsEnabledValueForAdTrackingdFromAMSBag];

    uint64_t v7 = @"not Toro enabled";
    if (v5) {
      uint64_t v7 = @"being onboarded for Toro";
    }
    int v4 = [NSString stringWithFormat:@"This country is %@", v7];
  }
  _ADLog();

  return v5;
}

- (BOOL)isSearchAdsEnabled
{
  v2 = +[ADAMSBagManager sharedInstance];
  char v3 = [v2 retrieveIsSponsoredAdsEnabledValueFromAMSBag];

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

uint64_t __47__ADAdTrackingSchedulingManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(ADAdTrackingSchedulingManager);

  return MEMORY[0x270F9A758]();
}

- (ADAdTrackingSchedulingManager)init
{
  v34.receiver = self;
  v34.super_class = (Class)ADAdTrackingSchedulingManager;
  v2 = [(ADAdTrackingSchedulingManager *)&v34 init];
  char v3 = v2;
  if (v2)
  {
    v2->_isConfigRequestInFlight = 0;
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x263EF83F0], 0xFuLL, 0, 0);
    int v5 = (void *)sigterm_source;
    sigterm_source = (uint64_t)v4;

    dispatch_source_set_event_handler((dispatch_source_t)sigterm_source, &__block_literal_global_12);
    dispatch_resume((dispatch_object_t)sigterm_source);
    id v6 = +[ADAppTrackingService sharedInstance];
    id v7 = +[ADIDManagerService sharedInstance];
    id v8 = +[ADDeviceKnowledgeManager sharedInstance];
    [(ADAdTrackingSchedulingManager *)v3 registerForLockStateNotification];
    id v9 = (id)[MEMORY[0x263F24188] sharedInstance];
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.queue.adplatforms.adTracking", 0);
    id v11 = (void *)_adTrackingQueue;
    _adTrackingQueue = (uint64_t)v10;

    uint64_t v12 = _adTrackingQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __37__ADAdTrackingSchedulingManager_init__block_invoke_2;
    handler[3] = &unk_264669DE0;
    id v13 = v3;
    long long v33 = v13;
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v12, handler);
    id v14 = objc_alloc_init(ADLoggingProfileMonitor);
    loggingProfileMonitor = v13->_loggingProfileMonitor;
    v13->_loggingProfileMonitor = v14;

    [(ADAdTrackingSchedulingManager *)v13 migratePersonalizedAdsFromLAT];
    [(ADAdTrackingSchedulingManager *)v13 migratePersonalizedAdsOnboarding];
    [(ADAdTrackingSchedulingManager *)v13 handleConfiguration];
    [(ADAdTrackingSchedulingManager *)v13 pushEnable];
    id v16 = [MEMORY[0x263F087C8] defaultCenter];
    v17 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __37__ADAdTrackingSchedulingManager_init__block_invoke_3;
    v30 = &unk_2646696E8;
    v18 = v13;
    id v31 = v18;
    uint64_t v19 = [v16 addObserverForName:@"com.apple.ap.adprivacyd.iTunesActiveAccountDidChangeNotification" object:0 queue:v17 usingBlock:&v27];
    accountChangedNotifyToken = v18->_accountChangedNotifyToken;
    v18->_accountChangedNotifyToken = v19;

    v21 = objc_msgSend(MEMORY[0x263F241C0], "sharedInstance", v27, v28, v29, v30);
    [v21 reloadStorefront:0];

    id v22 = [MEMORY[0x263F087C8] defaultCenter];
    v23 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v24 = [v22 addObserverForName:@"com.apple.ap.adprivacyd.iTunesActiveStorefrontDidChangeNotification" object:0 queue:v23 usingBlock:&__block_literal_global_84];
    storeFrontNotifyToken = v18->_storeFrontNotifyToken;
    v18->_storeFrontNotifyToken = v24;
  }
  return v3;
}

void __37__ADAdTrackingSchedulingManager_init__block_invoke()
{
  v0 = [NSString stringWithFormat:@"Exiting due to SIGTERM"];
  _ADLog();

  exit(0);
}

void __37__ADAdTrackingSchedulingManager_init__block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86C8]);
  if (!string) {
    return;
  }
  dispatch_source_t v4 = string;
  if (strcmp("com.apple.ap.adprivacyd.iTunesActiveAccountDidChangeNotification", string))
  {
    if (!strcmp("com.apple.ap.adprivacyd.iTunesActiveStorefrontDidChangeNotification", v4))
    {
      id v7 = [NSString stringWithFormat:@"Received Storefront Changed Notification"];
      _ADLog();

      id v15 = [MEMORY[0x263F241C0] sharedInstance];
      [v15 reloadStorefront:0];
    }
    else
    {
      if (!MGGetBoolAnswer()) {
        return;
      }
      if (!strcmp((const char *)[@"com.apple.ap.adprivacyd.reconcile" UTF8String], v4))
      {
        id v8 = [NSString stringWithFormat:@"adprivacyd handling internal notification %@", @"com.apple.ap.adprivacyd.reconcile"];
        _ADLog();

        id v15 = [MEMORY[0x263F241D8] sharedInstance];
        [v15 scheduleReconciliation:0.0];
      }
      else if (!strcmp((const char *)[@"com.apple.ap.adprivacyd.deviceKnowledge" UTF8String], v4))
      {
        id v9 = [NSString stringWithFormat:@"adprivacyd handling internal notification %@", @"com.apple.ap.adprivacyd.deviceKnowledge"];
        _ADLog();

        id v15 = +[ADDeviceKnowledgeManager sharedInstance];
        [v15 scheduleDeviceDataProcessing:0.0];
      }
      else if (!strcmp("com.apple.mobile.keybagd.first_unlock", v4))
      {
        dispatch_queue_t v10 = [NSString stringWithFormat:@"Keybag First Unlock"];
        _ADLog();

        id v15 = [MEMORY[0x263F61F08] sharedInstance];
        [v15 startListening];
      }
      else
      {
        if (!strcmp("com.apple.ap.adprivacyd.launch", v4))
        {
          objc_msgSend(NSString, "stringWithFormat:", @"adprivacyd launched in response to %s", "com.apple.ap.adprivacyd.launch");
LABEL_25:
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          _ADLog();
          goto LABEL_26;
        }
        if (strcmp("com.apple.ap.adprivacyd.canceltasks", v4))
        {
          if (!strcmp("CPInstalledProfileDidChangeNotification", v4))
          {
            uint64_t v12 = NSString;
            id v13 = @"AdPrivacyD launched by CPInstalledProfileDidChangeNotification";
          }
          else
          {
            if (strcmp("com.apple.ManagedConfiguration.profileListChanged", v4)) {
              return;
            }
            uint64_t v12 = NSString;
            id v13 = @"AdPrivacyD launched by com.apple.ManagedConfiguration.profileListChanged";
          }
          objc_msgSend(v12, "stringWithFormat:", v13, v14);
          goto LABEL_25;
        }
        id v11 = objc_msgSend(NSString, "stringWithFormat:", @"adprivacyd handling internal notification %s", "com.apple.ap.adprivacyd.canceltasks");
        _ADLog();

        id v15 = [MEMORY[0x263F24188] sharedInstance];
        [v15 cancelBackgroundTask:@"com.apple.ap.adprivacyd.reconcile"];
      }
    }
LABEL_26:

    return;
  }
  int v5 = [NSString stringWithFormat:@"Received Account Changed Notification"];
  _ADLog();

  id v6 = *(void **)(a1 + 32);

  [v6 handleAccountChange];
}

uint64_t __37__ADAdTrackingSchedulingManager_init__block_invoke_3(uint64_t a1)
{
  v2 = [NSString stringWithFormat:@"Received a Notification from Account Plugin that the Current Account Changed"];
  _ADLog();

  char v3 = *(void **)(a1 + 32);

  return [v3 handleAccountChange];
}

void __37__ADAdTrackingSchedulingManager_init__block_invoke_4()
{
  v0 = [NSString stringWithFormat:@"Received a notification that the storefront changed. Reloading the Bag."];
  _ADLog();

  id v1 = [MEMORY[0x263F241C0] sharedInstance];
  [v1 reloadStorefront:0];
}

- (void)dealloc
{
  char v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self->_storeFrontNotifyToken];

  dispatch_source_t v4 = [MEMORY[0x263F087C8] defaultCenter];
  [v4 removeObserver:self->_accountChangedNotifyToken];

  v5.receiver = self;
  v5.super_class = (Class)ADAdTrackingSchedulingManager;
  [(ADAdTrackingSchedulingManager *)&v5 dealloc];
}

- (void)migratePersonalizedAdsOnboarding
{
  v2 = (void *)MEMORY[0x223CA6640]();
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  dispatch_source_t v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x263F24168]];
  id v5 = objc_alloc(MEMORY[0x263EFFA40]);
  id v6 = (void *)[v5 initWithSuiteName:*MEMORY[0x263F24150]];
  id v7 = [v6 objectForKey:@"acknowledgedPersonalizedAdsVersion"];
  if (v7)
  {
  }
  else
  {
    id v8 = [v4 objectForKey:@"acknowledgedPersonalizedAdsVersion"];

    if (v8)
    {
      id v9 = [NSString stringWithFormat:@"[%@]: Personalized Ads onboarding acknowledgement is being migrated", objc_opt_class()];
      _ADLog();

      objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v4, "integerForKey:", @"acknowledgedPersonalizedAdsVersion"), @"acknowledgedPersonalizedAdsVersion");
    }
  }
}

- (void)migratePersonalizedAdsFromLAT
{
  v2 = (void *)MEMORY[0x223CA6640]();
  id v3 = [MEMORY[0x263F241B8] sharedInstance];
  char v4 = [v3 BOOLForKey:@"personalizedAdsMigrated"];

  if ((v4 & 1) == 0)
  {
    id v5 = [NSString stringWithFormat:@"[%@]: Personalized Ads has not been migrated. Deriving the value from LAT", objc_opt_class()];
    _ADLog();

    id v6 = [MEMORY[0x263F53C50] sharedConnection];
    int v7 = [v6 effectiveBoolValueForSetting:*MEMORY[0x263F53940]];

    if (v7 != 1)
    {
      id v8 = objc_alloc(MEMORY[0x263EFFA40]);
      id v9 = (void *)[v8 initWithSuiteName:*MEMORY[0x263F24150]];
      [v9 setBool:1 forKey:@"personalizedAdsDefaulted"];
    }
    dispatch_queue_t v10 = [MEMORY[0x263F53C50] sharedConnection];
    [v10 setBoolValue:0 forSetting:*MEMORY[0x263F53760]];

    id v11 = [MEMORY[0x263F241B8] sharedInstance];
    [v11 setBool:1 forKey:@"personalizedAdsMigrated"];

    uint64_t v12 = ADWriteDataToKeychain();
    if (v12)
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Error deleting PA from keychain: %d", v12);
      _ADLog();
    }
  }
}

- (int64_t)latestPersonalizedConsentVersion
{
  v2 = +[ADAMSBagManager sharedInstance];
  int64_t v3 = [v2 retrieveLatestPersonalizedAdsConsentVersionFromAMSBag];

  return v3;
}

- (BOOL)_shouldSaveConfig
{
  v2 = [NSString stringWithFormat:@"Checking if config data has been saved to promotedcontentd key"];
  _ADLog();

  int64_t v3 = ADCopyDataFromKeychain();
  LOBYTE(v2) = v3 == 0;

  return (char)v2;
}

- (void)handleConfiguration
{
  int64_t v3 = [MEMORY[0x263F241B8] sharedInstance];
  int v4 = [v3 BOOLForKey:@"ForceExpireConfiguration"];

  if (v4) {
    [(ADAdTrackingSchedulingManager *)self forceExpiration];
  }
  id v5 = [MEMORY[0x263F087C8] defaultCenter];
  uint64_t v6 = *MEMORY[0x263F24130];
  int v7 = [MEMORY[0x263F08A48] mainQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__ADAdTrackingSchedulingManager_handleConfiguration__block_invoke;
  v9[3] = &unk_2646696E8;
  v9[4] = self;
  id v8 = (id)[v5 addObserverForName:@"ForceExpireConfiguration" object:v6 queue:v7 usingBlock:v9];
}

- (id)currentBundleID
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  int64_t v3 = [v2 bundleIdentifier];

  if (![v3 length])
  {
    int v4 = [MEMORY[0x263F086E0] mainBundle];
    id v5 = [v4 executablePath];
    uint64_t v6 = [v5 lastPathComponent];

    int64_t v3 = (void *)v6;
  }

  return v3;
}

- (APSConnection)pushConnection
{
  pushConnection = self->_pushConnection;
  if (!pushConnection)
  {
    id v4 = objc_alloc(MEMORY[0x263F280F0]);
    uint64_t v5 = *MEMORY[0x263F280D0];
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    int v7 = (APSConnection *)[v4 initWithEnvironmentName:v5 namedDelegatePort:@"com.apple.AdSheetPhone.push" queue:v6];
    id v8 = self->_pushConnection;
    self->_pushConnection = v7;

    [(APSConnection *)self->_pushConnection setDelegate:self];
    pushConnection = self->_pushConnection;
    if (!pushConnection)
    {
      id v9 = [NSString stringWithFormat:@"DPID Couldn't create push connection"];
      _ADLog();

      pushConnection = self->_pushConnection;
    }
  }

  return pushConnection;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4 = [NSString stringWithFormat:@"DPID Received public token \"%@\" on connection %@", a4, a3];
  _ADLog();
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  uint64_t v6 = [NSString stringWithFormat:@"DPID Received per-topic push token \"%@\" for topic \"%@\" identifier \"%@\" on connection %@", a4, a5, a6, a3];
  _ADLog();
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v4 = a4;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = NSString;
  int v7 = [v4 topic];

  id v8 = [v6 stringWithFormat:@"DPID APS Push received: %@ %@", v7, v5];
  _ADLog();

  id v9 = +[ADClientDPIDManager sharedInstance];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__ADAdTrackingSchedulingManager_connection_didReceiveIncomingMessage___block_invoke;
  v11[3] = &unk_264669E78;
  id v12 = v5;
  id v10 = v5;
  [v9 handlePushNotification:v10 completionHandler:v11];
}

void __70__ADAdTrackingSchedulingManager_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    [NSString stringWithFormat:@"Handled push notification returned an eror: %@ payload: %@", a2, v2];
  }
  else {
  id v4 = [NSString stringWithFormat:@"Handled push notification successfully. payload: %@", v2, v3];
  }
  _ADLog();
}

- (void)pushEnable
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [@"com.apple.icloud-container." stringByAppendingString:*MEMORY[0x263F24160]];
  v6[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  uint64_t v5 = [(ADAdTrackingSchedulingManager *)self pushConnection];
  [v5 setEnabledTopics:v4];
}

- (void)pushDisable
{
  id v2 = [(ADAdTrackingSchedulingManager *)self pushConnection];
  [v2 setEnabledTopics:0];
}

- (void)handleAccountChange
{
  obj = self;
  objc_sync_enter(obj);
  if (handleAccountChange__handleAccountChangeDispatched == 1)
  {
    id v2 = [NSString stringWithFormat:@"[%@] handleAccountChange: iTunes account change notification has already been dispatched to ADIDManager. Short-circuiting.", objc_opt_class()];
    _ADLog();

    objc_sync_exit(obj);
  }
  else
  {
    handleAccountChange__handleAccountChangeDispatched = 1;
    objc_sync_exit(obj);

    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[3] = &unk_2646696C0;
    block[4] = obj;
    block[2] = __52__ADAdTrackingSchedulingManager_handleAccountChange__block_invoke;
    dispatch_after(v3, v4, block);
  }
}

void __52__ADAdTrackingSchedulingManager_handleAccountChange__block_invoke(uint64_t a1)
{
  id v2 = [NSString stringWithFormat:@"com.apple.adprivacyd [%@ handleAccountChange]", objc_opt_class()];
  takeXPCTransaction();
  dispatch_time_t v3 = [MEMORY[0x263F241D8] sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __52__ADAdTrackingSchedulingManager_handleAccountChange__block_invoke_2;
  v6[3] = &unk_264669E78;
  id v7 = v2;
  id v4 = v2;
  [v3 handleAccountChange:v6];

  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  handleAccountChange__handleAccountChangeDispatched = 0;
  objc_sync_exit(v5);
}

void __52__ADAdTrackingSchedulingManager_handleAccountChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v8 = v2;
  if (v2)
  {
    dispatch_time_t v3 = NSString;
    uint64_t v4 = [v2 code];
    id v5 = [v8 localizedDescription];
    uint64_t v6 = [v3 stringWithFormat:@"Error %ld while handling account change: %@", v4, v5];
    _ADLog();
  }
  else
  {
    id v7 = [MEMORY[0x263F087C8] defaultCenter];
    [v7 postNotificationName:@"com.apple.adplatforms.UserAccountChangeCompletedNotification" object:*MEMORY[0x263F24150]];

    id v5 = [NSString stringWithFormat:@"Successfully handled account change."];
    _ADLog();
  }

  releaseXPCTransaction();
}

- (void)registerForLockStateNotification
{
  if (notify_register_dispatch((const char *)*MEMORY[0x263F796A8], &_screenLockNotifyToken, MEMORY[0x263EF83A0], &__block_literal_global_263))
  {
    id v2 = [NSString stringWithFormat:@"Failed to register for springboard lock state events."];
    _ADLog();

    _screenLockNotifyToken = -1;
  }
  else
  {
    id v3 = [NSString stringWithFormat:@"Registered for springboard lock state events."];
    _ADLog();
  }
}

void __65__ADAdTrackingSchedulingManager_registerForLockStateNotification__block_invoke(int a1, int token)
{
  uint64_t state64 = 0;
  uint64_t state = notify_get_state(token, &state64);
  if (state)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to get state for _screenLockNotifyToken. Error code %d", state);
    _ADLog();
LABEL_3:

    return;
  }
  if (!state64)
  {
    notify_cancel(_screenLockNotifyToken);
    _screenLockNotifyToken = -1;
    id v3 = [MEMORY[0x263F61F08] sharedInstance];
    [v3 startListening];
    goto LABEL_3;
  }
}

- (NSObject)storeFrontNotifyToken
{
  return self->_storeFrontNotifyToken;
}

- (void)setStoreFrontNotifyToken:(id)a3
{
}

- (NSObject)accountChangedNotifyToken
{
  return self->_accountChangedNotifyToken;
}

- (void)setAccountChangedNotifyToken:(id)a3
{
}

- (void)setPushConnection:(id)a3
{
}

- (ADLoggingProfileMonitor)loggingProfileMonitor
{
  return self->_loggingProfileMonitor;
}

- (void)setLoggingProfileMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingProfileMonitor, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_accountChangedNotifyToken, 0);

  objc_storeStrong((id *)&self->_storeFrontNotifyToken, 0);
}

@end