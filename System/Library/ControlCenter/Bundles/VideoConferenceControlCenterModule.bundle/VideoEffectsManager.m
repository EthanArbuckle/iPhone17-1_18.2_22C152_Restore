@interface VideoEffectsManager
- (BOOL)setIntensity:(float)a3 forEffect:(int)a4;
- (BOOL)setState:(BOOL)a3 forEffect:(int)a4;
- (BOOL)shouldLoadFromSensor;
- (BOOL)videoEffectsEnabled;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (VideoEffects)backgroundBlur;
- (VideoEffects)centerStage;
- (VideoEffects)gestures;
- (VideoEffects)reactions;
- (VideoEffects)studioLighting;
- (VideoEffectsManager)init;
- (VideoEffectsManagerDelegate)delegate;
- (id)getUnavailableString;
- (id)unavailableStringForReason:(unint64_t)a3 appName:(id)a4 forVideoEffect:(unint64_t)a5;
- (void)dealloc;
- (void)handleAVControlCenterNotification:(id)a3;
- (void)setBackgroundBlur:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCenterStage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setGestures:(id)a3;
- (void)setReactions:(id)a3;
- (void)setShouldLoadFromSensor:(BOOL)a3;
- (void)setStudioLighting:(id)a3;
- (void)setVideoEffectsEnabled:(BOOL)a3;
- (void)setupVideoEffectsModeNotifications;
- (void)setupWithoutSensorData;
- (void)updateCurrentApplicationWithContext:(id)a3;
- (void)updateVideoEffectsStates;
- (void)updateVisuals;
- (void)verifyCenterStageAvailability;
@end

@implementation VideoEffectsManager

- (VideoEffectsManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)VideoEffectsManager;
  v2 = [(VideoEffectsManager *)&v22 init];
  if (v2)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v24 = "-[VideoEffectsManager init]";
      __int16 v25 = 1024;
      int v26 = 39;
      __int16 v27 = 2048;
      v28 = v2;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    v3 = [VideoEffects alloc];
    v4 = [(VideoEffects *)v3 initWithVideoEffectsModule:AVControlCenterVideoEffectCenterStage];
    centerStage = v2->_centerStage;
    v2->_centerStage = v4;

    v6 = [VideoEffects alloc];
    v7 = [(VideoEffects *)v6 initWithVideoEffectsModule:AVControlCenterVideoEffectBackgroundBlur];
    backgroundBlur = v2->_backgroundBlur;
    v2->_backgroundBlur = v7;

    v9 = [VideoEffects alloc];
    v10 = [(VideoEffects *)v9 initWithVideoEffectsModule:AVControlCenterVideoEffectStudioLighting];
    studioLighting = v2->_studioLighting;
    v2->_studioLighting = v10;

    v12 = [VideoEffects alloc];
    v13 = [(VideoEffects *)v12 initWithVideoEffectsModule:AVControlCenterVideoEffectReactions];
    reactions = v2->_reactions;
    v2->_reactions = v13;

    v15 = [VideoEffects alloc];
    v16 = [(VideoEffects *)v15 initWithVideoEffectsModule:AVControlCenterVideoEffectGestures];
    gestures = v2->_gestures;
    v2->_gestures = v16;

    displayName = v2->_displayName;
    v2->_displayName = 0;

    bundleIdentifier = v2->_bundleIdentifier;
    v2->_bundleIdentifier = 0;

    delegate = v2->_delegate;
    v2->_delegate = 0;

    v2->_currentCameraSupportsCenterStage = 0;
  }
  return v2;
}

- (void)dealloc
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v7 = "-[VideoEffectsManager dealloc]";
    __int16 v8 = 1024;
    int v9 = 54;
    __int16 v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  delegate = self->_delegate;
  self->_delegate = 0;

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)VideoEffectsManager;
  [(VideoEffectsManager *)&v5 dealloc];
}

