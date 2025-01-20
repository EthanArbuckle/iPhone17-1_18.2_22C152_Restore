@interface GAXProfileManager
- ($DE71691BB3011260155645AE0E7AB3CC)profileAccessibilityFeatureSet;
- (AXAccessQueueTimer)managedConfigurationNotificationCoalesceTimer;
- (AXAccessQueueTimer)profileFeatureChangedNotificationTimer;
- (BOOL)_isProfileKeyGlobal:(id)a3;
- (BOOL)appAllowlistActiveAndContainsAdditionalApp:(id)a3;
- (BOOL)isAppPrivilagedToSelfLock:(id)a3;
- (BOOL)isAppSelfLockMode;
- (BOOL)isSingleAppMode;
- (BOOL)isUserMode;
- (BOOL)shouldAllowAccessibilityShortcut;
- (BOOL)shouldAllowAutolock;
- (BOOL)shouldAllowExit;
- (BOOL)shouldAllowHomeButton;
- (BOOL)shouldAllowKeyboardTextInput;
- (BOOL)shouldAllowLockButton;
- (BOOL)shouldAllowMotion;
- (BOOL)shouldAllowProximity;
- (BOOL)shouldAllowRingerSwitch;
- (BOOL)shouldAllowToggleOfAssistiveTouch;
- (BOOL)shouldAllowToggleOfCommandAndControl;
- (BOOL)shouldAllowToggleOfGrayscale;
- (BOOL)shouldAllowToggleOfInvertColors;
- (BOOL)shouldAllowToggleOfVoiceOver;
- (BOOL)shouldAllowToggleOfZoom;
- (BOOL)shouldAllowTouch;
- (BOOL)shouldAllowVolumeButtons;
- (BOOL)shouldAutolaunchAppsAfterLowBatteryPowerDown;
- (BOOL)shouldAutolaunchAppsAfterSystemCrash;
- (BOOL)shouldAutolaunchCrashedApps;
- (BOOL)shouldDisableAssistiveTouch;
- (BOOL)shouldDisableCommandAndControl;
- (BOOL)shouldDisableGrayscale;
- (BOOL)shouldDisableInvertColors;
- (BOOL)shouldDisableMonoAudio;
- (BOOL)shouldDisableSpeakSelection;
- (BOOL)shouldDisableVoiceOver;
- (BOOL)shouldDisableZoom;
- (BOOL)shouldEnableAssistiveTouch;
- (BOOL)shouldEnableCommandAndControl;
- (BOOL)shouldEnableGrayscale;
- (BOOL)shouldEnableInvertColors;
- (BOOL)shouldEnableMonoAudio;
- (BOOL)shouldEnableSpeakSelection;
- (BOOL)shouldEnableVoiceOver;
- (BOOL)shouldEnableZoom;
- (BOOL)shouldShowUserConfirmationPromptsAndBanners;
- (BOOL)timeRestrictionsEnabled;
- (GAXProfileManager)init;
- (GAXProfileManagerDelegate)delegate;
- (NSArray)appSpecificProfileKeys;
- (NSArray)globalProfileKeys;
- (NSData)ignoredTouchRegionsLandscape;
- (NSData)ignoredTouchRegionsPortrait;
- (NSDictionary)profileKeyToRetrieveSelectorMap;
- (NSDictionary)restrictionStates;
- (NSDictionary)unappliedRestrictionStates;
- (NSDictionary)unmanagedSelfLockManagedConfigurationSettings;
- (NSDictionary)unmanagedSelfLockPropertiesMap;
- (NSMutableDictionary)singleAppModeAppPropertiesMap;
- (NSMutableDictionary)singleAppModeGlobalPropertiesMap;
- (NSMutableDictionary)userAppPropertiesMap;
- (NSMutableDictionary)userGlobalPropertiesMap;
- (NSString)singleAppModeAppID;
- (SEL)_retrieveSelectorForProfileKey:(id)a3;
- (id)_appIDForConfiguration:(unsigned int)a3;
- (id)_appPropertyMapForConfiguration:(unsigned int)a3;
- (id)_fallbackValueForProfileKey:(id)a3;
- (id)_fallbackValueForProfileKey:(id)a3 configuration:(unsigned int)a4;
- (id)_fallbackValueForRetrieveSelector:(SEL)a3;
- (id)_globalPropertyMapForConfiguration:(unsigned int)a3;
- (id)_guidedAccessProfileKeyForManagedConfigKey:(id)a3 shouldInvertValue:(BOOL *)a4;
- (id)_profileKeyForRetrieveSelector:(SEL)a3;
- (id)_singleAppModeAppIDs;
- (id)_valueForProfileKey:(id)a3;
- (id)_valueForRetrieveSelector:(SEL)a3;
- (id)description;
- (id)ignoredTouchRegionsForOrientation:(int)a3;
- selfLockAppIDs;
- (id)statesForRestrictionsWithIdentifiers:(id)a3;
- (id)unappliedChangedStatesForRestrictions;
- (int)isAvailabilityValid:(unint64_t)a3 forSelfLockAppToEnableGuidedAccess:(BOOL)a4;
- (int64_t)appTimeoutDuration;
- (int64_t)stateForRestrictionWithIdentifier:(id)a3;
- (unsigned)configuration;
- (void)_applyWebTextDefineProperty:(BOOL)a3 properties:(id)a4;
- (void)_handleSingleAppModeStateDidChange:(id)a3;
- (void)_initializeProfileKeyToRetrieveSelectorMap;
- (void)_initializeProfileKeys;
- (void)_updateConfigurationAndNotifyDelegate:(BOOL)a3;
- (void)_updateProperty:(id)a3 withValue:(id)a4 saveChanges:(BOOL)a5;
- (void)_updateSingleAppModeStateFromManagedConfiguration;
- (void)applyUnmanagedSelfLockPropertiesMap:(id)a3 managedConfigurationSettings:(id)a4;
- (void)applyUnmanagedSelfLockRestrictionsForStyle:(int64_t)a3 withUserInterfaceClient:(id)a4;
- (void)clearUnappliedChangedStatesForRestrictions;
- (void)dealloc;
- (void)notifySelfLockStateDidChange;
- (void)removeUnmanagedSelfLockRestrictionsWithUserInterfaceClient:(id)a3;
- (void)setAppSpecificProfileKeys:(id)a3;
- (void)setConfiguration:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setGlobalProfileKeys:(id)a3;
- (void)setIgnoredTouchRegions:(id)a3 forOrientation:(int)a4;
- (void)setManagedConfigurationNotificationCoalesceTimer:(id)a3;
- (void)setProfileFeatureChangedNotificationTimer:(id)a3;
- (void)setProfileKeyToRetrieveSelectorMap:(id)a3;
- (void)setSingleAppModeAppID:(id)a3;
- (void)setSingleAppModeAppPropertiesMap:(id)a3;
- (void)setSingleAppModeGlobalPropertiesMap:(id)a3;
- (void)setStatesForRestrictions:(id)a3;
- (void)setUnmanagedSelfLockManagedConfigurationSettings:(id)a3;
- (void)setUnmanagedSelfLockPropertiesMap:(id)a3;
- (void)setUserAppPropertiesMap:(id)a3;
- (void)setUserGlobalPropertiesMap:(id)a3;
- (void)updateProperty:(id)a3 withValue:(id)a4;
@end

