@interface CNFRegSettingsController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (AUSystemSettingsSpecifiersProvider)specifiersProvider;
- (BOOL)_allAccountsAreDeactivated;
- (BOOL)_canDeselectAlias:(id)a3;
- (BOOL)_hasActiveFaceTimeCall;
- (BOOL)_popFromSettingsAnimated:(BOOL)a3;
- (BOOL)_shouldDisableAccountConfigurationUI;
- (BOOL)_shouldShowAliasInfo;
- (BOOL)_shouldUseDisabledHandlers;
- (BOOL)additionalAliasesAvailable;
- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6;
- (BOOL)captioningSupported;
- (BOOL)hideAppleIDLogin;
- (BOOL)oppositeServiceTypeEnabled;
- (BOOL)popToFirstRunControllerAnimated:(BOOL)a3;
- (BOOL)refreshiMessageAccountFooterText:(BOOL)a3;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)shouldShowAUOnlineSafetySpecifiers;
- (BOOL)shouldShowBlocklistSettings;
- (BOOL)shouldShowCallDirectorySettingsBundleSpecifiers;
- (BOOL)shouldShowFaceTimeCaptionsSpecifiers;
- (BOOL)shouldShowFaceTimePhotosSpecifiers;
- (BOOL)shouldShowFaceTimeVPCSpecifiers;
- (BOOL)shouldShowGFTProminenceSpecifiers;
- (BOOL)shouldShowIncomingCallSettingsBundleSpecifiers;
- (BOOL)shouldShowReceiveRelayCalls;
- (BOOL)shouldShowReceiveThumperCalls;
- (BOOL)shouldShowReplyWithMessage;
- (BOOL)shouldShowSharePlaySpecifiers;
- (BOOL)shouldShowSharedNameAndPhotoSpecifiers;
- (BOOL)shouldShowSiriSpecifiers;
- (BOOL)showAccounts:(BOOL)a3 animated:(BOOL)a4;
- (BOOL)showAliases:(BOOL)a3 animated:(BOOL)a4;
- (BOOL)showCallerId:(BOOL)a3 animated:(BOOL)a4;
- (BOOL)showDeviceAliases;
- (BOOL)showEnableSwitch;
- (BOOL)showReceiveRelayCalls;
- (CNFRegSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_appleIDAccounts;
- (id)_localeChooserForAccount:(id)a3;
- (id)_makeRedactedIdentifierFromSpecifier:(id)a3;
- (id)_makeRedactedIdentifierFromSpecifierId:(id)a3;
- (id)_makeRedactedIdentifiersFromSpecifiers:(id)a3;
- (id)_operationalAccounts;
- (id)_operationalAccountsForService:(int64_t)a3;
- (id)_safariViewControllerWithURL:(id)a3;
- (id)_specifierIdentifierForAccount:(id)a3;
- (id)_switchFooterText;
- (id)_useableAccounts;
- (id)accountSpecifiers;
- (id)accountToShowInCallerIDFooter;
- (id)aliasForSpecifier:(id)a3;
- (id)aliasSpecifiers;
- (id)aliasWithIdentifier:(id)a3;
- (id)callerIdAliasSpecifiers;
- (id)createSpecifierForAccount:(id)a3;
- (id)createSpecifierForAlias:(id)a3;
- (id)createSpecifierForCallerIdAlias:(id)a3;
- (id)customTitle;
- (id)ftImServiceString;
- (id)getAccountNameForSpecifier:(id)a3;
- (id)getFaceTimeCaptionsEnabledForSpecifier:(id)a3;
- (id)getFaceTimeEnabledForSpecifier:(id)a3;
- (id)getFaceTimePhotosEnabledForSpecifier:(id)a3;
- (id)getFaceTimeVPCEnabledForSpecifier:(id)a3;
- (id)getGFTAudioProminenceEnabledForSpecifier:(id)a3;
- (id)getReceiveRelayedCallsEnabledForSpecifier:(id)a3;
- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5;
- (id)logName;
- (id)possibleCallerIdAliases;
- (id)primaryAppleAccount;
- (id)specifierList;
- (id)statusForAlias:(id)a3;
- (id)statusForSpecifier:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)captionsSubscriptionToken;
- (int64_t)groupIdForSpecifier:(id)a3;
- (int64_t)groupIdForSpecifierId:(id)a3;
- (int64_t)indexOfLastSpecifierInGroup:(id)a3;
- (void)_buildSpecifierCache:(id)a3;
- (void)_cacheSpecifierGroup:(id)a3 withSpecifiers:(id)a4;
- (void)_handleAccountRegistrarChanged;
- (void)_handleDeactivation:(id)a3;
- (void)_handleFaceTimeCTRegistrationStatusChanged;
- (void)_handleFaceTimeEntitlementStatusChanged;
- (void)_handleFailedAccountReactivation:(id)a3 error:(id)a4;
- (void)_handleOutgoingRelayCallerIDChanged;
- (void)_handleRelayCapabilitiesChanged;
- (void)_handleSuccessfulAccountReactivation:(id)a3;
- (void)_hideLocaleChooser;
- (void)_refreshFaceTimeSettingsDelayed:(id)a3;
- (void)_reloadSpecifier:(id)a3 withBlock:(id)a4;
- (void)_setupAccountHandlers;
- (void)_setupAccountHandlersForDisabledOperation;
- (void)_setupAccountHandlersForDisabling;
- (void)_setupAccountHandlersForNormalOperation;
- (void)_showAccountAlertForAccount:(id)a3;
- (void)_showAliasValidationError:(id)a3;
- (void)_showLocaleChooserWithAccount:(id)a3;
- (void)_showPrivacySheet:(id)a3;
- (void)_showRemoveAlertForAlias:(id)a3 specifier:(id)a4;
- (void)_showRemoveTemporaryPhoneAlertForAlias:(id)a3;
- (void)_showSignInController;
- (void)_showViewAccountControllerForAccount:(id)a3;
- (void)_updateControllerStateAnimated:(BOOL)a3;
- (void)_updateSwitch;
- (void)_updateSwitchDelayed;
- (void)accountTappedWithSpecifier:(id)a3;
- (void)clearAccountCache;
- (void)clearFooterFromSpecifier:(id)a3;
- (void)configureAccountFooterForGroupSpecifier:(id)a3;
- (void)configureSignOutForSpecifier:(id)a3;
- (void)dealloc;
- (void)deleteTemporaryPhoneAliasSelected:(id)a3;
- (void)doneButtonTapped:(id)a3;
- (void)emitNavigationEvent;
- (void)firstRunControllerDidFinish:(id)a3 finished:(BOOL)a4;
- (void)formSheetViewDidDisappear;
- (void)formSheetViewWillDisappear;
- (void)handleCallStatusChanged;
- (void)openAUOnlineSafetyURL;
- (void)refreshAccountsAnimated:(BOOL)a3;
- (void)refreshAliasSpecifier:(id)a3;
- (void)refreshAliasesAnimated:(BOOL)a3;
- (void)refreshAllAliasSpecifiers;
- (void)refreshAllCallerIdAliasSpecifiers;
- (void)refreshBlocklistSettingsAnimated:(BOOL)a3;
- (void)refreshCallerIdAliasesAnimated:(BOOL)a3;
- (void)refreshCallerIdSpecifier:(id)a3;
- (void)refreshEnabledStateAnimated:(BOOL)a3;
- (void)refreshFaceTimeCaptionsSettingsAnimated:(BOOL)a3;
- (void)refreshFaceTimePhotosSettingsAnimated:(BOOL)a3;
- (void)refreshFaceTimeSettingsAnimated:(BOOL)a3;
- (void)refreshFaceTimeSettingsWithDelayAnimated:(BOOL)a3;
- (void)refreshFaceTimeVPCSettingsAnimated:(BOOL)a3;
- (void)refreshGFTProminenceSettingsAnimated:(BOOL)a3;
- (void)refreshReceiveRelayCallsSettingsAnimated:(BOOL)a3;
- (void)refreshSharePlaySettingsAnimated:(BOOL)a3;
- (void)refreshSharedNameAndPhotoSettingsAnimated:(BOOL)a3;
- (void)refreshTemporaryPhoneAnimated:(BOOL)a3;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)setAliasSelected:(id)a3;
- (void)setCallerId:(id)a3;
- (void)setCaptionsSubscriptionToken:(int)a3;
- (void)setFaceTimeCaptionsEnabled:(id)a3 specifier:(id)a4;
- (void)setFaceTimeEnabled:(id)a3 specifier:(id)a4;
- (void)setFaceTimeEnabled:(id)a3 specifier:(id)a4 animated:(BOOL)a5;
- (void)setFaceTimePhotosEnabled:(id)a3 specifier:(id)a4;
- (void)setFaceTimeVPCEnabled:(id)a3 specifier:(id)a4;
- (void)setGFTAudioProminenceEnabled:(id)a3 specifier:(id)a4;
- (void)setHideAppleIDLogin:(BOOL)a3;
- (void)setReceiveRelayedCallsEnabled:(id)a3 specifier:(id)a4;
- (void)setShowDeviceAliases:(BOOL)a3;
- (void)setShowEnableSwitch:(BOOL)a3;
- (void)setSpecifiersProvider:(id)a3;
- (void)showAllSettings:(BOOL)a3 animated:(BOOL)a4;
- (void)showBlocklistSettings:(BOOL)a3 animated:(BOOL)a4;
- (void)showFaceTimeCaptionsSettings:(BOOL)a3 animated:(BOOL)a4;
- (void)showFaceTimePhotosSettings:(BOOL)a3 animated:(BOOL)a4;
- (void)showFaceTimeSpecifiers:(id)a3 afterGroupId:(id)a4 animated:(BOOL)a5;
- (void)showFaceTimeVPCSpecifiers:(BOOL)a3 animated:(BOOL)a4;
- (void)showGFTProminenceSettings:(BOOL)a3 animated:(BOOL)a4;
- (void)showReceiveRelayCallsSettings:(BOOL)a3 animated:(BOOL)a4;
- (void)showReplyWithMessage:(BOOL)a3 animated:(BOOL)a4;
- (void)showSharePlaySettings:(BOOL)a3 animated:(BOOL)a4;
- (void)showSharedNameAndPhotoSettings:(BOOL)a3 animated:(BOOL)a4;
- (void)showSpecifiers:(id)a3 afterGroupId:(id)a4 animated:(BOOL)a5;
- (void)signoutAccount:(id)a3;
- (void)systemApplicationDidEnterBackground;
- (void)systemApplicationDidResume;
- (void)systemApplicationDidSuspend;
- (void)systemApplicationWillEnterForeground;
- (void)systemSettingsSpecifiersProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5;
- (void)systemSettingsSpecifiersProviderDidReloadSpecifiers:(id)a3;
- (void)updateSpecifier:(id)a3 withAlias:(id)a4;
- (void)updateSpecifier:(id)a3 withCallerIdAlias:(id)a4;
- (void)viewAccountControllerDidFinish:(id)a3 withAppleId:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNFRegSettingsController

- (CNFRegSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CNFRegSettingsController;
  v8 = [(CNFRegSettingsController *)&v21 initWithNibName:v6 bundle:v7];
  v9 = v8;
  if (v8)
  {
    *(unsigned char *)&v8->_settingsFlags |= 8u;
    [(CNFRegListController *)v8 _updateTitle];
    id v10 = (id)[MEMORY[0x263F7E1A0] sharedInstance];
    id v11 = (id)[MEMORY[0x263F3BB20] sharedInstance];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v9 selector:sel_handleCallStatusChanged name:*MEMORY[0x263F7E328] object:0];
    [v12 addObserver:v9 selector:sel_handleCallStatusChanged name:*MEMORY[0x263F7E310] object:0];
    [v12 addObserver:v9 selector:sel__handleFaceTimeCTRegistrationStatusChanged name:*MEMORY[0x263F3BAE0] object:0];
    [v12 addObserver:v9 selector:sel__handleFaceTimeEntitlementStatusChanged name:*MEMORY[0x263F3BAE8] object:0];
    [v12 addObserver:v9 selector:sel__handleDeactivation_ name:*MEMORY[0x263F83CA0] object:0];
    [v12 addObserver:v9 selector:sel__handleRelayCapabilitiesChanged name:*MEMORY[0x263F7E2E0] object:0];
    [v12 addObserver:v9 selector:sel__handleThumperCapabilitiesChanged name:*MEMORY[0x263F7E2F0] object:0];
    [v12 addObserver:v9 selector:sel__handleOutgoingRelayCallerIDChanged name:*MEMORY[0x263F7E2D8] object:0];
    [v12 addObserver:v9 selector:sel__handleAccountRegistrarChanged name:@"CNFAccountRegistarStateChangedNotification" object:0];
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    CStringPtr = CFStringGetCStringPtr((CFStringRef)*MEMORY[0x263F8B0B8], SystemEncoding);
    objc_initWeak(&location, v9);
    id v15 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __51__CNFRegSettingsController_initWithNibName_bundle___block_invoke;
    handler[3] = &unk_2644F09C8;
    objc_copyWeak(&v19, &location);
    notify_register_dispatch(CStringPtr, &v9->_captionsSubscriptionToken, MEMORY[0x263EF83A0], handler);

    v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_21ED18000, v16, OS_LOG_TYPE_DEFAULT, "Instantiated CNFRegSettingsController %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v9;
}

void __51__CNFRegSettingsController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshFaceTimeCaptionsSettingsAnimated:1];
}

- (void)dealloc
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  notify_cancel(self->_captionsSubscriptionToken);
  v4.receiver = self;
  v4.super_class = (Class)CNFRegSettingsController;
  [(CNFRegListController *)&v4 dealloc];
}

- (BOOL)_hasActiveFaceTimeCall
{
  v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  char v3 = [v2 anyCallPassesTest:&__block_literal_global_6];

  return v3;
}

uint64_t __50__CNFRegSettingsController__hasActiveFaceTimeCall__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 provider];
  uint64_t v3 = [v2 isFaceTimeProvider];

  return v3;
}

- (BOOL)_shouldDisableAccountConfigurationUI
{
  if ([(CNFRegSettingsController *)self _hasActiveFaceTimeCall]) {
    return 1;
  }
  uint64_t v3 = [MEMORY[0x263F3BB18] sharedInstance];
  char v4 = [v3 faceTimeBlocked];

  return v4;
}

- (AUSystemSettingsSpecifiersProvider)specifiersProvider
{
  specifiersProvider = self->_specifiersProvider;
  if (!specifiersProvider)
  {
    id v4 = objc_alloc(MEMORY[0x263F25600]);
    v5 = (AUSystemSettingsSpecifiersProvider *)[v4 initWithApplicationBundleIdentifier:*MEMORY[0x263F7E2B8]];
    id v6 = self->_specifiersProvider;
    self->_specifiersProvider = v5;

    [(AUSystemSettingsSpecifiersProvider *)self->_specifiersProvider setDelegate:self];
    specifiersProvider = self->_specifiersProvider;
  }
  return specifiersProvider;
}

- (void)systemSettingsSpecifiersProviderDidReloadSpecifiers:(id)a3
{
  id v4 = a3;
  v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "FACETIME SETTINGS > DEFAULT APP: Calling systemSettingsSpecifiersProviderDidReloadSpecifiers", v6, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [(CNFRegSettingsController *)self reloadSpecifiers];
}

- (void)systemSettingsSpecifiersProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, "FACETIME SETTINGS > DEFAULT APP: Calling systemSettingsSpecifiersProvider presentViewController", v11, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [(CNFRegSettingsController *)self presentViewController:v9 animated:v5 completion:0];
}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5
{
  id v25 = 0;
  v26 = 0;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v8 pathForResource:a3 ofType:@"plist"];
  id v11 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v10];
  v12 = objc_opt_new();
  v13 = CNFRegStringTableName();
  v23 = &v24;
  id v24 = v12;
  v14 = SpecifiersFromPlist();

  id v15 = v24;
  id v16 = v24;

  v17 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD90]);
  if (*v17) {
    objc_msgSend(*v17, "addObjectsFromArray:", v16, &v24);
  }
  else {
    objc_storeStrong(v17, v15);
  }
  if (!v26)
  {
    v18 = [(CNFRegListController *)self regController];
    uint64_t v19 = [v18 serviceType];

    v20 = @"com.apple.preferences.imessage";
    objc_super v21 = v26;
    if (!v19) {
      v20 = @"com.apple.preferences.facetime";
    }
    v26 = v20;
  }
  -[CNFRegSettingsController setSpecifierID:](self, "setSpecifierID:", v26, v23);
  [(CNFRegSettingsController *)self setTitle:v25];

  return v14;
}

- (id)specifierList
{
  uint64_t v212 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (v3) {
    goto LABEL_202;
  }
  uint64_t v152 = (int)*MEMORY[0x263F5FDB8];
  v164 = self;
  id v4 = [(CNFRegSettingsController *)self bundle];
  BOOL v5 = [(CNFRegSettingsController *)v164 loadSpecifiersFromPlistName:@"ConferenceRegistrationSettings" target:v164 bundle:v4];

  v154 = [v5 specifierForID:@"INCOMING_CALL_STYLE"];
  v153 = [v5 specifierForID:@"ANNOUNCE_CALLS"];
  BOOL v6 = (*(unsigned char *)&v164->_settingsFlags & 8) == 0;
  id v7 = [v5 specifierForID:@"FACETIME_ENABLED_GROUP_ID"];
  if (v6)
  {
    [v5 removeObject:v7];

    id v7 = [v5 specifierForID:@"FACETIME_ENABLED_ID"];
    [v5 removeObject:v7];
  }
  else
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 setProperty:v9 forKey:*MEMORY[0x263F600C0]];

    id v10 = CommunicationsSetupUIBundle();
    id v11 = CNFRegStringTableName();
    v12 = [v10 localizedStringForKey:@"LEARN_MORE" value:&stru_26D05D4F8 table:v11];

    v13 = [(CNFRegSettingsController *)v164 _switchFooterText];
    v14 = [NSString stringWithFormat:@" %@", v12];
    id v15 = [v13 stringByAppendingString:v14];

    v214.id location = [v15 rangeOfString:v12];
    id v16 = NSStringFromRange(v214);
    [v7 setProperty:v16 forKey:*MEMORY[0x263F600D0]];

    [v7 setProperty:v15 forKey:*MEMORY[0x263F600E8]];
    v17 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v164];
    [v7 setProperty:v17 forKey:*MEMORY[0x263F600E0]];

    v18 = NSStringFromSelector(sel__showPrivacySheet_);
    [v7 setProperty:v18 forKey:*MEMORY[0x263F600C8]];
  }
  uint64_t v19 = [(CNFRegListController *)v164 regController];
  uint64_t v20 = [v19 serviceType];

  objc_super v21 = (uint64_t *)MEMORY[0x263F602D0];
  if (v20)
  {
    v22 = [v5 specifierForID:@"FACETIME_BLOCKLIST_GROUP_ID"];
    v23 = v22;
    if (v22)
    {
      [v22 removePropertyForKey:*MEMORY[0x263F60170]];
      [v23 removePropertyForKey:*v21];
      [v23 setName:0];
    }
  }
  id v24 = v164;
  if ([(CNFRegSettingsController *)v164 shouldShowSiriSpecifiers])
  {
    id v25 = [(CNFRegSettingsController *)v164 specifiersProvider];
    v26 = [v25 specifiers];

    if (v26)
    {
      if (v153)
      {
        [v5 removeObject:v153];
        [v5 insertObject:v153 atIndex:0];
      }
      if (v154)
      {
        [v5 removeObject:v154];
        [v5 insertObject:v154 atIndex:0];
      }
      v27 = [v26 arrayByAddingObjectsFromArray:v5];
      uint64_t v28 = [v27 mutableCopy];

      BOOL v5 = (void *)v28;
    }
    id v24 = v164;
  }
  if (![(CNFRegSettingsController *)v24 shouldShowCallDirectorySettingsBundleSpecifiers])
  {
    v29 = [v5 specifierForID:@"CALL_DIRECTORIES"];
    if (v29) {
      [v5 removeObject:v29];
    }

    id v24 = v164;
  }
  if (![(CNFRegSettingsController *)v24 shouldShowIncomingCallSettingsBundleSpecifiers])
  {
    if (v154) {
      objc_msgSend(v5, "removeObject:");
    }
    if (v153) {
      objc_msgSend(v5, "removeObject:");
    }
    v30 = [v5 specifierForID:@"CALL_PROVIDERS"];
    if (v30) {
      [v5 removeObject:v30];
    }
  }
  v163 = [v5 specifierForID:@"FACETIME_ALIAS_GROUP_ID"];
  if (v163)
  {
    v31 = CommunicationsSetupUIBundle();
    v32 = CNFStringKeyForIdiom(@"FACETIME_SETTINGS_ALIAS_LABEL");
    v33 = CNFRegStringTableName();
    v34 = [v31 localizedStringForKey:v32 value:&stru_26D05D4F8 table:v33];

    [v163 setProperty:v34 forKey:*v21];
    [v163 setName:v34];
    if ([v34 _isNaturallyRTL]) {
      uint64_t v35 = 2;
    }
    else {
      uint64_t v35 = 0;
    }
    v36 = [NSNumber numberWithInteger:v35];
    [v163 setProperty:v36 forKey:*MEMORY[0x263F5FEF0]];

    v37 = v164;
    if ([(NSArray *)v164->_aliasGroupSpecifiers count] >= 2)
    {
      uint64_t v38 = [v5 indexOfObject:v163];
      if (v38 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v39 = v38;
        if ([(NSArray *)v164->_aliasGroupSpecifiers count] >= 2)
        {
          unint64_t v40 = 1;
          do
          {
            p_aliasGroupSpecifiers = (id *)&v37->_aliasGroupSpecifiers;
            v42 = [(NSArray *)v37->_aliasGroupSpecifiers objectAtIndexedSubscript:v40];
            [v5 insertObject:v42 atIndex:v39 + v40];

            ++v40;
            v37 = v164;
          }
          while (v40 < [*p_aliasGroupSpecifiers count]);
        }
      }
    }
  }
  v160 = [v5 specifierForID:@"FACETIME_ACCOUNT_GROUP_ID"];
  if ([(CNFRegSettingsController *)v164 hideAppleIDLogin])
  {
LABEL_40:
    [v5 removeObject:v160];
    goto LABEL_45;
  }
  if (v160)
  {
    uint64_t v43 = [v5 indexOfObject:v160];
    if (v43 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v44 = v43;
      v45 = [(CNFRegSettingsController *)v164 accountToShowInCallerIDFooter];

      if (!v45)
      {
        v46 = [(CNFRegSettingsController *)v164 createSpecifierForAccount:0];
        [v5 insertObject:v46 atIndex:v44 + 1];

        goto LABEL_45;
      }
      goto LABEL_40;
    }
  }
