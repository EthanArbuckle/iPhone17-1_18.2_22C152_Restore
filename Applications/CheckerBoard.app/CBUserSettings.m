@interface CBUserSettings
+ (id)sharedInstance;
- (BOOL)_isPermittedToUpdateASTDefaults;
- (BOOL)checkedInWiFiSettings;
- (BOOL)shouldShowInfoPane;
- (BOOL)wifiPowerStateOn;
- (BOOL)wifiRequiresPassword;
- (CBRemoteSetupManager)remoteSetupManager;
- (CBSProxyServer)proxyServer;
- (CBUserSettings)init;
- (NSString)wifiPasswordFromNvram;
- (NSString)wifiSSIDFromNvram;
- (NSTimer)wifiReconnectTimer;
- (OS_dispatch_semaphore)diagsLaunchDependenciesSemaphore;
- (unint64_t)wifiJoinAttemptCount;
- (void)_attemptConnectingToWifi;
- (void)_disableContinousPath;
- (void)_setAutoDiagsFromNVRamWithNavController:(id)a3;
- (void)_setDesiredUserDefaults;
- (void)_setLanguageFromNVRam;
- (void)_setOverrideRemoteSetupPin;
- (void)_setSkipDiagsTermsAndConditionsFromNVRam;
- (void)_setWiFiFromNVRam;
- (void)_updateASTDefaultsFromNVRam;
- (void)applyPostUISettingsFromNvramWithNavigationController:(id)a3;
- (void)applyPreUISettingsFromNvram;
- (void)assignProxyServer:(id)a3;
- (void)checkInWiFiSettings:(BOOL)a3;
- (void)dealloc;
- (void)setCheckedInWiFiSettings:(BOOL)a3;
- (void)setDiagsLaunchDependenciesSemaphore:(id)a3;
- (void)setProxyServer:(id)a3;
- (void)setRemoteSetupManager:(id)a3;
- (void)setWifiJoinAttemptCount:(unint64_t)a3;
- (void)setWifiPasswordFromNvram:(id)a3;
- (void)setWifiPowerStateOn:(BOOL)a3;
- (void)setWifiReconnectTimer:(id)a3;
- (void)setWifiRequiresPassword:(BOOL)a3;
- (void)setWifiSSIDFromNvram:(id)a3;
@end

@implementation CBUserSettings

+ (id)sharedInstance
{
  if (qword_10008FD68 != -1) {
    dispatch_once(&qword_10008FD68, &stru_100079570);
  }
  v2 = (void *)qword_10008FD60;

  return v2;
}

- (CBUserSettings)init
{
  v12.receiver = self;
  v12.super_class = (Class)CBUserSettings;
  v2 = [(CBUserSettings *)&v12 init];
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating user settings keeper…", (uint8_t *)v11, 2u);
    }

    *(_WORD *)&v2->_checkedInWiFiSettings = 0;
    proxyServer = v2->_proxyServer;
    v2->_proxyServer = 0;

    wifiReconnectTimer = v2->_wifiReconnectTimer;
    v2->_wifiReconnectTimer = 0;
    v2->_wifiJoinAttemptCount = 0;

    wifiSSIDFromNvram = v2->_wifiSSIDFromNvram;
    v2->_wifiSSIDFromNvram = 0;

    wifiPasswordFromNvram = v2->_wifiPasswordFromNvram;
    v2->_wifiPasswordFromNvram = 0;

    uint64_t v8 = +[CBRemoteSetupManager sharedInstance];
    remoteSetupManager = v2->_remoteSetupManager;
    v2->_remoteSetupManager = (CBRemoteSetupManager *)v8;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = [(CBUserSettings *)self wifiReconnectTimer];

  if (v4)
  {
    v5 = [(CBUserSettings *)self wifiReconnectTimer];
    [v5 invalidate];

    [(CBUserSettings *)self setWifiReconnectTimer:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)CBUserSettings;
  [(CBUserSettings *)&v6 dealloc];
}

