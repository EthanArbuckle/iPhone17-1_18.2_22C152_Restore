@interface AssistantController
+ (BOOL)_heySiriSupportedForLanguage:(id)a3;
+ (id)bundle;
+ (id)shortTitlesForLanguageIdentifiers:(id)a3;
+ (void)presentAssistantEnableAlertForState:(BOOL)a3 presentingViewController:(id)a4 actionHandler:(id)a5;
- (AssistantController)init;
- (BOOL)_isCurrentSpecifierQuickTypeGesture;
- (BOOL)_isCurrentSpecifierVoiceActivation;
- (BOOL)_isHeySiriAlwaysOn;
- (BOOL)_isIncompatibleWithWatchLanguage:(id)a3;
- (BOOL)_isVoiceTriggerEnabled;
- (BOOL)_languageWillDisableHeySiri:(id)a3;
- (BOOL)_pairedWithSiriSpeaksEnabledNanoHardware;
- (BOOL)isFlexibleFollowupsSupported;
- (BOOL)selectedLanguageWantsMultilingualEnabled;
- (BOOL)shouldPromptForDisable;
- (BOOL)watchSupportsSiriLanguageCode:(id)a3;
- (NSArray)multilingualResponseLanguageVariants;
- (SUICAssistantVoiceSettingsConnection)settingsConnection;
- (id)_confirmationPromptDisableHeySiri:(BOOL)a3 disableMultiUser:(BOOL)a4 disableSpokenFeedback:(BOOL)a5;
- (id)_createEnablementFlowControllerForConfiguration:(id)a3 recognitionLanguageCode:(id)a4;
- (id)_createVoiceSelectionCompletionForSpecifier:(id)a3 recognitionLanguageCode:(id)a4;
- (id)_createVoiceSelectionDismissalHandlerWithSpecifier:(id)a3 actionHandler:(id)a4;
- (id)_externalAIModelPrivacyLinkText;
- (id)_externalAIModelSettingRestrictedFooterText;
- (id)_externalAIModelSettingRestrictedStatusLabel;
- (id)_imageCreationAccessLabel;
- (id)_localizeTriggerString:(id)a3;
- (id)_localizedStringWithFormattedIDTemplate:(id)a3;
- (id)_specifiersToRemove:(id)a3;
- (id)accessibleFromLockScreen:(id)a3;
- (id)assistantEnabled:(id)a3;
- (id)assistantLanguage:(id)a3;
- (id)assistantVoice:(id)a3;
- (id)assistantVoiceLanguage:(id)a3;
- (id)bundle;
- (id)confirmationSpecifierWillDisableHeySiri:(BOOL)a3 disableMultiUser:(BOOL)a4 disableSpokenFeedbackOnWatch:(BOOL)a5;
- (id)detailTextForLanguageSpecifierFromTitles:(id)a3;
- (id)hardwareButtonTrigger:(id)a3;
- (id)isShowInAppLibraryEnabled:(id)a3;
- (id)isShowInSpotlightEnabled;
- (id)isShowWhenListeningEnabled:(id)a3;
- (id)isShowWhenSharingEnabled:(id)a3;
- (id)isShowZKWRecentsEnabled:(id)a3;
- (id)isShowZKWSuggestionsEnabled:(id)a3;
- (id)meCard:(id)a3;
- (id)siriInCallEnabled:(id)a3;
- (id)specifiers;
- (id)typeToSiriTrigger:(id)a3;
- (id)voiceActivationSelection:(id)a3;
- (id)voiceTrigger:(id)a3;
- (void)_addHyperlinkStyleToText:(id)a3 inString:(id)a4 action:(SEL)a5 forGroup:(id)a6;
- (void)_askSiriUseDefaultFooterTextWithGroupSpecifier:(id)a3;
- (void)_askSiriUseDownloadFinishedFooterTextWithGroupSpecifier:(id)a3;
- (void)_askSiriUseDownloadReadyFooterTextWithGroupSpecifier:(id)a3;
- (void)_askSiriUseDownloadingFooterTextWithGroupSpecifier:(id)a3 withProgress:(id)a4;
- (void)_askSiriUseOutOfSpaceFooterTextWithGroupSpecifier:(id)a3 withSpaceRequired:(id)a4;
- (void)_askSiriUseRestrictedFooterWithGroupSpecifier:(id)a3;
- (void)_fetchGMWaitListStatus;
- (void)_handleDelayedDeeplink;
- (void)_handleEnablementConfirmationForSpecifier:(id)a3 actionHandler:(id)a4;
- (void)_handleThemisEnablementConfirmationForSpecifier:(id)a3 presentingViewController:(id)a4 actionHandler:(id)a5;
- (void)_insertSiriInCallSpecifier;
- (void)_insertTipSpecifiers;
- (void)_makeMeDeviceDetermination;
- (void)_presentSiriDataSharingOptInViewController;
- (void)_refreshAvailableLanguagesInTheHome;
- (void)_reloadSiriInCallSpecifier;
- (void)_removeSiriInCallSpecifier;
- (void)_removeTipSpecifiers;
- (void)_runEnablementFlowDismissalHandlersIfApplicable;
- (void)_runVoiceTriggerEnablementCompletionIfApplicable;
- (void)_setAccessibleFromLockScreen:(BOOL)a3;
- (void)_setAssistantEnabled:(id)a3 forSpecifier:(id)a4;
- (void)_setAssistantEnabled:(id)a3 forSpecifier:(id)a4 presentingViewController:(id)a5 actionHandler:(id)a6;
- (void)_setAssistantLanguage:(id)a3 forSpecifier:(id)a4;
- (void)_setAssistantLanguageCancelled:(id)a3;
- (void)_setAssistantLanguageConfirmed:(id)a3;
- (void)_setAssistantLanguageHeySiriDisableConfirmed:(id)a3;
- (void)_setAssistantLanguageWatchMismatchConfirmed:(id)a3;
- (void)_showIncompatibleWatchLanguageAlert;
- (void)_showWillDisableAlertWillDisableHeySiri:(BOOL)a3 disableMultiUser:(BOOL)a4 disableSpokenFeedbackOnWatch:(BOOL)a5;
- (void)_updateSiriFooterGroup:(id)a3 withStatus:(id)a4;
- (void)_updateSpecifiersForLanguage:(id)a3;
- (void)_updateSpecifiersForSettingsTip;
- (void)_voiceSelectionCancelled;
- (void)assistantAboutDonePressed:(id)a3;
- (void)assistantDisabledCancelled:(id)a3;
- (void)assistantDisabledConfirmed:(id)a3;
- (void)assistantEnabledCancelled:(id)a3;
- (void)assistantEnabledConfirmed:(id)a3;
- (void)cancelSetup:(id)a3;
- (void)clearGMCFU;
- (void)configureAppleIntelligencePrivacyFooterSpecifiersFor:(id)a3;
- (void)configureApplicationListSpecifiersFor:(id)a3;
- (void)configureExternalAIModelSettingsSpecifiersFor:(id)a3;
- (void)configureSearchAndLoookupSpecifiersFor:(id)a3;
- (void)configureSettingsForGM:(id)a3;
- (void)configureSettingsForImageCreation:(id)a3;
- (void)configureSettingsTipForGrayMatter;
- (void)configureSiriRequestsSpecifiersFor:(id)a3;
- (void)configureSuggestionsSpecifiersFor:(id)a3;
- (void)confirmDisableForMultiUserVoiceIdentificationWithSpecifier:(id)a3 pairedWatch:(BOOL)a4 presentingViewController:(id)a5 actionHandler:(id)a6;
- (void)confirmDisableWithSpecifier:(id)a3 pairedWatch:(BOOL)a4 presentingViewController:(id)a5 actionHandler:(id)a6;
- (void)confirmResetHiddenSuggestions:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)contactsDidChange;
- (void)continueSetup;
- (void)dealloc;
- (void)deleteHistorySuccessfulFromViewController:(id)a3;
- (void)didAcceptEnteredPIN;
- (void)didCancelEnteringPIN;
- (void)handleAssetStatusUpdated;
- (void)handleBuddyFlow;
- (void)handleGmCFU;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)loadAppStorePageForBundleId:(id)a3;
- (void)lowPowerModeChangedNotification:(id)a3;
- (void)managedConfigurationChanged;
- (void)openStorageManagement:(id)a3;
- (void)outputVoiceDidChange;
- (void)preferencesDidChange;
- (void)prepareForSnapshot;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)registerUndoActionWithKey:(id)a3 urlString:(id)a4 undoAction:(id)a5;
- (void)reloadSpecifierID:(id)a3;
- (void)reloadSpecifiers;
- (void)resetZKWHiddenSuggestions:(id)a3;
- (void)saveSpotlightSettings;
- (void)setAccessibleFromLockScreen:(id)a3 forSpecifier:(id)a4;
- (void)setAssistantEnabled:(BOOL)a3;
- (void)setAssistantLanguage:(id)a3;
- (void)setAssistantLanguage:(id)a3 forSpecifier:(id)a4;
- (void)setDisabledFromLockScreen:(BOOL)a3;
- (void)setHardwareButtonTrigger:(id)a3 forSpecifier:(id)a4;
- (void)setSelectedLanguageWantsMultilingualEnabled:(BOOL)a3;
- (void)setShowInAppLibraryEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setShowInSpotlightEnabled:(id)a3;
- (void)setShowWhenListeningEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setShowWhenSharingEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setShowZKWRecentsEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setShowZKWSuggestionsEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setTypeToSiriTrigger:(id)a3 forSpecifier:(id)a4;
- (void)setVoiceActivation:(id)a3 forSpecifier:(id)a4 withTrainingCompletionIfNecessary:(id)a5;
- (void)setVoiceTrigger:(id)a3 forSpecifier:(id)a4;
- (void)setVoiceTrigger:(id)a3 forSpecifier:(id)a4 transitionWithNavControllerIfNecessary:(id)a5;
- (void)showAboutAppleIntelligenceSheet:(id)a3;
- (void)showAboutAssistantSheet:(id)a3;
- (void)showAboutImproveDictationSheet:(id)a3;
- (void)showAboutSearchSuggestionsSheet:(id)a3;
- (void)showAssistantConfirmationViewForSpecifier:(id)a3 presentingViewController:(id)a4 actionHandler:(id)a5;
- (void)showAssistantHistoryViewController:(id)a3;
- (void)showAssistantVoiceActivationController:(id)a3;
- (void)showLearnMore;
- (void)showMeCardPicker:(id)a3;
- (void)showOBKPrivacySheetWithIdentifier:(id)a3;
- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3;
- (void)siriUODAvailabilityDidChange:(BOOL)a3;
- (void)skipSetup;
- (void)startEnrollment:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation AssistantController

- (id)hardwareButtonTrigger:(id)a3
{
  v3 = NSNumber;
  BOOL v4 = +[AssistantUtilities isHardwareButtonTrigger];

  return (id)[v3 numberWithBool:v4];
}

- (id)voiceTrigger:(id)a3
{
  v3 = NSNumber;
  BOOL v4 = [(AssistantController *)self _isVoiceTriggerEnabled];

  return (id)[v3 numberWithBool:v4];
}

- (BOOL)_isVoiceTriggerEnabled
{
  v2 = [MEMORY[0x263F85AF0] sharedPreferences];
  char v3 = [v2 voiceTriggerEnabled];

  return v3;
}

- (void)_askSiriUseDefaultFooterTextWithGroupSpecifier:(id)a3
{
  id v4 = a3;
  if (AFAssistantRestricted()) {
    [(AssistantController *)self _askSiriUseRestrictedFooterWithGroupSpecifier:v4];
  }
  else {
    [(AssistantController *)self _askSiriUseDownloadFinishedFooterTextWithGroupSpecifier:v4];
  }
}

- (void)_addHyperlinkStyleToText:(id)a3 inString:(id)a4 action:(SEL)a5 forGroup:(id)a6
{
  id v22 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [v11 propertyForKey:*MEMORY[0x263F600C0]];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  char v15 = [v12 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x263EFF940];
    uint64_t v17 = *MEMORY[0x263EFF498];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    [v16 raise:v17, @"Group must use %@ as footer cell class", v19 format];
  }
  uint64_t v20 = [v10 rangeOfString:v22];
  if (v21) {
    objc_msgSend(v11, "addFooterHyperlinkWithRange:target:action:", v20, v21, self, a5);
  }
}

- (id)_localizedStringWithFormattedIDTemplate:(id)a3
{
  char v3 = (void *)MEMORY[0x263F82670];
  id v4 = a3;
  v5 = [v3 currentDevice];
  int v6 = objc_msgSend(v5, "sf_isChinaRegionCellularDevice");

  if (v6) {
    v7 = @"_CHINA";
  }
  else {
    v7 = &stru_26D2AB140;
  }
  v8 = [v4 stringByReplacingOccurrencesOfString:@"{CHINA}" withString:v7];

  v9 = NSString;
  id v10 = [MEMORY[0x263F82670] currentDevice];
  id v11 = objc_msgSend(v10, "sf_deviceType");
  v12 = [v11 uppercaseString];
  v13 = [v9 stringWithFormat:@"_%@", v12];

  v14 = [v8 stringByReplacingOccurrencesOfString:@"{DEVICE}" withString:v13];
  char v15 = +[AssistantController bundle];
  v16 = [v15 localizedStringForKey:v14 value:&stru_26D2AB140 table:@"AssistantSettings"];

  if (v6)
  {
    uint64_t v17 = +[AssistantController bundle];
    v18 = [v17 localizedStringForKey:@"SIRI_REQUESTS_CHINA_REGULATORY_TEXT" value:&stru_26D2AB140 table:@"AssistantSettings"];
    uint64_t v19 = [v16 stringByAppendingFormat:@" %@", v18];

    v16 = (void *)v19;
  }

  return v16;
}

+ (id)bundle
{
  v2 = (void *)bundle_sAssistantBundle_3;
  if (!bundle_sAssistantBundle_3)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = (void *)bundle_sAssistantBundle_3;
    bundle_sAssistantBundle_3 = v3;

    v2 = (void *)bundle_sAssistantBundle_3;
  }

  return v2;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(AssistantController *)self loadSpecifiersFromPlistName:@"AssistantSettings" target:self];
    [(AssistantController *)self configureSettingsForGM:v5];
    [(AssistantController *)self configureSettingsForImageCreation:v5];
    [(AssistantController *)self configureSiriRequestsSpecifiersFor:v5];
    [(AssistantController *)self configureExternalAIModelSettingsSpecifiersFor:v5];
    [(AssistantController *)self configureSuggestionsSpecifiersFor:v5];
    [(AssistantController *)self configureApplicationListSpecifiersFor:v5];
    [(AssistantController *)self configureAppleIntelligencePrivacyFooterSpecifiersFor:v5];
    [(AssistantController *)self configureSettingsTipForGrayMatter];
    int v6 = (objc_class *)[v5 copy];
    v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v6;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)assistantLanguage:(id)a3
{
  return +[AssistantUtilities assistantLanguage];
}

- (id)_localizeTriggerString:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F285A0];
  id v4 = a3;
  v5 = [v3 sharedPreferences];
  int v6 = [v5 languageCode];

  v7 = [MEMORY[0x263F85AF0] sharedPreferences];
  v8 = [v7 localizedTriggerPhraseForLanguageCode:v6];

  v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v17 = "-[AssistantController _localizeTriggerString:]";
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_impl(&dword_220C23000, v9, OS_LOG_TYPE_DEFAULT, "%s languageCode: %@, triggerPhrase: %@", buf, 0x20u);
  }
  id v10 = [v8 stringByReplacingOccurrencesOfString:@" " withString:@" "];
  id v11 = NSString;
  v12 = +[AssistantController bundle];
  v13 = [v12 localizedStringForKey:v4 value:&stru_26D2AB140 table:@"AssistantSettings"];

  v14 = objc_msgSend(v11, "stringWithFormat:", v13, v10);

  return v14;
}

- (AssistantController)init
{
  v33.receiver = self;
  v33.super_class = (Class)AssistantController;
  v2 = [(AssistantController *)&v33 init];
  if (v2)
  {
    uint64_t v3 = (SUICAssistantVoiceSettingsConnection *)objc_alloc_init(MEMORY[0x263F75410]);
    settingsConnection = v2->_settingsConnection;
    v2->_settingsConnection = v3;

    v5 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x263F285E0]);
    AFSettingsConnection = v2->_AFSettingsConnection;
    v2->_AFSettingsConnection = v5;

    v7 = (UAFAssetUtilities *)objc_alloc_init(MEMORY[0x263F84088]);
    assetUtils = v2->_assetUtils;
    v2->_assetUtils = v7;

    v9 = (LAPasscodeVerificationService *)objc_alloc_init(MEMORY[0x263F10518]);
    passcodeService = v2->_passcodeService;
    v2->_passcodeService = v9;

    id v11 = [[GMSpecifierProvider alloc] initWithPresenter:v2];
    gmSpecifierProvider = v2->_gmSpecifierProvider;
    v2->_gmSpecifierProvider = v11;

    v13 = objc_alloc_init(_TtC24AssistantSettingsSupport15GMFooterUtility);
    gmFooterUtility = v2->_gmFooterUtility;
    v2->_gmFooterUtility = v13;

    char v15 = objc_alloc_init(GMAnalyticsProvider);
    gmAnalyticsProvider = v2->_gmAnalyticsProvider;
    v2->_gmAnalyticsProvider = v15;

    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2050000000;
    uint64_t v17 = (void *)getVTUISiriDataSharingOptInPresenterClass_softClass;
    uint64_t v38 = getVTUISiriDataSharingOptInPresenterClass_softClass;
    if (!getVTUISiriDataSharingOptInPresenterClass_softClass)
    {
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __getVTUISiriDataSharingOptInPresenterClass_block_invoke;
      v34[3] = &unk_26457D098;
      v34[4] = &v35;
      __getVTUISiriDataSharingOptInPresenterClass_block_invoke((uint64_t)v34);
      uint64_t v17 = (void *)v36[3];
    }
    __int16 v18 = v17;
    _Block_object_dispose(&v35, 8);
    uint64_t v19 = (VTUISiriDataSharingOptInPresenter *)objc_alloc_init(v18);
    siriDataSharingPresenter = v2->_siriDataSharingPresenter;
    v2->_siriDataSharingPresenter = v19;

    [(VTUISiriDataSharingOptInPresenter *)v2->_siriDataSharingPresenter setPresentationDelegate:v2];
    [(VTUISiriDataSharingOptInPresenter *)v2->_siriDataSharingPresenter setSourceOfChange:7];
    uint64_t v21 = objc_opt_new();
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v21;

    v23 = [MEMORY[0x263F08A00] defaultCenter];
    [v23 addObserver:v2 selector:sel_contactsDidChange name:*MEMORY[0x263EFE118] object:0];

    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v2 selector:sel_prepareForSnapshot name:*MEMORY[0x263F83330] object:0];

    v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 addObserver:v2 selector:sel_outputVoiceDidChange name:*MEMORY[0x263F28310] object:0];

    v26 = [MEMORY[0x263F08A00] defaultCenter];
    [v26 addObserver:v2 selector:sel_languageCodeDidChange name:*MEMORY[0x263F282E8] object:0];

    v27 = [MEMORY[0x263F08A00] defaultCenter];
    [v27 addObserver:v2 selector:sel_preferencesDidChange name:*MEMORY[0x263F28318] object:0];

    v28 = [MEMORY[0x263F08A00] defaultCenter];
    [v28 addObserver:v2 selector:sel_didBecomeActive name:*MEMORY[0x263F83318] object:0];

    v29 = [MEMORY[0x263F08A00] defaultCenter];
    [v29 addObserver:v2 selector:sel_preferencesDidChange name:*MEMORY[0x263F8B208] object:0];

    v30 = [MEMORY[0x263F08A00] defaultCenter];
    [v30 addObserver:v2 selector:sel_managedConfigurationChanged name:*MEMORY[0x263F536E0] object:0];

    v31 = [(AssistantController *)v2 assistantVoiceLanguage:0];
    [(AssistantController *)v2 _updateSpecifiersForLanguage:v31];

    [(AssistantController *)v2 _makeMeDeviceDetermination];
    [(AssistantController *)v2 _refreshAvailableLanguagesInTheHome];
    v2->_imageGenWaitlistStatus = 0;
    [(AssistantController *)v2 _fetchGMWaitListStatus];
  }
  return v2;
}

- (void)_updateSpecifiersForLanguage:(id)a3
{
  AFOutputVoiceLanguageForRecognitionLanguage();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  int v4 = -[SUICAssistantVoiceSettingsConnection languageHasVoiceSelection:](self->_settingsConnection, "languageHasVoiceSelection:");
  v5 = [(AssistantController *)self specifierForID:@"VOICE_ID"];
  int v6 = v5;
  if (v4)
  {
    if (v5)
    {
    }
    else
    {
      v7 = [(AssistantController *)self specifierForID:@"ACTIVATION_COMPACT_ID"];

      if (v7) {
        [(AssistantController *)self insertSpecifier:self->_voiceSpecifier afterSpecifierID:@"ACTIVATION_COMPACT_ID" animated:1];
      }
    }
  }
  else
  {

    if (v6) {
      [(AssistantController *)self removeSpecifier:self->_voiceSpecifier animated:1];
    }
  }
  v8 = [(AssistantController *)self specifierForID:@"ACTIVATION"];
  v9 = [(AssistantController *)self _localizeTriggerString:@"ACTIVATION"];
  [v8 setName:v9];

  if ([(AssistantController *)self _isHeySiriAlwaysOn]) {
    [v8 setProperty:&unk_26D2B3B50 forKey:*MEMORY[0x263F600A8]];
  }
  [(AssistantController *)self reloadSpecifier:v8];
}

