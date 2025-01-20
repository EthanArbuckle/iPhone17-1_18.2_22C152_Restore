@interface RPCCActivityManager
+ (NSURL)activitiesSettingsURL;
+ (id)newActivityManager;
+ (id)newActivityManagerWithIdentifier:(id)a3;
+ (id)sharedActivityManager;
+ (void)initialize;
- (BOOL)_doesActivity:(id)a3 identifySameModeAsActivity:(id)a4;
- (BOOL)isActivityLocalUserInitiated:(id)a3;
- (BOOL)isDefaultConfiguration;
- (BOOL)isLifetimeDescriptionsUpdatingEnabled;
- (BOOL)shouldActivityShowStatusPill:(id)a3;
- (BOOL)shouldLoadFromSensor;
- (NSArray)activeActivities;
- (NSArray)availableActivities;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedTerminationDescriptionForActiveActivity;
- (RPCCActivityDescribing)activeActivity;
- (RPCCActivityDescribing)defaultActivity;
- (id)_activeActivity;
- (id)_activityForATXActivityOrSuggestion:(id)a3;
- (id)_activityForModeIdentifier:(id)a3;
- (id)_activityForUniqueIdentifier:(id)a3;
- (id)_initWithIdentifier:(id)a3;
- (id)_lifetimeForActiveActivity;
- (id)_lifetimeForLifetimeDetailsIdentifier:(id)a3 ofActivity:(id)a4;
- (id)activityWithIdentifier:(id)a3;
- (id)getAppNameString;
- (id)getUnavailableString;
- (id)lifetimeOfActivity:(id)a3;
- (id)promotedPlaceholderActivity:(id)a3;
- (id)suggestedActivityForLocation:(int64_t)a3;
- (id)unavailableStringForReason:(unint64_t)a3 appName:(id)a4 forVideoEffect:(unint64_t)a5;
- (unint64_t)maximumActivityCountForUserInterface;
- (void)_checkCenterStageAvailability;
- (void)_drivingTriggerDidChange;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_invalidateActiveModeAssertion;
- (void)_notifyObserversOfAvailableActivitiesChange;
- (void)_notifyObserversOfLifetimeChangeForActivity:(id)a3;
- (void)_setActiveActivity:(id)a3 withLifetime:(id)a4 reason:(id)a5;
- (void)_setAvailableActivities:(id)a3;
- (void)_setDefaultActivity:(id)a3;
- (void)_updateActiveActivity:(id)a3;
- (void)_updateActiveModeAssertionIfNecessary;
- (void)_updateActivitySuggestion:(id)a3;
- (void)_updateLifetimeForActiveActivity;
- (void)_updateLifetimeForActiveActivityIfNecessary;
- (void)_updateLifetimesAlternativeDescriptionsForAvailableActivities;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)didShowSuggestedActivity:(id)a3 location:(int64_t)a4;
- (void)handleAVControlCenterNotification:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setActiveActivity:(id)a3;
- (void)setActiveActivity:(id)a3 reason:(id)a4;
- (void)setActiveActivity:(id)a3 withLifetime:(id)a4 reason:(id)a5;
- (void)setActivity:(id)a3 active:(BOOL)a4 reason:(id)a5;
- (void)setActivity:(id)a3 active:(BOOL)a4 withLifetime:(id)a5 reason:(id)a6;
- (void)setContentModuleContext:(id)a3;
- (void)setIntensity:(float)a3 forActivityIdentifier:(id)a4;
- (void)setShouldLoadFromSensor:(BOOL)a3;
- (void)setState:(BOOL)a3 forActivity:(id)a4;
- (void)setupCameraEffectsInitialState;
- (void)setupCameraEffectsNotifications;
- (void)setupInitialApplicationBundleID;
- (void)setupInitialStateAndNotifications;
- (void)userDidAcceptSuggestedActivity:(id)a3 location:(int64_t)a4;
- (void)userDidRejectSuggestedActivity:(id)a3 location:(int64_t)a4;
- (void)userDidSeeSuggestedActivity:(id)a3 location:(int64_t)a4;
@end

@implementation RPCCActivityManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    RPCCRegisterLogging();
  }
}

