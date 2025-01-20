@interface AccessibilityDataMigrator
- (BOOL)_isFreshInstall;
- (BOOL)inUnitTest;
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)_convertHADomainTypesToSD:(id)a3;
- (id)_yukonBrailleTablesToMigrateWithKeyboardIdentifiers:(id)a3;
- (void)_azulBMigrateSpeakScreenHighlightSettings;
- (void)_azulCMigrateAssistiveTouchSpeedSettings;
- (void)_azulCMigrateVoiceOverVerbosityContainerSettings;
- (void)_azulEUpdatesVoicesForSiri;
- (void)_azulGUpdateCustomVoiceIdentifiers;
- (void)_azulMigrateRestFingerToOpen;
- (void)_azulMigrateSwitchAndVOSpeechSettingsToNewDomain;
- (void)_azulUnmigrateVoiceOverBrailleScreenInputTwoFingerSwipeUp;
- (void)_crystalMigrateAudioDuckingSettings;
- (void)_crystalMigrateBrailleScreenInputActivationGestureUsage;
- (void)_crystalMigrateBrailleScreenInputCommands;
- (void)_crystalMigrateBrailleTableReplacements;
- (void)_crystalMigrateGrayscaleSetting;
- (void)_crystalMigrateHearingControlCenterOrder;
- (void)_crystalMigratePMESettings;
- (void)_dawnMigrateGrayscaleSetting;
- (void)_dawnMigrateJapaneseSystemBrailleTable;
- (void)_dawnSUMigratePerAppSettingsIDs;
- (void)_eagleMigrateBalanceSettingFromCoreAudio;
- (void)_ensureDefaultBrailleRotorItemExists;
- (void)_ensureGesture:(id)a3 isMappedToCommand:(id)a4 withCommandManager:(id)a5 withResolver:(id)a6;
- (void)_migratePreferences;
- (void)_monarchClearSwitchControlMenuItemVersionPreferences;
- (void)_monarchRemoveNavigationDirectionRotorIfNeeded;
- (void)_okemoMigrateBrailleOutputMode;
- (void)_okemoMigrateVoiceOverGradeTwoAutoTranslate;
- (void)_okemoMigrateVoiceOverTypingMode;
- (void)_peaceMigrateTouchAccommodationsSettings;
- (void)_skyClearGryphonYushu;
- (void)_skyClearIrrelevantSwitchControlVoices;
- (void)_skyMigrateActionFeedback;
- (void)_skyMigrateEmojiSetting;
- (void)_skyMigrateFeedbackOptions;
- (void)_skyMigrateHearingDenylist;
- (void)_skyMigrateLinkFeedback;
- (void)_skyMigrateSoundDetectionSettingsToNewDomain;
- (void)_skyPrimeLeftRightBalance;
- (void)_speechVoiceMigrationWhitetail;
- (void)_switchVoiceMigrationWhitetail;
- (void)_sydneyMigrateTapToWakeSetting;
- (void)_tigrisMigrateBrailleStatusCellSettings;
- (void)_tigrisMigrateSwitchSpeechSettingsToNewDomain;
- (void)_tigrisMigrateVoiceOverPunctuationSettings;
- (void)_tigrisMigrateVoicesToNewDomain;
- (void)_turnOffIgnoreTrackpad;
- (void)_turnOffMitigationOnUnsupportedDevices;
- (void)_updateSiriVoiceList;
- (void)_voiceOverVoiceMigrationWhitetail;
- (void)_whitetailMigrateDisplayFilterSettings;
- (void)_whitetailMigrateTTYSettings;
- (void)_whitetailMigrateVOTShouldRouteToSpeakerWithProx;
- (void)_whitetailMigrateVoiceSettings;
- (void)_yukonBMigrateAssistiveTouchMenuForDwell;
- (void)_yukonBMigratePairedHearingAids;
- (void)_yukonBMigrateVoiceOverCommandsForLongPress;
- (void)_yukonEEnsureInvertColorsPrefHasValidValue;
- (void)_yukonEMigrateASTAlwaysShowMenuForDwell;
- (void)_yukonEMigrateASTCustomActions;
- (void)_yukonEMigrateNeuralVoicesForInternalInstalls;
- (void)_yukonESetAXSettingsForPointer;
- (void)_yukonMigrateBrailleTables;
- (void)_yukonMigrateEmojiSuffixPreference;
- (void)_yukonMigrateGuidedAccessSettings;
- (void)_yukonMigrateIncorrectVoiceDefaults;
- (void)setInUnitTest:(BOOL)a3;
@end

@implementation AccessibilityDataMigrator

- (BOOL)performMigration
{
  return 1;
}

- (float)migrationProgress
{
  return 1.0;
}

- (float)estimatedDuration
{
  return 0.0;
}

- (void)_updateSiriVoiceList
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"_AccessibilityMigration_UpdateSiriVoiceList_15.0"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    v5 = +[AXSettings sharedInstance];
    [v5 setSiriAutoUpdateListInitialized:0];

    id v6 = +[NSUserDefaults standardUserDefaults];
    [v6 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_UpdateSiriVoiceList_15.0"];
  }
}

- (void)_migratePreferences
{
  [(AccessibilityDataMigrator *)self _okemoMigrateVoiceOverGradeTwoAutoTranslate];
  [(AccessibilityDataMigrator *)self _okemoMigrateVoiceOverTypingMode];
  [(AccessibilityDataMigrator *)self _okemoMigrateBrailleOutputMode];
  [(AccessibilityDataMigrator *)self _monarchClearSwitchControlMenuItemVersionPreferences];
  [(AccessibilityDataMigrator *)self _monarchRemoveNavigationDirectionRotorIfNeeded];
  [(AccessibilityDataMigrator *)self _eagleMigrateBalanceSettingFromCoreAudio];
  [(AccessibilityDataMigrator *)self _whitetailMigrateVoiceSettings];
  [(AccessibilityDataMigrator *)self _whitetailMigrateTTYSettings];
  [(AccessibilityDataMigrator *)self _whitetailMigrateDisplayFilterSettings];
  [(AccessibilityDataMigrator *)self _whitetailMigrateVOTShouldRouteToSpeakerWithProx];
  [(AccessibilityDataMigrator *)self _tigrisMigrateVoiceOverPunctuationSettings];
  [(AccessibilityDataMigrator *)self _tigrisMigrateBrailleStatusCellSettings];
  [(AccessibilityDataMigrator *)self _tigrisMigrateSwitchSpeechSettingsToNewDomain];
  [(AccessibilityDataMigrator *)self _tigrisMigrateVoicesToNewDomain];
  [(AccessibilityDataMigrator *)self _peaceMigrateTouchAccommodationsSettings];
  [(AccessibilityDataMigrator *)self _yukonMigrateGuidedAccessSettings];
  [(AccessibilityDataMigrator *)self _yukonMigrateEmojiSuffixPreference];
  [(AccessibilityDataMigrator *)self _yukonMigrateIncorrectVoiceDefaults];
  [(AccessibilityDataMigrator *)self _yukonMigrateBrailleTables];
  [(AccessibilityDataMigrator *)self _yukonBMigratePairedHearingAids];
  [(AccessibilityDataMigrator *)self _yukonBMigrateVoiceOverCommandsForLongPress];
  [(AccessibilityDataMigrator *)self _yukonBMigrateAssistiveTouchMenuForDwell];
  [(AccessibilityDataMigrator *)self _yukonEMigrateASTCustomActions];
  [(AccessibilityDataMigrator *)self _yukonESetAXSettingsForPointer];
  [(AccessibilityDataMigrator *)self _yukonEMigrateNeuralVoicesForInternalInstalls];
  [(AccessibilityDataMigrator *)self _yukonEEnsureInvertColorsPrefHasValidValue];
  [(AccessibilityDataMigrator *)self _yukonEMigrateASTAlwaysShowMenuForDwell];
  [(AccessibilityDataMigrator *)self _azulUnmigrateVoiceOverBrailleScreenInputTwoFingerSwipeUp];
  [(AccessibilityDataMigrator *)self _azulMigrateSwitchAndVOSpeechSettingsToNewDomain];
  [(AccessibilityDataMigrator *)self _azulMigrateRestFingerToOpen];
  [(AccessibilityDataMigrator *)self _azulBMigrateSpeakScreenHighlightSettings];
  [(AccessibilityDataMigrator *)self _azulCMigrateVoiceOverVerbosityContainerSettings];
  [(AccessibilityDataMigrator *)self _azulCMigrateAssistiveTouchSpeedSettings];
  [(AccessibilityDataMigrator *)self _azulEUpdatesVoicesForSiri];
  [(AccessibilityDataMigrator *)self _azulGUpdateCustomVoiceIdentifiers];
  [(AccessibilityDataMigrator *)self _skyMigrateFeedbackOptions];
  [(AccessibilityDataMigrator *)self _skyMigrateSoundDetectionSettingsToNewDomain];
  [(AccessibilityDataMigrator *)self _skyMigrateHearingDenylist];
  [(AccessibilityDataMigrator *)self _skyClearIrrelevantSwitchControlVoices];
  [(AccessibilityDataMigrator *)self _skyClearGryphonYushu];
  [(AccessibilityDataMigrator *)self _skyPrimeLeftRightBalance];
  [(AccessibilityDataMigrator *)self _sydneyMigrateTapToWakeSetting];
  [(AccessibilityDataMigrator *)self _dawnMigrateGrayscaleSetting];
  [(AccessibilityDataMigrator *)self _dawnMigrateJapaneseSystemBrailleTable];
  [(AccessibilityDataMigrator *)self _crystalMigrateBrailleTableReplacements];
  [(AccessibilityDataMigrator *)self _crystalMigrateBrailleScreenInputCommands];
  [(AccessibilityDataMigrator *)self _crystalMigrateHearingControlCenterOrder];
  [(AccessibilityDataMigrator *)self _crystalMigrateBrailleScreenInputActivationGestureUsage];
  [(AccessibilityDataMigrator *)self _crystalMigratePMESettings];
  [(AccessibilityDataMigrator *)self _crystalMigrateAudioDuckingSettings];
  [(AccessibilityDataMigrator *)self _crystalMigrateGrayscaleSetting];
  [(AccessibilityDataMigrator *)self _dawnSUMigratePerAppSettingsIDs];
  [(AccessibilityDataMigrator *)self _turnOffIgnoreTrackpad];

  [(AccessibilityDataMigrator *)self _turnOffMitigationOnUnsupportedDevices];
}

- (void)_turnOffIgnoreTrackpad
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"_AccessibilityMigration__IgnoreTrackpad_18.2"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    v5 = +[AXSettings sharedInstance];
    unsigned int v6 = [v5 ignoreTrackpad];

    if (v6)
    {
      v7 = AXLogDataMigrator();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Ignore trackpad was enabled, turning off one time in 18.2", v10, 2u);
      }

      v8 = +[AXSettings sharedInstance];
      [v8 setIgnoreTrackpad:0];
    }
    v9 = +[NSUserDefaults standardUserDefaults];
    [v9 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration__IgnoreTrackpad_18.2"];
  }
}

- (void)_turnOffMitigationOnUnsupportedDevices
{
  if (_AXSPhotosensitiveMitigationEnabled() && (AXDeviceSupportsPhotosensitiveMitigation() & 1) == 0)
  {
    v2 = AXLogDataMigrator();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Resetting PSE to no since device doesn't support", v3, 2u);
    }

    _AXSPhotosensitiveMitigationSetEnabled();
  }
}

- (void)_crystalMigrateGrayscaleSetting
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"_AccessibilityMigration__GrayscaleEnabled_18"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    if (MADisplayFilterPrefGetCategoryEnabled()) {
      BOOL v5 = MADisplayFilterPrefGetType() == 1;
    }
    else {
      BOOL v5 = 0;
    }
    unsigned int v6 = AXLogDataMigrator();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Updating grayscale preference once more", v9, 2u);
    }

    v7 = +[NSNumber numberWithBool:v5];
    CFPreferencesSetAppValue(@"GrayscaleDisplay", v7, kAXSAccessibilityPreferenceDomain);

    CFPreferencesAppSynchronize(kAXSAccessibilityPreferenceDomain);
    v8 = +[NSUserDefaults standardUserDefaults];
    [v8 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration__GrayscaleEnabled_18"];
  }
}

- (void)_crystalMigrateBrailleScreenInputActivationGestureUsage
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"_AccessibilityMigration_VoiceOverBrailleScreenInputOutOfRotor_18.0"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    BOOL v5 = +[AXSettings sharedInstance];
    unsigned int v6 = [v5 valueForPreferenceKey:@"VoiceOverTouchRotorItemsPreference"];
    id v15 = [v6 mutableCopy];

    if ([v15 count])
    {
      uint64_t v7 = 0;
      while (1)
      {
        v8 = [v15 objectAtIndexedSubscript:v7];
        v9 = [v8 objectForKeyedSubscript:@"RotorItem"];
        unsigned int v10 = [v9 isEqualToString:kAXSVoiceOverTouchRotorItemBrailleGesture];

        if (v10)
        {
          v11 = [v8 objectForKeyedSubscript:@"Enabled"];
          unsigned int v12 = [v11 BOOLValue];

          if (v12) {
            break;
          }
        }

        if (++v7 >= (unint64_t)[v15 count]) {
          goto LABEL_9;
        }
      }

      v13 = +[AXSettings sharedInstance];
      [v13 setVoiceOverTouchBrailleGesturesActivationGestureEnabled:1];
    }
LABEL_9:
    v14 = +[NSUserDefaults standardUserDefaults];
    [v14 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_VoiceOverBrailleScreenInputOutOfRotor_18.0"];
  }
}

