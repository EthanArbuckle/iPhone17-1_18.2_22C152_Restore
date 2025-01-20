@interface AssistantOptInController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)setAssistantEnabled:(BOOL)a3 settingsManager:(id)a4;
+ (void)skippedByCloudConfig;
- (BFFFlowItemDelegate)delegate;
- (BFFSettingsManager)settingsManager;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)didOfferVoiceTrigger;
- (BYFlowSkipController)flowSkipController;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPreferencesController)buddyPreferences;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyBackgroundViewController)buddyBackgroundViewController;
- (VTUIEnrollTrainingViewController)enrollmentController;
- (id)viewController;
- (void)_recordAnalyticsEvent;
- (void)_removeSiriPanesFromNavHierarchy;
- (void)continueSetup;
- (void)controllerWasPopped;
- (void)didCompleteOrSkipVoiceTraining;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)selectedVoice:(id)a3 recognitionLanguageCode:(id)a4;
- (void)setBuddyBackgroundViewController:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidOfferVoiceTrigger:(BOOL)a3;
- (void)setEnrollmentController:(id)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)showLearnMore;
- (void)skipSetup;
- (void)willBeginVoiceTraining;
@end

@implementation AssistantOptInController

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupSiri;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

+ (void)skippedByCloudConfig
{
  id v2 = [sub_1000D2F1C() sharedPreferences:a2, a1];
  [v2 setDictationIsEnabled:0];

  id v3 = [sub_1000D2F1C() sharedPreferences];
  [v3 synchronize];
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_1000D3144;
  v8 = &unk_1002B0CD0;
  v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)controllerWasPopped
{
  [(AssistantOptInController *)self didCompleteOrSkipVoiceTraining];
  id v2 = [(AssistantOptInController *)self buddyPreferences];
  [(BYPreferencesController *)v2 removeObjectForKey:BYBuddyAssistantPresentedKey];
}

- (id)viewController
{
  id v2 = [(AssistantOptInController *)self enrollmentController];
  BOOL v3 = v2 == 0;

  if (v3)
  {
    id v4 = [objc_alloc((Class)sub_1000D3FC4()) init:0];
    [(AssistantOptInController *)self setEnrollmentController:v4];

    int v5 = [(AssistantOptInController *)self enrollmentController];
    [(VTUIEnrollTrainingViewController *)v5 setDelegate:self];
  }
  return [(AssistantOptInController *)self enrollmentController];
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (void)_removeSiriPanesFromNavHierarchy
{
  v14 = self;
  v13[1] = (id)a2;
  id v2 = [(AssistantOptInController *)self enrollmentController];
  v13[0] = [(VTUIEnrollTrainingViewController *)v2 navigationController];

  id v3 = [v13[0] viewControllers];
  id v4 = [(AssistantOptInController *)v14 enrollmentController];
  int v5 = [v3 indexOfObject:v4];

  v12 = v5;
  id v6 = [v13[0] viewControllers];
  id v7 = v5;
  id v8 = [v13[0] viewControllers];
  id v16 = v7;
  v15 = (char *)((unsigned char *)[v8 count] - v12);
  id v17 = v7;
  v18 = v15;
  v9 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v7, v15);
  id location = [v6 objectsAtIndexes:v9];

  id v10 = [(AssistantOptInController *)v14 delegate];
  [(BFFFlowItemDelegate *)v10 removeViewControllersOnNextPush:location];

  objc_storeStrong(&location, 0);
  objc_storeStrong(v13, 0);
}

+ (void)setAssistantEnabled:(BOOL)a3 settingsManager:(id)a4
{
  id v8 = a1;
  SEL v7 = a2;
  BOOL v6 = a3;
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  id v4 = [sub_1000D2F1C() sharedPreferences];
  [v4 setAssistantIsEnabled:v6];

  [v5 setAssistantEnabled:v6];
  objc_storeStrong(&v5, 0);
}

- (void)_recordAnalyticsEvent
{
  id v2 = [sub_1000D2F1C() sharedPreferences];
  unsigned __int8 v3 = [v2 assistantIsEnabled];

  id v4 = [(AssistantOptInController *)self paneFeatureAnalyticsManager];
  id v5 = +[NSNumber numberWithBool:v3 & 1];
  [(BYPaneFeatureAnalyticsManager *)v4 recordActionWithValue:v5 forFeature:7];

  id v6 = [sub_1000D2F1C() sharedPreferences];
  id v7 = [v6 siriDataSharingOptInStatus];

  switch((unint64_t)v7)
  {
    case 0uLL:
    case 3uLL:
      id v10 = [(AssistantOptInController *)self paneFeatureAnalyticsManager];
      [(BYPaneFeatureAnalyticsManager *)v10 clearActionForFeature:8];

      break;
    case 1uLL:
      id v8 = [(AssistantOptInController *)self paneFeatureAnalyticsManager];
      [(BYPaneFeatureAnalyticsManager *)v8 recordActionWithValue:&__kCFBooleanTrue forFeature:8];

      break;
    case 2uLL:
      v9 = [(AssistantOptInController *)self paneFeatureAnalyticsManager];
      [(BYPaneFeatureAnalyticsManager *)v9 recordActionWithValue:&__kCFBooleanFalse forFeature:8];

      break;
    default:
      return;
  }
}

