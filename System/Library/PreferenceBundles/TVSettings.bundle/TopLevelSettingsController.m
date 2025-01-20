@interface TopLevelSettingsController
+ (id)_deeplinkForSpecifierName:(id)a3;
+ (id)preferencesExtendedLocalizedName:(id)a3 defaultValue:(id)a4;
- (BOOL)_isDebugMode;
- (BOOL)_okayToShowCellularPlaybackAndDownloadSettings;
- (BOOL)isRefreshingAppGroup;
- (NSArray)preferredSubtitleLanguageCodes;
- (NSArray)selectedAudioLanguages;
- (NSNumber)cellularDataDownload;
- (NSNumber)cellularDataPlayback;
- (NSNumber)downloadsCompatibleWithAVAdapter;
- (NSNumber)useDefaultSubtitleLanguages;
- (NSString)cellularDataQualityDownload;
- (NSString)cellularDataQualityPlayback;
- (NSString)preferredPurchaseResolution;
- (NSString)wifiQualityDownload;
- (NSString)wifiQualityPlayback;
- (TopLevelSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_accessStatusForSpecifier:(id)a3;
- (id)_autoPlayNextVideoPreferenceSpecifier;
- (id)_descriptionForExternalScreenType:(unsigned int)a3;
- (id)_devicePreferenceSpecifiers;
- (id)_gdprSpecifiers;
- (id)_loadingSpecifiers;
- (id)_permissionSpecifiersForActiveAccount:(BOOL)a3;
- (id)accountModificationsAllowed;
- (id)availableAudioLanguageCodes:(id)a3;
- (id)availableAudioLanguageTitles:(id)a3;
- (id)downloadLanguageSpecifierSubtext:(id)a3;
- (id)downloadsCompatibleWithAVAdapter:(id)a3;
- (id)homeSharingAppleID;
- (id)postPlayAutoPlayNextVideo;
- (id)preferredAudioLanguageCode:(id)a3;
- (id)preferredPlaybackDimensionality;
- (id)preferredPurchaseResolution:(id)a3;
- (id)showDownloadQualityCellular:(id)a3;
- (id)showDownloadQualityWifi:(id)a3;
- (id)showPlaybackQualityCellular:(id)a3;
- (id)showPlaybackQualityWifi:(id)a3;
- (id)specifiers;
- (id)sportsScoreSpoilersAllowed;
- (id)systemAllowTVCellularDataEnabledForSpecifier:(id)a3;
- (id)upNextEnabled;
- (id)upNextLockupsUseCoverArt;
- (id)useCellularDataDownload:(id)a3;
- (id)useCellularDataPlayback:(id)a3;
- (int64_t)_alertStyle;
- (void)_addPrivacyFooterToGroup:(id)a3;
- (void)_checkSettingsAndReload;
- (void)_externalScreenTypeDidChange:(id)a3;
- (void)_performSetOperationWithUndo:(id)a3 oldValue:(id)a4 specifier:(id)a5 actionName:(id)a6 setSelector:(SEL)a7;
- (void)_sceneWillConnect:(id)a3;
- (void)_setDownloadsCompatibleWithAVAdapter:(id)a3 specifier:(id)a4;
- (void)_setPlayHistoryEnabled:(id)a3;
- (void)_setPostPlayAutoPlayNextVideo:(id)a3;
- (void)_setPreferredAudioLanguageCode:(id)a3;
- (void)_setPreferredPlaybackDimensionality:(id)a3;
- (void)_setPreferredPurchaseResolution:(id)a3 specifier:(id)a4;
- (void)_setPreferredSubtitleLanguageCodes:(id)a3;
- (void)_setSelectedAudioLanguages:(id)a3;
- (void)_setShowDownloadQualityCellular:(id)a3 specifier:(id)a4;
- (void)_setShowDownloadQualityWifi:(id)a3 specifier:(id)a4;
- (void)_setShowPlaybackQualityCellular:(id)a3 specifier:(id)a4;
- (void)_setShowPlaybackQualityWifi:(id)a3 specifier:(id)a4;
- (void)_setSportsScoreSpoilersAllowed:(id)a3;
- (void)_setUpNextLockupsUseCoverArt:(id)a3;
- (void)_setUseCellularDataDownload:(id)a3 specifier:(id)a4;
- (void)_setUseCellularDataPlayback:(id)a3 specifier:(id)a4;
- (void)_setUseDefaultSubtitleLanguages:(id)a3;
- (void)_showPrivacySheet:(id)a3;
- (void)_syncDevicePreferenceValues;
- (void)_updateCellularQualitySpecifiersAnimated:(BOOL)a3 shouldUpdateUsingTableView:(BOOL)a4 forPlayback:(BOOL)a5;
- (void)_updateCellularSpecifierVisibility:(id)a3 shouldUpdateUsingTableView:(BOOL)a4 animated:(BOOL)a5 mutableSpecifiers:(id)a6;
- (void)_updateCellularSpecifiersAnimated:(BOOL)a3 shouldUpdateUsingTableView:(BOOL)a4;
- (void)_updateHomeSharingSpecifiersAnimated:(BOOL)a3 shouldUpdateUsingTableView:(BOOL)a4;
- (void)_updateRestrictions;
- (void)_updateUIAfterChangingCellularUse:(id)a3 specifier:(id)a4;
- (void)dealloc;
- (void)homeSharingSignInButtonAction:(id)a3;
- (void)homeSharingSignOutButtonAction:(id)a3;
- (void)setCellularDataDownload:(id)a3;
- (void)setCellularDataPlayback:(id)a3;
- (void)setCellularDataQualityDownload:(id)a3;
- (void)setCellularDataQualityPlayback:(id)a3;
- (void)setDownloadsCompatibleWithAVAdapter:(id)a3;
- (void)setDownloadsCompatibleWithAVAdapter:(id)a3 specifier:(id)a4;
- (void)setPlayHistoryEnabled:(id)a3;
- (void)setPostPlayAutoPlayNextVideo:(id)a3;
- (void)setPreferredAudioLanguageCode:(id)a3;
- (void)setPreferredPlaybackDimensionality:(id)a3;
- (void)setPreferredPurchaseResolution:(id)a3;
- (void)setPreferredPurchaseResolution:(id)a3 specifier:(id)a4;
- (void)setPreferredSubtitleLanguageCodes:(id)a3;
- (void)setRefreshingAppGroup:(BOOL)a3;
- (void)setSelectedAudioLanguages:(id)a3;
- (void)setShowDownloadQualityCellular:(id)a3 specifier:(id)a4;
- (void)setShowDownloadQualityWifi:(id)a3 specifier:(id)a4;
- (void)setShowPlaybackQualityCellular:(id)a3 specifier:(id)a4;
- (void)setShowPlaybackQualityWifi:(id)a3 specifier:(id)a4;
- (void)setSportsScoreSpoilersAllowed:(id)a3;
- (void)setSystemAllowTVCellularDataEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setUpNextLockupsUseCoverArt:(id)a3;
- (void)setUseCellularDataDownload:(id)a3 specifier:(id)a4;
- (void)setUseCellularDataPlayback:(id)a3 specifier:(id)a4;
- (void)setUseDefaultSubtitleLanguages:(id)a3;
- (void)setWifiQualityDownload:(id)a3;
- (void)setWifiQualityPlayback:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TopLevelSettingsController

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:*(id *)((char *)&self->_accountChangeNotificationToken + 4)];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:*(id *)((char *)&self->_mcEffectiveSettingsChangedNotification + 4)];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)TopLevelSettingsController;
  [(TVSettingsListMonitorController *)&v6 dealloc];
}

