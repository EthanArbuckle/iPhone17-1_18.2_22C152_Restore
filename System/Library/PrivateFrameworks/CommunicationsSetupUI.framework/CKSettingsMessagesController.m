@interface CKSettingsMessagesController
+ (BOOL)currentMessageAutoKeepForType:(int)a3;
+ (BOOL)shouldShowFirstPartyExtension;
+ (IMSyncedSettingsManaging)syncedSettingsManager;
+ (id)currentKeepMessages;
+ (id)getDefaultExtension;
+ (id)removeFirstPartyExtensionFromArrayIfNecessary:(id)a3;
+ (int)currentMessageAutoKeepOptionForType:(int)a3;
+ (void)setSyncedSettingsManager:(id)a3;
- (AUSystemSettingsSpecifiersProvider)systemSettingsSpecifierProvider;
- (BOOL)_allAccountsAreDeactivated;
- (BOOL)_imageForkedFromMeCard;
- (BOOL)_isAppleIDUpdateNeeded;
- (BOOL)_isIDSDelayRegistrationEnabled;
- (BOOL)_isMadridAccountOperational;
- (BOOL)_isMadridSwitchOn;
- (BOOL)_isMessagesInICloudEnabled;
- (BOOL)_isRaiseGestureSupported;
- (BOOL)_isRegistrationInProgress;
- (BOOL)_isSMSDevice;
- (BOOL)_meCardSharingEnabled;
- (BOOL)_registrationFailures:(id)a3 areAllOfKind:(int64_t)a4;
- (BOOL)_registrationFailures:(id)a3 containsFailure:(int64_t)a4;
- (BOOL)_sharedWithYouEnabled;
- (BOOL)_shouldShowSatelliteDemoModeButton;
- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6;
- (BOOL)hasPhoneNumber;
- (BOOL)isCheckInAllowedInRegion;
- (BOOL)isPersonalCompanionEnabled;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)shouldShowBlocklistSettings;
- (BOOL)shouldShowCheckInLocationHistorySettings;
- (BOOL)shouldShowContactPhotoSettings;
- (BOOL)shouldShowDeliveryReceipts;
- (BOOL)shouldShowInboxSummarySettings;
- (BOOL)shouldShowJunkConversationsRow;
- (BOOL)shouldShowJunkFilteringReceipts;
- (BOOL)shouldShowMadridAccounts;
- (BOOL)shouldShowMadridSignin;
- (BOOL)shouldShowMadridSwitch;
- (BOOL)shouldShowNicknames;
- (BOOL)shouldShowOnlineSafetyLink;
- (BOOL)shouldShowReadReceipts;
- (BOOL)shouldShowSMSRelaySettings;
- (BOOL)shouldShowSendAsSMS;
- (BOOL)shouldShowSharedWithYouSettings;
- (BOOL)shouldShowSiriSettings;
- (BOOL)shouldShowUpdateAppleID;
- (BOOL)shouldShowiMessageApps;
- (BOOL)shouldShowiMessageFilteringSettings:(id)a3;
- (BOOL)wantsWiFiChooser;
- (CKFilteringListController)filteringController;
- (CKLazuliEnablementManager)lazuliEnablementManager;
- (CKMultipleCTSubscriptionsController)mmsMessagingController;
- (CKNSExtension)ckExtension;
- (CKOnboardingController)onboardingController;
- (CKRCSController)rcsMessagingController;
- (CKSafariViewControllerImportWorkaround)safariImportWorkaround;
- (CKSettingsMessagesController)init;
- (CKSettingsiMessageAppManager)iMessageAppManager;
- (CKSharedSettingsHelper)sharedSettingsHelper;
- (IMCTXPCServiceSubscriptionInfo)ctSubscriptionInfo;
- (PSController)blackholeConversationListViewController;
- (id)_failedAccounts;
- (id)_iMessageAppsViewController;
- (id)_madridSettingsController;
- (id)_messagesForBusinessViewController;
- (id)_registrationFailures;
- (id)_satelliteDemoModeSpecifierIdentifiers;
- (id)_sharedWithYouViewController;
- (id)_smsRelayDevicesController;
- (id)_switchFooterText:(unint64_t *)a3;
- (id)_syncManager;
- (id)areJunkFilteringReceiptsEnabled:(id)a3;
- (id)areReadReceiptsEnabled:(id)a3;
- (id)audioMessageSettingsSpecifierIdentifiers;
- (id)beginMappingID;
- (id)blocklistSettingsSpecifierIdentifiers;
- (id)characterCountSpecifierIdentifiers;
- (id)checkInLocationHistorySettingsSpecifierIdentifiers;
- (id)contactPhotoSettingsSpecifierIdentifiers;
- (id)controllerForSpecifier:(id)a3;
- (id)deliveryReceiptSpecifierIdentifiers;
- (id)genericSettingsSpecifierIdentifiers;
- (id)getAccountSummaryForSpecifier:(id)a3;
- (id)getAudioMessageAutoKeep:(id)a3;
- (id)getCheckInLocationHistorySetting:(id)a3;
- (id)getKeepMessages:(id)a3;
- (id)getMMSDictionary;
- (id)getMessagesInICloudEnabledSpecifier:(id)a3;
- (id)getNameAndPhotoSharingFooterText;
- (id)getNameAndPhotoSharingSpecifierSummary:(id)a3;
- (id)getPreviewTranscodingEnabled:(id)a3;
- (id)getRaiseToListenEnabled:(id)a3;
- (id)getSMSRelayDevicesSummary:(id)a3;
- (id)getSharedWithYouForSpecifier:(id)a3;
- (id)iMessageAppsIdentifiers;
- (id)iMessageFilteringSpecifierIdentifiers;
- (id)inboxSummarySettingsSpecifierIdentifiers;
- (id)isConversationListFilteringEnabled:(id)a3;
- (id)isDeliveryReportsEnabled:(id)a3;
- (id)isInboxSummarizationEnabled:(id)a3;
- (id)isMMSEnabled:(id)a3;
- (id)isMadridEnabled:(id)a3;
- (id)isSiriToneNotificationEnabled:(id)a3;
- (id)junkConversationsRowIdentifier;
- (id)junkFilterReceiptsRowIdentifier;
- (id)logName;
- (id)madridEnabledSpecifierIdentifiers;
- (id)madridSigninButtonTextForSpecifier:(id)a3;
- (id)madridSigninSpecifiers;
- (id)madridSwitchSpecifierIdentifiers;
- (id)nameAndPhotoSharingSpecifiers;
- (id)newDNDGlobalConfigurationService;
- (id)onlineSafetySettingsSpecifierIdentifiers;
- (id)raiseToListenSpecifierIdentifiers;
- (id)readReceiptSpecifierIdentifiers;
- (id)sendAsSMSIdentifiers;
- (id)sharedWithYouSettingsSpecifierIdentifiers;
- (id)siriSettingsIdentifiers;
- (id)smsRelaySettingsSpecifierIdentifiers;
- (id)spamFilteringSpecifierIdentifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)willSendGroupMMS:(id)a3;
- (int64_t)_debugFailureReason;
- (unint64_t)_meCardSharingAudience;
- (void)_clearMessagesAppExtensionSalt;
- (void)_nicknameSettingsDidChange:(id)a3;
- (void)_openAUOnlineSafetyURL;
- (void)_openPhoneNumberActivationLearnMorePage:(id)a3;
- (void)_setupAccountHandlers;
- (void)_setupAccountHandlersForDisabling;
- (void)_setupTextMessageGroupSpecifiers:(id)a3 wantsTextMessageBasicGroup:(BOOL)a4;
- (void)_shouldShowSatelliteDemoModeButton;
- (void)_showMadridSetupIfNecessary;
- (void)_showMadridSetupIfNecessary:(BOOL)a3;
- (void)_showPrivacySheetForiMessageFaceTime:(id)a3;
- (void)_showSetupMeCardAlert;
- (void)_showSignInController;
- (void)_startListeningForProfileChanges;
- (void)_stopListeningForProfileChanges;
- (void)_updateSwitchDelayed;
- (void)_updateUIWithError:(id)a3;
- (void)applicationDidResume;
- (void)applicationWillSuspend;
- (void)checkInPrivacySplashControllerDidRequestDismissal:(id)a3;
- (void)configureCheckInSpecifiers:(id)a3;
- (void)dealloc;
- (void)emitNavigationEvent:(id)a3 deepLinkURL:(id)a4;
- (void)endMatchingExtensions;
- (void)findSpamExtensions;
- (void)firstRunControllerDidFinish:(id)a3 finished:(BOOL)a4;
- (void)messageFilteringTapped:(id)a3;
- (void)nameAndPhotoSharingForSpecifier:(id)a3;
- (void)newDNDGlobalConfigurationService;
- (void)notifyDNDFocusStatusAuthorizationChanged;
- (void)notifyThatConversationFilteringChanged;
- (void)onboardingControllerDidFinish:(id)a3;
- (void)openAUOnlineSafetyURL;
- (void)presentCheckInPrivacySplashController;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)satelliteDemoModeTappedWithSpecifier:(id)a3;
- (void)setAudioMessageAutoKeep:(id)a3 specifier:(id)a4;
- (void)setBeginMappingID:(id)a3;
- (void)setBlackholeConversationListViewController:(id)a3;
- (void)setCkExtension:(id)a3;
- (void)setConversationListFilteringEnabled:(id)a3 specifier:(id)a4;
- (void)setCtSubscriptionInfo:(id)a3;
- (void)setDeliveryReportsEnabled:(id)a3 specifier:(id)a4;
- (void)setFilteringController:(id)a3;
- (void)setIMessageAppManager:(id)a3;
- (void)setInboxSummarizationEnabled:(id)a3 specifier:(id)a4;
- (void)setJunkFilteringReceiptsEnabled:(id)a3 specifier:(id)a4;
- (void)setKeepMessages:(id)a3 specifier:(id)a4;
- (void)setLazuliEnablementManager:(id)a3;
- (void)setMMSEnabled:(id)a3 specifier:(id)a4;
- (void)setMadridEnabled:(id)a3 specifier:(id)a4;
- (void)setMmsMessagingController:(id)a3;
- (void)setOnboardingController:(id)a3;
- (void)setPreviewTranscodingEnabled:(id)a3 specifier:(id)a4;
- (void)setRaiseToListenEnabled:(id)a3 specifier:(id)a4;
- (void)setRcsMessagingController:(id)a3;
- (void)setReadReceiptsEnabled:(id)a3 specifier:(id)a4;
- (void)setSafariImportWorkaround:(id)a3;
- (void)setSharedSettingsHelper:(id)a3;
- (void)setSiriToneNotificationEnabled:(id)a3 specifier:(id)a4;
- (void)setSpecifierLoading:(id)a3 loading:(BOOL)a4 animated:(BOOL)a5;
- (void)setSystemSettingsSpecifierProvider:(id)a3;
- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4;
- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4;
- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4;
- (void)showCKVSettings:(id)a3;
- (void)showMeCardViewControllerWithNickname:(id)a3;
- (void)showMessagesInICloudSettings:(id)a3;
- (void)showMultiplePhoneNumbersAlertForNicknames;
- (void)showNicknameOnboardingController;
- (void)showNicknameOnboardingOrEditFlowController;
- (void)showiCloudNotSignedInAlertForNicknames;
- (void)systemApplicationDidEnterBackground;
- (void)systemApplicationWillEnterForeground;
- (void)systemPolicyForApp:(id)a3 didUpdateForSystemPolicyOptions:(unint64_t)a4 withValue:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKSettingsMessagesController

+ (IMSyncedSettingsManaging)syncedSettingsManager
{
  v2 = (void *)_syncedSettingsManager_0;
  if (!_syncedSettingsManager_0)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F4A618]);
    v4 = (void *)_syncedSettingsManager_0;
    _syncedSettingsManager_0 = (uint64_t)v3;

    v2 = (void *)_syncedSettingsManager_0;
  }
  return (IMSyncedSettingsManaging *)v2;
}

+ (void)setSyncedSettingsManager:(id)a3
{
}

- (void)_nicknameSettingsDidChange:(id)a3
{
}

- (CKSettingsMessagesController)init
{
  v22.receiver = self;
  v22.super_class = (Class)CKSettingsMessagesController;
  v2 = [(CKSettingsMessagesController *)&v22 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_newCarrierNotification name:@"PSNewCarrierNotification" object:0];

    if (!v2->_filteringController)
    {
      v4 = objc_alloc_init(CKFilteringListController);
      filteringController = v2->_filteringController;
      v2->_filteringController = v4;
    }
    v6 = +[CNFRegController controllerForServiceType:1];
    [(CNFRegListController *)v2 setRegController:v6];

    v7 = [(CNFRegListController *)v2 regController];
    [v7 connect:1];

    [(CKSettingsMessagesController *)v2 _startListeningForProfileChanges];
    v8 = objc_alloc_init(CKSettingsiMessageAppManager);
    [(CKSettingsMessagesController *)v2 setIMessageAppManager:v8];

    v9 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if (v10 == 1)
    {
      +[CNFRegWizardController setGlobalAppearanceStyle:2];
      +[CNFRegWizardController setSupportsAutoRotation:1];
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSpecifiersFromNotification, @"com.apple.MobileSMS.ReadReceiptsEnabled.changed", v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSpecifiersFromNotification, @"com.apple.MobileSMS.SettingsChangedByAppIntents", v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSpecifiersFromNotification, @"com.apple.MobileSMS.IncomingMessageAlertFiltration.changed", v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    v12 = +[CKSettingsMessagesController syncedSettingsManager];
    [v12 addObserver:v2 selector:sel__syncedSettingsDidChange_ key:0];

    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSpecifiersFromNotification, (CFStringRef)*MEMORY[0x263F4A488], v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSpecifiersFromNotification, @"CKSettingsiMessageAppManagerInstalledAppsDidChange", v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    v13 = [MEMORY[0x263F4A568] sharedInstance];
    [v13 addListenerID:@"CKSettingsMessagesController" capabilities:(*MEMORY[0x263F4A8A0] | *MEMORY[0x263F4A890]) | *MEMORY[0x263F4A8B0]];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v2 selector:sel__nicknameSettingsDidChange_ name:*MEMORY[0x263F4ADB8] object:0];

    v15 = objc_alloc_init(CKLazuliEnablementManager);
    [(CKSettingsMessagesController *)v2 setLazuliEnablementManager:v15];

    v16 = objc_alloc_init(CKSharedSettingsHelper);
    [(CKSettingsMessagesController *)v2 setSharedSettingsHelper:v16];

    v17 = [MEMORY[0x263F4A548] sharedInstance];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      v19 = [MEMORY[0x263F4A548] sharedInstance];
      [v19 startMonitor];
    }
    v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:v2 selector:sel__lazuliDisabledByProfileDidChange name:@"CNFLazuliDisabledByProfileChangedNotification" object:0];
  }
  return v2;
}

- (AUSystemSettingsSpecifiersProvider)systemSettingsSpecifierProvider
{
  systemSettingsSpecifierProvider = self->_systemSettingsSpecifierProvider;
  if (!systemSettingsSpecifierProvider)
  {
    v4 = (AUSystemSettingsSpecifiersProvider *)[objc_alloc(MEMORY[0x263F25600]) initWithApplicationBundleIdentifier:@"com.apple.MobileSMS"];
    v5 = self->_systemSettingsSpecifierProvider;
    self->_systemSettingsSpecifierProvider = v4;

    [(AUSystemSettingsSpecifiersProvider *)self->_systemSettingsSpecifierProvider setDelegate:self];
    systemSettingsSpecifierProvider = self->_systemSettingsSpecifierProvider;
  }
  return systemSettingsSpecifierProvider;
}

- (void)dealloc
{
  [(CKSettingsMessagesController *)self endMatchingExtensions];
  filteringController = self->_filteringController;
  self->_filteringController = 0;

  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  [(CKSettingsMessagesController *)self _stopListeningForProfileChanges];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.MobileSMS.ReadReceiptsEnabled.changed", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.MobileSMS.SettingsChangedByAppIntents", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.MobileSMS.IncomingMessageAlertFiltration.changed", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"CKSettingsiMessageAppManagerInstalledAppsDidChange", 0);
  v6 = +[CKSettingsMessagesController syncedSettingsManager];
  [v6 removeObserver:self key:0];

  +[CKSettingsMessagesController setSyncedSettingsManager:0];
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F4A488], 0);
  v7.receiver = self;
  v7.super_class = (Class)CKSettingsMessagesController;
  [(CNFRegListController *)&v7 dealloc];
}