- (void)_crystalMigrateBrailleScreenInputCommands
{
  v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 objectForKey:@"_AccessibilityMigration_VoiceOverBrailleScreenInputCommands_18.0"];
  unsigned __int8 v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    unsigned int v6 = +[VOSCommandResolver resolverForCurrentHost];
    uint64_t v7 = +[VOSScreenreaderMode Default];
    id v40 = [v6 resolverWithScreenreaderModeVariant:v7];

    v8 = +[VOSCommandResolver resolverForCurrentHost];
    v9 = +[VOSScreenreaderMode BrailleScreenInput];
    unsigned int v10 = [v8 resolverWithScreenreaderModeVariant:v9];

    id v11 = [objc_alloc((Class)VOSCommandManager) initPreferringUserProfile];
    unsigned int v12 = +[VOSGesture TwoFingerPinch];
    v13 = +[VOSCommand BSIExit];
    [(AccessibilityDataMigrator *)self _ensureGesture:v12 isMappedToCommand:v13 withCommandManager:v11 withResolver:v10];

    v14 = +[VOSGesture TwoFingerScrub];
    id v15 = +[VOSCommand BSIEscape];
    [(AccessibilityDataMigrator *)self _ensureGesture:v14 isMappedToCommand:v15 withCommandManager:v11 withResolver:v10];

    v16 = +[VOSGesture TwoFingerRotateClockwise];
    v17 = +[VOSCommand BSINextRotor];
    [(AccessibilityDataMigrator *)self _ensureGesture:v16 isMappedToCommand:v17 withCommandManager:v11 withResolver:v10];

    v18 = +[VOSGesture TwoFingerRotateCounterclockwise];
    v19 = +[VOSCommand BSIPreviousRotor];
    [(AccessibilityDataMigrator *)self _ensureGesture:v18 isMappedToCommand:v19 withCommandManager:v11 withResolver:v10];

    v20 = +[VOSGesture OneFingerSplitFlickLeft];
    v21 = +[VOSCommand BSIPreviousTextSegment];
    [(AccessibilityDataMigrator *)self _ensureGesture:v20 isMappedToCommand:v21 withCommandManager:v11 withResolver:v10];

    v22 = +[VOSGesture OneFingerSplitFlickRight];
    v23 = +[VOSCommand BSINextTextSegment];
    [(AccessibilityDataMigrator *)self _ensureGesture:v22 isMappedToCommand:v23 withCommandManager:v11 withResolver:v10];

    v24 = +[VOSGesture TwoFingerSplitFlickLeft];
    v25 = +[VOSCommand BSISelectPreviousTextSegment];
    [(AccessibilityDataMigrator *)self _ensureGesture:v24 isMappedToCommand:v25 withCommandManager:v11 withResolver:v10];

    v26 = +[VOSGesture TwoFingerSplitFlickRight];
    v27 = +[VOSCommand BSISelectNextTextSegment];
    [(AccessibilityDataMigrator *)self _ensureGesture:v26 isMappedToCommand:v27 withCommandManager:v11 withResolver:v10];

    v28 = +[VOSGesture OneFingerSplitFlickDown];
    v29 = +[VOSCommand BSIPreviousTextSegmentType];
    [(AccessibilityDataMigrator *)self _ensureGesture:v28 isMappedToCommand:v29 withCommandManager:v11 withResolver:v10];

    v30 = +[VOSGesture OneFingerSplitFlickUp];
    v31 = +[VOSCommand BSINextTextSegmentType];
    [(AccessibilityDataMigrator *)self _ensureGesture:v30 isMappedToCommand:v31 withCommandManager:v11 withResolver:v10];

    v32 = +[VOSGesture TwoDistantFingerSingleTap];
    v33 = +[VOSCommand ActivateBrailleScreenInput];
    id v34 = [v11 removeGesture:v32 fromCommand:v33 withResolver:v40];

    v35 = +[VOSGesture TwoDistantFingerDoubleTap];
    v36 = +[VOSCommand ActivateBrailleScreenInput];
    [(AccessibilityDataMigrator *)self _ensureGesture:v35 isMappedToCommand:v36 withCommandManager:v11 withResolver:v40];

    v37 = +[VOSGesture TwoDistantFingerTripleTap];
    v38 = +[VOSCommand ActivateBrailleScreenInputCommand];
    [(AccessibilityDataMigrator *)self _ensureGesture:v37 isMappedToCommand:v38 withCommandManager:v11 withResolver:v40];

    [v11 saveAsUserProfile];
    v39 = +[NSUserDefaults standardUserDefaults];
    [v39 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_VoiceOverBrailleScreenInputCommands_18.0"];
  }
}

- (void)_ensureGesture:(id)a3 isMappedToCommand:(id)a4 withCommandManager:(id)a5 withResolver:(id)a6
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  unsigned int v12 = [v10 commandForTouchGesture:v15 withResolver:v11];
  if (v12) {
    id v13 = [v10 removeGesture:v15 fromCommand:v12 withResolver:v11];
  }
  id v14 = [v10 addGesture:v15 toCommand:v9 withResolver:v11];
}

- (void)_crystalMigrateBrailleTableReplacements
{
}

- (void)_crystalMigrateHearingControlCenterOrder
{
  v2 = _AXSHearingCCEnabledOptions();
  if (v2)
  {
    +[NSMutableArray array];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_2224;
    v5[3] = &unk_104E8;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = v6;
    [v2 enumerateObjectsUsingBlock:v5];
    unsigned __int8 v4 = +[HUHearingSettings sharedInstance];
    [v4 setHearingControlCenterOrder:v3];
  }
}

- (void)_crystalMigratePMESettings
{
  id v15 = +[PASettings sharedInstance];
  v2 = [v15 preferenceKeyForSelector:"personalMediaEnabled"];
  id v3 = [v15 objectValueForKey:v2 withClass:objc_opt_class() andDefaultValue:0];
  unsigned __int8 v4 = v3;
  if (v3)
  {
    objc_msgSend(v15, "setPersonalMediaEnabled:", objc_msgSend(v3, "BOOLValue"));
    [v15 setValue:0 forPreferenceKey:v2];
  }
  unsigned __int8 v5 = [v15 preferenceKeyForSelector:"personalAudioAccommodationTypes"];

  id v6 = [v15 objectValueForKey:v5 withClass:objc_opt_class() andDefaultValue:0];

  if (v6)
  {
    objc_msgSend(v15, "setPersonalAudioAccommodationTypes:", objc_msgSend(v6, "unsignedIntegerValue"));
    [v15 setValue:0 forPreferenceKey:v5];
  }
  uint64_t v7 = [v15 preferenceKeyForSelector:"personalMediaConfiguration"];

  v8 = [v15 objectValueForKey:v7 withClass:objc_opt_class() andDefaultValue:0];
  if (v8)
  {
    id v9 = [v15 personalMediaConfigurationByRouteUID];
    id v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];

    [v10 setValue:v8 forKey:PAConfigurationWildcard];
    [v15 setPersonalMediaConfigurationByRouteUID:v10];
    [v15 setValue:0 forPreferenceKey:v7];
  }
  id v11 = [v15 preferenceKeyForSelector:"audiogramConfiguration"];

  unsigned int v12 = [v15 objectValueForKey:v11 withClass:objc_opt_class() andDefaultValue:0];

  if (v12)
  {
    id v13 = [v15 audiogramConfigurationByRouteUID];
    id v14 = +[NSMutableDictionary dictionaryWithDictionary:v13];

    [v14 setValue:v12 forKey:PAConfigurationWildcard];
    [v15 setAudiogramConfigurationByRouteUID:v14];
    [v15 setValue:0 forPreferenceKey:v11];
  }
}

- (void)_crystalMigrateAudioDuckingSettings
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"_AccessibilityMigration_AudioDuckingSettings_18.0"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    unsigned __int8 v5 = +[AXSettings sharedInstance];
    unsigned __int8 v6 = [v5 voiceOverAudioDuckingEnabled];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = +[AXSettings sharedInstance];
      [v7 setVoiceOverMediaDuckingMode:0];
    }
    id v8 = +[NSUserDefaults standardUserDefaults];
    [v8 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_AudioDuckingSettings_18.0"];
  }
}

- (void)_dawnSUMigratePerAppSettingsIDs
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 objectForKey:@"_AccessibilityMigration__PerAppSettingsIDs_17"];
  unsigned int v5 = [v4 BOOLValue];

  if (!v5 || [(AccessibilityDataMigrator *)self inUnitTest])
  {
    unsigned __int8 v6 = +[AXSettings sharedInstance];
    uint64_t v7 = [v6 perAppSettingsCustomizedAppIDs];
    id v8 = [v7 count];

    if (v8)
    {
      id v9 = +[AXSettings sharedInstance];
      id v10 = [v9 perAppSettingsCustomizedAppIDs];
      id v11 = objc_msgSend(v10, "ax_arrayByRemovingDuplicates");

      CFPreferencesSetValue(@"AXSettingsPerAppIDsArray", v11, AX_PreferencesBundleName, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
      unsigned int v12 = +[AXSettings sharedInstance];
      [v12 setPerAppSettingsCustomizedAppIDs:0];
    }
    id v13 = +[NSUserDefaults standardUserDefaults];
    [v13 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration__PerAppSettingsIDs_17"];
  }
}

- (void)_dawnMigrateJapaneseSystemBrailleTable
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"_AccessibilityMigration__JapaneseSystemBrailleTable_17"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = +[AXSettings sharedInstance];
    unsigned __int8 v6 = [v5 voiceOverBrailleTableIdentifier];
    unsigned int v7 = [v6 isEqual:@"com.apple.scrod.braille.table.duxbury.jpn"];

    if (v7)
    {
      id v8 = +[AXSettings sharedInstance];
      [v8 setVoiceOverBrailleTableIdentifier:@"com.apple.scrod.braille.table.apple.ja"];
    }
    id v9 = +[AXSettings sharedInstance];
    id v10 = [v9 voiceOverBrailleLanguageRotorItems];

    v31 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v10;
    id v32 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v32)
    {
      uint64_t v30 = *(void *)v41;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v41 != v30) {
            objc_enumerationMutation(obj);
          }
          unsigned int v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v13 = [v12 mutableCopy];
          id v14 = [v12 objectForKeyedSubscript:@"LanguageDefaults"];
          id v15 = v14;
          if (v14)
          {
            v33 = v12;
            id v34 = v13;
            v35 = i;
            id v16 = [v14 mutableCopy];
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            v17 = [v15 allKeys];
            id v18 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v37;
              do
              {
                for (j = 0; j != v19; j = (char *)j + 1)
                {
                  if (*(void *)v37 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v36 + 1) + 8 * (void)j);
                  v23 = [v15 objectForKeyedSubscript:v22];
                  unsigned int v24 = [v23 isEqual:@"com.apple.scrod.braille.table.duxbury.jpn"];

                  if (v24) {
                    [v16 setObject:@"com.apple.scrod.braille.table.apple.ja" forKeyedSubscript:v22];
                  }
                }
                id v19 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
              }
              while (v19);
            }

            id v13 = v34;
            [v34 setObject:v16 forKeyedSubscript:@"LanguageDefaults"];

            i = v35;
            unsigned int v12 = v33;
          }
          v25 = [v12 objectForKeyedSubscript:@"RotorItem"];
          unsigned int v26 = [v25 isEqual:@"com.apple.scrod.braille.table.duxbury.jpn"];

          if (v26) {
            [v13 setObject:@"com.apple.scrod.braille.table.apple.ja" forKeyedSubscript:@"RotorItem"];
          }
          [v31 addObject:v13];
        }
        id v32 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v32);
    }

    v27 = +[AXSettings sharedInstance];
    [v27 setVoiceOverBrailleLanguageRotorItems:v31];

    v28 = +[NSUserDefaults standardUserDefaults];
    [v28 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration__JapaneseSystemBrailleTable_17"];
  }
}

- (void)_dawnMigrateGrayscaleSetting
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"_AccessibilityMigration__GrayscaleEnabled_17"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesGetAppBooleanValue(@"GrayscaleDisplay", kAXSAccessibilityPreferenceDomain, &keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat)
    {
      if (MADisplayFilterPrefGetCategoryEnabled()) {
        BOOL v5 = MADisplayFilterPrefGetType() == 1;
      }
      else {
        BOOL v5 = 0;
      }
      unsigned __int8 v6 = AXLogDataMigrator();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Updating grayscale preference", v9, 2u);
      }

      unsigned int v7 = +[NSNumber numberWithBool:v5];
      CFPreferencesSetAppValue(@"GrayscaleDisplay", v7, kAXSAccessibilityPreferenceDomain);

      CFPreferencesAppSynchronize(kAXSAccessibilityPreferenceDomain);
    }
    id v8 = +[NSUserDefaults standardUserDefaults];
    [v8 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration__GrayscaleEnabled_17"];
  }
}

- (void)_sydneyMigrateTapToWakeSetting
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"_AccessibilityMigration__TapToWake_16"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    if (AXDeviceIsD7x())
    {
      id v5 = objc_alloc((Class)NSUserDefaults);
      id v6 = [v5 initWithSuiteName:AX_SpringBoardBundleName];
      unsigned int v7 = [v6 objectForKey:@"SBSupportTapToWake"];
      id v8 = v7;
      if (v7 && ([v7 BOOLValue] & 1) == 0 && !_AXSVoiceOverTouchEnabled())
      {
        [v6 setBool:1 forKey:@"SBSupportTapToWake"];
        id v9 = AXLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v11 = 0;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Resetting tap to wake setting because we're on a supported model", v11, 2u);
        }
      }
    }
    id v10 = +[NSUserDefaults standardUserDefaults];
    [v10 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration__TapToWake_16"];
  }
}

- (void)_skyPrimeLeftRightBalance
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"_AccessibilityMigration__PrimeLeftRightBalance_15"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    _AXSLeftRightAudioBalance();
    float v6 = v5;
    double v7 = v5;
    id v8 = +[AXSettings sharedInstance];
    [v8 setLeftRightBalanceValue:v7];

    id v9 = +[AXSettings sharedInstance];
    [v9 setLeftRightBalanceEnabled:v6 != 0.0];

    id v10 = +[NSUserDefaults standardUserDefaults];
    [v10 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration__PrimeLeftRightBalance_15"];
  }
}

