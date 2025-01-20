@interface FRNewsDownloadsSettingsController
- (FRNewsDownloadsSettingsController)init;
- (id)localizedStringResourceWithKey:(id)a3;
- (id)optimizeStorageDescription;
- (id)specifiers;
- (void)prepUndoAndSetPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setOptimizedStorageEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setValue:(id)a3 forSpecifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation FRNewsDownloadsSettingsController

- (FRNewsDownloadsSettingsController)init
{
  v17.receiver = self;
  v17.super_class = (Class)FRNewsDownloadsSettingsController;
  v2 = [(FRNewsDownloadsSettingsController *)&v17 init];
  v3 = v2;
  if (v2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v4 = [(FRNewsDownloadsSettingsController *)v2 specifiers];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      uint64_t v8 = PSKeyNameKey;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v10 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) propertyForKey:v8];
          if (v10)
          {
            v11 = NewsCoreUserDefaults();
            [v11 addObserver:v3 forKeyPath:v10 options:3 context:0];
          }
          v9 = (char *)v9 + 1;
        }
        while (v6 != v9);
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v6);
    }
  }
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)FRNewsDownloadsSettingsController;
  [(FRNewsDownloadsSettingsController *)&v16 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.news/AUTOMATIC_DOWNLOADS_LINK"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  id v6 = +[NSLocale currentLocale];
  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"Download Options" table:0 locale:v6 bundleURL:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  v11 = +[NSLocale currentLocale];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"Download Options" table:0 locale:v11 bundleURL:v13];

  if (objc_opt_respondsToSelector())
  {
    id v17 = v14;
    long long v15 = +[NSArray arrayWithObjects:&v17 count:1];
    [(FRNewsDownloadsSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.news" title:v9 localizedNavigationComponents:v15 deepLink:v4];
  }
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v64 = OBJC_IVAR___PSListController__specifiers;
    v4 = FRNewsSettingsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Refreshing News Download settings items...", buf, 2u);
    }

    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_6970;
    v74[3] = &unk_10628;
    v74[4] = self;
    id v5 = objc_retainBlock(v74);
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"AUTOMATIC_DOWNLOADS_SETTINGS_L2_TITLE" value:&stru_10B80 table:@"Localizable"];
    [(FRNewsDownloadsSettingsController *)self setTitle:v7];

    v67 = +[NSMutableArray array];
    uint64_t v8 = NewsCoreUserDefaults();
    unsigned int v59 = [v8 BOOLForKey:FCAudioFeatureFlagEnabledKey];
    unsigned int v57 = [v8 BOOLForKey:FCPuzzlesFeatureFlagEnabledKey];
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"ALLOW_AUTOMATIC_DOWNLOADS_TITLE" value:&stru_10B80 table:@"Localizable"];
    uint64_t v11 = FCAutomaticDownloadsEnabledKey;
    v65 = (void (**)(void, void, void, void, void))v5;
    v12 = ((void (*)(void *, void *, uint64_t, void, void *))v5[2])(v5, v10, 6, FCAutomaticDownloadsEnabledKey, &__kCFBooleanTrue);

    v73.receiver = self;
    v73.super_class = (Class)FRNewsDownloadsSettingsController;
    long long v13 = [(FRNewsDownloadsSettingsController *)&v73 readPreferenceValue:v12];
    id v14 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v15 = [v14 localizedStringForKey:@"AUTOMATIC_DOWNLOADS_TITLE" value:&stru_10B80 table:@"Localizable"];
    objc_super v16 = [(FRNewsDownloadsSettingsController *)self localizedStringResourceWithKey:v15];
    +[NSURL URLWithString:@"prefs://root=News"];
    v18 = id v17 = self;
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_6A94;
    v70[3] = &unk_10650;
    v70[4] = v17;
    id v61 = v13;
    id v71 = v61;
    v19 = v12;
    v72 = v19;
    v62 = v17;
    [(FRNewsDownloadsSettingsController *)v17 pe_registerUndoActionName:v16 associatedDeepLink:v18 undoAction:v70];

    *(void *)&v19[OBJC_IVAR___PSSpecifier_setter] = "setValue:forSpecifier:";
    uint64_t v20 = FCDefaultsSuiteName;
    uint64_t v68 = PSDefaultsKey;
    objc_msgSend(v19, "setObject:forKeyedSubscript:", FCDefaultsSuiteName);
    uint64_t v69 = v20;
    [v19 setObject:v20 forKeyedSubscript:PSContainerBundleIDKey];
    [v19 setIdentifier:v11];
    v60 = v19;
    [v67 addObject:v19];
    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"AUTOMATIC_DOWNLOADS_CONTENT_TYPES_GROUP_TITLE" value:&stru_10B80 table:@"Localizable"];
    v23 = +[PSSpecifier groupSpecifierWithID:@"Content Types" name:v22];

    [v67 addObject:v23];
    v24 = [v8 objectForKey:v11];

    v63 = v8;
    if (v24)
    {
      unsigned int v25 = [v8 BOOLForKey:v11];
      v26 = &__kCFBooleanTrue;
      if (!v25) {
        v26 = &__kCFBooleanFalse;
      }
    }
    else
    {
      v26 = &__kCFBooleanTrue;
    }
    v27 = +[NSBundle bundleForClass:objc_opt_class()];
    v28 = [v27 localizedStringForKey:@"DOWNLOAD_RECENT_STORIES_TITLE" value:&stru_10B80 table:@"Localizable"];
    uint64_t v29 = FCAutomaticFeedStoriesDownloadsEnabledKey;
    v30 = v65;
    ((void (**)(void, void *, uint64_t, void, void *))v65)[2](v65, v28, 6, FCAutomaticFeedStoriesDownloadsEnabledKey, &__kCFBooleanTrue);
    v31 = (char *)objc_claimAutoreleasedReturnValue();

    [v31 setObject:v69 forKeyedSubscript:v68];
    *(void *)&v31[OBJC_IVAR___PSSpecifier_setter] = "prepUndoAndSetPreferenceValue:specifier:";
    uint64_t v66 = PSEnabledKey;
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v26);
    [v31 setIdentifier:v29];
    [v67 addObject:v31];
    v32 = +[NSBundle bundleForClass:objc_opt_class()];
    v33 = [v32 localizedStringForKey:@"DOWNLOAD_SAVED_STORIES_TITLE" value:&stru_10B80 table:@"Localizable"];
    uint64_t v34 = FCAutomaticSavedStoriesDownloadsEnabledKey;
    ((void (**)(void, void *, uint64_t, void, void *))v30)[2](v30, v33, 6, FCAutomaticSavedStoriesDownloadsEnabledKey, &__kCFBooleanTrue);
    v35 = (char *)objc_claimAutoreleasedReturnValue();

    [v35 setObject:v69 forKeyedSubscript:v68];
    *(void *)&v35[OBJC_IVAR___PSSpecifier_setter] = "prepUndoAndSetPreferenceValue:specifier:";
    [v35 setObject:v26 forKeyedSubscript:v66];
    v58 = v31;
    [v31 setIdentifier:v34];
    [v67 addObject:v35];
    v36 = +[NSBundle bundleForClass:objc_opt_class()];
    v37 = [v36 localizedStringForKey:@"DOWNLOAD_MAGAZINE_ISSUES_TITLE" value:&stru_10B80 table:@"Localizable"];
    uint64_t v38 = FCAutomaticIssueDownloadsEnabledKey;
    ((void (**)(void, void *, uint64_t, void, void *))v30)[2](v30, v37, 6, FCAutomaticIssueDownloadsEnabledKey, &__kCFBooleanTrue);
    v39 = (char *)objc_claimAutoreleasedReturnValue();

    [v39 setObject:v69 forKeyedSubscript:v68];
    *(void *)&v39[OBJC_IVAR___PSSpecifier_setter] = "prepUndoAndSetPreferenceValue:specifier:";
    [v39 setObject:v26 forKeyedSubscript:v66];
    [v39 setIdentifier:v38];
    [v67 addObject:v39];
    if (v57)
    {
      v40 = +[NSBundle bundleForClass:objc_opt_class()];
      v41 = [v40 localizedStringForKey:@"DOWNLOAD_PUZZLES_TITLE" value:&stru_10B80 table:@"Localizable"];
      uint64_t v42 = FCAutomaticPuzzlesDownloadsEnabledKey;
      ((void (**)(void, void *, uint64_t, void, void *))v65)[2](v65, v41, 6, FCAutomaticPuzzlesDownloadsEnabledKey, &__kCFBooleanTrue);
      v43 = (char *)objc_claimAutoreleasedReturnValue();

      [v43 setObject:v69 forKeyedSubscript:v68];
      *(void *)&v43[OBJC_IVAR___PSSpecifier_setter] = "prepUndoAndSetPreferenceValue:specifier:";
      [v43 setObject:v26 forKeyedSubscript:v66];
      [v43 setIdentifier:v42];
      [v67 addObject:v43];
    }
    if (v59)
    {
      v44 = +[NSBundle bundleForClass:objc_opt_class()];
      v45 = [v44 localizedStringForKey:@"DOWNLOAD_AUDIO_STORIES_TITLE" value:&stru_10B80 table:@"Localizable"];
      uint64_t v46 = FCAutomaticAudioDownloadsEnabledKey;
      ((void (**)(void, void *, uint64_t, void, void *))v65)[2](v65, v45, 6, FCAutomaticAudioDownloadsEnabledKey, &__kCFBooleanTrue);
      v47 = (char *)objc_claimAutoreleasedReturnValue();

      [v47 setObject:v69 forKeyedSubscript:v68];
      *(void *)&v47[OBJC_IVAR___PSSpecifier_setter] = "prepUndoAndSetPreferenceValue:specifier:";
      [v47 setObject:v26 forKeyedSubscript:v66];
      [v47 setIdentifier:v46];
      [v67 addObject:v47];
    }
    v48 = +[PSSpecifier groupSpecifierWithID:@"Optimize Storage Group"];
    v49 = [(FRNewsDownloadsSettingsController *)v62 optimizeStorageDescription];
    [v48 setProperty:v49 forKey:PSFooterTextGroupKey];

    [v67 addObject:v48];
    v50 = +[NSBundle bundleForClass:objc_opt_class()];
    v51 = [v50 localizedStringForKey:@"OPTIMIZE_STORAGE_TITLE" value:&stru_10B80 table:@"Localizable"];
    uint64_t v52 = FCOptimizedStorageEnabledKey;
    ((void (**)(void, void *, uint64_t, void, void *))v65)[2](v65, v51, 6, FCOptimizedStorageEnabledKey, &__kCFBooleanFalse);
    v53 = (char *)objc_claimAutoreleasedReturnValue();

    *(void *)&v53[OBJC_IVAR___PSSpecifier_setter] = "setOptimizedStorageEnabled:forSpecifier:";
    [v53 setObject:v69 forKeyedSubscript:v68];
    [v53 setObject:v26 forKeyedSubscript:v66];
    [v53 setIdentifier:v52];
    [v67 addObject:v53];
    v54 = *(void **)&v62->PSListController_opaque[v64];
    *(void *)&v62->PSListController_opaque[v64] = v67;
    id v55 = v67;

    v3 = *(void **)&v62->PSListController_opaque[v64];
  }

  return v3;
}

