@interface SOSSettingsController
+ (NSString)tipSpecifierKey;
- (BOOL)_canLaunchDemoFlow;
- (CTStewieStateMonitor)stewieStateMonitor;
- (CoreTelephonyClient)coreTelephonyClient;
- (PSSpecifier)tipKitEntrySpecifier;
- (SOSSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)callWithHold:(id)a3;
- (id)callWithPresses:(id)a3;
- (id)contactNumberForContactSpecifier:(id)a3;
- (id)emergencySOSSoundEnabled:(id)a3;
- (id)getCrashDetectionEnabledForSpecifier:(id)a3;
- (id)getKappaThirdPartyAppNameForSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tipEntrySpecifier;
- (void)addStewieGroupIfSupportedAnimated:(BOOL)a3;
- (void)applicationWillEnterForeground;
- (void)dealloc;
- (void)emitNavigationEvent;
- (void)feedbackController:(id)a3 didCompleteWithFeedbackID:(id)a4;
- (void)feedbackController:(id)a3 didFailToAttachURL:(id)a4 error:(id)a5;
- (void)feedbackController:(id)a3 didFailToStartWithError:(id)a4;
- (void)feedbackController:(id)a3 didFailToSubmitFeedback:(id)a4;
- (void)feedbackControllerDidCancel:(id)a3;
- (void)handleSendingLocationChanged;
- (void)handleSosContactsChanged;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)initSharingLocationSpecifiers;
- (void)makeTipSpecifier;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openHealthApp:(id)a3;
- (void)openMessages:(id)a3;
- (void)openPrivacy;
- (void)openStewieLearnMore;
- (void)openTrialDialog;
- (void)presentConfirmationWithTitle:(id)a3 message:(id)a4 cancelTitle:(id)a5 cancelHandler:(id)a6 confirmTitle:(id)a7 confirmHandler:(id)a8;
- (void)presentStewieTryOutModeIfPossible;
- (void)refreshStewieAssetSpecifier:(BOOL)a3;
- (void)refreshTipSpecifier:(BOOL)a3;
- (void)reloadAlarmSoundAnimated:(BOOL)a3;
- (void)reloadEmergencyContactsAnimated:(BOOL)a3;
- (void)reloadHealthButtonLabelWithContacts:(BOOL)a3;
- (void)reloadKappaSpecifier;
- (void)reloadPrivacyFooterWithContacts:(BOOL)a3;
- (void)reloadStopSharingGroupAnimated:(BOOL)a3;
- (void)setCallWithHold:(id)a3 forSpecifier:(id)a4;
- (void)setCallWithPresses:(id)a3 forSpecifier:(id)a4;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setCrashDetectionEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setEmergencySOSSoundEnabled:(id)a3 forSpecifier:(id)a4;
- (void)showCrashDetectionFeedbackAssistantWithUUID:(id)a3;
- (void)showFeedbackAssistant;
- (void)showStopSharingConfirmation:(id)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)stateChanged:(id)a3;
- (void)stopSharingLocation:(id)a3;
- (void)submitSOSNotificationSettingsChangedMetric:(id)a3 withValue:(id)a4;
- (void)submitSOSNotificationTapMetric;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tipKitMakeTipSpecifier;
- (void)tipKitStartObservation;
- (void)tipKitStopObservation;
- (void)updateAutoCallSpecifierEnabled:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SOSSettingsController

- (void)makeTipSpecifier
{
}

- (id)tipEntrySpecifier
{
  return [(SOSSettingsController *)self tipKitEntrySpecifier];
}

- (void)refreshTipSpecifier:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = [(SOSSettingsController *)self tipEntrySpecifier];
  v5 = +[SOSSettingsController tipSpecifierKey];
  v6 = [v14 objectForKeyedSubscript:v5];

  unsigned int v7 = [(SOSSettingsController *)self _canLaunchDemoFlow];
  if (self->_stewieSupported) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  BOOL v9 = v8 != 1 || v6 == 0;
  if (v9
    || ([(SOSSettingsController *)self specifiers],
        v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v10 containsObject:v14],
        v10,
        (v11 & 1) != 0))
  {
    v12 = [(SOSSettingsController *)self specifiers];
    if ([v12 containsObject:v14])
    {
      if (v6) {
        char v13 = v8;
      }
      else {
        char v13 = 0;
      }

      if ((v13 & 1) == 0) {
        [(SOSSettingsController *)self removeSpecifier:v14 animated:v3];
      }
    }
    else
    {
    }
  }
  else
  {
    [(SOSSettingsController *)self insertSpecifier:v14 atIndex:0 animated:v3];
  }
}

- (SOSSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)SOSSettingsController;
  v4 = [(SOSSettingsController *)&v24 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (SOSContactsManager *)objc_alloc_init((Class)SOSContactsManager);
    contactsManager = v4->_contactsManager;
    v4->_contactsManager = v5;

    unsigned int v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    sosContactsNumbers = v4->_sosContactsNumbers;
    v4->_sosContactsNumbers = v7;

    BOOL v9 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:&_dispatch_main_q];
    coreTelephonyClient = v4->_coreTelephonyClient;
    v4->_coreTelephonyClient = v9;

    [(CoreTelephonyClient *)v4->_coreTelephonyClient setDelegate:v4];
    unsigned __int8 v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v4 selector:"handleSendingLocationChanged" name:@"SOSSendingLocationUpdateChangedNotification" object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v4 selector:"handleSosContactsChanged" name:@"SOSContactsChangedNotification" object:0];

    char v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v4 selector:"applicationWillEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)sub_4FA0, SOSKappaStateChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v15 = +[SOSUtilities _userSOSDefaults];
    sosDefaults = v4->_sosDefaults;
    v4->_sosDefaults = (NSUserDefaults *)v15;

    [(NSUserDefaults *)v4->_sosDefaults addObserver:v4 forKeyPath:@"SOSTriggerMechanismKey" options:0 context:0];
    [(NSUserDefaults *)v4->_sosDefaults addObserver:v4 forKeyPath:SOSCallWithSideButtonPressesKey options:0 context:0];
    [(NSUserDefaults *)v4->_sosDefaults addObserver:v4 forKeyPath:SOSCallWithVolumeLockHoldKey options:0 context:0];
    [(NSUserDefaults *)v4->_sosDefaults addObserver:v4 forKeyPath:SOSPlayAudioDuringCountdownKey options:0 context:0];
    v4->_stewieSupported = 0;
    v17 = (CTStewieStateMonitor *)[objc_alloc((Class)CTStewieStateMonitor) initWithDelegate:v4 queue:&_dispatch_main_q];
    stewieStateMonitor = v4->_stewieStateMonitor;
    v4->_stewieStateMonitor = v17;

    v19 = sub_9DE0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v4->_stewieStateMonitor;
      *(_DWORD *)buf = 138412290;
      v26 = v20;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Created Stewie state monitor: %@", buf, 0xCu);
    }

    [(CTStewieStateMonitor *)v4->_stewieStateMonitor start];
    v21 = sub_9DE0();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v4->_stewieStateMonitor;
      *(_DWORD *)buf = 138412290;
      v26 = v22;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Stewie state monitor has been started: %@", buf, 0xCu);
    }
  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SOSSettingsController;
  [(SOSSettingsController *)&v4 viewDidAppear:a3];
  [(SOSSettingsController *)self emitNavigationEvent];
}

