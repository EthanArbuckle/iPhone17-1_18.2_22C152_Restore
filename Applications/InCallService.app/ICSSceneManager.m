@interface ICSSceneManager
- (BOOL)callSceneHasPresentedFullScreen;
- (BOOL)hasActiveOrPendingFullScreenCallScene;
- (BOOL)hasPendingCompletionForSceneType:(unint64_t)a3 presentationMode:(int64_t)a4;
- (BOOL)hasPendingOrExistingSceneOfType:(unint64_t)a3;
- (BOOL)hasPendingSceneOfType:(unint64_t)a3;
- (BOOL)usesSBSUIInCallWindowSceneForType:(unint64_t)a3;
- (ICSSceneManager)init;
- (SBSUIInCallWindowScene)callScene;
- (SBSUIInCallWindowScene)screenSharingScene;
- (UIScene)ambientScene;
- (UIScene)clarityUIScene;
- (UIScene)screenSharingBroadcasterScene;
- (id)genericSceneOfType:(unint64_t)a3;
- (id)sceneOfType:(unint64_t)a3;
- (unint64_t)sceneTypeForConfigurationIdentifier:(id)a3;
- (void)didDisconnectSceneOfType:(unint64_t)a3 withIdentifier:(id)a4;
- (void)didDismissSceneOfType:(unint64_t)a3;
- (void)didInvalidatePendingSceneOfType:(unint64_t)a3 withIdentifier:(id)a4;
- (void)didRequestSceneOfType:(unint64_t)a3 withIdentifier:(id)a4;
- (void)didUpdatePresentationMode:(int64_t)a3 forScene:(id)a4;
- (void)registerGenericScene:(id)a3 ofType:(unint64_t)a4;
- (void)registerScene:(id)a3 ofType:(unint64_t)a4;
- (void)waitForPresentationMode:(int64_t)a3 forSceneOfType:(unint64_t)a4 completion:(id)a5;
- (void)waitForRegistrationOfGenericSceneWithType:(unint64_t)a3 completion:(id)a4;
- (void)waitForRegistrationOfSceneWithType:(unint64_t)a3 completion:(id)a4;
@end

@implementation ICSSceneManager

- (ICSSceneManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)ICSSceneManager;
  v2 = [(ICSSceneManager *)&v17 init];
  if (v2)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    uint64_t v3 = +[NSMapTable strongToWeakObjectsMapTable];
    sceneMapping = v2->_sceneMapping;
    v2->_sceneMapping = (NSMapTable *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionaryWithCapacity:2];
    configurationIdentifierToSceneTypeMapping = v2->_configurationIdentifierToSceneTypeMapping;
    v2->_configurationIdentifierToSceneTypeMapping = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableSet set];
    pendingSceneTypes = v2->_pendingSceneTypes;
    v2->_pendingSceneTypes = (NSMutableSet *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionaryWithCapacity:2];
    sceneTypeToRegisterBlockMapping = v2->_sceneTypeToRegisterBlockMapping;
    v2->_sceneTypeToRegisterBlockMapping = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionaryWithCapacity:2];
    sceneTypeAndPresentationModeToBlockMapping = v2->_sceneTypeAndPresentationModeToBlockMapping;
    v2->_sceneTypeAndPresentationModeToBlockMapping = (NSMutableDictionary *)v11;

    uint64_t v13 = +[NSMutableSet set];
    sceneTypesPresentedFullScreen = v2->_sceneTypesPresentedFullScreen;
    v2->_sceneTypesPresentedFullScreen = (NSMutableSet *)v13;

    v15 = v2;
  }

  return v2;
}

- (SBSUIInCallWindowScene)callScene
{
  return (SBSUIInCallWindowScene *)[(ICSSceneManager *)self sceneOfType:0];
}

- (SBSUIInCallWindowScene)screenSharingScene
{
  return (SBSUIInCallWindowScene *)[(ICSSceneManager *)self sceneOfType:1];
}

- (UIScene)screenSharingBroadcasterScene
{
  return (UIScene *)[(ICSSceneManager *)self genericSceneOfType:2];
}

- (UIScene)ambientScene
{
  return (UIScene *)[(ICSSceneManager *)self genericSceneOfType:5];
}

- (UIScene)clarityUIScene
{
  return (UIScene *)[(ICSSceneManager *)self genericSceneOfType:3];
}