- (void)updateCurrentApplicationWithContext:(id)a3
{
  v4 = [a3 sensorActivityDataForActiveSensorType:0];
  if (v4)
  {
    id v13 = v4;
    objc_super v5 = [v4 displayName];
    displayName = self->_displayName;
    self->_displayName = v5;

    v7 = [v13 bundleIdentifier];
    if ([v7 isEqualToString:@"com.apple.TelephonyUtilities"])
    {
      bundleIdentifier = self->_bundleIdentifier;
      self->_bundleIdentifier = (NSString *)@"com.apple.facetime";
    }
    else
    {
      bundleIdentifier = [v13 bundleIdentifier];
      if ([bundleIdentifier isEqualToString:@"com.apple.facetime"])
      {
        int v9 = self->_bundleIdentifier;
        self->_bundleIdentifier = (NSString *)@"com.apple.facetime";
      }
      else
      {
        int v9 = [v13 bundleIdentifier];
        if ([v9 isEqualToString:@"com.apple.mediaserverd"])
        {
          __int16 v10 = self->_bundleIdentifier;
          self->_bundleIdentifier = (NSString *)@"com.apple.facetime";
        }
        else
        {
          __int16 v10 = [v13 bundleIdentifier];
          if ([v10 isEqualToString:@"com.apple.avconferenced"])
          {
            v11 = self->_bundleIdentifier;
            self->_bundleIdentifier = (NSString *)@"com.apple.facetime";
          }
          else
          {
            v12 = [v13 bundleIdentifier];
            v11 = self->_bundleIdentifier;
            self->_bundleIdentifier = v12;
          }
        }
      }
    }
    [(VideoEffectsManager *)self updateVideoEffectsStates];
    v4 = v13;
  }
}

- (void)updateVideoEffectsStates
{
  if (self->_bundleIdentifier)
  {
    -[VideoEffects updateVideoEffectStatesWithBundleID:](self->_centerStage, "updateVideoEffectStatesWithBundleID:");
    [(VideoEffects *)self->_backgroundBlur updateVideoEffectStatesWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_studioLighting updateVideoEffectStatesWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_reactions updateVideoEffectStatesWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_gestures updateVideoEffectStatesWithBundleID:self->_bundleIdentifier];
    self->_currentCameraSupportsCenterStage = [(VideoEffects *)self->_centerStage isAvailable];
    [(VideoEffectsManager *)self verifyCenterStageAvailability];
    [(VideoEffectsManager *)self updateVisuals];
  }
  else if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_49F3C();
  }
}

- (void)verifyCenterStageAvailability
{
  if (self->_bundleIdentifier)
  {
    self->_currentCameraSupportsCenterStage = (AVControlCenterVideoEffectsModuleGetUnavailableReasons() & 1) == 0;
  }
  else if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_49FBC();
  }
}

- (void)setupVideoEffectsModeNotifications
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    __int16 v8 = "-[VideoEffectsManager setupVideoEffectsModeNotifications]";
    __int16 v9 = 1024;
    int v10 = 98;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
  }
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification object:0];

  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification object:0];
}