- (void)setBuddyBackgroundViewController:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_buddyBackgroundViewController, location[0]);
  objc_storeStrong(location, 0);
}

- (void)continueSetup
{
  v22 = self;
  SEL v21 = a2;
  id v2 = [sub_1000D2F1C() sharedPreferences];
  unsigned __int8 v3 = [v2 assistantIsEnabled];

  char v20 = v3 & 1;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004F3FC((uint64_t)buf, v20 & 1, v22->_didOfferVoiceTrigger);
    _os_log_impl((void *)&_mh_execute_header, oslog, v18, "Siri setup success, enabled = %d, offered PHS = %d", buf, 0xEu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v4 = [(AssistantOptInController *)v22 buddyPreferences];
  [(BYPreferencesController *)v4 setObject:&__kCFBooleanTrue forKey:BYBuddyAssistantPresentedKey];

  if (v22->_didOfferVoiceTrigger)
  {
    id v5 = [(AssistantOptInController *)v22 buddyPreferences];
    [(BYPreferencesController *)v5 setObject:&__kCFBooleanTrue forKey:BYBuddyAssistantPHSOfferedKey];
  }
  id v6 = [(AssistantOptInController *)v22 settingsManager];
  [(BFFSettingsManager *)v6 setAssistantEnabled:v20 & 1];

  id v7 = [(AssistantOptInController *)v22 enrollmentController];
  unsigned __int8 v8 = [(VTUIEnrollTrainingViewController *)v7 didShowVoiceTriggerPrompt];

  if (v8)
  {
    os_log_t v17 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v17;
      os_log_type_t v10 = v16;
      sub_10004B24C(v15);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Storing voice trigger enabled in settings manager, because voice trigger prompt was shown", (uint8_t *)v15, 2u);
    }
    objc_storeStrong((id *)&v17, 0);
    v11 = [(AssistantOptInController *)v22 settingsManager];
    [(BFFSettingsManager *)v11 setAssistantVoiceTriggerEnabled:1];
  }
  if (+[BYSiriUtilities deviceSupportsSystemAssistantExperience](BYSiriUtilities, "deviceSupportsSystemAssistantExperience"))+[BYSiriUtilities intelligenceVoiceSelectionDidComplete]; {
  [(AssistantOptInController *)v22 _removeSiriPanesFromNavHierarchy];
  }
  [(AssistantOptInController *)v22 _recordAnalyticsEvent];
  v12 = [(AssistantOptInController *)v22 delegate];
  [(BFFFlowItemDelegate *)v12 flowItemDone:v22];

  v13 = [(AssistantOptInController *)v22 buddyPreferences];
  [(BYPreferencesController *)v13 setObject:&__kCFBooleanTrue forKey:@"SiriOnBoardingPresented"];

  v14 = [(AssistantOptInController *)v22 flowSkipController];
  [(BYFlowSkipController *)v14 didCompleteFlow:BYFlowSkipIdentifierSiri];
}