- (void)configureApplicationListSpecifiersFor:(id)a3
{
  id v3 = a3;
  int v4 = +[GMEligibilityProvider shared];
  if ([v4 deviceSupported])
  {
    v5 = +[AssistantController bundle];
    v23 = [v5 localizedStringForKey:@"GM_APP_ACCESS_GROUP" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
  }
  else
  {
    v23 = @"APP_ACCESS_GROUP";
  }

  int v6 = (void *)MEMORY[0x263F5FC40];
  v7 = +[AssistantController bundle];
  v8 = [v7 localizedStringForKey:v23 value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v22 = [v6 groupSpecifierWithName:v8];

  [v3 addObject:v22];
  v9 = (void *)MEMORY[0x263F5FC40];
  id v10 = +[AssistantController bundle];
  id v11 = [v10 localizedStringForKey:@"APP_CLIPS" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v12 = [v9 preferenceSpecifierNamed:v11 target:0 set:0 get:0 detail:0 cell:1 edit:0];

  uint64_t v13 = objc_opt_class();
  uint64_t v14 = *MEMORY[0x263F5FFE0];
  [v12 setProperty:v13 forKey:*MEMORY[0x263F5FFE0]];
  [v12 setDetailControllerClass:objc_opt_class()];
  [v12 setIdentifier:@"ASSISTANT_APP_CLIPS_SETTINGS_ID"];
  uint64_t v15 = *MEMORY[0x263F601A8];
  uint64_t v16 = MEMORY[0x263EFFA88];
  [v12 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601A8]];
  uint64_t v17 = *MEMORY[0x263F60158];
  [v12 setProperty:@"com.apple.graphic-icon.app-clips" forKey:*MEMORY[0x263F60158]];
  [v3 addObject:v12];
  __int16 v18 = (void *)MEMORY[0x263F5FC40];
  uint64_t v19 = +[AssistantController bundle];
  __int16 v20 = [v19 localizedStringForKey:@"APPS" value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v21 = [v18 preferenceSpecifierNamed:v20 target:0 set:0 get:0 detail:0 cell:1 edit:0];

  [v21 setProperty:objc_opt_class() forKey:v14];
  [v21 setDetailControllerClass:objc_opt_class()];
  [v21 setIdentifier:@"ASSISTANT_APPS_SETTINGS_ID"];
  [v21 setProperty:v16 forKey:v15];
  [v21 setProperty:@"com.apple.graphic-icon.home-screen" forKey:v17];
  [v3 addObject:v21];
}

- (void)lowPowerModeChangedNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__AssistantController_lowPowerModeChangedNotification___block_invoke;
  block[3] = &unk_26457CF88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__AssistantController_lowPowerModeChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AssistantController;
  [(AssistantController *)&v7 viewWillAppear:a3];
  +[AssistantMetrics didVisit];
  int v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDC8]) objectForKey:@"VOICE_FEEDBACK_ID"];
  [(AssistantController *)self reloadSpecifier:v4];

  if (self->_needsReloadSpecifiersOnViewWillAppear)
  {
    uint64_t v5 = (int)*MEMORY[0x263F5FDB8];
    int v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v5);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = 0;

    [(AssistantController *)self reloadSpecifiers];
    self->_needsReloadSpecifiersOnViewWillAppear = 0;
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)AssistantController;
  [(AssistantController *)&v4 viewDidLoad];
  [(UAFAssetUtilities *)self->_assetUtils setDelegate:self];
  [(UAFAssetUtilities *)self->_assetUtils startObservers];
  [(UAFAssetUtilities *)self->_assetUtils downloadSiriAssets];
  [(UAFAssetUtilities *)self->_assetUtils setAutoRetryEnabled:1];
  id v3 = +[GMEligibilityProvider shared];
  [v3 fetchStatusAndForceDownloadIfNeededWithPresenter:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)AssistantController;
  [(AssistantController *)&v15 viewDidAppear:a3];
  [(AssistantController *)self _handleDelayedDeeplink];
  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_lowPowerModeChangedNotification_ name:*MEMORY[0x263F08450] object:0];

  uint64_t v5 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Siri"];
  int v6 = +[GMEligibilityProvider shared];
  int v7 = [v6 deviceSupported];

  if (v7) {
    v8 = @"Apple Intelligence & Siri";
  }
  else {
    v8 = @"Siri";
  }
  id v9 = objc_alloc(MEMORY[0x263F08DB0]);
  id v10 = [MEMORY[0x263EFF960] currentLocale];
  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 bundleURL];
  uint64_t v13 = (void *)[v9 initWithKey:v8 table:0 locale:v10 bundleURL:v12];

  [(AssistantController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.siri" title:v13 localizedNavigationComponents:MEMORY[0x263EFFA68] deepLink:v5];
  uint64_t v14 = +[GMEligibilityProvider shared];
  LODWORD(v10) = [v14 deviceSupported];

  if (v10)
  {
    [(GMAnalyticsProvider *)self->_gmAnalyticsProvider sendAction:1];
    [(AssistantController *)self _fetchGMWaitListStatus];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AssistantController;
  [(AssistantController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F08450] object:0];

  self->_needsReloadSpecifiersOnViewWillAppear = 1;
}

+ (BOOL)_heySiriSupportedForLanguage:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  objc_super v4 = AFPreferencesSupportedLanguages();
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (void)willMoveToParentViewController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AssistantController;
  -[AssistantController willMoveToParentViewController:](&v8, sel_willMoveToParentViewController_);
  if (!a3)
  {
    char v5 = [(AssistantController *)self parentViewController];
    int v6 = [v5 navigationItem];
    [v6 setTitleView:0];

    int v7 = [(AssistantController *)self navigationItem];
    [v7 setTitle:0];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AssistantController;
  [(AssistantController *)&v4 dealloc];
}

- (void)contactsDidChange
{
}

- (void)prepareForSnapshot
{
  [(AssistantController *)self dismissConfirmationViewAnimated:0];

  [(AssistantController *)self reloadSpecifierID:@"ASSISTANT" animated:0];
}

- (void)outputVoiceDidChange
{
}

- (void)preferencesDidChange
{
  [(AssistantController *)self _refreshAvailableLanguagesInTheHome];

  [(AssistantController *)self reloadSpecifiers];
}

- (void)managedConfigurationChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__AssistantController_managedConfigurationChanged__block_invoke;
  block[3] = &unk_26457CF88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __50__AssistantController_managedConfigurationChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)assistantAboutDonePressed:(id)a3
{
  objc_super v4 = [(AssistantController *)self presentedViewController];

  if (v4)
  {
    [(AssistantController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)showOBKPrivacySheetWithIdentifier:(id)a3
{
  id v4 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:a3];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)showAboutAppleIntelligenceSheet:(id)a3
{
  id v4 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.intelligenceengine"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)showAboutAssistantSheet:(id)a3
{
}

- (void)showAboutImproveDictationSheet:(id)a3
{
}

- (void)showAboutSearchSuggestionsSheet:(id)a3
{
}

- (void)openStorageManagement:(id)a3
{
  id v3 = [NSURL URLWithString:@"prefs:root=General&path=STORAGE_MGMT"];
  id v4 = [MEMORY[0x263F01880] defaultWorkspace];
  id v9 = 0;
  int v5 = [v4 openSensitiveURL:v3 withOptions:MEMORY[0x263EFFA78] error:&v9];
  id v6 = v9;

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    objc_super v8 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[AssistantController openStorageManagement:](v8, v6);
    }
  }
}

- (id)bundle
{
  return +[AssistantController bundle];
}

- (void)reloadSpecifiers
{
  assistantSettings = self->_assistantSettings;
  self->_assistantSettings = 0;

  disabledSpotlightDomains = self->_disabledSpotlightDomains;
  self->_disabledSpotlightDomains = 0;

  disabledSpotlightBundles = self->_disabledSpotlightBundles;
  self->_disabledSpotlightBundles = 0;

  v7.receiver = self;
  v7.super_class = (Class)AssistantController;
  [(AssistantController *)&v7 reloadSpecifiers];
  id v6 = [(AssistantController *)self assistantVoiceLanguage:0];
  [(AssistantController *)self _updateSpecifiersForLanguage:v6];

  [(AssistantController *)self _updateSpecifiersForSettingsTip];
}

- (void)reloadSpecifierID:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEqual:@"IMAGE_CREATION"])
  {
    int v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v8 = "-[AssistantController reloadSpecifierID:]";
      _os_log_impl(&dword_220C23000, v5, OS_LOG_TYPE_INFO, "%s Entered reload specifier for image creation", buf, 0xCu);
    }
    [(AssistantController *)self _fetchGMWaitListStatus];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AssistantController;
    [(AssistantController *)&v6 reloadSpecifierID:v4];
  }
}

- (void)_refreshAvailableLanguagesInTheHome
{
  objc_initWeak(&location, self);
  v2 = dispatch_get_global_queue(0, 0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__AssistantController__refreshAvailableLanguagesInTheHome__block_invoke;
  v3[3] = &unk_26457CF60;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __58__AssistantController__refreshAvailableLanguagesInTheHome__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)*((void *)WeakRetained + 197);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __58__AssistantController__refreshAvailableLanguagesInTheHome__block_invoke_2;
    v5[3] = &unk_26457D4B8;
    objc_copyWeak(&v6, v1);
    [v4 availableLanguagesInTheHome:v5];
    objc_destroyWeak(&v6);
  }
}

void __58__AssistantController__refreshAvailableLanguagesInTheHome__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        __58__AssistantController__refreshAvailableLanguagesInTheHome__block_invoke_2_cold_1();
      }
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
      uint64_t v9 = (void *)WeakRetained[207];
      WeakRetained[207] = v8;
    }
  }
}

- (void)configureSettingsForGM:(id)a3
{
  id v12 = a3;
  id v4 = +[GMEligibilityProvider shared];
  int v5 = [v4 deviceSupported];

  if (v5)
  {
    id v6 = [(GMSpecifierProvider *)self->_gmSpecifierProvider fetchGMRampSpecifierWith:v12];
    if (v6)
    {
      objc_super v7 = [v12 specifierForID:@"ASSISTANT_PLACARD"];
      objc_msgSend(v12, "ps_insertObject:afterObject:", v6, v7);
    }
    if (+[ASTNetworkReachability hasNetworkConnection]) {
      uint64_t v8 = +[ASTNetworkReachability hasExpensiveCellOnlyNetworkConnection] ^ 1;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v10 = objc_msgSend(v9, "sf_isChinaRegionCellularDevice");

    id v11 = [v12 specifierForID:@"ASSISTANT_PLACARD_GROUP"];
    [(GMFooterUtility *)self->_gmFooterUtility updateFooterWithSpecifier:v11 settings:self wifiAvailable:v8 isChinaSKU:v10];
  }
}

- (id)_imageCreationAccessLabel
{
  v2 = +[AssistantController bundle];
  id v3 = [v2 localizedStringForKey:@"IMAGE_CREATION_ACCESS" value:&stru_26D2AB140 table:@"AssistantSettings"];

  return v3;
}

- (void)_fetchGMWaitListStatus
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x263F413C8];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__AssistantController__fetchGMWaitListStatus__block_invoke;
  v3[3] = &unk_26457D508;
  objc_copyWeak(&v4, &location);
  [v2 getWaitlistWithUseCaseIdentifier:@"com.apple.Settings.AppleIntelligence.Diffusion" completionHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __45__AssistantController__fetchGMWaitListStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __45__AssistantController__fetchGMWaitListStatus__block_invoke_cold_1(v6, v5);
    }
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__AssistantController__fetchGMWaitListStatus__block_invoke_212;
    v7[3] = &unk_26457D4E0;
    objc_copyWeak(v8, (id *)(a1 + 32));
    v8[1] = a2;
    dispatch_async(MEMORY[0x263EF83A0], v7);
    objc_destroyWeak(v8);
  }
}

void __45__AssistantController__fetchGMWaitListStatus__block_invoke_212(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((void *)WeakRetained + 213) = *(void *)(a1 + 40);
    id v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v14 = 136315394;
      objc_super v15 = "-[AssistantController _fetchGMWaitListStatus]_block_invoke";
      __int16 v16 = 2048;
      uint64_t v17 = v5;
      _os_log_impl(&dword_220C23000, v4, OS_LOG_TYPE_INFO, "%s Current ADM Waitlist Status is: %ld", (uint8_t *)&v14, 0x16u);
    }
    [v3 reloadSpecifiers];
  }
  else
  {
    id v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __45__AssistantController__fetchGMWaitListStatus__block_invoke_212_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)configureSettingsForImageCreation:(id)a3
{
  id v24 = a3;
  if (![(GMSpecifierProvider *)self->_gmSpecifierProvider fetchGMCapability]) {
    goto LABEL_9;
  }
  id v4 = +[GMEligibilityProvider shared];
  int v5 = [v4 deviceSupported];

  if (!v5) {
    goto LABEL_9;
  }
  int64_t imageGenWaitlistStatus = self->_imageGenWaitlistStatus;
  uint64_t v7 = +[GMEligibilityProvider shared];
  if ([v7 eligibility] == 17) {
    goto LABEL_8;
  }
  uint64_t v8 = +[GMEligibilityProvider shared];
  if ([v8 eligibility] == 15)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v9 = +[GMEligibilityProvider shared];
  if ([v9 eligibility] == 16)
  {

    goto LABEL_7;
  }
  uint64_t v11 = +[GMEligibilityProvider shared];
  uint64_t v12 = [v11 eligibility];

  if (v12 != 14 && imageGenWaitlistStatus == 1)
  {
    uint64_t v13 = +[GMEligibilityProvider shared];
    int v14 = [v13 optedIn];

    if (v14)
    {
      objc_super v15 = (void *)MEMORY[0x263F5FC40];
      __int16 v16 = +[AssistantController bundle];
      uint64_t v17 = [v16 localizedStringForKey:@"IMAGE_CREATION_NAME" value:&stru_26D2AB140 table:@"AssistantSettings"];
      uint64_t v10 = [v15 preferenceSpecifierNamed:v17 target:self set:0 get:sel__imageCreationAccessLabel detail:0 cell:4 edit:0];

      [v10 setIdentifier:@"ImageCreation"];
      uint64_t v18 = [v24 specifierForID:@"IMAGE_CREATION"];
      objc_msgSend(v24, "ps_insertObject:afterObject:", v10, v18);
      if (+[AssistantUtilities deviceIsiPhone])
      {
        uint64_t v19 = +[AssistantController bundle];
        __int16 v20 = v19;
        uint64_t v21 = @"IMAGE_CREATION_FOOTER_TEXT_IPHONE";
      }
      else
      {
        BOOL v22 = +[AssistantUtilities deviceIsiPad];
        uint64_t v19 = +[AssistantController bundle];
        __int16 v20 = v19;
        if (v22) {
          uint64_t v21 = @"IMAGE_CREATION_FOOTER_TEXT_IPAD";
        }
        else {
          uint64_t v21 = @"IMAGE_CREATION_FOOTER_TEXT_GENERIC";
        }
      }
      v23 = [v19 localizedStringForKey:v21 value:&stru_26D2AB140 table:@"AssistantSettings"];

      [v18 setProperty:v23 forKey:*MEMORY[0x263F600F8]];
      goto LABEL_10;
    }
  }
LABEL_9:
  uint64_t v10 = [v24 specifierForID:@"IMAGE_CREATION"];
  [v24 removeObject:v10];
LABEL_10:
}

- (void)configureSiriRequestsSpecifiersFor:(id)a3
{
  id v4 = a3;
  int v5 = [v4 specifierForID:@"ASSISTANT_LOCK_SCREEN_ACCESS"];
  lockScreenSpecifier = self->_lockScreenSpecifier;
  self->_lockScreenSpecifier = v5;

  uint64_t v7 = self->_lockScreenSpecifier;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", +[AssistantUtilities isAssistantLockScreenAccessRestricted](AssistantUtilities, "isAssistantLockScreenAccessRestricted") ^ 1);
  uint64_t v9 = *MEMORY[0x263F600A8];
  [(PSSpecifier *)v7 setProperty:v8 forKey:*MEMORY[0x263F600A8]];

  uint64_t v10 = self->_lockScreenSpecifier;
  uint64_t v11 = [(AssistantController *)self _localizeTriggerString:@"ASSISTANT_LOCK_SCREEN_ACCESS"];
  [(PSSpecifier *)v10 setName:v11];

  uint64_t v12 = [v4 specifierForID:@"ACTIVATION"];
  uint64_t v13 = [(AssistantController *)self _localizeTriggerString:@"ACTIVATION"];
  v62 = v12;
  [v12 setName:v13];

  int v14 = [v4 specifierForID:@"ACTIVATION_COMPACT_ID"];
  objc_super v15 = +[GMEligibilityProvider shared];
  LODWORD(v8) = [v15 activeEnabled];

  if (v8)
  {
    __int16 v16 = [(AssistantController *)self _localizeTriggerString:@"ACTIVATION_COMPACT_ALT"];
    [v14 setName:v16];
  }
  -[AssistantController _specifiersToRemove:](self, "_specifiersToRemove:", v4, v14);
  uint64_t v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  assistantSettings = self->_assistantSettings;
  self->_assistantSettings = v17;

  currentSiriActivationSpecifier = self->_currentSiriActivationSpecifier;
  if (currentSiriActivationSpecifier)
  {
    uint64_t v20 = 1432;
    if (currentSiriActivationSpecifier == self->_voiceActivationSpecifier)
    {
      uint64_t v21 = @"ACTIVATION";
    }
    else
    {
      uint64_t v20 = 1440;
      if (currentSiriActivationSpecifier != self->_voiceActivationSettingsSpecifier) {
        goto LABEL_11;
      }
      uint64_t v21 = @"ACTIVATION_COMPACT_ID";
    }
    v26 = [v4 specifierForID:v21];
    v27 = *(Class *)((char *)&self->super.super.super.super.super.isa + v20);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v20) = v26;

    v28 = (PSSpecifier *)*(id *)((char *)&self->super.super.super.super.super.isa + v20);
    voiceActivationSpecifier = self->_currentSiriActivationSpecifier;
    self->_currentSiriActivationSpecifier = v28;
  }
  else
  {
    BOOL v22 = [v4 specifierForID:@"ACTIVATION_COMPACT_ID"];
    voiceActivationSettingsSpecifier = self->_voiceActivationSettingsSpecifier;
    self->_voiceActivationSettingsSpecifier = v22;

    id v24 = [v4 specifierForID:@"ACTIVATION"];
    voiceActivationSpecifier = self->_voiceActivationSpecifier;
    self->_voiceActivationSpecifier = v24;
  }

LABEL_11:
  if (AFAssistantRestricted()) {
    [(PSSpecifier *)self->_voiceActivationSettingsSpecifier setProperty:MEMORY[0x263EFFA80] forKey:v9];
  }
  id v29 = objc_alloc_init(MEMORY[0x263F2BCC0]);
  uint64_t v30 = [v29 effectiveGlobalAnnounceSetting];

  v31 = [v4 specifierForID:@"ANNOUNCE_MESSAGES"];
  announceMessagesSpecifier = self->_announceMessagesSpecifier;
  self->_announceMessagesSpecifier = v31;

  objc_super v33 = self->_announceMessagesSpecifier;
  v34 = (void *)MEMORY[0x263F60180];
  uint64_t v35 = (void *)MEMORY[0x263F5FF60];
  if (v30 == -1)
  {
    [v4 removeObject:self->_announceMessagesSpecifier];
    uint64_t v37 = self->_announceMessagesSpecifier;
    self->_announceMessagesSpecifier = 0;
  }
  else
  {
    v36 = PSBundlePathForPreferenceBundle();
    [(PSSpecifier *)v33 setProperty:v36 forKey:*v34];

    [(PSSpecifier *)self->_announceMessagesSpecifier setProperty:MEMORY[0x263EFFA88] forKey:*v35];
    [(PSSpecifier *)self->_announceMessagesSpecifier setControllerLoadAction:sel_lazyLoadBundle_];
  }
  uint64_t v38 = [v4 specifierForID:@"MESSAGE_WITHOUT_CONFIRMATION"];
  if (_os_feature_enabled_impl())
  {
    v39 = PSBundlePathForPreferenceBundle();
    [v38 setProperty:v39 forKey:*v34];

    uint64_t v40 = MEMORY[0x263EFFA88];
    [v38 setProperty:MEMORY[0x263EFFA88] forKey:*v35];
    [v38 setProperty:v40 forKey:*MEMORY[0x263F5FEF8]];
    [v38 setControllerLoadAction:sel_lazyLoadBundle_];
  }
  else
  {
    [v4 removeObject:v38];

    uint64_t v38 = 0;
  }
  v41 = [v4 specifierForID:@"ACTIVATION"];
  [v4 removeObject:v41];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v42 = [v4 specifierForID:@"ANNOUNCE_CALLS"];
    [v4 removeObject:v42];
  }
  v43 = [(AssistantController *)self assistantEnabled:0];
  char v44 = [v43 BOOLValue];

  if ((v44 & 1) == 0)
  {
    [v4 removeObjectsInArray:self->_assistantSettings];
    [v4 removeObject:v38];

    uint64_t v38 = 0;
  }
  v45 = [v4 specifierForID:@"SIRI_IN_CALL_ID"];
  siriInCallSpecifier = self->_siriInCallSpecifier;
  self->_siriInCallSpecifier = v45;

  v47 = self->_siriInCallSpecifier;
  v48 = +[AssistantSiriInCallController localizedSettingName];
  [(PSSpecifier *)v47 setName:v48];

  if (!+[AssistantSiriInCallController isSettingSupported](AssistantSiriInCallController, "isSettingSupported"))[v4 removeObject:self->_siriInCallSpecifier]; {
  v49 = [v4 specifierForID:@"SIRI_REQUESTS_GROUP"];
  }
  v50 = (objc_class *)objc_opt_class();
  v51 = NSStringFromClass(v50);
  [v49 setProperty:v51 forKey:*MEMORY[0x263F600C0]];

  [v49 removePropertyForKey:*MEMORY[0x263F600D8]];
  [(AssistantController *)self _askSiriUseDefaultFooterTextWithGroupSpecifier:v49];
  objc_initWeak(&location, self);
  v52 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__AssistantController_configureSiriRequestsSpecifiersFor___block_invoke;
  block[3] = &unk_26457D530;
  objc_copyWeak(&v67, &location);
  id v53 = v49;
  id v66 = v53;
  dispatch_async(v52, block);

  v54 = [MEMORY[0x263F75410] assistantLanguageTitlesDictionary];
  v55 = [v54 allKeys];
  v56 = (void *)[v55 mutableCopy];

  v57 = [(AssistantController *)self detailTextForLanguageSpecifierFromTitles:v54];
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __58__AssistantController_configureSiriRequestsSpecifiersFor___block_invoke_3;
  v63[3] = &unk_26457D318;
  id v58 = v54;
  id v64 = v58;
  [v56 sortUsingComparator:v63];
  v59 = [v4 specifierForID:@"LANGUAGE_ID"];
  languageSpecifier = self->_languageSpecifier;
  self->_languageSpecifier = v59;

  [(PSSpecifier *)self->_languageSpecifier setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [(PSSpecifier *)self->_languageSpecifier setValues:v56];
  [(PSSpecifier *)self->_languageSpecifier setTitleDictionary:v58];
  [(PSSpecifier *)self->_languageSpecifier setShowContentString:1];
  if (v57 && [v57 length]) {
    [(PSSpecifier *)self->_languageSpecifier setProperty:v57 forKey:*MEMORY[0x263F602C8]];
  }
  else {
    [(PSSpecifier *)self->_languageSpecifier removePropertyForKey:*MEMORY[0x263F602C8]];
  }

  objc_destroyWeak(&v67);
  objc_destroyWeak(&location);
}

