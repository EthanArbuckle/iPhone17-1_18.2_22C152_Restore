@interface BRKRemindersSettingsHelper
- (BOOL)areRemindersAvailable;
- (BOOL)isCoreRoutineAvailable;
- (BOOL)isLocationAuthorizationValid;
- (BOOL)isLocationAvailable;
- (BOOL)isMeCardAvailable;
- (BRKRemindersSettingsDelegate)delegate;
- (BRKRemindersSettingsHelper)initWithDelegate:(id)a3 settings:(id)a4;
- (BRKSettings)brookSettings;
- (CLInUseAssertion)inUseAssertion;
- (CLLocationManager)locationManager;
- (CNContactStore)contactStore;
- (RTRoutineManager)routineManager;
- (id)_handwashingAppBundleLocationManager;
- (id)_handwashingLocationManager;
- (id)meContactWithKeysToFetch:(id)a3;
- (id)remindersFooterTextAndLinkString;
- (int64_t)contactStoreAuthorizationStatus;
- (void)_fetchLocationAuthorizationStatus;
- (void)_fetchLocationAvailableStatus;
- (void)_handwashingAppBundleLocationManager;
- (void)_handwashingLocationManager;
- (void)_isCoreRoutineHomeAvailableWithCompletion:(id)a3;
- (void)_updateWithLocationAuthorizationStatus:(int)a3 manager:(id)a4;
- (void)dealloc;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)requestLocationAuthorizationIfNeeded;
- (void)setBrookSettings:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactStoreAuthorizationStatus:(int64_t)a3;
- (void)setCoreRoutineAvailable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInUseAssertion:(id)a3;
- (void)setLocationAuthorizationValid:(BOOL)a3;
- (void)setLocationAvailable:(BOOL)a3;
- (void)setLocationManager:(id)a3;
- (void)setRoutineManager:(id)a3;
- (void)update;
@end

@implementation BRKRemindersSettingsHelper

- (id)_handwashingLocationManager
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/LocationBundles/HandwashingLocation.bundle"];
  id v4 = objc_alloc(MEMORY[0x263F00A60]);
  v5 = (void *)[v4 initWithEffectiveBundle:v3 delegate:self onQueue:MEMORY[0x263EF83A0]];
  v6 = BRKLoggingObjectForDomain(13);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    v12 = "-[BRKRemindersSettingsHelper _handwashingLocationManager]";
    _os_log_impl(&dword_2399EB000, v6, OS_LOG_TYPE_DEFAULT, "%s [[CLLocationManager alloc] initWithEffectiveBundle:bundle delegate:self onQueue:dispatch_get_main_queue()]", (uint8_t *)&v11, 0xCu);
  }

  if (v5)
  {
    v7 = (void *)[MEMORY[0x263F00A48] newAssertionForBundle:v3 withReason:@"Accepting Handwashing terms"];
    [(BRKRemindersSettingsHelper *)self setInUseAssertion:v7];

    id v8 = v5;
  }
  else
  {
    v9 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BRKRemindersSettingsHelper _handwashingLocationManager](v9);
    }

    [(BRKRemindersSettingsHelper *)self setLocationAvailable:0];
    [(BRKRemindersSettingsHelper *)self setLocationAuthorizationValid:0];
  }

  return v5;
}

void __56__BRKRemindersSettingsHelper_initWithDelegate_settings___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = BRKLoggingObjectForDomain(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "Selecting handwashing location manager with auth flow enabled result: %d", (uint8_t *)v10, 8u);
  }

  id v6 = objc_loadWeakRetained(v3);
  v7 = v6;
  if (a2) {
    [v6 _handwashingAppBundleLocationManager];
  }
  else {
  uint64_t v8 = [v6 _handwashingLocationManager];
  }
  v9 = (void *)WeakRetained[5];
  WeakRetained[5] = v8;
}