LABEL_45:
  v158 = [v5 specifierForID:@"FACETIME_CALLERID_GROUP_ID"];
  if (v158)
  {
    uint64_t v47 = [v5 indexOfObject:v158];
    if (v47 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v48 = v47;
      v49 = [(CNFRegSettingsController *)v164 possibleCallerIdAliases];
      v199[0] = MEMORY[0x263EF8330];
      v199[1] = 3221225472;
      v199[2] = __41__CNFRegSettingsController_specifierList__block_invoke;
      v199[3] = &unk_2644F0A10;
      v199[4] = v164;
      id v200 = v5;
      uint64_t v201 = v48 + 1;
      [v49 enumerateObjectsWithOptions:2 usingBlock:v199];
    }
  }
  [(CNFRegSettingsController *)v164 _buildSpecifierCache:v5];
  if (v163)
  {
    v50 = [(CNFRegListController *)v164 regController];
    v51 = [(CNFRegListController *)v164 regController];
    v52 = [v51 accounts];
    v53 = [v50 aliasesForAccounts:v52];

    v54 = [(CNFRegListController *)v164 regController];
    v55 = [v54 usableDeviceAliases];

    if ([(CNFRegSettingsController *)v164 showDeviceAliases])
    {
      char v56 = 1;
    }
    else
    {
      v57 = [(CNFRegListController *)v164 regController];
      if ([v57 serviceType])
      {
        char v56 = 1;
      }
      else
      {
        v58 = [(CNFRegListController *)v164 regController];
        char v56 = [v58 isServiceEnabled];
      }
    }
    v59 = [(CNFRegListController *)v164 regController];
    if ([v59 serviceSupportsDeviceAliasEnablement])
    {
      if (![v55 count]) {
        char v56 = 0;
      }
    }
    else
    {
      char v56 = 0;
    }

    if ([v53 count]) {
      char v60 = 1;
    }
    else {
      char v60 = v56;
    }
    if ((v60 & 1) == 0) {
      [v5 removeObject:v163];
    }
  }
  if (![(NSArray *)v164->_accountGroupSpecifiers count])
  {
    uint64_t v61 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v160, 0);
    accountGroupSpecifiers = v164->_accountGroupSpecifiers;
    v164->_accountGroupSpecifiers = (NSArray *)v61;
  }
  long long v197 = 0u;
  long long v198 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  v63 = [(CNFRegListController *)v164 regController];
  v64 = [(CNFRegListController *)v164 regController];
  v65 = [v64 accounts];
  v66 = [v63 allAvailableAliasesForAccounts:v65];

  uint64_t v67 = [v66 countByEnumeratingWithState:&v195 objects:v211 count:16];
  if (v67)
  {
    v166 = 0;
    uint64_t v68 = *(void *)v196;
    do
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        if (*(void *)v196 != v68) {
          objc_enumerationMutation(v66);
        }
        v70 = *(void **)(*((void *)&v195 + 1) + 8 * i);
        if ([v70 isTemporaryPhoneNumberAlias])
        {
          id v71 = v70;

          v166 = v71;
        }
      }
      uint64_t v67 = [v66 countByEnumeratingWithState:&v195 objects:v211 count:16];
    }
    while (v67);
  }
  else
  {
    v166 = 0;
  }

  v161 = [v5 specifierForID:@"FACETIME_TEMPORARY_PHONE_GROUP_ID"];
  v159 = [v5 specifierForID:@"FACETIME_TEMPORARY_PHONE_ID"];
  v162 = [v5 specifierForID:@"FACETIME_TEMPORARY_PHONE_REMOVE"];
  if (v161 && v159 && v162)
  {
    if (v166)
    {
      v72 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v210 = v166;
        _os_log_impl(&dword_21ED18000, v72, OS_LOG_TYPE_DEFAULT, "Initial load found temporary phone alias %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v151 = v166;
        IMLogString();
      }
      v73 = CommunicationsSetupUIBundle();
      v74 = CNFRegStringTableName();
      v75 = [v73 localizedStringForKey:@"FACETIME_SETTINGS_TEMPORARY_PHONE_LABEL" value:&stru_26D05D4F8 table:v74];

      uint64_t v76 = *v21;
      [v161 setProperty:v75 forKey:*v21];
      [v161 setName:v75];
      if ([v75 _isNaturallyRTL]) {
        uint64_t v77 = 2;
      }
      else {
        uint64_t v77 = 0;
      }
      v78 = objc_msgSend(NSNumber, "numberWithInteger:", v77, v151);
      uint64_t v79 = *MEMORY[0x263F5FEF0];
      [v161 setProperty:v78 forKey:*MEMORY[0x263F5FEF0]];

      uint64_t v80 = objc_opt_class();
      uint64_t v81 = *MEMORY[0x263F5FFE0];
      [v159 setProperty:v80 forKey:*MEMORY[0x263F5FFE0]];
      [v159 setProperty:v166 forKey:@"cnfreg-temp-alias"];
      v165 = [(CNFRegSettingsController *)v164 ftImServiceString];
      v82 = NSString;
      v83 = CommunicationsSetupUIBundle();
      v84 = CNFRegStringTableName();
      v85 = [v83 localizedStringForKey:@"FACETIME_SETTINGS_TEMPORARY_PHONE_REMOVE" value:&stru_26D05D4F8 table:v84];
      v86 = objc_msgSend(v82, "stringWithFormat:", v85, v165);

      [v162 setName:v86];
      [v162 setProperty:v86 forKey:v76];
      v87 = [NSNumber numberWithInt:0];
      [v162 setProperty:v87 forKey:v79];

      v88 = [NSNumber numberWithBool:1];
      [v162 setProperty:v88 forKey:*MEMORY[0x263F600A8]];

      [v162 setProperty:objc_opt_class() forKey:v81];
      [v162 setButtonAction:sel_deleteTemporaryPhoneAliasSelected_];
      v89 = NSStringFromSelector(sel_deleteTemporaryPhoneAliasSelected_);
      [v162 setProperty:v89 forKey:*MEMORY[0x263F5FF70]];

      [v162 setProperty:v166 forKey:@"cnfreg-temp-alias"];
    }
    else
    {
      v90 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v90, OS_LOG_TYPE_DEFAULT, "Initial load found no temporary phone alias. Deleting specifiers", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      [v5 removeObject:v161];
      [v5 removeObject:v159];
      [v5 removeObject:v162];
    }
  }
  v91 = [(CNFRegListController *)v164 regController];
  uint64_t v92 = [v91 serviceType];

  if ((v92 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    v93 = [v5 specifierForID:@"FACETIME_ENABLED_GROUP_ID"];
    v94 = v93;
    if (v93)
    {
      [v93 removePropertyForKey:*MEMORY[0x263F600F8]];
      [v94 removePropertyForKey:*MEMORY[0x263F600C0]];
    }
  }
  if (![(CNFRegSettingsController *)v164 shouldShowReplyWithMessage])
  {
    long long v193 = 0u;
    long long v194 = 0u;
    long long v191 = 0u;
    long long v192 = 0u;
    v95 = v164->_replyWithMessageGroupSpecifiers;
    uint64_t v96 = [(NSArray *)v95 countByEnumeratingWithState:&v191 objects:v208 count:16];
    if (v96)
    {
      uint64_t v97 = *(void *)v192;
      do
      {
        for (uint64_t j = 0; j != v96; ++j)
        {
          if (*(void *)v192 != v97) {
            objc_enumerationMutation(v95);
          }
          [v5 removeObject:*(void *)(*((void *)&v191 + 1) + 8 * j)];
        }
        uint64_t v96 = [(NSArray *)v95 countByEnumeratingWithState:&v191 objects:v208 count:16];
      }
      while (v96);
    }
  }
  v99 = [(CNFRegListController *)v164 regController];
  v100 = [(CNFRegSettingsController *)v164 _useableAccounts];
  v157 = [v99 useableAliasesForAccounts:v100];

  if (v157 && (unint64_t)[v157 count] > 1)
  {
    v105 = [v5 specifierForID:@"FACETIME_CALLERID_GROUP_ID"];
    v106 = v105;
    if (v105)
    {
      v107 = [v105 name];
      if ([v107 _isNaturallyRTL]) {
        uint64_t v108 = 2;
      }
      else {
        uint64_t v108 = 0;
      }

      v109 = [NSNumber numberWithInteger:v108];
      [v106 setProperty:v109 forKey:*MEMORY[0x263F5FEF0]];
    }
    [(CNFRegSettingsController *)v164 configureAccountFooterForGroupSpecifier:v106];
  }
  else
  {
    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    v101 = v164->_callerIdGroupSpecifiers;
    uint64_t v102 = [(NSArray *)v101 countByEnumeratingWithState:&v187 objects:v207 count:16];
    if (v102)
    {
      uint64_t v103 = *(void *)v188;
      do
      {
        for (uint64_t k = 0; k != v102; ++k)
        {
          if (*(void *)v188 != v103) {
            objc_enumerationMutation(v101);
          }
          [v5 removeObject:*(void *)(*((void *)&v187 + 1) + 8 * k)];
        }
        uint64_t v102 = [(NSArray *)v101 countByEnumeratingWithState:&v187 objects:v207 count:16];
      }
      while (v102);
    }

    [(CNFRegSettingsController *)v164 configureAccountFooterForGroupSpecifier:v163];
  }
  v156 = [v5 specifierForID:@"MESSAGES_SIGN_OUT_GROUP_ID"];
  v155 = [v5 specifierForID:@"MESSAGES_SIGN_OUT_ID"];
  v110 = [(CNFRegListController *)v164 regController];
  v111 = [(CNFRegSettingsController *)v164 primaryAppleAccount];
  v112 = objc_msgSend(v111, "aa_personID");
  int v113 = [v110 iMessageAccountMatchesiCloudAccount:v112];

  if (v113)
  {
    v114 = [NSNumber numberWithInt:1];
    [v156 setProperty:v114 forKey:*MEMORY[0x263F5FEF0]];

    [(CNFRegSettingsController *)v164 configureSignOutForSpecifier:v155];
  }
  else
  {
    [v5 removeObject:v156];
    [v5 removeObject:v155];
  }
  if (![(CNFRegSettingsController *)v164 shouldShowBlocklistSettings])
  {
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    v115 = v164->_blocklistGroupSpecifiers;
    uint64_t v116 = [(NSArray *)v115 countByEnumeratingWithState:&v183 objects:v206 count:16];
    if (v116)
    {
      uint64_t v117 = *(void *)v184;
      do
      {
        for (uint64_t m = 0; m != v116; ++m)
        {
          if (*(void *)v184 != v117) {
            objc_enumerationMutation(v115);
          }
          [v5 removeObject:*(void *)(*((void *)&v183 + 1) + 8 * m)];
        }
        uint64_t v116 = [(NSArray *)v115 countByEnumeratingWithState:&v183 objects:v206 count:16];
      }
      while (v116);
    }
  }
  if ([(CNFRegSettingsController *)v164 shouldShowReceiveThumperCalls])
  {
    v119 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v119, OS_LOG_TYPE_DEFAULT, "Removing \"Calls from iPhone\" switch, adding \"Calls on Other Devices\" drill down", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    v120 = [v5 specifierForID:@"RECEIVE_RELAYED_PHONE_CALLS_ID"];
    if (v120) {
      [v5 removeObject:v120];
    }
LABEL_160:

    goto LABEL_161;
  }
  if (![(CNFRegSettingsController *)v164 shouldShowReceiveRelayCalls])
  {
    v121 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v121, OS_LOG_TYPE_DEFAULT, "Removing \"Calls from iPhone\" group entirely.  Neither Thumper nor Relay supported", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    v120 = v164->_receiveRelayCallsGroupSpecifiers;
    uint64_t v122 = [(NSArray *)v120 countByEnumeratingWithState:&v179 objects:v205 count:16];
    if (v122)
    {
      uint64_t v123 = *(void *)v180;
      do
      {
        for (uint64_t n = 0; n != v122; ++n)
        {
          if (*(void *)v180 != v123) {
            objc_enumerationMutation(v120);
          }
          [v5 removeObject:*(void *)(*((void *)&v179 + 1) + 8 * n)];
        }
        uint64_t v122 = [(NSArray *)v120 countByEnumeratingWithState:&v179 objects:v205 count:16];
      }
      while (v122);
    }
    goto LABEL_160;
  }
LABEL_161:
  if (![(CNFRegSettingsController *)v164 shouldShowFaceTimeCaptionsSpecifiers])
  {
    v125 = [v5 specifierForID:@"FACETIME_CAPTIONS_ENABLED_GROUP_ID"];
    [v5 removeObject:v125];

    v126 = [v5 specifierForID:@"FACETIME_CAPTIONS_ENABLED_ID"];
    [v5 removeObject:v126];
  }
  if (![(CNFRegSettingsController *)v164 shouldShowFaceTimePhotosSpecifiers])
  {
    v127 = [v5 specifierForID:@"FACETIME_PHOTOS_ENABLED_GROUP_ID"];
    [v5 removeObject:v127];

    v128 = [v5 specifierForID:@"FACETIME_PHOTOS_ENABLED_ID"];
    [v5 removeObject:v128];
  }
  if (![(CNFRegSettingsController *)v164 shouldShowGFTProminenceSpecifiers])
  {
    v129 = [v5 specifierForID:@"GFT_PROMINENCE_GROUP_ID"];
    [v5 removeObject:v129];

    v130 = [v5 specifierForID:@"GFT_AUDIO_PROMINENCE_ENABLED_ID"];
    [v5 removeObject:v130];
  }
  if (![(CNFRegSettingsController *)v164 shouldShowFaceTimeVPCSpecifiers])
  {
    v131 = [v5 specifierForID:@"FACETIME_VPC_GROUP_ID"];
    [v5 removeObject:v131];

    v132 = [v5 specifierForID:@"FACETIME_VPC_SWITCH_ID"];
    [v5 removeObject:v132];
  }
  if (![(CNFRegSettingsController *)v164 shouldShowSharePlaySpecifiers])
  {
    long long v177 = 0u;
    long long v178 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    v133 = v164->_sharePlaySpecifiers;
    uint64_t v134 = [(NSArray *)v133 countByEnumeratingWithState:&v175 objects:v204 count:16];
    if (v134)
    {
      uint64_t v135 = *(void *)v176;
      do
      {
        for (iuint64_t i = 0; ii != v134; ++ii)
        {
          if (*(void *)v176 != v135) {
            objc_enumerationMutation(v133);
          }
          [v5 removeObject:*(void *)(*((void *)&v175 + 1) + 8 * ii)];
        }
        uint64_t v134 = [(NSArray *)v133 countByEnumeratingWithState:&v175 objects:v204 count:16];
      }
      while (v134);
    }
  }
  if (![(CNFRegSettingsController *)v164 shouldShowSharedNameAndPhotoSpecifiers])
  {
    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    v137 = v164->_sharedNameAndPhotoSpecifiers;
    uint64_t v138 = [(NSArray *)v137 countByEnumeratingWithState:&v171 objects:v203 count:16];
    if (v138)
    {
      uint64_t v139 = *(void *)v172;
      do
      {
        for (juint64_t j = 0; jj != v138; ++jj)
        {
          if (*(void *)v172 != v139) {
            objc_enumerationMutation(v137);
          }
          [v5 removeObject:*(void *)(*((void *)&v171 + 1) + 8 * jj)];
        }
        uint64_t v138 = [(NSArray *)v137 countByEnumeratingWithState:&v171 objects:v203 count:16];
      }
      while (v138);
    }
  }
  if (![(CNFRegSettingsController *)v164 shouldShowAUOnlineSafetySpecifiers])
  {
    long long v169 = 0u;
    long long v170 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    v141 = v164->_australiaOnlineSafetyGroupSpecifiers;
    uint64_t v142 = [(NSArray *)v141 countByEnumeratingWithState:&v167 objects:v202 count:16];
    if (v142)
    {
      uint64_t v143 = *(void *)v168;
      do
      {
        for (kuint64_t k = 0; kk != v142; ++kk)
        {
          if (*(void *)v168 != v143) {
            objc_enumerationMutation(v141);
          }
          v145 = *(void **)(*((void *)&v167 + 1) + 8 * kk);
          v146 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
          {
            v147 = [v145 identifier];
            *(_DWORD *)buf = 138412290;
            v210 = v147;
            _os_log_impl(&dword_21ED18000, v146, OS_LOG_TYPE_DEFAULT, "AU ESAFETY: Removing specifier: %@", buf, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            v151 = [v145 identifier];
            IMLogString();
          }
          objc_msgSend(v5, "removeObject:", v145, v151);
        }
        uint64_t v142 = [(NSArray *)v141 countByEnumeratingWithState:&v167 objects:v202 count:16];
      }
      while (v142);
    }
  }
  uint64_t v148 = [v5 copy];
  v149 = *(Class *)((char *)&v164->super.super.super.super.super.super.isa + v152);
  *(Class *)((char *)&v164->super.super.super.super.super.super.isa + v152) = (Class)v148;

  uint64_t v3 = *(Class *)((char *)&v164->super.super.super.super.super.super.isa + v152);
LABEL_202:
  return v3;
}

void __41__CNFRegSettingsController_specifierList__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) createSpecifierForCallerIdAlias:a2];
  [*(id *)(a1 + 40) insertObject:v3 atIndex:*(void *)(a1 + 48)];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNFRegSettingsController;
  id v7 = [(CNFRegSettingsController *)&v18 tableView:a3 cellForRowAtIndexPath:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 setSelectionStyle:1];
  }
  uint64_t v8 = [(CNFRegSettingsController *)self indexForIndexPath:v6];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v8];
    id v10 = [v9 propertyForKey:@"cnfreg-alias-checked"];
    id v11 = v10;
    if (v10) {
      objc_msgSend(v7, "setChecked:", objc_msgSend(v10, "BOOLValue"));
    }
    v12 = [v9 propertyForKey:@"cnfreg-alias-spinning"];
    v13 = v12;
    if (v12) {
      objc_msgSend(v7, "setHasSpinner:", objc_msgSend(v12, "BOOLValue"));
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [v9 CNFRegAlias];
      if ([v14 isTemporaryPhoneNumberAlias])
      {
        uint64_t v15 = 1;
      }
      else
      {
        id v16 = [v9 CNFRegCallerIdAlias];
        uint64_t v15 = [v16 isTemporaryPhoneNumberAlias];
      }
      [v7 setIsTemporaryPhone:v15];
    }
  }
  return v7;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)doneButtonTapped:(id)a3
{
  id v4 = [(CNFRegSettingsController *)self navigationController];
  id v3 = [v4 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)CNFRegSettingsController;
  [(CNFRegSettingsController *)&v11 viewDidLoad];
  id v3 = [(CNFRegSettingsController *)self navigationController];
  int v4 = [v3 isBeingPresented];

  if (v4)
  {
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonTapped_];
    id v6 = [(CNFRegSettingsController *)self navigationItem];
    [v6 setRightBarButtonItem:v5];

    id v7 = CommunicationsSetupUIBundle();
    uint64_t v8 = CNFRegStringTableName();
    id v9 = [v7 localizedStringForKey:@"FACETIME_ALIAS_MODAL_TITLE" value:&stru_26D05D4F8 table:v8];
    id v10 = [(CNFRegSettingsController *)self navigationItem];
    [v10 setTitle:v9];
  }
}

- (void)emitNavigationEvent
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F7E2B8];
  id v16 = [NSString stringWithFormat:@"settings-navigation://com.apple.Settings.Apps/%@", *MEMORY[0x263F7E2B8]];
  int v4 = [NSURL URLWithString:v16];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  id v6 = [MEMORY[0x263EFF960] currentLocale];
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 bundleURL];
  id v9 = (void *)[v5 initWithKey:@"FaceTime" table:0 locale:v6 bundleURL:v8];

  id v10 = objc_alloc(MEMORY[0x263F08DB0]);
  objc_super v11 = [MEMORY[0x263EFF960] currentLocale];
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  v14 = (void *)[v10 initWithKey:@"Apps" table:0 locale:v11 bundleURL:v13];

  v17[0] = v14;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(CNFRegSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v3 title:v9 localizedNavigationComponents:v15 deepLink:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CNFRegListController *)self _updateTitle];
  v5.receiver = self;
  v5.super_class = (Class)CNFRegSettingsController;
  [(CNFRegListController *)&v5 viewWillAppear:v3];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNFRegSettingsController;
  [(CNFRegSettingsController *)&v5 viewIsAppearing:a3];
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]))
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __44__CNFRegSettingsController_viewIsAppearing___block_invoke;
    v4[3] = &unk_2644F04A0;
    v4[4] = self;
    [MEMORY[0x263F82E00] performWithoutAnimation:v4];
  }
  [(CNFRegListController *)self showAuthKitSignInIfNecessary];
}

uint64_t __44__CNFRegSettingsController_viewIsAppearing___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshFaceTimeSettingsAnimated:0];
  [*(id *)(a1 + 32) refreshAllAliasSpecifiers];
  v2 = *(void **)(a1 + 32);
  return [v2 refreshAllCallerIdAliasSpecifiers];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNFRegSettingsController;
  [(CNFRegListController *)&v5 viewDidAppear:a3];
  [(CNFRegSettingsController *)self _setupAllListeners];
  *(unsigned char *)&self->_settingsFlags |= 2u;
  int v4 = [MEMORY[0x263F4A568] sharedInstance];
  [v4 _setBlocksConnectionAtResume:1];

  [(CNFRegSettingsController *)self emitNavigationEvent];
}

- (void)viewWillDisappear:(BOOL)a3
{
  *(unsigned char *)&self->_settingsFlags &= ~2u;
  v6.receiver = self;
  v6.super_class = (Class)CNFRegSettingsController;
  [(CNFRegListController *)&v6 viewWillDisappear:a3];
  int v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Removing all event handlers", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [(CNFRegListController *)self removeAllHandlers];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegSettingsController;
  [(CNFRegListController *)&v3 viewDidDisappear:a3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  *(unsigned char *)&self->_settingsFlags |= 4u;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__CNFRegSettingsController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v9[3] = &unk_2644F0A58;
  v9[4] = self;
  id v7 = a4;
  [v7 animateAlongsideTransition:&__block_literal_global_297 completion:v9];
  v8.receiver = self;
  v8.super_class = (Class)CNFRegSettingsController;
  -[CNFRegSettingsController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __79__CNFRegSettingsController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1568) &= ~4u;
  return result;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (id)_useableAccounts
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v4 = [(CNFRegListController *)self regController];
  objc_super v5 = [v4 phoneAccounts];
  [v3 addObjectsFromArray:v5];

  objc_super v6 = [(CNFRegSettingsController *)self _appleIDAccounts];
  [v3 addObjectsFromArray:v6];

  return v3;
}

- (id)_appleIDAccounts
{
  v2 = [(CNFRegListController *)self regController];
  id v3 = [v2 accountsWithFilter:102405];

  return v3;
}

- (id)_operationalAccounts
{
  v2 = [(CNFRegListController *)self regController];
  id v3 = [v2 accountsWithFilter:102400];

  return v3;
}

- (id)_operationalAccountsForService:(int64_t)a3
{
  id v3 = +[CNFRegController controllerForServiceType:a3];
  int v4 = [v3 accountsWithFilter:102400];

  return v4;
}

- (void)formSheetViewWillDisappear
{
  v2.receiver = self;
  v2.super_class = (Class)CNFRegSettingsController;
  [(CNFRegSettingsController *)&v2 formSheetViewWillDisappear];
}

- (void)formSheetViewDidDisappear
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegSettingsController;
  [(CNFRegSettingsController *)&v3 formSheetViewDidDisappear];
  [(CNFRegSettingsController *)self _setupAllListeners];
}

- (void)systemApplicationWillEnterForeground
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegSettingsController;
  [(CNFRegListController *)&v3 systemApplicationWillEnterForeground];
  [(CNFRegSettingsController *)self refreshFaceTimeSettingsAnimated:0];
  [(CNFRegSettingsController *)self _setupAccountHandlers];
}

- (void)systemApplicationDidEnterBackground
{
  v5.receiver = self;
  v5.super_class = (Class)CNFRegSettingsController;
  [(CNFRegListController *)&v5 systemApplicationDidEnterBackground];
  objc_super v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Removing all event handlers due to suspension", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [(CNFRegListController *)self removeAllHandlers];
}

- (void)systemApplicationDidSuspend
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CNFRegSettingsController;
  [(CNFRegListController *)&v8 systemApplicationDidSuspend];
  objc_super v3 = [(CNFRegSettingsController *)self presentedViewController];

  if (v3)
  {
    int v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v5 = [(CNFRegSettingsController *)self presentedViewController];
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing presented view controller (%@) due to suspension", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog())
      {
        id v7 = [(CNFRegSettingsController *)self presentedViewController];
        IMLogString();
      }
    }
    objc_super v6 = [(CNFRegSettingsController *)self presentedViewController];
    [v6 dismissViewControllerAnimated:0 completion:0];
  }
}

- (void)systemApplicationDidResume
{
  v2.receiver = self;
  v2.super_class = (Class)CNFRegSettingsController;
  [(CNFRegListController *)&v2 systemApplicationDidResume];
}

- (void)_handleDeactivation:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 userInfo];
  objc_super v6 = [v5 objectForKey:*MEMORY[0x263F83C70]];

  if ([v6 intValue] == 11)
  {
    id v7 = [(CNFRegSettingsController *)self presentedViewController];

    if (v7)
    {
      id v16 = [(CNFRegSettingsController *)self presentedViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_16:
        v13 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = [(CNFRegSettingsController *)self presentedViewController];
          *(_DWORD *)buf = 138412290;
          v22 = v14;
          _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "Dismissing presented view controller (%@) due to deactivation (suspension)", buf, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          uint64_t v15 = [(CNFRegSettingsController *)self presentedViewController];
          IMLogString();
        }
        -[CNFRegSettingsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0, v15);
      }
      else
      {
        objc_opt_class();
        objc_super v8 = v16;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_23:

          goto LABEL_24;
        }
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v9 = [v16 viewControllers];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v18;
          while (2)
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v9);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
              }

              goto LABEL_16;
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      objc_super v8 = v16;
      goto LABEL_23;
    }
  }