void __58__AssistantController_configureSiriRequestsSpecifiersFor___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[205] currentAssetStatus];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__AssistantController_configureSiriRequestsSpecifiersFor___block_invoke_2;
    block[3] = &unk_26457D368;
    void block[4] = v3;
    id v7 = *(id *)(a1 + 32);
    id v8 = v4;
    id v5 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __58__AssistantController_configureSiriRequestsSpecifiersFor___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSiriFooterGroup:*(void *)(a1 + 40) withStatus:*(void *)(a1 + 48)];
}

uint64_t __58__AssistantController_configureSiriRequestsSpecifiersFor___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 objectForKey:a2];
  id v8 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (id)_specifiersToRemove:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] arrayWithArray:&unk_26D2B3B68];
  id v5 = [MEMORY[0x263F285A0] sharedPreferences];
  id v6 = [v5 outputVoice];

  if (!v6) {
    [v4 addObject:@"VOICE_ID"];
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(v3, "specifierForID:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  int v14 = +[GMEligibilityProvider shared];
  char v15 = [v14 deviceSupported];

  if ((v15 & 1) == 0)
  {
    __int16 v16 = [v3 specifierForID:@"LANGUAGE_ID"];
    [v7 addObject:v16];
  }

  return v7;
}

- (void)configureSettingsTipForGrayMatter
{
  id v3 = +[GMEligibilityProvider shared];
  int v4 = [v3 deviceSupported];

  if (v4)
  {
    id v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
    settingsTipGroupSpecifier = self->_settingsTipGroupSpecifier;
    self->_settingsTipGroupSpecifier = v5;

    [(PSSpecifier *)self->_settingsTipGroupSpecifier setIdentifier:@"ASSISTANT_TIP_GROUP"];
    id v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"ASSISTANT_TIP" target:self set:0 get:0 detail:0 cell:-1 edit:0];
    settingsTipSpecifier = self->_settingsTipSpecifier;
    self->_settingsTipSpecifier = v7;

    [(PSSpecifier *)self->_settingsTipSpecifier setObject:NSClassFromString(&cfstr_Assistantsetti_1.isa) forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    id v9 = +[TipsManager shared];
    [v9 configureTipsWithController:self];
  }
}

- (void)_updateSiriFooterGroup:(id)a3 withStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [v6 removePropertyForKey:*MEMORY[0x263F600D8]];
    id v8 = [v7 value];
    switch([v7 state])
    {
      case 2:
      case 4:
        [(AssistantController *)self _askSiriUseDownloadReadyFooterTextWithGroupSpecifier:v6];
        break;
      case 3:
        [(AssistantController *)self _askSiriUseDownloadingFooterTextWithGroupSpecifier:v6 withProgress:v8];
        break;
      case 5:
        [(AssistantController *)self _askSiriUseDownloadFinishedFooterTextWithGroupSpecifier:v6];
        break;
      case 6:
        [(AssistantController *)self _askSiriUseOutOfSpaceFooterTextWithGroupSpecifier:v6 withSpaceRequired:v8];
        break;
      default:
        [(AssistantController *)self _askSiriUseDefaultFooterTextWithGroupSpecifier:v6];
        break;
    }
  }
  else
  {
    id v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[AssistantController _updateSiriFooterGroup:withStatus:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)_askSiriUseRestrictedFooterWithGroupSpecifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[AssistantController bundle];
  id v6 = [v5 localizedStringForKey:@"SIRI_REQUESTS_ABOUT_LINK_TEXT" value:&stru_26D2AB140 table:@"AssistantSettings"];

  id v7 = [MEMORY[0x263F82670] currentDevice];
  LODWORD(v5) = objc_msgSend(v7, "sf_isiPad");
  id v8 = +[AssistantController bundle];
  id v9 = v8;
  if (v5) {
    uint64_t v10 = @"SIRI_RESTRICTED_FOOTER_IPAD";
  }
  else {
    uint64_t v10 = @"SIRI_RESTRICTED_FOOTER_IPHONE";
  }
  uint64_t v11 = [v8 localizedStringForKey:v10 value:&stru_26D2AB140 table:@"AssistantSettings"];

  uint64_t v12 = [v11 stringByAppendingFormat:@" %@", v6];
  [v4 setProperty:v12 forKey:*MEMORY[0x263F600F8]];
  uint64_t v13 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[AssistantController _askSiriUseRestrictedFooterWithGroupSpecifier:]";
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    _os_log_impl(&dword_220C23000, v13, OS_LOG_TYPE_INFO, "%s #settings Changing Siri text to %@", buf, 0x16u);
  }
  [(AssistantController *)self _addHyperlinkStyleToText:v6 inString:v12 action:sel_showAboutAssistantSheet_ forGroup:v4];
}

- (void)_askSiriUseDownloadReadyFooterTextWithGroupSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AssistantController *)self _localizedStringWithFormattedIDTemplate:@"SIRI_REQUESTS_ASSET_DOWNLOAD_FOOTER_TEXT{DEVICE}{CHINA}"];
  if ([(AssistantController *)self isFlexibleFollowupsSupported])
  {
    uint64_t v6 = [(AssistantController *)self _localizedStringWithFormattedIDTemplate:@"SIRI_REQUESTS_ONDEVICE_ASSET_DOWNLOAD_FOOTER_TEXT{CHINA}"];

    id v5 = (void *)v6;
  }
  id v7 = +[AssistantController bundle];
  id v8 = [v7 localizedStringForKey:@"SIRI_REQUESTS_ABOUT_LINK_TEXT" value:&stru_26D2AB140 table:@"AssistantSettings"];

  id v9 = [v5 stringByAppendingFormat:@" %@", v8];

  [v4 setProperty:v9 forKey:*MEMORY[0x263F600F8]];
  [(AssistantController *)self _addHyperlinkStyleToText:v8 inString:v9 action:sel_showAboutAssistantSheet_ forGroup:v4];
}

- (void)_askSiriUseDownloadingFooterTextWithGroupSpecifier:(id)a3 withProgress:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AssistantController *)self _localizedStringWithFormattedIDTemplate:@"SIRI_REQUESTS_ASSET_DOWNLOADING_FOOTER_TEXT{DEVICE}"];
  if ([(AssistantController *)self isFlexibleFollowupsSupported])
  {
    uint64_t v9 = [(AssistantController *)self _localizedStringWithFormattedIDTemplate:@"SIRI_REQUESTS_ONDEVICE_ASSET_DOWNLOADING_FOOTER_TEXT"];

    id v8 = (void *)v9;
  }
  uint64_t v10 = +[AssistantController bundle];
  uint64_t v11 = [v10 localizedStringForKey:@"SIRI_REQUESTS_ABOUT_LINK_TEXT" value:&stru_26D2AB140 table:@"AssistantSettings"];

  id v22 = [v8 stringByAppendingFormat:@" %@", v11];

  unint64_t v12 = [v6 unsignedIntegerValue];
  if (v12)
  {
    uint64_t v14 = (void *)MEMORY[0x263F08A30];
    *(float *)&double v13 = (float)v12 / 100.0;
    uint64_t v15 = [NSNumber numberWithFloat:v13];
    __int16 v16 = [v14 localizedStringFromNumber:v15 numberStyle:3];

    uint64_t v17 = NSString;
    uint64_t v18 = +[AssistantController bundle];
    long long v19 = [v18 localizedStringForKey:@"SIRI_REQUESTS_DOWNLOAD_PERCENT_COMPLETE_FOOTER" value:&stru_26D2AB140 table:@"AssistantSettings"];
    long long v20 = objc_msgSend(v17, "stringWithFormat:", v19, v16);

    long long v21 = [v22 stringByAppendingString:@"\n\n"];

    id v22 = [v21 stringByAppendingString:v20];
  }
  [v7 setProperty:v22 forKey:*MEMORY[0x263F600F8]];
  [(AssistantController *)self _addHyperlinkStyleToText:v11 inString:v22 action:sel_showAboutAssistantSheet_ forGroup:v7];
}

- (void)_askSiriUseDownloadFinishedFooterTextWithGroupSpecifier:(id)a3
{
  id v18 = a3;
  id v4 = [MEMORY[0x263F285A0] sharedPreferences];
  uint64_t v5 = [v4 siriDataSharingOptInStatus];

  if (v5 == 1)
  {
    id v6 = [(AssistantController *)self _localizedStringWithFormattedIDTemplate:@"SIRI_REQUESTS_DEVICE_PROCESSING_SHARING_FOOTER_TEXT"];
    id v7 = +[AssistantController bundle];
    id v8 = [v7 localizedStringForKey:@"SIRI_REQUESTS_IMPROVE_DICTATION_LINK_TEXT" value:&stru_26D2AB140 table:@"AssistantSettings"];

    uint64_t v9 = [v6 stringByAppendingFormat:@" %@", v8];

    [v18 setProperty:v9 forKey:*MEMORY[0x263F600F8]];
    [(AssistantController *)self _addHyperlinkStyleToText:v8 inString:v9 action:sel_showAboutImproveDictationSheet_ forGroup:v18];
    goto LABEL_12;
  }
  uint64_t v9 = [(AssistantController *)self assistantLanguage:v18];
  if (![v9 isEqual:@"ko-KR"])
  {
    unint64_t v12 = +[GMEligibilityProvider shared];
    if ([v12 deviceSupported])
    {
      double v13 = +[GMEligibilityProvider shared];
      int v14 = [v13 optedIn];

      if (v14)
      {
        uint64_t v15 = @"SIRI_REQUESTS_DEVICE_PROCESSING_GM_FOOTER_TEXT{DEVICE}";
LABEL_10:
        uint64_t v11 = [(AssistantController *)self _localizedStringWithFormattedIDTemplate:v15];
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v15 = @"SIRI_REQUESTS_DEVICE_PROCESSING_FOOTER_TEXT{DEVICE}";
    goto LABEL_10;
  }
  uint64_t v10 = +[AssistantController bundle];
  uint64_t v11 = [v10 localizedStringForKey:@"SIRI_REQUESTS_DEFAULT_FOOTER_TEXT" value:&stru_26D2AB140 table:@"AssistantSettings"];

LABEL_11:
  __int16 v16 = +[AssistantController bundle];
  uint64_t v17 = [v16 localizedStringForKey:@"SIRI_REQUESTS_ABOUT_LINK_TEXT" value:&stru_26D2AB140 table:@"AssistantSettings"];

  id v8 = [v11 stringByAppendingFormat:@" %@", v17];

  [v18 setProperty:v8 forKey:*MEMORY[0x263F600F8]];
  [(AssistantController *)self _addHyperlinkStyleToText:v17 inString:v8 action:sel_showAboutAssistantSheet_ forGroup:v18];

LABEL_12:
}

- (void)_askSiriUseOutOfSpaceFooterTextWithGroupSpecifier:(id)a3 withSpaceRequired:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AssistantController *)self _localizedStringWithFormattedIDTemplate:@"SIRI_REQUESTS_OUT_OF_SPACE_FOOTER_TEXT{DEVICE}"];
  if ([(AssistantController *)self isFlexibleFollowupsSupported])
  {
    uint64_t v9 = [(AssistantController *)self _localizedStringWithFormattedIDTemplate:@"SIRI_REQUESTS_ONDEVICE_ASSET_OUT_OF_SPACE_FOOTER_TEXT"];

    id v8 = (void *)v9;
  }
  uint64_t v10 = +[AssistantController bundle];
  uint64_t v11 = [v10 localizedStringForKey:@"SIRI_REQUESTS_ABOUT_LINK_TEXT" value:&stru_26D2AB140 table:@"AssistantSettings"];

  unint64_t v12 = [v8 stringByAppendingFormat:@" %@", v11];

  uint64_t v13 = [v6 longLongValue];
  if (v13 >= 1) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 996147200;
  }
  uint64_t v15 = [MEMORY[0x263F086F0] stringFromByteCount:v14 countStyle:3];
  __int16 v16 = NSString;
  uint64_t v17 = +[AssistantController bundle];
  id v18 = [v17 localizedStringForKey:@"SIRI_REQUESTS_SPACE_REQUIRED_TEXT" value:&stru_26D2AB140 table:@"AssistantSettings"];
  long long v19 = objc_msgSend(v16, "stringWithFormat:", v18, v15);

  long long v20 = +[AssistantController bundle];
  long long v21 = [v20 localizedStringForKey:@"SIRI_REQUESTS_MANAGE_STORAGE_TEXT" value:&stru_26D2AB140 table:@"AssistantSettings"];

  id v22 = [v12 stringByAppendingFormat:@"\n\n%@ %@", v19, v21];

  [v7 setProperty:v22 forKey:*MEMORY[0x263F600F8]];
  [(AssistantController *)self _addHyperlinkStyleToText:v11 inString:v22 action:sel_showAboutAssistantSheet_ forGroup:v7];
  [(AssistantController *)self _addHyperlinkStyleToText:v21 inString:v22 action:sel_openStorageManagement_ forGroup:v7];
}