- (void)handleAVControlCenterNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 userInfo];
  v6 = [v5 objectForKey:AVControlCenterModulesNotificationBundleIdentifierKey];

  if (![v6 isEqualToString:self->_bundleIdentifier]) {
    goto LABEL_21;
  }
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v4 name];
    *(_DWORD *)v32 = 136446722;
    *(void *)&v32[4] = "-[VideoEffectsManager handleAVControlCenterNotification:]";
    *(_WORD *)&v32[12] = 1024;
    *(_DWORD *)&v32[14] = 123;
    *(_WORD *)&v32[18] = 2112;
    *(void *)&v32[20] = v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notificationName=%@", v32, 0x1Cu);
  }
  __int16 v8 = [v4 name];
  unsigned int v9 = [v8 isEqualToString:AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification];

  if (v9)
  {
    [(VideoEffects *)self->_backgroundBlur updateAvailabilityWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_centerStage updateAvailabilityWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_studioLighting updateAvailabilityWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_reactions updateAvailabilityWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_gestures updateAvailabilityWithBundleID:self->_bundleIdentifier];
    if (__RPLogLevel > 1u || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    unsigned int v10 = [(VideoEffects *)self->_backgroundBlur isAvailable];
    unsigned int v11 = [(VideoEffects *)self->_centerStage isAvailable];
    unsigned int v12 = [(VideoEffects *)self->_studioLighting isAvailable];
    unsigned int v13 = [(VideoEffects *)self->_reactions isAvailable];
    unsigned int v14 = [(VideoEffects *)self->_gestures isAvailable];
    *(_DWORD *)v32 = 136447746;
    *(void *)&v32[4] = "-[VideoEffectsManager handleAVControlCenterNotification:]";
    *(_WORD *)&v32[12] = 1024;
    *(_DWORD *)&v32[14] = 132;
    *(_WORD *)&v32[18] = 1024;
    *(_DWORD *)&v32[20] = v10;
    *(_WORD *)&v32[24] = 1024;
    *(_DWORD *)&v32[26] = v11;
    *(_WORD *)&v32[30] = 1024;
    *(_DWORD *)&v32[32] = v12;
    *(_WORD *)&v32[36] = 1024;
    *(_DWORD *)&v32[38] = v13;
    *(_WORD *)&v32[42] = 1024;
    *(_DWORD *)&v32[44] = v14;
    v15 = " [INFO] %{public}s:%d backgroundBlurSupported=%d centerStageSupported=%d StudioLightingSupported=%d reactionsS"
          "upported=%d gesturesSupported=%d";
LABEL_17:
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, v32, 0x30u);
LABEL_18:
    [(VideoEffectsManager *)self updateVisuals];
    goto LABEL_19;
  }
  v16 = [v4 name];
  unsigned int v17 = [v16 isEqualToString:AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification];

  if (v17)
  {
    [(VideoEffects *)self->_backgroundBlur updateControlModeWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_centerStage updateControlModeWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_studioLighting updateControlModeWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_reactions updateControlModeWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_gestures updateControlModeWithBundleID:self->_bundleIdentifier];
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v18 = [(VideoEffects *)self->_backgroundBlur controlMode];
      int64_t v19 = [(VideoEffects *)self->_centerStage controlMode];
      int64_t v20 = [(VideoEffects *)self->_studioLighting controlMode];
      int64_t v21 = [(VideoEffects *)self->_reactions controlMode];
      int64_t v22 = [(VideoEffects *)self->_gestures controlMode];
      *(_DWORD *)v32 = 136447746;
      *(void *)&v32[4] = "-[VideoEffectsManager handleAVControlCenterNotification:]";
      *(_WORD *)&v32[12] = 1024;
      *(_DWORD *)&v32[14] = 148;
      *(_WORD *)&v32[18] = 2048;
      *(void *)&v32[20] = v18;
      *(_WORD *)&v32[28] = 2048;
      *(void *)&v32[30] = v19;
      *(_WORD *)&v32[38] = 2048;
      *(void *)&v32[40] = v20;
      __int16 v33 = 2048;
      int64_t v34 = v21;
      __int16 v35 = 2048;
      int64_t v36 = v22;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d backgroundBlurControlMode=%ld centerStageControlMode=%ld StudioLightingControlMode=%ld reactionsControlMode=%ld gesturesControlMode=%ld", v32, 0x44u);
    }
    goto LABEL_19;
  }
  v23 = [v4 name];
  unsigned int v24 = [v23 isEqualToString:AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification];

  if (v24)
  {
    [(VideoEffects *)self->_backgroundBlur updateEnabledWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_centerStage updateEnabledWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_studioLighting updateEnabledWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_reactions updateEnabledWithBundleID:self->_bundleIdentifier];
    [(VideoEffects *)self->_gestures updateEnabledWithBundleID:self->_bundleIdentifier];
    if (__RPLogLevel > 1u || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    unsigned int v25 = [(VideoEffects *)self->_backgroundBlur enabled];
    unsigned int v26 = [(VideoEffects *)self->_centerStage enabled];
    unsigned int v27 = [(VideoEffects *)self->_studioLighting enabled];
    unsigned int v28 = [(VideoEffects *)self->_reactions enabled];
    unsigned int v29 = [(VideoEffects *)self->_gestures enabled];
    *(_DWORD *)v32 = 136447746;
    *(void *)&v32[4] = "-[VideoEffectsManager handleAVControlCenterNotification:]";
    *(_WORD *)&v32[12] = 1024;
    *(_DWORD *)&v32[14] = 156;
    *(_WORD *)&v32[18] = 1024;
    *(_DWORD *)&v32[20] = v25;
    *(_WORD *)&v32[24] = 1024;
    *(_DWORD *)&v32[26] = v26;
    *(_WORD *)&v32[30] = 1024;
    *(_DWORD *)&v32[32] = v27;
    *(_WORD *)&v32[36] = 1024;
    *(_DWORD *)&v32[38] = v28;
    *(_WORD *)&v32[42] = 1024;
    *(_DWORD *)&v32[44] = v29;
    v15 = " [INFO] %{public}s:%d backgroundBlurEnabled=%d centerStageEnabled=%d StudioLightingEnabled=%d reactionsEnabled"
          "=%d gesturesEnabled=%d";
    goto LABEL_17;
  }
LABEL_19:
  v30 = [v4 name];
  unsigned int v31 = [v30 isEqualToString:AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification];

  if (v31)
  {
    [(VideoEffectsManager *)self verifyCenterStageAvailability];
    [(VideoEffectsManager *)self updateVisuals];
  }
LABEL_21:
}