- (void)checkInWiFiSettings:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking in user's Wi-Fi settings…", (uint8_t *)v8, 2u);
  }

  [(CBUserSettings *)self setCheckedInWiFiSettings:1];
  [(CBUserSettings *)self setWifiPowerStateOn:v3];
  objc_super v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [(CBUserSettings *)self wifiPowerStateOn];
    v8[0] = 67109120;
    v8[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User's Setting [Wi-Fi]: %d", (uint8_t *)v8, 8u);
  }
}

- (void)assignProxyServer:(id)a3
{
  id v4 = a3;
  v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting proxy server..", v6, 2u);
  }

  [(CBUserSettings *)self setProxyServer:v4];
}

- (void)applyPreUISettingsFromNvram
{
  [(CBUserSettings *)self _setDesiredUserDefaults];
  if (MGGetBoolAnswer())
  {
    [(CBUserSettings *)self _setOverrideRemoteSetupPin];
  }
  else
  {
    BOOL v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CheckerBoard is running on customer install. Ignoring remote setup pin override", v4, 2u);
    }
  }
}

- (void)applyPostUISettingsFromNvramWithNavigationController:(id)a3
{
  id v4 = a3;
  if (+[CBUtilities isInternalInstall])
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    [(CBUserSettings *)self setDiagsLaunchDependenciesSemaphore:v5];

    [(CBUserSettings *)self _setLanguageFromNVRam];
    [(CBUserSettings *)self _setWiFiFromNVRam];
    [(CBUserSettings *)self _setSkipDiagsTermsAndConditionsFromNVRam];
    [(CBUserSettings *)self _setAutoDiagsFromNVRamWithNavController:v4];
  }
  else
  {
    objc_super v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CheckerBoard is running on customer install. Ignoring automation assistance settings", v7, 2u);
    }
  }
}

- (void)_setDesiredUserDefaults
{
  BOOL v3 = +[NSBundle mainBundle];
  id v4 = [v3 bundleIdentifier];
  [v4 cStringUsingEncoding:4];
  int v5 = os_variant_uses_ephemeral_storage();

  if (!v5)
  {
    objc_super v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      unsigned int v7 = "CheckerBoard launched without ephemeral storage. Not altering user defaults";
      uint64_t v8 = (uint8_t *)&v9;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
LABEL_11:

    return;
  }
  [(CBUserSettings *)self _disableContinousPath];
  if (![(CBUserSettings *)self _isPermittedToUpdateASTDefaults])
  {
    objc_super v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned int v7 = "Not permitted to update AST defaults";
      uint64_t v8 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }

  [(CBUserSettings *)self _updateASTDefaultsFromNVRam];
}

- (void)_disableContinousPath
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.keyboard.ContinuousPath"];
  [v2 setBool:0 forKey:@"KeyboardContinuousPathEnabled"];
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disabled keyboard continuous path.", v4, 2u);
  }
}

- (BOOL)_isPermittedToUpdateASTDefaults
{
  id v2 = +[CBAPTicket sharedInstance];
  unsigned int v3 = [v2 isEntitledForTag:1633776739];

  int v4 = MGGetBoolAnswer();
  id v13 = 0;
  unsigned int v5 = +[CBSNVRamUtil readNVRamVariable:@"AlwaysEnforceAATCInCheckerBoard" value:&v13];
  id v6 = v13;
  unsigned int v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || ![v6 length])
  {
    unsigned int v10 = 0;
  }
  else
  {
    id v9 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
    unsigned int v10 = [v9 BOOLValue];
  }
  v11 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    int v15 = v3 | (v4 | v10) ^ 1;
    __int16 v16 = 1024;
    unsigned int v17 = v3;
    __int16 v18 = 1024;
    int v19 = v4;
    __int16 v20 = 1024;
    unsigned int v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Permitted to update AST Defaults: (%d). Entitled: (%d)  Fusing: (%d) Fusing Ignored: (%d)", buf, 0x1Au);
  }

  return v3 | (v4 | v10) ^ 1;
}

