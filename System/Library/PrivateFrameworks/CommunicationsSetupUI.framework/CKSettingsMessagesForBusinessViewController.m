@interface CKSettingsMessagesForBusinessViewController
- (BOOL)erroredOut;
- (BOOL)requestInFlight;
- (CKLazuliEnablementManager)lazuliEnablementManager;
- (IDSFeatureToggler)featureToggler;
- (id)personalizedAlertsEnabled:(id)a3;
- (id)specifiers;
- (id)unavailableString;
- (unint64_t)featureState;
- (void)_fetchFeatureState;
- (void)_showOnboarding;
- (void)_showPrivacySheetForBusinessChat;
- (void)setErroredOut:(BOOL)a3;
- (void)setFeatureState:(unint64_t)a3;
- (void)setFeatureToggler:(id)a3;
- (void)setLazuliEnablementManager:(id)a3;
- (void)setPersonalizedAlertsEnabled:(id)a3 specifier:(id)a4;
- (void)setRequestInFlight:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CKSettingsMessagesForBusinessViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CKSettingsMessagesForBusinessViewController;
  [(CKSettingsMessagesForBusinessViewController *)&v6 viewDidLoad];
  v3 = MessagesSettingsLocalizedString(@"BUSINESS_CHAT");
  [(CKSettingsMessagesForBusinessViewController *)self setTitle:v3];
  id v4 = objc_alloc(MEMORY[0x263F4A040]);
  v5 = (void *)[v4 initWithService:*MEMORY[0x263F49FC0] queue:MEMORY[0x263EF83A0]];
  [(CKSettingsMessagesForBusinessViewController *)self setFeatureToggler:v5];

  [(CKSettingsMessagesForBusinessViewController *)self _fetchFeatureState];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    objc_super v6 = (void *)MEMORY[0x263F5FC40];
    v7 = MessagesSettingsLocalizedString(@"MESSAGES_FOR_BUSINESS_GROUP_NAME");
    v8 = [v6 groupSpecifierWithID:@"messagesForBusinessGroup" name:v7];

    [v5 addObject:v8];
    BOOL v9 = [(CKSettingsMessagesForBusinessViewController *)self erroredOut];
    v10 = (void *)MEMORY[0x263F5FC40];
    v11 = MessagesSettingsLocalizedString(@"PERSONALIZED_ALERTS_TOGGLE");
    if (v9)
    {
      v12 = [v10 preferenceSpecifierNamed:v11 target:self set:0 get:sel_unavailableString detail:0 cell:4 edit:0];
    }
    else
    {
      v12 = [v10 preferenceSpecifierNamed:v11 target:self set:sel_setPersonalizedAlertsEnabled_specifier_ get:sel_personalizedAlertsEnabled_ detail:0 cell:6 edit:0];

      if ([(CKSettingsMessagesForBusinessViewController *)self requestInFlight]) {
        [v12 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
      }
      if (![(CKSettingsMessagesForBusinessViewController *)self featureState]) {
        [v12 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60020]];
      }
      if ([MEMORY[0x263F4AF78] deviceIsLockedDown])
      {
        uint64_t v13 = MEMORY[0x263EFFA80];
        [v12 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
        [v12 setProperty:v13 forKey:*MEMORY[0x263F60020]];
      }
    }
    v33 = v12;
    [v5 addObject:v12];
    v14 = MessagesSettingsLocalizedString(@"PERSONALIZED_ALERTS_GROUP_DESCRIPTION");
    v15 = (void *)MEMORY[0x263F5B8E8];
    v16 = [MEMORY[0x263F5B8B0] bundleWithIdentifier:@"com.apple.onboarding.businesschat"];
    v17 = [v15 flowWithBundle:v16];

    v18 = [v17 localizedButtonTitle];
    v19 = [NSString stringWithFormat:@"\r\r%@", v18];
    [v14 stringByAppendingString:v19];
    v21 = v20 = v5;

    NSUInteger v22 = [v21 rangeOfString:v18];
    NSUInteger v24 = v23;
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    [v8 setProperty:v26 forKey:*MEMORY[0x263F600C0]];

    v35.location = v22;
    v35.length = v24;
    v27 = NSStringFromRange(v35);
    [v8 setProperty:v27 forKey:*MEMORY[0x263F600D0]];

    [v8 setProperty:v21 forKey:*MEMORY[0x263F600E8]];
    v28 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [v8 setProperty:v28 forKey:*MEMORY[0x263F600E0]];

    v29 = NSStringFromSelector(sel__showPrivacySheetForBusinessChat);
    [v8 setProperty:v29 forKey:*MEMORY[0x263F600C8]];

    v30 = (objc_class *)[v20 copy];
    v31 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v30;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)unavailableString
{
  return MessagesSettingsLocalizedString(@"PERSONALIZED_ALERTS_UNAVAILABLE");
}