- (TopLevelSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)TopLevelSettingsController;
  v8 = [(TVSettingsListMonitorController *)&v33 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = +[NSNotificationCenter defaultCenter];
    v10 = +[SSAccountStore defaultStore];
    v11 = +[NSOperationQueue mainQueue];
    uint64_t v12 = SSAccountStoreChangedNotification;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_7680;
    v30[3] = &unk_186B0;
    v26 = &v31;
    objc_copyWeak(&v31, &location);
    uint64_t v13 = [v9 addObserverForName:v12 object:v10 queue:v11 usingBlock:v30];
    v14 = *(void **)(v8 + 228);
    *(void *)(v8 + 228) = v13;

    v15 = +[NSNotificationCenter defaultCenter];
    v16 = +[NSOperationQueue mainQueue];
    uint64_t v17 = MCEffectiveSettingsChangedNotification;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_76C0;
    v28[3] = &unk_186B0;
    objc_copyWeak(&v29, &location);
    uint64_t v18 = [v15 addObserverForName:v17 object:0 queue:v16 usingBlock:v28];
    v19 = *(void **)(v8 + 236);
    *(void *)(v8 + 236) = v18;

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v8 selector:"_sceneWillConnect:" name:UISceneWillConnectNotification object:0];

    MRMediaRemoteSetWantsExternalScreenTypeChangeNotifications();
    v21 = +[NSNotificationCenter defaultCenter];
    [v21 addObserver:v8 selector:"_externalScreenTypeDidChange:" name:kMRMediaRemoteExternalScreenTypeDidChangeNotification object:0];

    id v22 = &_dispatch_main_q;
    objc_copyWeak(&v27, &location);
    MRMediaRemoteGetExternalScreenType();

    v23 = +[UIApplication sharedApplication];
    LODWORD(v17) = objc_msgSend(v23, "tvSettings_isNonLightningAVAdapterConnected");

    if (v17)
    {
      NSLog(@"A non-Lightning AV adapter is connected", &v31, _NSConcreteStackBlock, 3221225472, sub_7700, &unk_186D8);
      v24 = +[WLKSystemPreferencesStore sharedPreferences];
      [v24 setHasAVAdapterEvenBeenConnected:1];
    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }

  return (TopLevelSettingsController *)v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)TopLevelSettingsController;
  [(TopLevelSettingsController *)&v13 viewWillAppear:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)((char *)&self->_permissionsSpecifiers + 4);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[TopLevelSettingsController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), 0, (void)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TopLevelSettingsController;
  [(TopLevelSettingsController *)&v8 viewDidAppear:a3];
  id v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.tv"];
  id v5 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"SETTINGS_TITLE_APPS" defaultValue:@"Apps"];
  id v6 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"SETTINGS_TITLE_TV" defaultValue:@"TV"];
  if (objc_opt_respondsToSelector())
  {
    NSLog(@"TVSettingsLog - Emitting navigation event for Top Level application settings");
    long long v9 = v5;
    uint64_t v7 = +[NSArray arrayWithObjects:&v9 count:1];
    [(TopLevelSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.tv" title:v6 localizedNavigationComponents:v7 deepLink:v4];
  }
}

- (id)accountModificationsAllowed
{
  v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed] != 2;

  return +[NSNumber numberWithBool:v3];
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  BOOL v3 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
LABEL_57:
    id v87 = v3;
    goto LABEL_58;
  }
  id v5 = +[WLKSettingsAMSBagTracker sharedTracker];
  id v6 = [v5 isNowPlayingEnabled];
  *(&self->_libraryOnly + 4) = [v6 BOOLValue] ^ 1;

  uint64_t v7 = +[SSAccountStore defaultStore];
  objc_super v8 = [v7 activeAccount];

  long long v9 = +[WLKSettingsStore sharedSettings];
  long long v10 = sub_7804();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *((unsigned __int8 *)&self->_libraryOnly + 4);
    *(_DWORD *)buf = 67109376;
    int v108 = v11;
    __int16 v109 = 1024;
    BOOL v110 = v8 != 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Settings: Create specifier, libraryOnly = %d, activeAccount exist = %d", buf, 0xEu);
  }

  if (*(&self->_libraryOnly + 4)
    || *(&self->_libraryOnly + 2)
    || ([v9 lastSyncDate], long long v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    v92 = v9;
    uint64_t v93 = v2;
    id v13 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v14 = [(TopLevelSettingsController *)self loadSpecifiersFromPlistName:@"TVSettings" target:self];
    if (v14) {
      [v13 addObjectsFromArray:v14];
    }
    v15 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings", v14];
    uint64_t v16 = [v15 localizedStringForKey:@"SETTINGS_TITLE_TV" value:&stru_18968 table:@"TVSettings"];
    uint64_t v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = (__CFString *)v16;
    }
    else {
      uint64_t v18 = &stru_18968;
    }
    v19 = v18;

    if (WLKIsRegulatedSKU())
    {
      v20 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
      uint64_t v21 = [v20 localizedStringForKey:@"SETTINGS_TITLE_VIDEOS" value:&stru_18968 table:@"TVSettings"];
      id v22 = (void *)v21;
      if (v21) {
        v23 = (__CFString *)v21;
      }
      else {
        v23 = &stru_18968;
      }
      v24 = v23;

      v19 = v24;
    }
    [(TopLevelSettingsController *)self setTitle:v19];
    v25 = +[NSMutableArray array];
    v94 = v8;
    if (v8)
    {
      v106[0] = @"com.apple.videos:PurchaseResolutionGroup";
      v106[1] = @"com.apple.videos:PreferredPurchaseResolution";
      v106[2] = @"com.apple.videos:HomeSharingFooter";
      v106[3] = @"com.apple.videos:HomeSharingSignOutButton";
      v106[4] = @"com.apple.videos:HomeSharingSignInButton";
      +[NSArray arrayWithObjects:v106 count:5];
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      id v27 = [v26 countByEnumeratingWithState:&v99 objects:v105 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v100;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v100 != v29) {
              objc_enumerationMutation(v26);
            }
            id v31 = [v13 specifierForID:*(void *)(*((void *)&v99 + 1) + 8 * i)];
            [v25 addObject:v31];
            [v13 removeObject:v31];
          }
          id v28 = [v26 countByEnumeratingWithState:&v99 objects:v105 count:16];
        }
        while (v28);
      }

      if (!*(&self->_libraryOnly + 4))
      {
        v32 = [(TopLevelSettingsController *)self _permissionSpecifiersForActiveAccount:1];
        objc_super v33 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v32 count]);
        [v13 insertObjects:v32 atIndexes:v33];
        v34 = [(TopLevelSettingsController *)self _devicePreferenceSpecifiers];
        [v13 addObjectsFromArray:v34];
      }
      v35 = [(TopLevelSettingsController *)self _autoPlayNextVideoPreferenceSpecifier];
      [v13 addObjectsFromArray:v35];

      [v13 addObjectsFromArray:v25];
      v36 = v94;
      if (!self->_didSyncDevicePreferenceValues)
      {
        self->_didSyncDevicePreferenceValues = 1;
        [(TopLevelSettingsController *)self _syncDevicePreferenceValues];
      }
    }
    else
    {
      v104[0] = @"com.apple.videos:PurchaseResolutionGroup";
      v104[1] = @"com.apple.videos:PreferredPurchaseResolution";
      v104[2] = @"com.apple.videos:HomeSharingFooter";
      v104[3] = @"com.apple.videos:HomeSharingSignOutButton";
      v104[4] = @"com.apple.videos:HomeSharingSignInButton";
      +[NSArray arrayWithObjects:v104 count:5];
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      id v37 = [v26 countByEnumeratingWithState:&v95 objects:v103 count:16];
      if (v37)
      {
        id v38 = v37;
        uint64_t v39 = *(void *)v96;
        do
        {
          for (j = 0; j != v38; j = (char *)j + 1)
          {
            if (*(void *)v96 != v39) {
              objc_enumerationMutation(v26);
            }
            v41 = [v13 specifierForID:*(void *)(*((void *)&v95 + 1) + 8 * (void)j)];
            [v25 addObject:v41];
            [v13 removeObject:v41];
          }
          id v38 = [v26 countByEnumeratingWithState:&v95 objects:v103 count:16];
        }
        while (v38);
      }

      v42 = [(TopLevelSettingsController *)self _autoPlayNextVideoPreferenceSpecifier];
      [v13 addObjectsFromArray:v42];

      [v13 addObjectsFromArray:v25];
      v43 = [(TopLevelSettingsController *)self _permissionSpecifiersForActiveAccount:0];
      [v13 addObjectsFromArray:v43];

      v36 = 0;
    }

    if (!v36 || *(&self->_libraryOnly + 4))
    {
      v44 = [v13 specifierForID:@"com.apple.videos:PurchaseResolutionGroup"];
      [(TopLevelSettingsController *)self _addPrivacyFooterToGroup:v44];
    }
    v45 = [v13 specifierForID:@"com.apple.videos:CellularDataMode"];
    v46 = *(PSSpecifier **)((char *)&self->_playbackCellularSpecifier + 4);
    *(PSSpecifier **)((char *)&self->_playbackCellularSpecifier + 4) = v45;

    v47 = [v13 specifierForID:@"com.apple.videos:PlaybackQualityWifi"];
    v48 = *(PSSpecifier **)((char *)&self->_playbackQualityWifiSpecifier + 4);
    *(PSSpecifier **)((char *)&self->_playbackQualityWifiSpecifier + 4) = v47;

    v49 = [v13 specifierForID:@"com.apple.videos:PlaybackQualityCellular"];
    v50 = *(PSSpecifier **)((char *)&self->_playbackQualityCellularSpecifier + 4);
    *(PSSpecifier **)((char *)&self->_playbackQualityCellularSpecifier + 4) = v49;

    v51 = [v13 specifierForID:@"com.apple.videos:CellularDataModeDownload"];
    v52 = *(PSSpecifier **)((char *)&self->_downloadCellularSpecifier + 4);
    *(PSSpecifier **)((char *)&self->_downloadCellularSpecifier + 4) = v51;

    v53 = [v13 specifierForID:@"com.apple.videos:DownloadQualityWifi"];
    v54 = *(PSSpecifier **)((char *)&self->_downloadQualityWifiSpecifier + 4);
    *(PSSpecifier **)((char *)&self->_downloadQualityWifiSpecifier + 4) = v53;

    v55 = [v13 specifierForID:@"com.apple.videos:DownloadQualityCellular"];
    v56 = *(PSSpecifier **)((char *)&self->_downloadQualityCellularSpecifier + 4);
    *(PSSpecifier **)((char *)&self->_downloadQualityCellularSpecifier + 4) = v55;

    if (SSDeviceIsHDRCapable())
    {
      int v57 = MGGetBoolAnswer();
      v58 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
      v59 = v58;
      if (v57) {
        CFStringRef v60 = @"DOWNLOAD_QUALITY_SELECTION_FOOTER";
      }
      else {
        CFStringRef v60 = @"DOWNLOAD_QUALITY_SELECTION_FOOTER_NO_HDR_OVER_ADAPTER";
      }
      v61 = [v58 localizedStringForKey:v60 value:&stru_18968 table:@"TVSettings"];

      uint64_t v62 = PSStaticTextMessageKey;
      [*(id *)((char *)&self->_downloadQualityWifiSpecifier + 4) setProperty:v61 forKey:PSStaticTextMessageKey];
      [*(id *)((char *)&self->_downloadQualityCellularSpecifier + 4) setProperty:v61 forKey:v62];
      [*(id *)((char *)&self->_playbackQualityWifiSpecifier + 4) setProperty:v61 forKey:v62];
    }
    else
    {
      uint64_t v62 = PSStaticTextMessageKey;
    }
    v63 = *(PSSpecifier **)((char *)&self->_playbackQualityCellularSpecifier + 4);
    v64 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    v65 = [v64 localizedStringForKey:@"PLAYBACK_QUALITY_CELLULAR_FOOTER" value:&stru_18968 table:@"TVSettings"];
    [v63 setProperty:v65 forKey:v62];

    v66 = +[WLKSystemPreferencesStore sharedPreferences];
    unsigned __int8 v67 = [v66 hasAVAdapterEvenBeenConnected];

    if (![(TopLevelSettingsController *)self _isDebugMode] && (v67 & 1) == 0)
    {
      id v68 = [v13 indexOfSpecifierWithID:@"com.apple.videos:AVAdapterGroup"];
      if (v68 != (id)0x7FFFFFFFFFFFFFFFLL) {
        [v13 removeObjectAtIndex:v68];
      }
      id v69 = [v13 indexOfSpecifierWithID:@"com.apple.videos:DownloadsCompatibleWithAVAdapter"];
      if (v69 != (id)0x7FFFFFFFFFFFFFFFLL) {
        [v13 removeObjectAtIndex:v69];
      }
    }
    v70 = [v13 specifierForID:@"com.apple.videos:HomeSharingSignOutButton"];
    v71 = *(PSSpecifier **)((char *)&self->_homeSharingSignOutButtonSpecifier + 4);
    *(PSSpecifier **)((char *)&self->_homeSharingSignOutButtonSpecifier + 4) = v70;

    v72 = [v13 specifierForID:@"com.apple.videos:HomeSharingSignInButton"];
    v73 = *(PSSpecifier **)((char *)&self->_homeSharingSignInButtonSpecifier + 4);
    *(PSSpecifier **)((char *)&self->_homeSharingSignInButtonSpecifier + 4) = v72;

    v74 = *(PSSpecifier **)((char *)&self->_homeSharingSignInButtonSpecifier + 4);
    v75 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    v76 = [v75 localizedStringForKey:@"HOME_SHARING_SIGN_IN" value:&stru_18968 table:@"TVSettings"];
    [v74 setName:v76];

    if ([(TopLevelSettingsController *)self _isDebugMode])
    {
      NSLog(@"TVSettingsLog - debug mode is enabled. All specifiers will be visible");
      uint64_t v77 = [(TopLevelSettingsController *)self homeSharingAppleID];
      v78 = (void *)v77;
      v79 = @"Sign Out";
      if (v77) {
        v79 = (__CFString *)v77;
      }
      v80 = v79;

      [*(id *)((char *)&self->_homeSharingSignOutButtonSpecifier + 4) setName:v80];
    }
    v81 = [v13 specifierForID:@"com.apple.videos:HomeSharingFooter"];
    v82 = *(PSSpecifier **)((char *)&self->_homeSharingGroupSpecifier + 4);
    *(PSSpecifier **)((char *)&self->_homeSharingGroupSpecifier + 4) = v81;

    v83 = *(PSSpecifier **)((char *)&self->_homeSharingGroupSpecifier + 4);
    v84 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    v85 = [v84 localizedStringForKey:@"HOME_SHARING" value:&stru_18968 table:@"TVSettings"];
    [v83 setName:v85];

    v86 = *(void **)&self->super.PSListController_opaque[v93];
    *(void *)&self->super.PSListController_opaque[v93] = v13;

    [(TopLevelSettingsController *)self _updateHomeSharingSpecifiersAnimated:0 shouldUpdateUsingTableView:0];
    [(TopLevelSettingsController *)self _updateCellularSpecifiersAnimated:0 shouldUpdateUsingTableView:0];
    [(TopLevelSettingsController *)self _updateCellularQualitySpecifiersAnimated:0 shouldUpdateUsingTableView:0 forPlayback:1];
    [(TopLevelSettingsController *)self _updateCellularQualitySpecifiersAnimated:0 shouldUpdateUsingTableView:0 forPlayback:0];
    [(TopLevelSettingsController *)self _updateRestrictions];

    BOOL v3 = *(void **)&self->super.PSListController_opaque[v93];
    goto LABEL_57;
  }
  uint64_t v89 = [(TopLevelSettingsController *)self _loadingSpecifiers];
  v90 = *(void **)&self->super.PSListController_opaque[v2];
  *(void *)&self->super.PSListController_opaque[v2] = v89;

  [(TopLevelSettingsController *)self _checkSettingsAndReload];
  id v87 = *(id *)&self->super.PSListController_opaque[v2];

