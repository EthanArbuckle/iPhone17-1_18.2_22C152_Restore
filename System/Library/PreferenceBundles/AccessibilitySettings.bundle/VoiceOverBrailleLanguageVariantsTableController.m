@interface VoiceOverBrailleLanguageVariantsTableController
- (BOOL)_isSystemBundle:(id)a3;
- (BRLTTableEnumerator)tableEnumerator;
- (id)_translatorBundlesWithSystemAtFirst;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_indexOfDefaultRotorItem;
- (void)_ensureDefaultRotorItemExists;
- (void)_popToTopOfBrailleSettings;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateTableCheckedSelection:(id)a3;
@end

@implementation VoiceOverBrailleLanguageVariantsTableController

- (BRLTTableEnumerator)tableEnumerator
{
  v2 = [(VoiceOverBrailleLanguageVariantsTableController *)self specifier];
  v3 = [v2 propertyForKey:@"TableEnumerator"];

  return (BRLTTableEnumerator *)v3;
}

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v37 = OBJC_IVAR___PSListController__specifiers;
    v4 = +[NSMutableArray array];
    v5 = [(VoiceOverBrailleLanguageVariantsTableController *)self specifier];
    v6 = [v5 propertyForKey:@"IsLanguageAgnostic"];
    unsigned __int8 v42 = [v6 BOOLValue];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = [(VoiceOverBrailleLanguageVariantsTableController *)self _translatorBundlesWithSystemAtFirst];
    id v43 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
    if (v43)
    {
      uint64_t v41 = *(void *)v54;
      uint64_t v38 = PSFooterTextGroupKey;
      v40 = v4;
      do
      {
        for (i = 0; i != v43; i = (char *)i + 1)
        {
          if (*(void *)v54 != v41) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          v9 = [(VoiceOverBrailleLanguageVariantsTableController *)self specifier];
          v10 = v9;
          if (v42)
          {
            v11 = [v9 propertyForKey:@"TableIdentifier"];

            v12 = [(VoiceOverBrailleLanguageVariantsTableController *)self tableEnumerator];
            v13 = [v12 languageAgnosticTablesForIdentifier:v11 inBundle:v8];

            v14 = +[NSString stringWithFormat:@"%@.footer", v11];
            v15 = settingsLocString(v14, @"VoiceOverSettings");
            v16 = v15;
            if (v15 && ([v15 isEqual:v14] & 1) == 0) {
              id v48 = v16;
            }
            else {
              id v48 = 0;
            }
          }
          else
          {
            v11 = [v9 propertyForKey:@"Locale"];

            v17 = [(VoiceOverBrailleLanguageVariantsTableController *)self tableEnumerator];
            v13 = [v17 tablesForLocale:v11 inBundle:v8];

            v14 = BRLLogTranslation();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v18 = [v11 languageCode];
              [v13 debugDescription];
              v20 = v19 = v13;
              *(_DWORD *)buf = 138412802;
              v59 = v11;
              __int16 v60 = 2112;
              v61 = v18;
              __int16 v62 = 2112;
              v63 = v20;
              _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Finding tables for locale %@ %@ %@", buf, 0x20u);

              v13 = v19;
            }
            id v48 = 0;
          }

          if ([v13 count])
          {
            v47 = i;
            v21 = +[NSMutableArray array];
            v22 = [v8 bundleIdentifier];
            uint64_t v23 = +[BRLTTableEnumerator localizedNameForServiceWithIdentifier:v22];

            v45 = (void *)v23;
            v24 = +[PSSpecifier groupSpecifierWithName:v23];
            if ([v48 length]) {
              [v24 setProperty:v48 forKey:v38];
            }
            v44 = v24;
            [v4 addObject:v24];
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            v46 = v13;
            id v25 = v13;
            id v26 = [v25 countByEnumeratingWithState:&v49 objects:v57 count:16];
            if (v26)
            {
              id v27 = v26;
              uint64_t v28 = *(void *)v50;
              do
              {
                for (j = 0; j != v27; j = (char *)j + 1)
                {
                  if (*(void *)v50 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  v30 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
                  if (VOSCustomBrailleEnabled())
                  {
                    v31 = [v30 replacements];
                    id v32 = [v31 count];

                    if (v32) {
                      continue;
                    }
                  }
                  else if ([v30 isCustomBrailleTable])
                  {
                    continue;
                  }
                  v33 = [v30 localizedName];
                  v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:self set:0 get:0 detail:0 cell:3 edit:0];
                  [v34 setProperty:v30 forKey:@"Table"];
                  [v21 addObject:v34];
                }
                id v27 = [v25 countByEnumeratingWithState:&v49 objects:v57 count:16];
              }
              while (v27);
            }

            [v21 sortUsingComparator:&__block_literal_global_8];
            v4 = v40;
            [v40 addObjectsFromArray:v21];
            [(VoiceOverBrailleLanguageVariantsTableController *)self setAllSpecifiersUnsearchable:v40];

            v13 = v46;
            i = v47;
          }
        }
        id v43 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
      }
      while (v43);
    }

    v35 = *(void **)&self->AXUISettingsListController_opaque[v37];
    *(void *)&self->AXUISettingsListController_opaque[v37] = v4;

    v3 = *(void **)&self->AXUISettingsListController_opaque[v37];
  }

  return v3;
}

