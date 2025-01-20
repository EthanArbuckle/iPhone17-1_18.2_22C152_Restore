@interface ADAppTrackingService
+ (id)sharedInstance;
- (ADAppTrackingService)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)requestInFlight;
- (NSXPCListener)listener;
- (void)deviceRegionEnabledPerStorefront:(id)a3;
- (void)getAccountLevelSwitchDisabledReasonWithHandler:(id)a3;
- (void)iTunesAccountStorefront:(id)a3;
- (void)latestPersonalizedAdsConsentVersion:(id)a3;
- (void)localAdServicesEnabled:(id)a3;
- (void)reconcileDataForRecord:(id)a3;
- (void)sendPersonalizedAdsAndReconcileDataForRecord:(id)a3;
- (void)setListener:(id)a3;
- (void)setPersonalizedAds:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)setRequestInFlight:(BOOL)a3;
- (void)shouldAppStoreDisplayAdvertisingScreen:(id)a3;
- (void)shouldDisplayPersonalizedAdsUI:(id)a3;
@end

@implementation ADAppTrackingService

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ADAppTrackingService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_2 != -1) {
    dispatch_once(&sharedInstance__onceToken_2, block);
  }
  v2 = (void *)sharedInstance__instance_2;

  return v2;
}

uint64_t __38__ADAppTrackingService_sharedInstance__block_invoke()
{
  sharedInstance__instance_2 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

- (ADAppTrackingService)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADAppTrackingService;
  v2 = [(ADAppTrackingService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.ap.adprivacyd.opt-out"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  objc_super v6 = [v5 valueForEntitlement:@"com.apple.private.iad.opt-in-control"];
  char v7 = [v6 BOOLValue];

  if (v7)
  {
    [v5 setExportedObject:self];
    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D5A8358];
    [v5 setExportedInterface:v8];

    [v5 setInvalidationHandler:&__block_literal_global_5];
    [v5 setInterruptionHandler:&__block_literal_global_43];
    v9 = [NSString stringWithFormat:@"Accepted connection from ADTrackingTransparency client."];
    _ADLog();

    [v5 resume];
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Rejected ADTrackingTransparency connection client with PID %d lacking the appropriate entitlement (%@).", objc_msgSend(v5, "processIdentifier"), @"com.apple.private.iad.opt-in-control"];
    _ADLog();
  }
  return v7;
}

void __59__ADAppTrackingService_listener_shouldAcceptNewConnection___block_invoke()
{
  id v0 = [NSString stringWithFormat:@"XPC connection invalidated. Lost connection from ADTrackingTransparency client."];
  _ADLog();
}

void __59__ADAppTrackingService_listener_shouldAcceptNewConnection___block_invoke_2()
{
  id v0 = [NSString stringWithFormat:@"XPC connection interrupted. Lost connection from ADTrackingTransparency client."];
  _ADLog();
}

- (void)sendPersonalizedAdsAndReconcileDataForRecord:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__ADAppTrackingService_sendPersonalizedAdsAndReconcileDataForRecord___block_invoke;
  v6[3] = &unk_264669F88;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 sendPersonalizedAdsStatusToAdPlatforms:v6];
}

uint64_t __69__ADAppTrackingService_sendPersonalizedAdsAndReconcileDataForRecord___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [NSString stringWithFormat:@"There was an sending Personalized Ads to Ad Platforms. Error: %@. Please file a radar.", a2];
    _ADLog();
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 reconcileDataForRecord:v5];
}

- (void)reconcileDataForRecord:(id)a3
{
  objc_msgSend(MEMORY[0x263F241D8], "sharedInstance", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 deleteRecords:&__block_literal_global_56];
}

void __47__ADAppTrackingService_reconcileDataForRecord___block_invoke()
{
  id v2 = [MEMORY[0x263F241D8] sharedInstance];
  id v0 = [MEMORY[0x263F241C0] sharedInstance];
  v1 = [v0 iTunesAccountDSID];
  [v2 setDSID:v1 completionHandler:&__block_literal_global_59];
}

void __47__ADAppTrackingService_reconcileDataForRecord___block_invoke_2()
{
  id v0 = [MEMORY[0x263F241D8] sharedInstance];
  [v0 reconcile:&__block_literal_global_62];
}

void __47__ADAppTrackingService_reconcileDataForRecord___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = [NSString stringWithFormat:@"There was an error reconciling. Error: %@. Please file a radar.", a2];
    _ADLog();
  }
}

- (void)setPersonalizedAds:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  v13 = (void (**)(id, uint64_t))a4;
  if (v13)
  {
    objc_super v6 = [MEMORY[0x263F241C0] sharedInstance];
    int v7 = [v6 isPersonalizedAdsEnabled];
    [v6 setIsPersonalizedAdsEnabled:v4];
    v8 = [MEMORY[0x263F241D8] sharedInstance];
    v9 = [v8 activeDSIDRecord];
    if (![v9 personalizedAdsTimestamp])
    {
      v10 = [MEMORY[0x263EFF910] date];
      objc_msgSend(v9, "setPersonalizedAdsTimestamp:", objc_msgSend(v10, "AD_toServerTime"));
    }
    if (v7 != v4)
    {
      [v8 incrementMonthlyResetCount];
      if (v7)
      {
        v11 = [NSString stringWithFormat:@"Personalized Ads has been toggled. Device is going from OPTED IN to OPTED OUT."];
        _ADLog();

        [(ADAppTrackingService *)self sendPersonalizedAdsAndReconcileDataForRecord:v9];
        [MEMORY[0x263F61F10] removeAll];
      }
      else
      {
        v12 = [NSString stringWithFormat:@"Personalized Ads has been toggled. Device is going from OPTED OUT to OPTED IN."];
        _ADLog();

        [(ADAppTrackingService *)self reconcileDataForRecord:v9];
      }
    }
    v13[2](v13, 1);
  }
  else
  {
    objc_super v6 = [NSString stringWithFormat:@"[%@] ERROR: completion block not passed in", objc_opt_class()];
    _ADLog();
  }
}