LABEL_58:

  return v87;
}

- (BOOL)_isDebugMode
{
  uint64_t v2 = WLKSystemSettingsDebugOverride();
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)_loadingSpecifiers
{
  uint64_t v2 = +[PSSpecifier groupSpecifierWithID:@"LoadingGroup"];
  unsigned __int8 v3 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  id v4 = [v3 localizedStringForKey:@"LOADING" value:&stru_18968 table:@"TVSettings"];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:0 cell:6 edit:0];

  id v6 = +[NSNumber numberWithBool:1];
  [v5 setProperty:v6 forKey:PSControlIsLoadingKey];

  v9[0] = v2;
  v9[1] = v5;
  uint64_t v7 = +[NSArray arrayWithObjects:v9 count:2];

  return v7;
}

- (void)_checkSettingsAndReload
{
  objc_initWeak(&location, self);
  uint64_t v2 = dispatch_get_global_queue(2, 0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_8848;
  v3[3] = &unk_18700;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)_permissionSpecifiersForActiveAccount:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (PSSystemPolicyForApp *)[objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.tv"];
  id v6 = *(PSSystemPolicyForApp **)((char *)&self->_appPolicy + 4);
  *(PSSystemPolicyForApp **)((char *)&self->_appPolicy + 4) = v5;

  uint64_t v7 = *(PSSystemPolicyForApp **)((char *)&self->_appPolicy + 4);
  if (v3)
  {
    objc_super v8 = [v7 specifiersForPolicyOptions:0x10000800001 force:0];
    long long v9 = *(NSArray **)((char *)&self->_permissionsSpecifiers + 4);
    *(NSArray **)((char *)&self->_permissionsSpecifiers + 4) = v8;

    long long v10 = [*(id *)((char *)&self->_appPolicy + 4) specifiersForPolicyOptions:0x8000 force:0];
    int v11 = [v10 lastObject];

    if (v11)
    {
      long long v12 = *(NSArray **)((char *)&self->_permissionsSpecifiers + 4);
      if (v12)
      {
        id v13 = [v12 arrayByAddingObject:v11];
      }
      else
      {
        uint64_t v21 = v11;
        id v13 = +[NSArray arrayWithObjects:&v21 count:1];
      }
      uint64_t v16 = *(NSArray **)((char *)&self->_permissionsSpecifiers + 4);
      *(NSArray **)((char *)&self->_permissionsSpecifiers + 4) = v13;

      uint64_t v17 = [[PSSpecifierRedirecter alloc] initWithSpecifier:v11];
      uint64_t v18 = *(PSSpecifierRedirecter **)((char *)&self->_permissionSpecifierRedirecter + 4);
      *(PSSpecifierRedirecter **)((char *)&self->_permissionSpecifierRedirecter + 4) = v17;

      objc_storeWeak((id *)&v11[OBJC_IVAR___PSSpecifier_target], self);
      *(void *)&v11[OBJC_IVAR___PSSpecifier_getter] = "systemAllowTVCellularDataEnabledForSpecifier:";
      *(void *)&v11[OBJC_IVAR___PSSpecifier_setter] = "setSystemAllowTVCellularDataEnabled:forSpecifier:";
    }
  }
  else
  {
    uint64_t v14 = [v7 specifiersForPolicyOptions:0x10000000000 force:0];
    v15 = *(NSArray **)((char *)&self->_permissionsSpecifiers + 4);
    *(NSArray **)((char *)&self->_permissionsSpecifiers + 4) = v14;
  }
  v19 = *(NSArray **)((char *)&self->_permissionsSpecifiers + 4);

  return v19;
}

- (void)_addPrivacyFooterToGroup:(id)a3
{
  id v17 = a3;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v17 setProperty:v5 forKey:PSFooterCellClassGroupKey];

  LODWORD(v5) = _os_feature_enabled_impl();
  id v6 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  uint64_t v7 = v6;
  if (v5) {
    CFStringRef v8 = @"PRIVACY_FOOTER_FORMAT_CONTINUE_WATCHING";
  }
  else {
    CFStringRef v8 = @"PRIVACY_FOOTER_FORMAT";
  }
  long long v9 = [v6 localizedStringForKey:v8 value:&stru_18968 table:@"TVSettings"];

  long long v10 = +[OBPrivacyLinkController linkWithBundleIdentifier:@"com.apple.onboarding.tvapp"];
  int v11 = [v10 flow];
  long long v12 = [v11 localizedButtonTitle];

  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v12);
  [v17 setProperty:v13 forKey:PSFooterHyperlinkViewTitleKey];
  v19.id location = (NSUInteger)[v13 rangeOfString:v12];
  uint64_t v14 = NSStringFromRange(v19);
  [v17 setProperty:v14 forKey:PSFooterHyperlinkViewLinkRangeKey];

  v15 = +[NSValue valueWithNonretainedObject:self];
  [v17 setProperty:v15 forKey:PSFooterHyperlinkViewTargetKey];

  uint64_t v16 = NSStringFromSelector("_showPrivacySheet:");
  [v17 setProperty:v16 forKey:PSFooterHyperlinkViewActionKey];
}

- (id)_gdprSpecifiers
{
  BOOL v3 = +[NSMutableArray array];
  id v4 = +[PSSpecifier groupSpecifierWithID:@"GDPR_GROUP"];
  [(TopLevelSettingsController *)self _addPrivacyFooterToGroup:v4];
  [v3 addObject:v4];

  return v3;
}

- (id)_autoPlayNextVideoPreferenceSpecifier
{
  BOOL v3 = +[NSMutableArray array];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v4 = +[PSSpecifier groupSpecifierWithID:@"AutoPlayNextVideoGroup"];
    id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    id v6 = [v5 localizedStringForKey:@"POST_PLAY_AUTO_PLAY_NEXT_VIDEO_DESCRIPTION" value:&stru_18968 table:@"TVSettings"];
    [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

    [v3 addObject:v4];
    uint64_t v7 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    CFStringRef v8 = [v7 localizedStringForKey:@"POST_PLAY_AUTO_PLAY_NEXT_VIDEO" value:&stru_18968 table:@"TVSettings"];
    long long v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setPostPlayAutoPlayNextVideo:" get:"postPlayAutoPlayNextVideo" detail:0 cell:6 edit:0];

    [v9 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v9 setProperty:@"com.apple.videos:AutoPlayNextVideo" forKey:PSIDKey];
    [v3 addObject:v9];
  }

  return v3;
}

- (id)_devicePreferenceSpecifiers
{
  BOOL v3 = +[NSMutableArray array];
  id v4 = +[PSSpecifier groupSpecifierWithID:@"DevicePreferencesGroup"];
  id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  uint64_t v6 = [v5 localizedStringForKey:@"PRIVATE_SPORTS_GROUP_NAME" value:&stru_18968 table:@"TVSettings"];
  uint64_t v7 = (void *)v6;
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  else {
    CFStringRef v8 = &stru_18968;
  }
  [v4 setName:v8];

  [(TopLevelSettingsController *)self _addPrivacyFooterToGroup:v4];
  id v38 = v4;
  uint64_t v39 = v3;
  [v3 addObject:v4];
  if (*(&self->_libraryOnly + 3))
  {
    long long v9 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    long long v10 = [v9 localizedStringForKey:@"SPORTS_SPOILERS_ALLOWED" value:&stru_18968 table:@"TVSettings"];
    int v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setSportsScoreSpoilersAllowed:" get:"sportsScoreSpoilersAllowed" detail:0 cell:6 edit:0];

    uint64_t v12 = PSAllowMultilineTitleKey;
    objc_msgSend(v11, "setProperty:forKey:", &__kCFBooleanTrue);
    uint64_t v13 = PSIDKey;
    objc_msgSend(v11, "setProperty:forKey:", @"com.apple.videos:SportsSpoilers");
    [v3 addObject:v11];
  }
  else
  {
    uint64_t v12 = PSAllowMultilineTitleKey;
    uint64_t v13 = PSIDKey;
  }
  uint64_t v14 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  v15 = [v14 localizedStringForKey:@"PRIVATE_MODE" value:&stru_18968 table:@"TVSettings"];
  id v37 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:"setPlayHistoryEnabled:" get:"upNextEnabled" detail:0 cell:6 edit:0];

  [v37 setProperty:&__kCFBooleanTrue forKey:v12];
  [v37 setProperty:@"com.apple.videos:UsePlayHistory" forKey:v13];
  [v3 addObject:v37];
  int v16 = _os_feature_enabled_impl();
  id v17 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  uint64_t v18 = v17;
  if (v16) {
    CFStringRef v19 = @"CONTINUE_WATCHING_ART_TITLE";
  }
  else {
    CFStringRef v19 = @"UP_NEXT_ART_TITLE";
  }
  v36 = [v17 localizedStringForKey:v19 value:&stru_18968 table:@"TVSettings"];

  v20 = +[PSSpecifier preferenceSpecifierNamed:v36 target:self set:"setUpNextLockupsUseCoverArt:" get:"upNextLockupsUseCoverArt" detail:objc_opt_class() cell:2 edit:0];
  uint64_t v21 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  uint64_t v22 = [v21 localizedStringForKey:@"UP_NEXT_ART_STILL_FRAME" value:&stru_18968 table:@"TVSettings"];
  v23 = (void *)v22;
  if (v22) {
    CFStringRef v24 = (const __CFString *)v22;
  }
  else {
    CFStringRef v24 = &stru_18968;
  }
  v40[0] = v24;
  v25 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  uint64_t v26 = [v25 localizedStringForKey:@"UP_NEXT_ART_POSTER_ART" value:&stru_18968 table:@"TVSettings"];
  id v27 = (void *)v26;
  if (v26) {
    CFStringRef v28 = (const __CFString *)v26;
  }
  else {
    CFStringRef v28 = &stru_18968;
  }
  v40[1] = v28;
  uint64_t v29 = +[NSArray arrayWithObjects:v40 count:2];
  [v20 setValues:&off_1B998 titles:v29];

  [v20 setProperty:&__kCFBooleanTrue forKey:v12];
  int v30 = _os_feature_enabled_impl();
  id v31 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  v32 = v31;
  if (v30) {
    CFStringRef v33 = @"CONTINUE_WATCHING_ART_DESCRIPTION";
  }
  else {
    CFStringRef v33 = @"UP_NEXT_ART_DESCRIPTION";
  }
  v34 = [v31 localizedStringForKey:v33 value:&stru_18968 table:@"TVSettings"];

  [v20 setProperty:v34 forKey:PSStaticTextMessageKey];
  [v20 setProperty:@"com.apple.videos:UpNextDisplay" forKey:v13];
  [v39 addObject:v20];

  return v39;
}

