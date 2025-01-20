@interface IntentHandler
- (TVRCDeviceEventManager)eventManager;
- (id)_resolveApplication:(id)a3;
- (id)_resolveCaptionsToggle:(int64_t)a3;
- (id)_resolveDevice:(id)a3;
- (id)_resolveMediaCommand:(int64_t)a3;
- (id)_resolveReduceLoudSoundsToggle:(id)a3;
- (id)_resolveSkipCommand:(int64_t)a3;
- (id)_resolveSkipDuration:(id)a3;
- (id)_resolveSystemAppearanceToggle:(int64_t)a3;
- (id)_resolveUserAccount:(id)a3;
- (id)defaultApplicationForLaunchApplication:(id)a3;
- (id)handlerForIntent:(id)a3;
- (void)confirmLaunchTVApp:(id)a3 completion:(id)a4;
- (void)handleLaunchApplication:(id)a3 completion:(id)a4;
- (void)handleLaunchRemote:(id)a3 completion:(id)a4;
- (void)handleLaunchScreenSaver:(id)a3 completion:(id)a4;
- (void)handleLaunchTVApp:(id)a3 completion:(id)a4;
- (void)handlePauseContent:(id)a3 completion:(id)a4;
- (void)handleReduceLoudSounds:(id)a3 completion:(id)a4;
- (void)handleSkipContent:(id)a3 completion:(id)a4;
- (void)handleSleepAppleTV:(id)a3 completion:(id)a4;
- (void)handleSwitchUserAccount:(id)a3 completion:(id)a4;
- (void)handleToggleCaptions:(id)a3 completion:(id)a4;
- (void)handleToggleSystemAppearance:(id)a3 completion:(id)a4;
- (void)handleWakeAppleTV:(id)a3 completion:(id)a4;
- (void)provideAccountOptionsCollectionForSwitchUserAccount:(id)a3 withCompletion:(id)a4;
- (void)provideApplicationOptionsCollectionForLaunchApplication:(id)a3 withCompletion:(id)a4;
- (void)provideDeviceOptionsCollectionForLaunchApplication:(id)a3 withCompletion:(id)a4;
- (void)provideDeviceOptionsCollectionForLaunchRemote:(id)a3 withCompletion:(id)a4;
- (void)provideDeviceOptionsCollectionForLaunchScreenSaver:(id)a3 withCompletion:(id)a4;
- (void)provideDeviceOptionsCollectionForPauseContent:(id)a3 withCompletion:(id)a4;
- (void)provideDeviceOptionsCollectionForReduceLoudSounds:(id)a3 withCompletion:(id)a4;
- (void)provideDeviceOptionsCollectionForSkipContent:(id)a3 withCompletion:(id)a4;
- (void)provideDeviceOptionsCollectionForSleepAppleTV:(id)a3 withCompletion:(id)a4;
- (void)provideDeviceOptionsCollectionForSwitchUserAccount:(id)a3 withCompletion:(id)a4;
- (void)provideDeviceOptionsCollectionForToggleCaptions:(id)a3 withCompletion:(id)a4;
- (void)provideDeviceOptionsCollectionForToggleSystemAppearance:(id)a3 withCompletion:(id)a4;
- (void)provideDeviceOptionsCollectionForWakeAppleTV:(id)a3 withCompletion:(id)a4;
- (void)resolveAccountForSwitchUserAccount:(id)a3 withCompletion:(id)a4;
- (void)resolveAppearanceToggleForToggleSystemAppearance:(id)a3 withCompletion:(id)a4;
- (void)resolveApplicationForLaunchApplication:(id)a3 withCompletion:(id)a4;
- (void)resolveDeviceForLaunchApplication:(id)a3 withCompletion:(id)a4;
- (void)resolveDeviceForLaunchRemote:(id)a3 withCompletion:(id)a4;
- (void)resolveDeviceForLaunchScreenSaver:(id)a3 withCompletion:(id)a4;
- (void)resolveDeviceForPauseContent:(id)a3 withCompletion:(id)a4;
- (void)resolveDeviceForReduceLoudSounds:(id)a3 withCompletion:(id)a4;
- (void)resolveDeviceForSkipContent:(id)a3 withCompletion:(id)a4;
- (void)resolveDeviceForSleepAppleTV:(id)a3 withCompletion:(id)a4;
- (void)resolveDeviceForSwitchUserAccount:(id)a3 withCompletion:(id)a4;
- (void)resolveDeviceForToggleCaptions:(id)a3 withCompletion:(id)a4;
- (void)resolveDeviceForToggleSystemAppearance:(id)a3 withCompletion:(id)a4;
- (void)resolveDeviceForWakeAppleTV:(id)a3 withCompletion:(id)a4;
- (void)resolveMediaCommandForPauseContent:(id)a3 withCompletion:(id)a4;
- (void)resolveSkipCommandForSkipContent:(id)a3 withCompletion:(id)a4;
- (void)resolveSkipDurationForSkipContent:(id)a3 withCompletion:(id)a4;
- (void)resolveToggleForReduceLoudSounds:(id)a3 withCompletion:(id)a4;
- (void)resolveToggleForToggleCaptions:(id)a3 withCompletion:(id)a4;
- (void)setEventManager:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[IntentHandler handlerForIntent:]";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v7, 0x16u);
  }

  return self;
}

- (void)handleWakeAppleTV:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[IntentHandler handleWakeAppleTV:completion:]";
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  v8 = +[TVRIntentExtensionDeviceManager sharedInstance];
  __int16 v9 = [v5 device];
  id v10 = [v9 identifier];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __46__IntentHandler_handleWakeAppleTV_completion___block_invoke;
  v13[3] = &unk_100010378;
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  [v8 resolveDeviceWithIdentifier:v10 handler:v13];
}

void __46__IntentHandler_handleWakeAppleTV_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = _TVRIntentExtensionLog();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v17 = 138543618;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    id v10 = [objc_alloc((Class)TVRCButton) _initWithButtonType:21];
    id v11 = +[TVRCButtonEvent buttonEventForButton:v10 eventType:2];
    [v5 sendButtonEvent:v11];

    id v12 = [objc_alloc((Class)WakeAppleTVIntentResponse) initWithCode:4 userActivity:0];
    v13 = +[TVRCAnalytics sharedInstance];
    [v13 logShortcutActionRunWithType:@"Wake_AppleTV"];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();
    }

    id v12 = [objc_alloc((Class)WakeAppleTVIntentResponse) initWithCode:5 userActivity:0];
  }
  id v14 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v17 = 138543618;
    uint64_t v18 = v15;
    __int16 v19 = 2114;
    id v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", (uint8_t *)&v17, 0x16u);
  }

  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v12);
  }
}

