@interface MusicSettingsController
- (BOOL)cellularHighDataModeEnabled;
- (ICCloudClient)cloudClient;
- (MusicSettingsController)init;
- (MusicSettingsDynamicFooterHyperlinkAction)musicFooterLinkAction;
- (OBBundle)onBoardingBundle;
- (id)accountModificationsAllowed;
- (id)allSpecifiers;
- (id)appCellularDataModificationDisabled;
- (id)cellularDataEnabled;
- (id)cellularDataGroupFooterText;
- (id)cellularDataSettingsEnabled;
- (id)cellularDataStateDescription:(id)a3;
- (id)hasDownloadedMusic;
- (id)hasStarRatings;
- (id)homeSharingSignOutButtonLabel;
- (id)isAutomaticDownloadsEnabled:(id)a3;
- (id)isCloudLibraryEnabled:(id)a3;
- (id)isPurchaseHistoryEnabled:(id)a3;
- (id)isWranglerSupported;
- (id)libraryFooterText;
- (id)listeningHistoryFooterText;
- (id)mliEntryPointFooter;
- (id)mliEntryPointText;
- (id)mliReviewCTA;
- (id)mliReviewTitle;
- (id)motionGroupFooterText;
- (id)musicFooterLinkText;
- (id)musicFooterText;
- (id)musicUsageLinkDetailDescription:(id)a3;
- (id)optimizeStorageStateDescription:(id)a3;
- (id)resetMediaLibraryEnabled;
- (id)sharePlayTogetherDiscoverableEnabled:(id)a3;
- (id)shouldAddFavoriteSongsToMyMusic:(id)a3;
- (id)shouldAddPlaylistSongsToMyMusic:(id)a3;
- (id)shouldShowAURegulatorySection;
- (id)specifiers;
- (id)systemAllowCellularEnabled;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)useListeningHistory:(id)a3;
- (id)valueForMusicCapability:(id)a3;
- (void)_accountStoreChangedNotification:(id)a3;
- (void)_activeAccountChangedNotification:(id)a3;
- (void)_cellularDownloadsAllowedDidChangeNotification:(id)a3;
- (void)_cloudAddToPlaylistBehaviorDidChangeNotification:(id)a3;
- (void)_cloudServiceStatusCloudLibraryEnabledChangedNotification:(id)a3;
- (void)_cloudServiceStatusMatchStatusDidChangeNotification:(id)a3;
- (void)_cloudServiceStatusSubscriptionAvailablilityChangedNotification:(id)a3;
- (void)_cloudServiceStatusSubscriptionStatusChangedNotification:(id)a3;
- (void)_debugTap:(id)a3;
- (void)_determineMLIStatus;
- (void)_internalTap:(id)a3;
- (void)_managedConfigurationEffectiveSettingsDidChangeNotification:(id)a3;
- (void)_privateListeningEnabledDidChangeNotification:(id)a3;
- (void)_reloadAccountStatus;
- (void)_resetMLIStatus;
- (void)_storefrontDidChangeNotification:(id)a3;
- (void)appleMusicSubscribe:(id)a3;
- (void)dealloc;
- (void)homeSharingSignInButtonAction:(id)a3;
- (void)homeSharingSignOutButtonAction:(id)a3;
- (void)mliEntryPointClicked:(id)a3;
- (void)mliReviewClicked:(id)a3;
- (void)resetLibrary:(id)a3;
- (void)setAutomaticDownloadsEnabled:(id)a3 specifier:(id)a4;
- (void)setCloudLibraryEnabled:(id)a3 specifier:(id)a4;
- (void)setEQ:(id)a3 specifier:(id)a4;
- (void)setMusicFooterLinkAction:(id)a3;
- (void)setPurchaseHistoryEnabled:(id)a3 specifier:(id)a4;
- (void)setSharePlayTogetherDiscoverableEnabled:(id)a3 specifier:(id)a4;
- (void)setShouldAddFavoriteSongsToMyMusic:(id)a3 specifier:(id)a4;
- (void)setShouldAddPlaylistSongsToMyMusic:(id)a3 specifier:(id)a4;
- (void)setUseListeningHistory:(id)a3 specifier:(id)a4;
- (void)showAURegulatoryWebPage:(id)a3;
- (void)showPrivacySplashSheet:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MusicSettingsController