- (void)confirmResetHiddenSuggestions:(id)a3
{
  v15[4] = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  v14[0] = *MEMORY[0x263F60018];
  id v4 = +[AssistantController bundle];
  uint64_t v5 = [v4 localizedStringForKey:@"SUGGESTIONS_RESET_HIDDEN_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v15[0] = v5;
  v14[1] = *MEMORY[0x263F60010];
  id v6 = +[AssistantController bundle];
  id v7 = [v6 localizedStringForKey:@"SUGGESTIONS_RESET_HIDDEN_PROMPT" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v15[1] = v7;
  v14[2] = *MEMORY[0x263F60008];
  id v8 = +[AssistantController bundle];
  uint64_t v9 = [v8 localizedStringForKey:@"SUGGESTIONS_RESET_HIDDEN_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v15[2] = v9;
  v14[3] = *MEMORY[0x263F5FFF8];
  uint64_t v10 = +[AssistantController bundle];
  uint64_t v11 = [v10 localizedStringForKey:@"SUGGESTIONS_RESET_HIDDEN_CANCEL" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v15[3] = v11;
  unint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  [v3 setupWithDictionary:v12];

  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60000]];
  [v3 setTarget:self];
  [v3 setConfirmationAction:sel_resetZKWHiddenSuggestions_];
  [(AssistantController *)self showConfirmationViewForSpecifier:v3];
}

- (void)configureSearchAndLoookupSpecifiersFor:(id)a3
{
  id v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = a3;
  id v6 = +[AssistantController bundle];
  id v7 = [v6 localizedStringForKey:@"SEARCH_AND_LOOKUP_GROUP" value:&stru_26D2AB140 table:@"AssistantSettings"];
  id v31 = [v4 groupSpecifierWithName:v7];

  id v8 = +[AssistantController bundle];
  uint64_t v9 = [v8 localizedStringForKey:@"ABOUT_PRIVACY_FOOTER_LINK" value:&stru_26D2AB140 table:@"AssistantSettings"];

  uint64_t v10 = NSString;
  uint64_t v11 = +[AssistantController bundle];
  unint64_t v12 = [v11 localizedStringForKey:@"SEARCH_AND_LOOKUP_FOOTER" value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v30 = (void *)v9;
  uint64_t v13 = [v10 stringWithFormat:@"%@ %@", v12, v9];

  uint64_t v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  [v31 setObject:v15 forKeyedSubscript:*MEMORY[0x263F600C0]];

  [v31 setObject:v13 forKeyedSubscript:*MEMORY[0x263F600E8]];
  v33.id location = [v13 rangeOfString:v9];
  __int16 v16 = NSStringFromRange(v33);
  [v31 setObject:v16 forKeyedSubscript:*MEMORY[0x263F600D0]];

  uint64_t v17 = self;
  id v18 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v31 setObject:v18 forKeyedSubscript:*MEMORY[0x263F600E0]];

  [v31 setObject:@"showAboutSearchSuggestionsSheet:" forKeyedSubscript:*MEMORY[0x263F600C8]];
  [v5 addObject:v31];
  long long v19 = (void *)MEMORY[0x263F5FC40];
  long long v20 = +[AssistantController bundle];
  long long v21 = [v20 localizedStringForKey:@"SEARCH_AND_LOOKUP_SHOW_RECENTS" value:&stru_26D2AB140 table:@"AssistantSettings"];
  id v22 = [v19 preferenceSpecifierNamed:v21 target:v17 set:sel_setShowZKWRecentsEnabled_forSpecifier_ get:sel_isShowZKWRecentsEnabled_ detail:0 cell:6 edit:0];

  uint64_t v23 = *MEMORY[0x263F600A8];
  uint64_t v24 = MEMORY[0x263EFFA88];
  [v22 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  uint64_t v25 = *MEMORY[0x263F5FEF8];
  [v22 setProperty:v24 forKey:*MEMORY[0x263F5FEF8]];
  [v5 addObject:v22];
  v26 = (void *)MEMORY[0x263F5FC40];
  v27 = +[AssistantController bundle];
  v28 = [v27 localizedStringForKey:@"SEARCH_AND_LOOKUP_SHOW_RELATED_CONTENT" value:&stru_26D2AB140 table:@"AssistantSettings"];
  id v29 = [v26 preferenceSpecifierNamed:v28 target:v17 set:sel_setShowInSpotlightEnabled_ get:sel_isShowInSpotlightEnabled detail:0 cell:6 edit:0];

  [v29 setProperty:v24 forKey:v23];
  [v29 setProperty:v24 forKey:v25];
  [v5 addObject:v29];
}

- (id)_externalAIModelSettingRestrictedStatusLabel
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  int v3 = [v2 isExternalIntelligenceAllowed];

  id v4 = +[AssistantController bundle];
  id v5 = v4;
  if (v3) {
    id v6 = @"EXTERNAL_AI_UNAVAILABLE_LABEL";
  }
  else {
    id v6 = @"EXTERNAL_AI_OFF_LABEL";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_26D2AB140 table:@"AssistantSettings-ExternalAIModel"];

  return v7;
}

- (id)_externalAIModelSettingRestrictedFooterText
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  int v3 = [v2 isExternalIntelligenceAllowed];

  if (v3)
  {
    id v4 = +[AssistantController bundle];
    id v5 = [v4 localizedStringForKey:@"EXTERNAL_AI_MODEL_FOOTER_CHILD_RESTRICTED" value:&stru_26D2AB140 table:@"AssistantSettings-ExternalAIModel"];
  }
  else
  {
    id v4 = [MEMORY[0x263F82670] currentDevice];
    int v6 = objc_msgSend(v4, "sf_isiPad");
    id v7 = +[AssistantController bundle];
    id v8 = v7;
    if (v6) {
      uint64_t v9 = @"EXTERNAL_AI_MODEL_FOOTER_MDM_RESTRICTED_IPAD";
    }
    else {
      uint64_t v9 = @"EXTERNAL_AI_MODEL_FOOTER_MDM_RESTRICTED_IPHONE";
    }
    id v5 = [v7 localizedStringForKey:v9 value:&stru_26D2AB140 table:@"AssistantSettings-ExternalAIModel"];
  }

  return v5;
}

- (id)_externalAIModelPrivacyLinkText
{
  v2 = [MEMORY[0x263F5B8B0] bundleWithIdentifier:@"com.apple.onboarding.thirdpartyai"];
  int v3 = v2;
  if (v2)
  {
    id v4 = [v2 privacyFlow];
    id v5 = v4;
    if (v4)
    {
      int v6 = [v4 localizedButtonTitle];
    }
    else
    {
      int v6 = @"Placeholder...";
    }
  }
  else
  {
    int v6 = @"Placeholder...";
  }

  return v6;
}

- (void)configureExternalAIModelSettingsSpecifiersFor:(id)a3
{
  id v20 = a3;
  if ([MEMORY[0x263F286B8] isSAEEnabled]
    && +[ExternalAIModelSettings available])
  {
    id v4 = (void *)MEMORY[0x263F5FC40];
    id v5 = +[AssistantController bundle];
    int v6 = [v5 localizedStringForKey:@"EXTERNAL_AI_MODEL_GROUP" value:&stru_26D2AB140 table:@"AssistantSettings-ExternalAIModel"];
    id v7 = [v4 groupSpecifierWithName:v6];

    if (AFMontaraRestricted())
    {
      id v8 = [(AssistantController *)self _externalAIModelSettingRestrictedFooterText];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x263F82670] currentDevice];
      int v10 = objc_msgSend(v9, "sf_isiPad");
      uint64_t v11 = +[AssistantController bundle];
      unint64_t v12 = v11;
      if (v10) {
        uint64_t v13 = @"EXTERNAL_AI_MODEL_FOOTER_IPAD";
      }
      else {
        uint64_t v13 = @"EXTERNAL_AI_MODEL_FOOTER_IPHONE";
      }
      id v8 = [v11 localizedStringForKey:v13 value:&stru_26D2AB140 table:@"AssistantSettings-ExternalAIModel"];
    }
    [v7 setProperty:v8 forKey:*MEMORY[0x263F600F8]];
    [v20 addObject:v7];
    char v14 = AFMontaraRestricted();
    uint64_t v15 = (void *)MEMORY[0x263F5FC40];
    __int16 v16 = +[AssistantController bundle];
    uint64_t v17 = [v16 localizedStringForKey:@"EXTERNAL_AI_MODEL_NAME" value:&stru_26D2AB140 table:@"AssistantSettings-ExternalAIModel"];
    if (v14)
    {
      id v18 = [v15 preferenceSpecifierNamed:v17 target:self set:0 get:sel__externalAIModelSettingRestrictedStatusLabel detail:0 cell:4 edit:0];
    }
    else
    {
      id v18 = [v15 preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:1 edit:0];

      uint64_t v19 = MEMORY[0x263EFFA88];
      [v18 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
      [v18 setProperty:v19 forKey:*MEMORY[0x263F5FEF8]];
      objc_msgSend(v18, "setDetailControllerClass:", +[ExternalAIModelSettings controllerClass](_TtC24AssistantSettingsSupport23ExternalAIModelSettings, "controllerClass"));
      [v18 setProperty:@"ExternalAIModel" forKey:*MEMORY[0x263F60138]];
      [v18 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    }
    [v20 addObject:v18];
  }
}

- (void)configureSuggestionsSpecifiersFor:(id)a3
{
  id v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = a3;
  int v6 = +[AssistantController bundle];
  id v7 = objc_msgSend(v6, "localizedStringForKey:value:table:", @"SUGGESTIONS_GROUP");
  id v38 = [v4 groupSpecifierWithName:v7];

  id v8 = +[AssistantController bundle];
  uint64_t v37 = [v8 localizedStringForKey:@"SUGGESTIONS_FOOTER" value:&stru_26D2AB140 table:@"AssistantSettings"];

  [v38 setProperty:v37 forKey:*MEMORY[0x263F600F8]];
  [v5 addObject:v38];
  uint64_t v9 = (void *)MEMORY[0x263F5FC40];
  int v10 = +[AssistantController bundle];
  uint64_t v11 = [v10 localizedStringForKey:@"SUGGESTIONS_SHOW_BEFORE_SEARCHING" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v36 = [v9 preferenceSpecifierNamed:v11 target:self set:sel_setShowZKWSuggestionsEnabled_forSpecifier_ get:sel_isShowZKWSuggestionsEnabled_ detail:0 cell:6 edit:0];

  uint64_t v12 = *MEMORY[0x263F600A8];
  uint64_t v13 = MEMORY[0x263EFFA88];
  [v36 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  uint64_t v14 = *MEMORY[0x263F5FEF8];
  [v36 setProperty:v13 forKey:*MEMORY[0x263F5FEF8]];
  [v5 addObject:v36];
  uint64_t v15 = (void *)MEMORY[0x263F5FC40];
  __int16 v16 = +[AssistantController bundle];
  uint64_t v17 = [v16 localizedStringForKey:@"SUGGESTIONS_RESET_HIDDEN_NAME" value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v35 = [v15 preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v35 setButtonAction:sel_confirmResetHiddenSuggestions_];
  [v5 addObject:v35];
  id v18 = (ASTLockScreenSuggestionsGlobalController *)objc_opt_new();
  suggestionsFromAppleAllowNotificationsController = self->_suggestionsFromAppleAllowNotificationsController;
  self->_suggestionsFromAppleAllowNotificationsController = v18;

  id v20 = [(ASTLockScreenSuggestionsGlobalController *)self->_suggestionsFromAppleAllowNotificationsController specifier];
  [v5 addObject:v20];

  long long v21 = (void *)MEMORY[0x263F5FC40];
  id v22 = +[AssistantController bundle];
  uint64_t v23 = [v22 localizedStringForKey:@"SUGGESTIONS_SHOW_IN_APPLIBRARY" value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v24 = [v21 preferenceSpecifierNamed:v23 target:self set:sel_setShowInAppLibraryEnabled_forSpecifier_ get:sel_isShowInAppLibraryEnabled_ detail:0 cell:6 edit:0];

  uint64_t v25 = MEMORY[0x263EFFA88];
  [v24 setProperty:MEMORY[0x263EFFA88] forKey:v12];
  [v24 setProperty:v25 forKey:v14];
  [v5 addObject:v24];
  v26 = (void *)MEMORY[0x263F5FC40];
  v27 = +[AssistantController bundle];
  v28 = [v27 localizedStringForKey:@"SUGGESTIONS_SHOW_WHEN_SHARING" value:&stru_26D2AB140 table:@"AssistantSettings"];
  id v29 = [v26 preferenceSpecifierNamed:v28 target:self set:sel_setShowWhenSharingEnabled_forSpecifier_ get:sel_isShowWhenSharingEnabled_ detail:0 cell:6 edit:0];

  [v29 setProperty:v25 forKey:v12];
  uint64_t v30 = v25;
  [v29 setProperty:v25 forKey:v14];
  [v5 addObject:v29];
  id v31 = (void *)MEMORY[0x263F5FC40];
  v32 = +[AssistantController bundle];
  NSRange v33 = [v32 localizedStringForKey:@"SUGGESTIONS_SHOW_WHEN_LISTENING" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v34 = [v31 preferenceSpecifierNamed:v33 target:self set:sel_setShowWhenListeningEnabled_forSpecifier_ get:sel_isShowWhenListeningEnabled_ detail:0 cell:6 edit:0];

  [v34 setProperty:v30 forKey:v12];
  [v34 setProperty:v30 forKey:v14];
  [v5 addObject:v34];
}

- (void)configureAppleIntelligencePrivacyFooterSpecifiersFor:(id)a3
{
  id v14 = a3;
  id v4 = +[GMEligibilityProvider shared];
  int v5 = [v4 deviceSupported];

  if (v5)
  {
    int v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v14 addObject:v6];
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    [v6 setProperty:v8 forKey:*MEMORY[0x263F600C0]];

    [v6 removePropertyForKey:*MEMORY[0x263F600D8]];
    uint64_t v9 = +[AssistantController bundle];
    int v10 = [v9 localizedStringForKey:@"GM_PRIVACY_FOOTER_TEXT" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];

    uint64_t v11 = +[AssistantController bundle];
    uint64_t v12 = [v11 localizedStringForKey:@"GM_PRIVACY_FOOTER_LINK_TEXT" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];

    uint64_t v13 = [v10 stringByAppendingFormat:@" %@", v12];

    [v6 setProperty:v13 forKey:*MEMORY[0x263F600F8]];
    [(AssistantController *)self _addHyperlinkStyleToText:v12 inString:v13 action:sel_showAboutAppleIntelligenceSheet_ forGroup:v6];
  }
}

- (void)saveSpotlightSettings
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263F287B8];
  int v3 = (const void *)[(NSMutableSet *)self->_disabledSpotlightDomains allObjects];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F287D0];
  CFPreferencesSetAppValue(v2, v3, (CFStringRef)*MEMORY[0x263F287D0]);
  CFPreferencesSynchronize(v4, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  int v5 = (const char *)*MEMORY[0x263F287D8];

  notify_post(v5);
}

+ (id)shortTitlesForLanguageIdentifiers:(id)a3
{
  int v3 = (void *)MEMORY[0x263EFF960];
  id v4 = a3;
  int v5 = [v3 _deviceLanguage];
  int v6 = [v3 localeWithLocaleIdentifier:v5];

  id v7 = [MEMORY[0x263F75410] shortTitlesForLanguageIdentifiers:v4 deviceLanguageLocale:v6];

  return v7;
}

- (id)assistantVoice:(id)a3
{
  id v4 = [(AssistantController *)self specifierForID:@"VOICE_ID"];

  int v5 = &stru_26D2AB140;
  if (v4)
  {
    int v6 = [MEMORY[0x263F285A0] sharedPreferences];
    id v7 = [v6 outputVoice];

    id v8 = [v7 name];
    if (![v8 length])
    {
      uint64_t v9 = [MEMORY[0x263F28530] sharedInstance];
      int v10 = [v7 languageCode];
      uint64_t v11 = objc_msgSend(v9, "voiceNamesForOutputLanguageCode:gender:", v10, objc_msgSend(v7, "gender"));
      uint64_t v12 = [v11 firstObject];

      id v8 = (void *)v12;
    }
    uint64_t v13 = [MEMORY[0x263F28530] sharedInstance];
    id v14 = [v7 languageCode];
    uint64_t v15 = [v13 outputVoiceDescriptorForOutputLanguageCode:v14 voiceName:v8];

    if (v15)
    {
      int v5 = [v15 localizedDisplayWithRegion];
    }
    else
    {
      settingsConnection = self->_settingsConnection;
      uint64_t v17 = [v7 languageCode];
      id v18 = [(SUICAssistantVoiceSettingsConnection *)settingsConnection getAvailableDialectsForLanguage:v17];
      if ((unint64_t)[v18 count] < 2)
      {
        long long v21 = 0;
      }
      else
      {
        uint64_t v19 = self->_settingsConnection;
        id v20 = [v7 languageCode];
        long long v21 = [(SUICAssistantVoiceSettingsConnection *)v19 dialectForLanguageIdentifier:v20];
      }
      if (v21) {
        id v22 = v21;
      }
      else {
        id v22 = &stru_26D2AB140;
      }
      int v5 = v22;
    }
  }

  return v5;
}

- (id)voiceActivationSelection:(id)a3
{
  id v4 = [(AssistantController *)self specifierForID:@"ACTIVATION_COMPACT_ID"];

  if (!v4
    || ([(AssistantController *)self _isVoiceTriggerEnabled]
     || +[AssistantUtilities isQuickTypeGestureEnabled]
     || +[AssistantUtilities isHardwareButtonTrigger])
    && !AFAssistantRestricted())
  {
    int v6 = &stru_26D2AB140;
  }
  else
  {
    int v5 = +[AssistantController bundle];
    int v6 = [v5 localizedStringForKey:@"ACTIVATION_OFF" value:&stru_26D2AB140 table:@"AssistantSettings"];
  }

  return v6;
}

- (BOOL)watchSupportsSiriLanguageCode:(id)a3
{
  id v3 = a3;
  id v4 = [getNRPairedDeviceRegistryClass() sharedInstance];
  int v5 = [v4 getActivePairedDevice];

  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v6 = (void *)getNRDevicePropertySystemNameSymbolLoc_ptr;
  uint64_t v15 = getNRDevicePropertySystemNameSymbolLoc_ptr;
  if (!getNRDevicePropertySystemNameSymbolLoc_ptr)
  {
    id v7 = (void *)NanoRegistryLibrary();
    v13[3] = (uint64_t)dlsym(v7, "NRDevicePropertySystemName");
    getNRDevicePropertySystemNameSymbolLoc_ptr = v13[3];
    int v6 = (void *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v6) {
    -[AssistantController watchSupportsSiriLanguageCode:]();
  }
  id v8 = [v5 valueForProperty:*v6];
  uint64_t v9 = getNRDevicePropertySystemVersion();
  int v10 = [v5 valueForProperty:v9];

  LOBYTE(v9) = [MEMORY[0x263F284A0] siriIsSupportedForLanguageCode:v3 productName:v8 productVersion:v10 error:0];
  return (char)v9;
}

- (void)setAssistantEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v43 = *MEMORY[0x263EF8340];
  int v5 = [MEMORY[0x263F285A0] sharedPreferences];
  int v6 = [v5 assistantIsEnabled];

  if (v6 != v3)
  {
    id v7 = [MEMORY[0x263F285A0] sharedPreferences];
    [v7 setAssistantIsEnabled:v3];

    id v8 = [MEMORY[0x263F285A0] sharedPreferences];
    [v8 synchronize];
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  uint64_t v9 = (void *)getBYFlowSkipControllerClass_softClass;
  uint64_t v41 = getBYFlowSkipControllerClass_softClass;
  if (!getBYFlowSkipControllerClass_softClass)
  {
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    uint64_t v35 = __getBYFlowSkipControllerClass_block_invoke;
    v36 = &unk_26457D098;
    uint64_t v37 = &v38;
    __getBYFlowSkipControllerClass_block_invoke((uint64_t)&v33);
    uint64_t v9 = (void *)v39[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v38, 8);
  uint64_t v11 = [v10 sharedInstance];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v12 = (void *)getBYFlowSkipIdentifierSiriSymbolLoc_ptr;
  uint64_t v41 = getBYFlowSkipIdentifierSiriSymbolLoc_ptr;
  if (!getBYFlowSkipIdentifierSiriSymbolLoc_ptr)
  {
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    uint64_t v35 = __getBYFlowSkipIdentifierSiriSymbolLoc_block_invoke;
    v36 = &unk_26457D098;
    uint64_t v37 = &v38;
    uint64_t v13 = (void *)SetupAssistantLibrary();
    uint64_t v14 = dlsym(v13, "BYFlowSkipIdentifierSiri");
    *(void *)(v37[1] + 24) = v14;
    getBYFlowSkipIdentifierSiriSymbolLoc_ptr = *(void *)(v37[1] + 24);
    uint64_t v12 = (void *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (!v12) {
    -[AssistantController setAssistantEnabled:]();
  }
  [v11 didCompleteFlow:*v12];

  if (!v3)
  {
    long long v21 = [MEMORY[0x263EFF980] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v23 = self->_assistantSettings;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v29 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          if (-[AssistantController containsSpecifier:](self, "containsSpecifier:", v27, (void)v29)) {
            [v21 addObject:v27];
          }
        }
        uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v29 objects:v42 count:16];
      }
      while (v24);
    }

    [(AssistantController *)self removeContiguousSpecifiers:v21 animated:1];
    [(AssistantController *)self removeSpecifier:self->_languageSpecifier];
    goto LABEL_21;
  }
  uint64_t v15 = [(AssistantController *)self specifierForID:@"LANGUAGE_ID"];
  BOOL v16 = v15 == 0;

  if (v16)
  {
    assistantSettings = self->_assistantSettings;
    id v18 = [(AssistantController *)self specifiers];
    uint64_t v19 = [v18 specifierForID:@"ACTIVATION"];
    [(AssistantController *)self insertContiguousSpecifiers:assistantSettings afterSpecifier:v19 animated:1];

    languageSpecifier = self->_languageSpecifier;
    long long v21 = [(AssistantController *)self specifiers];
    id v22 = [v21 specifierForID:@"SIRI_REQUESTS_GROUP"];
    [(AssistantController *)self insertSpecifier:languageSpecifier afterSpecifier:v22];

LABEL_21:
  }
  v28 = -[AssistantController assistantVoiceLanguage:](self, "assistantVoiceLanguage:", 0, (void)v29);
  [(AssistantController *)self _updateSpecifiersForLanguage:v28];
}

+ (void)presentAssistantEnableAlertForState:(BOOL)a3 presentingViewController:(id)a4 actionHandler:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = a4;
  uint64_t v11 = objc_alloc_init(AssistantController);
  objc_setAssociatedObject(v8, &AssistantControllerIdentifier, v11, (void *)0x301);
  uint64_t v9 = [NSNumber numberWithBool:v6];
  id v10 = [(AssistantController *)v11 specifierForID:@"ACTIVATION_LONG_PRESS_ID"];
  [(AssistantController *)v11 _setAssistantEnabled:v9 forSpecifier:v10 presentingViewController:v8 actionHandler:v7];
}

- (void)_setAssistantEnabled:(id)a3 forSpecifier:(id)a4 presentingViewController:(id)a5 actionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [getNRPairedDeviceRegistryClass() sharedInstance];
  int v15 = [v14 isPaired];

  if ([v10 BOOLValue])
  {
    BOOL v16 = [MEMORY[0x263F285A0] sharedPreferences];
    uint64_t v17 = [v16 languageCode];

    if ([v17 length])
    {
      if (!v15) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v19 = [MEMORY[0x263F285A0] sharedPreferences];
      uint64_t v20 = [v19 bestSupportedLanguageCodeForLanguageCode:0];

      uint64_t v17 = (void *)v20;
      if (!v15) {
        goto LABEL_8;
      }
    }
    if (![(AssistantController *)self watchSupportsSiriLanguageCode:v17])
    {
      long long v21 = (void *)MEMORY[0x263F82400];
      id v22 = +[AssistantController bundle];
      uint64_t v23 = [v22 localizedStringForKey:@"ASSISTANT_ENABLE_CONTINUE" value:&stru_26D2AB140 table:@"AssistantSettings"];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke;
      v46[3] = &unk_26457D560;
      v46[4] = self;
      id v24 = v11;
      id v47 = v24;
      id v36 = v12;
      id v48 = v36;
      id v49 = v13;
      uint64_t v35 = [v21 actionWithTitle:v23 style:0 handler:v46];

      uint64_t v25 = (void *)MEMORY[0x263F82400];
      v26 = +[AssistantController bundle];
      uint64_t v27 = [v26 localizedStringForKey:@"ASSISTANT_ENABLE_CANCEL" value:&stru_26D2AB140 table:@"AssistantSettings"];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke_2;
      v44[3] = &unk_26457D588;
      v44[4] = self;
      id v45 = v24;
      uint64_t v34 = [v25 actionWithTitle:v27 style:1 handler:v44];

      uint64_t v33 = (void *)MEMORY[0x263F82418];
      v28 = +[AssistantController bundle];
      long long v29 = [v28 localizedStringForKey:@"ASSISTANT_ENABLE_TITLE_WATCH_UNAVAILABLE" value:&stru_26D2AB140 table:@"AssistantSettings"];
      long long v30 = +[AssistantController bundle];
      long long v31 = [v30 localizedStringForKey:@"ASSISTANT_ENABLE_WATCH_UNAVAILABLE" value:&stru_26D2AB140 table:@"AssistantSettings"];
      long long v32 = [v33 alertControllerWithTitle:v29 message:v31 preferredStyle:0];

      [v32 addAction:v35];
      [v32 addAction:v34];
      if (v36) {
        [v36 presentViewController:v32 animated:1 completion:0];
      }

      goto LABEL_12;
    }
LABEL_8:
    [(AssistantController *)self showAssistantConfirmationViewForSpecifier:v11 presentingViewController:v12 actionHandler:v13];
LABEL_12:

    goto LABEL_13;
  }
  objc_initWeak(&location, self);
  AFSettingsConnection = self->_AFSettingsConnection;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke_3;
  v37[3] = &unk_26457D5D8;
  objc_copyWeak(&v41, &location);
  id v38 = v11;
  char v42 = v15;
  id v39 = v12;
  id v40 = v13;
  [AFSettingsConnection fetchMultiUserVoiceIdentificationSetting:v37];

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
LABEL_13:
}

uint64_t __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showAssistantConfirmationViewForSpecifier:*(void *)(a1 + 40) presentingViewController:*(void *)(a1 + 48) actionHandler:*(void *)(a1 + 56)];
}

uint64_t __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) assistantEnabledCancelled:*(void *)(a1 + 40)];
}

void __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke_3(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke_4;
  block[3] = &unk_26457D5B0;
  char v8 = a2;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 64);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v7);
}

void __96__AssistantController__setAssistantEnabled_forSpecifier_presentingViewController_actionHandler___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64) && !+[AssistantUtilities deviceIsVision])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained confirmDisableForMultiUserVoiceIdentificationWithSpecifier:*(void *)(a1 + 32) pairedWatch:*(unsigned __int8 *)(a1 + 65) presentingViewController:*(void *)(a1 + 40) actionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained confirmDisableWithSpecifier:*(void *)(a1 + 32) pairedWatch:*(unsigned __int8 *)(a1 + 65) presentingViewController:*(void *)(a1 + 40) actionHandler:*(void *)(a1 + 48)];
  }
}

- (void)confirmDisableForMultiUserVoiceIdentificationWithSpecifier:(id)a3 pairedWatch:(BOOL)a4 presentingViewController:(id)a5 actionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(location, self);
  id v13 = (void *)MEMORY[0x263F82400];
  uint64_t v14 = +[AssistantController bundle];
  int v15 = [v14 localizedStringForKey:@"ASSISTANT_DISABLE_MULTI_USER_ENABLED_OK" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __133__AssistantController_confirmDisableForMultiUserVoiceIdentificationWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke;
  v35[3] = &unk_26457D600;
  objc_copyWeak(&v39, location);
  id v16 = v10;
  id v36 = v16;
  BOOL v40 = a4;
  id v17 = v11;
  id v37 = v17;
  id v18 = v12;
  id v38 = v18;
  uint64_t v19 = [v13 actionWithTitle:v15 style:0 handler:v35];

  uint64_t v20 = (void *)MEMORY[0x263F82400];
  long long v21 = +[AssistantController bundle];
  id v22 = [v21 localizedStringForKey:@"ASSISTANT_DISABLE_MULTI_USER_ENABLED_CANCEL" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __133__AssistantController_confirmDisableForMultiUserVoiceIdentificationWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke_2;
  v31[3] = &unk_26457D628;
  objc_copyWeak(&v34, location);
  id v30 = v16;
  id v32 = v30;
  id v23 = v18;
  id v33 = v23;
  id v24 = [v20 actionWithTitle:v22 style:1 handler:v31];

  uint64_t v25 = [MEMORY[0x263F82670] currentDevice];
  LODWORD(v21) = objc_msgSend(v25, "sf_isiPad");

  v26 = (void *)MEMORY[0x263F82418];
  uint64_t v27 = +[AssistantController bundle];
  v28 = [v27 localizedStringForKey:@"ASSISTANT_DISABLE_WARNING_MULTI_USER_ENABLED" value:&stru_26D2AB140 table:@"AssistantSettings"];
  long long v29 = [v26 alertControllerWithTitle:0 message:v28 preferredStyle:v21];

  [v29 addAction:v19];
  [v29 addAction:v24];
  [v17 presentViewController:v29 animated:1 completion:0];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v39);
  objc_destroyWeak(location);
}

void __133__AssistantController_confirmDisableForMultiUserVoiceIdentificationWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained confirmDisableWithSpecifier:*(void *)(a1 + 32) pairedWatch:*(unsigned __int8 *)(a1 + 64) presentingViewController:*(void *)(a1 + 40) actionHandler:*(void *)(a1 + 48)];
}

uint64_t __133__AssistantController_confirmDisableForMultiUserVoiceIdentificationWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained assistantDisabledCancelled:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)confirmDisableWithSpecifier:(id)a3 pairedWatch:(BOOL)a4 presentingViewController:(id)a5 actionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v47 = a5;
  id v11 = a6;
  objc_initWeak(location, self);
  id v12 = (void *)MEMORY[0x263F82400];
  id v13 = +[AssistantController bundle];
  uint64_t v14 = [v13 localizedStringForKey:@"ASSISTANT_DISABLE_OK" value:&stru_26D2AB140 table:@"AssistantSettings"];
  BOOL v46 = v8;
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __102__AssistantController_confirmDisableWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke;
  v53[3] = &unk_26457D628;
  objc_copyWeak(&v56, location);
  id v15 = v10;
  id v54 = v15;
  id v16 = v11;
  id v55 = v16;
  id v48 = [v12 actionWithTitle:v14 style:0 handler:v53];

  id v17 = (void *)MEMORY[0x263F82400];
  id v18 = +[AssistantController bundle];
  uint64_t v19 = [v18 localizedStringForKey:@"ASSISTANT_DISABLE_CANCEL" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __102__AssistantController_confirmDisableWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke_2;
  v49[3] = &unk_26457D628;
  objc_copyWeak(&v52, location);
  id v20 = v15;
  id v50 = v20;
  id v21 = v16;
  id v51 = v21;
  id v22 = [v17 actionWithTitle:v19 style:1 handler:v49];

  id v23 = [MEMORY[0x263F285A0] sharedPreferences];
  int v24 = [v23 dictationIsEnabled];
  uint64_t v25 = @"ASSISTANT_DISABLE_WARNING_DICTATION_DISABLED";
  if (v24) {
    uint64_t v25 = @"ASSISTANT_DISABLE_WARNING_DICTATION_ENABLED";
  }
  v26 = v25;

  uint64_t v27 = +[GMEligibilityProvider shared];
  int v28 = [v27 activeEnabled];

  if (v28)
  {
    long long v29 = [(__CFString *)v26 stringByAppendingString:@"_GM"];

    id v30 = +[AssistantController bundle];
    uint64_t v31 = [v30 localizedStringForKey:v29 value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
  }
  else
  {
    id v32 = [getNRPairedDeviceRegistryClass() sharedInstance];
    id v33 = [v32 getPairedDevices];
    id v34 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_6];
    uint64_t v35 = [v33 filteredArrayUsingPredicate:v34];
    uint64_t v36 = [v35 count];

    if (v46 && v36)
    {
      id v37 = (void *)MEMORY[0x263F82670];
      id v38 = [(__CFString *)v26 stringByAppendingString:@"_WATCH"];
      long long v29 = [v37 modelSpecificLocalizedStringKeyForKey:v38];
    }
    else
    {
      long long v29 = v26;
    }
    id v30 = +[AssistantController bundle];
    uint64_t v31 = [v30 localizedStringForKey:v29 value:&stru_26D2AB140 table:@"AssistantSettings"];
  }
  id v39 = (void *)v31;

  BOOL v40 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v40, "sf_isiPad"))
  {
    id v41 = +[AssistantController bundle];
    [v41 localizedStringForKey:@"ASSISTANT_DISABLE_TITLE_IPAD" value:&stru_26D2AB140 table:@"AssistantSettings"];
  }
  else
  {
    id v41 = +[AssistantController bundle];
    [v41 localizedStringForKey:@"ASSISTANT_DISABLE_TITLE_IPHONE" value:&stru_26D2AB140 table:@"AssistantSettings"];
  char v42 = };

  uint64_t v43 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v44 = objc_msgSend(v43, "sf_isiPad");

  id v45 = [MEMORY[0x263F82418] alertControllerWithTitle:v42 message:v39 preferredStyle:v44];
  [v45 addAction:v48];
  [v45 addAction:v22];
  [v47 presentViewController:v45 animated:1 completion:0];

  objc_destroyWeak(&v52);
  objc_destroyWeak(&v56);
  objc_destroyWeak(location);
}