- (void)emitNavigationEvent
{
  id v8 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.SOS"];
  id v3 = objc_alloc((Class)_NSLocalizedStringResource);
  objc_super v4 = +[NSLocale currentLocale];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 bundleURL];
  id v7 = [v3 initWithKey:@"Emergency SOS" table:0 locale:v4 bundleURL:v6];

  [(SOSSettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.emergency-sos" title:v7 localizedNavigationComponents:&__NSArray0__struct deepLink:v8];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(NSUserDefaults *)self->_sosDefaults removeObserver:self forKeyPath:@"SOSTriggerMechanismKey"];
  [(NSUserDefaults *)self->_sosDefaults removeObserver:self forKeyPath:SOSCallWithSideButtonPressesKey];
  [(NSUserDefaults *)self->_sosDefaults removeObserver:self forKeyPath:SOSCallWithVolumeLockHoldKey];
  [(NSUserDefaults *)self->_sosDefaults removeObserver:self forKeyPath:SOSPlayAudioDuringCountdownKey];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, SOSKappaStateChangedNotification, 0);
  v5.receiver = self;
  v5.super_class = (Class)SOSSettingsController;
  [(SOSSettingsController *)&v5 dealloc];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = SOSSettingsURLSourceKey;
  id v8 = a4;
  BOOL v9 = [v6 valueForKey:v7];
  v10 = v9;
  if (v9)
  {
    if ([v9 isEqualToString:SOSSettingsURLSourceAccCallNotification])
    {
      self->_openedViaAccCallNotification = 1;
      unsigned __int8 v11 = sub_9DE0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,opened via notification", buf, 2u);
      }

      [(SOSSettingsController *)self submitSOSNotificationTapMetric];
      [(SOSSettingsController *)self showFeedbackAssistant];
      goto LABEL_19;
    }
    if ([v10 isEqualToString:SOSSettingsURLSourceCrashDetectionFeedbackRequestNotification])
    {
      v12 = sub_9DE0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,opened via settings - CrashDetection", buf, 2u);
      }

      char v13 = [v6 valueForKey:SOSSettingsURLSourceCrashDetectionUUIDKey];
      id v14 = sub_9DE0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,FeedbackAssistant,%@", buf, 0xCu);
      }

      [(SOSSettingsController *)self showCrashDetectionFeedbackAssistantWithUUID:v13];
LABEL_18:

      goto LABEL_19;
    }
  }
  if (![v10 isEqualToString:SOSSettingsURLSourceSettingsResetFollowUp])
  {
    self->_openedViaAccCallNotification = 0;
    char v13 = sub_9DE0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,not opened via notification", buf, 2u);
    }
    goto LABEL_18;
  }
  uint64_t v15 = sub_9DE0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,opened via settings reset FollowUp", buf, 2u);
  }

  +[SOSUtilities setSettingsResetFollowUpState:3];
LABEL_19:
  v16.receiver = self;
  v16.super_class = (Class)SOSSettingsController;
  [(SOSSettingsController *)&v16 handleURL:v6 withCompletion:v8];
}

- (void)showCrashDetectionFeedbackAssistantWithUUID:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[OSASystemConfiguration sharedInstance];
  id v6 = [v5 targetAudience];

  uint64_t v7 = sub_9DE0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,showCrashDetectionFeedbackAssistant,BuildType:%@", (uint8_t *)&v13, 0xCu);
  }

  if (([v6 isEqualToString:@"Internal"] & 1) == 0
    && ([v6 isEqualToString:@"Seed"] & 1) == 0)
  {
    v12 = sub_9DE0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,showCrashDetectionFeedbackAssistant,not internal or seed user so don't show FA", (uint8_t *)&v13, 2u);
    }
    goto LABEL_9;
  }
  if (objc_opt_class())
  {
    id v8 = [_TtC11SOSSettings35SOSCrashDetectionFeedbackController alloc];
    BOOL v9 = +[SOSUtilities crashDetectionFeedbackAssistantLegalText];
    v10 = [(SOSCrashDetectionFeedbackController *)v8 initWithDelegate:self legalText:v9 uuid:v4];
    feedbackController = self->_feedbackController;
    self->_feedbackController = v10;

    v12 = [(SOSFeedbackController *)self->_feedbackController getFeedbackViewController];
    [(SOSSettingsController *)self presentViewController:v12 animated:1 completion:&stru_18990];
LABEL_9:
  }
}

- (void)showFeedbackAssistant
{
  id v3 = +[OSASystemConfiguration sharedInstance];
  id v4 = [v3 targetAudience];

  objc_super v5 = sub_9DE0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,showFeedbackAssistant,BuildType:%@", (uint8_t *)&v11, 0xCu);
  }

  if (([v4 isEqualToString:@"Internal"] & 1) == 0
    && ([v4 isEqualToString:@"Seed"] & 1) == 0)
  {
    v10 = sub_9DE0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,showFeedbackAssistant,not internal or seed user so don't show FA", (uint8_t *)&v11, 2u);
    }
    goto LABEL_9;
  }
  if (objc_opt_class())
  {
    id v6 = [_TtC11SOSSettings21SOSFeedbackController alloc];
    uint64_t v7 = +[SOSUtilities accidentalCallFeedbackAssistantLegalText];
    id v8 = [(SOSFeedbackController *)v6 initWithDelegate:self legalText:v7];
    feedbackController = self->_feedbackController;
    self->_feedbackController = v8;

    v10 = [(SOSFeedbackController *)self->_feedbackController getFeedbackViewController];
    [(SOSSettingsController *)self presentViewController:v10 animated:1 completion:&stru_189B0];
LABEL_9:
  }
}

- (void)feedbackController:(id)a3 didCompleteWithFeedbackID:(id)a4
{
  id v4 = a4;
  objc_super v5 = sub_9DE0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,feedbackController,completed with feedback ID,%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)feedbackController:(id)a3 didFailToStartWithError:(id)a4
{
  id v4 = a4;
  objc_super v5 = sub_9DE0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,feedbackController,failed to start with error,%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)feedbackControllerDidCancel:(id)a3
{
  id v3 = sub_9DE0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,feedbackController,user cancelled", v4, 2u);
  }
}