@implementation GAXProfileManager

- (GAXProfileManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)GAXProfileManager;
  v2 = [(GAXProfileManager *)&v18 init];
  if (v2)
  {
    v3 = +[GAXSettings sharedInstance];
    uint64_t v4 = [v3 mutableUserAppProfile];
    userAppPropertiesMap = v2->_userAppPropertiesMap;
    v2->_userAppPropertiesMap = (NSMutableDictionary *)v4;

    uint64_t v6 = [v3 mutableUserGlobalProfile];
    userGlobalPropertiesMap = v2->_userGlobalPropertiesMap;
    v2->_userGlobalPropertiesMap = (NSMutableDictionary *)v6;

    v2->_configuration = 0;
    id v8 = objc_alloc((Class)AXAccessQueueTimer);
    v9 = +[AXAccessQueue mainAccessQueue];
    v10 = (AXAccessQueueTimer *)[v8 initWithTargetAccessQueue:v9];
    profileFeatureChangedNotificationTimer = v2->_profileFeatureChangedNotificationTimer;
    v2->_profileFeatureChangedNotificationTimer = v10;

    id v12 = objc_alloc((Class)AXAccessQueueTimer);
    v13 = +[AXAccessQueue mainAccessQueue];
    v14 = (AXAccessQueueTimer *)[v12 initWithTargetAccessQueue:v13];
    managedConfigurationNotificationCoalesceTimer = v2->_managedConfigurationNotificationCoalesceTimer;
    v2->_managedConfigurationNotificationCoalesceTimer = v14;

    [(GAXProfileManager *)v2 _initializeProfileKeyToRetrieveSelectorMap];
    [(GAXProfileManager *)v2 _initializeProfileKeys];
    [(GAXProfileManager *)v2 _updateConfigurationAndNotifyDelegate:0];
    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v2 selector:"_handleSingleAppModeStateDidChange:" name:MCProfileListChangedNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GAXProfileManager;
  [(GAXProfileManager *)&v4 dealloc];
}

