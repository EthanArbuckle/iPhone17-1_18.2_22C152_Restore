@interface AudioEffectsManager
- (AudioEffectsManager)init;
- (AudioEffectsManagerDelegate)delegate;
- (BOOL)audioEffectsEnabled;
- (BOOL)automaticMicModeEnabled;
- (BOOL)shouldLoadFromSensor;
- (BOOL)updateAutomaticMicMode:(BOOL)a3;
- (BOOL)updateMicMode:(int64_t)a3;
- (NSArray)supportedModes;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (id)getUnavailableString;
- (int64_t)currentMicMode;
- (void)dealloc;
- (void)handleAVControlCenterNotification:(id)a3;
- (void)setAudioEffectsEnabled:(BOOL)a3;
- (void)setAutomaticMicModeEnabled:(BOOL)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCurrentMicMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setShouldLoadFromSensor:(BOOL)a3;
- (void)setSupportedModes:(id)a3;
- (void)setupMicModeNotifications;
- (void)setupWithoutSensorData;
- (void)updateCurrentApplicationWithContext:(id)a3;
- (void)updateMicModeStates;
- (void)updateVisuals;
@end

@implementation AudioEffectsManager

- (AudioEffectsManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AudioEffectsManager;
  v2 = [(AudioEffectsManager *)&v8 init];
  if (v2)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v10 = "-[AudioEffectsManager init]";
      __int16 v11 = 1024;
      int v12 = 38;
      __int16 v13 = 2048;
      v14 = v2;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    supportedModes = v2->_supportedModes;
    v2->_supportedModes = 0;
    v2->_currentMicMode = 0;

    v2->_currentBypassMode = 0;
    displayName = v2->_displayName;
    v2->_displayName = 0;

    bundleIdentifier = v2->_bundleIdentifier;
    v2->_bundleIdentifier = 0;

    *(_WORD *)&v2->_audioEffectsEnabled = 1;
    delegate = v2->_delegate;
    v2->_delegate = 0;
  }
  return v2;
}

- (void)dealloc
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v7 = "-[AudioEffectsManager dealloc]";
    __int16 v8 = 1024;
    int v9 = 53;
    __int16 v10 = 2048;
    __int16 v11 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  delegate = self->_delegate;
  self->_delegate = 0;

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)AudioEffectsManager;
  [(AudioEffectsManager *)&v5 dealloc];
}

- (void)setupWithoutSensorData
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    __int16 v10 = "-[AudioEffectsManager setupWithoutSensorData]";
    __int16 v11 = 1024;
    int v12 = 59;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.cameracapture.volatile"];
  v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 stringForKey:@"show-system-ui-app-name"];
    displayName = self->_displayName;
    self->_displayName = v5;

    v7 = [v4 stringForKey:@"show-system-ui-bundle-id"];
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v7;
  }
}

- (void)updateMicModeStates
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v7 = 136446722;
    __int16 v8 = "-[AudioEffectsManager updateMicModeStates]";
    __int16 v9 = 1024;
    int v10 = 68;
    __int16 v11 = 2112;
    int v12 = bundleIdentifier;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d bundleIdentifier=%@", (uint8_t *)&v7, 0x1Cu);
  }
  if (self->_bundleIdentifier)
  {
    self->_currentMicMode = AVControlCenterMicrophoneModesModuleGetActiveMicrophoneModeForBundleID();
    self->_currentBypassMode = AVControlCenterMicrophoneModesModuleIsVoiceProcessingBypassedForBundleID();
    AVControlCenterMicrophoneModesModuleGetSupportedMicrophoneModesForBundleID();
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    supportedModes = self->_supportedModes;
    self->_supportedModes = v4;

    sub_80E4(self->_bundleIdentifier);
    self->_automaticMicModeEnabled = v6;
    [(AudioEffectsManager *)self updateVisuals];
  }
  else if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    __int16 v8 = "-[AudioEffectsManager updateMicModeStates]";
    __int16 v9 = 1024;
    int v10 = 77;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Unable to load initial state, no applicable application bundle ID found", (uint8_t *)&v7, 0x12u);
  }
}