- (void)feedbackController:(id)a3 didFailToAttachURL:(id)a4 error:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = sub_9DE0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,feedbackController,failed to attach URL,%@,error,%@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)feedbackController:(id)a3 didFailToSubmitFeedback:(id)a4
{
  id v4 = a4;
  objc_super v5 = sub_9DE0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,feedbackController,failed to submit with error,%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)handleSendingLocationChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5DAC;
  block[3] = &unk_188D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)handleSosContactsChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5E2C;
  block[3] = &unk_188D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)applicationWillEnterForeground
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5EAC;
  block[3] = &unk_188D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)reloadKappaSpecifier
{
  id v3 = [(SOSSettingsController *)self getCrashDetectionEnabledForSpecifier:self->_kappaSpecifier];
  BOOL v4 = v3 != 0;

  kappaSpecifier = self->_kappaSpecifier;
  int v6 = +[NSNumber numberWithBool:v4];
  [(PSSpecifier *)kappaSpecifier setProperty:v6 forKey:PSValueKey];

  id v7 = self->_kappaSpecifier;

  [(SOSSettingsController *)self reloadSpecifier:v7 animated:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SOSSettingsController;
  [(SOSSettingsController *)&v5 viewWillAppear:a3];
  BOOL v4 = +[SOSUtilities getKappaThirdPartyDisplayNameForApp];

  if (!v4)
  {
    if ([(SOSSettingsController *)self containsSpecifier:self->_kappaThirdPartySpecifier])[(SOSSettingsController *)self removeSpecifier:self->_kappaThirdPartySpecifier]; {
    if ([(SOSSettingsController *)self containsSpecifier:self->_kappaThirdPartyGroupSpecifier])[(SOSSettingsController *)self removeSpecifier:self->_kappaThirdPartyGroupSpecifier];
    }
    [(SOSSettingsController *)self reload];
  }
  [(SOSSettingsController *)self tipKitStartObservation];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SOSSettingsController;
  [(SOSSettingsController *)&v4 viewWillDisappear:a3];
  [(SOSSettingsController *)self tipKitStopObservation];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = [(SOSSettingsController *)self loadSpecifiersFromPlistName:@"SOSSettings" target:self];
    int v6 = [v5 specifierForID:@"CALL_WITH_HOLD_GROUP"];
    callWithHoldGroupSpecifier = self->_callWithHoldGroupSpecifier;
    self->_callWithHoldGroupSpecifier = v6;

    id v8 = [v5 specifierForID:@"CALL_WITH_HOLD"];
    callWithHoldSpecifier = self->_callWithHoldSpecifier;
    self->_callWithHoldSpecifier = v8;

    id v10 = [v5 specifierForID:@"CALL_WITH_PRESSES_GROUP"];
    callWithPressesGroupSpecifier = self->_callWithPressesGroupSpecifier;
    self->_callWithPressesGroupSpecifier = v10;

    id v12 = [v5 specifierForID:@"CALL_WITH_PRESSES"];
    callWithPressesSpecifier = self->_callWithPressesSpecifier;
    self->_callWithPressesSpecifier = v12;

    id v14 = [v5 specifierForID:@"THREE_CLICKS"];
    threeClicksSpecifier = self->_threeClicksSpecifier;
    p_threeClicksSpecifier = (id *)&self->_threeClicksSpecifier;
    self->_threeClicksSpecifier = v14;

    objc_super v16 = [v5 specifierForID:@"FIVE_CLICKS"];
    fiveClicksSpecifier = self->_fiveClicksSpecifier;
    p_fiveClicksSpecifier = (id *)&self->_fiveClicksSpecifier;
    self->_fiveClicksSpecifier = v16;

    v18 = [v5 specifierForID:@"NUMBER_OF_CLICKS_GROUP"];
    clicksRadioGroup = self->_clicksRadioGroup;
    self->_clicksRadioGroup = v18;

    v20 = [v5 specifierForID:@"TRIGGER_ANIMATION_GROUP"];
    triggerAnimationGroup = self->_triggerAnimationGroup;
    self->_triggerAnimationGroup = v20;

    v22 = [v5 specifierForID:@"TRIGGER_ANIMATION"];
    triggerAnimationViewCell = self->_triggerAnimationViewCell;
    self->_triggerAnimationViewCell = v22;

    objc_super v24 = [v5 specifierForID:@"ALARM_SOUND_GROUP"];
    alarmSoundGroup = self->_alarmSoundGroup;
    self->_alarmSoundGroup = v24;

    if (!self->_alarmSoundGroup) {
      sub_F4A0();
    }
    v26 = [v5 specifierForID:@"ALARM_SOUND_SWITCH"];
    alarmSoundSwitch = self->_alarmSoundSwitch;
    self->_alarmSoundSwitch = v26;

    if (!self->_alarmSoundSwitch) {
      sub_F4CC();
    }
    v28 = [v5 specifierForID:@"EMERGENCY_CONTACTS"];
    emergencyContactsGroup = self->_emergencyContactsGroup;
    self->_emergencyContactsGroup = v28;

    if (!self->_emergencyContactsGroup) {
      sub_F4F8();
    }
    v30 = [v5 specifierForID:@"OPEN_HEALTH"];
    openHealthButton = self->_openHealthButton;
    self->_openHealthButton = v30;

    if (!self->_openHealthButton) {
      sub_F524();
    }
    uint64_t v97 = v3;
    if (+[SOSUtilities isStewieVisible])
    {
      v32 = +[PSSpecifier groupSpecifierWithID:@"STEWIE_ANIMATION_GROUP"];
      stewieAnimationGroup = self->_stewieAnimationGroup;
      self->_stewieAnimationGroup = v32;

      v34 = self->_stewieAnimationGroup;
      v35 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v35);
      [(PSSpecifier *)v34 setProperty:v36 forKey:PSFooterCellClassGroupKey];

      v37 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
      stewieAnimationViewCell = self->_stewieAnimationViewCell;
      self->_stewieAnimationViewCell = v37;

      v39 = self->_stewieAnimationViewCell;
      v111[0] = self->_stewieAnimationGroup;
      v111[1] = v39;
      v40 = +[NSArray arrayWithObjects:v111 count:2];
      objc_msgSend(v5, "ps_insertObjectsFromArray:afterObject:", v40, self->_openHealthButton);

      [(SOSSettingsController *)self makeTipSpecifier];
    }
    if (+[SOSUtilities isKappaDetectionSupportedOnPhone](SOSUtilities, "isKappaDetectionSupportedOnPhone")&& +[SOSUtilities isKappaVisible])
    {
      v41 = +[PSSpecifier groupSpecifierWithID:@"SOS_KAPPA_TITLE"];
      kappaGroupSpecifier = self->_kappaGroupSpecifier;
      self->_kappaGroupSpecifier = v41;

      v43 = +[SOSUtilities crashDetectionTitleDescription];
      [(PSSpecifier *)self->_kappaGroupSpecifier setName:v43];

      unsigned int v44 = +[SOSUtilities isKappaDetectionSupportedOnActiveWatch];
      v45 = self->_kappaGroupSpecifier;
      if (v44) {
        +[SOSUtilities crashDetectionPhoneWatchFooterDescription];
      }
      else {
      v46 = +[SOSUtilities crashDetectionPhoneFooterDesription];
      }
      [(PSSpecifier *)v45 setProperty:v46 forKey:PSFooterTextGroupKey];

      v47 = +[SOSUtilities crashDetectionSwitchDescription];
      v48 = +[PSSpecifier preferenceSpecifierNamed:v47 target:self set:"setCrashDetectionEnabled:forSpecifier:" get:"getCrashDetectionEnabledForSpecifier:" detail:0 cell:6 edit:0];
      kappaSpecifier = self->_kappaSpecifier;
      self->_kappaSpecifier = v48;

      [(PSSpecifier *)self->_kappaSpecifier setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
      v50 = self->_kappaSpecifier;
      v110[0] = self->_kappaGroupSpecifier;
      v110[1] = v50;
      v51 = +[NSArray arrayWithObjects:v110 count:2];
      objc_msgSend(v5, "ps_insertObjectsFromArray:afterObject:", v51, self->_alarmSoundSwitch);
    }
    v52 = +[SOSUtilities getKappaThirdPartyApp];

    if (v52)
    {
      v53 = +[PSSpecifier groupSpecifierWithID:@"SOS_KAPPA_THIRD_PARTY_TITLE"];
      kappaThirdPartyGroupSpecifier = self->_kappaThirdPartyGroupSpecifier;
      self->_kappaThirdPartyGroupSpecifier = v53;

      v55 = self->_kappaThirdPartyGroupSpecifier;
      v56 = +[SOSUtilities crashDetectionThirdPartyFooterDescription];
      uint64_t v57 = PSFooterTextGroupKey;
      [(PSSpecifier *)v55 setProperty:v56 forKey:PSFooterTextGroupKey];

      v58 = +[SOSUtilities crashDetectionThirdPartyCellTitle];
      v59 = +[PSSpecifier preferenceSpecifierNamed:v58 target:self set:0 get:"getKappaThirdPartyAppNameForSpecifier:" detail:objc_opt_class() cell:2 edit:0];
      kappaThirdPartySpecifier = self->_kappaThirdPartySpecifier;
      self->_kappaThirdPartySpecifier = v59;

      uint64_t v61 = PSAllowMultilineTitleKey;
      [(PSSpecifier *)self->_kappaThirdPartySpecifier setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
      uint64_t v62 = v57;
      v63 = self->_kappaThirdPartySpecifier;
      v109[0] = self->_kappaThirdPartyGroupSpecifier;
      v109[1] = v63;
      v64 = +[NSArray arrayWithObjects:v109 count:2];
      objc_msgSend(v5, "ps_insertObjectsFromArray:afterObject:", v64, self->_kappaSpecifier);
    }
    else
    {
      uint64_t v61 = PSAllowMultilineTitleKey;
      uint64_t v62 = PSFooterTextGroupKey;
    }
    [(PSSpecifier *)self->_triggerAnimationViewCell setProperty:objc_opt_class() forKey:PSCellClassKey];
    [(PSSpecifier *)self->_triggerAnimationViewCell setProperty:&off_19660 forKey:PSTableCellHeightKey];
    [(SOSSettingsController *)self initSharingLocationSpecifiers];
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = sub_6C34;
    v106[3] = &unk_189D8;
    id v65 = v5;
    id v107 = v65;
    v108 = self;
    v95 = objc_retainBlock(v106);
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = sub_6D48;
    v103[3] = &unk_189D8;
    id v66 = v65;
    id v104 = v66;
    v105 = self;
    v94 = objc_retainBlock(v103);
    v67 = self->_callWithHoldSpecifier;
    v68 = +[SOSUtilities callWithHoldTitleDescription];
    [(PSSpecifier *)v67 setName:v68];

    [(PSSpecifier *)self->_callWithHoldSpecifier setProperty:&__kCFBooleanTrue forKey:v61];
    v98 = +[SOSUtilities callWithHoldFooterDescription];
    -[PSSpecifier setProperty:forKey:](self->_callWithHoldGroupSpecifier, "setProperty:forKey:");
    v69 = self->_callWithPressesSpecifier;
    +[SOSUtilities callWithPressesTitleDescription];
    v71 = uint64_t v70 = v62;
    [(PSSpecifier *)v69 setName:v71];

    [(PSSpecifier *)self->_callWithPressesSpecifier setProperty:&__kCFBooleanTrue forKey:v61];
    v99 = +[SOSUtilities callWithPressesFooterDescription];
    -[PSSpecifier setProperty:forKey:](self->_callWithPressesGroupSpecifier, "setProperty:forKey:");
    v96 = +[SOSUtilities phoneTriggerAnimationFooterDescription];
    -[PSSpecifier setProperty:forKey:](self->_triggerAnimationGroup, "setProperty:forKey:");
    v72 = self->_clicksRadioGroup;
    v73 = +[SOSUtilities pressSelectionGroupTitleDescription];
    [(PSSpecifier *)v72 setName:v73];

    id v74 = *p_threeClicksSpecifier;
    v75 = +[SOSUtilities threePressesSelectionTitleDescription];
    [v74 setName:v75];

    [*p_threeClicksSpecifier setProperty:&__kCFBooleanTrue forKey:v61];
    id v76 = *p_fiveClicksSpecifier;
    v77 = +[SOSUtilities fivePressesSelectionTitleDescription];
    [v76 setName:v77];

    [*p_fiveClicksSpecifier setProperty:&__kCFBooleanTrue forKey:v61];
    if (+[SOSUtilities supportsSOSWithSideButtonSelectableNumberOfClicks])
    {
      if (+[SOSUtilities currentSOSTriggerMechanism] == (char *)&dword_0 + 1) {
        v78 = &self->_threeClicksSpecifier;
      }
      else {
        v78 = &self->_fiveClicksSpecifier;
      }
      v79 = *v78;
      v80 = v95;
      if (+[SOSUtilities SOSSelectableTriggerMechanismCapability] == (char *)&dword_0 + 2)v81 = v94; {
      else
      }
        v81 = v95;
      ((void (*)(void))v81[2])();
      v82 = v94;
      [(PSSpecifier *)self->_clicksRadioGroup setProperty:v79 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    else
    {
      v82 = v94;
      ((void (*)(void *))v94[2])(v94);
      v80 = v95;
      ((void (*)(void *))v95[2])(v95);
    }
    sosContacts = self->_sosContacts;
    self->_sosContacts = 0;

    v84 = *(void **)&self->PSListController_opaque[v97];
    *(void *)&self->PSListController_opaque[v97] = v66;
    id v85 = v66;

    [(SOSSettingsController *)self reload];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6E3C;
    block[3] = &unk_188D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v86 = self->_alarmSoundSwitch;
    v87 = +[SOSUtilities countdownSoundTitleDescription];
    [(PSSpecifier *)v86 setName:v87];

    v88 = self->_alarmSoundGroup;
    v89 = +[SOSUtilities countdownSoundFooterDescription];
    [(PSSpecifier *)v88 setProperty:v89 forKey:v70];

    [(SOSSettingsController *)self reloadAlarmSoundAnimated:0];
    v90 = self->_openHealthButton;
    v91 = +[SOSUtilities emergencyContactsEditDescription];
    [(PSSpecifier *)v90 setName:v91];

    [(SOSSettingsController *)self reloadEmergencyContactsAnimated:0];
    v92 = [(SOSSettingsController *)self coreTelephonyClient];
    [(SOSSettingsController *)self updateAutoCallSpecifierEnabled:+[SOSUtilities shouldForceDisableAutoCallForClient:v92] ^ 1];

    [(SOSSettingsController *)self addStewieGroupIfSupportedAnimated:0];
    objc_super v4 = *(void **)&self->PSListController_opaque[v97];
  }

  return v4;
}

- (void)initSharingLocationSpecifiers
{
  uint64_t v3 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
  stopSharingGroup = self->_stopSharingGroup;
  self->_stopSharingGroup = v3;

  uint64_t v5 = PSSpecifierIsSearchableKey;
  [(PSSpecifier *)self->_stopSharingGroup setProperty:&off_19678 forKey:PSSpecifierIsSearchableKey];
  int v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"STOP_SHARING_EMERGENCY_LOCATION" value:&stru_18F90 table:@"SOSSettings"];
  id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:13 edit:0];
  stopSharingButton = self->_stopSharingButton;
  self->_stopSharingButton = v8;

  id v10 = self->_stopSharingButton;
  v27[0] = v5;
  v27[1] = PSAlignmentKey;
  v28[0] = &off_19678;
  v28[1] = &off_19690;
  __int16 v11 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  [(PSSpecifier *)v10 setProperties:v11];

  [(PSSpecifier *)self->_stopSharingButton setButtonAction:"showStopSharingConfirmation:"];
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  int v13 = [v12 localizedStringForKey:@"LAST_LOCATION_SENT" value:&stru_18F90 table:@"SOSSettings"];
  id v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:0 edit:0];
  lastLocationSentGroup = self->_lastLocationSentGroup;
  self->_lastLocationSentGroup = v14;

  objc_super v16 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  mapViewCell = self->_mapViewCell;
  self->_mapViewCell = v16;

  v18 = self->_mapViewCell;
  v25[0] = PSCellClassKey;
  uint64_t v19 = objc_opt_class();
  v25[1] = PSTableCellHeightKey;
  v26[0] = v19;
  v26[1] = &off_196A8;
  v20 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  [(PSSpecifier *)v18 setProperties:v20];

  v21 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"OPEN_MESSAGES" value:&stru_18F90 table:@"SOSSettings"];
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, self, 0, 0, 0, 13, 0, v25[0]);
  v23 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  openMessagesButton = self->_openMessagesButton;
  self->_openMessagesButton = v23;

  [(PSSpecifier *)self->_openMessagesButton setButtonAction:"openMessages:"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v19 = a3;
  if ([v19 isEqualToString:@"SOSTriggerMechanismKey"]
    && +[SOSUtilities SOSSelectableTriggerMechanismCapability] == (char *)&dword_0 + 2)
  {
    id v7 = (char *)+[SOSUtilities currentSOSTriggerMechanism];
    id v8 = &OBJC_IVAR___SOSSettingsController__fiveClicksSpecifier;
    if (v7 == (unsigned char *)&dword_0 + 1) {
      id v8 = &OBJC_IVAR___SOSSettingsController__threeClicksSpecifier;
    }
    id v9 = *(id *)&self->PSListController_opaque[*v8];
    [(PSSpecifier *)self->_clicksRadioGroup setProperty:v9 forKey:PSRadioGroupCheckedSpecifierKey];
    [(SOSSettingsController *)self reloadSpecifier:self->_clicksRadioGroup animated:0];
    callWithPressesSpecifier = self->_callWithPressesSpecifier;
    __int16 v11 = +[SOSUtilities callWithPressesTitleDescription];
    [(PSSpecifier *)callWithPressesSpecifier setName:v11];

    [(SOSSettingsController *)self reloadSpecifier:self->_callWithPressesSpecifier animated:0];
    id v12 = +[SOSUtilities callWithPressesFooterDescription];
    [(PSSpecifier *)self->_callWithPressesGroupSpecifier setProperty:v12 forKey:PSFooterTextGroupKey];
    [(SOSSettingsController *)self reloadSpecifier:self->_callWithPressesGroupSpecifier animated:0];

    goto LABEL_11;
  }
  if ([v19 isEqualToString:SOSCallWithSideButtonPressesKey])
  {
    uint64_t v13 = 248;
    callWithHoldSpecifier = self->_callWithPressesSpecifier;
    uint64_t v15 = [(SOSSettingsController *)self callWithPresses:callWithHoldSpecifier];
LABEL_10:
    objc_super v16 = (void *)v15;
    [(PSSpecifier *)callWithHoldSpecifier setProperty:v15 forKey:PSValueKey];

    [(SOSSettingsController *)self reloadSpecifier:*(void *)&self->PSListController_opaque[v13] animated:0];
    [(SOSSettingsController *)self reloadAlarmSoundAnimated:0];
    goto LABEL_11;
  }
  if ([v19 isEqualToString:SOSCallWithVolumeLockHoldKey])
  {
    uint64_t v13 = 232;
    callWithHoldSpecifier = self->_callWithHoldSpecifier;
    uint64_t v15 = [(SOSSettingsController *)self callWithHold:callWithHoldSpecifier];
    goto LABEL_10;
  }
  if ([v19 isEqualToString:SOSPlayAudioDuringCountdownKey])
  {
    alarmSoundSwitch = self->_alarmSoundSwitch;
    v18 = [(SOSSettingsController *)self emergencySOSSoundEnabled:alarmSoundSwitch];
    [(PSSpecifier *)alarmSoundSwitch setProperty:v18 forKey:PSValueKey];

    [(SOSSettingsController *)self reloadSpecifier:self->_alarmSoundSwitch animated:0];
  }
LABEL_11:
}