- (void)_skyClearGryphonYushu
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"_AccessibilityMigration__CleanupGryphonYushu_15"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    float v5 = +[AXSettings sharedInstance];
    float v6 = [v5 selectedSpeechVoiceIdentifiersWithLanguageSource];
    id v7 = [v6 mutableCopy];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v27 = v7;
    id v8 = [v7 allKeys];
    id v25 = [v8 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v25)
    {
      char v9 = 0;
      id obj = v8;
      uint64_t v24 = *(void *)v33;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = v10;
          uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * v10);
          unsigned int v12 = objc_msgSend(v27, "objectForKeyedSubscript:", v11, obj);
          id v13 = [v12 mutableCopy];

          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v14 = [v13 allKeys];
          id v15 = [v14 countByEnumeratingWithState:&v28 objects:v38 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v29;
            do
            {
              for (i = 0; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v29 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
                uint64_t v20 = [v13 objectForKeyedSubscript:v19];
                if ([v20 isEqualToString:@"com.apple.ttsbundle.gryphon_yushu_zh-CN_premium"])
                {
                  v21 = AXLogDataMigrator();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    long long v37 = v20;
                    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Idenitified invalid siri voice: %@", buf, 0xCu);
                  }

                  [v13 setObject:0 forKeyedSubscript:v19];
                  [v27 setObject:v13 forKeyedSubscript:v11];
                  char v9 = 1;
                }
              }
              id v16 = [v14 countByEnumeratingWithState:&v28 objects:v38 count:16];
            }
            while (v16);
          }

          uint64_t v10 = v26 + 1;
        }
        while ((id)(v26 + 1) != v25);
        id v25 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v25);

      if ((v9 & 1) == 0) {
        goto LABEL_23;
      }
      id v8 = +[AXSettings sharedInstance];
      [v8 setSelectedSpeechVoiceIdentifiersWithLanguageSource:v27];
    }

LABEL_23:
    uint64_t v22 = +[NSUserDefaults standardUserDefaults];
    [v22 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration__CleanupGryphonYushu_15"];
  }
}

- (void)_skyClearIrrelevantSwitchControlVoices
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"_AccessibilityMigration__CleanupGryphonSCVoices_15"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    float v5 = +[AXSettings sharedInstance];
    uint64_t v6 = AXSpeechSourceKeySwitchControl;
    id v7 = [v5 selectedSpeechVoiceIdentifiersForSourceKey:AXSpeechSourceKeySwitchControl];

    id v8 = +[AXLanguageManager sharedInstance];
    char v9 = [v8 systemLanguageID];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    unsigned int v12 = v10;
    if (v11)
    {
      id v13 = v11;
      char v14 = 0;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v10);
          }
          if (+[TTSAlternativeVoices isSiriVoiceIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * i)])
          {
            TTSGetComponentsInNamedSiriVoiceIdentifier();
            id v17 = 0;
            id v18 = AXLanguageCanonicalFormToGeneralLanguage();

            if (([v9 isEqualToString:v18] & 1) == 0)
            {
              uint64_t v19 = +[AXSettings sharedInstance];
              [v19 setSpeechVoiceIdentifier:0 forLanguage:v18 sourceKey:v6];

              char v14 = 1;
            }
          }
        }
        id v13 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);

      if ((v14 & 1) == 0) {
        goto LABEL_16;
      }
      unsigned int v12 = +[AXSettings sharedInstance];
      [v12 setSiriAutoUpdateListInitialized:0];
    }

LABEL_16:
    uint64_t v20 = +[NSUserDefaults standardUserDefaults];
    [v20 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration__CleanupGryphonSCVoices_15"];
  }
}

- (void)_skyMigrateSoundDetectionSettingsToNewDomain
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 objectForKey:@"_AccessibilityMigration__MigrateSoundDetection_15"];
  unsigned int v5 = [v4 BOOLValue];

  if (!v5 || [(AccessibilityDataMigrator *)self inUnitTest])
  {
    uint64_t v6 = +[AXSettings sharedInstance];
    CFStringRef v7 = (const __CFString *)[v6 _domainNameForDomain:7];

    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AXSUltronRunningStatus", v7, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      BOOL v9 = AppBooleanValue != 0;
      id v10 = +[AXSDSettings sharedInstance];
      [v10 setUltronIsRunning:v9];

      CFPreferencesSetAppValue(@"AXSUltronRunningStatus", 0, v7);
    }
    Boolean keyExistsAndHasValidFormat = 0;
    int v11 = CFPreferencesGetAppBooleanValue(@"AXSUltronEnabled", v7, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      BOOL v12 = v11 != 0;
      id v13 = +[AXSDSettings sharedInstance];
      [v13 setUltronSupportEnabled:v12];

      CFPreferencesSetAppValue(@"AXSUltronEnabled", 0, v7);
    }
    Boolean keyExistsAndHasValidFormat = 0;
    int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"AXSEnabledSoundDetectionState", v7, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      uint64_t v15 = AppIntegerValue;
      id v16 = +[AXSDSettings sharedInstance];
      [v16 setSoundDetectionState:v15];

      CFPreferencesSetAppValue(@"AXSEnabledSoundDetectionState", 0, v7);
    }
    id v17 = (void *)CFPreferencesCopyAppValue(@"AXSEnabledSoundDetectionTypes", v7);
    id v18 = [(AccessibilityDataMigrator *)self _convertHADomainTypesToSD:v17];
    uint64_t v19 = +[AXSDSettings sharedInstance];
    [v19 setEnabledSoundDetectionTypes:v18];

    CFPreferencesSetAppValue(@"AXSEnabledSoundDetectionTypes", 0, v7);
    uint64_t v20 = (void *)CFPreferencesCopyAppValue(@"AXSSoundDetectionSnoozeDictionary", v7);
    long long v21 = +[AXSDSettings sharedInstance];
    [v21 setSoundDetectionSnoozeDictionary:v20];

    CFPreferencesSetAppValue(@"AXSSoundDetectionSnoozeDictionary", 0, v7);
    CFPreferencesSetAppValue(@"AXSSoundDetectionSupportedTypes", 0, v7);
    long long v22 = +[NSUserDefaults standardUserDefaults];
    [v22 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration__MigrateSoundDetection_15"];
  }
}

- (id)_convertHADomainTypesToSD:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        unsigned __int8 v11 = objc_msgSend(v10, "isEqualToString:", @"AXHASoundDetectionTypeFireAlarms", (void)v31);
        CFStringRef v12 = @"AXSDSoundDetectionTypeFireAlarms";
        if (v11) {
          goto LABEL_24;
        }
        unsigned __int8 v13 = [v10 isEqualToString:@"AXHASoundDetectionTypeSirenAlarms"];
        CFStringRef v12 = @"AXSDSoundDetectionTypeSirenAlarms";
        if (v13) {
          goto LABEL_24;
        }
        unsigned __int8 v14 = [v10 isEqualToString:@"AXHASoundDetectionTypeSmokeAlarms"];
        CFStringRef v12 = @"AXSDSoundDetectionTypeSmokeAlarms";
        if (v14) {
          goto LABEL_24;
        }
        unsigned __int8 v15 = [v10 isEqualToString:@"AXHASoundDetectionTypeCatMeows"];
        CFStringRef v12 = @"AXSDSoundDetectionTypeCatMeows";
        if (v15) {
          goto LABEL_24;
        }
        unsigned __int8 v16 = [v10 isEqualToString:@"AXHASoundDetectionTypeDogBarks"];
        CFStringRef v12 = @"AXSDSoundDetectionTypeDogBarks";
        if (v16) {
          goto LABEL_24;
        }
        unsigned __int8 v17 = [v10 isEqualToString:@"AXHASoundDetectionTypeApplianceBeeps"];
        CFStringRef v12 = @"AXSDSoundDetectionTypeApplianceBeeps";
        if (v17) {
          goto LABEL_24;
        }
        unsigned __int8 v18 = [v10 isEqualToString:@"AXHASoundDetectionTypeApplianceBuzzes"];
        CFStringRef v12 = @"AXSDSoundDetectionTypeApplianceBuzzes";
        if (v18) {
          goto LABEL_24;
        }
        unsigned __int8 v19 = [v10 isEqualToString:@"AXHASoundDetectionTypeApplianceBellDings"];
        CFStringRef v12 = @"AXSDSoundDetectionTypeApplianceBellDings";
        if (v19) {
          goto LABEL_24;
        }
        unsigned __int8 v20 = [v10 isEqualToString:@"AXHASoundDetectionTypeCarHorns"];
        CFStringRef v12 = @"AXSDSoundDetectionTypeCarHorns";
        if (v20) {
          goto LABEL_24;
        }
        unsigned __int8 v21 = [v10 isEqualToString:@"AXHASoundDetectionTypeDoorbells"];
        CFStringRef v12 = @"AXSDSoundDetectionTypeDoorbells";
        if (v21) {
          goto LABEL_24;
        }
        unsigned __int8 v22 = [v10 isEqualToString:@"AXHASoundDetectionTypeDoorKnocks"];
        CFStringRef v12 = @"AXSDSoundDetectionTypeDoorKnocks";
        if (v22) {
          goto LABEL_24;
        }
        unsigned __int8 v23 = [v10 isEqualToString:@"AXHASoundDetectionTypeWaterRunning"];
        CFStringRef v12 = @"AXSDSoundDetectionTypeWaterRunning";
        if (v23) {
          goto LABEL_24;
        }
        unsigned __int8 v24 = [v10 isEqualToString:@"AXHASoundDetectionTypeDistressedBaby"];
        CFStringRef v12 = @"AXSDSoundDetectionTypeDistressedBaby";
        if (v24) {
          goto LABEL_24;
        }
        unsigned __int8 v25 = [v10 isEqualToString:@"AXHASoundDetectionTypePersonShouting"];
        CFStringRef v12 = @"AXSDSoundDetectionTypePersonShouting";
        if (v25) {
          goto LABEL_24;
        }
        unsigned __int8 v26 = [v10 isEqualToString:@"AXHASoundDetectionTypeWaterRunning"];
        CFStringRef v12 = @"AXSDSoundDetectionTypeWaterRunning";
        if ((v26 & 1) == 0)
        {
          unsigned __int8 v27 = [v10 isEqualToString:@"AXHASoundDetectionTypeCough"];
          CFStringRef v12 = @"AXSDSoundDetectionTypeCough";
          if ((v27 & 1) == 0)
          {
            unsigned __int8 v28 = [v10 isEqualToString:@"AXHASoundDetectionTypeGlassBreaking"];
            CFStringRef v12 = @"AXSDSoundDetectionTypeGlassBreaking";
            if ((v28 & 1) == 0)
            {
              unsigned int v29 = [v10 isEqualToString:@"AXHASoundDetectionTypKettle"];
              CFStringRef v12 = @"AXSDSoundDetectionTypeKettle";
              if (!v29) {
                continue;
              }
            }
          }
        }
LABEL_24:
        [v4 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_skyMigrateActionFeedback
{
  v2 = +[AXSettings sharedInstance];
  unint64_t v3 = (unint64_t)[v2 voiceOverActionsFeedback];

  if (v3 <= 2) {
    unint64_t v3 = qword_C3E8[v3];
  }
  id v4 = +[AXSettings sharedInstance];
  [v4 setVoiceOverActionsFeedback:v3];
}

- (void)_skyMigrateEmojiSetting
{
  v2 = (void *)CFPreferencesCopyAppValue(@"VoiceOverVerbosityEmojisEnabledPreference", kAXSVoiceOverPreferenceDomain);
  unint64_t v3 = +[AXSubsystemDataMigrator sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    id v5 = +[AXSubsystemDataMigrator identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = AXColorizeFormatLog();
      CFStringRef v12 = v2;
      BOOL v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        unsigned __int8 v14 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v2 BOOLValue]) {
      uint64_t v10 = 18;
    }
    else {
      uint64_t v10 = 1;
    }
    unsigned __int8 v11 = +[AXSettings sharedInstance];
    [v11 setVoiceOverVerbosityEmojiFeedback:v10];
  }
  CFPreferencesSetAppValue(@"VoiceOverVerbosityEmojisEnabledPreference", 0, kAXSVoiceOverPreferenceDomain);
}

- (void)_skyMigrateLinkFeedback
{
  v2 = +[AXSettings sharedInstance];
  unint64_t v3 = (unint64_t)[v2 voiceOverLinkFeedback];

  if (v3 > 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_C400[v3];
  }
  id v5 = +[AXSettings sharedInstance];
  [v5 setVoiceOverLinkFeedback:v4];
}

- (void)_skyMigrateFeedbackOptions
{
  unint64_t v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = [v3 objectForKey:@"_AccessibilityMigration_MigrateFeedbackOptions_15_0"];
  unsigned __int8 v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    [(AccessibilityDataMigrator *)self _skyMigrateLinkFeedback];
    [(AccessibilityDataMigrator *)self _skyMigrateActionFeedback];
    [(AccessibilityDataMigrator *)self _skyMigrateEmojiSetting];
    id v6 = +[NSUserDefaults standardUserDefaults];
    [v6 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_MigrateFeedbackOptions_15_0"];
  }
}

- (void)_azulMigrateRestFingerToOpen
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 objectForKey:@"_AccessibilityMigration_MigrateRestFingerToOpen_14_0"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0 && _AXSHomeButtonRestingUnlockPreferredForDevice())
  {
    int v5 = _AXSHomeButtonRestingUnlock();
    id v6 = AXLogDataMigrator();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Device prefers Rest Finger to Open. Currently enabled: %i", (uint8_t *)v9, 8u);
    }

    if (!v5)
    {
      os_log_type_t v7 = AXLogDataMigrator();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9[0]) = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Clearing existing Rest Finger to Open preference.", (uint8_t *)v9, 2u);
      }

      CFPreferencesSetAppValue(kAXSRestingHomeButtonUnlockPreference, 0, kAXSAccessibilityPreferenceDomain);
      CFPreferencesAppSynchronize(kAXSAccessibilityPreferenceDomain);
    }
    uint64_t v8 = +[NSUserDefaults standardUserDefaults];
    [v8 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_MigrateRestFingerToOpen_14_0"];
  }
}

- (void)_azulCMigrateVoiceOverVerbosityContainerSettings
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 objectForKey:@"_AccessibilityMigration_MigrateVoiceOverVerbosityContainerSettings_14_3"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    int v5 = +[AXSettings sharedInstance];
    unint64_t v6 = (unint64_t)[v5 voiceOverContainerOutputFeedback];

    if ((v6 & 2) != 0)
    {
      os_log_type_t v7 = +[AXSettings sharedInstance];
      [v7 setVoiceOverContainerOutputFeedback:v6 | 0x10];
    }
    id v8 = +[NSUserDefaults standardUserDefaults];
    [v8 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_MigrateVoiceOverVerbosityContainerSettings_14_3"];
  }
}