- (void)_syncDevicePreferenceValues
{
  objc_initWeak(&location, self);
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  BOOL v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9718;
  block[3] = &unk_18728;
  id v4 = v3;
  int v11 = v4;
  dispatch_async(v2, block);
  dispatch_group_enter(v4);
  v7[1] = _NSConcreteStackBlock;
  v7[2] = (id)3221225472;
  v7[3] = sub_9768;
  v7[4] = &unk_18750;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  CFStringRef v8 = v5;
  WLKFetchIsSportsEnabled();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_97CC;
  v6[3] = &unk_18700;
  objc_copyWeak(v7, &location);
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_showPrivacySheet:(id)a3
{
  id v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.tvapp"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (int64_t)_alertStyle
{
  BOOL v3 = +[UITraitCollection traitCollectionWithHorizontalSizeClass:2];
  id v4 = [(TopLevelSettingsController *)self traitCollection];
  unsigned int v5 = [v4 containsTraitsInCollection:v3];

  return v5;
}

- (id)_accessStatusForSpecifier:(id)a3
{
  BOOL v3 = [a3 userInfo];
  id v4 = +[WLKSettingsStore sharedSettings];
  unsigned int v5 = [v3 channelID];
  uint64_t v6 = [v3 externalID];
  uint64_t v7 = [v4 settingsForChannelID:v5 externalID:v6];

  if ([v7 accessStatus] == (char *)&dword_0 + 1) {
    CFStringRef v8 = &__kCFBooleanTrue;
  }
  else {
    CFStringRef v8 = &__kCFBooleanFalse;
  }

  return v8;
}

- (id)upNextEnabled
{
  uint64_t v2 = +[WLKSystemPreferencesStore sharedPreferences];
  BOOL v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 privateModeEnabled] ^ 1);

  return v3;
}

- (void)_setPlayHistoryEnabled:(id)a3
{
  uint64_t v3 = [a3 BOOLValue] ^ 1;
  id v4 = +[WLKSystemPreferencesStore sharedPreferences];
  [v4 setPrivateModeEnabled:v3];
}

- (void)setPlayHistoryEnabled:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[WLKSystemPreferencesStore sharedPreferences];
  uint64_t v6 = [v5 privateModeEnabled] ^ 1;

  id v8 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_PRIVATE_MODE_ENABLED" defaultValue:@"Toggle Play History Enabled"];
  uint64_t v7 = +[NSNumber numberWithBool:v6];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v4 oldValue:v7 specifier:0 actionName:v8 setSelector:"_setPlayHistoryEnabled:"];
}

- (id)sportsScoreSpoilersAllowed
{
  uint64_t v2 = +[WLKSystemPreferencesStore sharedPreferences];
  uint64_t v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 sportsScoreSpoilersAllowed]);

  return v3;
}

- (void)_setSportsScoreSpoilersAllowed:(id)a3
{
  id v4 = a3;
  id v5 = [v4 BOOLValue];
  uint64_t v6 = +[WLKSystemPreferencesStore sharedPreferences];
  [v6 setSportsScoreSpoilersAllowed:v5];

  uint64_t v7 = sub_7804();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Settings Show Sports Scores value changed to %d", (uint8_t *)v9, 8u);
  }

  id v8 = +[PluginAnalytics sharedInstance];
  [v8 recordSettingsChange:@"showSportsScores" value:v4];

  [(TopLevelSettingsController *)self reloadSpecifierID:@"com.apple.videos:SportsSpoilers"];
}

- (void)setSportsScoreSpoilersAllowed:(id)a3
{
  id v4 = a3;
  id v5 = +[WLKSystemPreferencesStore sharedPreferences];
  id v6 = [v5 sportsScoreSpoilersAllowed];

  id v8 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_SHOW_SPORTS_SCORES" defaultValue:@"Toggle Show Sports Scores"];
  uint64_t v7 = +[NSNumber numberWithBool:v6];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v4 oldValue:v7 specifier:0 actionName:v8 setSelector:"_setSportsScoreSpoilersAllowed:"];
}

- (id)postPlayAutoPlayNextVideo
{
  uint64_t v2 = +[WLKSystemPreferencesStore sharedPreferences];
  uint64_t v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 postPlayAutoPlayNextVideo]);

  return v3;
}

- (void)_setPostPlayAutoPlayNextVideo:(id)a3
{
  id v4 = [a3 BOOLValue];
  id v5 = +[WLKSystemPreferencesStore sharedPreferences];
  [v5 setPostPlayAutoPlayNextVideo:v4];

  [(TopLevelSettingsController *)self reloadSpecifierID:@"com.apple.videos:AutoPlayNextVideo"];
}

- (void)setPostPlayAutoPlayNextVideo:(id)a3
{
  id v4 = a3;
  id v5 = +[WLKSystemPreferencesStore sharedPreferences];
  id v6 = [v5 postPlayAutoPlayNextVideo];

  id v8 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_AUTOPLAY_NEXT_VIDEO" defaultValue:@"Toggle Auto Play Next Video"];
  uint64_t v7 = +[NSNumber numberWithBool:v6];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v4 oldValue:v7 specifier:0 actionName:v8 setSelector:"_setPostPlayAutoPlayNextVideo:"];
}

- (id)upNextLockupsUseCoverArt
{
  uint64_t v2 = +[WLKSystemPreferencesStore sharedPreferences];
  uint64_t v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 upNextLockupsUseCoverArt]);

  return v3;
}

- (void)_setUpNextLockupsUseCoverArt:(id)a3
{
  id v4 = a3;
  id v5 = +[WLKSystemPreferencesStore sharedPreferences];
  id v6 = [v4 BOOLValue];

  [v5 setUpNextLockupsUseCoverArt:v6];

  [(TopLevelSettingsController *)self reloadSpecifierID:@"com.apple.videos:UpNextDisplay"];
}

- (void)setUpNextLockupsUseCoverArt:(id)a3
{
  id v4 = a3;
  id v5 = +[WLKSystemPreferencesStore sharedPreferences];
  id v6 = [v5 upNextLockupsUseCoverArt];

  if (_os_feature_enabled_impl()) {
    CFStringRef v7 = @"UNDO_CONTINUE_WATCHING_DISPLAY";
  }
  else {
    CFStringRef v7 = @"UNDO_UP_NEXT_DISPLAY";
  }
  id v9 = +[TopLevelSettingsController preferencesExtendedLocalizedName:v7 defaultValue:@"Change Continue Watching Display Selection"];
  id v8 = +[NSNumber numberWithBool:v6];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v4 oldValue:v8 specifier:0 actionName:v9 setSelector:"_setUpNextLockupsUseCoverArt:"];
}

- (id)homeSharingAppleID
{
  uint64_t v2 = +[HSAccountStore defaultStore];
  uint64_t v3 = [v2 appleID];

  return v3;
}

- (id)systemAllowTVCellularDataEnabledForSpecifier:(id)a3
{
  uint64_t v3 = *(PSSpecifierRedirecter **)((char *)&self->_permissionSpecifierRedirecter + 4);
  if (v3)
  {
    uint64_t v3 = [v3 performGetter:a3];
  }

  return v3;
}

- (void)setSystemAllowTVCellularDataEnabled:(id)a3 forSpecifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  CFStringRef v7 = *(PSSpecifierRedirecter **)((char *)&self->_permissionSpecifierRedirecter + 4);
  if (v7) {
    [v7 performSetter:v8 specifier:v6];
  }
  [(TopLevelSettingsController *)self _updateUIAfterChangingCellularUse:v8 specifier:v6];
}

- (id)useCellularDataPlayback:(id)a3
{
  uint64_t v3 = +[WLKSystemPreferencesStore sharedPreferences];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 useCellularDataPlayback]);

  return v4;
}

+ (id)_deeplinkForSpecifierName:(id)a3
{
  uint64_t v3 = [@"settings-navigation://com.apple.Settings.Apps/com.apple.tv/" stringByAppendingString:a3];
  id v4 = +[NSURL URLWithString:v3];

  return v4;
}

+ (id)preferencesExtendedLocalizedName:(id)a3 defaultValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CFStringRef v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 bundleURL];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  long long v10 = +[NSLocale currentLocale];
  id v11 = [v9 initWithKey:v6 defaultValue:v5 table:@"TVSettings" locale:v10 bundleURL:v8];

  return v11;
}