- (void)_initializeProfileKeyToRetrieveSelectorMap
{
  v39[0] = @"GAXProfileAllowsKeyboardTextInput";
  v38 = NSStringFromSelector("shouldAllowKeyboardTextInput");
  v40[0] = v38;
  v39[1] = @"GAXProfileAllowsTouch";
  v37 = NSStringFromSelector("shouldAllowTouch");
  v40[1] = v37;
  v39[2] = @"GAXProfileAllowsMotion";
  v36 = NSStringFromSelector("shouldAllowMotion");
  v40[2] = v36;
  v39[3] = @"GAXProfileAllowsRingerSwitch";
  v35 = NSStringFromSelector("shouldAllowRingerSwitch");
  v40[3] = v35;
  v39[4] = @"GAXProfileAllowsProximity";
  v34 = NSStringFromSelector("shouldAllowProximity");
  v40[4] = v34;
  v39[5] = @"GAXProfileAllowsLockButton";
  v33 = NSStringFromSelector("shouldAllowLockButton");
  v40[5] = v33;
  v39[6] = @"GAXProfileAllowsVolumeButtons";
  v32 = NSStringFromSelector("shouldAllowVolumeButtons");
  v40[6] = v32;
  v39[7] = @"GAXProfileAllowsAutolock";
  v31 = NSStringFromSelector("shouldAllowAutolock");
  v40[7] = v31;
  v39[8] = @"GAXProfileAppTimeoutDuration";
  v30 = NSStringFromSelector("appTimeoutDuration");
  v40[8] = v30;
  v39[9] = @"GAXProfileAppTimeoutEnabled";
  v28 = NSStringFromSelector("timeRestrictionsEnabled");
  v40[9] = v28;
  v39[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  v27 = NSStringFromSelector("shouldEnableVoiceOver");
  v40[10] = v27;
  v39[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  v26 = NSStringFromSelector("shouldEnableZoom");
  v40[11] = v26;
  v39[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  v25 = NSStringFromSelector("shouldEnableInvertColors");
  v40[12] = v25;
  v39[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  v24 = NSStringFromSelector("shouldEnableGrayscale");
  v40[13] = v24;
  v39[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  v23 = NSStringFromSelector("shouldEnableAssistiveTouch");
  v40[14] = v23;
  v39[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  v22 = NSStringFromSelector("shouldEnableSpeakSelection");
  v40[15] = v22;
  v39[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  v21 = NSStringFromSelector("shouldEnableMonoAudio");
  v40[16] = v21;
  v39[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  v20 = NSStringFromSelector("shouldEnableCommandAndControl");
  v40[17] = v20;
  v39[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v19 = NSStringFromSelector("shouldAllowToggleOfVoiceOver");
  v40[18] = v19;
  v39[19] = @"GAXProfileAllowsAXToggleZoom";
  objc_super v18 = NSStringFromSelector("shouldAllowToggleOfZoom");
  v40[19] = v18;
  v39[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v17 = NSStringFromSelector("shouldAllowToggleOfInvertColors");
  v40[20] = v17;
  v39[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v16 = NSStringFromSelector("shouldAllowToggleOfGrayscale");
  v40[21] = v16;
  v39[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v15 = NSStringFromSelector("shouldAllowToggleOfAssistiveTouch");
  v40[22] = v15;
  v39[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v14 = NSStringFromSelector("shouldAllowToggleOfCommandAndControl");
  v40[23] = v14;
  v39[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  v13 = NSStringFromSelector("ignoredTouchRegionsPortrait");
  v40[24] = v13;
  v39[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  id v12 = NSStringFromSelector("ignoredTouchRegionsLandscape");
  v40[25] = v12;
  v39[26] = @"GAXProfileStatesForRestrictions";
  v2 = NSStringFromSelector("restrictionStates");
  v40[26] = v2;
  v39[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  v3 = NSStringFromSelector("unappliedRestrictionStates");
  v40[27] = v3;
  v39[28] = @"GAXProfileAllowsHomeButton";
  objc_super v4 = NSStringFromSelector("shouldAllowHomeButton");
  v40[28] = v4;
  v39[29] = @"GAXProfileShouldAutolaunchCrashedApps";
  v5 = NSStringFromSelector("shouldAutolaunchCrashedApps");
  v40[29] = v5;
  v39[30] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  uint64_t v6 = NSStringFromSelector("shouldAutolaunchAppsAfterSystemCrash");
  v40[30] = v6;
  v39[31] = @"GAXProfileAllowsExit";
  v7 = NSStringFromSelector("shouldAllowExit");
  v40[31] = v7;
  v39[32] = @"GAXProfileAllowsAccessibilityShortcut";
  id v8 = NSStringFromSelector("shouldAllowAccessibilityShortcut");
  v40[32] = v8;
  v39[33] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  v9 = NSStringFromSelector("shouldAutolaunchAppsAfterLowBatteryPowerDown");
  v40[33] = v9;
  v39[34] = @"GAXProfileShowsUserConfirmationPromptsAndBanners";
  v10 = NSStringFromSelector("shouldShowUserConfirmationPromptsAndBanners");
  v40[34] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:35];
  [(GAXProfileManager *)self setProfileKeyToRetrieveSelectorMap:v11];
}

- (void)_initializeProfileKeys
{
  v6[0] = @"GAXProfileAllowsKeyboardTextInput";
  v6[1] = @"GAXProfileAllowsTouch";
  v6[2] = @"GAXProfileAllowsMotion";
  v6[3] = @"GAXProfileAllowsRingerSwitch";
  v6[4] = @"GAXProfileAllowsProximity";
  v6[5] = @"GAXProfileAllowsLockButton";
  v6[6] = @"GAXProfileAllowsVolumeButtons";
  v6[7] = @"GAXProfileAllowsAutolock";
  v6[8] = @"GAXProfileAppTimeoutDuration";
  v6[9] = @"GAXProfileAppTimeoutEnabled";
  v6[10] = @"GAXProfileAllowsAXAutoEnableVoiceOver";
  v6[11] = @"GAXProfileAllowsAXAutoEnableZoom";
  v6[12] = @"GAXProfileAllowsAXAutoEnableInvertColors";
  v6[13] = @"GAXProfileAllowsAXAutoEnableGrayscale";
  v6[14] = @"GAXProfileAllowsAXAutoEnableAssistiveTouch";
  v6[15] = @"GAXProfileAllowsAXAutoEnableSpeakSelection";
  v6[16] = @"GAXProfileAllowsAXAutoEnableMonoAudio";
  v6[17] = @"GAXProfileAllowsAXAutoEnableCommandAndControl";
  v6[18] = @"GAXProfileAllowsAXToggleVoiceOver";
  v6[19] = @"GAXProfileAllowsAXToggleZoom";
  v6[20] = @"GAXProfileAllowsAXToggleInvertColors";
  v6[21] = @"GAXProfileAllowsAXToggleGrayscale";
  v6[22] = @"GAXProfileAllowsAXToggleAssistiveTouch";
  v6[23] = @"GAXProfileAllowsAXToggleCommandAndControl";
  v6[24] = @"GAXProfileIgnoredTouchRegionsPortrait";
  v6[25] = @"GAXProfileIgnoredTouchRegionsLandscape";
  v6[26] = @"GAXProfileStatesForRestrictions";
  v6[27] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  v3 = +[NSArray arrayWithObjects:v6 count:28];
  [(GAXProfileManager *)self setAppSpecificProfileKeys:v3];

  v5[0] = @"GAXProfileAllowsHomeButton";
  v5[1] = @"GAXProfileShouldAutolaunchCrashedApps";
  v5[2] = @"GAXProfileShouldAutolaunchAppsAfterSystemCrash";
  v5[3] = @"GAXProfileAllowsExit";
  v5[4] = @"GAXProfileAllowsAccessibilityShortcut";
  v5[5] = @"GAXProfileShouldAutolaunchAfterLowBatteryShutDown";
  objc_super v4 = +[NSArray arrayWithObjects:v5 count:6];
  [(GAXProfileManager *)self setGlobalProfileKeys:v4];
}

- (id)description
{
  unsigned int v3 = [(GAXProfileManager *)self configuration];
  CFStringRef v4 = @"User";
  if (v3 == 2) {
    CFStringRef v4 = @"ManagedConfiguration";
  }
  if (v3 == 3) {
    CFStringRef v5 = @"AppSelfLock";
  }
  else {
    CFStringRef v5 = v4;
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  id v8 = +[NSMutableString stringWithFormat:@"%@<%p>. Mode:%@", v7, self, v5];

  [v8 appendString:@" Global Properties:\n"];
  v9 = [(GAXProfileManager *)self _globalPropertyMapForConfiguration:[(GAXProfileManager *)self configuration]];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_CC18;
  v18[3] = &unk_492C0;
  id v10 = v8;
  id v19 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v18];

  [v10 appendString:@" App Properties:\n"];
  v11 = [(GAXProfileManager *)self _appPropertyMapForConfiguration:[(GAXProfileManager *)self configuration]];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_CCB8;
  v16[3] = &unk_492C0;
  id v12 = v10;
  id v17 = v12;
  [v11 enumerateKeysAndObjectsUsingBlock:v16];

  v13 = v17;
  id v14 = v12;

  return v14;
}

- (BOOL)isUserMode
{
  return [(GAXProfileManager *)self configuration] == 1;
}

- (BOOL)isSingleAppMode
{
  return [(GAXProfileManager *)self configuration] == 2;
}

- (BOOL)isAppSelfLockMode
{
  return [(GAXProfileManager *)self configuration] == 3;
}

- (id)_appIDForConfiguration:(unsigned int)a3
{
  if (a3 == 2)
  {
    CFStringRef v4 = [(GAXProfileManager *)self singleAppModeAppID];
  }
  else
  {
    CFStringRef v5 = [(GAXProfileManager *)self delegate];
    CFStringRef v4 = [v5 profileManagerSessionAppID:self];
  }

  return v4;
}

- (BOOL)shouldAllowKeyboardTextInput
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowTouch
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowMotion
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowLockButton
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowVolumeButtons
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowRingerSwitch
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowProximity
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowAutolock
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)appTimeoutDuration
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (BOOL)timeRestrictionsEnabled
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldEnableVoiceOver
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldEnableZoom
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldEnableInvertColors
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldEnableGrayscale
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldEnableAssistiveTouch
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldEnableSpeakSelection
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldEnableMonoAudio
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldEnableCommandAndControl
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldDisableVoiceOver
{
  unsigned __int8 v3 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableVoiceOver"];
  if (v3)
  {
    CFStringRef v4 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableVoiceOver"];
    unsigned int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldDisableZoom
{
  unsigned __int8 v3 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableZoom"];
  if (v3)
  {
    CFStringRef v4 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableZoom"];
    unsigned int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldDisableInvertColors
{
  unsigned __int8 v3 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableInvertColors"];
  if (v3)
  {
    CFStringRef v4 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableInvertColors"];
    unsigned int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldDisableGrayscale
{
  unsigned __int8 v3 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableGrayscale"];
  if (v3)
  {
    CFStringRef v4 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableGrayscale"];
    unsigned int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldDisableAssistiveTouch
{
  unsigned __int8 v3 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableAssistiveTouch"];
  if (v3)
  {
    CFStringRef v4 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableAssistiveTouch"];
    unsigned int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldDisableSpeakSelection
{
  unsigned __int8 v3 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableSpeakSelection"];
  if (v3)
  {
    CFStringRef v4 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableSpeakSelection"];
    unsigned int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldDisableMonoAudio
{
  unsigned __int8 v3 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableMonoAudio"];
  if (v3)
  {
    CFStringRef v4 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableMonoAudio"];
    unsigned int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldDisableCommandAndControl
{
  unsigned __int8 v3 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableCommandAndControl"];
  if (v3)
  {
    CFStringRef v4 = [(GAXProfileManager *)self _valueForRetrieveSelector:"shouldEnableCommandAndControl"];
    unsigned int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldAllowToggleOfVoiceOver
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowToggleOfZoom
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowToggleOfInvertColors
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowToggleOfGrayscale
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowToggleOfAssistiveTouch
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowToggleOfCommandAndControl
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (NSData)ignoredTouchRegionsPortrait
{
  return (NSData *)[(GAXProfileManager *)self _valueForRetrieveSelector:a2];
}

- (NSData)ignoredTouchRegionsLandscape
{
  return (NSData *)[(GAXProfileManager *)self _valueForRetrieveSelector:a2];
}

- (NSDictionary)restrictionStates
{
  return (NSDictionary *)[(GAXProfileManager *)self _valueForRetrieveSelector:a2];
}

- (NSDictionary)unappliedRestrictionStates
{
  return (NSDictionary *)[(GAXProfileManager *)self _valueForRetrieveSelector:a2];
}

- (id)ignoredTouchRegionsForOrientation:(int)a3
{
  CFStringRef v4 = &GAXProfileIgnoredTouchRegionsLandscape;
  if ((a3 - 1) < 2) {
    CFStringRef v4 = &GAXProfileIgnoredTouchRegionsPortrait;
  }
  unsigned int v5 = *v4;
  uint64_t v6 = [(GAXProfileManager *)self _valueForProfileKey:v5];

  return v6;
}

- (void)setIgnoredTouchRegions:(id)a3 forOrientation:(int)a4
{
  uint64_t v6 = &GAXProfileIgnoredTouchRegionsLandscape;
  if ((a4 - 1) < 2) {
    uint64_t v6 = &GAXProfileIgnoredTouchRegionsPortrait;
  }
  v7 = *v6;
  [(GAXProfileManager *)self updateProperty:v7 withValue:a3];
}

- (int64_t)stateForRestrictionWithIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(GAXProfileManager *)self _valueForProfileKey:@"GAXProfileStatesForRestrictions"];
  uint64_t v6 = [v5 objectForKey:v4];

  id v7 = [v6 integerValue];
  return (int64_t)v7;
}

- (id)statesForRestrictionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  +[NSMutableDictionary dictionary];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_DB94;
  v11 = &unk_492E8;
  id v12 = self;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v13;
  [v4 enumerateObjectsUsingBlock:&v8];

  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return v6;
}

- (void)setStatesForRestrictions:(id)a3
{
  id v4 = a3;
  id v5 = [(GAXProfileManager *)self _valueForProfileKey:@"GAXProfileStatesForRestrictions"];
  id v6 = [v5 mutableCopy];
  if (!v6)
  {
    id v6 = +[NSMutableDictionary dictionary];
  }
  id v7 = [(GAXProfileManager *)self _valueForProfileKey:@"GAXProfileUnappliedChangedStatesForRestrictions"];
  id v8 = [v7 mutableCopy];
  if (!v8)
  {
    id v8 = +[NSMutableDictionary dictionary];
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_DDC4;
  v14[3] = &unk_49310;
  id v15 = v5;
  id v16 = v6;
  id v17 = v8;
  id v9 = v8;
  id v10 = v6;
  id v11 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v14];
  id v12 = [v10 copy];
  [(GAXProfileManager *)self updateProperty:@"GAXProfileStatesForRestrictions" withValue:v12];

  id v13 = [v9 copy];
  [(GAXProfileManager *)self updateProperty:@"GAXProfileUnappliedChangedStatesForRestrictions" withValue:v13];
}

- (id)unappliedChangedStatesForRestrictions
{
  return [(GAXProfileManager *)self _valueForProfileKey:@"GAXProfileUnappliedChangedStatesForRestrictions"];
}

- (void)clearUnappliedChangedStatesForRestrictions
{
}

- (BOOL)shouldAllowHomeButton
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAutolaunchCrashedApps
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldShowUserConfirmationPromptsAndBanners
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAutolaunchAppsAfterSystemCrash
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAutolaunchAppsAfterLowBatteryPowerDown
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowExit
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldAllowAccessibilityShortcut
{
  v2 = [(GAXProfileManager *)self _valueForRetrieveSelector:a2];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)_appPropertyMapForConfiguration:(unsigned int)a3
{
  if (a3 == 3 || a3 == 2)
  {
    unsigned __int8 v3 = [(GAXProfileManager *)self singleAppModeAppPropertiesMap];
  }
  else if (a3 == 1)
  {
    unsigned __int8 v3 = [(GAXProfileManager *)self userAppPropertiesMap];
  }
  else
  {
    id v5 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    _AXAssert();

    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (id)_globalPropertyMapForConfiguration:(unsigned int)a3
{
  if (a3 == 3 || a3 == 2)
  {
    unsigned __int8 v3 = [(GAXProfileManager *)self singleAppModeGlobalPropertiesMap];
  }
  else if (a3 == 1)
  {
    unsigned __int8 v3 = [(GAXProfileManager *)self userGlobalPropertiesMap];
  }
  else
  {
    id v5 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    _AXAssert();

    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (id)_valueForProfileKey:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(GAXProfileManager *)self _isProfileKeyGlobal:v4];
  uint64_t v6 = [(GAXProfileManager *)self configuration];
  if (v5)
  {
    if (v6 == 3)
    {
      id v7 = +[GAXSettings sharedInstance];
      unsigned int v8 = [v7 selfLockUnmanaged];

      if (v8)
      {
        id v9 = [(GAXProfileManager *)self unmanagedSelfLockPropertiesMap];
        id v10 = [v9 objectForKeyedSubscript:v4];

        if (v10) {
          goto LABEL_11;
        }
      }
    }
    id v11 = [(GAXProfileManager *)self _globalPropertyMapForConfiguration:[(GAXProfileManager *)self configuration]];
    id v10 = [v11 objectForKey:v4];
  }
  else
  {
    id v11 = [(GAXProfileManager *)self _appIDForConfiguration:v6];
    if (v11)
    {
      objc_opt_class();
      id v12 = [(GAXProfileManager *)self _appPropertyMapForConfiguration:[(GAXProfileManager *)self configuration]];
      id v13 = [v12 objectForKey:v11];
      id v14 = __UIAccessibilityCastAsClass();

      id v10 = [v14 objectForKey:v4];
    }
    else
    {
      id v10 = 0;
    }
  }

  if (!v10)
  {
    id v10 = [(GAXProfileManager *)self _fallbackValueForProfileKey:v4];
  }
LABEL_11:
  id v15 = +[NSNull null];
  unsigned int v16 = [v10 isEqual:v15];

  if (v16)
  {

    id v10 = 0;
  }

  return v10;
}

- (id)_valueForRetrieveSelector:(SEL)a3
{
  id v4 = [(GAXProfileManager *)self _profileKeyForRetrieveSelector:a3];
  unsigned int v5 = [(GAXProfileManager *)self _valueForProfileKey:v4];

  return v5;
}

- (SEL)_retrieveSelectorForProfileKey:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(GAXProfileManager *)self profileKeyToRetrieveSelectorMap];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = NSSelectorFromString(v6);
  }
  else
  {
    unsigned int v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_2A51C((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)_profileKeyForRetrieveSelector:(SEL)a3
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_E614;
  v24 = sub_E624;
  id v25 = 0;
  id v4 = NSStringFromSelector(a3);
  unsigned int v5 = [(GAXProfileManager *)self profileKeyToRetrieveSelectorMap];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_E62C;
  v17[3] = &unk_49338;
  id v6 = v4;
  id v18 = v6;
  id v19 = &v20;
  [v5 enumerateKeysAndObjectsUsingBlock:v17];

  id v7 = (void *)v21[5];
  if (!v7)
  {
    unsigned int v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_2A588((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }

    id v7 = (void *)v21[5];
  }
  id v15 = v7;

  _Block_object_dispose(&v20, 8);

  return v15;
}

- (id)_fallbackValueForProfileKey:(id)a3 configuration:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v4 == 3
    && (+[GAXSettings sharedInstance],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 selfLockUnmanaged],
        v7,
        v8))
  {
    uint64_t v9 = [(GAXProfileManager *)self unmanagedSelfLockPropertiesMap];
    uint64_t v10 = [v9 objectForKeyedSubscript:v6];

    if (v10) {
      goto LABEL_7;
    }
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  uint64_t v10 = GAXFallbackValueForProfileKey(v6, v4, v11);
LABEL_7:

  return v10;
}

- (id)_fallbackValueForProfileKey:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(GAXProfileManager *)self _fallbackValueForProfileKey:v4 configuration:[(GAXProfileManager *)self configuration]];

  return v5;
}

- (id)_fallbackValueForRetrieveSelector:(SEL)a3
{
  id v4 = [(GAXProfileManager *)self _profileKeyForRetrieveSelector:a3];
  unsigned int v5 = [(GAXProfileManager *)self _fallbackValueForProfileKey:v4];

  return v5;
}

- (BOOL)_isProfileKeyGlobal:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(GAXProfileManager *)self globalProfileKeys];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)_updateConfigurationAndNotifyDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(GAXProfileManager *)self configuration];
  [(GAXProfileManager *)self _updateSingleAppModeStateFromManagedConfiguration];
  [(GAXProfileManager *)self setUnmanagedSelfLockPropertiesMap:0];
  [(GAXProfileManager *)self setUnmanagedSelfLockManagedConfigurationSettings:0];
  unsigned __int8 v6 = +[MCProfileConnection sharedConnection];
  id v7 = [v6 isInSingleAppMode];

  unsigned int v8 = [(GAXProfileManager *)self _singleAppModeAppIDs];
  id v9 = [v8 count];

  uint64_t v10 = GAXLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = +[NSNumber numberWithBool:v7];
    uint64_t v12 = +[NSNumber numberWithBool:v9 != 0];
    uint64_t v13 = +[NSNumber numberWithUnsignedInt:v5];
    int v30 = 138543874;
    v31 = v11;
    __int16 v32 = 2114;
    v33 = v12;
    __int16 v34 = 2114;
    v35 = v13;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Guided Access updating configuration. inSingleAppMode:%{public}@ singleAppModeAppIDExists:%{public}@ previousConfiguration: %{public}@", (uint8_t *)&v30, 0x20u);
  }
  if (v7)
  {
    if (v9)
    {
      uint64_t v14 = 2;
      goto LABEL_16;
    }
    id v15 = GAXLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_2A5F4(v15);
    }
  }
  unsigned int v16 = +[GAXSettings sharedInstance];
  if (([v16 isActiveAppSelfLocked] & 1) == 0)
  {

    goto LABEL_13;
  }
  id v17 = [(GAXProfileManager *)self selfLockAppIDs];
  if (![v17 count])
  {
    id v18 = +[GAXSettings sharedInstance];
    unsigned __int8 v19 = [v18 selfLockUnmanaged];

    if (v19) {
      goto LABEL_15;
    }
LABEL_13:
    uint64_t v14 = 1;
    goto LABEL_16;
  }

LABEL_15:
  uint64_t v14 = 3;
LABEL_16:
  [(GAXProfileManager *)self setConfiguration:v14];
  if (!v3) {
    goto LABEL_37;
  }
  unsigned int v20 = [(GAXProfileManager *)self configuration];
  unsigned int v21 = v20;
  if (v5 != 2 || v20 == 2)
  {
    if (v5 == 3 && v20 != 3)
    {
      v23 = [(GAXProfileManager *)self delegate];
      [v23 didExitAppSelfLockModeWithProfileManager:self];

      BOOL v24 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v22 = [(GAXProfileManager *)self delegate];
    [v22 didExitSingleAppModeWithProfileManager:self];
  }
  BOOL v24 = v21 == 3;
  if (v21 == 3 && v5 != 3)
  {
    id v25 = [(GAXProfileManager *)self delegate];
    [v25 didEnterAppSelfLockModeWithProfileManager:self];
LABEL_36:

    goto LABEL_37;
  }
LABEL_26:
  if (v21 != 2 || v5 == 2)
  {
    if (v5 == 2 && v21 == 2)
    {
      id v25 = [(GAXProfileManager *)self delegate];
      [v25 appDidChangeForSingleAppModeWithProfileManager:self];
      goto LABEL_36;
    }
  }
  else
  {
    v26 = [(GAXProfileManager *)self delegate];
    [v26 didEnterSingleAppModeWithProfileManager:self];
  }
  char v27 = !v24;
  if (v5 != 3) {
    char v27 = 1;
  }
  if ((v27 & 1) == 0)
  {
    id v25 = [(GAXProfileManager *)self delegate];
    [v25 appDidChangeForAppSelfLockModeWithProfileManager:self];
    goto LABEL_36;
  }
LABEL_37:
  v28 = GAXLogCommon();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = +[NSNumber numberWithUnsignedInt:[(GAXProfileManager *)self configuration]];
    int v30 = 138543362;
    v31 = v29;
    _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Resulting Guided Access configuration change: %{public}@", (uint8_t *)&v30, 0xCu);
  }
}

- (void)updateProperty:(id)a3 withValue:(id)a4
{
}

- (void)_updateProperty:(id)a3 withValue:(id)a4 saveChanges:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    goto LABEL_23;
  }
  if (![(GAXProfileManager *)self _isProfileKeyGlobal:v8])
  {
    uint64_t v12 = [(GAXProfileManager *)self _appIDForConfiguration:[(GAXProfileManager *)self configuration]];
    if (!v12)
    {
      id v17 = GAXLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_2A638(v17, v18, v19, v20, v21, v22, v23, v24);
      }

      goto LABEL_22;
    }
    uint64_t v13 = [(GAXProfileManager *)self _appPropertyMapForConfiguration:[(GAXProfileManager *)self configuration]];
    uint64_t v14 = [v13 objectForKey:v12];
    if (!v14)
    {
      uint64_t v14 = +[NSMutableDictionary dictionary];
      [v13 setObject:v14 forKey:v12];
    }
    if (v9)
    {
      [v14 setObject:v9 forKey:v8];
      if (!v5) {
        goto LABEL_21;
      }
    }
    else
    {
      [v14 removeObjectForKey:v8];
      if (!v5)
      {
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
    }
    if ([(GAXProfileManager *)self isUserMode])
    {
      id v25 = [(GAXProfileManager *)self userAppPropertiesMap];
      v26 = +[GAXSettings sharedInstance];
      [v26 setUserAppProfile:v25];
    }
    goto LABEL_21;
  }
  uint64_t v10 = [(GAXProfileManager *)self _globalPropertyMapForConfiguration:[(GAXProfileManager *)self configuration]];
  int v11 = v10;
  if (v9) {
    [v10 setObject:v9 forKey:v8];
  }
  else {
    [v10 removeObjectForKey:v8];
  }

  if (v5 && [(GAXProfileManager *)self isUserMode])
  {
    id v15 = [(GAXProfileManager *)self userGlobalPropertiesMap];
    unsigned int v16 = +[GAXSettings sharedInstance];
    [v16 setUserGlobalProfile:v15];
  }
LABEL_23:
}

- (id)_singleAppModeAppIDs
{
  v2 = [(GAXProfileManager *)self singleAppModeAppPropertiesMap];
  BOOL v3 = [v2 allKeys];

  return v3;
}

- selfLockAppIDs
{
  void *v2;
  void *v3;
  uint64_t vars8;

  v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 autonomousSingleAppModePermittedBundleIDs];

  if (![v3 count])
  {

    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isAppPrivilagedToSelfLock:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  BOOL v5 = [(GAXProfileManager *)self selfLockAppIDs];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (int)isAvailabilityValid:(unint64_t)a3 forSelfLockAppToEnableGuidedAccess:(BOOL)a4
{
  if (a4)
  {
    if (a3 < 0x10)
    {
      id v4 = &unk_34E08;
      return v4[a3];
    }
  }
  else if (a3 < 0x10)
  {
    id v4 = &unk_34E48;
    return v4[a3];
  }
  _AXAssert();
  return 2;
}

- (void)notifySelfLockStateDidChange
{
}

- (BOOL)appAllowlistActiveAndContainsAdditionalApp:(id)a3
{
  id v3 = a3;
  id v4 = +[MCProfileConnection sharedConnection];
  BOOL v5 = [v4 effectiveWhitelistedAppsAndOptions];

  id v6 = [v5 count];
  BOOL v7 = 0;
  if (v3 && v6)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      uint64_t v12 = kMCAppWhitelistIdentifierKey;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "objectForKey:", v12, (void)v17);
          unsigned __int8 v15 = [v14 isEqualToString:v3];

          if (v15)
          {
            BOOL v7 = 1;
            goto LABEL_13;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v7 = 0;
LABEL_13:
  }
  return v7;
}

- (void)applyUnmanagedSelfLockPropertiesMap:(id)a3 managedConfigurationSettings:(id)a4
{
  id v6 = a4;
  [(GAXProfileManager *)self setUnmanagedSelfLockPropertiesMap:a3];
  [(GAXProfileManager *)self setUnmanagedSelfLockManagedConfigurationSettings:v6];
}

- (void)_applyWebTextDefineProperty:(BOOL)a3 properties:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v21[0] = @"GAXProfileStatesForRestrictions";
  v21[1] = @"GAXProfileUnappliedChangedStatesForRestrictions";
  id obj = +[NSArray arrayWithObjects:v21 count:2];
  id v6 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    BOOL v9 = !v4;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v5 objectForKey:v11];
        if (v12)
        {
          uint64_t v13 = v12;
          id v14 = [v12 mutableCopy];
        }
        else
        {
          id v14 = +[NSMutableDictionary dictionary];
        }
        unsigned __int8 v15 = +[NSNumber numberWithInt:v9];
        [v14 setObject:v15 forKey:@"GAXProfileAllowsWebTextDefine"];

        [v5 setObject:v14 forKey:v11];
      }
      id v7 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)_updateSingleAppModeStateFromManagedConfiguration
{
  id v3 = +[MCProfileConnection sharedConnection];
  unsigned int v29 = [v3 isWebTextDefineAllowed];

  BOOL v4 = +[MCProfileConnection sharedConnection];
  id v5 = [v4 effectiveWhitelistedAppsAndOptions];

  if ([v5 count])
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    id v7 = [v6 objectForKeyedSubscript:kMCAppWhitelistIdentifierKey];
    [(GAXProfileManager *)self setSingleAppModeAppID:v7];

    uint64_t v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(GAXProfileManager *)self singleAppModeAppID];
      id v10 = [v5 objectAtIndexedSubscript:0];
      *(_DWORD *)buf = 138543618;
      v41 = v9;
      __int16 v42 = 2114;
      v43 = v10;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "set single app mode app ID to %{public}@ from %{public}@", buf, 0x16u);
    }
  }
  else
  {
    [(GAXProfileManager *)self setSingleAppModeAppID:0];
    uint64_t v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "set single app mode app ID to nil. allowed apps is %{public}@", buf, 0xCu);
    }
  }

  int v30 = +[NSMutableDictionary dictionary];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  id v11 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v27 = kMCAppWhitelistIdentifierKey;
    uint64_t v28 = *(void *)v36;
    uint64_t v26 = kMCAppWhitelistOptionsKey;
    uint64_t v14 = kMCAppWhitelistUserEnabledOptionsKey;
    *(void *)&long long v12 = 138543362;
    long long v24 = v12;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(obj);
        }
        unsigned int v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v17 = objc_msgSend(v16, "objectForKey:", v27, v24);
        long long v18 = +[NSMutableDictionary dictionary];
        long long v19 = [v16 objectForKey:v26];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_F834;
        v33[3] = &unk_49360;
        v33[4] = self;
        id v20 = v18;
        id v34 = v20;
        [v19 enumerateKeysAndObjectsUsingBlock:v33];

        [(GAXProfileManager *)self _applyWebTextDefineProperty:v29 properties:v20];
        uint64_t v21 = [v16 objectForKey:v14];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_F8DC;
        v31[3] = &unk_49360;
        v31[4] = self;
        id v32 = v20;
        id v22 = v20;
        [v21 enumerateKeysAndObjectsUsingBlock:v31];

        uint64_t v23 = GAXLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v24;
          v41 = v17;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "processed allowed app %{public}@", buf, 0xCu);
        }

        [v30 setObject:v22 forKey:v17];
      }
      id v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v13);
  }

  [(GAXProfileManager *)self setSingleAppModeAppPropertiesMap:v30];
}

- (void)_handleSingleAppModeStateDidChange:(id)a3
{
  BOOL v4 = GAXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Got MCProfileListChangedNotification. Waiting briefly for others.", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_FA48;
  block[3] = &unk_48928;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_guidedAccessProfileKeyForManagedConfigKey:(id)a3 shouldInvertValue:(BOOL *)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:kMCAppWhitelistOptionDisableTouchKey])
  {
    id v6 = &GAXProfileAllowsTouch;
LABEL_13:
    id v7 = *v6;
    *a4 = 1;
    goto LABEL_14;
  }
  if ([v5 isEqualToString:kMCAppWhitelistOptionDisableDeviceRotationKey])
  {
    id v6 = &GAXProfileAllowsMotion;
    goto LABEL_13;
  }
  if ([v5 isEqualToString:kMCAppWhitelistOptionDisableVolumeButtonsKey])
  {
    id v6 = &GAXProfileAllowsVolumeButtons;
    goto LABEL_13;
  }
  if ([v5 isEqualToString:kMCAppWhitelistOptionDisableRingerSwitchKey])
  {
    id v6 = &GAXProfileAllowsRingerSwitch;
    goto LABEL_13;
  }
  if ([v5 isEqualToString:kMCAppWhitelistOptionDisableSleepWakeButtonKey])
  {
    id v6 = &GAXProfileAllowsLockButton;
    goto LABEL_13;
  }
  if ([v5 isEqualToString:kMCAppWhitelistOptionDisableAutoLockKey])
  {
    id v6 = &GAXProfileAllowsAutolock;
    goto LABEL_13;
  }
  if ([v5 isEqualToString:kMCAppWhitelistOptionEnableVoiceOverKey])
  {
    BOOL v9 = &GAXProfileAllowsAXAutoEnableVoiceOver;
LABEL_41:
    id v7 = *v9;
    goto LABEL_14;
  }
  if ([v5 isEqualToString:kMCAppWhitelistOptionEnableZoomKey])
  {
    BOOL v9 = &GAXProfileAllowsAXAutoEnableZoom;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:kMCAppWhitelistOptionEnableInvertColorsKey])
  {
    BOOL v9 = &GAXProfileAllowsAXAutoEnableInvertColors;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:kMCAppWhitelistOptionEnableAssistiveTouchKey])
  {
    BOOL v9 = &GAXProfileAllowsAXAutoEnableAssistiveTouch;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:kMCAppWhitelistOptionEnableSpeakSelectionKey])
  {
    BOOL v9 = &GAXProfileAllowsAXAutoEnableSpeakSelection;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:kMCAppWhitelistOptionEnableMonoAudioKey])
  {
    BOOL v9 = &GAXProfileAllowsAXAutoEnableMonoAudio;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:kMCAppWhitelistOptionEnableCommandAndControlKey])
  {
    BOOL v9 = &GAXProfileAllowsAXAutoEnableCommandAndControl;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:kMCAppWhitelistUserEnabledOptionsVoiceOverKey])
  {
    BOOL v9 = &GAXProfileAllowsAXToggleVoiceOver;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:kMCAppWhitelistUserEnabledOptionZoomKey])
  {
    BOOL v9 = &GAXProfileAllowsAXToggleZoom;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:kMCAppWhitelistUserEnabledOptionInvertColorsKey])
  {
    BOOL v9 = &GAXProfileAllowsAXToggleInvertColors;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:kMCAppWhitelistUserEnabledOptionAssistiveTouchKey])
  {
    BOOL v9 = &GAXProfileAllowsAXToggleAssistiveTouch;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:kMCAppWhitelistUserEnabledOptionsCommandAndControlKey])
  {
    BOOL v9 = &GAXProfileAllowsAXToggleCommandAndControl;
    goto LABEL_41;
  }
  id v10 = GAXLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_2A6A8((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
  }

  id v7 = 0;
LABEL_14:

  return v7;
}