- (void)_azulGUpdateCustomVoiceIdentifiers
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 objectForKey:@"_AccessibilityMigration_MigrateCustomVoices_14_7"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    int v5 = +[AXSettings sharedInstance];
    unint64_t v6 = [v5 selectedSpeechVoiceIdentifiersWithLanguageSource];
    id v7 = [v6 mutableCopy];

    long long v49 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v46 = 0u;
    long long v37 = v7;
    id v8 = [v7 allKeys];
    id v33 = [v8 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v33)
    {
      char v35 = 0;
      uint64_t v31 = *(void *)v47;
      BOOL v9 = &AXAssistiveTouchDefaultIconTypeForMouseButton_ptr;
      long long v32 = v8;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v8);
          }
          uint64_t v34 = v10;
          uint64_t v36 = *(void *)(*((void *)&v46 + 1) + 8 * v10);
          unsigned __int8 v11 = [v37 objectForKeyedSubscript:v31];
          id v12 = [v11 mutableCopy];

          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id obj = [v12 allKeys];
          id v13 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v43;
            uint64_t v38 = *(void *)v43;
            do
            {
              unsigned __int8 v16 = 0;
              id v39 = v14;
              do
              {
                if (*(void *)v43 != v15) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v17 = *(void *)(*((void *)&v42 + 1) + 8 * (void)v16);
                unsigned __int8 v18 = [v12 objectForKeyedSubscript:v17];
                if ([v9[124] isOldSiriVoiceIdentifier:v18])
                {
                  unsigned __int8 v19 = AXLogDataMigrator();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v51 = v18;
                    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Idenitified selected siri voice: %@", buf, 0xCu);
                  }

                  AXGetComponentsInOldSiriVoiceIdentifier();
                  id v20 = 0;
                  id v21 = 0;
                  id v41 = 0;
                  if (([v20 isEqualToString:@"female"] & 1) != 0
                    || ([v20 isEqualToString:@"male"] & 1) != 0)
                  {
                    unsigned __int8 v22 = v12;
                    unsigned __int8 v23 = v9;
                    unsigned __int8 v24 = v20;
                    unsigned __int8 v25 = [&off_11B88 objectForKeyedSubscript:v21];
                    id v20 = [v25 objectForKeyedSubscript:v24];

                    unsigned __int8 v26 = _TTSIdentifierForVoiceInformation();
                    unsigned __int8 v27 = AXLogDataMigrator();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v51 = v21;
                      __int16 v52 = 2112;
                      v53 = v24;
                      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "Made new identifier %@ %@", buf, 0x16u);
                    }

                    id v12 = v22;
                    if (v26)
                    {
                      [v22 setObject:v26 forKeyedSubscript:v17];
                      [v37 setObject:v22 forKeyedSubscript:v36];
                      char v35 = 1;
                    }

                    BOOL v9 = v23;
                    uint64_t v15 = v38;
                    id v14 = v39;
                  }
                  else
                  {
                    unsigned __int8 v24 = AXLogDataMigrator();
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Could not determine old gender, moving on", buf, 2u);
                    }
                  }
                }
                unsigned __int8 v16 = (char *)v16 + 1;
              }
              while (v14 != v16);
              id v28 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
              id v14 = v28;
            }
            while (v28);
          }

          uint64_t v10 = v34 + 1;
          id v8 = v32;
        }
        while ((id)(v34 + 1) != v33);
        id v33 = [v32 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v33);

      if ((v35 & 1) == 0) {
        goto LABEL_33;
      }
      unsigned int v29 = +[AXSettings sharedInstance];
      [v29 setSelectedSpeechVoiceIdentifiersWithLanguageSource:v37];

      id v8 = +[AXSettings sharedInstance];
      [v8 setSiriAutoUpdateListInitialized:0];
    }

LABEL_33:
    long long v30 = +[NSUserDefaults standardUserDefaults];
    [v30 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_MigrateCustomVoices_14_7"];
  }
}

- (void)_azulEUpdatesVoicesForSiri
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 objectForKey:@"_AccessibilityMigration_MigrateVoices_14_5"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if (v4) {
    return;
  }
  int v5 = +[AXSettings sharedInstance];
  unint64_t v6 = [v5 selectedSpeechVoiceIdentifiersWithLanguageSource];
  id v7 = [v6 mutableCopy];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v39 = v7;
  id v8 = [v7 allKeys];
  id v35 = [v8 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (!v35) {
    goto LABEL_38;
  }
  char v37 = 0;
  uint64_t v33 = *(void *)v49;
  BOOL v9 = &AXAssistiveTouchDefaultIconTypeForMouseButton_ptr;
  uint64_t v34 = v8;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v49 != v33) {
        objc_enumerationMutation(v8);
      }
      uint64_t v36 = v10;
      uint64_t v38 = *(void *)(*((void *)&v48 + 1) + 8 * v10);
      unsigned __int8 v11 = objc_msgSend(v39, "objectForKeyedSubscript:");
      id v12 = [v11 mutableCopy];

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id obj = [v12 allKeys];
      id v13 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v45;
        uint64_t v40 = *(void *)v45;
        id v41 = v12;
        do
        {
          unsigned __int8 v16 = 0;
          id v42 = v14;
          do
          {
            if (*(void *)v45 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v44 + 1) + 8 * (void)v16);
            unsigned __int8 v18 = [v12 objectForKeyedSubscript:v17];
            if ([v9[124] isSiriVoiceIdentifier:v18])
            {
              unsigned __int8 v19 = AXLogDataMigrator();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v53 = v18;
                _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Identified selected siri voice: %@", buf, 0xCu);
              }

              TTSGetComponentsInNamedSiriVoiceIdentifier();
              id v20 = 0;
              id v21 = 0;
              if ([v20 isEqualToString:@"female"])
              {
                uint64_t v22 = 2;
                goto LABEL_19;
              }
              if ([v20 isEqualToString:@"male"])
              {
                uint64_t v22 = 1;
LABEL_19:
                unsigned __int8 v23 = +[AFLocalization sharedInstance];
                unsigned __int8 v24 = [v23 voiceNamesForOutputLanguageCode:v21 gender:v22];

                if ([v24 count])
                {
                  unsigned __int8 v25 = v9;
                  unsigned __int8 v26 = [v24 firstObject];
                  unsigned __int8 v27 = _TTSIdentifierForVoiceInformation();

                  id v28 = AXLogDataMigrator();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v29 = +[NSNumber numberWithInteger:v22];
                    *(_DWORD *)buf = 138412546;
                    id v53 = v21;
                    __int16 v54 = 2112;
                    v55 = v29;
                    _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Made new identifier %@ %@", buf, 0x16u);
                  }
                  if (v27)
                  {
                    id v12 = v41;
                    [v41 setObject:v27 forKeyedSubscript:v17];
                    [v39 setObject:v41 forKeyedSubscript:v38];
                    char v37 = 1;
                    BOOL v9 = v25;
                    goto LABEL_30;
                  }
                  BOOL v9 = v25;
                }
                else
                {
                  unsigned __int8 v27 = AXLogDataMigrator();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                  {
                    long long v30 = +[NSNumber numberWithInteger:v22];
                    *(_DWORD *)buf = 138412546;
                    id v53 = v21;
                    __int16 v54 = 2112;
                    v55 = v30;
                    _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "Could not find names for %@ %@", buf, 0x16u);
                  }
                }
                id v12 = v41;
LABEL_30:

                uint64_t v15 = v40;
              }
              else
              {
                unsigned __int8 v24 = AXLogDataMigrator();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Could not determine old gender, moving on", buf, 2u);
                }
              }

              id v14 = v42;
            }

            unsigned __int8 v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
        }
        while (v14);
      }

      uint64_t v10 = v36 + 1;
      id v8 = v34;
    }
    while ((id)(v36 + 1) != v35);
    id v35 = [v34 countByEnumeratingWithState:&v48 objects:v57 count:16];
  }
  while (v35);

  if (v37)
  {
    uint64_t v31 = +[AXSettings sharedInstance];
    [v31 setSelectedSpeechVoiceIdentifiersWithLanguageSource:v39];

    id v8 = +[AXSettings sharedInstance];
    [v8 setSiriAutoUpdateListInitialized:0];
LABEL_38:
  }
  long long v32 = +[NSUserDefaults standardUserDefaults];
  [v32 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_MigrateVoices_14_5"];
}

- (void)_azulCMigrateAssistiveTouchSpeedSettings
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 objectForKey:@"_AccessibilityMigration_MigrateAssistiveTouchSpeedSettings_14_3"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    int v5 = +[AXSettings sharedInstance];
    [v5 setAssistiveTouchSpeed:kAXSAssistiveTouchSpeedDefault];

    id v6 = +[NSUserDefaults standardUserDefaults];
    [v6 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_MigrateAssistiveTouchSpeedSettings_14_3"];
  }
}

- (void)_azulBMigrateSpeakScreenHighlightSettings
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 objectForKey:@"_AccessibilityMigration_MigrateSpeakScreenHighlightSettings_14_2"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    int v5 = +[AXSettings sharedInstance];
    CFStringRef v6 = (const __CFString *)[v5 _domainNameForDomain:6];

    id v8 = (id)CFPreferencesCopyAppValue(kAXSQuickSpeakHighlightTextEnabledPreference, v6);
    if (v8)
    {
      [v8 BOOLValue];
      _AXSQuickSpeakSetHighlightTextEnabled();
      CFPreferencesSetAppValue(kAXSQuickSpeakHighlightTextEnabledPreference, 0, v6);
    }
    CFPreferencesSetAppValue(@"SpeakScreenIsHighlightVisible", 0, v6);
    CFPreferencesAppSynchronize(v6);
    id v7 = +[NSUserDefaults standardUserDefaults];
    [v7 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_MigrateSpeakScreenHighlightSettings_14_2"];
  }
}

- (void)_azulMigrateSwitchAndVOSpeechSettingsToNewDomain
{
  unint64_t v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 objectForKey:@"_AccessibilityMigration_MigrateSwitchSpeechRateSettingsToNewDomain_14_0"];
  unsigned int v5 = [v4 BOOLValue];

  if (!v5 || [(AccessibilityDataMigrator *)self inUnitTest])
  {
    CFStringRef v6 = +[AXSettings sharedInstance];
    CFStringRef v7 = (const __CFString *)[v6 _domainNameForDomain:4];

    id v8 = (void *)CFPreferencesCopyAppValue(kAXSAssistiveTouchScannerSpeechRatePreference, v7);
    BOOL v9 = v8;
    if (v8)
    {
      [v8 doubleValue];
      double v11 = v10;
      id v12 = +[AXSettings sharedInstance];
      [v12 setAssistiveTouchScannerSpeechRate:v11];

      CFPreferencesSetAppValue(kAXSAssistiveTouchScannerSpeechRatePreference, 0, v7);
    }
    id v13 = +[AXSettings sharedInstance];
    CFStringRef v14 = (const __CFString *)[v13 _domainNameForDomain:2];

    id v19 = (id)CFPreferencesCopyAppValue(kAXSVoiceOverPitchPreference, v14);
    if (v19)
    {
      [v19 doubleValue];
      double v16 = v15;
      uint64_t v17 = +[AXSettings sharedInstance];
      [v17 setVoiceOverPitch:v16];

      CFPreferencesSetAppValue(kAXSVoiceOverPitchPreference, 0, v14);
    }
    unsigned __int8 v18 = +[NSUserDefaults standardUserDefaults];
    [v18 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_MigrateSwitchSpeechRateSettingsToNewDomain_14_0"];
  }
}

- (void)_yukonEEnsureInvertColorsPrefHasValidValue
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 objectForKey:@"_AccessibilityMigration_YukonEEnsureInvertColorsPrefHasValidValue_13.4"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = _AXSCopyPreferenceValue();
    CFStringRef v6 = (void *)v5;
    if (!v5) {
      _AXSetPreferenceWithNotification();
    }
    CFStringRef v7 = +[NSUserDefaults standardUserDefaults];
    [v7 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_YukonEEnsureInvertColorsPrefHasValidValue_13.4"];
  }
}

- (void)_ensureDefaultBrailleRotorItemExists
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v2 = +[AXSettings sharedInstance];
  unint64_t v3 = [v2 voiceOverBrailleLanguageRotorItems];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_5328;
  v17[3] = &unk_10510;
  v17[4] = &v18;
  [v3 enumerateObjectsUsingBlock:v17];

  if (!*((unsigned char *)v19 + 24))
  {
    unsigned __int8 v4 = +[AXSettings sharedInstance];
    uint64_t v5 = [v4 voiceOverBrailleLanguageRotorItems];
    id v6 = [v5 mutableCopy];

    if (!v6)
    {
      id v6 = +[NSMutableArray array];
    }
    CFStringRef v7 = +[AXLanguageManager sharedInstance];
    id v8 = [v7 userLocale];

    BOOL v9 = +[AXLanguageManager sharedInstance];
    double v10 = [v9 userLocale];
    double v11 = +[BRLTTableEnumerator defaultTableForLocale:v10];

    id v12 = [v8 localeIdentifier];
    unsigned __int8 v24 = v12;
    id v13 = [v11 identifier];
    unsigned __int8 v25 = v13;
    CFStringRef v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

    v22[0] = @"Enabled";
    v22[1] = @"Default";
    v23[0] = &__kCFBooleanTrue;
    v23[1] = &__kCFBooleanTrue;
    v22[2] = @"LanguageDefaults";
    v23[2] = v14;
    double v15 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
    [v6 insertObject:v15 atIndex:0];
    double v16 = +[AXSettings sharedInstance];
    [v16 setVoiceOverBrailleLanguageRotorItems:v6];
  }
  _Block_object_dispose(&v18, 8);
}

- (void)_azulUnmigrateVoiceOverBrailleScreenInputTwoFingerSwipeUp
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 objectForKey:@"_AccessibilityMigration_VoiceOverBrailleScreenInputTwoFingerSwipeUp_14.0"];
  unsigned int v4 = [v3 BOOLValue];

  uint64_t v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 objectForKey:@"_AccessibilityMigration_Revert\x10_VoiceOverBrailleScreenInputTwoFingerSwipeUp_14.0"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v4 && (v7 & 1) == 0)
  {
    id v8 = +[VOSCommandResolver resolverForCurrentHost];
    BOOL v9 = +[VOSScreenreaderMode BrailleScreenInput];
    id v21 = [v8 resolverWithScreenreaderModeVariant:v9];

    id v10 = [objc_alloc((Class)VOSCommandManager) initPreferringUserProfile];
    double v11 = +[VOSGesture TwoFingerFlickUp];
    id v12 = [v10 commandForTouchGesture:v11 withResolver:v21];

    id v13 = +[VOSCommand GesturedTextInputNextKeyboardLanguage];
    unsigned int v14 = [v12 isEqual:v13];

    if (v14)
    {
      double v15 = +[VOSGesture TwoFingerFlickUp];
      id v16 = [v10 removeGesture:v15 fromCommand:v12 withResolver:v21];

      uint64_t v17 = +[VOSGesture TwoFingerFlickUp];
      uint64_t v18 = +[VOSCommand GesturedTextInputNextBrailleTable];
      id v19 = [v10 addGesture:v17 toCommand:v18 withResolver:v21];

      [v10 saveAsUserProfile];
    }
    uint64_t v20 = +[NSUserDefaults standardUserDefaults];
    [v20 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_Revert\x10_VoiceOverBrailleScreenInputTwoFingerSwipeUp_14.0"];
  }
}