- (void)reloadEmergencyContactsAnimated:(BOOL)a3
{
  contactsManager = self->_contactsManager;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_74D0;
  v4[3] = &unk_18A28;
  v4[4] = self;
  BOOL v5 = a3;
  [(SOSContactsManager *)contactsManager SOSContactsWithTimeout:v4 andCompletion:5.0];
}

- (id)contactNumberForContactSpecifier:(id)a3
{
  return [a3 propertyForKey:@"kPhoneNumberKey"];
}

- (void)reloadStopSharingGroupAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[SOSManager sharedInstance];
  unsigned int v6 = [v5 isSendingLocationUpdate];

  id v7 = [(PSSpecifier *)self->_stopSharingGroup identifier];
  id v8 = [(SOSSettingsController *)self specifierForID:v7];
  BOOL v9 = v8 == 0;

  if (((v6 ^ v9) & 1) == 0)
  {
    stopSharingButton = self->_stopSharingButton;
    if (v6)
    {
      v38[0] = self->_stopSharingGroup;
      v38[1] = stopSharingButton;
      __int16 v11 = +[NSArray arrayWithObjects:v38 count:2];
      [(SOSSettingsController *)self insertContiguousSpecifiers:v11 atIndex:0 animated:v3];

      mapViewCell = self->_mapViewCell;
      v37[0] = self->_lastLocationSentGroup;
      v37[1] = mapViewCell;
      v37[2] = self->_openMessagesButton;
      uint64_t v13 = +[NSArray arrayWithObjects:v37 count:3];
      [(SOSSettingsController *)self insertContiguousSpecifiers:v13 atIndex:2 animated:v3];
    }
    else
    {
      v40[0] = self->_stopSharingGroup;
      v40[1] = stopSharingButton;
      id v14 = +[NSArray arrayWithObjects:v40 count:2];
      [(SOSSettingsController *)self removeContiguousSpecifiers:v14 animated:v3];

      uint64_t v15 = self->_mapViewCell;
      v39[0] = self->_lastLocationSentGroup;
      v39[1] = v15;
      v39[2] = self->_openMessagesButton;
      uint64_t v13 = +[NSArray arrayWithObjects:v39 count:3];
      [(SOSSettingsController *)self removeContiguousSpecifiers:v13 animated:v3];
    }
  }
  v31 = +[NSNumber numberWithInt:v6 ^ 1];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  objc_super v16 = [(SOSSettingsController *)self specifiers];
  id v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    v20 = &selRef_setActive_;
    v21 = &selRef_setActive_;
    v22 = &selRef_setActive_;
    uint64_t v30 = PSEnabledKey;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_super v24 = *(PSSpecifier **)(*((void *)&v32 + 1) + 8 * i);
        if (v24 != self->_stopSharingGroup
          && v24 != *(PSSpecifier **)&self->PSListController_opaque[*((int *)v20 + 333)]
          && v24 != *(PSSpecifier **)&self->PSListController_opaque[*((int *)v21 + 334)]
          && v24 != *(PSSpecifier **)&self->PSListController_opaque[*((int *)v22 + 335)]
          && v24 != self->_openMessagesButton)
        {
          if (v24 != self->_callWithHoldSpecifier && v24 != self->_callWithPressesSpecifier)
          {
            int v25 = 0;
            goto LABEL_22;
          }
          v26 = [(SOSSettingsController *)self coreTelephonyClient];
          v29 = v26;
          if (+[SOSUtilities shouldForceDisableAutoCallForClient:v26])
          {
          }
          else
          {
            int v25 = 1;
LABEL_22:
            v27 = [(PSSpecifier *)v24 propertyForKey:v30];
            unsigned __int8 v28 = [v27 isEqual:v31];

            if (v25) {
            v21 = &selRef_setActive_;
            }
            if ((v28 & 1) == 0)
            {
              [(PSSpecifier *)v24 setProperty:v31 forKey:v30];
              [(SOSSettingsController *)self reloadSpecifier:v24];
            }
            v20 = &selRef_setActive_;
          }
          v22 = &selRef_setActive_;
          continue;
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v18);
  }
}