- (id)_initWithIdentifier:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)RPCCActivityManager;
  v5 = [(RPCCActivityManager *)&v39 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = v6;

    uint64_t v8 = +[NSHashTable hashTableWithOptions:517];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;

    v10 = [RPCCVideoEffect alloc];
    v11 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_CINEMATIC_FRAMING"];
    v12 = [(RPCCVideoEffect *)v10 initWithName:v11 effectIdentifier:AVControlCenterVideoEffectCenterStage symbolImageName:@"person.fill.viewfinder" tintColorName:@"systemBlueColor" intensityName:0];

    v13 = [RPCCVideoEffect alloc];
    v14 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_STUDIO_LIGHT"];
    uint64_t v15 = AVControlCenterVideoEffectStudioLighting;
    v16 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_INTENSITY_LABEL"];
    v17 = [(RPCCVideoEffect *)v13 initWithName:v14 effectIdentifier:v15 symbolImageName:@"cube" tintColorName:@"systemBlueColor" intensityName:v16];

    v18 = [RPCCVideoEffect alloc];
    v19 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_PORTRAIT"];
    uint64_t v20 = AVControlCenterVideoEffectBackgroundBlur;
    v21 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_DEPTH_LABEL"];
    v22 = [(RPCCVideoEffect *)v18 initWithName:v19 effectIdentifier:v20 symbolImageName:@"f.cursive" tintColorName:@"systemBlueColor" intensityName:v21];

    v23 = [RPCCVideoEffect alloc];
    v24 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_REACTIONS"];
    v25 = [(RPCCVideoEffect *)v23 initWithName:v24 effectIdentifier:AVControlCenterVideoEffectReactions symbolImageName:@"plus.bubble.tapback" tintColorName:@"systemBlueColor" intensityName:0];

    v26 = [[_RPCCVideoEffect alloc] initWithMode:v12];
    centerStageEffect = v5->_centerStageEffect;
    v5->_centerStageEffect = v26;

    v28 = [[_RPCCVideoEffect alloc] initWithMode:v17];
    lightingEffect = v5->_lightingEffect;
    v5->_lightingEffect = v28;

    v30 = [[_RPCCVideoEffect alloc] initWithMode:v22];
    backgroundBlurEffect = v5->_backgroundBlurEffect;
    v5->_backgroundBlurEffect = v30;

    v32 = [[_RPCCVideoEffect alloc] initWithMode:v25];
    reactionsEffect = v5->_reactionsEffect;
    v5->_reactionsEffect = v32;

    uint64_t v34 = objc_opt_new();
    activeActivities = v5->_activeActivities;
    v5->_activeActivities = (NSMutableArray *)v34;

    uint64_t v36 = objc_opt_new();
    availableActivities = v5->_availableActivities;
    v5->_availableActivities = (NSMutableArray *)v36;

    [(RPCCActivityManager *)v5 setupInitialApplicationBundleID];
  }

  return v5;
}

- (void)dealloc
{
  [(RPCCActivityManager *)self setLifetimeDescriptionsUpdatingEnabled:0];
  v3.receiver = self;
  v3.super_class = (Class)RPCCActivityManager;
  [(RPCCActivityManager *)&v3 dealloc];
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; _identifier: %@>",
           objc_opt_class(),
           self,
           self->_identifier);
}

- (void)setupInitialApplicationBundleID
{
  if (!self->_shouldLoadFromSensor)
  {
    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.cameracapture.volatile"];
    objc_super v3 = [v5 stringForKey:@"show-system-ui-bundle-id"];
    applicationBundleID = self->_applicationBundleID;
    self->_applicationBundleID = v3;
  }
}

- (void)setContentModuleContext:(id)a3
{
  id v15 = a3;
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
  id v5 = [(CCUIContentModuleContext *)self->_contentModuleContext sensorActivityDataForActiveSensorType:0];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 displayName];
    applicationDisplayName = self->_applicationDisplayName;
    self->_applicationDisplayName = v7;

    v9 = [v6 bundleIdentifier];
    if ([v9 isEqualToString:@"com.apple.TelephonyUtilities"])
    {
      applicationBundleID = self->_applicationBundleID;
      self->_applicationBundleID = (NSString *)@"com.apple.facetime";
    }
    else
    {
      applicationBundleID = [v6 bundleIdentifier];
      if ([applicationBundleID isEqualToString:@"com.apple.facetime"])
      {
        v11 = self->_applicationBundleID;
        self->_applicationBundleID = (NSString *)@"com.apple.facetime";
      }
      else
      {
        v11 = [v6 bundleIdentifier];
        if ([v11 isEqualToString:@"com.apple.mediaserverd"])
        {
          v12 = self->_applicationBundleID;
          self->_applicationBundleID = (NSString *)@"com.apple.facetime";
        }
        else
        {
          v12 = [v6 bundleIdentifier];
          if ([v12 isEqualToString:@"com.apple.avconferenced"])
          {
            v13 = self->_applicationBundleID;
            self->_applicationBundleID = (NSString *)@"com.apple.facetime";
          }
          else
          {
            v14 = [v6 bundleIdentifier];
            v13 = self->_applicationBundleID;
            self->_applicationBundleID = v14;
          }
        }
      }
    }
    [(RPCCActivityManager *)self setupInitialStateAndNotifications];
  }
}

- (void)setupInitialStateAndNotifications
{
  [(RPCCActivityManager *)self setupCameraEffectsNotifications];

  [(RPCCActivityManager *)self setupCameraEffectsInitialState];
}

- (void)setupCameraEffectsNotifications
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification object:0];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification object:0];
}