- (void)_yukonEMigrateNeuralVoicesForInternalInstalls
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 objectForKey:@"_AccessibilityMigration_YukonENeuralVoicePref_13.4"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0 && AXIsInternalInstall())
  {
    char v20 = 0;
    uint64_t v5 = +[AXSettings sharedInstance];
    uint64_t v6 = AXSpeechSourceKeySpeechFeatures;
    unsigned __int8 v7 = [v5 speechVoiceIdentifierForLanguage:@"en" sourceKey:AXSpeechSourceKeySpeechFeatures exists:&v20];

    if (+[TTSAlternativeVoices isNeuralSiriVoiceIdentifier:v7])
    {
      id v8 = +[AXSettings sharedInstance];
      [v8 setSpeechVoiceIdentifier:@"com.apple.ttsbundle.Samantha-compact" forLanguage:@"en" sourceKey:v6];
    }
    BOOL v9 = +[AXSettings sharedInstance];
    uint64_t v10 = AXSpeechSourceKeySwitchControl;
    double v11 = [v9 speechVoiceIdentifierForLanguage:@"en" sourceKey:AXSpeechSourceKeySwitchControl exists:&v20];

    if (+[TTSAlternativeVoices isNeuralSiriVoiceIdentifier:v11])
    {
      id v12 = +[AXSettings sharedInstance];
      [v12 setSpeechVoiceIdentifier:@"com.apple.ttsbundle.Samantha-compact" forLanguage:@"en" sourceKey:v10];
    }
    id v13 = +[AXSettings sharedInstance];
    unsigned int v14 = [v13 speechVoiceIdentifierForLanguage:@"es" sourceKey:v6 exists:&v20];

    if (+[TTSAlternativeVoices isNeuralSiriVoiceIdentifier:v14])
    {
      double v15 = +[AXSettings sharedInstance];
      [v15 setSpeechVoiceIdentifier:@"com.apple.ttsbundle.Paulina-compact" forLanguage:@"es" sourceKey:v6];
    }
    id v16 = +[AXSettings sharedInstance];
    uint64_t v17 = [v16 speechVoiceIdentifierForLanguage:@"es" sourceKey:v10 exists:&v20];

    if (+[TTSAlternativeVoices isNeuralSiriVoiceIdentifier:v17])
    {
      uint64_t v18 = +[AXSettings sharedInstance];
      [v18 setSpeechVoiceIdentifier:@"com.apple.ttsbundle.Paulina-compact" forLanguage:@"es" sourceKey:v10];
    }
    id v19 = +[NSUserDefaults standardUserDefaults];
    [v19 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_YukonENeuralVoicePref_13.4"];
  }
}

- (void)_yukonBMigrateVoiceOverCommandsForLongPress
{
  unint64_t v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 objectForKey:@"_AccessibilityMigration_VoiceOverCommandsForLongPress_13.2"];
  unsigned __int8 v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    if ([(AccessibilityDataMigrator *)self _isFreshInstall])
    {
LABEL_23:
      uint64_t v34 = +[NSUserDefaults standardUserDefaults];
      [v34 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_VoiceOverCommandsForLongPress_13.2"];

      return;
    }
    uint64_t v6 = +[VOSCommandResolver resolverForCurrentHost];
    id v7 = [objc_alloc((Class)VOSCommandManager) initPreferringUserProfile];
    id v8 = +[VOSCommand PerformLongPress];
    BOOL v9 = [v7 gestureBindingsForCommand:v8 withResolver:v6];

    if ([v9 count])
    {
      uint64_t v10 = AXLogDataMigrator();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      double v11 = [v9 anyObject];
      id v12 = [v11 localizedName];
      *(_DWORD *)v57 = 138412290;
      *(void *)&v57[4] = v12;
      id v13 = "Not assigning \"Perform long press\" to one finger triple tap - already assigned to a gesture: %@";
      unsigned int v14 = v10;
    }
    else
    {
      double v15 = +[VOSGesture OneFingerTripleTap];
      uint64_t v10 = [v7 commandForTouchGesture:v15 withResolver:v6];

      if (v10)
      {
        id v16 = +[VOSCommand SecondaryActivate];
        unsigned int v17 = [v10 isEqual:v16];

        if (v17)
        {
          uint64_t v18 = +[VOSGesture OneFingerTripleTap];
          id v19 = +[VOSCommand SecondaryActivate];
          char v20 = [v7 removeGesture:v18 fromCommand:v19 withResolver:v6];

          if (v20)
          {
            id v21 = +[VOSGesture OneFingerTripleTap];
            uint64_t v22 = +[VOSCommand PerformLongPress];
            unsigned __int8 v23 = [v7 addGesture:v21 toCommand:v22 withResolver:v6];

            unsigned __int8 v24 = AXLogDataMigrator();
            double v11 = v24;
            if (v23)
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v57 = 0;
                _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Assigned \"Perform long press\" to one finger triple tap.", v57, 2u);
              }

              unsigned __int8 v25 = +[VOSGesture OneFingerQuadrupleTap];
              unsigned __int8 v26 = [v7 commandForTouchGesture:v25 withResolver:v6];

              if (v26
                && (+[VOSCommand Invalid],
                    unsigned __int8 v27 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v28 = [v26 isEqual:v27],
                    v27,
                    !v28))
              {
                uint64_t v33 = AXLogDataMigrator();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  long long v49 = [v26 localizedName];
                  *(_DWORD *)v57 = 138412290;
                  *(void *)&v57[4] = v49;
                  _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "Not assigning \"Secondary activate\" to one finger quadruple tap because another command is assigned to that gesture: %@", v57, 0xCu);
                }
              }
              else
              {
                unsigned int v29 = +[VOSGesture OneFingerQuadrupleTap];
                long long v30 = +[VOSCommand SecondaryActivate];
                uint64_t v31 = [v7 addGesture:v29 toCommand:v30 withResolver:v6];

                long long v32 = AXLogDataMigrator();
                uint64_t v33 = v32;
                if (v31)
                {
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)v57 = 0;
                    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "Assigned \"Secondary activate\" to one finger quadruple tap.", v57, 2u);
                  }
                }
                else if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  sub_98C4(v33, v50, v51, v52, v53, v54, v55, v56);
                }
              }

              [v7 saveAsUserProfile];
              goto LABEL_22;
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              sub_988C(v11, v42, v43, v44, v45, v46, v47, v48);
            }
          }
          else
          {
            double v11 = AXLogDataMigrator();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              sub_9854(v11, v35, v36, v37, v38, v39, v40, v41);
            }
          }
          goto LABEL_20;
        }
      }
      double v11 = AXLogDataMigrator();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        goto LABEL_21;
      }
      id v12 = [v10 localizedName];
      *(_DWORD *)v57 = 138412290;
      *(void *)&v57[4] = v12;
      id v13 = "Not assigning \"Perform long press\" to one finger triple tap because the gesture is used for a command othe"
            "r than the previous default, \"Secondary activate\": %@";
      unsigned int v14 = v11;
    }
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, v13, v57, 0xCu);

    goto LABEL_20;
  }
}

- (void)_yukonMigrateBrailleTables
{
  unint64_t v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 objectForKey:@"_AccessibilityMigration_BrailleTables_13.0"];
  unsigned __int8 v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    [(AccessibilityDataMigrator *)self _ensureDefaultBrailleRotorItemExists];
    uint64_t v6 = +[UIKeyboardInputModeController sharedInputModeController];
    id v7 = [v6 enabledInputModeIdentifiers];

    id v8 = [(AccessibilityDataMigrator *)self _yukonBrailleTablesToMigrateWithKeyboardIdentifiers:v7];
    id v9 = [v8 mutableCopy];

    uint64_t v10 = +[NSUserDefaults standardUserDefaults];
    [v10 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_BrailleTables_13.0"];

    double v11 = +[AXSettings sharedInstance];
    id v12 = [v11 voiceOverBrailleLanguageRotorItems];
    id v13 = [v12 mutableCopy];
    unsigned int v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = +[NSMutableArray array];
    }
    id v16 = v15;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v9;
    id v17 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_60A0;
          v28[3] = &unk_10538;
          v28[4] = v21;
          uint64_t v22 = [v16 indexesOfObjectsPassingTest:v28];
          if (![v22 count])
          {
            v33[0] = @"RotorItem";
            unsigned __int8 v23 = [v21 identifier];
            v33[1] = @"Enabled";
            v34[0] = v23;
            v34[1] = &__kCFBooleanTrue;
            unsigned __int8 v24 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];

            [v16 addObject:v24];
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v18);
    }

    unsigned __int8 v25 = +[AXSettings sharedInstance];
    [v25 setVoiceOverBrailleLanguageRotorItems:v16];

    unsigned __int8 v26 = +[NSUserDefaults standardUserDefaults];
    [v26 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_BrailleTables_13.0"];
  }
}

- (void)_yukonBMigratePairedHearingAids
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 objectForKey:@"_AccessibilityMigration__MigratePairedHearingAids_13.2"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    unsigned __int8 v5 = +[HUHearingAidSettings sharedInstance];
    uint64_t v6 = [v5 pairedHearingAids];

    if (v6) {
      _AXSHearingAidsSetPaired();
    }
    id v7 = +[NSUserDefaults standardUserDefaults];
    [v7 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration__MigratePairedHearingAids_13.2"];
  }
}

- (void)_skyMigrateHearingDenylist
{
  unint64_t v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 objectForKey:@"_AccessibilityMigration__MigrateHearingDenylist_15.0"];
  unsigned int v5 = [v4 BOOLValue];

  if (!v5 || [(AccessibilityDataMigrator *)self inUnitTest])
  {
    uint64_t v6 = +[AXSettings sharedInstance];
    CFStringRef v7 = (const __CFString *)[v6 _domainNameForDomain:7];

    CFPropertyListRef v8 = CFPreferencesCopyAppValue(@"HearingAidsCloudBlacklist", v7);
    if (v8)
    {
      id v9 = v8;
      CFPreferencesSetAppValue(kAXSHearingAidsCloudDenylistPreference, 0, v7);
      uint64_t v10 = +[HUHearingAidSettings sharedInstance];
      [v10 setValue:v9 forPreferenceKey:kAXSHearingAidsCloudDenylistPreference];

      CFRelease(v9);
    }
    id v11 = +[NSUserDefaults standardUserDefaults];
    [v11 setBool:1 forKey:@"_AccessibilityMigration__MigrateHearingDenylist_15.0"];
  }
}

- (id)_yukonBrailleTablesToMigrateWithKeyboardIdentifiers:(id)a3
{
  id v3 = a3;
  id v23 = +[NSMutableArray array];
  unsigned __int8 v4 = +[AXLanguageManager sharedInstance];
  unsigned int v5 = [v4 userLocale];
  unsigned __int8 v24 = +[BRLTTableEnumerator defaultTableForLocale:v5];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v3;
  CFStringRef v7 = (char *)[v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    CFPropertyListRef v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = UIKeyboardInputModeGetLanguageWithRegion();
        id v12 = [v11 lowercaseString];
        unsigned __int8 v13 = [v12 isEqualToString:@"zh_hant"];

        CFStringRef v14 = @"zh_TW";
        if ((v13 & 1) != 0
          || ([v11 lowercaseString],
              id v15 = objc_claimAutoreleasedReturnValue(),
              unsigned int v16 = [v15 isEqualToString:@"zh_hans"],
              v15,
              CFStringRef v14 = @"zh_CN",
              v16))
        {

          id v11 = (void *)v14;
        }
        id v17 = +[NSLocale currentLocale];
        id v18 = [v17 localeIdentifier];
        unsigned __int8 v19 = [v11 isEqualToString:v18];

        if ((v19 & 1) == 0)
        {
          char v20 = +[NSLocale localeWithLocaleIdentifier:v11];
          id v21 = +[BRLTTableEnumerator defaultTableForLocale:v20];

          if (([v21 isEqual:v24] & 1) == 0) {
            [v23 addObject:v21];
          }
        }
      }
      CFPropertyListRef v8 = (char *)[v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  return v23;
}

- (void)_yukonBMigrateAssistiveTouchMenuForDwell
{
  id v17 = +[AXSettings sharedInstance];
  if ([v17 assistiveTouchMouseDwellControlEnabled])
  {
    v2 = +[AXSettings sharedInstance];
    unsigned __int8 v3 = [v2 assistiveTouchMouseDwellControlMutatedMenu];

    if ((v3 & 1) == 0)
    {
      unsigned __int8 v4 = +[AXSettings sharedInstance];
      unsigned int v5 = [v4 assistiveTouchMainScreenCustomization];

      id v6 = [v5 allValues];
      uint64_t v7 = AXAssistiveTouchIconTypeDwell;
      unsigned __int8 v8 = [v6 containsObject:AXAssistiveTouchIconTypeDwell];

      if ((v8 & 1) == 0 && (unint64_t)[v5 count] <= 7)
      {
        uint64_t v19 = v7;
        uint64_t v9 = +[NSArray arrayWithObjects:&v19 count:1];
        uint64_t v10 = AXAssistiveTouchInsertIconsIntoDictionary();

        unsigned int v5 = (void *)v10;
      }
      id v11 = [v5 allValues];
      uint64_t v12 = AXAssistiveTouchIconTypeScroll;
      unsigned __int8 v13 = [v11 containsObject:AXAssistiveTouchIconTypeScroll];

      if ((v13 & 1) == 0 && (unint64_t)[v5 count] <= 7)
      {
        uint64_t v18 = v12;
        CFStringRef v14 = +[NSArray arrayWithObjects:&v18 count:1];
        uint64_t v15 = AXAssistiveTouchInsertIconsIntoDictionary();

        unsigned int v5 = (void *)v15;
      }
      unsigned int v16 = +[AXSettings sharedInstance];
      [v16 setAssistiveTouchMainScreenCustomization:v5];
    }
  }
  else
  {
  }
}

- (void)_yukonEMigrateASTAlwaysShowMenuForDwell
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 objectForKey:@"_AccessibilityMigration_AlwaysShowMenu_13.4"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = +[AXSettings sharedInstance];
    unsigned int v6 = [v5 assistiveTouchMouseDwellControlEnabled];

    if (v6)
    {
      uint64_t v7 = +[AXSettings sharedInstance];
      [v7 setAssistiveTouchAlwaysShowMenuEnabled:1];
    }
  }
  id v8 = +[NSUserDefaults standardUserDefaults];
  [v8 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_AlwaysShowMenu_13.4"];
}

