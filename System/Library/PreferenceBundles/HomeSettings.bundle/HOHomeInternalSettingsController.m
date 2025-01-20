@interface HOHomeInternalSettingsController
- (id)createHomeEnergyPreferences;
- (id)gridForecastErrorWithSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)_gridForecastError;
- (void)_resetAccessCodeOnboarding:(id)a3;
- (void)_resetAccessoryFirmwareUpdateOnboarding:(id)a3;
- (void)_resetAnnounceOnboarding:(id)a3;
- (void)_resetCameraRecordingOnboarding:(id)a3;
- (void)_resetHomeEnergyCache:(id)a3;
- (void)_resetHomeTheaterOnboarding:(id)a3;
- (void)_resetIdentifyVoiceOnboarding:(id)a3;
- (void)_resetNaturalLightingOnboarding:(id)a3;
- (void)_resetNeedsRedesignMigration:(id)a3;
- (void)_resetNewFeaturesOnboarding:(id)a3;
- (void)_resetTVViewingProfilesOnboarding:(id)a3;
- (void)_resetUtilityOnboarding:(id)a3;
- (void)_resetWalletKeyExpressModeOnboarding:(id)a3;
- (void)_setGridForecastError:(unint64_t)a3;
- (void)setGridForecastError:(id)a3 withSpecifier:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HOHomeInternalSettingsController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(HOHomeInternalSettingsController *)self reloadSpecifiers];
  v5.receiver = self;
  v5.super_class = (Class)HOHomeInternalSettingsController;
  [(HOHomeInternalSettingsController *)&v5 viewWillAppear:v3];
}

