@interface VoiceOverBrailleLanguageController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BRLTTableEnumerator)tableEnumerator;
- (id)_brailleLanguageSpecifiers;
- (id)_defaultTable;
- (id)_newAddLanguageSpecifier;
- (id)_selectedBrailleTable:(id)a3;
- (id)selectedBrailleTable;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_addLanguage:(id)a3;
- (void)_donePressed;
- (void)_editPressed:(id)a3;
- (void)_manageEditButton;
- (void)setTableEnumerator:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VoiceOverBrailleLanguageController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverBrailleLanguageController;
  [(VoiceOverBrailleLanguageController *)&v4 viewWillAppear:a3];
  [(VoiceOverBrailleLanguageController *)self reloadSpecifiers];
  [(VoiceOverBrailleLanguageController *)self _manageEditButton];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)VoiceOverBrailleLanguageController;
  [(VoiceOverBrailleLanguageController *)&v10 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = kAXSVoiceOverTouchBrailleLanguageRotorChangedNotification;
  v5 = +[NSOperationQueue mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __49__VoiceOverBrailleLanguageController_viewDidLoad__block_invoke;
  v7[3] = &unk_20B390;
  objc_copyWeak(&v8, &location);
  id v6 = [v3 addObserverForName:v4 object:0 queue:v5 usingBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__VoiceOverBrailleLanguageController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (id)_selectedBrailleTable:(id)a3
{
  v3 = [(VoiceOverBrailleLanguageController *)self selectedBrailleTable];
  uint64_t v4 = [v3 localizedNameWithService];

  return v4;
}

- (id)selectedBrailleTable
{
  v3 = +[AXSettings sharedInstance];
  uint64_t v4 = [v3 voiceOverBrailleTableIdentifier];

  if (v4)
  {
    id v5 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v4];
  }
  else
  {
    id v5 = [(VoiceOverBrailleLanguageController *)self _defaultTable];
  }
  id v6 = v5;

  return v6;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    if ((VOSCustomBrailleEnabled() & 1) == 0)
    {
      id v6 = +[AXSettings sharedInstance];
      v7 = [v6 voiceOverBrailleLanguageRotorItems];

      if (v7)
      {
        id v8 = +[PSSpecifier emptyGroupSpecifier];
        [v5 addObject:v8];
        v9 = settingsLocString(@"SELECTED_BRAILLE_TABLE", @"VoiceOverSettings");
        objc_super v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:"_selectedBrailleTable:" detail:objc_opt_class() cell:2 edit:0];

        [v10 setProperty:@"SelectedBrailleController" forKey:PSIDKey];
        [v5 addObject:v10];
      }
    }
    v11 = +[PSSpecifier groupSpecifierWithID:@"LanguagesGroup"];
    v12 = [(VoiceOverBrailleLanguageController *)self selectedBrailleTable];
    v13 = settingsLocString(@"BRAILLE_LANGUAGES_FOOTER", @"VoiceOverSettings");
    v14 = [v12 serviceIdentifier];
    if ([v14 isEqualToString:@"com.apple.scrod.braille.table.duxbury"])
    {
      v15 = [v12 language];
      unsigned int v16 = [v15 isEqualToString:@"jpn"];

      if (!v16)
      {
LABEL_9:
        [v11 setProperty:v13 forKey:PSFooterTextGroupKey];
        [v5 addObject:v11];
        v19 = [(VoiceOverBrailleLanguageController *)self _brailleLanguageSpecifiers];
        [v5 addObjectsFromArray:v19];
        id v20 = [(VoiceOverBrailleLanguageController *)self _newAddLanguageSpecifier];
        [v5 addObject:v20];

        [(VoiceOverBrailleLanguageController *)self setupLongTitleSpecifiers:v5];
        v21 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
        *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

        uint64_t v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
        goto LABEL_10;
      }
      v14 = settingsLocString(@"JAPANESE_BRAILLE_LANGUAGES_FOOTER", @"VoiceOverSettings");
      v17 = settingsLocString(v14, @"VoiceOverSettings");
      uint64_t v18 = +[NSString stringWithFormat:@"%@\n%@", v13, v17];

      v13 = (void *)v18;
    }

    goto LABEL_9;
  }
LABEL_10:

  return v4;
}