- (BRKRemindersSettingsHelper)initWithDelegate:(id)a3 settings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BRKRemindersSettingsHelper;
  uint64_t v8 = [(BRKRemindersSettingsHelper *)&v20 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_brookSettings, a4);
    uint64_t v10 = [MEMORY[0x263EFEA58] authorizationStatusForEntityType:0];
    v9->_contactStoreAuthorizationStatus = v10;
    if (v10 == 3)
    {
      uint64_t v11 = [MEMORY[0x263EFEA58] storeWithOptions:1];
      contactStore = v9->_contactStore;
      v9->_contactStore = (CNContactStore *)v11;
    }
    uint64_t v13 = [MEMORY[0x263F37F08] defaultManager];
    routineManager = v9->_routineManager;
    v9->_routineManager = (RTRoutineManager *)v13;

    objc_initWeak(&location, v9);
    brookSettings = v9->_brookSettings;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __56__BRKRemindersSettingsHelper_initWithDelegate_settings___block_invoke;
    v17[3] = &unk_264DB6700;
    objc_copyWeak(&v18, &location);
    [(BRKSettings *)brookSettings isLocationAuthFlowEnabledWithCompletionHandler:v17];
    v9->_locationAuthorizationValid = 1;
    *(_WORD *)&v9->_coreRoutineAvailable = 257;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)setInUseAssertion:(id)a3
{
}

- (void)dealloc
{
  inUseAssertion = self->_inUseAssertion;
  self->_inUseAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)BRKRemindersSettingsHelper;
  [(BRKRemindersSettingsHelper *)&v4 dealloc];
}

- (BOOL)areRemindersAvailable
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(BRKRemindersSettingsHelper *)self isLocationAvailable]) {
    BOOL v3 = [(BRKRemindersSettingsHelper *)self isLocationAuthorizationValid];
  }
  else {
    BOOL v3 = 0;
  }
  objc_super v4 = BRKLoggingObjectForDomain(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromBOOL();
    int v7 = 136315394;
    uint64_t v8 = "-[BRKRemindersSettingsHelper areRemindersAvailable]";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_2399EB000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v7, 0x16u);
  }
  return v3;
}

- (BOOL)isMeCardAvailable
{
  v12[1] = *MEMORY[0x263EF8340];
  v12[0] = *MEMORY[0x263EFDFE0];
  BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  objc_super v4 = [(BRKRemindersSettingsHelper *)self meContactWithKeysToFetch:v3];

  v5 = BRKLoggingObjectForDomain(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromBOOL();
    int v8 = 136315394;
    __int16 v9 = "-[BRKRemindersSettingsHelper isMeCardAvailable]";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
  }
  return v4 != 0;
}

- (void)setCoreRoutineAvailable:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_coreRoutineAvailable != a3)
  {
    self->_coreRoutineAvailable = a3;
    objc_super v4 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = NSStringFromBOOL();
      int v7 = 136315394;
      int v8 = "-[BRKRemindersSettingsHelper setCoreRoutineAvailable:]";
      __int16 v9 = 2112;
      __int16 v10 = v5;
      _os_log_impl(&dword_2399EB000, v4, OS_LOG_TYPE_DEFAULT, "%s -> %@", (uint8_t *)&v7, 0x16u);
    }
    id v6 = [(BRKRemindersSettingsHelper *)self delegate];
    [v6 remindersSettingsDidUpdate:self];
  }
}

- (void)setLocationAvailable:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_locationAvailable != a3)
  {
    self->_locationAvailable = a3;
    objc_super v4 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = NSStringFromBOOL();
      int v7 = 136315394;
      int v8 = "-[BRKRemindersSettingsHelper setLocationAvailable:]";
      __int16 v9 = 2112;
      __int16 v10 = v5;
      _os_log_impl(&dword_2399EB000, v4, OS_LOG_TYPE_DEFAULT, "%s -> %@", (uint8_t *)&v7, 0x16u);
    }
    id v6 = [(BRKRemindersSettingsHelper *)self delegate];
    [v6 remindersSettingsDidUpdate:self];
  }
}

- (void)setLocationAuthorizationValid:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_locationAuthorizationValid != a3)
  {
    self->_locationAuthorizationValid = a3;
    objc_super v4 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = NSStringFromBOOL();
      int v7 = 136315394;
      int v8 = "-[BRKRemindersSettingsHelper setLocationAuthorizationValid:]";
      __int16 v9 = 2112;
      __int16 v10 = v5;
      _os_log_impl(&dword_2399EB000, v4, OS_LOG_TYPE_DEFAULT, "%s -> %@", (uint8_t *)&v7, 0x16u);
    }
    id v6 = [(BRKRemindersSettingsHelper *)self delegate];
    [v6 remindersSettingsDidUpdate:self];
  }
}