- (void)_performSetOperationWithUndo:(id)a3 oldValue:(id)a4 specifier:(id)a5 actionName:(id)a6 setSelector:(SEL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v13 != v12)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_A690;
    v31[3] = &unk_18778;
    id v16 = v14;
    id v32 = v16;
    SEL v33 = a7;
    id v17 = objc_retainBlock(v31);
    if (v16)
    {
      uint64_t v18 = [v16 identifier];
    }
    else
    {
      uint64_t v18 = @"NO_SPECIFIER";
    }
    NSLog(@"TVSettingsLog - setting specifier %@ to value %@", v18, v12);
    ((void (*)(void *, TopLevelSettingsController *, id))v17[2])(v17, self, v12);
    CFStringRef v19 = [(TopLevelSettingsController *)self navigationController];
    v20 = [v19 visibleViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v20;
      id v21 = [v13 copy];
      objc_initWeak(&location, self);
      uint64_t v22 = +[TopLevelSettingsController _deeplinkForSpecifierName:v18];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_A6B4;
      v25[3] = &unk_187A0;
      objc_copyWeak(&v29, &location);
      uint64_t v26 = v18;
      id v23 = v21;
      id v27 = v23;
      CFStringRef v28 = v17;
      objc_msgSend(v24, "pe_registerUndoActionName:associatedDeepLink:undoAction:", v15, v22, v25);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_setUseCellularDataPlayback:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TopLevelSettingsController *)self rootController];
  [v8 setPreferenceValue:v7 specifier:v6];

  id v9 = +[WLKSystemPreferencesStore sharedPreferences];
  id v10 = [v7 BOOLValue];

  [v9 setUseCellularDataPlayback:v10];

  [(TopLevelSettingsController *)self _updateCellularQualitySpecifiersAnimated:1 shouldUpdateUsingTableView:1 forPlayback:1];
}

- (void)setUseCellularDataPlayback:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[WLKSystemPreferencesStore sharedPreferences];
  id v9 = [v8 useCellularDataPlayback];

  id v11 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_USE_CELLULAR_PLAYBACK" defaultValue:@"Toggle Use Cellular for Streaming"];
  id v10 = +[NSNumber numberWithBool:v9];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v7 oldValue:v10 specifier:v6 actionName:v11 setSelector:"_setUseCellularDataPlayback:specifier:"];
}

- (id)showPlaybackQualityWifi:(id)a3
{
  uint64_t v3 = +[WLKSystemPreferencesStore sharedPreferences];
  id v4 = [v3 wifiQualityPlayback];

  return v4;
}

- (void)_setShowPlaybackQualityWifi:(id)a3 specifier:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id v7 = [(TopLevelSettingsController *)self rootController];
  [v7 setPreferenceValue:v6 specifier:v10];

  id v8 = +[WLKSystemPreferencesStore sharedPreferences];
  id v9 = [v6 stringValue];

  [v8 setWifiQualityPlayback:v9];
  [(TopLevelSettingsController *)self reloadSpecifier:v10];
}

- (void)setShowPlaybackQualityWifi:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[WLKSystemPreferencesStore sharedPreferences];
  id v14 = [v8 wifiQualityPlayback];

  int v9 = WLKIsRegulatedSKU();
  id v10 = @"UNDO_WIFI_QUALITY_PLAYBACK";
  if (v9) {
    id v10 = @"UNDO_WLAN_QUALITY_PLAYBACK";
  }
  id v11 = v10;
  if (WLKIsRegulatedSKU()) {
    CFStringRef v12 = @"Change Streaming WLAN Quality";
  }
  else {
    CFStringRef v12 = @"Change Streaming Wi-Fi Quality";
  }
  id v13 = +[TopLevelSettingsController preferencesExtendedLocalizedName:v11 defaultValue:v12];

  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v7 oldValue:v14 specifier:v6 actionName:v13 setSelector:"_setShowPlaybackQualityWifi:specifier:"];
}

- (id)showPlaybackQualityCellular:(id)a3
{
  uint64_t v3 = +[WLKSystemPreferencesStore sharedPreferences];
  id v4 = [v3 cellularQualityPlayback];

  return v4;
}

- (void)_setShowPlaybackQualityCellular:(id)a3 specifier:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id v7 = [(TopLevelSettingsController *)self rootController];
  [v7 setPreferenceValue:v6 specifier:v10];

  id v8 = +[WLKSystemPreferencesStore sharedPreferences];
  int v9 = [v6 stringValue];

  [v8 setCellularQualityPlayback:v9];
  [(TopLevelSettingsController *)self reloadSpecifier:v10];
}

- (void)setShowPlaybackQualityCellular:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[WLKSystemPreferencesStore sharedPreferences];
  id v10 = [v8 cellularQualityPlayback];

  int v9 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_CELLULAR_QUALITY_PLAYBACK" defaultValue:@"Change Streaming Cellular Quality"];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v7 oldValue:v10 specifier:v6 actionName:v9 setSelector:"_setShowPlaybackQualityCellular:specifier:"];
}

- (id)useCellularDataDownload:(id)a3
{
  uint64_t v3 = +[WLKSystemPreferencesStore sharedPreferences];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 useCellularDataDownload]);

  return v4;
}

- (void)_setUseCellularDataDownload:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TopLevelSettingsController *)self rootController];
  [v8 setPreferenceValue:v7 specifier:v6];

  int v9 = +[WLKSystemPreferencesStore sharedPreferences];
  id v10 = [v7 BOOLValue];

  [v9 setUseCellularDataDownload:v10];

  [(TopLevelSettingsController *)self _updateCellularQualitySpecifiersAnimated:1 shouldUpdateUsingTableView:1 forPlayback:0];
}

- (void)setUseCellularDataDownload:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[WLKSystemPreferencesStore sharedPreferences];
  id v9 = [v8 useCellularDataDownload];

  id v11 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_USE_CELLULAR_DOWNLOADS" defaultValue:@"Toggle Use Cellular Data for Downloads"];
  id v10 = +[NSNumber numberWithBool:v9];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v7 oldValue:v10 specifier:v6 actionName:v11 setSelector:"_setUseCellularDataDownload:specifier:"];
}

- (id)showDownloadQualityWifi:(id)a3
{
  uint64_t v3 = +[WLKSystemPreferencesStore sharedPreferences];
  id v4 = [v3 wifiQualityDownload];

  return v4;
}

- (void)_setShowDownloadQualityWifi:(id)a3 specifier:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  id v7 = [(TopLevelSettingsController *)self rootController];
  [v7 setPreferenceValue:v6 specifier:v11];

  id v8 = +[WLKSystemPreferencesStore sharedPreferences];
  id v9 = [v6 stringValue];
  [v8 setWifiQualityDownload:v9];

  LODWORD(v8) = [VideosDownloadQualityValueBestQuality isEqualToString:v6];
  if (v8) {
    id v10 = &__kCFBooleanTrue;
  }
  else {
    id v10 = &__kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"VideosAllowHDREnabledSetting", v10, @"com.apple.mobileipod");
  CFPreferencesAppSynchronize(@"com.apple.mobileipod");
  [(TopLevelSettingsController *)self reloadSpecifier:v11];
  notify_post("com.apple.mobileipod-prefsChanged");
}

- (void)setShowDownloadQualityWifi:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[WLKSystemPreferencesStore sharedPreferences];
  id v14 = [v8 wifiQualityDownload];

  int v9 = WLKIsRegulatedSKU();
  id v10 = @"UNDO_WIFI_QUALITY_DOWNLOADS";
  if (v9) {
    id v10 = @"UNDO_WLAN_QUALITY_DOWNLOADS";
  }
  id v11 = v10;
  if (WLKIsRegulatedSKU()) {
    CFStringRef v12 = @"Change Download WLAN Quality";
  }
  else {
    CFStringRef v12 = @"Change Download Wi-Fi Quality";
  }
  id v13 = +[TopLevelSettingsController preferencesExtendedLocalizedName:v11 defaultValue:v12];

  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v7 oldValue:v14 specifier:v6 actionName:v13 setSelector:"_setShowDownloadQualityWifi:specifier:"];
}

- (id)showDownloadQualityCellular:(id)a3
{
  uint64_t v3 = +[WLKSystemPreferencesStore sharedPreferences];
  id v4 = [v3 cellularQualityDownload];

  return v4;
}

- (void)_setShowDownloadQualityCellular:(id)a3 specifier:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id v7 = [(TopLevelSettingsController *)self rootController];
  [v7 setPreferenceValue:v6 specifier:v10];

  id v8 = +[WLKSystemPreferencesStore sharedPreferences];
  int v9 = [v6 stringValue];

  [v8 setCellularQualityDownload:v9];
  [(TopLevelSettingsController *)self reloadSpecifier:v10];
}

- (void)setShowDownloadQualityCellular:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[WLKSystemPreferencesStore sharedPreferences];
  id v10 = [v8 cellularQualityDownload];

  int v9 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_CELLULAR_QUALITY_DOWNLOAD" defaultValue:@"Change Download Cellular Quality"];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v7 oldValue:v10 specifier:v6 actionName:v9 setSelector:"_setShowDownloadQualityCellular:specifier:"];
}

- (id)preferredPurchaseResolution:(id)a3
{
  uint64_t v3 = +[WLKSystemPreferencesStore sharedPreferences];
  id v4 = [v3 purchaseResolution];

  return v4;
}

- (void)_setPreferredPurchaseResolution:(id)a3 specifier:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id v7 = [(TopLevelSettingsController *)self rootController];
  [v7 setPreferenceValue:v6 specifier:v10];

  id v8 = +[WLKSystemPreferencesStore sharedPreferences];
  int v9 = [v6 stringValue];

  [v8 setPurchaseResolution:v9];
  [(TopLevelSettingsController *)self reloadSpecifier:v10];
}

- (void)setPreferredPurchaseResolution:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[WLKSystemPreferencesStore sharedPreferences];
  id v10 = [v8 purchaseResolution];

  int v9 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_VIDEO_DEFINITION" defaultValue:@"Change Video Defintion"];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v7 oldValue:v10 specifier:v6 actionName:v9 setSelector:"_setPreferredPurchaseResolution:specifier:"];
}

- (id)downloadsCompatibleWithAVAdapter:(id)a3
{
  uint64_t v3 = +[WLKSystemPreferencesStore sharedPreferences];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 downloadsCompatibleWithAVAdapter]);

  return v4;
}

- (void)_setDownloadsCompatibleWithAVAdapter:(id)a3 specifier:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = +[WLKSystemPreferencesStore sharedPreferences];
  id v8 = [v6 BOOLValue];

  [v7 setDownloadsCompatibleWithAVAdapter:v8];
  [(TopLevelSettingsController *)self reloadSpecifier:v9];
}

- (void)setDownloadsCompatibleWithAVAdapter:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[WLKSystemPreferencesStore sharedPreferences];
  id v9 = [v8 downloadsCompatibleWithAVAdapter];

  id v11 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_DOWNLOADS_COMPATIBLE_WITH_AV" defaultValue:@"Toggle Downloads Compatible With AV Adapter"];
  id v10 = +[NSNumber numberWithBool:v9];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v7 oldValue:v10 specifier:v6 actionName:v11 setSelector:"_setDownloadsCompatibleWithAVAdapter:specifier:"];
}