- (void)setupMicModeNotifications
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL currentBypassMode = self->_currentBypassMode;
    int v10 = 136446722;
    __int16 v11 = "-[AudioEffectsManager setupMicModeNotifications]";
    __int16 v12 = 1024;
    int v13 = 82;
    __int16 v14 = 1024;
    BOOL v15 = currentBypassMode;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d currentBypassMode=%d", (uint8_t *)&v10, 0x18u);
  }
  if (!self->_currentBypassMode)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterMicrophoneModesModuleSupportedMicrophoneModesDidChangeNotification object:0];

    objc_super v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterMicrophoneModesModuleMicrophoneModeDidChangeNotification object:0];

    BOOL v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterMicrophoneModesModuleVoiceProcessingBypassedDidChangeNotification object:0];

    int v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterMicrophoneModesModuleActiveMicrophoneModeDidChangeNotification object:0];

    __int16 v8 = +[NSNotificationCenter defaultCenter];
    __int16 v9 = sub_831C();
    [v8 addObserver:self selector:"handleAVControlCenterNotification:" name:v9 object:0];
  }
}

- (void)handleAVControlCenterNotification:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v14 = "-[AudioEffectsManager handleAVControlCenterNotification:]";
    __int16 v15 = 1024;
    int v16 = 107;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  objc_super v5 = [v4 userInfo];
  BOOL v6 = [v5 objectForKey:AVControlCenterModulesNotificationBundleIdentifierKey];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_85B0;
  block[3] = &unk_28AD8;
  id v10 = v6;
  __int16 v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateVisuals
{
  delegate = self->_delegate;
  if (delegate)
  {
    if (__RPLogLevel <= 1u)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136446466;
        objc_super v5 = "-[AudioEffectsManager updateVisuals]";
        __int16 v6 = 1024;
        int v7 = 150;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notify delegate", (uint8_t *)&v4, 0x12u);
      }
      delegate = self->_delegate;
    }
    [(AudioEffectsManagerDelegate *)delegate effectsDidUpdate];
  }
}

- (void)updateCurrentApplicationWithContext:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136446466;
    v24 = "-[AudioEffectsManager updateCurrentApplicationWithContext:]";
    __int16 v25 = 1024;
    int v26 = 156;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v23, 0x12u);
  }
  objc_super v5 = [v4 sensorActivityDataForActiveSensorType:1];
  __int16 v6 = [v4 sensorActivityDataForActiveSensorType:0];
  if (!v5)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_12;
    }
    objc_super v5 = [v4 sensorActivityDataEligibleForInactiveMicModeSelection];
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136446722;
      v24 = "-[AudioEffectsManager updateCurrentApplicationWithContext:]";
      __int16 v25 = 1024;
      int v26 = 165;
      __int16 v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d replacing applicationMicData with %@", (uint8_t *)&v23, 0x1Cu);
    }
    if (!v5)
    {
LABEL_12:
      __int16 v11 = [v6 bundleIdentifier];
      if (([v11 isEqualToString:@"com.apple.TelephonyUtilities"] & 1) == 0)
      {
        id v12 = [v6 bundleIdentifier];
        if (([v12 isEqualToString:@"com.apple.facetime"] & 1) == 0)
        {
          int v13 = [v6 bundleIdentifier];
          if (![v13 isEqualToString:@"com.apple.mediaserverd"])
          {
            v21 = [v6 bundleIdentifier];
            unsigned __int8 v22 = [v21 isEqualToString:@"com.apple.avconferenced"];

            if ((v22 & 1) == 0)
            {
              self->_audioEffectsEnabled = 0;
              self->_BOOL currentBypassMode = 1;
              goto LABEL_33;
            }
            goto LABEL_18;
          }
        }
      }

LABEL_18:
      __int16 v14 = [v6 displayName];
      displayName = self->_displayName;
      self->_displayName = v14;

      bundleIdentifier = self->_bundleIdentifier;
      self->_bundleIdentifier = (NSString *)@"com.apple.facetime";

      goto LABEL_33;
    }
  }
  int v7 = [v5 displayName];
  id v8 = self->_displayName;
  self->_displayName = v7;

  __int16 v9 = [v5 bundleIdentifier];
  if ([v9 isEqualToString:@"com.apple.TelephonyUtilities"])
  {
    id v10 = self->_bundleIdentifier;
    self->_bundleIdentifier = (NSString *)@"com.apple.facetime";
  }
  else
  {
    id v10 = [v5 bundleIdentifier];
    if ([v10 isEqualToString:@"com.apple.facetime"])
    {
      v17 = self->_bundleIdentifier;
      self->_bundleIdentifier = (NSString *)@"com.apple.facetime";
    }
    else
    {
      v17 = [v5 bundleIdentifier];
      if ([v17 isEqualToString:@"com.apple.mediaserverd"])
      {
        v18 = self->_bundleIdentifier;
        self->_bundleIdentifier = (NSString *)@"com.apple.facetime";
      }
      else
      {
        v18 = [v5 bundleIdentifier];
        if ([v18 isEqualToString:@"com.apple.avconferenced"])
        {
          v19 = self->_bundleIdentifier;
          self->_bundleIdentifier = (NSString *)@"com.apple.facetime";
        }
        else
        {
          v20 = [v5 bundleIdentifier];
          v19 = self->_bundleIdentifier;
          self->_bundleIdentifier = v20;
        }
      }
    }
  }
  if ([v5 usedRecently]) {
    self->_audioEffectsEnabled = 0;
  }
  else {
    self->_audioEffectsEnabled = 1;
  }