LABEL_24:
}

- (id)logName
{
  return @"Settings";
}

- (id)customTitle
{
  objc_super v2 = [(CNFRegListController *)self regController];
  uint64_t v3 = [v2 serviceType];

  switch(v3)
  {
    case 2:
      goto LABEL_4;
    case 1:
      id v4 = CommunicationsSetupUIBundle();
      objc_super v5 = CNFRegStringTableName();
      objc_super v6 = @"IMESSAGE";
      goto LABEL_6;
    case 0:
LABEL_4:
      id v4 = CommunicationsSetupUIBundle();
      objc_super v5 = CNFRegStringTableName();
      objc_super v6 = @"FACETIME";
LABEL_6:
      id v7 = [v4 localizedStringForKey:v6 value:&stru_26D05D4F8 table:v5];

      goto LABEL_8;
  }
  id v7 = &stru_26D05D4F8;
LABEL_8:
  return v7;
}

- (void)_cacheSpecifierGroup:(id)a3 withSpecifiers:(id)a4
{
  if (a3 && a4)
  {
    p_accountGroupSpecifiers = (void **)&self->_accountGroupSpecifiers;
    id v7 = a4;
    id v8 = a3;
    _cacheSpecifierGroupMatchingID(@"FACETIME_ACCOUNT_GROUP_ID", v8, v7, p_accountGroupSpecifiers);
    _cacheSpecifierGroupMatchingID(@"FACETIME_REPLY_WITH_MESSAGE_GROUP_ID", v8, v7, (void **)&self->_replyWithMessageGroupSpecifiers);
    _cacheSpecifierGroupMatchingID(@"FACETIME_ALIAS_GROUP_ID", v8, v7, (void **)&self->_aliasGroupSpecifiers);
    _cacheSpecifierGroupMatchingID(@"FACETIME_TEMPORARY_PHONE_GROUP_ID", v8, v7, (void **)&self->_temporaryPhoneGroupSpecifiers);
    _cacheSpecifierGroupMatchingID(@"FACETIME_TEMPORARY_PHONE_ID", v8, v7, (void **)&self->_temporaryPhoneDescriptionGroupSpecifiers);
    _cacheSpecifierGroupMatchingID(@"FACETIME_TEMPORARY_PHONE_REMOVE", v8, v7, (void **)&self->_temporaryPhoneRemoveGroupSpecifiers);
    _cacheSpecifierGroupMatchingID(@"FACETIME_CALLERID_GROUP_ID", v8, v7, (void **)&self->_callerIdGroupSpecifiers);
    _cacheSpecifierGroupMatchingID(@"FACETIME_BLOCKLIST_GROUP_ID", v8, v7, (void **)&self->_blocklistGroupSpecifiers);
    _cacheSpecifierGroupMatchingID(@"RECEIVE_RELAYED_PHONE_CALLS_GROUP_ID", v8, v7, (void **)&self->_receiveRelayCallsGroupSpecifiers);
    _cacheSpecifierGroupMatchingID(@"GFT_PROMINENCE_GROUP_ID", v8, v7, (void **)&self->_GFTProminenceGroupSpecifiers);
    _cacheSpecifierGroupMatchingID(@"FACETIME_CAPTIONS_ENABLED_GROUP_ID", v8, v7, (void **)&self->_faceTimeCaptionsGroupSpecifiers);
    _cacheSpecifierGroupMatchingID(@"FACETIME_PHOTOS_ENABLED_GROUP_ID", v8, v7, (void **)&self->_faceTimePhotosGroupSpecifiers);
    _cacheSpecifierGroupMatchingID(@"SHAREPLAY_SETTINGS_GROUP", v8, v7, (void **)&self->_sharePlaySpecifiers);
    _cacheSpecifierGroupMatchingID(@"FACETIME_VPC_GROUP_ID", v8, v7, (void **)&self->_faceTimeVPCGroupSpecifiers);
    _cacheSpecifierGroupMatchingID(@"SHARED_NAME_AND_PHOTO_SETTINGS_GROUP", v8, v7, (void **)&self->_sharedNameAndPhotoSpecifiers);
    _cacheSpecifierGroupMatchingID(@"AU_ONLINE_SAFETY_GROUP_ID", v8, v7, (void **)&self->_australiaOnlineSafetyGroupSpecifiers);
  }
}

- (void)_buildSpecifierCache:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    objc_super v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v16;
    id v9 = (int *)MEMORY[0x263F5FE10];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(char **)(*((void *)&v15 + 1) + 8 * i);
        _cacheSpecifierMatchingID(@"FACETIME_ENABLED_GROUP_ID", v11, (id *)&self->_faceTimeEnabledGroupSpecifier);
        _cacheSpecifierMatchingID(@"FACETIME_ENABLED_ID", v11, (id *)&self->_faceTimeEnabledSpecifier);
        if (*(void *)&v11[*v9])
        {
          [v6 addObject:v11];
        }
        else
        {
          [(CNFRegSettingsController *)self _cacheSpecifierGroup:v7 withSpecifiers:v6];
          v12 = v11;

          uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v12, 0);
          objc_super v6 = (void *)v13;
          id v7 = v12;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    objc_super v6 = 0;
    id v7 = 0;
  }
  [(CNFRegSettingsController *)self _cacheSpecifierGroup:v7 withSpecifiers:v6];
}

- (id)_switchFooterText
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v3 = CommunicationsSetupUIBundle();
  uint64_t v4 = CNFRegStringTableName();
  uint64_t v5 = [v3 localizedStringForKey:@"FACETIME_SWITCH_STATUS_DEFAULT" value:&stru_26D05D4F8 table:v4];

  if (MGGetBoolAnswer())
  {
    objc_super v6 = [MEMORY[0x263F3BB18] sharedInstance];
    int v7 = [v6 supportsSMSIdentification];

    if (v7)
    {
      uint64_t v8 = CNFRegStringTableName();
      id v9 = CommunicationsSetupUIBundle();
      uint64_t v10 = CNFLocalizedStringFromTableInBundleWithFallback(@"FACETIME_SWITCH_STATUS_DEFAULT_WITH_WARNING", v8, v9);

      uint64_t v5 = (void *)v10;
    }
  }
  uint64_t SIMStatus = CTSIMSupportGetSIMStatus();
  uint64_t v11 = (uint64_t *)MEMORY[0x263F03078];
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v13 = [(CNFRegListController *)self regController];
  v14 = [v13 accountsWithFilter:8];
  [v12 addObjectsFromArray:v14];

  long long v15 = [(CNFRegListController *)self regController];
  uint64_t v16 = [v15 accountsWithFilter:8200];
  [v12 addObjectsFromArray:v16];

  long long v17 = [MEMORY[0x263F3BB18] sharedInstance];
  LOBYTE(v16) = [v17 supportsSMSIdentification];

  if ((v16 & 1) == 0)
  {
    long long v18 = [(CNFRegListController *)self regController];
    long long v19 = [v18 accountsWithFilter:16389];
    [v12 addObjectsFromArray:v19];
  }
  uint64_t v43 = v5;
  uint64_t v20 = *v11;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v21 = v12;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    int v24 = 0;
    char v25 = 0;
    uint64_t v26 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v51 != v26) {
          objc_enumerationMutation(v21);
        }
        uint64_t v28 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v29 = objc_msgSend(v28, "registrationStatus", v43);
        if (v29 == -1)
        {
          v25 |= [v28 registrationFailureReason] != 14;
          [v28 isActive];
        }
        else
        {
          uint64_t v30 = v29;
          int v31 = [v28 isActive];
          if (v30 >= 2 && v31 != 0) {
            v24 |= [v28 CNFRegSignInComplete] ^ 1;
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v23);
  }
  else
  {
    LOBYTE(v24) = 0;
    char v25 = 0;
  }

  if (SIMStatus == v20)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v36 = [(CNFRegListController *)self regController];
    v33 = [v36 accountsWithFilter:4];

    uint64_t v37 = [v33 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v47;
      while (2)
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v47 != v39) {
            objc_enumerationMutation(v33);
          }
          if (objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * j), "registrationStatus", v43) == 5)
          {
            v41 = v43;
            goto LABEL_38;
          }
        }
        uint64_t v38 = [v33 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v38) {
          continue;
        }
        break;
      }
    }

    if (v25) {
      goto LABEL_24;
    }
  }
  else if (v25)
  {
LABEL_24:
    v33 = CommunicationsSetupUIBundle();
    v34 = CNFRegStringTableName();
    uint64_t v35 = @"FACETIME_SWITCH_STATUS_FAILED";
    goto LABEL_36;
  }
  if ((v24 & 1) == 0)
  {
    v41 = v43;
    goto LABEL_39;
  }
  v33 = CommunicationsSetupUIBundle();
  v34 = CNFRegStringTableName();
  uint64_t v35 = @"FACETIME_SWITCH_STATUS_IN_PROGRESS";
LABEL_36:
  v41 = objc_msgSend(v33, "localizedStringForKey:value:table:", v35, &stru_26D05D4F8, v34, v43);

LABEL_38:
LABEL_39:

  return v41;
}

- (void)_updateSwitch
{
  if ([(CNFRegSettingsController *)self showEnableSwitch])
  {
    uint64_t v3 = self->_faceTimeEnabledGroupSpecifier;
    id v4 = [(CNFRegSettingsController *)self _switchFooterText];
    [(CNFRegListController *)self _setLabel:v4 forSpecifier:v3 header:0];
    [(CNFRegSettingsController *)self reloadSpecifier:self->_faceTimeEnabledGroupSpecifier animated:0];
    [(CNFRegSettingsController *)self reloadSpecifier:self->_faceTimeEnabledSpecifier animated:0];
  }
}

- (void)_updateSwitchDelayed
{
  if ([(CNFRegSettingsController *)self showEnableSwitch])
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateSwitch object:0];
    [(CNFRegSettingsController *)self performSelector:sel__updateSwitch withObject:0 afterDelay:0.75];
  }
}

- (void)setFaceTimeEnabled:(id)a3 specifier:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v37[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(CNFRegListController *)self regController];
  if (![v8 BOOLValue])
  {
    if ([(CNFRegSettingsController *)self _shouldDisableAccountConfigurationUI])
    {
      [(CNFRegSettingsController *)self reloadSpecifierID:@"FACETIME_ENABLED_ID"];
    }
    else
    {
      [(CNFRegSettingsController *)self _setupAccountHandlersForDisabling];
      [v10 setServiceEnabled:0];
      [(CNFRegSettingsController *)self refreshFaceTimeSettingsAnimated:v5];
    }
    goto LABEL_25;
  }
  if (MGGetBoolAnswer())
  {
    if (([v10 serviceType] | 2) == 2)
    {
      uint64_t v11 = _CTServerConnectionCreateOnTargetQueue();
      if (v11)
      {
        id v12 = (const void *)v11;
        uint64_t v13 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "Enabling data usage for FaceTime", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          IMLogString();
        }
        uint64_t v14 = *MEMORY[0x263F02DD8];
        uint64_t v15 = *MEMORY[0x263F02DD0];
        v36[0] = *MEMORY[0x263F034E0];
        v36[1] = v15;
        v37[0] = v14;
        v37[1] = v14;
        uint64_t v16 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
        unint64_t v17 = _CTServerConnectionSetCellularUsagePolicy();
        if (HIDWORD(v17))
        {
          long long v18 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v33 = HIDWORD(v17);
            __int16 v34 = 1024;
            int v35 = v17;
            _os_log_impl(&dword_21ED18000, v18, OS_LOG_TYPE_DEFAULT, "Could not enable data usage. error: %d domain: (%d)", buf, 0xEu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            unint64_t v30 = HIDWORD(v17);
            unint64_t v31 = v17;
            IMLogString();
          }
        }
        CFRelease(v12);
      }
    }
  }
  if (![(CNFRegListController *)self _showWiFiAlertIfNecessary])
  {
    [(CNFRegSettingsController *)self _setupAccountHandlers];
    long long v19 = [v10 accounts];
    BOOL v20 = v19 == 0;

    if (v20)
    {
      [(CNFRegSettingsController *)self popToFirstRunControllerAnimated:1];
      id v21 = [[CNFRegController alloc] initWithServiceType:0];
      [(CNFRegController *)v21 connect:1];
      uint64_t v22 = [(CNFRegListController *)[CNFRegSettingsController alloc] initWithRegController:v21];
      uint64_t v23 = [(CNFRegSettingsController *)self rootController];
      [(CNFRegSettingsController *)v22 setRootController:v23];

      [(CNFRegSettingsController *)v22 setParentController:self];
      int v24 = [(CNFRegSettingsController *)self specifier];
      [(CNFRegListController *)v22 setSpecifier:v24];

      [(CNFRegSettingsController *)v22 setShowEnableSwitch:0];
      [(CNFRegSettingsController *)v22 setShowDeviceAliases:1];
      [(CNFRegSettingsController *)v22 setHideAppleIDLogin:1];
      char v25 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v22];
      uint64_t v26 = +[CNFRegAppearanceController globalAppearanceController];
      uint64_t v27 = [v26 navigationBarStyle];
      uint64_t v28 = [v25 navigationBar];
      [v28 setBarStyle:v27];

      uint64_t v29 = [(CNFRegListController *)self regController];
      [v29 connect:1];

      [(CNFRegSettingsController *)self presentModalViewController:v25 withTransition:3];
    }
    else
    {
      [v10 activateAccounts];
    }
LABEL_25:
    [(CNFRegSettingsController *)self _updateSwitch];
    goto LABEL_26;
  }
  [(CNFRegSettingsController *)self reloadSpecifier:v9];
LABEL_26:
}

- (void)setFaceTimeEnabled:(id)a3 specifier:(id)a4
{
}

- (id)getFaceTimeEnabledForSpecifier:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = [(CNFRegListController *)self regController];
  BOOL v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isServiceEnabled"));

  return v5;
}

- (void)setReceiveRelayedCallsEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v25 = [v6 BOOLValue];
    _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "SetReceiveRelayedCallsEnabled %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v22 = [v6 BOOLValue];
    IMLogString();
  }
  if (objc_msgSend(v6, "BOOLValue", v22)
    && ([MEMORY[0x263F7E198] accountsSupportSecondaryCalling] & 1) == 0)
  {
    id v9 = CommunicationsSetupUIBundle();
    uint64_t v10 = CNFRegStringTableName();
    uint64_t v11 = [v9 localizedStringForKey:@"RELAY_CALLS_ACCOUNT_ALERT_TITLE" value:&stru_26D05D4F8 table:v10];

    LODWORD(v9) = _os_feature_enabled_impl();
    id v12 = CommunicationsSetupUIBundle();
    uint64_t v13 = CNFRegStringTableName();
    if (v9) {
      uint64_t v14 = @"RELAY_CALLS_ACCOUNT_ALERT_MESSAGE_APPLEACCOUNT";
    }
    else {
      uint64_t v14 = @"RELAY_CALLS_ACCOUNT_ALERT_MESSAGE";
    }
    uint64_t v15 = [v12 localizedStringForKey:v14 value:&stru_26D05D4F8 table:v13];

    uint64_t v16 = [MEMORY[0x263F82418] alertControllerWithTitle:v11 message:v15 preferredStyle:1];
    unint64_t v17 = (void *)MEMORY[0x263F82400];
    long long v18 = CommunicationsSetupUIBundle();
    long long v19 = CNFRegStringTableName();
    BOOL v20 = [v18 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v19];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __68__CNFRegSettingsController_setReceiveRelayedCallsEnabled_specifier___block_invoke;
    v23[3] = &unk_2644F0988;
    v23[4] = self;
    id v21 = [v17 actionWithTitle:v20 style:0 handler:v23];
    [v16 addAction:v21];

    [(CNFRegSettingsController *)self presentViewController:v16 animated:1 completion:0];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F7E198], "setRelayCallingEnabled:", objc_msgSend(v6, "BOOLValue"));
  }
}

uint64_t __68__CNFRegSettingsController_setReceiveRelayedCallsEnabled_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"RECEIVE_RELAYED_PHONE_CALLS_ID" animated:1];
}

- (id)getReceiveRelayedCallsEnabledForSpecifier:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7E198], "isRelayCallingEnabled", a3);
  return (id)[v3 numberWithBool:v4];
}

- (void)_showPrivacySheet:(id)a3
{
  id v4 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.imessagefacetime"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)_refreshFaceTimeSettingsDelayed:(id)a3
{
  -[CNFRegSettingsController refreshFaceTimeSettingsAnimated:](self, "refreshFaceTimeSettingsAnimated:", [a3 BOOLValue]);
  delayedRefreshAnimatedFlag = self->_delayedRefreshAnimatedFlag;
  self->_delayedRefreshAnimatedFlag = 0;
}

- (void)refreshFaceTimeSettingsWithDelayAnimated:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__refreshFaceTimeSettingsDelayed_ object:self->_delayedRefreshAnimatedFlag];
  [(CNFRegSettingsController *)self performSelector:sel__refreshFaceTimeSettingsDelayed_ withObject:v4 afterDelay:0.75];
  delayedRefreshAnimatedFlag = self->_delayedRefreshAnimatedFlag;
  self->_delayedRefreshAnimatedFlag = v4;
}

- (void)refreshFaceTimeSettingsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v5 = [(CNFRegSettingsController *)self _operationalAccounts];
  if ([v5 count])
  {
    [(CNFRegSettingsController *)self refreshAccountsAnimated:v3];
    [(CNFRegSettingsController *)self refreshAliasesAnimated:v3];
    [(CNFRegSettingsController *)self refreshCallerIdAliasesAnimated:v3];
    [(CNFRegSettingsController *)self refreshTemporaryPhoneAnimated:v3];
    [(CNFRegSettingsController *)self refreshGFTProminenceSettingsAnimated:v3];
    [(CNFRegSettingsController *)self refreshSharedNameAndPhotoSettingsAnimated:v3];
    [(CNFRegSettingsController *)self refreshSharePlaySettingsAnimated:v3];
    [(CNFRegSettingsController *)self refreshFaceTimeCaptionsSettingsAnimated:v3];
    [(CNFRegSettingsController *)self refreshFaceTimePhotosSettingsAnimated:v3];
    [(CNFRegSettingsController *)self refreshFaceTimeVPCSettingsAnimated:v3];
    [(CNFRegSettingsController *)self refreshBlocklistSettingsAnimated:v3];
    [(CNFRegSettingsController *)self refreshReceiveRelayCallsSettingsAnimated:v3];
    goto LABEL_27;
  }
  id v6 = [(CNFRegListController *)self regController];
  id v7 = [v6 accountsWithFilter:49156];

  if ([v7 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v12), "CNFRegSignInFailed", (void)v22))
          {

            goto LABEL_14;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    [(CNFRegSettingsController *)self showAccounts:0 animated:v3];
  }
  else
  {
LABEL_14:
    [(CNFRegSettingsController *)self refreshAccountsAnimated:v3];
  }
  if ([(CNFRegSettingsController *)self showDeviceAliases])
  {
    int v13 = 1;
  }
  else
  {
    uint64_t v14 = [(CNFRegListController *)self regController];
    if ([v14 serviceType])
    {
      int v13 = 1;
    }
    else
    {
      uint64_t v15 = [(CNFRegListController *)self regController];
      int v13 = [v15 isServiceEnabled];
    }
  }
  uint64_t v16 = [(CNFRegListController *)self regController];
  unint64_t v17 = [v16 usableDeviceAliases];
  if (![v17 count])
  {

    goto LABEL_25;
  }
  long long v18 = [(CNFRegListController *)self regController];
  int v19 = [v18 serviceSupportsDeviceAliasEnablement] & v13;

  if (v19 != 1)
  {
LABEL_25:
    [(CNFRegSettingsController *)self showAliases:0 animated:v3];
    goto LABEL_26;
  }
  [(CNFRegSettingsController *)self refreshAliasesAnimated:v3];
LABEL_26:
  [(CNFRegSettingsController *)self showCallerId:0 animated:v3];
  [(CNFRegSettingsController *)self showBlocklistSettings:0 animated:v3];
  [(CNFRegSettingsController *)self showReceiveRelayCallsSettings:0 animated:v3];
  [(CNFRegSettingsController *)self showGFTProminenceSettings:0 animated:v3];
  [(CNFRegSettingsController *)self showSharedNameAndPhotoSettings:0 animated:v3];
  [(CNFRegSettingsController *)self showSharePlaySettings:0 animated:v3];
  [(CNFRegSettingsController *)self showFaceTimeCaptionsSettings:0 animated:v3];
  [(CNFRegSettingsController *)self showFaceTimePhotosSettings:0 animated:v3];
  [(CNFRegSettingsController *)self showFaceTimeVPCSpecifiers:0 animated:v3];

LABEL_27:
  [(CNFRegSettingsController *)self _updateSwitch];
  [(CNFRegSettingsController *)self reloadSpecifier:self->_faceTimeEnabledSpecifier animated:v3];
  [(CNFRegSettingsController *)self refreshEnabledStateAnimated:v3];
  BOOL v20 = [(CNFRegListController *)self regController];
  char v21 = [v20 isServiceSupported];

  if ((v21 & 1) == 0) {
    [(CNFRegSettingsController *)self _popFromSettingsAnimated:v3];
  }
}

- (void)refreshEnabledStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v65 = *MEMORY[0x263EF8340];
  BOOL v39 = [(CNFRegSettingsController *)self _shouldDisableAccountConfigurationUI];
  BOOL v5 = !v39;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v6 = [(CNFRegListController *)self regController];
  id v7 = [v6 accounts];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v56 objects:v64 count:16];
  BOOL v9 = v5;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v57;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v57 != v11) {
          objc_enumerationMutation(v7);
        }
        int v13 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        if ([v13 accountType] == 1 && objc_msgSend(v13, "registrationStatus") == 4)
        {
          BOOL v9 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    BOOL v9 = !v39;
  }
LABEL_12:

  uint64_t v14 = [(CNFRegSettingsController *)self specifierForID:@"FACETIME_ENABLED_ID"];
  [(CNFRegListController *)self _setSpecifierEnabled:v14 enabled:v5 animated:v3];

  uint64_t v15 = [(CNFRegSettingsController *)self specifierForID:@"FACETIME_ACCOUNT_ID"];
  [(CNFRegListController *)self _setSpecifierEnabled:v15 enabled:v9 animated:v3];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v16 = self->_accountGroupSpecifiers;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v53 != v19) {
          objc_enumerationMutation(v16);
        }
        [(CNFRegListController *)self _setSpecifierEnabled:*(void *)(*((void *)&v52 + 1) + 8 * j) enabled:v9 animated:v3];
      }
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v18);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  char v21 = self->_aliasGroupSpecifiers;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v48 + 1) + 8 * k);
        uint64_t v27 = [v26 CNFRegAlias];
        BOOL v28 = [(CNFRegSettingsController *)self _canDeselectAlias:v27];

        if (v28 || v39) {
          [(CNFRegListController *)self _setSpecifierEnabled:v26 enabled:v28 & v5 animated:v3];
        }
      }
      uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v48 objects:v62 count:16];
    }
    while (v23);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v29 = self->_callerIdGroupSpecifiers;
  uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v44 objects:v61 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v29);
        }
        [(CNFRegListController *)self _setSpecifierEnabled:*(void *)(*((void *)&v44 + 1) + 8 * m) enabled:v5 animated:v3];
      }
      uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v44 objects:v61 count:16];
    }
    while (v31);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  __int16 v34 = self->_faceTimePhotosGroupSpecifiers;
  uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v40 objects:v60 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v41;
    do
    {
      for (uint64_t n = 0; n != v36; ++n)
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(v34);
        }
        [(CNFRegListController *)self _setSpecifierEnabled:*(void *)(*((void *)&v40 + 1) + 8 * n) enabled:v5 animated:v3];
      }
      uint64_t v36 = [(NSArray *)v34 countByEnumeratingWithState:&v40 objects:v60 count:16];
    }
    while (v36);
  }
}