- (id)specifiers
{
  BOOL v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v85 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    objc_super v5 = +[PSSpecifier groupSpecifierWithName:@"General"];
    uint64_t v6 = PSFooterTextGroupKey;
    [v5 setProperty:@"Toggling these settings will kill the Home app." forKey:PSFooterTextGroupKey];
    [v4 addObject:v5];
    v7 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Force Non-Internal Install Behavior" key:HFForceNonInternalInstallBehaviorKey];
    *(void *)&v7[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v7];
    v8 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Hide Quick Controls" key:HFHideQuickControlsKey];

    *(void *)&v8[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v8];
    v9 = +[PSSpecifier groupSpecifierWithName:@"App Onboarding"];

    v10 = +[NSMutableString string];
    [v10 appendString:@"• If \"First Time User\", Home will show the \"Welcome\" screen.\n"];
    [v10 appendString:@"• If \"New features\", Home will show the  \"What's New?\" screen.\n"];
    [v10 appendString:@"• If \"Name migration\", Home will show the \"Name migration\" screen.\n"];
    [v10 appendString:@"• If \"Migrate to Home\", Home will migrate the primary home, if there is one.\n"];
    [v10 appendString:@"\nSee https://confluence.sd.apple.com/x/-jusMg for documentation on how App Onboarding should work."];
    v84 = v10;
    [v9 setProperty:v10 forKey:v6];
    [v4 addObject:v9];
    v11 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Welcome/First Time User" key:HFForceFirstTimeOnboardingKey];

    *(void *)&v11[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v11];
    v12 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"New Features" key:HFForceNewFeaturesOnboardingKey];

    *(void *)&v12[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v12];
    v13 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Migrate User" key:HFForceMigrationOnboardingKey];

    *(void *)&v13[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v13];
    v14 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Show All Tips" key:HFForceTipsOnboardingKey];

    *(void *)&v14[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v14];
    v15 = +[PSSpecifier groupSpecifierWithName:@"Redesign"];

    [v4 addObject:v15];
    v16 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Invert Cell Tap" key:HFInvertCellTapsKey];

    *(void *)&v16[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v16];
    v17 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Wallpaper Transition" key:HFWallpaperTransitionKey];

    *(void *)&v17[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v17];
    v18 = [(HOHomeInternalSettingsController *)self ho_globalEditTextSpecifierWithName:@"Grid Cell Title Label Max Line Count" key:HFGridCellTitleLabelMaxLineCountKey];

    *(void *)&v18[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    *(void *)&v18[OBJC_IVAR___PSSpecifier_textFieldType] = 2;
    [v4 addObject:v18];
    v19 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Hide Banners" key:HFHideBannersKey];

    *(void *)&v19[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v19];
    v20 = +[PSSpecifier groupSpecifierWithName:@"Matter"];

    [v4 addObject:v20];
    v21 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Force Native Matter" key:HFPreferencesForceNativeMatterKey];

    *(void *)&v21[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v21];
    v22 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Force New Accessory Details" key:HFPreferencesForceNewAccessoryDetailsKey];

    *(void *)&v22[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v22];
    v23 = +[PSSpecifier groupSpecifierWithName:@"Feature Onboarding"];

    [v23 setProperty:@"Toggling these settings will kill the Home app." forKey:v6];
    [v4 addObject:v23];
    v24 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Switch Homes Welcome" key:HFForceSwitchHomeWelcomeOnboardingKey];

    *(void *)&v24[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v24];
    v25 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Force 'Owner Must Upgrade'" key:HFForceOwnerMustUpgradeOnboardingKey];

    *(void *)&v25[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v25];
    v26 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Force 'Devices Must Upgrade'" key:HKForceDevicesNeedUpgradeKey];

    *(void *)&v26[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v26];
    v27 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Force 'Natural Lighting Onboarding'" key:HFForceNaturalLightingOnboardingKey];

    *(void *)&v27[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v27];
    v28 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Force 'Safety And Security Onboarding'" key:HFForceSafetyAndSecurityOnboardingKey];

    *(void *)&v28[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v28];
    v29 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Force 'Firmware Update Onboarding'" key:HFForceAccessoryFirmwareUpdateOnboardingKey];

    *(void *)&v29[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v29];
    v30 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Force 'Accessory Analytics Onboarding'" key:HFForceAccessoryAnalyticsOnboardingKey];

    *(void *)&v30[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v30];
    if (_os_feature_enabled_impl())
    {
      uint64_t v31 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Force 'Utility Onboarding'" key:HFForceUtilityOnboardingKey];

      *(void *)(v31 + OBJC_IVAR___PSSpecifier_setter) = "setKillHomeForSpecifierValue:specifier:";
      [v4 addObject:v31];
      v30 = (char *)v31;
    }
    v32 = [(HOHomeInternalSettingsController *)self ho_globalButtonSpecifierWithName:@"Reset Identify Voice Onboarding" selector:"_resetIdentifyVoiceOnboarding:"];

    [v4 addObject:v32];
    v33 = [(HOHomeInternalSettingsController *)self ho_globalButtonSpecifierWithName:@"Reset Announce Onboarding" selector:"_resetAnnounceOnboarding:"];

    [v4 addObject:v33];
    v34 = [(HOHomeInternalSettingsController *)self ho_globalButtonSpecifierWithName:@"Reset Home Theater Onboarding" selector:"_resetHomeTheaterOnboarding:"];

    [v4 addObject:v34];
    v35 = [(HOHomeInternalSettingsController *)self ho_globalButtonSpecifierWithName:@"Reset TV Viewing Profiles Onboarding" selector:"_resetTVViewingProfilesOnboarding:"];

    [v4 addObject:v35];
    v36 = [(HOHomeInternalSettingsController *)self ho_globalButtonSpecifierWithName:@"Reset Natural Lighting Onboarding" selector:"_resetNaturalLightingOnboarding:"];

    [v4 addObject:v36];
    v37 = [(HOHomeInternalSettingsController *)self ho_globalButtonSpecifierWithName:@"Reset Camera Recording Onboarding" selector:"_resetCameraRecordingOnboarding:"];

    [v4 addObject:v37];
    v38 = [(HOHomeInternalSettingsController *)self ho_globalButtonSpecifierWithName:@"Reset Wallet Key Express Mode Onboarding" selector:"_resetWalletKeyExpressModeOnboarding:"];

    [v4 addObject:v38];
    v39 = [(HOHomeInternalSettingsController *)self ho_globalButtonSpecifierWithName:@"Reset Access Code Onboarding" selector:"_resetAccessCodeOnboarding:"];

    [v4 addObject:v39];
    v40 = [(HOHomeInternalSettingsController *)self ho_globalButtonSpecifierWithName:@"Reset Firmware Update Onboarding" selector:"_resetAccessoryFirmwareUpdateOnboarding:"];

    [v4 addObject:v40];
    if (_os_feature_enabled_impl())
    {
      uint64_t v41 = [(HOHomeInternalSettingsController *)self ho_globalButtonSpecifierWithName:@"Reset Utility Onboarding" selector:"_resetUtilityOnboarding:"];

      [v4 addObject:v41];
      v40 = (void *)v41;
    }
    v42 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Use Fake Feature Onboarding Settings" key:HKFakeFeatureOnboardingSettingsKey];

    *(void *)&v42[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v42];
    v43 = +[PSSpecifier groupSpecifierWithName:@"Software Update"];

    [v43 setProperty:@"Toggling these settings will kill the Home app." forKey:v6];
    [v4 addObject:v43];
    v44 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Fake License Version Agreement nil" key:HFPreferencesFakeSoftwareUpdateLicenseAgreementVersionNilKey];

    *(void *)&v44[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v44];
    v45 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Always Show License Agreement" key:HFPreferencesAlwaysShowTermsAndConditionsForSoftwareUpdateKey];

    *(void *)&v45[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v45];
    v46 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Unmark all accepted License Agreements" key:HFPreferencesRemoveAllSoftwareUpdateLicenseVersionsFromHomeKey];

    *(void *)&v46[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v46];
    v47 = [(HOHomeInternalSettingsController *)self createHomeEnergyPreferences];
    [v4 addObjectsFromArray:v47];

    v48 = +[PSSpecifier groupSpecifierWithName:@"WHA"];

    [v48 setProperty:@"Whole House Audio" forKey:v6];
    [v48 setProperty:@"Toggling these settings will kill SpringBoard and the Home app." forKey:v6];
    [v4 addObject:v48];
    v49 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Enable WHA Quick Control" key:HFPreferencesDemoPlaybackControlsKey];

    *(void *)&v49[OBJC_IVAR___PSSpecifier_setter] = "setKillSpringBoardAndHomeForSpecifierValue:specifier:";
    [v4 addObject:v49];
    v50 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Show 'Export Analytics' button" key:HFPreferencesExposeCollectSysdiagnoseButtonForHomePodKey];

    *(void *)&v50[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v4 addObject:v50];
    v51 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Enable Internal Debugging" key:HFPreferencesInternalDebuggingEnabledKey];

    *(void *)&v51[OBJC_IVAR___PSSpecifier_setter] = "setKillSpringBoardAndHomeForSpecifierValue:specifier:";
    [v4 addObject:v51];
    v52 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Enable 'Identify HomePod' Button" key:HFPreferenceIdentifyHomePodButtonEnabledKey];

    *(void *)&v52[OBJC_IVAR___PSSpecifier_setter] = "setKillSpringBoardAndHomeForSpecifierValue:specifier:";
    [v4 addObject:v52];
    v53 = +[PSSpecifier groupSpecifierWithName:@"Performance"];

    [v53 setProperty:@"Performance" forKey:v6];
    [v53 setProperty:@"Toggling this setting will kill SpringBoard and the Home app." forKey:v6];
    [v4 addObject:v53];
    v54 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Enable Reads Complete Tracking" key:HFPreferencesReadsCompleteTrackingKey];

    *(void *)&v54[OBJC_IVAR___PSSpecifier_setter] = "setKillSpringBoardAndHomeForSpecifierValue:specifier:";
    [v4 addObject:v54];
    v55 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Enable Detailed Signpost Logging" key:HFEnableDetailedSignpostLoggingKey];

    *(void *)&v55[OBJC_IVAR___PSSpecifier_setter] = "setKillSpringBoardAndHomeForSpecifierValue:specifier:";
    [v4 addObject:v55];
    v56 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Show Fake Content" key:HFEnableShowFakeContentForPerformanceKey];

    *(void *)&v56[OBJC_IVAR___PSSpecifier_setter] = "setKillSpringBoardAndHomeForSpecifierValue:specifier:";
    [v4 addObject:v56];
    v57 = HFPerformanceUpgradeTitles();
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_8A08;
    v86[3] = &unk_10870;
    id v58 = v4;
    id v87 = v58;
    v88 = self;
    [v57 enumerateKeysAndObjectsUsingBlock:v86];

    v59 = +[PSSpecifier groupSpecifierWithName:@"Demo Mode"];

    [v59 setProperty:@"Demo Mode" forKey:v6];
    [v59 setProperty:@"Toggling these settings will kill the Home app." forKey:v6];
    [v58 addObject:v59];
    v60 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Enable Demo Mode" key:HFEnablePressDemoModeKey];

    *(void *)&v60[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v60];
    v61 = +[PSSpecifier groupSpecifierWithName:@"Errors"];

    [v61 setProperty:@"Errors" forKey:v6];
    [v61 setProperty:@"Toggling this setting will kill the Home App." forKey:v6];
    [v58 addObject:v61];
    v62 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Suppress all errors for demos" key:HFSuppressAllErrorsForDemoKey];

    *(void *)&v62[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v62];
    v63 = +[PSSpecifier groupSpecifierWithName:@"Cameras"];

    [v63 setProperty:@"Cameras" forKey:v6];
    [v63 setProperty:@"Toggling this setting will kill the Home app." forKey:v6];
    [v58 addObject:v63];
    v64 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Purge Poster Frame Image Cache" key:HFPurgePosterFrameCacheOnLoadKey];

    *(void *)&v64[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v64];
    v65 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Purge Video File Cache" key:HFPurgeVideoFileCacheOnLoadKey];

    *(void *)&v65[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v65];
    v66 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Disable Hero Frame Downloads" key:HFDisableHeroFrameDownloadsKey];

    *(void *)&v66[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v66];
    v67 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Enable Internal Views" key:HFEnableCameraInternalViewsKey];

    *(void *)&v67[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v67];
    v68 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Cache Scrubber Time Scale" key:HFShouldCacheScrubberTimeScaleKey];

    *(void *)&v68[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v68];
    v69 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Treat All Clips as Unanalyzed" key:HFTreatAllClipsAsUnanalyzedKey];

    *(void *)&v69[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v69];
    v70 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Mark Cached Video As Green" key:HFMarkCachedVideoAsGreenInTimelineKey];

    *(void *)&v70[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v70];
    v71 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Disable Full Quality Video Caching" key:HFDisableFullQualityVideoCachingKey];

    *(void *)&v71[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v71];
    v72 = +[PSSpecifier groupSpecifierWithName:@"Migration"];

    [v72 setProperty:@"This will silently re-migrate your service names." forKey:v6];
    [v58 addObject:v72];
    v73 = [(HOHomeInternalSettingsController *)self ho_globalButtonSpecifierWithName:@"Force Redesign migration on next launch" selector:"_resetNeedsRedesignMigration:"];

    [v58 addObject:v73];
    v74 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Force Name Migration Again" key:HFForceAccessoryNamingMigrationKey];

    *(void *)&v74[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v74];
    v75 = +[PSSpecifier groupSpecifierWithName:@"Store"];

    [v75 setProperty:@"Toggling any setting will kill the Home app." forKey:v6];
    [v58 addObject:v75];
    v76 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Use Staging URL" key:HFForceStoreUseStagingURLKey];

    *(void *)&v76[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v76];
    v77 = [(HOHomeInternalSettingsController *)self ho_globalEditTextSpecifierWithName:@"Staging URL" key:HFStoreStagingURLStringKey];

    *(void *)&v77[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v77];
    v78 = +[PSSpecifier groupSpecifierWithName:@"Installation Guide"];

    [v78 setProperty:@"Toggling any setting will kill the Home app." forKey:v6];
    [v58 addObject:v78];
    v79 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Use Staging URL" key:HFForceInstallationGuideUseStagingURLKey];

    *(void *)&v79[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v79];
    v80 = [(HOHomeInternalSettingsController *)self ho_globalEditTextSpecifierWithName:@"Staging URL" key:HFStoreInstallationGuideStagingURLStringKey];

    *(void *)&v80[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
    [v58 addObject:v80];
    v81 = *(void **)&self->PSListController_opaque[v85];
    *(void *)&self->PSListController_opaque[v85] = v58;
    id v82 = v58;

    BOOL v3 = *(void **)&self->PSListController_opaque[v85];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HOHomeInternalSettingsController;
  id v4 = [(HOHomeInternalSettingsController *)&v8 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v4 tag] == &dword_8)
  {
    objc_super v5 = [v4 editableTextField];
    [v5 setTextAlignment:2];

    uint64_t v6 = [v4 editableTextField];
    [v6 setReturnKeyType:9];
  }

  return v4;
}

