@interface AXPronunciationLanguageListController
- (AXPronunciationLanguageListControllerDelegate)delegate;
- (NSMutableSet)selectedLanguages;
- (id)specifiers;
- (void)setDelegate:(id)a3;
- (void)setSelectedLanguages:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXPronunciationLanguageListController

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AXPronunciationLanguageListController;
  [(AXPronunciationLanguageListController *)&v9 viewWillAppear:a3];
  v4 = [(AXPronunciationLanguageListController *)self specifier];
  v5 = [v4 objectForKeyedSubscript:@"Languages"];
  if (v5)
  {
    v6 = [(AXPronunciationLanguageListController *)self specifier];
    v7 = [v6 propertyForKey:@"Languages"];
    id v8 = [v7 mutableCopy];
    [(AXPronunciationLanguageListController *)self setSelectedLanguages:v8];
  }
  else
  {
    v6 = +[NSMutableSet set];
    [(AXPronunciationLanguageListController *)self setSelectedLanguages:v6];
  }
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v21 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = +[PSSpecifier emptyGroupSpecifier];
    v6 = settingsLocString(@"PRONUNCIATION_LANGUAGE_HELP", @"VoiceOverSettings");
    [v5 setObject:v6 forKeyedSubscript:PSFooterTextGroupKey];

    [v4 addObject:v5];
    v7 = settingsLocString(@"ALL_LANGUAGES", @"VoiceOverSettings");
    id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v8 setProperty:@"ALL" forKey:PSIDKey];
    [v4 addObject:v8];
    uint64_t v9 = +[PSSpecifier emptyGroupSpecifier];

    v20 = (void *)v9;
    [v4 addObject:v9];
    AXLanguagesAvailableForPronuncationEditor();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        v13 = 0;
        v14 = v8;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v13);
          v16 = [v15 objectAtIndexedSubscript:0];
          v17 = [v15 objectAtIndexedSubscript:1];
          id v8 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v8 setObject:v16 forKeyedSubscript:@"Language"];
          [v4 addObject:v8];

          v13 = (char *)v13 + 1;
          v14 = v8;
        }
        while (v11 != v13);
        id v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }
    v18 = *(void **)&self->AXUISettingsBaseListController_opaque[v21];
    *(void *)&self->AXUISettingsBaseListController_opaque[v21] = v4;

    v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v21];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)AXPronunciationLanguageListController;
  [(AXPronunciationLanguageListController *)&v36 tableView:v6 didSelectRowAtIndexPath:v7];
  v31 = v6;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  v30 = v7;
  v29 = [(AXPronunciationLanguageListController *)self specifierForIndexPath:v7];
  uint64_t v8 = [v29 objectForKeyedSubscript:@"Language"];
  uint64_t v9 = [(AXPronunciationLanguageListController *)self selectedLanguages];
  id v10 = v9;
  v28 = (void *)v8;
  if (v8)
  {
    unsigned int v11 = [v9 containsObject:v8];

    uint64_t v12 = [(AXPronunciationLanguageListController *)self selectedLanguages];
    id v10 = v12;
    if (v11) {
      [v12 removeObject:v8];
    }
    else {
      [v12 addObject:v8];
    }
  }
  else
  {
    [v9 removeAllObjects];
  }

  v13 = [(AXPronunciationLanguageListController *)self delegate];
  v14 = [(AXPronunciationLanguageListController *)self selectedLanguages];
  [v13 pronunciationLanguageListController:self didSelectLanguages:v14];

  [(AXPronunciationLanguageListController *)self updateVisibleCellsWithCheckedSelection:0];
  v15 = [(AXPronunciationLanguageListController *)self cellForSpecifierID:@"ALL"];
  v16 = [(AXPronunciationLanguageListController *)self selectedLanguages];
  v27 = v15;
  objc_msgSend(v15, "setChecked:", objc_msgSend(v16, "count") == 0);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v17 = OBJC_IVAR___PSListController__table;
  v18 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] indexPathsForVisibleRows];
  id v19 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = [*(id *)&self->AXUISettingsBaseListController_opaque[v17] cellForRowAtIndexPath:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        long long v24 = [v23 specifier];
        long long v25 = [v24 propertyForKey:@"Language"];

        if (v25)
        {
          long long v26 = [(AXPronunciationLanguageListController *)self selectedLanguages];
          objc_msgSend(v23, "setChecked:", objc_msgSend(v26, "containsObject:", v25));
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v20);
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  uint64_t v8 = [(AXPronunciationLanguageListController *)self specifierForIndexPath:v7];
  uint64_t v9 = [v8 objectForKeyedSubscript:PSIDKey];

  id v10 = [(AXPronunciationLanguageListController *)self specifierForIndexPath:v7];

  unsigned int v11 = [v10 objectForKeyedSubscript:@"Language"];

  unsigned int v12 = [v9 isEqualToString:@"ALL"];
  if (v12)
  {
    id v10 = [(AXPronunciationLanguageListController *)self selectedLanguages];
    if (![v10 count])
    {
      [v14 setChecked:1];
      goto LABEL_6;
    }
  }
  v13 = [(AXPronunciationLanguageListController *)self selectedLanguages];
  objc_msgSend(v14, "setChecked:", objc_msgSend(v13, "containsObject:", v11));

  if (v12) {
LABEL_6:
  }
}

- (AXPronunciationLanguageListControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXPronunciationLanguageListControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)selectedLanguages
{
  return self->_selectedLanguages;
}

- (void)setSelectedLanguages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedLanguages, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end