- (BOOL)showEnableSwitch
{
  return (*(unsigned char *)&self->_settingsFlags >> 3) & 1;
}

- (void)setShowEnableSwitch:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_settingsFlags = *(unsigned char *)&self->_settingsFlags & 0xF7 | v3;
}

- (BOOL)shouldShowCallDirectorySettingsBundleSpecifiers
{
  char v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 serviceType];

  BOOL v5 = [(CNFRegListController *)self regController];
  int v6 = [v5 isServiceEnabled];

  BOOL result = 0;
  if (!v4)
  {
    if (v6) {
      return [MEMORY[0x263F7E198] supportsPrimaryCalling] ^ 1;
    }
  }
  return result;
}

- (BOOL)shouldShowIncomingCallSettingsBundleSpecifiers
{
  char v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 serviceType];

  BOOL v5 = [(CNFRegListController *)self regController];
  char v6 = [v5 isServiceEnabled];

  if (v4) {
    return 0;
  }
  else {
    return v6;
  }
}

- (BOOL)shouldShowReceiveRelayCalls
{
  char v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 serviceType];

  BOOL v5 = [(CNFRegListController *)self regController];
  int v6 = [v5 isServiceEnabled];

  LOBYTE(v7) = 0;
  if (!v4)
  {
    if (v6)
    {
      int v7 = [MEMORY[0x263F7E198] supportsRelayCalling];
      if (v7) {
        LOBYTE(v7) = [MEMORY[0x263F7E198] supportsPrimaryCalling] ^ 1;
      }
    }
  }
  return v7;
}

- (BOOL)shouldShowSiriSpecifiers
{
  char v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 serviceType];

  BOOL v5 = [(CNFRegListController *)self regController];
  char v6 = [v5 isServiceEnabled];

  if (v4) {
    return 0;
  }
  else {
    return v6;
  }
}

- (BOOL)shouldShowReceiveThumperCalls
{
  char v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 serviceType];

  BOOL v5 = [(CNFRegListController *)self regController];
  int v6 = [v5 isServiceEnabled];

  LOBYTE(v7) = 0;
  if (!v4)
  {
    if (v6)
    {
      int v7 = [MEMORY[0x263F7E198] supportsThumperCalling];
      if (v7) {
        LOBYTE(v7) = [MEMORY[0x263F7E198] supportsPrimaryCalling] ^ 1;
      }
    }
  }
  return v7;
}

- (id)accountToShowInCallerIDFooter
{
  objc_super v2 = [(CNFRegSettingsController *)self _appleIDAccounts];
  char v3 = [v2 firstObject];

  return v3;
}

- (BOOL)refreshiMessageAccountFooterText:(BOOL)a3
{
  uint64_t v4 = (int)*MEMORY[0x263F5FDB8];
  BOOL v5 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) specifierForID:@"FACETIME_CALLERID_GROUP_ID"];
  uint64_t v6 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) specifierForID:@"FACETIME_ALIAS_GROUP_ID"];
  int v7 = (void *)v6;
  if (v5)
  {
    [(CNFRegSettingsController *)self configureAccountFooterForGroupSpecifier:v5];
    [(CNFRegSettingsController *)self clearFooterFromSpecifier:v7];
  }
  else
  {
    if (!v6)
    {
      BOOL v8 = 0;
      goto LABEL_6;
    }
    [(CNFRegSettingsController *)self configureAccountFooterForGroupSpecifier:v6];
  }
  BOOL v8 = 1;
LABEL_6:
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CNFRegSettingsController_refreshiMessageAccountFooterText___block_invoke;
  block[3] = &unk_2644F0868;
  id v12 = v5;
  int v13 = self;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&location);
  return v8;
}

uint64_t __61__CNFRegSettingsController_refreshiMessageAccountFooterText___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) reloadSpecifierID:@"FACETIME_CALLERID_GROUP_ID"];
  }
  objc_super v2 = *(void **)(a1 + 40);
  return [v2 reloadSpecifierID:@"FACETIME_ALIAS_GROUP_ID"];
}

- (void)clearFooterFromSpecifier:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F600C0];
  id v4 = a3;
  [v4 removePropertyForKey:v3];
  [v4 removePropertyForKey:*MEMORY[0x263F600E8]];
}

- (void)configureAccountFooterForGroupSpecifier:(id)a3
{
  id v22 = a3;
  id v4 = [(CNFRegSettingsController *)self accountToShowInCallerIDFooter];
  if (v4)
  {
    int v5 = _os_feature_enabled_impl();
    uint64_t v6 = CommunicationsSetupUIBundle();
    int v7 = CNFRegStringTableName();
    if (v5) {
      BOOL v8 = @"FACETIME_SETTINGS_ALIAS_LABEL_FOOTER_APPLEACCOUNT";
    }
    else {
      BOOL v8 = @"FACETIME_SETTINGS_ALIAS_LABEL_FOOTER";
    }
    id v9 = [v6 localizedStringForKey:v8 value:&stru_26D05D4F8 table:v7];

    uint64_t v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    [v22 setProperty:v11 forKey:*MEMORY[0x263F600C0]];

    id v12 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [v22 setProperty:v12 forKey:*MEMORY[0x263F600E0]];

    int v13 = NSStringFromSelector(sel_accountTappedWithSpecifier_);
    [v22 setProperty:v13 forKey:*MEMORY[0x263F600C8]];

    uint64_t v14 = NSString;
    uint64_t v15 = [v4 loginDisplayString];
    uint64_t v16 = objc_msgSend(v14, "stringWithFormat:", v9, v15);

    [v22 setProperty:v16 forKey:*MEMORY[0x263F600E8]];
    uint64_t v17 = [v4 loginDisplayString];
    NSUInteger v18 = [v16 rangeOfString:v17];
    NSUInteger v20 = v19;

    v24.id location = v18;
    v24.length = v20;
    char v21 = NSStringFromRange(v24);
    [v22 setProperty:v21 forKey:*MEMORY[0x263F600D0]];
  }
  else
  {
    [(CNFRegSettingsController *)self clearFooterFromSpecifier:v22];
  }
}

- (void)configureSignOutForSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = CommunicationsSetupUIBundle();
  int v5 = CNFRegStringTableName();
  uint64_t v6 = [v4 localizedStringForKey:@"FACETIME_ACCOUNT_POPUP_SIGN_OUT" value:&stru_26D05D4F8 table:v5];
  [v3 setName:v6];

  int v7 = CommunicationsSetupUIBundle();
  BOOL v8 = CNFRegStringTableName();
  id v9 = [v7 localizedStringForKey:@"FACETIME_ACCOUNT_POPUP_SIGN_OUT" value:&stru_26D05D4F8 table:v8];
  [v3 setProperty:v9 forKey:*MEMORY[0x263F602D0]];

  uint64_t v10 = [NSNumber numberWithBool:1];
  [v3 setProperty:v10 forKey:*MEMORY[0x263F600A8]];

  [v3 setButtonAction:sel_signoutAccount_];
  NSStringFromSelector(sel_signoutAccount_);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setProperty:v11 forKey:*MEMORY[0x263F5FF70]];
}

- (void)showReceiveRelayCallsSettings:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (a3)
  {
    [(CNFRegSettingsController *)self showSpecifiers:self->_receiveRelayCallsGroupSpecifiers afterGroupId:@"FACETIME_ENABLED_GROUP_ID" animated:a4];
    id v37 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) specifierForID:@"RECEIVE_RELAYED_PHONE_CALLS_GROUP_ID"];
    uint64_t v6 = [MEMORY[0x263F3BB18] sharedInstance];
    int v7 = [v6 isTelephonyDevice];

    if (v7)
    {
      BOOL v8 = CommunicationsSetupUIBundle();
      id v9 = CNFStringKeyForNetwork(@"RELAY_CALLS_HOST_FOOTER");
      uint64_t v10 = CNFRegStringTableName();
      id v11 = [v8 localizedStringForKey:v9 value:&stru_26D05D4F8 table:v10];
LABEL_30:

      [(CNFRegListController *)self _setLabel:v11 forSpecifier:v37 header:0];

      return;
    }
    BOOL v8 = [MEMORY[0x263F7E198] outgoingRelayCallerID];
    uint64_t v17 = [(CNFRegListController *)self regController];
    id v9 = [v17 displayAlias];

    if ([MEMORY[0x263F7E198] isThumperCallingEnabled])
    {
      if (!v8
        || ([v9 alias],
            NSUInteger v18 = objc_claimAutoreleasedReturnValue(),
            char v19 = [v18 isEqualToString:v8],
            v18,
            (v19 & 1) != 0))
      {
        int v20 = [MEMORY[0x263F7E198] supportsThumperCallingOverCellularData];
        uint64_t v10 = CommunicationsSetupUIBundle();
        if (v20) {
          char v21 = @"RELAY_CALLS_CLIENT_FOOTER_THUMPER_CELLULAR";
        }
        else {
          char v21 = @"RELAY_CALLS_CLIENT_FOOTER_THUMPER";
        }
        uint64_t v24 = CNFStringKeyForNetworkAndProduct(v21);
        goto LABEL_22;
      }
      int v27 = [MEMORY[0x263F7E198] supportsThumperCallingOverCellularData];
      BOOL v28 = CommunicationsSetupUIBundle();
      if (v27) {
        uint64_t v29 = @"RELAY_CALLS_CLIENT_FOOTER_WITH_CALLER_ID_THUMPER_CELLULAR_%@";
      }
      else {
        uint64_t v29 = @"RELAY_CALLS_CLIENT_FOOTER_WITH_CALLER_ID_THUMPER_%@";
      }
      int v33 = CNFStringKeyForNetworkAndProduct(v29);
      __int16 v34 = CNFRegStringTableName();
      uint64_t v10 = [v28 localizedStringForKey:v33 value:&stru_26D05D4F8 table:v34];

      uint64_t v30 = NSString;
      long long v25 = CommunicationsSetupUIBundle();
      uint64_t v26 = CNFRegStringTableName();
      uint64_t v31 = v25;
      uint64_t v32 = v10;
    }
    else
    {
      if (!v8
        || ([v9 alias],
            id v22 = objc_claimAutoreleasedReturnValue(),
            char v23 = [v22 isEqualToString:v8],
            v22,
            (v23 & 1) != 0))
      {
        uint64_t v10 = CommunicationsSetupUIBundle();
        uint64_t v24 = CNFStringKeyForNetwork(@"RELAY_CALLS_CLIENT_FOOTER");
LABEL_22:
        long long v25 = (void *)v24;
        uint64_t v26 = CNFRegStringTableName();
        id v11 = [v10 localizedStringForKey:v25 value:&stru_26D05D4F8 table:v26];
LABEL_29:

        goto LABEL_30;
      }
      uint64_t v30 = NSString;
      uint64_t v10 = CommunicationsSetupUIBundle();
      long long v25 = CNFStringKeyForNetwork(@"RELAY_CALLS_CLIENT_FOOTER_WITH_CALLER_ID_%@");
      uint64_t v26 = CNFRegStringTableName();
      uint64_t v31 = v10;
      uint64_t v32 = v25;
    }
    uint64_t v35 = [v31 localizedStringForKey:v32 value:&stru_26D05D4F8 table:v26];
    uint64_t v36 = CNFRegFormattedPhoneNumberForString(v8);
    id v11 = objc_msgSend(v30, "stringWithFormat:", v35, v36);

    goto LABEL_29;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = self->_receiveRelayCallsGroupSpecifiers;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v12);
        }
        [(CNFRegSettingsController *)self removeSpecifier:*(void *)(*((void *)&v38 + 1) + 8 * i) animated:v4];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v14);
  }
}

- (void)refreshReceiveRelayCallsSettingsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = self->_receiveRelayCallsGroupSpecifiers;
  if (v5)
  {
    uint64_t v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Refreshing receive relay calls settings", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    if ([(CNFRegSettingsController *)self shouldShowReceiveRelayCalls])
    {
      [(CNFRegSettingsController *)self showReceiveRelayCallsSettings:1 animated:v3];
      if ([(CNFRegSettingsController *)self shouldShowReceiveThumperCalls]) {
        [(CNFRegSettingsController *)self removeSpecifierID:@"RECEIVE_RELAYED_PHONE_CALLS_ID" animated:v3];
      }
      [(CNFRegSettingsController *)self reloadSpecifierID:@"RECEIVE_RELAYED_PHONE_CALLS_ID" animated:v3];
    }
    else
    {
      [(CNFRegSettingsController *)self showReceiveRelayCallsSettings:0 animated:v3];
    }
  }
}

- (void)showAllSettings:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[CNFRegSettingsController showAccounts:animated:](self, "showAccounts:animated:");
  [(CNFRegSettingsController *)self showAliases:v5 animated:v4];
  [(CNFRegSettingsController *)self showCallerId:v5 animated:v4];
}

- (id)getAccountNameForSpecifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 CNFRegAccount];

  if (v4)
  {
    BOOL v5 = [v3 CNFRegAccount];
    uint64_t v6 = [v5 loginDisplayString];
  }
  else
  {
    uint64_t v6 = &stru_26D05D4F8;
  }

  return v6;
}

- (void)_showAccountAlertForAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = CommunicationsSetupUIBundle();
    uint64_t v6 = CNFRegStringTableName();
    uint64_t v24 = [v5 localizedStringForKey:@"FACETIME_ACCOUNT_POPUP_TITLE" value:&stru_26D05D4F8 table:v6];

    char v23 = [v4 loginDisplayString];
    int v7 = CommunicationsSetupUIBundle();
    BOOL v8 = CNFRegStringTableName();
    id v22 = [v7 localizedStringForKey:@"FACETIME_ALERT_CANCEL" value:&stru_26D05D4F8 table:v8];

    id v9 = [MEMORY[0x263F82418] alertControllerWithTitle:v24 message:v23 preferredStyle:1];
    uint64_t v10 = [MEMORY[0x263F82400] actionWithTitle:v22 style:1 handler:0];
    [v9 addAction:v10];

    id v11 = CommunicationsSetupUIBundle();
    id v12 = CNFRegStringTableName();
    uint64_t v13 = [v11 localizedStringForKey:@"FACETIME_ACCOUNT_POPUP_EDIT_LOCATION" value:&stru_26D05D4F8 table:v12];

    uint64_t v14 = (void *)MEMORY[0x263F82400];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __56__CNFRegSettingsController__showAccountAlertForAccount___block_invoke;
    v27[3] = &unk_2644F0A80;
    v27[4] = self;
    id v15 = v4;
    id v28 = v15;
    uint64_t v16 = [v14 actionWithTitle:v13 style:0 handler:v27];
    [v9 addAction:v16];

    uint64_t v17 = CommunicationsSetupUIBundle();
    NSUInteger v18 = CNFRegStringTableName();
    char v19 = [v17 localizedStringForKey:@"FACETIME_ACCOUNT_POPUP_SIGN_OUT" value:&stru_26D05D4F8 table:v18];

    int v20 = (void *)MEMORY[0x263F82400];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __56__CNFRegSettingsController__showAccountAlertForAccount___block_invoke_2;
    v25[3] = &unk_2644F0A80;
    v25[4] = self;
    id v26 = v15;
    char v21 = [v20 actionWithTitle:v19 style:0 handler:v25];
    [v9 addAction:v21];

    [(CNFRegSettingsController *)self presentViewController:v9 animated:1 completion:0];
  }
}

uint64_t __56__CNFRegSettingsController__showAccountAlertForAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showLocaleChooserWithAccount:*(void *)(a1 + 40)];
}

void __56__CNFRegSettingsController__showAccountAlertForAccount___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) regController];
  [v2 signoutAccount:*(void *)(a1 + 40)];
}

- (void)accountTappedWithSpecifier:(id)a3
{
  if ([(CNFRegSettingsController *)self _shouldDisableAccountConfigurationUI])
  {
    [(CNFRegSettingsController *)self refreshFaceTimeSettingsAnimated:0];
  }
  else
  {
    id v6 = [(CNFRegSettingsController *)self accountToShowInCallerIDFooter];
    id v4 = [(CNFRegListController *)self regController];
    int v5 = [v4 accountStateForAccount:v6];

    if (v6 && (v5 & 0x40000000) != 0) {
      [(CNFRegSettingsController *)self _showAccountAlertForAccount:v6];
    }
    else {
      [(CNFRegSettingsController *)self _showSignInController];
    }
  }
}

- (void)signoutAccount:(id)a3
{
  id v5 = [(CNFRegSettingsController *)self accountToShowInCallerIDFooter];
  id v4 = [(CNFRegListController *)self regController];
  [v4 signoutAccount:v5];
}

- (id)accountSpecifiers
{
  NSUInteger v3 = [(NSArray *)self->_accountGroupSpecifiers count] - 1;
  accountGroupSpecifiers = self->_accountGroupSpecifiers;
  return -[NSArray subarrayWithRange:](accountGroupSpecifiers, "subarrayWithRange:", 1, v3);
}

- (void)_reloadSpecifier:(id)a3 withBlock:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, id))a4;
  if (v7)
  {
    if (v6) {
      v6[2](v6, v7);
    }
    [(CNFRegSettingsController *)self reloadSpecifier:v7];
  }
}

- (id)_specifierIdentifierForAccount:(id)a3
{
  if (a3)
  {
    NSUInteger v3 = [a3 login];
    if (v3)
    {
      id v4 = [@"account:" stringByAppendingString:v3];
    }
    else
    {
      id v5 = [NSString stringWithFormat:@"%@", 0];
      id v4 = [@"account:" stringByAppendingString:v5];
    }
  }
  else
  {
    id v4 = @"empty-account";
  }
  return v4;
}

- (id)createSpecifierForAccount:(id)a3
{
  id v4 = a3;
  int v5 = _os_feature_enabled_impl();
  id v6 = CommunicationsSetupUIBundle();
  id v7 = CNFRegStringTableName();
  BOOL v8 = @"FACETIME_SETTINGS_ACCOUNT_LABEL";
  if (v5) {
    BOOL v8 = @"FACETIME_SETTINGS_ACCOUNT_LABEL_APPLEACCOUNT";
  }
  id v9 = @"FACETIME_ACCOUNT_INFO_UNAVAILABLE_APPLEACCOUNT";
  if (!v5) {
    id v9 = @"FACETIME_ACCOUNT_INFO_UNAVAILABLE";
  }
  if (v4) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v9;
  }
  id v11 = [v6 localizedStringForKey:v10 value:&stru_26D05D4F8 table:v7];

  uint64_t v12 = objc_opt_class();
  uint64_t v13 = [(CNFRegSettingsController *)self _specifierIdentifierForAccount:v4];
  uint64_t v14 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v11 target:self set:0 get:sel_getAccountNameForSpecifier_ detail:0 cell:2 edit:0];
  [v14 setButtonAction:sel_accountTappedWithSpecifier_];
  id v15 = NSStringFromSelector(sel_accountTappedWithSpecifier_);
  [v14 setProperty:v15 forKey:*MEMORY[0x263F5FF70]];

  [v14 setProperty:v12 forKey:*MEMORY[0x263F5FFE0]];
  [v14 setProperty:v11 forKey:*MEMORY[0x263F602D0]];
  uint64_t v16 = [NSNumber numberWithInt:0];
  [v14 setProperty:v16 forKey:*MEMORY[0x263F5FEF0]];

  uint64_t v17 = [NSNumber numberWithBool:1];
  [v14 setProperty:v17 forKey:*MEMORY[0x263F600A8]];

  [v14 setProperty:v4 forKey:@"cnfreg-account"];
  [v14 setProperty:v13 forKey:*MEMORY[0x263F60138]];

  return v14;
}

- (void)refreshAccountsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v61 = *MEMORY[0x263EF8340];
  if (![(CNFRegSettingsController *)self hideAppleIDLogin])
  {
    BOOL v5 = [(CNFRegSettingsController *)self refreshiMessageAccountFooterText:v3];
    id v6 = [(CNFRegSettingsController *)self accountToShowInCallerIDFooter];
    long long v49 = [(CNFRegSettingsController *)self accountSpecifiers];
    id v7 = (void *)[v49 mutableCopy];
    BOOL v8 = v7;
    if (v6) {
      int v9 = v5;
    }
    else {
      int v9 = 1;
    }
    uint64_t v10 = [v7 count];
    uint64_t v11 = v10;
    if (v9 == 1)
    {
      if (v10)
      {
        uint64_t v12 = (void *)[v8 copy];
        [v8 removeAllObjects];
        if (v6) {
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v12 = 0;
        if (v6) {
          goto LABEL_13;
        }
      }
      if ([v8 count])
      {
LABEL_13:
        if (v11)
        {
          long long v48 = v12;
          uint64_t v13 = 0;
LABEL_18:
          id location = (id *)&self->_accountGroupSpecifiers;
          long long v47 = [(NSArray *)self->_accountGroupSpecifiers objectAtIndex:0];
          id v15 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = [(CNFRegListController *)self specifiers];
            id v17 = [(CNFRegSettingsController *)self _makeRedactedIdentifiersFromSpecifiers:v16];
            id v18 = [(CNFRegSettingsController *)self _makeRedactedIdentifiersFromSpecifiers:v48];
            char v19 = [(CNFRegSettingsController *)self _makeRedactedIdentifiersFromSpecifiers:v13];
            *(_DWORD *)buf = 138412802;
            id v56 = v17;
            __int16 v57 = 2112;
            id v58 = v18;
            __int16 v59 = 2112;
            char v60 = v19;
            _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "CNFRegSettingsController: before batch updates: current: %@, removed: %@, added: %@", buf, 0x20u);
          }
          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            int v20 = [(CNFRegListController *)self specifiers];
            char v21 = [(CNFRegSettingsController *)self _makeRedactedIdentifiersFromSpecifiers:v20];
            id v22 = [(CNFRegSettingsController *)self _makeRedactedIdentifiersFromSpecifiers:v48];
            [(CNFRegSettingsController *)self _makeRedactedIdentifiersFromSpecifiers:v13];
            long long v44 = v42 = v22;
            long long v40 = v21;
            IMLogString();
          }
          [(CNFRegSettingsController *)self beginUpdates];
          if (v48)
          {
            char v23 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = [(CNFRegSettingsController *)self _makeRedactedIdentifiersFromSpecifiers:*location];
              *(_DWORD *)buf = 138412290;
              id v56 = v24;
              _os_log_impl(&dword_21ED18000, v23, OS_LOG_TYPE_DEFAULT, "CNFRegSettingsController: removing via removeContiguousSpecifiers %@", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              long long v41 = [(CNFRegSettingsController *)self _makeRedactedIdentifiersFromSpecifiers:*location];
              IMLogString();
            }
            -[CNFRegSettingsController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", *location, v3, v41);
          }
          if (v13)
          {
            long long v25 = [(CNFRegSettingsController *)self specifierForID:@"FACETIME_CALLERID_GROUP_ID"];
            id v26 = @"FACETIME_ALIAS_GROUP_ID";
            if (v25) {
              id v26 = @"FACETIME_CALLERID_GROUP_ID";
            }
            int v27 = v26;

            [v13 insertObject:v47 atIndex:0];
            id v28 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              id v29 = [(CNFRegSettingsController *)self _makeRedactedIdentifiersFromSpecifiers:v13];
              uint64_t v30 = [(CNFRegSettingsController *)self _makeRedactedIdentifierFromSpecifierId:v27];
              *(_DWORD *)buf = 138412802;
              id v56 = v29;
              __int16 v57 = 2112;
              id v58 = v30;
              __int16 v59 = 1024;
              LODWORD(v60) = v3;
              _os_log_impl(&dword_21ED18000, v28, OS_LOG_TYPE_DEFAULT, "CNFRegSettingsController: adding via showSpecifiers %@ afterGroupId %@ animated %d", buf, 0x1Cu);
            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              uint64_t v31 = [(CNFRegSettingsController *)self _makeRedactedIdentifiersFromSpecifiers:v13];
              uint64_t v43 = [(CNFRegSettingsController *)self _makeRedactedIdentifierFromSpecifierId:v27];
              BOOL v45 = v3;
              long long v41 = v31;
              IMLogString();
            }
            -[CNFRegSettingsController showSpecifiers:afterGroupId:animated:](self, "showSpecifiers:afterGroupId:animated:", v13, v27, v3, v41, v43, v45);
          }
          [(CNFRegSettingsController *)self endUpdates];
          uint64_t v32 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            int v33 = [(CNFRegListController *)self specifiers];
            __int16 v34 = [(CNFRegSettingsController *)self _makeRedactedIdentifiersFromSpecifiers:v33];
            *(_DWORD *)buf = 138412290;
            id v56 = v34;
            _os_log_impl(&dword_21ED18000, v32, OS_LOG_TYPE_DEFAULT, "CNFRegSettingsController: after batch updates: current: %@", buf, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            uint64_t v35 = [(CNFRegListController *)self specifiers];
            long long v41 = [(CNFRegSettingsController *)self _makeRedactedIdentifiersFromSpecifiers:v35];
            IMLogString();
          }
          objc_msgSend(v8, "insertObject:atIndex:", v47, 0, v41);
          objc_storeStrong(location, v8);

          if (v13)
          {
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v36 = v13;
            uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v54 count:16];
            if (v37)
            {
              uint64_t v38 = *(void *)v51;
              do
              {
                for (uint64_t i = 0; i != v37; ++i)
                {
                  if (*(void *)v51 != v38) {
                    objc_enumerationMutation(v36);
                  }
                  [(CNFRegSettingsController *)self reloadSpecifier:*(void *)(*((void *)&v50 + 1) + 8 * i)];
                }
                uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v54 count:16];
              }
              while (v37);
            }
          }
          uint64_t v12 = v48;
        }