uint64_t __102__AssistantController_confirmDisableWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained assistantDisabledConfirmed:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __102__AssistantController_confirmDisableWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained assistantDisabledCancelled:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

BOOL __102__AssistantController_confirmDisableWithSpecifier_pairedWatch_presentingViewController_actionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = getNRDevicePropertySystemVersion();
  id v4 = [v2 valueForProperty:v3];

  BOOL v5 = [v4 integerValue] < 6;
  return v5;
}

- (void)showAssistantConfirmationViewForSpecifier:(id)a3 presentingViewController:(id)a4 actionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [getNRPairedDeviceRegistryClass() sharedInstance];
  int v12 = [v11 isPaired];

  objc_initWeak(location, self);
  id v13 = (void *)MEMORY[0x263F82400];
  uint64_t v14 = +[AssistantController bundle];
  id v15 = [v14 localizedStringForKey:@"ASSISTANT_ENABLE_OK" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __104__AssistantController_showAssistantConfirmationViewForSpecifier_presentingViewController_actionHandler___block_invoke;
  v46[3] = &unk_26457D670;
  objc_copyWeak(&v50, location);
  id v16 = v8;
  id v47 = v16;
  id v41 = v9;
  id v48 = v41;
  id v17 = v10;
  id v49 = v17;
  char v42 = [v13 actionWithTitle:v15 style:0 handler:v46];

  id v18 = (void *)MEMORY[0x263F82400];
  uint64_t v19 = +[AssistantController bundle];
  id v20 = [v19 localizedStringForKey:@"ASSISTANT_ENABLE_CANCEL" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __104__AssistantController_showAssistantConfirmationViewForSpecifier_presentingViewController_actionHandler___block_invoke_2;
  v43[3] = &unk_26457D698;
  v43[4] = self;
  id v39 = v16;
  id v44 = v39;
  id v38 = v17;
  id v45 = v38;
  BOOL v40 = [v18 actionWithTitle:v20 style:1 handler:v43];

  id v21 = [getNRPairedDeviceRegistryClass() sharedInstance];
  id v22 = [v21 getPairedDevices];
  id v23 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_614];
  int v24 = [v22 filteredArrayUsingPredicate:v23];
  uint64_t v25 = [v24 count];

  if (v25) {
    int v26 = v12;
  }
  else {
    int v26 = 0;
  }
  if (v26 == 1)
  {
    uint64_t v27 = (void *)MEMORY[0x263F82670];
    int v28 = [@"ASSISTANT_ENABLE_WARNING" stringByAppendingString:@"_WATCH"];
    long long v29 = [v27 modelSpecificLocalizedStringKeyForKey:v28];
  }
  else
  {
    long long v29 = @"ASSISTANT_ENABLE_WARNING";
  }
  id v30 = (void *)MEMORY[0x263F82418];
  uint64_t v31 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v31, "sf_isiPad"))
  {
    id v32 = +[AssistantController bundle];
    [v32 localizedStringForKey:@"ASSISTANT_ENABLE_TITLE_IPAD" value:&stru_26D2AB140 table:@"AssistantSettings"];
  }
  else
  {
    id v32 = +[AssistantController bundle];
    [v32 localizedStringForKey:@"ASSISTANT_ENABLE_TITLE_IPHONE" value:&stru_26D2AB140 table:@"AssistantSettings"];
  id v33 = };
  id v34 = +[AssistantController bundle];
  uint64_t v35 = [v34 localizedStringForKey:v29 value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v36 = [MEMORY[0x263F82670] currentDevice];
  id v37 = objc_msgSend(v30, "alertControllerWithTitle:message:preferredStyle:", v33, v35, objc_msgSend(v36, "sf_isiPad"));

  [v37 addAction:v42];
  [v37 addAction:v40];
  [v41 presentViewController:v37 animated:1 completion:0];

  objc_destroyWeak(&v50);
  objc_destroyWeak(location);
}

void __104__AssistantController_showAssistantConfirmationViewForSpecifier_presentingViewController_actionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleThemisEnablementConfirmationForSpecifier:*(void *)(a1 + 32) presentingViewController:*(void *)(a1 + 40) actionHandler:*(void *)(a1 + 48)];
}

uint64_t __104__AssistantController_showAssistantConfirmationViewForSpecifier_presentingViewController_actionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) assistantEnabledCancelled:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

BOOL __104__AssistantController_showAssistantConfirmationViewForSpecifier_presentingViewController_actionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = getNRDevicePropertySystemVersion();
  id v4 = [v2 valueForProperty:v3];

  BOOL v5 = [v4 integerValue] < 6;
  return v5;
}

- (void)_handleEnablementConfirmationForSpecifier:(id)a3 actionHandler:(id)a4
{
  id v9 = a4;
  currentSiriActivationSpecifier = (PSSpecifier *)a3;
  [(AssistantController *)self assistantEnabledConfirmed:currentSiriActivationSpecifier];
  if ([(AssistantController *)self _isCurrentSpecifierVoiceActivation])
  {
    [(AssistantController *)self setVoiceTrigger:MEMORY[0x263EFFA88] forSpecifier:currentSiriActivationSpecifier];
    id v7 = @"HeySiri";
  }
  else
  {
    [(AssistantController *)self setHardwareButtonTrigger:MEMORY[0x263EFFA88] forSpecifier:currentSiriActivationSpecifier];

    currentSiriActivationSpecifier = self->_currentSiriActivationSpecifier;
    self->_currentSiriActivationSpecifier = 0;
    id v7 = @"HardwareButton";
  }

  +[AssistantMetrics didEnableSiriConfirmed:1 source:v7];
  if ([(VTUISiriDataSharingOptInPresenter *)self->_siriDataSharingPresenter shouldShowSiriDataSharingOptInView])[(AssistantController *)self _presentSiriDataSharingOptInViewController]; {
  id v8 = v9;
  }
  if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    id v8 = v9;
  }
}

- (BOOL)_isCurrentSpecifierVoiceActivation
{
  voiceActivationSpecifier = self->_voiceActivationSpecifier;
  if (voiceActivationSpecifier && self->_currentSiriActivationSpecifier == voiceActivationSpecifier) {
    return 1;
  }
  voiceActivationSettingsSpecifier = self->_voiceActivationSettingsSpecifier;
  currentSiriActivationSpecifier = self->_currentSiriActivationSpecifier;
  if (voiceActivationSettingsSpecifier && currentSiriActivationSpecifier == voiceActivationSettingsSpecifier) {
    return 1;
  }
  id v6 = [(PSSpecifier *)currentSiriActivationSpecifier name];
  char v7 = [v6 isEqualToString:@"ACTIVATION_CONFIRMATION"];

  return v7;
}

- (BOOL)_isCurrentSpecifierQuickTypeGesture
{
  id v2 = [(PSSpecifier *)self->_currentSiriActivationSpecifier name];
  char v3 = [v2 isEqualToString:@"ACTIVATION_DOUBLE_TAP_ID"];

  return v3;
}

- (void)_handleThemisEnablementConfirmationForSpecifier:(id)a3 presentingViewController:(id)a4 actionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_enablementConfigurationProvider)
  {
    id v11 = (AFEnablementFlowConfigurationProvider *)objc_alloc_init(MEMORY[0x263F28500]);
    enablementConfigurationProvider = self->_enablementConfigurationProvider;
    self->_enablementConfigurationProvider = v11;
  }
  id v13 = [MEMORY[0x263F285A0] sharedPreferences];
  uint64_t v14 = [v13 bestSupportedLanguageCodeForLanguageCode:0];

  id v15 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v29 = "-[AssistantController _handleThemisEnablementConfirmationForSpecifier:presentingViewController:actionHandler:]";
    _os_log_impl(&dword_220C23000, v15, OS_LOG_TYPE_DEFAULT, "%s Fetching Enablement Configuration", buf, 0xCu);
  }
  id v16 = self->_enablementConfigurationProvider;
  uint64_t v27 = v14;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __110__AssistantController__handleThemisEnablementConfirmationForSpecifier_presentingViewController_actionHandler___block_invoke;
  v22[3] = &unk_26457D6E8;
  v22[4] = self;
  id v23 = v14;
  id v25 = v9;
  id v26 = v10;
  id v24 = v8;
  id v18 = v9;
  id v19 = v10;
  id v20 = v8;
  id v21 = v14;
  [(AFEnablementFlowConfigurationProvider *)v16 configurationForEnablementFlow:6 recognitionLanguageCodes:v17 completion:v22];
}

void __110__AssistantController__handleThemisEnablementConfirmationForSpecifier_presentingViewController_actionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __110__AssistantController__handleThemisEnablementConfirmationForSpecifier_presentingViewController_actionHandler___block_invoke_2;
  v7[3] = &unk_26457D6C0;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __110__AssistantController__handleThemisEnablementConfirmationForSpecifier_presentingViewController_actionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = (os_log_t *)MEMORY[0x263F28348];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v21 = 136315394;
    id v22 = "-[AssistantController _handleThemisEnablementConfirmationForSpecifier:presentingViewController:actionHandler:]_block_invoke_2";
    __int16 v23 = 2112;
    uint64_t v24 = v4;
    _os_log_impl(&dword_220C23000, v3, OS_LOG_TYPE_DEFAULT, "%s Enablement Configuration %@", (uint8_t *)&v21, 0x16u);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 1608), *(id *)(a1 + 32));
  int v5 = [*(id *)(a1 + 32) requiresVoiceSelectionForRecognitionLanguage:*(void *)(a1 + 48)];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 72);
  if (!v5) {
    return [v6 _handleEnablementConfirmationForSpecifier:v7 actionHandler:v8];
  }
  uint64_t v9 = [v6 _createVoiceSelectionDismissalHandlerWithSpecifier:v7 actionHandler:v8];
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = *(void **)(v10 + 1632);
  *(void *)(v10 + 1632) = v9;

  uint64_t v12 = [*(id *)(a1 + 40) _createVoiceSelectionCompletionForSpecifier:*(void *)(a1 + 56) recognitionLanguageCode:*(void *)(a1 + 48)];
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void **)(v13 + 1624);
  *(void *)(v13 + 1624) = v12;

  uint64_t v15 = [*(id *)(a1 + 40) _createEnablementFlowControllerForConfiguration:*(void *)(a1 + 32) recognitionLanguageCode:*(void *)(a1 + 48)];
  uint64_t v16 = *(void *)(a1 + 40);
  id v17 = *(void **)(v16 + 1616);
  *(void *)(v16 + 1616) = v15;

  id v18 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 48);
    int v21 = 136315394;
    id v22 = "-[AssistantController _handleThemisEnablementConfirmationForSpecifier:presentingViewController:actionHandler:]_block_invoke";
    __int16 v23 = 2112;
    uint64_t v24 = v19;
    _os_log_impl(&dword_220C23000, v18, OS_LOG_TYPE_DEFAULT, "%s Presenting Voice selection for %@", (uint8_t *)&v21, 0x16u);
  }
  return [*(id *)(a1 + 64) presentViewController:*(void *)(*(void *)(a1 + 40) + 1616) animated:1 completion:0];
}

- (id)_createEnablementFlowControllerForConfiguration:(id)a3 recognitionLanguageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AssistantController *)self _isCurrentSpecifierVoiceActivation])
  {
    uint64_t v8 = [MEMORY[0x263F78BB8] sharedInstance];
    int v9 = [v8 isSATEnrolledForSiriProfileId:0 forLanguageCode:v7];

    int v10 = v9 ^ 1;
  }
  else
  {
    int v10 = [(VTUISiriDataSharingOptInPresenter *)self->_siriDataSharingPresenter shouldShowSiriDataSharingOptInView];
  }
  id v11 = +[AssistantController bundle];
  uint64_t v12 = [v11 localizedStringForKey:@"ASSISTANT_ENABLE_DONE" value:&stru_26D2AB140 table:@"AssistantSettings"];

  if (v10)
  {
    uint64_t v13 = +[AssistantController bundle];
    uint64_t v14 = [v13 localizedStringForKey:@"ASSISTANT_ENABLE_NEXT" value:&stru_26D2AB140 table:@"AssistantSettings"];

    uint64_t v12 = (void *)v14;
  }
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v12 style:2 target:0 action:0];
  id v16 = objc_alloc(MEMORY[0x263F824A8]);
  id v17 = +[AssistantController bundle];
  id v18 = [v17 localizedStringForKey:@"ASSISTANT_ENABLE_CANCEL" value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v19 = (void *)[v16 initWithTitle:v18 style:2 target:self action:sel__voiceSelectionCancelled];

  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2050000000;
  id v20 = (void *)getVTUIVoiceSelectionViewControllerClass_softClass;
  uint64_t v37 = getVTUIVoiceSelectionViewControllerClass_softClass;
  if (!getVTUIVoiceSelectionViewControllerClass_softClass)
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __getVTUIVoiceSelectionViewControllerClass_block_invoke;
    v33[3] = &unk_26457D098;
    v33[4] = &v34;
    __getVTUIVoiceSelectionViewControllerClass_block_invoke((uint64_t)v33);
    id v20 = (void *)v35[3];
  }
  int v21 = v20;
  _Block_object_dispose(&v34, 8);
  id v22 = objc_msgSend([v21 alloc], "initWithRecognitionLanguage:allowsRandomSelection:barButtonItemForContinue:customVoicePreviewer:delegate:", v7, objc_msgSend(v6, "voiceSelectionAllowsRandomSelection"), v15, 0, self);
  __int16 v23 = [(PSRootController *)[PSVoiceTriggerRootController alloc] initWithRootViewController:v22];
  enablementFlowNavigationController = self->_enablementFlowNavigationController;
  self->_enablementFlowNavigationController = &v23->super;

  [(PSRootController *)self->_enablementFlowNavigationController setModalPresentationStyle:2];
  uint64_t v25 = [(PSRootController *)self->_enablementFlowNavigationController presentationController];
  [v25 setDelegate:self];

  id v26 = [v22 navigationItem];
  [v26 setRightBarButtonItem:v15];

  uint64_t v27 = [v22 navigationItem];
  [v27 setLeftBarButtonItem:v19];

  int v28 = [(PSRootController *)self->_enablementFlowNavigationController navigationBar];
  long long v29 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v28 setBackgroundColor:v29];

  [v28 _setHidesShadow:1];
  uint64_t v30 = objc_opt_new();
  [v28 setBackgroundImage:v30 forBarMetrics:0];

  uint64_t v31 = self->_enablementFlowNavigationController;
  return v31;
}

- (id)_createVoiceSelectionCompletionForSpecifier:(id)a3 recognitionLanguageCode:(id)a4
{
  id v6 = (PSSpecifier *)a3;
  id v7 = a4;
  BOOL v8 = self->_voiceActivationSpecifier == v6 || self->_voiceActivationSettingsSpecifier == v6;
  int v9 = [(PSSpecifier *)v6 identifier];
  char v10 = [v9 isEqualToString:@"ACTIVATION_LONG_PRESS_ID"];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke;
  aBlock[3] = &unk_26457D710;
  objc_copyWeak(&v18, &location);
  id v16 = v7;
  id v17 = v6;
  BOOL v19 = v8;
  char v20 = v10;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = _Block_copy(aBlock);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v13;
}

void __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_22;
  }
  id v6 = (os_log_t *)MEMORY[0x263F28348];
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v39 = "-[AssistantController _createVoiceSelectionCompletionForSpecifier:recognitionLanguageCode:]_block_invoke";
    __int16 v40 = 2112;
    uint64_t v41 = v8;
    __int16 v42 = 2112;
    id v43 = v3;
    _os_log_impl(&dword_220C23000, v7, OS_LOG_TYPE_DEFAULT, "%s Setting Language code %@, output voice: %@", buf, 0x20u);
  }
  int v9 = [MEMORY[0x263F285A0] sharedPreferences];
  [v9 setLanguageCode:*(void *)(a1 + 32) outputVoice:v3];

  [WeakRetained assistantEnabledConfirmed:*(void *)(a1 + 40)];
  char v10 = [MEMORY[0x263F78BB8] sharedInstance];
  int v11 = [v10 isSpeakerRecognitionAvailable];

  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    if (v11) {
      [WeakRetained setVoiceTrigger:MEMORY[0x263EFFA88] forSpecifier:v12 transitionWithNavControllerIfNecessary:WeakRetained[202]];
    }
    else {
      [WeakRetained setVoiceTrigger:MEMORY[0x263EFFA88] forSpecifier:v12];
    }
    +[AssistantMetrics didEnableSiriConfirmed:1 source:@"HeySiri"];
  }
  else if (*(unsigned char *)(a1 + 57))
  {
    [WeakRetained setHardwareButtonTrigger:MEMORY[0x263EFFA88] forSpecifier:*(void *)(a1 + 40)];
    id v13 = WeakRetained[181];
    WeakRetained[181] = 0;

    +[AssistantMetrics didEnableSiriConfirmed:1 source:@"HardwareButton"];
  }
  else
  {
    char v20 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
      __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  if (*(unsigned char *)(a1 + 56))
  {
    if (v11) {
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  if (*(unsigned char *)(a1 + 57)) {
    char v14 = 0;
  }
  else {
    char v14 = v11;
  }
  if ((v14 & 1) == 0)
  {
LABEL_18:
    if ([WeakRetained[192] shouldShowSiriDataSharingOptInView])
    {
      uint64_t v15 = [WeakRetained[192] dataSharingOptInTextWelcomeControllerForViewStyle:0];
      id v16 = WeakRetained[193];
      WeakRetained[193] = (id)v15;

      id v17 = [WeakRetained[193] navigationItem];
      [v17 setHidesBackButton:1];

      id v18 = WeakRetained[193];
      if (v18)
      {
        [WeakRetained[202] pushViewController:v18 animated:1];
      }
      else
      {
        int v28 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
          __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke_cold_1(v28, v29, v30, v31, v32, v33, v34, v35);
        }
      }
    }
    else
    {
      id v19 = WeakRetained[202];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke_643;
      v36[3] = &unk_26457CF60;
      objc_copyWeak(&v37, v4);
      [v19 dismissViewControllerAnimated:1 completion:v36];
      objc_destroyWeak(&v37);
    }
  }
LABEL_22:
}

void __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke_643(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _runEnablementFlowDismissalHandlersIfApplicable];
}

- (id)_createVoiceSelectionDismissalHandlerWithSpecifier:(id)a3 actionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__AssistantController__createVoiceSelectionDismissalHandlerWithSpecifier_actionHandler___block_invoke;
  v12[3] = &unk_26457D738;
  objc_copyWeak(&v15, &location);
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  char v10 = _Block_copy(v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

void __88__AssistantController__createVoiceSelectionDismissalHandlerWithSpecifier_actionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[203];
    WeakRetained[203] = 0;
    id v13 = WeakRetained;

    uint64_t v4 = [MEMORY[0x263F285A0] sharedPreferences];
    char v5 = [v4 assistantIsEnabled];

    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (!v6)
      {
LABEL_10:
        uint64_t v12 = (void *)v13[201];
        v13[201] = 0;

        id WeakRetained = v13;
        goto LABEL_11;
      }
      id v7 = *(void (**)(void))(v6 + 16);
    }
    else
    {
      id v8 = v13;
      id v9 = (void *)v13[201];
      if (v9)
      {
        char v10 = [v9 completionLoggingBlock];
        v10[2](v10, 0);

        id v8 = v13;
      }
      [v8 assistantEnabledCancelled:*(void *)(a1 + 32)];
      uint64_t v11 = *(void *)(a1 + 40);
      if (!v11) {
        goto LABEL_10;
      }
      id v7 = *(void (**)(void))(v11 + 16);
    }
    v7();
    goto LABEL_10;
  }
LABEL_11:
}

- (id)isShowInSpotlightEnabled
{
  if ([(NSMutableSet *)self->_disabledSpotlightDomains containsObject:@"DOMAIN_ZKWS"]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [(NSMutableSet *)self->_disabledSpotlightDomains containsObject:@"DOMAIN_PARSEC"] ^ 1;
  }
  uint64_t v4 = NSNumber;

  return (id)[v4 numberWithBool:v3];
}

- (void)setShowInSpotlightEnabled:(id)a3
{
  id v4 = a3;
  int v5 = [v4 intValue];
  disabledSpotlightDomains = self->_disabledSpotlightDomains;
  if (v5)
  {
    [(NSMutableSet *)disabledSpotlightDomains removeObject:@"DOMAIN_ZKWS"];
    [(NSMutableSet *)self->_disabledSpotlightDomains removeObject:@"DOMAIN_PARSEC"];
  }
  else
  {
    [(NSMutableSet *)disabledSpotlightDomains addObject:@"DOMAIN_ZKWS"];
    [(NSMutableSet *)self->_disabledSpotlightDomains addObject:@"DOMAIN_PARSEC"];
  }
  [(AssistantController *)self saveSpotlightSettings];
  uint64_t v7 = [v4 BOOLValue];

  +[AssistantMetrics didToggle:@"Search" on:v7];
}

- (id)isShowZKWSuggestionsEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = (void *)CFPreferencesCopyAppValue(@"SuggestionsSpotlightZKWEnabled", @"com.apple.suggestions");
  int v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 BOOLValue];
  }
  else {
    uint64_t v6 = 1;
  }

  return (id)[v3 numberWithBool:v6];
}

- (void)setShowZKWSuggestionsEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue];
  CFPreferencesSetAppValue(@"SuggestionsSpotlightZKWEnabled", (CFPropertyListRef)[NSNumber numberWithBool:v4], @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

- (id)isShowZKWRecentsEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = (void *)CFPreferencesCopyAppValue(@"SuggestionsSpotlightZKWRecentsEnabled", @"com.apple.suggestions");
  int v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 BOOLValue];
  }
  else {
    uint64_t v6 = 1;
  }

  return (id)[v3 numberWithBool:v6];
}

- (void)setShowZKWRecentsEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue];
  CFPreferencesSetAppValue(@"SuggestionsSpotlightZKWRecentsEnabled", (CFPropertyListRef)[NSNumber numberWithBool:v4], @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

- (id)isShowInAppLibraryEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = (void *)CFPreferencesCopyAppValue(@"SuggestionsAppLibraryEnabled", @"com.apple.suggestions");
  int v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 BOOLValue];
  }
  else {
    uint64_t v6 = 1;
  }

  return (id)[v3 numberWithBool:v6];
}

- (void)setShowInAppLibraryEnabled:(id)a3 forSpecifier:(id)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 BOOLValue];
  CFPreferencesSetAppValue(@"SuggestionsAppLibraryEnabled", (CFPropertyListRef)[NSNumber numberWithBool:v5], @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
  uint64_t v7 = [v4 BOOLValue];

  +[AssistantMetrics didToggle:@"HomeScreen" on:v7];
}

- (id)isShowWhenSharingEnabled:(id)a3
{
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  id v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x263F287C0]];
  uint64_t v5 = [v4 BOOLForKey:*MEMORY[0x263F287C8]] ^ 1;

  uint64_t v6 = NSNumber;

  return (id)[v6 numberWithBool:v5];
}

- (void)setShowWhenSharingEnabled:(id)a3 forSpecifier:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x263EFFA40];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = (id)[v6 initWithSuiteName:*MEMORY[0x263F287C0]];
  LODWORD(v4) = [v5 BOOLValue];

  [v7 setBool:v4 ^ 1 forKey:*MEMORY[0x263F287C8]];
}

- (id)isShowWhenListeningEnabled:(id)a3
{
  id v3 = (void *)CFPreferencesCopyAppValue(@"ShowWhenListeningEnabled", @"com.apple.suggestions");
  id v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x263EFFA88];
  }
  id v5 = v3;

  return v5;
}

- (void)setShowWhenListeningEnabled:(id)a3 forSpecifier:(id)a4
{
  CFPreferencesSetAppValue(@"ShowWhenListeningEnabled", a3, @"com.apple.suggestions");
  CFPreferencesSynchronize(@"com.apple.suggestions", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

- (void)resetZKWHiddenSuggestions:(id)a3
{
  id v3 = (id)objc_opt_new();
  [v3 clearHiddenSuggestions];
}

- (id)assistantEnabled:(id)a3
{
  if (+[AssistantUtilities assistantEnabled]) {
    uint64_t v3 = AFAssistantRestricted() ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = NSNumber;

  return (id)[v4 numberWithBool:v3];
}

- (void)assistantEnabledConfirmed:(id)a3
{
  id v4 = a3;
  [v4 setConfirmationAction:0];
  [v4 setConfirmationCancelAction:0];

  [(AssistantController *)self setAssistantEnabled:1];
  [(AssistantController *)self _runVoiceTriggerEnablementCompletionIfApplicable];
  enablementConfiguration = self->_enablementConfiguration;
  if (enablementConfiguration)
  {
    id v6 = [(AFEnablementConfiguration *)enablementConfiguration completionLoggingBlock];
    v6[2](v6, 1);
  }
}

- (void)assistantEnabledCancelled:(id)a3
{
  id v7 = a3;
  id v4 = [v7 propertyForKey:*MEMORY[0x263F60028]];
  [v4 setOn:0 animated:1];
  [v7 setConfirmationAction:0];
  [v7 setConfirmationCancelAction:0];
  [(AssistantController *)self setAssistantEnabled:0];
  [(AssistantController *)self _runVoiceTriggerEnablementCompletionIfApplicable];
  if ([(AssistantController *)self _isCurrentSpecifierVoiceActivation])
  {
    +[AssistantMetrics didEnableSiriConfirmed:0 source:@"HeySiri"];
  }
  else
  {
    id v5 = [v7 identifier];
    if ([v5 isEqualToString:@"ACTIVATION_LONG_PRESS_ID"]) {
      id v6 = @"HardwareButton";
    }
    else {
      id v6 = @"Unknown";
    }
    +[AssistantMetrics didEnableSiriConfirmed:0 source:v6];
  }
}

- (void)assistantDisabledConfirmed:(id)a3
{
  id v9 = a3;
  [v9 setConfirmationAction:0];
  [v9 setConfirmationCancelAction:0];
  [(AssistantController *)self setAssistantEnabled:0];
  id v4 = [MEMORY[0x263F78BB8] sharedInstance];
  [v4 deleteAllVoiceProfilesForAppDomain:*MEMORY[0x263F78BC0]];

  id v5 = [MEMORY[0x263F85AF0] sharedPreferences];
  [v5 setVoiceTriggerEnabled:0];

  if (+[AssistantUtilities shouldShowCompactVoiceTriggerSpecifier])
  {
    id v6 = @"ACTIVATION_COMPACT_ID";
  }
  else
  {
    id v6 = @"ACTIVATION";
  }
  [(AssistantController *)self reloadSpecifierID:v6];
  if ([(AssistantController *)self _isCurrentSpecifierVoiceActivation])
  {
    [(AssistantController *)self setVoiceTrigger:MEMORY[0x263EFFA80] forSpecifier:v9];
    id v7 = @"HeySiri";
  }
  else if ([(AssistantController *)self _isCurrentSpecifierQuickTypeGesture])
  {
    [(AssistantController *)self setTypeToSiriTrigger:MEMORY[0x263EFFA80] forSpecifier:v9];
    id v7 = @"QuickType";
  }
  else
  {
    [(AssistantController *)self setHardwareButtonTrigger:MEMORY[0x263EFFA80] forSpecifier:v9];
    currentSiriActivationSpecifier = self->_currentSiriActivationSpecifier;
    self->_currentSiriActivationSpecifier = 0;

    id v7 = @"HardwareButton";
  }
  +[AssistantMetrics didDisableSiriConfirmed:1 source:v7];
  [(AssistantController *)self _runVoiceTriggerEnablementCompletionIfApplicable];
  if (_AXSHomeButtonAssistant() == 2) {
    _AXSSetHomeButtonAssistant();
  }
}

- (void)assistantDisabledCancelled:(id)a3
{
  id v7 = a3;
  id v4 = [v7 propertyForKey:*MEMORY[0x263F60028]];
  [v4 setOn:1 animated:1];
  [v7 setConfirmationAction:0];
  [v7 setConfirmationCancelAction:0];
  [(AssistantController *)self setAssistantEnabled:1];
  [(AssistantController *)self _runVoiceTriggerEnablementCompletionIfApplicable];
  if ([(AssistantController *)self _isCurrentSpecifierVoiceActivation])
  {
    +[AssistantMetrics didDisableSiriConfirmed:0 source:@"HeySiri"];
  }
  else
  {
    id v5 = [v7 identifier];
    if ([v5 isEqualToString:@"ACTIVATION_LONG_PRESS_ID"]) {
      id v6 = @"HardwareButton";
    }
    else {
      id v6 = @"Unknown";
    }
    +[AssistantMetrics didDisableSiriConfirmed:0 source:v6];
  }
}

- (void)setAssistantLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v3 = [MEMORY[0x263F285A0] sharedPreferences];
  [v3 setLanguageCode:v4];

  if ([(id)objc_opt_class() _heySiriSupportedForLanguage:v4]) {
    VSPreferencesSetSpokenLanguageIdentifier();
  }
}

- (void)setAssistantLanguage:(id)a3 forSpecifier:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = a4;
  id v8 = +[AssistantUtilities assistantLanguage];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__AssistantController_setAssistantLanguage_forSpecifier___block_invoke;
  v13[3] = &unk_26457D368;
  v13[4] = self;
  id v14 = v8;
  id v15 = v7;
  id v9 = v7;
  id v10 = v8;
  [(AssistantController *)self registerUndoActionWithKey:@"LANGUAGE" urlString:@"prefs:root=SIRI&path=LANGUAGE_ID" undoAction:v13];
  pendingLanguage = self->_pendingLanguage;
  self->_pendingLanguage = v6;
  uint64_t v12 = v6;

  [(AssistantController *)self _setAssistantLanguage:self->_pendingLanguage forSpecifier:v9];
  [(AssistantController *)self reloadSpecifiers];
}

uint64_t __57__AssistantController_setAssistantLanguage_forSpecifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setAssistantLanguage:*(void *)(a1 + 40) forSpecifier:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

- (void)_setAssistantLanguage:(id)a3 forSpecifier:(id)a4
{
  if (-[AssistantController _isIncompatibleWithWatchLanguage:](self, "_isIncompatibleWithWatchLanguage:", self->_pendingLanguage, a4))
  {
    [(AssistantController *)self _showIncompatibleWatchLanguageAlert];
  }
  else
  {
    [(AssistantController *)self _setAssistantLanguageWatchMismatchConfirmed:0];
  }
}

- (BOOL)_isIncompatibleWithWatchLanguage:(id)a3
{
  id v4 = a3;
  id v5 = [getNRPairedDeviceRegistryClass() sharedInstance];
  int v6 = [v5 isPaired];

  if (v6) {
    BOOL v7 = ![(AssistantController *)self watchSupportsSiriLanguageCode:v4];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_languageWillDisableHeySiri:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() _heySiriSupportedForLanguage:v4])
  {
    uint64_t v5 = [MEMORY[0x263F78BB8] sharedInstance];
    int v6 = [(AssistantController *)self assistantLanguage:0];
    char v7 = [(id)v5 isSATEnrolledForSiriProfileId:0 forLanguageCode:v6];

    id v8 = [MEMORY[0x263F78BB8] sharedInstance];
    LOBYTE(v5) = [v8 isSATEnrolledForSiriProfileId:0 forLanguageCode:v4];

    char v9 = v7 & (v5 ^ 1);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)_isHeySiriAlwaysOn
{
  return MEMORY[0x270F95FB8](@"U+73bmG4kBGj6kpreQXUTQ", a2);
}

- (void)_showIncompatibleWatchLanguageAlert
{
  id v19 = [MEMORY[0x263F5FB40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v19 setConfirmationAction:sel__setAssistantLanguageConfirmed_];
  [v19 setConfirmationCancelAction:sel__setAssistantLanguageCancelled_];
  uint64_t v3 = [MEMORY[0x263F75410] assistantLanguageTitlesDictionary];
  id v18 = self;
  id v4 = [v3 objectForKeyedSubscript:self->_pendingLanguage];

  if (v4)
  {
    uint64_t v5 = NSString;
    int v6 = +[AssistantController bundle];
    char v7 = [v6 localizedStringForKey:@"ASSISTANT_WATCH_LANGUAGE_WARNING" value:&stru_26D2AB140 table:@"AssistantSettings"];
    id v8 = objc_msgSend(v5, "stringWithFormat:", v7, v4);
  }
  else
  {
    int v6 = +[AssistantController bundle];
    id v8 = [v6 localizedStringForKey:@"ASSISTANT_WATCH_GENERIC_LANGUAGE_WARNING" value:&stru_26D2AB140 table:@"AssistantSettings"];
  }

  char v9 = NSDictionary;
  id v10 = +[AssistantController bundle];
  uint64_t v11 = [v10 localizedStringForKey:@"ASSISTANT_WATCH_LANGUAGE_OK" value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v12 = *MEMORY[0x263F60018];
  uint64_t v13 = *MEMORY[0x263F60010];
  id v14 = +[AssistantController bundle];
  id v15 = [v14 localizedStringForKey:@"ASSISTANT_WATCH_LANGUAGE_CANCEL" value:&stru_26D2AB140 table:@"AssistantSettings"];
  id v16 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v11, v12, v8, v13, v15, *MEMORY[0x263F5FFF8], 0);

  [v19 setupWithDictionary:v16];
  id v17 = [MEMORY[0x263F82670] currentDevice];
  -[AssistantController showConfirmationViewForSpecifier:useAlert:swapAlertButtons:](v18, "showConfirmationViewForSpecifier:useAlert:swapAlertButtons:", v19, objc_msgSend(v17, "sf_isiPad"), 0);
}

- (void)_showWillDisableAlertWillDisableHeySiri:(BOOL)a3 disableMultiUser:(BOOL)a4 disableSpokenFeedbackOnWatch:(BOOL)a5
{
  id v7 = [(AssistantController *)self confirmationSpecifierWillDisableHeySiri:a3 disableMultiUser:a4 disableSpokenFeedbackOnWatch:a5];
  int v6 = [MEMORY[0x263F82670] currentDevice];
  -[AssistantController showConfirmationViewForSpecifier:useAlert:swapAlertButtons:](self, "showConfirmationViewForSpecifier:useAlert:swapAlertButtons:", v7, objc_msgSend(v6, "sf_isiPad"), 0);
}

- (id)confirmationSpecifierWillDisableHeySiri:(BOOL)a3 disableMultiUser:(BOOL)a4 disableSpokenFeedbackOnWatch:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  v26[4] = *MEMORY[0x263EF8340];
  char v9 = [MEMORY[0x263F5FB40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v9 setConfirmationAction:sel__setAssistantLanguageHeySiriDisableConfirmed_];
  [v9 setConfirmationCancelAction:sel__setAssistantLanguageCancelled_];
  id v10 = [(AssistantController *)self specifierForID:@"LANGUAGE_ID"];
  uint64_t v11 = [v10 titleDictionary];
  uint64_t v12 = [v11 valueForKey:self->_pendingLanguage];

  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[AssistantController confirmationSpecifierWillDisableHeySiri:disableMultiUser:disableSpokenFeedbackOnWatch:]();
    }
    uint64_t v12 = &stru_26D2AB140;
  }
  uint64_t v13 = [(AssistantController *)self _confirmationPromptDisableHeySiri:v7 disableMultiUser:v6 disableSpokenFeedback:v5];
  id v14 = [v13 stringByReplacingOccurrencesOfString:@"%@" withString:v12];

  id v15 = +[AssistantController bundle];
  id v16 = [v15 localizedStringForKey:@"ASSISTANT_WATCH_LANGUAGE_CHANGE" value:&stru_26D2AB140 table:@"AssistantSettings"];

  id v17 = +[AssistantController bundle];
  id v18 = [v17 localizedStringForKey:@"ASSISTANT_WATCH_LANGUAGE_CHANGE" value:&stru_26D2AB140 table:@"AssistantSettings"];

  id v19 = +[AssistantController bundle];
  char v20 = [v19 localizedStringForKey:@"ASSISTANT_WATCH_LANGUAGE_CANCEL" value:&stru_26D2AB140 table:@"AssistantSettings"];

  uint64_t v21 = *MEMORY[0x263F60010];
  v25[0] = *MEMORY[0x263F60018];
  v25[1] = v21;
  v26[0] = v16;
  v26[1] = v14;
  uint64_t v22 = *MEMORY[0x263F5FFF8];
  v25[2] = *MEMORY[0x263F60008];
  v25[3] = v22;
  v26[2] = v18;
  v26[3] = v20;
  uint64_t v23 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  [v9 setupWithDictionary:v23];

  return v9;
}

- (BOOL)_pairedWithSiriSpeaksEnabledNanoHardware
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance", 0);
  uint64_t v3 = [v2 getAllDevices];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        char v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"BFF435BD-ACFF-4AD8-9CC4-4DEA6D51BB3A"];
        LOBYTE(v8) = [v8 supportsCapability:v9];

        if (v8)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)_setAssistantLanguageWatchMismatchConfirmed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F285A0] sharedPreferences];
  uint64_t v6 = [v5 languageCode];
  int v7 = [v6 isEqualToString:self->_pendingLanguage];

  if (v7)
  {
    [(AssistantController *)self _setAssistantLanguageConfirmed:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    AFSettingsConnection = self->_AFSettingsConnection;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke;
    v9[3] = &unk_26457D788;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    [AFSettingsConnection fetchSupportedMultiUserLanguageCodes:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke_2;
  v9[3] = &unk_26457D760;
  id v10 = v6;
  id v7 = v6;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v13);
}

void __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = (os_log_t *)MEMORY[0x263F28348];
  if (*(void *)(a1 + 32) && os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke_2_cold_2();
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[175])
    {
      BOOL v5 = [WeakRetained[207] count]
        && ([v4[207] containsObject:v4[175]] & 1) == 0
        && *((unsigned char *)v4 + 1664) != 0;
      uint64_t v14 = v5 | [*(id *)(a1 + 40) containsObject:v4[175]] ^ 1;
      long long v15 = *v2;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = NSNumber;
        uint64_t v17 = v15;
        id v18 = [v16 numberWithBool:v14];
        id v19 = [NSNumber numberWithBool:v5];
        int v22 = 136315650;
        uint64_t v23 = "-[AssistantController _setAssistantLanguageWatchMismatchConfirmed:]_block_invoke";
        __int16 v24 = 2112;
        uint64_t v25 = v18;
        __int16 v26 = 2112;
        uint64_t v27 = v19;
        _os_log_impl(&dword_220C23000, v17, OS_LOG_TYPE_DEFAULT, "%s #settings Multi user enabled fetch complete. State for current language: %@ (home:%@)", (uint8_t *)&v22, 0x20u);
      }
      uint64_t v20 = [v4 _languageWillDisableHeySiri:v4[175]];
      if (AFGryphonAssetsExistForLanguage()) {
        uint64_t v21 = 0;
      }
      else {
        uint64_t v21 = [v4 _pairedWithSiriSpeaksEnabledNanoHardware];
      }
      if (+[AssistantUtilities deviceIsVision]
        || (v20 | v14 | v21) != 1)
      {
        [v4 _setAssistantLanguageConfirmed:*(void *)(a1 + 48)];
      }
      else
      {
        [v4 _showWillDisableAlertWillDisableHeySiri:v20 disableMultiUser:v14 disableSpokenFeedbackOnWatch:v21];
      }
    }
    else
    {
      id v6 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR)) {
        __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke_2_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
}

- (id)_confirmationPromptDisableHeySiri:(BOOL)a3 disableMultiUser:(BOOL)a4 disableSpokenFeedback:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSNumber;
    uint64_t v11 = v9;
    uint64_t v12 = [v10 numberWithBool:v7];
    uint64_t v13 = [NSNumber numberWithBool:v6];
    uint64_t v14 = [NSNumber numberWithBool:v5];
    int v36 = 136315906;
    id v37 = "-[AssistantController _confirmationPromptDisableHeySiri:disableMultiUser:disableSpokenFeedback:]";
    __int16 v38 = 2112;
    id v39 = v12;
    __int16 v40 = 2112;
    uint64_t v41 = v13;
    __int16 v42 = 2112;
    id v43 = v14;
    _os_log_impl(&dword_220C23000, v11, OS_LOG_TYPE_DEFAULT, "%s disableHeySiri:%@ disableMultiUser:%@, disableSpokenFeedback:%@", (uint8_t *)&v36, 0x2Au);
  }
  BOOL v15 = !v7 || v6;
  if (v15 || v5)
  {
    BOOL v19 = !v7 || !v6;
    if (v19 || v5)
    {
      BOOL v20 = !v5;
      if (v15 || !v5)
      {
        if (v19 || v20)
        {
          BOOL v21 = !v6 || v7;
          if (v21 || v5)
          {
            if (v21 || v20)
            {
              if (v7 || v6 || v20)
              {
                int v22 = 0;
                goto LABEL_22;
              }
              id v16 = +[AssistantController bundle];
              uint64_t v17 = v16;
              id v18 = @"ASSISTANT_SPOKENFEEDBACK_DISABLE_WARNING";
            }
            else
            {
              id v16 = +[AssistantController bundle];
              uint64_t v17 = v16;
              id v18 = @"ASSISTANT_MULTIUSER_SPOKENFEEDBACK_DISABLE_WARNING";
            }
          }
          else
          {
            id v16 = +[AssistantController bundle];
            uint64_t v17 = v16;
            id v18 = @"ASSISTANT_MULTIUSER_DISABLE_WARNING";
          }
        }
        else
        {
          id v16 = +[AssistantController bundle];
          uint64_t v17 = v16;
          id v18 = @"ASSISTANT_HEYSIRI_MULTIUSER_SPOKENFEEDBACK_DISABLE_WARNING";
        }
      }
      else
      {
        id v16 = +[AssistantController bundle];
        uint64_t v17 = v16;
        id v18 = @"ASSISTANT_HEYSIRI_SPOKENFEEDBACK_DISABLE_WARNING";
      }
    }
    else
    {
      id v16 = +[AssistantController bundle];
      uint64_t v17 = v16;
      id v18 = @"ASSISTANT_HEYSIRI_MULTIUSER_DISABLE_WARNING";
    }
  }
  else
  {
    id v16 = +[AssistantController bundle];
    uint64_t v17 = v16;
    id v18 = @"ASSISTANT_HEYSIRI_DISABLE_WARNING";
  }
  int v22 = [v16 localizedStringForKey:v18 value:&stru_26D2AB140 table:@"AssistantSettings"];

LABEL_22:
  uint64_t v23 = [(GMFooterUtility *)self->_gmFooterUtility fetchEnglishVariants];
  if ([v23 containsObject:self->_pendingLanguage]) {
    goto LABEL_31;
  }
  __int16 v24 = +[GMEligibilityProvider shared];
  int v25 = [v24 activeEnabled];

  if (v25)
  {
    __int16 v26 = +[AssistantController bundle];
    uint64_t v27 = [v26 localizedStringForKey:@"ASSISTANT_GM_LANGUAGE_WARNING" value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
  }
  else
  {
    uint64_t v28 = +[GMEligibilityProvider shared];
    int v29 = [v28 onWaitlist];

    if (!v29) {
      goto LABEL_31;
    }
    __int16 v26 = [MEMORY[0x263F82670] currentDevice];
    int v30 = objc_msgSend(v26, "sf_isiPad");
    uint64_t v31 = +[AssistantController bundle];
    uint64_t v32 = v31;
    if (v30) {
      uint64_t v33 = @"ASSISTANT_GM_LANGUAGE_WARNING_WAITLIST_IPAD";
    }
    else {
      uint64_t v33 = @"ASSISTANT_GM_LANGUAGE_WARNING_WAITLIST_IPHONE";
    }
    uint64_t v27 = [v31 localizedStringForKey:v33 value:&stru_26D2AB140 table:@"AssistantSettings-GM"];
  }
  uint64_t v34 = [v27 stringByAppendingString:v22];

  int v22 = (void *)v34;
LABEL_31:

  return v22;
}

