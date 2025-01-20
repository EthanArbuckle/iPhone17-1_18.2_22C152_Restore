@interface GMSpecifierProvider
- (BOOL)fetchGMCapability;
- (GMSpecifierProvider)initWithPresenter:(id)a3;
- (GMSpecifierProvider)initWithPresenter:(id)a3 eligibilityProvider:(id)a4;
- (id)_configuredGMSpecifier;
- (id)_downloadingSpecifier;
- (id)_inWaitlistSpecifierWithEnablement:(BOOL)a3;
- (id)_joinWaitlistSpecifierWithEnablement:(BOOL)a3;
- (id)_rampedPreparingSpecifier;
- (id)_rampedSpecifier;
- (id)_rampedSpecifierWithButton:(BOOL)a3;
- (id)_rampedSpecifierWithEnablement:(BOOL)a3;
- (id)fetchGMRampSpecifierWith:(id)a3;
- (id)gmUserOptInStatus:(id)a3;
- (id)valueForGMPreparingSpecifier:(id)a3;
- (id)valueForGMRampSpecifier:(id)a3;
- (int64_t)status;
- (void)GMJoinWaitlistTapped:(id)a3;
- (void)_setGMUserOptInStatus:(BOOL)a3;
- (void)clearCFU;
- (void)dismissGMIntroViewController;
- (void)fetchGMRampStatus;
- (void)presentToggleOffAlert;
- (void)reloadADMSpecifier;
- (void)reloadGMSpecifier;
- (void)setGMUserOptInStatus:(id)a3;
- (void)showNetworkUnavailableAlert;
- (void)siriGMIntroViewControllerContinuePressed:(id)a3;
- (void)siriGMIntroViewControllerNotNowPressed:(id)a3;
- (void)siriGMIntroViewControllerPresented:(id)a3 withEnrollmentType:(unint64_t)a4;
- (void)turnOnGmTapped:(id)a3;
- (void)updateADMState;
- (void)updateWithContext:(int64_t)a3;
@end

@implementation GMSpecifierProvider

- (GMSpecifierProvider)initWithPresenter:(id)a3
{
  id v4 = a3;
  v5 = +[GMEligibilityProvider shared];
  v6 = [(GMSpecifierProvider *)self initWithPresenter:v4 eligibilityProvider:v5];

  return v6;
}

- (GMSpecifierProvider)initWithPresenter:(id)a3 eligibilityProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GMSpecifierProvider;
  v8 = [(GMSpecifierProvider *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    v9->_requestState = 0;
    objc_storeStrong((id *)&v9->_gmEligibilityProvider, a4);
    uint64_t v10 = [(GMEligibilityProviderProtocol *)v9->_gmEligibilityProvider gmSpecifierController];
    gmSpecifierController = v9->_gmSpecifierController;
    v9->_gmSpecifierController = (_TtP24AssistantSettingsSupport29GMSpecifierControllerProcotol_ *)v10;

    v9->_gmEligibilityContext = 0;
    v12 = objc_alloc_init(GMAnalyticsProvider);
    gmAnalyticsProvider = v9->_gmAnalyticsProvider;
    v9->_gmAnalyticsProvider = v12;
  }
  return v9;
}

