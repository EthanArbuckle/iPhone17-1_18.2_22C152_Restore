@interface BKSLocalDefaults
- (BKSLocalDefaults)init;
- (BOOL)allowWirelessExtendedDisplay;
- (BOOL)disableExtendedDisplayByDefault;
- (BOOL)disableStudyLogALSLogging;
- (BOOL)disableStudyLogAccelerometerLogging;
- (BOOL)disableStudyLogGyroLogging;
- (id)valueForKey:(id)a3 defaultValueProvider:(id)a4;
- (void)_bindAndRegisterDefaults;
- (void)migrateDefaultsIfNecessary;
- (void)setAllowWirelessExtendedDisplay:(BOOL)a3;
- (void)setDisableExtendedDisplayByDefault:(BOOL)a3;
- (void)setDisableStudyLogALSLogging:(BOOL)a3;
- (void)setDisableStudyLogAccelerometerLogging:(BOOL)a3;
- (void)setDisableStudyLogGyroLogging:(BOOL)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation BKSLocalDefaults

- (BOOL)disableStudyLogAccelerometerLogging
{
  return self->_disableStudyLogAccelerometerLogging;
}

- (id)valueForKey:(id)a3 defaultValueProvider:(id)a4
{
  v6 = (void (**)(void))a4;
  id v7 = a3;
  v8 = [(BSAbstractDefaultDomain *)self _store];
  v9 = [v8 objectForKey:v7];

  if (v6 && !v9)
  {
    v9 = v6[2](v6);
  }

  return v9;
}

- (void)setDisableStudyLogGyroLogging:(BOOL)a3
{
  self->_disableStudyLogGyroLogging = a3;
}

- (BOOL)disableStudyLogGyroLogging
{
  return self->_disableStudyLogGyroLogging;
}

- (void)setDisableStudyLogALSLogging:(BOOL)a3
{
  self->_disableStudyLogALSLogging = a3;
}

- (BOOL)disableStudyLogALSLogging
{
  return self->_disableStudyLogALSLogging;
}

- (void)setDisableStudyLogAccelerometerLogging:(BOOL)a3
{
  self->_disableStudyLogAccelerometerLogging = a3;
}

- (void)setAllowWirelessExtendedDisplay:(BOOL)a3
{
  self->_allowWirelessExtendedDisplay = a3;
}

- (BOOL)allowWirelessExtendedDisplay
{
  return self->_allowWirelessExtendedDisplay;
}

- (void)setDisableExtendedDisplayByDefault:(BOOL)a3
{
  self->_disableExtendedDisplayByDefault = a3;
}

- (BOOL)disableExtendedDisplayByDefault
{
  return self->_disableExtendedDisplayByDefault;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BSAbstractDefaultDomain *)self _store];
  [v8 setObject:v7 forKey:v6];
}

- (void)migrateDefaultsIfNecessary
{
  id v2 = [(BSAbstractDefaultDomain *)self _store];
  [v2 removeObjectForKey:@"InvertColorsEnabled"];
}

