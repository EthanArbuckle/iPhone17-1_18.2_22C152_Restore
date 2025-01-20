@interface CACAMain
+ (BOOL)isCarPlayConnected;
+ (BOOL)isFeatureEnabled;
+ (id)debugFeatureName;
+ (id)featureEnabledStatusDidChangeNotification;
- (void)_downloadProgressChanged;
- (void)checkNecessaryLanguagePack;
- (void)didFinishLaunching;
- (void)didUpdateOrientation;
- (void)startCommandAndControl;
- (void)willTerminate;
@end

@implementation CACAMain

- (void)checkNecessaryLanguagePack
{
  v3 = CACLogAssetDownload();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Checking asset installation status", buf, 2u);
  }

  if (!AXDeviceSupportsMedina()
    || (+[MAAutoAsset hasStartupActivatedCompletedOnce] & 1) != 0)
  {
    v4 = +[CACPreferences sharedPreferences];
    v5 = [v4 bestLocaleIdentifier];

    v6 = [v5 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

    v7 = +[CACLanguageAssetManager sharedManager];
    v8 = [v7 installationStatus];
    v9 = [v8 objectForKey:v6];

    v10 = +[CACLanguageAssetManager sharedManager];
    v11 = [v10 supportedLocaleIdentifiers];

    [(NSTimer *)self->_startupLanguagePackCheckTimer invalidate];
    startupLanguagePackCheckTimer = self->_startupLanguagePackCheckTimer;
    self->_startupLanguagePackCheckTimer = 0;

    if ([v9 hasPrefix:kCACLanguageAssetInstallationStatusPrefixInstalled])
    {
      if (self->_didStartInstall)
      {
        v13 = +[CACDisplayManager sharedManager];
        [v13 displayReadyToUseWithLanguageMessage];
      }
      goto LABEL_8;
    }
    if (([v9 hasPrefix:kCACLanguageAssetInstallationStatusPrefixInstalling] & 1) != 0
      || [v9 hasPrefix:kCACLanguageAssetInstallationStatusPrefixWaitingToInstall])
    {
      if (!self->_didNotifyOfDownloading)
      {
        v14 = +[CACDisplayManager sharedManager];
        v15 = +[CACLocaleUtilities localizedUIStringForKey:@"AssetDownload.InstallingNow"];
        [v14 displayMessageString:v15 type:0];

        self->_didNotifyOfDownloading = 1;
      }
      +[NSDate timeIntervalSinceReferenceDate];
      double v17 = v16 - self->_startTime;
      double v18 = 300.0;
    }
    else
    {
      v35 = [v6 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
      unsigned int v36 = [v11 containsObject:v35];

      if (v36)
      {
LABEL_8:
        [(CACAMain *)self startCommandAndControl];
LABEL_27:

        return;
      }
      if (!self->_didStartInstall)
      {
        v37 = +[CACPreferences sharedPreferences];
        unsigned __int8 v38 = [v37 didShowOnboarding];

        if (v38)
        {
          v39 = +[CACLanguageAssetManager sharedManager];
          [v39 startDownloadOfLanguage:v6];

          self->_didStartInstall = 1;
        }
        else
        {
          int v41 = MGGetBoolAnswer();
          v42 = @"AssetDownload.InstallConfirmationDescription_WiFi";
          if (v41) {
            v42 = @"AssetDownload.InstallConfirmationDescription_WLAN";
          }
          v43 = v42;
          v49 = +[CACDisplayManager sharedManager];
          v44 = +[CACLocaleUtilities localizedUIStringForKey:@"AssetDownload.InstallConfirmationTitle"];
          v45 = +[CACLocaleUtilities localizedUIStringForKey:v43];

          v46 = +[CACLocaleUtilities localizedUIStringForKey:@"CommonStrings.Download"];
          v47 = +[CACLocaleUtilities localizedUIStringForKey:@"CommonStrings.Cancel"];
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_100001A4C;
          v50[3] = &unk_100004258;
          id v51 = v6;
          v52 = self;
          [v49 presentModalAlertWithTitle:v44 description:v45 button1Text:v46 button1Style:0 button2Text:v47 button2Style:1 object:0 button1Handler:v50 button2Handler:&stru_100004298];
        }
      }
      +[NSDate timeIntervalSinceReferenceDate];
      double v17 = v48 - self->_startTime;
      double v18 = 30.0;
    }
    if (v17 <= v18)
    {
      v33 = +[NSTimer scheduledTimerWithTimeInterval:self target:"checkNecessaryLanguagePack" selector:0 userInfo:0 repeats:11.0];
      v34 = self->_startupLanguagePackCheckTimer;
      self->_startupLanguagePackCheckTimer = v33;
    }
    else
    {
      v19 = +[AXElement systemWideElement];
      v20 = [v19 systemApplication];
      v21 = [v20 currentApplications];
      v22 = [v21 firstObject];
      v23 = [v22 bundleId];
      unsigned int v24 = [v23 isEqualToString:@"com.apple.Preferences"];

      v25 = +[CACLocaleUtilities localizedUIStringForKey:@"AssetDownload.InstallFailedAlertDescription"];
      v26 = +[CACDisplayManager sharedManager];
      v27 = +[CACLocaleUtilities localizedUIStringForKey:@"AssetDownload.InstallFailedAlertTitle"];
      v28 = +[CACLocaleUtilities localizedUIStringForKey:@"CommonStrings.OK"];
      if (v24)
      {
        [v26 presentModalAlertWithTitle:v27 description:v25 button1Text:v28 button1Style:1 button2Text:0 button2Style:0 object:0 button1Handler:&stru_1000042F8 button2Handler:&stru_100004338];
      }
      else
      {
        v40 = +[CACLocaleUtilities localizedUIStringForKey:@"CommonStrings.Settings"];
        [v26 presentModalAlertWithTitle:v27 description:v25 button1Text:v28 button1Style:1 button2Text:v40 button2Style:0 object:0 button1Handler:&stru_1000042F8 button2Handler:&stru_100004338];
      }
    }
    goto LABEL_27;
  }
  [(NSTimer *)self->_startupLanguagePackCheckTimer invalidate];
  v29 = +[NSTimer scheduledTimerWithTimeInterval:self target:"checkNecessaryLanguagePack" selector:0 userInfo:0 repeats:11.0];
  v30 = self->_startupLanguagePackCheckTimer;
  self->_startupLanguagePackCheckTimer = v29;

  v31 = CACLogAssetDownload();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Mobile assets is not yet ready.  Delaying checking installation status of ASR assets.", buf, 2u);
  }

  +[NSDate timeIntervalSinceReferenceDate];
  self->_startTime = v32;
}

