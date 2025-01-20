@interface MadridInternalListController
- (CNFAutomationOptions)automationOptions;
- (IMServiceImpl)service;
- (MadridInternalListController)init;
- (id)autoSendLogValue;
- (id)automationIntervalForSpecifier:(id)a3;
- (id)automationRepetitionsForSpecifier:(id)a3;
- (id)environment:(id)a3;
- (id)fmfdLogging:(id)a3;
- (id)getTimeStampValueForSpecifier:(id)a3;
- (id)madridBasicLogging:(id)a3;
- (id)madridBasicLoggingDefaults;
- (id)madridDebugLogging:(id)a3;
- (id)notifySMS:(id)a3;
- (id)pendingAutomationRemoteForSpecifier:(id)a3;
- (id)phishingMMSWhitelist:(id)a3;
- (id)pushDebugBannersEnabled:(id)a3;
- (id)pushLoggingEnabled:(id)a3;
- (id)readReceiptSettingsConfirmed:(id)a3;
- (id)readShowChatKitTesterAppSetting:(id)a3;
- (id)registrationLoggingEnabled:(id)a3;
- (id)registrationSMSAttempts:(id)a3;
- (id)sliderValues;
- (id)specifiers;
- (id)stkLogging:(id)a3;
- (id)technicalFailureUI:(id)a3;
- (void)_handleReturnKeyTapped:(id)a3;
- (void)_startListeningForReturnKey;
- (void)_stopListeningForReturnKey;
- (void)clearLogs:(id)a3;
- (void)dealloc;
- (void)dumpDeviceLogs;
- (void)dumpLogs:(id)a3;
- (void)hawkingTapped:(id)a3;
- (void)resetSMSCounter:(id)a3;
- (void)setAutoSendLogValue:(id)a3 specifier:(id)a4;
- (void)setAutomationInterval:(id)a3 forSpecifier:(id)a4;
- (void)setAutomationOptions:(id)a3;
- (void)setAutomationRemote:(id)a3 forSpecifier:(id)a4;
- (void)setAutomationRepetitions:(id)a3 forSpecifier:(id)a4;
- (void)setEnvironment:(id)a3 specifier:(id)a4;
- (void)setFMFDLogging:(id)a3 specifier:(id)a4;
- (void)setMadridBasicLogging:(id)a3 specifier:(id)a4;
- (void)setMadridDebugLogging:(id)a3 specifier:(id)a4;
- (void)setNotifySMS:(id)a3 specifier:(id)a4;
- (void)setPhishingMMSWhitelist:(id)a3 specifier:(id)a4;
- (void)setPushDebugBannersEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setPushLoggingEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setReadReceiptSettingsConfirmed:(id)a3 specifier:(id)a4;
- (void)setRegistrationLoggingEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setSTKLogging:(id)a3 specifier:(id)a4;
- (void)setService:(id)a3;
- (void)setShowChatKitTesterAppSetting:(id)a3 specifier:(id)a4;
- (void)setTechnicalFailureUI:(id)a3 specifier:(id)a4;
- (void)setTimeStampValue:(id)a3 forSpecifier:(id)a4;
- (void)startAutomationTapped:(id)a3;
- (void)stopAutomationTapped:(id)a3;
- (void)viewAccountsTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MadridInternalListController

