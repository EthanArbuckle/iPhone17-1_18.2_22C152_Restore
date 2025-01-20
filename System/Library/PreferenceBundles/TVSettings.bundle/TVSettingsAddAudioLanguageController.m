@interface TVSettingsAddAudioLanguageController
- (TVSettingsAddAudioLanguageController)initWithTopLevelController:(id)a3;
- (id)selectedLanguages;
- (id)specifiers;
- (id)unselectedLanguages;
- (void)_setupNavigationBar;
- (void)dealloc;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)setSelectedLanguages:(id)a3;
@end

@implementation TVSettingsAddAudioLanguageController

- (TVSettingsAddAudioLanguageController)initWithTopLevelController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TVSettingsAddAudioLanguageController;
  v3 = [(TVSettingsAddLanguageController *)&v7 initWithTopLevelController:a3];
  v4 = v3;
  if (v3)
  {
    v3->_shouldShowOriginalAudioLanguage = 1;
    v3->_shouldShowDeviceAudioLanguage = 1;
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"_preferredLanguagesDidChange:" name:@"PreferredAudioLanguagesDidChangeNotification" object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVSettingsAddAudioLanguageController;
  [(TVSettingsAddLanguageController *)&v4 dealloc];
}

- (id)selectedLanguages
{
  v2 = [(TVSettingsAddLanguageController *)self topLevelController];
  v3 = [v2 selectedAudioLanguages];

  return v3;
}

- (void)setSelectedLanguages:(id)a3
{
  id v4 = a3;
  id v5 = [(TVSettingsAddLanguageController *)self topLevelController];
  [v5 setSelectedAudioLanguages:v4];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    self->_shouldShowOriginalAudioLanguage = [(NSString *)self->_originalAudioName containsString:v7];
    self->_shouldShowDeviceAudioLanguage = [(NSString *)self->_deviceAudioName containsString:v7];
  }
  else
  {
    self->_shouldShowOriginalAudioLanguage = 1;
    self->_shouldShowDeviceAudioLanguage = 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)TVSettingsAddAudioLanguageController;
  [(TVSettingsAddLanguageController *)&v8 searchBar:v6 textDidChange:v7];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  self->_shouldShowOriginalAudioLanguage = 1;
  self->_shouldShowDeviceAudioLanguage = 1;
  v3.receiver = self;
  v3.super_class = (Class)TVSettingsAddAudioLanguageController;
  [(TVSettingsAddLanguageController *)&v3 searchBarCancelButtonClicked:a3];
}

- (id)specifiers
{
  objc_super v3 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v38 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = +[NSMutableSet set];
    if (self->_shouldShowOriginalAudioLanguage) {
      unsigned int v6 = [(NSMutableArray *)self->super._stagedLanguages containsObject:@"ORIGINAL_AUDIO_LANGUAGE"] ^ 1;
    }
    else {
      unsigned int v6 = 0;
    }
    if (self->_shouldShowDeviceAudioLanguage) {
      unsigned int v7 = [(NSMutableArray *)self->super._stagedLanguages containsObject:@"DEVICE_AUDIO_LANGUAGE"] ^ 1;
    }
    else {
      unsigned int v7 = 0;
    }
    if ((v6 | v7) == 1)
    {
      objc_super v8 = +[PSSpecifier emptyGroupSpecifier];
      [v4 addObject:v8];

      if (v6)
      {
        v9 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
        uint64_t v10 = [v9 localizedStringForKey:@"ORIGINAL_AUDIO_LANGUAGE" value:&stru_18968 table:@"TVSettings"];
        v11 = (void *)v10;
        if (v10) {
          v12 = (__CFString *)v10;
        }
        else {
          v12 = &stru_18968;
        }
        objc_storeStrong((id *)&self->_originalAudioName, v12);

        v13 = +[PSSpecifier preferenceSpecifierNamed:self->_originalAudioName target:self set:0 get:0 detail:0 cell:3 edit:0];
        [v13 setProperty:@"ORIGINAL_AUDIO_LANGUAGE" forKey:PSIDKey];
        [v13 setProperty:objc_opt_class() forKey:PSCellClassKey];
        [v4 addObject:v13];
      }
      if (v7)
      {
        v14 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
        v15 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DEVICE_AUDIO_LANGUAGE_FORMAT"];
        v16 = [v14 localizedStringForKey:v15 value:&stru_18968 table:@"TVSettings"];

        v17 = +[NSLocale preferredLanguages];
        v18 = [v17 firstObject];
        v19 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v18];

        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v19);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        deviceAudioName = self->_deviceAudioName;
        self->_deviceAudioName = v20;

        v22 = +[PSSpecifier preferenceSpecifierNamed:self->_deviceAudioName target:self set:0 get:0 detail:0 cell:3 edit:0];
        [v22 setProperty:@"DEVICE_AUDIO_LANGUAGE" forKey:PSIDKey];
        [v22 setProperty:objc_opt_class() forKey:PSCellClassKey];
        [v4 addObject:v22];
      }
      v23 = +[PSSpecifier emptyGroupSpecifier];
      [v4 addObject:v23];
    }
    v37 = v4;
    v39 = +[NSMutableArray array];
    v40 = self;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v24 = self->super._filteredLanguages;
    id v25 = [(NSArray *)v24 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v42;
      uint64_t v28 = PSIDKey;
      uint64_t v29 = PSCellClassKey;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v42 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v31 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          v32 = [v5 member:v31];

          if (!v32)
          {
            [v5 addObject:v31];
            v33 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v31];
            v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:v40 set:0 get:0 detail:0 cell:3 edit:0];

            [v34 setProperty:v31 forKey:v28];
            [v34 setProperty:objc_opt_class() forKey:v29];
            [v39 addObject:v34];
          }
        }
        id v26 = [(NSArray *)v24 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v26);
    }

    [v39 sortUsingComparator:&stru_185C0];
    [v37 addObjectsFromArray:v39];
    v35 = *(void **)&v40->super.PSListController_opaque[v38];
    *(void *)&v40->super.PSListController_opaque[v38] = v37;

    objc_super v3 = *(void **)&v40->super.PSListController_opaque[v38];
  }

  return v3;
}

- (void)_setupNavigationBar
{
  objc_super v3 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  id v4 = [v3 localizedStringForKey:@"ADD_AUDIO_LANGUAGE_PAGE_TITLE" value:&stru_18968 table:@"TVSettings"];
  [(TVSettingsAddAudioLanguageController *)self setTitle:v4];

  v5.receiver = self;
  v5.super_class = (Class)TVSettingsAddAudioLanguageController;
  [(TVSettingsAddLanguageController *)&v5 _setupNavigationBar];
}

- (id)unselectedLanguages
{
  unselectedLanguages = self->super._unselectedLanguages;
  if (!unselectedLanguages)
  {
    id v4 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v5 = +[NSLocale preferredLanguages];
    unsigned int v6 = [v5 firstObject];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [&off_1B968 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(&off_1B968);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (([(NSMutableArray *)self->super._stagedLanguages containsObject:v11] & 1) == 0
            && ([v11 isEqualToString:v6] & 1) == 0)
          {
            [(NSArray *)v4 addObject:v11];
          }
        }
        id v8 = [&off_1B968 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    v12 = self->super._unselectedLanguages;
    self->super._unselectedLanguages = v4;

    unselectedLanguages = self->super._unselectedLanguages;
  }

  return unselectedLanguages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAudioName, 0);

  objc_storeStrong((id *)&self->_originalAudioName, 0);
}

@end