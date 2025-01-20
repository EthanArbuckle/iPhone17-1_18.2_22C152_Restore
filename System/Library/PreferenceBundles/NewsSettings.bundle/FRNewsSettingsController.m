@interface FRNewsSettingsController
- (BOOL)isUserSignedIntoICloud;
- (FRNewsSettingsController)init;
- (FRNewsSportsSyncManager)sportsSyncManager;
- (PSSystemPolicyForApp)appPolicy;
- (id)localizedStringResourceWithKey:(id)a3;
- (id)offlineModeSubscriberGroupDescription;
- (id)specifiers;
- (void)cancelAction;
- (void)killNewsApp;
- (void)routeToNewsSubscription;
- (void)setAppPolicy:(id)a3;
- (void)setShowStoriesFromFavorites:(id)a3 specifier:(id)a4;
- (void)setSubtitleForAutomaticDownloadsSpecifier:(id)a3;
- (void)setValue:(id)a3 forSpecifier:(id)a4;
- (void)showCombinedPrivacyPane;
- (void)showGameCenterPrivacyScreen;
- (void)showSportsSyncingPrivacyScreen;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation FRNewsSettingsController

- (FRNewsSettingsController)init
{
  v18.receiver = self;
  v18.super_class = (Class)FRNewsSettingsController;
  v2 = [(FRNewsSettingsController *)&v18 init];
  if (v2)
  {
    v3 = objc_alloc_init(FRNewsSportsSyncManager);
    sportsSyncManager = v2->_sportsSyncManager;
    v2->_sportsSyncManager = v3;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = [(FRNewsSettingsController *)v2 specifiers];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      uint64_t v9 = PSKeyNameKey;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) propertyForKey:v9];
          if (v11)
          {
            v12 = NewsCoreUserDefaults();
            [v12 addObserver:v2 forKeyPath:v11 options:3 context:0];
          }
          v10 = (char *)v10 + 1;
        }
        while (v7 != v10);
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v7);
    }
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)FRNewsSettingsController;
  [(FRNewsSettingsController *)&v10 viewDidAppear:a3];
  [(FRNewsSettingsController *)self reloadSpecifiers];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.news"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  id v6 = +[NSLocale currentLocale];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"News" table:0 locale:v6 bundleURL:v8];

  if (objc_opt_respondsToSelector()) {
    [(FRNewsSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.news" title:v9 localizedNavigationComponents:&__NSArray0__struct deepLink:v4];
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = FRNewsSettingsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Refreshing News settings items...", (uint8_t *)buf, 2u);
    }

    v126[0] = _NSConcreteStackBlock;
    v126[1] = 3221225472;
    v126[2] = sub_878C;
    v126[3] = &unk_10628;
    v126[4] = self;
    id v6 = objc_retainBlock(v126);
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"NEWS_SETTINGS_TITLE" value:&stru_10B80 table:@"Localizable"];
    [(FRNewsSettingsController *)self setTitle:v8];

    id v9 = [objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.news"];
    [(FRNewsSettingsController *)self setAppPolicy:v9];

    objc_super v10 = [(FRNewsSettingsController *)self appPolicy];
    v11 = [v10 specifiers];
    id v122 = [v11 mutableCopy];

    v12 = NewsCoreUserDefaults();
    unsigned int v117 = [v12 BOOLForKey:FCNewsURLResolutionSubscriptionStatusSharedPreferenceKey];
    uint64_t v13 = FCOfflineModeFeatureFlagEnabledKey;
    long long v14 = [v12 objectForKey:FCOfflineModeFeatureFlagEnabledKey];

    v115 = (void (**)(void, void, void, void, void))v6;
    uint64_t v116 = v3;
    v114 = v12;
    if (v14 && ![v12 BOOLForKey:v13])
    {
      v28 = +[NSBundle bundleForClass:objc_opt_class()];
      v29 = [v28 localizedStringForKey:@"AUTOMATIC_DOWNLOADS_GROUP_TITLE" value:&stru_10B80 table:@"Localizable"];
      long long v17 = +[PSSpecifier groupSpecifierWithID:@"Download Issues" name:v29];

      v30 = +[NSBundle bundleForClass:objc_opt_class()];
      v31 = [v30 localizedStringForKey:@"DOWNLOAD_ISSUES_DESCRIPTION" value:&stru_10B80 table:@"Localizable"];
      uint64_t v120 = PSFooterTextGroupKey;
      objc_msgSend(v17, "setProperty:forKey:", v31);

      [v122 addObject:v17];
      v32 = +[NSBundle bundleForClass:objc_opt_class()];
      v33 = [v32 localizedStringForKey:@"DOWNLOAD_ISSUES_TITLE" value:&stru_10B80 table:@"Localizable"];
      v27 = ((void (*)(void *, void *, uint64_t, void, void *))v6[2])(v6, v33, 6, FCAutomaticIssueDownloadsEnabledKey, &__kCFBooleanTrue);

      [v122 addObject:v27];
      v34 = +[UIDevice currentDevice];
      id v35 = [v34 userInterfaceIdiom];

      if (v35)
      {
        v24 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      }
      else
      {
        v118 = +[PSSpecifier groupSpecifierWithID:@"Download Audio"];
        v36 = +[NSBundle bundleForClass:objc_opt_class()];
        v37 = [v36 localizedStringForKey:@"DOWNLOAD_AUDIO_DESCRIPTION" value:&stru_10B80 table:@"Localizable"];
        [v118 setProperty:v37 forKey:v120];

        [v122 addObject:v118];
        v38 = +[NSBundle bundleForClass:objc_opt_class()];
        v24 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
        v39 = [v38 localizedStringForKey:@"DOWNLOAD_AUDIO_TITLE" value:&stru_10B80 table:@"Localizable"];
        v40 = ((void (*)(void *, void *, uint64_t, void, void *))v6[2])(v6, v39, 6, FCAutomaticAudioDownloadsEnabledKey, &__kCFBooleanTrue);

        [v122 addObject:v40];
      }
    }
    else
    {
      long long v15 = +[NSBundle bundleForClass:objc_opt_class()];
      long long v16 = [v15 localizedStringForKey:@"NEWS_PLUS_OFFLINE_MODE_GROUP_TITLE" value:&stru_10B80 table:@"Localizable"];
      long long v17 = +[PSSpecifier groupSpecifierWithID:@"News+ Offline Mode" name:v16];

      if (v117)
      {
        objc_super v18 = [(FRNewsSettingsController *)self offlineModeSubscriberGroupDescription];
        uint64_t v120 = PSFooterTextGroupKey;
        objc_msgSend(v17, "setProperty:forKey:", v18);

        [v122 addObject:v17];
      }
      else
      {
        v19 = +[NSBundle bundleForClass:objc_opt_class()];
        v20 = [v19 localizedStringForKey:@"NEWS_PLUS_OFFLINE_MODE_GROUP_DESCRIPTION_NON_SUBSCRIBER" value:&stru_10B80 table:@"Localizable"];
        uint64_t v120 = PSFooterTextGroupKey;
        objc_msgSend(v17, "setProperty:forKey:", v20);

        [v122 addObject:v17];
        v21 = +[NSBundle bundleForClass:objc_opt_class()];
        v22 = [v21 localizedStringForKey:@"SUBSCRIBE_NEWS_PLUS_TITLE" value:&stru_10B80 table:@"Localizable"];
        v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:0 get:0 detail:0 cell:13 edit:0];

        [v23 setButtonAction:"routeToNewsSubscription"];
        [v122 addObject:v23];
      }
      v24 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      v25 = +[NSBundle bundleForClass:objc_opt_class()];
      v26 = [v25 localizedStringForKey:@"AUTOMATIC_DOWNLOADS_LINK_TITLE" value:&stru_10B80 table:@"Localizable"];
      v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      [v27 setIdentifier:@"AUTOMATIC_DOWNLOADS_LINK"];
      if (v117)
      {
        [v27 setObject:NSClassFromString(@"PSSubtitleDisclosureTableCell") forKeyedSubscript:PSCellClassKey];
        [(FRNewsSettingsController *)self setSubtitleForAutomaticDownloadsSpecifier:v27];
      }
      else
      {
        [v27 setDetailControllerClass:0];
      }
      [v122 addObject:v27];
    }

    v41 = v24[131];
    v42 = +[NSBundle bundleForClass:objc_opt_class()];
    v43 = objc_msgSend(v42, "localizedStringForKey:value:table:", @"GAME_CENTER_GROUP_TITLE", &stru_10B80);
    v44 = [v41 groupSpecifierWithID:@"Game Center" name:v43];

    v45 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v46 = [v45 localizedStringForKey:@"GAME_CENTER_SETTINGS_GROUP_FOOTER_LINK" value:&stru_10B80 table:@"Localizable"];

    v47 = +[NSBundle bundleForClass:objc_opt_class()];
    v48 = [v47 localizedStringForKey:@"GAME_CENTER_ENABLED_DESCRIPTION" value:&stru_10B80 table:@"Localizable"];
    v49 = +[NSString stringWithFormat:@"%@ %@", v48, v46];

    v50 = (objc_class *)objc_opt_class();
    v51 = NSStringFromClass(v50);
    uint64_t v103 = PSFooterCellClassGroupKey;
    objc_msgSend(v44, "setProperty:forKey:", v51);

    uint64_t v102 = PSFooterHyperlinkViewTitleKey;
    objc_msgSend(v44, "setProperty:forKey:", v49);
    v112 = v49;
    v113 = (void *)v46;
    v128.location = (NSUInteger)[v49 rangeOfString:v46];
    v52 = NSStringFromRange(v128);
    uint64_t v101 = PSFooterHyperlinkViewLinkRangeKey;
    objc_msgSend(v44, "setProperty:forKey:", v52);

    v53 = +[NSValue valueWithNonretainedObject:self];
    uint64_t v100 = PSFooterHyperlinkViewTargetKey;
    objc_msgSend(v44, "setProperty:forKey:", v53);

    uint64_t v99 = PSFooterHyperlinkViewActionKey;
    objc_msgSend(v44, "setProperty:forKey:", @"showGameCenterPrivacyScreen");
    v54 = v122;
    v119 = v44;
    [v122 addObject:v44];
    v55 = v24[131];
    v56 = +[NSBundle bundleForClass:objc_opt_class()];
    v57 = [v56 localizedStringForKey:@"GAME_CENTER_ENABLED_TITLE" value:&stru_10B80 table:@"Localizable"];
    v58 = objc_msgSend(v55, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v57, self, "setValue:forSpecifier:", 0);

    uint64_t v59 = FCPuzzlesSettingsGameCenterEnabledKey;
    uint64_t v110 = PSKeyNameKey;
    objc_msgSend(v58, "setObject:forKeyedSubscript:", FCPuzzlesSettingsGameCenterEnabledKey);
    uint64_t v109 = PSDefaultValueKey;
    objc_msgSend(v58, "setObject:forKeyedSubscript:", &__kCFBooleanTrue);
    uint64_t v60 = FCDefaultsSuiteName;
    uint64_t v107 = PSDefaultsKey;
    objc_msgSend(v58, "setObject:forKeyedSubscript:", FCDefaultsSuiteName);
    uint64_t v105 = v60;
    uint64_t v106 = PSContainerBundleIDKey;
    objc_msgSend(v58, "setObject:forKeyedSubscript:", v60);
    [v58 setIdentifier:v59];
    v111 = v58;
    [v122 addObject:v58];
    uint64_t v61 = v120;
    if ([(FRNewsSettingsController *)self isUserSignedIntoICloud])
    {
      v62 = FRNewsSettingsLog();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_0, v62, OS_LOG_TYPE_DEFAULT, "User is signed into iCloud, adding sports syncing settings group", (uint8_t *)buf, 2u);
      }

      v63 = +[NSBundle bundleForClass:objc_opt_class()];
      v64 = [v63 localizedStringForKey:@"SPORTS_SETTINGS_GROUP_FOOTER_LINK" value:&stru_10B80 table:@"Localizable"];

      v65 = +[NSBundle bundleForClass:objc_opt_class()];
      v66 = [v65 localizedStringForKey:@"SPORTS_SETTINGS_GROUP_FOOTER_DESCRIPTION" value:&stru_10B80 table:@"Localizable"];
      v67 = +[NSString stringWithFormat:@"%@ %@", v66, v64];

      v68 = +[NSBundle bundleForClass:objc_opt_class()];
      v69 = [v68 localizedStringForKey:@"SPORTS_SETTINGS_GROUP_TITLE" value:&stru_10B80 table:@"Localizable"];
      v70 = +[PSSpecifier groupSpecifierWithID:@"Sports Settings" name:v69];

      v71 = (objc_class *)objc_opt_class();
      v72 = NSStringFromClass(v71);
      [v70 setProperty:v72 forKey:v103];

      [v70 setProperty:v67 forKey:v102];
      v129.location = (NSUInteger)[v67 rangeOfString:v64];
      v73 = NSStringFromRange(v129);
      [v70 setProperty:v73 forKey:v101];

      v74 = +[NSValue valueWithNonretainedObject:self];
      [v70 setProperty:v74 forKey:v100];

      [v70 setProperty:@"showSportsSyncingPrivacyScreen" forKey:v99];
      v54 = v122;
      [v122 addObject:v70];
      v75 = [(FRNewsSettingsController *)self sportsSyncManager];
      v76 = [v75 specifier];
      [v122 addObject:v76];

      objc_initWeak(buf, self);
      v77 = [(FRNewsSettingsController *)self sportsSyncManager];
      v123[0] = _NSConcreteStackBlock;
      v123[1] = 3221225472;
      v123[2] = sub_88B4;
      v123[3] = &unk_108C8;
      objc_copyWeak(&v124, buf);
      [v77 prepareWithCompletion:v123];
      uint64_t v61 = v120;

      objc_destroyWeak(&v124);
      objc_destroyWeak(buf);
    }
    uint64_t v121 = v61;
    v78 = +[NSBundle bundleForClass:objc_opt_class()];
    v79 = [v78 localizedStringForKey:@"TODAY_FEED_GROUP_TITLE" value:&stru_10B80 table:@"Localizable"];
    v104 = +[PSSpecifier groupSpecifierWithID:@"Today Feed" name:v79];

    v80 = +[NSBundle bundleForClass:objc_opt_class()];
    v81 = [v80 localizedStringForKey:@"RESTRICT_STORIES_DESCRIPTION" value:&stru_10B80 table:@"Localizable"];
    [v104 setProperty:v81 forKey:v61];

    [v54 addObject:v104];
    v82 = +[NSBundle bundleForClass:objc_opt_class()];
    [v82 localizedStringForKey:@"RESTRICT_STORIES_TITLE" value:&stru_10B80 table:@"Localizable"];
    v84 = v83 = v54;
    v85 = +[PSSpecifier preferenceSpecifierNamed:v84 target:self set:"setShowStoriesFromFavorites:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

    uint64_t v108 = PSAllowMultilineTitleKey;
    objc_msgSend(v85, "setProperty:forKey:", &__kCFBooleanTrue);
    [v85 setIdentifier:@"showStoriesFromFavoritesSpecifierID"];
    [v85 setObject:FCShowStoriesOnlyFromFavoritesSharedPreferenceKey forKeyedSubscript:v110];
    [v85 setObject:&__kCFBooleanFalse forKeyedSubscript:v109];
    [v85 setObject:v105 forKeyedSubscript:v107];
    [v85 setObject:v105 forKeyedSubscript:v106];
    [v83 addObject:v85];
    v86 = +[NSBundle bundleForClass:objc_opt_class()];
    v87 = [v86 localizedStringForKey:@"PRIVACY_GROUP_TITLE" value:&stru_10B80 table:@"Localizable"];
    v88 = +[PSSpecifier groupSpecifierWithID:@"Privacy" name:v87];

    v89 = +[NSBundle bundleForClass:objc_opt_class()];
    v90 = [v89 localizedStringForKey:@"PRIVACY_TITLE" value:&stru_10B80 table:@"Localizable"];
    v91 = +[PSSpecifier preferenceSpecifierNamed:v90 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v91 setButtonAction:"showCombinedPrivacyPane"];
    [v91 setProperty:&__kCFBooleanTrue forKey:v108];
    v92 = +[NSBundle bundleForClass:objc_opt_class()];
    v93 = [v92 localizedStringForKey:@"RESET_IDENTIFIER_TITLE" value:&stru_10B80 table:@"Localizable"];
    v94 = ((void (**)(void, void *, uint64_t, const __CFString *, void *))v115)[2](v115, v93, 6, @"reset_identifier", &__kCFBooleanFalse);

    v95 = +[NSBundle bundleForClass:objc_opt_class()];
    v96 = [v95 localizedStringForKey:@"RESET_IDENTIFIER_DESCRIPTION" value:&stru_10B80 table:@"Localizable"];
    [v88 setProperty:v96 forKey:v121];

    [v122 addObject:v88];
    [v122 addObject:v91];
    [v122 addObject:v94];
    v97 = *(void **)&self->PSListController_opaque[v116];
    *(void *)&self->PSListController_opaque[v116] = v122;

    v4 = *(void **)&self->PSListController_opaque[v116];
  }

  return v4;
}