- (void)_setAssistantLanguageHeySiriDisableConfirmed:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSArray *)self->_languagesInHome count]
    && ![(NSArray *)self->_languagesInHome containsObject:self->_pendingLanguage]
    && self->_thisIsMeDevice)
  {
    BOOL v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      BOOL v7 = "-[AssistantController _setAssistantLanguageHeySiriDisableConfirmed:]";
      _os_log_impl(&dword_220C23000, v5, OS_LOG_TYPE_DEFAULT, "%s #settings Turning off recognize my voice in the home due to language change", (uint8_t *)&v6, 0xCu);
    }
    [self->_AFSettingsConnection setRecognizeMyVoiceEnabled:0];
  }
  [(AssistantController *)self _setAssistantLanguageConfirmed:v4];
}

- (void)_setAssistantLanguageConfirmed:(id)a3
{
  id v4 = [(AssistantController *)self multilingualResponseLanguageVariants];
  int v5 = [v4 containsObject:self->_pendingLanguage];

  if (v5)
  {
    int v6 = [MEMORY[0x263F285A0] sharedPreferences];
    objc_msgSend(v6, "setMultilingualResponseEnabled:forLanguage:", -[AssistantController selectedLanguageWantsMultilingualEnabled](self, "selectedLanguageWantsMultilingualEnabled"), self->_pendingLanguage);
  }
  [(AssistantController *)self setAssistantLanguage:self->_pendingLanguage];
  BOOL v7 = [MEMORY[0x263F85AF0] sharedPreferences];
  uint64_t v8 = [MEMORY[0x263F78BB8] sharedInstance];
  objc_msgSend(v7, "setVoiceTriggerEnabled:", objc_msgSend(v8, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, self->_pendingLanguage));

  uint64_t v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:0];
  [(AssistantController *)self reloadSpecifier:v9];

  [(AssistantController *)self reloadSpecifiers];
  [(AssistantController *)self reloadSpecifierID:@"ACTIVATION"];
  [(AssistantController *)self _updateSpecifiersForLanguage:self->_pendingLanguage];
  pendingLanguage = self->_pendingLanguage;
  self->_pendingLanguage = 0;
}

- (void)_setAssistantLanguageCancelled:(id)a3
{
  id v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:0];
  [(AssistantController *)self reloadSpecifier:v4];

  [(AssistantController *)self reloadSpecifiers];
  pendingLanguage = self->_pendingLanguage;
  self->_pendingLanguage = 0;
}

- (NSArray)multilingualResponseLanguageVariants
{
  return (NSArray *)&unk_26D2B3B80;
}

- (id)detailTextForLanguageSpecifierFromTitles:(id)a3
{
  id v4 = a3;
  int v5 = [(AssistantController *)self assistantLanguage:0];
  if (![MEMORY[0x263F28510] isMultilingualResponseVariantSelectorEnabled]) {
    goto LABEL_6;
  }
  int v6 = [MEMORY[0x263F285A0] sharedPreferences];
  int v7 = [v6 multilingualResponseEnabledForLanguage:v5];

  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = [NSString stringWithFormat:@"MULTILINGUAL_DETAIL_TOP_LEVEL_MIXED_%@", v5, 0];
  uint64_t v9 = +[AssistantController bundle];
  uint64_t v10 = [v9 localizedStringForKey:v8 value:&stru_26D2AB140 table:@"AssistantSettings"];

  if (!v10 || ([v10 isEqualToString:v8] & 1) != 0)
  {

LABEL_6:
    uint64_t v10 = [v4 objectForKey:v5];
    goto LABEL_7;
  }

LABEL_7:

  return v10;
}

- (id)assistantVoiceLanguage:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences", a3);
  id v4 = [v3 outputVoice];

  int v5 = [v4 languageCode];

  return v5;
}

- (BOOL)isFlexibleFollowupsSupported
{
  id v2 = [MEMORY[0x263F37F88] sharedPreferences];
  char v3 = [v2 isFlexibleFollowupsSupported];

  return v3;
}

- (void)didAcceptEnteredPIN
{
}

- (void)didCancelEnteringPIN
{
  id v2 = [(PSSpecifier *)self->_lockScreenSpecifier propertyForKey:*MEMORY[0x263F60028]];
  [v2 setOn:0 animated:1];
}

- (id)accessibleFromLockScreen:(id)a3
{
  char v3 = NSNumber;
  id v4 = objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences", a3);
  int v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "disableAssistantWhilePasscodeLocked") ^ 1);

  return v5;
}

- (void)_setAccessibleFromLockScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F2BCC0]);
  uint64_t v6 = [v5 effectiveGlobalSpokenNotificationSetting];
  id v7 = objc_alloc_init(MEMORY[0x263F7E2A0]);
  if (![v7 announceCalls])
  {
    int v10 = 0;
    if (v6 != 2) {
      goto LABEL_14;
    }
LABEL_11:
    uint64_t v13 = +[AssistantController bundle];
    uint64_t v11 = [v13 localizedStringForKey:@"ASSISTANT_LOCK_SCREEN_DISABLE_ANNOUNCE_MESSAGES" value:&stru_26D2AB140 table:@"AssistantSettings"];
LABEL_13:

    goto LABEL_15;
  }
  int v8 = _os_feature_enabled_impl();
  if (v6 == 2 && v8 != 0)
  {
    uint64_t v12 = +[AssistantController bundle];
    uint64_t v13 = v12;
    uint64_t v14 = @"ASSISTANT_LOCK_SCREEN_DISABLE_ANNOUNCE_CALLS_MESSAGES";
LABEL_12:
    uint64_t v11 = [v12 localizedStringForKey:v14 value:&stru_26D2AB140 table:@"AssistantSettings"];
    int v10 = 1;
    goto LABEL_13;
  }
  int v10 = v8;
  if (v6 == 2) {
    goto LABEL_11;
  }
  if (v8)
  {
    uint64_t v12 = +[AssistantController bundle];
    uint64_t v13 = v12;
    uint64_t v14 = @"ASSISTANT_LOCK_SCREEN_DISABLE_ANNOUNCE_CALLS";
    goto LABEL_12;
  }
LABEL_14:
  uint64_t v11 = 0;
LABEL_15:
  if (v6 == 2) {
    int v15 = 1;
  }
  else {
    int v15 = v10;
  }
  if (v15 != 1 || v3)
  {
    [(AssistantController *)self setDisabledFromLockScreen:!v3];
  }
  else
  {
    objc_initWeak(&location, self);
    id v16 = (void *)MEMORY[0x263F82400];
    uint64_t v17 = +[AssistantController bundle];
    id v18 = [v17 localizedStringForKey:@"ASSISTANT_LOCK_SCREEN_DISABLE_OK" value:&stru_26D2AB140 table:@"AssistantSettings"];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __52__AssistantController__setAccessibleFromLockScreen___block_invoke;
    v30[3] = &unk_26457D7B0;
    objc_copyWeak(&v33, &location);
    BOOL v34 = v3;
    id v31 = v5;
    id v32 = v7;
    BOOL v19 = [v16 actionWithTitle:v18 style:0 handler:v30];

    BOOL v20 = (void *)MEMORY[0x263F82400];
    BOOL v21 = +[AssistantController bundle];
    int v22 = [v21 localizedStringForKey:@"ASSISTANT_LOCK_SCREEN_DISABLE_CANCEL" value:&stru_26D2AB140 table:@"AssistantSettings"];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __52__AssistantController__setAccessibleFromLockScreen___block_invoke_2;
    v28[3] = &unk_26457CF10;
    objc_copyWeak(&v29, &location);
    uint64_t v23 = [v20 actionWithTitle:v22 style:1 handler:v28];

    __int16 v24 = (void *)MEMORY[0x263F82418];
    int v25 = +[AssistantController bundle];
    __int16 v26 = [v25 localizedStringForKey:@"ASSISTANT_LOCK_SCREEN_DISABLE_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings"];
    uint64_t v27 = [v24 alertControllerWithTitle:v26 message:v11 preferredStyle:0];

    [v27 addAction:v19];
    [v27 addAction:v23];
    [(AssistantController *)self presentViewController:v27 animated:1 completion:0];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
}

void __52__AssistantController__setAccessibleFromLockScreen___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setDisabledFromLockScreen:*(unsigned char *)(a1 + 56) == 0];
  [*(id *)(a1 + 32) setEffectiveGlobalSpokenNotificationSetting:1];
  [*(id *)(a1 + 40) setAnnounceCalls:0];
}

void __52__AssistantController__setAccessibleFromLockScreen___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained[182] propertyForKey:*MEMORY[0x263F60028]];
  [v1 setOn:1 animated:1];
}

- (void)setAccessibleFromLockScreen:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 BOOLValue])
  {
    id v8 = objc_alloc_init(MEMORY[0x263F10520]);
    uint64_t v9 = [v7 name];
    [v8 setTitle:v9];

    objc_initWeak(&location, self);
    passcodeService = self->_passcodeService;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __64__AssistantController_setAccessibleFromLockScreen_forSpecifier___block_invoke;
    v11[3] = &unk_26457D7D8;
    objc_copyWeak(&v12, &location);
    [(LAPasscodeVerificationService *)passcodeService startInParentVC:self options:v8 completion:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    [(AssistantController *)self _setAccessibleFromLockScreen:0];
  }
}

void __64__AssistantController_setAccessibleFromLockScreen_forSpecifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (a3) {
    [WeakRetained didCancelEnteringPIN];
  }
  else {
    [WeakRetained didAcceptEnteredPIN];
  }
}

- (void)setDisabledFromLockScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F285A0] sharedPreferences];
  int v5 = [v4 disableAssistantWhilePasscodeLocked];

  if (v5 != v3)
  {
    id v6 = [MEMORY[0x263F285A0] sharedPreferences];
    [v6 setDisableAssistantWhilePasscodeLocked:v3];

    id v7 = [MEMORY[0x263F285A0] sharedPreferences];
    [v7 synchronize];
  }

  +[AssistantMetrics didToggle:@"Lockscreen" on:v3 ^ 1];
}

- (void)setVoiceTrigger:(id)a3 forSpecifier:(id)a4
{
}

- (void)setVoiceTrigger:(id)a3 forSpecifier:(id)a4 transitionWithNavControllerIfNecessary:(id)a5
{
  id v15 = a4;
  id v9 = a5;
  uint64_t v10 = [a3 BOOLValue];
  if (+[AssistantUtilities assistantEnabled])
  {
    BOOL v11 = +[AssistantUtilities isHardwareButtonTrigger];
    if (v10)
    {
      if (!v11) {
        objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, a4);
      }
      if (+[AssistantUtilities needsTrainingData:1])
      {
        getVTUIEnrollTrainingViewControllerClass();
        id v12 = (VTUIEnrollTrainingViewController *)objc_opt_new();
        enrollmentController = self->_enrollmentController;
        self->_enrollmentController = v12;

        [(VTUIEnrollTrainingViewController *)self->_enrollmentController setDelegate:self];
        +[AssistantUtilities disableVoiceTrigger];
        [(AssistantController *)self startEnrollment:v9];
        goto LABEL_17;
      }
      +[AssistantUtilities enableVoiceTrigger];
      goto LABEL_14;
    }
    if (v11
      || +[AssistantUtilities isQuickTypeGestureEnabled])
    {
      +[AssistantUtilities disableVoiceTriggerAndSiriEnrollmentForCurrentLanguage];
      [(AssistantController *)self _reloadSiriInCallSpecifier];
LABEL_14:
      [(AssistantController *)self _runVoiceTriggerEnablementCompletionIfApplicable];
      goto LABEL_17;
    }
    objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, a4);
    uint64_t v14 = MEMORY[0x263EFFA80];
  }
  else
  {
    if (!v10)
    {
      +[AssistantUtilities disableVoiceTriggerAndSiriEnrollmentForCurrentLanguage];
      goto LABEL_14;
    }
    objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, a4);
    uint64_t v14 = MEMORY[0x263EFFA88];
  }
  [(AssistantController *)self _setAssistantEnabled:v14 forSpecifier:v15 presentingViewController:self actionHandler:0];
LABEL_17:
  +[AssistantMetrics didToggle:@"HeySiri" on:v10];
}

- (void)startEnrollment:(id)a3
{
  if (a3)
  {
    [a3 pushViewController:self->_enrollmentController animated:1];
    id v10 = [(VTUIEnrollTrainingViewController *)self->_enrollmentController navigationItem];
    id v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelSetup_];
    [v10 setLeftBarButtonItem:v4];
  }
  else
  {
    int v5 = [(PSRootController *)[PSVoiceTriggerRootController alloc] initWithRootViewController:self->_enrollmentController];
    id v6 = [(PSVoiceTriggerRootController *)v5 navigationBar];
    [v6 _setHidesShadow:1];
    id v7 = objc_opt_new();
    [v6 setBackgroundImage:v7 forBarMetrics:0];

    id v8 = [(VTUIEnrollTrainingViewController *)self->_enrollmentController navigationItem];
    id v9 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelSetup_];
    [v8 setLeftBarButtonItem:v9];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __39__AssistantController_startEnrollment___block_invoke;
    v11[3] = &unk_26457CF88;
    void v11[4] = self;
    [(AssistantController *)self presentViewController:v5 animated:1 completion:v11];
  }
}

uint64_t __39__AssistantController_startEnrollment___block_invoke(uint64_t a1)
{
  if (+[AssistantUtilities shouldShowCompactVoiceTriggerSpecifier])
  {
    id v2 = @"ACTIVATION_COMPACT_ID";
  }
  else
  {
    id v2 = @"ACTIVATION";
  }
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 reloadSpecifierID:v2];
}

- (void)_handleDelayedDeeplink
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_220C23000, v0, OS_LOG_TYPE_DEBUG, "%s Handling delayed deeplink. %@", (uint8_t *)v1, 0x16u);
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  id v9 = [(AssistantController *)self navigationController];

  if (!v9)
  {
    objc_storeStrong((id *)&self->_delayedDeeplinkResource, a3);
    id v12 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      -[AssistantController handleURL:withCompletion:](v12);
      if (!v8) {
        goto LABEL_20;
      }
    }
    else if (!v8)
    {
      goto LABEL_20;
    }
    v8[2](v8);
    goto LABEL_20;
  }
  id v10 = [v7 objectForKey:@"path"];
  BOOL v11 = [v7 objectForKey:@"shortcutsBundleID"];
  if ([v10 isEqualToString:@"heysirisetupflow"])
  {
    [(AssistantController *)self setVoiceTrigger:MEMORY[0x263EFFA88] forSpecifier:0];
    if (v8) {
      v8[2](v8);
    }
  }
  else if ([v10 isEqualToString:@"buddyFlowSetup"])
  {
    [(AssistantController *)self handleBuddyFlow];
  }
  else if ([v10 isEqualToString:@"gmCFU"])
  {
    [(AssistantController *)self handleGmCFU];
  }
  else if (v11)
  {
    uint64_t v13 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v11];
    uint64_t v14 = [v13 appState];
    int v15 = [v14 isInstalled];

    if (v15)
    {
      v17.receiver = self;
      v17.super_class = (Class)AssistantController;
      [(AssistantController *)&v17 handleURL:v7 withCompletion:v8];
    }
    else
    {
      [(AssistantController *)self loadAppStorePageForBundleId:v11];
      if (v8) {
        v8[2](v8);
      }
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)AssistantController;
    [(AssistantController *)&v16 handleURL:v7 withCompletion:v8];
  }

LABEL_20:
}

- (void)loadAppStorePageForBundleId:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x263F27B40];
  id v6 = [MEMORY[0x263F27CC0] bagKeySet];
  id v7 = [MEMORY[0x263F27CC0] bagSubProfile];
  id v8 = [MEMORY[0x263F27CC0] bagSubProfileVersion];
  [v5 registerBagKeySet:v6 forProfile:v7 profileVersion:v8];

  id v9 = (void *)MEMORY[0x263F27B28];
  id v10 = [MEMORY[0x263F27CC0] bagSubProfile];
  BOOL v11 = [MEMORY[0x263F27CC0] bagSubProfileVersion];
  id v12 = [v9 bagForProfile:v10 profileVersion:v11];

  id v13 = objc_alloc(MEMORY[0x263F27CC0]);
  uint64_t v14 = (void *)[v13 initWithBag:v12 caller:v4 keyProfile:*MEMORY[0x263F27930]];
  v22[0] = v4;
  int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  objc_super v16 = [v14 performLookupWithBundleIdentifiers:v15 itemIdentifiers:0];

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __51__AssistantController_loadAppStorePageForBundleId___block_invoke;
  v18[3] = &unk_26457D800;
  objc_copyWeak(&v20, &location);
  id v17 = v4;
  id v19 = v17;
  [v16 addFinishBlock:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __51__AssistantController_loadAppStorePageForBundleId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = [v5 allItems];
    id v9 = [v8 firstObject];

    if (v6)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        __51__AssistantController_loadAppStorePageForBundleId___block_invoke_cold_3();
      }
    }
    else
    {
      id v18 = *MEMORY[0x263F28348];
      id v19 = *MEMORY[0x263F28348];
      if (v9)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = *(void *)(a1 + 32);
          int v30 = 136315394;
          id v31 = "-[AssistantController loadAppStorePageForBundleId:]_block_invoke";
          __int16 v32 = 2112;
          uint64_t v33 = v20;
          _os_log_impl(&dword_220C23000, v18, OS_LOG_TYPE_INFO, "%s Successfully retrieved store info for %@", (uint8_t *)&v30, 0x16u);
        }
        BOOL v21 = [MEMORY[0x263F82438] sharedApplication];
        int v22 = [v9 productPageURL];
        [v21 openURL:v22 withCompletionHandler:0];
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __51__AssistantController_loadAppStorePageForBundleId___block_invoke_cold_2(v18, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }
  else
  {
    id v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __51__AssistantController_loadAppStorePageForBundleId___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (void)showAssistantVoiceActivationController:(id)a3
{
  id v5 = objc_alloc_init(AssistantActivationController);
  [(AssistantActivationController *)v5 setDelegate:self];
  id v4 = [(AssistantController *)self navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (void)handleBuddyFlow
{
  uint64_t v3 = +[AssistantUtilities shouldShowCompactVoiceTriggerSpecifier];
  id v4 = [MEMORY[0x263F85AF0] sharedPreferences];
  id v5 = (id)[v4 setUserPreferredVoiceTriggerPhraseType:v3 sender:self deviceType:0 endpointId:0];

  id v7 = objc_alloc_init(MEMORY[0x263F5FB40]);
  [v7 setName:@"BUDDY_FLOW_CONFIRMATION"];
  id v6 = [NSNumber numberWithBool:1];
  [(AssistantController *)self setVoiceActivation:v6 forSpecifier:v7 withTrainingCompletionIfNecessary:0];
}

- (void)handleGmCFU
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[GMEligibilityProvider shared];
  char v4 = [v3 deviceSupported];

  if (v4)
  {
    uint64_t v5 = +[AssistantUtilities shouldShowCompactVoiceTriggerSpecifier];
    id v6 = [MEMORY[0x263F85AF0] sharedPreferences];
    id v7 = (id)[v6 setUserPreferredVoiceTriggerPhraseType:v5 sender:self deviceType:0 endpointId:0];

    id v8 = (VTUIEnrollTrainingViewController *)[objc_alloc((Class)getVTUIEnrollTrainingViewControllerClass()) init:7];
    enrollmentController = self->_enrollmentController;
    self->_enrollmentController = v8;

    [(VTUIEnrollTrainingViewController *)self->_enrollmentController setDelegate:self];
    [(AssistantController *)self startEnrollment:0];
    [MEMORY[0x263F32BA8] setHasEngagedWithCFU:1];
    [(AssistantController *)self clearGMCFU];
  }
  else
  {
    id v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[AssistantController handleGmCFU]";
      _os_log_impl(&dword_220C23000, v10, OS_LOG_TYPE_INFO, "%s GM Deeplink was invoked from ineligible hardware. Bailing!", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)clearGMCFU
{
}

- (BOOL)shouldPromptForDisable
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", -[AssistantController _isVoiceTriggerEnabled](self, "_isVoiceTriggerEnabled"));
  int v3 = [v2 intValue];
  char v4 = objc_msgSend(NSNumber, "numberWithBool:", +[AssistantUtilities isHardwareButtonTrigger](AssistantUtilities, "isHardwareButtonTrigger"));
  int v5 = [v4 intValue] + v3;

  id v6 = +[GMEligibilityProvider shared];
  int v7 = [v6 activeEnabled];

  if (v7)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithBool:", +[AssistantUtilities isQuickTypeGestureEnabled](AssistantUtilities, "isQuickTypeGestureEnabled"));
    v5 += [v8 intValue];
  }
  return v5 == 1;
}

- (void)setHardwareButtonTrigger:(id)a3 forSpecifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  int v7 = [MEMORY[0x263F285A0] sharedPreferences];
  int v8 = [v7 assistantIsEnabled];

  int v9 = [v11 BOOLValue];
  if (v8)
  {
    if (!v9 && [(AssistantController *)self shouldPromptForDisable])
    {
      objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, a4);
      uint64_t v10 = MEMORY[0x263EFFA80];
      goto LABEL_8;
    }
  }
  else if (v9)
  {
    objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, a4);
    uint64_t v10 = MEMORY[0x263EFFA88];
LABEL_8:
    [(AssistantController *)self _setAssistantEnabled:v10 forSpecifier:v6 presentingViewController:self actionHandler:0];
    goto LABEL_10;
  }
  _AXSSetHomeButtonAssistant();
LABEL_10:
  +[AssistantMetrics didToggle:on:](AssistantMetrics, "didToggle:on:", @"HardwareButton", [v11 BOOLValue]);
}

- (id)typeToSiriTrigger:(id)a3
{
  int v3 = NSNumber;
  BOOL v4 = +[AssistantUtilities isQuickTypeGestureEnabled];

  return (id)[v3 numberWithBool:v4];
}

- (void)setTypeToSiriTrigger:(id)a3 forSpecifier:(id)a4
{
  id v13 = a4;
  uint64_t v7 = [a3 BOOLValue];
  int v8 = [MEMORY[0x263F285A0] sharedPreferences];
  int v9 = [v8 assistantIsEnabled];
  char v10 = v9;
  int v11 = v9 ^ 1;

  if (v7)
  {
    if ((v10 & 1) == 0)
    {
LABEL_3:
      objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, a4);
      uint64_t v12 = [NSNumber numberWithBool:v11 & v7];
      [(AssistantController *)self _setAssistantEnabled:v12 forSpecifier:v13 presentingViewController:self actionHandler:0];

      goto LABEL_6;
    }
  }
  else if (([(AssistantController *)self shouldPromptForDisable] | v11))
  {
    goto LABEL_3;
  }
  +[AssistantUtilities setQuickTypeGestureEnabled:v7];