- (void)requestLocationAuthorizationIfNeeded
{
  objc_initWeak(&location, self);
  brookSettings = self->_brookSettings;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__BRKRemindersSettingsHelper_requestLocationAuthorizationIfNeeded__block_invoke;
  v4[3] = &unk_264DB6700;
  objc_copyWeak(&v5, &location);
  [(BRKSettings *)brookSettings isLocationAuthFlowEnabledWithCompletionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__BRKRemindersSettingsHelper_requestLocationAuthorizationIfNeeded__block_invoke(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = BRKLoggingObjectForDomain(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"requestAlwaysAuthorization";
    if (a2) {
      id v5 = @"requestWhenInUseAuthorization";
    }
    int v9 = 136315394;
    __int16 v10 = "-[BRKRemindersSettingsHelper requestLocationAuthorizationIfNeeded]_block_invoke";
    __int16 v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_2399EB000, v4, OS_LOG_TYPE_DEFAULT, "%s: requesting %@ location authorization", (uint8_t *)&v9, 0x16u);
  }

  id v6 = (void *)WeakRetained[5];
  if (a2)
  {
    [v6 requestWhenInUseAuthorization];
    int v7 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      int v8 = "[strongSelf.locationManager requestWhenInUseAuthorization]";
LABEL_10:
      _os_log_impl(&dword_2399EB000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 2u);
    }
  }
  else
  {
    [v6 requestAlwaysAuthorization];
    int v7 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      int v8 = "[strongSelf.locationManager requestAlwaysAuthorization]";
      goto LABEL_10;
    }
  }
}

- (void)update
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = BRKLoggingObjectForDomain(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[BRKRemindersSettingsHelper update]";
    _os_log_impl(&dword_2399EB000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(BRKRemindersSettingsHelper *)self _fetchLocationAvailableStatus];
  [(BRKRemindersSettingsHelper *)self _fetchLocationAuthorizationStatus];
}

- (id)remindersFooterTextAndLinkString
{
  v14[2] = *MEMORY[0x263EF8340];
  BOOL v3 = +[BRKSettings remindersSettingFooter];
  if ([(BRKRemindersSettingsHelper *)self contactStoreAuthorizationStatus] != 3)
  {
    uint64_t v5 = +[BRKSettings remindersFooterExplanationContactStoreNotAuthorized];
    goto LABEL_10;
  }
  if (![(BRKRemindersSettingsHelper *)self isCoreRoutineAvailable])
  {
    uint64_t v5 = +[BRKSettings remindersFooterExplanationSignificantLocationsUnavailable];
LABEL_10:
    int v4 = (void *)v5;
    uint64_t v6 = 0;
    if (!v5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (![(BRKRemindersSettingsHelper *)self isMeCardAvailable]
    && ![(BRKRemindersSettingsHelper *)self isLocationAvailable])
  {
    uint64_t v11 = +[BRKSettings remindersFooterExplanationNoLocationOrMeCard];
    goto LABEL_20;
  }
  if (![(BRKRemindersSettingsHelper *)self isLocationAvailable])
  {
    uint64_t v11 = +[BRKSettings remindersFooterExplanationNoLocation];
LABEL_20:
    int v4 = (void *)v11;
    uint64_t v12 = +[BRKSettings remindersFooterLinkTitleContacts];
    goto LABEL_22;
  }
  if ([(BRKRemindersSettingsHelper *)self isLocationAuthorizationValid])
  {
    int v4 = 0;
    goto LABEL_14;
  }
  int v4 = +[BRKSettings remindersFooterExplanationInavlidLocationAuth];
  uint64_t v12 = +[BRKSettings remindersFooterLinkTitleLocation];
LABEL_22:
  uint64_t v6 = (void *)v12;
  if (v4)
  {
LABEL_11:
    int v7 = +[BRKSettings remindersFooterExplanationFormat];
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", v7, v3, v4);

    BOOL v3 = (void *)v8;
  }
LABEL_12:
  if (v6)
  {
    v14[0] = v3;
    v14[1] = v6;
    int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

    goto LABEL_15;
  }
LABEL_14:
  uint64_t v13 = v3;
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
LABEL_15:

  return v9;
}

- (id)meContactWithKeysToFetch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRKRemindersSettingsHelper *)self contactStore];
  uint64_t v6 = objc_msgSend(v5, "_ios_meContactWithKeysToFetch:error:", v4, 0);

  return v6;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = BRKLoggingObjectForDomain(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "authorizationStatus"));
    int v7 = 136315394;
    uint64_t v8 = "-[BRKRemindersSettingsHelper locationManagerDidChangeAuthorization:]";
    __int16 v9 = 2112;
    __int16 v10 = v6;
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v7, 0x16u);
  }
  -[BRKRemindersSettingsHelper _updateWithLocationAuthorizationStatus:manager:](self, "_updateWithLocationAuthorizationStatus:manager:", [v4 authorizationStatus], v4);
}