- (void)setValue:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(FRNewsSettingsController *)self setPreferenceValue:v7 specifier:v6];
  [v6 setObject:v7 forKeyedSubscript:PSValueKey];

  [(FRNewsSettingsController *)self reloadSpecifiers];
}

- (void)setSubtitleForAutomaticDownloadsSpecifier:(id)a3
{
  id v42 = a3;
  uint64_t v3 = NewsCoreUserDefaults();
  uint64_t v4 = FCAutomaticDownloadsEnabledKey;
  id v43 = v3;
  id v5 = [v3 objectForKey:FCAutomaticDownloadsEnabledKey];

  if (v5) {
    unsigned int v41 = [v43 BOOLForKey:v4] ^ 1;
  }
  else {
    unsigned int v41 = 0;
  }
  uint64_t v6 = FCAutomaticFeedStoriesDownloadsEnabledKey;
  id v7 = [v43 objectForKey:FCAutomaticFeedStoriesDownloadsEnabledKey];

  if (v7) {
    char v8 = [v43 BOOLForKey:v6] ^ 1;
  }
  else {
    char v8 = 0;
  }
  uint64_t v9 = FCAutomaticSavedStoriesDownloadsEnabledKey;
  objc_super v10 = [v43 objectForKey:FCAutomaticSavedStoriesDownloadsEnabledKey];

  if (v10) {
    char v11 = [v43 BOOLForKey:v9] ^ 1;
  }
  else {
    char v11 = 0;
  }
  uint64_t v12 = FCAutomaticIssueDownloadsEnabledKey;
  uint64_t v13 = [v43 objectForKey:FCAutomaticIssueDownloadsEnabledKey];

  if (v13) {
    char v14 = [v43 BOOLForKey:v12] ^ 1;
  }
  else {
    char v14 = 0;
  }
  unsigned int v15 = [v43 BOOLForKey:FCPuzzlesFeatureFlagEnabledKey];
  uint64_t v16 = FCAutomaticPuzzlesDownloadsEnabledKey;
  long long v17 = [v43 objectForKey:FCAutomaticPuzzlesDownloadsEnabledKey];

  if (v17) {
    unsigned int v18 = [v43 BOOLForKey:v16] ^ 1;
  }
  else {
    unsigned int v18 = 0;
  }
  unsigned int v40 = [v43 BOOLForKey:FCAudioFeatureFlagEnabledKey];
  uint64_t v19 = FCAutomaticAudioDownloadsEnabledKey;
  v20 = [v43 objectForKey:FCAutomaticAudioDownloadsEnabledKey];

  if (v20) {
    unsigned int v21 = [v43 BOOLForKey:v19] ^ 1;
  }
  else {
    unsigned int v21 = 0;
  }
  v22 = +[NSMutableArray array];
  if (v8)
  {
    if (v11) {
      goto LABEL_21;
    }
  }
  else
  {
    v34 = +[NSBundle bundleForClass:objc_opt_class()];
    id v35 = [v34 localizedStringForKey:@"AUTOMATIC_DOWNLOADS_SUBTITLE_RECENT" value:&stru_10B80 table:@"Localizable"];
    [v22 addObject:v35];

    if (v11)
    {
LABEL_21:
      if (v14) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  v36 = +[NSBundle bundleForClass:objc_opt_class()];
  v37 = [v36 localizedStringForKey:@"AUTOMATIC_DOWNLOADS_SUBTITLE_SAVED" value:&stru_10B80 table:@"Localizable"];
  [v22 addObject:v37];

  if ((v14 & 1) == 0)
  {
LABEL_22:
    v23 = +[NSBundle bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"AUTOMATIC_DOWNLOADS_SUBTITLE_ISSUES" value:&stru_10B80 table:@"Localizable"];
    [v22 addObject:v24];
  }
LABEL_23:
  if (((v15 ^ 1 | v18) & 1) == 0)
  {
    v25 = +[NSBundle bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"AUTOMATIC_DOWNLOADS_SUBTITLE_PUZZLES" value:&stru_10B80 table:@"Localizable"];
    [v22 addObject:v26];
  }
  if (((v40 ^ 1 | v21) & 1) == 0)
  {
    v27 = +[NSBundle bundleForClass:objc_opt_class()];
    v28 = [v27 localizedStringForKey:@"AUTOMATIC_DOWNLOADS_SUBTITLE_AUDIO" value:&stru_10B80 table:@"Localizable"];
    [v22 addObject:v28];
  }
  id v29 = [v22 count];
  int v30 = v41;
  if (!v29) {
    int v30 = 1;
  }
  if (v30 == 1)
  {
    v31 = +[NSBundle bundleForClass:objc_opt_class()];
    v32 = v31;
    CFStringRef v33 = @"AUTOMATIC_DOWNLOADS_SUBTITLE_OFF";
LABEL_38:
    v39 = [v31 localizedStringForKey:v33 value:&stru_10B80 table:@"Localizable"];

    goto LABEL_40;
  }
  uint64_t v38 = 3;
  if (v15) {
    uint64_t v38 = 4;
  }
  if (v29 == (id)(v38 + v40))
  {
    v31 = +[NSBundle bundleForClass:objc_opt_class()];
    v32 = v31;
    CFStringRef v33 = @"AUTOMATIC_DOWNLOADS_SUBTITLE_ON";
    goto LABEL_38;
  }
  v39 = [v22 componentsJoinedByString:@", "];
LABEL_40:
  [v42 setObject:v39 forKeyedSubscript:PSTableCellSubtitleTextKey];
}

- (void)showSportsSyncingPrivacyScreen
{
  id v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.mysports"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)showGameCenterPrivacyScreen
{
  id v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.gamecenter"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (BOOL)isUserSignedIntoICloud
{
  v2 = +[FCAppleAccount sharedAccount];
  unsigned __int8 v3 = [v2 isUserSignedInToiCloud];

  return v3;
}

- (void)setShowStoriesFromFavorites:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)FRNewsSettingsController;
  id v7 = a3;
  char v8 = [(FRNewsSettingsController *)&v27 readPreferenceValue:v6];
  uint64_t v9 = [(FRNewsSettingsController *)self localizedStringResourceWithKey:@"Restrict Stories in Today"];
  objc_super v10 = +[NSURL URLWithString:@"prefs://root=News"];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_9374;
  v24[3] = &unk_10650;
  v24[4] = self;
  id v11 = v8;
  id v25 = v11;
  id v12 = v6;
  id v26 = v12;
  [(FRNewsSettingsController *)self pe_registerUndoActionName:v9 associatedDeepLink:v10 undoAction:v24];

  [(FRNewsSettingsController *)self setPreferenceValue:v7 specifier:v12];
  LODWORD(v9) = [v7 BOOLValue];

  if (v9)
  {
    uint64_t v13 = +[PSConfirmationSpecifier preferenceSpecifierNamed:&stru_10B80 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    char v14 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v15 = [v14 localizedStringForKey:@"RESTRICT_STORIES_ALERT_DESCRIPTION" value:&stru_10B80 table:@"Localizable"];

    uint64_t v16 = +[UIDevice currentDevice];
    id v17 = [v16 userInterfaceIdiom];

    [v13 setPrompt:v15];
    unsigned int v18 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v19 = [v18 localizedStringForKey:@"RESTRICT_STORIES_ALERT_CANCEL_TITLE" value:&stru_10B80 table:@"Localizable"];
    [v13 setCancelButton:v19];

    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v21 = v20;
    if (v17)
    {
      v22 = [v20 localizedStringForKey:@"RESTRICT_STORIES_ALERT_TITLE_IPAD" value:&stru_10B80 table:@"Localizable"];
      [v13 setTitle:v22];

      unsigned int v21 = +[NSBundle bundleForClass:objc_opt_class()];
      v23 = [v21 localizedStringForKey:@"RESTRICT_STORIES_ALERT_TURN_ON_TITLE_IPAD" value:&stru_10B80 table:@"Localizable"];
      [v13 setOkButton:v23];
    }
    else
    {
      v23 = [v20 localizedStringForKey:@"RESTRICT_STORIES_ALERT_TITLE_IPHONE" value:&stru_10B80 table:@"Localizable"];
      [v13 setTitle:v23];
    }

    [v13 setConfirmationAction:"confirmAction"];
    [v13 setConfirmationCancelAction:"cancelAction"];
    [(FRNewsSettingsController *)self showConfirmationViewForSpecifier:v13];
  }
  else
  {
    [(FRNewsSettingsController *)self killNewsApp];
  }
}

- (void)cancelAction
{
  id v3 = [(FRNewsSettingsController *)self specifierForID:@"showStoriesFromFavoritesSpecifierID"];
  [(FRNewsSettingsController *)self setPreferenceValue:&__kCFBooleanFalse specifier:v3];
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:PSValueKey];
  [(FRNewsSettingsController *)self reloadSpecifier:v3 animated:1];
}

- (void)showCombinedPrivacyPane
{
  id v3 = +[OBPrivacyPresenter presenterForPrivacyUnifiedAboutWithIdentifiers:&off_12010];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)routeToNewsSubscription
{
  id v3 = +[UIApplication sharedApplication];
  v2 = +[NSURL URLWithString:@"applenews:///subscription"];
  [v3 openURL:v2 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)killNewsApp
{
}

- (id)offlineModeSubscriberGroupDescription
{
  v2 = +[UIDevice currentDevice];
  id v3 = (char *)[v2 userInterfaceIdiom];

  if (v3 == (unsigned char *)&dword_4 + 2)
  {
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = v4;
    CFStringRef v6 = @"NEWS_PLUS_OFFLINE_MODE_GROUP_DESCRIPTION_VISION_SUBSCRIBER";
    goto LABEL_7;
  }
  if (v3 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = v4;
    CFStringRef v6 = @"NEWS_PLUS_OFFLINE_MODE_GROUP_DESCRIPTION_IPAD_SUBSCRIBER";
    goto LABEL_7;
  }
  if (!v3)
  {
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = v4;
    CFStringRef v6 = @"NEWS_PLUS_OFFLINE_MODE_GROUP_DESCRIPTION_IPHONE_SUBSCRIBER";
LABEL_7:
    id v7 = [v4 localizedStringForKey:v6 value:&stru_10B80 table:@"Localizable"];

    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_BF30();
  }
  id v7 = @"UNKNOWN";
LABEL_11:

  return v7;
}

- (id)localizedStringResourceWithKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 bundleURL];

  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  id v7 = +[NSLocale currentLocale];
  char v8 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 bundleURL];
  id v10 = [v6 initWithKey:v3 table:0 locale:v7 bundleURL:v9];

  return v10;
}

- (PSSystemPolicyForApp)appPolicy
{
  return self->_appPolicy;
}

- (void)setAppPolicy:(id)a3
{
}

- (FRNewsSportsSyncManager)sportsSyncManager
{
  return self->_sportsSyncManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsSyncManager, 0);

  objc_storeStrong((id *)&self->_appPolicy, 0);
}

@end