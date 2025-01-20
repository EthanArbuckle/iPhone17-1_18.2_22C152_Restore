@interface IOUIANSceneDelegateLDCM
- (BOOL)soundPlaying;
- (UIWindow)window;
- (void)emergencyDialerWasDismissed:(id)a3;
- (void)emergencyDialerWasPresented:(id)a3;
- (void)playSound;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setSoundPlaying:(BOOL)a3;
- (void)setWindow:(id)a3;
- (void)stopSound;
@end

@implementation IOUIANSceneDelegateLDCM

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v21 = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Initializing LDCM critical UI scene... (scene: %@)", (uint8_t *)&v21, 0xCu);
  }
  v7 = [IOANUIWindowSecure alloc];
  v8 = +[UIScreen mainScreen];
  [v8 bounds];
  v9 = -[IOANUIWindowSecure initWithFrame:](v7, "initWithFrame:");
  [(IOUIANSceneDelegateLDCM *)self setWindow:v9];

  v10 = [(IOUIANSceneDelegateLDCM *)self window];
  [v10 setWindowScene:v6];

  v11 = objc_opt_new();
  [v11 setDelegate:self];
  v12 = +[UIImageSymbolConfiguration configurationWithPointSize:3 weight:64.0];
  v13 = +[UIImageSymbolConfiguration configurationPreferringMulticolor];
  v14 = [v12 configurationByApplyingConfiguration:v13];

  [v11 setImageWithSystemImageNamed:@"drop.triangle.fill" andConfiguration:v14];
  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"Liquid Detected in USB‑C Connector" value:&stru_10000C608 table:0];
  [v11 setHeaderText:v16];

  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"Disconnect charging cable to prevent damage to iPhone. Allow the connector to dry. This may take several hours." value:&stru_10000C608 table:0];
  [v11 setMessageText:v18];

  v19 = [(IOUIANSceneDelegateLDCM *)self window];
  [v19 setRootViewController:v11];

  v20 = [(IOUIANSceneDelegateLDCM *)self window];
  [v20 makeKeyAndVisible];
}

- (void)sceneDidDisconnect:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000066C8();
  }
  [(IOUIANSceneDelegateLDCM *)self stopSound];
}

- (void)sceneDidBecomeActive:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100006738();
  }
}

- (void)sceneWillResignActive:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000067A8();
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100006818();
  }
  [(IOUIANSceneDelegateLDCM *)self playSound];
}

- (void)sceneDidEnterBackground:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100006888();
  }
  [(IOUIANSceneDelegateLDCM *)self stopSound];
}

- (void)emergencyDialerWasPresented:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Emergency dialer was presented! (viewController: %@)", (uint8_t *)&v5, 0xCu);
  }
  [(IOUIANSceneDelegateLDCM *)self stopSound];
}

- (void)emergencyDialerWasDismissed:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Emergency dialer was dismissed! (viewController: %@)", (uint8_t *)&v5, 0xCu);
  }
  [(IOUIANSceneDelegateLDCM *)self playSound];
}

- (void)playSound
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Playing sound...", v4, 2u);
  }
  if (![(IOUIANSceneDelegateLDCM *)self soundPlaying])
  {
    v5[0] = kAudioServicesPlaySystemSoundOptionIgnoreRingerSwitchKey;
    v5[1] = kAudioServicesPlaySystemSoundOptionLoopKey;
    v6[0] = &__kCFBooleanTrue;
    v6[1] = &__kCFBooleanTrue;
    v5[2] = kAudioServicesPlaySystemSoundOptionLoopPeriodKey;
    v5[3] = kAudioServicesPlaySystemSoundOptionVibrationPatternKey;
    v6[2] = &off_10000C748;
    v6[3] = &__kCFBooleanTrue;
    v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000068F8();
    }
    AudioServicesPlaySystemSoundWithOptions();
    [(IOUIANSceneDelegateLDCM *)self setSoundPlaying:1];
  }
}

- (void)stopSound
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Stopping sound...", v3, 2u);
  }
  if ([(IOUIANSceneDelegateLDCM *)self soundPlaying])
  {
    AudioServicesStopSystemSound();
    [(IOUIANSceneDelegateLDCM *)self setSoundPlaying:0];
  }
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (BOOL)soundPlaying
{
  return self->_soundPlaying;
}

- (void)setSoundPlaying:(BOOL)a3
{
  self->_soundPlaying = a3;
}

- (void).cxx_destruct
{
}

@end