- (void)setValue:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(FRNewsDownloadsSettingsController *)self setPreferenceValue:v7 specifier:v6];
  [v6 setObject:v7 forKeyedSubscript:PSValueKey];

  [(FRNewsDownloadsSettingsController *)self reloadSpecifiers];
}

- (void)setOptimizedStorageEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FRNewsDownloadsSettingsController;
  id v7 = a3;
  uint64_t v8 = [(FRNewsDownloadsSettingsController *)&v20 readPreferenceValue:v6];
  id v9 = [v6 name];
  id v10 = [(FRNewsDownloadsSettingsController *)self localizedStringResourceWithKey:v9];
  uint64_t v11 = +[NSURL URLWithString:@"prefs://root=NEWS"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_6D48;
  v17[3] = &unk_10650;
  v17[4] = self;
  id v18 = v8;
  id v19 = v6;
  id v12 = v6;
  id v13 = v8;
  [(FRNewsDownloadsSettingsController *)self pe_registerUndoActionName:v10 associatedDeepLink:v11 undoAction:v17];
  [(FRNewsDownloadsSettingsController *)self setPreferenceValue:v7 specifier:v12];
  [v12 setObject:v7 forKeyedSubscript:PSValueKey];
  [(FRNewsDownloadsSettingsController *)self reloadSpecifier:v12 animated:1];
  id v14 = NewsCoreUserDefaults();
  [v14 setValue:v7 forKey:FCOptimizedStorageEnabledKey];

  long long v15 = NewsCoreUserDefaults();
  objc_super v16 = +[NSDate date];
  [v15 setValue:v16 forKey:FCOptimizedStorageLastUserInteractionKey];
}