- (BOOL)setState:(BOOL)a3 forEffect:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (self->_bundleIdentifier)
  {
    switch(a4)
    {
      case 0:
        centerStage = self->_centerStage;
        goto LABEL_14;
      case 1:
        centerStage = self->_backgroundBlur;
        goto LABEL_14;
      case 2:
        centerStage = self->_studioLighting;
        goto LABEL_14;
      case 3:
      case 4:
        centerStage = self->_gestures;
LABEL_14:
        -[VideoEffects setState:withBundleID:](centerStage, "setState:withBundleID:", a3);
        LOBYTE(v6) = 1;
        return v6;
      default:
        if (__RPLogLevel > 2u) {
          goto LABEL_10;
        }
        BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (!v6) {
          return v6;
        }
        sub_4A0BC(v4);
        break;
    }
    goto LABEL_10;
  }
  if (__RPLogLevel > 2u)
  {
LABEL_10:
    LOBYTE(v6) = 0;
    return v6;
  }
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    sub_4A03C();
    goto LABEL_10;
  }
  return v6;
}

- (BOOL)setIntensity:(float)a3 forEffect:(int)a4
{
  if (self->_bundleIdentifier)
  {
    if (a4 == 2)
    {
      studioLighting = self->_studioLighting;
      goto LABEL_9;
    }
    if (a4 == 1)
    {
      studioLighting = self->_backgroundBlur;
LABEL_9:
      -[VideoEffects setIntensity:withBundleID:](studioLighting, "setIntensity:withBundleID:");
      LOBYTE(v6) = 1;
      return v6;
    }
    if (__RPLogLevel <= 2u)
    {
      BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      sub_4A204(a4);
    }
LABEL_13:
    LOBYTE(v6) = 0;
    return v6;
  }
  if (__RPLogLevel > 2u) {
    goto LABEL_13;
  }
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    sub_4A184();
    goto LABEL_13;
  }
  return v6;
}