- (id)_configuredGMSpecifier
{
  v3 = 0;
  uint64_t v15 = *MEMORY[0x263EF8340];
  switch(self->_gmEligibilityContext)
  {
    case 3:
    case 0xBLL:
    case 0x16:
      uint64_t v4 = 1;
      goto LABEL_9;
    case 4:
    case 0xALL:
    case 0x17:
      uint64_t v5 = 1;
      goto LABEL_7;
    case 5:
    case 0xCLL:
      uint64_t v6 = [(GMSpecifierProvider *)self _rampedSpecifier];
      goto LABEL_10;
    case 7:
      uint64_t v5 = 0;
LABEL_7:
      uint64_t v6 = [(GMSpecifierProvider *)self _inWaitlistSpecifierWithEnablement:v5];
      goto LABEL_10;
    case 8:
      uint64_t v4 = 0;
LABEL_9:
      uint64_t v6 = [(GMSpecifierProvider *)self _joinWaitlistSpecifierWithEnablement:v4];
      goto LABEL_10;
    case 9:
      uint64_t v6 = [(GMSpecifierProvider *)self _rampedSpecifierWithEnablement:0];
      goto LABEL_10;
    case 0x15:
    case 0x18:
      uint64_t v6 = [(GMSpecifierProvider *)self _downloadingSpecifier];
LABEL_10:
      v3 = (void *)v6;
      break;
    default:
      break;
  }
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    gmEligibilityProvider = self->_gmEligibilityProvider;
    v9 = v7;
    int v11 = 136315394;
    v12 = "-[GMSpecifierProvider _configuredGMSpecifier]";
    __int16 v13 = 2048;
    uint64_t v14 = [(GMEligibilityProviderProtocol *)gmEligibilityProvider eligibility];
    _os_log_impl(&dword_220C23000, v9, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment Enrollment returning specifier for context %ld", (uint8_t *)&v11, 0x16u);
  }

  return v3;
}

- (id)_rampedSpecifier
{
  if (([(GMSpecifierControllerProcotol *)self->_gmSpecifierController hasEngagedCFU] & 1) != 0
    || [(GMSpecifierControllerProcotol *)self->_gmSpecifierController featureOptInStatus])
  {
    v3 = [(GMSpecifierProvider *)self _rampedSpecifierWithEnablement:1];
  }
  else
  {
    v3 = [(GMSpecifierProvider *)self _rampedSpecifierWithButton:1];
  }

  return v3;
}

- (id)_downloadingSpecifier
{
  if ([(GMSpecifierControllerProcotol *)self->_gmSpecifierController hasEngagedCFU]) {
    [(GMSpecifierProvider *)self _rampedSpecifierWithEnablement:1];
  }
  else {
  v3 = [(GMSpecifierProvider *)self _rampedPreparingSpecifier];
  }

  return v3;
}

- (id)_joinWaitlistSpecifierWithEnablement:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D2AB140 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  uint64_t v5 = +[AssistantController bundle];
  uint64_t v6 = [v5 localizedStringForKey:@"GM_WAITLIST_SPECIFIER_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
  [v4 setName:v6];

  [v4 setProperty:@"GM_RAMP_SPECIFIER" forKey:*MEMORY[0x263F60138]];
  [v4 setButtonAction:sel_GMJoinWaitlistTapped_];
  id v7 = [NSNumber numberWithBool:v3];
  [v4 setProperty:v7 forKey:*MEMORY[0x263F600A8]];

  [v4 setCellType:13];

  return v4;
}

- (id)_inWaitlistSpecifierWithEnablement:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D2AB140 target:self set:0 get:sel_valueForGMRampSpecifier_ detail:0 cell:-1 edit:0];
  uint64_t v5 = +[AssistantController bundle];
  uint64_t v6 = [v5 localizedStringForKey:@"GM_RAMP_SPECIFIER_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
  [v4 setName:v6];

  [v4 setProperty:@"GM_RAMP_SPECIFIER" forKey:*MEMORY[0x263F60138]];
  id v7 = [NSNumber numberWithBool:v3];
  [v4 setProperty:v7 forKey:*MEMORY[0x263F600A8]];

  [v4 setCellType:-1];

  return v4;
}

- (id)_rampedPreparingSpecifier
{
  v2 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D2AB140 target:self set:0 get:sel_valueForGMPreparingSpecifier_ detail:0 cell:-1 edit:0];
  BOOL v3 = +[AssistantController bundle];
  uint64_t v4 = [v3 localizedStringForKey:@"GM_RAMP_SPECIFIER_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
  [v2 setName:v4];

  [v2 setProperty:@"GM_RAMP_PREPARING_SPECIFIER" forKey:*MEMORY[0x263F60138]];
  [v2 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  [v2 setCellType:-1];

  return v2;
}

- (id)_rampedSpecifierWithEnablement:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D2AB140 target:self set:sel_setGMUserOptInStatus_ get:sel_gmUserOptInStatus_ detail:0 cell:-1 edit:0];
  uint64_t v5 = +[AssistantController bundle];
  uint64_t v6 = [v5 localizedStringForKey:@"GM_RAMP_SPECIFIER_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
  [v4 setName:v6];

  [v4 setProperty:@"GM_RAMP_SPECIFIER" forKey:*MEMORY[0x263F60138]];
  id v7 = [NSNumber numberWithBool:v3];
  [v4 setProperty:v7 forKey:*MEMORY[0x263F600A8]];

  [v4 setCellType:6];

  return v4;
}