- (void)setupCameraEffectsInitialState
{
  if (self->_applicationBundleID)
  {
    self->_int64_t currentBackgroundBlurState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
    self->_BOOL currentBackgroundBlurEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
    self->_BOOL currentBackgroundBlurSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
    objc_super v3 = (void *)RPCCLogActivities;
    if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      id v5 = [(RPCCActivityManager *)self description];
      int64_t currentBackgroundBlurState = self->_currentBackgroundBlurState;
      BOOL currentBackgroundBlurEnabled = self->_currentBackgroundBlurEnabled;
      BOOL currentBackgroundBlurSupported = self->_currentBackgroundBlurSupported;
      *(_DWORD *)buf = 138544130;
      v35 = v5;
      __int16 v36 = 2048;
      int64_t v37 = currentBackgroundBlurState;
      __int16 v38 = 1024;
      BOOL v39 = currentBackgroundBlurEnabled;
      __int16 v40 = 1024;
      BOOL v41 = currentBackgroundBlurSupported;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] _currentBackgroundBlurState=%zu _currentBackgroundBlurEnabled=%d _currentBackgroundBlurSupported=%d", buf, 0x22u);
    }
    self->_int64_t currentCenterStageState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
    self->_BOOL currentCenterStageEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
    self->_BOOL currentCenterStageSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
    v9 = (void *)RPCCLogActivities;
    if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = [(RPCCActivityManager *)self description];
      int64_t currentCenterStageState = self->_currentCenterStageState;
      BOOL currentCenterStageEnabled = self->_currentCenterStageEnabled;
      BOOL currentCenterStageSupported = self->_currentCenterStageSupported;
      *(_DWORD *)buf = 138544130;
      v35 = v11;
      __int16 v36 = 2048;
      int64_t v37 = currentCenterStageState;
      __int16 v38 = 1024;
      BOOL v39 = currentCenterStageEnabled;
      __int16 v40 = 1024;
      BOOL v41 = currentCenterStageSupported;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] _currentCenterStageState=%zu _currentCenterStageEnabled=%d _currentCenterStageSupported=%d", buf, 0x22u);
    }
    self->_int64_t currentStudioLightState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
    self->_BOOL currentStudioLightEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
    self->_BOOL currentStudioLightSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
    id v15 = (void *)RPCCLogActivities;
    if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = [(RPCCActivityManager *)self description];
      int64_t currentStudioLightState = self->_currentStudioLightState;
      BOOL currentStudioLightEnabled = self->_currentStudioLightEnabled;
      BOOL currentStudioLightSupported = self->_currentStudioLightSupported;
      *(_DWORD *)buf = 138544130;
      v35 = v17;
      __int16 v36 = 2048;
      int64_t v37 = currentStudioLightState;
      __int16 v38 = 1024;
      BOOL v39 = currentStudioLightEnabled;
      __int16 v40 = 1024;
      BOOL v41 = currentStudioLightSupported;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] _currentStudioLightState=%zu _currentStudioLightEnabled=%d _currentStudioLightSupported=%d", buf, 0x22u);
    }
    self->_int64_t currentGestureState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
    self->_BOOL currentGestureEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
    self->_BOOL currentGestureSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
    v21 = (void *)RPCCLogActivities;
    if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = [(RPCCActivityManager *)self description];
      int64_t currentGestureState = self->_currentGestureState;
      BOOL currentGestureEnabled = self->_currentGestureEnabled;
      BOOL currentGestureSupported = self->_currentGestureSupported;
      *(_DWORD *)buf = 138544130;
      v35 = v23;
      __int16 v36 = 2048;
      int64_t v37 = currentGestureState;
      __int16 v38 = 1024;
      BOOL v39 = currentGestureEnabled;
      __int16 v40 = 1024;
      BOOL v41 = currentGestureSupported;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] _currentGestureState=%zu _currentGestureEnabled=%d _currentGestureSupported=%d", buf, 0x22u);
    }
    self->_int64_t currentReactionsState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
    self->_BOOL currentReactionsEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
    self->_BOOL currentReactionsSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
    v27 = (void *)RPCCLogActivities;
    if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      v29 = [(RPCCActivityManager *)self description];
      int64_t currentReactionsState = self->_currentReactionsState;
      BOOL currentReactionsEnabled = self->_currentReactionsEnabled;
      BOOL currentReactionsSupported = self->_currentReactionsSupported;
      *(_DWORD *)buf = 138544130;
      v35 = v29;
      __int16 v36 = 2048;
      int64_t v37 = currentReactionsState;
      __int16 v38 = 1024;
      BOOL v39 = currentReactionsEnabled;
      __int16 v40 = 1024;
      BOOL v41 = currentReactionsSupported;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] _currentReactionsState=%zu _currentReactionsEnabled=%d _currentReactionsSupported=%d", buf, 0x22u);
    }
    self->_currentCameraSupportsCenterStage = self->_currentCenterStageSupported;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D174;
    block[3] = &unk_68F10;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    NSLog(@"RPCCActivityManager: Unable to load initial state, no applicable application bundle ID found");
  }
}