- (void)_resetIdentifyVoiceOnboarding:(id)a3
{
  CFPreferencesSetAppValue(HFResetIdentifyVoiceOnboardingKey, kCFBooleanTrue, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (void)_resetAnnounceOnboarding:(id)a3
{
  CFPreferencesSetAppValue(HFResetAnnounceOnboardingKey, kCFBooleanTrue, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (void)_resetHomeTheaterOnboarding:(id)a3
{
  CFPreferencesSetAppValue(HFResetHomeTheaterOnboardingKey, kCFBooleanTrue, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (void)_resetTVViewingProfilesOnboarding:(id)a3
{
  CFPreferencesSetAppValue(HFResetTVViewingProfilesOnboardingKey, kCFBooleanTrue, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (void)_resetNaturalLightingOnboarding:(id)a3
{
  CFPreferencesSetAppValue(HFResetNaturalLightingOnboardingKey, kCFBooleanTrue, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (void)_resetNewFeaturesOnboarding:(id)a3
{
  CFPreferencesSetAppValue(HFResetHomeTheaterOnboardingKey, kCFBooleanTrue, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (void)_resetCameraRecordingOnboarding:(id)a3
{
  CFPreferencesSetAppValue(HFResetCameraRecordingOnboardingKey, kCFBooleanTrue, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (void)_resetWalletKeyExpressModeOnboarding:(id)a3
{
  CFPreferencesSetAppValue(HFResetWalletKeyExpressModeOnboardingKey, kCFBooleanTrue, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (void)_resetAccessCodeOnboarding:(id)a3
{
  CFPreferencesSetAppValue(HFResetAccessCodeOnboardingKey, kCFBooleanTrue, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (void)_resetAccessoryFirmwareUpdateOnboarding:(id)a3
{
  CFPreferencesSetAppValue(HFResetAccessoryFirmwareUpdateOnboardingKey, kCFBooleanTrue, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (void)_resetUtilityOnboarding:(id)a3
{
  CFPreferencesSetAppValue(HFResetUtilityOnboardingKey, kCFBooleanTrue, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (void)_resetNeedsRedesignMigration:(id)a3
{
  CFPreferencesSetAppValue(HFResetRedesignMigrationKey, kCFBooleanTrue, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (void)_resetHomeEnergyCache:(id)a3
{
  CFPreferencesSetAppValue(HFPreferencesResetHomeEnergyDCache, kCFBooleanTrue, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (void)_setGridForecastError:(unint64_t)a3
{
  CFStringRef v4 = (const __CFString *)HFPreferencesGridForecastError;
  objc_super v5 = +[NSNumber numberWithUnsignedInteger:a3];
  CFPreferencesSetAppValue(v4, v5, HFHomeDomain);

  [(HOHomeInternalSettingsController *)self ho_killHome];
}

- (unint64_t)_gridForecastError
{
  return CFPreferencesGetAppIntegerValue(HFPreferencesGridForecastError, HFHomeDomain, 0);
}

- (id)createHomeEnergyPreferences
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v4 = +[PSSpecifier groupSpecifierWithName:@"Home Energy"];
  objc_super v5 = +[NSMutableString string];
  [v5 appendString:@"Toggling these settings will kill the Home app.\n"];
  [v5 appendString:@"• If toggling energy windows, reset energy cache\n"];
  [v4 setProperty:v5 forKey:PSFooterTextGroupKey];
  [v3 addObject:v4];
  uint64_t v6 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Show Tap-to-Radar in Grid Forecast" key:HFPreferencesTapToRadarForGridForecast domain:HFHomeEnergyUIDomain];
  *(void *)&v6[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
  [v3 addObject:v6];
  v7 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Show Double Pane Energy Forecast" key:HFPreferencesShowDoublePaneEnergyForecastKey];

  *(void *)&v7[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
  [v3 addObject:v7];
  objc_super v8 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Force Show Home Energy Features" key:HFPreferencesForceShowHomeEnergyFeaturesKey];

  *(void *)&v8[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
  [v3 addObject:v8];
  v9 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"No Clean Energy Windows" key:HFPreferencesShowCleanEnergyForecastNoneKey];

  *(void *)&v9[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
  [v3 addObject:v9];
  v10 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Clean Energy Window for 4H" key:HFPreferencesShowCleanEnergyForecastNowKey];

  *(void *)&v10[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
  [v3 addObject:v10];
  v11 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Clean Energy Window soon" key:HFPreferencesShowCleanEnergyForecastSoonKey];

  *(void *)&v11[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
  [v3 addObject:v11];
  v12 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Clean Energy Window in 2H" key:HFPreferencesShowCleanEnergyForecastFutureKey];

  *(void *)&v12[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
  [v3 addObject:v12];
  v13 = [(HOHomeInternalSettingsController *)self ho_globalSwitchSpecifierWithName:@"Past Clean Energy Window" key:HFPreferencesShowCleanEnergyForecastPastKey];

  *(void *)&v13[OBJC_IVAR___PSSpecifier_setter] = "setKillHomeForSpecifierValue:specifier:";
  [v3 addObject:v13];
  v14 = [(HOHomeInternalSettingsController *)self ho_globalButtonSpecifierWithName:@"Reset Energy Cache" selector:"_resetHomeEnergyCache:"];

  [v3 addObject:v14];
  v15 = +[PSSpecifier preferenceSpecifierNamed:@"Grid Forecast Error" target:self set:"setGridForecastError:withSpecifier:" get:"gridForecastErrorWithSpecifier:" detail:objc_opt_class() cell:2 edit:0];

  [v15 setValues:&off_11DA8 titles:&off_11DC0];
  [v3 addObject:v15];

  return v3;
}

- (void)setGridForecastError:(id)a3 withSpecifier:(id)a4
{
  uint64_t v5 = (int)[a3 intValue];

  [(HOHomeInternalSettingsController *)self _setGridForecastError:v5];
}

- (id)gridForecastErrorWithSpecifier:(id)a3
{
  unint64_t v3 = [(HOHomeInternalSettingsController *)self _gridForecastError];

  return +[NSNumber numberWithUnsignedInteger:v3];
}

@end