- (id)_defaultTable
{
  uint64_t v3 = +[AXSettings sharedInstance];
  uint64_t v4 = [v3 voiceOverBrailleLanguageRotorItems];

  id v5 = [v4 indexOfObjectPassingTest:&__block_literal_global_46];
  id v6 = +[AXLanguageManager sharedInstance];
  v7 = [v6 userLocale];

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(VoiceOverBrailleLanguageController *)self tableEnumerator];
    id v9 = [(id)objc_opt_class() defaultTableForLocale:v7];
  }
  else
  {
    objc_super v10 = [v4 objectAtIndexedSubscript:v5];
    v11 = [v10 objectForKeyedSubscript:@"LanguageDefaults"];
    v12 = [v7 localeIdentifier];
    id v8 = [v11 objectForKeyedSubscript:v12];

    id v9 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v8];
  }
  v13 = v9;

  return v13;
}

BOOL __51__VoiceOverBrailleLanguageController__defaultTable__block_invoke(id a1, NSDictionary *a2, unint64_t a3, BOOL *a4)
{
  id v5 = [(NSDictionary *)a2 objectForKeyedSubscript:@"Default"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6) {
    *a4 = 1;
  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cellForRowAtIndexPath:v7];
  id v9 = [v8 specifier];
  objc_super v10 = [v9 propertyForKey:PSIDKey];
  unsigned int v11 = [v10 isEqualToString:@"SelectedBrailleController"];

  if (v11)
  {
    v12 = objc_alloc_init(AXVoiceOverSelectedBrailleTableController);
    v13 = [(VoiceOverBrailleLanguageController *)self rootController];
    [(AXVoiceOverSelectedBrailleTableController *)v12 setRootController:v13];

    [(AXVoiceOverSelectedBrailleTableController *)v12 setSpecifier:v9];
    [(AXVoiceOverSelectedBrailleTableController *)v12 setParentBrailleController:self];
    [(AXVoiceOverSelectedBrailleTableController *)v12 setParentController:self];
    [(VoiceOverBrailleLanguageController *)self showController:v12 animate:1];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VoiceOverBrailleLanguageController;
    [(VoiceOverBrailleLanguageController *)&v14 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

- (id)_brailleLanguageSpecifiers
{
  uint64_t v3 = +[AXSettings sharedInstance];
  uint64_t v4 = [v3 voiceOverBrailleLanguageRotorItems];

  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  id v6 = [v4 count];
  id v7 = +[AXLanguageManager sharedInstance];
  id v8 = [v7 userLocale];

  if (v6)
  {
    v39 = self;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v37 = v4;
    id obj = v4;
    id v41 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (!v41) {
      goto LABEL_22;
    }
    uint64_t v40 = *(void *)v43;
    while (1)
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v43 != v40) {
          objc_enumerationMutation(obj);
        }
        objc_super v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        unsigned int v11 = [v10 objectForKeyedSubscript:@"Default"];
        unsigned int v12 = [v11 BOOLValue];

        if (v12)
        {
          v13 = [v10 objectForKeyedSubscript:@"LanguageDefaults"];
          objc_super v14 = [v8 localeIdentifier];
          v15 = [v13 objectForKeyedSubscript:v14];

          if (v15)
          {
            id v16 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v15];
          }
          else
          {
            id v20 = [(VoiceOverBrailleLanguageController *)v39 tableEnumerator];
            id v16 = [(id)objc_opt_class() defaultTableForLocale:v8];
          }
          uint64_t v18 = objc_opt_class();

          uint64_t v19 = 2;
        }
        else
        {
          id v17 = objc_alloc((Class)BRLTTable);
          v13 = [v10 objectForKeyedSubscript:@"RotorItem"];
          id v16 = [v17 initWithIdentifier:v13];
          uint64_t v18 = 0;
          uint64_t v19 = 3;
        }

        if (VOSCustomBrailleEnabled())
        {
          v21 = [v16 replacements];
          id v22 = [v21 count];

          if (v22) {
            goto LABEL_20;
          }
        }
        else if ([v16 isCustomBrailleTable])
        {
          goto LABEL_20;
        }
        v23 = v8;
        v24 = v5;
        v25 = [v16 localizedNameWithService];
        v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:v39 set:0 get:0 detail:v18 cell:v19 edit:0];

        [v26 setProperty:&__kCFBooleanTrue forKey:@"IsLanguage"];
        [v26 setProperty:v16 forKey:@"Table"];
        if (v12)
        {
          [v26 setIdentifier:@"DefaultLanguage"];
          v27 = +[AXLanguageManager sharedInstance];
          v28 = [v27 userLocale];

          [v26 setProperty:v28 forKey:@"Locale"];
          v29 = [(VoiceOverBrailleLanguageController *)v39 tableEnumerator];
          [v26 setProperty:v29 forKey:@"TableEnumerator"];
        }
        id v5 = v24;
        [v24 addObject:v26];

        id v8 = v23;
LABEL_20:
      }
      id v41 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (!v41)
      {
LABEL_22:

        uint64_t v4 = v37;
        goto LABEL_24;
      }
    }
  }
  v30 = [(VoiceOverBrailleLanguageController *)self tableEnumerator];
  v31 = [(id)objc_opt_class() defaultTableForLocale:v8];

  [v31 localizedNameWithService];
  v33 = v32 = v8;
  v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  [v34 setIdentifier:@"DefaultLanguage"];
  [v34 setProperty:&__kCFBooleanTrue forKey:@"IsLanguage"];
  [v34 setProperty:v32 forKey:@"Locale"];
  v35 = [(VoiceOverBrailleLanguageController *)self tableEnumerator];
  [v34 setProperty:v35 forKey:@"TableEnumerator"];

  [v34 setProperty:v31 forKey:@"Table"];
  [v5 addObject:v34];