int64_t __61__VoiceOverBrailleLanguageVariantsTableController_specifiers__block_invoke(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  v4 = a3;
  v5 = [(PSSpecifier *)a2 name];
  v6 = [(PSSpecifier *)v4 name];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (id)_translatorBundlesWithSystemAtFirst
{
  v3 = [(VoiceOverBrailleLanguageVariantsTableController *)self tableEnumerator];
  v4 = [v3 translatorBundles];

  v5 = objc_opt_new();
  v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (-[VoiceOverBrailleLanguageVariantsTableController _isSystemBundle:](self, "_isSystemBundle:", v12, (void)v15))
        {
          v13 = v5;
        }
        else
        {
          v13 = v6;
        }
        [v13 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [v5 addObjectsFromArray:v6];

  return v5;
}

- (BOOL)_isSystemBundle:(id)a3
{
  id v3 = a3;
  v4 = [v3 bundleIdentifier];
  unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.scrod.braille.table.duxbury"];

  v6 = [v3 bundleIdentifier];

  LOBYTE(v3) = [v6 isEqualToString:@"com.apple.scrod.braille.table.apple"];
  return v5 | v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VoiceOverBrailleLanguageVariantsTableController;
  v4 = [(VoiceOverBrailleLanguageVariantsTableController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  unsigned __int8 v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v43 = a4;
  uint64_t v41 = [v43 specifier];
  v6 = [v41 propertyForKey:@"Table"];
  v44 = self;
  objc_super v7 = [(VoiceOverBrailleLanguageVariantsTableController *)self specifier];
  id v8 = [v7 identifier];
  unsigned int v9 = [v8 isEqualToString:@"DefaultLanguage"];

  uint64_t v10 = +[AXLanguageManager sharedInstance];
  v46 = [v10 userLocale];

  v11 = +[AXSettings sharedInstance];
  uint64_t v12 = [v11 voiceOverBrailleLanguageRotorItems];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v13)
  {
    id v14 = v13;
    char v42 = 0;
    uint64_t v15 = *(void *)v48;
    while (1)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v48 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (v9
          && ([*(id *)(*((void *)&v47 + 1) + 8 * i) objectForKeyedSubscript:@"Default"], long long v18 = objc_claimAutoreleasedReturnValue(), v19 = objc_msgSend(v18, "BOOLValue"), v18, v19))
        {
          v20 = [v17 objectForKeyedSubscript:@"LanguageDefaults"];
          v21 = [v46 localeIdentifier];
          v22 = [v20 objectForKeyedSubscript:v21];

          uint64_t v23 = [v6 identifier];
          LODWORD(v21) = [v23 isEqualToString:v22];

          if (v21) {
            [v43 setChecked:1];
          }

          char v42 = 1;
        }
        else
        {
          v24 = [v17 objectForKeyedSubscript:@"Default"];
          unsigned int v25 = [v24 BOOLValue];

          if (v25)
          {
            id v26 = [v17 objectForKeyedSubscript:@"LanguageDefaults"];
            uint64_t v27 = [v46 localeIdentifier];
            uint64_t v28 = [v26 objectForKeyedSubscript:v27];

            v29 = [v6 identifier];
            LOBYTE(v27) = [v29 isEqualToString:v28];

            if ((v27 & 1) == 0) {
              continue;
            }
          }
          else
          {
            v30 = [v6 identifier];
            v31 = [v17 objectForKeyedSubscript:@"RotorItem"];
            unsigned int v32 = [v30 isEqualToString:v31];

            if (!v32) {
              continue;
            }
          }
          v33 = [(VoiceOverBrailleLanguageVariantsTableController *)v44 specifier];
          v34 = [v33 propertyForKey:@"AllowDuplicatesKey"];
          unsigned __int8 v35 = [v34 BOOLValue];

          if ((v35 & 1) == 0)
          {
            [v43 setUserInteractionEnabled:0];
            [v43 setCellEnabled:0];
          }
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (!v14) {
        goto LABEL_21;
      }
    }
  }
  char v42 = 0;
LABEL_21:

  if (v9 && (v42 & 1) == 0)
  {
    v36 = +[AXLanguageManager sharedInstance];
    uint64_t v37 = [v36 userLocale];
    uint64_t v38 = +[BRLTTableEnumerator defaultTableForLocale:v37];

    v39 = [v6 identifier];
    v40 = [v38 identifier];
    objc_msgSend(v43, "setChecked:", objc_msgSend(v39, "isEqualToString:", v40));
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v70.receiver = self;
  v70.super_class = (Class)VoiceOverBrailleLanguageVariantsTableController;
  id v6 = a4;
  id v7 = a3;
  [(VoiceOverBrailleLanguageVariantsTableController *)&v70 tableView:v7 didSelectRowAtIndexPath:v6];
  id v8 = [v7 cellForRowAtIndexPath:v6];

  unsigned int v9 = [v8 specifier];

  uint64_t v10 = [(VoiceOverBrailleLanguageVariantsTableController *)self specifier];
  v11 = [v10 propertyForKey:@"TableSelectionBlockKey"];

  uint64_t v12 = [v9 propertyForKey:@"Table"];
  [(VoiceOverBrailleLanguageVariantsTableController *)self updateTableCheckedSelection:v6];

  if (v11)
  {
    id v13 = [v12 identifier];
    ((void (**)(void, void *))v11)[2](v11, v13);

    [(VoiceOverBrailleLanguageVariantsTableController *)self _popToTopOfBrailleSettings];
    goto LABEL_41;
  }
  [(VoiceOverBrailleLanguageVariantsTableController *)self _ensureDefaultRotorItemExists];
  id v14 = (void **)&swift_allocBox_ptr;
  uint64_t v15 = +[AXSettings sharedInstance];
  long long v16 = [v15 voiceOverBrailleLanguageRotorItems];
  id v17 = [v16 mutableCopy];

  if (!v17)
  {
    id v17 = +[NSMutableArray array];
  }
  long long v18 = [(VoiceOverBrailleLanguageVariantsTableController *)self specifier];
  unsigned int v19 = [v18 identifier];
  unsigned int v20 = [v19 isEqualToString:@"DefaultLanguage"];

  if (v20)
  {
    int64_t v21 = [(VoiceOverBrailleLanguageVariantsTableController *)self _indexOfDefaultRotorItem];
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      char v69 = 0;
LABEL_25:
      long long v48 = [v14[459] sharedInstance];
      id v23 = [v48 voiceOverBrailleTableIdentifier];

      if (v23)
      {
        char v68 = v20;
        id v66 = v17;
        long long v49 = v14;
        id v50 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v23];
        long long v51 = [v12 language];
        long long v52 = [v50 language];
        unsigned int v53 = [v51 isEqualToString:v52];

        if (v53)
        {
          long long v54 = [v12 identifier];
          long long v55 = [v49[459] sharedInstance];
          [v55 setVoiceOverBrailleTableIdentifier:v54];
        }
        id v14 = v49;
        id v17 = v66;
        LOBYTE(v20) = v68;
      }
      long long v56 = [v14[459] sharedInstance];
      [v56 setVoiceOverBrailleLanguageRotorItems:v17];

      v57 = BRLLogTranslation();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
        -[VoiceOverBrailleLanguageVariantsTableController tableView:didSelectRowAtIndexPath:](v57);
      }

      goto LABEL_32;
    }
    int64_t v24 = v21;
    char v67 = v20;
    unsigned int v25 = [v17 objectAtIndexedSubscript:v21];
    id v23 = [v25 mutableCopy];

    id v26 = objc_msgSend(v23, "objectForKeyedSubscript:");
    id v27 = [v26 mutableCopy];

    uint64_t v28 = +[AXLanguageManager sharedInstance];
    v29 = [v28 userLocale];

    v30 = [v29 localeIdentifier];
    v65 = [v27 objectForKeyedSubscript:v30];

    v31 = [v12 identifier];
    v63 = v29;
    unsigned int v32 = [v29 localeIdentifier];
    [v27 setObject:v31 forKeyedSubscript:v32];

    v64 = v27;
    [v23 setObject:v27 forKeyedSubscript:@"LanguageDefaults"];
    [v17 setObject:v23 atIndexedSubscript:v24];
    if (VOSCustomBrailleEnabled())
    {
      id v14 = (void **)&swift_allocBox_ptr;
      v33 = +[AXSettings sharedInstance];
      v34 = [v33 voiceOverTouchBrailleDisplayOutputTableIdentifier];
      unsigned int v35 = [v65 isEqualToString:v34];

      if (v35)
      {
        v36 = [v12 identifier];
        uint64_t v37 = +[AXSettings sharedInstance];
        [v37 setVoiceOverTouchBrailleDisplayOutputTableIdentifier:v36];
      }
      uint64_t v38 = +[AXSettings sharedInstance];
      v39 = [v38 voiceOverTouchBrailleDisplayInputTableIdentifier];
      unsigned int v40 = [v65 isEqualToString:v39];

      if (v40)
      {
        uint64_t v41 = [v12 identifier];
        char v42 = +[AXSettings sharedInstance];
        [v42 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v41];
      }
      id v43 = +[AXSettings sharedInstance];
      v44 = [v43 voiceOverTouchBrailleGesturesInputTableIdentifier];
      unsigned int v45 = [v65 isEqualToString:v44];

      if (v45)
      {
        if ((AXDeviceSupportsManyTouches() & 1) == 0
          && ([v12 supportsTranslationMode8Dot] & 1) != 0)
        {
          char v69 = 1;
LABEL_23:
          LOBYTE(v20) = v67;

          goto LABEL_24;
        }
        v46 = [v12 identifier];
        long long v47 = +[AXSettings sharedInstance];
        [v47 setVoiceOverTouchBrailleGesturesInputTableIdentifier:v46];
      }
      char v69 = 0;
      goto LABEL_23;
    }
    char v69 = 0;
    id v14 = (void **)&swift_allocBox_ptr;
    goto LABEL_23;
  }
  v71[0] = @"RotorItem";
  v22 = [v12 identifier];
  v71[1] = @"Enabled";
  v72[0] = v22;
  v72[1] = &__kCFBooleanTrue;
  id v23 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];

  if (([v17 containsObject:v23] & 1) == 0)
  {
    [v17 addObject:v23];
    char v69 = 0;
LABEL_24:

    goto LABEL_25;
  }
  char v69 = 0;
LABEL_32:

  if (VOSCustomBrailleEnabled())
  {
    v58 = VOSFirstGesturesCompatibleBrailleTable();
    if ((v69 & 1) != 0
      || ([v14[459] sharedInstance],
          v59 = objc_claimAutoreleasedReturnValue(),
          [v59 voiceOverTouchBrailleGesturesInputTableIdentifier],
          __int16 v60 = objc_claimAutoreleasedReturnValue(),
          v60,
          v59,
          !v60)
      && v58)
    {
      v61 = [v58 identifier];
      __int16 v62 = [v14[459] sharedInstance];
      [v62 setVoiceOverTouchBrailleGesturesInputTableIdentifier:v61];
    }
  }
  if ((v20 & 1) == 0) {
    [(VoiceOverBrailleLanguageVariantsTableController *)self _popToTopOfBrailleSettings];
  }

LABEL_41:
}