- (void)reloadAlarmSoundAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ((+[SOSUtilities isCallWithVolumeLockHoldEnabled](SOSUtilities, "isCallWithVolumeLockHoldEnabled") & 1) != 0|| +[SOSUtilities isCallWithSideButtonPressesEnabled])
  {
    BOOL v5 = [(SOSSettingsController *)self coreTelephonyClient];
    unsigned int v6 = +[SOSUtilities shouldForceDisableAutoCallForClient:v5] ^ 1;
  }
  else
  {
    unsigned int v6 = 0;
  }
  id v7 = [(PSSpecifier *)self->_alarmSoundSwitch identifier];
  id v8 = [(SOSSettingsController *)self specifierForID:v7];
  BOOL v9 = v8 == 0;

  if (((v6 ^ v9) & 1) == 0)
  {
    alarmSoundSwitch = self->_alarmSoundSwitch;
    if (v6)
    {
      v13[0] = self->_alarmSoundGroup;
      v13[1] = alarmSoundSwitch;
      __int16 v11 = +[NSArray arrayWithObjects:v13 count:2];
      [(SOSSettingsController *)self addSpecifiersFromArray:v11 animated:v3];
    }
    else
    {
      v12[0] = self->_alarmSoundGroup;
      v12[1] = alarmSoundSwitch;
      __int16 v11 = +[NSArray arrayWithObjects:v12 count:2];
      [(SOSSettingsController *)self removeContiguousSpecifiers:v11 animated:v3];
    }
  }
}