- (void)getAccountLevelSwitchDisabledReasonWithHandler:(id)a3
{
  objc_super v6 = (void (**)(id, uint64_t))a3;
  id v3 = [MEMORY[0x263F241D8] sharedInstance];
  BOOL v4 = [v3 activeDSIDRecord];
  if ([v4 accountIsU13])
  {
    uint64_t v5 = 1;
  }
  else if ([v4 accountIsU18])
  {
    uint64_t v5 = 2;
  }
  else if ([v4 accountAgeUnknown])
  {
    uint64_t v5 = 5;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6[2](v6, v5);
}

- (void)shouldDisplayPersonalizedAdsUI:(id)a3
{
  v11 = (void (**)(id, void))a3;
  if (MGGetBoolAnswer()
    && ([MEMORY[0x263F241B8] sharedInstance],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 BOOLForKey:@"ForceNonAdLocale"],
        v3,
        v4))
  {
    uint64_t v5 = [NSString stringWithFormat:@"[%@]: Ad Enabled Locality is forced OFF by internal default.", objc_opt_class()];
    _ADLog();

    v11[2](v11, 0);
  }
  else
  {
    objc_super v6 = +[ADAdTrackingSchedulingManager sharedInstance];
    char v7 = [v6 isNewsOrStocksEnabledLocality];
    v8 = v11;
    if (v7)
    {
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v10 = [v6 isSearchAdsEnabled];
      v8 = v11;
      uint64_t v9 = v10;
    }
    v8[2](v8, v9);
  }
}

- (void)shouldAppStoreDisplayAdvertisingScreen:(id)a3
{
  char v7 = (void (**)(id, void))a3;
  if (MGGetBoolAnswer()
    && ([MEMORY[0x263F241B8] sharedInstance],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 BOOLForKey:@"ForceNonAdLocale"],
        v3,
        v4))
  {
    uint64_t v5 = [NSString stringWithFormat:@"[%@]: Ad Enabled Locality is forced OFF by internal default.", objc_opt_class()];
    _ADLog();

    v7[2](v7, 0);
  }
  else
  {
    objc_super v6 = +[ADAdTrackingSchedulingManager sharedInstance];
    v7[2](v7, [v6 isSearchAdsEnabled]);
  }
}

- (void)latestPersonalizedAdsConsentVersion:(id)a3
{
  id v3 = (void (**)(id, uint64_t))a3;
  id v4 = +[ADAdTrackingSchedulingManager sharedInstance];
  v3[2](v3, [v4 latestPersonalizedConsentVersion]);
}

- (void)iTunesAccountStorefront:(id)a3
{
  v8 = (void (**)(id, __CFString *))a3;
  id v3 = [MEMORY[0x263F241D8] sharedInstance];
  id v4 = [v3 activeDSIDRecord];
  char v5 = [v4 isPlaceholderAccount];

  if (v5)
  {
    objc_super v6 = @"NONE";
  }
  else
  {
    char v7 = [MEMORY[0x263F241C0] sharedInstance];
    objc_super v6 = [v7 iTunesStorefront];
  }
  if (v8) {
    v8[2](v8, v6);
  }
}

- (void)localAdServicesEnabled:(id)a3
{
  uint64_t v10 = (void (**)(id, void))a3;
  id v3 = [MEMORY[0x263F241D8] sharedInstance];
  id v4 = [v3 activeDSIDRecord];
  if ([v4 isPlaceholderAccount])
  {
    v10[2](v10, 0);
  }
  else
  {
    char v5 = [MEMORY[0x263F241C0] sharedInstance];
    char v6 = [v4 accountIsU13];
    char v7 = [v5 isManagedAppleID];
    int v8 = [v5 educationModeEnabled];
    if ((v6 & 1) != 0 || (v7 & 1) != 0 || v8)
    {
      v10[2](v10, 0);
    }
    else
    {
      uint64_t v9 = [v5 iTunesStorefront];
      v10[2](v10, [v9 containsString:@"143441"]);
    }
  }
}

- (void)deviceRegionEnabledPerStorefront:(id)a3
{
  char v6 = (void (**)(id, uint64_t))a3;
  id v3 = [MEMORY[0x263EFF960] currentLocale];
  id v4 = [v3 objectForKey:*MEMORY[0x263EFF4D0]];

  uint64_t v5 = [&unk_26D5A54D0 containsObject:v4];
  if (v6) {
    v6[2](v6, v5);
  }
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
}

- (BOOL)requestInFlight
{
  return self->_requestInFlight;
}

- (void)setRequestInFlight:(BOOL)a3
{
  self->_requestInFlight = a3;
}

- (void).cxx_destruct
{
}

@end