- (void)_yukonEMigrateASTCustomActions
{
  v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 laserEnabled];

  if (v3)
  {
    unsigned __int8 v4 = +[NSUserDefaults standardUserDefaults];
    unsigned int v5 = [v4 objectForKey:@"_AccessibilityMigration_ASTMigrateDefaultCustomActions_13.4"];
    unsigned __int8 v6 = [v5 BOOLValue];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = +[AXSettings sharedInstance];
      id v8 = [v7 assistiveTouchMouseCustomizedClickActions];

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id obj = v8;
      id v35 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v35)
      {
        uint64_t v34 = *(void *)v47;
        *(void *)&long long v9 = 138412290;
        long long v32 = v9;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v47 != v34) {
              objc_enumerationMutation(obj);
            }
            uint64_t v36 = v10;
            id v11 = *(void **)(*((void *)&v46 + 1) + 8 * v10);
            uint64_t v37 = +[NSMutableSet set];
            uint64_t v12 = +[NSMutableSet set];
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            unsigned __int8 v13 = [v11 buttonMap];
            CFStringRef v14 = [v13 allKeys];

            id v15 = [v14 countByEnumeratingWithState:&v42 objects:v53 count:16];
            if (v15)
            {
              id v16 = v15;
              uint64_t v17 = *(void *)v43;
              do
              {
                for (i = 0; i != v16; i = (char *)i + 1)
                {
                  if (*(void *)v43 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                  char v20 = objc_msgSend(v11, "customActionForButtonNumber:", objc_msgSend(v19, "integerValue"));
                  if ([v20 length]
                    && ([v20 isEqualToString:@"__NONE__"] & 1) == 0)
                  {
                    id v21 = AXAssistiveTouchDefaultIconTypeForMouseButton();
                    unsigned int v22 = [v20 isEqualToString:v21];

                    if (v22) {
                      id v23 = v37;
                    }
                    else {
                      id v23 = v12;
                    }
                    [v23 addObject:v19];
                  }
                }
                id v16 = [v14 countByEnumeratingWithState:&v42 objects:v53 count:16];
              }
              while (v16);
            }

            if ([v12 count] || !objc_msgSend(v37, "count"))
            {
              unsigned __int8 v24 = AXLogDataMigrator();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v32;
                uint64_t v52 = v11;
                _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "user defined actions specified, will skip removing actions for %@", buf, 0xCu);
              }
            }
            else
            {
              long long v25 = AXLogDataMigrator();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v32;
                uint64_t v52 = v11;
                _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "removing default custom actions from %@", buf, 0xCu);
              }

              long long v40 = 0u;
              long long v41 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              id v26 = v37;
              id v27 = [v26 countByEnumeratingWithState:&v38 objects:v50 count:16];
              if (v27)
              {
                id v28 = v27;
                uint64_t v29 = *(void *)v39;
                do
                {
                  for (j = 0; j != v28; j = (char *)j + 1)
                  {
                    if (*(void *)v39 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    objc_msgSend(v11, "setCustomAction:forButtonNumber:", 0, objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * (void)j), "integerValue"));
                  }
                  id v28 = [v26 countByEnumeratingWithState:&v38 objects:v50 count:16];
                }
                while (v28);
              }

              unsigned __int8 v24 = +[AXSettings sharedInstance];
              [v24 updateCustomizableMouse:v11];
            }

            uint64_t v10 = v36 + 1;
          }
          while ((id)(v36 + 1) != v35);
          id v35 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
        }
        while (v35);
      }

      long long v31 = +[NSUserDefaults standardUserDefaults];
      [v31 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_ASTMigrateDefaultCustomActions_13.4"];
    }
  }
}

- (void)_yukonESetAXSettingsForPointer
{
  v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 laserEnabled];

  if (v3)
  {
    unsigned __int8 v4 = +[NSUserDefaults standardUserDefaults];
    unsigned int v5 = [v4 objectForKey:@"_AccessibilityMigration_AXInitialSettingsForPointer_13.4"];
    unsigned __int8 v6 = [v5 BOOLValue];

    if ((v6 & 1) == 0)
    {
      _AXSReduceMotionEnabled();
      _AXSPointerAllowAppCustomizationSetEnabled();
      _AXSReduceMotionEnabled();
      _AXSPointerEffectScalingSetEnabled();
      _AXDarkenSystemColors();
      _AXSPointerIncreasedContrastSetEnabled();
      id v7 = +[NSUserDefaults standardUserDefaults];
      [v7 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_AXInitialSettingsForPointer_13.4"];
    }
  }
}

- (void)_yukonMigrateIncorrectVoiceDefaults
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 objectForKey:@"_AccessibilityMigration_IncorrectVoiceDefaults_13.0"];
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    unsigned int v5 = AXLogDataMigrator();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v6 = "Not running 'incorrect voice defaults' migrator, already migrated";
LABEL_27:
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
  }
  else
  {
    id v7 = +[AXSettings sharedInstance];
    id v8 = [v7 selectedSpeechVoiceIdentifiers];

    unsigned int v5 = AXLogDataMigrator();
    BOOL v9 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Migrating incorrect voice defaults: ", buf, 2u);
      }

      uint64_t v10 = AXLogDataMigrator();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = +[AXSettings sharedInstance];
        uint64_t v12 = [v11 selectedSpeechVoiceIdentifiers];
        *(_DWORD *)buf = 138412290;
        long long v42 = v12;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Pre migrate data: %@", buf, 0xCu);
      }
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v13 = [&off_11BB0 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v35 = *(void *)v37;
        uint64_t v15 = AXSpeechSourceKeySwitchControl;
        uint64_t v16 = kTTSGryphonVoiceIdentifierPrefix;
        uint64_t v17 = AXSpeechSourceKeySpeechFeatures;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v37 != v35) {
              objc_enumerationMutation(&off_11BB0);
            }
            uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            char v20 = +[AXSettings sharedInstance];
            unsigned __int8 v21 = [v20 userDidSelectVoiceForLanguage:v19 sourceKey:v15];

            if ((v21 & 1) == 0)
            {
              buf[0] = 0;
              unsigned int v22 = +[AXSettings sharedInstance];
              id v23 = [v22 speechVoiceIdentifierForLanguage:v19 sourceKey:v15 exists:buf];
              unsigned __int8 v24 = [v23 hasPrefix:v16];

              if ((v24 & 1) == 0)
              {
                long long v25 = +[AXSettings sharedInstance];
                [v25 setSpeechVoiceIdentifier:0 forLanguage:v19 sourceKey:v15];
              }
            }
            id v26 = +[AXSettings sharedInstance];
            unsigned __int8 v27 = [v26 userDidSelectVoiceForLanguage:v19 sourceKey:v17];

            if ((v27 & 1) == 0)
            {
              buf[0] = 0;
              id v28 = +[AXSettings sharedInstance];
              uint64_t v29 = [v28 speechVoiceIdentifierForLanguage:v19 sourceKey:v17 exists:buf];
              unsigned __int8 v30 = [v29 hasPrefix:v16];

              if ((v30 & 1) == 0)
              {
                long long v31 = +[AXSettings sharedInstance];
                [v31 setSpeechVoiceIdentifier:0 forLanguage:v19 sourceKey:v17];
              }
            }
          }
          id v14 = [&off_11BB0 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v14);
      }
      long long v32 = AXLogDataMigrator();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = +[AXSettings sharedInstance];
        uint64_t v34 = [v33 selectedSpeechVoiceIdentifiers];
        *(_DWORD *)buf = 138412290;
        long long v42 = v34;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Post migrate data: %@", buf, 0xCu);
      }
      unsigned int v5 = +[NSUserDefaults standardUserDefaults];
      [v5 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_IncorrectVoiceDefaults_13.0"];
    }
    else if (v9)
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v6 = "Not running 'incorrect voice defaults' migrator, since we have no speech voice identifiers saved";
      goto LABEL_27;
    }
  }
}

- (void)_yukonMigrateEmojiSuffixPreference
{
  if ([(AccessibilityDataMigrator *)self inUnitTest]
    || ![(AccessibilityDataMigrator *)self _isFreshInstall])
  {
    unsigned int v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 objectForKey:@"_AccessibilityMigration_EmojiSuffix_13.0"];
    unsigned __int8 v5 = [v4 BOOLValue];

    if ((v5 & 1) == 0)
    {
      unsigned __int8 v6 = (void *)CFPreferencesCopyAppValue(@"VoiceOverSoundEffectsEnabledPreference", kAXSVoiceOverPreferenceDomain);
      id v7 = +[AXSubsystemDataMigrator sharedInstance];
      unsigned __int8 v8 = [v7 ignoreLogging];

      if ((v8 & 1) == 0)
      {
        BOOL v9 = +[AXSubsystemDataMigrator identifier];
        uint64_t v10 = AXLoggerForFacility();

        os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v10, v11))
        {
          uint64_t v12 = AXColorizeFormatLog();
          uint64_t v17 = v6;
          id v13 = _AXStringForArgs();
          if (os_log_type_enabled(v10, v11))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v19 = v13;
            _os_log_impl(&dword_0, v10, v11, "%{public}@", buf, 0xCu);
          }
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [v6 BOOLValue];
        uint64_t v15 = +[AXSettings sharedInstance];
        [v15 setVoiceOverVerbosityEmojiSuffixEnabled:v14];
      }
      uint64_t v16 = +[NSUserDefaults standardUserDefaults];
      [v16 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_EmojiSuffix_13.0"];
    }
  }
}

- (void)_yukonMigrateGuidedAccessSettings
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 objectForKey:@"_AccessibilityMigration_GuidedAccess_13.0"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    id v7 = +[AXSettings sharedInstance];
    if ([v7 hasExistingValueForPreferenceWithSelector:"guidedAccessOverrideIdleTime"])
    {
      if ([v7 guidedAccessOverrideIdleTime]) {
        uint64_t v5 = 600;
      }
      else {
        uint64_t v5 = AXSGuidedAccessAutoLockTimeMirrorSystem;
      }
      [v7 setGuidedAccessAutoLockTimeInSeconds:v5];
      [v7 clearExistingValueForPreferenceWithSelector:"guidedAccessOverrideIdleTime"];
    }
    unsigned __int8 v6 = +[NSUserDefaults standardUserDefaults];
    [v6 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_GuidedAccess_13.0"];
  }
}

- (void)_peaceMigrateTouchAccommodationsSettings
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned int v3 = [v2 objectForKey:@"_AccessibilityMigration_TouchAccommodations_12.0"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    id v8 = +[AXSettings sharedInstance];
    if ([v8 hasExistingValueForPreferenceWithSelector:"touchAccommodationsHoldDurationAllowsSwipeGesturesToBypass"])
    {
      objc_msgSend(v8, "setTouchAccommodationsAllowsSwipeGesturesToBypass:", objc_msgSend(v8, "touchAccommodationsHoldDurationAllowsSwipeGesturesToBypass"));
      [v8 clearExistingValueForPreferenceWithSelector:"touchAccommodationsHoldDurationAllowsSwipeGesturesToBypass"];
    }
    if ([v8 hasExistingValueForPreferenceWithSelector:"touchAccommodationsHoldDurationSwipeGestureSensitivity"])
    {
      unint64_t v5 = (unint64_t)[v8 touchAccommodationsHoldDurationSwipeGestureSensitivity];
      double v6 = 0.0;
      if (v5 <= 2) {
        double v6 = dbl_C420[v5];
      }
      [v8 setTouchAccommodationsSwipeGestureMinimumDistance:v6];
      [v8 clearExistingValueForPreferenceWithSelector:"touchAccommodationsHoldDurationSwipeGestureSensitivity"];
    }
    id v7 = +[NSUserDefaults standardUserDefaults];
    [v7 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_TouchAccommodations_12.0"];
  }
}

- (BOOL)_isFreshInstall
{
  if (([(AccessibilityDataMigrator *)self didUpgrade] & 1) != 0
    || ([(AccessibilityDataMigrator *)self didRestoreFromBackup] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return [(AccessibilityDataMigrator *)self didMigrateBackupFromDifferentDevice] ^ 1;
  }
}

- (void)_tigrisMigrateVoiceOverPunctuationSettings
{
  if ([(AccessibilityDataMigrator *)self inUnitTest]
    || ![(AccessibilityDataMigrator *)self _isFreshInstall])
  {
    unsigned int v3 = (void *)CFPreferencesCopyAppValue(@"PunctuationKey", kAXSAccessibilityPreferenceDomain);
    unsigned __int8 v4 = +[AXSubsystemDataMigrator sharedInstance];
    unsigned __int8 v5 = [v4 ignoreLogging];

    if ((v5 & 1) == 0)
    {
      double v6 = +[AXSubsystemDataMigrator identifier];
      id v7 = AXLoggerForFacility();

      os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v7, v8))
      {
        BOOL v9 = AXColorizeFormatLog();
        uint64_t v15 = v3;
        uint64_t v10 = _AXStringForArgs();
        if (os_log_type_enabled(v7, v8))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v17 = v10;
          _os_log_impl(&dword_0, v7, v8, "%{public}@", buf, 0xCu);
        }
      }
    }
    if (!v3) {
      goto LABEL_18;
    }
    unsigned int v11 = [v3 intValue];
    switch(v11)
    {
      case 3u:
        uint64_t v12 = +[AXSettings sharedInstance];
        id v13 = v12;
        uint64_t v14 = 0;
        break;
      case 2u:
        uint64_t v12 = +[AXSettings sharedInstance];
        id v13 = v12;
        uint64_t v14 = 1;
        break;
      case 1u:
        uint64_t v12 = +[AXSettings sharedInstance];
        id v13 = v12;
        uint64_t v14 = 2;
        break;
      default:
LABEL_17:
        CFPreferencesSetAppValue(@"PunctuationKey", 0, kAXSAccessibilityPreferenceDomain);
        CFPreferencesAppSynchronize(kAXSAccessibilityPreferenceDomain);
LABEL_18:

        return;
    }
    objc_msgSend(v12, "setVoiceOverPunctuationLevel:", v14, v15);

    goto LABEL_17;
  }
}