- (void)reloadHealthButtonLabelWithContacts:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(SOSSettingsController *)self specifierForID:@"OPEN_HEALTH"];
  BOOL v5 = +[SOSUtilities emergencyContactsEditDescription];
  [v6 setName:v5];

  [(SOSSettingsController *)self reloadSpecifier:v6 animated:v3];
}

- (void)reloadPrivacyFooterWithContacts:(BOOL)a3
{
  BOOL v3 = a3;
  id v13 = [(SOSSettingsController *)self specifierForID:@"EMERGENCY_CONTACTS"];
  if (v13)
  {
    BOOL v5 = +[SOSUtilities emergencyContactsFooterLinkTitle];
    id v6 = +[SOSUtilities emergencyContactsFooterDescription];
    id v7 = [v6 rangeOfString:v5 options:5];
    NSUInteger v9 = v8;
    [v13 setProperty:v6 forKey:PSFooterHyperlinkViewTitleKey];
    v15.location = (NSUInteger)v7;
    v15.length = v9;
    id v10 = NSStringFromRange(v15);
    [v13 setProperty:v10 forKey:PSFooterHyperlinkViewLinkRangeKey];

    __int16 v11 = +[NSValue valueWithNonretainedObject:self];
    [v13 setProperty:v11 forKey:PSFooterHyperlinkViewTargetKey];

    id v12 = NSStringFromSelector("openPrivacy");
    [v13 setProperty:v12 forKey:PSFooterHyperlinkViewActionKey];

    [(SOSSettingsController *)self reloadSpecifier:v13 animated:v3];
  }
}

- (id)emergencySOSSoundEnabled:(id)a3
{
  uint64_t v3 = +[SOSUtilities shouldPlayAudioDuringCountdown] ^ 1;

  return +[NSNumber numberWithInt:v3];
}

- (void)setEmergencySOSSoundEnabled:(id)a3 forSpecifier:(id)a4
{
  id v7 = a3;
  if (+[SOSUtilities setShouldPlayAudioDuringCountdown:](SOSUtilities, "setShouldPlayAudioDuringCountdown:", [v7 BOOLValue] ^ 1))
  {
    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 BOOLValue] ^ 1);
    BOOL v5 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    [(SOSSettingsController *)self submitSOSNotificationSettingsChangedMetric:@"countdownSound" withValue:v5];
  }
  else
  {
    BOOL v5 = self->_alarmSoundSwitch;
    id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", +[SOSUtilities shouldPlayAudioDuringCountdown] ^ 1);
    [(PSSpecifier *)v5 setProperty:v6 forKey:PSValueKey];

    [(SOSSettingsController *)self reloadSpecifier:v5 animated:1];
  }
}

- (void)stopSharingLocation:(id)a3
{
  id v3 = +[SOSManager sharedInstance];
  [v3 stopSendingLocationUpdate];
}

- (id)callWithHold:(id)a3
{
  if (+[SOSUtilities isCallWithVolumeLockHoldEnabled])
  {
    objc_super v4 = [(SOSSettingsController *)self coreTelephonyClient];
    BOOL v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", +[SOSUtilities shouldForceDisableAutoCallForClient:v4] ^ 1);
  }
  else
  {
    BOOL v5 = +[NSNumber numberWithInt:0];
  }

  return v5;
}