- (MusicSettingsController)init
{
  v97.receiver = self;
  v97.super_class = (Class)MusicSettingsController;
  v2 = [(MusicSettingsController *)&v97 init];
  if (v2)
  {
    +[MPMediaQuery setFilteringDisabled:1];
    v3 = +[MPMediaLibrary deviceMediaLibrary];
    [v3 setCloudFilteringType:1];

    +[MPCloudController migrateCellularDataPreferencesIfNeeded];
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_accountStoreChangedNotification:" name:ICUserIdentityStoreDidChangeNotification object:0];
    [v4 addObserver:v2 selector:"_activeAccountChangedNotification:" name:ICActiveUserIdentityDidChangeNotification object:0];
    [v4 addObserver:v2 selector:"_cloudServiceStatusMatchStatusDidChangeNotification:" name:MPCloudServiceStatusControllerMatchStatusDidChangeNotification object:0];
    [v4 addObserver:v2 selector:"_cloudServiceStatusCloudLibraryEnabledChangedNotification:" name:MPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification object:0];
    [v4 addObserver:v2 selector:"_cloudServiceStatusSubscriptionAvailablilityChangedNotification:" name:MPCloudServiceStatusControllerSubscriptionAvailabilityDidChangeNotification object:0];
    [v4 addObserver:v2 selector:"_cloudServiceStatusSubscriptionStatusChangedNotification:" name:MPCloudServiceStatusControllerSubscriptionStatusDidChangeNotification object:0];
    [v4 addObserver:v2 selector:"_cloudAddToPlaylistBehaviorDidChangeNotification:" name:MPCloudControllerCloudAddToPlaylistBehaviorDidChangeNotification object:0];
    [v4 addObserver:v2 selector:"_managedConfigurationEffectiveSettingsDidChangeNotification:" name:MCEffectiveSettingsChangedNotification object:0];
    [v4 addObserver:v2 selector:"_cellularDownloadsAllowedDidChangeNotification:" name:MPNetworkObserverIsMusicCellularDownloadsAllowedDidChangeNotification object:0];
    [v4 addObserver:v2 selector:"_storefrontDidChangeNotification:" name:@"com.apple.StoreServices.StoreFrontChanged" object:0];
    v94 = v4;
    [v4 addObserver:v2 selector:"_willEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
    v5 = +[NSDistributedNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_privateListeningEnabledDidChangeNotification:" name:MPPlaybackUserDefaultsPrivateListeningEnabledDidChangeNotification object:0];

    id v6 = +[ICEnvironmentMonitor sharedMonitor];
    v7 = +[MPCloudServiceStatusController sharedController];
    [v7 beginObservingMatchStatus];
    v95 = v7;
    [v7 beginObservingCloudLibraryEnabled];
    v8 = (PSSystemPolicyForApp *)[objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.Music"];
    appPolicy = v2->_appPolicy;
    v2->_appPolicy = v8;

    [(PSSystemPolicyForApp *)v2->_appPolicy setDelegate:v2];
    v10 = (ICCloudClient *)objc_alloc_init((Class)ICCloudClient);
    cloudClient = v2->_cloudClient;
    v2->_cloudClient = v10;

    v12 = objc_alloc_init(MusicSettingsCellularDataController);
    cellularDataController = v2->_cellularDataController;
    v2->_cellularDataController = v12;

    [(MusicSettingsCellularDataController *)v2->_cellularDataController setParentController:v2];
    v14 = [(MusicSettingsController *)v2 loadSpecifiersFromPlistName:@"MusicSettings" target:v2];
    id v15 = [v14 mutableCopy];

    v16 = (char *)[v15 indexOfSpecifierWithID:@"com.apple.Music:ResetLibrary"];
    v17 = [(MusicSettingsController *)v2 loadSpecifiersFromPlistName:@"MusicSettings-MLI" target:v2];
    v18 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v16 + 1, [v17 count]);
    v93 = v17;
    [v15 insertObjects:v17 atIndexes:v18];

    v19 = [(PSSystemPolicyForApp *)v2->_appPolicy specifiersForPolicyOptions:8421377 force:0];
    id v20 = [v19 mutableCopy];

    if ([(MusicSettingsCellularDataController *)v2->_cellularDataController cellularSettingsAvailable])
    {
      v21 = [v20 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v23 = [v20 firstObject];
        v24 = [v23 properties];
        id v25 = [v24 mutableCopy];

        [v25 setValue:@"cellularDataGroupFooterText" forKey:@"musicDynamicFooterText"];
        [v23 setProperties:v25];
      }
    }
    if ([v20 count])
    {
      v26 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v20 count]);
      [v15 insertObjects:v20 atIndexes:v26];
    }
    v92 = v20;
    id v27 = objc_alloc((Class)NSBundle);
    v28 = MSVSystemRootDirectory();
    v100[0] = v28;
    v100[1] = @"System";
    v100[2] = @"Library";
    v100[3] = @"UsageBundles";
    v100[4] = @"MusicUsage.bundle";
    v29 = +[NSArray arrayWithObjects:v100 count:5];
    v30 = +[NSURL fileURLWithPathComponents:v29];
    id v31 = [v27 initWithURL:v30];

    v91 = v31;
    v32 = (PSStorageReporting *)objc_alloc_init((Class)[v31 principalClass]);
    storageReporter = v2->_storageReporter;
    v2->_storageReporter = v32;

    v34 = [(PSStorageReporting *)v2->_storageReporter usageBundleApps];
    uint64_t v35 = [v34 firstObject];
    musicUsageBundle = v2->_musicUsageBundle;
    v2->_musicUsageBundle = (PSUsageBundleApp *)v35;

    [(PSUsageBundleApp *)v2->_musicUsageBundle setUsageBundleStorageReporter:v2->_storageReporter];
    v37 = [v15 specifierForID:@"com.apple.Music:MusicUsageLink"];
    [v37 setProperty:v2->_musicUsageBundle forKey:PSUsageBundleAppKey];
    v90 = v37;
    objc_msgSend(v37, "setDetailControllerClass:", -[PSStorageReporting usageDetailControllerClassForUsageBundleApp:](v2->_storageReporter, "usageDetailControllerClassForUsageBundleApp:", v2->_musicUsageBundle));
    v38 = [v15 specifierForID:@"com.apple.Music:EQ"];
    v39 = +[MPPlaybackEQSetting allSettings];
    v40 = [v39 sortedArrayUsingComparator:&stru_18880];

    v41 = [v40 valueForKeyPath:@"name"];
    v88 = v40;
    v42 = [v40 valueForKeyPath:@"localizedName"];
    v89 = v38;
    [v38 setValues:v41 titles:v42];

    uint64_t v43 = [v15 specifierForID:@"com.apple.Music:motionMode"];
    v44 = +[NSBundle bundleForClass:objc_opt_class()];
    v96 = v15;
    v45 = [v44 localizedStringForKey:@"MOTION_VALUES_ON" value:&stru_18CF0 table:@"MusicSettings"];
    v99[0] = v45;
    v46 = +[ICDeviceInfo currentDeviceInfo];
    unsigned int v47 = [v46 hasWAPICapability];
    v48 = +[NSBundle bundleForClass:objc_opt_class()];
    v49 = v48;
    if (v47) {
      CFStringRef v50 = @"MOTION_VALUES_WLAN_ONLY";
    }
    else {
      CFStringRef v50 = @"MOTION_VALUES_WIFI_ONLY";
    }
    v51 = [v48 localizedStringForKey:v50 value:&stru_18CF0 table:@"MusicSettings"];
    v99[1] = v51;
    v52 = +[NSBundle bundleForClass:objc_opt_class()];
    v53 = [v52 localizedStringForKey:@"MOTION_VALUES_OFF" value:&stru_18CF0 table:@"MusicSettings"];
    v99[2] = v53;
    v54 = +[NSArray arrayWithObjects:v99 count:3];
    v87 = (void *)v43;
    v55 = (void *)v43;
    v56 = v96;
    [v55 setValues:&off_1A9B0 titles:v54];

    uint64_t v57 = +[OBBundle bundleWithIdentifier:@"com.apple.onboarding.applemusic"];
    onBoardingBundle = v2->_onBoardingBundle;
    v2->_onBoardingBundle = (OBBundle *)v57;

    v59 = +[UIDevice currentDevice];
    LODWORD(v52) = objc_msgSend(v59, "sf_isInternalInstall");

    if (v52)
    {
      v60 = +[NSMutableArray array];
      v61 = +[PSSpecifier groupSpecifierWithID:@"com.apple.Music:InternalGroup" name:@"Apple Internal"];
      uint64_t v62 = MusicSettingsRequiredCapabilitiesKey;
      [v61 setProperty:&off_1A9C8 forKey:MusicSettingsRequiredCapabilitiesKey];
      v86 = v61;
      v63 = v61;
      uint64_t v64 = v62;
      [v60 addObject:v63];
      v65 = MSVSystemRootDirectory();
      v98[0] = v65;
      v98[1] = @"AppleInternal";
      v98[2] = @"Library";
      v98[3] = @"PreferenceBundles";
      v66 = +[NSArray arrayWithObjects:v98 count:4];

      v67 = [v66 arrayByAddingObject:@"FeatureEnablerInternalSettings.bundle"];
      v68 = +[NSURL fileURLWithPathComponents:v67];
      v69 = +[NSBundle bundleWithURL:v68];

      v70 = v69;
      if (v69)
      {
        v71 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", @"AMP Feature Enabler", 0, 0, 0, [v69 principalClass], 1, 0);
        [v71 setProperty:@"com.apple.Music:InternalFeatureEnablerSettings" forKey:PSIDKey];
        [v71 setProperty:&off_1A9E0 forKey:v64];
        [v60 addObject:v71];
      }
      v85 = v70;
      v72 = [v66 arrayByAddingObject:@"MediaLibraryInternalSettings.bundle"];
      v73 = +[NSURL fileURLWithPathComponents:v72];
      v74 = +[NSBundle bundleWithURL:v73];

      if (v74)
      {
        v75 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", @"Media Library", 0, 0, 0, [v74 principalClass], 1, 0);
        [v75 setProperty:@"com.apple.Music:InternalMediaLibrarySettings" forKey:PSIDKey];
        [v75 setProperty:&off_1A9F8 forKey:v64];
        [v60 addObject:v75];
      }
      v76 = [v66 arrayByAddingObject:@"MediaPlaybackInternalSettings.bundle"];
      v77 = +[NSURL fileURLWithPathComponents:v76];
      v78 = +[NSBundle bundleWithURL:v77];

      if (v78)
      {
        v79 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", @"Media Playback", 0, 0, 0, [v78 principalClass], 1, 0);
        [v79 setProperty:@"com.apple.Music:InternalMediaPlaybackSettings" forKey:PSIDKey];
        [v79 setProperty:&off_1AA10 forKey:v64];
        [v60 addObject:v79];
      }
      v80 = [v66 arrayByAddingObject:@"MusicInternalSettings.bundle"];
      v81 = +[NSURL fileURLWithPathComponents:v80];
      v82 = +[NSBundle bundleWithURL:v81];

      if (v82)
      {
        v83 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", @"Music", 0, 0, 0, [v82 principalClass], 1, 0);
        [v83 setProperty:@"com.apple.Music:InternalMusicSettings" forKey:PSIDKey];
        [v83 setProperty:&off_1AA28 forKey:v64];
        [v60 addObject:v83];
      }
      v56 = v96;
      [v96 addObjectsFromArray:v60];
    }
    [(MusicSettingsController *)v2 setAllSpecifiers:v56];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = +[MPCloudServiceStatusController sharedController];
  [v4 endObservingMatchStatus];
  [v4 endObservingCloudLibraryEnabled];
  [v3 removeObserver:self name:ICUserIdentityStoreDidChangeNotification object:0];
  [v3 removeObserver:self name:ICActiveUserIdentityDidChangeNotification object:0];
  [v3 removeObserver:self name:MPCloudServiceStatusControllerMatchStatusDidChangeNotification object:0];
  [v3 removeObserver:self name:MPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification object:0];
  [v3 removeObserver:self name:MPCloudServiceStatusControllerSubscriptionAvailabilityDidChangeNotification object:0];
  [v3 removeObserver:self name:MPCloudServiceStatusControllerSubscriptionStatusDidChangeNotification object:0];
  [v3 removeObserver:self name:MPCloudControllerCloudAddToPlaylistBehaviorDidChangeNotification object:0];
  [v3 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)MusicSettingsController;
  [(MusicSettingsController *)&v5 dealloc];
}

- (id)valueForMusicCapability:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"userWantsLosslessDownloads"])
  {
    objc_super v5 = +[MPPlaybackUserDefaults standardUserDefaults];
    id v6 = (char *)[v5 preferredMusicDownloadResolution];

    BOOL v8 = v6 == (unsigned char *)&loc_BB7C + 4 || v6 == (char *)192000;
    uint64_t v9 = +[NSNumber numberWithInt:v8];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"showInternalSettings"])
  {
    uint64_t showInternalSettings = self->_showInternalSettings;
LABEL_14:
    uint64_t v9 = +[NSNumber numberWithBool:showInternalSettings];
LABEL_15:
    v11 = (void *)v9;
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"atfwatlFeatureOn"]
    || [v4 isEqualToString:@"crossFadeFeatureOn"])
  {
    uint64_t showInternalSettings = _os_feature_enabled_impl();
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"crossFadeEnabled"])
  {
    v13 = +[MPPlaybackUserDefaults standardUserDefaults];
    v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 isCrossFadeEnabled]);

    goto LABEL_16;
  }
  uint64_t v14 = *(void *)&self->_accountStatus.isSignedIn;
  uint64_t v15 = *(unsigned __int16 *)&self->_accountStatus.isMLIEnabled;
  uint64_t v16 = *(unsigned int *)&self->_accountStatus.isManagedAppleID;
  id v17 = v4;
  if ([v17 isEqualToString:@"isSignedIn"]) {
    goto LABEL_22;
  }
  if ([v17 isEqualToString:@"isSignedInToHomeSharing"])
  {
LABEL_24:
    uint64_t v18 = v14 & 0x100;
    goto LABEL_37;
  }
  if ([v17 isEqualToString:@"isMatchSubscribed"]) {
    goto LABEL_26;
  }
  if ([v17 isEqualToString:@"isSubscribed"])
  {
LABEL_28:
    uint64_t v18 = v14 & 0x1000000;
    goto LABEL_37;
  }
  if ([v17 isEqualToString:@"isFullCatalogPlaybackCapable"]) {
    goto LABEL_30;
  }
  if ([v17 isEqualToString:@"isSubscriptionAvailable"])
  {
LABEL_32:
    uint64_t v18 = v14 & 0x10000000000;
    goto LABEL_37;
  }
  if ([v17 isEqualToString:@"isCloudLibraryEnabled"])
  {
    uint64_t v18 = v14 & 0x1000000000000;
  }
  else
  {
    if (![v17 isEqualToString:@"isShowingCloudLibrary"])
    {
      uint64_t v14 = v16 | (v15 << 32);
      if ([v17 isEqualToString:@"isManagedAppleID"])
      {
LABEL_22:
        uint64_t v18 = v14 & 1;
        goto LABEL_37;
      }
      if ([v17 isEqualToString:@"isDownloadSectionVisible"]) {
        goto LABEL_24;
      }
      if ([v17 isEqualToString:@"isEnhancedAudioAvailable"])
      {
LABEL_26:
        uint64_t v18 = v14 & 0x10000;
        goto LABEL_37;
      }
      if ([v17 isEqualToString:@"isAuthTokenRequiredForPlayback"]) {
        goto LABEL_28;
      }
      if ([v17 isEqualToString:@"isMLIEnabled"])
      {
LABEL_30:
        uint64_t v18 = v14 & 0x100000000;
        goto LABEL_37;
      }
      if (([v17 isEqualToString:@"isMLIReviewEnabled"] & 1) == 0)
      {

        goto LABEL_38;
      }
      goto LABEL_32;
    }
    uint64_t v18 = v14 & 0x100000000000000;
  }