LABEL_24:

  return v5;
}

- (id)_newAddLanguageSpecifier
{
  uint64_t v3 = settingsLocString(@"ADD_NEW_BRAILLE_LANGUAGE_BUTTON", @"VoiceOverSettings");
  uint64_t v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v4 setButtonAction:"_addLanguage:"];
  id v5 = [(VoiceOverBrailleLanguageController *)self tableEnumerator];
  [v4 setProperty:v5 forKey:@"TableEnumerator"];

  [v4 setProperty:&__kCFBooleanTrue forKey:@"IsAddingNewLanguage"];
  [v4 setProperty:&__kCFBooleanTrue forKey:@"IsNewLanguage"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __62__VoiceOverBrailleLanguageController__newAddLanguageSpecifier__block_invoke;
  v8[3] = &unk_2087C0;
  v8[4] = self;
  id v6 = objc_retainBlock(v8);
  [v4 setProperty:v6 forKey:@"DismissBlock"];

  [v4 setProperty:@"ADD_NEW_BRAILLE_LANGUAGE" forKey:PSIDKey];
  return v4;
}

id __62__VoiceOverBrailleLanguageController__newAddLanguageSpecifier__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  v2 = *(void **)(a1 + 32);

  return [v2 _manageEditButton];
}

- (void)_addLanguage:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init(VoiceOverBrailleAllLanguagesController);
  [(VoiceOverBrailleAllLanguagesController *)v6 setModalPresentationStyle:2];
  [(VoiceOverBrailleAllLanguagesController *)v6 setSpecifier:v4];

  id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
  [(VoiceOverBrailleLanguageController *)self presentViewController:v5 withTransition:8 completion:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VoiceOverBrailleLanguageController;
  id v4 = [(VoiceOverBrailleLanguageController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  id v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v14 = a4;
  id v6 = [v14 specifier];
  objc_super v7 = [v6 propertyForKey:@"IsLanguage"];
  unsigned int v8 = [v7 BOOLValue];

  if ([*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] isEditing])
  {
    if (v8)
    {
      [v14 setUserInteractionEnabled:1];
      [v14 setCellEnabled:1];
      id v9 = v14;
      uint64_t v10 = 1;
LABEL_6:
      [v9 setShowsReorderControl:v10];
      goto LABEL_10;
    }
    [v14 setUserInteractionEnabled:0];
    [v14 setCellEnabled:0];
    unsigned int v11 = [v14 titleLabel];
    unsigned int v12 = v11;
    uint64_t v13 = 0;
  }
  else
  {
    [v14 setUserInteractionEnabled:1];
    [v14 setCellEnabled:1];
    if (v8)
    {
      id v9 = v14;
      uint64_t v10 = 0;
      goto LABEL_6;
    }
    unsigned int v11 = [v14 titleLabel];
    unsigned int v12 = v11;
    uint64_t v13 = 1;
  }
  [v11 setEnabled:v13];

LABEL_10:
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v4 = [(VoiceOverBrailleLanguageController *)self specifierAtIndex:[(VoiceOverBrailleLanguageController *)self indexForIndexPath:a4]];
  id v5 = [v4 propertyForKey:@"IsLanguage"];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(VoiceOverBrailleLanguageController *)self specifierAtIndex:[(VoiceOverBrailleLanguageController *)self indexForIndexPath:a4]];
  id v5 = [v4 propertyForKey:@"IsLanguage"];
  if ([v5 BOOLValue])
  {
    unsigned __int8 v6 = [v4 identifier];
    int64_t v7 = [v6 isEqualToString:@"DefaultLanguage"] ^ 1;
  }
  else
  {

    int64_t v7 = 0;
  }

  return v7;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v4 = [(VoiceOverBrailleLanguageController *)self specifierAtIndex:[(VoiceOverBrailleLanguageController *)self indexForIndexPath:a4]];
  id v5 = [v4 propertyForKey:@"IsLanguage"];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [a3 cellForRowAtIndexPath:v8];
  uint64_t v10 = [v9 specifier];

  unsigned int v11 = [v10 propertyForKey:@"IsLanguage"];
  unsigned int v12 = [v11 BOOLValue];

  if (v12) {
    uint64_t v13 = v8;
  }
  else {
    uint64_t v13 = v7;
  }
  id v14 = v13;

  return v14;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v4 = [(VoiceOverBrailleLanguageController *)self specifierForIndexPath:a4];
  id v5 = [v4 propertyForKey:@"IsLanguage"];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqual:v10]) {
    goto LABEL_26;
  }
  long long v45 = self;
  unsigned int v11 = [v8 cellForRowAtIndexPath:v9];
  unsigned int v12 = [v11 specifier];

  v52 = [v12 propertyForKey:@"Table"];
  v48 = v12;
  uint64_t v13 = [v12 identifier];
  unsigned int v14 = [v13 isEqualToString:@"DefaultLanguage"];

  v15 = [v8 cellForRowAtIndexPath:v10];
  id v16 = [v15 specifier];

  v49 = [v16 propertyForKey:@"Table"];
  v47 = v16;
  id v17 = [v16 identifier];
  unsigned int v18 = [v17 isEqualToString:@"DefaultLanguage"];

  uint64_t v19 = +[AXSettings sharedInstance];
  id v20 = [v19 voiceOverBrailleLanguageRotorItems];
  id v21 = [v20 mutableCopy];

  if (![v21 count]) {
    goto LABEL_25;
  }
  id v46 = v10;
  id v43 = v9;
  id v44 = v8;
  unint64_t v22 = 0;
  uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v51 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v23 = objc_msgSend(v21, "objectAtIndexedSubscript:", v22, v43, v44);
    v24 = v23;
    if (v14)
    {
      id v20 = [v23 objectForKeyedSubscript:@"Default"];
      if ([v20 BOOLValue])
      {

LABEL_13:
        uint64_t v50 = v22;
        goto LABEL_19;
      }
    }
    v25 = [v24 objectForKeyedSubscript:@"RotorItem"];
    v26 = [v52 identifier];
    unsigned __int8 v27 = [v25 isEqualToString:v26];

    if (v14)
    {

      if (v27) {
        goto LABEL_13;
      }
    }
    else if (v27)
    {
      goto LABEL_13;
    }
    if (v18)
    {
      id v9 = [v24 objectForKeyedSubscript:@"Default"];
      if ([v9 BOOLValue])
      {
        unsigned int v28 = 1;
LABEL_15:

        goto LABEL_16;
      }
    }
    v29 = [v24 objectForKeyedSubscript:@"RotorItem"];
    v30 = [v49 identifier];
    unsigned int v28 = [v29 isEqualToString:v30];

    if (v18) {
      goto LABEL_15;
    }