- (id)_handwashingAppBundleLocationManager
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F00A60]);
  id v4 = (void *)[v3 initWithEffectiveBundleIdentifier:@"com.apple.brook.BrookUI" delegate:self onQueue:MEMORY[0x263EF83A0]];
  uint64_t v5 = BRKLoggingObjectForDomain(13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[BRKRemindersSettingsHelper _handwashingAppBundleLocationManager]";
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%s [[CLLocationManager alloc] initWithEffectiveBundleIdentifier:BROOK_UI_APP_BUNDLE_IDENTIFIER delegate:self onQueue:dispatch_get_main_queue()]", (uint8_t *)&v10, 0xCu);
  }

  if (v4)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F00A48] newAssertionForBundleIdentifier:@"com.apple.brook.BrookUI" withReason:@"Accepting Handwashing terms"];
    [(BRKRemindersSettingsHelper *)self setInUseAssertion:v6];

    id v7 = v4;
  }
  else
  {
    uint64_t v8 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BRKRemindersSettingsHelper _handwashingAppBundleLocationManager](v8);
    }

    [(BRKRemindersSettingsHelper *)self setLocationAvailable:0];
    [(BRKRemindersSettingsHelper *)self setLocationAuthorizationValid:0];
  }

  return v4;
}

- (void)_fetchLocationAuthorizationStatus
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = BRKLoggingObjectForDomain(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[BRKRemindersSettingsHelper _fetchLocationAuthorizationStatus]";
    _os_log_impl(&dword_2399EB000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(BRKRemindersSettingsHelper *)self locationManager];
  uint64_t v5 = [v4 authorizationStatus];
  uint64_t v6 = [(BRKRemindersSettingsHelper *)self locationManager];
  [(BRKRemindersSettingsHelper *)self _updateWithLocationAuthorizationStatus:v5 manager:v6];
}

- (void)_fetchLocationAvailableStatus
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__BRKRemindersSettingsHelper__fetchLocationAvailableStatus__block_invoke;
  v3[3] = &unk_264DB6750;
  objc_copyWeak(&v4, &location);
  [(BRKRemindersSettingsHelper *)self _isCoreRoutineHomeAvailableWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __59__BRKRemindersSettingsHelper__fetchLocationAvailableStatus__block_invoke(uint64_t a1, char a2, char a3)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__BRKRemindersSettingsHelper__fetchLocationAvailableStatus__block_invoke_2;
  v5[3] = &unk_264DB6728;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  char v7 = a2;
  char v8 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v6);
}

void __59__BRKRemindersSettingsHelper__fetchLocationAvailableStatus__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setLocationAvailable:*(unsigned __int8 *)(a1 + 40)];
  [WeakRetained setCoreRoutineAvailable:*(unsigned __int8 *)(a1 + 41)];
}

- (void)_isCoreRoutineHomeAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRKRemindersSettingsHelper *)self routineManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__BRKRemindersSettingsHelper__isCoreRoutineHomeAvailableWithCompletion___block_invoke;
  v7[3] = &unk_264DB6778;
  id v8 = v4;
  id v6 = v4;
  +[BRKRoutineManager fetchLocationsOfInterestWithSingleRetryOfType:0 routineManager:v5 withHandler:v7];
}