- (BOOL)shouldShowInfoPane
{
  if (qword_10008FD78 != -1) {
    dispatch_once(&qword_10008FD78, &stru_100079590);
  }
  return byte_10008FD70;
}

- (void)_updateASTDefaultsFromNVRam
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.AppleServiceToolkit"];
  unsigned int v3 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.AppleServiceToolkit", @"Server"];
  int v4 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.AppleServiceToolkit", @"CustomServerURL"];
  id v18 = 0;
  unsigned int v5 = +[CBSNVRamUtil readNVRamVariable:v3 value:&v18];
  id v6 = v18;
  unsigned int v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && [v6 length])
  {
    id v9 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
    unsigned int v10 = +[NSNumber numberWithInteger:[v9 integerValue]];
    [v2 setValue:v10 forKey:@"Server"];
    v11 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set AST Server environment to %@", buf, 0xCu);
    }

    if ([v10 isEqualToNumber:&off_10007CC18])
    {
      id v17 = 0;
      unsigned int v12 = +[CBSNVRamUtil readNVRamVariable:v4 value:&v17];
      id v13 = v17;
      v14 = v13;
      if (v12 && v13 && [v13 length])
      {
        int v15 = [objc_alloc((Class)NSString) initWithData:v14 encoding:4];
        [v2 setValue:v15 forKey:@"CustomServerURL"];
        __int16 v16 = CheckerBoardLogHandleForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v20 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Set AST Server URL to %@", buf, 0xCu);
        }

LABEL_20:
        goto LABEL_21;
      }
    }
    else
    {
      v14 = 0;
    }
    int v15 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to read value for %@ from nvram", buf, 0xCu);
    }
    goto LABEL_20;
  }
  id v9 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to read value for %@ from nvram", buf, 0xCu);
  }
LABEL_21:
}

- (void)_attemptConnectingToWifi
{
  unsigned int v3 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000077D0;
  block[3] = &unk_1000794E0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_setLanguageFromNVRam
{
  id v9 = 0;
  unsigned int v2 = +[CBSNVRamUtil readNVRamVariable:@"cb-language" value:&v9];
  id v3 = v9;
  int v4 = v3;
  id v5 = 0;
  if (v2) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    if ([v3 length])
    {
      id v5 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];
      unsigned int v7 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attempting to change language to %@", buf, 0xCu);
      }

      BOOL v8 = +[CBLocationController sharedLocationController];
      [v8 selectLanguage:v5 restartAfterCompletion:0];
    }
    else
    {
      id v5 = 0;
    }
  }
}

- (void)_setWiFiFromNVRam
{
  id v15 = 0;
  unsigned int v3 = +[CBSNVRamUtil readNVRamVariable:@"cb-wifi-ssid" value:&v15];
  id v4 = v15;
  id v5 = v4;
  id v6 = 0;
  if (v3) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if ([v4 length]) {
      id v6 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];
    }
    else {
      id v6 = 0;
    }
  }
  id v14 = 0;
  unsigned int v8 = +[CBSNVRamUtil readNVRamVariable:@"cb-wifi-password" value:&v14];
  id v9 = v14;
  unsigned int v10 = v9;
  id v11 = 0;
  if (v8) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    if (![v9 length])
    {
      id v11 = 0;
      if (v6) {
        goto LABEL_15;
      }
LABEL_17:
      id v13 = [(CBUserSettings *)self diagsLaunchDependenciesSemaphore];
      dispatch_semaphore_signal(v13);

      goto LABEL_18;
    }
    id v11 = [objc_alloc((Class)NSString) initWithData:v10 encoding:4];
    [(CBUserSettings *)self setWifiRequiresPassword:v11 != 0];
  }
  if (!v6) {
    goto LABEL_17;
  }
LABEL_15:
  [(CBUserSettings *)self setWifiSSIDFromNvram:v6];
  [(CBUserSettings *)self setWifiPasswordFromNvram:v11];
  [(CBUserSettings *)self _attemptConnectingToWifi];
LABEL_18:
}