- (id)logName
{
  return @"MessagesSettings";
}

- (void)_startListeningForProfileChanges
{
  p_profileToken = &self->_profileToken;
  if (!self->_profileToken)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3042000000;
    v6[3] = __Block_byref_object_copy__4;
    v6[4] = __Block_byref_object_dispose__4;
    objc_initWeak(&v7, self);
    id v3 = MEMORY[0x263EF83A0];
    id v4 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __64__CKSettingsMessagesController__startListeningForProfileChanges__block_invoke;
    handler[3] = &unk_2644F1260;
    handler[4] = v6;
    notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", p_profileToken, v3, handler);

    _Block_object_dispose(v6, 8);
    objc_destroyWeak(&v7);
  }
}

void __64__CKSettingsMessagesController__startListeningForProfileChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [WeakRetained endMatchingExtensions];

  id v3 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [v3 findSpamExtensions];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [v4 reloadSpecifiers];
}

- (void)_stopListeningForProfileChanges
{
  int profileToken = self->_profileToken;
  if (profileToken)
  {
    notify_cancel(profileToken);
    self->_int profileToken = 0;
  }
}

- (BOOL)wantsWiFiChooser
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKSettingsMessagesController;
  [(CNFRegListController *)&v6 viewWillAppear:a3];
  CNFRegSetStringTableForServiceType(1);
  id v4 = [(CNFRegListController *)self regController];
  int v5 = [v4 isConnected];

  if (v5) {
    [(CKSettingsMessagesController *)self reloadSpecifiers];
  }
  [(CNFRegListController *)self showAuthKitSignInIfNecessary];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CKSettingsMessagesController *)self findSpamExtensions];
  int v5 = [MEMORY[0x263F4A568] sharedInstance];
  [v5 _setBlocksConnectionAtResume:1];

  v9.receiver = self;
  v9.super_class = (Class)CKSettingsMessagesController;
  [(CNFRegListController *)&v9 viewDidAppear:v3];
  [(CKSettingsMessagesController *)self _setupAccountHandlers];
  [(CKSettingsMessagesController *)self _startListeningForProfileChanges];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__CKSettingsMessagesController_viewDidAppear___block_invoke;
  v8[3] = &unk_2644F04A0;
  v8[4] = self;
  [MEMORY[0x263F82E00] performWithoutAnimation:v8];
  self->_showingChildViewController = 0;
  [(CKFilteringListController *)self->_filteringController setShowingParentViewController:1];
  objc_super v6 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps"];
  id v7 = [v6 URLByAppendingPathComponent:@"com.apple.MobileSMS"];

  [(CKSettingsMessagesController *)self emitNavigationEvent:MEMORY[0x263EFFA68] deepLinkURL:v7];
}

void __46__CKSettingsMessagesController_viewDidAppear___block_invoke(uint64_t a1)
{
  v1 = *(char **)(a1 + 32);
  id v2 = [*(id *)&v1[*MEMORY[0x263F5FDB8]] specifierForID:@"MADRID_ACCOUNTS_BUTTON"];
  [v1 reloadSpecifier:v2];
}

- (void)emitNavigationEvent:(id)a3 deepLinkURL:(id)a4
{
  objc_super v6 = (objc_class *)MEMORY[0x263F08DB0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  uint64_t v10 = [MEMORY[0x263EFF960] currentLocale];
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 bundleURL];
  id v13 = (id)[v9 initWithKey:@"Messages" table:0 locale:v10 bundleURL:v12];

  [(CKSettingsMessagesController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.MobileSMS" title:v13 localizedNavigationComponents:v8 deepLink:v7];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKSettingsMessagesController;
  [(CNFRegListController *)&v4 viewWillDisappear:a3];
  [(CNFRegListController *)self removeAllHandlers];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKSettingsMessagesController;
  [(CNFRegListController *)&v4 viewDidDisappear:a3];
  [(CKSettingsMessagesController *)self endMatchingExtensions];
}

- (void)applicationWillSuspend
{
  v3.receiver = self;
  v3.super_class = (Class)CKSettingsMessagesController;
  [(CKSettingsMessagesController *)&v3 applicationWillSuspend];
  [(CKSettingsMessagesController *)self endMatchingExtensions];
}

- (void)applicationDidResume
{
  v3.receiver = self;
  v3.super_class = (Class)CKSettingsMessagesController;
  [(CNFRegListController *)&v3 applicationDidResume];
  if (!self->_showingChildViewController) {
    [(CKSettingsMessagesController *)self findSpamExtensions];
  }
}

- (void)systemApplicationWillEnterForeground
{
  v5.receiver = self;
  v5.super_class = (Class)CKSettingsMessagesController;
  [(CNFRegListController *)&v5 systemApplicationWillEnterForeground];
  [(CKSettingsMessagesController *)self _setupAccountHandlers];
  objc_super v3 = [(CNFRegListController *)self regController];
  int v4 = [v3 isConnected];

  if (v4) {
    [(CKSettingsMessagesController *)self reloadSpecifiers];
  }
}

- (void)systemApplicationDidEnterBackground
{
  v3.receiver = self;
  v3.super_class = (Class)CKSettingsMessagesController;
  [(CNFRegListController *)&v3 systemApplicationDidEnterBackground];
  [(CNFRegListController *)self removeAllHandlers];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)_showPrivacySheetForiMessageFaceTime:(id)a3
{
  id v4 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:*MEMORY[0x263F5B940]];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)_openPhoneNumberActivationLearnMorePage:(id)a3
{
  objc_msgSend(MEMORY[0x263F3BB58], "sharedInstance", a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = CNFStringKeyForProduct(@"phone-number-activation-learn-more");
  id v4 = [v10 objectForKey:v3];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
  }
  else
  {
    objc_super v6 = CNFRegStringTableName();
    id v7 = CommunicationsSetupUIBundle();
    CNFLocalizedStringFromTableInBundleWithFallback(@"PHONE_NUMBER_ACTIVATION_LEARN_MORE_URL", v6, v7);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = (void *)*MEMORY[0x263F83300];
  id v9 = [NSURL URLWithString:v5];
  [v8 openURL:v9 withCompletionHandler:0];
}

- (void)systemPolicyForApp:(id)a3 didUpdateForSystemPolicyOptions:(unint64_t)a4 withValue:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 134218242;
      unint64_t v12 = a4;
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_INFO, "System policy %ld did update with value: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  if ((a4 & 0x400000000) != 0) {
    [(CKSettingsMessagesController *)self notifyDNDFocusStatusAuthorizationChanged];
  }
}

- (void)notifyDNDFocusStatusAuthorizationChanged
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ED18000, v0, v1, "Unable to update focus status following authorization change, forward declared selector unavailable", v2, v3, v4, v5, v6);
}

- (id)newDNDGlobalConfigurationService
{
  uint64_t v2 = (void *)CUTWeakLinkClass();
  if (v2)
  {
    uint64_t v3 = [v2 serviceForClientIdentifier:@"com.apple.donotdisturb.preferences"];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = v4;
    }
    else
    {
      uint8_t v6 = IMLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[CKSettingsMessagesController newDNDGlobalConfigurationService]();
      }

      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v4 = IMLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[CKSettingsMessagesController newDNDGlobalConfigurationService]();
    }
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)specifiers
{
  v107[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  id v4 = *v3;
  if (*v3) {
    goto LABEL_101;
  }
  id v5 = objc_alloc(MEMORY[0x263EFF980]);
  uint8_t v6 = [(CKSettingsMessagesController *)self loadSpecifiersFromPlistName:@"Messages" target:self];
  id v7 = (void *)[v5 initWithArray:v6];

  id v8 = [(CKSettingsMessagesController *)self systemSettingsSpecifierProvider];
  v99 = [v8 specifiers];

  if (v99)
  {
    id v9 = [v99 arrayByAddingObjectsFromArray:v7];
    uint64_t v10 = [v9 mutableCopy];

    id v7 = (void *)v10;
  }
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  int v11 = [MEMORY[0x263F3BB18] sharedInstance];
  uint64_t v12 = [v11 accountModificationRestricted] ^ 1;

  if ([(CKSettingsMessagesController *)self shouldShowMadridSwitch])
  {
    __int16 v13 = [v7 specifierForID:@"MADRID_ENABLED_GROUP"];
    *(void *)buf = 0;
    id v14 = [(CKSettingsMessagesController *)self _switchFooterText:buf];
    if (*(void *)buf == 2)
    {
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      [v13 setProperty:v27 forKey:*MEMORY[0x263F600C0]];

      v28 = CommunicationsSetupUIBundle();
      v29 = CNFRegStringTableName();
      v30 = [v28 localizedStringForKey:@"PHONE_NUMBER_ACTIVATION_LEARN_MORE" value:&stru_26D05D4F8 table:v29];

      v31 = [NSString stringWithFormat:@" %@", v30];
      v21 = [v14 stringByAppendingString:v31];

      v110.location = [v21 rangeOfString:v30];
      v32 = NSStringFromRange(v110);
      [v13 setProperty:v32 forKey:*MEMORY[0x263F600D0]];

      [v13 setProperty:v21 forKey:*MEMORY[0x263F600E8]];
      v33 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
      [v13 setProperty:v33 forKey:*MEMORY[0x263F600E0]];

      v34 = NSStringFromSelector(sel__openPhoneNumberActivationLearnMorePage_);
      [v13 setProperty:v34 forKey:*MEMORY[0x263F600C8]];
    }
    else if (*(void *)buf == 1)
    {
      uint64_t v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      [v13 setProperty:v16 forKey:*MEMORY[0x263F600C0]];

      v17 = CommunicationsSetupUIBundle();
      char v18 = CNFRegStringTableName();
      v19 = [v17 localizedStringForKey:@"LEARN_MORE" value:&stru_26D05D4F8 table:v18];

      v20 = [NSString stringWithFormat:@" %@", v19];
      v21 = [v14 stringByAppendingString:v20];

      v109.location = [v21 rangeOfString:v19];
      objc_super v22 = NSStringFromRange(v109);
      [v13 setProperty:v22 forKey:*MEMORY[0x263F600D0]];

      [v13 setProperty:v21 forKey:*MEMORY[0x263F600E8]];
      v23 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
      [v13 setProperty:v23 forKey:*MEMORY[0x263F600E0]];

      v24 = NSStringFromSelector(sel__showPrivacySheetForiMessageFaceTime_);
      [v13 setProperty:v24 forKey:*MEMORY[0x263F600C8]];
    }
    else
    {
      [v13 setProperty:0 forKey:*MEMORY[0x263F600C0]];
      [v13 setProperty:v14 forKey:*MEMORY[0x263F600F8]];
      v21 = v14;
    }
    v35 = [v7 specifierForID:@"MADRID_ENABLED_SWITCH"];
    v36 = [NSNumber numberWithBool:v12];
    [v35 setProperty:v36 forKey:*MEMORY[0x263F600A8]];
  }
  else
  {
    v25 = [(CKSettingsMessagesController *)self madridSwitchSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v25);
  }
  if (![(CKSettingsMessagesController *)self shouldShowDeliveryReceipts])
  {
    v37 = [(CKSettingsMessagesController *)self deliveryReceiptSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v37);
  }
  if (![(CKSettingsMessagesController *)self shouldShowReadReceipts])
  {
    v38 = [(CKSettingsMessagesController *)self readReceiptSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v38);
  }
  if (![(CKSettingsMessagesController *)self shouldShowContactPhotoSettings])
  {
    v39 = [(CKSettingsMessagesController *)self contactPhotoSettingsSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v39);
  }
  if ([(CKSettingsMessagesController *)self shouldShowMadridAccounts])
  {
    v40 = [v7 specifierForID:@"MADRID_ACCOUNTS_BUTTON"];
    v41 = [NSNumber numberWithBool:v12];
    [v40 setProperty:v41 forKey:*MEMORY[0x263F600A8]];
  }
  else
  {
    v40 = [(CKSettingsMessagesController *)self madridEnabledSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v40);
  }

  if (![(CKSettingsMessagesController *)self shouldShowUpdateAppleID])
  {
    v107[0] = @"MADRID_UPDATE_APPLEID_BUTTON";
    v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v107 count:1];
    _removeSpecifiersWithIdentifiers(v7, v42);
    goto LABEL_25;
  }
  if (_os_feature_enabled_impl())
  {
    v42 = [v7 specifierForID:@"MADRID_UPDATE_APPLEID_BUTTON"];
    v43 = MessagesSettingsLocalizedString(@"MADRID_UPDATE_APPLEID_APPLEACCOUNT");
    [v42 setProperty:v43 forKey:*MEMORY[0x263F602D0]];
    [v42 setName:v43];

LABEL_25:
  }
  v106 = @"MESSAGES_IN_ICLOUD";
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v106 count:1];
  _removeSpecifiersWithIdentifiers(v7, v44);

  BOOL v45 = [(CKSettingsMessagesController *)self shouldShowCharacterCount];
  if (!v45)
  {
    v46 = [(CKSettingsMessagesController *)self characterCountSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v46);
  }
  if ([(CKSettingsMessagesController *)self shouldShowBlocklistSettings])
  {
    BOOL v45 = 1;
  }
  else
  {
    v47 = [(CKSettingsMessagesController *)self blocklistSettingsSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v47);
  }
  if ([(CKSettingsMessagesController *)self shouldShowSendAsSMS])
  {
    v48 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
    int v49 = [v48 isLazuliEnabled];

    if (v49)
    {
      v50 = [(CKSettingsMessagesController *)self lazuliEnablementManager];
      int v51 = [v50 isRCSSupportedForAnyActiveSubscription];

      if (v51) {
        [v7 specifierForID:@"PRE_LAZULI_SEND_AS_SMS_GROUP"];
      }
      else {
      v52 = [v7 specifierForID:@"SEND_AS_SMS_GROUP"];
      }
      [v7 removeObject:v52];
    }
    else
    {
      v52 = [v7 specifierForID:@"SEND_AS_SMS_GROUP"];
      [v7 removeObject:v52];
    }
  }
  else
  {
    v52 = [(CKSettingsMessagesController *)self sendAsSMSIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v52);
  }

  if (![(CKSettingsMessagesController *)self shouldShowiMessageApps])
  {
    v53 = [(CKSettingsMessagesController *)self iMessageAppsIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v53);
  }
  if ([(CKSettingsMessagesController *)self shouldShowAudioMessageSettings])
  {
    if ([(CKSettingsMessagesController *)self shouldShowRaiseToListenSwitch])
    {
      v54 = MessagesSettingsLocalizedString(@"RAISE_TO_LISTEN_DESCRIPTION");
      v55 = [v7 specifierForID:@"AUDIO_MESSAGES_GROUP"];
      [v55 setProperty:v54 forKey:*MEMORY[0x263F600F8]];
    }
    else
    {
      v54 = [(CKSettingsMessagesController *)self raiseToListenSpecifierIdentifiers];
      _removeSpecifiersWithIdentifiers(v7, v54);
    }
  }
  else
  {
    v54 = [(CKSettingsMessagesController *)self audioMessageSettingsSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v54);
  }

  v56 = [(CKFilteringListController *)self->_filteringController extensionIDArray];
  BOOL v57 = [(CKSettingsMessagesController *)self shouldShowiMessageFilteringSettings:v56];

  v58 = [v7 specifierForID:@"MADRID_FILTER_GROUP"];
  v59 = v58;
  if (v57)
  {
    v60 = MessagesSettingsLocalizedString(@"MADRID_FILTER");
    uint64_t v61 = *MEMORY[0x263F600F8];
    [v59 setProperty:v60 forKey:*MEMORY[0x263F600F8]];

    [(CKSettingsMessagesController *)self spamFilteringSpecifierIdentifiers];
  }
  else
  {
    uint64_t v61 = *MEMORY[0x263F600F8];
    [v58 setProperty:0 forKey:*MEMORY[0x263F600F8]];
    [(CKSettingsMessagesController *)self iMessageFilteringSpecifierIdentifiers];
  v62 = };
  _removeSpecifiersWithIdentifiers(v7, v62);

  if (![(CKSettingsMessagesController *)self shouldShowJunkConversationsRow])
  {
    v63 = [(CKSettingsMessagesController *)self junkConversationsRowIdentifier];
    _removeSpecifiersWithIdentifiers(v7, v63);
  }
  if (![(CKSettingsMessagesController *)self shouldShowJunkFilteringReceipts])
  {
    v64 = [v7 specifierForID:@"JUNK_FILTERING_RECEIPTS_GROUP"];
    [v64 setProperty:0 forKey:v61];
    v65 = [(CKSettingsMessagesController *)self junkFilterReceiptsRowIdentifier];
    _removeSpecifiersWithIdentifiers(v7, v65);
  }
  if (![(CKSettingsMessagesController *)self shouldShowSiriSettings])
  {
    v66 = [(CKSettingsMessagesController *)self siriSettingsIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v66);
  }
  if (![(CKSettingsMessagesController *)self shouldShowSMSRelaySettings])
  {
    v67 = [(CKSettingsMessagesController *)self smsRelaySettingsSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v67);
  }
  if (![(CKSettingsMessagesController *)self shouldShowGenericSettings])
  {
    v68 = [(CKSettingsMessagesController *)self genericSettingsSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v68);
  }
  if ([(CKSettingsMessagesController *)self shouldShowMadridSignin])
  {
    int v69 = _os_feature_enabled_impl();
    v70 = CommunicationsSetupUIBundle();
    v71 = CNFRegStringTableName();
    if (v69) {
      v72 = @"FACETIME_ACCOUNT_INFO_UNAVAILABLE_APPLEACCOUNT";
    }
    else {
      v72 = @"FACETIME_ACCOUNT_INFO_UNAVAILABLE";
    }
    id v73 = [v70 localizedStringForKey:v72 value:&stru_26D05D4F8 table:v71];

    v74 = [v7 specifierForID:@"MADRID_SIGNIN_BUTTON"];
    v75 = [NSNumber numberWithBool:v12];
    [v74 setProperty:v75 forKey:*MEMORY[0x263F600A8]];

    [v74 setProperty:v73 forKey:*MEMORY[0x263F602D0]];
    [v74 setName:v73];
  }
  else
  {
    id v73 = [(CKSettingsMessagesController *)self madridSigninSpecifiers];
    _removeSpecifiersWithIdentifiers(v7, v73);
  }

  BOOL v76 = [(CKSettingsMessagesController *)self shouldShowNicknames];
  v77 = [v7 specifierForID:@"NAME_AND_PHOTO_SHARING_GROUP"];
  v78 = v77;
  if (v76)
  {
    v79 = [(CKSettingsMessagesController *)self getNameAndPhotoSharingFooterText];
    [v78 setProperty:v79 forKey:v61];
  }
  else
  {
    [v77 setProperty:0 forKey:v61];
    v79 = [(CKSettingsMessagesController *)self nameAndPhotoSharingSpecifiers];
    _removeSpecifiersWithIdentifiers(v7, v79);
  }

  v80 = [MEMORY[0x263F4AF48] sharedInstance];
  v81 = [v80 ctSubscriptionInfo];
  [(CKSettingsMessagesController *)self setCtSubscriptionInfo:v81];

  if (IMOSLoggingEnabled())
  {
    v82 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
    {
      id v83 = [(CKSettingsMessagesController *)self ctSubscriptionInfo];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v83;
      _os_log_impl(&dword_21ED18000, v82, OS_LOG_TYPE_INFO, "Sub info %@", buf, 0xCu);
    }
  }
  [(CKSettingsMessagesController *)self _setupTextMessageGroupSpecifiers:v7 wantsTextMessageBasicGroup:v45];
  if (![(CKSettingsMessagesController *)self shouldShowSharedWithYouSettings])
  {
    v84 = [(CKSettingsMessagesController *)self sharedWithYouSettingsSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v84);
  }
  if (![(CKSettingsMessagesController *)self shouldShowOnlineSafetyLink])
  {
    v85 = [(CKSettingsMessagesController *)self onlineSafetySettingsSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v85);
  }
  if (![(CKSettingsMessagesController *)self shouldShowInboxSummarySettings])
  {
    v86 = [(CKSettingsMessagesController *)self inboxSummarySettingsSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v7, v86);
  }
  if ([(CKSettingsMessagesController *)self _isSMSDevice]
    || [(CKSettingsMessagesController *)self _isMadridAccountOperational])
  {
    id v87 = v7;
  }
  else
  {
    id v88 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    v89 = [(CKSettingsMessagesController *)self madridSwitchSpecifierIdentifiers];
    uint64_t v90 = [v89 countByEnumeratingWithState:&v100 objects:v104 count:16];
    if (v90)
    {
      uint64_t v91 = *(void *)v101;
      do
      {
        for (uint64_t i = 0; i != v90; ++i)
        {
          if (*(void *)v101 != v91) {
            objc_enumerationMutation(v89);
          }
          v93 = [v7 specifierForID:*(void *)(*((void *)&v100 + 1) + 8 * i)];
          if (v93) {
            [v88 addObject:v93];
          }
        }
        uint64_t v90 = [v89 countByEnumeratingWithState:&v100 objects:v104 count:16];
      }
      while (v90);
    }

    id v87 = v88;
  }
  if ([(CKSettingsMessagesController *)self shouldShowCheckInLocationHistorySettings])
  {
    [(CKSettingsMessagesController *)self configureCheckInSpecifiers:v87];
  }
  else
  {
    v94 = [(CKSettingsMessagesController *)self checkInLocationHistorySettingsSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v87, v94);
  }
  if ([(CKSettingsMessagesController *)self _shouldShowSatelliteDemoModeButton])
  {
    v95 = @"TRY_DEMO_MODE_FOOTER_DESCRIPTION_WLAN";
    if (([MEMORY[0x263F4AF78] IMDeviceIsGreenTea] & 1) == 0
      && ![MEMORY[0x263F4AF78] IMDeviceIsChinaRegion])
    {
      v95 = @"TRY_DEMO_MODE_FOOTER_DESCRIPTION";
    }
    v96 = MessagesSettingsLocalizedString(v95);
    v97 = [v87 specifierForID:@"SATELLITE_MESSAGING_TITLE_ID"];
    [v97 setProperty:v96 forKey:v61];
  }
  else
  {
    v96 = [(CKSettingsMessagesController *)self _satelliteDemoModeSpecifierIdentifiers];
    _removeSpecifiersWithIdentifiers(v87, v96);
  }

  objc_storeStrong(v3, v87);
  id v4 = *v3;