- (void)skipSetup
{
  v28 = self;
  SEL v27 = a2;
  id v2 = [sub_1000D2F1C() sharedPreferences];
  unsigned __int8 v3 = [v2 assistantIsEnabled];

  char v26 = v3 & 1;
  id v4 = [sub_1000D38B8() sharedPreferences];
  unsigned __int8 v5 = [v4 voiceTriggerEnabled];

  char v25 = v5 & 1;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004F3FC((uint64_t)buf, v26 & 1, v25 & 1);
    _os_log_impl((void *)&_mh_execute_header, oslog, v23, "User chose to skip Siri setup: enabled %d voice trigger enabled %d", buf, 0xEu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(AssistantOptInController *)v28 _removeSiriPanesFromNavHierarchy];
  [(AssistantOptInController *)v28 _recordAnalyticsEvent];
  id v6 = [(AssistantOptInController *)v28 settingsManager];
  [(BFFSettingsManager *)v6 setAssistantEnabled:v26 & 1];

  id v7 = [sub_1000D38B8() sharedPreferences];
  unsigned __int8 v8 = [v7 hasExplicitlySetVoiceTriggerEnabled];

  if (v8)
  {
    os_log_t v22 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      sub_10005A060(v30, v25 & 1);
      _os_log_impl((void *)&_mh_execute_header, v22, v21, "Storing explicitly set voice trigger enabled %d in settings manager", v30, 8u);
    }
    objc_storeStrong((id *)&v22, 0);
    v9 = [(AssistantOptInController *)v28 settingsManager];
    [(BFFSettingsManager *)v9 setAssistantVoiceTriggerEnabled:v25 & 1];
  }
  else
  {
    os_log_type_t v10 = [(AssistantOptInController *)v28 settingsManager];
    char v11 = [(BFFSettingsManager *)v10 hasAssistantVoiceTriggerEnabledValue] ^ 1;

    if (v11)
    {
      os_log_t v20 = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        sub_10005A060(v29, v25 & 1);
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Settings manager lacks voice trigger enabled value. Storing %d", v29, 8u);
      }
      objc_storeStrong((id *)&v20, 0);
      v12 = [(AssistantOptInController *)v28 settingsManager];
      [(BFFSettingsManager *)v12 setAssistantVoiceTriggerEnabled:v25 & 1];
    }
  }
  v13 = [(AssistantOptInController *)v28 delegate];
  [(BFFFlowItemDelegate *)v13 flowItemDone:v28];

  if ((BYSetupAssistantHasCompletedInitialRun() & 1) == 0)
  {
    id v14 = [sub_1000D2F1C() sharedPreferences];
    [v14 setDictationIsEnabled:0];

    id v15 = [sub_1000D2F1C() sharedPreferences];
    [v15 synchronize];
  }
  os_log_type_t v16 = [(AssistantOptInController *)v28 buddyPreferences];
  [(BYPreferencesController *)v16 setObject:&__kCFBooleanTrue forKey:BYBuddyAssistantPresentedKey];

  os_log_t v17 = [(AssistantOptInController *)v28 buddyPreferences];
  [(BYPreferencesController *)v17 setObject:&__kCFBooleanTrue forKey:BYBuddyAssistantPHSOfferedKey];

  os_log_type_t v18 = [(AssistantOptInController *)v28 buddyPreferences];
  [(BYPreferencesController *)v18 setObject:&__kCFBooleanTrue forKey:@"SiriOnBoardingPresented"];

  v19 = [(AssistantOptInController *)v28 flowSkipController];
  [(BYFlowSkipController *)v19 didSkipFlow:BYFlowSkipIdentifierSiri];

  [(AssistantOptInController *)v28 didCompleteOrSkipVoiceTraining];
}

- (void)showLearnMore
{
  unsigned __int8 v3 = self;
  location[1] = (id)a2;
  location[0] = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:BYPrivacySiriIdentifier];
  [location[0] setPresentingViewController:v3->_enrollmentController];
  [location[0] present];
  objc_storeStrong(location, 0);
}

- (void)selectedVoice:(id)a3 recognitionLanguageCode:(id)a4
{
  os_log_t v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  if (location[0])
  {
    id v17 = 0;
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, v15, "Received Siri Voice Selection %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id obj = v17;
    unsigned __int8 v5 = +[NSKeyedArchiver archivedDataWithRootObject:location[0] requiringSecureCoding:0 error:&obj];
    objc_storeStrong(&v17, obj);
    id v14 = v5;
    if (v17)
    {
      os_log_t v12 = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        char v10 = 0;
        char v8 = 0;
        if (_BYIsInternalInstall())
        {
          id v6 = (NSString *)v17;
        }
        else if (v17)
        {
          id v11 = [v17 domain];
          char v10 = 1;
          id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v11, [v17 code]);
          v9 = v6;
          char v8 = 1;
        }
        else
        {
          id v6 = 0;
        }
        sub_10004BB7C((uint64_t)v21, (uint64_t)v6);
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to encode Siri output voice: %{public}@", v21, 0xCu);
        if (v8) {

        }
        if (v10) {
      }
        }
      objc_storeStrong((id *)&v12, 0);
    }
    else
    {
      id v7 = [(AssistantOptInController *)v20 settingsManager];
      [(BFFSettingsManager *)v7 setAssistantOutputVoice:v14 languageCode:v18];
    }
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)willBeginVoiceTraining
{
  id v2 = [(AssistantOptInController *)self buddyBackgroundViewController];
  [(BuddyBackgroundViewController *)v2 setBuddyBackgroundFilterStyle:1];
}

- (void)didCompleteOrSkipVoiceTraining
{
  id v2 = [(AssistantOptInController *)self buddyBackgroundViewController];
  [(BuddyBackgroundViewController *)v2 setBuddyBackgroundFilterStyle:0];
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
}

- (BuddyBackgroundViewController)buddyBackgroundViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buddyBackgroundViewController);

  return (BuddyBackgroundViewController *)WeakRetained;
}

- (VTUIEnrollTrainingViewController)enrollmentController
{
  return self->_enrollmentController;
}

- (void)setEnrollmentController:(id)a3
{
}

- (BOOL)didOfferVoiceTrigger
{
  return self->_didOfferVoiceTrigger;
}

- (void)setDidOfferVoiceTrigger:(BOOL)a3
{
  self->_didOfferVoiceTrigger = a3;
}

- (void).cxx_destruct
{
}

@end