LABEL_6:
  +[AssistantMetrics didToggle:@"QuickType" on:v7];
}

- (void)continueSetup
{
  int v3 = [MEMORY[0x263F85AF0] sharedPreferences];
  [v3 setVoiceTriggerEnabled:1];

  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __36__AssistantController_continueSetup__block_invoke;
  int v8 = &unk_26457CF60;
  objc_copyWeak(&v9, &location);
  [(AssistantController *)self dismissViewControllerAnimated:1 completion:&v5];
  [(AssistantController *)self _runVoiceTriggerEnablementCompletionIfApplicable];
  if ([(AssistantController *)self _isCurrentSpecifierVoiceActivation]) {
    _AXSSetHomeButtonAssistant();
  }
  currentSiriActivationSpecifier = self->_currentSiriActivationSpecifier;
  self->_currentSiriActivationSpecifier = 0;

  +[AssistantMetrics didStartEnrollment:1];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __36__AssistantController_continueSetup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v3 = WeakRetained;
    [WeakRetained _runEnablementFlowDismissalHandlersIfApplicable];
    uint64_t v2 = (void *)v3[191];
    v3[191] = 0;

    id WeakRetained = v3;
  }
}

- (void)cancelSetup:(id)a3
{
  id v4 = a3;
  [(VTUIEnrollTrainingViewController *)self->_enrollmentController cancelTraining];
  if ([(AssistantController *)self _isCurrentSpecifierVoiceActivation])
  {
    [(AssistantController *)self setAssistantEnabled:0];
    currentSiriActivationSpecifier = self->_currentSiriActivationSpecifier;
    self->_currentSiriActivationSpecifier = 0;
  }
  [(AssistantController *)self _runVoiceTriggerEnablementCompletionIfApplicable];
  +[AssistantMetrics didStartEnrollment:0];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__AssistantController_cancelSetup___block_invoke;
  v6[3] = &unk_26457CF60;
  objc_copyWeak(&v7, &location);
  [(AssistantController *)self dismissViewControllerAnimated:1 completion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __35__AssistantController_cancelSetup___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v3 = WeakRetained;
    [WeakRetained _runEnablementFlowDismissalHandlersIfApplicable];
    uint64_t v2 = (void *)v3[191];
    v3[191] = 0;

    id WeakRetained = v3;
  }
}

- (void)skipSetup
{
}

- (void)showLearnMore
{
}

- (void)_reloadSiriInCallSpecifier
{
  if (+[AssistantSiriInCallController isSettingSupported])
  {
    [(AssistantController *)self _insertSiriInCallSpecifier];
  }
  else
  {
    [(AssistantController *)self _removeSiriInCallSpecifier];
  }
}

- (void)_removeSiriInCallSpecifier
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (self->_siriInCallSpecifier && -[AssistantController containsSpecifier:](self, "containsSpecifier:"))
  {
    int v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      uint64_t v5 = "-[AssistantController _removeSiriInCallSpecifier]";
      _os_log_impl(&dword_220C23000, v3, OS_LOG_TYPE_INFO, "%s Removing in-call setting", (uint8_t *)&v4, 0xCu);
    }
    [(AssistantController *)self removeSpecifier:self->_siriInCallSpecifier animated:1];
  }
}

- (void)_insertSiriInCallSpecifier
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (self->_siriInCallSpecifier && (-[AssistantController containsSpecifier:](self, "containsSpecifier:") & 1) == 0)
  {
    int v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      uint64_t v5 = "-[AssistantController _insertSiriInCallSpecifier]";
      _os_log_impl(&dword_220C23000, v3, OS_LOG_TYPE_INFO, "%s Inserting in-call setting", (uint8_t *)&v4, 0xCu);
    }
    [(AssistantController *)self insertSpecifier:self->_siriInCallSpecifier afterSpecifierID:@"VOICE_FEEDBACK_ID" animated:1];
  }
}

- (id)siriInCallEnabled:(id)a3
{
  BOOL v3 = +[AssistantSiriInCallController isSettingEnabled];
  int v4 = +[AssistantController bundle];
  uint64_t v5 = v4;
  if (v3) {
    uint64_t v6 = @"ON";
  }
  else {
    uint64_t v6 = @"OFF";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_26D2AB140 table:@"AssistantSettings"];

  return v7;
}

- (void)showMeCardPicker:(id)a3
{
  int v4 = (CNContactPickerViewController *)[objc_alloc(MEMORY[0x263EFEBE0]) initWithNibName:0 bundle:0];
  peoplePicker = self->_peoplePicker;
  self->_peoplePicker = v4;

  [(CNContactPickerViewController *)self->_peoplePicker setDelegate:self];
  uint64_t v6 = [MEMORY[0x263F82670] currentDevice];
  int v7 = objc_msgSend(v6, "sf_isiPad");

  if (v7)
  {
    int v8 = [(AssistantController *)self specifierForID:@"MY_INFO"];
    id v9 = [v8 propertyForKey:*MEMORY[0x263F602B0]];
    char v10 = v9;
    if (v9)
    {
      int v11 = [v9 detailTextLabel];
      [v11 bounds];
      double v13 = v12;
      CGFloat v15 = v14;
      double v17 = v16;
      CGFloat v19 = v18;

      v27.origin.x = v13;
      v27.origin.y = v15;
      v27.size.width = v17;
      v27.size.height = v19;
      double MidY = CGRectGetMidY(v27);
      [(CNContactPickerViewController *)self->_peoplePicker setModalPresentationStyle:7];
      BOOL v21 = [(CNContactPickerViewController *)self->_peoplePicker popoverPresentationController];
      int v22 = [v10 detailTextLabel];
      [v21 setSourceView:v22];

      uint64_t v23 = [(CNContactPickerViewController *)self->_peoplePicker popoverPresentationController];
      objc_msgSend(v23, "setSourceRect:", v13, MidY, v17, 1.0);

      uint64_t v24 = [(CNContactPickerViewController *)self->_peoplePicker popoverPresentationController];
      [v24 setPermittedArrowDirections:12];
    }
  }
  uint64_t v25 = self->_peoplePicker;

  [(AssistantController *)self presentViewController:v25 animated:1 completion:0];
}

- (id)meCard:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  BOOL v3 = +[AssistantController bundle];
  int v4 = [v3 localizedStringForKey:@"None" value:&stru_26D2AB140 table:@"AssistantSettings"];

  id v5 = objc_alloc_init(MEMORY[0x263EFEA58]);
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
    v14[0] = v6;
    int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    id v13 = 0;
    int v8 = objc_msgSend(v5, "_ios_meContactWithKeysToFetch:error:", v7, &v13);
    id v9 = v13;

    if (v8)
    {
      char v10 = objc_opt_new();
      [v10 setStyle:0];
      uint64_t v11 = [v10 stringFromContact:v8];

      int v4 = (void *)v11;
    }
  }

  return v4;
}

- (void)_makeMeDeviceDetermination
{
  objc_initWeak(&location, self);
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__AssistantController__makeMeDeviceDetermination__block_invoke;
  v3[3] = &unk_26457CF60;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__AssistantController__makeMeDeviceDetermination__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = [MEMORY[0x263F3BA80] sharedInstance];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __49__AssistantController__makeMeDeviceDetermination__block_invoke_2;
    v4[3] = &unk_26457D828;
    objc_copyWeak(&v5, v1);
    [v3 getActiveLocationSharingDevice:v4];

    objc_destroyWeak(&v5);
  }
}

void __49__AssistantController__makeMeDeviceDetermination__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      int v8 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        int v9 = 136315394;
        char v10 = "-[AssistantController _makeMeDeviceDetermination]_block_invoke_2";
        __int16 v11 = 2112;
        id v12 = v6;
        _os_log_impl(&dword_220C23000, v8, OS_LOG_TYPE_INFO, "%s #settings Failed to fetch active location sharing device: %@", (uint8_t *)&v9, 0x16u);
      }
      WeakRetained[1664] = 0;
    }
    else
    {
      WeakRetained[1664] = [v5 isThisDevice];
    }
  }
}

- (void)handleAssetStatusUpdated
{
  if ((AFAssistantRestricted() & 1) == 0)
  {
    BOOL v3 = [(UAFAssetUtilities *)self->_assetUtils currentAssetStatus];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__AssistantController_handleAssetStatusUpdated__block_invoke;
    v5[3] = &unk_26457D148;
    void v5[4] = self;
    id v6 = v3;
    id v4 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

void __47__AssistantController_handleAssetStatusUpdated__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) specifiers];
  id v3 = [v2 specifierForID:@"SIRI_REQUESTS_GROUP"];

  [*(id *)(a1 + 32) _updateSiriFooterGroup:v3 withStatus:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) reloadSpecifier:v3 animated:0];
}

- (void)siriUODAvailabilityDidChange:(BOOL)a3
{
  if (a3) {
    [(AssistantController *)self handleAssetStatusUpdated];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AssistantController;
  id v6 = a4;
  [(AssistantController *)&v8 tableView:a3 didSelectRowAtIndexPath:v6];
  -[AssistantController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v8.receiver, v8.super_class);
  int v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();

  if (v7 == self->_voiceSpecifier) {
    ADClientAddValueForScalarKey();
  }
}

- (void)contactPickerDidCancel:(id)a3
{
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  if (a4)
  {
    contactStore = self->_contactStore;
    uint64_t v6 = 0;
    [(CNContactStore *)contactStore setMeContact:a4 error:&v6];
    [(AssistantController *)self reloadSpecifierID:@"MY_INFO" animated:0];
  }
  [(AssistantController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_presentSiriDataSharingOptInViewController
{
  OUTLINED_FUNCTION_0_0(&dword_220C23000, a1, a3, "%s #siriDataSharingOptIn: Nil VC returned by VTUISiriDataSharingOptInPresenter.", a5, a6, a7, a8, 2u);
}

- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  siriDataSharingOptInViewController = self->_siriDataSharingOptInViewController;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__AssistantController_siriDataSharingOptInRequestsDismissalFromPresenter___block_invoke;
  v6[3] = &unk_26457CF60;
  objc_copyWeak(&v7, &location);
  [(UIViewController *)siriDataSharingOptInViewController dismissViewControllerAnimated:1 completion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __74__AssistantController_siriDataSharingOptInRequestsDismissalFromPresenter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)WeakRetained[193];
    WeakRetained[193] = 0;
    id v4 = WeakRetained;

    id v3 = (void *)v4[192];
    v4[192] = 0;

    [v4 _runEnablementFlowDismissalHandlersIfApplicable];
    id WeakRetained = v4;
  }
}

- (void)showAssistantHistoryViewController:(id)a3
{
  id v5 = objc_alloc_init(AssistantHistoryViewController);
  [(AssistantHistoryViewController *)v5 setDelegate:self];
  id v4 = [(AssistantController *)self navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (void)deleteHistorySuccessfulFromViewController:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__AssistantController_deleteHistorySuccessfulFromViewController___block_invoke;
  v3[3] = &unk_26457CF60;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __65__AssistantController_deleteHistorySuccessfulFromViewController___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained navigationController];
    id v4 = (id)[v3 popViewControllerAnimated:1];

    if (+[AssistantUtilities isRpiOnDeviceDeletionEnabled])
    {
      id v5 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        int v15 = 136315138;
        double v16 = "-[AssistantController deleteHistorySuccessfulFromViewController:]_block_invoke";
        _os_log_impl(&dword_220C23000, v5, OS_LOG_TYPE_INFO, "%s #RPI on-device Siri History Deletion Request successful. Skipping showing alert.", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      uint64_t v6 = +[AssistantController bundle];
      id v7 = [v6 localizedStringForKey:@"DELETE_SIRI_HISTORY_ALERT_SUCCESS_TITLE" value:&stru_26D2AB140 table:@"AssistantSettings"];

      objc_super v8 = +[AssistantController bundle];
      int v9 = [v8 localizedStringForKey:@"DELETE_SIRI_HISTORY_ALERT_SUCCESS_MESSAGE" value:&stru_26D2AB140 table:@"AssistantSettings"];

      char v10 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v9 preferredStyle:1];
      __int16 v11 = (void *)MEMORY[0x263F82400];
      id v12 = +[AssistantController bundle];
      uint64_t v13 = [v12 localizedStringForKey:@"DELETE_SIRI_HISTORY_ALERT_DISMISS" value:&stru_26D2AB140 table:@"AssistantSettings"];
      double v14 = [v11 actionWithTitle:v13 style:0 handler:0];

      [v10 addAction:v14];
      [v10 setPreferredAction:v14];
      [v2 presentViewController:v10 animated:1 completion:0];
    }
  }
}

- (void)setVoiceActivation:(id)a3 forSpecifier:(id)a4 withTrainingCompletionIfNecessary:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  int v9 = _Block_copy(a5);
  id voiceTriggerEnablementCompletion = self->_voiceTriggerEnablementCompletion;
  self->_id voiceTriggerEnablementCompletion = v9;

  id v11 = v8;
  id v12 = [v11 name];
  if ([v12 isEqualToString:@"ACTIVATION_CONFIRMATION"])
  {
  }
  else
  {
    uint64_t v13 = [v11 name];
    int v14 = [v13 isEqualToString:@"BUDDY_FLOW_CONFIRMATION"];

    int v15 = (PSSpecifier *)v11;
    if (!v14) {
      goto LABEL_5;
    }
  }
  int v15 = self->_voiceActivationSettingsSpecifier;

LABEL_5:
  [(AssistantController *)self setVoiceTrigger:v16 forSpecifier:v15 transitionWithNavControllerIfNecessary:0];
}

- (void)_setAssistantEnabled:(id)a3 forSpecifier:(id)a4
{
}

- (void)_runVoiceTriggerEnablementCompletionIfApplicable
{
  id voiceTriggerEnablementCompletion = (void (**)(id, SEL))self->_voiceTriggerEnablementCompletion;
  if (voiceTriggerEnablementCompletion)
  {
    voiceTriggerEnablementCompletion[2](voiceTriggerEnablementCompletion, a2);
    id v4 = self->_voiceTriggerEnablementCompletion;
    self->_id voiceTriggerEnablementCompletion = 0;
  }
}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4
{
  voiceSelectionCompletion = (void (**)(id, id))self->_voiceSelectionCompletion;
  if (voiceSelectionCompletion) {
    voiceSelectionCompletion[2](voiceSelectionCompletion, a4);
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = [a3 presentedViewController];
  enablementFlowNavigationController = self->_enablementFlowNavigationController;

  if (v4 == enablementFlowNavigationController)
  {
    [(AssistantController *)self _runEnablementFlowDismissalHandlersIfApplicable];
  }
}

- (void)_voiceSelectionCancelled
{
  enablementFlowNavigationController = self->_enablementFlowNavigationController;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__AssistantController__voiceSelectionCancelled__block_invoke;
  v3[3] = &unk_26457CF88;
  void v3[4] = self;
  [(PSRootController *)enablementFlowNavigationController dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __47__AssistantController__voiceSelectionCancelled__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runEnablementFlowDismissalHandlersIfApplicable];
}

- (void)_runEnablementFlowDismissalHandlersIfApplicable
{
  voiceSelectionFlowDismissalHandler = (void (**)(id, SEL))self->_voiceSelectionFlowDismissalHandler;
  if (voiceSelectionFlowDismissalHandler)
  {
    voiceSelectionFlowDismissalHandler[2](voiceSelectionFlowDismissalHandler, a2);
    id v4 = self->_voiceSelectionFlowDismissalHandler;
    self->_voiceSelectionFlowDismissalHandler = 0;
  }
}

- (void)registerUndoActionWithKey:(id)a3 urlString:(id)a4 undoAction:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x263F08DB0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  uint64_t v13 = [MEMORY[0x263EFF960] currentLocale];
  int v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v15 = [v14 bundleURL];
  id v17 = (id)[v12 initWithKey:v11 table:@"AssistantSettings" locale:v13 bundleURL:v15];

  id v16 = [NSURL URLWithString:v10];

  [(AssistantController *)self pe_registerUndoActionName:v17 associatedDeepLink:v16 undoAction:v9];
}

- (void)_updateSpecifiersForSettingsTip
{
  id v3 = +[GMEligibilityProvider shared];
  int v4 = [v3 deviceSupported];

  if (v4)
  {
    id v5 = +[TipsManager shared];
    int v6 = [v5 shouldShowTip];

    if (v6)
    {
      [(AssistantController *)self _insertTipSpecifiers];
    }
    else
    {
      [(AssistantController *)self _removeTipSpecifiers];
    }
  }
}

- (void)_removeTipSpecifiers
{
  if (self->_settingsTipSpecifier
    && -[AssistantController containsSpecifier:](self, "containsSpecifier:"))
  {
    [(AssistantController *)self removeSpecifier:self->_settingsTipSpecifier animated:1];
  }
  if (self->_settingsTipGroupSpecifier
    && -[AssistantController containsSpecifier:](self, "containsSpecifier:"))
  {
    settingsTipGroupSpecifier = self->_settingsTipGroupSpecifier;
    [(AssistantController *)self removeSpecifier:settingsTipGroupSpecifier animated:1];
  }
}

- (void)_insertTipSpecifiers
{
  if (self->_settingsTipGroupSpecifier
    && (-[AssistantController containsSpecifier:](self, "containsSpecifier:") & 1) == 0)
  {
    [(AssistantController *)self insertSpecifier:self->_settingsTipGroupSpecifier atEndOfGroup:0 animated:1];
  }
  if (self->_settingsTipSpecifier && (-[AssistantController containsSpecifier:](self, "containsSpecifier:") & 1) == 0)
  {
    settingsTipSpecifier = self->_settingsTipSpecifier;
    [(AssistantController *)self insertSpecifier:settingsTipSpecifier afterSpecifierID:@"ASSISTANT_TIP_GROUP" animated:1];
  }
}

- (SUICAssistantVoiceSettingsConnection)settingsConnection
{
  return self->_settingsConnection;
}

- (BOOL)selectedLanguageWantsMultilingualEnabled
{
  return self->_selectedLanguageWantsMultilingualEnabled;
}

- (void)setSelectedLanguageWantsMultilingualEnabled:(BOOL)a3
{
  self->_selectedLanguageWantsMultilingualEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedDeeplinkResource, 0);
  objc_storeStrong((id *)&self->_gmAnalyticsProvider, 0);
  objc_storeStrong((id *)&self->_gmSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_gmFooterUtility, 0);
  objc_storeStrong((id *)&self->_languagesInHome, 0);
  objc_storeStrong((id *)&self->_assetUtils, 0);
  objc_storeStrong(&self->_voiceSelectionFlowDismissalHandler, 0);
  objc_storeStrong(&self->_voiceSelectionCompletion, 0);
  objc_storeStrong((id *)&self->_enablementFlowNavigationController, 0);
  objc_storeStrong((id *)&self->_enablementConfiguration, 0);
  objc_storeStrong((id *)&self->_enablementConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsFromAppleAllowNotificationsController, 0);
  objc_storeStrong((id *)&self->_passcodeService, 0);
  objc_storeStrong((id *)&self->_AFSettingsConnection, 0);
  objc_storeStrong((id *)&self->_allAppsSpecifiers, 0);
  objc_storeStrong((id *)&self->_installedBundleIDs, 0);
  objc_storeStrong(&self->_voiceTriggerEnablementCompletion, 0);
  objc_storeStrong((id *)&self->_siriDataSharingOptInViewController, 0);
  objc_storeStrong((id *)&self->_siriDataSharingPresenter, 0);
  objc_storeStrong((id *)&self->_enrollmentController, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightDomains, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightBundles, 0);
  objc_storeStrong((id *)&self->_peoplePicker, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_settingsTipSpecifier, 0);
  objc_storeStrong((id *)&self->_settingsTipGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_siriInCallSpecifier, 0);
  objc_storeStrong((id *)&self->_lockScreenSpecifier, 0);
  objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceActivationSettingsSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceActivationSpecifier, 0);
  objc_storeStrong((id *)&self->_announceMessagesSpecifier, 0);
  objc_storeStrong((id *)&self->_languageSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceSpecifier, 0);
  objc_storeStrong((id *)&self->_pendingLanguage, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);

  objc_storeStrong((id *)&self->_assistantSettings, 0);
}

- (void)openStorageManagement:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 description];
  [v4 UTF8String];
  OUTLINED_FUNCTION_4(&dword_220C23000, v5, v6, "%s %s", v7, v8, v9, v10, 2u);
}

void __58__AssistantController__refreshAvailableLanguagesInTheHome__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220C23000, v0, v1, "%s #settings Error retrieving available languages in the Home: %@", v2, v3, v4, v5, 2u);
}

void __45__AssistantController__fetchGMWaitListStatus__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_220C23000, v5, v6, "%s error fetching ADM waitlist status: %@", v7, v8, v9, v10, 2u);
}

void __45__AssistantController__fetchGMWaitListStatus__block_invoke_212_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateSiriFooterGroup:(uint64_t)a3 withStatus:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)watchSupportsSiriLanguageCode:.cold.1()
{
  os_log_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertySystemName(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantController.m", 135, @"%s", dlerror());

  __break(1u);
}

- (void)setAssistantEnabled:.cold.1()
{
  os_log_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getBYFlowSkipIdentifierSiri(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantController.m", 144, @"%s", dlerror());

  __break(1u);
}

void __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_220C23000, a1, a3, "%s #siriDataSharingOptIn: Nil VC returned by VTUISiriDataSharingOptInPresenter.", a5, a6, a7, a8, 2u);
}

void __91__AssistantController__createVoiceSelectionCompletionForSpecifier_recognitionLanguageCode___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)confirmationSpecifierWillDisableHeySiri:disableMultiUser:disableSpokenFeedbackOnWatch:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_220C23000, v0, v1, "%s Failed to find display string for pending language: %@", v2, v3, v4, v5, 2u);
}

void __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__AssistantController__setAssistantLanguageWatchMismatchConfirmed___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_220C23000, v0, v1, "%s Error fetching supported multi user language codes. %@", v2, v3, v4, v5, 2u);
}

- (void)handleURL:(os_log_t)log withCompletion:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[AssistantController handleURL:withCompletion:]";
  _os_log_debug_impl(&dword_220C23000, log, OS_LOG_TYPE_DEBUG, "%s Navigation Controller is not present, caching deeplink dict for delayed push.", (uint8_t *)&v1, 0xCu);
}

void __51__AssistantController_loadAppStorePageForBundleId___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __51__AssistantController_loadAppStorePageForBundleId___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __51__AssistantController_loadAppStorePageForBundleId___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220C23000, v0, v1, "%s Error performing AMS Lookup: %@", v2, v3, v4, v5, 2u);
}

@end