LABEL_101:
  return v4;
}

- (void)_setupTextMessageGroupSpecifiers:(id)a3 wantsTextMessageBasicGroup:(BOOL)a4
{
  BOOL v42 = a4;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v46 = a3;
  v43 = self;
  id v5 = [(IMCTXPCServiceSubscriptionInfo *)self->_ctSubscriptionInfo __im_subscriptionsWithMMSSupport];
  uint8_t v6 = [MEMORY[0x263EFF8C0] array];
  id v7 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  int v8 = [v7 isLazuliEnabled];

  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v45 = [(IMCTXPCServiceSubscriptionInfo *)v43->_ctSubscriptionInfo __im_subscriptionsWithRCSSupport];

    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "count"));
        *(_DWORD *)buf = 138412290;
        v56 = v10;
        _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_INFO, "subscriptionsWithRCSSupport count %@", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v45 = v6;
  }
  uint64_t v44 = [v5 count];
  id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v5;
  uint64_t v11 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v11)
  {
    unsigned int v50 = 0;
    unsigned __int8 v12 = 0;
    uint64_t v49 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v52 != v49) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v15 = [MEMORY[0x263F4AF48] sharedInstance];
        v16 = (void *)[v15 copyCarrierBundleValueForSubscriptionContext:v14 keyHierarchy:&unk_26D075A28 defaultValue:MEMORY[0x263EFFA80] valueIfError:MEMORY[0x263EFFA80]];
        char v17 = [v16 BOOLValue];

        char v18 = (void *)MEMORY[0x263F4AF40];
        v19 = [v14 phoneNumber];
        v20 = [v14 labelID];
        v21 = [v18 IMUniqueIdentifierForPhoneNumber:v19 simID:v20];

        objc_super v22 = [NSString stringWithFormat:@"%@%@", @"MMSEnabled-", v21];
        v23 = [v14 phoneNumber];
        v24 = [v14 labelID];
        +[CKSettingsMMSHelper mmsDefaultEnabledForPhoneNumber:v23 simID:v24];

        if (IMGetDomainBoolForKeyWithDefaultValue())
        {
          [v47 addObject:v14];
          ++v50;
        }

        v12 |= v17;
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v11);
  }
  else
  {
    unsigned int v50 = 0;
    unsigned __int8 v12 = 0;
  }

  if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = [NSNumber numberWithUnsignedInteger:v44];
      v27 = [NSNumber numberWithInt:v50];
      v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v47, "count"));
      v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "count"));
      *(_DWORD *)buf = 138413058;
      v56 = v26;
      __int16 v57 = 2112;
      v58 = v27;
      __int16 v59 = 2112;
      v60 = v28;
      __int16 v61 = 2112;
      v62 = v29;
      _os_log_impl(&dword_21ED18000, v25, OS_LOG_TYPE_INFO, "ShouldShowMMS %@ subscriptionsWithMMSEnabledCount %@ subscriptionsWithMMSOverrideEnabledCount %@ subscriptionsWithRCSEnabledCount %@", buf, 0x2Au);
    }
  }
  if ([v45 count])
  {
    v30 = [(CKSettingsMessagesController *)v43 rcsMessagingController];
    [v30 setCtSubscriptions:v45];
  }
  else
  {
    v30 = [v46 specifierForID:@"RCS_MESSAGING_CELL"];
    [v46 removeObject:v30];
  }

  v31 = [v46 specifierForID:@"MMS_MESSAGING"];
  if (v44 == 1)
  {
    v32 = [obj objectAtIndexedSubscript:0];
    v33 = (void *)MEMORY[0x263F4AF40];
    v34 = [v32 phoneNumber];
    v35 = [v32 labelID];
    v36 = [v33 IMUniqueIdentifierForPhoneNumber:v34 simID:v35];

    [v31 setProperty:v36 forKey:@"subscriptionIdentifier"];
LABEL_30:
    v37 = [v46 specifierForID:@"MMS_MESSAGING_CELL"];
    [v46 removeObject:v37];
    goto LABEL_31;
  }
  [v46 removeObject:v31];

  if (v44 != 2) {
    goto LABEL_30;
  }
  v37 = [(CKSettingsMessagesController *)v43 mmsMessagingController];
  [v37 setCtSubscriptions:obj];
LABEL_31:

  if (!v50 && ![(CKSettingsMessagesController *)v43 _isMadridAccountOperational])
  {
    v38 = [v46 specifierForID:@"SHOW_SUBJECT_FIELD"];
    [v46 removeObject:v38];
  }
  if (v42)
  {
    if (v44)
    {
      if (v12) {
        goto LABEL_41;
      }
      goto LABEL_40;
    }
    if ([v45 count]) {
      goto LABEL_40;
    }
  }
  v39 = [v46 specifierForID:@"MMS_BASIC_GROUP"];
  [v46 removeObject:v39];

  if (((v44 != 0) & v12) == 0)
  {
LABEL_40:
    v40 = [v46 specifierForID:@"MMS_EMAIL_GROUP"];
    [v46 removeObject:v40];

    v41 = [v46 specifierForID:@"MMS_EMAIL_CELL"];
    [v46 removeObject:v41];
  }
LABEL_41:
}

- (void)setSpecifierLoading:(id)a3 loading:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = *MEMORY[0x263F60020];
  id v13 = v8;
  uint64_t v10 = [v8 propertyForKey:*MEMORY[0x263F60020]];
  int v11 = [v10 BOOLValue];

  if (v11 != v6)
  {
    unsigned __int8 v12 = [NSNumber numberWithBool:v6];
    [v13 setProperty:v12 forKey:v9];

    [(CKSettingsMessagesController *)self reloadSpecifier:v13 animated:v5];
  }
}

- (BOOL)shouldShowDeliveryReceipts
{
  return 0;
}

- (id)deliveryReceiptSpecifierIdentifiers
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithObject:@"DELIVERY_RECEIPTS_SWITCH"];
}

- (id)isDeliveryReportsEnabled:(id)a3
{
  unsigned __int8 v8 = 0;
  uint64_t v3 = objc_msgSend(MEMORY[0x263F02C98], "sharedMessageCenter", a3);
  int v4 = [v3 isDeliveryReportsEnabled:&v8];

  if (v4 == 2)
  {
    BOOL v5 = [MEMORY[0x263F02C98] sharedMessageCenter];
    [v5 isDeliveryReportsEnabled:&v8];
  }
  BOOL v6 = [NSNumber numberWithBool:v8];
  return v6;
}

- (void)setDeliveryReportsEnabled:(id)a3 specifier:(id)a4
{
  BOOL v5 = (void *)MEMORY[0x263F02C98];
  id v6 = a3;
  id v7 = [v5 sharedMessageCenter];
  uint64_t v8 = [v6 BOOLValue];

  [v7 setDeliveryReportsEnabled:v8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.EnableDeliveryReports.changed", 0, 0, 1u);
  [(CKSettingsMessagesController *)self reloadSpecifiers];
}

- (void)satelliteDemoModeTappedWithSpecifier:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_INFO, "Pressed satellite demo mode", v8, 2u);
    }
  }
  id v5 = objc_alloc_init(MEMORY[0x263F02CE8]);
  [v5 setReason:8];
  [v5 setMetadata:&unk_26D075B18];
  id v6 = objc_alloc(MEMORY[0x263F02D30]);
  id v7 = (void *)[v6 initWithQueue:MEMORY[0x263EF83A0]];
  [v7 requestStewieWithContext:v5 completion:&__block_literal_global_17];
}

void __69__CKSettingsMessagesController_satelliteDemoModeTappedWithSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __69__CKSettingsMessagesController_satelliteDemoModeTappedWithSpecifier___block_invoke_cold_1(v2, v3);
    }
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_5;
    }
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_INFO, "Presenting Satellite Demo app", v4, 2u);
    }
  }

LABEL_5:
}

- (BOOL)_shouldShowSatelliteDemoModeButton
{
  id v2 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  int v3 = [v2 isCarrierPigeonEnabled];

  if (v3)
  {
    int v4 = [MEMORY[0x263F4A548] sharedInstance];
    id v5 = [v4 getState];

    if (objc_opt_respondsToSelector())
    {
      if (([v5 isDemoAllowedForService:16] & 1) == 0
        && ([v5 isDemoAllowedForService:32] & 1) == 0)
      {
        goto LABEL_14;
      }
      if (objc_opt_respondsToSelector())
      {
        if (([v5 isPermittedAtCurrentLocation:16] & 1) != 0
          || ([v5 isPermittedAtCurrentLocation:32] & 1) != 0)
        {
          LOBYTE(v3) = 1;
LABEL_15:

          return v3;
        }
LABEL_14:
        LOBYTE(v3) = 0;
        goto LABEL_15;
      }
      id v6 = IMLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[CKSettingsMessagesController _shouldShowSatelliteDemoModeButton]();
      }
    }
    else
    {
      id v6 = IMLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[CKSettingsMessagesController _shouldShowSatelliteDemoModeButton]();
      }
    }

    goto LABEL_14;
  }
  return v3;
}

- (id)_satelliteDemoModeSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"SATELLITE_MESSAGING_TITLE_ID", @"TRY_DEMO_MODE_BUTTON_ACTION_ID", 0);
}

- (id)getMMSDictionary
{
  id v2 = [MEMORY[0x263F4AF48] sharedInstance];
  int v3 = [v2 ctSubscriptionInfo];
  int v4 = [v3 subscriptions];
  id v5 = [v4 firstObject];

  id v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"MMS", 0);
  id v7 = [MEMORY[0x263F4AF48] sharedInstance];
  uint64_t v8 = (void *)[v7 copyCarrierBundleValueForSubscriptionContext:v5 keyHierarchy:v6 defaultValue:0 valueIfError:0];

  return v8;
}