- (BOOL)callSceneHasPresentedFullScreen
{
  return [(NSMutableSet *)self->_sceneTypesPresentedFullScreen containsObject:&off_1002DEC28];
}

- (BOOL)usesSBSUIInCallWindowSceneForType:(unint64_t)a3
{
  return (a3 > 5) | (0x13u >> a3) & 1;
}

- (BOOL)hasActiveOrPendingFullScreenCallScene
{
  uint64_t v3 = [(ICSSceneManager *)self callScene];
  if ([v3 presentationMode] == (id)2)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(ICSSceneManager *)self callScene];
    if ([v5 presentationMode] == (id)3
      || [(ICSSceneManager *)self hasPendingCompletionForSceneType:0 presentationMode:2])
    {
      BOOL v4 = 1;
    }
    else
    {
      BOOL v4 = [(ICSSceneManager *)self hasPendingCompletionForSceneType:0 presentationMode:3];
    }
  }
  return v4;
}

- (id)sceneOfType:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (![(ICSSceneManager *)self usesSBSUIInCallWindowSceneForType:a3])
  {
    if (a3 - 1 > 5) {
      CFStringRef v5 = @"call";
    }
    else {
      CFStringRef v5 = *(&off_1002CD880 + a3 - 1);
    }
    v6 = +[NSString stringWithFormat:@"Attempted to get scene of class SBSUIInCallWindowScene for invalid scene type: %@", v5];
    NSLog(@"** TUAssertion failure: %@", v6);

    _TUAssertShouldCrashApplication();
  }

  return [(ICSSceneManager *)self genericSceneOfType:a3];
}

- (id)genericSceneOfType:(unint64_t)a3
{
  sceneMapping = self->_sceneMapping;
  BOOL v4 = +[NSNumber numberWithUnsignedInteger:a3];
  CFStringRef v5 = [(NSMapTable *)sceneMapping objectForKey:v4];

  return v5;
}

- (unint64_t)sceneTypeForConfigurationIdentifier:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(NSMutableDictionary *)self->_configurationIdentifierToSceneTypeMapping objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 unsignedIntValue];
  }
  else
  {
    v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1001E92B8((uint64_t)v4, v8);
    }

    unint64_t v7 = 0;
  }

  return v7;
}

- (void)registerScene:(id)a3 ofType:(unint64_t)a4
{
  id v8 = a3;
  if (![(ICSSceneManager *)self usesSBSUIInCallWindowSceneForType:a4])
  {
    if (a4 - 1 > 5) {
      CFStringRef v6 = @"call";
    }
    else {
      CFStringRef v6 = *(&off_1002CD880 + a4 - 1);
    }
    unint64_t v7 = +[NSString stringWithFormat:@"Attempted to register scene of class SBSUIInCallWindowScene for invalid scene type: %@", v6];
    NSLog(@"** TUAssertion failure: %@", v7);

    _TUAssertShouldCrashApplication();
  }
  [(ICSSceneManager *)self registerGenericScene:v8 ofType:a4];
}

- (void)registerGenericScene:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  pendingSceneTypes = self->_pendingSceneTypes;
  id v8 = +[NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableSet *)pendingSceneTypes removeObject:v8];

  uint64_t v9 = [(ICSSceneManager *)self genericSceneOfType:a4];
  if (v9)
  {
    v10 = sub_1000D52D8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a4 - 1 > 5) {
        CFStringRef v11 = @"call";
      }
      else {
        CFStringRef v11 = *(&off_1002CD880 + a4 - 1);
      }
      int v19 = 138412802;
      v20 = v9;
      __int16 v21 = 2114;
      CFStringRef v22 = v11;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Warning]: Existing scene '%@' already exists for type '%{public}@'. Ignoring new scene '%@'", (uint8_t *)&v19, 0x20u);
    }
  }
  else
  {
    sceneMapping = self->_sceneMapping;
    uint64_t v13 = +[NSNumber numberWithUnsignedInteger:a4];
    [(NSMapTable *)sceneMapping setObject:v6 forKey:v13];

    sceneTypeToRegisterBlockMapping = self->_sceneTypeToRegisterBlockMapping;
    v15 = +[NSNumber numberWithUnsignedInteger:a4];
    v16 = [(NSMutableDictionary *)sceneTypeToRegisterBlockMapping objectForKeyedSubscript:v15];

    if (v16) {
      ((void (**)(void, id))v16)[2](v16, v6);
    }
    objc_super v17 = self->_sceneTypeToRegisterBlockMapping;
    v18 = +[NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v17 setObject:0 forKeyedSubscript:v18];
  }
}