- (void)_setSkipDiagsTermsAndConditionsFromNVRam
{
  id v13 = 0;
  unsigned int v2 = +[CBSNVRamUtil readNVRamVariable:@"cb-skip-diags-terms-conditions" value:&v13];
  id v3 = v13;
  id v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && [v3 length])
  {
    id v6 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];
    id v7 = [v6 BOOLValue];

    unsigned int v8 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Disabling Diagnostics T&Cs", buf, 2u);
    }

    id v9 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Diagnostics"];
    [v9 setBool:v7 forKey:@"SkipTermsAndConditions"];
    unsigned int v10 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Disabled Diagnostics Terms And Conditions.", v11, 2u);
    }
  }
}

- (void)_setAutoDiagsFromNVRamWithNavController:(id)a3
{
  id v4 = a3;
  BOOL v5 = dispatch_get_global_queue(21, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000080AC;
  v7[3] = &unk_1000795E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_setOverrideRemoteSetupPin
{
  id v11 = 0;
  unsigned int v3 = +[CBSNVRamUtil readNVRamVariable:@"cb-remote-setup-pin" value:&v11];
  id v4 = v11;
  BOOL v5 = v4;
  id v6 = 0;
  if (v3) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if ([v4 length])
    {
      id v8 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];
      id v6 = v8;
      if (v8 && [v8 length] == (id)6)
      {
        id v9 = CheckerBoardLogHandleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v13 = v5;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting Remote Setup override pin of %@", buf, 0xCu);
        }

        unsigned int v10 = [(CBUserSettings *)self remoteSetupManager];
        [v10 setOverrideAuthPin:v6];
      }
    }
    else
    {
      id v6 = 0;
    }
  }
}

- (BOOL)checkedInWiFiSettings
{
  return self->_checkedInWiFiSettings;
}

- (void)setCheckedInWiFiSettings:(BOOL)a3
{
  self->_checkedInWiFiSettings = a3;
}

- (BOOL)wifiPowerStateOn
{
  return self->_wifiPowerStateOn;
}

- (void)setWifiPowerStateOn:(BOOL)a3
{
  self->_wifiPowerStateOn = a3;
}

- (CBSProxyServer)proxyServer
{
  return self->_proxyServer;
}

- (void)setProxyServer:(id)a3
{
}

- (BOOL)wifiRequiresPassword
{
  return self->_wifiRequiresPassword;
}

- (void)setWifiRequiresPassword:(BOOL)a3
{
  self->_wifiRequiresPassword = a3;
}

- (NSTimer)wifiReconnectTimer
{
  return self->_wifiReconnectTimer;
}

- (void)setWifiReconnectTimer:(id)a3
{
}

- (unint64_t)wifiJoinAttemptCount
{
  return self->_wifiJoinAttemptCount;
}

- (void)setWifiJoinAttemptCount:(unint64_t)a3
{
  self->_wifiJoinAttemptCount = a3;
}

- (NSString)wifiSSIDFromNvram
{
  return self->_wifiSSIDFromNvram;
}

- (void)setWifiSSIDFromNvram:(id)a3
{
}

- (NSString)wifiPasswordFromNvram
{
  return self->_wifiPasswordFromNvram;
}

- (void)setWifiPasswordFromNvram:(id)a3
{
}

- (OS_dispatch_semaphore)diagsLaunchDependenciesSemaphore
{
  return self->_diagsLaunchDependenciesSemaphore;
}

- (void)setDiagsLaunchDependenciesSemaphore:(id)a3
{
}

- (CBRemoteSetupManager)remoteSetupManager
{
  return self->_remoteSetupManager;
}

- (void)setRemoteSetupManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteSetupManager, 0);
  objc_storeStrong((id *)&self->_diagsLaunchDependenciesSemaphore, 0);
  objc_storeStrong((id *)&self->_wifiPasswordFromNvram, 0);
  objc_storeStrong((id *)&self->_wifiSSIDFromNvram, 0);
  objc_storeStrong((id *)&self->_wifiReconnectTimer, 0);

  objc_storeStrong((id *)&self->_proxyServer, 0);
}

@end