- (void)handleAVControlCenterNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:AVControlCenterModulesNotificationBundleIdentifierKey];

  if ([v6 isEqualToString:self->_applicationBundleID])
  {
    v7 = [v4 name];
    unsigned int v8 = [v7 isEqualToString:AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification];

    if (v8)
    {
      self->_BOOL currentBackgroundBlurSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
      self->_BOOL currentCenterStageSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
      self->_BOOL currentStudioLightSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
      self->_BOOL currentGestureSupported = 0;
      v9 = (void *)RPCCLogActivities;
      if (!os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      v10 = v9;
      v11 = [(RPCCActivityManager *)self description];
      BOOL currentBackgroundBlurSupported = self->_currentBackgroundBlurSupported;
      BOOL currentCenterStageSupported = self->_currentCenterStageSupported;
      BOOL currentStudioLightSupported = self->_currentStudioLightSupported;
      BOOL currentGestureSupported = self->_currentGestureSupported;
      *(_DWORD *)buf = 138544386;
      __int16 v40 = v11;
      __int16 v41 = 1024;
      *(_DWORD *)v42 = currentBackgroundBlurSupported;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = currentCenterStageSupported;
      LOWORD(v43) = 1024;
      *(_DWORD *)((char *)&v43 + 2) = currentStudioLightSupported;
      HIWORD(v43) = 1024;
      *(_DWORD *)v44 = currentGestureSupported;
      v16 = "[%{public}@] _currentBackgroundBlurSupported=%d _currentCenterStageSupported=%d _currentStudioLightSupported"
            "=%d _currentGestureSupported=%d";
      v17 = v10;
      uint32_t v18 = 36;
LABEL_8:
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);

      goto LABEL_13;
    }
    v19 = [v4 name];
    unsigned int v20 = [v19 isEqualToString:AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification];

    if (v20)
    {
      self->_int64_t currentBackgroundBlurState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
      self->_int64_t currentCenterStageState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
      self->_int64_t currentStudioLightState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
      self->_int64_t currentGestureState = 0;
      v21 = (void *)RPCCLogActivities;
      if (!os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      v10 = v21;
      v11 = [(RPCCActivityManager *)self description];
      int64_t currentCenterStageState = self->_currentCenterStageState;
      int64_t currentBackgroundBlurState = self->_currentBackgroundBlurState;
      int64_t currentStudioLightState = self->_currentStudioLightState;
      int64_t currentGestureState = self->_currentGestureState;
      *(_DWORD *)buf = 138544386;
      __int16 v40 = v11;
      __int16 v41 = 2048;
      *(void *)v42 = currentBackgroundBlurState;
      *(_WORD *)&v42[8] = 2048;
      int64_t v43 = currentCenterStageState;
      *(_WORD *)v44 = 2048;
      *(void *)&v44[2] = currentStudioLightState;
      __int16 v45 = 2048;
      int64_t v46 = currentGestureState;
      v16 = "[%{public}@] _currentBackgroundBlurState=%zu _currentCenterStageState=%zu _currentStudioLightState=%zu _curr"
            "entGestureState==%zu";
      v17 = v10;
      uint32_t v18 = 52;
      goto LABEL_8;
    }
    v26 = [v4 name];
    unsigned int v27 = [v26 isEqualToString:AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification];

    if (v27)
    {
      self->_BOOL currentCenterStageEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
      self->_BOOL currentBackgroundBlurEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
      self->_BOOL currentStudioLightEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
      self->_BOOL currentGestureEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
      self->_BOOL currentReactionsEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
      v28 = (void *)RPCCLogActivities;
      if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        v30 = [(RPCCActivityManager *)self description];
        BOOL currentBackgroundBlurEnabled = self->_currentBackgroundBlurEnabled;
        BOOL currentCenterStageEnabled = self->_currentCenterStageEnabled;
        BOOL currentStudioLightEnabled = self->_currentStudioLightEnabled;
        BOOL currentGestureEnabled = self->_currentGestureEnabled;
        BOOL currentReactionsEnabled = self->_currentReactionsEnabled;
        *(_DWORD *)buf = 138544642;
        __int16 v40 = v30;
        __int16 v41 = 1024;
        *(_DWORD *)v42 = currentBackgroundBlurEnabled;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = currentCenterStageEnabled;
        LOWORD(v43) = 1024;
        *(_DWORD *)((char *)&v43 + 2) = currentStudioLightEnabled;
        HIWORD(v43) = 1024;
        *(_DWORD *)v44 = currentGestureEnabled;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = currentReactionsEnabled;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] _currentBackgroundBlurEnabled=%d _currentCenterStageEnabled=%d _currentStudioLightEnabled=%d _currentGestureEnabled=%d, _currentReactionsEnabled=%d", buf, 0x2Au);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_DBC4;
      block[3] = &unk_68F10;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
LABEL_13:
  __int16 v36 = [v4 name];
  unsigned int v37 = [v36 isEqualToString:AVControlCenterVideoEffectsUnavailableReasonsDidChangeNotification];

  if (v37) {
    [(RPCCActivityManager *)self _checkCenterStageAvailability];
  }
}

- (void)_checkCenterStageAvailability
{
  if (self->_applicationBundleID)
  {
    uint64_t UnavailableReasons = AVControlCenterVideoEffectsModuleGetUnavailableReasons();
    self->_BOOL currentCameraSupportsCenterStage = (UnavailableReasons & 1) == 0;
    id v4 = (void *)RPCCLogActivities;
    if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = [(RPCCActivityManager *)self description];
      BOOL currentCameraSupportsCenterStage = self->_currentCameraSupportsCenterStage;
      *(_DWORD *)buf = 138543874;
      v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = UnavailableReasons;
      __int16 v13 = 1024;
      BOOL v14 = currentCameraSupportsCenterStage;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] centerStageReason=%lu _currentCameraSupportsCenterStage=%d", buf, 0x1Cu);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_E0E8;
    block[3] = &unk_68F10;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)setState:(BOOL)a3 forActivity:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = AVControlCenterVideoEffectReactions;
  if ([v6 isEqualToString:AVControlCenterVideoEffectReactions])
  {
    id v8 = AVControlCenterVideoEffectGestures;

    id v6 = v8;
  }
  int v9 = AVControlCenterVideoEffectsModuleSetEffectEnabledForBundleID();
  v10 = (void *)RPCCLogActivities;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEBUG))
  {
    __int16 v11 = v10;
    uint64_t v12 = [(RPCCActivityManager *)self description];
    *(_DWORD *)buf = 138544130;
    v16 = v12;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 1024;
    BOOL v20 = v4;
    __int16 v21 = 1024;
    int v22 = v9;
    _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] Setting video effects enabled for identfier: %@, state: %d, success: %d", buf, 0x22u);
  }
  if ([v6 isEqualToString:AVControlCenterVideoEffectCenterStage])
  {
    self->_BOOL currentCenterStageEnabled = v4;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_E4B4;
    block[3] = &unk_68F10;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if ([v6 isEqualToString:AVControlCenterVideoEffectBackgroundBlur])
  {
    self->_BOOL currentBackgroundBlurEnabled = v4;
  }
  else if ([v6 isEqualToString:AVControlCenterVideoEffectStudioLighting])
  {
    self->_BOOL currentStudioLightEnabled = v4;
  }
  else if ([v6 isEqualToString:v7])
  {
    self->_BOOL currentReactionsEnabled = v4;
  }
  else if ([v6 isEqualToString:AVControlCenterVideoEffectGestures])
  {
    self->_BOOL currentGestureEnabled = v4;
  }
  else
  {
    __int16 v13 = (void *)RPCCLogActivities;
    if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEBUG)) {
      sub_4A4B4(v13, self);
    }
  }
}