- (void)setupWithoutSensorData
{
  if (!self->_shouldLoadFromSensor)
  {
    id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.cameracapture.volatile"];
    v3 = [v7 stringForKey:@"show-system-ui-app-name"];
    displayName = self->_displayName;
    self->_displayName = v3;

    objc_super v5 = [v7 stringForKey:@"show-system-ui-bundle-id"];
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v5;
  }
}

- (void)updateVisuals
{
  if (self->_delegate)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      objc_super v5 = "-[VideoEffectsManager updateVisuals]";
      __int16 v6 = 1024;
      int v7 = 237;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notify delegate", buf, 0x12u);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_BDB8;
    block[3] = &unk_68F10;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)getUnavailableString
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    unsigned int v17 = "-[VideoEffectsManager getUnavailableString]";
    __int16 v18 = 1024;
    int v19 = 245;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (!bundleIdentifier || [(NSString *)bundleIdentifier length])
  {
    if ([(VideoEffects *)self->_centerStage isAvailable]
      && [(VideoEffects *)self->_centerStage enabled]
      && !self->_currentCameraSupportsCenterStage)
    {
      displayName = self->_displayName;
      int v7 = self;
      uint64_t v8 = 1;
      goto LABEL_35;
    }
    if ([(VideoEffects *)self->_backgroundBlur isAvailable]
      && [(VideoEffects *)self->_centerStage isAvailable])
    {
      if ([(VideoEffects *)self->_backgroundBlur enabled]
        && [(VideoEffects *)self->_centerStage enabled])
      {
        uint64_t UnavailableReasons = AVControlCenterVideoEffectsModuleGetUnavailableReasons();
        uint64_t v5 = AVControlCenterVideoEffectsModuleGetUnavailableReasons();
        displayName = self->_displayName;
        if (UnavailableReasons != v5)
        {
          uint64_t v12 = v5;
          unsigned int v13 = [(VideoEffectsManager *)self unavailableStringForReason:UnavailableReasons appName:displayName forVideoEffect:1];
          uint64_t v14 = [(VideoEffectsManager *)self unavailableStringForReason:v12 appName:self->_displayName forVideoEffect:0];
          v15 = (void *)v14;
          unsigned int v10 = 0;
          if (v13 && v14)
          {
            unsigned int v10 = +[NSString stringWithFormat:@"%@ %@", v13, v14];
          }

          goto LABEL_37;
        }
        int v7 = self;
        uint64_t v8 = UnavailableReasons;
        uint64_t v9 = 2;
        goto LABEL_36;
      }
      if (![(VideoEffects *)self->_backgroundBlur enabled]
        && [(VideoEffects *)self->_centerStage enabled])
      {
        goto LABEL_29;
      }
      if (![(VideoEffects *)self->_backgroundBlur enabled]
        || [(VideoEffects *)self->_centerStage enabled])
      {
        goto LABEL_32;
      }
    }
    else
    {
      if (![(VideoEffects *)self->_backgroundBlur isAvailable]
        && [(VideoEffects *)self->_centerStage isAvailable])
      {
        if ([(VideoEffects *)self->_centerStage enabled])
        {
LABEL_29:
          uint64_t v8 = AVControlCenterVideoEffectsModuleGetUnavailableReasons();
          displayName = self->_displayName;
          int v7 = self;
LABEL_35:
          uint64_t v9 = 0;
          goto LABEL_36;
        }
LABEL_32:
        unsigned int v10 = 0;
LABEL_37:
        if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          unsigned int v17 = "-[VideoEffectsManager getUnavailableString]";
          __int16 v18 = 1024;
          int v19 = 286;
          __int16 v20 = 2112;
          int64_t v21 = v10;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d unavailableString=%@", buf, 0x1Cu);
        }
        goto LABEL_40;
      }
      if (![(VideoEffects *)self->_backgroundBlur isAvailable]
        || [(VideoEffects *)self->_centerStage isAvailable]
        || ![(VideoEffects *)self->_backgroundBlur enabled])
      {
        goto LABEL_32;
      }
    }
    uint64_t v8 = AVControlCenterVideoEffectsModuleGetUnavailableReasons();
    displayName = self->_displayName;
    int v7 = self;
    uint64_t v9 = 1;