- (void)provideDeviceOptionsCollectionForWakeAppleTV:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[IntentHandler provideDeviceOptionsCollectionForWakeAppleTV:withCompletion:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = +[TVRIntentExtensionDeviceQuery sharedInstance];
  [v8 provideDeviceOptionsWithCompletion:v6];
}

- (void)resolveDeviceForWakeAppleTV:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 device];
  v8 = [(IntentHandler *)self _resolveDevice:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)handleSleepAppleTV:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "-[IntentHandler handleSleepAppleTV:completion:]";
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  v8 = +[TVRIntentExtensionDeviceManager sharedInstance];
  id v9 = [v5 device];
  id v10 = [v9 identifier];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __47__IntentHandler_handleSleepAppleTV_completion___block_invoke;
  v13[3] = &unk_100010378;
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  [v8 resolveDeviceWithIdentifier:v10 handler:v13];
}

void __47__IntentHandler_handleSleepAppleTV_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _TVRIntentExtensionLog();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v17 = 138543618;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    id v10 = [objc_alloc((Class)TVRCButton) _initWithButtonType:22];
    id v11 = +[TVRCButtonEvent buttonEventForButton:v10 eventType:2];
    [v5 sendButtonEvent:v11];

    id v12 = [objc_alloc((Class)SleepAppleTVIntentResponse) initWithCode:4 userActivity:0];
    v13 = +[TVRCAnalytics sharedInstance];
    [v13 logShortcutActionRunWithType:@"Sleep_AppleTV"];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();
    }

    id v12 = [objc_alloc((Class)SleepAppleTVIntentResponse) initWithCode:5 userActivity:0];
  }
  id v14 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v17 = 138543618;
    uint64_t v18 = v15;
    __int16 v19 = 2114;
    id v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", (uint8_t *)&v17, 0x16u);
  }

  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v12);
  }
}

- (void)provideDeviceOptionsCollectionForSleepAppleTV:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[IntentHandler provideDeviceOptionsCollectionForSleepAppleTV:withCompletion:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = +[TVRIntentExtensionDeviceQuery sharedInstance];
  [v8 provideDeviceOptionsWithCompletion:v6];
}

- (void)resolveDeviceForSleepAppleTV:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 device];
  v8 = [(IntentHandler *)self _resolveDevice:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)handleLaunchRemote:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[IntentHandler handleLaunchRemote:completion:]";
    __int16 v27 = 2114;
    id v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  uint64_t v8 = TVRViewServiceDeviceIdentifierTypeNone;
  id v9 = [v5 device];
  id v10 = [v9 identifier];
  if (!v10) {
    goto LABEL_6;
  }
  __int16 v11 = [v5 device];
  id v12 = [v11 identifier];
  id v13 = [v12 length];

  if (v13)
  {
    id v9 = [v5 device];
    id v10 = [v9 identifier];
    uint64_t v8 = 1;
LABEL_6:

    goto LABEL_8;
  }
  id v10 = 0;
LABEL_8:
  __int16 v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = __47__IntentHandler_handleLaunchRemote_completion___block_invoke;
  v22 = &unk_1000103A0;
  id v14 = v10;
  id v23 = v14;
  uint64_t v24 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v19);
  uint64_t v15 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = (const char *)v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Lauching the TVRemote with deviceIdentifier=%{public}@", buf, 0xCu);
  }

  uint64_t v16 = +[TVRCAnalytics sharedInstance];
  [v16 logShortcutActionRunWithType:@"LaunchRemote_AppleTV"];

  if (v6)
  {
    id v17 = [objc_alloc((Class)LaunchRemoteIntentResponse) initWithCode:4 userActivity:0];
    uint64_t v18 = _TVRIntentExtensionLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = (const char *)v5;
      __int16 v27 = 2114;
      id v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
    }

    v6[2](v6, v17);
  }
}

void __47__IntentHandler_handleLaunchRemote_completion___block_invoke(uint64_t a1)
{
  id v2 = [objc_alloc((Class)TVRViewServiceConfigContext) initWithDeviceIdentifier:*(void *)(a1 + 32) identifierType:*(void *)(a1 + 40) deviceType:1 launchContext:4 launchMethod:1];
  v1 = +[TVRViewServiceManager sharedInstance];
  [v1 presentWithContext:v2];
}

- (void)provideDeviceOptionsCollectionForLaunchRemote:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[IntentHandler provideDeviceOptionsCollectionForLaunchRemote:withCompletion:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = +[TVRIntentExtensionDeviceQuery sharedInstance];
  [v8 provideDeviceOptionsWithCompletion:v6];
}

- (void)resolveDeviceForLaunchRemote:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 device];
  uint64_t v8 = [(IntentHandler *)self _resolveDevice:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)handlePauseContent:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[IntentHandler handlePauseContent:completion:]";
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  uint64_t v8 = [v5 device];
  id v9 = +[TVRIntentExtensionDeviceManager sharedInstance];
  id v10 = [v8 identifier];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __47__IntentHandler_handlePauseContent_completion___block_invoke;
  v13[3] = &unk_100010378;
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  [v9 resolveDeviceWithIdentifier:v10 handler:v13];
}