- (id)_rampedSpecifierWithButton:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D2AB140 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  uint64_t v5 = +[AssistantController bundle];
  uint64_t v6 = [v5 localizedStringForKey:@"GM_TURN_ON_GM_BUTTON_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
  [v4 setName:v6];

  [v4 setProperty:@"GM_RAMP_SPECIFIER" forKey:*MEMORY[0x263F60138]];
  [v4 setButtonAction:sel_turnOnGmTapped_];
  id v7 = [NSNumber numberWithBool:v3];
  [v4 setProperty:v7 forKey:*MEMORY[0x263F600A8]];

  [v4 setCellType:13];

  return v4;
}

- (BOOL)fetchGMCapability
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(GMEligibilityProviderProtocol *)self->_gmEligibilityProvider eligibility] != 18
    && ([(GMSpecifierControllerProcotol *)self->_gmSpecifierController gmFFEnabled] & 1) != 0)
  {
    return 1;
  }
  uint64_t v4 = (void *)*MEMORY[0x263F28348];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v5)
  {
    gmEligibilityProvider = self->_gmEligibilityProvider;
    id v7 = v4;
    LODWORD(gmEligibilityProvider) = [(GMEligibilityProviderProtocol *)gmEligibilityProvider eligibility] == 18;
    int v8 = [(GMSpecifierControllerProcotol *)self->_gmSpecifierController gmFFEnabled];
    int v9 = 136315650;
    uint64_t v10 = "-[GMSpecifierProvider fetchGMCapability]";
    __int16 v11 = 1024;
    int v12 = (int)gmEligibilityProvider;
    __int16 v13 = 1024;
    int v14 = v8;
    _os_log_impl(&dword_220C23000, v7, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment GMEligibilityContextDeviceNotCapable: %d and CSFAnyFFEnabled: %d", (uint8_t *)&v9, 0x18u);

    return 0;
  }
  return result;
}