- (void)setCallWithHold:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  +[SOSUtilities setCallWithVolumeLockHoldEnabled:](SOSUtilities, "setCallWithVolumeLockHoldEnabled:", [v5 BOOLValue]);
  [(SOSSettingsController *)self reloadAlarmSoundAnimated:1];
  [(SOSSettingsController *)self submitSOSNotificationSettingsChangedMetric:@"volumeLockHold" withValue:v5];
}

- (id)callWithPresses:(id)a3
{
  if (+[SOSUtilities isCallWithSideButtonPressesEnabled])
  {
    objc_super v4 = [(SOSSettingsController *)self coreTelephonyClient];
    id v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", +[SOSUtilities shouldForceDisableAutoCallForClient:v4] ^ 1);
  }
  else
  {
    id v5 = +[NSNumber numberWithInt:0];
  }

  return v5;
}

- (void)setCallWithPresses:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = [v5 BOOLValue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_8548;
  v8[3] = &unk_18A50;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  +[SOSUtilities setCallWithSideButtonPresses:v6 presentErrorAlertOnViewController:self completion:v8];
}

- (void)showStopSharingConfirmation:(id)a3
{
  objc_super v4 = +[PSConfirmationSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  v12[0] = PSConfirmationTitleKey;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"STOP_SHARING_TITLE" value:&stru_18F90 table:@"SOSSettings"];
  v13[0] = v6;
  v12[1] = PSConfirmationCancelKey;
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  NSUInteger v8 = [v7 localizedStringForKey:@"STOP_SHARING_CANCEL" value:&stru_18F90 table:@"SOSSettings"];
  v13[1] = v8;
  void v12[2] = PSConfirmationOKKey;
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"STOP_SHARING_OK" value:&stru_18F90 table:@"SOSSettings"];
  void v13[2] = v10;
  __int16 v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  [v4 setupWithDictionary:v11];

  [v4 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
  [v4 setTarget:self];
  [v4 setConfirmationAction:"stopSharingLocation:"];
  [(SOSSettingsController *)self showConfirmationViewForSpecifier:v4 useAlert:0];
}

- (void)updateAutoCallSpecifierEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_9DE0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Setting SOS auto call specifiers to enabled: %d", (uint8_t *)v11, 8u);
  }

  callWithHoldSpecifier = self->_callWithHoldSpecifier;
  id v7 = +[NSNumber numberWithBool:v3];
  uint64_t v8 = PSEnabledKey;
  [(PSSpecifier *)callWithHoldSpecifier setProperty:v7 forKey:PSEnabledKey];

  [(SOSSettingsController *)self reloadSpecifier:self->_callWithHoldSpecifier animated:1];
  callWithPressesSpecifier = self->_callWithPressesSpecifier;
  id v10 = +[NSNumber numberWithBool:v3];
  [(PSSpecifier *)callWithPressesSpecifier setProperty:v10 forKey:v8];

  [(SOSSettingsController *)self reloadSpecifier:self->_callWithPressesSpecifier animated:1];
  [(SOSSettingsController *)self reloadAlarmSoundAnimated:1];
}

- (void)openMessages:(id)a3
{
  id v4 = objc_alloc_init((Class)NSURLComponents);
  [v4 setScheme:@"sms"];
  id v5 = [(NSMutableArray *)self->_sosContactsNumbers firstObject];

  if (v5)
  {
    [v4 setPath:@"open"];
    id v6 = objc_alloc((Class)NSURLQueryItem);
    id v7 = [(NSMutableArray *)self->_sosContactsNumbers firstObject];
    id v8 = [v6 initWithName:@"addresses" value:v7];

    id v12 = v8;
    id v9 = +[NSArray arrayWithObjects:&v12 count:1];
    [v4 setQueryItems:v9];
  }
  id v10 = (void *)UIApp;
  __int16 v11 = [v4 URL];
  [v10 openURL:v11 withCompletionHandler:0];
}

- (void)openHealthApp:(id)a3
{
  if (_os_feature_enabled_impl()) {
    CFStringRef v3 = @"settings-navigation://com.apple.Settings.Apps/com.apple.Health/MEDICAL_ID_ITEM";
  }
  else {
    CFStringRef v3 = @"prefs:root=HEALTH&path=MEDICAL_ID_ITEM";
  }
  id v5 = +[LSApplicationWorkspace defaultWorkspace];
  id v4 = +[NSURL URLWithString:v3];
  [v5 openSensitiveURL:v4 withOptions:0];
}