LABEL_54:

        return;
      }
      long long v48 = v12;
      uint64_t v14 = [(CNFRegSettingsController *)self createSpecifierForAccount:0];
      [v8 addObject:v14];
      uint64_t v13 = [MEMORY[0x263EFF980] array];
      [v13 addObject:v14];
    }
    else
    {
      if (v10)
      {
        uint64_t v12 = 0;
        goto LABEL_54;
      }
      uint64_t v14 = [(CNFRegSettingsController *)self createSpecifierForAccount:v6];
      [v8 addObject:v14];
      uint64_t v13 = [MEMORY[0x263EFF980] array];
      [v13 addObject:v14];
      long long v48 = 0;
    }

    goto LABEL_18;
  }
}

- (BOOL)showAccounts:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    -[CNFRegSettingsController refreshAccountsAnimated:](self, "refreshAccountsAnimated:", 1, a4);
  }
  else
  {
    [(CNFRegSettingsController *)self removeContiguousSpecifiers:self->_accountGroupSpecifiers animated:a4];
    uint64_t v5 = (int)*MEMORY[0x263F5FDB8];
    id v6 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v5) specifierForID:@"FACETIME_CALLERID_GROUP_ID"];
    id v7 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v5) specifierForID:@"FACETIME_ALIAS_GROUP_ID"];
    [(CNFRegSettingsController *)self clearFooterFromSpecifier:v6];
    [(CNFRegSettingsController *)self clearFooterFromSpecifier:v7];
    [(CNFRegSettingsController *)self reloadSpecifier:v6];
    [(CNFRegSettingsController *)self reloadSpecifier:v7];
  }
  return 1;
}

- (void)firstRunControllerDidFinish:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "First run controller finished", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  BOOL v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(CNFRegSettingsController *)self navigationController];
    uint64_t v10 = [v9 visibleViewController];
    *(_DWORD *)buf = 138412290;
    char v21 = v10;
    _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Visible controller: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v11 = [(CNFRegSettingsController *)self navigationController];
    char v19 = [v11 visibleViewController];
    IMLogString();
  }
  uint64_t v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [(CNFRegSettingsController *)self presentedViewController];
    *(_DWORD *)buf = 138412290;
    char v21 = v13;
    _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "Presented view controller: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    char v19 = [(CNFRegSettingsController *)self presentedViewController];
    IMLogString();
  }
  uint64_t v14 = [(CNFRegSettingsController *)self navigationController];
  id v15 = [v14 visibleViewController];
  BOOL v16 = v15 == self;

  if (!v16)
  {
    id v17 = [(CNFRegSettingsController *)self presentedViewController];
    [v17 dismiss];
  }
  [v6 setDelegate:0];
  if (v4)
  {
    id v18 = [NSNumber numberWithBool:1];
    [(CNFRegSettingsController *)self setFaceTimeEnabled:v18 specifier:0];
  }
}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    id v17 = [v11 objectForKey:*MEMORY[0x263F29010]];
    uint64_t v18 = [v11 objectForKey:*MEMORY[0x263F28FF0]];
    char v19 = (void *)v18;
    BOOL v16 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    if (v17) {
      BOOL v20 = v18 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    if (v20) {
      goto LABEL_40;
    }
    char v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_21ED18000, v21, OS_LOG_TYPE_DEFAULT, "Obtained user/pass from AuthKit.", v37, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    uint64_t v22 = [(CNFRegListController *)self regController];
    uint64_t v23 = [v22 serviceType];

    if (v23)
    {
      if (v23 == 1)
      {
        uint64_t v24 = [MEMORY[0x263F4A610] iMessageService];
LABEL_27:
        long long v25 = (void *)v24;
        if (v24)
        {
          dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
          id v26 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v37 = 138412290;
            uint64_t v38 = v25;
            _os_log_impl(&dword_21ED18000, v26, OS_LOG_TYPE_DEFAULT, "Registering for service: %@", v37, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
            IMLogString();
          }
          int v27 = [CNFAccountRegistrar alloc];
          id v28 = [(CNFRegListController *)self regController];
          id v29 = -[CNFAccountRegistrar initWithServiceType:presentationViewController:](v27, "initWithServiceType:presentationViewController:", [v28 serviceType], self);

          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __110__CNFRegSettingsController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke;
          v34[3] = &unk_2644F0AA8;
          p_long long buf = &buf;
          v34[4] = self;
          uint64_t v30 = v33;
          uint64_t v35 = v30;
          [(CNFAccountRegistrar *)v29 registerAccountWithUsername:v17 password:v19 service:v25 completionBlock:v34];
          dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);

LABEL_39:
          BOOL v16 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
LABEL_40:
          _Block_object_dispose(&buf, 8);

          goto LABEL_41;
        }
LABEL_34:
        uint64_t v31 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v37 = 0;
          _os_log_impl(&dword_21ED18000, v31, OS_LOG_TYPE_DEFAULT, "Couldn't determine a service from the regController.", v37, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          IMLogString();
        }
        goto LABEL_39;
      }
      if (v23 != 2) {
        goto LABEL_34;
      }
    }
    uint64_t v24 = [MEMORY[0x263F4A610] facetimeService];
    goto LABEL_27;
  }
  uint64_t v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "AuthKit had an error authenticating: %@", (uint8_t *)&buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  id v15 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "NOT registering.", (uint8_t *)&buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  BOOL v16 = 0;
LABEL_41:

  return v16;
}

void __110__CNFRegSettingsController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Successfully registered.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (v5)
  {
    BOOL v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Failed registration. Showing alert.", v9, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [*(id *)(a1 + 32) dismissModalViewControllerWithTransition:0];
    [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_showSignInController
{
  id v3 = objc_alloc_init(MEMORY[0x263F292A8]);
  [v3 setPresentingViewController:self];
  int v4 = _os_feature_enabled_impl();
  id v5 = CommunicationsSetupUIBundle();
  id v6 = CNFRegStringTableName();
  if (v4) {
    id v7 = @"FACETIME_SIGNIN_SETTINGS_BLURB_APPLEACCOUNT";
  }
  else {
    id v7 = @"FACETIME_SIGNIN_SETTINGS_BLURB";
  }
  BOOL v8 = [v5 localizedStringForKey:v7 value:&stru_26D05D4F8 table:v6];
  [v3 setReason:v8];

  [v3 setShouldForceInteractiveAuth:1];
  int v9 = [(CNFRegListController *)self regController];
  uint64_t v10 = [v9 serviceType];

  if (v10 == 1) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = 5;
  }
  [v3 setServiceType:v11];
  id v12 = (unsigned int (*)(void))CUTWeakLinkSymbol();
  if (v12 && v12()) {
    [v3 setIsUsernameEditable:0];
  }
  id v13 = [(CNFRegSettingsController *)self primaryAppleAccount];
  uint64_t v14 = [v13 username];
  if ([v14 length])
  {
    [v3 setUsername:v14];
    [v3 setReason:v14];
    [v3 setShouldForceInteractiveAuth:0];
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  BOOL v20 = __Block_byref_object_copy__0;
  char v21 = __Block_byref_object_dispose__0;
  id v22 = objc_alloc_init(MEMORY[0x263F29118]);
  [(id)v18[5] setDelegate:self];
  id v15 = (void *)v18[5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__CNFRegSettingsController__showSignInController__block_invoke;
  v16[3] = &unk_2644F0AD0;
  v16[4] = &v17;
  [v15 authenticateWithContext:v3 completion:v16];
  _Block_object_dispose(&v17, 8);
}

void __49__CNFRegSettingsController__showSignInController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Error getting credentials using AuthKit: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
}

- (id)primaryAppleAccount
{
  id v2 = (void *)MEMORY[0x223C3A7C0](self, a2);
  id v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  id v4 = objc_msgSend(v3, "aa_primaryAppleAccount");

  return v4;
}

- (void)_showViewAccountControllerForAccount:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "_showViewAccountControllerForAccount: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  if (v4)
  {
    id v6 = +[CNFRegAppearanceController globalAppearanceController];
    id v7 = [CNFRegViewAccountController alloc];
    id v8 = [(CNFRegListController *)self regController];
    uint64_t v9 = [(CNFRegSecureAccountWebViewController *)v7 initWithRegController:v8 account:v4];

    [(CNFRegViewAccountController *)v9 setDelegate:self];
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v9];
    objc_msgSend(v10, "setModalPresentationStyle:", objc_msgSend(v6, "modalPresentationStyle"));
    uint64_t v11 = [v6 navigationBarStyle];
    id v12 = [v10 navigationBar];
    [v12 setBarStyle:v11];

    uint64_t v13 = [v6 navigationBarIsTranslucent];
    uint64_t v14 = [v10 navigationBar];
    [v14 setTranslucent:v13];

    [(CNFRegSettingsController *)self _tearDownAllListeners];
    [(CNFRegSettingsController *)self presentViewController:v10 animated:1 completion:0];
  }
}

- (void)_hideLocaleChooser
{
  id v3 = [(CNFRegSettingsController *)self navigationController];
  id v4 = [v3 visibleViewController];

  if (v4 != self)
  {
    id v5 = [(CNFRegSettingsController *)self presentedViewController];
    [v5 dismiss];
  }
}

- (id)_localeChooserForAccount:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F5FC30];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setParentController:self];
  id v7 = [(CNFRegSettingsController *)self rootController];
  [v6 setRootController:v7];

  id v8 = [CNFRegLocaleController alloc];
  uint64_t v9 = [(CNFRegListController *)self regController];
  uint64_t v10 = [(CNFRegFirstRunController *)v8 initWithRegController:v9 account:v5];

  uint64_t v11 = [(CNFRegSettingsController *)self specifier];
  [(CNFRegFirstRunController *)v10 setSpecifier:v11];

  [(CNFRegFirstRunController *)v10 setDelegate:self];
  [(CNFRegLocaleController *)v10 setRootController:v6];
  [(CNFRegLocaleController *)v10 setParentController:v6];
  [(CNFRegFirstRunController *)v10 setCompletionControllerClass:0];
  id v12 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v6 action:sel_dismiss];
  [(CNFRegFirstRunController *)v10 setCustomLeftButton:v12];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:3 target:0 action:0];
  [(CNFRegFirstRunController *)v10 setCustomRightButton:v13];
  uint64_t v14 = [v6 view];
  [v14 setClipsToBounds:1];

  v17[0] = v10;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [v6 setViewControllers:v15];

  return v6;
}

- (void)_showLocaleChooserWithAccount:(id)a3
{
  id v5 = a3;
  if (![(CNFRegListController *)self _showWiFiAlertIfNecessary])
  {
    id v4 = [(CNFRegSettingsController *)self _localeChooserForAccount:v5];
    if (v4) {
      [(CNFRegSettingsController *)self showController:v4 animate:1];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)viewAccountControllerDidFinish:(id)a3 withAppleId:(id)a4
{
  objc_msgSend(a3, "setDelegate:", 0, a4);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__CNFRegSettingsController_viewAccountControllerDidFinish_withAppleId___block_invoke;
  v5[3] = &unk_2644F04A0;
  v5[4] = self;
  [(CNFRegSettingsController *)self dismissViewControllerAnimated:1 completion:v5];
}

uint64_t __71__CNFRegSettingsController_viewAccountControllerDidFinish_withAppleId___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupAllListeners];
  id v2 = *(void **)(a1 + 32);
  return [v2 _updateControllerStateAnimated:1];
}

- (void)clearAccountCache
{
  self->_addresses = 0;
  MEMORY[0x270F9A758]();
}

- (id)aliasSpecifiers
{
  NSUInteger v3 = [(NSArray *)self->_aliasGroupSpecifiers count] - 1;
  aliasGroupSpecifiers = self->_aliasGroupSpecifiers;
  return -[NSArray subarrayWithRange:](aliasGroupSpecifiers, "subarrayWithRange:", 1, v3);
}

- (BOOL)_shouldShowAliasInfo
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  NSUInteger v3 = [(CNFRegSettingsController *)self _appleIDAccounts];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 1;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(CNFRegListController *)self regController];
  id v7 = [v6 phoneAccounts];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) CNFRegSignInComplete])
        {
          char v5 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v7 = [(CNFRegListController *)self regController];
  char v5 = [v7 serviceSupportsDeviceAliasEnablement];
LABEL_13:

  return v5;
}

- (void)refreshAliasesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v69 = *MEMORY[0x263EF8340];
  if ([(CNFRegSettingsController *)self _shouldShowAliasInfo])
  {
    SEL v47 = a2;
    BOOL v48 = v3;
    [(CNFRegSettingsController *)self showAliases:1 animated:v3];
    long long v54 = self;
    long long v49 = [(CNFRegSettingsController *)self _useableAccounts];
    id v6 = [(CNFRegListController *)self regController];
    long long v50 = [v6 allAvailableAliasesForAccounts:v49];

    unint64_t v51 = [v50 count];
    if (_CNFRegShouldLog())
    {
      id v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Refreshing alias specifiers for accounts:", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      obuint64_t j = v49;
      uint64_t v8 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v60 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            id v12 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              long long v13 = CNFRegStringForAccount(v11);
              *(_DWORD *)long long buf = 138412290;
              uint64_t v67 = v13;
              _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "  => Account: %@", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              long long v46 = CNFRegStringForAccount(v11);
              IMLogString();
            }
            long long v14 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              long long v15 = [(CNFRegListController *)v54 regController];
              uint64_t v65 = v11;
              long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v65 count:1];
              uint64_t v17 = [v15 allAvailableAliasesForAccounts:v16];
              *(_DWORD *)long long buf = 138412290;
              uint64_t v67 = v17;
              _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "    => Aliases: %@", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              uint64_t v18 = [(CNFRegListController *)v54 regController];
              v64 = v11;
              uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
              long long v46 = [v18 allAvailableAliasesForAccounts:v19];
              IMLogString();
            }
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
        }
        while (v8);
      }

      BOOL v20 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        char v21 = [(CNFRegListController *)v54 regController];
        id v22 = [v21 usableDeviceAliases];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v67 = v22;
        _os_log_impl(&dword_21ED18000, v20, OS_LOG_TYPE_DEFAULT, "All device aliases: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        uint64_t v23 = [(CNFRegListController *)v54 regController];
        long long v46 = [v23 usableDeviceAliases];
        IMLogString();
      }
      uint64_t v24 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v67 = v50;
        _os_log_impl(&dword_21ED18000, v24, OS_LOG_TYPE_DEFAULT, "All aliases: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        long long v46 = v50;
        IMLogString();
      }
    }
    long long v53 = [(CNFRegSettingsController *)v54 aliasSpecifiers];
    long long v25 = (void *)[v53 mutableCopy];
    unint64_t v26 = [v25 count];
    BOOL v27 = v26 > v51;
    if (v26 > v51)
    {
      unint64_t v28 = [v25 count] - v51;
      uint64_t v30 = objc_msgSend(v25, "subarrayWithRange:");
      objc_msgSend(v25, "removeObjectsInRange:", v51, v28);
      uint64_t v29 = 1;
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v30 = 0;
    }
    if ([v25 count] > v51)
    {
      BOOL v45 = [MEMORY[0x263F08690] currentHandler];
      [v45 handleFailureInMethod:v47 object:v54 file:@"CNFRegSettingsController.m" lineNumber:2207 description:@"More specifiers than aliases"];
    }
    uint64_t v31 = [v25 count];
    if (v51)
    {
      unint64_t v32 = v31;
      unint64_t v33 = 0;
      id v34 = 0;
      uint64_t v35 = 0;
      do
      {
        id v36 = [v50 objectAtIndex:v33];
        if (v33 >= v32)
        {
          if (v30)
          {
            long long v39 = [MEMORY[0x263F08690] currentHandler];
            [v39 handleFailureInMethod:v47 object:v54 file:@"CNFRegSettingsController.m" lineNumber:2219 description:@"Creating new specifiers when we just deleted some. Shameful."];
          }
          id v38 = [(CNFRegSettingsController *)v54 createSpecifierForAlias:v36];
          [v25 addObject:v38];
          if (!v35)
          {
            uint64_t v35 = [MEMORY[0x263EFF980] array];
            ++v29;
          }
          [v35 addObject:v38];
          BOOL v27 = 1;
        }
        else
        {
          uint64_t v37 = [v25 objectAtIndex:v33];
          [(CNFRegSettingsController *)v54 updateSpecifier:v37 withAlias:v36];
          id v38 = v37;

          id v34 = v38;
        }

        ++v33;
      }
      while (v51 != v33);
    }
    else
    {
      uint64_t v35 = 0;
      id v34 = 0;
    }
    if (v29)
    {
      uint64_t v40 = [(NSArray *)v54->_aliasGroupSpecifiers objectAtIndex:0];
      if (v29 != 1) {
        [(CNFRegSettingsController *)v54 beginUpdates];
      }
      if (v30) {
        [(CNFRegSettingsController *)v54 removeContiguousSpecifiers:v30 animated:v48];
      }
      if (v35)
      {
        if (!v34) {
          id v34 = v40;
        }
        [(CNFRegSettingsController *)v54 insertContiguousSpecifiers:v35 afterSpecifier:v34 animated:v48];
      }
      if (v29 != 1) {
        [(CNFRegSettingsController *)v54 endUpdates];
      }
      if (v27)
      {
        [v25 insertObject:v40 atIndex:0];
        objc_storeStrong((id *)&v54->_aliasGroupSpecifiers, v25);
      }
    }
    if (v35)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v41 = v35;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v42; ++j)
          {
            if (*(void *)v56 != v43) {
              objc_enumerationMutation(v41);
            }
            [(CNFRegSettingsController *)v54 reloadSpecifier:*(void *)(*((void *)&v55 + 1) + 8 * j)];
          }
          uint64_t v42 = [v41 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v42);
      }
    }
  }
  else
  {
    [(CNFRegSettingsController *)self showAliases:0 animated:v3];
  }
}

- (void)refreshAliasSpecifier:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__CNFRegSettingsController_refreshAliasSpecifier___block_invoke;
  v3[3] = &unk_2644F0AF8;
  v3[4] = self;
  [(CNFRegSettingsController *)self _reloadSpecifier:a3 withBlock:v3];
}

void __50__CNFRegSettingsController_refreshAliasSpecifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  BOOL v3 = a2;
  uint64_t v4 = [v3 CNFRegAlias];
  char v5 = [v4 displayName];
  uint64_t v6 = objc_opt_class();
  if (([v4 isPhoneNumberAliasOnPhoneNumberAccount] & 1) != 0
    || [v4 isDeviceAlias])
  {
    id v7 = [v4 account];
    uint64_t v8 = [v7 registrationStatus];
    uint64_t v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v32 = (uint64_t)v7;
      __int16 v33 = 2048;
      uint64_t v34 = v8;
      _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "refreshAliasSpecifier phone number account: [%@], registrationStatus: [%ld]", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      uint64_t v29 = v7;
      uint64_t v30 = v8;
      IMLogString();
    }
    if (v8 == -1)
    {
      uint64_t v11 = 1;
    }
    else
    {
      uint64_t v10 = [*(id *)(a1 + 32) regController];
      if ([v10 serviceSupportsDeviceAliasEnablement]) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = [v4 isTemporaryPhoneNumberAlias];
      }
    }
    BOOL v14 = v8 >= 0 && v8 != 5 && v7 != 0;
    if (v7) {
      unsigned int v15 = 0;
    }
    else {
      unsigned int v15 = [v4 isSelectedDeviceAlias];
    }
    long long v16 = objc_msgSend(NSNumber, "numberWithBool:", v14 | v15, v29, v30);
    [v3 setProperty:v16 forKey:@"cnfreg-alias-spinning"];
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) _canDeselectAlias:v4];
  }
  uint64_t v17 = [v4 validationStatus];
  uint64_t v18 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v32 = v17;
    _os_log_impl(&dword_21ED18000, v18, OS_LOG_TYPE_DEFAULT, "refreshAliasSpecifier account validationStatus is: [%ld]", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v29 = (void *)v17;
    IMLogString();
  }
  uint64_t v19 = 0;
  if ((unint64_t)(v17 + 1) <= 3 && v17 != 1) {
    uint64_t v19 = sel_statusForSpecifier_;
  }
  objc_storeWeak((id *)&v3[*MEMORY[0x263F5FE40]], *(id *)(a1 + 32));
  *(void *)&v3[*MEMORY[0x263F5FE10]] = 2;
  [v3 setProperty:v5 forKey:*MEMORY[0x263F602D0]];
  [v3 setName:v5];
  [v3 setProperty:v6 forKey:*MEMORY[0x263F5FFE0]];
  [v3 setButtonAction:sel_setAliasSelected_];
  BOOL v20 = NSStringFromSelector(sel_setAliasSelected_);
  [v3 setProperty:v20 forKey:*MEMORY[0x263F5FF70]];

  *(void *)&v3[*MEMORY[0x263F5FE28]] = v19;
  char v21 = NSStringFromSelector(v19);
  [v3 setProperty:v21 forKey:*MEMORY[0x263F60110]];

  id v22 = [v4 identifier];
  [v3 setProperty:v22 forKey:*MEMORY[0x263F60138]];

  uint64_t v23 = [NSNumber numberWithInt:0];
  [v3 setProperty:v23 forKey:*MEMORY[0x263F5FEF0]];

  uint64_t v24 = [NSNumber numberWithBool:v11];
  [v3 setProperty:v24 forKey:*MEMORY[0x263F600A8]];

  long long v25 = [v4 account];
  if (!v25) {
    goto LABEL_41;
  }
  unint64_t v26 = [v4 account];
  int v27 = [v26 CNFRegSignInComplete];

  if (!v27 || (unint64_t)(v17 - 1) < 2) {
    goto LABEL_41;
  }
  if (v17 == 3)
  {
    unint64_t v28 = [NSNumber numberWithBool:1];
    [v3 setProperty:v28 forKey:@"cnfreg-alias-checked"];

    goto LABEL_42;
  }
  if (v17 == -1) {
LABEL_41:
  }
    objc_msgSend(v3, "removePropertyForKey:", @"cnfreg-alias-checked", v29);
LABEL_42:
  objc_msgSend(*(id *)(a1 + 32), "_setSpecifierEnabled:enabled:animated:", v3, v11, 1, v29);
}

- (void)refreshAllAliasSpecifiers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "CNFRegAlias", (void)v10);

        if (v9) {
          [(CNFRegSettingsController *)self refreshAliasSpecifier:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)updateSpecifier:(id)a3 withAlias:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [v8 CNFRegAlias];

    if (v7 != v6)
    {
      [v8 setCNFRegAlias:v6];
      [v8 removePropertyForKey:@"cnfreg-alias-checked"];
    }
    [(CNFRegSettingsController *)self refreshAliasSpecifier:v8];
  }
}