LABEL_36:
    unsigned int v10 = [(VideoEffectsManager *)v7 unavailableStringForReason:v8 appName:displayName forVideoEffect:v9];
    goto LABEL_37;
  }
  if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_4A2A4();
  }
  unsigned int v10 = 0;
LABEL_40:

  return v10;
}

- (id)unavailableStringForReason:(unint64_t)a3 appName:(id)a4 forVideoEffect:(unint64_t)a5
{
  id v7 = a4;
  switch(a3)
  {
    case 0x10uLL:
      if (a5 == 1)
      {
        CFStringRef v9 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_PORTRAIT_UNSUPPORTED_BACKEND";
      }
      else if (a5 == 2)
      {
        CFStringRef v9 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_PLURAL_UNSUPPORTED_BACKEND";
      }
      else
      {
        CFStringRef v9 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_CENTER_STAGE_UNSUPPORTED_BACKEND";
      }
      goto LABEL_24;
    case 4uLL:
      if (a5 == 1)
      {
        CFStringRef v9 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_PORTRAIT_UNSUPPORTED_OPTOUT";
      }
      else if (a5 == 2)
      {
        CFStringRef v9 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_PLURAL_UNSUPPORTED_OPTOUT";
      }
      else
      {
        CFStringRef v9 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_CENTER_STAGE_UNSUPPORTED_OPTOUT";
      }
LABEL_24:
      uint64_t v12 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v9];
      unsigned int v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v7);

      break;
    case 1uLL:
      if (a5 == 1)
      {
        CFStringRef v8 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_PORTRAIT_UNSUPPORTED_CAMERA";
      }
      else if (a5 == 2)
      {
        CFStringRef v8 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_PLURAL_UNSUPPORTED_CAMERA";
      }
      else
      {
        CFStringRef v8 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_CENTER_STAGE_UNSUPPORTED_CAMERA";
      }
      unsigned int v11 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v8];
      break;
    default:
      if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v10 = +[NSNumber numberWithUnsignedInteger:a3];
        *(_DWORD *)buf = 136446722;
        v15 = "-[VideoEffectsManager unavailableStringForReason:appName:forVideoEffect:]";
        __int16 v16 = 1024;
        int v17 = 316;
        __int16 v18 = 2112;
        int v19 = v10;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d No unavailable string for supplied reason=%@", buf, 0x1Cu);
      }
      unsigned int v11 = 0;
      break;
  }

  return v11;
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

- (BOOL)videoEffectsEnabled
{
  return self->_videoEffectsEnabled;
}

- (void)setVideoEffectsEnabled:(BOOL)a3
{
  self->_videoEffectsEnabled = a3;
}

- (VideoEffectsManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (VideoEffects)centerStage
{
  return self->_centerStage;
}

- (void)setCenterStage:(id)a3
{
}

- (VideoEffects)backgroundBlur
{
  return self->_backgroundBlur;
}

- (void)setBackgroundBlur:(id)a3
{
}

- (VideoEffects)studioLighting
{
  return self->_studioLighting;
}

- (void)setStudioLighting:(id)a3
{
}

- (VideoEffects)reactions
{
  return self->_reactions;
}

- (void)setReactions:(id)a3
{
}

- (VideoEffects)gestures
{
  return self->_gestures;
}

- (void)setGestures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestures, 0);
  objc_storeStrong((id *)&self->_reactions, 0);
  objc_storeStrong((id *)&self->_studioLighting, 0);
  objc_storeStrong((id *)&self->_backgroundBlur, 0);
  objc_storeStrong((id *)&self->_centerStage, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end