void __47__IntentHandler_handlePauseContent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) mediaCommand];
  if (!v3 || (unint64_t v5 = (unint64_t)v4) == 0)
  {
    id v13 = objc_alloc((Class)PauseContentIntentResponse);
    uint64_t v14 = 5;
    goto LABEL_15;
  }
  id v6 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v22 = 138543618;
    uint64_t v23 = v7;
    __int16 v24 = 2114;
    id v25 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", (uint8_t *)&v22, 0x16u);
  }

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v8 = objc_alloc((Class)TVRCButton);
    if (v5 == 3) {
      uint64_t v9 = 204;
    }
    else {
      uint64_t v9 = 205;
    }
    id v10 = [v8 _initWithButtonType:v9];
    id v11 = v10;
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  if (v5 == 1)
  {
    id v10 = [objc_alloc((Class)TVRCButton) _initWithButtonType:5];
    id v15 = +[TVRCButtonEvent buttonEventForButton:v10 eventType:1];
    [v3 sendButtonEvent:v15];

    id v11 = v10;
    uint64_t v12 = 2;
LABEL_13:
    uint64_t v16 = +[TVRCButtonEvent buttonEventForButton:v11 eventType:v12];
    [v3 sendButtonEvent:v16];
  }
  id v17 = +[TVRCAnalytics sharedInstance];
  [v17 logShortcutActionRunWithType:@"PlayPause_AppleTV"];

  id v13 = objc_alloc((Class)PauseContentIntentResponse);
  uint64_t v14 = 4;
LABEL_15:
  id v18 = [v13 initWithCode:v14 userActivity:0];
  id v19 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    int v22 = 138543618;
    uint64_t v23 = v20;
    __int16 v24 = 2114;
    id v25 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", (uint8_t *)&v22, 0x16u);
  }

  uint64_t v21 = *(void *)(a1 + 40);
  if (v21) {
    (*(void (**)(uint64_t, id))(v21 + 16))(v21, v18);
  }
}

- (void)provideDeviceOptionsCollectionForPauseContent:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[IntentHandler provideDeviceOptionsCollectionForPauseContent:withCompletion:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = +[TVRIntentExtensionDeviceQuery sharedInstance];
  [v8 provideDeviceOptionsWithCompletion:v6];
}

- (void)resolveDeviceForPauseContent:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 device];
  id v8 = [(IntentHandler *)self _resolveDevice:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)resolveMediaCommandForPauseContent:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  -[IntentHandler _resolveMediaCommand:](self, "_resolveMediaCommand:", [a3 mediaCommand]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (void)handleLaunchTVApp:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[IntentHandler handleLaunchTVApp:completion:]";
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  id v8 = [v5 device];
  id v9 = +[TVRIntentExtensionDeviceManager sharedInstance];
  id v10 = [v8 identifier];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __46__IntentHandler_handleLaunchTVApp_completion___block_invoke;
  v13[3] = &unk_100010378;
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  [v9 resolveDeviceWithIdentifier:v10 handler:v13];
}

void __46__IntentHandler_handleLaunchTVApp_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _TVRIntentExtensionLog();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v9;
      __int16 v25 = 2114;
      id v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
    }

    id v10 = [objc_alloc((Class)TVRCButton) _initWithButtonType:21];
    id v11 = +[TVRCButtonEvent buttonEventForButton:v10 eventType:2];
    [v5 sendButtonEvent:v11];

    id v12 = objc_alloc((Class)TVRCButton);
    uint64_t v21 = TVRCButtonApplicationBundleIDKey;
    CFStringRef v22 = @"com.apple.TVWatchList";
    id v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v14 = [v12 _initWithButtonType:20 hasTapAction:1 properties:v13];

    id v15 = +[TVRCButtonEvent buttonEventForButton:v14 eventType:0];
    [v5 sendButtonEvent:v15];

    id v16 = [objc_alloc((Class)LaunchTVAppIntentResponse) initWithCode:4 userActivity:0];
    id v17 = +[TVRCAnalytics sharedInstance];
    [v17 logShortcutActionRunWithType:@"LaunchApp_AppleTV"];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();
    }

    id v16 = [objc_alloc((Class)LaunchTVAppIntentResponse) initWithCode:5 userActivity:0];
  }
  __int16 v18 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v19;
    __int16 v25 = 2114;
    id v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
  }

  uint64_t v20 = *(void *)(a1 + 40);
  if (v20) {
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v16);
  }
}

- (void)confirmLaunchTVApp:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    id v16 = "-[IntentHandler confirmLaunchTVApp:completion:]";
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v15, 0x16u);
  }

  id v8 = [v5 device];
  uint64_t v9 = v8;
  if (v8 && ([v8 identifier], id v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    id v11 = _TVRIntentExtensionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      id v16 = (const char *)v5;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v12 = 1;
  }
  else
  {
    id v11 = _TVRIntentExtensionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[IntentHandler confirmLaunchTVApp:completion:]((uint64_t)v9, v11);
    }
    uint64_t v12 = 5;
  }

  id v13 = [objc_alloc((Class)LaunchTVAppIntentResponse) initWithCode:v12 userActivity:0];
  id v14 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = (const char *)v5;
    __int16 v17 = 2114;
    id v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", (uint8_t *)&v15, 0x16u);
  }

  if (v6) {
    v6[2](v6, v13);
  }
}

- (void)handleLaunchApplication:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "-[IntentHandler handleLaunchApplication:completion:]";
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  id v8 = +[TVRIntentExtensionDeviceManager sharedInstance];
  uint64_t v9 = [v5 device];
  id v10 = [v9 identifier];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __52__IntentHandler_handleLaunchApplication_completion___block_invoke;
  v13[3] = &unk_100010378;
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  [v8 resolveDeviceWithIdentifier:v10 handler:v13];
}

void __52__IntentHandler_handleLaunchApplication_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (const char **)(a1 + 32);
  id v8 = [*(id *)(a1 + 32) application];
  uint64_t v9 = [v8 identifier];

  id v10 = _TVRIntentExtensionLog();
  id v11 = v10;
  if (v5 && v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = *v7;
      *(_DWORD *)buf = 138543618;
      id v28 = v12;
      __int16 v29 = 2114;
      id v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
    }

    id v13 = _TVRIntentExtensionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v28 = "-[IntentHandler handleLaunchApplication:completion:]_block_invoke";
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s with bundleID %@", buf, 0x16u);
    }

    id v14 = [objc_alloc((Class)TVRCButton) _initWithButtonType:21];
    id v15 = +[TVRCButtonEvent buttonEventForButton:v14 eventType:2];
    [v5 sendButtonEvent:v15];

    id v16 = objc_alloc((Class)TVRCButton);
    uint64_t v25 = TVRCButtonApplicationBundleIDKey;
    id v26 = v9;
    __int16 v17 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v18 = [v16 _initWithButtonType:20 hasTapAction:1 properties:v17];

    id v19 = +[TVRCButtonEvent buttonEventForButton:v18 eventType:0];
    [v5 sendButtonEvent:v19];

    id v20 = [objc_alloc((Class)LaunchApplicationIntentResponse) initWithCode:4 userActivity:0];
    uint64_t v21 = +[TVRCAnalytics sharedInstance];
    [v21 logShortcutActionRunWithType:@"LaunchApp_AppleTV"];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __52__IntentHandler_handleLaunchApplication_completion___block_invoke_cold_1();
    }

    id v20 = [objc_alloc((Class)LaunchApplicationIntentResponse) initWithCode:5 userActivity:0];
  }
  CFStringRef v22 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *v7;
    *(_DWORD *)buf = 138543618;
    id v28 = v23;
    __int16 v29 = 2114;
    id v30 = v20;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
  }

  uint64_t v24 = *(void *)(a1 + 40);
  if (v24) {
    (*(void (**)(uint64_t, id))(v24 + 16))(v24, v20);
  }
}