- (void)setPersonalizedAlertsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  int v6 = [v5 BOOLValue];
  [(CKSettingsMessagesForBusinessViewController *)self setRequestInFlight:1];
  unint64_t v7 = [(CKSettingsMessagesForBusinessViewController *)self featureState];
  if (v6) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [(CKSettingsMessagesForBusinessViewController *)self setFeatureState:v8];
  [(CKSettingsMessagesForBusinessViewController *)self reloadSpecifiers];
  BOOL v9 = [MEMORY[0x263F4A038] optionsWithFeatureID:@"bia-opt-out" state:v8];
  v10 = [(CKSettingsMessagesForBusinessViewController *)self featureToggler];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__CKSettingsMessagesForBusinessViewController_setPersonalizedAlertsEnabled_specifier___block_invoke;
  v12[3] = &unk_2644F0FD0;
  id v13 = v5;
  unint64_t v14 = v7;
  v12[4] = self;
  id v11 = v5;
  [v10 updateFeatureToggleStateWithOptions:v9 completion:v12];
}

void __86__CKSettingsMessagesForBusinessViewController_setPersonalizedAlertsEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) setRequestInFlight:0];
  if ([v3 error])
  {
    [*(id *)(a1 + 32) setFeatureState:*(void *)(a1 + 48)];
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        int v6 = 138412546;
        uint64_t v7 = v5;
        __int16 v8 = 2048;
        uint64_t v9 = [v3 error];
        _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_INFO, "Error setting Personalized Alerts toggle. Setting to value: %@. Error: %lu", (uint8_t *)&v6, 0x16u);
      }
    }
  }
  [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)personalizedAlertsEnabled:(id)a3
{
  if (objc_msgSend(MEMORY[0x263F4AF78], "deviceIsLockedDown", a3))
  {
    id v4 = (void *)MEMORY[0x263EFFA80];
  }
  else
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[CKSettingsMessagesForBusinessViewController featureState](self, "featureState") == 1);
  }
  return v4;
}

- (void)_showPrivacySheetForBusinessChat
{
  id v3 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.businesschat"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)_showOnboarding
{
  if (([MEMORY[0x263F4AF78] deviceIsLockedDown] & 1) == 0)
  {
    uint64_t v3 = CUTWeakLinkClass();
    if (v3)
    {
      id v4 = (objc_class *)v3;
      objc_initWeak(&location, self);
      uint64_t v8 = MEMORY[0x263EF8330];
      uint64_t v9 = 3221225472;
      uint64_t v10 = __62__CKSettingsMessagesForBusinessViewController__showOnboarding__block_invoke;
      id v11 = &unk_2644F0FF8;
      objc_copyWeak(&v12, &location);
      uint64_t v5 = (void *)MEMORY[0x223C3AA40](&v8);
      id v6 = [v4 alloc];
      uint64_t v7 = objc_msgSend(v6, "initWithCompletionHandler:", v5, v8, v9, v10, v11);
      [v7 setupNotNowWithActionHandler:v5];
      [(CKSettingsMessagesForBusinessViewController *)self presentViewController:v7 animated:1 completion:0];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __62__CKSettingsMessagesForBusinessViewController__showOnboarding__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchFeatureState];
}

- (void)_fetchFeatureState
{
  if (([MEMORY[0x263F4AF78] deviceIsLockedDown] & 1) == 0)
  {
    uint64_t v3 = [MEMORY[0x263F4A030] optionsWithFeatureID:@"bia-opt-out"];
    objc_initWeak(&location, self);
    id v4 = [(CKSettingsMessagesForBusinessViewController *)self featureToggler];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __65__CKSettingsMessagesForBusinessViewController__fetchFeatureState__block_invoke;
    v5[3] = &unk_2644F1020;
    objc_copyWeak(&v6, &location);
    [v4 retrieveFeatureToggleStateForOptions:v3 completion:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __65__CKSettingsMessagesForBusinessViewController__fetchFeatureState__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (![v7 success])
  {
LABEL_6:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setErroredOut:1];
    goto LABEL_8;
  }
  uint64_t v3 = [v7 state];
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3 == 3 || !v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      [WeakRetained _showOnboarding];
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  uint64_t v5 = [v7 state];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setFeatureState:v5];
LABEL_8:

  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  [v6 reloadSpecifiers];
}

- (CKLazuliEnablementManager)lazuliEnablementManager
{
  return self->_lazuliEnablementManager;
}

- (void)setLazuliEnablementManager:(id)a3
{
}

- (IDSFeatureToggler)featureToggler
{
  return self->_featureToggler;
}

- (void)setFeatureToggler:(id)a3
{
}

- (unint64_t)featureState
{
  return self->_featureState;
}

- (void)setFeatureState:(unint64_t)a3
{
  self->_featureState = a3;
}

- (BOOL)requestInFlight
{
  return self->_requestInFlight;
}

- (void)setRequestInFlight:(BOOL)a3
{
  self->_requestInFlight = a3;
}

- (BOOL)erroredOut
{
  return self->_erroredOut;
}

- (void)setErroredOut:(BOOL)a3
{
  self->_erroredOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureToggler, 0);
  objc_storeStrong((id *)&self->_lazuliEnablementManager, 0);
}

@end