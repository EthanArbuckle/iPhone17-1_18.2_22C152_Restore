@interface TVSettingsLanguageSettingsController
- (BOOL)_shouldEditButtonBeEnabled;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (TVSettingsLanguageSettingsController)init;
- (id)_specifierForLanguage:(id)a3;
- (id)_useDefaultSubtitleLanguages;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_preferredLanguagesDidChange:(id)a3;
- (void)_setEditingToNoAfterDelay;
- (void)_setUseDefaultSubtitleLanguages:(id)a3;
- (void)_showAddAudioLanguagePicker:(id)a3;
- (void)_showAddSubtitleLanguagePicker:(id)a3;
- (void)_willResignActive:(id)a3;
- (void)dealloc;
- (void)reloadSpecifiers;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsLanguageSettingsController

- (TVSettingsLanguageSettingsController)init
{
  if (qword_1FA50 != -1) {
    dispatch_once(&qword_1FA50, &stru_18600);
  }
  v13.receiver = self;
  v13.super_class = (Class)TVSettingsLanguageSettingsController;
  v3 = [(TVSettingsLanguageSettingsController *)&v13 init];
  v4 = v3;
  if (v3)
  {
    v5 = [(TVSettingsLanguageSettingsController *)v3 navigationItem];
    v6 = [(TVSettingsLanguageSettingsController *)v4 editButtonItem];
    [v5 setRightBarButtonItem:v6];

    v7 = [(TVSettingsLanguageSettingsController *)v4 navigationItem];
    v8 = [v7 rightBarButtonItem];
    [v8 setEnabled:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v4 selector:"_preferredLanguagesDidChange:" name:@"PreferredAudioLanguagesDidChangeNotification" object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v4 selector:"_preferredLanguagesDidChange:" name:@"PreferredSubtitleLanguagesDidChangeNotification" object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v4 selector:"_willResignActive:" name:UIApplicationWillResignActiveNotification object:0];

    BYTE5(v4->_addSubtitleLanguageSpecifier) = 0;
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVSettingsLanguageSettingsController;
  [(TVSettingsListMonitorController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v3 = [(TVSettingsLanguageSettingsController *)self parentController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)(&self->_hasLocalChange + 3), v3);
  }
  objc_super v4 = [*(id *)(&self->_hasLocalChange + 3) selectedAudioLanguages];
  *(void *)(&self->super + 1) = [v4 count];

  v5 = [*(id *)(&self->_hasLocalChange + 3) preferredSubtitleLanguageCodes];
  *(unint64_t *)((char *)&self->_numberOfAudioLanguages + 4) = (unint64_t)[v5 count];

  v9.receiver = self;
  v9.super_class = (Class)TVSettingsLanguageSettingsController;
  [(TVSettingsLanguageSettingsController *)&v9 viewDidLoad];
  BOOL v6 = [(TVSettingsLanguageSettingsController *)self _shouldEditButtonBeEnabled];
  v7 = [(TVSettingsLanguageSettingsController *)self navigationItem];
  v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:v6];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TVSettingsLanguageSettingsController;
  [(TVSettingsLanguageSettingsController *)&v9 viewDidAppear:a3];
  objc_super v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.tv/com.apple.videos:TopLevelAudioAndSubtitleLanguages"];
  v5 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"SETTINGS_TITLE_APPS" defaultValue:@"Apps"];
  BOOL v6 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"SETTINGS_TITLE_TV" defaultValue:@"TV"];
  v7 = +[TopLevelSettingsController preferencesExtendedLocalizedName:@"LANGUAGE_SETTINGS_TITLE" defaultValue:@"Languages"];
  if (objc_opt_respondsToSelector())
  {
    NSLog(@"TVSettingsLog - Emitting navigation event for Languages application settings");
    v10[0] = v5;
    v10[1] = v6;
    v8 = +[NSArray arrayWithObjects:v10 count:2];
    [(TVSettingsLanguageSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.tv" title:v7 localizedNavigationComponents:v8 deepLink:v4];
  }
}

- (void)_willResignActive:(id)a3
{
  if ([(TVSettingsLanguageSettingsController *)self isEditing])
  {
    [(TVSettingsLanguageSettingsController *)self setEditing:0 animated:0];
  }
}

- (void)reloadSpecifiers
{
  v3 = [*(id *)(&self->_hasLocalChange + 3) selectedAudioLanguages];
  *(void *)(&self->super + 1) = [v3 count];

  objc_super v4 = [*(id *)(&self->_hasLocalChange + 3) preferredSubtitleLanguageCodes];
  *(unint64_t *)((char *)&self->_numberOfAudioLanguages + 4) = (unint64_t)[v4 count];

  v8.receiver = self;
  v8.super_class = (Class)TVSettingsLanguageSettingsController;
  [(TVSettingsLanguageSettingsController *)&v8 reloadSpecifiers];
  BOOL v5 = [(TVSettingsLanguageSettingsController *)self _shouldEditButtonBeEnabled];
  BOOL v6 = [(TVSettingsLanguageSettingsController *)self navigationItem];
  v7 = [v6 rightBarButtonItem];
  [v7 setEnabled:v5];
}

- (id)specifiers
{
  v3 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v60 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    BOOL v5 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    BOOL v6 = [v5 localizedStringForKey:@"LANGUAGE_SETTINGS_TITLE" value:&stru_18968 table:@"TVSettings"];
    [(TVSettingsLanguageSettingsController *)self setTitle:v6];

    v7 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    objc_super v8 = [v7 localizedStringForKey:@"DOWNLOAD_AUDIO_LANGUAGES_TITLE" value:&stru_18968 table:@"TVSettings"];
    objc_super v9 = +[PSSpecifier groupSpecifierWithID:@"com.apple.videos:AudioLanguagesGroupSpecifier" name:v8];

    v10 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    v11 = [v10 localizedStringForKey:@"DOWNLOAD_AUDIO_LANGUAGES_EXPLANATION" value:&stru_18968 table:@"TVSettings"];
    uint64_t v58 = PSFooterTextGroupKey;
    objc_msgSend(v9, "setProperty:forKey:", v11);

    v59 = v9;
    [v4 addObject:v9];
    v12 = [*(id *)(&self->_hasLocalChange + 3) selectedAudioLanguages];
    id v13 = [v12 mutableCopy];

    [v13 sortUsingComparator:&stru_18640];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v67;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v67 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [(TVSettingsLanguageSettingsController *)self _specifierForLanguage:*(void *)(*((void *)&v66 + 1) + 8 * i)];
          [v4 addObject:v19];
        }
        id v16 = [v14 countByEnumeratingWithState:&v66 objects:v71 count:16];
      }
      while (v16);
    }

    v20 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    v21 = [v20 localizedStringForKey:@"ADD_AUDIO_DOWNLOAD_LANGUAGE_ACTION" value:&stru_18968 table:@"TVSettings"];
    uint64_t v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:0 get:0 detail:0 cell:13 edit:0];
    v23 = *(void **)((char *)&self->_numberOfSubtitleLanguages + 4);
    *(unint64_t *)((char *)&self->_numberOfSubtitleLanguages + 4) = v22;

    uint64_t v24 = PSIDKey;
    [*(id *)((char *)&self->_numberOfSubtitleLanguages + 4) setProperty:@"AddNewAudioLanguage" forKey:PSIDKey];
    [*(id *)((char *)&self->_numberOfSubtitleLanguages + 4) setButtonAction:"_showAddAudioLanguagePicker:"];
    [v4 addObject:*(unint64_t *)((char *)&self->_numberOfSubtitleLanguages + 4)];
    v25 = [*(id *)(&self->_hasLocalChange + 3) useDefaultSubtitleLanguages];
    unsigned int v26 = [v25 BOOLValue];

    v27 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    v28 = [v27 localizedStringForKey:@"DOWNLOAD_SUBTITLE_LANGUAGES_TITLE" value:&stru_18968 table:@"TVSettings"];
    v29 = +[PSSpecifier groupSpecifierWithID:@"com.apple.videos:UseDefaultSubtitleLanguagesGroupSpecifier" name:v28];
    v30 = *(PSSpecifier **)((char *)&self->_addAudioLanguageSpecifier + 4);
    *(PSSpecifier **)((char *)&self->_addAudioLanguageSpecifier + 4) = v29;

    char v57 = v26;
    if (v26)
    {
      v31 = *(PSSpecifier **)((char *)&self->_addAudioLanguageSpecifier + 4);
      v32 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
      v33 = [v32 localizedStringForKey:@"DOWNLOAD_SUBTITLE_LANGUAGES_EXPLANATION" value:&stru_18968 table:@"TVSettings"];
      [v31 setProperty:v33 forKey:v58];
    }
    [v4 addObject:*(PSSpecifier **)((char *)&self->_addAudioLanguageSpecifier + 4)];
    v34 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    v35 = [v34 localizedStringForKey:@"DOWNLOAD_DEFAULT_SUBTITLE_LANGUAGES_SWITCH_TITLE" value:&stru_18968 table:@"TVSettings"];
    v36 = +[PSSpecifier preferenceSpecifierNamed:v35 target:self set:"_setUseDefaultSubtitleLanguages:" get:"_useDefaultSubtitleLanguages" detail:0 cell:6 edit:0];
    v37 = *(PSSpecifier **)((char *)&self->_useDefaultSubtitleLanguagesGroupSpecifier + 4);
    *(PSSpecifier **)((char *)&self->_useDefaultSubtitleLanguagesGroupSpecifier + 4) = v36;

    [*(id *)((char *)&self->_useDefaultSubtitleLanguagesGroupSpecifier + 4) setProperty:@"com.apple.videos:UseDefaultSubtitleLanguagesSpecifier" forKey:v24];
    [v4 addObject:*(PSSpecifier **)((char *)&self->_useDefaultSubtitleLanguagesGroupSpecifier + 4)];
    v38 = +[PSSpecifier groupSpecifierWithID:@"com.apple.videos:SubtitleLanguagesGroupSpecifierID"];
    v39 = *(PSSpecifier **)((char *)&self->_useDefaultSubtitleLanguagesSpecifier + 4);
    *(PSSpecifier **)((char *)&self->_useDefaultSubtitleLanguagesSpecifier + 4) = v38;

    v40 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    v41 = [v40 localizedStringForKey:@"ADD_SUBTITLE_DOWNLOAD_LANGUAGE_ACTION" value:&stru_18968 table:@"TVSettings"];
    v42 = +[PSSpecifier preferenceSpecifierNamed:v41 target:self set:0 get:0 detail:0 cell:13 edit:0];
    v43 = *(NSMutableArray **)((char *)&self->_subtitleLanguageSpecifiers + 4);
    *(NSMutableArray **)((char *)&self->_subtitleLanguageSpecifiers + 4) = v42;

    [*(id *)((char *)&self->_subtitleLanguageSpecifiers + 4) setProperty:@"AddNewSubtitleLanguage" forKey:v24];
    [*(id *)((char *)&self->_subtitleLanguageSpecifiers + 4) setButtonAction:"_showAddSubtitleLanguagePicker:"];
    v44 = [*(id *)(&self->_hasLocalChange + 3) preferredSubtitleLanguageCodes];
    id v45 = [v44 mutableCopy];

    [v45 sortUsingComparator:&stru_18660];
    id v46 = objc_alloc_init((Class)NSMutableArray);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v47 = v45;
    id v48 = [v47 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v63;
      do
      {
        for (j = 0; j != v49; j = (char *)j + 1)
        {
          if (*(void *)v63 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = [(TVSettingsLanguageSettingsController *)self _specifierForLanguage:*(void *)(*((void *)&v62 + 1) + 8 * (void)j)];
          [v46 addObject:v52];
        }
        id v49 = [v47 countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v49);
    }

    objc_storeStrong((id *)((char *)&self->_subtitleLanguagesGroupSpecifier + 4), v46);
    if ((v57 & 1) == 0)
    {
      v61 = *(PSSpecifier **)((char *)&self->_useDefaultSubtitleLanguagesSpecifier + 4);
      v53 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
      v54 = [v53 localizedStringForKey:@"DOWNLOAD_SUBTITLE_LANGUAGES_EXPLANATION" value:&stru_18968 table:@"TVSettings"];
      [v61 setProperty:v54 forKey:v58];

      [v4 addObject:*(PSSpecifier **)((char *)&self->_useDefaultSubtitleLanguagesSpecifier + 4)];
      [v4 addObjectsFromArray:*(PSSpecifier **)((char *)&self->_subtitleLanguagesGroupSpecifier + 4)];
      [v4 addObject:*(NSMutableArray **)((char *)&self->_subtitleLanguageSpecifiers + 4)];
    }
    v55 = *(void **)&self->super.PSListController_opaque[v60];
    *(void *)&self->super.PSListController_opaque[v60] = v4;

    v3 = *(void **)&self->super.PSListController_opaque[v60];
  }

  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVSettingsLanguageSettingsController;
  -[TVSettingsLanguageSettingsController setEditing:animated:](&v11, "setEditing:animated:");
  if (v5)
  {
    if (!BYTE4(self->_addSubtitleLanguageSpecifier))
    {
      [(TVSettingsLanguageSettingsController *)self beginUpdates];
      [(TVSettingsLanguageSettingsController *)self removeSpecifier:*(unint64_t *)((char *)&self->_numberOfSubtitleLanguages + 4) animated:1];
      if ([*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] containsObject:*(NSMutableArray **)((char *)&self->_subtitleLanguageSpecifiers + 4)])-[TVSettingsLanguageSettingsController removeSpecifier:animated:](self, "removeSpecifier:animated:", *(NSMutableArray **)((char *)&self->_subtitleLanguageSpecifiers + 4), 1); {
      [*(id *)((char *)&self->_useDefaultSubtitleLanguagesGroupSpecifier + 4) setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
      }
      [(TVSettingsLanguageSettingsController *)self reloadSpecifier:*(PSSpecifier **)((char *)&self->_useDefaultSubtitleLanguagesGroupSpecifier + 4) animated:0];
      [(TVSettingsLanguageSettingsController *)self endUpdates];
    }
  }
  else
  {
    if (!BYTE4(self->_addSubtitleLanguageSpecifier))
    {
      [(TVSettingsLanguageSettingsController *)self beginUpdates];
      [(TVSettingsLanguageSettingsController *)self insertSpecifier:*(unint64_t *)((char *)&self->_numberOfSubtitleLanguages + 4) atEndOfGroup:0 animated:1];
      if ([*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] containsObject:*(PSSpecifier **)((char *)&self->_useDefaultSubtitleLanguagesSpecifier + 4)])-[TVSettingsLanguageSettingsController insertSpecifier:atEndOfGroup:animated:](self, "insertSpecifier:atEndOfGroup:animated:", *(NSMutableArray **)((char *)&self->_subtitleLanguageSpecifiers + 4), 2, 1); {
      [*(id *)((char *)&self->_useDefaultSubtitleLanguagesGroupSpecifier + 4) setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
      }
      [(TVSettingsLanguageSettingsController *)self reloadSpecifier:*(PSSpecifier **)((char *)&self->_useDefaultSubtitleLanguagesGroupSpecifier + 4) animated:0];
      [(TVSettingsLanguageSettingsController *)self endUpdates];
    }
    BOOL v7 = ([(TVSettingsLanguageSettingsController *)self isEditing] & 1) != 0
      || [(TVSettingsLanguageSettingsController *)self _shouldEditButtonBeEnabled];
    objc_super v8 = [(TVSettingsLanguageSettingsController *)self navigationItem];
    objc_super v9 = [v8 rightBarButtonItem];
    [v9 setEnabled:v7];
  }
  v10 = [(TVSettingsLanguageSettingsController *)self table];
  [v10 setEditing:v5 animated:v4];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = ([v5 section] || *(void *)(&self->super + 1) >= 2uLL)
    && ([v5 section] != (char *)&dword_0 + 1 || objc_msgSend(v5, "row") != 0);

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 cellForRowAtIndexPath:v6];
  objc_opt_class();
  int64_t v10 = 0;
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [v5 cellForRowAtIndexPath:v6];
    unsigned __int8 v9 = [v8 canBeDeleted];

    if (v9) {
      int64_t v10 = 1;
    }
  }

  return v10;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  BYTE4(self->_addSubtitleLanguageSpecifier) = 1;
  [(TVSettingsLanguageSettingsController *)self setEditing:1 animated:1];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  if ([(TVSettingsLanguageSettingsController *)self isEditing]
    && BYTE4(self->_addSubtitleLanguageSpecifier))
  {
    [(TVSettingsLanguageSettingsController *)self setEditing:0 animated:1];
  }
  BYTE4(self->_addSubtitleLanguageSpecifier) = 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  objc_super v8 = v7;
  if (a4 == 1)
  {
    id v9 = [v7 section];
    uint64_t v10 = OBJC_IVAR___PSListController__specifiers;
    objc_super v11 = v9
        ? @"com.apple.videos:SubtitleLanguagesGroupSpecifierID"
        : @"com.apple.videos:AudioLanguagesGroupSpecifier";
    id v12 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] indexOfSpecifierWithID:v11];
    if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v13 = objc_msgSend(*(id *)&self->super.PSListController_opaque[v10], "objectAtIndex:", (char *)objc_msgSend(v8, "row") + (void)v12 + 1);
      id v14 = [v13 propertyForKey:PSIDKey];
      if (v14)
      {
        id v15 = qword_1FA48;
        if (os_log_type_enabled((os_log_t)qword_1FA48, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 138412290;
          uint64_t v24 = v14;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Removing language %@ from download preferences.", (uint8_t *)&v23, 0xCu);
        }
        BYTE5(self->_addSubtitleLanguageSpecifier) = 1;
        id v16 = *(void **)(&self->_hasLocalChange + 3);
        if (v9)
        {
          uint64_t v17 = [v16 preferredSubtitleLanguageCodes];
          id v18 = [v17 mutableCopy];

          [v18 removeObject:v14];
          *(unint64_t *)((char *)&self->_numberOfAudioLanguages + 4) = (unint64_t)[v18 count];
          [*(id *)(&self->_hasLocalChange + 3) setPreferredSubtitleLanguageCodes:v18];
          [*(id *)((char *)&self->_subtitleLanguagesGroupSpecifier + 4) removeObject:v13];
        }
        else
        {
          v19 = [v16 selectedAudioLanguages];
          id v18 = [v19 mutableCopy];

          [v18 removeObject:v14];
          *(void *)(&self->super + 1) = [v18 count];
          [*(id *)(&self->_hasLocalChange + 3) setSelectedAudioLanguages:v18];
        }
      }
      [(TVSettingsLanguageSettingsController *)self removeSpecifier:v13 animated:1];
      BOOL v20 = [(TVSettingsLanguageSettingsController *)self _shouldEditButtonBeEnabled];
      v21 = [(TVSettingsLanguageSettingsController *)self navigationItem];
      uint64_t v22 = [v21 rightBarButtonItem];
      [v22 setEnabled:v20];

      if (![(TVSettingsLanguageSettingsController *)self _shouldEditButtonBeEnabled]
        && !BYTE4(self->_addSubtitleLanguageSpecifier))
      {
        [(TVSettingsLanguageSettingsController *)self performSelector:"_setEditingToNoAfterDelay" withObject:0 afterDelay:0.0];
      }
    }
  }
}

