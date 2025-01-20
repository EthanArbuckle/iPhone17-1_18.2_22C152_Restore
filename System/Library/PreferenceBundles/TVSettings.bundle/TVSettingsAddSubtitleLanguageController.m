@interface TVSettingsAddSubtitleLanguageController
- (TVSettingsAddSubtitleLanguageController)initWithTopLevelController:(id)a3;
- (id)selectedLanguages;
- (id)specifiers;
- (id)unselectedLanguages;
- (void)_setupNavigationBar;
- (void)dealloc;
- (void)setSelectedLanguages:(id)a3;
@end

@implementation TVSettingsAddSubtitleLanguageController

- (TVSettingsAddSubtitleLanguageController)initWithTopLevelController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TVSettingsAddSubtitleLanguageController;
  v3 = [(TVSettingsAddLanguageController *)&v6 initWithTopLevelController:a3];
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"_preferredLanguagesDidChange:" name:@"PreferredSubtitleLanguagesDidChangeNotification" object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVSettingsAddSubtitleLanguageController;
  [(TVSettingsAddLanguageController *)&v4 dealloc];
}

- (id)selectedLanguages
{
  v2 = [(TVSettingsAddLanguageController *)self topLevelController];
  v3 = [v2 preferredSubtitleLanguageCodes];

  return v3;
}

- (void)setSelectedLanguages:(id)a3
{
  id v4 = a3;
  id v5 = [(TVSettingsAddLanguageController *)self topLevelController];
  [v5 setPreferredSubtitleLanguageCodes:v4];
}

- (id)specifiers
{
  v3 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v19 = OBJC_IVAR___PSListController__specifiers;
    id v18 = objc_alloc_init((Class)NSMutableArray);
    id v4 = +[NSMutableSet set];
    v20 = +[NSMutableArray array];
    v21 = self;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = self->super._filteredLanguages;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
      uint64_t v9 = PSIDKey;
      uint64_t v10 = PSCellClassKey;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v13 = [v4 member:v12];

          if (!v13)
          {
            [v4 addObject:v12];
            v14 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v12];
            v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:v21 set:0 get:0 detail:0 cell:3 edit:0];

            [v15 setProperty:v12 forKey:v9];
            [v15 setProperty:objc_opt_class() forKey:v10];
            [v20 addObject:v15];
          }
        }
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }

    [v20 sortUsingComparator:&stru_185E0];
    [v18 addObjectsFromArray:v20];
    v16 = *(void **)&v21->super.PSListController_opaque[v19];
    *(void *)&v21->super.PSListController_opaque[v19] = v18;

    v3 = *(void **)&v21->super.PSListController_opaque[v19];
  }

  return v3;
}

- (void)_setupNavigationBar
{
  v3 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  id v4 = [v3 localizedStringForKey:@"ADD_SUBTITLE_LANGUAGE_PAGE_TITLE" value:&stru_18968 table:@"TVSettings"];
  [(TVSettingsAddSubtitleLanguageController *)self setTitle:v4];

  v5.receiver = self;
  v5.super_class = (Class)TVSettingsAddSubtitleLanguageController;
  [(TVSettingsAddLanguageController *)&v5 _setupNavigationBar];
}

- (id)unselectedLanguages
{
  unselectedLanguages = self->super._unselectedLanguages;
  if (!unselectedLanguages)
  {
    id v4 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [&off_1B980 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(&off_1B980);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (([(NSMutableArray *)self->super._stagedLanguages containsObject:v9] & 1) == 0) {
            [(NSArray *)v4 addObject:v9];
          }
        }
        id v6 = [&off_1B980 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    uint64_t v10 = self->super._unselectedLanguages;
    self->super._unselectedLanguages = v4;

    unselectedLanguages = self->super._unselectedLanguages;
  }

  return unselectedLanguages;
}

@end