- (void)setIntensity:(float)a3 forActivityIdentifier:(id)a4
{
  id v6 = a4;
  AVControlCenterVideoEffectsModuleGetEffectIntensityRangeForBundleID();
  double v8 = v7;
  double v10 = v9;
  double v11 = v9 - v7;
  double v12 = a3;
  double v13 = v7 + (v9 - v7) * v12;
  unsigned int v14 = [v6 isEqualToString:AVControlCenterVideoEffectBackgroundBlur];
  double v15 = v10 - v11 * v12;
  if (!v14) {
    double v15 = v13;
  }
  float v16 = v15;
  AVControlCenterVideoEffectsModuleGetEffectIntensityDefaultValueForBundleID();
  float v18 = v17;
  __int16 v19 = (void *)RPCCLogActivities;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v20 = v19;
    __int16 v21 = [(RPCCActivityManager *)self description];
    int v22 = 138544642;
    v23 = v21;
    __int16 v24 = 2048;
    double v25 = v16;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2048;
    double v29 = v8;
    __int16 v30 = 2048;
    double v31 = v10;
    __int16 v32 = 2048;
    double v33 = v18;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting intensity %f for effect %@. range min %f max %f. default %f", (uint8_t *)&v22, 0x3Eu);
  }
  AVControlCenterVideoEffectsModuleSetEffectIntensityForBundleID();
}

+ (id)sharedActivityManager
{
  if (qword_7DD88 != -1) {
    dispatch_once(&qword_7DD88, &stru_68FF8);
  }
  v2 = (void *)qword_7DD80;

  return v2;
}

+ (NSURL)activitiesSettingsURL
{
  return 0;
}

- (unint64_t)maximumActivityCountForUserInterface
{
  return 3;
}

- (NSArray)availableActivities
{
  id v2 = [(NSMutableArray *)self->_availableActivities copyWithZone:0];

  return (NSArray *)v2;
}

- (NSArray)activeActivities
{
  id v2 = [(NSMutableArray *)self->_activeActivities copyWithZone:0];

  return (NSArray *)v2;
}

- (RPCCActivityDescribing)activeActivity
{
  id v2 = [(RPCCActivityManager *)self _activeActivity];
  id v3 = [v2 copyWithZone:0];

  return (RPCCActivityDescribing *)v3;
}

- (RPCCActivityDescribing)defaultActivity
{
  defaultActivity = self->_defaultActivity;
  if (!defaultActivity) {
    self->_defaultActivity = 0;
  }
  id v4 = [(RPCCActivityDescribing *)defaultActivity copyWithZone:0];

  return (RPCCActivityDescribing *)v4;
}

- (BOOL)isDefaultConfiguration
{
  return [(NSMutableArray *)self->_availableActivities indexOfObjectPassingTest:&stru_69038] == (id)0x7FFFFFFFFFFFFFFFLL;
}

- (NSString)localizedTerminationDescriptionForActiveActivity
{
  return 0;
}

- (id)lifetimeOfActivity:(id)a3
{
  return 0;
}

- (void)setActivity:(id)a3 active:(BOOL)a4 reason:(id)a5
{
}

