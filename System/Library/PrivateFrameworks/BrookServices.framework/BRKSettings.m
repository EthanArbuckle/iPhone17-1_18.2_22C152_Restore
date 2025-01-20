@interface BRKSettings
+ (id)_stringForConfigurationWithKey:(id)a3;
+ (id)remindersFooterExplanationContactStoreNotAuthorized;
+ (id)remindersFooterExplanationFormat;
+ (id)remindersFooterExplanationInavlidLocationAuth;
+ (id)remindersFooterExplanationNoLocation;
+ (id)remindersFooterExplanationNoLocationOrMeCard;
+ (id)remindersFooterExplanationSignificantLocationsUnavailable;
+ (id)remindersFooterLinkTitleContacts;
+ (id)remindersFooterLinkTitleLocation;
+ (id)remindersSettingFooter;
+ (id)remindersSettingTitle;
+ (id)settingsForActiveDevice;
+ (id)settingsForDevice:(id)a3;
+ (id)settingsTitle;
+ (id)timerSettingFooter;
+ (id)timerSettingTitle;
- (BOOL)_isManagedConfigurationImproveHandwashingEnabled;
- (BOOL)_isManagedConfigurationImproveHealthAndActivityEnabled;
- (BOOL)_isTinkerDataCollectionEnabled;
- (BOOL)areRemindersEnabled;
- (BOOL)isAvailable;
- (BOOL)isBrookTentpoleEnabled;
- (BOOL)isCachedLocationAuthFlowEnabled;
- (BOOL)isDataCollectionEnabled;
- (BOOL)isDataCollectionOnboardingComplete;
- (BOOL)isDataCollectionUploadDisabled;
- (BOOL)isEnabled;
- (BOOL)isOnboardingComplete;
- (BOOL)isStealthUIEnabled;
- (BOOL)locationManagerAuthorizationStatusHasChangedOnce;
- (CLLocationManager)locationManager;
- (NSDate)lastDataCollectionUploadDate;
- (OS_dispatch_queue)locationManagerQueue;
- (double)brookCoolDownInterval;
- (id)_initWithDevice:(id)a3;
- (id)_valueForKey:(id)a3;
- (id)tinkerDataCollectionCredentials;
- (int)locationManagerLastAuthorizationStatus;
- (unint64_t)overrideDataCollectionAuthorization;
- (void)_BRKCancelForBRKSettingsChange;
- (void)_BRKRegisterForBRKSettingsChange;
- (void)_handleNPSNotification;
- (void)_observeDefaultChanges:(BOOL)a3;
- (void)_setValue:(id)a3 forKey:(id)a4;
- (void)_setupLocationManager;
- (void)dealloc;
- (void)isLocationAuthFlowEnabledWithCompletionHandler:(id)a3;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setBrookCoolDownInterval:(double)a3;
- (void)setDataCollectionEnabled:(BOOL)a3;
- (void)setDataCollectionUploadDisabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHealthAndActivityEnabled:(BOOL)a3;
- (void)setLastDataCollectionUploadDate:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationManagerAuthorizationStatusHasChangedOnce:(BOOL)a3;
- (void)setLocationManagerLastAuthorizationStatus:(int)a3;
- (void)setLocationManagerQueue:(id)a3;
- (void)setOnboardingComplete:(BOOL)a3;
- (void)setOverrideDataCollectionAuthorization:(unint64_t)a3;
- (void)setRemindersEnabled:(BOOL)a3;
@end

@implementation BRKSettings

- (BOOL)_isManagedConfigurationImproveHandwashingEnabled
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F538F0]] == 1;

  return v3;
}

+ (id)settingsForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[BRKSettings alloc] _initWithDevice:v3];

  return v4;
}