- (void)applyUnmanagedSelfLockRestrictionsForStyle:(int64_t)a3 withUserInterfaceClient:(id)a4
{
  v15[0] = &__kCFBooleanTrue;
  v14[0] = @"restrictions enabled";
  v14[1] = @"autonomous single app mode style";
  id v6 = a4;
  id v7 = +[NSNumber numberWithInteger:a3];
  v15[1] = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  BOOL v9 = [(GAXProfileManager *)self unmanagedSelfLockManagedConfigurationSettings];

  if (v9)
  {
    id v10 = [v8 mutableCopy];
    uint64_t v11 = [(GAXProfileManager *)self unmanagedSelfLockManagedConfigurationSettings];
    [v10 setObject:v11 forKeyedSubscript:@"autonomous single app MC settings"];

    uint64_t v8 = v10;
  }
  uint64_t v12 = +[AXAccessQueue mainAccessQueue];
  [v6 sendAsynchronousMessage:v8 withIdentifier:36 targetAccessQueue:v12 completionRequiresWritingBlock:0 completion:0];

  uint64_t v13 = [(GAXProfileManager *)self delegate];
  [v13 applyUnmanagedSelfLockStaticRestrictionsWithProfileManager:self];
}

- (void)removeUnmanagedSelfLockRestrictionsWithUserInterfaceClient:(id)a3
{
  CFStringRef v8 = @"restrictions enabled";
  BOOL v9 = &__kCFBooleanFalse;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v6 = +[AXAccessQueue mainAccessQueue];
  [v4 sendAsynchronousMessage:v5 withIdentifier:36 targetAccessQueue:v6 completionRequiresWritingBlock:0 completion:0];

  id v7 = [(GAXProfileManager *)self delegate];
  [v7 removeUnmanagedSelfLockStaticRestrictionsWithProfileManager:self];
}