- (id)defaultApplicationForLaunchApplication:(id)a3
{
  id v3 = [objc_alloc((Class)TVRApplication) initWithIdentifier:@"com.apple.TVWatchList" displayString:@"TV"];

  return v3;
}

- (void)provideApplicationOptionsCollectionForLaunchApplication:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v29 = "-[IntentHandler provideApplicationOptionsCollectionForLaunchApplication:withCompletion:]";
    __int16 v30 = 2114;
    id v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  uint64_t v9 = [v6 device];
  id v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"TVRI_APPLICATION_FETCH_ERROR" value:&stru_100010700 table:0];
  id v12 = [v9 displayString];
  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);

  if (v9)
  {
    objc_initWeak((id *)buf, self);
    id v14 = +[TVRIntentExtensionDeviceManager sharedInstance];
    id v15 = [v9 identifier];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __88__IntentHandler_provideApplicationOptionsCollectionForLaunchApplication_withCompletion___block_invoke;
    v21[3] = &unk_1000103F0;
    objc_copyWeak(&v25, (id *)buf);
    id v22 = v6;
    id v23 = v13;
    id v24 = v7;
    [v14 resolveDeviceWithIdentifier:v15 handler:v21];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    id v16 = +[NSBundle mainBundle];
    __int16 v17 = [v16 localizedStringForKey:@"TVRI_APPLICATION_FETCH_ERROR_TV_NOT_FOUND" value:&stru_100010700 table:0];
    __int16 v27 = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v19 = TVRCMakeError();

    id v20 = _TVRIntentExtensionLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[IntentHandler provideApplicationOptionsCollectionForLaunchApplication:withCompletion:]();
    }

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v19);
  }
}

void __88__IntentHandler_provideApplicationOptionsCollectionForLaunchApplication_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = _TVRIntentExtensionLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v6;
        __int16 v29 = 2114;
        id v30 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
      }

      id v7 = objc_alloc((Class)TVRCDeviceEventManager);
      __int16 v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      id v19 = __88__IntentHandler_provideApplicationOptionsCollectionForLaunchApplication_withCompletion___block_invoke_44;
      id v20 = &unk_1000103C8;
      id v21 = *(id *)(a1 + 40);
      id v22 = *(id *)(a1 + 48);
      id v8 = [v7 initWithDevice:v3 responseHandler:&v17];
      [WeakRetained setEventManager:v8, v17, v18, v19, v20];

      uint64_t v9 = [WeakRetained eventManager];
      uint64_t v10 = TVRCFetchLaunchableApplicationsEvent;
      uint64_t v11 = *(void *)(a1 + 40);
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      uint64_t v26 = v11;
      id v12 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      [v9 sendEvent:v10 options:v12];

      id v13 = v21;
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 40);
      NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
      uint64_t v24 = v14;
      id v15 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v13 = TVRCMakeError();

      id v16 = _TVRIntentExtensionLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[IntentHandler provideApplicationOptionsCollectionForLaunchApplication:withCompletion:]();
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __88__IntentHandler_provideApplicationOptionsCollectionForLaunchApplication_withCompletion___block_invoke_44(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8 = a3;
  if (a5)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    uint64_t v33 = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    TVRCMakeError();
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    id v12 = _TVRIntentExtensionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __88__IntentHandler_provideApplicationOptionsCollectionForLaunchApplication_withCompletion___block_invoke_44_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_19:

    goto LABEL_20;
  }
  if ([a2 isEqualToString:TVRCFetchLaunchableApplicationsEvent])
  {
    id v11 = objc_alloc_init((Class)NSMutableArray);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = [v8 allKeys];
    id v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v19 = [v8 objectForKey:v18];
          id v20 = [objc_alloc((Class)TVRApplication) initWithIdentifier:v18 displayString:v19 pronunciationHint:v19];
          [v11 addObject:v20];
        }
        id v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v15);
    }

    if ([v11 count])
    {
      id v21 = +[NSSortDescriptor sortDescriptorWithKey:@"displayString" ascending:1];
      id v30 = v21;
      id v22 = +[NSArray arrayWithObjects:&v30 count:1];
      [v11 sortUsingDescriptors:v22];

      uint64_t v23 = *(void *)(a1 + 40);
      id v24 = [objc_alloc((Class)INObjectCollection) initWithItems:v11];
      (*(void (**)(uint64_t, id, void))(v23 + 16))(v23, v24, 0);
    }
    else
    {
      TVRCMakeError();
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      NSErrorUserInfoKey v25 = _TVRIntentExtensionLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[IntentHandler provideApplicationOptionsCollectionForLaunchApplication:withCompletion:]();
      }

      (*(void (**)(void, void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v24);
    }

    goto LABEL_19;
  }
LABEL_20:
}

- (void)provideDeviceOptionsCollectionForLaunchApplication:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[IntentHandler provideDeviceOptionsCollectionForLaunchApplication:withCompletion:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = +[TVRIntentExtensionDeviceQuery sharedInstance];
  [v8 provideDeviceOptionsWithCompletion:v6];
}