- (void)didUpdatePresentationMode:(int64_t)a3 forScene:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  unint64_t v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = SBSInCallPresentationModeDescription();
    int v23 = 138543362;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ICSSceneManager did update presentationMode to %{public}@", (uint8_t *)&v23, 0xCu);
  }
  id v9 = [v6 ics_sceneType];
  v10 = [(ICSSceneManager *)self sceneOfType:v9];
  if (v10)
  {
    sceneTypeAndPresentationModeToBlockMapping = self->_sceneTypeAndPresentationModeToBlockMapping;
    v12 = +[NSNumber numberWithUnsignedInteger:v9];
    uint64_t v13 = [(NSMutableDictionary *)sceneTypeAndPresentationModeToBlockMapping objectForKeyedSubscript:v12];
    v14 = +[NSNumber numberWithInteger:a3];
    v15 = [v13 objectForKeyedSubscript:v14];

    if (v15) {
      ((void (**)(void, id))v15)[2](v15, v6);
    }
    v16 = self->_sceneTypeAndPresentationModeToBlockMapping;
    objc_super v17 = +[NSNumber numberWithUnsignedInteger:v9];
    v18 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:v17];
    int v19 = +[NSNumber numberWithInteger:a3];
    [v18 setObject:0 forKeyedSubscript:v19];

    if (a3 == 2)
    {
      sceneTypesPresentedFullScreen = self->_sceneTypesPresentedFullScreen;
      __int16 v21 = +[NSNumber numberWithUnsignedInteger:v9];
      [(NSMutableSet *)sceneTypesPresentedFullScreen addObject:v21];
    }
  }
  else
  {
    CFStringRef v22 = sub_1000D52D8();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1001E9330((uint64_t)v9, (uint64_t)v6, v22);
    }
  }
}

- (void)didRequestSceneOfType:(unint64_t)a3 withIdentifier:(id)a4
{
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  pendingSceneTypes = self->_pendingSceneTypes;
  unint64_t v7 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableSet *)pendingSceneTypes addObject:v7];

  if (v9)
  {
    id v8 = +[NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)self->_configurationIdentifierToSceneTypeMapping setObject:v8 forKeyedSubscript:v9];
  }
}

- (void)didInvalidatePendingSceneOfType:(unint64_t)a3 withIdentifier:(id)a4
{
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  pendingSceneTypes = self->_pendingSceneTypes;
  unint64_t v7 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableSet *)pendingSceneTypes removeObject:v7];

  id v8 = v9;
  if (v9)
  {
    [(NSMutableDictionary *)self->_configurationIdentifierToSceneTypeMapping removeObjectForKey:v9];
    id v8 = v9;
  }
}

- (BOOL)hasPendingOrExistingSceneOfType:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  pendingSceneTypes = self->_pendingSceneTypes;
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  if ([(NSMutableSet *)pendingSceneTypes containsObject:v6])
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(ICSSceneManager *)self sceneOfType:a3];
    BOOL v7 = v8 != 0;
  }
  return v7;
}

- (BOOL)hasPendingSceneOfType:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  pendingSceneTypes = self->_pendingSceneTypes;
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  LOBYTE(pendingSceneTypes) = [(NSMutableSet *)pendingSceneTypes containsObject:v6];

  return (char)pendingSceneTypes;
}

- (BOOL)hasPendingCompletionForSceneType:(unint64_t)a3 presentationMode:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  sceneTypeAndPresentationModeToBlockMapping = self->_sceneTypeAndPresentationModeToBlockMapping;
  id v8 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)sceneTypeAndPresentationModeToBlockMapping objectForKeyedSubscript:v8];
  v10 = +[NSNumber numberWithInteger:a4];
  CFStringRef v11 = [v9 objectForKeyedSubscript:v10];
  BOOL v12 = v11 != 0;

  return v12;
}

- (void)didDismissSceneOfType:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  sceneMapping = self->_sceneMapping;
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMapTable *)sceneMapping removeObjectForKey:v6];

  pendingSceneTypes = self->_pendingSceneTypes;
  id v8 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableSet *)pendingSceneTypes removeObject:v8];

  sceneTypesPresentedFullScreen = self->_sceneTypesPresentedFullScreen;
  id v10 = +[NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableSet *)sceneTypesPresentedFullScreen removeObject:v10];
}