- (NSArray)selectedAudioLanguages
{
  uint64_t v3 = *(NSArray **)((char *)&self->_selectedAudioLanguages + 4);
  if (v3) {
    goto LABEL_13;
  }
  id v4 = +[WLKSystemPreferencesStore sharedPreferences];
  id v5 = [v4 selectedAudioLanguagesDownload];

  if (![(NSArray *)v5 count])
  {
    v12[0] = @"ORIGINAL_AUDIO_LANGUAGE";
    v12[1] = @"DEVICE_AUDIO_LANGUAGE";
    id v6 = +[NSArray arrayWithObjects:v12 count:2];
    goto LABEL_6;
  }
  if ([(NSArray *)v5 containsObject:@"DEFAULT_LANGUAGE"])
  {
    id v6 = (NSArray *)[(NSArray *)v5 mutableCopy];
    [(NSArray *)v6 removeObject:@"DEFAULT_LANGUAGE"];
    [(NSArray *)v6 insertObject:@"ORIGINAL_AUDIO_LANGUAGE" atIndex:0];
    [(NSArray *)v6 insertObject:@"DEVICE_AUDIO_LANGUAGE" atIndex:1];
LABEL_6:

    id v5 = v6;
  }
  if ([(NSArray *)v5 containsObject:@"DEVICE_AUDIO_LANGUAGE"])
  {
    id v7 = +[NSLocale preferredLanguages];
    id v8 = [v7 firstObject];

    if (v8 && [(NSArray *)v5 containsObject:v8])
    {
      id v9 = (NSArray *)[(NSArray *)v5 mutableCopy];
      [(NSArray *)v9 removeObject:v8];

      id v5 = v9;
    }
  }
  id v10 = *(NSArray **)((char *)&self->_selectedAudioLanguages + 4);
  *(NSArray **)((char *)&self->_selectedAudioLanguages + 4) = v5;

  uint64_t v3 = *(NSArray **)((char *)&self->_selectedAudioLanguages + 4);
LABEL_13:

  return (NSArray *)v3;
}

- (void)_setSelectedAudioLanguages:(id)a3
{
  id v4 = (NSArray *)a3;
  id v5 = +[WLKSystemPreferencesStore sharedPreferences];
  [v5 setSelectedAudioLanguagesDownload:v4];

  id v6 = *(NSArray **)((char *)&self->_selectedAudioLanguages + 4);
  *(NSArray **)((char *)&self->_selectedAudioLanguages + 4) = v4;
  id v7 = v4;

  id v8 = +[NSNotificationCenter defaultCenter];

  [v8 postNotificationName:@"PreferredAudioLanguagesDidChangeNotification" object:self];

  [(TopLevelSettingsController *)self reloadSpecifiers];
}

- (void)setSelectedAudioLanguages:(id)a3
{
  id v4 = a3;
  id v5 = +[WLKSystemPreferencesStore sharedPreferences];
  id v7 = [v5 selectedAudioLanguagesDownload];

  id v6 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_AUDIO_LANGUAGE_OPERATION" defaultValue:@"Modify Audio Languages"];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v4 oldValue:v7 specifier:0 actionName:v6 setSelector:"_setSelectedAudioLanguages:"];
}

- (NSArray)preferredSubtitleLanguageCodes
{
  uint64_t v2 = +[WLKSystemPreferencesStore sharedPreferences];
  uint64_t v3 = [v2 subtitleAudioLanguagesDownload];

  return (NSArray *)v3;
}

- (void)_setPreferredSubtitleLanguageCodes:(id)a3
{
  id v4 = a3;
  id v5 = +[WLKSystemPreferencesStore sharedPreferences];
  [v5 setSubtitleAudioLanguagesDownload:v4];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"PreferredSubtitleLanguagesDidChangeNotification" object:self];
}

- (void)setPreferredSubtitleLanguageCodes:(id)a3
{
  id v4 = a3;
  id v5 = +[WLKSystemPreferencesStore sharedPreferences];
  id v7 = [v5 subtitleAudioLanguagesDownload];

  id v6 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_SUBTITLE_LANGUAGE_OPERATION" defaultValue:@"Modify Subtitle Languages"];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v4 oldValue:v7 specifier:0 actionName:v6 setSelector:"_setPreferredSubtitleLanguageCodes:"];
}

- (NSNumber)useDefaultSubtitleLanguages
{
  uint64_t v2 = +[WLKSystemPreferencesStore sharedPreferences];
  uint64_t v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 subtitleDefaultLanguageEnabledDownload]);

  return (NSNumber *)v3;
}

- (void)_setUseDefaultSubtitleLanguages:(id)a3
{
  id v3 = a3;
  id v5 = +[WLKSystemPreferencesStore sharedPreferences];
  id v4 = [v3 BOOLValue];

  [v5 setSubtitleDefaultLanguageEnabledDownload:v4];
}

- (void)setUseDefaultSubtitleLanguages:(id)a3
{
  id v4 = a3;
  id v5 = +[WLKSystemPreferencesStore sharedPreferences];
  id v6 = [v5 subtitleDefaultLanguageEnabledDownload];

  id v8 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_DEFAULT_SUBTITLE_LANGUAGES" defaultValue:@"Toggle Default Subtitle Languages"];
  id v7 = +[NSNumber numberWithBool:v6];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v4 oldValue:v7 specifier:0 actionName:v8 setSelector:"_setUseDefaultSubtitleLanguages:"];
}

- (id)preferredPlaybackDimensionality
{
  uint64_t v2 = +[WLKSystemPreferencesStore sharedPreferences];
  id v3 = [v2 preferredPlaybackDimensionality];

  return v3;
}

- (void)_setPreferredPlaybackDimensionality:(id)a3
{
  id v4 = a3;
  id v5 = +[WLKSystemPreferencesStore sharedPreferences];
  [v5 setPreferredPlaybackDimensionality:v4];

  [(TopLevelSettingsController *)self reloadSpecifierID:@"com.apple.videos:VideosPlaybackMode"];
}

- (void)setPreferredPlaybackDimensionality:(id)a3
{
  id v4 = a3;
  id v5 = +[WLKSystemPreferencesStore sharedPreferences];
  id v7 = [v5 preferredPlaybackDimensionality];

  id v6 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_PREFERRED_PLAYBACK" defaultValue:@"Toggle Preferred Playback Dimensionality"];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v4 oldValue:v7 specifier:0 actionName:v6 setSelector:"_setPreferredPlaybackDimensionality:"];
}

- (void)homeSharingSignInButtonAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TopLevelSettingsController *)self parentController];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (TopLevelSettingsController *)v5;
  }
  else {
    id v7 = self;
  }
  id v8 = v7;

  id v9 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  [v9 setIsEphemeral:1];
  [v9 setPresentingViewController:v8];
  id v10 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  id v11 = [v10 localizedStringForKey:@"HOME_SHARING" value:&stru_18968 table:@"TVSettings"];
  [v9 setReason:v11];

  objc_initWeak(&location, self);
  id v12 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_C120;
  v14[3] = &unk_187F0;
  objc_copyWeak(&v16, &location);
  id v13 = v8;
  id v15 = v13;
  [v12 authenticateWithContext:v9 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)homeSharingSignOutButtonAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TopLevelSettingsController *)self parentController];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (TopLevelSettingsController *)v5;
  }
  else {
    id v7 = self;
  }
  id v8 = v7;

  objc_initWeak(&location, self);
  id v9 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  id v10 = [v9 localizedStringForKey:@"HOME_SHARING_APPLE_ID" value:&stru_18968 table:@"TVSettings"];
  id v11 = [(TopLevelSettingsController *)self homeSharingAppleID];
  id v12 = +[UIAlertController alertControllerWithTitle:v10 message:v11 preferredStyle:1];

  id v13 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  id v14 = [v13 localizedStringForKey:@"CANCEL" value:&stru_18968 table:@"TVSettings"];
  id v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:0];
  [v12 addAction:v15];

  id v16 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  id v17 = [v16 localizedStringForKey:@"HOME_SHARING_SIGN_OUT" value:&stru_18968 table:@"TVSettings"];
  CFStringRef v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  id v21 = sub_C798;
  uint64_t v22 = &unk_18818;
  objc_copyWeak(&v23, &location);
  uint64_t v18 = +[UIAlertAction actionWithTitle:v17 style:0 handler:&v19];
  objc_msgSend(v12, "addAction:", v18, v19, v20, v21, v22);

  [(TopLevelSettingsController *)v8 presentViewController:v12 animated:1 completion:0];
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

- (void)_updateUIAfterChangingCellularUse:(id)a3 specifier:(id)a4
{
  [(TopLevelSettingsController *)self _updateCellularSpecifiersAnimated:1 shouldUpdateUsingTableView:1];
  [(TopLevelSettingsController *)self _updateCellularQualitySpecifiersAnimated:1 shouldUpdateUsingTableView:1 forPlayback:1];

  [(TopLevelSettingsController *)self _updateCellularQualitySpecifiersAnimated:1 shouldUpdateUsingTableView:1 forPlayback:0];
}

- (void)_updateCellularSpecifiersAnimated:(BOOL)a3 shouldUpdateUsingTableView:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = a3 && a4;
  if (a3 && a4) {
    [(TopLevelSettingsController *)self beginUpdates];
  }
  char v8 = MGGetBoolAnswer();
  id v9 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  id v10 = v9;
  if (v8)
  {
    id v22 = [v9 localizedStringForKey:@"PLAYBACK_QUALITY_WLAN" value:&stru_18968 table:@"TVSettings"];

    id v11 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    id v12 = v11;
    CFStringRef v13 = @"DOWNLOAD_QUALITY_WLAN";
  }
  else
  {
    id v22 = [v9 localizedStringForKey:@"PLAYBACK_QUALITY_WIFI" value:&stru_18968 table:@"TVSettings"];

    id v11 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    id v12 = v11;
    CFStringRef v13 = @"DOWNLOAD_QUALITY_WIFI";
  }
  id v14 = [v11 localizedStringForKey:v13 value:&stru_18968 table:@"TVSettings"];

  uint64_t v15 = OBJC_IVAR___PSListController__specifiers;
  id v16 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] specifierForID:@"com.apple.videos:DownloadQualityWifi"];
  uint64_t v17 = PSTitleKey;
  [v16 setProperty:v14 forKey:PSTitleKey];
  [v16 setName:v14];
  if (v4) {
    [(TopLevelSettingsController *)self reloadSpecifier:v16 animated:v5];
  }
  id v18 = [*(id *)&self->super.PSListController_opaque[v15] mutableCopy];
  [(TopLevelSettingsController *)self _updateCellularSpecifierVisibility:*(PSSpecifier **)((char *)&self->_downloadCellularSpecifier + 4) shouldUpdateUsingTableView:v4 animated:v5 mutableSpecifiers:v18];
  CFStringRef v19 = [*(id *)&self->super.PSListController_opaque[v15] specifierForID:@"com.apple.videos:PlaybackQualityWifi"];
  [v19 setProperty:v22 forKey:v17];
  [v19 setName:v22];
  if (v4)
  {
    [(TopLevelSettingsController *)self reloadSpecifier:v19 animated:v5];
    [(TopLevelSettingsController *)self _updateCellularSpecifierVisibility:*(PSSpecifier **)((char *)&self->_playbackCellularSpecifier + 4) shouldUpdateUsingTableView:1 animated:v5 mutableSpecifiers:v18];
    if (v7) {
      [(TopLevelSettingsController *)self endUpdates];
    }
  }
  else
  {
    [(TopLevelSettingsController *)self _updateCellularSpecifierVisibility:*(PSSpecifier **)((char *)&self->_playbackCellularSpecifier + 4) shouldUpdateUsingTableView:0 animated:v5 mutableSpecifiers:v18];
    if (([*(id *)&self->super.PSListController_opaque[v15] isEqualToArray:v18] & 1) == 0
      && *(id *)&self->super.PSListController_opaque[v15] != v18)
    {
      id v20 = [v18 copy];
      id v21 = *(void **)&self->super.PSListController_opaque[v15];
      *(void *)&self->super.PSListController_opaque[v15] = v20;
    }
  }
}