- (void)resolveApplicationForLaunchApplication:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 application];
  id v8 = [(IntentHandler *)self _resolveApplication:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)resolveDeviceForLaunchApplication:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 device];
  id v8 = [(IntentHandler *)self _resolveDevice:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)handleLaunchScreenSaver:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "-[IntentHandler handleLaunchScreenSaver:completion:]";
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  id v8 = [v5 device];
  id v9 = +[TVRIntentExtensionDeviceManager sharedInstance];
  uint64_t v10 = [v8 identifier];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __52__IntentHandler_handleLaunchScreenSaver_completion___block_invoke;
  v13[3] = &unk_100010378;
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  [v9 resolveDeviceWithIdentifier:v10 handler:v13];
}

void __52__IntentHandler_handleLaunchScreenSaver_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _TVRIntentExtensionLog();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v16 = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", (uint8_t *)&v16, 0x16u);
    }

    id v10 = [objc_alloc((Class)TVRCButton) _initWithButtonType:19];
    id v11 = +[TVRCButtonEvent buttonEventForButton:v10 eventType:2];
    [v5 sendButtonEvent:v11];

    id v12 = [objc_alloc((Class)LaunchScreenSaverIntentResponse) initWithCode:4 userActivity:0];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();
    }

    id v12 = [objc_alloc((Class)LaunchScreenSaverIntentResponse) initWithCode:5 userActivity:0];
  }
  id v13 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v16 = 138543618;
    uint64_t v17 = v14;
    __int16 v18 = 2114;
    id v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v12);
  }
}

- (void)provideDeviceOptionsCollectionForLaunchScreenSaver:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[IntentHandler provideDeviceOptionsCollectionForLaunchScreenSaver:withCompletion:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = +[TVRIntentExtensionDeviceQuery sharedInstance];
  [v8 provideDeviceOptionsWithCompletion:v6];
}

- (void)resolveDeviceForLaunchScreenSaver:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 device];
  id v8 = [(IntentHandler *)self _resolveDevice:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)handleToggleCaptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[IntentHandler handleToggleCaptions:completion:]";
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  id v8 = +[TVRIntentExtensionDeviceManager sharedInstance];
  id v9 = [v5 device];
  id v10 = [v9 identifier];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __49__IntentHandler_handleToggleCaptions_completion___block_invoke;
  v13[3] = &unk_100010378;
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  [v8 resolveDeviceWithIdentifier:v10 handler:v13];
}

void __49__IntentHandler_handleToggleCaptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _TVRIntentExtensionLog();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v17 = 138543618;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    if ([*(id *)(a1 + 32) toggle] == (id)1) {
      uint64_t v10 = 17;
    }
    else {
      uint64_t v10 = 18;
    }
    id v11 = [objc_alloc((Class)TVRCButton) _initWithButtonType:v10];
    id v12 = +[TVRCButtonEvent buttonEventForButton:v11 eventType:0];
    [v5 sendButtonEvent:v12];

    id v13 = [objc_alloc((Class)ToggleCaptionsIntentResponse) initWithCode:4 userActivity:0];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();
    }

    id v13 = [objc_alloc((Class)ToggleCaptionsIntentResponse) initWithCode:5 userActivity:0];
  }
  id v14 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v17 = 138543618;
    uint64_t v18 = v15;
    __int16 v19 = 2114;
    id v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", (uint8_t *)&v17, 0x16u);
  }

  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v13);
  }
}

- (void)provideDeviceOptionsCollectionForToggleCaptions:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[IntentHandler provideDeviceOptionsCollectionForToggleCaptions:withCompletion:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = +[TVRIntentExtensionDeviceQuery sharedInstance];
  [v8 provideDeviceOptionsWithCompletion:v6];
}

- (void)resolveToggleForToggleCaptions:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  -[IntentHandler _resolveCaptionsToggle:](self, "_resolveCaptionsToggle:", [a3 toggle]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (void)resolveDeviceForToggleCaptions:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 device];
  id v8 = [(IntentHandler *)self _resolveDevice:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)handleSwitchUserAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[IntentHandler handleSwitchUserAccount:completion:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  id v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  id v9 = [v6 account];
  uint64_t v10 = [v9 identifier];

  __int16 v11 = +[TVRIntentExtensionDeviceManager sharedInstance];
  id v12 = [v6 device];
  id v13 = [v12 identifier];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __52__IntentHandler_handleSwitchUserAccount_completion___block_invoke;
  v17[3] = &unk_100010458;
  v17[4] = self;
  id v14 = v10;
  id v18 = v14;
  id v21 = buf;
  id v15 = v6;
  id v19 = v15;
  id v16 = v7;
  id v20 = v16;
  [v11 resolveDeviceWithIdentifier:v13 handler:v17];

  _Block_object_dispose(buf, 8);
}

void __52__IntentHandler_handleSwitchUserAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (v5)
  {
    id v7 = objc_loadWeakRetained(&location);
    if (v7)
    {
      id v8 = _TVRIntentExtensionLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending switch account for accountID=%{public}@", buf, 0xCu);
      }

      id v10 = [objc_alloc((Class)TVRCDeviceEventManager) initWithDevice:v5 responseHandler:&__block_literal_global];
      [v7 setEventManager:v10];

      __int16 v11 = [v7 eventManager];
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v29 = TVRCSwitchAccountID;
      uint64_t v30 = v12;
      id v13 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      [v11 sendEvent:TVRCSwitchUserAccountEvent options:v13];

      id v14 = [objc_alloc((Class)SwitchUserAccountIntentResponse) initWithCode:4 userActivity:0];
    }
    else
    {
      int v17 = _TVRIntentExtensionLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __52__IntentHandler_handleSwitchUserAccount_completion___block_invoke_cold_1(v17);
      }

      id v14 = [objc_alloc((Class)SwitchUserAccountIntentResponse) initWithCode:5 userActivity:0];
    }
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v14;
  }
  else
  {
    id v15 = [objc_alloc((Class)SwitchUserAccountIntentResponse) initWithCode:5 userActivity:0];
    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = *(id *)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }

  id v20 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v21;
    __int16 v27 = 2114;
    uint64_t v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
  }

  uint64_t v23 = *(void *)(a1 + 56);
  if (v23) {
    (*(void (**)(uint64_t, void))(v23 + 16))(v23, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
  objc_destroyWeak(&location);
}

- (void)provideDeviceOptionsCollectionForSwitchUserAccount:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[IntentHandler provideDeviceOptionsCollectionForSwitchUserAccount:withCompletion:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = +[TVRIntentExtensionDeviceQuery sharedInstance];
  [v8 provideDeviceOptionsWithCompletion:v6];
}

- (void)provideAccountOptionsCollectionForSwitchUserAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v24 = "-[IntentHandler provideAccountOptionsCollectionForSwitchUserAccount:withCompletion:]";
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  int v9 = [v6 device];
  if (v9)
  {
    objc_initWeak((id *)buf, self);
    id v10 = +[TVRIntentExtensionDeviceManager sharedInstance];
    __int16 v11 = [v9 identifier];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __84__IntentHandler_provideAccountOptionsCollectionForSwitchUserAccount_withCompletion___block_invoke;
    v17[3] = &unk_1000104A8;
    objc_copyWeak(&v20, (id *)buf);
    id v18 = v6;
    id v19 = v7;
    [v10 resolveDeviceWithIdentifier:v11 handler:v17];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    id v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"TVRI_INVALID_APPLE_TV" value:&stru_100010700 table:0];
    uint64_t v22 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v15 = TVRCMakeError();

    uint64_t v16 = _TVRIntentExtensionLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[IntentHandler provideAccountOptionsCollectionForSwitchUserAccount:withCompletion:]();
    }

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
  }
}