- (id)isMMSEnabled:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    int v4 = [MEMORY[0x263F4AF48] sharedInstance];
    id v5 = [v4 ctSubscriptionInfo];
    id v6 = [v5 subscriptions];
    id v7 = [v6 firstObject];

    uint64_t v8 = (void *)MEMORY[0x263F4AF40];
    uint64_t v9 = [v7 phoneNumber];
    uint64_t v10 = [v7 labelID];
    int v11 = [v8 IMUniqueIdentifierForPhoneNumber:v9 simID:v10];

    CFStringRef v12 = (const __CFString *)[NSString stringWithFormat:@"%@%@", @"MMSEnabled-", v11];
  }
  else
  {
    int v11 = 0;
    CFStringRef v12 = @"MMSEnabled";
  }
  Boolean keyExistsAndHasValidFormat = 0;
  id v13 = [MEMORY[0x263F3BB18] sharedInstance];
  int v14 = [v13 supportsMMS];

  BOOL v15 = CFPreferencesGetAppBooleanValue(v12, @"com.apple.MobileSMS", &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    v16 = [MEMORY[0x263F4AF48] sharedInstance];
    char v17 = [v16 ctSubscriptionInfo];
    char v18 = [v17 subscriptions];
    v19 = [v18 firstObject];

    v20 = [v19 phoneNumber];
    v21 = [v19 labelID];
    BOOL v15 = +[CKSettingsMMSHelper mmsDefaultEnabledForPhoneNumber:v20 simID:v21];
  }
  if (IMOSLoggingEnabled())
  {
    objc_super v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = @"NO";
      *(_DWORD *)buf = 138412802;
      v28 = v11;
      __int16 v29 = 2112;
      if ((v14 & v15) != 0) {
        v23 = @"YES";
      }
      CFStringRef v30 = v12;
      __int16 v31 = 2112;
      v32 = v23;
      _os_log_impl(&dword_21ED18000, v22, OS_LOG_TYPE_INFO, "isMMSEnabled for uniqueID %@ key %@: %@", buf, 0x20u);
    }
  }
  v24 = [NSNumber numberWithBool:v14 & v15];

  return v24;
}

- (void)setMMSEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    uint64_t v8 = [MEMORY[0x263F4AF48] sharedInstance];
    uint64_t v9 = [v8 ctSubscriptionInfo];
    uint64_t v10 = [v9 subscriptions];
    int v11 = [v10 firstObject];

    CFStringRef v12 = (void *)MEMORY[0x263F4AF40];
    id v13 = [v11 phoneNumber];
    int v14 = [v11 labelID];
    BOOL v15 = [v12 IMUniqueIdentifierForPhoneNumber:v13 simID:v14];

    CFStringRef v16 = (const __CFString *)[NSString stringWithFormat:@"%@%@", @"MMSEnabled-", v15];
  }
  else
  {
    BOOL v15 = 0;
    CFStringRef v16 = @"MMSEnabled";
  }
  CFPreferencesSetAppValue(v16, v6, @"com.apple.MobileSMS");
  if (IMOSLoggingEnabled())
  {
    char v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = [v6 BOOLValue];
      v19 = @"NO";
      *(_DWORD *)buf = 138412802;
      v27 = v15;
      __int16 v28 = 2112;
      if (v18) {
        v19 = @"YES";
      }
      __int16 v29 = (__CFString *)v16;
      __int16 v30 = 2112;
      __int16 v31 = v19;
      _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_INFO, "setMMSEnabled for uniqueID %@ key %@: %@", buf, 0x20u);
    }
  }
  if (([v6 BOOLValue] & 1) == 0
    && ![(CKSettingsMessagesController *)self _isMadridAccountOperational])
  {
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = [v6 BOOLValue];
        *(_DWORD *)buf = 138412802;
        v27 = v15;
        __int16 v28 = 2112;
        __int16 v29 = @"MMSShowSubject";
        if (v21) {
          objc_super v22 = @"YES";
        }
        else {
          objc_super v22 = @"NO";
        }
        __int16 v30 = 2112;
        __int16 v31 = v22;
        _os_log_impl(&dword_21ED18000, v20, OS_LOG_TYPE_INFO, "setShowSubject for uniqueID %@ key %@: %@", buf, 0x20u);
      }
    }
    CFPreferencesSetAppValue(@"MMSShowSubject", v6, @"com.apple.MobileSMS");
  }
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.MMSEnabled.changed", 0, 0, 1u);
  [(CKSettingsMessagesController *)self reloadSpecifiers];
  v24 = [(CKSettingsMessagesController *)self _syncManager];
  v25 = [MEMORY[0x263EFFA08] setWithObject:@"MMSEnabled"];
  [v24 synchronizeUserDefaultsDomain:@"com.apple.MobileSMS" keys:v25];
}

- (id)willSendGroupMMS:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    id v5 = [MEMORY[0x263F4AF48] sharedInstance];
    id v6 = [v5 ctSubscriptionInfo];
    id v7 = [v6 subscriptions];
    uint64_t v8 = [v7 firstObject];

    uint64_t v9 = (void *)MEMORY[0x263F4AF40];
    uint64_t v10 = [v8 phoneNumber];
    int v11 = [v8 labelID];
    CFStringRef v12 = [v9 IMUniqueIdentifierForPhoneNumber:v10 simID:v11];

    id v13 = 0;
  }
  else
  {
    id v13 = [(CKSettingsMessagesController *)self getMMSDictionary];
    uint64_t v8 = 0;
    CFStringRef v12 = 0;
  }
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    int v14 = [MEMORY[0x263F4AF48] sharedInstance];
    BOOL v15 = (void *)[v14 copyCarrierBundleValueForSubscriptionContext:v8 keyHierarchy:&unk_26D075A40 defaultValue:MEMORY[0x263EFFA80] valueIfError:MEMORY[0x263EFFA80]];
    CFStringRef v16 = (void *)[v15 BOOLValue];
  }
  else
  {
    CFStringRef v16 = [v13 objectForKey:@"GroupModeEnabled"];

    if (!v16) {
      goto LABEL_9;
    }
    int v14 = [v13 objectForKey:@"GroupModeEnabled"];
    CFStringRef v16 = (void *)[v14 BOOLValue];
  }

LABEL_9:
  if (IMOSLoggingEnabled())
  {
    char v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = @"NO";
      if (v16) {
        int v18 = @"YES";
      }
      int v21 = 138412546;
      objc_super v22 = v12;
      __int16 v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_INFO, "willSendGroupMMS for uniqueID %@ : %@", (uint8_t *)&v21, 0x16u);
    }
  }
  v19 = [NSNumber numberWithBool:v16];

  return v19;
}

- (id)getRaiseToListenEnabled:(id)a3
{
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v4 = CFPreferencesGetAppBooleanValue(@"RaiseToListenEnabled", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat) {
    BOOL v4 = [(CKSettingsMessagesController *)self _isRaiseGestureSupported];
  }
  id v5 = [NSNumber numberWithBool:v4];
  return v5;
}

- (void)setRaiseToListenEnabled:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"RaiseToListenEnabled", a3, @"com.apple.MobileSMS");
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.RaiseToListenEnabled.changed", 0, 0, 1u);
}

+ (BOOL)currentMessageAutoKeepForType:(int)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AutomaticallySaveAudioMessagesEnabled", @"com.apple.imessage", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

+ (int)currentMessageAutoKeepOptionForType:(int)a3
{
  if (!+[CKSettingsMessagesController currentMessageAutoKeepForType:*(void *)&a3])return 0; {
  id v3 = +[CKSettingsMessagesController currentKeepMessages];
  }
  if ([v3 integerValue] == 30)
  {
    int v4 = 1;
  }
  else if ([v3 integerValue] == 365)
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 3;
  }

  return v4;
}

- (id)getAudioMessageAutoKeep:(id)a3
{
  CFPreferencesSynchronize(@"com.apple.imessage", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  id v3 = NSNumber;
  uint64_t v4 = +[CKSettingsMessagesController currentMessageAutoKeepOptionForType:1];
  return (id)[v3 numberWithUnsignedInt:v4];
}

- (void)setAudioMessageAutoKeep:(id)a3 specifier:(id)a4
{
  if ([a3 integerValue]) {
    id v5 = (const void *)MEMORY[0x263EFFA88];
  }
  else {
    id v5 = (const void *)MEMORY[0x263EFFA80];
  }
  CFPreferencesSetAppValue(@"AutomaticallySaveAudioMessagesEnabled", v5, @"com.apple.imessage");
  CFPreferencesSynchronize(@"com.apple.imessage", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  id v7 = [(CKSettingsMessagesController *)self _syncManager];
  id v6 = [MEMORY[0x263EFFA08] setWithObject:@"AutomaticallySaveAudioMessagesEnabled"];
  [v7 synchronizeUserDefaultsDomain:@"com.apple.imessage" keys:v6];
}

- (id)_syncManager
{
  id v2 = (objc_class *)CUTWeakLinkClass();
  if (v2) {
    id v2 = (objc_class *)objc_alloc_init(v2);
  }
  return v2;
}

- (BOOL)_isSMSDevice
{
  id v2 = [MEMORY[0x263F3BB18] sharedInstance];
  char v3 = [v2 supportsSMS];

  return v3;
}

- (BOOL)_isMadridAccountOperational
{
  char v3 = [(CNFRegListController *)self regController];
  if ([v3 isServiceSupported])
  {
    uint64_t v4 = [(CNFRegListController *)self regController];
    int v5 = [v4 isServiceEnabled];

    if (v5)
    {
      id v6 = [(CNFRegListController *)self regController];
      int v7 = [v6 accountState];

      return (v7 & 0x60000000) == 0x40000000;
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)_isMadridSwitchOn
{
  char v3 = [(CNFRegListController *)self regController];
  if ([v3 isServiceEnabled])
  {
    char v4 = 1;
  }
  else
  {
    int v5 = [(CNFRegListController *)self regController];
    char v4 = [v5 isAccountKeyCDPSyncingOrWaitingForUser];
  }
  return v4;
}

- (BOOL)shouldShowMadridSwitch
{
  id v2 = [(CNFRegListController *)self regController];
  char v3 = [v2 isServiceSupported];

  return v3;
}

- (id)madridSwitchSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"MADRID_ENABLED_GROUP", @"MADRID_ENABLED_SWITCH", 0);
}

- (id)isMadridEnabled:(id)a3
{
  char v3 = NSNumber;
  BOOL v4 = [(CKSettingsMessagesController *)self _isMadridSwitchOn];
  return (id)[v3 numberWithBool:v4];
}

- (void)setMadridEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 intValue];
    uint64_t v10 = @"YES";
    if (!v9) {
      uint64_t v10 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v40 = v10;
    _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "setMadridEnabled: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    int v11 = [v6 intValue];
    CFStringRef v12 = @"YES";
    if (!v11) {
      CFStringRef v12 = @"NO";
    }
    v36 = v12;
    IMLogString();
  }
  int v13 = objc_msgSend(v6, "BOOLValue", v36);
  if (!v13 || ![(CNFRegListController *)self _showWiFiAlertIfNecessary])
  {
    [(CKSettingsMessagesController *)self _clearMessagesAppExtensionSalt];
    BOOL v15 = [(CNFRegListController *)self regController];
    IMSetUserLoginIntent();
    if (!v13)
    {
      int v18 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v18, OS_LOG_TYPE_DEFAULT, "Deactivating accounts", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      [(CKSettingsMessagesController *)self _setupAccountHandlersForDisabling];
      [v15 deactivateAccounts];
      goto LABEL_32;
    }
    [(CKSettingsMessagesController *)self _setupAccountHandlers];
    CFStringRef v16 = [v15 accounts];
    char v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v16;
      _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_DEFAULT, "Attempting to enable iMessage for accounts %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v37 = v16;
      IMLogString();
    }
    if (v16 && [(__CFString *)v16 count])
    {
      [v15 activateAccounts];

LABEL_32:
      [(CKSettingsMessagesController *)self notifyThatConversationFilteringChanged];
      [(CKSettingsMessagesController *)self reloadSpecifiers];
LABEL_46:

      goto LABEL_47;
    }
    v19 = [(CNFRegListController *)self regController];
    if ([v19 isConnected])
    {
      if (![(CKSettingsMessagesController *)self _isSMSDevice])
      {

LABEL_44:
        [(CKSettingsMessagesController *)self _showMadridSetupIfNecessary:0];
        goto LABEL_45;
      }
      v20 = [MEMORY[0x263F4A1F0] sharedInstance];
      char v21 = [v20 supportsIdentification];

      if ((v21 & 1) == 0) {
        goto LABEL_44;
      }
    }
    else
    {
    }
    objc_super v22 = [(CNFRegListController *)self regController];
    if ([v22 serviceSupportsDeviceAliasEnablement])
    {
      __int16 v23 = [(CNFRegListController *)self regController];
      v24 = [v23 usableDeviceAliases];
      BOOL v25 = [v24 count] == 0;

      if (!v25)
      {
        v38 = [[CNFRegController alloc] initWithServiceType:1];
        [(CNFRegController *)v38 connect:1];
        v26 = [(CNFRegListController *)[CNFRegSettingsController alloc] initWithRegController:v38];
        v27 = [(CKSettingsMessagesController *)self rootController];
        [(CNFRegSettingsController *)v26 setRootController:v27];

        [(CNFRegSettingsController *)v26 setParentController:self];
        __int16 v28 = [(CKSettingsMessagesController *)self specifier];
        [(CNFRegListController *)v26 setSpecifier:v28];

        [(CNFRegSettingsController *)v26 setShowEnableSwitch:0];
        __int16 v29 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v26];
        __int16 v30 = +[CNFRegAppearanceController globalAppearanceController];
        uint64_t v31 = [v30 navigationBarStyle];
        uint64_t v32 = [v29 navigationBar];
        [v32 setBarStyle:v31];

        uint64_t v33 = [v30 navigationBarIsTranslucent];
        v34 = [v29 navigationBar];
        [v34 setTranslucent:v33];

        v35 = [(CNFRegListController *)self regController];
        [v35 connect:1];

        [(CKSettingsMessagesController *)self presentModalViewController:v29 withTransition:3];
        [(CKSettingsMessagesController *)self reloadSpecifiers];

LABEL_45:
        goto LABEL_46;
      }
    }
    else
    {
    }
    [(CKSettingsMessagesController *)self reloadSpecifiers];
    goto LABEL_45;
  }
  [(CKSettingsMessagesController *)self reloadSpecifier:v7];
  int v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "No reasonable network found - not enabling iMessage", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
LABEL_47:
}

- (BOOL)_isIDSDelayRegistrationEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)_isRegistrationInProgress
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = [(CNFRegListController *)self regController];
  char v3 = [v2 activeAccounts];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    int v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v4);
        }
        int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "registrationStatus", (void)v14) >= 2) {
          v7 |= [v11 CNFRegSignInComplete] ^ 1;
        }
        v8 |= [v11 CNFRegSignInComplete];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
    uint64_t v12 = v8 ^ 1u;
  }
  else
  {
    LOBYTE(v7) = 0;
    LOBYTE(v12) = 1;
  }

  return v7 & v12 & 1;
}

- (id)_failedAccounts
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [(CNFRegListController *)self regController];
  char v3 = [v2 failedAccounts];

  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
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
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "registrationFailureReason", (void)v12) != 14) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (id)_registrationFailures
{
  v25[1] = *MEMORY[0x263EF8340];
  if (![(CKSettingsMessagesController *)self _isIDSDelayRegistrationEnabled]
    || (int64_t v3 = [(CKSettingsMessagesController *)self _debugFailureReason], v3 == -1))
  {
    id v7 = [(CKSettingsMessagesController *)self _failedAccounts];
    if ([v7 count])
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v7;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            objc_msgSend(v12, "registrationFailureReason", (void)v16);
            if ([(CKSettingsMessagesController *)self _isIDSDelayRegistrationEnabled]
              || ([v12 isAccountKeyCDPSyncingOrWaitingForUser] & 1) == 0)
            {
              long long v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "registrationFailureReason"));
              [v8 addObject:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
        }
        while (v9);
      }

      if (IMOSLoggingEnabled())
      {
        long long v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v21 = v7;
          __int16 v22 = 2112;
          id v23 = v8;
          _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_INFO, "Failed accounts: %@ with registration failures: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v8 = (id)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    int64_t v4 = v3;
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = [NSNumber numberWithInteger:v4];
        *(_DWORD *)buf = 138412290;
        id v21 = v6;
        _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_INFO, "Using debug registration failure: %@", buf, 0xCu);
      }
    }
    id v7 = [NSNumber numberWithInteger:v4];
    v25[0] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  }

  return v8;
}

- (BOOL)_registrationFailures:(id)a3 containsFailure:(int64_t)a4
{
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithInteger:a4];
  LOBYTE(v5) = [v6 containsObject:v7];

  return (char)v5;
}