- (void)updateTableCheckedSelection:(id)a3
{
  id v9 = a3;
  uint64_t v4 = OBJC_IVAR___PSListController__table;
  if ((uint64_t)[*(id *)&self->AXUISettingsListController_opaque[OBJC_IVAR___PSListController__table] numberOfSections] >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      if ((uint64_t)[*(id *)&self->AXUISettingsListController_opaque[v4] numberOfRowsInSection:v5] >= 1)
      {
        uint64_t v6 = 0;
        do
        {
          id v7 = +[NSIndexPath indexPathForRow:v6 inSection:v5];
          id v8 = [*(id *)&self->AXUISettingsListController_opaque[v4] cellForRowAtIndexPath:v7];
          objc_msgSend(v8, "setChecked:", objc_msgSend(v7, "isEqual:", v9));

          ++v6;
        }
        while ((uint64_t)[*(id *)&self->AXUISettingsListController_opaque[v4] numberOfRowsInSection:v5] > v6);
      }
      ++v5;
    }
    while ((uint64_t)[*(id *)&self->AXUISettingsListController_opaque[v4] numberOfSections] > v5);
  }
}

- (int64_t)_indexOfDefaultRotorItem
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 voiceOverBrailleLanguageRotorItems];

  if (v3) {
    int64_t v4 = (int64_t)[v3 indexOfObjectPassingTest:&__block_literal_global_296_0];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

BOOL __75__VoiceOverBrailleLanguageVariantsTableController__indexOfDefaultRotorItem__block_invoke(id a1, NSDictionary *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v5 = [(NSDictionary *)a2 objectForKeyedSubscript:@"Default"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6) {
    *a4 = 1;
  }
  return v6;
}

- (void)_ensureDefaultRotorItemExists
{
  if ([(VoiceOverBrailleLanguageVariantsTableController *)self _indexOfDefaultRotorItem] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = +[AXSettings sharedInstance];
    int64_t v4 = [v3 voiceOverBrailleLanguageRotorItems];
    id v5 = [v4 mutableCopy];

    if (!v5)
    {
      id v5 = +[NSMutableArray array];
    }
    unsigned int v6 = +[AXLanguageManager sharedInstance];
    id v7 = [v6 userLocale];

    id v8 = [(VoiceOverBrailleLanguageVariantsTableController *)self tableEnumerator];
    id v9 = [(id)objc_opt_class() defaultTableForLocale:v7];

    uint64_t v10 = [v7 localeIdentifier];
    id v17 = v10;
    v11 = [v9 identifier];
    long long v18 = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

    v15[0] = @"Enabled";
    v15[1] = @"Default";
    v16[0] = &__kCFBooleanTrue;
    v16[1] = &__kCFBooleanTrue;
    v15[2] = @"LanguageDefaults";
    v16[2] = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
    [v5 insertObject:v13 atIndex:0];
    id v14 = +[AXSettings sharedInstance];
    [v14 setVoiceOverBrailleLanguageRotorItems:v5];
  }
}

- (void)_popToTopOfBrailleSettings
{
  id v3 = [(VoiceOverBrailleLanguageVariantsTableController *)self specifier];
  int64_t v4 = [v3 propertyForKey:@"DismissBlock"];

  id v5 = [(VoiceOverBrailleLanguageVariantsTableController *)self presentingViewController];

  if (v5)
  {
    if (v4) {
      v4[2](v4);
    }
    unsigned int v6 = [(VoiceOverBrailleLanguageVariantsTableController *)self presentingViewController];
    [v6 dismissViewControllerWithTransition:9 completion:0];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [(VoiceOverBrailleLanguageVariantsTableController *)self navigationController];
    id v8 = [v7 viewControllers];
    id v9 = [v8 reverseObjectEnumerator];

    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
LABEL_7:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v11 == (id)++v13)
        {
          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      id v15 = v14;

      if (!v15) {
        goto LABEL_19;
      }
      if (v4) {
        v4[2](v4);
      }
      long long v16 = [(VoiceOverBrailleLanguageVariantsTableController *)self navigationController];
      id v17 = [v16 popToViewController:v15 animated:1];
    }
    else
    {
LABEL_13:
      id v15 = v9;
    }
  }
LABEL_19:
}

- (void)tableView:(NSObject *)a1 didSelectRowAtIndexPath:.cold.1(NSObject *a1)
{
  v2 = +[AXSettings sharedInstance];
  id v3 = [v2 voiceOverBrailleLanguageRotorItems];
  int64_t v4 = [v3 debugDescription];
  int v5 = 138412290;
  unsigned int v6 = v4;
  _os_log_debug_impl(&dword_0, a1, OS_LOG_TYPE_DEBUG, "Updated braille language rotor items: %@", (uint8_t *)&v5, 0xCu);
}

@end