LABEL_16:
    uint64_t v31 = v51;
    if (v28) {
      uint64_t v31 = v22;
    }
    uint64_t v51 = v31;
LABEL_19:

    ++v22;
  }
  while (v22 < (unint64_t)[v21 count]);
  id v9 = v43;
  id v8 = v44;
  id v10 = v46;
  if (v50 != 0x7FFFFFFFFFFFFFFFLL && v51 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = [v21 objectAtIndexedSubscript:v50];
    [v21 removeObjectAtIndex:v50];
    [v21 insertObject:v32 atIndex:v51];
    v33 = +[AXSettings sharedInstance];
    [v33 setVoiceOverBrailleLanguageRotorItems:v21];

    v34 = BRLLogTranslation();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = +[AXSettings sharedInstance];
      v36 = [v35 voiceOverBrailleLanguageRotorItems];
      v37 = [v36 debugDescription];
      *(_DWORD *)buf = 138412290;
      v54 = v37;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "Reordered braille languages settings %@", buf, 0xCu);
    }
    uint64_t v38 = OBJC_IVAR___PSListController__specifiers;
    id v39 = [*(id *)&v45->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers] mutableCopy];
    uint64_t v40 = (char *)[(VoiceOverBrailleLanguageController *)v45 indexOfSpecifier:v48];
    id v41 = [v39 objectAtIndexedSubscript:v40];
    [v39 removeObjectAtIndex:v40];
    [v39 insertObject:v41 atIndex:&v40[v51 - v50]];
    long long v42 = *(void **)&v45->AXUISettingsBaseListController_opaque[v38];
    *(void *)&v45->AXUISettingsBaseListController_opaque[v38] = v39;

    id v10 = v46;
  }