- (MadridInternalListController)init
{
  v9.receiver = self;
  v9.super_class = (Class)MadridInternalListController;
  v2 = [(MadridInternalListController *)&v9 init];
  if (v2)
  {
    v3 = +[IMServiceImpl serviceWithInternalName:@"Madrid"];
    [(MadridInternalListController *)v2 setService:v3];

    v4 = (FTRegConnectionHandler *)[objc_alloc((Class)FTRegConnectionHandler) initWithServiceType:1 name:@"InternalSettings"];
    connectionHandler = v2->_connectionHandler;
    v2->_connectionHandler = v4;

    v6 = objc_alloc_init(CNFAutomationOptions);
    automationOptions = v2->_automationOptions;
    v2->_automationOptions = v6;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MadridInternalListController;
  [(MadridInternalListController *)&v4 dealloc];
}

- (id)sliderValues
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_D0F8, &off_D110, &off_D128, &off_D140, 0);
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc((Class)NSMutableArray);
    v6 = [(MadridInternalListController *)self loadSpecifiersFromPlistName:@"MadridInternalSettings" target:self];
    id v7 = [v5 initWithArray:v6];

    v8 = [v7 specifierForID:@"TIME_STAMP_BEHAVIOR_ID"];
    if (v8)
    {
      objc_super v9 = (char *)[v7 indexOfObject:v8];
      if (v9 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = v9 + 1;
        v11 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setTimeStampValue:forSpecifier:" get:"getTimeStampValueForSpecifier:" detail:0 cell:5 edit:0];
        [v11 setProperty:objc_opt_class() forKey:PSCellClassKey];
        [v11 setProperty:&__kCFBooleanFalse forKey:PSSliderIsContinuous];
        [v11 setProperty:&__kCFBooleanFalse forKey:PSSliderShowValueKey];
        [v11 setProperty:&off_D0F8 forKey:PSControlMinimumKey];
        v12 = [(MadridInternalListController *)self sliderValues];
        v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v12 count] - 1);
        [v11 setProperty:v13 forKey:PSControlMaximumKey];

        [v7 insertObject:v11 atIndex:v10];
      }
    }
    v14 = [v7 specifierForID:@"PUSH_TOKEN"];
    id v15 = objc_alloc((Class)APSConnection);
    id v16 = [v15 initWithEnvironmentName:APSEnvironmentProduction queue:&_dispatch_main_q];
    v17 = [v16 publicToken];
    v18 = [v17 description];
    [v14 setProperty:v18 forKey:PSFooterTextGroupKey];

    v19 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v7;

    objc_super v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)setTimeStampValue:(id)a3 forSpecifier:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_3DD0;
  v5[3] = &unk_C3C0;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (id)getTimeStampValueForSpecifier:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"TimestampInterval", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
  if (AppIntegerValue <= -1 || keyExistsAndHasValidFormat == 0) {
    CFIndex v6 = 0;
  }
  else {
    CFIndex v6 = AppIntegerValue;
  }
  id v7 = +[NSNumber numberWithInteger:v6];
  v8 = [(MadridInternalListController *)self sliderValues];
  objc_super v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 indexOfObject:v7]);

  return v9;
}

- (void)_startListeningForReturnKey
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleReturnKeyTapped:" name:UIKeyboardReturnKeyPressed object:0];
}

- (void)_stopListeningForReturnKey
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIKeyboardReturnKeyPressed object:0];
}

- (void)_handleReturnKeyTapped:(id)a3
{
  id v3 = [(MadridInternalListController *)self firstResponder];
  [v3 resignFirstResponder];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MadridInternalListController;
  [(MadridInternalListController *)&v5 viewDidAppear:a3];
  [(MadridInternalListController *)self _startListeningForReturnKey];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  +[CNFInternalSettingsUtilities setCurrentInternalSettingsBundle:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MadridInternalListController;
  [(MadridInternalListController *)&v4 viewWillDisappear:a3];
  [(MadridInternalListController *)self _stopListeningForReturnKey];
}

- (id)pushLoggingEnabled:(id)a3
{
  uint64_t v3 = CNFIsPushLoggingEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (void)setPushLoggingEnabled:(id)a3 forSpecifier:(id)a4
{
  [a3 BOOLValue];
  CNFSetPushLoggingEnabled();

  [(MadridInternalListController *)self reloadSpecifiers];
}

- (id)pushDebugBannersEnabled:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"APSAlertsEnabled", @"com.apple.apsalerts", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 1;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = v4;
  CFIndex v6 = +[NSNumber numberWithBool:v5];

  return v6;
}

- (void)setPushDebugBannersEnabled:(id)a3 forSpecifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v5 = +[NSNumber numberWithBool:1];
  }
  else {
    uint64_t v5 = 0;
  }
  CFPreferencesSetAppValue(@"APSAlertsEnabled", v5, @"com.apple.apsalerts");
  CFPreferencesAppSynchronize(@"com.apple.apsalerts");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"APSAlertSettingsDidChangeNotification", 0, 0, 0);

  [(MadridInternalListController *)self reloadSpecifiers];
}