- (void)_BRKRegisterForBRKSettingsChange
{
  objc_initWeak(&location, self);
  id v3 = MEMORY[0x263EF83A0];
  id v4 = MEMORY[0x263EF83A0];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__BRKSettings__BRKRegisterForBRKSettingsChange__block_invoke;
  v5[3] = &unk_264DB6838;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch("com.apple.brook.BRKSettingsDidChangeNotification", &self->_notifyToken, v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

+ (id)settingsForActiveDevice
{
  id v3 = [MEMORY[0x263F57730] sharedInstance];
  id v4 = [v3 getActivePairedDevice];
  v5 = [a1 settingsForDevice:v4];

  return v5;
}

- (void)_setupLocationManager
{
  id v3 = objc_initWeak(&location, self);
  id v4 = [(BRKSettings *)self locationManagerQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__BRKSettings__setupLocationManager__block_invoke;
  v5[3] = &unk_264DB6810;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __36__BRKSettings__setupLocationManager__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x263F00A60]);
    id v3 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/LocationBundles/HandwashingLocation.bundle"];
    id v4 = [WeakRetained locationManagerQueue];
    v5 = (void *)[v2 initWithEffectiveBundle:v3 delegate:WeakRetained onQueue:v4];
    [WeakRetained setLocationManager:v5];
  }
  else
  {
    id v6 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __36__BRKSettings__setupLocationManager__block_invoke_cold_2(v6);
    }
  }
  v7 = [WeakRetained locationManager];

  v8 = BRKLoggingObjectForDomain(13);
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      v11 = "-[BRKSettings _setupLocationManager]_block_invoke";
      _os_log_impl(&dword_2399EB000, v9, OS_LOG_TYPE_INFO, "%s: successfully initialized location manager for Handwashing settings!", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __36__BRKSettings__setupLocationManager__block_invoke_cold_1(v9);
  }
}

- (void)isLocationAuthFlowEnabledWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _os_feature_enabled_impl();
  if ((v5 & 1) == 0)
  {
    id v6 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[BRKSettings isLocationAuthFlowEnabledWithCompletionHandler:]";
      _os_log_impl(&dword_2399EB000, v6, OS_LOG_TYPE_DEFAULT, "%s return NO os_feature_enabled(Brook, brook_new_location_auth) == NO", buf, 0xCu);
    }
  }
  device = self->_device;
  v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"E90AC0F3-E83B-42C8-8EDB-D6C6BCF08D65"];
  LOBYTE(device) = [(NRDevice *)device supportsCapability:v8];

  if ((device & 1) == 0)
  {
    v9 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[BRKSettings isLocationAuthFlowEnabledWithCompletionHandler:]";
      _os_log_impl(&dword_2399EB000, v9, OS_LOG_TYPE_DEFAULT, "%s return NO [_device supportsCapability:NRDEVICECAPABILITY_BROOK_NEW_LOCATION_AUTH] == NO", buf, 0xCu);
    }

    uint64_t v5 = 0;
  }
  if (self->_locationManagerAuthorizationStatusHasChangedOnce)
  {
    id v10 = objc_initWeak((id *)buf, self);
    v11 = [(BRKSettings *)self locationManagerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__BRKSettings_isLocationAuthFlowEnabledWithCompletionHandler___block_invoke;
    block[3] = &unk_264DB6860;
    objc_copyWeak(&v16, (id *)buf);
    char v17 = v5;
    id v15 = v4;
    dispatch_async(v11, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (self->_locationManagerLastAuthorizationStatus) {
      char v12 = v5;
    }
    else {
      char v12 = 1;
    }
    if ((v12 & 1) == 0)
    {
      v13 = BRKLoggingObjectForDomain(13);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[BRKSettings isLocationAuthFlowEnabledWithCompletionHandler:]";
        _os_log_impl(&dword_2399EB000, v13, OS_LOG_TYPE_DEFAULT, "%s return NO [_locationManager(legacy) authorizationStatus] != kCLAuthorizationStatusNotDetermined", buf, 0xCu);
      }

      uint64_t v5 = 0;
    }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, v5);
  }
}