- ($DE71691BB3011260155645AE0E7AB3CC)profileAccessibilityFeatureSet
{
  if (_AXSVoiceOverTouchEnabled()) {
    unsigned int v3 = ![(GAXProfileManager *)self shouldDisableVoiceOver];
  }
  else {
    unsigned int v3 = [(GAXProfileManager *)self shouldEnableVoiceOver];
  }
  if (_AXSZoomTouchEnabled()) {
    unsigned int v4 = ![(GAXProfileManager *)self shouldDisableZoom];
  }
  else {
    unsigned int v4 = [(GAXProfileManager *)self shouldEnableZoom];
  }
  if (_AXSInvertColorsEnabled()) {
    unsigned int v5 = ![(GAXProfileManager *)self shouldDisableInvertColors];
  }
  else {
    unsigned int v5 = [(GAXProfileManager *)self shouldEnableInvertColors];
  }
  if (_AXSGrayscaleEnabled()) {
    unsigned int v6 = ![(GAXProfileManager *)self shouldDisableGrayscale];
  }
  else {
    unsigned int v6 = [(GAXProfileManager *)self shouldEnableGrayscale];
  }
  if (_AXSAssistiveTouchEnabled()) {
    unsigned int v7 = ![(GAXProfileManager *)self shouldDisableAssistiveTouch];
  }
  else {
    unsigned int v7 = [(GAXProfileManager *)self shouldEnableAssistiveTouch];
  }
  if (_AXSQuickSpeakEnabled()) {
    unsigned int v8 = ![(GAXProfileManager *)self shouldDisableSpeakSelection];
  }
  else {
    unsigned int v8 = [(GAXProfileManager *)self shouldEnableSpeakSelection];
  }
  if (_AXSMonoAudioEnabled()) {
    unsigned int v9 = ![(GAXProfileManager *)self shouldDisableMonoAudio];
  }
  else {
    unsigned int v9 = [(GAXProfileManager *)self shouldEnableMonoAudio];
  }
  if (_AXSCommandAndControlEnabled()) {
    unsigned int v10 = ![(GAXProfileManager *)self shouldDisableCommandAndControl];
  }
  else {
    unsigned int v10 = [(GAXProfileManager *)self shouldEnableCommandAndControl];
  }
  if (v9) {
    int v11 = 128;
  }
  else {
    int v11 = 0;
  }
  if (v4) {
    int v12 = 2;
  }
  else {
    int v12 = 0;
  }
  int v13 = v12 | v3;
  if (v5) {
    int v14 = 4;
  }
  else {
    int v14 = 0;
  }
  if (v6) {
    int v15 = 8;
  }
  else {
    int v15 = 0;
  }
  int v16 = v13 | v14 | v15;
  if (v7) {
    int v17 = 16;
  }
  else {
    int v17 = 0;
  }
  if (v8) {
    int v18 = 64;
  }
  else {
    int v18 = 0;
  }
  int v19 = v17 | v18;
  if (v10) {
    int v20 = 1024;
  }
  else {
    int v20 = 0;
  }
  if ([(GAXProfileManager *)self shouldAllowToggleOfVoiceOver]) {
    int v21 = 2048;
  }
  else {
    int v21 = 0;
  }
  if ([(GAXProfileManager *)self shouldAllowToggleOfInvertColors]) {
    int v22 = 0x2000;
  }
  else {
    int v22 = 0;
  }
  if ([(GAXProfileManager *)self shouldAllowToggleOfZoom]) {
    int v23 = 4096;
  }
  else {
    int v23 = 0;
  }
  if ([(GAXProfileManager *)self shouldAllowToggleOfAssistiveTouch]) {
    int v24 = 0x8000;
  }
  else {
    int v24 = 0;
  }
  if ([(GAXProfileManager *)self shouldAllowToggleOfCommandAndControl]) {
    int v25 = 0x100000;
  }
  else {
    int v25 = 0;
  }
  if ([(GAXProfileManager *)self shouldAllowToggleOfGrayscale]) {
    int v26 = 0x4000;
  }
  else {
    int v26 = 0;
  }
  return ($DE71691BB3011260155645AE0E7AB3CC)(v16 | v19 | v11 | v20 | v21 | v22 | v23 | v24 | v25 | v26);
}