- (id)fmfdLogging:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.logging");
  BOOL v3 = CFPreferencesGetAppBooleanValue(@"FMFD", @"com.apple.logging", 0) != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)setFMFDLogging:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue])
  {
    BOOL v4 = +[NSNumber numberWithInt:8];
    CFPreferencesSetAppValue(@"LogLevel", v4, @"com.apple.AOSNotification");

    uint64_t v5 = +[NSNumber numberWithBool:1];
    CFPreferencesSetAppValue(@"LogNetworkTraffic", v5, @"com.apple.AOSNotification");

    CFIndex v6 = +[NSNumber numberWithBool:1];
    CFPreferencesSetAppValue(@"FMFD", v6, @"com.apple.logging");

    id v7 = +[NSNumber numberWithBool:1];
    CFPreferencesSetAppValue(@"Enabled", v7, @"com.apple.logging");

    v8 = +[NSNumber numberWithInt:7];
    CFPreferencesSetAppValue(@"LogLevel", v8, @"com.apple.icloud.fmfd");

    objc_super v9 = +[NSNumber numberWithBool:1];
    CFPreferencesSetAppValue(@"LogToFile", v9, @"com.apple.icloud.fmfd");
  }
  else
  {
    CFPreferencesSetAppValue(@"LogLevel", 0, @"com.apple.AOSNotification");
    CFPreferencesSetAppValue(@"LogNetworkTraffic", 0, @"com.apple.AOSNotification");
    CFPreferencesSetAppValue(@"LogLevel", 0, @"com.apple.icloud.fmfd");
    CFPreferencesSetAppValue(@"LogToFile", 0, @"com.apple.icloud.fmfd");
    CFPreferencesSetAppValue(@"FMFD", 0, @"com.apple.logging");
    CFPreferencesSetAppValue(@"Enabled", 0, @"com.apple.logging");
  }
  CFPreferencesAppSynchronize(@"com.apple.logging");
  CFPreferencesAppSynchronize(@"com.apple.AOSNotification");

  CFPreferencesAppSynchronize(@"com.apple.icloud.fmfd");
}

- (id)stkLogging:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.logging");
  BOOL v3 = CFPreferencesGetAppBooleanValue(@"STK", @"com.apple.logging", 0) != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)setSTKLogging:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    BOOL v4 = +[NSNumber numberWithBool:1];
  }
  else {
    BOOL v4 = 0;
  }
  CFPreferencesSetAppValue(@"STK", v4, @"com.apple.logging");

  CFPreferencesAppSynchronize(@"com.apple.logging");
}

- (id)phishingMMSWhitelist:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.logging");
  BOOL v3 = CFPreferencesGetAppBooleanValue(@"WhitelistEmailInternalPhishing", @"com.apple.sms", 0) != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)setPhishingMMSWhitelist:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    BOOL v4 = +[NSNumber numberWithBool:1];
  }
  else {
    BOOL v4 = 0;
  }
  CFPreferencesSetAppValue(@"WhitelistEmailInternalPhishing", v4, @"com.apple.sms");

  CFPreferencesAppSynchronize(@"com.apple.sms");
}

- (id)madridDebugLogging:(id)a3
{
  uint64_t v3 = CNFiMessageLogLevel();

  return +[NSNumber numberWithInteger:v3];
}