- (void)_updateCellularSpecifierVisibility:(id)a3 shouldUpdateUsingTableView:(BOOL)a4 animated:(BOOL)a5 mutableSpecifiers:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if ([(TopLevelSettingsController *)self _okayToShowCellularPlaybackAndDownloadSettings]|| [(TopLevelSettingsController *)self _isDebugMode])
  {
    uint64_t v12 = OBJC_IVAR___PSListController__specifiers;
    CFStringRef v13 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    id v14 = [v10 identifier];
    uint64_t v15 = [v13 specifierForID:v14];

    if (!v15)
    {
      id v16 = [v10 identifier];
      unsigned __int8 v17 = [v16 isEqualToString:@"com.apple.videos:CellularDataMode"];

      if (v17)
      {
        CFStringRef v18 = @"com.apple.videos:PlaybackQualityGroup";
      }
      else
      {
        CFStringRef v19 = [v10 identifier];
        unsigned int v20 = [v19 isEqualToString:@"com.apple.videos:CellularDataModeDownload"];

        if (!v20) {
          goto LABEL_13;
        }
        CFStringRef v18 = @"com.apple.videos:DownloadQualityGroup";
      }
      uint64_t v21 = [*(id *)&self->super.PSListController_opaque[v12] specifierForID:v18];
      if (v21)
      {
        id v22 = v21;
        if (v8)
        {
          [(TopLevelSettingsController *)self insertSpecifier:v10 afterSpecifier:v21 animated:v7];
        }
        else
        {
          id v23 = (char *)[*(id *)&self->super.PSListController_opaque[v12] indexOfObject:v21];
          id v24 = (char *)[v11 count];
          if (v23 + 1 < v24) {
            v25 = v23 + 1;
          }
          else {
            v25 = v24;
          }
          [v11 insertObject:v10 atIndex:v25];
        }
LABEL_20:

        goto LABEL_21;
      }
LABEL_13:
      id v22 = sub_7804();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138412290;
        id v27 = v10;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "[TVLog] Error: No group found for invalid cellular specifier used for visibility update %@", (uint8_t *)&v26, 0xCu);
      }
      goto LABEL_20;
    }
  }
  else if (v8)
  {
    [(TopLevelSettingsController *)self removeSpecifier:v10 animated:v7];
  }
  else
  {
    [v11 removeObject:v10];
  }
LABEL_21:
}

- (void)_updateCellularQualitySpecifiersAnimated:(BOOL)a3 shouldUpdateUsingTableView:(BOOL)a4 forPlayback:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  BOOL v9 = a3 && a4;
  if (a3 && a4) {
    [(TopLevelSettingsController *)self beginUpdates];
  }
  id v10 = &OBJC_IVAR___TopLevelSettingsController__downloadQualityCellularSpecifier;
  if (v5) {
    id v10 = &OBJC_IVAR___TopLevelSettingsController__playbackQualityCellularSpecifier;
  }
  id v11 = *(id *)&self->super.PSListController_opaque[*v10];
  uint64_t v12 = +[WLKSystemPreferencesStore sharedPreferences];
  CFStringRef v13 = v12;
  if (v5) {
    unsigned int v14 = [v12 useCellularDataPlayback];
  }
  else {
    unsigned int v14 = [v12 useCellularDataDownload];
  }
  unsigned int v15 = v14;

  if ([(TopLevelSettingsController *)self _okayToShowCellularPlaybackAndDownloadSettings]&& v15)
  {
    id v16 = (id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    id v17 = [*v16 mutableCopy];
  }
  else
  {
    unsigned __int8 v18 = [(TopLevelSettingsController *)self _isDebugMode];
    id v16 = (id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    id v19 = [*v16 mutableCopy];
    id v17 = v19;
    if ((v18 & 1) == 0)
    {
      if (!v6)
      {
        [v19 removeObject:v11];
LABEL_38:
        if (([*v16 isEqualToArray:v17] & 1) == 0 && *v16 != v17)
        {
          id v32 = [v17 copy];
          id v33 = *v16;
          id *v16 = v32;
        }
        goto LABEL_41;
      }
      [(TopLevelSettingsController *)self removeSpecifier:v11 animated:v7];
      if (!v9) {
        goto LABEL_41;
      }
LABEL_37:
      [(TopLevelSettingsController *)self endUpdates];
      goto LABEL_41;
    }
  }
  id v20 = *v16;
  uint64_t v21 = [v11 identifier];
  id v22 = [v20 specifierForID:v21];

  if (v22)
  {
    if (!v6) {
      goto LABEL_38;
    }
  }
  else
  {
    if (v5) {
      CFStringRef v23 = @"com.apple.videos:CellularDataMode";
    }
    else {
      CFStringRef v23 = @"com.apple.videos:CellularDataModeDownload";
    }
    uint64_t v24 = [*v16 specifierForID:v23];
    if (!v24)
    {
      int v26 = sub_7804();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_EA58((uint64_t)v11, v26);
      }

      goto LABEL_41;
    }
    v25 = (void *)v24;
    if (v6)
    {
      [(TopLevelSettingsController *)self insertSpecifier:v11 afterSpecifier:v24 animated:v7];
    }
    else
    {
      id v27 = (char *)[*v16 indexOfObject:v24];
      CFStringRef v28 = (char *)[v17 count];
      if (v27 + 1 < v28) {
        id v29 = v27 + 1;
      }
      else {
        id v29 = v28;
      }
      [v17 insertObject:v11 atIndex:v29];
    }

    if (!v6) {
      goto LABEL_38;
    }
  }
  if (v5) {
    CFStringRef v30 = @"com.apple.videos:PlaybackQualityWifi";
  }
  else {
    CFStringRef v30 = @"com.apple.videos:DownloadQualityWifi";
  }
  id v31 = [*v16 specifierForID:v30];
  [(TopLevelSettingsController *)self reloadSpecifier:v11 animated:v7];
  [(TopLevelSettingsController *)self reloadSpecifier:v31 animated:v7];

  if (v9) {
    goto LABEL_37;
  }
LABEL_41:
}

- (void)_updateHomeSharingSpecifiersAnimated:(BOOL)a3 shouldUpdateUsingTableView:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  BOOL v7 = a3 && a4;
  if (a3 && a4) {
    [(TopLevelSettingsController *)self beginUpdates];
  }
  BOOL v8 = +[HSAccountStore defaultStore];
  id v33 = [v8 groupID];

  uint64_t v9 = OBJC_IVAR___PSListController__specifiers;
  id v10 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] mutableCopy];
  id v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = objc_alloc_init((Class)NSMutableArray);
  }
  CFStringRef v13 = v12;

  unsigned int v14 = [*(id *)&self->super.PSListController_opaque[v9] specifierForID:@"com.apple.videos:HomeSharingFooter"];
  unsigned __int8 v15 = [(TopLevelSettingsController *)self _isDebugMode];
  if (v33)
  {
    BOOL v32 = v7;
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = *(uint64_t *)((char *)&self->_homeSharingSignInButtonSpecifier + 4);
      if (v4) {
        [(TopLevelSettingsController *)self removeSpecifier:v16 animated:v5];
      }
      else {
        [v13 removeObject:v16];
      }
    }
    unsigned int v31 = v5;
    unsigned __int8 v18 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    id v19 = [v18 localizedStringForKey:@"HOME_SHARING_APPLE_ID_BUTTON" value:&stru_18968 table:@"TVSettings"];
    id v20 = [(TopLevelSettingsController *)self homeSharingAppleID];
    uint64_t v21 = +[NSString stringWithFormat:@"%@ %@", v19, v20];
    [*(id *)((char *)&self->_homeSharingSignOutButtonSpecifier + 4) setName:v21];

    id v22 = [*(id *)&self->super.PSListController_opaque[v9] specifierForID:@"com.apple.videos:HomeSharingSignOutButton"];

    if (v22)
    {
      uint64_t v5 = v31;
      BOOL v7 = v32;
      if (v4) {
        [(TopLevelSettingsController *)self reloadSpecifier:*(PSSpecifier **)((char *)&self->_homeSharingSignOutButtonSpecifier + 4) animated:v31];
      }
    }
    else if (v4)
    {
      uint64_t v5 = v31;
      [(TopLevelSettingsController *)self insertSpecifier:*(PSSpecifier **)((char *)&self->_homeSharingSignOutButtonSpecifier + 4) afterSpecifier:v14 animated:v31];
      BOOL v7 = v32;
    }
    else
    {
      CFStringRef v23 = (char *)[*(id *)&self->super.PSListController_opaque[v9] indexOfObject:v14];
      uint64_t v24 = (char *)[v13 count];
      if (v23 + 1 < v24) {
        v25 = v23 + 1;
      }
      else {
        v25 = v24;
      }
      [v13 insertObject:*(PSSpecifier **)((char *)&self->_homeSharingSignOutButtonSpecifier + 4) atIndex:v25];
      uint64_t v5 = v31;
      BOOL v7 = v32;
    }
    [v14 setObject:&stru_18968 forKeyedSubscript:PSFooterTextGroupKey];
    if (v4)
    {
LABEL_24:
      [(TopLevelSettingsController *)self reloadSpecifier:v14 animated:v5];
      if (v7) {
        [(TopLevelSettingsController *)self endUpdates];
      }
      goto LABEL_35;
    }
  }
  else
  {
    if ((v15 & 1) == 0)
    {
      uint64_t v17 = *(uint64_t *)((char *)&self->_homeSharingSignOutButtonSpecifier + 4);
      if (v4) {
        [(TopLevelSettingsController *)self removeSpecifier:v17 animated:v5];
      }
      else {
        [v13 removeObject:v17];
      }
    }
    int v26 = [*(id *)&self->super.PSListController_opaque[v9] specifierForID:@"com.apple.videos:HomeSharingSignInButton"];

    if (!v26) {
      [(TopLevelSettingsController *)self insertSpecifier:*(PSSpecifier **)((char *)&self->_homeSharingSignInButtonSpecifier + 4) afterSpecifier:v14 animated:v5];
    }
    id v27 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    CFStringRef v28 = [v27 localizedStringForKey:@"HOME_SHARING_FOOTER" value:&stru_18968 table:@"TVSettings"];
    [v14 setObject:v28 forKeyedSubscript:PSFooterTextGroupKey];

    if (v4) {
      goto LABEL_24;
    }
  }
  if (![v13 count])
  {

    CFStringRef v13 = 0;
  }
  if (([*(id *)&self->super.PSListController_opaque[v9] isEqualToArray:v13] & 1) == 0
    && *(void **)&self->super.PSListController_opaque[v9] != v13)
  {
    id v29 = [v13 copy];
    CFStringRef v30 = *(void **)&self->super.PSListController_opaque[v9];
    *(void *)&self->super.PSListController_opaque[v9] = v29;
  }