- (unsigned)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(unsigned int)a3
{
  self->_configuration = a3;
}

- (NSString)singleAppModeAppID
{
  return self->_singleAppModeAppID;
}

- (void)setSingleAppModeAppID:(id)a3
{
}

- (GAXProfileManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXProfileManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)unmanagedSelfLockPropertiesMap
{
  return self->_unmanagedSelfLockPropertiesMap;
}

- (void)setUnmanagedSelfLockPropertiesMap:(id)a3
{
}

- (NSDictionary)unmanagedSelfLockManagedConfigurationSettings
{
  return self->_unmanagedSelfLockManagedConfigurationSettings;
}

- (void)setUnmanagedSelfLockManagedConfigurationSettings:(id)a3
{
}

- (NSMutableDictionary)userAppPropertiesMap
{
  return self->_userAppPropertiesMap;
}

- (void)setUserAppPropertiesMap:(id)a3
{
}

- (NSMutableDictionary)userGlobalPropertiesMap
{
  return self->_userGlobalPropertiesMap;
}

- (void)setUserGlobalPropertiesMap:(id)a3
{
}

- (NSMutableDictionary)singleAppModeAppPropertiesMap
{
  return self->_singleAppModeAppPropertiesMap;
}

- (void)setSingleAppModeAppPropertiesMap:(id)a3
{
}