LABEL_37:
  v11 = +[NSNumber numberWithBool:v18 != 0];

  if (!v11)
  {
LABEL_38:
    v19.receiver = self;
    v19.super_class = (Class)MusicSettingsController;
    uint64_t v9 = [(MusicSettingsController *)&v19 valueForMusicCapability:v17];
    goto LABEL_15;
  }
LABEL_16:

  return v11;
}

- (id)allSpecifiers
{
  v71.receiver = self;
  v71.super_class = (Class)MusicSettingsController;
  v3 = [(MusicSettingsController *)&v71 allSpecifiers];
  if (MSVDeviceOSIsInternalInstall() && self->_showInternalSettings)
  {
    v49 = v3;
    if (qword_1E648 != -1) {
      dispatch_once(&qword_1E648, &stru_188A0);
    }
    id v4 = +[NSMutableArray arrayWithCapacity:12];
    id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.Music" allowPlaceholder:1 error:0];
    id v6 = +[PSSpecifier groupSpecifierWithName:@"Versions"];
    v7 = [v5 exactBundleVersion];
    uint64_t v53 = PSFooterTextGroupKey;
    objc_msgSend(v6, "setProperty:forKey:", v7);

    [v4 addObject:v6];
    BOOL v8 = [v5 machOUUIDs];
    uint64_t v9 = [v8 firstObject];
    v10 = [v9 UUIDString];

    v11 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", @"Music", v10, 0, 0);
    uint64_t v12 = objc_opt_class();
    uint64_t v58 = PSCellClassKey;
    objc_msgSend(v11, "setProperty:forKey:", v12);
    [v11 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
    [v11 setProperty:@"com.apple.Music" forKey:PSLazyIconAppID];
    uint64_t v57 = PSCopyableCellKey;
    objc_msgSend(v11, "setProperty:forKey:", &__kCFBooleanTrue);
    [v11 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    [v11 setProperty:v10 forKey:@"UUID"];
    v13 = v4;
    [v4 addObject:v11];

    uint64_t v14 = MSVProcessCopyMediaFrameworksDescriptions();
    uint64_t v15 = +[MSVDefaultDictionary dictionaryWithDefaultValue:&stru_188E0];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v16 = v14;
    id v17 = [v16 countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v68;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v68 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          uint64_t v22 = [v21 version];
          v23 = (void *)v22;
          if (v22) {
            v24 = (__CFString *)v22;
          }
          else {
            v24 = @"(null)";
          }
          id v25 = v24;

          v26 = [v15 objectForKeyedSubscript:v25];

          [v26 addObject:v21];
        }
        id v18 = [v16 countByEnumeratingWithState:&v67 objects:v74 count:16];
      }
      while (v18);
    }
    v48 = v16;

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v27 = [v15 allKeys];
    v28 = [v27 sortedArrayUsingSelector:"compare:"];

    id obj = v28;
    id v54 = [v28 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v54)
    {
      uint64_t v51 = *(void *)v64;
      v52 = v15;
      uint64_t v29 = PSIconImageKey;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v64 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v56 = v30;
          uint64_t v31 = *(void *)(*((void *)&v63 + 1) + 8 * v30);
          v32 = +[PSSpecifier emptyGroupSpecifier];
          [v32 setProperty:v31 forKey:v53];
          v55 = v32;
          [v13 addObject:v32];
          v33 = [v15 objectForKeyedSubscript:v31];
          v34 = [v33 sortedArrayUsingComparator:&stru_18920];

          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v35 = v34;
          id v36 = [v35 countByEnumeratingWithState:&v59 objects:v72 count:16];
          if (v36)
          {
            id v37 = v36;
            uint64_t v38 = *(void *)v60;
            do
            {
              for (j = 0; j != v37; j = (char *)j + 1)
              {
                if (*(void *)v60 != v38) {
                  objc_enumerationMutation(v35);
                }
                v40 = *(void **)(*((void *)&v59 + 1) + 8 * (void)j);
                v41 = [v40 uuid];
                v42 = [v41 UUIDString];

                uint64_t v43 = [v40 name];
                v44 = +[PSSpecifier preferenceSpecifierNamed:v43 target:v42 set:0 get:"lowercaseString" detail:0 cell:-1 edit:0];

                [v44 setProperty:objc_opt_class() forKey:v58];
                v45 = +[UIImage systemImageNamed:@"square.stack.3d.up.fill"];
                [v44 setProperty:v45 forKey:v29];

                [v44 setProperty:&__kCFBooleanTrue forKey:v57];
                [v44 setProperty:v42 forKey:@"UUID"];
                [v13 addObject:v44];
              }
              id v37 = [v35 countByEnumeratingWithState:&v59 objects:v72 count:16];
            }
            while (v37);
          }

          uint64_t v30 = v56 + 1;
          uint64_t v15 = v52;
        }
        while ((id)(v56 + 1) != v54);
        id v54 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v54);
    }

    uint64_t v46 = [v49 arrayByAddingObjectsFromArray:v13];

    v3 = (void *)v46;
  }

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->MusicSettingsListViewController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    [(MusicSettingsController *)self _reloadAccountStatus];
    v8.receiver = self;
    v8.super_class = (Class)MusicSettingsController;
    uint64_t v5 = [(MusicSettingsController *)&v8 specifiers];
    id v6 = *(void **)&self->MusicSettingsListViewController_opaque[v3];
    *(void *)&self->MusicSettingsListViewController_opaque[v3] = v5;

    [(MusicSettingsController *)self setSpecifierID:@"Music"];
    id v4 = *(void **)&self->MusicSettingsListViewController_opaque[v3];
  }

  return v4;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)MusicSettingsController;
  [(MusicSettingsController *)&v10 viewDidLoad];
  uint64_t v3 = [(MusicSettingsController *)self table];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"com.apple.Music:CrossFadeDurationSlider"];

  id v4 = +[UIDevice currentDevice];
  unsigned int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
  {
    id v6 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_internalTap:"];
    [v6 setNumberOfTapsRequired:2];
    v7 = [(MusicSettingsController *)self view];
    [v7 addGestureRecognizer:v6];

    id v8 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_debugTap:"];
    [v8 setNumberOfTapsRequired:3];
    uint64_t v9 = [(MusicSettingsController *)self view];
    [v9 addGestureRecognizer:v8];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MusicSettingsController;
  [(MusicSettingsController *)&v4 viewWillAppear:a3];
  if (self->_needsUpdateOnAppear)
  {
    [(MusicSettingsController *)self updateVisibleSpecifiers];
    self->_needsUpdateOnAppear = 0;
  }
  [(MusicSettingsController *)self _determineMLIStatus];
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MusicSettingsController;
  [(MusicSettingsController *)&v16 viewDidAppear:a3];
  objc_super v4 = +[NSURL URLWithString:@"prefs:root=MUSIC"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  id v6 = +[NSLocale currentLocale];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"APPS" table:@"MusicSettings" locale:v6 bundleURL:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  v11 = +[NSLocale currentLocale];
  uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"MUSIC" table:@"MusicSettings" locale:v11 bundleURL:v13];

  id v17 = v9;
  uint64_t v15 = +[NSArray arrayWithObjects:&v17 count:1];
  [(MusicSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.Music" title:v14 localizedNavigationComponents:v15 deepLink:v4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MusicSettingsController *)self specifierAtIndexPath:v7];
  id v9 = [v8 identifier];
  unsigned int v10 = [v9 isEqualToString:@"com.apple.Music:CrossFadeDurationSlider"];

  if (v10)
  {
    v11 = [v8 identifier];
    uint64_t v12 = [v6 dequeueReusableCellWithIdentifier:v11 forIndexPath:v7];

    [v12 setupWithSpeficier:v8];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MusicSettingsController;
    uint64_t v12 = [(MusicSettingsController *)&v14 tableView:v6 cellForRowAtIndexPath:v7];
  }

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MusicSettingsController *)self specifierAtIndexPath:v6];
  id v9 = [v8 identifier];
  unsigned int v10 = [v9 isEqualToString:@"com.apple.Music:MusicUsageLink"];

  if (v10) {
    self->_needsUpdateOnAppear = 1;
  }
  v11.receiver = self;
  v11.super_class = (Class)MusicSettingsController;
  [(MusicSettingsController *)&v11 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (void)setEQ:(id)a3 specifier:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [(MusicSettingsController *)self rootController];
  id v8 = v7;
  if (!v7) {
    id v7 = self;
  }
  id v9 = [v7 readPreferenceValue:v6];

  unsigned int v10 = +[MPPlaybackEQSetting settingWithName:v9];
  objc_super v11 = +[MPPlaybackEQSetting settingWithName:v19];
  if (v9)
  {
    id v12 = v9;
    if (v12 == v19)
    {

      goto LABEL_12;
    }
    v13 = v12;
    unsigned __int8 v14 = objc_msgSend(v12, "isEqual:");

    if (v14) {
      goto LABEL_12;
    }
  }
  uint64_t v15 = (char *)[v11 preset];
  if ([v10 preset] == &stru_68.segname[2] || v15 == &stru_68.segname[2])
  {
    CFPreferencesSetAppValue(@"latenightmode", +[NSNumber numberWithBool:v15 == &stru_68.segname[2]], @"com.apple.preferences-sounds");
    CFPreferencesAppSynchronize(@"com.apple.preferences-sounds");
    if (self->_lateNightModeTokenIsValid
      || (uint32_t v16 = notify_register_check("com.apple.mobilemusicsettings.latenightmode", &self->_lateNightModeToken),
          self->_lateNightModeTokenIsValid = v16 == 0,
          !v16))
    {
      notify_set_state(self->_lateNightModeToken, v15 == &stru_68.segname[2]);
      notify_post("com.apple.mobilemusicsettings.latenightmode");
    }
  }
LABEL_12:
  id v17 = [(MusicSettingsController *)self rootController];
  id v18 = v17;
  if (!v17) {
    id v17 = self;
  }
  [v17 setPreferenceValue:v19 specifier:v6];
}

- (id)isPurchaseHistoryEnabled:(id)a3
{
  uint64_t v3 = [(ICCloudClient *)self->_cloudClient isMediaKindDisabledForJaliscoLibrary:1] ^ 1;

  return +[NSNumber numberWithInt:v3];
}

- (void)setPurchaseHistoryEnabled:(id)a3 specifier:(id)a4
{
  unsigned int v5 = [a3 BOOLValue];
  cloudClient = self->_cloudClient;
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_9D44;
    v8[3] = &unk_18948;
    v8[4] = self;
    [(ICCloudClient *)cloudClient enableCloudLibraryWithPolicy:0 startInitialImport:1 completionHandler:v8];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_9DC4;
    v7[3] = &unk_18948;
    v7[4] = self;
    [(ICCloudClient *)cloudClient disableCloudLibraryWithReason:-1 completionHandler:v7];
  }
}