- (void)_showAddAudioLanguagePicker:(id)a3
{
  id v4 = a3;
  id v5 = qword_1FA48;
  if (os_log_type_enabled((os_log_t)qword_1FA48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Preparing to show Add Audio Languages view.", v7, 2u);
  }
  id v6 = [(TVSettingsAddLanguageSetupController *)[TVSettingsAddAudioLanguageSetupController alloc] initWithTopLevelController:*(void *)(&self->_hasLocalChange + 3)];
  [(TVSettingsAddAudioLanguageSetupController *)v6 setParentController:self];
  [(TVSettingsAddAudioLanguageSetupController *)v6 setSpecifier:v4];
  [v4 setTarget:self];
  [(TVSettingsLanguageSettingsController *)self showController:v6];
}

- (void)_showAddSubtitleLanguagePicker:(id)a3
{
  id v4 = a3;
  id v5 = qword_1FA48;
  if (os_log_type_enabled((os_log_t)qword_1FA48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Preparing to show Add Subitle Languages view.", v7, 2u);
  }
  id v6 = [(TVSettingsAddLanguageSetupController *)[TVSettingsAddSubtitleLanguageSetupController alloc] initWithTopLevelController:*(void *)(&self->_hasLocalChange + 3)];
  [(TVSettingsAddSubtitleLanguageSetupController *)v6 setParentController:self];
  [(TVSettingsAddSubtitleLanguageSetupController *)v6 setSpecifier:v4];
  [v4 setTarget:self];
  [(TVSettingsLanguageSettingsController *)self showController:v6];
}

- (BOOL)_shouldEditButtonBeEnabled
{
  if (*(void *)(&self->super + 1) > 1uLL) {
    return 1;
  }
  v3 = [*(id *)(&self->_hasLocalChange + 3) useDefaultSubtitleLanguages];
  BOOL v4 = ([v3 BOOLValue] & 1) == 0
    && *(unint64_t *)((char *)&self->_numberOfAudioLanguages + 4) != 0;

  return v4;
}

- (id)_specifierForLanguage:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:0 set:0 get:0 detail:0 cell:3 edit:0];
  [v4 setProperty:v3 forKey:PSIDKey];

  [v4 setProperty:objc_opt_class() forKey:PSCellClassKey];

  return v4;
}