- (id)_initWithDevice:(id)a3
{
  v23[7] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BRKSettings;
  id v6 = [(BRKSettings *)&v22 init];
  if (v6)
  {
    v7 = (void *)MEMORY[0x263EFFA08];
    v23[0] = @"BrookEnabled";
    v23[1] = @"BrookRemindersEnabled";
    v23[2] = @"BrookOnboardingComplete";
    v23[3] = @"BrookCoolDownInterval";
    v23[4] = @"BrookLastDataCollectionUploadDate";
    v23[5] = @"BrookOverrideDataCollectionAuthorization";
    v23[6] = @"BrookDataCollectionUploadDisabled";
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:7];
    uint64_t v9 = [v7 setWithArray:v8];
    observedKeys = v6->_observedKeys;
    v6->_observedKeys = (NSSet *)v9;

    v6->_notifyToken = -1;
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v11 = objc_opt_new();
    npsManager = v6->_npsManager;
    v6->_npsManager = (NPSManager *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.brook" pairedDevice:v5];
    domainAccessor = v6->_domainAccessor;
    v6->_domainAccessor = (NPSDomainAccessor *)v13;

    id v15 = (id)[(NPSDomainAccessor *)v6->_domainAccessor synchronize];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_BRKHandleNPSNotification, @"com.apple.brook.NPSSettingsDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    char v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v6 selector:sel__handleNPSNotification name:*MEMORY[0x263F57688] object:0];

    [(BRKSettings *)v6 _BRKRegisterForBRKSettingsChange];
    v18 = [MEMORY[0x263F53C50] sharedConnection];
    [v18 addObserver:v6];

    v6->_currentIsManagedConfigurationImproveHandwashingEnabled = [(BRKSettings *)v6 _isManagedConfigurationImproveHandwashingEnabled];
    [(BRKSettings *)v6 _observeDefaultChanges:1];
    v6->_locationManagerLastAuthorizationStatus = -1;
    v6->_locationManagerAuthorizationStatusHasChangedOnce = 0;
    uint64_t v19 = BRKCreateDispatchQueue("com.brook.settings.locationmanager", QOS_CLASS_UTILITY);
    locationManagerQueue = v6->_locationManagerQueue;
    v6->_locationManagerQueue = (OS_dispatch_queue *)v19;

    [(BRKSettings *)v6 _setupLocationManager];
  }

  return v6;
}

- (void)setLocationManager:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (OS_dispatch_queue)locationManagerQueue
{
  return self->_locationManagerQueue;
}

- (void)_observeDefaultChanges:(BOOL)a3
{
  if (self->_shouldObserveDefaultChanges != a3) {
    self->_shouldObserveDefaultChanges = a3;
  }
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.brook.NPSSettingsDidChangeNotification", 0);
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  id v5 = [MEMORY[0x263F53C50] sharedConnection];
  [v5 removeObserver:self];

  [(BRKSettings *)self _observeDefaultChanges:0];
  [(BRKSettings *)self _BRKCancelForBRKSettingsChange];
  v6.receiver = self;
  v6.super_class = (Class)BRKSettings;
  [(BRKSettings *)&v6 dealloc];
}

void __47__BRKSettings__BRKRegisterForBRKSettingsChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleNPSNotification];
}

- (void)_BRKCancelForBRKSettingsChange
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1) {
    notify_cancel(notifyToken);
  }
}

- (BOOL)isAvailable
{
  device = self->_device;
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"0C599FD8-CC9F-48C9-BC37-C764A8B0527C"];
  LOBYTE(device) = [(NRDevice *)device supportsCapability:v3];

  return (char)device;
}

- (BOOL)isBrookTentpoleEnabled
{
  return _os_feature_enabled_impl();
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = BRKLoggingObjectForDomain(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = @"NO";
    if (v3) {
      objc_super v6 = @"YES";
    }
    int v8 = 136315394;
    uint64_t v9 = "-[BRKSettings setEnabled:]";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = [NSNumber numberWithBool:v3];
  [(BRKSettings *)self _setValue:v7 forKey:@"BrookEnabled"];
}

- (BOOL)isEnabled
{
  id v2 = [(BRKSettings *)self _valueForKey:@"BrookEnabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setRemindersEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = BRKLoggingObjectForDomain(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = @"NO";
    if (v3) {
      objc_super v6 = @"YES";
    }
    int v8 = 136315394;
    uint64_t v9 = "-[BRKSettings setRemindersEnabled:]";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = [NSNumber numberWithBool:v3];
  [(BRKSettings *)self _setValue:v7 forKey:@"BrookRemindersEnabled"];
}

- (BOOL)areRemindersEnabled
{
  id v2 = [(BRKSettings *)self _valueForKey:@"BrookRemindersEnabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDataCollectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = BRKLoggingObjectForDomain(14);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"NO";
    if (v3) {
      id v5 = @"YES";
    }
    int v7 = 136315394;
    int v8 = "-[BRKSettings setDataCollectionEnabled:]";
    __int16 v9 = 2112;
    __int16 v10 = v5;
    _os_log_impl(&dword_2399EB000, v4, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  objc_super v6 = [MEMORY[0x263F53C50] sharedConnection];
  [v6 setBoolValue:v3 forSetting:*MEMORY[0x263F538F0]];
}

- (BOOL)isDataCollectionEnabled
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (BRKActiveDeviceIsAltAccount()) {
    BOOL v3 = [(BRKSettings *)self _isTinkerDataCollectionEnabled];
  }
  else {
    BOOL v3 = [(BRKSettings *)self _isManagedConfigurationImproveHandwashingEnabled];
  }
  BOOL v4 = v3;
  id v5 = BRKLoggingObjectForDomain(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = @"NO";
    if (v4) {
      objc_super v6 = @"YES";
    }
    int v8 = 136315394;
    __int16 v9 = "-[BRKSettings isDataCollectionEnabled]";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

- (BOOL)isDataCollectionOnboardingComplete
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F538F0]] != 0;

  return v3;
}

- (void)setOnboardingComplete:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BRKSettings *)self _setValue:v4 forKey:@"BrookOnboardingComplete"];
}