- (void)openPrivacy
{
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v5 = [(SOSSettingsController *)self coreTelephonyClient];
  [(SOSSettingsController *)self updateAutoCallSpecifierEnabled:+[SOSUtilities shouldForceDisableAutoCallForClient:v5] ^ 1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SOSSettingsController;
  id v6 = a4;
  id v7 = [(SOSSettingsController *)&v14 tableView:a3 cellForRowAtIndexPath:v6];
  -[SOSSettingsController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v14.receiver, v14.super_class);
  id v8 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v8 == self->_stopSharingButton)
  {
    id v9 = v7;
    if ([v9 type] == (char *)&dword_C + 1)
    {
      id v10 = +[UIColor redColor];
      __int16 v11 = [v9 textLabel];
      [v11 setTextColor:v10];

      goto LABEL_7;
    }
  }
  id v12 = v7;
LABEL_7:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SOSSettingsController *)self indexForIndexPath:v7];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  }
  id v10 = [(SOSSettingsController *)self getGroupSpecifierForSpecifier:v9];
  __int16 v11 = [(PSSpecifier *)v10 propertyForKey:PSIsRadioGroupKey];
  unsigned int v12 = [v11 BOOLValue];

  if (v12)
  {
    if (v10 == self->_clicksRadioGroup)
    {
      objc_super v14 = [v9 propertyForKey:PSValueKey];
      +[SOSUtilities setNumberOfSideButtonPresses:](SOSUtilities, "setNumberOfSideButtonPresses:", (int)[v14 intValue]);

      callWithPressesSpecifier = self->_callWithPressesSpecifier;
      objc_super v16 = +[SOSUtilities callWithPressesTitleDescription];
      [(PSSpecifier *)callWithPressesSpecifier setName:v16];

      id v13 = +[SOSUtilities callWithPressesFooterDescription];
      [(PSSpecifier *)self->_callWithPressesGroupSpecifier setProperty:v13 forKey:PSFooterTextGroupKey];
      [(SOSSettingsController *)self reloadSpecifier:self->_callWithPressesSpecifier];
      [(SOSSettingsController *)self reloadSpecifier:self->_callWithPressesGroupSpecifier];
    }
    else
    {
      id v13 = [v9 propertyForKey:PSValueKey];
      [(SOSSettingsController *)self setPreferenceValue:v13 specifier:v10];
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SOSSettingsController;
  [(SOSSettingsController *)&v17 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (void)addStewieGroupIfSupportedAnimated:(BOOL)a3
{
  coreTelephonyClient = self->_coreTelephonyClient;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_8FB0;
  v4[3] = &unk_18AA0;
  v4[4] = self;
  BOOL v5 = a3;
  [(CoreTelephonyClient *)coreTelephonyClient getStewieSupportWithCompletion:v4];
}

- (void)openStewieLearnMore
{
}

- (void)refreshStewieAssetSpecifier:(BOOL)a3
{
  BOOL v3 = a3;
  stewieAnimationViewCell = self->_stewieAnimationViewCell;
  id v6 = +[NSValue valueWithNonretainedObject:self];
  [(PSSpecifier *)stewieAnimationViewCell setProperty:v6 forKey:@"StewieSectionDemoDelegate"];

  id v7 = self->_stewieAnimationViewCell;

  [(SOSSettingsController *)self reloadSpecifier:v7 animated:v3];
}

- (void)presentStewieTryOutModeIfPossible
{
  if ([(SOSSettingsController *)self _canLaunchDemoFlow])
  {
    [(SOSSettingsController *)self openTrialDialog];
  }
  else
  {
    BOOL v3 = [(SOSSettingsController *)self stewieStateMonitor];
    id v4 = [v3 getState];

    id v5 = [v4 statusReasonForService:2];
    id v6 = sub_9DE0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      uint64_t v8 = CTStewieServiceStatusReasonAsString();
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,presentStewieTryOutModeIfPossible,Demo is not currently available. Reason: %s, state: %@", (uint8_t *)&v7, 0x16u);
    }

    +[SOSUtilities presentStewieDemoUnavailableAlertOnViewController:self reason:v5];
  }
}

- (void)openTrialDialog
{
  if ([(SOSSettingsController *)self _canLaunchDemoFlow])
  {
    id v4 = objc_alloc_init((Class)CTStewieRequestContext);
    [v4 setReason:5];
    BOOL v3 = [(SOSSettingsController *)self coreTelephonyClient];
    [v3 requestStewieWithContext:v4 completion:&stru_18AE0];
  }
}

- (BOOL)_canLaunchDemoFlow
{
  v2 = [(SOSSettingsController *)self stewieStateMonitor];
  BOOL v3 = [v2 getState];

  LOBYTE(v2) = [v3 isDemoAllowedForService:1];
  return (char)v2;
}

- (void)stateChanged:(id)a3
{
  [(SOSSettingsController *)self refreshTipSpecifier:1];

  [(SOSSettingsController *)self refreshStewieAssetSpecifier:1];
}

- (id)getCrashDetectionEnabledForSpecifier:(id)a3
{
  id v3 = +[SOSUtilities kappaTriggersEmergencySOS];

  return +[NSNumber numberWithBool:v3];
}

- (void)setCrashDetectionEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = sub_9DE0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v13 = [v5 BOOLValue];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,setCrashDetectionEnabled,Attempting to set crash detection settings as: %d", buf, 8u);
  }

  id v7 = [v5 BOOLValue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_979C;
  v9[3] = &unk_18A50;
  id v10 = v5;
  __int16 v11 = self;
  id v8 = v5;
  +[SOSUtilities setKappaTriggersEmergencySOS:v7 confirmationDelegate:self completion:v9];
}

- (void)presentConfirmationWithTitle:(id)a3 message:(id)a4 cancelTitle:(id)a5 cancelHandler:(id)a6 confirmTitle:(id)a7 confirmHandler:(id)a8
{
}

- (id)getKappaThirdPartyAppNameForSpecifier:(id)a3
{
  return +[SOSUtilities getKappaThirdPartyDisplayNameForApp];
}

- (void)submitSOSNotificationSettingsChangedMetric:(id)a3 withValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  [v9 setValue:v7 forKey:@"field"];

  [v9 setValue:v6 forKey:@"value"];
  id v8 = +[NSNumber numberWithBool:self->_openedViaAccCallNotification];
  [v9 setValue:v8 forKey:@"dueToNotification"];

  AnalyticsSendEvent();
}

- (void)submitSOSNotificationTapMetric
{
  +[SOSUtilities getShortSOSNotificationDisplayTimestamp];
  double v3 = v2;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  if (v3 > 0.0)
  {
    int v4 = (int)(CFAbsoluteTimeGetCurrent() - v3);
    if (v4 < 0) {
      uint64_t v5 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v5 = v4;
    }
    id v6 = +[NSNumber numberWithInt:v5];
    [v7 setValue:v6 forKey:@"timeTillTap"];
  }
  AnalyticsSendEvent();
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (CTStewieStateMonitor)stewieStateMonitor
{
  return self->_stewieStateMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stewieStateMonitor, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_storeStrong((id *)&self->_kappaThirdPartySpecifier, 0);
  objc_storeStrong((id *)&self->_kappaThirdPartyGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_kappaSpecifier, 0);
  objc_storeStrong((id *)&self->_kappaGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_stewieAnimationViewCell, 0);
  objc_storeStrong((id *)&self->_stewieAnimationGroup, 0);
  objc_storeStrong((id *)&self->_alarmSoundSwitch, 0);
  objc_storeStrong((id *)&self->_alarmSoundGroup, 0);
  objc_storeStrong((id *)&self->_openHealthButton, 0);
  objc_storeStrong((id *)&self->_emergencyContactsGroup, 0);
  objc_storeStrong((id *)&self->_triggerAnimationViewCell, 0);
  objc_storeStrong((id *)&self->_triggerAnimationGroup, 0);
  objc_storeStrong((id *)&self->_openMessagesButton, 0);
  objc_storeStrong((id *)&self->_mapViewCell, 0);
  objc_storeStrong((id *)&self->_lastLocationSentGroup, 0);
  objc_storeStrong((id *)&self->_stopSharingButton, 0);
  objc_storeStrong((id *)&self->_stopSharingGroup, 0);
  objc_storeStrong((id *)&self->_fiveClicksSpecifier, 0);
  objc_storeStrong((id *)&self->_threeClicksSpecifier, 0);
  objc_storeStrong((id *)&self->_clicksRadioGroup, 0);
  objc_storeStrong((id *)&self->_callWithPressesSpecifier, 0);
  objc_storeStrong((id *)&self->_callWithPressesGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_callWithHoldSpecifier, 0);
  objc_storeStrong((id *)&self->_callWithHoldGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_sosDefaults, 0);
  objc_storeStrong((id *)&self->_sosContactsNumbers, 0);
  objc_storeStrong((id *)&self->_sosContacts, 0);

  objc_storeStrong((id *)&self->_contactsManager, 0);
}

- (void)tipKitStartObservation
{
  sub_F620();
  double v3 = self;
  sub_F610();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_F630();

  swift_release();
  swift_release();
  swift_release_n();
}

- (void)tipKitStopObservation
{
  sub_F620();
  double v3 = self;
  sub_F610();
  sub_F630();

  swift_release();

  swift_release();
}

- (PSSpecifier)tipKitEntrySpecifier
{
  uint64_t v2 = qword_1F350;
  double v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  int v4 = (PSSpecifier *)*(id *)(qword_1F358 + 16);

  return v4;
}

+ (NSString)tipSpecifierKey
{
  NSString v2 = sub_F750();

  return (NSString *)v2;
}

- (void)tipKitMakeTipSpecifier
{
  NSString v2 = self;
  sub_C8E4();
}

@end