void __72__BRKRemindersSettingsHelper__isCoreRoutineHomeAvailableWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 code];
    uint64_t v9 = BRKLoggingObjectForDomain(13);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v8 == 2)
    {
      if (v10) {
        __72__BRKRemindersSettingsHelper__isCoreRoutineHomeAvailableWithCompletion___block_invoke_cold_1();
      }
    }
    else if (v10)
    {
      __72__BRKRemindersSettingsHelper__isCoreRoutineHomeAvailableWithCompletion___block_invoke_cold_2();
    }
  }
  else
  {
    uint64_t v11 = [v5 count];
    uint64_t v9 = BRKLoggingObjectForDomain(13);
    BOOL v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v12)
      {
        int v13 = 136315138;
        v14 = "-[BRKRemindersSettingsHelper _isCoreRoutineHomeAvailableWithCompletion:]_block_invoke";
        _os_log_impl(&dword_2399EB000, v9, OS_LOG_TYPE_DEFAULT, "%s: found at least one location of interest for RTLocationOfInterestTypeHome", (uint8_t *)&v13, 0xCu);
      }
    }
    else if (v12)
    {
      int v13 = 136315138;
      v14 = "-[BRKRemindersSettingsHelper _isCoreRoutineHomeAvailableWithCompletion:]_block_invoke";
      _os_log_impl(&dword_2399EB000, v9, OS_LOG_TYPE_DEFAULT, "%s: no locations of interest for RTLocationOfInterestTypeHome", (uint8_t *)&v13, 0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateWithLocationAuthorizationStatus:(int)a3 manager:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__BRKRemindersSettingsHelper__updateWithLocationAuthorizationStatus_manager___block_invoke;
  v8[3] = &unk_264DB67A0;
  objc_copyWeak(&v10, &location);
  int v11 = a3;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __77__BRKRemindersSettingsHelper__updateWithLocationAuthorizationStatus_manager___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_14;
  }
  int v3 = *(_DWORD *)(a1 + 48);
  if (v3 == 3)
  {
    id v5 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) _limitsPrecision];
      id v6 = NSStringFromBOOL();
      int v11 = 136315394;
      BOOL v12 = "-[BRKRemindersSettingsHelper _updateWithLocationAuthorizationStatus:manager:]_block_invoke";
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%s: location auth is always, _limitsPrecision: %@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v7 = [*(id *)(a1 + 32) _limitsPrecision] ^ 1;
    uint64_t v8 = WeakRetained;
    goto LABEL_13;
  }
  if (v3)
  {
    id v9 = BRKLoggingObjectForDomain(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
      int v11 = 136315394;
      BOOL v12 = "-[BRKRemindersSettingsHelper _updateWithLocationAuthorizationStatus:manager:]_block_invoke";
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_2399EB000, v9, OS_LOG_TYPE_DEFAULT, "%s: location auth is NOT always (%@)", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v8 = WeakRetained;
    uint64_t v7 = 0;
LABEL_13:
    [v8 setLocationAuthorizationValid:v7];
    goto LABEL_14;
  }
  id v4 = BRKLoggingObjectForDomain(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    BOOL v12 = "-[BRKRemindersSettingsHelper _updateWithLocationAuthorizationStatus:manager:]_block_invoke";
    _os_log_impl(&dword_2399EB000, v4, OS_LOG_TYPE_DEFAULT, "%s: location auth is undetermined", (uint8_t *)&v11, 0xCu);
  }

LABEL_14:
}

- (BOOL)isCoreRoutineAvailable
{
  return self->_coreRoutineAvailable;
}

- (BOOL)isLocationAvailable
{
  return self->_locationAvailable;
}

- (BOOL)isLocationAuthorizationValid
{
  return self->_locationAuthorizationValid;
}

- (BRKRemindersSettingsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BRKRemindersSettingsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BRKSettings)brookSettings
{
  return self->_brookSettings;
}

- (void)setBrookSettings:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (CLInUseAssertion)inUseAssertion
{
  return self->_inUseAssertion;
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
}

- (int64_t)contactStoreAuthorizationStatus
{
  return self->_contactStoreAuthorizationStatus;
}

- (void)setContactStoreAuthorizationStatus:(int64_t)a3
{
  self->_contactStoreAuthorizationStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_brookSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_handwashingLocationManager
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[BRKRemindersSettingsHelper _handwashingLocationManager]";
  _os_log_error_impl(&dword_2399EB000, log, OS_LOG_TYPE_ERROR, "%s: failed to initialize location manager for Handwashing!", (uint8_t *)&v1, 0xCu);
}

- (void)_handwashingAppBundleLocationManager
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[BRKRemindersSettingsHelper _handwashingAppBundleLocationManager]";
  _os_log_error_impl(&dword_2399EB000, log, OS_LOG_TYPE_ERROR, "%s: failed to initialize location manager for Handwashing!", (uint8_t *)&v1, 0xCu);
}

void __72__BRKRemindersSettingsHelper__isCoreRoutineHomeAvailableWithCompletion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_2399EB000, v0, OS_LOG_TYPE_ERROR, "%s: CoreRoutine access denied, likely due to Significant Locations being disabled: %{public}@", (uint8_t *)v1, 0x16u);
}

void __72__BRKRemindersSettingsHelper__isCoreRoutineHomeAvailableWithCompletion___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_2399EB000, v0, OS_LOG_TYPE_ERROR, "%s: %{public}@", (uint8_t *)v1, 0x16u);
}

@end