- (void)setActivity:(id)a3 active:(BOOL)a4 withLifetime:(id)a5 reason:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10 || !a4)
  {
    unsigned int v14 = [v10 activityUniqueIdentifier];
    double v15 = [(RPCCActivityManager *)self _activityForUniqueIdentifier:v14];

    float v16 = [v11 lifetimeIdentifier];
    float v17 = [(RPCCActivityManager *)self _lifetimeForLifetimeDetailsIdentifier:v16 ofActivity:v15];

    float v18 = (void *)RPCCLogActivities;
    if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = v18;
      BOOL v20 = [(RPCCActivityManager *)self description];
      int v21 = 138544130;
      int v22 = v20;
      __int16 v23 = 2112;
      __int16 v24 = v15;
      __int16 v25 = 2112;
      __int16 v26 = v17;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calling _setActiveActivity with resolvedActivity: %@, lifetime: %@, reason: %@", (uint8_t *)&v21, 0x2Au);
    }
    [(RPCCActivityManager *)self _setActiveActivity:v15 withLifetime:v17 reason:v12];
  }
  else
  {
    double v13 = (void *)RPCCLogActivities;
    if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_ERROR)) {
      sub_4A54C(v13, self);
    }
  }
}

- (BOOL)isActivityLocalUserInitiated:(id)a3
{
  return 0;
}

- (BOOL)shouldActivityShowStatusPill:(id)a3
{
  return 1;
}

- (id)promotedPlaceholderActivity:(id)a3
{
  return 0;
}

- (id)suggestedActivityForLocation:(int64_t)a3
{
  return 0;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self->_observers;
    objc_sync_enter(v5);
    [(NSHashTable *)self->_observers addObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = self->_observers;
    objc_sync_enter(v5);
    [(NSHashTable *)self->_observers removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (id)getAppNameString
{
  return self->_applicationDisplayName;
}

- (id)getUnavailableString
{
  if ([(NSString *)self->_applicationBundleID length])
  {
    if (self->_currentCenterStageSupported)
    {
      if (self->_currentCenterStageEnabled)
      {
        if (self->_currentCameraSupportsCenterStage)
        {
          if (self->_currentBackgroundBlurSupported && self->_currentBackgroundBlurEnabled)
          {
            uint64_t UnavailableReasons = AVControlCenterVideoEffectsModuleGetUnavailableReasons();
            uint64_t v4 = AVControlCenterVideoEffectsModuleGetUnavailableReasons();
            if (UnavailableReasons != v4)
            {
              uint64_t v13 = v4;
              unsigned int v14 = [(RPCCActivityManager *)self unavailableStringForReason:UnavailableReasons appName:self->_applicationDisplayName forVideoEffect:1];
              double v15 = [(RPCCActivityManager *)self unavailableStringForReason:v13 appName:self->_applicationDisplayName forVideoEffect:0];
              id v11 = +[NSString stringWithFormat:@"%@ %@", v14, v15];

              goto LABEL_24;
            }
            applicationDisplayName = self->_applicationDisplayName;
            id v6 = self;
            uint64_t v7 = UnavailableReasons;
            uint64_t v8 = 2;
            goto LABEL_23;
          }
          uint64_t v7 = AVControlCenterVideoEffectsModuleGetUnavailableReasons();
          applicationDisplayName = self->_applicationDisplayName;
          id v6 = self;
        }
        else
        {
          applicationDisplayName = self->_applicationDisplayName;
          id v6 = self;
          uint64_t v7 = 1;
        }
        uint64_t v8 = 0;
LABEL_23:
        id v11 = [(RPCCActivityManager *)v6 unavailableStringForReason:v7 appName:applicationDisplayName forVideoEffect:v8];
        goto LABEL_24;
      }
      if (self->_currentBackgroundBlurSupported)
      {
        if (self->_currentBackgroundBlurEnabled) {
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
    else
    {
      if (!self->_currentBackgroundBlurSupported)
      {
LABEL_18:
        id v11 = &stru_69FF8;
LABEL_24:
        id v10 = v11;
        goto LABEL_25;
      }
      if (self->_currentBackgroundBlurEnabled)
      {
LABEL_17:
        uint64_t v7 = AVControlCenterVideoEffectsModuleGetUnavailableReasons();
        applicationDisplayName = self->_applicationDisplayName;
        id v6 = self;
        uint64_t v8 = 1;
        goto LABEL_23;
      }
    }
    id v11 = 0;
    goto LABEL_24;
  }
  double v9 = (void *)RPCCLogActivities;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEBUG)) {
    sub_4A5F4(v9, self);
  }
  id v10 = &stru_69FF8;
LABEL_25:

  return v10;
}

- (id)unavailableStringForReason:(unint64_t)a3 appName:(id)a4 forVideoEffect:(unint64_t)a5
{
  id v7 = a4;
  if (a3 == 16)
  {
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
  }
  else
  {
    if (a3 != 4)
    {
      if (a3 == 1)
      {
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
        id v10 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v8];
      }
      else
      {
        id v10 = &stru_69FF8;
      }
      goto LABEL_22;
    }
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
  }
  id v11 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v9];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v7);
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_22:

  return v10;
}

- (void)didShowSuggestedActivity:(id)a3 location:(int64_t)a4
{
  id v5 = [a3 activityUniqueIdentifier];
  id v6 = [(RPCCActivityManager *)self _activityForUniqueIdentifier:v5];
}

- (void)userDidSeeSuggestedActivity:(id)a3 location:(int64_t)a4
{
  id v5 = [a3 activityUniqueIdentifier];
  id v6 = [(RPCCActivityManager *)self _activityForUniqueIdentifier:v5];
}

- (void)userDidAcceptSuggestedActivity:(id)a3 location:(int64_t)a4
{
  id v5 = [a3 activityUniqueIdentifier];
  id v6 = [(RPCCActivityManager *)self _activityForUniqueIdentifier:v5];
}

- (void)userDidRejectSuggestedActivity:(id)a3 location:(int64_t)a4
{
  id v5 = [a3 activityUniqueIdentifier];
  id v6 = [(RPCCActivityManager *)self _activityForUniqueIdentifier:v5];
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  if (v5)
  {
    id v6 = self->_observers;
    objc_sync_enter(v6);
    id v7 = [(NSHashTable *)self->_observers copy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v11);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v12);
          }
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    objc_sync_exit(v6);
  }
}