- (BOOL)_registrationFailures:(id)a3 areAllOfKind:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if ((int)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "intValue", (void)v13) != a4)
          {
            BOOL v11 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 1;
LABEL_12:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)_switchFooterText:(unint64_t *)a3
{
  id v5 = CommunicationsSetupUIBundle();
  id v6 = CNFRegStringTableName();
  uint64_t v7 = [v5 localizedStringForKey:@"FACETIME_SWITCH_STATUS_DEFAULT" value:&stru_26D05D4F8 table:v6];

  if (MGGetBoolAnswer())
  {
    uint64_t v8 = [MEMORY[0x263F3BB18] sharedInstance];
    int v9 = [v8 supportsSMSIdentification];

    if (v9)
    {
      uint64_t v10 = CommunicationsSetupUIBundle();
      BOOL v11 = CNFRegStringTableName();
      uint64_t v12 = [v10 localizedStringForKey:@"FACETIME_SWITCH_STATUS_DEFAULT_WITH_WARNING" value:&stru_26D05D4F8 table:v11];

      uint64_t v7 = (void *)v12;
    }
  }
  BOOL v13 = [(CKSettingsMessagesController *)self _isRegistrationInProgress];
  long long v14 = [(CKSettingsMessagesController *)self _registrationFailures];
  long long v15 = v14;
  if (v13)
  {
    long long v16 = CommunicationsSetupUIBundle();
    long long v17 = CNFRegStringTableName();
    uint64_t v18 = [v16 localizedStringForKey:@"FACETIME_SWITCH_STATUS_IN_PROGRESS" value:&stru_26D05D4F8 table:v17];

    if (!a3) {
      goto LABEL_21;
    }
    unint64_t v19 = 2;
  }
  else if ([v14 count])
  {
    if ([(CKSettingsMessagesController *)self _registrationFailures:v15 containsFailure:28])
    {
      char v20 = _os_feature_enabled_impl();
      id v21 = CommunicationsSetupUIBundle();
      __int16 v22 = CNFRegStringTableName();
      if (v20) {
        id v23 = @"UPDATE_APPLEID_DESCRIPTION_APPLEACCOUNT";
      }
      else {
        id v23 = @"UPDATE_APPLEID_DESCRIPTION";
      }
    }
    else
    {
      BOOL v24 = [(CKSettingsMessagesController *)self _registrationFailures:v15 containsFailure:29];
      id v21 = CommunicationsSetupUIBundle();
      __int16 v22 = CNFRegStringTableName();
      if (v24) {
        id v23 = @"WAITING_FOR_ICLOUD_DESCRIPTION";
      }
      else {
        id v23 = @"FACETIME_SWITCH_STATUS_FAILED";
      }
    }
    uint64_t v18 = [v21 localizedStringForKey:v23 value:&stru_26D05D4F8 table:v22];

    if (!a3) {
      goto LABEL_21;
    }
    unint64_t v19 = 0;
  }
  else
  {
    if (!a3)
    {
      uint64_t v18 = v7;
      goto LABEL_21;
    }
    unint64_t v19 = 1;
    uint64_t v18 = v7;
  }
  *a3 = v19;
LABEL_21:

  return v18;
}

- (void)_updateSwitchDelayed
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateSwitch object:0];
  [(CKSettingsMessagesController *)self performSelector:sel__updateSwitch withObject:0 afterDelay:0.75];
}

- (id)genericSettingsSpecifierIdentifiers
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithObject:@"GENERIC_SETTINGS"];
}

- (id)characterCountSpecifierIdentifiers
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithObject:@"CHARACTER_COUNT_SWITCH"];
}

- (BOOL)shouldShowBlocklistSettings
{
  if ([(CKSettingsMessagesController *)self _isSMSDevice]) {
    return 1;
  }
  return [(CKSettingsMessagesController *)self _isMadridAccountOperational];
}

- (id)blocklistSettingsSpecifierIdentifiers
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithObject:@"BLOCKLIST_SETTINGS"];
}

- (BOOL)_isRaiseGestureSupported
{
  if (_isRaiseGestureSupported_once != -1) {
    dispatch_once(&_isRaiseGestureSupported_once, &__block_literal_global_505);
  }
  return _isRaiseGestureSupported_isRaiseGestureSupported;
}

void __56__CKSettingsMessagesController__isRaiseGestureSupported__block_invoke()
{
  if ([MEMORY[0x263F01750] isGestureServiceAvailable])
  {
    id v1 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v0 = [v1 isProximityMonitoringEnabled];
    [v1 setProximityMonitoringEnabled:1];
    _isRaiseGestureSupported_isRaiseGestureSupported = [v1 isProximityMonitoringEnabled];
    [v1 setProximityMonitoringEnabled:v0];
  }
}

- (id)raiseToListenSpecifierIdentifiers
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithObject:@"RAISE_TO_LISTEN_SWITCH"];
}

+ (id)getDefaultExtension
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"spamFiltrationExtensionID", @"com.apple.MobileSMS");
  return v2;
}

- (void)notifyThatConversationFilteringChanged
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.IncomingMessageAlertFiltration.changed", 0, 0, 1u);
}

- (void)endMatchingExtensions
{
  if ([(CKFilteringListController *)self->_filteringController deviceSupportsSMSFilteringExtensions])
  {
    [(CKNSExtension *)self->_ckExtension endMatchingExtensions];
    ckExtension = self->_ckExtension;
    self->_ckExtension = 0;
  }
}

- (void)findSpamExtensions
{
  if ([(CKFilteringListController *)self->_filteringController deviceSupportsSMSFilteringExtensions])
  {
    if (!self->_ckExtension)
    {
      int64_t v3 = objc_alloc_init(CKNSExtension);
      ckExtension = self->_ckExtension;
      self->_ckExtension = v3;

      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __50__CKSettingsMessagesController_findSpamExtensions__block_invoke;
      v6[3] = &unk_2644F0D18;
      v6[4] = self;
      id v5 = (void *)MEMORY[0x223C3AA40](v6);
      [(CKNSExtension *)self->_ckExtension beginMatchingExtensions:v5];
    }
  }
}

void __50__CKSettingsMessagesController_findSpamExtensions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v12 = +[CKSettingsMessagesController removeFirstPartyExtensionFromArrayIfNecessary:a2];
  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 1416) extensionIDArray];
  uint64_t v8 = [v6 setWithArray:v7];

  int v9 = [MEMORY[0x263EFFA08] setWithArray:v12];
  if (([v8 isEqualToSet:v9] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 1416) setExtensionIDArray:v12];
    [*(id *)(*(void *)(a1 + 32) + 1416) setExtensionNameMapping:v5];
    [*(id *)(a1 + 32) reloadSpecifiers];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 1416) spamFilterState] == 1)
  {
    if (![v12 count])
    {
      [*(id *)(*(void *)(a1 + 32) + 1416) disableSpamFiltering];
      [*(id *)(a1 + 32) reloadSpecifiers];
    }
    [*(id *)(*(void *)(a1 + 32) + 1416) verifyCurrentExtensionIDValidity];
  }
  uint64_t v10 = [v12 count];
  BOOL v11 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!v10) {
    BOOL v11 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"MessageSpamFilteringExtensionInstalled", *v11, @"com.apple.MobileSMS");
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
}

+ (id)removeFirstPartyExtensionFromArrayIfNecessary:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v26 = v4;
  if ([a1 shouldShowFirstPartyExtension])
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          BOOL v13 = [v12 identifier];
          int v14 = [v13 isEqualToString:@"com.apple.smsFilter.extension"];

          if (v14) {
            long long v15 = v5;
          }
          else {
            long long v15 = v6;
          }
          [v15 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v9);
    }

    [v5 addObjectsFromArray:v6];
    long long v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v17 = v4;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          __int16 v22 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          id v23 = [v22 identifier];
          char v24 = [v23 isEqualToString:@"com.apple.smsFilter.extension"];

          if ((v24 & 1) == 0) {
            [v5 addObject:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v19);
    }

    long long v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
  }

  return v16;
}

- (void)messageFilteringTapped:(id)a3
{
  [(CKFilteringListController *)self->_filteringController setSpecifier:a3];
  filteringController = self->_filteringController;
  id v5 = [(CKSettingsMessagesController *)self rootController];
  [(CKFilteringListController *)filteringController setRootController:v5];

  self->_showingChildViewController = 1;
  [(CKFilteringListController *)self->_filteringController setShowingParentViewController:1];
  id v6 = self->_filteringController;
  [(CKSettingsMessagesController *)self showController:v6 animate:1];
}

- (BOOL)shouldShowiMessageFilteringSettings:(id)a3
{
  return !a3 || [a3 count] == 0;
}

- (id)iMessageFilteringSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"MADRID_FILTER_SWITCH", 0);
}

- (id)spamFilteringSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"SPAM_FILTERING", 0);
}

- (id)junkConversationsRowIdentifier
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"JUNK_CONVERSATIONS_BUTTON", 0);
}

- (id)junkFilterReceiptsRowIdentifier
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"JUNK_FILTERING_RECEIPTS_GROUP", @"JUNK_FILTERING_RECEIPTS_SWITCH", 0);
}

- (id)isConversationListFilteringEnabled:(id)a3
{
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"IncomingMessageAlertFiltration", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  uint64_t v5 = !v4;
  id v6 = [NSNumber numberWithBool:v5];
  return v6;
}

- (void)setConversationListFilteringEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v7 = [(CKSettingsMessagesController *)self sharedSettingsHelper];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setConversationListFilteringEnabled:v6];
}

- (BOOL)shouldShowJunkConversationsRow
{
  id v2 = (uint64_t (*)(void))CUTWeakLinkSymbol();
  if (v2)
  {
    LOBYTE(v2) = v2();
  }
  return (char)v2;
}

+ (BOOL)shouldShowFirstPartyExtension
{
  id v2 = [a1 getDefaultExtension];
  char v3 = [v2 isEqualToString:@"com.apple.smsFilter.extension"];

  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    BOOL v4 = (uint64_t (*)(void))CUTWeakLinkSymbol();
    if (v4)
    {
      LOBYTE(v4) = v4();
    }
  }
  return (char)v4;
}

- (BOOL)shouldShowSiriSettings
{
  if (IMGetDomainBoolForKey()) {
    IMSetDomainBoolForKey();
  }
  return 0;
}

- (BOOL)isPersonalCompanionEnabled
{
  return IMGetDomainBoolForKey();
}

- (id)siriSettingsIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"SIRI_GROUP", @"SIRI_TONE_NOTIFICATION_SWITCH", 0);
}

- (id)isSiriToneNotificationEnabled:(id)a3
{
  char v3 = NSNumber;
  uint64_t v4 = IMGetDomainBoolForKey() ^ 1;
  return (id)[v3 numberWithInt:v4];
}

- (void)setSiriToneNotificationEnabled:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];
  IMSetDomainBoolForKey();
}

- (id)audioMessageSettingsSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"AUDIO_MESSAGES_GROUP", @"EXPIRE_AUDIO_MESSAGES", @"RAISE_TO_LISTEN_SWITCH", 0);
}

- (BOOL)shouldShowContactPhotoSettings
{
  id v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 1;
  }
  id v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 _referenceBounds];
  double v7 = v6;

  return v7 > 320.0;
}

- (id)contactPhotoSettingsSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"CONTACT_PHOTO_GROUP", @"CONTACT_PHOTO_SWITCH", 0);
}

- (id)nameAndPhotoSharingSpecifiers
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"NAME_AND_PHOTO_SHARING_GROUP";
  v4[1] = @"NAME_AND_PHOTO_SHARING_BUTTON";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

- (BOOL)shouldShowNicknames
{
  return MEMORY[0x270F3D0F0](self, a2);
}

- (void)showiCloudNotSignedInAlertForNicknames
{
  uint64_t v3 = (void *)MEMORY[0x263F82418];
  uint64_t v4 = MessagesSettingsLocalizedString(@"NAME_AND_PHOTO_SHARING_NOT_AVAILABLE_TITLE");
  id v5 = MessagesSettingsLocalizedString(@"NAME_AND_PHOTO_SHARING_ACCOUNT_MISMATCH_MESSAGE");
  id v15 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  if (_os_feature_enabled_impl())
  {
    if (_os_feature_enabled_impl()) {
      double v6 = @"NAME_AND_PHOTO_SHARING_ICLOUD_NOT_SIGNED_IN_MESSAGE_APPLEACCOUNT";
    }
    else {
      double v6 = @"NAME_AND_PHOTO_SHARING_ICLOUD_NOT_SIGNED_IN_MESSAGE";
    }
    double v7 = MessagesSettingsLocalizedString(v6);
    uint64_t v8 = (void *)MEMORY[0x263F82418];
    uint64_t v9 = MessagesSettingsLocalizedString(@"NAME_AND_PHOTO_SHARING_NOT_AVAILABLE_TITLE");
    uint64_t v10 = [v8 alertControllerWithTitle:v9 message:v7 preferredStyle:1];

    id v15 = (id)v10;
  }
  BOOL v11 = (void *)MEMORY[0x263F82400];
  id v12 = MessagesSettingsLocalizedString(@"NAME_AND_PHOTO_SHARING_ME_CARD_SETUP_PROMPT_OK");
  BOOL v13 = [v11 actionWithTitle:v12 style:0 handler:0];

  [v15 addAction:v13];
  int v14 = [(CKSettingsMessagesController *)self navigationController];
  [v14 presentViewController:v15 animated:1 completion:0];
}

- (BOOL)shouldShowOnlineSafetyLink
{
  id v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 0;
  }
  id v5 = [MEMORY[0x263EFF960] currentLocale];
  double v6 = [v5 regionCode];
  char v7 = [v6 isEqualToString:@"AU"];

  return v7;
}

- (void)showMultiplePhoneNumbersAlertForNicknames
{
  if (_os_feature_enabled_impl()) {
    uint64_t v3 = @"NAME_AND_PHOTO_SHARING_MULTIPLE_PHONE_NUMBERS_MESSAGE_APPLEACCOUNT";
  }
  else {
    uint64_t v3 = @"NAME_AND_PHOTO_SHARING_MULTIPLE_PHONE_NUMBERS_MESSAGE";
  }
  MessagesSettingsLocalizedString(v3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)MEMORY[0x263F82418];
  id v5 = MessagesSettingsLocalizedString(@"NAME_AND_PHOTO_SHARING_NOT_AVAILABLE_TITLE");
  double v6 = [v4 alertControllerWithTitle:v5 message:v11 preferredStyle:1];

  char v7 = (void *)MEMORY[0x263F82400];
  uint64_t v8 = MessagesSettingsLocalizedString(@"NAME_AND_PHOTO_SHARING_ME_CARD_SETUP_PROMPT_OK");
  uint64_t v9 = [v7 actionWithTitle:v8 style:0 handler:0];

  [v6 addAction:v9];
  uint64_t v10 = [(CKSettingsMessagesController *)self navigationController];
  [v10 presentViewController:v6 animated:1 completion:0];
}

- (void)nameAndPhotoSharingForSpecifier:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F4AFB0], "sharedInstance", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![MEMORY[0x263F4A5D0] performSelector:sel_iCloudSignedInToUseNicknames withObject:0])
  {
    [(CKSettingsMessagesController *)self showiCloudNotSignedInAlertForNicknames];
    goto LABEL_12;
  }
  id v5 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    if (![MEMORY[0x263F4A5D0] performSelector:sel_multiplePhoneNumbersTiedToAppleID withObject:0]) {
      goto LABEL_13;
    }
    [(CKSettingsMessagesController *)self showMultiplePhoneNumbersAlertForNicknames];
LABEL_12:
    [v4 setSharingEnabled:0];
    goto LABEL_20;
  }
  double v6 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  if (![v6 isAllowMultiplePhoneNumbersSNaPEnabled])
  {
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }

LABEL_13:
  uint64_t v9 = [MEMORY[0x263F82670] currentDevice];
  if ([v9 userInterfaceIdiom])
  {
    uint64_t v10 = [MEMORY[0x263F82670] currentDevice];
    BOOL v11 = [v10 userInterfaceIdiom] == 1;
  }
  else
  {
    BOOL v11 = 1;
  }

  if (_os_feature_enabled_impl() && v11)
  {
    [(CKSettingsMessagesController *)self showNicknameOnboardingOrEditFlowController];
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke;
    v17[3] = &unk_2644F12A8;
    v17[4] = self;
    id v12 = (void *)MEMORY[0x223C3AA40](v17);
    BOOL v13 = [MEMORY[0x263F4A5D0] sharedInstance];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke_3;
    v15[3] = &unk_2644F12F8;
    id v16 = v12;
    id v14 = v12;
    [v13 fetchPersonalNicknameWithCompletion:v15];
  }