- (void)_setEditingToNoAfterDelay
{
}

- (void)_preferredLanguagesDidChange:(id)a3
{
  if (!BYTE5(self->_addSubtitleLanguageSpecifier)) {
    [(TVSettingsLanguageSettingsController *)self reloadSpecifiers];
  }
  BYTE5(self->_addSubtitleLanguageSpecifier) = 0;
}

- (void)_setUseDefaultSubtitleLanguages:(id)a3
{
  id v18 = a3;
  objc_msgSend(*(id *)(&self->_hasLocalChange + 3), "setUseDefaultSubtitleLanguages:");
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = v4;
  if (*(PSSpecifier **)((char *)&self->_useDefaultSubtitleLanguagesSpecifier + 4)) {
    objc_msgSend(v4, "addObject:");
  }
  if ([*(id *)((char *)&self->_subtitleLanguagesGroupSpecifier + 4) count]) {
    [v5 addObjectsFromArray:*(PSSpecifier **)((char *)&self->_subtitleLanguagesGroupSpecifier + 4)];
  }
  if (*(NSMutableArray **)((char *)&self->_subtitleLanguageSpecifiers + 4)) {
    objc_msgSend(v5, "addObject:");
  }
  unsigned int v6 = [v18 BOOLValue];
  id v7 = *(PSSpecifier **)((char *)&self->_addAudioLanguageSpecifier + 4);
  if (v6)
  {
    objc_super v8 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    id v9 = [v8 localizedStringForKey:@"DOWNLOAD_SUBTITLE_LANGUAGES_EXPLANATION" value:&stru_18968 table:@"TVSettings"];
    uint64_t v10 = PSFooterTextGroupKey;
    [v7 setProperty:v9 forKey:PSFooterTextGroupKey];

    [*(id *)((char *)&self->_useDefaultSubtitleLanguagesSpecifier + 4) removePropertyForKey:v10];
    [(TVSettingsLanguageSettingsController *)self beginUpdates];
    [(TVSettingsLanguageSettingsController *)self reloadSpecifier:*(PSSpecifier **)((char *)&self->_addAudioLanguageSpecifier + 4) animated:1];
    [(TVSettingsLanguageSettingsController *)self removeContiguousSpecifiers:v5 animated:1];
  }
  else
  {
    uint64_t v11 = PSFooterTextGroupKey;
    [*(id *)((char *)&self->_addAudioLanguageSpecifier + 4) removePropertyForKey:PSFooterTextGroupKey];
    id v12 = *(PSSpecifier **)((char *)&self->_useDefaultSubtitleLanguagesSpecifier + 4);
    id v13 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    id v14 = [v13 localizedStringForKey:@"DOWNLOAD_SUBTITLE_LANGUAGES_EXPLANATION" value:&stru_18968 table:@"TVSettings"];
    [v12 setProperty:v14 forKey:v11];

    [(TVSettingsLanguageSettingsController *)self beginUpdates];
    [(TVSettingsLanguageSettingsController *)self reloadSpecifier:*(PSSpecifier **)((char *)&self->_addAudioLanguageSpecifier + 4) animated:1];
    [(TVSettingsLanguageSettingsController *)self addSpecifiersFromArray:v5 animated:1];
  }
  [(TVSettingsLanguageSettingsController *)self endUpdates];
  BOOL v15 = [(TVSettingsLanguageSettingsController *)self _shouldEditButtonBeEnabled];
  id v16 = [(TVSettingsLanguageSettingsController *)self navigationItem];
  uint64_t v17 = [v16 rightBarButtonItem];
  [v17 setEnabled:v15];
}

- (id)_useDefaultSubtitleLanguages
{
  return [*(id *)(&self->_hasLocalChange + 3) useDefaultSubtitleLanguages];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->_hasLocalChange + 3), 0);
  objc_storeStrong((id *)((char *)&self->_subtitleLanguageSpecifiers + 4), 0);
  objc_storeStrong((id *)((char *)&self->_subtitleLanguagesGroupSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_useDefaultSubtitleLanguagesSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_useDefaultSubtitleLanguagesGroupSpecifier + 4), 0);
  objc_storeStrong((id *)((char *)&self->_addAudioLanguageSpecifier + 4), 0);

  objc_storeStrong((id *)((char *)&self->_numberOfSubtitleLanguages + 4), 0);
}

@end