- (NSMutableDictionary)singleAppModeGlobalPropertiesMap
{
  return self->_singleAppModeGlobalPropertiesMap;
}

- (void)setSingleAppModeGlobalPropertiesMap:(id)a3
{
}

- (NSDictionary)profileKeyToRetrieveSelectorMap
{
  return self->_profileKeyToRetrieveSelectorMap;
}

- (void)setProfileKeyToRetrieveSelectorMap:(id)a3
{
}

- (NSArray)appSpecificProfileKeys
{
  return self->_appSpecificProfileKeys;
}

- (void)setAppSpecificProfileKeys:(id)a3
{
}

- (NSArray)globalProfileKeys
{
  return self->_globalProfileKeys;
}

- (void)setGlobalProfileKeys:(id)a3
{
}

- (AXAccessQueueTimer)managedConfigurationNotificationCoalesceTimer
{
  return self->_managedConfigurationNotificationCoalesceTimer;
}

- (void)setManagedConfigurationNotificationCoalesceTimer:(id)a3
{
}

- (AXAccessQueueTimer)profileFeatureChangedNotificationTimer
{
  return self->_profileFeatureChangedNotificationTimer;
}

- (void)setProfileFeatureChangedNotificationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileFeatureChangedNotificationTimer, 0);
  objc_storeStrong((id *)&self->_managedConfigurationNotificationCoalesceTimer, 0);
  objc_storeStrong((id *)&self->_globalProfileKeys, 0);
  objc_storeStrong((id *)&self->_appSpecificProfileKeys, 0);
  objc_storeStrong((id *)&self->_profileKeyToRetrieveSelectorMap, 0);
  objc_storeStrong((id *)&self->_singleAppModeGlobalPropertiesMap, 0);
  objc_storeStrong((id *)&self->_singleAppModeAppPropertiesMap, 0);
  objc_storeStrong((id *)&self->_userGlobalPropertiesMap, 0);
  objc_storeStrong((id *)&self->_userAppPropertiesMap, 0);
  objc_storeStrong((id *)&self->_unmanagedSelfLockManagedConfigurationSettings, 0);
  objc_storeStrong((id *)&self->_unmanagedSelfLockPropertiesMap, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_singleAppModeAppID, 0);
}

@end