- (BOOL)isOnboardingComplete
{
  id v2 = [(BRKSettings *)self _valueForKey:@"BrookOnboardingComplete"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isStealthUIEnabled
{
  return 0;
}

void __62__BRKSettings_isLocationAuthFlowEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained locationManagerAuthorizationStatusHasChangedOnce])
  {
    char v3 = [WeakRetained locationManager];
    objc_msgSend(WeakRetained, "setLocationManagerLastAuthorizationStatus:", objc_msgSend(v3, "authorizationStatus"));
  }
  int v4 = *(unsigned __int8 *)(a1 + 48);
  if ([WeakRetained locationManagerLastAuthorizationStatus] && !*(unsigned char *)(a1 + 48))
  {
    id v5 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      int v7 = "-[BRKSettings isLocationAuthFlowEnabledWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%s return NO [_locationManager(legacy) authorizationStatus] != kCLAuthorizationStatusNotDetermined", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (!v4) {
      goto LABEL_13;
    }
    id v5 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      int v7 = "-[BRKSettings isLocationAuthFlowEnabledWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%s return YES", (uint8_t *)&v6, 0xCu);
    }
  }

LABEL_13:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isCachedLocationAuthFlowEnabled
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v3 = BRKLoggingObjectForDomain(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_2399EB000, v3, OS_LOG_TYPE_DEFAULT, "Checking if location auth flow is enabled!", (uint8_t *)&v12, 2u);
  }

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    int v7 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[BRKSettings isCachedLocationAuthFlowEnabled]";
      __int16 v9 = "%s return NO os_feature_enabled(Brook, brook_new_location_auth) == NO";
      goto LABEL_12;
    }
LABEL_13:
    BOOL v10 = 0;
    goto LABEL_14;
  }
  device = self->_device;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"E90AC0F3-E83B-42C8-8EDB-D6C6BCF08D65"];
  LOBYTE(device) = [(NRDevice *)device supportsCapability:v5];

  if ((device & 1) == 0)
  {
    int v7 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[BRKSettings isCachedLocationAuthFlowEnabled]";
      __int16 v9 = "%s return NO [_device supportsCapability:NRDEVICECAPABILITY_BROOK_NEW_LOCATION_AUTH] == NO";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  int locationManagerLastAuthorizationStatus = self->_locationManagerLastAuthorizationStatus;
  int v7 = BRKLoggingObjectForDomain(13);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (locationManagerLastAuthorizationStatus)
  {
    if (v8)
    {
      int v12 = 136315138;
      uint64_t v13 = "-[BRKSettings isCachedLocationAuthFlowEnabled]";
      __int16 v9 = "%s return NO [_locationManager(legacy) authorizationStatus] != kCLAuthorizationStatusNotDetermined";
LABEL_12:
      _os_log_impl(&dword_2399EB000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0xCu);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (v8)
  {
    int v12 = 136315138;
    uint64_t v13 = "-[BRKSettings isCachedLocationAuthFlowEnabled]";
    _os_log_impl(&dword_2399EB000, v7, OS_LOG_TYPE_DEFAULT, "%s return YES", (uint8_t *)&v12, 0xCu);
  }
  BOOL v10 = 1;
LABEL_14:

  return v10;
}

- (void)setBrookCoolDownInterval:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(BRKSettings *)self _setValue:v4 forKey:@"BrookCoolDownInterval"];
}