LABEL_20:
}

void __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke_2;
  v6[3] = &unk_2644F0868;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v1 = *(void **)(a1 + 40);
  if (v2) {
    return objc_msgSend(v1, "showMeCardViewControllerWithNickname:");
  }
  else {
    return [v1 showNicknameOnboardingController];
  }
}

void __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke_4;
  v6[3] = &unk_2644F12D0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __64__CKSettingsMessagesController_nameAndPhotoSharingForSpecifier___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)showNicknameOnboardingController
{
  id v3 = (objc_class *)CUTWeakLinkClass();
  if (v3)
  {
    id v4 = objc_alloc_init(v3);
    [(CKSettingsMessagesController *)self setOnboardingController:v4];

    id v5 = [(CKSettingsMessagesController *)self onboardingController];
    [v5 setDelegate:self];

    id v6 = [(CKSettingsMessagesController *)self onboardingController];
    [v6 presentNicknameSharingSetupFlow];
  }
}

- (void)showNicknameOnboardingOrEditFlowController
{
  id v3 = (objc_class *)CUTWeakLinkClass();
  if (v3)
  {
    id v4 = objc_alloc_init(v3);
    [(CKSettingsMessagesController *)self setOnboardingController:v4];

    id v5 = [(CKSettingsMessagesController *)self onboardingController];
    [v5 setDelegate:self];

    id v6 = [(CKSettingsMessagesController *)self onboardingController];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(CKSettingsMessagesController *)self onboardingController];
      [v8 performSelector:sel_presentNicknameOnboardingOrEditFlow];
    }
  }
}

- (void)onboardingControllerDidFinish:(id)a3
{
  [(CKSettingsMessagesController *)self setOnboardingController:0];
  [(CKSettingsMessagesController *)self reloadSpecifiers];
}

- (void)showMeCardViewControllerWithNickname:(id)a3
{
  id v18 = a3;
  if (objc_opt_class())
  {
    id v4 = [MEMORY[0x263F4AF60] sharedInstance];
    id v5 = [MEMORY[0x263F4AF60] keysForNicknameHandling];
    id v6 = [v4 fetchMeContactWithKeys:v5];

    char v7 = +[CKSettingsMeCardSharingNameProvider nameProviderForNickname:v18];
    id v8 = [MEMORY[0x263F4AF60] sharedInstance];
    uint64_t v9 = [v8 getContactStore];

    BOOL v10 = [(CKSettingsMessagesController *)self _meCardSharingEnabled];
    unint64_t v11 = [(CKSettingsMessagesController *)self _meCardSharingAudience];
    if ([(CKSettingsMessagesController *)self _imageForkedFromMeCard])
    {
      id v12 = [CKSettingsMeCardSharingNicknameAvatarProvider alloc];
      BOOL v13 = [v18 avatar];
      id v14 = [v13 imageData];
      id v15 = [(CKSettingsMeCardSharingNicknameAvatarProvider *)v12 initWithImageData:v14];
    }
    else
    {
      id v15 = (CKSettingsMeCardSharingNicknameAvatarProvider *)[objc_alloc(MEMORY[0x263EFEC10]) initWithContact:v6];
    }
    id v16 = (void *)[objc_alloc(MEMORY[0x263EFEC18]) initWithContactStore:v9 contact:v6 avatarProvider:v15 nameProvider:v7 sharingEnabled:v10 selectedSharingAudience:v11];
    [v16 setDelegate:self];
    id v17 = [(CKSettingsMessagesController *)self navigationController];
    [v17 pushViewController:v16 animated:1];
  }
}

- (id)getNameAndPhotoSharingSpecifierSummary:(id)a3
{
  if (![(CKSettingsMessagesController *)self _meCardSharingEnabled])
  {
    id v6 = @"GENERAL_OFF";
    goto LABEL_6;
  }
  id v4 = objc_opt_class();
  if (!v4) {
    goto LABEL_8;
  }
  unint64_t v5 = [(CKSettingsMessagesController *)self _meCardSharingAudience];
  if (v5 <= 2)
  {
    id v6 = off_2644F1318[v5];
LABEL_6:
    id v4 = MessagesSettingsLocalizedString(v6);
    goto LABEL_8;
  }
  id v4 = 0;
LABEL_8:
  return v4;
}

- (id)getNameAndPhotoSharingFooterText
{
  if (![(CKSettingsMessagesController *)self _meCardSharingEnabled])
  {
    unint64_t v5 = @"NAME_AND_PHOTO_SHARING_NOT_SHARING_FOOTER";
LABEL_9:
    MessagesSettingsLocalizedString(v5);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (objc_opt_class())
  {
    unint64_t v3 = [(CKSettingsMessagesController *)self _meCardSharingAudience];
    id v4 = @"NAME_AND_PHOTO_SHARING_EVERYONE_FOOTER";
    if (v3 == 1) {
      id v4 = @"NAME_AND_PHOTO_SHARING_CONTACTS_ONLY_FOOTER";
    }
    if (v3 == 2) {
      unint64_t v5 = @"NAME_AND_PHOTO_SHARING_ALWAYS_ASK_FOOTER";
    }
    else {
      unint64_t v5 = v4;
    }
    goto LABEL_9;
  }
  id v6 = &stru_26D05D4F8;
LABEL_11:
  return v6;
}

- (void)_showSetupMeCardAlert
{
  MessagesSettingsLocalizedString(@"NAME_AND_PHOTO_SHARING_ME_CARD_SETUP_PROMPT_TITLE");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = MessagesSettingsLocalizedString(@"NAME_AND_PHOTO_SHARING_ME_CARD_SETUP_PROMPT_MESSAGE");
  id v4 = MessagesSettingsLocalizedString(@"NAME_AND_PHOTO_SHARING_ME_CARD_SETUP_PROMPT_OK");
  unint64_t v5 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v3 preferredStyle:1];
  id v6 = [MEMORY[0x263F82400] actionWithTitle:v4 style:0 handler:0];
  [v5 addAction:v6];

  [(CKSettingsMessagesController *)self presentViewController:v5 animated:1 completion:0];
}

- (BOOL)_meCardSharingEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MeCardSharingEnabled", @"com.apple.messages.nicknames", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (unint64_t)_meCardSharingAudience
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"MeCardSharingAudience", @"com.apple.messages.nicknames", &keyExistsAndHasValidFormat);
  uint64_t v3 = objc_opt_class();
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (v4) {
    return AppIntegerValue;
  }
  else {
    return 1;
  }
}

- (BOOL)_imageForkedFromMeCard
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MeCardSharingImageForkedFromMeCard", @"com.apple.messages.nicknames", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (id)onlineSafetySettingsSpecifierIdentifiers
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"ONLINE_SAFETY_GROUP";
  v4[1] = @"ONLINE_SAFETY_BUTTON";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

- (id)sharedWithYouSettingsSpecifierIdentifiers
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"SHARED_WITH_YOU_GROUP";
  v4[1] = @"SHARED_WITH_YOU_BUTTON";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

- (BOOL)shouldShowSharedWithYouSettings
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  return _os_feature_enabled_impl();
}

- (id)getSharedWithYouForSpecifier:(id)a3
{
  BOOL v4 = MessagesSettingsLocalizedString(@"GENERAL_ON");
  unint64_t v5 = MessagesSettingsLocalizedString(@"GENERAL_OFF");
  if ([(CKSettingsMessagesController *)self _sharedWithYouEnabled]) {
    id v6 = v4;
  }
  else {
    id v6 = v5;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)_sharedWithYouEnabled
{
  if ([MEMORY[0x263F4AF78] deviceIsLockedDown]) {
    return 0;
  }
  BOOL v3 = [MEMORY[0x263F4AF68] sharedInstance];
  char v4 = [v3 getBoolFromDomain:@"com.apple.SocialLayer" forKey:@"SharedWithYouEnabled"];

  return v4;
}

- (id)_sharedWithYouViewController
{
  BOOL v3 = objc_alloc_init(CKSettingsSharedWithYouController);
  [(CKSettingsSharedWithYouController *)v3 setParentController:self];
  char v4 = [(CKSettingsMessagesController *)self rootController];
  [(CKSettingsSharedWithYouController *)v3 setRootController:v4];

  return v3;
}

- (id)inboxSummarySettingsSpecifierIdentifiers
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"INBOX_SUMMARY_GROUP";
  v4[1] = @"INBOX_SUMMARY_SWITCH";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

- (BOOL)shouldShowInboxSummarySettings
{
  uint64_t v2 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    return 0;
  }
  char v4 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  char v5 = [v4 generativeModelsAvailable];

  return v5;
}

- (id)isInboxSummarizationEnabled:(id)a3
{
  char v3 = objc_msgSend(MEMORY[0x263F4AF80], "sharedFeatureFlags", a3);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
    uint64_t v6 = [v5 summarizationUserPreferenceEnabled];
  }
  else
  {
    uint64_t v6 = 1;
  }
  id v7 = NSNumber;
  return (id)[v7 numberWithBool:v6];
}

- (void)setInboxSummarizationEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue];
  char v5 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
    [v7 setSummarizationUserPreferenceEnabled:v4];
  }
}

- (BOOL)shouldShowCheckInLocationHistorySettings
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    uint64_t v4 = v3;
    if (!CFEqual(v3, @"iPhone"))
    {
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v8 = 138412290;
          uint64_t v9 = v4;
          _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_INFO, "Check In not supported for device type: %@", (uint8_t *)&v8, 0xCu);
        }
      }
      CFRelease(v4);
      return 0;
    }
    CFRelease(v4);
  }
  if (![(CKSettingsMessagesController *)self isCheckInAllowedInRegion])
  {
    if (IMOSLoggingEnabled())
    {
      char v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_INFO, "Check In not supported in region", (uint8_t *)&v8, 2u);
      }
      goto LABEL_21;
    }
    return 0;
  }
  if (([MEMORY[0x263F669F0] hasUserCompletedOnboarding] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      char v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_INFO, "Check In onboarding not completed", (uint8_t *)&v8, 2u);
      }
LABEL_21:

      return 0;
    }
    return 0;
  }
  return _os_feature_enabled_impl();
}

- (id)checkInLocationHistorySettingsSpecifierIdentifiers
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"CHECK_IN_LOCATION_HISTORY_SECTION_ID";
  v4[1] = @"CHECK_IN_LOCATION_HISTORY_ID";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

- (id)getCheckInLocationHistorySetting:(id)a3
{
  char v3 = MessagesSettingsLocalizedString(@"CHECK_IN_LOCATION_HISTORY_ENABLED");
  uint64_t v4 = MessagesSettingsLocalizedString(@"CHECK_IN_LOCATION_HISTORY_DISABLED");
  if ([MEMORY[0x263F669F0] shareAllLocations]) {
    char v5 = v3;
  }
  else {
    char v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)isCheckInAllowedInRegion
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F62D20] currentEstimates];
  if (![v2 count])
  {
    id v3 = [MEMORY[0x263F62D20] lastKnownEstimates];

    if (![v3 count])
    {
      if (IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v16, OS_LOG_TYPE_INFO, "Unable to determine Check In availability", buf, 2u);
        }
      }
      BOOL v13 = 1;
      goto LABEL_23;
    }
    uint64_t v2 = v3;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v2;
      _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_INFO, "Current regulatory domain: %@", buf, 0xCu);
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = v2;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x223C3A7C0](v5);
        unint64_t v11 = objc_msgSend(v9, "countryCode", (void)v17);
        int v12 = [v11 isEqualToString:@"KR"];

        if (v12)
        {
          if (IMOSLoggingEnabled())
          {
            id v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v23 = v9;
              _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_INFO, "Check In not available in regulatory domain: %@", buf, 0xCu);
            }
          }
          BOOL v13 = 0;
          goto LABEL_22;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_22:

LABEL_23:
  return v13;
}

- (void)configureCheckInSpecifiers:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F5B8F0];
  id v5 = a3;
  id v17 = [v4 linkWithBundleIdentifier:@"com.apple.onboarding.checkin"];
  uint64_t v6 = [v17 flow];
  uint64_t v7 = [v6 localizedButtonTitle];

  uint64_t v8 = MessagesSettingsLocalizedString(@"CHECK_IN_LOCATION_HISTORY_FOOTER");
  uint64_t v9 = [NSString stringWithFormat:@"%@ %@", v8, v7];
  uint64_t v10 = [v5 specifierForID:@"CHECK_IN_LOCATION_HISTORY_SECTION_ID"];
  unint64_t v11 = (objc_class *)objc_opt_class();
  int v12 = NSStringFromClass(v11);
  [v10 setProperty:v12 forKey:*MEMORY[0x263F600C0]];

  [v10 setProperty:v9 forKey:*MEMORY[0x263F600E8]];
  v19.location = [v9 rangeOfString:v7];
  BOOL v13 = NSStringFromRange(v19);
  [v10 setProperty:v13 forKey:*MEMORY[0x263F600D0]];

  id v14 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v10 setProperty:v14 forKey:*MEMORY[0x263F600E0]];

  id v15 = NSStringFromSelector(sel_presentCheckInPrivacySplashController);
  [v10 setProperty:v15 forKey:*MEMORY[0x263F600C8]];

  id v16 = [v5 specifierForID:@"CHECK_IN_LOCATION_HISTORY_ID"];

  [v16 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
}

- (void)presentCheckInPrivacySplashController
{
  id v3 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.checkin"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)checkInPrivacySplashControllerDidRequestDismissal:(id)a3
{
}

- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4
{
  CFPreferencesSetAppValue(@"MeCardSharingEnabled", (CFPropertyListRef)[NSNumber numberWithBool:a4], @"com.apple.messages.nicknames");
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x263F4ADB8] object:0];
}

- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  CFPreferencesSetAppValue(@"MeCardSharingAudience", (CFPropertyListRef)[NSNumber numberWithInteger:a4], @"com.apple.messages.nicknames");
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x263F4ADB8] object:0];
}

- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4
{
  id v4 = (void *)MEMORY[0x263F4A5D0];
  id v5 = a4;
  id v6 = [v4 sharedInstance];
  [v6 updatePersonalNicknameIfNecessaryWithMeCardSharingResult:v5];
}

- (id)_messagesForBusinessViewController
{
  id v3 = objc_alloc_init(CKSettingsMessagesForBusinessViewController);
  id v4 = [(CKSettingsMessagesController *)self lazuliEnablementManager];
  [(CKSettingsMessagesForBusinessViewController *)v3 setLazuliEnablementManager:v4];

  [(CKSettingsMessagesForBusinessViewController *)v3 setParentController:self];
  id v5 = [(CKSettingsMessagesController *)self rootController];
  [(CKSettingsMessagesForBusinessViewController *)v3 setRootController:v5];

  return v3;
}

- (BOOL)shouldShowSMSRelaySettings
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F3BB18] sharedInstance];
  char v4 = [v3 supportsSMS];

  BOOL v5 = [(CKSettingsMessagesController *)self hasPhoneNumber];
  BOOL v6 = +[CKSettingSMSRelayController shouldShowSMSRelaySettings];
  uint64_t v7 = [MEMORY[0x263F4A520] sharedInstance];
  uint64_t v8 = [MEMORY[0x263F4A610] iMessageService];
  uint64_t v9 = [v7 activeAccountsForService:v8];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "accountType", (void)v16) == 1)
        {
          LOBYTE(v11) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  BOOL v14 = [(CKSettingsMessagesController *)self _isMadridAccountOperational];
  return v11 & v14 & v5 & v6 & v4;
}

- (BOOL)hasPhoneNumber
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F02D30]);
  id v3 = (void *)[v2 initWithQueue:MEMORY[0x263EF83A0]];
  id v20 = 0;
  char v4 = [v3 getSubscriptionInfoWithError:&v20];
  id v5 = v20;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v6 = objc_msgSend(v4, "subscriptions", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 labelID];
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          BOOL v13 = [v10 phoneNumber];
          uint64_t v14 = [v13 length];

          if (v14)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