- (void)_notifyObserversOfAvailableActivitiesChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_F444;
  v2[3] = &unk_68FB8;
  v2[4] = self;
  [(RPCCActivityManager *)self _enumerateObserversRespondingToSelector:"availableActivitiesDidChangeForManager:" usingBlock:v2];
}

- (void)_setAvailableActivities:(id)a3
{
  id v6 = (NSMutableArray *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_availableActivities != v6) {
    objc_storeStrong((id *)&v5->_availableActivities, a3);
  }
  objc_sync_exit(v5);
}

- (void)_invalidateActiveModeAssertion
{
  obj = self;
  objc_sync_enter(obj);
  obj->_activeModeAssertionIsValid = 0;
  objc_sync_exit(obj);
}

- (BOOL)_doesActivity:(id)a3 identifySameModeAsActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 == v6)
  {
    unsigned __int8 v9 = 1;
  }
  else if (v5)
  {
    id v7 = [v5 activityIdentifier];
    id v8 = [v6 activityIdentifier];
    unsigned __int8 v9 = [v7 isEqual:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)_updateActiveModeAssertionIfNecessary
{
  obj = self;
  objc_sync_enter(obj);
  objc_sync_exit(obj);
}

- (void)_updateLifetimeForActiveActivity
{
  obj = self;
  objc_sync_enter(obj);
  [(RPCCActivityManager *)obj _setLifetimeForActiveActivity:0];
  objc_sync_exit(obj);
}

- (void)_updateLifetimeForActiveActivityIfNecessary
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_lifetimeOfActiveActivity) {
    [(RPCCActivityManager *)obj _updateLifetimeForActiveActivity];
  }
  objc_sync_exit(obj);
}

- (id)_lifetimeForActiveActivity
{
  [(RPCCActivityManager *)self _updateActiveModeAssertionIfNecessary];
  [(RPCCActivityManager *)self _updateLifetimeForActiveActivityIfNecessary];
  lifetimeOfActiveActivity = self->_lifetimeOfActiveActivity;

  return lifetimeOfActiveActivity;
}

- (id)_activityForATXActivityOrSuggestion:(id)a3
{
  return 0;
}

- (id)_activityForModeIdentifier:(id)a3
{
  return 0;
}

- (id)_activityForUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    availableActivities = self->_availableActivities;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_F84C;
    v9[3] = &unk_69060;
    id v10 = v4;
    id v7 = [(NSMutableArray *)availableActivities bs_firstObjectPassingTest:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_lifetimeForLifetimeDetailsIdentifier:(id)a3 ofActivity:(id)a4
{
  return 0;
}

- (void)_updateActiveActivity:(id)a3
{
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = (id)RPCCLogActivities;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(RPCCActivityManager *)v6 description];
    *(_DWORD *)buf = 138543618;
    long long v14 = v8;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating active activity: %{public}@", buf, 0x16u);
  }
  objc_storeStrong((id *)&v6->_activeActivity, a3);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_FA2C;
  v10[3] = &unk_69088;
  id v11 = v5;
  uint64_t v12 = v6;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

  objc_sync_exit(v6);
}

- (id)_activeActivity
{
  [(RPCCActivityManager *)self _updateActiveModeAssertionIfNecessary];
  activeActivity = self->_activeActivity;

  return activeActivity;
}