void __84__IntentHandler_provideAccountOptionsCollectionForSwitchUserAccount_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = _TVRIntentExtensionLog();
    int v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v10;
        __int16 v22 = 2114;
        id v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
      }

      id v11 = objc_alloc((Class)TVRCDeviceEventManager);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __84__IntentHandler_provideAccountOptionsCollectionForSwitchUserAccount_withCompletion___block_invoke_60;
      v16[3] = &unk_100010480;
      id v17 = v5;
      id v19 = *(id *)(a1 + 40);
      id v18 = v6;
      id v12 = [v11 initWithDevice:v17 responseHandler:v16];
      [WeakRetained setEventManager:v12];

      id v13 = [WeakRetained eventManager];
      [v13 sendEvent:TVRCFetchUserAccountsEvent options:0];

      id v14 = v17;
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();
      }

      uint64_t v15 = *(void *)(a1 + 40);
      id v14 = TVRCMakeError();
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v14);
    }
  }
}

void __84__IntentHandler_provideAccountOptionsCollectionForSwitchUserAccount_withCompletion___block_invoke_60(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    TVRCMakeError();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = _TVRIntentExtensionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v34 = v25;
      __int16 v35 = 2114;
      id v36 = v9;
      __int16 v37 = 2114;
      id v38 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create event manager with device=%{public}@, eventManagerError=%{public}@, error=%{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_19:

    goto LABEL_20;
  }
  if ([a2 isEqualToString:TVRCFetchUserAccountsEvent])
  {
    uint64_t v26 = a1;
    id v10 = objc_alloc_init((Class)NSMutableArray);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = [v8 allKeys];
    id v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v18 = [v8 objectForKey:v17];
          id v19 = [objc_alloc((Class)TVRUserAccount) initWithIdentifier:v17 displayString:v18 pronunciationHint:v18];
          [v10 addObject:v19];
        }
        id v14 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v14);
    }

    if ([v10 count])
    {
      id v20 = +[NSSortDescriptor sortDescriptorWithKey:@"displayString" ascending:1];
      id v31 = v20;
      uint64_t v21 = +[NSArray arrayWithObjects:&v31 count:1];
      [v10 sortUsingDescriptors:v21];

      uint64_t v22 = *(void *)(v26 + 48);
      id v23 = [objc_alloc((Class)INObjectCollection) initWithItems:v10];
      (*(void (**)(uint64_t, id, void))(v22 + 16))(v22, v23, 0);
    }
    else
    {
      TVRCMakeError();
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      id v24 = _TVRIntentExtensionLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        __84__IntentHandler_provideAccountOptionsCollectionForSwitchUserAccount_withCompletion___block_invoke_60_cold_1();
      }

      (*(void (**)(void, void, id))(*(void *)(v26 + 48) + 16))(*(void *)(v26 + 48), 0, v23);
    }

    goto LABEL_19;
  }
LABEL_20:
}

- (void)resolveDeviceForSwitchUserAccount:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 device];
  id v8 = [(IntentHandler *)self _resolveDevice:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)resolveAccountForSwitchUserAccount:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 account];
  id v8 = [(IntentHandler *)self _resolveUserAccount:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)handleSkipContent:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[IntentHandler handleSkipContent:completion:]";
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  id v8 = +[TVRIntentExtensionDeviceManager sharedInstance];
  id v9 = [v5 device];
  id v10 = [v9 identifier];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __46__IntentHandler_handleSkipContent_completion___block_invoke;
  v13[3] = &unk_100010378;
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  [v8 resolveDeviceWithIdentifier:v10 handler:v13];
}

void __46__IntentHandler_handleSkipContent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [objc_alloc((Class)SkipContentIntentResponse) initWithCode:4 userActivity:0];
  id v8 = _TVRIntentExtensionLog();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v10;
      __int16 v29 = 2114;
      id v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
    }

    id v11 = [*(id *)(a1 + 32) skipCommand];
    uint64_t v12 = [*(id *)(a1 + 32) skipDuration];
    id v9 = v12;
    if (v11 && v12)
    {
      id v13 = objc_alloc((Class)TVRCButton);
      if (v11 == (id)1)
      {
        uint64_t v25 = TVRCButtonSkipIntervalKey;
        uint64_t v26 = v9;
        id v14 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        id v15 = [v13 _initWithButtonType:6 hasTapAction:1 properties:v14];
      }
      else
      {
        [v9 doubleValue];
        id v14 = +[NSNumber numberWithDouble:-v16];
        id v24 = v14;
        uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        id v15 = [v13 _initWithButtonType:7 hasTapAction:1 properties:v17];
      }
      __int16 v18 = +[TVRCButtonEvent buttonEventForButton:v15 eventType:0];
      [v5 sendButtonEvent:v18];

      id v19 = [objc_alloc((Class)SkipContentIntentResponse) initWithCode:4 userActivity:0];
      id v7 = v19;
    }
    else
    {
      id v15 = _TVRIntentExtensionLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "TVRIntentExtension: Inavlid configuration for SkipContentIntent", buf, 2u);
      }
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();
  }

  id v20 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v21;
    __int16 v29 = 2114;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
  }

  uint64_t v22 = *(void *)(a1 + 40);
  if (v22) {
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v7);
  }
}