- (void)setMadridDebugLogging:(id)a3 specifier:(id)a4
{
  unint64_t v5 = (unint64_t)[a3 integerValue];
  CNFSetiMessageLogLevel();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kMarcoSyncLoggingPrefs", 0, 0, 1u);
  if ((v5 & 0x8000000000000000) != 0)
  {
    v11 = dispatch_get_global_queue(0, 0);
    dispatch_async(v11, &stru_C420);

    uint64_t v12 = WiFiManagerClientCreate();
    if (v12)
    {
      v13 = (const void *)v12;
      WiFiManagerClientSetProperty();
      WiFiManagerClientSetProperty();
      WiFiManagerClientSetProperty();
      CFRelease(v13);
    }
  }
  else
  {
    CNFSetPushLoggingEnabled();
    id v7 = dispatch_get_global_queue(0, 0);
    dispatch_async(v7, &stru_C400);

    uint64_t v8 = WiFiManagerClientCreate();
    if (v8)
    {
      objc_super v9 = (const void *)v8;
      WiFiManagerClientSetProperty();
      WiFiManagerClientSetProperty();
      WiFiManagerClientSetProperty();
      CFRelease(v9);
    }
    CFPreferencesSetAppValue(@"showInternalErrors", +[NSNumber numberWithBool:1], @"com.apple.MobileSMS");
    CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v10, @"CKTechnicalFailureUIPrefChangedNotification", 0, 0, 0);
  }

  [(MadridInternalListController *)self reloadSpecifiers];
}

- (id)madridBasicLoggingDefaults
{
  v2 = (void *)qword_11120;
  if (!qword_11120)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    BOOL v4 = +[NSArray arrayWithObjects:@"MadridEventLogging", @"IDSLogging", 0];
    [v3 setObject:v4 forKey:@"com.apple.logging"];

    uint64_t v5 = +[NSDictionary dictionaryWithDictionary:v3];
    CFIndex v6 = (void *)qword_11120;
    qword_11120 = v5;

    v2 = (void *)qword_11120;
  }

  return v2;
}

- (id)madridBasicLogging:(id)a3
{
  uint64_t v3 = [(MadridInternalListController *)self madridBasicLoggingDefaults];
  if ([v3 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          CFStringRef v9 = *(const __CFString **)(*((void *)&v22 + 1) + 8 * i);
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          v10 = objc_msgSend(v4, "objectForKey:", v9, 0);
          id v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v19;
            while (2)
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v19 != v13) {
                  objc_enumerationMutation(v10);
                }
                if (!CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((void *)&v18 + 1) + 8 * (void)j), v9, 0))
                {
                  id v16 = +[NSNumber numberWithBool:0];

                  goto LABEL_21;
                }
              }
              id v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = +[NSNumber numberWithBool:v15];
LABEL_21:

  return v16;
}

- (void)setMadridBasicLogging:(id)a3 specifier:(id)a4
{
  unsigned int v21 = [a3 BOOLValue];
  long long v20 = self;
  id v5 = [(MadridInternalListController *)self madridBasicLoggingDefaults];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [v5 allKeys];
  id v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    if (v21) {
      CFBooleanRef v9 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v9 = 0;
    }
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v11 = *(const __CFString **)(*((void *)&v27 + 1) + 8 * (void)v10);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v12 = [v5 objectForKey:v11];
        id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v24;
          do
          {
            id v16 = 0;
            do
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              CFPreferencesSetAppValue(*(CFStringRef *)(*((void *)&v23 + 1) + 8 * (void)v16), v9, v11);
              id v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            id v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v14);
        }

        CFPreferencesAppSynchronize(v11);
        v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kMarcoSyncLoggingPrefs", 0, 0, 1u);
  uint64_t v18 = CNFiMessageLogLevel();
  if (!v21 || (uint64_t v19 = v18, CNFSetPushLoggingEnabled(), v19 == -1)) {
    CNFSetiMessageLogLevel();
  }
  CNFSetBasebandLoggingEnabled();
  [(MadridInternalListController *)v20 reloadSpecifiers];
}

- (id)registrationLoggingEnabled:(id)a3
{
  BOOL v3 = CNFRegistrationLogLevel() >= 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)setRegistrationLoggingEnabled:(id)a3 forSpecifier:(id)a4
{
  char v5 = [a3 BOOLValue] ^ 1;
  CNFSetRegistrationLogLevel();
  if ((v5 & 1) == 0)
  {
    CNFSetPushLoggingEnabled();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PCLoggingSettingsDidChangeNotification", 0, 0, 1u);
  }

  [(MadridInternalListController *)self reloadSpecifiers];
}