- (void)_setActiveActivity:(id)a3 withLifetime:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = (NSMutableArray *)a4;
  id v10 = a5;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10154;
  v29[3] = &unk_690B0;
  v29[4] = self;
  id v11 = objc_retainBlock(v29);
  if (!v8)
  {
    int v21 = (void *)RPCCLogActivities;
    if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = v21;
      __int16 v23 = [(RPCCActivityManager *)self description];
      *(_DWORD *)buf = 138543618;
      double v31 = v23;
      __int16 v32 = 2114;
      double v33 = v10;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deactivating all activities: reason: %{public}@", buf, 0x16u);
    }
    id v27 = 0;
    char v24 = ((uint64_t (*)(void *, void, NSMutableArray *, id *))v11[2])(v11, 0, v9, &v27);
    float v17 = v27;
    if ((v24 & 1) == 0)
    {
      __int16 v25 = (void *)RPCCLogActivities;
      if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_ERROR)) {
        sub_4A750(v25, self);
      }
    }
    goto LABEL_13;
  }
  unsigned int v12 = [(NSMutableArray *)self->_availableActivities containsObject:v8];
  long long v13 = (void *)RPCCLogActivities;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = v13;
      __int16 v15 = [(RPCCActivityManager *)self description];
      *(_DWORD *)buf = 138544130;
      double v31 = v15;
      __int16 v32 = 2114;
      double v33 = v8;
      __int16 v34 = 2114;
      v35 = v9;
      __int16 v36 = 2114;
      unsigned int v37 = v10;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Activating activity: activity: %{public}@; lifetime: %{public}@; reason: %{public}@",
        buf,
        0x2Au);
    }
    id v28 = 0;
    char v16 = ((uint64_t (*)(void *, NSObject *, NSMutableArray *, id *))v11[2])(v11, v8, v9, &v28);
    float v17 = v28;
    if (v16) {
      goto LABEL_13;
    }
    float v18 = (void *)RPCCLogActivities;
    if (!os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v19 = v18;
    BOOL v20 = [(RPCCActivityManager *)self description];
    *(_DWORD *)buf = 138544130;
    double v31 = v20;
    __int16 v32 = 2114;
    double v33 = v8;
    __int16 v34 = 2114;
    v35 = v9;
    __int16 v36 = 2114;
    unsigned int v37 = v17;
    _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error activating activity: activity: %{public}@; lifetime: %{public}@; error: %{public}@",
      buf,
      0x2Au);
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    float v17 = v13;
    __int16 v19 = [(RPCCActivityManager *)self description];
    availableActivities = self->_availableActivities;
    *(_DWORD *)buf = 138543874;
    double v31 = v19;
    __int16 v32 = 2114;
    double v33 = v8;
    __int16 v34 = 2114;
    v35 = availableActivities;
    _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Attempt to activate activity not in collection: activity: %{public}@; availableActivities: %{public}@",
      buf,
      0x20u);
  }

LABEL_13:
LABEL_15:
}

- (void)_notifyObserversOfLifetimeChangeForActivity:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10300;
    v6[3] = &unk_690D8;
    v6[4] = self;
    id v7 = v4;
    [(RPCCActivityManager *)self _enumerateObserversRespondingToSelector:"activityManager:lifetimeDescriptionsDidChangeForActivity:" usingBlock:v6];
  }
}

- (void)_updateLifetimesAlternativeDescriptionsForAvailableActivities
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_availableActivities;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[RPCCActivityManager _updateLifetimesAlternativeDescriptionForActivity:](self, "_updateLifetimesAlternativeDescriptionForActivity:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateActivitySuggestion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v4 = [(RPCCActivityManager *)self _activityForATXActivityOrSuggestion:v4];
    if (!v4)
    {
      uint64_t v6 = (void *)RPCCLogActivities;
      if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_ERROR)) {
        sub_4A8C0(v6, self);
      }
      id v4 = 0;
    }
  }
}

- (void)_drivingTriggerDidChange
{
  id v3 = (void *)RPCCLogActivities;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = [(RPCCActivityManager *)self description];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Driving trigger did change", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_setDefaultActivity:(id)a3
{
}

- (BOOL)isLifetimeDescriptionsUpdatingEnabled
{
  return self->_lifetimeDescriptionsUpdatingEnabled;
}

- (BOOL)shouldLoadFromSensor
{
  return self->_shouldLoadFromSensor;
}

- (void)setShouldLoadFromSensor:(BOOL)a3
{
  self->_shouldLoadFromSensor = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_defaultActivity, 0);
  objc_storeStrong((id *)&self->_activeActivity, 0);
  objc_storeStrong((id *)&self->_reactionsEffect, 0);
  objc_storeStrong((id *)&self->_backgroundBlurEffect, 0);
  objc_storeStrong((id *)&self->_lightingEffect, 0);
  objc_storeStrong((id *)&self->_centerStageEffect, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_activeActivities, 0);
  objc_storeStrong((id *)&self->_availableActivities, 0);
  objc_storeStrong((id *)&self->_lifetimeOfActiveActivity, 0);
  objc_storeStrong((id *)&self->_allActivitiesByIdentifier, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (id)activityWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = self;
    objc_sync_enter(v5);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v6 = v5->_availableActivities;
    id v7 = 0;
    id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          unsigned int v12 = objc_msgSend(v11, "activityIdentifier", (void)v16);
          unsigned int v13 = [v12 isEqualToString:v4];

          if (v13)
          {
            id v14 = v11;

            id v7 = v14;
          }
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)newActivityManagerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) _initWithIdentifier:v4];

  return v5;
}

+ (id)newActivityManager
{
  return _[a1 newActivityManagerWithIdentifier:@"DEFAULT"];
}

- (void)setActiveActivity:(id)a3
{
}

- (void)setActiveActivity:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = [a3 activityUniqueIdentifier];
  id v8 = [(RPCCActivityManager *)self _activityForUniqueIdentifier:v7];

  [(RPCCActivityManager *)self _setActiveActivity:v8 withLifetime:0 reason:v6];
}

- (void)setActiveActivity:(id)a3 withLifetime:(id)a4 reason:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  long long v10 = [a3 activityUniqueIdentifier];
  id v13 = [(RPCCActivityManager *)self _activityForUniqueIdentifier:v10];

  long long v11 = [v9 lifetimeIdentifier];

  unsigned int v12 = [(RPCCActivityManager *)self _lifetimeForLifetimeDetailsIdentifier:v11 ofActivity:v13];

  [(RPCCActivityManager *)self _setActiveActivity:v13 withLifetime:v12 reason:v8];
}

@end