- (id)isCloudLibraryEnabled:(id)a3
{
  return +[NSNumber numberWithBool:self->_accountStatus.isCloudLibraryEnabled];
}

- (void)setCloudLibraryEnabled:(id)a3 specifier:(id)a4
{
  id v78 = a3;
  id v77 = a4;
  id v6 = +[ICEnvironmentMonitor sharedMonitor];
  [v6 networkType];

  id v7 = +[UIDevice currentDevice];
  unsigned int v8 = objc_msgSend(v7, "sf_isChinaRegionCellularDevice");

  cellularDataController = self->_cellularDataController;
  if (v8)
  {
    unsigned __int8 v10 = [(MusicSettingsCellularDataController *)cellularDataController wifiDataEnabled];
    unsigned __int8 v11 = [(MusicSettingsCellularDataController *)self->_cellularDataController cellularDataEnabled];
    if ((v10 & 1) != 0 || !ICEnvironmentNetworkTypeIsWiFi())
    {
      if ((v11 & 1) != 0 || !ICEnvironmentNetworkTypeIsCellular()) {
        goto LABEL_13;
      }
      id v12 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v13 = [v12 localizedStringForKey:@"ENABLE_SYNC_LIBRARY_FAILED_BODY_WLAN_ON" value:&stru_18CF0 table:@"MusicSettings"];
    }
    else
    {
      id v12 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v13 = [v12 localizedStringForKey:@"ENABLE_SYNC_LIBRARY_FAILED_BODY_WLAN_OFF" value:&stru_18CF0 table:@"MusicSettings"];
    }
  }
  else
  {
    if ([(MusicSettingsCellularDataController *)cellularDataController cellularDataEnabled]
      || !ICEnvironmentNetworkTypeIsCellular())
    {
      goto LABEL_13;
    }
    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"ENABLE_SYNC_LIBRARY_FAILED_BODY_WIFI" value:&stru_18CF0 table:@"MusicSettings"];
  }
  unsigned __int8 v14 = (void *)v13;

  if (v14)
  {
    uint64_t v15 = +[NSBundle bundleForClass:objc_opt_class()];
    uint32_t v16 = [v15 localizedStringForKey:@"ENABLE_SYNC_LIBRARY_FAILED_TITLE" value:&stru_18CF0 table:@"MusicSettings"];
    id v17 = +[UIAlertController alertControllerWithTitle:v16 message:v14 preferredStyle:1];

    id v18 = +[NSBundle bundleForClass:objc_opt_class()];
    id v19 = [v18 localizedStringForKey:@"OK" value:&stru_18CF0 table:@"MusicSettings"];
    id v20 = +[UIAlertAction actionWithTitle:v19 style:0 handler:0];
    [v17 addAction:v20];

    [(MusicSettingsController *)self presentViewController:v17 animated:1 completion:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_AD30;
    block[3] = &unk_186F8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    goto LABEL_34;
  }
LABEL_13:
  if (![v78 BOOLValue])
  {
    id v35 = +[MPMediaQuery songsQuery];
    [v35 setIgnoreSystemFilterPredicates:1];
    id v36 = +[MPMediaPropertyPredicate predicateWithValue:&off_1A920 forProperty:MPMediaItemPropertyStoreSagaID comparisonType:100];
    v94[0] = v36;
    id v37 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanFalse forProperty:MPMediaItemPropertyHasNonPurgeableAsset];
    v94[1] = v37;
    uint64_t v38 = +[NSArray arrayWithObjects:v94 count:2];
    v39 = +[MPMediaCompoundAllPredicate predicateMatchingPredicates:v38];
    v95[0] = v39;
    v40 = +[MPMediaPropertyPredicate predicateWithValue:&off_1A938 forProperty:MPMediaItemPropertyStoreAssetProtectionType];
    v95[1] = v40;
    v41 = +[NSArray arrayWithObjects:v95 count:2];
    v42 = +[MPMediaCompoundAnyPredicate predicateMatchingPredicates:v41];
    [v35 addFilterPredicate:v42];

    LODWORD(v41) = [v35 _hasItems];
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_B064;
    v83[3] = &unk_186F8;
    v83[4] = self;
    uint64_t v43 = objc_retainBlock(v83);
    v44 = v43;
    if (!v41)
    {
      ((void (*)(void *))v43[2])(v43);
LABEL_33:

      goto LABEL_34;
    }
    v45 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v46 = [v45 localizedStringForKey:@"DISABLE_SYNC_LIBRARY_SUB_AND_MATCH" value:&stru_18CF0 table:@"MusicSettings"];

    if (self->_accountStatus.isMatchSubscribed)
    {
      if (self->_accountStatus.isSubscribed)
      {
        v75 = v46;
LABEL_32:
        long long v64 = +[NSBundle bundleForClass:objc_opt_class()];
        long long v65 = [v64 localizedStringForKey:@"DISABLE_SYNC_LIBRARY" value:&stru_18CF0 table:@"MusicSettings"];
        long long v66 = +[UIDevice currentDevice];
        long long v67 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v65, v75, objc_msgSend(v66, "sf_isiPad"));

        long long v68 = +[NSBundle bundleForClass:objc_opt_class()];
        long long v69 = [v68 localizedStringForKey:@"TURN_OFF" value:&stru_18CF0 table:@"MusicSettings"];
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472;
        v81[2] = sub_B164;
        v81[3] = &unk_18658;
        id v82 = v44;
        long long v70 = +[UIAlertAction actionWithTitle:v69 style:2 handler:v81];
        [v67 addAction:v70];

        objc_super v71 = +[NSBundle bundleForClass:objc_opt_class()];
        v72 = [v71 localizedStringForKey:@"CANCEL" value:&stru_18CF0 table:@"MusicSettings"];
        v79[0] = _NSConcreteStackBlock;
        v79[1] = 3221225472;
        v79[2] = sub_B174;
        v79[3] = &unk_18A10;
        v79[4] = self;
        id v80 = v77;
        v73 = +[UIAlertAction actionWithTitle:v72 style:1 handler:v79];
        [v67 addAction:v73];

        [(MusicSettingsController *)self presentViewController:v67 animated:1 completion:0];
        goto LABEL_33;
      }
      long long v63 = +[NSBundle bundleForClass:objc_opt_class()];
      v75 = [v63 localizedStringForKey:@"DISABLE_SYNC_LIBRARY_NO_SUB_MATCH" value:&stru_18CF0 table:@"MusicSettings"];
    }
    else
    {
      long long v63 = +[NSBundle bundleForClass:objc_opt_class()];
      v75 = [v63 localizedStringForKey:@"DISABLE_SYNC_LIBRARY_SUB_NO_MATCH" value:&stru_18CF0 table:@"MusicSettings"];
    }

    goto LABEL_32;
  }
  v21 = +[ICPrivacyInfo sharedPrivacyInfo];
  unsigned int v22 = [v21 privacyAcknowledgementRequiredForMusic];

  if (v22)
  {
    v74 = +[OBPrivacyLinkController linkWithBundleIdentifier:@"com.apple.onboarding.applemusic"];
    v23 = +[NSBundle bundleForClass:objc_opt_class()];
    v24 = +[UIImage imageNamed:@"welcome" inBundle:v23];

    id v25 = objc_alloc((Class)AMSUIOnboardingViewController);
    v26 = +[NSBundle bundleForClass:objc_opt_class()];
    id v27 = [v26 localizedStringForKey:@"WELCOME_TITLE" value:&stru_18CF0 table:@"MusicSettings"];
    v28 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v29 = [v28 localizedStringForKey:@"WELCOME_DESCRIPTION" value:&stru_18CF0 table:@"MusicSettings"];
    uint64_t v30 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v31 = [v30 localizedStringForKey:@"CONTINUE_BUTTON_TITLE" value:&stru_18CF0 table:@"MusicSettings"];
    id v32 = [v25 initWithHeaderImage:v24 titleText:v27 descriptionText:v29 primaryButtonText:v31 privacyLinkController:v74];

    objc_initWeak(&location, self);
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_AD38;
    v89[3] = &unk_189C0;
    objc_copyWeak(&v91, &location);
    id v90 = v77;
    [v32 setPrimaryButtonCallback:v89];
    v33 = [v32 view];
    v34 = +[UIColor musicTintColor];
    [v33 setTintColor:v34];

    [(MusicSettingsController *)self presentViewController:v32 animated:1 completion:0];
    objc_destroyWeak(&v91);
    objc_destroyWeak(&location);
  }
  else
  {
    unsigned int v47 = +[MPCloudController sharedCloudController];
    unsigned int v48 = [v47 isEnablingCloudLibraryDestructive];

    BOOL v49 = v48 && self->_accountStatus.isMatchSubscribed && !self->_accountStatus.isSubscribed;
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_AF34;
    v88[3] = &unk_189E8;
    v88[4] = self;
    CFStringRef v50 = objc_retainBlock(v88);
    uint64_t v51 = v50;
    if (v49)
    {
      v52 = +[NSBundle bundleForClass:objc_opt_class()];
      v76 = [v52 localizedStringForKey:@"ENABLE_SYNC_LIBRARY_REPLACE" value:&stru_18CF0 table:@"MusicSettings"];

      uint64_t v53 = +[NSBundle bundleForClass:objc_opt_class()];
      id v54 = [v53 localizedStringForKey:@"ENABLE_SYNC_LIBRARY" value:&stru_18CF0 table:@"MusicSettings"];
      v55 = +[UIDevice currentDevice];
      uint64_t v56 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v54, v76, objc_msgSend(v55, "sf_isiPad"));

      uint64_t v57 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v58 = [v57 localizedStringForKey:@"REPLACE" value:&stru_18CF0 table:@"MusicSettings"];
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472;
      v86[2] = sub_B040;
      v86[3] = &unk_18658;
      id v87 = v51;
      long long v59 = +[UIAlertAction actionWithTitle:v58 style:2 handler:v86];
      [v56 addAction:v59];

      long long v60 = +[NSBundle bundleForClass:objc_opt_class()];
      long long v61 = [v60 localizedStringForKey:@"CANCEL" value:&stru_18CF0 table:@"MusicSettings"];
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = sub_B054;
      v84[3] = &unk_18A10;
      v84[4] = self;
      id v85 = v77;
      long long v62 = +[UIAlertAction actionWithTitle:v61 style:1 handler:v84];
      [v56 addAction:v62];

      [(MusicSettingsController *)self presentViewController:v56 animated:1 completion:0];
    }
    else
    {
      ((void (*)(void *, uint64_t))v50[2])(v50, 1);
    }
  }