- (id)fetchGMRampSpecifierWith:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(GMEligibilityProviderProtocol *)self->_gmEligibilityProvider eligibility] == 18
    || ([(GMSpecifierControllerProcotol *)self->_gmSpecifierController gmFFEnabled] & 1) == 0)
  {
    uint64_t v6 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      gmEligibilityProvider = self->_gmEligibilityProvider;
      int v8 = v6;
      LODWORD(gmEligibilityProvider) = [(GMEligibilityProviderProtocol *)gmEligibilityProvider eligibility] == 18;
      int v9 = [(GMSpecifierControllerProcotol *)self->_gmSpecifierController gmFFEnabled];
      int v11 = 136315650;
      int v12 = "-[GMSpecifierProvider fetchGMRampSpecifierWith:]";
      __int16 v13 = 1024;
      int v14 = (int)gmEligibilityProvider;
      __int16 v15 = 1024;
      int v16 = v9;
      _os_log_impl(&dword_220C23000, v8, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment GMEligibilityContextDeviceNotCapable: %d and CSFAnyFFEnabled: %d", (uint8_t *)&v11, 0x18u);
    }
    id v5 = 0;
  }
  else
  {
    self->_gmEligibilityContext = [(GMEligibilityProviderProtocol *)self->_gmEligibilityProvider eligibility];
    uint64_t v4 = [(GMSpecifierProvider *)self _configuredGMSpecifier];
    if (v4 && [(GMEligibilityProviderProtocol *)self->_gmEligibilityProvider eligibility])
    {
      [(GMEligibilityProviderProtocol *)self->_gmEligibilityProvider setRequestState:0];
      id v5 = v4;
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)fetchGMRampStatus
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(GMEligibilityProviderProtocol *)self->_gmEligibilityProvider eligibility] == 18
    || ([(GMSpecifierControllerProcotol *)self->_gmSpecifierController gmFFEnabled] & 1) == 0)
  {
    uint64_t v4 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      gmEligibilityProvider = self->_gmEligibilityProvider;
      uint64_t v6 = v4;
      LODWORD(gmEligibilityProvider) = [(GMEligibilityProviderProtocol *)gmEligibilityProvider eligibility] == 18;
      int v7 = [(GMSpecifierControllerProcotol *)self->_gmSpecifierController gmFFEnabled];
      *(_DWORD *)buf = 136315650;
      __int16 v13 = "-[GMSpecifierProvider fetchGMRampStatus]";
      __int16 v14 = 1024;
      int v15 = (int)gmEligibilityProvider;
      __int16 v16 = 1024;
      int v17 = v7;
      _os_log_impl(&dword_220C23000, v6, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment GMEligibilityContextDeviceNotCapable: %d and CSFAnyFFEnabled: %d", buf, 0x18u);
    }
  }
  else if (self->_requestState == 1)
  {
    BOOL v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v13 = "-[GMSpecifierProvider fetchGMRampStatus]";
      _os_log_impl(&dword_220C23000, v3, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment Enrollment request is already in progress. Bailing.", buf, 0xCu);
    }
  }
  else
  {
    gmEligibilityContext = (void *)self->_gmEligibilityContext;
    self->_requestState = 1;
    objc_initWeak((id *)buf, self);
    gmSpecifierController = self->_gmSpecifierController;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __40__GMSpecifierProvider_fetchGMRampStatus__block_invoke;
    v10[3] = &unk_26457D1B0;
    objc_copyWeak(v11, (id *)buf);
    v11[1] = gmEligibilityContext;
    [(GMSpecifierControllerProcotol *)gmSpecifierController fetchStatusWithCompletionHandler:v10];
    objc_destroyWeak(v11);
    objc_destroyWeak((id *)buf);
  }
}

void __40__GMSpecifierProvider_fetchGMRampStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    *((void *)WeakRetained + 5) = 2;
    if (*(void *)(a1 + 40) != a2)
    {
      *((void *)WeakRetained + 6) = a2;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __40__GMSpecifierProvider_fetchGMRampStatus__block_invoke_35;
      block[3] = &unk_26457CF60;
      objc_copyWeak(&v9, v4);
      dispatch_async(MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v9);
    }
  }
  else
  {
    int v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v11 = "-[GMSpecifierProvider fetchGMRampStatus]_block_invoke";
      _os_log_impl(&dword_220C23000, v7, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment self is unavailable at fetchStatus completion. Bailing.", buf, 0xCu);
    }
  }
}

void __40__GMSpecifierProvider_fetchGMRampStatus__block_invoke_35(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadGMSpecifier];
    id WeakRetained = v2;
  }
}

- (id)valueForGMRampSpecifier:(id)a3
{
  BOOL v3 = +[AssistantController bundle];
  uint64_t v4 = [v3 localizedStringForKey:@"GM_RAMP_SPECIFIER_STATUS_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];

  return v4;
}

- (id)valueForGMPreparingSpecifier:(id)a3
{
  BOOL v3 = +[AssistantController bundle];
  uint64_t v4 = [v3 localizedStringForKey:@"GM_RAMP_SPECIFIER_STATUS_PREPARING_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];

  return v4;
}

- (id)gmUserOptInStatus:(id)a3
{
  if ([(GMEligibilityProviderProtocol *)self->_gmEligibilityProvider eligibility] == 9)
  {
    uint64_t v4 = (void *)MEMORY[0x263EFFA80];
  }
  else
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[GMSpecifierControllerProcotol featureOptInStatus](self->_gmSpecifierController, "featureOptInStatus"));
  }

  return v4;
}