- (void)startCommandAndControl
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 run];
}

+ (id)debugFeatureName
{
  return @"Command and Control";
}

+ (BOOL)isCarPlayConnected
{
  id v2 = (void *)qword_100008D58;
  if (!qword_100008D58)
  {
    id v3 = [objc_alloc((Class)CARSessionStatus) initAndWaitUntilSessionUpdated];
    v4 = (void *)qword_100008D58;
    qword_100008D58 = (uint64_t)v3;

    uint64_t v5 = objc_opt_new();
    v6 = (void *)qword_100008D60;
    qword_100008D60 = v5;

    [(id)qword_100008D58 addSessionObserver:qword_100008D60];
    id v2 = (void *)qword_100008D58;
  }
  v7 = [v2 currentSession];
  BOOL v8 = v7 != 0;

  return v8;
}

+ (BOOL)isFeatureEnabled
{
  if (_AXSCommandAndControlEnabled())
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int v3 = _AXSCommandAndControlCarPlayEnabled();
    if (v3)
    {
      LOBYTE(v3) = [a1 isCarPlayConnected];
    }
  }
  return v3;
}

+ (id)featureEnabledStatusDidChangeNotification
{
  return @"kCACRepostEnabledStatusNotification";
}

- (void)didFinishLaunching
{
  +[NSDate timeIntervalSinceReferenceDate];
  self->_startTime = v3;
  id v4 = +[CACDisplayManager sharedManager];
  id v5 = +[CACUtilityToolServer sharedInstance];
  v6 = +[CACDisplayManager sharedManager];
  [v6 enableStatusBarOverride:1];

  [(CACAMain *)self checkNecessaryLanguagePack];
  v7 = +[CACLanguageAssetManager sharedManager];
  [v7 registerForCallback];

  BOOL v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_downloadProgressChanged" name:CACNotificationAssetDownloadProgressChanged object:0];

  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"_downloadErrorOccurred" name:CACNotificationAssetDownloadErrorOccured object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100002070, kAXSCommandAndControlEnabledNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v11 = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v12 = (const __CFString *)kAXSCommandAndControlCarPlayEnabledNotification;

  CFNotificationCenterAddObserver(v11, self, (CFNotificationCallback)sub_100002070, v12, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)willTerminate
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 willTerminate];
}

- (void)didUpdateOrientation
{
  id v2 = +[CACDisplayManager sharedManager];
  [v2 didUpdateOrientation];
}

- (void)_downloadProgressChanged
{
  +[NSDate timeIntervalSinceReferenceDate];
  self->_startTime = v3;
}

- (void).cxx_destruct
{
}

@end