LABEL_34:
}

- (id)shouldAddPlaylistSongsToMyMusic:(id)a3
{
  uint64_t v3 = +[MPCloudController sharedCloudController];
  BOOL v4 = [v3 cloudAddToPlaylistBehavior] != (char *)&dword_0 + 2;

  return +[NSNumber numberWithBool:v4];
}

- (void)setShouldAddPlaylistSongsToMyMusic:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = +[MPCloudController sharedCloudController];
  unsigned int v7 = [v5 BOOLValue];

  if (v7) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_B2A4;
  v9[3] = &unk_18948;
  v9[4] = self;
  [v6 setCloudAddToPlaylistBehavior:v8 completionHandler:v9];
}

- (id)shouldAddFavoriteSongsToMyMusic:(id)a3
{
  uint64_t v3 = +[MPCloudController sharedCloudController];
  BOOL v4 = [v3 favoriteSongAddToLibraryBehavior] != (char *)&dword_0 + 2;

  return +[NSNumber numberWithBool:v4];
}

- (void)setShouldAddFavoriteSongsToMyMusic:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = +[MPCloudController sharedCloudController];
  unsigned int v7 = [v5 BOOLValue];

  if (v7) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_B444;
  v9[3] = &unk_18948;
  v9[4] = self;
  [v6 setCloudFavoriteSongAddToLibraryBehavior:v8 completionHandler:v9];
}

- (id)useListeningHistory:(id)a3
{
  uint64_t v3 = +[MPPlaybackUserDefaults standardUserDefaults];
  BOOL v4 = [v3 isFocusModePrivateListeningEnabled];

  if (v4)
  {
    id v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 BOOLValue] ^ 1);
  }
  else
  {
    id v6 = +[MPPlaybackUserDefaults standardUserDefaults];
    unsigned int v7 = [v6 isPrivateListeningEnabled];
    id v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 BOOLValue] ^ 1);
  }

  return v5;
}

- (void)setUseListeningHistory:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = +[MPPlaybackUserDefaults standardUserDefaults];
  [v6 setFocusModePrivateListeningEnabled:0];

  unsigned int v7 = +[MPPlaybackUserDefaults standardUserDefaults];
  unsigned int v8 = [v5 BOOLValue];

  id v9 = +[NSNumber numberWithInt:v8 ^ 1];
  [v7 setPrivateListeningEnabled:v9];

  id v10 = [(MusicSettingsController *)self updateVisibleSpecifiers];

  _ICSiriPostDynamiteClientStateChangedNotification(v10);
}

- (id)libraryFooterText
{
  if (self->_accountStatus.isSubscribed && self->_accountStatus.isCloudLibraryEnabled)
  {
    int v2 = _os_feature_enabled_impl();
    uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v4 = v3;
    if (v2) {
      CFStringRef v5 = @"ADD_PLAYLIST_AND_FAVORITE_SONGS_TO_MY_MUSIC_FOOTER";
    }
    else {
      CFStringRef v5 = @"ADD_PLAYLIST_SONGS_TO_MY_MUSIC_FOOTER";
    }
    id v6 = [v3 localizedStringForKey:v5 value:&stru_18CF0 table:@"MusicSettings"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)sharePlayTogetherDiscoverableEnabled:(id)a3
{
  uint64_t v3 = MRGroupSessionNearbyContactDiscoveryEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (void)setSharePlayTogetherDiscoverableEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  _MRSetGroupSessionNearbyContactDiscoveryEnabled(v4);
}

- (id)motionGroupFooterText
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Music"];
  uint64_t v3 = [v2 objectForKey:@"motionMode"];

  if (!v3) {
    goto LABEL_5;
  }
  id v4 = (char *)[v2 integerForKey:@"motionMode"];
  if (!v4)
  {
    CFStringRef v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = v5;
    CFStringRef v7 = @"MOTION_FOOTER_OFF";
    goto LABEL_7;
  }
  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    id v6 = +[ICDeviceInfo currentDeviceInfo];
    unsigned int v10 = [v6 hasWAPICapability];
    unsigned __int8 v11 = +[NSBundle bundleForClass:objc_opt_class()];
    id v12 = v11;
    if (v10) {
      CFStringRef v13 = @"MOTION_FOOTER_WLAN_ONLY";
    }
    else {
      CFStringRef v13 = @"MOTION_FOOTER_WIFI_ONLY";
    }
    unsigned int v8 = [v11 localizedStringForKey:v13 value:&stru_18CF0 table:@"MusicSettings"];

    goto LABEL_8;
  }
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
LABEL_5:
    CFStringRef v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = v5;
    CFStringRef v7 = @"MOTION_FOOTER_ON";
LABEL_7:
    unsigned int v8 = [v5 localizedStringForKey:v7 value:&stru_18CF0 table:@"MusicSettings"];
LABEL_8:

    goto LABEL_9;
  }
  unsigned int v8 = 0;