- (void)_bindAndRegisterDefaults
{
  v49[1] = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithUTF8String:"ignoreAccelerometerAndOrientationEvents"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"BKIgnoreAccelerometerAndOrientationEvents" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v5 = [NSString stringWithUTF8String:"ALSEnabled"];
  uint64_t v6 = MEMORY[0x1E4F1CC38];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"BKEnableALS" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  id v7 = [NSString stringWithUTF8String:"ALSEpoch"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"BKALSUserPreferencesEpoch" toDefaultValue:&unk_1ED76C910 options:1];

  id v8 = [NSString stringWithUTF8String:"ALSUserPreferences"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"BKALSUserPreferences" toDefaultValue:0 options:1];

  v9 = [NSString stringWithUTF8String:"ALSDelayOnUnlock"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"BKALSDelayOnUnlock" toDefaultValue:&unk_1ED76C928 options:1];

  v10 = [NSString stringWithUTF8String:"brightnessCurve"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"brightness-curve" toDefaultValue:&unk_1ED76C910 options:1];

  v11 = [NSString stringWithUTF8String:"ignoreTetheringPreferences"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"BKIgnoreTetherPrefs" toDefaultValue:v4 options:1];

  v12 = [NSString stringWithUTF8String:"ditheringEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"BKDitherEnabled" toDefaultValue:v4 options:1];

  v13 = [NSString stringWithUTF8String:"simulatePhoneButton"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v13 withDefaultKey:@"SimulateRedGreenPhoneButton" toDefaultValue:v4 options:1];

  v14 = [NSString stringWithUTF8String:"digitizerSignpostsEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v14 withDefaultKey:@"BKDigitizerSignpostsEnabled" toDefaultValue:v4 options:1];

  v15 = [NSString stringWithUTF8String:"digitizerVisualizeTouches"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v15 withDefaultKey:@"BKDigitizerVisualizeTouches" toDefaultValue:v4 options:1];

  v16 = [NSString stringWithUTF8String:"digitizerVisualizeHitTestRegions"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v16 withDefaultKey:@"BKDigitizerVisualizeHitTestRegions" toDefaultValue:v4 options:1];

  v17 = [NSString stringWithUTF8String:"digitizerServicePersistentProperties"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v17 withDefaultKey:@"BKDigitizerPersistentServiceProperties" toDefaultValue:0 options:1];

  v18 = [NSString stringWithUTF8String:"eventBufferingEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v18 withDefaultKey:@"BKHIDEventBufferingEnabled" toDefaultValue:v6 options:1];

  v19 = [NSString stringWithUTF8String:"squeezeForSystemShortcutEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v19 withDefaultKey:@"BKSqueezeForSystemShortcutEnabled" toDefaultValue:v4 options:1];

  v20 = [NSString stringWithUTF8String:"visualizeMousePointer"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v20 withDefaultKey:@"BKVisualizeMousePointer" toDefaultValue:v4 options:1];

  v21 = [NSString stringWithUTF8String:"pointerRegionArrangementEdge"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v21 withDefaultKey:@"BKPointerRegionArrangementEdge" toDefaultValue:&unk_1ED76C940 options:1];

  v22 = [NSString stringWithUTF8String:"globalMouseDevicePreferences"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v22 withDefaultKey:@"BKGlobalMouseDevicePreferences" toDefaultValue:0 options:1];

  v23 = [NSString stringWithUTF8String:"mouseInterpolation"];
  v49[0] = @"scroll";
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  [(BSAbstractDefaultDomain *)self _bindProperty:v23 withDefaultKey:@"BKMouseInterpolation" toDefaultValue:v24 options:4];

  v25 = [NSString stringWithUTF8String:"showBuildNumber"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v25 withDefaultKey:@"BKShowBuildNumber" toDefaultValue:v4 options:1];

  v26 = [NSString stringWithUTF8String:"loggingTypesEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v26 withDefaultKey:@"BackBoardLogging" toDefaultValue:0 options:1];

  v27 = [NSString stringWithUTF8String:"forceMirroredOrientation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v27 withDefaultKey:@"BKForceMirroredOrientation" toDefaultValue:0 options:1];

  v28 = [NSString stringWithUTF8String:"hideAppleLogoOnLaunch"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v28 withDefaultKey:@"BKHideAppleLogoOnLaunch" toDefaultValue:v4 options:4];

  v29 = [NSString stringWithUTF8String:"steveNoteRotationEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v29 withDefaultKey:@"BKEnableStevenoteRotation" toDefaultValue:v4 options:1];

  v30 = [NSString stringWithUTF8String:"disableCloneMirroring"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v30 withDefaultKey:@"BKDisableCloneMirroring" toDefaultValue:v4 options:1];

  v31 = [NSString stringWithUTF8String:"disableCAOverscan"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v31 withDefaultKey:@"BKDisableCAOverscan" toDefaultValue:v4 options:1];

  v32 = [NSString stringWithUTF8String:"disableCAYUV"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v32 withDefaultKey:@"BKDisableCA_YUV" toDefaultValue:v4 options:1];

  v33 = [NSString stringWithUTF8String:"disableCAScaling"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v33 withDefaultKey:@"BKDisableCAScaling" toDefaultValue:v4 options:1];

  v34 = [NSString stringWithUTF8String:"steveNoteOverscanEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v34 withDefaultKey:@"BKEnableStevenoteOverscan" toDefaultValue:v4 options:1];

  v35 = [NSString stringWithUTF8String:"forceCloneMirroring"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v35 withDefaultKey:@"BKForceCloneMirroring" toDefaultValue:v4 options:1];

  v36 = [NSString stringWithUTF8String:"disableExtendedDisplayByDefault"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v36 withDefaultKey:@"BKDisableExtendedDisplayByDefault" toDefaultValue:v4 options:1];

  v37 = [NSString stringWithUTF8String:"allowWirelessExtendedDisplay"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v37 withDefaultKey:@"BKAllowWirelessExtendedDisplay" toDefaultValue:v6 options:1];

  v38 = [NSString stringWithUTF8String:"disableStudyLogVolumeKeyLogging"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v38 withDefaultKey:@"BKDisableStudyLogVolumeKeyLogging" toDefaultValue:v4 options:1];

  v39 = [NSString stringWithUTF8String:"disableStudyLogBTKeyboardEventRedirection"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v39 withDefaultKey:@"BKDisableStudyLogBTKeyboardEventRedirection" toDefaultValue:v4 options:1];

  v40 = [NSString stringWithUTF8String:"disableStudyLogBTKeyboardEventLogging"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v40 withDefaultKey:@"BKDisableStudyLogBTKeyboardEventLogging" toDefaultValue:v4 options:1];

  v41 = [NSString stringWithUTF8String:"disableStudyLogButtonLogging"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v41 withDefaultKey:@"BKDisableStudyLogButtonLogging" toDefaultValue:v4 options:1];

  v42 = [NSString stringWithUTF8String:"disableStudyLogHomeButtonLogging"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v42 withDefaultKey:@"BKDisableStudyLogHomeButtonLogging" toDefaultValue:v4 options:1];

  v43 = [NSString stringWithUTF8String:"disableStudyLogCameraKeyLogging"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v43 withDefaultKey:@"BKDisableStudyLogCameraKeyLogging" toDefaultValue:v4 options:1];

  v44 = [NSString stringWithUTF8String:"disableStudyLogPowerButtonLogging"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v44 withDefaultKey:@"BKDisableStudyLogPowerButtonLogging" toDefaultValue:v4 options:1];

  v45 = [NSString stringWithUTF8String:"disableStudyLogAccelerometerLogging"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v45 withDefaultKey:@"BKDisableStudyLogAccelerometerLogging" toDefaultValue:v4 options:1];

  v46 = [NSString stringWithUTF8String:"disableStudyLogALSLogging"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v46 withDefaultKey:@"BKDisableStudyLogALSLogging" toDefaultValue:v4 options:1];

  v47 = [NSString stringWithUTF8String:"disableStudyLogGyroLogging"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v47 withDefaultKey:@"BKDisableStudyLogGyroLogging" toDefaultValue:v4 options:1];

  v48 = [NSString stringWithUTF8String:"keyboardTypeRemap"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v48 withDefaultKey:@"BKKeyboardTypeRemap" toDefaultValue:0 options:1];
}

- (BKSLocalDefaults)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKSLocalDefaults;
  return (BKSLocalDefaults *)[(BSAbstractDefaultDomain *)&v3 _initWithDomain:@"com.apple.backboardd"];
}

@end