- (void)setGMUserOptInStatus:(id)a3
{
  if ([a3 BOOLValue])
  {
    [(GMSpecifierProvider *)self _setGMUserOptInStatus:1];
  }
  else
  {
    [(GMSpecifierProvider *)self presentToggleOffAlert];
  }
}

- (void)_setGMUserOptInStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[GMSpecifierProvider _setGMUserOptInStatus:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_220C23000, v5, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment _setGMUserOptInStatus %d", (uint8_t *)&v7, 0x12u);
  }
  [(GMSpecifierControllerProcotol *)self->_gmSpecifierController setFeatureOptInStatusWithEnabled:v3];
  if (v3) {
    uint64_t v6 = 11;
  }
  else {
    uint64_t v6 = 10;
  }
  [(GMAnalyticsProvider *)self->_gmAnalyticsProvider sendAction:v6];
  [(GMSpecifierProvider *)self reloadGMSpecifier];
}

- (void)presentToggleOffAlert
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[GMSpecifierProvider presentToggleOffAlert]";
    _os_log_impl(&dword_220C23000, v2, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment presentToggleOffAlert", buf, 0xCu);
  }
  BOOL v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    id v5 = +[AssistantController bundle];
    uint64_t v6 = [v5 localizedStringForKey:@"GM_TURN_OFF_ALERT_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];

    int v7 = +[AssistantController bundle];
    int v8 = [v7 localizedStringForKey:@"GM_TURN_OFF_ALERT_MESSAGE" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
    uint64_t v9 = 1;
  }
  else
  {
    BOOL v10 = NSString;
    int v7 = +[AssistantController bundle];
    uint64_t v11 = [v7 localizedStringForKey:@"GM_TURN_OFF_ALERT_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
    uint64_t v12 = +[AssistantController bundle];
    __int16 v13 = [v12 localizedStringForKey:@"GM_TURN_OFF_ALERT_MESSAGE" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
    int v8 = [v10 stringWithFormat:@"%@\n\n%@", v11, v13];

    uint64_t v6 = 0;
    uint64_t v9 = 0;
  }

  __int16 v14 = [MEMORY[0x263F82418] alertControllerWithTitle:v6 message:v8 preferredStyle:v9];
  int v15 = (void *)MEMORY[0x263F82400];
  __int16 v16 = +[AssistantController bundle];
  int v17 = [v16 localizedStringForKey:@"GM_TURN_OFF_ALERT_OPTION_TURN_OFF" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __44__GMSpecifierProvider_presentToggleOffAlert__block_invoke;
  v26[3] = &unk_26457D1D8;
  v26[4] = self;
  uint64_t v18 = [v15 actionWithTitle:v17 style:2 handler:v26];
  [v14 addAction:v18];

  v19 = (void *)MEMORY[0x263F82400];
  v20 = +[AssistantController bundle];
  v21 = [v20 localizedStringForKey:@"GM_TURN_OFF_ALERT_OPTION_CANCEL" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __44__GMSpecifierProvider_presentToggleOffAlert__block_invoke_64;
  v25[3] = &unk_26457D1D8;
  v25[4] = self;
  v22 = [v19 actionWithTitle:v21 style:1 handler:v25];
  [v14 addAction:v22];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  [WeakRetained presentViewController:v14 animated:1 completion:0];
}

uint64_t __44__GMSpecifierProvider_presentToggleOffAlert__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[GMSpecifierProvider presentToggleOffAlert]_block_invoke";
    _os_log_impl(&dword_220C23000, v2, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment presentToggleOffAlert turn off selected", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _setGMUserOptInStatus:0];
}

uint64_t __44__GMSpecifierProvider_presentToggleOffAlert__block_invoke_64(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[GMSpecifierProvider presentToggleOffAlert]_block_invoke";
    _os_log_impl(&dword_220C23000, v2, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment presentToggleOffAlert cancel selected", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) reloadGMSpecifier];
}

- (void)reloadGMSpecifier
{
  p_listController = &self->_listController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_listController);
    [v4 reloadSpecifiers];
  }
}

- (void)reloadADMSpecifier
{
  p_listController = &self->_listController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_listController);
    [v4 reloadSpecifierID:@"IMAGE_CREATION"];
  }
}

- (int64_t)status
{
  return [(GMEligibilityProviderProtocol *)self->_gmEligibilityProvider eligibility];
}

- (void)showNetworkUnavailableAlert
{
  BOOL v3 = +[AssistantController bundle];
  id v13 = [v3 localizedStringForKey:@"GM_NO_NETWORK_WARNING_MESSAGE" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];

  id v4 = (void *)MEMORY[0x263F82418];
  id v5 = +[AssistantController bundle];
  uint64_t v6 = [v5 localizedStringForKey:@"GM_NO_NETWORK_WARNING_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
  int v7 = [v4 alertControllerWithTitle:v6 message:v13 preferredStyle:1];

  int v8 = (void *)MEMORY[0x263F82400];
  uint64_t v9 = +[AssistantController bundle];
  BOOL v10 = [v9 localizedStringForKey:@"GM_NO_NETWORK_OK" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
  uint64_t v11 = [v8 actionWithTitle:v10 style:1 handler:0];

  [v7 addAction:v11];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  [WeakRetained presentViewController:v7 animated:1 completion:0];
}

- (void)GMJoinWaitlistTapped:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F284A0] isNetworkAvailable])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2050000000;
    id v5 = (void *)getVTUIGMEnrollmentViewControllerClass_softClass;
    uint64_t v14 = getVTUIGMEnrollmentViewControllerClass_softClass;
    if (!getVTUIGMEnrollmentViewControllerClass_softClass)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __getVTUIGMEnrollmentViewControllerClass_block_invoke;
      v10[3] = &unk_26457D098;
      void v10[4] = &v11;
      __getVTUIGMEnrollmentViewControllerClass_block_invoke((uint64_t)v10);
      id v5 = (void *)v12[3];
    }
    uint64_t v6 = v5;
    _Block_object_dispose(&v11, 8);
    int v7 = (VTUIGMEnrollmentViewController *)[[v6 alloc] initWithDelegate:self];
    gmEnrollmentViewController = self->_gmEnrollmentViewController;
    self->_gmEnrollmentViewController = v7;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    [WeakRetained presentViewController:self->_gmEnrollmentViewController animated:1 completion:&__block_literal_global_1];

    [(GMAnalyticsProvider *)self->_gmAnalyticsProvider sendAction:2];
  }
  else
  {
    [(GMSpecifierProvider *)self showNetworkUnavailableAlert];
  }
}