- (double)brookCoolDownInterval
{
  id v2 = [(BRKSettings *)self _valueForKey:@"BrookCoolDownInterval"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (NSDate)lastDataCollectionUploadDate
{
  return (NSDate *)[(BRKSettings *)self _valueForKey:@"BrookLastDataCollectionUploadDate"];
}

- (void)setLastDataCollectionUploadDate:(id)a3
{
}

- (unint64_t)overrideDataCollectionAuthorization
{
  id v2 = [(BRKSettings *)self _valueForKey:@"BrookOverrideDataCollectionAuthorization"];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setOverrideDataCollectionAuthorization:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(BRKSettings *)self _setValue:v4 forKey:@"BrookOverrideDataCollectionAuthorization"];
}

- (BOOL)isDataCollectionUploadDisabled
{
  id v2 = [(BRKSettings *)self _valueForKey:@"BrookDataCollectionUploadDisabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDataCollectionUploadDisabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BRKSettings *)self _setValue:v4 forKey:@"BrookDataCollectionUploadDisabled"];
}

- (id)tinkerDataCollectionCredentials
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.brook.credentials"];
  char v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (BOOL)_isTinkerDataCollectionEnabled
{
  id v2 = [(BRKSettings *)self tinkerDataCollectionCredentials];
  char v3 = [v2 objectForKeyedSubscript:@"urlString"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_isManagedConfigurationImproveHealthAndActivityEnabled
{
  id v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53900]] == 1;

  return v3;
}

- (void)_setValue:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(BRKSettings *)self _valueForKey:v6];
    if (v7 != v12 && ([v7 isEqual:v12] & 1) == 0)
    {
      [(BRKSettings *)self _observeDefaultChanges:0];
      [(NPSDomainAccessor *)self->_domainAccessor setObject:v12 forKey:v6];
      id v8 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
      npsManager = self->_npsManager;
      BOOL v10 = [MEMORY[0x263EFFA08] setWithObject:v6];
      [(NPSManager *)npsManager synchronizeNanoDomain:@"com.apple.brook" keys:v10];

      if ([(NSSet *)self->_observedKeys containsObject:v6]) {
        notify_post("com.apple.brook.BRKSettingsDidChangeNotification");
      }
      [(BRKSettings *)self _observeDefaultChanges:1];
      uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 postNotificationName:@"BRKSettingsDidUpdateNotification" object:self];
    }
  }
}

- (id)_valueForKey:(id)a3
{
  if (a3)
  {
    BOOL v4 = -[NPSDomainAccessor objectForKey:](self->_domainAccessor, "objectForKey:");
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(NSSet *)self->_observedKeys containsObject:v10])
  {
    uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 postNotificationName:@"BRKSettingsDidUpdateNotification" object:self];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BRKSettings;
    [(BRKSettings *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_handleNPSNotification
{
  id v2 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"BRKSettingsDidUpdateNotification" object:0];
}

+ (id)settingsTitle
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SETTINGS_TITLE" value:&stru_26ED23B60 table:0];

  return v3;
}

+ (id)timerSettingTitle
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SETTINGS_ENABLE_TIMER" value:&stru_26ED23B60 table:0];

  return v3;
}

+ (id)timerSettingFooter
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SETTINGS_ENABLE_TIMER_DESCRIPTION" value:&stru_26ED23B60 table:0];

  return v3;
}

+ (id)remindersSettingTitle
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SETTINGS_ENABLE_REMINDERS" value:&stru_26ED23B60 table:0];

  return v3;
}

+ (id)remindersSettingFooter
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SETTINGS_REMINDER_FOOTER" value:&stru_26ED23B60 table:0];

  return v3;
}

+ (id)remindersFooterExplanationFormat
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SETTINGS_REMINDER_EXPLANATION_FORMAT" value:&stru_26ED23B60 table:0];

  return v3;
}