- (void)refreshTemporaryPhoneAnimated:(BOOL)a3
{
  BOOL v42 = a3;
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Refreshing temporary phone settings", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v5 = [(CNFRegListController *)self regController];
  id v6 = [(CNFRegListController *)self regController];
  id v7 = [v6 accounts];
  id v8 = [v5 allAvailableAliasesForAccounts:v7];

  uint64_t v9 = 0;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ([v13 isTemporaryPhoneNumberAlias])
        {
          id v14 = v13;

          uint64_t v9 = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v10);
  }

  uint64_t v15 = [(NSArray *)self->_temporaryPhoneGroupSpecifiers firstObject];
  long long v16 = [(NSArray *)self->_temporaryPhoneDescriptionGroupSpecifiers firstObject];
  uint64_t v17 = [(NSArray *)self->_temporaryPhoneRemoveGroupSpecifiers firstObject];
  uint64_t v18 = (void *)v17;
  if (v15 && v16 && v17)
  {
    v50[0] = v17;
    v50[1] = v16;
    v50[2] = v15;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:3];
    [(CNFRegSettingsController *)self removeContiguousSpecifiers:v19 animated:v42];

    if (v9)
    {
      BOOL v20 = CommunicationsSetupUIBundle();
      char v21 = CNFRegStringTableName();
      id v41 = [v20 localizedStringForKey:@"FACETIME_SETTINGS_TEMPORARY_PHONE_LABEL" value:&stru_26D05D4F8 table:v21];

      uint64_t v39 = *MEMORY[0x263F602D0];
      objc_msgSend(v15, "setProperty:forKey:", v41);
      [v15 setName:v41];
      if ([v41 _isNaturallyRTL]) {
        uint64_t v22 = 2;
      }
      else {
        uint64_t v22 = 0;
      }
      uint64_t v23 = [NSNumber numberWithInteger:v22];
      uint64_t v24 = *MEMORY[0x263F5FEF0];
      [v15 setProperty:v23 forKey:*MEMORY[0x263F5FEF0]];

      uint64_t v25 = objc_opt_class();
      uint64_t v38 = *MEMORY[0x263F5FFE0];
      objc_msgSend(v16, "setProperty:forKey:", v25);
      [v16 setProperty:v9 forKey:@"cnfreg-temp-alias"];
      uint64_t v40 = [(CNFRegSettingsController *)self ftImServiceString];
      unint64_t v26 = NSString;
      int v27 = CommunicationsSetupUIBundle();
      unint64_t v28 = CNFRegStringTableName();
      uint64_t v29 = [v27 localizedStringForKey:@"FACETIME_SETTINGS_TEMPORARY_PHONE_REMOVE" value:&stru_26D05D4F8 table:v28];
      uint64_t v30 = objc_msgSend(v26, "stringWithFormat:", v29, v40);

      [v18 setName:v30];
      [v18 setProperty:v30 forKey:v39];
      uint64_t v31 = [NSNumber numberWithInt:0];
      [v18 setProperty:v31 forKey:v24];

      uint64_t v32 = [NSNumber numberWithBool:1];
      [v18 setProperty:v32 forKey:*MEMORY[0x263F600A8]];

      [v18 setProperty:objc_opt_class() forKey:v38];
      [v18 setButtonAction:sel_deleteTemporaryPhoneAliasSelected_];
      __int16 v33 = NSStringFromSelector(sel_deleteTemporaryPhoneAliasSelected_);
      [v18 setProperty:v33 forKey:*MEMORY[0x263F5FF70]];

      [v18 setProperty:v9 forKey:@"cnfreg-temp-alias"];
      v49[0] = v15;
      v49[1] = v16;
      v49[2] = v18;
      uint64_t v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:3];
      [(CNFRegSettingsController *)self insertContiguousSpecifiers:v34 atIndex:0 animated:v42];

      uint64_t v35 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        BOOL v48 = v9;
        _os_log_impl(&dword_21ED18000, v35, OS_LOG_TYPE_DEFAULT, "Inserted temporary phone specifiers for %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }

      goto LABEL_38;
    }
    uint64_t v37 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21ED18000, v37, OS_LOG_TYPE_DEFAULT, "Removed temporary phone specifiers", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
LABEL_37:
    }
      IMLogString();
  }
  else
  {
    id v36 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21ED18000, v36, OS_LOG_TYPE_DEFAULT, "No temporary phone specifiers in cache", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      goto LABEL_37;
    }
  }
LABEL_38:
}

- (BOOL)showAliases:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    [(CNFRegSettingsController *)self showSpecifiers:self->_aliasGroupSpecifiers afterGroupId:@"FACETIME_ACCOUNT_GROUP_ID" animated:a4];
  }
  else
  {
    [(CNFRegSettingsController *)self resignFirstResponder];
    [(CNFRegSettingsController *)self removeContiguousSpecifiers:self->_aliasGroupSpecifiers animated:v4];
  }
  return 1;
}

- (BOOL)additionalAliasesAvailable
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(CNFRegListController *)self regController];
  BOOL v4 = [(CNFRegSettingsController *)self _useableAccounts];
  uint64_t v5 = [v3 vettedAliasesForAccounts:v4];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) validationStatus] != 3)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)aliasForSpecifier:(id)a3
{
  id v3 = [a3 CNFRegAlias];
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 displayName];
  }
  else
  {
    uint64_t v6 = CommunicationsSetupUIBundle();
    uint64_t v7 = CNFRegStringTableName();
    uint64_t v5 = [v6 localizedStringForKey:@"FACETIME_ALIAS_INFO_UNAVAILABLE" value:&stru_26D05D4F8 table:v7];
  }
  return v5;
}

- (id)statusForSpecifier:(id)a3
{
  BOOL v4 = [a3 CNFRegAlias];
  if (v4)
  {
    uint64_t v5 = [(CNFRegSettingsController *)self statusForAlias:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)statusForAlias:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = [v3 validationStatus];
  if (v4 <= 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v4;
  }
  if ([v3 validationStatus] == 3)
  {
    uint64_t v6 = [v3 account];
    if ([v6 CNFRegSignInFailed])
    {
      uint64_t v5 = -1;
    }
    else if (![v6 CNFRegSignInComplete])
    {
      uint64_t v5 = 2;
    }
  }
  [v3 type];
  uint64_t v7 = CNFRegStringForAliasValidationStatus(v5);
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Verification status for {%@} : <%ld>%@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }

  return v7;
}

- (id)aliasWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(CNFRegListController *)self regController];
  uint64_t v6 = [v5 aliases];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 identifier];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)_canDeselectAlias:(id)a3
{
  id v4 = a3;
  if ([v4 isPhoneNumberAliasOnPhoneNumberAccount]
    && ([(CNFRegListController *)self regController],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 serviceSupportsDeviceAliasEnablement],
        v5,
        !v6))
  {
    char v12 = 0;
  }
  else if ([v4 validationStatus] == 3)
  {
    id v7 = [(CNFRegListController *)self regController];
    uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v9 = [v4 account];
    long long v10 = [v8 arrayWithObject:v9];
    id v11 = [v7 aliasesForAccounts:v10];

    if ((unint64_t)[v11 count] <= 1) {
      char v12 = CNFRegSupportsLocalPhoneNumberSentinelAlias();
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (id)createSpecifierForAlias:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F5FC40];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [(CNFRegSettingsController *)self updateSpecifier:v6 withAlias:v5];

  return v6;
}

- (void)deleteTemporaryPhoneAliasSelected:(id)a3
{
  id v4 = [a3 propertyForKey:@"cnfreg-temp-alias"];
  [(CNFRegSettingsController *)self _showRemoveTemporaryPhoneAlertForAlias:v4];
}

- (void)setAliasSelected:(id)a3
{
  id v28 = a3;
  id v4 = [v28 CNFRegAlias];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 validationStatus];
    if ([v5 isPhoneNumberAliasOnPhoneNumberAccount])
    {
      id v7 = [v5 account];
      uint64_t v8 = [v7 registrationStatus];

      if (v8 == -1)
      {
        uint64_t v25 = [MEMORY[0x263F4A520] sharedInstance];
        unint64_t v26 = [v5 account];
        [v25 activateAccount:v26];

        int v27 = [v5 account];
        [v27 registerAccount];

        [(CNFRegSettingsController *)self refreshAliasSpecifier:v28];
        goto LABEL_22;
      }
    }
    if (([v5 isDeviceAlias] & 1) != 0
      || [v5 isPhoneNumberAliasOnPhoneNumberAccount])
    {
      uint64_t v9 = [(CNFRegListController *)self regController];
      if ([v9 serviceSupportsDeviceAliasEnablement])
      {

LABEL_9:
        id v11 = [v28 propertyForKey:@"cnfreg-alias-checked"];
        char v12 = [v11 BOOLValue];

        uint64_t v13 = [v28 propertyForKey:@"cnfreg-alias-spinning"];
        int v14 = [v13 BOOLValue];

        if ((v12 & 1) != 0 || v14)
        {
          [(CNFRegSettingsController *)self _showRemoveAlertForAlias:v5 specifier:v28];
        }
        else
        {
          long long v15 = [(CNFRegListController *)self regController];
          [v15 addDeviceAlias:v5];

          long long v16 = [NSNumber numberWithBool:1];
          [v28 setProperty:v16 forKey:@"cnfreg-alias-spinning"];

          long long v17 = [(CNFRegSettingsController *)self cachedCellForSpecifier:v28];
          [v17 setHasSpinner:1];
        }
        goto LABEL_22;
      }
      int v10 = [v5 isTemporaryPhoneNumberAlias];

      if (v10) {
        goto LABEL_9;
      }
    }
    if (v6 != -1 && v6 != 2)
    {
      uint64_t v18 = [v28 propertyForKey:@"cnfreg-alias-checked"];
      char v19 = [v18 BOOLValue];

      BOOL v20 = [v5 account];
      if (v19)
      {
        if (![(CNFRegSettingsController *)self _canDeselectAlias:v5])
        {
LABEL_21:
          [(CNFRegSettingsController *)self refreshAliasSpecifier:v28];

          goto LABEL_22;
        }
        char v21 = [NSNumber numberWithBool:0];
        [v28 setProperty:v21 forKey:@"cnfreg-alias-checked"];

        uint64_t v22 = [(CNFRegSettingsController *)self cachedCellForSpecifier:v28];
        [v22 setChecked:0];

        uint64_t v23 = [(CNFRegListController *)self regController];
        uint64_t v24 = [v5 alias];
        [v23 removeAlias:v24 fromAccount:v20];
      }
      else
      {
        uint64_t v23 = [(CNFRegListController *)self regController];
        uint64_t v24 = [v5 alias];
        [v23 addAlias:v24 toAccount:v20];
      }

      goto LABEL_21;
    }
  }
LABEL_22:
}

- (BOOL)oppositeServiceTypeEnabled
{
  id v2 = [(CNFRegListController *)self regController];
  BOOL v3 = [v2 serviceType] != 1;

  id v4 = +[CNFRegController controllerForServiceType:v3];
  id v5 = [v4 accountsWithFilter:1];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (id)ftImServiceString
{
  if ([(CNFRegSettingsController *)self oppositeServiceTypeEnabled])
  {
    BOOL v3 = NSString;
    id v4 = CommunicationsSetupUIBundle();
    id v5 = CNFRegStringTableName();
    BOOL v6 = [v4 localizedStringForKey:@"JOINT_SERVICE_NAME" value:&stru_26D05D4F8 table:v5];
    id v7 = CommunicationsSetupUIBundle();
    uint64_t v8 = CNFRegStringTableName();
    uint64_t v9 = [v7 localizedStringForKey:@"IM_SERVICE_NAME" value:&stru_26D05D4F8 table:v8];
    int v10 = CommunicationsSetupUIBundle();
    id v11 = CNFRegStringTableName();
    char v12 = [v10 localizedStringForKey:@"FT_SERVICE_NAME" value:&stru_26D05D4F8 table:v11];
    uint64_t v13 = objc_msgSend(v3, "stringWithFormat:", v6, v9, v12);
  }
  else
  {
    int v14 = [(CNFRegListController *)self regController];
    uint64_t v15 = [v14 serviceType];

    id v4 = CommunicationsSetupUIBundle();
    id v5 = CNFRegStringTableName();
    if (v15 == 1) {
      long long v16 = @"IM_SERVICE_NAME";
    }
    else {
      long long v16 = @"FT_SERVICE_NAME";
    }
    uint64_t v13 = [v4 localizedStringForKey:v16 value:&stru_26D05D4F8 table:v5];
  }

  return v13;
}

- (void)_showRemoveAlertForAlias:(id)a3 specifier:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v43 = v5;
    __int16 v44 = 2112;
    id v45 = v6;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Showing alias remove alert {alias: %@, specifier: %@}", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v29 = v5;
    id v30 = v6;
    IMLogString();
  }
  uint64_t v34 = [(CNFRegSettingsController *)self ftImServiceString];
  int v8 = [v5 isTemporaryPhoneNumberAlias];
  uint64_t v9 = CommunicationsSetupUIBundle();
  int v10 = CNFRegStringTableName();
  if (v8) {
    id v11 = @"FACETIME_DISABLE_ALERT_TITLE_TEMP";
  }
  else {
    id v11 = @"FACETIME_REMOVE_ALERT_TITLE";
  }
  __int16 v33 = [v9 localizedStringForKey:v11 value:&stru_26D05D4F8 table:v10];

  uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", v33, v34);
  char v12 = CommunicationsSetupUIBundle();
  uint64_t v13 = CNFRegStringTableName();
  if (v8) {
    int v14 = @"FACETIME_DISABLE_ALERT_MESSAGE_TEMP";
  }
  else {
    int v14 = @"FACETIME_REMOVE_ALERT_MESSAGE";
  }
  uint64_t v32 = [v12 localizedStringForKey:v14 value:&stru_26D05D4F8 table:v13];

  uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", v32, v34);
  long long v16 = CommunicationsSetupUIBundle();
  long long v17 = CNFRegStringTableName();
  if (v8) {
    uint64_t v18 = @"FACETIME_ALERT_OK";
  }
  else {
    uint64_t v18 = @"FACETIME_REMOVE_ALERT_REMOVE_BUTTON";
  }
  char v19 = [v16 localizedStringForKey:v18 value:&stru_26D05D4F8 table:v17];

  BOOL v20 = CommunicationsSetupUIBundle();
  char v21 = CNFRegStringTableName();
  uint64_t v22 = [v20 localizedStringForKey:@"FACETIME_REMOVE_ALERT_CANCEL_BUTTON" value:&stru_26D05D4F8 table:v21];

  objc_initWeak((id *)buf, v6);
  uint64_t v23 = [MEMORY[0x263F82418] alertControllerWithTitle:v31 message:v15 preferredStyle:1];
  uint64_t v24 = (void *)MEMORY[0x263F82400];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  void v36[2] = __63__CNFRegSettingsController__showRemoveAlertForAlias_specifier___block_invoke;
  v36[3] = &unk_2644F0B20;
  objc_copyWeak(&v40, (id *)buf);
  id v25 = v5;
  char v41 = v8;
  id v37 = v25;
  uint64_t v38 = self;
  id v26 = v6;
  id v39 = v26;
  int v27 = [v24 actionWithTitle:v19 style:0 handler:v36];
  [v23 addAction:v27];

  if ((v8 & 1) == 0)
  {
    id v28 = [MEMORY[0x263F82400] actionWithTitle:v22 style:1 handler:0];
    [v23 addAction:v28];
  }
  [(CNFRegSettingsController *)self presentViewController:v23 animated:1 completion:0];

  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);
}

void __63__CNFRegSettingsController__showRemoveAlertForAlias_specifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v25 = v6;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Selected remove! Removing %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v23 = *(void *)(a1 + 32);
    IMLogString();
  }
  if (!WeakRetained) {
    goto LABEL_10;
  }
  id v7 = [WeakRetained CNFRegAlias];
  int v8 = [v7 alias];
  uint64_t v9 = [*(id *)(a1 + 32) alias];
  char v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    BOOL v11 = *(unsigned char *)(a1 + 64) == 0;
    char v12 = objc_msgSend(*(id *)(a1 + 40), "regController", v23);
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)(a1 + 32);
    if (v11) {
      [v12 removeDeviceAlias:v14];
    }
    else {
      [v12 disableDeviceAlias:v14];
    }

    long long v16 = [CNFRegAlias alloc];
    long long v17 = [*(id *)(a1 + 32) alias];
    uint64_t v18 = [*(id *)(a1 + 32) deviceAliasIdentifier];
    char v19 = [(CNFRegAlias *)v16 initWithAlias:v17 type:2 selected:0 deviceAliasIdentifier:v18];
    [*(id *)(a1 + 48) setCNFRegAlias:v19];

    BOOL v20 = *(void **)(a1 + 48);
    char v21 = [NSNumber numberWithBool:0];
    [v20 setProperty:v21 forKey:@"cnfreg-alias-checked"];

    uint64_t v22 = [*(id *)(a1 + 40) cachedCellForSpecifier:*(void *)(a1 + 48)];
    [v22 setChecked:0];

    [*(id *)(a1 + 40) refreshAliasSpecifier:*(void *)(a1 + 48)];
  }
  else
  {
LABEL_10:
    uint64_t v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "This specifier is no longer applicable -- ignoring", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
}

- (void)_showRemoveTemporaryPhoneAlertForAlias:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v31 = v3;
    _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Showing alias remove temporary phone alert {alias: %@}", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v23 = v3;
    IMLogString();
  }
  id v5 = [(CNFRegSettingsController *)self ftImServiceString];
  uint64_t v6 = CommunicationsSetupUIBundle();
  id v7 = CNFRegStringTableName();
  uint64_t v25 = [v6 localizedStringForKey:@"FACETIME_REMOVE_ALERT_TITLE" value:&stru_26D05D4F8 table:v7];

  uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", v25, v5);
  int v8 = CommunicationsSetupUIBundle();
  uint64_t v9 = CNFRegStringTableName();
  char v10 = [v8 localizedStringForKey:@"FACETIME_REMOVE_ALERT_MESSAGE_TEMP" value:&stru_26D05D4F8 table:v9];

  BOOL v11 = objc_msgSend(NSString, "stringWithFormat:", v10, v5);
  char v12 = CommunicationsSetupUIBundle();
  uint64_t v13 = CNFRegStringTableName();
  uint64_t v14 = [v12 localizedStringForKey:@"FACETIME_REMOVE_ALERT_REMOVE_BUTTON" value:&stru_26D05D4F8 table:v13];

  uint64_t v15 = CommunicationsSetupUIBundle();
  long long v16 = CNFRegStringTableName();
  long long v17 = [v15 localizedStringForKey:@"FACETIME_REMOVE_ALERT_CANCEL_BUTTON" value:&stru_26D05D4F8 table:v16];

  uint64_t v18 = [MEMORY[0x263F82418] alertControllerWithTitle:v24 message:v11 preferredStyle:1];
  char v19 = (void *)MEMORY[0x263F82400];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __67__CNFRegSettingsController__showRemoveTemporaryPhoneAlertForAlias___block_invoke;
  v27[3] = &unk_2644F0A80;
  id v28 = v3;
  id v29 = self;
  id v20 = v3;
  char v21 = [v19 actionWithTitle:v14 style:0 handler:v27];
  [v18 addAction:v21];

  uint64_t v22 = [MEMORY[0x263F82400] actionWithTitle:v17 style:1 handler:0];
  [v18 addAction:v22];

  [(CNFRegSettingsController *)self presentViewController:v18 animated:1 completion:0];
}

void __67__CNFRegSettingsController__showRemoveTemporaryPhoneAlertForAlias___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v23 = a2;
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v26 = v4;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Selected remove! Removing %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v22 = *(void *)(a1 + 32);
    IMLogString();
  }
  id v5 = objc_msgSend(*(id *)(a1 + 40), "specifiers", v22);
  uint64_t v6 = (void *)[v5 mutableCopy];

  id v7 = [*(id *)(a1 + 40) specifiers];
  uint64_t v24 = [v7 specifierForID:@"FACETIME_TEMPORARY_PHONE_GROUP_ID"];

  int v8 = [*(id *)(a1 + 40) specifiers];
  uint64_t v9 = [v8 specifierForID:@"FACETIME_TEMPORARY_PHONE_ID"];

  char v10 = [*(id *)(a1 + 40) specifiers];
  BOOL v11 = [v10 specifierForID:@"FACETIME_TEMPORARY_PHONE_REMOVE"];

  if (v24) {
    [v6 removeObject:v24];
  }
  if (v9) {
    [v6 removeObject:v9];
  }
  if (v11) {
    [v6 removeObject:v11];
  }
  char v12 = [*(id *)(a1 + 40) _useableAccounts];
  uint64_t v13 = [*(id *)(a1 + 40) regController];
  uint64_t v14 = [v13 allAvailableAliasesForAccounts:v12];

  if ([v14 count])
  {
    unint64_t v15 = 0;
    do
    {
      long long v16 = [v14 objectAtIndex:v15];
      if ([v16 isEqual:*(void *)(a1 + 32)])
      {
        long long v17 = [*(id *)(a1 + 40) aliasSpecifiers];
        uint64_t v18 = [v17 objectAtIndex:v15];

        [v6 removeObject:v18];
      }

      ++v15;
    }
    while (v15 < [v14 count]);
  }
  char v19 = *(void **)(a1 + 40);
  id v20 = [v19 specifiers];
  [v19 updateSpecifiers:v20 withSpecifiers:v6];

  char v21 = [*(id *)(a1 + 40) regController];
  [v21 removeDeviceAlias:*(void *)(a1 + 32)];
}

- (void)_showAliasValidationError:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v34 = v4;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Showing alias validation error: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v29 = v4;
    IMLogString();
  }
  uint64_t v6 = objc_msgSend(v4, "userInfo", v29);
  id v7 = [v6 objectForKey:@"cnf-customTitle"];
  int v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    char v10 = CommunicationsSetupUIBundle();
    BOOL v11 = CNFRegStringTableName();
    id v9 = [v10 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v11];
  }
  char v12 = [v4 localizedDescription];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    unint64_t v15 = CommunicationsSetupUIBundle();
    long long v16 = CNFRegStringTableName();
    id v14 = [v15 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_GENERIC" value:&stru_26D05D4F8 table:v16];
  }
  long long v17 = [v4 userInfo];
  uint64_t v18 = [v17 objectForKey:@"cnf-customButton"];
  char v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    char v21 = CommunicationsSetupUIBundle();
    uint64_t v22 = CNFRegStringTableName();
    id v20 = [v21 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v22];
  }
  id v23 = [MEMORY[0x263F82418] alertControllerWithTitle:v9 message:v14 preferredStyle:1];
  uint64_t v24 = [MEMORY[0x263F82400] actionWithTitle:v20 style:0 handler:0];
  [v23 addAction:v24];

  uint64_t v25 = [v4 userInfo];
  uint64_t v26 = [v25 objectForKey:@"cnf-customActionTitle"];

  if (v26)
  {
    uint64_t v27 = (void *)MEMORY[0x263F82400];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __54__CNFRegSettingsController__showAliasValidationError___block_invoke;
    v30[3] = &unk_2644F0A80;
    id v31 = v4;
    uint64_t v32 = self;
    id v28 = [v27 actionWithTitle:v26 style:0 handler:v30];
    [v23 addAction:v28];
  }
  [(CNFRegSettingsController *)self presentViewController:v23 animated:1 completion:0];
}

void __54__CNFRegSettingsController__showAliasValidationError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) userInfo];
  id v5 = [v4 objectForKey:@"cnf-customActionURLString"];

  if (v5)
  {
    uint64_t v6 = [NSURL URLWithString:v5];
    if (v6)
    {
      id v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        BOOL v11 = v6;
        _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Launching URL : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        id v9 = v6;
        IMLogString();
      }
      int v8 = objc_msgSend(*(id *)(a1 + 40), "regController", v9);
      [v8 openURL:v6];
    }
  }
}

- (void)showFaceTimeCaptionsSettings:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  faceTimeCaptionsGroupSpecifiers = self->_faceTimeCaptionsGroupSpecifiers;
  if (v4) {
    [(CNFRegSettingsController *)self showFaceTimeSpecifiers:faceTimeCaptionsGroupSpecifiers afterGroupId:@"GFT_PROMINENCE_GROUP_ID" animated:a4];
  }
  else {
    [(CNFRegSettingsController *)self removeContiguousSpecifiers:faceTimeCaptionsGroupSpecifiers animated:a4];
  }
}