void __44__GMSpecifierProvider_GMJoinWaitlistTapped___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "-[GMSpecifierProvider GMJoinWaitlistTapped:]_block_invoke";
    _os_log_impl(&dword_220C23000, v0, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment Enrollment View Controller Presented", (uint8_t *)&v1, 0xCu);
  }
}

- (void)turnOnGmTapped:(id)a3
{
  p_listController = &self->_listController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = objc_loadWeakRetained((id *)p_listController);
    [v6 performSelector:sel_handleGmCFU];
  }
}

- (void)siriGMIntroViewControllerPresented:(id)a3 withEnrollmentType:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 1uLL:
      id v8 = v6;
      uint64_t v7 = 7;
      break;
    case 4uLL:
      id v8 = v6;
      uint64_t v7 = 3;
      break;
    case 3uLL:
      id v8 = v6;
      uint64_t v7 = 0;
      break;
    default:
      goto LABEL_8;
  }
  [(GMAnalyticsProvider *)self->_gmAnalyticsProvider sendAction:v7];
  id v6 = v8;
LABEL_8:
}

- (void)siriGMIntroViewControllerContinuePressed:(id)a3
{
  id v4 = a3;
  if ([(GMEligibilityProviderProtocol *)self->_gmEligibilityProvider eligibility] == 5)
  {
    [(GMSpecifierControllerProcotol *)self->_gmSpecifierController setFeatureOptInStatusWithEnabled:1];
    [(GMSpecifierProvider *)self dismissGMIntroViewController];
    [(GMSpecifierProvider *)self reloadGMSpecifier];
    [(GMAnalyticsProvider *)self->_gmAnalyticsProvider sendAction:9];
  }
  else
  {
    objc_initWeak(&location, self);
    gmSpecifierController = self->_gmSpecifierController;
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    id v8 = __64__GMSpecifierProvider_siriGMIntroViewControllerContinuePressed___block_invoke;
    uint64_t v9 = &unk_26457D200;
    objc_copyWeak(&v10, &location);
    [(GMSpecifierControllerProcotol *)gmSpecifierController enrollWithCompletionHandler:&v6];
    -[GMAnalyticsProvider sendAction:](self->_gmAnalyticsProvider, "sendAction:", 4, v6, v7, v8, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __64__GMSpecifierProvider_siriGMIntroViewControllerContinuePressed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[6] = a2;
    [WeakRetained[2] setEligibility:a2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__GMSpecifierProvider_siriGMIntroViewControllerContinuePressed___block_invoke_2;
    block[3] = &unk_26457CF60;
    objc_copyWeak(&v7, v3);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v7);
  }
}

void __64__GMSpecifierProvider_siriGMIntroViewControllerContinuePressed___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained dismissGMIntroViewController];
    id v2 = objc_loadWeakRetained(v3 + 3);
    [v2 reloadSpecifiers];

    id WeakRetained = v3;
  }
}