+ (id)remindersFooterExplanationNoLocationOrMeCard
{
  return (id)[a1 _stringForConfigurationWithKey:@"SETTINGS_REMINDER_EXPLANATION_LOC_UNAVAIL_NO_ME_CARD"];
}

+ (id)remindersFooterExplanationNoLocation
{
  return (id)[a1 _stringForConfigurationWithKey:@"SETTINGS_REMINDER_EXPLANATION_LOC_UNAVAIL_ME_CARD"];
}

+ (id)remindersFooterExplanationInavlidLocationAuth
{
  return (id)[a1 _stringForConfigurationWithKey:@"SETTINGS_REMINDER_EXPLANATION_LOC_AUTH_INVALID"];
}

+ (id)remindersFooterExplanationSignificantLocationsUnavailable
{
  return (id)[a1 _stringForConfigurationWithKey:@"SETTINGS_REMINDER_EXPLANATION_LOC_SIGNIFICANT_LOCATIONS"];
}

+ (id)remindersFooterLinkTitleLocation
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SETTINGS_REMINDER_LOCATION_LINK_TITLE" value:&stru_26ED23B60 table:0];

  return v3;
}

+ (id)remindersFooterLinkTitleContacts
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SETTINGS_REMINDER_CONTACTS_LINK_TITLE" value:&stru_26ED23B60 table:0];

  return v3;
}

+ (id)remindersFooterExplanationContactStoreNotAuthorized
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SETTINGS_REMINDER_EXPLANATION_CONTACT_STORE_NOT_AUTHORIZED" value:&stru_26ED23B60 table:0];

  return v3;
}

+ (id)_stringForConfigurationWithKey:(id)a3
{
  id v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:v4 value:&stru_26ED23B60 table:0];

  return v6;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  BOOL v5 = [(BRKSettings *)self _isManagedConfigurationImproveHandwashingEnabled];
  if (self->_currentIsManagedConfigurationImproveHandwashingEnabled != v5)
  {
    self->_currentIsManagedConfigurationImproveHandwashingEnabled = v5;
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"BRKSettingsDidUpdateNotification" object:0];
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  BOOL v5 = BRKLoggingObjectForDomain(14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "Location manager has changed authorization status", (uint8_t *)buf, 2u);
  }

  self->_locationManagerAuthorizationStatusHasChangedOnce = 1;
  id v6 = objc_initWeak(buf, self);
  id v7 = [(BRKSettings *)self locationManagerQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__BRKSettings_locationManagerDidChangeAuthorization___block_invoke;
  v9[3] = &unk_264DB6888;
  objc_copyWeak(&v11, buf);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

void __53__BRKSettings_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setLocationManagerLastAuthorizationStatus:", objc_msgSend(*(id *)(a1 + 32), "authorizationStatus"));
}

- (void)setLocationManagerQueue:(id)a3
{
}

- (BOOL)locationManagerAuthorizationStatusHasChangedOnce
{
  return self->_locationManagerAuthorizationStatusHasChangedOnce;
}

- (void)setLocationManagerAuthorizationStatusHasChangedOnce:(BOOL)a3
{
  self->_locationManagerAuthorizationStatusHasChangedOnce = a3;
}

- (int)locationManagerLastAuthorizationStatus
{
  return self->_locationManagerLastAuthorizationStatus;
}

- (void)setLocationManagerLastAuthorizationStatus:(int)a3
{
  self->_int locationManagerLastAuthorizationStatus = a3;
}

- (void)setHealthAndActivityEnabled:(BOOL)a3
{
  self->_healthAndActivityEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManagerQueue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_dataCollectionKeys, 0);
  objc_storeStrong((id *)&self->_observedKeys, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
}

void __36__BRKSettings__setupLocationManager__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[BRKSettings _setupLocationManager]_block_invoke";
  _os_log_error_impl(&dword_2399EB000, log, OS_LOG_TYPE_ERROR, "%s: failed to initialize location manager for Handwashing settings!", (uint8_t *)&v1, 0xCu);
}

void __36__BRKSettings__setupLocationManager__block_invoke_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[BRKSettings _setupLocationManager]_block_invoke";
  _os_log_error_impl(&dword_2399EB000, log, OS_LOG_TYPE_ERROR, "%s: cannot initialize location manager for Handwashing settings, BRKSettings reference is nil!", (uint8_t *)&v1, 0xCu);
}

@end