- (void)refreshFaceTimeCaptionsSettingsAnimated:(BOOL)a3
{
  if (self->_faceTimeCaptionsGroupSpecifiers)
  {
    BOOL v3 = a3;
    BOOL v5 = [(CNFRegSettingsController *)self shouldShowFaceTimeCaptionsSpecifiers];
    [(CNFRegSettingsController *)self showFaceTimeCaptionsSettings:v5 animated:v3];
  }
}

- (BOOL)shouldShowFaceTimeCaptionsSpecifiers
{
  BOOL v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 serviceType];

  BOOL v5 = [(CNFRegListController *)self regController];
  char v6 = [v5 isServiceEnabled];

  BOOL v7 = [(CNFRegSettingsController *)self captioningSupported];
  if (v4) {
    char v8 = 0;
  }
  else {
    char v8 = v6;
  }
  return v8 & v7;
}

- (id)getFaceTimeCaptionsEnabledForSpecifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [NSNumber numberWithUnsignedChar:_AXSFaceTimeCaptionsEnabled()];
  BOOL v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v8 = [v4 BOOLValue];
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "faceTimeCaptionsEnabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    [v4 BOOLValue];
    IMLogString();
  }

  return v4;
}

- (void)setFaceTimeCaptionsEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v10 = [v5 BOOLValue];
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "faceTimeCaptionsEnabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v8 = [v5 BOOLValue];
    IMLogString();
  }
  objc_msgSend(v5, "BOOLValue", v8);
  _AXSSetFaceTimeCaptionsEnabled();
}

- (BOOL)captioningSupported
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F20F88] isCaptioningSupported];
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D0759F8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [MEMORY[0x263F82D20] activeInputModes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) primaryLanguage];
        char v9 = [v3 containsObject:v8];

        if (v9)
        {
          int v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  int v10 = 0;
LABEL_11:

  uint64_t v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109632;
    int v18 = v2 & v10;
    __int16 v19 = 1024;
    int v20 = v2;
    __int16 v21 = 1024;
    int v22 = v10;
    _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "captioningSupported: %d, hardwareSupported: %d, localeSupported: %d", buf, 0x14u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }

  return v2 & v10;
}

- (void)showFaceTimePhotosSettings:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  faceTimePhotosGroupSpecifiers = self->_faceTimePhotosGroupSpecifiers;
  if (v4) {
    [(CNFRegSettingsController *)self showFaceTimeSpecifiers:faceTimePhotosGroupSpecifiers afterGroupId:@"FACETIME_CAPTIONS_ENABLED_GROUP_ID" animated:a4];
  }
  else {
    [(CNFRegSettingsController *)self removeContiguousSpecifiers:faceTimePhotosGroupSpecifiers animated:a4];
  }
}

- (void)refreshFaceTimePhotosSettingsAnimated:(BOOL)a3
{
  if (self->_faceTimePhotosGroupSpecifiers)
  {
    BOOL v3 = a3;
    BOOL v5 = [(CNFRegSettingsController *)self shouldShowFaceTimePhotosSpecifiers];
    [(CNFRegSettingsController *)self showFaceTimePhotosSettings:v5 animated:v3];
  }
}

- (BOOL)shouldShowFaceTimePhotosSpecifiers
{
  BOOL v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 serviceType];

  BOOL v5 = [(CNFRegListController *)self regController];
  char v6 = [v5 isServiceEnabled];

  char v7 = [MEMORY[0x263F7E270] isFaceTimePhotosRestricted];
  if (v4) {
    return 0;
  }
  else {
    return v6 & (v7 ^ 1);
  }
}

- (id)getFaceTimePhotosEnabledForSpecifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F7E270], "isFaceTimePhotosEnabled"));
  BOOL v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v8 = [v4 BOOLValue];
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "faceTimePhotosEnabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    [v4 BOOLValue];
    IMLogString();
  }

  return v4;
}

- (void)setFaceTimePhotosEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  char v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v11 = [v5 BOOLValue];
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "faceTimePhotosEnabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v9 = [v5 BOOLValue];
    IMLogString();
  }
  uint64_t v8 = objc_msgSend(v5, "BOOLValue", v9);
  [MEMORY[0x263F7E270] setFaceTimePhotosEnabled:v8];
}

- (void)showFaceTimeVPCSpecifiers:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  faceTimeVPCGroupSpecifiers = self->_faceTimeVPCGroupSpecifiers;
  if (v4) {
    [(CNFRegSettingsController *)self showFaceTimeSpecifiers:faceTimeVPCGroupSpecifiers afterGroupId:@"FACETIME_PHOTOS_ENABLED_GROUP_ID" animated:a4];
  }
  else {
    [(CNFRegSettingsController *)self removeContiguousSpecifiers:faceTimeVPCGroupSpecifiers animated:a4];
  }
}

- (void)refreshFaceTimeVPCSettingsAnimated:(BOOL)a3
{
  if (self->_faceTimeVPCGroupSpecifiers)
  {
    BOOL v3 = a3;
    BOOL v5 = [(CNFRegSettingsController *)self shouldShowFaceTimeVPCSpecifiers];
    [(CNFRegSettingsController *)self showFaceTimeVPCSpecifiers:v5 animated:v3];
  }
}

- (BOOL)shouldShowFaceTimeVPCSpecifiers
{
  int v2 = [(CNFRegListController *)self regController];
  uint64_t v3 = [v2 serviceType];

  if (v3)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    BOOL v5 = [MEMORY[0x263F3BB58] sharedInstance];
    uint64_t v6 = [v5 objectForKey:@"vc-viewpoint-correction-enabled"];
    if (v6) {
      char v7 = (void *)v6;
    }
    else {
      char v7 = (void *)MEMORY[0x263EFFA88];
    }
    uint64_t v8 = [MEMORY[0x263F82670] currentDevice];
    if ([v8 userInterfaceIdiom] == 1) {
      int v4 = [MEMORY[0x263F20FF8] isEyeContactSupported];
    }
    else {
      int v4 = 0;
    }

    uint64_t v9 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if (!v10 || v4)
    {
      if (MGGetBoolAnswer() && _os_feature_enabled_impl()) {
        LOBYTE(v4) = [v7 BOOLValue];
      }
      else {
        LOBYTE(v4) = 0;
      }
    }
  }
  return v4;
}

- (id)getFaceTimeVPCEnabledForSpecifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = CNFGetDomainBooleanValueForKeyDefaultValue(@"com.apple.VideoConference", @"VPCEnabled", 1u);
  BOOL v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v10 = v4;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Viewpoint correction enabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v8 = v4;
    IMLogString();
  }
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", v4, v8);

  return v6;
}

- (void)setFaceTimeVPCEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  char v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v10 = [v5 BOOLValue];
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Setting viewpoint correction enabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v8 = [v5 BOOLValue];
    IMLogString();
  }
  CNFSetDomainIntegerForKey(@"com.apple.VideoConference", @"VPCEnabled", objc_msgSend(v5, "integerValue", v8));
}

- (void)showGFTProminenceSettings:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  GFTProminenceGroupSpecifiers = self->_GFTProminenceGroupSpecifiers;
  if (v4) {
    [(CNFRegSettingsController *)self showFaceTimeSpecifiers:GFTProminenceGroupSpecifiers afterGroupId:@"SHAREPLAY_SETTINGS_GROUP" animated:a4];
  }
  else {
    [(CNFRegSettingsController *)self removeContiguousSpecifiers:GFTProminenceGroupSpecifiers animated:a4];
  }
}

- (void)refreshGFTProminenceSettingsAnimated:(BOOL)a3
{
  if (self->_GFTProminenceGroupSpecifiers)
  {
    BOOL v3 = a3;
    BOOL v5 = [(CNFRegSettingsController *)self shouldShowGFTProminenceSpecifiers];
    [(CNFRegSettingsController *)self showGFTProminenceSettings:v5 animated:v3];
  }
}

- (BOOL)shouldShowGFTProminenceSpecifiers
{
  BOOL v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 serviceType];

  BOOL v5 = [(CNFRegListController *)self regController];
  int v6 = [v5 isServiceEnabled];

  if (v4 || !v6) {
    return 0;
  }
  char v7 = [MEMORY[0x263F3BB18] sharedInstance];
  char v8 = [v7 multiwaySupported];

  return v8;
}

- (id)getGFTAudioProminenceEnabledForSpecifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = CNFGetDomainBooleanValueForKeyDefaultValue((CFStringRef)*MEMORY[0x263F7E2C0], @"allowAudioProminence", 1u);
  BOOL v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v10 = v4;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "GFT audio prominence enabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v8 = v4;
    IMLogString();
  }
  int v6 = objc_msgSend(NSNumber, "numberWithBool:", v4, v8);

  return v6;
}

- (void)setGFTAudioProminenceEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  char v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v11 = [v5 BOOLValue];
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Setting GFT audio prominence enabled: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v9 = [v5 BOOLValue];
    IMLogString();
  }
  uint64_t v8 = objc_msgSend(v5, "BOOLValue", v9);
  CNFSetDomainBooleanForKey((void *)*MEMORY[0x263F7E2C0], @"allowAudioProminence", v8);
}

- (void)showSharePlaySettings:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  sharePlaySpecifiers = self->_sharePlaySpecifiers;
  if (v4) {
    [(CNFRegSettingsController *)self showFaceTimeSpecifiers:sharePlaySpecifiers afterGroupId:@"SHARED_NAME_AND_PHOTO_SETTINGS_GROUP" animated:a4];
  }
  else {
    [(CNFRegSettingsController *)self removeContiguousSpecifiers:sharePlaySpecifiers animated:a4];
  }
}

- (void)refreshSharePlaySettingsAnimated:(BOOL)a3
{
  if (self->_sharePlaySpecifiers)
  {
    BOOL v3 = a3;
    BOOL v5 = [(CNFRegSettingsController *)self shouldShowSharePlaySpecifiers];
    [(CNFRegSettingsController *)self showSharePlaySettings:v5 animated:v3];
  }
}

- (BOOL)shouldShowSharePlaySpecifiers
{
  BOOL v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 serviceType];

  BOOL v5 = [(CNFRegListController *)self regController];
  int v6 = [v5 isServiceEnabled];

  if (v4 || !v6) {
    return 0;
  }
  char v7 = [MEMORY[0x263F3BB18] sharedInstance];
  char v8 = [v7 multiwaySupported];

  return v8;
}

- (void)showSharedNameAndPhotoSettings:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  sharedNameAndPhotoSpecifiers = self->_sharedNameAndPhotoSpecifiers;
  if (v4) {
    [(CNFRegSettingsController *)self showFaceTimeSpecifiers:sharedNameAndPhotoSpecifiers afterGroupId:@"FACETIME_CALLERID_GROUP_ID" animated:a4];
  }
  else {
    [(CNFRegSettingsController *)self removeContiguousSpecifiers:sharedNameAndPhotoSpecifiers animated:a4];
  }
}

- (void)refreshSharedNameAndPhotoSettingsAnimated:(BOOL)a3
{
  if (self->_sharedNameAndPhotoSpecifiers)
  {
    BOOL v3 = a3;
    BOOL v5 = [(CNFRegSettingsController *)self shouldShowSharedNameAndPhotoSpecifiers];
    [(CNFRegSettingsController *)self showSharedNameAndPhotoSettings:v5 animated:v3];
  }
}

- (BOOL)shouldShowSharedNameAndPhotoSpecifiers
{
  BOOL v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 serviceType];

  BOOL v5 = [(CNFRegListController *)self regController];
  char v6 = [v5 isServiceEnabled];

  if (v4) {
    return 0;
  }
  else {
    return v6;
  }
}

- (BOOL)showCallerId:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  callerIdGroupSpecifiers = self->_callerIdGroupSpecifiers;
  if (v5) {
    [(CNFRegSettingsController *)self showSpecifiers:callerIdGroupSpecifiers afterGroupId:@"FACETIME_ALIAS_GROUP_ID" animated:a4];
  }
  else {
    [(CNFRegSettingsController *)self removeContiguousSpecifiers:callerIdGroupSpecifiers animated:a4];
  }
  [(CNFRegSettingsController *)self refreshiMessageAccountFooterText:v4];
  return 1;
}

- (id)possibleCallerIdAliases
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CNFRegListController *)self regController];
  BOOL v4 = [(CNFRegSettingsController *)self _useableAccounts];
  BOOL v5 = [v3 useableAliasesForAccounts:v4];

  char v6 = [v5 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  char v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "addObject:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)callerIdAliasSpecifiers
{
  NSUInteger v3 = [(NSArray *)self->_callerIdGroupSpecifiers count] - 1;
  callerIdGroupSpecifiers = self->_callerIdGroupSpecifiers;
  return -[NSArray subarrayWithRange:](callerIdGroupSpecifiers, "subarrayWithRange:", 1, v3);
}

- (void)refreshCallerIdAliasesAnimated:(BOOL)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)&self->_settingsFlags & 0x10) == 0)
  {
    BOOL v3 = a3;
    *(unsigned char *)&self->_settingsFlags |= 0x10u;
    char v6 = [(CNFRegSettingsController *)self possibleCallerIdAliases];
    unint64_t v7 = [v6 count];
    if (!v6 || (unint64_t v8 = v7, v7 <= 1))
    {
      [(CNFRegSettingsController *)self showCallerId:0 animated:v3];
LABEL_44:
      *(unsigned char *)&self->_settingsFlags &= ~0x10u;

      return;
    }
    [(CNFRegSettingsController *)self showCallerId:1 animated:v3];
    uint64_t v32 = [(CNFRegSettingsController *)self callerIdAliasSpecifiers];
    uint64_t v9 = (void *)[v32 mutableCopy];
    unint64_t v10 = [v9 count];
    BOOL v35 = v10 > v8;
    if (v10 > v8)
    {
      uint64_t v11 = [v9 count];
      unint64_t v12 = v11 - v8;
      uint64_t v13 = objc_msgSend(v9, "subarrayWithRange:", v8, v11 - v8);
      objc_msgSend(v9, "removeObjectsInRange:", v8, v12);
      uint64_t v34 = 1;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v34 = 0;
    }
    BOOL v33 = v3;
    id v36 = (void *)v13;
    if ([v9 count] > v8)
    {
      id v30 = [MEMORY[0x263F08690] currentHandler];
      [v30 handleFailureInMethod:a2 object:self file:@"CNFRegSettingsController.m" lineNumber:3114 description:@"More specifiers than Caller Id aliases"];
    }
    SEL v31 = a2;
    unint64_t v14 = [v9 count];
    unint64_t v15 = 0;
    id v16 = 0;
    long long v17 = 0;
    do
    {
      int v18 = [v6 objectAtIndex:v15];
      if (v15 >= v14)
      {
        if (v36)
        {
          __int16 v21 = [MEMORY[0x263F08690] currentHandler];
          [v21 handleFailureInMethod:v31 object:self file:@"CNFRegSettingsController.m" lineNumber:3126 description:@"Creating new specifiers when we just deleted some. Shameful."];
        }
        id v20 = [(CNFRegSettingsController *)self createSpecifierForCallerIdAlias:v18];
        [v9 addObject:v20];
        if (!v17)
        {
          long long v17 = [MEMORY[0x263EFF980] array];
          ++v34;
        }
        [v17 addObject:v20];
        BOOL v35 = 1;
      }
      else
      {
        uint64_t v19 = [v9 objectAtIndex:v15];
        [(CNFRegSettingsController *)self updateSpecifier:v19 withCallerIdAlias:v18];
        id v20 = v19;

        id v16 = v20;
      }

      ++v15;
    }
    while (v8 != v15);
    if (v34)
    {
      int v22 = [(NSArray *)self->_callerIdGroupSpecifiers objectAtIndex:0];
      id v23 = v32;
      uint64_t v24 = v36;
      if (v34 != 1) {
        [(CNFRegSettingsController *)self beginUpdates];
      }
      if (v36) {
        [(CNFRegSettingsController *)self removeContiguousSpecifiers:v36 animated:v33];
      }
      if (v17)
      {
        if (!v16) {
          id v16 = v22;
        }
        [(CNFRegSettingsController *)self insertContiguousSpecifiers:v17 afterSpecifier:v16 animated:v33];
      }
      if (v34 != 1) {
        [(CNFRegSettingsController *)self endUpdates];
      }
      if (v35)
      {
        [v9 insertObject:v22 atIndex:0];
        objc_storeStrong((id *)&self->_callerIdGroupSpecifiers, v9);
      }

      if (!v17) {
        goto LABEL_43;
      }
    }
    else
    {
      id v23 = v32;
      uint64_t v24 = v36;
      if (!v17)
      {
LABEL_43:

        goto LABEL_44;
      }
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v25 = v17;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v38 != v28) {
            objc_enumerationMutation(v25);
          }
          [(CNFRegSettingsController *)self reloadSpecifier:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v27);
    }

    uint64_t v24 = v36;
    goto LABEL_43;
  }
}

- (void)setCallerId:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 CNFRegCallerIdAlias];
  char v6 = v5;
  if (v5)
  {
    if ([v5 validationStatus] == 3)
    {
      unint64_t v7 = [(CNFRegListController *)self regController];
      [v7 setDisplayAlias:v6];

      [(CNFRegSettingsController *)self refreshAllCallerIdAliasSpecifiers];
      [(CNFRegSettingsController *)self refreshReceiveRelayCallsSettingsAnimated:1];
      goto LABEL_14;
    }
    uint64_t v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "Can't set caller ID with alias %@ because it is not validated", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
LABEL_13:
    }
      IMLogString();
  }
  else
  {
    unint64_t v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "No alias found for specifier: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      goto LABEL_13;
    }
  }
LABEL_14:
}

- (void)refreshCallerIdSpecifier:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__CNFRegSettingsController_refreshCallerIdSpecifier___block_invoke;
  v3[3] = &unk_2644F0AF8;
  v3[4] = self;
  [(CNFRegSettingsController *)self _reloadSpecifier:a3 withBlock:v3];
}

void __53__CNFRegSettingsController_refreshCallerIdSpecifier___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v15 = a2;
  BOOL v3 = [v15 CNFRegCallerIdAlias];
  id v4 = [v3 displayName];
  uint64_t v5 = objc_opt_class();
  objc_storeWeak((id *)&v15[*MEMORY[0x263F5FE40]], *(id *)(a1 + 32));
  *(void *)&v15[*MEMORY[0x263F5FE10]] = 2;
  [v15 setProperty:v4 forKey:*MEMORY[0x263F602D0]];
  [v15 setName:v4];
  [v15 setProperty:v5 forKey:*MEMORY[0x263F5FFE0]];
  [v15 setButtonAction:sel_setCallerId_];
  char v6 = NSStringFromSelector(sel_setCallerId_);
  [v15 setProperty:v6 forKey:*MEMORY[0x263F5FF70]];

  *(void *)&v15[*MEMORY[0x263F5FE18]] = 0;
  [v15 setDetailControllerClass:0];
  unint64_t v7 = [v3 identifier];
  [v15 setProperty:v7 forKey:*MEMORY[0x263F60138]];

  unint64_t v8 = [NSNumber numberWithInt:0];
  [v15 setProperty:v8 forKey:*MEMORY[0x263F5FEF0]];

  uint64_t v9 = [v3 account];
  if (v9)
  {
    unint64_t v10 = [v3 account];
    int v11 = [v10 CNFRegSignInComplete];
  }
  else
  {
    int v11 = 0;
  }

  uint64_t v12 = [*(id *)(a1 + 32) regController];
  uint64_t v13 = [v12 displayAlias];

  if (v11
    && ([v13 isEqual:v3]
     || [v13 isLocalPhoneNumberAlias]
     && [v3 isLocalPhoneNumberAlias]))
  {
    unint64_t v14 = [NSNumber numberWithBool:1];
    [v15 setProperty:v14 forKey:@"cnfreg-alias-checked"];
  }
  else
  {
    [v15 removePropertyForKey:@"cnfreg-alias-checked"];
  }
  [*(id *)(a1 + 32) _setSpecifierEnabled:v15 enabled:1 animated:1];
}

- (void)refreshAllCallerIdAliasSpecifiers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)&self->_settingsFlags & 0x10) == 0)
  {
    *(unsigned char *)&self->_settingsFlags |= 0x10u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = *(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          unint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend(v8, "CNFRegCallerIdAlias", (void)v10);

          if (v9) {
            [(CNFRegSettingsController *)self refreshCallerIdSpecifier:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    *(unsigned char *)&self->_settingsFlags &= ~0x10u;
  }
}

- (void)updateSpecifier:(id)a3 withCallerIdAlias:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    unint64_t v7 = [v9 CNFRegCallerIdAlias];
    char v8 = [v7 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      [v9 setCNFRegCallerIdAlias:v6];
      [v9 removePropertyForKey:@"cnfreg-alias-checked"];
    }
    [(CNFRegSettingsController *)self refreshCallerIdSpecifier:v9];
  }
}

- (id)createSpecifierForCallerIdAlias:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F5FC40];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [(CNFRegSettingsController *)self updateSpecifier:v6 withCallerIdAlias:v5];

  return v6;
}

- (BOOL)shouldShowReplyWithMessage
{
  id v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 serviceType];

  id v5 = [(CNFRegListController *)self regController];
  char v6 = [v5 isServiceEnabled];

  unint64_t v7 = [MEMORY[0x263F3BB18] sharedInstance];
  char v8 = [v7 isTelephonyDevice];

  id v9 = [MEMORY[0x263F3BB18] sharedInstance];
  if ([v9 supportsSMS])
  {
    BOOL v10 = 1;
  }
  else
  {
    long long v11 = [(CNFRegSettingsController *)self _operationalAccountsForService:1];
    BOOL v10 = [v11 count] != 0;
  }
  if (v4) {
    char v12 = 0;
  }
  else {
    char v12 = v6;
  }
  BOOL v13 = v12 & ~v8 & v10;

  return v13;
}

- (void)showReplyWithMessage:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  replyWithMessageGroupSpecifiers = self->_replyWithMessageGroupSpecifiers;
  if (v4) {
    [(CNFRegSettingsController *)self showSpecifiers:replyWithMessageGroupSpecifiers afterGroupId:@"FACETIME_ACCOUNT_GROUP_ID" animated:a4];
  }
  else {
    [(CNFRegSettingsController *)self removeContiguousSpecifiers:replyWithMessageGroupSpecifiers animated:a4];
  }
}

- (BOOL)shouldShowBlocklistSettings
{
  id v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 serviceType];

  id v5 = [(CNFRegListController *)self regController];
  char v6 = [v5 isServiceEnabled];
  if (v4) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v6;
  }

  return v7;
}

- (void)showBlocklistSettings:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  blocklistGroupSpecifiers = self->_blocklistGroupSpecifiers;
  if (v4) {
    [(CNFRegSettingsController *)self showFaceTimeSpecifiers:blocklistGroupSpecifiers afterGroupId:@"FACETIME_VPC_GROUP_ID" animated:a4];
  }
  else {
    [(CNFRegSettingsController *)self removeContiguousSpecifiers:blocklistGroupSpecifiers animated:a4];
  }
}

- (void)refreshBlocklistSettingsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = self->_blocklistGroupSpecifiers;
  if (v5)
  {
    char v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Refreshing blocklist settings", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    if ([(CNFRegSettingsController *)self shouldShowBlocklistSettings])
    {
      [(CNFRegSettingsController *)self showBlocklistSettings:1 animated:v3];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      BOOL v7 = self->_blocklistGroupSpecifiers;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v7);
            }
            -[CNFRegSettingsController reloadSpecifier:](self, "reloadSpecifier:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
          }
          while (v8 != v10);
          uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v16 count:16];
        }
        while (v8);
      }
    }
    else
    {
      [(CNFRegSettingsController *)self showBlocklistSettings:0 animated:v3];
    }
  }
}

- (int64_t)indexOfLastSpecifierInGroup:(id)a3
{
  int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(CNFRegSettingsController *)self getGroup:&v7 row:0 ofSpecifier:a3])
  {
    uint64_t v5 = [(CNFRegSettingsController *)self indexOfGroup:v7];
    return [(CNFRegSettingsController *)self rowsForGroup:v7] + v5;
  }
  return v4;
}

- (int64_t)groupIdForSpecifier:(id)a3
{
  int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(CNFRegSettingsController *)self getGroup:&v4 row:0 ofSpecifier:a3])return v4; {
  else
  }
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)groupIdForSpecifierId:(id)a3
{
  int64_t v4 = [(CNFRegSettingsController *)self specifierForID:a3];
  int64_t v5 = [(CNFRegSettingsController *)self groupIdForSpecifier:v4];

  return v5;
}