LABEL_9:

  return v8;
}

- (id)cellularDataGroupFooterText
{
  uint64_t v3 = +[MPNetworkObserver sharedNetworkObserver];
  unsigned int v4 = [v3 isMusicCellularStreamingAllowed];

  CFStringRef v5 = +[MPNetworkObserver sharedNetworkObserver];
  unsigned int v6 = [v5 isMusicCellularDownloadingAllowed];

  if (v4) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v10 = v9;
    CFStringRef v11 = @"CELLULAR_FOOTER_STREAMING_AND_DOWNLOADS";
    goto LABEL_13;
  }
  if (v4)
  {
    BOOL isAuthTokenRequiredForPlayback = self->_accountStatus.isAuthTokenRequiredForPlayback;
    unsigned int v10 = +[NSBundle bundleForClass:objc_opt_class()];
    if (!isAuthTokenRequiredForPlayback)
    {
      CFStringRef v11 = @"CELLULAR_FOOTER_STREAMING_ONLY";
LABEL_12:
      id v9 = v10;
      goto LABEL_13;
    }
LABEL_11:
    CFStringRef v11 = @"CELLULAR_FOOTER_ON";
    goto LABEL_12;
  }
  if (v6)
  {
    BOOL v12 = self->_accountStatus.isAuthTokenRequiredForPlayback;
    unsigned int v10 = +[NSBundle bundleForClass:objc_opt_class()];
    if (!v12)
    {
      CFStringRef v11 = @"CELLULAR_FOOTER_DOWNLOADS_ONLY";
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v10 = v9;
  CFStringRef v11 = @"CELLULAR_FOOTER_ON";
LABEL_13:
  CFStringRef v13 = [v9 localizedStringForKey:v11 value:&stru_18CF0 table:@"MusicSettings"];

  return v13;
}

- (id)cellularDataStateDescription:(id)a3
{
  return [(MusicSettingsCellularDataController *)self->_cellularDataController cellularDataStateDescription];
}

- (BOOL)cellularHighDataModeEnabled
{
  return [(MusicSettingsCellularDataController *)self->_cellularDataController cellularHighDataModeEnabled];
}

- (id)listeningHistoryFooterText
{
  uint64_t v3 = +[MPPlaybackUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 isFocusModePrivateListeningEnabled];

  if (v4)
  {
    unsigned __int8 v5 = [v4 BOOLValue];
    unsigned int v6 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v7 = v6;
    if (v5) {
      CFStringRef v8 = @"USE_LISTENING_HISTORY_OFF_FOCUS_ON_FOOTER";
    }
    else {
      CFStringRef v8 = @"USE_LISTENING_HISTORY_ON_FOCUS_ON_FOOTER";
    }
    uint64_t v15 = [v6 localizedStringForKey:v8 value:&stru_18CF0 table:@"MusicSettings"];
  }
  else
  {
    id v9 = [(MusicSettingsController *)self allSpecifiers];
    BOOL v7 = [v9 specifierForID:@"com.apple.Music:PrivateListening"];

    unsigned int v10 = [(MusicSettingsController *)self useListeningHistory:v7];
    unsigned int v11 = [v10 BOOLValue];

    BOOL v12 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v13 = v12;
    if (v11) {
      CFStringRef v14 = @"USE_LISTENING_HISTORY_ON_FOCUS_OFF_FOOTER";
    }
    else {
      CFStringRef v14 = @"USE_LISTENING_HISTORY_OFF_FOCUS_OFF_FOOTER";
    }
    uint64_t v15 = [v12 localizedStringForKey:v14 value:&stru_18CF0 table:@"MusicSettings"];
  }

  return v15;
}

- (id)musicUsageLinkDetailDescription:(id)a3
{
  [(PSUsageBundleApp *)self->_musicUsageBundle totalSize];

  return +[NSByteCountFormatter stringFromByteCount:(uint64_t)v3 countStyle:2];
}

- (id)optimizeStorageStateDescription:(id)a3
{
  return +[MusicSettingsOptimizeStorageController optimizeStorageStateDescription];
}

- (id)homeSharingSignOutButtonLabel
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  float v3 = [v2 localizedStringForKey:@"HOME_SHARING_APPLE_ID_BUTTON" value:&stru_18CF0 table:@"MusicSettings"];
  unsigned int v4 = +[HSAccountStore defaultStore];
  unsigned __int8 v5 = [v4 appleID];
  unsigned int v6 = +[NSString stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (id)musicFooterText
{
  float v3 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v4 = [v3 localizedStringForKey:@"APPLE_MUSIC_FOOTER" value:&stru_18CF0 table:@"MusicSettings"];
  unsigned __int8 v5 = [(OBBundle *)self->_onBoardingBundle privacyFlow];
  unsigned int v6 = [v5 localizedTitle];
  BOOL v7 = +[NSString stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (id)musicFooterLinkText
{
  id v2 = [(OBBundle *)self->_onBoardingBundle privacyFlow];
  float v3 = [v2 localizedTitle];

  return v3;
}

- (id)mliEntryPointText
{
  return self->_mliEntryPointText;
}

- (id)mliEntryPointFooter
{
  if (self->_accountStatus.isCloudLibraryEnabled)
  {
    if (self->_mliEntryPointIsEnabled) {
      id v2 = &OBJC_IVAR___MusicSettingsController__mliEntryPointFooter;
    }
    else {
      id v2 = &OBJC_IVAR___MusicSettingsController__mliEntryPointFooterInProgress;
    }
  }
  else
  {
    id v2 = &OBJC_IVAR___MusicSettingsController__mliEntryPointFooterSyncOff;
  }
  return *(id *)&self->MusicSettingsListViewController_opaque[*v2];
}

- (id)mliReviewCTA
{
  return self->_mliReviewCTA;
}

- (id)mliReviewTitle
{
  return self->_mliReviewTitle;
}

- (MusicSettingsDynamicFooterHyperlinkAction)musicFooterLinkAction
{
  musicFooterLinkAction = self->_musicFooterLinkAction;
  if (!musicFooterLinkAction)
  {
    unsigned int v4 = (MusicSettingsDynamicFooterHyperlinkAction *)[objc_alloc((Class)MusicSettingsDynamicFooterHyperlinkAction) initWithTarget:self selectorString:@"showPrivacySplashSheet:"];
    unsigned __int8 v5 = self->_musicFooterLinkAction;
    self->_musicFooterLinkAction = v4;

    musicFooterLinkAction = self->_musicFooterLinkAction;
  }

  return musicFooterLinkAction;
}

- (id)accountModificationsAllowed
{
  id v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed] != 2;

  return +[NSNumber numberWithBool:v3];
}

- (id)isAutomaticDownloadsEnabled:(id)a3
{
  BOOL v3 = +[MPCloudController sharedCloudController];
  unsigned int v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isAutomaticDownloadsEnabled]);

  return v4;
}

- (void)setAutomaticDownloadsEnabled:(id)a3 specifier:(id)a4
{
  unsigned __int8 v4 = [a3 BOOLValue];
  unsigned __int8 v5 = +[MPCloudController sharedCloudController];
  id v6 = v5;
  if (v4) {
    [v5 enableAutomaticDownloadsWithCompletionHandler:0];
  }
  else {
    [v5 disableAutomaticDownloadsWithCompletionHandler:0];
  }
}

- (id)isWranglerSupported
{
  return &__kCFBooleanTrue;
}

- (id)appCellularDataModificationDisabled
{
  return [(MusicSettingsCellularDataController *)self->_cellularDataController appCellularDataModificationDisabled];
}

- (id)systemAllowCellularEnabled
{
  return [(MusicSettingsCellularDataController *)self->_cellularDataController systemAllowCellularEnabled];
}

- (id)cellularDataSettingsEnabled
{
  BOOL v2 = [(MusicSettingsCellularDataController *)self->_cellularDataController cellularSettingsAvailable];

  return +[NSNumber numberWithBool:v2];
}

- (id)cellularDataEnabled
{
  BOOL v2 = [(MusicSettingsCellularDataController *)self->_cellularDataController cellularDataEnabled];

  return +[NSNumber numberWithBool:v2];
}

- (id)resetMediaLibraryEnabled
{
  uint64_t AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ResetMediaLibraryPreferenceEnabled", @"com.apple.mobileipod", 0);

  return +[NSNumber numberWithUnsignedChar:AppBooleanValue];
}

- (id)hasDownloadedMusic
{
  [(PSUsageBundleApp *)self->_musicUsageBundle totalSize];
  if (v2 <= 0.0) {
    BOOL v3 = &__kCFBooleanFalse;
  }
  else {
    BOOL v3 = &__kCFBooleanTrue;
  }

  return v3;
}

- (id)hasStarRatings
{
  float v2 = +[MPMediaQuery songsQuery];
  BOOL v3 = +[MPMediaPropertyPredicate predicateWithValue:&off_1A920 forProperty:MPMediaItemPropertyRating comparisonType:101];
  [v2 addFilterPredicate:v3];

  unsigned __int8 v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 _hasItems]);

  return v4;
}