- (void)setAutoSendLogValue:(id)a3 specifier:(id)a4
{
  [a3 integerValue];
  CNFSetSharedIntegerForKey();
  id v6 = [(MadridInternalListController *)self navigationController];
  id v5 = [v6 popViewControllerAnimated:1];
}

- (id)autoSendLogValue
{
  uint64_t v2 = CNFGetSharedIntegerForKey();

  return +[NSNumber numberWithInteger:v2];
}

- (void)hawkingTapped:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init(MadridInternalHawkingListController);
  [(MadridInternalHawkingListController *)v6 setSpecifier:v4];

  id v5 = [(MadridInternalListController *)self rootController];
  [(MadridInternalHawkingListController *)v6 setRootController:v5];

  [(MadridInternalListController *)self showController:v6 animate:1];
}

- (void)setTechnicalFailureUI:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    id v4 = +[NSNumber numberWithBool:1];
  }
  else {
    id v4 = 0;
  }
  CFPreferencesSetAppValue(@"showInternalErrors", v4, @"com.apple.MobileSMS");
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CKTechnicalFailureUIPrefChangedNotification", 0, 0, 0);
}

- (id)technicalFailureUI:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"showInternalErrors", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 1;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = v4;
  id v6 = +[NSNumber numberWithBool:v5];

  return v6;
}

- (void)dumpLogs:(id)a3
{
}

- (void)dumpDeviceLogs
{
}

- (void)clearLogs:(id)a3
{
  id v4 = +[IMUserNotification userNotificationWithIdentifier:@"Logs" title:@"iMessage Logging" message:@"Are you sure you want to delete all Messages logging?" defaultButton:@"Delete" alternateButton:@"Cancel" otherButton:0];
  BOOL v3 = +[IMUserNotificationCenter sharedInstance];
  [v3 addUserNotification:v4 listener:0 completionHandler:&stru_C460];
}

- (void)setEnvironment:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  +[CNFInternalSettingsUtilities setIDSEnvironment:a3];
  id v7 = [(MadridInternalListController *)self navigationController];
  id v8 = [v7 popViewControllerAnimated:1];

  +[CNFInternalSettingsUtilities signOutAllAccounts];
  [v6 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  id v11 = [v6 propertyForKey:PSTableCellKey];

  [v11 setCellEnabled:0];
  id v9 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:2];
  [v9 startAnimating];
  [v11 setAccessoryView:v9];
  [v11 setNeedsDisplay];
  dispatch_time_t v10 = dispatch_time(0, 3000000000);
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, &stru_C480);
}

- (id)environment:(id)a3
{
  return +[CNFInternalSettingsUtilities IDSEnvironment];
}

- (void)viewAccountsTapped:(id)a3
{
  id v4 = a3;
  id v6 = [objc_alloc((Class)CNFInternalAccountListViewController) initWithServiceType:1];
  [v6 setSpecifier:v4];

  uint64_t v5 = [(MadridInternalListController *)self rootController];
  [v6 setRootController:v5];

  [(MadridInternalListController *)self showController:v6 animate:1];
}

- (id)registrationSMSAttempts:(id)a3
{
  return +[NSString stringWithFormat:@"%ld", CFPreferencesGetAppIntegerValue(@"TotalSMSAttempts", @"com.apple.conference", 0)];
}

- (void)setNotifySMS:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    id v4 = +[NSNumber numberWithInt:1];
  }
  else {
    id v4 = 0;
  }
  CFPreferencesSetAppValue(@"NotifySMS", v4, @"com.apple.conference");

  CFPreferencesAppSynchronize(@"com.apple.conference");
}

- (id)notifySMS:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"NotifySMS", @"com.apple.conference", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppIntegerValue == 1;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = v4;
  id v6 = +[NSNumber numberWithBool:v5];

  return v6;
}