- (void)_tigrisMigrateVoicesToNewDomain
{
  if ([(AccessibilityDataMigrator *)self inUnitTest]
    || ![(AccessibilityDataMigrator *)self _isFreshInstall])
  {
    unsigned int v3 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v4 = [v3 objectForKey:@"_AccessibilityMigration_Voices_11.0"];
    unsigned __int8 v5 = [v4 BOOLValue];

    if (v5) {
      return;
    }
    double v6 = +[AXSettings sharedInstance];
    CFStringRef v7 = (const __CFString *)[v6 _domainNameForDomain:1];

    id v10 = (id)CFPreferencesCopyAppValue(kAXSCustomPronunciationSubstitutionsPreference, v7);
    if (v10)
    {
      os_log_type_t v8 = +[AXSettings sharedInstance];
      [v8 setValue:v10 forPreferenceKey:kAXSCustomPronunciationSubstitutionsPreference];
    }
    CFPreferencesSetAppValue(kAXSCustomPronunciationSubstitutionsPreference, 0, v7);
    BOOL v9 = +[NSUserDefaults standardUserDefaults];
    [v9 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_Voices_11.0"];
  }
  else
  {
    id v10 = +[NSUserDefaults standardUserDefaults];
    [v10 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_Voices_11.0"];
  }
}

- (void)_tigrisMigrateSwitchSpeechSettingsToNewDomain
{
  if (([(AccessibilityDataMigrator *)self didUpgrade] & 1) != 0
    || [(AccessibilityDataMigrator *)self inUnitTest])
  {
    unsigned int v3 = +[AXSettings sharedInstance];
    CFStringRef v4 = (const __CFString *)[v3 _domainNameForDomain:4];

    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(kAXSAssistiveTouchScannerSpeechEnabledPreference, v4, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      BOOL v6 = AppBooleanValue != 0;
      CFStringRef v7 = +[AXSettings sharedInstance];
      [v7 setAssistiveTouchScannerSpeechEnabled:v6];

      CFPreferencesSetAppValue(kAXSAssistiveTouchScannerSpeechEnabledPreference, 0, v4);
    }
  }
}

- (void)_tigrisMigrateBrailleStatusCellSettings
{
  if (([(AccessibilityDataMigrator *)self didUpgrade] & 1) != 0
    || [(AccessibilityDataMigrator *)self inUnitTest])
  {
    unsigned int v3 = +[NSUserDefaults standardUserDefaults];
    CFStringRef v4 = [v3 objectForKey:@"_AccessibilityMigration_Braille_11.0"];
    unsigned __int8 v5 = [v4 BOOLValue];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = _AXSVoiceOverTouchBrailleMasterStatusCellIndex();
      CFStringRef v7 = +[AXSettings sharedInstance];
      [v7 setVoiceOverTouchBrailleShowGeneralStatus:v6 >= 0];

      _AXSVoiceOverTouchSetBrailleMasterStatusCellIndex();
      id v8 = +[NSUserDefaults standardUserDefaults];
      [v8 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_Braille_11.0"];
    }
  }
}

- (void)_whitetailMigrateVOTShouldRouteToSpeakerWithProx
{
  if (![(AccessibilityDataMigrator *)self _isFreshInstall])
  {
    v2 = +[AXSettings sharedInstance];
    CFStringRef v3 = (const __CFString *)[v2 _domainNameForDomain:2];

    CFStringRef v4 = (void *)CFPreferencesCopyAppValue(kAXSVoiceOverTouchShouldRouteToSpeakerWithProximityPreference, v3);
    CFPreferencesSetAppValue(kAXSVoiceOverTouchShouldRouteToSpeakerWithProximityPreference, 0, v3);
    if (v4)
    {
      id v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v5 BOOLValue];
        _AXSVoiceOverTouchSetShouldRouteToSpeakerWithProximity();
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_98FC((uint64_t)v3, (uint64_t)v5);
      }
      CFRelease(v5);
    }
  }
}

- (void)_voiceOverVoiceMigrationWhitetail
{
  long long v48 = +[NSMutableDictionary dictionaryWithCapacity:0];
  v2 = +[AXSettings sharedInstance];
  CFStringRef v3 = [v2 _voiceOverPrefersCompactByLanguage];

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v50 = v3;
    CFStringRef v4 = +[AXSettings sharedInstance];
    id v5 = [v4 _voiceOverAlternativeVoiceIdentifiers];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v49 = v5;
    uint64_t v6 = [v5 allKeys];
    id v7 = [v6 countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v64;
      uint64_t v10 = AXSpeechSourceKeyVoiceOver;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v64 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v63 + 1) + 8 * i);
          id v13 = [v5 objectForKey:v12];
          if (v13)
          {
            [v48 setObject:&__kCFBooleanTrue forKey:v12];
            uint64_t v14 = +[AXSettings sharedInstance];
            [v14 setSpeechVoiceIdentifier:v13 forLanguage:v12 sourceKey:v10];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v63 objects:v69 count:16];
      }
      while (v8);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v15 = [v50 allKeys];
    id v16 = [v15 countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v60;
      uint64_t v43 = AXSpeechSourceKeyVoiceOver;
      uint64_t v44 = *(void *)v60;
      uint64_t v19 = kTTSSystemVoiceIdentifierPrefix;
      uint64_t v52 = kTTSSystemVoiceIdentifierPrefix;
      long long v45 = v15;
      do
      {
        char v20 = 0;
        id v46 = v17;
        do
        {
          if (*(void *)v60 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v21 = *(void *)(*((void *)&v59 + 1) + 8 * (void)v20);
          unsigned int v22 = objc_msgSend(v49, "objectForKey:", v21, v43);

          if (v22) {
            goto LABEL_47;
          }
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id obj = +[AVSpeechSynthesisVoice _speechVoicesIncludingSiri];
          id v23 = [obj countByEnumeratingWithState:&v55 objects:v67 count:16];
          if (v23)
          {
            id v24 = v23;
            long long v47 = v20;
            id v54 = 0;
            uint64_t v51 = 0;
            uint64_t v25 = *(void *)v56;
            id v26 = obj;
            while (1)
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v56 != v25) {
                  objc_enumerationMutation(v26);
                }
                id v28 = *(void **)(*((void *)&v55 + 1) + 8 * (void)j);
                uint64_t v29 = [v28 identifier];
                if ([v29 hasPrefix:v19])
                {
                  unsigned __int8 v30 = [v28 language];
                  if ([v30 isEqualToString:v21])
                  {
                  }
                  else
                  {
                    long long v31 = [v28 language];
                    long long v32 = AXLanguageCanonicalFormToGeneralLanguage();
                    unsigned int v33 = [v32 isEqualToString:v21];

                    uint64_t v19 = v52;
                    id v26 = obj;

                    if (!v33) {
                      continue;
                    }
                  }
                  if ([v28 quality] == (char *)&dword_0 + 1)
                  {
                    uint64_t v34 = [v50 objectForKey:v21];
                    unsigned int v35 = [v34 BOOLValue];

                    uint64_t v19 = v52;
                    id v36 = v28;
                    BOOL v37 = v35 == 0;
                    id v26 = obj;
                    id v38 = v54;
                    id v39 = v51;
                    if (v37) {
                      uint64_t v29 = v51;
                    }
                    else {
                      uint64_t v29 = v54;
                    }
                    if (!v37) {
                      id v38 = v36;
                    }
                    id v54 = v38;
                    if (v37) {
                      id v39 = v36;
                    }
                    uint64_t v51 = v39;
                  }
                  else
                  {
                    if ([v28 quality] != (char *)&dword_0 + 2) {
                      continue;
                    }
                    uint64_t v29 = v54;
                    id v54 = v28;
                  }
                }
              }
              id v24 = [v26 countByEnumeratingWithState:&v55 objects:v67 count:16];
              if (!v24)
              {

                uint64_t v18 = v44;
                uint64_t v15 = v45;
                id v17 = v46;
                char v20 = v47;
                id v40 = v54;
                if (v54 || (id v40 = v51) != 0)
                {
                  long long v41 = +[AXSettings sharedInstance];
                  long long v42 = [v40 identifier];
                  [v41 setSpeechVoiceIdentifier:v42 forLanguage:v21 sourceKey:v43];

                  uint64_t v19 = v52;
                  goto LABEL_46;
                }
                goto LABEL_47;
              }
            }
          }
          id v40 = obj;
LABEL_46:

LABEL_47:
          char v20 = (char *)v20 + 1;
        }
        while (v20 != v17);
        id v17 = [v15 countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v17);
    }

    CFStringRef v3 = v50;
  }
}

- (void)_switchVoiceMigrationWhitetail
{
  v2 = +[AXSettings sharedInstance];
  uint64_t v43 = [v2 _switchControlScannerDefaultDialect];

  CFStringRef v3 = +[AXSettings sharedInstance];
  CFStringRef v4 = [v3 _switchControlPrefersCompact];

  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v40 = v4;
    id v5 = +[AXSettings sharedInstance];
    uint64_t v6 = [v5 _switchControlAltVoices];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v8)
    {
      id v9 = v8;
      char v10 = 0;
      uint64_t v11 = *(void *)v49;
      uint64_t v12 = AXSpeechSourceKeySwitchControl;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v15 = [v7 objectForKeyedSubscript:v14];
          if (v15)
          {
            id v16 = +[AXSettings sharedInstance];
            [v16 setSpeechVoiceIdentifier:v15 forLanguage:v14 sourceKey:v12];

            char v10 = 1;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v9);
    }
    else
    {
      char v10 = 0;
    }

    if (v43 && (v10 & 1) == 0)
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id obj = +[AVSpeechSynthesisVoice _speechVoicesIncludingSiri];
      id v17 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v17)
      {
        id v18 = v17;
        id v39 = 0;
        uint64_t v19 = *(void *)v45;
        uint64_t v41 = kTTSSystemVoiceIdentifierPrefix;
LABEL_18:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v45 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v44 + 1) + 8 * v20);
          unsigned int v22 = AXLanguageCanonicalFormToGeneralLanguage();
          id v23 = [v21 language];
          if (![v23 isEqualToString:v43]) {
            goto LABEL_27;
          }
          id v24 = [v21 identifier];
          unsigned int v25 = [v24 hasPrefix:v41];

          if (v25) {
            break;
          }
LABEL_28:

          if (v18 == (id)++v20)
          {
            id v33 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
            id v18 = v33;
            if (v33) {
              goto LABEL_18;
            }
            goto LABEL_37;
          }
        }
        if ([v21 quality] != (char *)&dword_0 + 1)
        {
          if ([v21 quality] == (char *)&dword_0 + 2)
          {
            uint64_t v29 = [v40 objectForKey:v22];
            if (!v29) {
              goto LABEL_39;
            }
            unsigned __int8 v30 = (void *)v29;
            long long v31 = [v40 objectForKey:v22];
            unsigned __int8 v32 = [v31 BOOLValue];

            if ((v32 & 1) == 0) {
              goto LABEL_39;
            }
          }
          goto LABEL_28;
        }
        id v26 = [v40 objectForKey:v43];
        if ([v26 BOOLValue])
        {

LABEL_39:
          id v35 = v21;

          id v34 = v39;
          if (v35) {
            goto LABEL_41;
          }
          goto LABEL_40;
        }
        unsigned __int8 v27 = [v40 objectForKey:v22];
        unsigned __int8 v28 = [v27 BOOLValue];

        if (v28) {
          goto LABEL_39;
        }
        id v23 = v39;
        id v39 = v21;
LABEL_27:

        goto LABEL_28;
      }
      id v39 = 0;
LABEL_37:

      id v34 = v39;
LABEL_40:
      id v34 = v34;
      id v35 = v34;
LABEL_41:
      id v36 = +[AXSettings sharedInstance];
      BOOL v37 = [v35 identifier];
      id v38 = AXLanguageCanonicalFormToGeneralLanguage();
      [v36 setSpeechVoiceIdentifier:v37 forLanguage:v38 sourceKey:AXSpeechSourceKeySwitchControl];
    }
    CFStringRef v4 = v40;
  }
}