LABEL_33:
}

- (BOOL)updateMicMode:(int64_t)a3
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int64_t currentMicMode = self->_currentMicMode;
    *(_DWORD *)buf = 136446978;
    v17 = "-[AudioEffectsManager updateMicMode:]";
    __int16 v18 = 1024;
    int v19 = 201;
    __int16 v20 = 2048;
    int64_t v21 = currentMicMode;
    __int16 v22 = 2048;
    int64_t v23 = a3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d currentMode=%ld, newMode=%ld", buf, 0x26u);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  __int16 v6 = self->_supportedModes;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v6);
      }
      if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "longValue", (void)v11) == (id)a3) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }

    if (!self->_bundleIdentifier) {
      return 0;
    }
    [(AudioEffectsManager *)self updateAutomaticMicMode:0];
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "-[AudioEffectsManager updateMicMode:]";
      __int16 v18 = 1024;
      int v19 = 216;
      __int16 v20 = 2048;
      int64_t v21 = a3;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d setting micMode=%ld", buf, 0x1Cu);
    }
    AVControlCenterMicrophoneModesModuleSetMicrophoneModeForBundleID();
    return 1;
  }
  else
  {
LABEL_12:

    return 0;
  }
}

- (BOOL)updateAutomaticMicMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL automaticMicModeEnabled = self->_automaticMicModeEnabled;
    int v7 = 136446978;
    uint64_t v8 = "-[AudioEffectsManager updateAutomaticMicMode:]";
    __int16 v9 = 1024;
    int v10 = 228;
    __int16 v11 = 1024;
    BOOL v12 = automaticMicModeEnabled;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d automaticMicModeEnabled=%d, newValue=%d", (uint8_t *)&v7, 0x1Eu);
  }
  if (self->_automaticMicModeEnabled == v3 || !self->_bundleIdentifier) {
    return 0;
  }
  AVControlCenterMicrophoneModesModuleSetAutoEnabledForBundleID();
  return 1;
}