- (id)optimizeStorageDescription
{
  v2 = +[UIDevice currentDevice];
  v3 = (char *)[v2 userInterfaceIdiom];

  if (v3 == (unsigned char *)&dword_4 + 2)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = v4;
    CFStringRef v6 = @"OPTIMIZE_STORAGE_DESCRIPTION_VISION";
    goto LABEL_7;
  }
  if (v3 == (unsigned char *)&dword_0 + 1)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = v4;
    CFStringRef v6 = @"OPTIMIZE_STORAGE_DESCRIPTION_IPAD";
    goto LABEL_7;
  }
  if (!v3)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = v4;
    CFStringRef v6 = @"OPTIMIZE_STORAGE_DESCRIPTION_IPHONE";
LABEL_7:
    id v7 = [v4 localizedStringForKey:v6 value:&stru_10B80 table:@"Localizable"];

    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_BE50();
  }
  id v7 = @"UNKNOWN";
LABEL_11:

  return v7;
}

- (void)prepUndoAndSetPreferenceValue:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FRNewsDownloadsSettingsController;
  id v7 = a3;
  uint64_t v8 = [(FRNewsDownloadsSettingsController *)&v18 readPreferenceValue:v6];
  id v9 = [v6 name];
  id v10 = [(FRNewsDownloadsSettingsController *)self localizedStringResourceWithKey:v9];
  uint64_t v11 = +[NSURL URLWithString:@"prefs://root=NEWS"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_706C;
  v15[3] = &unk_10650;
  v15[4] = self;
  id v16 = v8;
  id v17 = v6;
  id v12 = v6;
  id v13 = v8;
  [(FRNewsDownloadsSettingsController *)self pe_registerUndoActionName:v10 associatedDeepLink:v11 undoAction:v15];
  v14.receiver = self;
  v14.super_class = (Class)FRNewsDownloadsSettingsController;
  [(FRNewsDownloadsSettingsController *)&v14 setPreferenceValue:v7 specifier:v12];
  [v12 setObject:v7 forKeyedSubscript:PSValueKey];

  [(FRNewsDownloadsSettingsController *)self reloadSpecifier:v12 animated:1];
}

- (id)localizedStringResourceWithKey:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 bundleURL];

  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  id v7 = +[NSLocale currentLocale];
  uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 bundleURL];
  id v10 = [v6 initWithKey:v3 table:0 locale:v7 bundleURL:v9];

  return v10;
}

@end