- (void)_speechVoiceMigrationWhitetail
{
  long long v51 = +[NSMutableDictionary dictionaryWithCapacity:0];
  v2 = +[AXSettings sharedInstance];
  CFStringRef v3 = [v2 _quickSpeakPrefersCompact];

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v52 = v3;
    CFStringRef v4 = +[AXSettings sharedInstance];
    id v5 = [v4 _quickSpeakAltVoices];

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v50 = v5;
    uint64_t v6 = [v5 allKeys];
    id v7 = [v6 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v63;
      uint64_t v10 = AXSpeechSourceKeySpeechFeatures;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v63 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          id v13 = [v5 objectForKey:v12];
          if (v13)
          {
            [v51 setObject:&__kCFBooleanTrue forKey:v12];
            uint64_t v14 = +[AXSettings sharedInstance];
            [v14 setSpeechVoiceIdentifier:v13 forLanguage:v12 sourceKey:v10];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v8);
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = [v52 allKeys];
    id v15 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v59;
      uint64_t v18 = kTTSSystemVoiceIdentifierPrefix;
      uint64_t v44 = AXSpeechSourceKeySpeechFeatures;
      uint64_t v45 = *(void *)v59;
      do
      {
        uint64_t v19 = 0;
        id v46 = v16;
        do
        {
          if (*(void *)v59 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v58 + 1) + 8 * (void)v19);
          uint64_t v21 = AXLanguageCanonicalFormToGeneralLanguage();
          unsigned int v22 = [v51 objectForKey:v21];

          if (!v22)
          {
            uint64_t v48 = v20;
            long long v49 = v19;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            id v23 = +[AVSpeechSynthesisVoice _speechVoicesIncludingSiri];
            id v24 = [v23 countByEnumeratingWithState:&v54 objects:v66 count:16];
            if (v24)
            {
              id v25 = v24;
              id v53 = 0;
              uint64_t v26 = *(void *)v55;
LABEL_20:
              uint64_t v27 = 0;
              while (1)
              {
                if (*(void *)v55 != v26) {
                  objc_enumerationMutation(v23);
                }
                unsigned __int8 v28 = *(void **)(*((void *)&v54 + 1) + 8 * v27);
                uint64_t v29 = objc_msgSend(v28, "language", v44);
                if (![v29 hasPrefix:v21]) {
                  goto LABEL_28;
                }
                unsigned __int8 v30 = [v28 identifier];
                unsigned int v31 = [v30 hasPrefix:v18];

                if (v31) {
                  break;
                }
LABEL_29:
                if (v25 == (id)++v27)
                {
                  id v38 = [v23 countByEnumeratingWithState:&v54 objects:v66 count:16];
                  id v25 = v38;
                  if (v38) {
                    goto LABEL_20;
                  }
                  goto LABEL_40;
                }
              }
              if ([v28 quality] != (char *)&dword_0 + 1)
              {
                if ([v28 quality] == (char *)&dword_0 + 2)
                {
                  uint64_t v34 = [v52 objectForKey:v21];
                  if (!v34
                    || (id v35 = (void *)v34,
                        [v52 objectForKey:v21],
                        id v36 = objc_claimAutoreleasedReturnValue(),
                        unsigned __int8 v37 = [v36 BOOLValue],
                        v36,
                        v35,
                        (v37 & 1) == 0))
                  {
LABEL_37:
                    id v39 = v28;

                    uint64_t v17 = v45;
                    id v16 = v46;
                    uint64_t v40 = v48;
                    uint64_t v19 = v49;
                    uint64_t v41 = v53;
                    if (v39) {
                      goto LABEL_42;
                    }
                    goto LABEL_41;
                  }
                }
                goto LABEL_29;
              }
              unsigned __int8 v32 = [v52 objectForKey:v21];
              unsigned __int8 v33 = [v32 BOOLValue];

              if (v33) {
                goto LABEL_37;
              }
              uint64_t v29 = v53;
              id v53 = v28;
LABEL_28:

              goto LABEL_29;
            }
            id v53 = 0;
LABEL_40:

            uint64_t v17 = v45;
            id v16 = v46;
            uint64_t v40 = v48;
            uint64_t v19 = v49;
            uint64_t v41 = v53;
LABEL_41:
            id v39 = v41;
            uint64_t v41 = v39;
            if (v39)
            {
LABEL_42:
              long long v42 = +[AXSettings sharedInstance];
              uint64_t v43 = [v39 identifier];
              [v42 setSpeechVoiceIdentifier:v43 forLanguage:v40 sourceKey:v44];
            }
          }

          uint64_t v19 = (char *)v19 + 1;
        }
        while (v19 != v16);
        id v16 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
      }
      while (v16);
    }

    CFStringRef v3 = v52;
  }
}

- (void)_whitetailMigrateVoiceSettings
{
  if (([(AccessibilityDataMigrator *)self didUpgrade] & 1) != 0
    || [(AccessibilityDataMigrator *)self inUnitTest])
  {
    CFStringRef v3 = +[NSUserDefaults standardUserDefaults];
    CFStringRef v4 = [v3 objectForKey:@"_AccessibilityMigration_Speech_10.0"];
    unsigned __int8 v5 = [v4 BOOLValue];

    if ((v5 & 1) == 0)
    {
      [(AccessibilityDataMigrator *)self _voiceOverVoiceMigrationWhitetail];
      [(AccessibilityDataMigrator *)self _switchVoiceMigrationWhitetail];
      [(AccessibilityDataMigrator *)self _speechVoiceMigrationWhitetail];
      uint64_t v6 = +[AXSettings sharedInstance];
      [v6 _clearWhitetailMigrationSettings];

      id v7 = +[NSUserDefaults standardUserDefaults];
      [v7 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_Speech_10.0"];
    }
  }
}

- (void)_whitetailMigrateTTYSettings
{
  if (([(AccessibilityDataMigrator *)self didUpgrade] & 1) != 0
    || [(AccessibilityDataMigrator *)self inUnitTest])
  {
    CFStringRef v3 = +[NSUserDefaults standardUserDefaults];
    CFStringRef v4 = [v3 objectForKey:@"_AccessibilityMigration_TTY_10.0"];
    unsigned __int8 v5 = [v4 BOOLValue];

    if ((v5 & 1) == 0)
    {
      id v8 = (id)CFPreferencesCopyValue(@"tty-enabled", @"com.apple.springboard", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
      if (v8)
      {
        uint64_t v6 = +[RTTSettings sharedInstance];
        objc_msgSend(v6, "setTTYHardwareEnabled:", objc_msgSend(v8, "BOOLValue"));

        CFPreferencesSetAppValue(@"tty-enabled", 0, @"com.apple.springboard");
        CFPreferencesAppSynchronize(@"com.apple.springboard");
      }
      id v7 = +[NSUserDefaults standardUserDefaults];
      [v7 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_TTY_10.0"];
    }
  }
}

- (void)_whitetailMigrateDisplayFilterSettings
{
  if (([(AccessibilityDataMigrator *)self didUpgrade] & 1) == 0
    && ![(AccessibilityDataMigrator *)self inUnitTest])
  {
    return;
  }
  CFStringRef v3 = +[NSUserDefaults standardUserDefaults];
  CFStringRef v4 = [v3 objectForKey:@"_AccessibilityMigration_DisplayFilter_10.0"];
  unsigned __int8 v5 = [v4 BOOLValue];

  if (v5) {
    return;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [&off_11BC8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v6)
  {
    CFStringRef v9 = kCFPreferencesCurrentUser;
    CFStringRef v10 = kCFPreferencesAnyHost;
LABEL_14:
    id v13 = (void *)CFPreferencesCopyValue(@"InvertColorsEnabled", kAXSAccessibilityPreferenceDomain, v9, v10);
    uint64_t v14 = (void *)CFPreferencesCopyValue(@"GrayscaleDisplay", kAXSAccessibilityPreferenceDomain, v9, v10);
    id v15 = (void *)CFPreferencesCopyValue(@"ReduceWhitePointEnabled", kAXSAccessibilityPreferenceDomain, v9, v10);
    if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      unsigned int v16 = [v13 BOOLValue];
      if (!v14) {
        goto LABEL_22;
      }
    }
    else
    {
      unsigned int v16 = 0;
      if (!v14) {
        goto LABEL_22;
      }
    }
    if (objc_opt_respondsToSelector())
    {
      unsigned int v17 = [v14 BOOLValue];
      if (!v15) {
        goto LABEL_26;
      }
      goto LABEL_23;
    }
LABEL_22:
    unsigned int v17 = 0;
    if (!v15) {
      goto LABEL_26;
    }
LABEL_23:
    if (objc_opt_respondsToSelector())
    {
      unsigned int v18 = [v15 BOOLValue];
      if (!v16)
      {
LABEL_28:
        if (v17)
        {
          MADisplayFilterPrefSetType();
          MADisplayFilterPrefSetCategoryEnabled();
          if (!v18) {
            goto LABEL_31;
          }
        }
        else if (!v18)
        {
LABEL_31:
          CFPreferencesSetAppValue(@"InvertColorsEnabled", 0, kAXSAccessibilityPreferenceDomain);
          CFPreferencesSetAppValue(@"GrayscaleDisplay", 0, kAXSAccessibilityPreferenceDomain);
          CFPreferencesSetAppValue(@"ReduceWhitePointEnabled", 0, kAXSAccessibilityPreferenceDomain);
          CFPreferencesAppSynchronize(kAXSAccessibilityPreferenceDomain);
          uint64_t v19 = +[NSUserDefaults standardUserDefaults];
          [v19 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_DisplayFilter_10.0"];

          return;
        }
        MADisplayFilterPrefSetType();
        MADisplayFilterPrefSetCategoryEnabled();
        goto LABEL_31;
      }
LABEL_27:
      MADisplayFilterPrefSetType();
      MADisplayFilterPrefSetCategoryEnabled();
      goto LABEL_28;
    }
LABEL_26:
    unsigned int v18 = 0;
    if (!v16) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v21;
  CFStringRef v9 = kCFPreferencesCurrentUser;
  CFStringRef v10 = kCFPreferencesAnyHost;
LABEL_6:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v21 != v8) {
      objc_enumerationMutation(&off_11BC8);
    }
    uint64_t v12 = (void *)CFPreferencesCopyValue(*(CFStringRef *)(*((void *)&v20 + 1) + 8 * v11), @"com.apple.mediaaccessibility", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

    if (v12) {
      break;
    }
    if (v7 == (id)++v11)
    {
      id v7 = [&off_11BC8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
}

- (void)_eagleMigrateBalanceSettingFromCoreAudio
{
  if (![(AccessibilityDataMigrator *)self inUnitTest]
    && [(AccessibilityDataMigrator *)self _isFreshInstall])
  {
    return;
  }
  CFPropertyListRef v3 = CFPreferencesCopyValue(kAXSLeftRightBalancePreference, @"com.apple.coreaudio", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFPropertyListRef v4 = CFPreferencesCopyValue(kAXSLeftRightBalancePreference, kAXSAccessibilityPreferenceDomain, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  unsigned __int8 v5 = v4;
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v3))
    {
      NSLog(@"AX: migrating audio balance value %@ to AX domain", v3);
      CFPreferencesSetAppValue(kAXSLeftRightBalancePreference, v3, kAXSAccessibilityPreferenceDomain);
    }
LABEL_15:
    CFRelease(v3);
    if (!v5) {
      return;
    }
    goto LABEL_10;
  }
  if (v3) {
    goto LABEL_15;
  }
  if (!v4) {
    return;
  }
LABEL_10:

  CFRelease(v5);
}

- (void)_monarchRemoveNavigationDirectionRotorIfNeeded
{
  CFPropertyListRef v3 = +[NSUserDefaults standardUserDefaults];
  CFPropertyListRef v4 = [v3 objectForKey:@"_AccessibilityMigration_RemoveNavigationDirectionRotorIfNeeded_9.0"];
  unsigned __int8 v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0 && [(AccessibilityDataMigrator *)self didUpgrade])
  {
    BOOL v6 = AXLogDataMigrator();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Upgrading navigation direction rotors...", buf, 2u);
    }

    id v7 = +[AXSettings sharedInstance];
    if ((AXIsAnyPreferredLanguageRTL() & 1) == 0
      && [v7 hasExistingValueForPreferenceWithSelector:"voiceOverNavigationDirectionMode"])
    {
      uint64_t v8 = [v7 voiceOverRotorItems];
      id v9 = [v8 indexOfObjectPassingTest:&stru_10578];
      if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v10 = v9;
        uint64_t v11 = [v8 objectAtIndexedSubscript:v9];
        id v12 = [v11 mutableCopy];

        [v12 setObject:&__kCFBooleanFalse forKeyedSubscript:@"Enabled"];
        id v13 = [v8 mutableCopy];
        [v13 setObject:v12 atIndexedSubscript:v10];
        [v7 setVoiceOverRotorItems:v13];
      }
      [v7 clearExistingValueForPreferenceWithSelector:"voiceOverNavigationDirectionMode"];
      uint64_t v14 = AXLogDataMigrator();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v16 = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Upgraded navigation direction rotors", v16, 2u);
      }
    }
    id v15 = +[NSUserDefaults standardUserDefaults];
    [v15 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_RemoveNavigationDirectionRotorIfNeeded_9.0"];
  }
}

- (void)_monarchClearSwitchControlMenuItemVersionPreferences
{
  if (![(AccessibilityDataMigrator *)self _isFreshInstall])
  {
    CFPreferencesSetAppValue(@"DeviceMenuItemsVersion", 0, @"com.apple.Accessibility.SwitchControl");
    CFPreferencesSetAppValue(@"GesturesMenuItemsVersion", 0, @"com.apple.Accessibility.SwitchControl");
    CFPreferencesSetAppValue(@"SettingsMenuItemsVersion", 0, @"com.apple.Accessibility.SwitchControl");
    CFPreferencesSetAppValue(@"TopLevelMenuItemsVersion", 0, @"com.apple.Accessibility.SwitchControl");
    CFPreferencesAppSynchronize(@"com.apple.Accessibility.SwitchControl");
  }
}

- (void)_okemoMigrateBrailleOutputMode
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 hasExistingValueForPreferenceWithSelector:"voiceOverTouchBrailleDisplayOutputMode"];

  if ((v3 & 1) == 0)
  {
    if (_AXSVoiceOverTouchBrailleContractionMode())
    {
      int v4 = _AXSVoiceOverTouchBrailleEightDotMode();
      id v7 = +[AXSettings sharedInstance];
      unsigned __int8 v5 = v7;
      if (v4) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 1;
      }
    }
    else
    {
      unsigned __int8 v5 = +[AXSettings sharedInstance];
      id v7 = v5;
      uint64_t v6 = 3;
    }
    [v5 setVoiceOverTouchBrailleDisplayOutputMode:v6];
  }
}

- (void)_okemoMigrateVoiceOverTypingMode
{
  if (![(AccessibilityDataMigrator *)self _isFreshInstall])
  {
    v2 = (void *)CFPreferencesCopyAppValue(@"TypingMode", kAXSAccessibilityPreferenceDomain);
    if (v2)
    {
      id v3 = v2;
      if (([v2 isEqualToString:@"TypingModeStandard"] & 1) != 0
        || [v3 isEqualToString:@"TypingModeTouchTyping"])
      {
        _AXSVoiceOverTouchSetTypingMode();
      }
      CFPreferencesSetAppValue(@"TypingMode", 0, kAXSAccessibilityPreferenceDomain);
      CFPreferencesAppSynchronize(kAXSAccessibilityPreferenceDomain);
      v2 = v3;
    }
  }
}

- (void)_okemoMigrateVoiceOverGradeTwoAutoTranslate
{
  if (([(AccessibilityDataMigrator *)self didUpgrade] & 1) != 0
    || [(AccessibilityDataMigrator *)self didRestoreFromBackup])
  {
    id v3 = +[AXSettings sharedInstance];
    unsigned __int8 v4 = [v3 hasExistingValueForPreferenceWithSelector:"voiceOverBrailleGradeTwoAutoTranslateEnabled"];

    if ((v4 & 1) == 0)
    {
      id v5 = +[AXSettings sharedInstance];
      [v5 setVoiceOverBrailleGradeTwoAutoTranslateEnabled:1];
    }
  }
}

- (BOOL)inUnitTest
{
  return self->_inUnitTest;
}

- (void)setInUnitTest:(BOOL)a3
{
  self->_inUnitTest = a3;
}

@end