- (id)smsRelaySettingsSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"SMS_RELAY_GROUP", @"SMS_RELAY_DEVICES", 0);
}

- (BOOL)shouldShowReadReceipts
{
  if ([(CKSettingsMessagesController *)self _isMadridAccountOperational]) {
    return 1;
  }
  char v4 = [(CKSettingsMessagesController *)self lazuliEnablementManager];
  char v5 = [v4 isRCSEnabledForAnyActiveSubscription];

  return v5;
}

- (id)readReceiptSpecifierIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"READ_RECEIPTS_GROUP", @"READ_RECEIPTS_SWITCH", 0);
}

- (id)areReadReceiptsEnabled:(id)a3
{
  CFPreferencesSynchronize(@"com.apple.madrid", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ReadReceiptsEnabled", @"com.apple.madrid", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  uint64_t v5 = !v4;
  BOOL v6 = [NSNumber numberWithBool:v5];
  return v6;
}

- (void)setReadReceiptsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v7 = [(CKSettingsMessagesController *)self sharedSettingsHelper];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setReadReceiptsEnabled:v6];
}

- (BOOL)shouldShowJunkFilteringReceipts
{
  id v2 = (uint64_t (*)(void))CUTWeakLinkSymbol();
  if (v2)
  {
    LOBYTE(v2) = v2();
  }
  return (char)v2;
}

- (id)areJunkFilteringReceiptsEnabled:(id)a3
{
  CFPreferencesSynchronize(@"com.apple.madrid", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"JunkFilteringReceiptsEnabled", @"com.apple.madrid", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = !v4;
  uint64_t v6 = [NSNumber numberWithBool:v5];
  return v6;
}

- (void)setJunkFilteringReceiptsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  uint64_t v6 = MEMORY[0x223C3A160](@"com.apple.madrid", @"JunkFilteringReceiptsVersionID");
  id v11 = v6;
  if (v6) {
    uint64_t v7 = [v6 integerValue] + 1;
  }
  else {
    uint64_t v7 = 1;
  }
  CFPreferencesSetAppValue(@"JunkFilteringReceiptsVersionID", (CFPropertyListRef)[NSNumber numberWithInteger:v7], @"com.apple.madrid");
  CFPreferencesSetAppValue(@"JunkFilteringReceiptsEnabled", v5, @"com.apple.madrid");

  CFPreferencesSynchronize(@"com.apple.madrid", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.JunkFilteringReceiptsEnabled.changed", 0, 0, 1u);
  notify_post("com.apple.MobileSMS.JunkFilteringReceiptsEnabled.shouldUpdateDevices");
  if (PSIsNanoMirroringDomain())
  {
    uint64_t v9 = [(CKSettingsMessagesController *)self _syncManager];
    id v10 = [MEMORY[0x263EFFA08] setWithObject:@"JunkFilteringReceiptsEnabled"];
    [v9 synchronizeUserDefaultsDomain:@"com.apple.madrid" keys:v10];
  }
}

- (BOOL)shouldShowiMessageApps
{
  id v3 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  int v4 = [v3 isSendMenuEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = [(CKSettingsMessagesController *)self iMessageAppManager];
  char v6 = [v5 haveDeletableApps];

  return v6;
}

- (id)iMessageAppsIdentifiers
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"IMESSAGE_APPS_GROUP";
  v4[1] = @"IMESSAGE_APPS_BUTTON";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

- (id)_iMessageAppsViewController
{
  id v3 = [(CKSettingsMessagesController *)self iMessageAppManager];
  int v4 = [[CKSettingsiMessageAppsViewController alloc] initWithAppManager:v3];
  [(CKSettingsiMessageAppsViewController *)v4 setParentController:self];
  id v5 = [(CKSettingsMessagesController *)self rootController];
  [(CKSettingsiMessageAppsViewController *)v4 setRootController:v5];

  return v4;
}

- (BOOL)shouldShowSendAsSMS
{
  BOOL v3 = [(CKSettingsMessagesController *)self _isSMSDevice];
  if (v3)
  {
    LOBYTE(v3) = [(CKSettingsMessagesController *)self _isMadridAccountOperational];
  }
  return v3;
}

- (id)sendAsSMSIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"PRE_LAZULI_SEND_AS_SMS_GROUP", @"SEND_AS_SMS_GROUP", @"SEND_AS_SMS_SWITCH", 0);
}

- (void)showMessagesInICloudSettings:(id)a3
{
  [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Messages"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (id)getMessagesInICloudEnabledSpecifier:(id)a3
{
  id v4 = MessagesSettingsLocalizedString(@"GENERAL_ON");
  id v5 = MessagesSettingsLocalizedString(@"GENERAL_OFF");
  if ([(CKSettingsMessagesController *)self _isMessagesInICloudEnabled]) {
    char v6 = v4;
  }
  else {
    char v6 = v5;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)_isMessagesInICloudEnabled
{
  id v2 = [MEMORY[0x263F4AF68] sharedInstance];
  char v3 = [v2 getBoolFromDomain:@"com.apple.madrid" forKey:@"CloudKitSyncingEnabled"];

  return v3;
}

- (void)openAUOnlineSafetyURL
{
  uint64_t v3 = MessagesSettingsLocalizedString(@"AU_ONLINE_SAFETY_URL");
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    id v5 = [NSURL URLWithString:v3];
    if (v5) {
      [(CKSettingsMessagesController *)self _openAUOnlineSafetyURL];
    }

    uint64_t v4 = v6;
  }
  MEMORY[0x270F9A758](v3, v4);
}

- (void)_openAUOnlineSafetyURL
{
  MessagesSettingsLocalizedString(@"AU_ONLINE_SAFETY_URL");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = objc_msgSend(NSURL, "URLWithString:");
  if (v3)
  {
    uint64_t v4 = [(CKSettingsMessagesController *)self safariImportWorkaround];
    id v5 = [v4 safariViewControllerForURL:v3];

    [(CKSettingsMessagesController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (CKSafariViewControllerImportWorkaround)safariImportWorkaround
{
  safariImportWorkaround = self->_safariImportWorkaround;
  if (!safariImportWorkaround)
  {
    uint64_t v4 = objc_alloc_init(CKSafariViewControllerImportWorkaround);
    id v5 = self->_safariImportWorkaround;
    self->_safariImportWorkaround = v4;

    [(CKSafariViewControllerImportWorkaround *)self->_safariImportWorkaround setDelegate:self];
    safariImportWorkaround = self->_safariImportWorkaround;
  }
  return safariImportWorkaround;
}

- (void)safariViewControllerDidFinish:(id)a3
{
}

- (BOOL)shouldShowMadridAccounts
{
  uint64_t v3 = [(CNFRegListController *)self regController];
  if ([v3 serviceSupportsDeviceAliasEnablement])
  {
    uint64_t v4 = [(CNFRegListController *)self regController];
    id v5 = [v4 usableDeviceAliases];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  if ([(CKSettingsMessagesController *)self _isMadridAccountOperational]) {
    return 1;
  }
  else {
    return [(CKSettingsMessagesController *)self _isMadridSwitchOn] && v6;
  }
}

- (id)madridEnabledSpecifierIdentifiers
{
  void v4[3] = *MEMORY[0x263EF8340];
  v4[0] = @"MADRID_ACCOUNTS";
  v4[1] = @"MADRID_ACCOUNTS_BUTTON";
  v4[2] = @"MESSAGES_IN_ICLOUD";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)getAccountSummaryForSpecifier:(id)a3
{
  char v6 = 0;
  uint64_t v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 aliasSummaryString:&v6];

  return v4;
}

- (BOOL)shouldShowUpdateAppleID
{
  BOOL v3 = [(CKSettingsMessagesController *)self shouldShowMadridSwitch];
  if (v3)
  {
    LOBYTE(v3) = [(CKSettingsMessagesController *)self _isAppleIDUpdateNeeded];
  }
  return v3;
}

- (void)showCKVSettings:(id)a3
{
  [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=TRANSPARENCY"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (BOOL)_isAppleIDUpdateNeeded
{
  id v2 = self;
  BOOL v3 = [(CKSettingsMessagesController *)self _registrationFailures];
  LOBYTE(v2) = [(CKSettingsMessagesController *)v2 _registrationFailures:v3 containsFailure:28];

  return (char)v2;
}

- (int64_t)_debugFailureReason
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.MobileSMS"];
  uint64_t v3 = [v2 integerForKey:@"userRegistrationKTFailure"];
  uint64_t v4 = 28;
  if (v3 != 2) {
    uint64_t v4 = -1;
  }
  if (v3 == 1) {
    int64_t v5 = 29;
  }
  else {
    int64_t v5 = v4;
  }

  return v5;
}

- (BOOL)shouldShowMadridSignin
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (![(CKSettingsMessagesController *)self _isMadridAccountOperational])
  {
    BOOL v3 = [(CKSettingsMessagesController *)self _isMadridSwitchOn];
    if (!v3) {
      return v3;
    }
    uint64_t v4 = [(CNFRegListController *)self regController];
    id v5 = [v4 accountsWithFilter:49156];

    if (![v5 count])
    {
LABEL_16:

      LOBYTE(v3) = ![(CKSettingsMessagesController *)self shouldShowMadridAccounts];
      return v3;
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v5;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "registrationStatus", (void)v12) <= 3
            && ![v10 isAccountKeyCDPSyncingOrWaitingForUser])
          {

            goto LABEL_16;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (id)madridSigninSpecifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"MADRID_SIGNIN", @"MADRID_SIGNIN_BUTTON", 0);
}

- (id)madridSigninButtonTextForSpecifier:(id)a3
{
  int v3 = _os_feature_enabled_impl();
  uint64_t v4 = CommunicationsSetupUIBundle();
  id v5 = CNFRegStringTableName();
  if (v3) {
    uint64_t v6 = @"FACETIME_ACCOUNT_INFO_UNAVAILABLE_APPLEACCOUNT";
  }
  else {
    uint64_t v6 = @"FACETIME_ACCOUNT_INFO_UNAVAILABLE";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_26D05D4F8 table:v5];

  return v7;
}

- (id)getPreviewTranscodingEnabled:(id)a3
{
  CFPreferencesSynchronize(@"com.apple.imessage", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PreviewTranscodingEnabled", @"com.apple.imessage", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  uint64_t v5 = !v4;
  uint64_t v6 = [NSNumber numberWithBool:v5];
  return v6;
}

- (void)setPreviewTranscodingEnabled:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"PreviewTranscodingEnabled", a3, @"com.apple.imessage");
  CFPreferencesSetAppValue(@"PreviewTranscodingSelectedByUser", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.imessage");
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSynchronize(@"com.apple.imessage", v4, v5);
}

- (id)getSMSRelayDevicesSummary:(id)a3
{
  unint64_t v3 = +[CKSettingSMSRelayController numberOfActiveDevices];
  CFStringRef v4 = (void *)v3;
  if (v3)
  {
    if (v3 == 1) {
      CFStringRef v5 = @"SMS_RELAY_SINGLE_DEVICE_LABEL";
    }
    else {
      CFStringRef v5 = @"SMS_RELAY_MULTIPLE_DEVICES_LABEL";
    }
    uint64_t v6 = MessagesSettingsLocalizedString(v5);
    CFStringRef v4 = objc_msgSend(NSString, "stringWithFormat:", v6, v4);
  }
  return v4;
}

+ (id)currentKeepMessages
{
  return +[CKKeepMessagesPreferenceManager keepMessagesPreference];
}

- (id)getKeepMessages:(id)a3
{
  return +[CKSettingsMessagesController currentKeepMessages];
}

- (void)setKeepMessages:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  CFStringRef v5 = MEMORY[0x223C3A160](@"com.apple.MobileSMS", @"KeepMessagesVersionID");
  id v8 = v5;
  if (v5) {
    uint64_t v6 = [v5 integerValue] + 1;
  }
  else {
    uint64_t v6 = 1;
  }
  CFPreferencesSetAppValue(@"KeepMessagesVersionID", (CFPropertyListRef)[NSNumber numberWithInteger:v6], @"com.apple.MobileSMS");
  CFPreferencesSetAppValue(@"KeepMessageForDays", v4, @"com.apple.MobileSMS");

  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  notify_post("com.apple.MobileSMS.KeepMessages.shouldUpdateDevices");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.KeepMessages.changed", 0, 0, 1u);
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
    uint64_t v17 = [v11 objectForKey:*MEMORY[0x263F29010]];
    uint64_t v18 = [v11 objectForKey:*MEMORY[0x263F28FF0]];
    long long v19 = (void *)v18;
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
    uint64_t v21 = OSLogHandleForIDSCategory();
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
        BOOL v25 = (void *)v24;
        if (v24)
        {
          dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
          v26 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v37 = 138412290;
            v38 = v25;
            _os_log_impl(&dword_21ED18000, v26, OS_LOG_TYPE_DEFAULT, "Registering for service: %@", v37, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
            IMLogString();
          }
          long long v27 = [CNFAccountRegistrar alloc];
          long long v28 = [(CNFRegListController *)self regController];
          long long v29 = -[CNFAccountRegistrar initWithServiceType:presentationViewController:](v27, "initWithServiceType:presentationViewController:", [v28 serviceType], self);

          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __114__CKSettingsMessagesController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke;
          v34[3] = &unk_2644F0AA8;
          p_long long buf = &buf;
          v34[4] = self;
          long long v30 = v33;
          v35 = v30;
          [(CNFAccountRegistrar *)v29 registerAccountWithUsername:v17 password:v19 service:v25 completionBlock:v34];
          dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);

LABEL_39:
          BOOL v16 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
LABEL_40:
          _Block_object_dispose(&buf, 8);

          goto LABEL_41;
        }
LABEL_34:
        long long v31 = OSLogHandleForIDSCategory();
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
  long long v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "AuthKit had an error authenticating: %@", (uint8_t *)&buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  long long v15 = OSLogHandleForIDSCategory();
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

void __114__CKSettingsMessagesController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    uint64_t v7 = OSLogHandleForIDSCategory();
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
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
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
  uint64_t v6 = CNFRegStringTableName();
  if (v4) {
    uint64_t v7 = @"FACETIME_SIGNIN_SETTINGS_BLURB_APPLEACCOUNT";
  }
  else {
    uint64_t v7 = @"FACETIME_SIGNIN_SETTINGS_BLURB";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_26D05D4F8 table:v6];
  [v3 setReason:v8];

  [v3 setShouldForceInteractiveAuth:1];
  uint64_t v9 = [(CNFRegListController *)self regController];
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
  id v13 = objc_alloc_init((Class)CUTWeakLinkClass());
  long long v14 = objc_msgSend(v13, "aa_primaryAppleAccount");
  long long v15 = [v14 username];
  if ([v15 length])
  {
    [v3 setUsername:v15];
    [v3 setReason:v15];
    [v3 setShouldForceInteractiveAuth:0];
  }
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__778;
  uint64_t v22 = __Block_byref_object_dispose__779;
  id v23 = objc_alloc_init(MEMORY[0x263F29118]);
  [(id)v19[5] setDelegate:self];
  BOOL v16 = (void *)v19[5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __53__CKSettingsMessagesController__showSignInController__block_invoke;
  v17[3] = &unk_2644F0AD0;
  v17[4] = &v18;
  [v16 authenticateWithContext:v3 completion:v17];
  _Block_object_dispose(&v18, 8);
}

void __53__CKSettingsMessagesController__showSignInController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = OSLogHandleForIDSCategory();
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

- (void)_showMadridSetupIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (![(CKSettingsMessagesController *)self _isSMSDevice] || v3)
  {
    BOOL v21 = v3;
    id v5 = [(CNFRegListController *)self regController];
    uint64_t v6 = [v5 accounts];

    uint64_t v22 = [v6 count];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = 0;
      char v11 = 0;
      int v12 = 0;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v7);
          }
          long long v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          int v16 = [v15 isActive];
          v10 |= v16;
          v11 |= v16 ^ 1;
          if ((unint64_t)([v15 registrationStatus] + 1) <= 1) {
            int v12 = 1;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }
    else
    {
      int v10 = 0;
      char v11 = 0;
      int v12 = 0;
    }

    uint64_t v17 = [[CNFRegWizardController alloc] initWithServiceTypes:1];
    uint64_t v18 = v17;
    if (v22 && (v11 & 1) != 0 && ((v10 | v12 ^ 1) & 1) != 0)
    {
      if (!v21) {
        goto LABEL_22;
      }
    }
    else if (![(CNFRegWizardController *)v17 shouldShowFirstRunController] && !v21)
    {
      goto LABEL_22;
    }
    [(PSSetupController *)v18 setParentController:self];
    long long v19 = [(CKSettingsMessagesController *)self rootController];
    [(PSRootController *)v18 setRootController:v19];

    [(CNFRegWizardController *)v18 setCanStartNested:0];
    [(CNFRegWizardController *)v18 setCanShowSplashScreen:0];
    [(CNFRegWizardController *)v18 setCanShowDisabledScreen:0];
    [(CNFRegWizardController *)v18 setAllowCancel:1];
    [(CNFRegWizardController *)v18 setHideLearnMoreButton:1];
    uint64_t v20 = [MEMORY[0x263F82670] currentDevice];
    -[CNFRegWizardController setShowSplashOnSignin:](v18, "setShowSplashOnSignin:", [v20 userInterfaceIdiom] == 1);

    [(CNFRegWizardController *)v18 setFirstRunDelegate:self];
    [(CKSettingsMessagesController *)self showController:v18 animate:1];
    self->_showingChildViewController = 1;
LABEL_22:
  }
}

- (void)_showMadridSetupIfNecessary
{
}

- (void)firstRunControllerDidFinish:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (v4)
  {
    uint64_t v6 = [(CNFRegListController *)self regController];
    [v6 setServiceEnabled:1];
  }
  [(CKSettingsMessagesController *)self reloadSpecifiers];
  [v7 dismiss];
}

- (void)_updateUIWithError:(id)a3
{
  id v17 = a3;
  if (![(CKSettingsMessagesController *)self _isMadridAccountOperational])
  {
    BOOL v4 = [(CKSettingsMessagesController *)self _failedAccounts];
    uint64_t v5 = [v4 count];
    if (v17)
    {
      if (v5)
      {
        uint64_t v6 = [(CNFRegListController *)self regController];
        int v7 = [v6 shouldShowAlertForError:v17];

        if (v7)
        {
          [(CKSettingsMessagesController *)self _showMadridSetupIfNecessary];
          uint64_t v8 = CommunicationsSetupUIBundle();
          uint64_t v9 = CNFRegStringTableName();
          int v10 = [v8 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v9];

          char v11 = [v17 localizedDescription];
          int v12 = CommunicationsSetupUIBundle();
          uint64_t v13 = CNFRegStringTableName();
          long long v14 = [v12 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v13];

          long long v15 = [MEMORY[0x263F82418] alertControllerWithTitle:v10 message:v11 preferredStyle:1];
          int v16 = [MEMORY[0x263F82400] actionWithTitle:v14 style:0 handler:0];
          [v15 addAction:v16];

          [(CKSettingsMessagesController *)self presentViewController:v15 animated:1 completion:0];
        }
      }
    }
  }
  [(CKSettingsMessagesController *)self reloadSpecifiers];
}

- (void)_setupAccountHandlers
{
  v12.receiver = self;
  v12.super_class = (Class)CKSettingsMessagesController;
  [(CNFRegListController *)&v12 _setupEventHandlers];
  BOOL v3 = [(CNFRegListController *)self regController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke;
  v11[3] = &unk_2644F04A0;
  v11[4] = self;
  [v3 setResetBlock:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_2;
  v10[3] = &unk_2644F0B70;
  v10[4] = self;
  [v3 setAccountAddedBlock:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_3;
  v9[3] = &unk_2644F0B70;
  v9[4] = self;
  [v3 setAccountRemovedBlock:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_4;
  v8[3] = &unk_2644F0B70;
  v8[4] = self;
  [v3 setAccountActivationChangedBlock:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_5;
  v7[3] = &unk_2644F0B98;
  v7[4] = self;
  [v3 setAccountRegistrationBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_6;
  v6[3] = &unk_2644F0BE8;
  void v6[4] = self;
  [v3 setAliasStatusChangedBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_7;
  v5[3] = &unk_2644F0BC0;
  v5[4] = self;
  [v3 setAliasAddedBlock:v5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_8;
  void v4[3] = &unk_2644F0BC0;
  void v4[4] = self;
  [v3 setAliasRemovedBlock:v4];
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateUIWithError:0];
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateUIWithError:0];
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateUIWithError:0];
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUIWithError:");
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUIWithError:");
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateUIWithError:0];
}

uint64_t __53__CKSettingsMessagesController__setupAccountHandlers__block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateUIWithError:0];
}

- (BOOL)_allAccountsAreDeactivated
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [(CNFRegListController *)self regController];
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
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
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
  v6.receiver = self;
  v6.super_class = (Class)CKSettingsMessagesController;
  [(CNFRegListController *)&v6 _setupEventHandlers];
  BOOL v3 = [(CNFRegListController *)self regController];
  if ([(CKSettingsMessagesController *)self _allAccountsAreDeactivated])
  {
    [(CKSettingsMessagesController *)self _setupAccountHandlers];
  }
  else
  {
    [(CNFRegListController *)self removeAllHandlers];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __65__CKSettingsMessagesController__setupAccountHandlersForDisabling__block_invoke;
    v5[3] = &unk_2644F0B70;
    v5[4] = self;
    [v3 setAccountActivationChangedBlock:v5];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __65__CKSettingsMessagesController__setupAccountHandlersForDisabling__block_invoke_2;
    void v4[3] = &unk_2644F0B98;
    void v4[4] = self;
    [v3 setAccountRegistrationBlock:v4];
  }
}

uint64_t __65__CKSettingsMessagesController__setupAccountHandlersForDisabling__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSwitchDelayed];
  uint64_t result = [*(id *)(a1 + 32) _allAccountsAreDeactivated];
  if (result)
  {
    [*(id *)(a1 + 32) _setupAccountHandlers];
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 _updateUIWithError:0];
  }
  return result;
}