- (void)provideDeviceOptionsCollectionForSkipContent:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[IntentHandler provideDeviceOptionsCollectionForSkipContent:withCompletion:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = +[TVRIntentExtensionDeviceQuery sharedInstance];
  [v8 provideDeviceOptionsWithCompletion:v6];
}

- (void)resolveDeviceForSkipContent:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 device];
  id v8 = [(IntentHandler *)self _resolveDevice:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)resolveSkipCommandForSkipContent:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  -[IntentHandler _resolveSkipCommand:](self, "_resolveSkipCommand:", [a3 skipCommand]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (void)resolveSkipDurationForSkipContent:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 skipDuration];
  id v8 = [(IntentHandler *)self _resolveSkipDuration:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)handleReduceLoudSounds:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[IntentHandler handleReduceLoudSounds:completion:]";
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v9 = +[TVRIntentExtensionDeviceManager sharedInstance];
  uint64_t v10 = [v6 device];
  __int16 v11 = [v10 identifier];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __51__IntentHandler_handleReduceLoudSounds_completion___block_invoke;
  v14[3] = &unk_1000104A8;
  objc_copyWeak(&v17, (id *)buf);
  id v12 = v6;
  id v15 = v12;
  id v13 = v7;
  id v16 = v13;
  [v9 resolveDeviceWithIdentifier:v11 handler:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __51__IntentHandler_handleReduceLoudSounds_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [objc_alloc((Class)ReduceLoudSoundsIntentResponse) initWithCode:4 userActivity:0];
  if (v3)
  {
    id v6 = _TVRIntentExtensionLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v24 = v7;
      __int16 v25 = 2114;
      id v26 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
    }

    if (WeakRetained)
    {
      id v8 = [objc_alloc((Class)TVRCDeviceEventManager) initWithDevice:v3 responseHandler:&__block_literal_global_70];
      [WeakRetained setEventManager:v8];

      id v9 = [*(id *)(a1 + 32) toggle];
      unsigned int v10 = [v9 BOOLValue];
      __int16 v11 = @"NO";
      if (v10) {
        __int16 v11 = @"YES";
      }
      id v12 = v11;
      id v13 = _TVRIntentExtensionLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Sending TVRCToggleReduceLoudSounds with value=%{public}@", buf, 0xCu);
      }

      id v14 = [WeakRetained eventManager];
      uint64_t v15 = TVRCToggleReduceLoudSounds;
      uint64_t v21 = TVRCReduceLoundSoundsEnabled;
      uint64_t v22 = v12;
      id v16 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      [v14 sendEvent:v15 options:v16];

      id v17 = [objc_alloc((Class)ReduceLoudSoundsIntentResponse) initWithCode:4 userActivity:0];
      id v5 = v17;
    }
  }
  __int16 v18 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = *(__CFString **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    id v24 = v19;
    __int16 v25 = 2114;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
  }

  uint64_t v20 = *(void *)(a1 + 40);
  if (v20) {
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v5);
  }
}

- (void)provideDeviceOptionsCollectionForReduceLoudSounds:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    unsigned int v10 = "-[IntentHandler provideDeviceOptionsCollectionForReduceLoudSounds:withCompletion:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = +[TVRIntentExtensionDeviceQuery sharedInstance];
  [v8 provideDeviceOptionsWithCompletion:v6];
}

- (void)resolveDeviceForReduceLoudSounds:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 device];
  id v8 = [(IntentHandler *)self _resolveDevice:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)resolveToggleForReduceLoudSounds:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 toggle];
  id v8 = [(IntentHandler *)self _resolveReduceLoudSoundsToggle:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)handleToggleSystemAppearance:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[IntentHandler handleToggleSystemAppearance:completion:]";
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v9 = +[TVRIntentExtensionDeviceManager sharedInstance];
  unsigned int v10 = [v6 device];
  __int16 v11 = [v10 identifier];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __57__IntentHandler_handleToggleSystemAppearance_completion___block_invoke;
  v14[3] = &unk_100010510;
  id v12 = v6;
  id v15 = v12;
  objc_copyWeak(&v17, (id *)buf);
  id v13 = v7;
  id v16 = v13;
  [v9 resolveDeviceWithIdentifier:v11 handler:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __57__IntentHandler_handleToggleSystemAppearance_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v28 = v8;
    __int16 v29 = 2112;
    id v30 = v5;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TVRIntentExtension: Resolved device for intent %@. Device - %@. Error - %@", buf, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned int v10 = [objc_alloc((Class)ToggleSystemAppearanceIntentResponse) initWithCode:4 userActivity:0];
  __int16 v11 = _TVRIntentExtensionLog();
  id v12 = v11;
  if (!v5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1();
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v13;
    __int16 v29 = 2114;
    id v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resolved device for intent=%{public}@, device=%{public}@", buf, 0x16u);
  }

  if (WeakRetained)
  {
    id v14 = [objc_alloc((Class)TVRCDeviceEventManager) initWithDevice:v5 responseHandler:&__block_literal_global_80];
    [WeakRetained setEventManager:v14];

    id v15 = [*(id *)(a1 + 32) appearanceToggle];
    id v16 = @"NO";
    if (v15 == (id)1) {
      id v16 = @"YES";
    }
    id v17 = v16;
    __int16 v18 = [WeakRetained eventManager];
    uint64_t v19 = TVRCToggleSystemAppearance;
    uint64_t v25 = TVRCSystemAppearanceLight;
    id v26 = v17;
    __int16 v20 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    [v18 sendEvent:v19 options:v20];

    id v21 = objc_alloc((Class)ToggleSystemAppearanceIntentResponse);
    id v12 = v10;
    unsigned int v10 = [v21 initWithCode:4 userActivity:0];
LABEL_12:
  }
  uint64_t v22 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v23;
    __int16 v29 = 2114;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Calling completion for intent=%{public}@, response=%{public}@", buf, 0x16u);
  }

  uint64_t v24 = *(void *)(a1 + 40);
  if (v24) {
    (*(void (**)(uint64_t, NSObject *))(v24 + 16))(v24, v10);
  }
}