- (void)siriGMIntroViewControllerNotNowPressed:(id)a3
{
  [(GMSpecifierProvider *)self dismissGMIntroViewController];
  id v4 = +[GMEligibilityProvider shared];
  uint64_t v5 = [v4 eligibility];

  gmAnalyticsProvider = self->_gmAnalyticsProvider;
  if (v5 == 5) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 5;
  }

  [(GMAnalyticsProvider *)gmAnalyticsProvider sendAction:v7];
}

- (void)dismissGMIntroViewController
{
  gmEnrollmentViewController = self->_gmEnrollmentViewController;
  if (gmEnrollmentViewController) {
    [(VTUIGMEnrollmentViewController *)gmEnrollmentViewController dismissViewControllerAnimated:1 completion:&__block_literal_global_81];
  }
}

void __51__GMSpecifierProvider_dismissGMIntroViewController__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "-[GMSpecifierProvider dismissGMIntroViewController]_block_invoke";
    _os_log_impl(&dword_220C23000, v0, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment Enrollment View Controller Dismissed", (uint8_t *)&v1, 0xCu);
  }
}

- (void)clearCFU
{
}

void __31__GMSpecifierProvider_clearCFU__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      uint64_t v5 = [v2 localizedDescription];
      int v6 = 136315394;
      uint64_t v7 = "-[GMSpecifierProvider clearCFU]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_220C23000, v4, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment GM Enrollment CFU could not be cleared %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)updateWithContext:(int64_t)a3
{
  objc_initWeak(&location, self);
  self->_gmEligibilityContext = a3;
  [(GMEligibilityProviderProtocol *)self->_gmEligibilityProvider setEligibility:a3];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__GMSpecifierProvider_updateWithContext___block_invoke;
  v5[3] = &unk_26457CF60;
  objc_copyWeak(&v6, &location);
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __41__GMSpecifierProvider_updateWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadGMSpecifier];
    id WeakRetained = v2;
  }
}

- (void)updateADMState
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[GMSpecifierProvider updateADMState]";
    _os_log_impl(&dword_220C23000, v3, OS_LOG_TYPE_INFO, "%s Attempting ADM update", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__GMSpecifierProvider_updateADMState__block_invoke;
  block[3] = &unk_26457CF60;
  objc_copyWeak(&v5, (id *)buf);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __37__GMSpecifierProvider_updateADMState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadADMSpecifier];
    id WeakRetained = v2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gmAnalyticsProvider, 0);
  objc_storeStrong((id *)&self->_gmEnrollmentViewController, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_gmEligibilityProvider, 0);

  objc_storeStrong((id *)&self->_gmSpecifierController, 0);
}

@end