- (void)resetSMSCounter:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.conference");
  CFPreferencesSetAppValue(@"TotalSMSAttempts", 0, @"com.apple.conference");
  CFPreferencesAppSynchronize(@"com.apple.conference");

  [(MadridInternalListController *)self reloadSpecifiers];
}

- (id)pendingAutomationRemoteForSpecifier:(id)a3
{
  BOOL v3 = [(MadridInternalListController *)self automationOptions];
  BOOL v4 = [v3 remote];

  return v4;
}

- (void)setAutomationRemote:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = [(MadridInternalListController *)self automationOptions];
  [v6 setRemote:v5];
}

- (id)automationIntervalForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MadridInternalListController *)self automationOptions];
  id v6 = [v5 interval];

  if (!v6)
  {
    id v7 = [v4 propertyForKey:PSDefaultValueKey];
    id v8 = [(MadridInternalListController *)self automationOptions];
    [v8 setInterval:v7];
  }
  id v9 = [(MadridInternalListController *)self automationOptions];
  dispatch_time_t v10 = [v9 interval];

  return v10;
}

- (void)setAutomationInterval:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = [(MadridInternalListController *)self automationOptions];
  [v6 setInterval:v5];
}

- (id)automationRepetitionsForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MadridInternalListController *)self automationOptions];
  id v6 = [v5 repetitions];

  if (!v6)
  {
    id v7 = [v4 propertyForKey:PSDefaultValueKey];
    id v8 = [(MadridInternalListController *)self automationOptions];
    [v8 setRepetitions:v7];
  }
  id v9 = [(MadridInternalListController *)self automationOptions];
  dispatch_time_t v10 = [v9 repetitions];

  return v10;
}

- (void)setAutomationRepetitions:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = [(MadridInternalListController *)self automationOptions];
  [v6 setRepetitions:v5];
}

- (void)startAutomationTapped:(id)a3
{
  id v4 = [(MadridInternalListController *)self firstResponder];
  [v4 resignFirstResponder];

  id v5 = [(MadridInternalListController *)self automationOptions];
  id v6 = [v5 remote];
  id v7 = [v6 length];

  if ((unint64_t)v7 >= 5)
  {
    id v8 = [(MadridInternalListController *)self automationOptions];
    id v9 = [v8 interval];
    dispatch_time_t v10 = [(MadridInternalListController *)self automationOptions];
    id v11 = [v10 repetitions];
    id v12 = [(MadridInternalListController *)self automationOptions];
    id v13 = [v12 remote];
    id v14 = +[NSDictionary dictionaryWithObjectsAndKeys:v9, @"interval", v11, @"repetitions", v13, @"target", 0];

    MarcoActionWithUserInfo();
  }
}

- (void)stopAutomationTapped:(id)a3
{
}

- (id)readReceiptSettingsConfirmed:(id)a3
{
  uint64_t v3 = CNFGetSharedBooleanValueForKey();

  return +[NSNumber numberWithBool:v3];
}

- (void)setReadReceiptSettingsConfirmed:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];
  CNFSetSharedBooleanValueForKey();
  if (CNFSyncPreferences())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.ReadReceiptSettingsConfirmed.changed", 0, 0, 0);
  }
}

- (id)readShowChatKitTesterAppSetting:(id)a3
{
  uint64_t v3 = CNFGetSharedBooleanValueForKey();

  return +[NSNumber numberWithBool:v3];
}

- (void)setShowChatKitTesterAppSetting:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];
  CNFSetSharedBooleanValueForKey();
  CNFSyncSharedPreferences();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.appIconVisibilityPreferencesChanged", 0, 0, 1u);
}

- (IMServiceImpl)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (CNFAutomationOptions)automationOptions
{
  return (CNFAutomationOptions *)objc_getProperty(self, a2, 200, 1);
}

- (void)setAutomationOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationOptions, 0);
  objc_storeStrong((id *)&self->_connectionHandler, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end