LABEL_25:

LABEL_26:
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = [(VoiceOverBrailleLanguageController *)self specifierAtIndex:[(VoiceOverBrailleLanguageController *)self indexForIndexPath:a5]];
  id v8 = [v7 propertyForKey:@"IsLanguage"];
  unsigned int v9 = [v8 BOOLValue];

  if (a4 == 1 && v9)
  {
    id v10 = +[AXSettings sharedInstance];
    unsigned int v11 = [v10 voiceOverBrailleLanguageRotorItems];
    id v12 = [v11 mutableCopy];

    uint64_t v13 = [v7 propertyForKey:@"Table"];
    if ([v12 count])
    {
      uint64_t v14 = 0;
      while (1)
      {
        v15 = [v12 objectAtIndexedSubscript:v14];
        id v16 = [v15 objectForKeyedSubscript:@"RotorItem"];
        id v17 = [v13 identifier];
        unsigned int v18 = [v16 isEqualToString:v17];

        if (v18) {
          break;
        }

        if ((unint64_t)[v12 count] <= ++v14) {
          goto LABEL_9;
        }
      }
      [v12 removeObjectAtIndex:v14];
    }
LABEL_9:
    uint64_t v19 = BRLLogTranslation();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v12;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Setting new items after removing: %@", buf, 0xCu);
    }

    id v20 = +[AXSettings sharedInstance];
    [v20 setVoiceOverBrailleLanguageRotorItems:v12];

    if (VOSCustomBrailleEnabled())
    {
      id v21 = [v13 identifier];
      unint64_t v22 = +[AXSettings sharedInstance];
      v23 = [v22 voiceOverTouchBrailleDisplayOutputTableIdentifier];
      unsigned int v24 = [v21 isEqualToString:v23];

      if (v24)
      {
        v25 = [(VoiceOverBrailleLanguageController *)self _defaultTable];
        v26 = [v25 identifier];
        unsigned __int8 v27 = +[AXSettings sharedInstance];
        [v27 setVoiceOverTouchBrailleDisplayOutputTableIdentifier:v26];
      }
      unsigned int v28 = [v13 identifier];
      v29 = +[AXSettings sharedInstance];
      v30 = [v29 voiceOverTouchBrailleDisplayInputTableIdentifier];
      unsigned int v31 = [v28 isEqualToString:v30];

      if (v31)
      {
        v32 = [(VoiceOverBrailleLanguageController *)self _defaultTable];
        v33 = [v32 identifier];
        v34 = +[AXSettings sharedInstance];
        [v34 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v33];
      }
      v35 = [v13 identifier];
      v36 = +[AXSettings sharedInstance];
      v37 = [v36 voiceOverTouchBrailleGesturesInputTableIdentifier];
      unsigned int v38 = [v35 isEqualToString:v37];

      if (v38)
      {
        id v39 = VOSFirstGesturesCompatibleBrailleTable();
        uint64_t v40 = [v39 identifier];
        id v41 = +[AXSettings sharedInstance];
        [v41 setVoiceOverTouchBrailleGesturesInputTableIdentifier:v40];
      }
    }
    long long v42 = +[AXSettings sharedInstance];
    id v43 = [v42 voiceOverBrailleTableIdentifier];

    id v44 = [v13 identifier];
    unsigned int v45 = [v44 isEqualToString:v43];

    if (v45)
    {
      id v46 = BRLLogTranslation();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "Resetting current bralle table to default", buf, 2u);
      }

      v47 = +[AXSettings sharedInstance];
      [v47 setVoiceOverBrailleTableIdentifier:0];
    }
    [(VoiceOverBrailleLanguageController *)self removeSpecifier:v7 animated:1];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __85__VoiceOverBrailleLanguageController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
  block[3] = &unk_2087C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __85__VoiceOverBrailleLanguageController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  v2 = +[AXSettings sharedInstance];
  uint64_t v3 = [v2 voiceOverBrailleLanguageRotorItems];
  id v4 = [v3 count];

  if ((unint64_t)v4 <= 1)
  {
    [*(id *)(a1 + 32) setEditing:0 animated:1];
    [*(id *)(*(void *)(a1 + 32) + OBJC_IVAR___PSListController__table) reloadData];
    id v5 = *(void **)(a1 + 32);
    [v5 _manageEditButton];
  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v4 = [(VoiceOverBrailleLanguageController *)self specifierAtIndex:[(VoiceOverBrailleLanguageController *)self indexForIndexPath:a4]];
  id v5 = [v4 identifier];
  unsigned int v6 = [v5 isEqualToString:@"DefaultLanguage"];

  if (v6) {
    id v7 = objc_alloc_init((Class)UISwipeActionsConfiguration);
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (BRLTTableEnumerator)tableEnumerator
{
  tableEnumerator = self->_tableEnumerator;
  if (!tableEnumerator)
  {
    id v4 = +[BRLTTableEnumerator tableEnumeratorWithSystemBundlePath];
    id v5 = self->_tableEnumerator;
    self->_tableEnumerator = v4;

    tableEnumerator = self->_tableEnumerator;
  }

  return tableEnumerator;
}

- (void)_manageEditButton
{
  uint64_t v3 = [(VoiceOverBrailleLanguageController *)self _brailleLanguageSpecifiers];
  id v4 = [v3 count];

  if ((unint64_t)v4 < 2)
  {
    id v5 = [(VoiceOverBrailleLanguageController *)self navigationItem];
    [v5 setRightBarButtonItem:0];

    [(VoiceOverBrailleLanguageController *)self setEditing:0 animated:1];
  }
  else if (([*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] isEditing] & 1) == 0)
  {
    id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"_editPressed:"];
    unsigned int v6 = [(VoiceOverBrailleLanguageController *)self navigationItem];
    [v6 setRightBarButtonItem:v7];
  }
}

- (void)_editPressed:(id)a3
{
  [(VoiceOverBrailleLanguageController *)self setEditing:1 animated:1];
  id v4 = [(VoiceOverBrailleLanguageController *)self table];
  [v4 reloadData];

  id v6 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_donePressed"];
  id v5 = [(VoiceOverBrailleLanguageController *)self navigationItem];
  [v5 setRightBarButtonItem:v6];
}

- (void)_donePressed
{
  [(VoiceOverBrailleLanguageController *)self setEditing:0 animated:1];
  uint64_t v3 = [(VoiceOverBrailleLanguageController *)self table];
  [v3 reloadData];

  [(VoiceOverBrailleLanguageController *)self _manageEditButton];
}

- (void)setTableEnumerator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end