LABEL_35:
}

- (void)_updateRestrictions
{
  id v3 = +[MCProfileConnection sharedConnection];
  BOOL v4 = [v3 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed] != 2;

  uint64_t v5 = *(PSSpecifier **)((char *)&self->_homeSharingSignInButtonSpecifier + 4);
  BOOL v6 = +[NSNumber numberWithBool:v4];
  uint64_t v7 = PSEnabledKey;
  [v5 setProperty:v6 forKey:PSEnabledKey];

  BOOL v8 = *(PSSpecifier **)((char *)&self->_homeSharingSignOutButtonSpecifier + 4);
  id v9 = +[NSNumber numberWithBool:v4];
  [v8 setProperty:v9 forKey:v7];
}

- (id)downloadLanguageSpecifierSubtext:(id)a3
{
  BOOL v4 = [(TopLevelSettingsController *)self selectedAudioLanguages];
  uint64_t v5 = (char *)[v4 count];

  if (v5 != (unsigned char *)&dword_0 + 1)
  {
    id v10 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    uint64_t v11 = [v10 localizedStringForKey:@"LANGUAGE_COUNT" value:&stru_18968 table:@"TVSettings"];
    id v12 = (void *)v11;
    if (v11) {
      CFStringRef v13 = (__CFString *)v11;
    }
    else {
      CFStringRef v13 = &stru_18968;
    }
    unsigned int v14 = v13;

    uint64_t v7 = +[NSNumber numberWithInt:v5];
    unsigned __int8 v15 = +[NSNumberFormatter localizedStringFromNumber:v7 numberStyle:1];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);

    goto LABEL_12;
  }
  BOOL v6 = [(TopLevelSettingsController *)self selectedAudioLanguages];
  uint64_t v7 = [v6 firstObject];

  if ([v7 isEqualToString:@"ORIGINAL_AUDIO_LANGUAGE"])
  {
    BOOL v8 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    id v9 = [v8 localizedStringForKey:@"ORIGINAL_AUDIO_LANGUAGE" value:&stru_18968 table:@"TVSettings"];
LABEL_10:

    goto LABEL_12;
  }
  if ([v7 isEqualToString:@"DEVICE_AUDIO_LANGUAGE"])
  {
    BOOL v8 = +[NSLocale preferredLanguages];
    uint64_t v16 = [v8 firstObject];
    id v9 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v16];

    goto LABEL_10;
  }
  id v9 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v7];
LABEL_12:

  return v9;
}

- (id)preferredAudioLanguageCode:(id)a3
{
  id v3 = +[WLKSystemPreferencesStore sharedPreferences];
  BOOL v4 = [v3 audioLanguageCodeIncludingSentinel];

  return v4;
}

- (void)_setPreferredAudioLanguageCode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[WLKSystemPreferencesStore sharedPreferences];
  BOOL v6 = [v4 stringValue];

  [v5 setAudioLanguageCode:v6];

  [(TopLevelSettingsController *)self reloadSpecifiers];
}

- (void)setPreferredAudioLanguageCode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[WLKSystemPreferencesStore sharedPreferences];
  id v7 = [v5 audioLanguageCodeIncludingSentinel];

  BOOL v6 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"UNDO_SELECTED_AUDIO_LANGUAGE" defaultValue:@"Change Audio Language"];
  [(TopLevelSettingsController *)self _performSetOperationWithUndo:v4 oldValue:v7 specifier:0 actionName:v6 setSelector:"_setPreferredAudioLanguageCode:"];
}

- (id)availableAudioLanguageCodes:(id)a3
{
  return +[WLKSettingsLanguageUtilities availableAudioLanguageCodes];
}

- (id)availableAudioLanguageTitles:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v16 = v4;
  BOOL v6 = [(TopLevelSettingsController *)self availableAudioLanguageCodes:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    uint64_t v10 = VideosLanguagesAutoSentinelValue;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v12 isEqualToString:v10])
        {
          CFStringRef v13 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
          id v14 = [v13 localizedStringForKey:@"AUTO_PREFERRED_AUDIO_LANGUAGE" value:&stru_18968 table:@"TVSettings"];

          if (v14) {
            goto LABEL_11;
          }
        }
        else
        {
          id v14 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v12];
          if (v14) {
            goto LABEL_11;
          }
        }
        id v14 = v12;
LABEL_11:
        [v5 addObject:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_externalScreenTypeDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:kMRMediaRemoteExternalScreenTypeUserInfoKey];
  id v6 = [v5 unsignedIntValue];

  id v7 = [(TopLevelSettingsController *)self _descriptionForExternalScreenType:v6];
  NSLog(@"External screen type did change to %@", v7);

  if (v6 == 2)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_DBD0;
    block[3] = &unk_18700;
    objc_copyWeak(&v9, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_sceneWillConnect:(id)a3
{
  id v5 = [a3 object];
  if (objc_msgSend(v5, "tvSettings_isNonLightningSecondScreenScene"))
  {
    NSLog(@"A non-Lightning AV adapter was connected");
    id v4 = +[WLKSystemPreferencesStore sharedPreferences];
    [v4 setHasAVAdapterEvenBeenConnected:1];

    [(TopLevelSettingsController *)self reloadSpecifiers];
  }
}

- (id)_descriptionForExternalScreenType:(unsigned int)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_18858[a3];
  }
}

- (BOOL)_okayToShowCellularPlaybackAndDownloadSettings
{
  char v2 = MGGetBoolAnswer();
  id v3 = [objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.tv"];
  id v4 = [v3 specifiersForPolicyOptions:0x8000 force:0];
  id v5 = [v4 lastObject];

  if (v5)
  {
    id v6 = [v5 performGetter];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v7 = [v6 BOOLValue];
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v2 & v7;
}

- (NSNumber)cellularDataPlayback
{
  return *(NSNumber **)((char *)&self->_cellularDataPlayback + 4);
}

- (void)setCellularDataPlayback:(id)a3
{
}

- (NSString)cellularDataQualityPlayback
{
  return *(NSString **)((char *)&self->_cellularDataQualityPlayback + 4);
}

- (void)setCellularDataQualityPlayback:(id)a3
{
}

- (NSString)wifiQualityPlayback
{
  return *(NSString **)((char *)&self->_wifiQualityPlayback + 4);
}

- (void)setWifiQualityPlayback:(id)a3
{
}

- (NSNumber)cellularDataDownload
{
  return *(NSNumber **)((char *)&self->_cellularDataDownload + 4);
}

- (void)setCellularDataDownload:(id)a3
{
}

- (NSString)cellularDataQualityDownload
{
  return *(NSString **)((char *)&self->_cellularDataQualityDownload + 4);
}

- (void)setCellularDataQualityDownload:(id)a3
{
}

- (NSString)wifiQualityDownload
{
  return *(NSString **)((char *)&self->_wifiQualityDownload + 4);
}

- (void)setWifiQualityDownload:(id)a3
{
}

- (NSString)preferredPurchaseResolution
{
  return *(NSString **)((char *)&self->_preferredPurchaseResolution + 4);
}

- (void)setPreferredPurchaseResolution:(id)a3
{
}

- (NSNumber)downloadsCompatibleWithAVAdapter
{
  return *(NSNumber **)((char *)&self->_downloadsCompatibleWithAVAdapter + 4);
}

- (void)setDownloadsCompatibleWithAVAdapter:(id)a3
{
}

- (BOOL)isRefreshingAppGroup
{
  return *(&self->_refreshingAppGroup + 4);
}

- (void)setRefreshingAppGroup:(BOOL)a3
{
  *(&self->_refreshingAppGroup + 4) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_downloadsCompatibleWithAVAdapter + 4), 0);
  objc_storeStrong((id *)((char *)&self->_preferredPurchaseResolution + 4), 0);
  objc_storeStrong((id *)((char *)&self->_wifiQualityDownload + 4), 0);
  objc_storeStrong((id *)((char *)&self->_cellularDataQualityDownload + 4), 0);
  objc_storeStrong((id *)((char *)&self->_cellularDataDownload + 4), 0);
  objc_storeStrong((id *)((char *)&self->_wifiQualityPlayback + 4), 0);
  objc_storeStrong((id *)((char *)&self->_cellularDataQualityPlayback + 4), 0);
  objc_storeStrong((id *)((char *)&self->_cellularDataPlayback + 4), 0);
  objc_storeStrong((id *)((char *)&self->_selectedAudioLanguages + 4), 0);
  objc_storeStrong((id *)((char *)&self->_downloadQualityController + 4), 0);
  objc_storeStrong((id *)((char *)&self->_downloadQualityWifiSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_downloadQualityCellularSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_downloadCellularSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_playbackQualityWifiSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_playbackQualityCellularSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_playbackCellularSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_homeSharingGroupSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_homeSharingSignOutButtonSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_homeSharingSignInButtonSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_hdrEnabledFooterSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_hdrEnabledSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_mcEffectiveSettingsChangedNotification + 4), 0);
  objc_storeStrong((id *)((char *)&self->_accountChangeNotificationToken + 4), 0);
  objc_storeStrong((id *)((char *)&self->_appPolicy + 4), 0);
  objc_storeStrong((id *)((char *)&self->_permissionsSpecifiers + 4), 0);

  objc_storeStrong((id *)((char *)&self->_permissionSpecifierRedirecter + 4), 0);
}

@end