- (id)_makeRedactedIdentifierFromSpecifier:(id)a3
{
  int64_t v4 = [a3 identifier];
  int64_t v5 = [(CNFRegSettingsController *)self _makeRedactedIdentifierFromSpecifierId:v4];

  return v5;
}

- (id)_makeRedactedIdentifierFromSpecifierId:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"account:"])
  {
    id v4 = [@"account:" stringByAppendingString:@"<redacted>"];
  }
  else
  {
    id v4 = v3;
  }
  int64_t v5 = v4;

  return v5;
}

- (id)_makeRedactedIdentifiersFromSpecifiers:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__CNFRegSettingsController__makeRedactedIdentifiersFromSpecifiers___block_invoke;
  v5[3] = &unk_2644F0B48;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "tu_mapObjectsUsingBlock:", v5);
  return v3;
}

uint64_t __67__CNFRegSettingsController__makeRedactedIdentifiersFromSpecifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _makeRedactedIdentifierFromSpecifier:a2];
}

- (void)showSpecifiers:(id)a3 afterGroupId:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8 && [v8 count])
  {
    uint64_t v10 = [v8 objectAtIndex:0];
    if (([(CNFRegSettingsController *)self containsSpecifier:v10] & 1) == 0)
    {
      long long v11 = [(CNFRegSettingsController *)self specifierForID:v9];
      uint64_t v12 = [(CNFRegSettingsController *)self indexOfLastSpecifierInGroup:v11];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v12 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) count]- 1;
      }
      long long v13 = [(CNFRegSettingsController *)self _makeRedactedIdentifiersFromSpecifiers:v8];
      long long v14 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v17 = v13;
        _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "CNFRegSettingsController: insertContiguousSpecifiers %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        uint64_t v15 = v13;
        IMLogString();
      }
      -[CNFRegSettingsController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v8, v12 + 1, v5, v15);
    }
  }
}

- (void)showFaceTimeSpecifiers:(id)a3 afterGroupId:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v23[9] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v23[0] = @"FACETIME_BLOCKLIST_GROUP_ID";
  v23[1] = @"FACETIME_VPC_GROUP_ID";
  v23[2] = @"FACETIME_PHOTOS_ENABLED_GROUP_ID";
  v23[3] = @"FACETIME_CAPTIONS_ENABLED_GROUP_ID";
  v23[4] = @"GFT_PROMINENCE_GROUP_ID";
  void v23[5] = @"SHAREPLAY_SETTINGS_GROUP";
  v23[6] = @"SHARED_NAME_AND_PHOTO_SETTINGS_GROUP";
  v23[7] = @"FACETIME_CALLERID_GROUP_ID";
  v23[8] = @"FACETIME_ALIAS_GROUP_ID";
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:9];
  unint64_t v11 = [v10 indexOfObject:v9];
  uint64_t v12 = (int *)MEMORY[0x263F5FDB8];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v14 = [v10 count];
    while (v11 < v14)
    {
      uint64_t v15 = [v10 objectAtIndexedSubscript:v11];
      id v16 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + *v12) specifierForID:v15];

      if (v16)
      {
        [(CNFRegSettingsController *)self showSpecifiers:v8 afterGroupId:v15 animated:v5];

        goto LABEL_8;
      }

      unint64_t v14 = [v10 count];
      ++v11;
    }
  }
  long long v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "Unable to insert FaceTime specifiers after %@. Inserting at end. %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v17 = v9;
    id v18 = v8;
    IMLogString();
  }
  -[CNFRegSettingsController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v8, objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + *v12), "count", v17, v18), v5);
LABEL_8:
}

- (void)_updateControllerStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CNFRegSettingsController *)self _operationalAccounts];
  uint64_t v6 = [v5 count];

  if (v6
    || (*(unsigned char *)&self->_settingsFlags & 8) != 0
    && ([(CNFRegListController *)self regController],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 accountsWithFilter:16386],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        uint64_t v9 = [v8 count],
        v8,
        v9))
  {
    [(CNFRegSettingsController *)self refreshFaceTimeSettingsAnimated:v3];
  }
  else
  {
    [(CNFRegSettingsController *)self _popFromSettingsAnimated:v3];
  }
}

- (BOOL)_popFromSettingsAnimated:(BOOL)a3
{
  return 1;
}

- (BOOL)popToFirstRunControllerAnimated:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = [(CNFRegListController *)self regController];
  int v5 = [v4 accountState];

  if ((v5 & 0x40000000) != 0) {
    return 0;
  }
  uint64_t v6 = [(CNFRegListController *)self regController];
  uint64_t v7 = [v6 serviceType];

  if (v7 == 1)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE88]);
    id WeakRetained = objc_loadWeakRetained(v8);
    uint64_t v10 = [WeakRetained viewControllers];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = objc_loadWeakRetained(v8);
            id v19 = (id)[v18 popToViewController:v14 animated:0];

            return 1;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    uint64_t v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v20 = 0;
      _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "Trying to pop to first run controller but couldn't find CKSettingsMessagesController. Popping to root instead", v20, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    id v16 = objc_loadWeakRetained(v8);
    [v16 popRecursivelyToRootController];

    return 0;
  }
  [(CNFRegListController *)self showAuthKitSignInIfNecessary];
  return 1;
}

- (BOOL)_shouldUseDisabledHandlers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v2 = [(CNFRegListController *)self regController];
  BOOL v3 = [v2 accounts];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= [*(id *)(*((void *)&v10 + 1) + 8 * i) isActive] ^ 1;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 & 1;
}

- (void)_setupAccountHandlers
{
  if ([(CNFRegSettingsController *)self _shouldUseDisabledHandlers])
  {
    [(CNFRegSettingsController *)self _setupAccountHandlersForDisabledOperation];
  }
  else
  {
    [(CNFRegSettingsController *)self _setupAccountHandlersForNormalOperation];
  }
}

- (void)_handleFailedAccountReactivation:(id)a3 error:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNFRegListController *)self regController];
  [v8 setServiceEnabled:1];

  uint64_t v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = [v7 localizedDescription];
    *(_DWORD *)long long buf = 138412546;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "Failed to re-register account {%@} : %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    [v7 localizedDescription];
    v25 = id v24 = v6;
    IMLogString();
  }
  long long v11 = objc_msgSend(MEMORY[0x263F3BB18], "sharedInstance", v24, v25);
  int v12 = [v11 supportsSMSIdentification];

  if (v12) {
    [(CNFRegSettingsController *)self refreshFaceTimeSettingsAnimated:1];
  }
  else {
    [(CNFRegSettingsController *)self popToFirstRunControllerAnimated:1];
  }
  if (v7)
  {
    long long v13 = [(CNFRegListController *)self regController];
    int v14 = [v13 shouldShowAlertForError:v7];

    if (v14)
    {
      uint64_t v15 = CommunicationsSetupUIBundle();
      id v16 = CNFRegStringTableName();
      id v17 = [v15 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v16];

      id v18 = [v7 localizedDescription];
      id v19 = CommunicationsSetupUIBundle();
      id v20 = CNFRegStringTableName();
      long long v21 = [v19 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v20];

      long long v22 = [MEMORY[0x263F82418] alertControllerWithTitle:v17 message:v18 preferredStyle:1];
      long long v23 = [MEMORY[0x263F82400] actionWithTitle:v21 style:0 handler:0];
      [v22 addAction:v23];

      [(CNFRegSettingsController *)self presentViewController:v22 animated:1 completion:0];
    }
  }
}

- (void)_handleSuccessfulAccountReactivation:(id)a3
{
  uint64_t v4 = [(CNFRegListController *)self regController];
  [v4 setServiceEnabled:1];

  uint64_t v5 = [(CNFRegListController *)self regController];
  int v6 = [v5 accountState];

  if ((v6 & 0x40000000) != 0)
  {
    [(CNFRegSettingsController *)self _setupAccountHandlersForNormalOperation];
    [(CNFRegSettingsController *)self refreshFaceTimeSettingsAnimated:1];
  }
  else
  {
    [(CNFRegSettingsController *)self popToFirstRunControllerAnimated:1];
  }
}

- (BOOL)_allAccountsAreDeactivated
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v2 = [(CNFRegListController *)self regController];
  BOOL v3 = [v2 accounts];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v8 isActive] & 1) != 0 || objc_msgSend(v8, "registrationStatus") > 1)
        {
          BOOL v9 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 1;
  }
LABEL_13:

  return v9;
}

- (void)_setupAccountHandlersForDisabling
{
  v10.receiver = self;
  v10.super_class = (Class)CNFRegSettingsController;
  [(CNFRegListController *)&v10 _setupEventHandlers];
  BOOL v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Setting up account handlers for disabling accounts", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  uint64_t v4 = [(CNFRegListController *)self regController];
  if ([(CNFRegSettingsController *)self _allAccountsAreDeactivated])
  {
    [(CNFRegSettingsController *)self _setupAccountHandlers];
  }
  else
  {
    [(CNFRegListController *)self removeAllHandlers];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke;
    v8[3] = &unk_2644F04A0;
    v8[4] = self;
    [v4 setResetBlock:v8];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke_2;
    v7[3] = &unk_2644F04A0;
    v7[4] = self;
    [v4 setServiceDidBecomeUnsupportedBlock:v7];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke_3;
    v6[3] = &unk_2644F0B70;
    v6[4] = self;
    [v4 setAccountActivationChangedBlock:v6];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke_4;
    v5[3] = &unk_2644F0B98;
    v5[4] = self;
    [v4 setAccountRegistrationBlock:v5];
  }
}

uint64_t __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _shouldUseDisabledHandlers] & 1) == 0) {
    [*(id *)(a1 + 32) _setupAccountHandlers];
  }
  int v2 = *(void **)(a1 + 32);
  return [v2 refreshFaceTimeSettingsAnimated:0];
}

void __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) regController];
  char v3 = [v2 isServiceSupported];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 popRecursivelyToRootController];
  }
}

uint64_t __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSwitchDelayed];
  uint64_t result = [*(id *)(a1 + 32) _allAccountsAreDeactivated];
  if (result)
  {
    char v3 = *(void **)(a1 + 32);
    return [v3 _setupAccountHandlersForDisabledOperation];
  }
  return result;
}

uint64_t __61__CNFRegSettingsController__setupAccountHandlersForDisabling__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSwitchDelayed];
  uint64_t result = [*(id *)(a1 + 32) _allAccountsAreDeactivated];
  if (result)
  {
    char v3 = *(void **)(a1 + 32);
    return [v3 _setupAccountHandlersForDisabledOperation];
  }
  return result;
}

- (void)_setupAccountHandlersForDisabledOperation
{
  v10.receiver = self;
  v10.super_class = (Class)CNFRegSettingsController;
  [(CNFRegListController *)&v10 _setupEventHandlers];
  char v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Setting up disabled account handlers", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  uint64_t v4 = [(CNFRegListController *)self regController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke;
  v8[3] = &unk_2644F04A0;
  v8[4] = self;
  [v4 setResetBlock:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke_2;
  v7[3] = &unk_2644F04A0;
  v7[4] = self;
  [v4 setServiceDidBecomeUnsupportedBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke_3;
  v6[3] = &unk_2644F0B70;
  v6[4] = self;
  [v4 setAccountActivationChangedBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke_736;
  v5[3] = &unk_2644F0B98;
  v5[4] = self;
  [v4 setAccountRegistrationBlock:v5];
}

uint64_t __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _shouldUseDisabledHandlers] & 1) == 0) {
    [*(id *)(a1 + 32) _setupAccountHandlers];
  }
  int v2 = *(void **)(a1 + 32);
  return [v2 refreshFaceTimeSettingsAnimated:0];
}

void __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) regController];
  char v3 = [v2 isServiceSupported];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 popRecursivelyToRootController];
  }
}

void __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = CNFRegStringForAccount(v3);
    *(_DWORD *)long long buf = 138412290;
    BOOL v9 = v5;
    _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Handling activation state change on account: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v7 = CNFRegStringForAccount(v3);
    IMLogString();
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateSwitchDelayed", v7);
  if ([v3 isActive] && objc_msgSend(v3, "CNFRegSignInComplete"))
  {
    uint64_t v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Activated an account that was registered, running success path", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [*(id *)(a1 + 32) _handleSuccessfulAccountReactivation:v3];
  }
}

void __69__CNFRegSettingsController__setupAccountHandlersForDisabledOperation__block_invoke_736(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _updateSwitchDelayed];
  if ([v6 CNFRegSignInComplete])
  {
    [*(id *)(a1 + 32) _handleSuccessfulAccountReactivation:v6];
  }
  else if ([v6 CNFRegSignInFailed])
  {
    [*(id *)(a1 + 32) _handleFailedAccountReactivation:v6 error:v5];
  }
}

- (void)_setupAccountHandlersForNormalOperation
{
  v16.receiver = self;
  v16.super_class = (Class)CNFRegSettingsController;
  [(CNFRegListController *)&v16 _setupEventHandlers];
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Setting up normal account handlers", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  uint64_t v4 = [(CNFRegListController *)self regController];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke;
  v14[3] = &unk_2644F04A0;
  v14[4] = self;
  [v4 setResetBlock:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_2;
  v13[3] = &unk_2644F04A0;
  v13[4] = self;
  [v4 setServiceDidBecomeUnsupportedBlock:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_3;
  v12[3] = &unk_2644F04A0;
  v12[4] = self;
  [v4 setCallerIdChangedBlock:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_743;
  v11[3] = &unk_2644F0B70;
  v11[4] = self;
  [v4 setAccountRemovedBlock:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_747;
  v10[3] = &unk_2644F0B70;
  v10[4] = self;
  [v4 setAccountActivationChangedBlock:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_748;
  v9[3] = &unk_2644F0B98;
  v9[4] = self;
  [v4 setAccountRegistrationBlock:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_767;
  v8[3] = &unk_2644F0BC0;
  v8[4] = self;
  [v4 setAliasRemovedBlock:v8];
  id v5 = [v4 aliasRemovedBlock];
  [v4 setAliasAddedBlock:v5];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_2_769;
  v7[3] = &unk_2644F0BE8;
  v7[4] = self;
  [v4 setAliasStatusChangedBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_3_771;
  v6[3] = &unk_2644F0B70;
  v6[4] = self;
  [v4 setVettedAliasesChangedBlock:v6];
}

uint64_t __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldUseDisabledHandlers]) {
    [*(id *)(a1 + 32) _setupAccountHandlers];
  }
  int v2 = *(void **)(a1 + 32);
  return [v2 refreshFaceTimeSettingsAnimated:0];
}

void __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) regController];
  char v3 = [v2 isServiceSupported];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 popRecursivelyToRootController];
  }
}

uint64_t __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_3(uint64_t a1)
{
  int v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Refreshing caller id", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [*(id *)(a1 + 32) refreshCallerIdAliasesAnimated:1];
  return [*(id *)(a1 + 32) refreshReceiveRelayCallsSettingsAnimated:1];
}

void __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_743(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) regController];
  uint64_t v5 = [v4 serviceType];

  id v6 = [*(id *)(a1 + 32) regController];
  if ([v6 serviceSupportsDeviceAliasEnablement])
  {
    id v7 = [*(id *)(a1 + 32) regController];
    id v8 = [v7 usableDeviceAliases];
    BOOL v9 = [v8 count] != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  if (v5) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v9;
  }
  long long v11 = [*(id *)(a1 + 32) regController];
  long long v12 = [v11 accountsWithFilter:1];
  uint64_t v13 = [v12 count];

  if (v13 || v10)
  {
    [*(id *)(a1 + 32) refreshFaceTimeSettingsAnimated:1];
  }
  else
  {
    long long v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "Account used for settings was removed, popping", v15, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [*(id *)(a1 + 32) _popFromSettingsAnimated:1];
  }
}

void __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_747(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) regController];
  uint64_t v5 = [v4 accountsWithFilter:1];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [*(id *)(a1 + 32) refreshFaceTimeSettingsAnimated:1];
  }
  else
  {
    id v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Account used for settings was removed, popping", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [*(id *)(a1 + 32) _popFromSettingsAnimated:1];
  }
}

void __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_748(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v5 isActive];
    uint64_t v9 = CNFRegStringForAccount(v5);
    BOOL v10 = (void *)v9;
    long long v11 = @"NO";
    if (v8) {
      long long v11 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    long long v38 = v11;
    __int16 v39 = 2112;
    uint64_t v40 = v9;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Account status changed (isActive=%@): %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    if ([v5 isActive]) {
      long long v12 = @"YES";
    }
    else {
      long long v12 = @"NO";
    }
    CNFRegStringForAccount(v5);
    BOOL v35 = v33 = v12;
    IMLogString();
  }
  if (v6)
  {
    uint64_t v13 = [*(id *)(a1 + 32) regController];
    int v14 = [v13 shouldShowAlertForError:v6];
  }
  else
  {
    int v14 = 0;
  }
  if (objc_msgSend(v5, "CNFRegSignInComplete", v33, v35)) {
    goto LABEL_34;
  }
  uint64_t v15 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = [v5 isActive];
    uint64_t v17 = CNFRegStringForAccount(v5);
    id v18 = (void *)v17;
    id v19 = @"NO";
    if (v16) {
      id v19 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    long long v38 = v19;
    __int16 v39 = 2112;
    uint64_t v40 = v17;
    _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "Account no longer signed in (isActive=%@): %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    if ([v5 isActive]) {
      id v20 = @"YES";
    }
    else {
      id v20 = @"NO";
    }
    CNFRegStringForAccount(v5);
    v36 = uint64_t v34 = v20;
    IMLogString();
  }
  CNFRegLogIndent();
  CNFRegLogBacktrace();
  CNFRegLogOutdent();
  long long v21 = [*(id *)(a1 + 32) _operationalAccounts];
  BOOL v22 = [v21 count] == 0;

  if (!v22) {
    goto LABEL_34;
  }
  long long v23 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21ED18000, v23, OS_LOG_TYPE_DEFAULT, "No more useable accounts, popping", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_popFromSettingsAnimated:", 1, v34, v36))
  {
    if ((v14 & 1) == 0) {
      goto LABEL_37;
    }
  }
  else
  {
LABEL_34:
    objc_msgSend(*(id *)(a1 + 32), "_updateSwitchDelayed", v34, v36);
    if (!v14)
    {
      [*(id *)(a1 + 32) refreshFaceTimeSettingsWithDelayAnimated:1];
      goto LABEL_37;
    }
  }
  id v24 = CommunicationsSetupUIBundle();
  id v25 = CNFRegStringTableName();
  uint64_t v26 = [v24 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v25];

  id v27 = [v6 localizedDescription];
  __int16 v28 = CommunicationsSetupUIBundle();
  id v29 = CNFRegStringTableName();
  uint64_t v30 = [v28 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v29];

  SEL v31 = [MEMORY[0x263F82418] alertControllerWithTitle:v26 message:v27 preferredStyle:1];
  uint64_t v32 = [MEMORY[0x263F82400] actionWithTitle:v30 style:0 handler:0];
  [v31 addAction:v32];

  [*(id *)(a1 + 32) presentViewController:v31 animated:1 completion:0];
LABEL_37:
}

uint64_t __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_767(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshAliasesAnimated:0];
  [*(id *)(a1 + 32) refreshCallerIdAliasesAnimated:1];
  [*(id *)(a1 + 32) refreshTemporaryPhoneAnimated:1];
  int v2 = *(void **)(a1 + 32);
  return [v2 refreshReceiveRelayCallsSettingsAnimated:1];
}

void __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_2_769(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 refreshAllAliasSpecifiers];
  [*(id *)(a1 + 32) refreshCallerIdAliasesAnimated:1];
  uint64_t v7 = [v6 validationStatus];

  if (v7 == -1) {
    [*(id *)(a1 + 32) _showAliasValidationError:v8];
  }
}

uint64_t __67__CNFRegSettingsController__setupAccountHandlersForNormalOperation__block_invoke_3_771(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshAliasesAnimated:0];
  [*(id *)(a1 + 32) refreshCallerIdAliasesAnimated:1];
  int v2 = *(void **)(a1 + 32);
  return [v2 refreshTemporaryPhoneAnimated:1];
}

- (void)handleCallStatusChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CNFRegSettingsController_handleCallStatusChanged__block_invoke;
  block[3] = &unk_2644F04A0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __51__CNFRegSettingsController_handleCallStatusChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshFaceTimeSettingsAnimated:0];
}

- (void)_handleFaceTimeCTRegistrationStatusChanged
{
}

- (void)_handleFaceTimeEntitlementStatusChanged
{
}

- (void)_handleRelayCapabilitiesChanged
{
}

- (void)_handleOutgoingRelayCallerIDChanged
{
}

- (void)_handleAccountRegistrarChanged
{
}

- (BOOL)shouldShowAUOnlineSafetySpecifiers
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  uint64_t v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [MEMORY[0x263EFF960] currentLocale];
    id v6 = [v5 countryCode];
    *(_DWORD *)long long buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = @"AU";
    _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "AU ESAFETY: Checking current locale... %@ to %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v7 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v15 = [v7 countryCode];
    int v16 = @"AU";
    IMLogString();
  }
  BOOL v8 = v3 != 1;
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF960], "currentLocale", v15, v16);
  BOOL v10 = [v9 countryCode];
  int v11 = [v10 isEqualToString:@"AU"];

  BOOL v12 = v11 & v8;
  if ((v11 & v8) != 0)
  {
    uint64_t v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "AU ESAFETY: Current locale is AU and device is phone, show AU eSafety link", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  return v12;
}

- (void)openAUOnlineSafetyURL
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = CommunicationsSetupUIBundle();
  uint64_t v4 = CNFRegStringTableName();
  id v5 = [v3 localizedStringForKey:@"AU_ONLINE_SAFETY_URL" value:&stru_26D05D4F8 table:v4];

  id v6 = [NSURL URLWithString:v5];
  uint64_t v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    int v11 = v5;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "AU ESAFETY: Launching AU eSafety Act URL %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  if (v6)
  {
    BOOL v8 = [(CNFRegSettingsController *)self _safariViewControllerWithURL:v6];
    [(CNFRegSettingsController *)self presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    uint64_t v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "AU ESAFETY: Cannot launch AU eSafety Act URL because URL is nil", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
}

- (id)_safariViewControllerWithURL:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F16988];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setEntersReaderIfAvailable:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F16980]) initWithURL:v5 configuration:v6];

  [v7 setDelegate:self];
  [v7 setModalPresentationStyle:2];

  return v7;
}

- (void)safariViewControllerDidFinish:(id)a3
{
}

- (BOOL)showDeviceAliases
{
  return self->_showDeviceAliases;
}

- (void)setShowDeviceAliases:(BOOL)a3
{
  self->_showDeviceAliases = a3;
}

- (BOOL)hideAppleIDLogin
{
  return self->_hideAppleIDLogin;
}

- (void)setHideAppleIDLogin:(BOOL)a3
{
  self->_hideAppleIDLogiuint64_t n = a3;
}

- (BOOL)showReceiveRelayCalls
{
  return self->_showReceiveRelayCalls;
}

- (void)setSpecifiersProvider:(id)a3
{
}

- (int)captionsSubscriptionToken
{
  return self->_captionsSubscriptionToken;
}

- (void)setCaptionsSubscriptionToken:(int)a3
{
  self->_captionsSubscriptionTokeuint64_t n = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiersProvider, 0);
  objc_storeStrong((id *)&self->_delayedRefreshAnimatedFlag, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_australiaOnlineSafetyGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_temporaryPhoneRemoveGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_temporaryPhoneDescriptionGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_temporaryPhoneGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_sharedNameAndPhotoSpecifiers, 0);
  objc_storeStrong((id *)&self->_sharePlaySpecifiers, 0);
  objc_storeStrong((id *)&self->_faceTimeVPCGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_faceTimePhotosGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_faceTimeCaptionsGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_GFTProminenceGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_receiveRelayCallsGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_blocklistGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_replyWithMessageGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_callerIdGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_aliasGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_accountGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_faceTimeEnabledSpecifier, 0);
  objc_storeStrong((id *)&self->_faceTimeEnabledGroupSpecifier, 0);
}

@end