- (void)appleMusicSubscribe:(id)a3
{
  id v4 = +[NSURL URLWithString:@"music://subscribe"];
  BOOL v3 = +[UIApplication sharedApplication];
  [v3 openURL:v4 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)mliEntryPointClicked:(id)a3
{
  id v5 = +[NSString stringWithFormat:@"music://%@", self->_mliDeepLink];
  BOOL v3 = +[NSURL URLWithString:v5];
  id v4 = +[UIApplication sharedApplication];
  [v4 openURL:v3 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)mliReviewClicked:(id)a3
{
  id v6 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Music"];
  BOOL v3 = [v6 stringForKey:@"mliReview"];
  id v4 = +[NSURL URLWithString:v3];
  id v5 = +[UIApplication sharedApplication];
  [v5 openURL:v4 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)homeSharingSignInButtonAction:(id)a3
{
  id v4 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  [v4 setIsEphemeral:1];
  [v4 setPresentingViewController:self];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"HOME_SHARING" value:&stru_18CF0 table:@"MusicSettings"];
  [v4 setReason:v6];

  id v7 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_C634;
  v8[3] = &unk_18A88;
  v8[4] = self;
  [v7 authenticateWithContext:v4 completion:v8];
}

- (void)homeSharingSignOutButtonAction:(id)a3
{
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"HOME_SHARING_APPLE_ID" value:&stru_18CF0 table:@"MusicSettings"];
  id v6 = +[HSAccountStore defaultStore];
  id v7 = [v6 appleID];
  CFStringRef v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_18CF0 table:@"MusicSettings"];
  unsigned int v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];
  [v8 addAction:v11];

  BOOL v12 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v13 = [v12 localizedStringForKey:@"HOME_SHARING_SIGN_OUT" value:&stru_18CF0 table:@"MusicSettings"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_CB64;
  v15[3] = &unk_18AB0;
  v15[4] = self;
  CFStringRef v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v15];
  [v8 addAction:v14];

  [(MusicSettingsController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)resetLibrary:(id)a3
{
  id v4 = +[ML3MusicLibrary autoupdatingSharedLibraryPath];
  id v5 = +[MLMediaLibraryService sharedMediaLibraryService];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_CC74;
  v6[3] = &unk_18A60;
  v6[4] = self;
  [v5 recreateDatabaseAtPath:v4 withCompletionHandler:v6];
}

- (void)showPrivacySplashSheet:(id)a3
{
  id v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.applemusic"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)_accountStoreChangedNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CF08;
  block[3] = &unk_186F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_activeAccountChangedNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CF84;
  block[3] = &unk_186F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_cloudAddToPlaylistBehaviorDidChangeNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D000;
  block[3] = &unk_186F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_cloudServiceStatusCloudLibraryEnabledChangedNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D07C;
  block[3] = &unk_186F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_cloudServiceStatusMatchStatusDidChangeNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D0F8;
  block[3] = &unk_186F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_cloudServiceStatusSubscriptionAvailablilityChangedNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D174;
  block[3] = &unk_186F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_cloudServiceStatusSubscriptionStatusChangedNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D1F0;
  block[3] = &unk_186F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_managedConfigurationEffectiveSettingsDidChangeNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D26C;
  block[3] = &unk_186F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_cellularDownloadsAllowedDidChangeNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D2E8;
  block[3] = &unk_186F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_privateListeningEnabledDidChangeNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D364;
  block[3] = &unk_186F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_storefrontDidChangeNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D3E0;
  block[3] = &unk_186F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_reloadAccountStatus
{
  if (self->_overridingAccountStatus) {
    return;
  }
  BOOL v3 = +[MPCloudServiceStatusController sharedController];
  unint64_t v4 = (unint64_t)[v3 matchStatus];
  id v5 = +[ICUserIdentityStore defaultIdentityStore];
  id v6 = +[ICUserIdentity activeAccount];
  uint64_t v7 = [v5 DSIDForUserIdentity:v6 outError:0];

  BOOL isManagedAppleID = self->_accountStatus.isManagedAppleID;
  v40 = (void *)v4;
  id v9 = [v3 musicSubscriptionStatus];
  unsigned int v10 = [v9 hasCapability:128];

  int v11 = v10 | (v4 >> 2) & 1;
  unsigned __int8 v12 = [(ICCloudClient *)self->_cloudClient musicPurchasesDisabledForJaliscoLibrary];
  CFStringRef v13 = [v3 musicSubscriptionStatus];
  unsigned int v14 = [v13 hasCapability:1];

  unsigned __int8 v35 = v12;
  if (v11 == 1)
  {
    uint64_t v15 = +[MPCloudController sharedCloudController];
    BOOL v39 = v14;
    if ([v15 isEnhancedAudioAvailable]) {
      int v36 = MSVDeviceSupportsEnhancedMusic() & v14;
    }
    else {
      LOBYTE(v36) = 0;
    }
  }
  else
  {
    LOBYTE(v36) = 0;
    BOOL v39 = 0;
  }
  BOOL isMLIEnabled = self->_accountStatus.isMLIEnabled;
  BOOL v37 = v7 != 0;
  BOOL isMLIReviewEnabled = self->_accountStatus.isMLIReviewEnabled;
  uint32_t v16 = +[HSAccountStore defaultStore];
  id v17 = [v16 groupID];
  unsigned __int8 v18 = [v3 isSubscriptionAvailable];
  unsigned __int8 v19 = [v3 isCloudLibraryEnabled];
  v42 = (void *)v7;
  uint64_t v43 = v3;
  if (!v11) {
    goto LABEL_12;
  }
  unsigned __int8 v20 = v19;
  if (([v3 isCloudLibraryEnabled] & 1) == 0)
  {
    unsigned __int8 v19 = v20;
    if (!self->_accountStatus.isAuthTokenRequiredForPlayback)
    {
      BOOL v21 = isManagedAppleID;
      char v22 = 0;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v21 = isManagedAppleID;
    char v22 = v35 ^ 1;
LABEL_13:
    char v23 = (char)v40;
    goto LABEL_14;
  }
  BOOL v21 = isManagedAppleID;
  char v22 = 1;
  char v23 = (char)v40;
  unsigned __int8 v19 = v20;
LABEL_14:
  unint64_t v24 = v23 & 4;
  if (v10)
  {
    id v25 = v16;
    unsigned int v26 = v10;
    unsigned __int8 v27 = v19;
    v40 = [v43 musicSubscriptionStatus];
    BOOL v28 = [v40 statusType] == (char *)&dword_0 + 3;
    unsigned __int8 v19 = v27;
    unsigned int v10 = v26;
    uint32_t v16 = v25;
    BOOL v29 = v28;
  }
  else
  {
    BOOL v29 = 0;
  }
  self->_accountStatus.isSignedIn = v37;
  self->_accountStatus.isSignedInToHomeSharing = v17 != 0;
  self->_accountStatus.isMatchSubscribed = v24 >> 2;
  self->_accountStatus.isSubscribed = v10;
  self->_accountStatus.isFullCatalogPlaybackCapable = v39;
  self->_accountStatus.isSubscriptionAvailable = v18;
  self->_accountStatus.isCloudLibraryEnabled = v19;
  self->_accountStatus.isShowingCloudLibrary = 1;
  self->_accountStatus.BOOL isManagedAppleID = v21;
  self->_accountStatus.isDownloadSectionVisible = v22;
  self->_accountStatus.isEnhancedAudioAvailable = v36;
  self->_accountStatus.BOOL isAuthTokenRequiredForPlayback = v29;
  self->_accountStatus.BOOL isMLIEnabled = isMLIEnabled;
  self->_accountStatus.BOOL isMLIReviewEnabled = isMLIReviewEnabled;
  if (v10) {

  }
  [(MusicSettingsController *)self updateVisibleSpecifiers];
  uint64_t v30 = +[ICUserIdentityStore defaultIdentityStore];
  uint64_t v31 = +[ICUserIdentity activeAccount];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_D804;
  v46[3] = &unk_18B00;
  BOOL v49 = v21;
  id v32 = v42;
  id v47 = v32;
  unsigned int v48 = self;
  [v30 getPropertiesForUserIdentity:v31 completionHandler:v46];

  if (v10)
  {
    id v33 = [objc_alloc((Class)ICStoreRequestContext) initWithBlock:&stru_18B40];
    v34 = +[ICURLBagProvider sharedBagProvider];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_DA70;
    v44[3] = &unk_18B68;
    BOOL v45 = isMLIEnabled;
    v44[4] = self;
    [v34 getBagForRequestContext:v33 withCompletionHandler:v44];
  }
}

- (void)_determineMLIStatus
{
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Music"];
  unint64_t v4 = [(MusicSettingsController *)self allSpecifiers];
  id v5 = [v4 specifierForID:@"com.apple.Music:MLI"];

  [v3 doubleForKey:@"mliSessionStartDate"];
  if (v6 != 0.0 && self->_mliReviewDurationInDays)
  {
    uint64_t v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    if (v7)
    {
      CFStringRef v8 = objc_opt_new();
      objc_msgSend(v8, "setDay:", -[NSNumber longValue](self->_mliReviewDurationInDays, "longValue"));
      id v9 = +[NSCalendar currentCalendar];
      unsigned int v10 = [v9 dateByAddingComponents:v8 toDate:v7 options:0];

      int v11 = +[NSDate now];
      unsigned __int8 v12 = [v10 earlierDate:v11];

      if (v12 == v10) {
        [(MusicSettingsController *)self _resetMLIStatus];
      }
    }
  }
  CFStringRef v13 = [v3 stringForKey:@"mliSessionID"];
  if (v13) {
    unsigned __int8 v14 = [v3 BOOLForKey:@"mliDidCompleteTransfer"];
  }
  else {
    unsigned __int8 v14 = 1;
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_E024;
  v17[3] = &unk_18B90;
  unsigned __int8 v20 = v14;
  v17[4] = self;
  id v18 = v5;
  id v19 = v3;
  id v15 = v3;
  id v16 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);
}

- (void)_resetMLIStatus
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Music"];
  [v2 setValue:0 forKey:@"mliSessionID"];
  [v2 setValue:0 forKey:@"mliReview"];
  [v2 setValue:0 forKey:@"mliSessionStartDate"];
  [v2 setValue:0 forKey:@"mliDidDismiss"];
  [v2 setValue:0 forKey:@"mliDidCompleteTransfer"];
}

- (void)_debugTap:(id)a3
{
  id v4 = a3;
  id v5 = +[UIDevice currentDevice];
  unsigned int v6 = objc_msgSend(v5, "sf_isInternalInstall");

  if (v6 && [v4 state] == (char *)&dword_0 + 3)
  {
    uint64_t v7 = +[UIDevice currentDevice];
    CFStringRef v8 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", @"Override account status", 0, objc_msgSend(v7, "sf_isiPad"));

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_E890;
    v35[3] = &unk_18AB0;
    v35[4] = self;
    id v9 = +[UIAlertAction actionWithTitle:@"Signed In" style:0 handler:v35];
    [v9 _setChecked:self->_accountStatus.isSignedIn];
    [v8 addAction:v9];

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_E8C4;
    v34[3] = &unk_18AB0;
    v34[4] = self;
    unsigned int v10 = +[UIAlertAction actionWithTitle:@"Signed In Home Sharing" style:0 handler:v34];
    [v10 _setChecked:self->_accountStatus.isSignedInToHomeSharing];
    [v8 addAction:v10];

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_E8FC;
    v33[3] = &unk_18AB0;
    v33[4] = self;
    int v11 = +[UIAlertAction actionWithTitle:@"Match Subscribed" style:0 handler:v33];
    [v11 _setChecked:self->_accountStatus.isMatchSubscribed];
    [v8 addAction:v11];

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_E934;
    v32[3] = &unk_18AB0;
    v32[4] = self;
    unsigned __int8 v12 = +[UIAlertAction actionWithTitle:@"Fuse Available" style:0 handler:v32];
    [v12 _setChecked:self->_accountStatus.isSubscriptionAvailable];
    [v8 addAction:v12];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_E96C;
    v31[3] = &unk_18AB0;
    v31[4] = self;
    CFStringRef v13 = +[UIAlertAction actionWithTitle:@"Fuse Subscribed" style:0 handler:v31];
    [v13 _setChecked:self->_accountStatus.isFullCatalogPlaybackCapable];
    [v8 addAction:v13];

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_E9A4;
    v30[3] = &unk_18AB0;
    v30[4] = self;
    unsigned __int8 v14 = +[UIAlertAction actionWithTitle:@"Protected Content Playback Subscribed" style:0 handler:v30];
    [v14 _setChecked:self->_accountStatus.isAuthTokenRequiredForPlayback];
    [v8 addAction:v14];

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_E9DC;
    v29[3] = &unk_18AB0;
    v29[4] = self;
    id v15 = +[UIAlertAction actionWithTitle:@"Enhanced Audio Available" style:0 handler:v29];
    [v15 _setChecked:self->_accountStatus.isEnhancedAudioAvailable];
    [v8 addAction:v15];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_EA14;
    v28[3] = &unk_18AB0;
    v28[4] = self;
    id v16 = +[UIAlertAction actionWithTitle:@"Cloud Library Enabled" style:0 handler:v28];
    [v16 _setChecked:self->_accountStatus.isCloudLibraryEnabled];
    [v8 addAction:v16];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_EA4C;
    v27[3] = &unk_18AB0;
    v27[4] = self;
    id v17 = +[UIAlertAction actionWithTitle:@"Should Show Downloads Section" style:0 handler:v27];
    [v17 _setChecked:self->_accountStatus.isDownloadSectionVisible];
    [v8 addAction:v17];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_EA84;
    v26[3] = &unk_18AB0;
    v26[4] = self;
    id v18 = +[UIAlertAction actionWithTitle:@"Managed Apple Account" style:0 handler:v26];
    [v18 _setChecked:self->_accountStatus.isManagedAppleID];
    [v8 addAction:v18];

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_EABC;
    v25[3] = &unk_18AB0;
    v25[4] = self;
    id v19 = +[UIAlertAction actionWithTitle:@"Transfer Music Enabled" style:0 handler:v25];
    [v19 _setChecked:self->_accountStatus.isMLIEnabled];
    [v8 addAction:v19];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_EAF4;
    v24[3] = &unk_18AB0;
    v24[4] = self;
    unsigned __int8 v20 = +[UIAlertAction actionWithTitle:@"Review Alternates Enabled" style:0 handler:v24];
    [v20 _setChecked:self->_accountStatus.isMLIReviewEnabled];
    [v8 addAction:v20];

    if (self->_overridingAccountStatus)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_EB2C;
      v23[3] = &unk_18AB0;
      v23[4] = self;
      BOOL v21 = +[UIAlertAction actionWithTitle:@"Remove Overrides" style:2 handler:v23];
      [v8 addAction:v21];
    }
    char v22 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
    [v8 addAction:v22];

    [(MusicSettingsController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (void)_internalTap:(id)a3
{
  id v4 = +[UIDevice currentDevice];
  unsigned int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
  {
    self->_showInternalSettings ^= 1u;
    [(MusicSettingsController *)self updateVisibleSpecifiers];
    if (self->_showInternalSettings)
    {
      unsigned int v6 = [(MusicSettingsController *)self specifiers];
      uint64_t v7 = [v6 specifierForID:@"com.apple.Music:InternalGroup"];
      id v8 = [(MusicSettingsController *)self indexPathForSpecifier:v7];

      [*(id *)&self->MusicSettingsListViewController_opaque[OBJC_IVAR___PSListController__table] scrollToRowAtIndexPath:v8 atScrollPosition:1 animated:1];
    }
  }
}

- (id)shouldShowAURegulatorySection
{
  id v2 = +[NSLocale currentLocale];
  id v3 = [v2 regionCode];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isEqualToString:@"AU"]);

  return v4;
}

- (void)showAURegulatoryWebPage:(id)a3
{
  id v4 = objc_alloc((Class)SFSafariViewController);
  unsigned int v5 = +[NSURL URLWithString:@"https://www.apple.com/au/legal/online-safety/"];
  id v6 = [v4 initWithURL:v5];

  [v6 setModalPresentationStyle:2];
  [(MusicSettingsController *)self presentViewController:v6 animated:1 completion:0];
}

- (ICCloudClient)cloudClient
{
  return self->_cloudClient;
}

- (OBBundle)onBoardingBundle
{
  return self->_onBoardingBundle;
}

- (void)setMusicFooterLinkAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicFooterLinkAction, 0);
  objc_storeStrong((id *)&self->_onBoardingBundle, 0);
  objc_storeStrong((id *)&self->_cloudClient, 0);
  objc_storeStrong((id *)&self->_mliReviewDurationInDays, 0);
  objc_storeStrong((id *)&self->_mliReviewTitle, 0);
  objc_storeStrong((id *)&self->_mliReviewCTA, 0);
  objc_storeStrong((id *)&self->_mliEntryPointFooterSyncOff, 0);
  objc_storeStrong((id *)&self->_mliEntryPointFooterInProgress, 0);
  objc_storeStrong((id *)&self->_mliEntryPointFooter, 0);
  objc_storeStrong((id *)&self->_mliEntryPointText, 0);
  objc_storeStrong((id *)&self->_mliDeepLink, 0);
  objc_storeStrong((id *)&self->_cellularDataController, 0);
  objc_storeStrong((id *)&self->_musicUsageBundle, 0);
  objc_storeStrong((id *)&self->_storageReporter, 0);

  objc_storeStrong((id *)&self->_appPolicy, 0);
}

@end