- (id)getUnavailableString
{
  if (self->_bundleIdentifier)
  {
    v2 = AVControlCenterMicrophoneModesModuleGetSupportedMicrophoneModesForBundleID();
    BOOL v3 = +[NSNumber numberWithInt:0];
    if (([v2 containsObject:v3] & 1) == 0)
    {
      id v4 = +[NSNumber numberWithInt:2];
      if (![v2 containsObject:v4])
      {
        __int16 v11 = +[NSNumber numberWithInt:1];
        unsigned int v12 = [v2 containsObject:v11];

        if (v12)
        {
          CFStringRef v9 = @"CONTROL_CENTER_STANDARD_VOICE_ISO_UNSUPPORTED";
          goto LABEL_50;
        }
LABEL_6:
        objc_super v5 = +[NSNumber numberWithInt:0];
        if (([v2 containsObject:v5] & 1) == 0)
        {
          __int16 v6 = +[NSNumber numberWithInt:2];
          if ([v2 containsObject:v6])
          {
            int v7 = +[NSNumber numberWithInt:1];
            unsigned __int8 v8 = [v2 containsObject:v7];

            if ((v8 & 1) == 0)
            {
              CFStringRef v9 = @"CONTROL_CENTER_STANDARD_MUSIC_UNSUPPORTED";
LABEL_50:
              int v10 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v9];
              goto LABEL_51;
            }
LABEL_19:
            __int16 v13 = +[NSNumber numberWithInt:0];
            if ([v2 containsObject:v13])
            {
              BOOL v14 = +[NSNumber numberWithInt:2];
              if (![v2 containsObject:v14])
              {
                int v19 = +[NSNumber numberWithInt:1];
                unsigned __int8 v20 = [v2 containsObject:v19];

                if ((v20 & 1) == 0)
                {
                  CFStringRef v9 = @"CONTROL_CENTER_VOICE_ISO_MUSIC_UNSUPPORTED";
                  goto LABEL_50;
                }
LABEL_23:
                __int16 v15 = +[NSNumber numberWithInt:0];
                if (([v2 containsObject:v15] & 1) == 0)
                {
                  int v16 = +[NSNumber numberWithInt:2];
                  if ([v2 containsObject:v16])
                  {
                    v17 = +[NSNumber numberWithInt:1];
                    unsigned int v18 = [v2 containsObject:v17];

                    if (v18)
                    {
                      CFStringRef v9 = @"CONTROL_CENTER_STANDARD_UNSUPPORTED";
                      goto LABEL_50;
                    }
LABEL_31:
                    int64_t v21 = +[NSNumber numberWithInt:0];
                    if ([v2 containsObject:v21])
                    {
                      __int16 v22 = +[NSNumber numberWithInt:2];
                      if (![v2 containsObject:v22])
                      {
                        __int16 v27 = +[NSNumber numberWithInt:1];
                        unsigned int v28 = [v2 containsObject:v27];

                        if (v28)
                        {
                          CFStringRef v9 = @"CONTROL_CENTER_VOICE_ISO_UNSUPPORTED";
                          goto LABEL_50;
                        }
LABEL_35:
                        int64_t v23 = +[NSNumber numberWithInt:0];
                        if ([v2 containsObject:v23])
                        {
                          v24 = +[NSNumber numberWithInt:2];
                          if ([v2 containsObject:v24])
                          {
                            __int16 v25 = +[NSNumber numberWithInt:1];
                            unsigned __int8 v26 = [v2 containsObject:v25];

                            if ((v26 & 1) == 0)
                            {
                              CFStringRef v9 = @"CONTROL_CENTER_MUSIC_UNSUPPORTED";
                              goto LABEL_50;
                            }
LABEL_43:
                            v29 = +[NSNumber numberWithInt:0];
                            if (![v2 containsObject:v29])
                            {
                              v30 = +[NSNumber numberWithInt:2];
                              if (![v2 containsObject:v30])
                              {
                                v31 = +[NSNumber numberWithInt:1];
                                unsigned __int8 v32 = [v2 containsObject:v31];

                                if ((v32 & 1) == 0)
                                {
                                  CFStringRef v9 = @"CONTROL_CENTER_NO_MODES_SUPPORTED";
                                  goto LABEL_50;
                                }
LABEL_47:
                                int v10 = 0;
LABEL_51:

                                goto LABEL_52;
                              }
                            }
                            goto LABEL_47;
                          }
                        }
                        goto LABEL_43;
                      }
                    }
                    goto LABEL_35;
                  }
                }
                goto LABEL_31;
              }
            }
            goto LABEL_23;
          }
        }
        goto LABEL_19;
      }
    }
    goto LABEL_6;
  }
  if (__RPLogLevel > 2u)
  {
    int v10 = 0;
    goto LABEL_55;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1E144();
  }
  int v10 = 0;
LABEL_52:
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 136446722;
    v35 = "-[AudioEffectsManager getUnavailableString]";
    __int16 v36 = 1024;
    int v37 = 274;
    __int16 v38 = 2112;
    v39 = v10;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d unavailableString=%@", (uint8_t *)&v34, 0x1Cu);
  }
LABEL_55:

  return v10;
}

- (BOOL)shouldLoadFromSensor
{
  return self->_shouldLoadFromSensor;
}

- (void)setShouldLoadFromSensor:(BOOL)a3
{
  self->_shouldLoadFromSensor = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSArray)supportedModes
{
  return self->_supportedModes;
}

- (void)setSupportedModes:(id)a3
{
}

- (int64_t)currentMicMode
{
  return self->_currentMicMode;
}

- (void)setCurrentMicMode:(int64_t)a3
{
  self->_int64_t currentMicMode = a3;
}

- (BOOL)audioEffectsEnabled
{
  return self->_audioEffectsEnabled;
}

- (void)setAudioEffectsEnabled:(BOOL)a3
{
  self->_audioEffectsEnabled = a3;
}

- (BOOL)automaticMicModeEnabled
{
  return self->_automaticMicModeEnabled;
}

- (void)setAutomaticMicModeEnabled:(BOOL)a3
{
  self->_BOOL automaticMicModeEnabled = a3;
}

- (AudioEffectsManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_supportedModes, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end