uint64_t __65__CKSettingsMessagesController__setupAccountHandlersForDisabling__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSwitchDelayed];
  uint64_t result = [*(id *)(a1 + 32) _allAccountsAreDeactivated];
  if (result)
  {
    [*(id *)(a1 + 32) _setupAccountHandlers];
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 _updateUIWithError:0];
  }
  return result;
}

- (void)_clearMessagesAppExtensionSalt
{
  id v2 = [MEMORY[0x263F08850] defaultManager];
  int v3 = [v2 fileExistsAtPath:@"/var/mobile/Library/SMS/PluginMetaDataCache"];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v7 = 0;
    [v4 removeItemAtPath:@"/var/mobile/Library/SMS/PluginMetaDataCache" error:&v7];
    uint64_t v5 = v7;

    if (!v5)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.AppMetadataFolderDeleted", 0, 0, 1u);
    }
  }
}

- (id)_madridSettingsController
{
  int v3 = [CNFRegSettingsController alloc];
  uint64_t v4 = [(CNFRegListController *)self regController];
  uint64_t v5 = [(CNFRegListController *)v3 initWithRegController:v4];

  objc_super v6 = [(CKSettingsMessagesController *)self rootController];
  [(CNFRegSettingsController *)v5 setRootController:v6];

  [(CNFRegSettingsController *)v5 setParentController:self];
  uint64_t v7 = [(CKSettingsMessagesController *)self specifier];
  [(CNFRegListController *)v5 setSpecifier:v7];

  [(CNFRegSettingsController *)v5 setShowEnableSwitch:0];
  return v5;
}

- (id)_smsRelayDevicesController
{
  int v3 = objc_alloc_init(CKSettingSMSRelayController);
  [(CKSettingSMSRelayController *)v3 setParentController:self];
  uint64_t v4 = [(CKSettingsMessagesController *)self rootController];
  [(CKSettingSMSRelayController *)v3 setRootController:v4];

  return v3;
}

- (CKRCSController)rcsMessagingController
{
  rcsMessagingController = self->_rcsMessagingController;
  if (!rcsMessagingController)
  {
    uint64_t v4 = objc_alloc_init(CKRCSController);
    [(CKRCSController *)v4 setMultiSimHeaderKey:@"RCS_MESSAGING_HEADER"];
    [(CKRCSController *)v4 setControllerTitle:@"RCS_MESSAGING"];
    uint64_t v5 = [(CKSettingsMessagesController *)self lazuliEnablementManager];
    [(CKRCSController *)v4 setLazuliEnablementManager:v5];

    [(CKRCSController *)v4 setParentController:self];
    objc_super v6 = [(CKSettingsMessagesController *)self rootController];
    [(CKRCSController *)v4 setRootController:v6];

    uint64_t v7 = self->_rcsMessagingController;
    self->_rcsMessagingController = v4;

    rcsMessagingController = self->_rcsMessagingController;
  }
  return rcsMessagingController;
}

- (CKMultipleCTSubscriptionsController)mmsMessagingController
{
  mmsMessagingController = self->_mmsMessagingController;
  if (!mmsMessagingController)
  {
    uint64_t v4 = objc_alloc_init(CKMMSMultipleCTSubscriptionsController);
    [(CKMultipleCTSubscriptionsController *)v4 setHeaderKey:@"MMS_MESSAGING_HEADER"];
    [(CKMultipleCTSubscriptionsController *)v4 setDefaultsKey:@"MMSEnabled-"];
    [(CKMultipleCTSubscriptionsController *)v4 setControllerTitle:@"MMS_MESSAGING"];
    [(CKMMSMultipleCTSubscriptionsController *)v4 setParentController:self];
    uint64_t v5 = [(CKSettingsMessagesController *)self rootController];
    [(CKMMSMultipleCTSubscriptionsController *)v4 setRootController:v5];

    objc_super v6 = self->_mmsMessagingController;
    self->_mmsMessagingController = &v4->super;

    mmsMessagingController = self->_mmsMessagingController;
  }
  return mmsMessagingController;
}

- (PSController)blackholeConversationListViewController
{
  blackholeConversationListViewController = self->_blackholeConversationListViewController;
  if (!blackholeConversationListViewController)
  {
    uint64_t v4 = (PSController *)objc_alloc_init((Class)CUTWeakLinkClass());
    uint64_t v5 = self->_blackholeConversationListViewController;
    self->_blackholeConversationListViewController = v4;

    blackholeConversationListViewController = self->_blackholeConversationListViewController;
  }
  return blackholeConversationListViewController;
}

- (id)controllerForSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_20;
  }
  objc_super v6 = [v4 identifier];
  int v7 = [v6 isEqualToString:@"MADRID_ACCOUNTS_BUTTON"];

  if (v7)
  {
    uint64_t v8 = [(CNFRegListController *)self regController];
    [v8 connect:1];

    uint64_t v9 = [(CKSettingsMessagesController *)self _madridSettingsController];
  }
  else
  {
    int v10 = [v5 identifier];
    int v11 = [v10 isEqualToString:@"SMS_RELAY_DEVICES"];

    if (v11)
    {
      uint64_t v9 = [(CKSettingsMessagesController *)self _smsRelayDevicesController];
    }
    else
    {
      long long v12 = [v5 identifier];
      int v13 = [v12 isEqualToString:@"RCS_MESSAGING_CELL"];

      if (v13)
      {
        uint64_t v9 = [(CKSettingsMessagesController *)self rcsMessagingController];
      }
      else
      {
        long long v14 = [v5 identifier];
        int v15 = [v14 isEqualToString:@"MMS_MESSAGING_CELL"];

        if (v15)
        {
          uint64_t v9 = [(CKSettingsMessagesController *)self mmsMessagingController];
        }
        else
        {
          uint64_t v16 = [v5 identifier];
          int v17 = [v16 isEqualToString:@"JUNK_CONVERSATIONS_BUTTON"];

          if (v17)
          {
            uint64_t v9 = [(CKSettingsMessagesController *)self blackholeConversationListViewController];
          }
          else
          {
            uint64_t v18 = [v5 identifier];
            int v19 = [v18 isEqualToString:@"SHARED_WITH_YOU_BUTTON"];

            if (v19)
            {
              uint64_t v9 = [(CKSettingsMessagesController *)self _sharedWithYouViewController];
            }
            else
            {
              uint64_t v20 = [v5 identifier];
              int v21 = [v20 isEqualToString:@"IMESSAGE_APPS_BUTTON"];

              if (v21)
              {
                uint64_t v9 = [(CKSettingsMessagesController *)self _iMessageAppsViewController];
              }
              else
              {
                uint64_t v22 = [v5 identifier];
                int v23 = [v22 isEqualToString:@"BUSINESS_CHAT_BUTTON"];

                if (!v23) {
                  goto LABEL_20;
                }
                uint64_t v9 = [(CKSettingsMessagesController *)self _messagesForBusinessViewController];
              }
            }
          }
        }
      }
    }
  }
  long long v24 = (void *)v9;
  if (v9)
  {
    self->_showingChildViewController = 1;
    goto LABEL_21;
  }
LABEL_20:
  v26.receiver = self;
  v26.super_class = (Class)CKSettingsMessagesController;
  long long v24 = [(CKSettingsMessagesController *)&v26 controllerForSpecifier:v5];
LABEL_21:

  return v24;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CKSettingsMessagesController;
  id v6 = a4;
  int v7 = [(CKSettingsMessagesController *)&v13 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[CKSettingsMessagesController indexForIndexPath:](self, "indexForIndexPath:", v6, v13.receiver, v13.super_class);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v8];
    int v10 = [v9 identifier];
    int v11 = [v10 isEqualToString:@"MADRID_SIGNIN_BUTTON"];

    if (v11) {
      [v7 setAlignment:2];
    }
  }
  return v7;
}

- (CKFilteringListController)filteringController
{
  return self->_filteringController;
}

- (void)setFilteringController:(id)a3
{
}

- (id)beginMappingID
{
  return objc_getProperty(self, a2, 1424, 1);
}

- (void)setBeginMappingID:(id)a3
{
}

- (void)setSystemSettingsSpecifierProvider:(id)a3
{
}

- (CKSettingsiMessageAppManager)iMessageAppManager
{
  return self->_iMessageAppManager;
}

- (void)setIMessageAppManager:(id)a3
{
}

- (CKLazuliEnablementManager)lazuliEnablementManager
{
  return self->_lazuliEnablementManager;
}

- (void)setLazuliEnablementManager:(id)a3
{
}

- (CKSharedSettingsHelper)sharedSettingsHelper
{
  return self->_sharedSettingsHelper;
}

- (void)setSharedSettingsHelper:(id)a3
{
}

- (void)setSafariImportWorkaround:(id)a3
{
}

- (void)setMmsMessagingController:(id)a3
{
}

- (void)setRcsMessagingController:(id)a3
{
}

- (IMCTXPCServiceSubscriptionInfo)ctSubscriptionInfo
{
  return self->_ctSubscriptionInfo;
}

- (void)setCtSubscriptionInfo:(id)a3
{
}

- (CKOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)setOnboardingController:(id)a3
{
}

- (void)setBlackholeConversationListViewController:(id)a3
{
}

- (CKNSExtension)ckExtension
{
  return self->_ckExtension;
}

- (void)setCkExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckExtension, 0);
  objc_storeStrong((id *)&self->_blackholeConversationListViewController, 0);
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_ctSubscriptionInfo, 0);
  objc_storeStrong((id *)&self->_rcsMessagingController, 0);
  objc_storeStrong((id *)&self->_mmsMessagingController, 0);
  objc_storeStrong((id *)&self->_safariImportWorkaround, 0);
  objc_storeStrong((id *)&self->_sharedSettingsHelper, 0);
  objc_storeStrong((id *)&self->_lazuliEnablementManager, 0);
  objc_storeStrong((id *)&self->_iMessageAppManager, 0);
  objc_storeStrong((id *)&self->_systemSettingsSpecifierProvider, 0);
  objc_storeStrong(&self->_beginMappingID, 0);
  objc_storeStrong((id *)&self->_filteringController, 0);
}

- (void)newDNDGlobalConfigurationService
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ED18000, v0, v1, "Unable to create DNDGlobalConfigurationService", v2, v3, v4, v5, v6);
}

void __69__CKSettingsMessagesController_satelliteDemoModeTappedWithSpecifier___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_21ED18000, a2, OS_LOG_TYPE_ERROR, "Request Satellite Demo error: %@", (uint8_t *)&v4, 0xCu);
}

- (void)_shouldShowSatelliteDemoModeButton
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ED18000, v0, v1, "Unable to check if demo mode is allowed", v2, v3, v4, v5, v6);
}

@end