- (void)didDisconnectSceneOfType:(unint64_t)a3 withIdentifier:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(NSMutableDictionary *)self->_configurationIdentifierToSceneTypeMapping removeObjectForKey:v5];
}

- (void)waitForRegistrationOfSceneWithType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (![(ICSSceneManager *)self usesSBSUIInCallWindowSceneForType:a3])
  {
    if (a3 - 1 > 5) {
      CFStringRef v7 = @"call";
    }
    else {
      CFStringRef v7 = *(&off_1002CD880 + a3 - 1);
    }
    id v8 = +[NSString stringWithFormat:@"Attempted to wait for registration of SBSUIInCallWindowScene scene for invalid scene type: %@", v7];
    NSLog(@"** TUAssertion failure: %@", v8);

    _TUAssertShouldCrashApplication();
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000124D4;
  v10[3] = &unk_1002CD810;
  id v11 = v6;
  id v9 = v6;
  [(ICSSceneManager *)self waitForRegistrationOfGenericSceneWithType:a3 completion:v10];
}

- (void)waitForRegistrationOfGenericSceneWithType:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  CFStringRef v7 = [(ICSSceneManager *)self genericSceneOfType:a3];
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    sceneTypeToRegisterBlockMapping = self->_sceneTypeToRegisterBlockMapping;
    id v9 = +[NSNumber numberWithUnsignedInteger:a3];
    id v10 = [(NSMutableDictionary *)sceneTypeToRegisterBlockMapping objectForKeyedSubscript:v9];

    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_10001265C;
    int v19 = &unk_1002CD838;
    id v20 = v10;
    __int16 v21 = v6;
    id v11 = v10;
    BOOL v12 = objc_retainBlock(&v16);
    uint64_t v13 = objc_retainBlock(v12);
    v14 = self->_sceneTypeToRegisterBlockMapping;
    v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3, v16, v17, v18, v19);
    [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];
  }
}

- (void)waitForPresentationMode:(int64_t)a3 forSceneOfType:(unint64_t)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  if (![(ICSSceneManager *)self usesSBSUIInCallWindowSceneForType:a4])
  {
    if (a4 - 1 > 5) {
      CFStringRef v9 = @"call";
    }
    else {
      CFStringRef v9 = *(&off_1002CD880 + a4 - 1);
    }
    id v10 = +[NSString stringWithFormat:@"Attempted to wait for presentation mode of SBSUIInCallWindowScene scene for invalid scene type: %@", v9];
    NSLog(@"** TUAssertion failure: %@", v10);

    _TUAssertShouldCrashApplication();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v11 = [(ICSSceneManager *)self sceneOfType:a4];
  BOOL v12 = v11;
  if (v11 && [v11 presentationMode] == (id)a3)
  {
    v8[2](v8, v12);
  }
  else
  {
    sceneTypeAndPresentationModeToBlockMapping = self->_sceneTypeAndPresentationModeToBlockMapping;
    v14 = +[NSNumber numberWithUnsignedInteger:a4];
    v15 = [(NSMutableDictionary *)sceneTypeAndPresentationModeToBlockMapping objectForKeyedSubscript:v14];

    if (!v15)
    {
      v15 = +[NSMutableDictionary dictionary];
      v16 = self->_sceneTypeAndPresentationModeToBlockMapping;
      uint64_t v17 = +[NSNumber numberWithUnsignedInteger:a4];
      [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v17];
    }
    v18 = +[NSNumber numberWithInteger:a3];
    int v19 = [v15 objectForKeyedSubscript:v18];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100012940;
    v24[3] = &unk_1002CD860;
    id v25 = v19;
    v26 = v8;
    id v20 = v19;
    __int16 v21 = objc_retainBlock(v24);
    CFStringRef v22 = objc_retainBlock(v21);
    int v23 = +[NSNumber numberWithInteger:a3];
    [v15 setObject:v22 forKeyedSubscript:v23];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneTypesPresentedFullScreen, 0);
  objc_storeStrong((id *)&self->_sceneTypeAndPresentationModeToBlockMapping, 0);
  objc_storeStrong((id *)&self->_sceneTypeToRegisterBlockMapping, 0);
  objc_storeStrong((id *)&self->_pendingSceneTypes, 0);
  objc_storeStrong((id *)&self->_configurationIdentifierToSceneTypeMapping, 0);

  objc_storeStrong((id *)&self->_sceneMapping, 0);
}

@end