- (void)provideDeviceOptionsCollectionForToggleSystemAppearance:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _TVRIntentExtensionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    unsigned int v10 = "-[IntentHandler provideDeviceOptionsCollectionForToggleSystemAppearance:withCompletion:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s, intent=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = +[TVRIntentExtensionDeviceQuery sharedInstance];
  [v8 provideDeviceOptionsWithCompletion:v6];
}

- (void)resolveDeviceForToggleSystemAppearance:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  id v9 = [a3 device];
  uint64_t v8 = [(IntentHandler *)self _resolveDevice:v9];
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

- (void)resolveAppearanceToggleForToggleSystemAppearance:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  -[IntentHandler _resolveSystemAppearanceToggle:](self, "_resolveSystemAppearanceToggle:", [a3 appearanceToggle]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (id)_resolveDevice:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 identifier];

    if (v5) {
      +[TVRDeviceResolutionResult successWithResolvedDevice:v4];
    }
    else {
    uint64_t v6 = +[TVRDeviceResolutionResult confirmationRequiredWithDeviceToConfirm:v4];
    }
  }
  else
  {
    uint64_t v6 = +[TVRDeviceResolutionResult notRequired];
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)_resolveApplication:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 identifier];

    if (v5) {
      +[TVRApplicationResolutionResult successWithResolvedApplication:v4];
    }
    else {
    uint64_t v6 = +[TVRApplicationResolutionResult confirmationRequiredWithApplicationToConfirm:v4];
    }
  }
  else
  {
    uint64_t v6 = +[TVRApplicationResolutionResult notRequired];
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)_resolveMediaCommand:(int64_t)a3
{
  if (a3) {
    +[TVRMediaCommandResolutionResult successWithResolvedMediaCommand:](TVRMediaCommandResolutionResult, "successWithResolvedMediaCommand:");
  }
  else {
  id v3 = +[TVRMediaCommandResolutionResult confirmationRequiredWithMediaCommandToConfirm:](TVRMediaCommandResolutionResult, "confirmationRequiredWithMediaCommandToConfirm:");
  }

  return v3;
}

- (id)_resolveCaptionsToggle:(int64_t)a3
{
  if ((unint64_t)a3 <= 1) {
    a3 = 1;
  }
  id v3 = +[TVRCaptionsToggleResolutionResult successWithResolvedCaptionsToggle:a3];

  return v3;
}

- (id)_resolveUserAccount:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 identifier];

    if (v5) {
      +[TVRUserAccountResolutionResult successWithResolvedUserAccount:v4];
    }
    else {
    uint64_t v6 = +[TVRUserAccountResolutionResult confirmationRequiredWithUserAccountToConfirm:v4];
    }
  }
  else
  {
    uint64_t v6 = +[TVRUserAccountResolutionResult notRequired];
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)_resolveSkipCommand:(int64_t)a3
{
  if (a3) {
    +[TVRSkipCommandResolutionResult successWithResolvedSkipCommand:](TVRSkipCommandResolutionResult, "successWithResolvedSkipCommand:");
  }
  else {
  id v3 = +[TVRSkipCommandResolutionResult confirmationRequiredWithSkipCommandToConfirm:](TVRSkipCommandResolutionResult, "confirmationRequiredWithSkipCommandToConfirm:");
  }

  return v3;
}

- (id)_resolveSkipDuration:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 doubleValue], v5 >= 0.0))
  {
    [v4 doubleValue];
    uint64_t v6 = +[SkipContentSkipDurationResolutionResult successWithResolvedValue:](SkipContentSkipDurationResolutionResult, "successWithResolvedValue:");
  }
  else
  {
    uint64_t v6 = +[SkipContentSkipDurationResolutionResult confirmationRequiredWithValueToConfirm:v4];
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)_resolveReduceLoudSoundsToggle:(id)a3
{
  if (a3) {
    +[INBooleanResolutionResult successWithResolvedValue:](INBooleanResolutionResult, "successWithResolvedValue:", [a3 BOOLValue]);
  }
  else {
  id v3 = +[INBooleanResolutionResult confirmationRequiredWithValueToConfirm:](INBooleanResolutionResult, "confirmationRequiredWithValueToConfirm:");
  }

  return v3;
}

- (id)_resolveSystemAppearanceToggle:(int64_t)a3
{
  if (a3) {
    +[TVRSystemAppearanceToggleResolutionResult successWithResolvedSystemAppearanceToggle:](TVRSystemAppearanceToggleResolutionResult, "successWithResolvedSystemAppearanceToggle:");
  }
  else {
  id v3 = +[TVRSystemAppearanceToggleResolutionResult confirmationRequiredWithSystemAppearanceToggleToConfirm:](TVRSystemAppearanceToggleResolutionResult, "confirmationRequiredWithSystemAppearanceToggleToConfirm:");
  }

  return v3;
}

- (TVRCDeviceEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (void).cxx_destruct
{
}

void __46__IntentHandler_handleWakeAppleTV_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3(__stack_chk_guard);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Error resolving device for intent=%{public}@, error=%{public}@");
}

- (void)confirmLaunchTVApp:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "-[IntentHandler confirmLaunchTVApp:completion:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s called with invalid device=%{public}@", (uint8_t *)&v2, 0x16u);
}

void __52__IntentHandler_handleLaunchApplication_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Error resolving device for intent=%{public}@, error=%{public}@");
}

- (void)provideApplicationOptionsCollectionForLaunchApplication:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Device not found  error=%{public}@", v2, v3, v4, v5, v6);
}

void __88__IntentHandler_provideApplicationOptionsCollectionForLaunchApplication_withCompletion___block_invoke_44_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Event manager error=%{public}@", v2, v3, v4, v5, v6);
}

void __52__IntentHandler_handleSwitchUserAccount_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Switch user account intent failed", v1, 2u);
}

- (void)provideAccountOptionsCollectionForSwitchUserAccount:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Invalid Apple TV, error=%{public}@", v2, v3, v4, v5, v6);
}

void __84__IntentHandler_provideAccountOptionsCollectionForSwitchUserAccount_withCompletion___block_invoke_60_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Device not found, error=%{public}@", v2, v3, v4, v5, v6);
}

@end