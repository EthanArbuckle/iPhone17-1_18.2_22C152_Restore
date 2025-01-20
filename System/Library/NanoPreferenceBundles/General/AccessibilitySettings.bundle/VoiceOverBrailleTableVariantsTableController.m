@interface VoiceOverBrailleTableVariantsTableController
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

@implementation VoiceOverBrailleTableVariantsTableController

- (BRLTTableEnumerator)tableEnumerator
{
  v2 = [(VoiceOverBrailleTableVariantsTableController *)self specifier];
  v3 = [v2 propertyForKey:@"TableEnumerator"];

  return (BRLTTableEnumerator *)v3;
}

- (id)specifiers
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v38 = (int)*MEMORY[0x263F5FDB8];
    v4 = [MEMORY[0x263EFF980] array];
    v5 = [(VoiceOverBrailleTableVariantsTableController *)self specifier];
    v6 = [v5 propertyForKey:@"IsLanguageAgnostic"];
    char v43 = [v6 BOOLValue];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obuint64_t j = [(VoiceOverBrailleTableVariantsTableController *)self _translatorBundlesWithSystemAtFirst];
    uint64_t v44 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v44)
    {
      uint64_t v42 = *(void *)v55;
      uint64_t v39 = *MEMORY[0x263F600F8];
      v41 = v4;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v55 != v42) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v9 = [(VoiceOverBrailleTableVariantsTableController *)self specifier];
          v10 = v9;
          if (v43)
          {
            v11 = [v9 propertyForKey:@"TableIdentifier"];

            v12 = [(VoiceOverBrailleTableVariantsTableController *)self tableEnumerator];
            v13 = [v12 languageAgnosticTablesForIdentifier:v11 inBundle:v8];

            v14 = [NSString stringWithFormat:@"%@.footer", v11];
            v15 = settingsLocString(v14, @"VoiceOverSettings");
            v16 = v15;
            if (v15 && ([v15 isEqual:v14] & 1) == 0) {
              id v49 = v16;
            }
            else {
              id v49 = 0;
            }
          }
          else
          {
            v11 = [v9 propertyForKey:@"Locale"];

            v17 = [(VoiceOverBrailleTableVariantsTableController *)self tableEnumerator];
            v13 = [v17 tablesForLocale:v11 inBundle:v8];

            v14 = BRLLogTranslation();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v18 = [v11 languageCode];
              [v13 debugDescription];
              v20 = v19 = v13;
              *(_DWORD *)buf = 138412802;
              v60 = v11;
              __int16 v61 = 2112;
              v62 = v18;
              __int16 v63 = 2112;
              v64 = v20;
              _os_log_impl(&dword_246A39000, v14, OS_LOG_TYPE_DEFAULT, "Finding tables for locale %@ %@ %@", buf, 0x20u);

              v13 = v19;
            }
            id v49 = 0;
          }

          if ([v13 count])
          {
            uint64_t v48 = i;
            v21 = [MEMORY[0x263EFF980] array];
            v22 = (void *)MEMORY[0x263F2BAC0];
            v23 = [v8 bundleIdentifier];
            uint64_t v24 = [v22 localizedNameForServiceWithIdentifier:v23];

            v46 = (void *)v24;
            v25 = [MEMORY[0x263F5FC40] groupSpecifierWithName:v24];
            if ([v49 length]) {
              [v25 setProperty:v49 forKey:v39];
            }
            v45 = v25;
            [v4 addObject:v25];
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            v47 = v13;
            id v26 = v13;
            uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v58 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v51;
              do
              {
                for (uint64_t j = 0; j != v28; ++j)
                {
                  if (*(void *)v51 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  v31 = *(void **)(*((void *)&v50 + 1) + 8 * j);
                  if (VOSCustomBrailleEnabled())
                  {
                    v32 = [v31 replacements];
                    uint64_t v33 = [v32 count];

                    if (v33) {
                      continue;
                    }
                  }
                  else if ([v31 isCustomBrailleTable])
                  {
                    continue;
                  }
                  v34 = [v31 localizedName];
                  v35 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v34 target:self set:0 get:0 detail:0 cell:3 edit:0];
                  [v35 setProperty:v31 forKey:@"Table"];
                  [v21 addObject:v35];
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v58 count:16];
              }
              while (v28);
            }

            [v21 sortUsingComparator:&__block_literal_global];
            v4 = v41;
            [v41 addObjectsFromArray:v21];

            v13 = v47;
            uint64_t i = v48;
          }
        }
        uint64_t v44 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
      }
      while (v44);
    }

    v36 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v38);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v38) = (Class)v4;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v38);
  }

  return v3;
}

uint64_t __58__VoiceOverBrailleTableVariantsTableController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_translatorBundlesWithSystemAtFirst
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(VoiceOverBrailleTableVariantsTableController *)self tableEnumerator];
  id v4 = [v3 translatorBundles];

  v5 = objc_opt_new();
  v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (-[VoiceOverBrailleTableVariantsTableController _isSystemBundle:](self, "_isSystemBundle:", v12, (void)v15))
        {
          v13 = v5;
        }
        else
        {
          v13 = v6;
        }
        [v13 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [v5 addObjectsFromArray:v6];

  return v5;
}

- (BOOL)_isSystemBundle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.scrod.braille.table.duxbury"];

  v6 = [v3 bundleIdentifier];

  LOBYTE(v3) = [v6 isEqualToString:@"com.apple.scrod.braille.table.apple"];
  return v5 | v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VoiceOverBrailleTableVariantsTableController;
  id v4 = [(VoiceOverBrailleTableVariantsTableController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  char v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v44 = a4;
  uint64_t v42 = [v44 specifier];
  v6 = [v42 propertyForKey:@"Table"];
  objc_super v7 = [(VoiceOverBrailleTableVariantsTableController *)self specifier];
  uint64_t v8 = [v7 identifier];
  int v9 = [v8 isEqualToString:@"DefaultLanguage"];

  uint64_t v10 = [MEMORY[0x263F228D0] sharedInstance];
  v47 = [v10 userLocale];

  v45 = self;
  v11 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v12 = [v11 objectForKey:*MEMORY[0x263F22BA0]];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    char v43 = 0;
    uint64_t v15 = *(void *)v49;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v49 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (v9
          && ([*(id *)(*((void *)&v48 + 1) + 8 * i) objectForKeyedSubscript:@"Default"],
              long long v18 = objc_claimAutoreleasedReturnValue(),
              int v19 = [v18 BOOLValue],
              v18,
              v19))
        {
          uint64_t v20 = [v17 objectForKeyedSubscript:@"LanguageDefaults"];
          v21 = [v47 localeIdentifier];
          v22 = [v20 objectForKeyedSubscript:v21];

          v23 = [v6 identifier];
          LODWORD(v21) = [v23 isEqualToString:v22];

          if (v21) {
            [v44 setChecked:1];
          }

          char v43 = 1;
        }
        else
        {
          uint64_t v24 = [v17 objectForKeyedSubscript:@"Default"];
          int v25 = [v24 BOOLValue];

          if (v25)
          {
            id v26 = [v17 objectForKeyedSubscript:@"LanguageDefaults"];
            uint64_t v27 = [v47 localeIdentifier];
            uint64_t v28 = [v26 objectForKeyedSubscript:v27];

            uint64_t v29 = [v6 identifier];
            LOBYTE(v27) = [v29 isEqualToString:v28];

            if ((v27 & 1) == 0) {
              continue;
            }
          }
          else
          {
            v30 = [v6 identifier];
            v31 = [v17 objectForKeyedSubscript:@"RotorItem"];
            int v32 = [v30 isEqualToString:v31];

            if (!v32) {
              continue;
            }
          }
          uint64_t v33 = [(VoiceOverBrailleTableVariantsTableController *)v45 specifier];
          v34 = [v33 propertyForKey:@"AllowDuplicatesKey"];
          char v35 = [v34 BOOLValue];

          if ((v35 & 1) == 0)
          {
            [v44 setUserInteractionEnabled:0];
            [v44 setCellEnabled:0];
          }
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (!v14) {
        goto LABEL_21;
      }
    }
  }
  char v43 = 0;
LABEL_21:

  if (v9 && (v43 & 1) == 0)
  {
    v36 = (void *)MEMORY[0x263F2BAC0];
    v37 = [MEMORY[0x263F228D0] sharedInstance];
    uint64_t v38 = [v37 userLocale];
    uint64_t v39 = [v36 defaultTableForLocale:v38];

    v40 = [v6 identifier];
    v41 = [v39 identifier];
    objc_msgSend(v44, "setChecked:", objc_msgSend(v40, "isEqualToString:", v41));
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v52[2] = *MEMORY[0x263EF8340];
  v50.receiver = self;
  v50.super_class = (Class)VoiceOverBrailleTableVariantsTableController;
  id v6 = a4;
  id v7 = a3;
  [(VoiceOverBrailleTableVariantsTableController *)&v50 tableView:v7 didSelectRowAtIndexPath:v6];
  uint64_t v8 = [v7 cellForRowAtIndexPath:v6];

  int v9 = [v8 specifier];

  uint64_t v10 = [(VoiceOverBrailleTableVariantsTableController *)self specifier];
  v11 = [v10 propertyForKey:@"TableSelectionBlockKey"];

  uint64_t v12 = [v9 propertyForKey:@"Table"];
  [(VoiceOverBrailleTableVariantsTableController *)self updateTableCheckedSelection:v6];

  if (!v11)
  {
    [(VoiceOverBrailleTableVariantsTableController *)self _ensureDefaultRotorItemExists];
    uint64_t v14 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    uint64_t v15 = *MEMORY[0x263F22BA0];
    long long v16 = [v14 objectForKey:*MEMORY[0x263F22BA0]];

    long long v17 = (void *)[v16 mutableCopy];
    if (!v17)
    {
      long long v17 = [MEMORY[0x263EFF980] array];
    }
    long long v18 = [(VoiceOverBrailleTableVariantsTableController *)self specifier];
    int v19 = [v18 identifier];
    LODWORD(v20) = [v19 isEqualToString:@"DefaultLanguage"];

    if (v20)
    {
      uint64_t v49 = v15;
      int64_t v21 = [(VoiceOverBrailleTableVariantsTableController *)self _indexOfDefaultRotorItem];
      if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_18;
      }
      int64_t v22 = v21;
      char v46 = (char)v20;
      long long v48 = v16;
      v23 = [v17 objectAtIndexedSubscript:v21];
      uint64_t v24 = (void *)[v23 mutableCopy];

      int v25 = objc_msgSend(v24, "objectForKeyedSubscript:");
      id v26 = (void *)[v25 mutableCopy];

      uint64_t v27 = [MEMORY[0x263F228D0] sharedInstance];
      uint64_t v28 = [v27 userLocale];

      uint64_t v29 = [v28 localeIdentifier];
      char v43 = [v26 objectForKeyedSubscript:v29];

      v30 = [v12 identifier];
      v45 = v28;
      v31 = [v28 localeIdentifier];
      [v26 setObject:v30 forKeyedSubscript:v31];

      v47 = v26;
      int v32 = v26;
      uint64_t v20 = v43;
      [v24 setObject:v32 forKeyedSubscript:@"LanguageDefaults"];
      [v17 setObject:v24 atIndexedSubscript:v22];
      if (VOSCustomBrailleEnabled())
      {
        uint64_t v33 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
        uint64_t v34 = *MEMORY[0x263F22BB0];
        uint64_t v35 = [v33 objectForKey:*MEMORY[0x263F22BB0]];

        id v44 = (void *)v35;
        if ([v43 isEqualToString:v35])
        {
          v36 = [v12 identifier];
          [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v36 forKey:v34];
        }
        v37 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
        uint64_t v38 = *MEMORY[0x263F22B98];
        uint64_t v39 = [v37 objectForKey:*MEMORY[0x263F22B98]];

        if ([v20 isEqualToString:v39])
        {
          v40 = [v12 identifier];
          [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v40 forKey:v38];
        }
      }

      long long v16 = v48;
      LOBYTE(v20) = v46;
    }
    else
    {
      v51[0] = @"RotorItem";
      v41 = [v12 identifier];
      v51[1] = @"Enabled";
      v52[0] = v41;
      v52[1] = MEMORY[0x263EFFA88];
      uint64_t v24 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];

      if ([v17 containsObject:v24])
      {

LABEL_21:
        [(VoiceOverBrailleTableVariantsTableController *)self _popToTopOfBrailleSettings];
LABEL_22:

        goto LABEL_23;
      }
      uint64_t v49 = v15;
      [v17 addObject:v24];
    }

LABEL_18:
    -[AccessibilityBridgeBaseController setGizmoAccessibilityPref:forKey:](self, "setGizmoAccessibilityPref:forKey:", v17, v49, v43);
    uint64_t v42 = BRLLogTranslation();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      -[VoiceOverBrailleTableVariantsTableController tableView:didSelectRowAtIndexPath:](v17, v42);
    }

    if (v20) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  uint64_t v13 = [v12 identifier];
  ((void (**)(void, void *))v11)[2](v11, v13);

  [(VoiceOverBrailleTableVariantsTableController *)self _popToTopOfBrailleSettings];
LABEL_23:
}

- (void)updateTableCheckedSelection:(id)a3
{
  id v9 = a3;
  uint64_t v4 = (int)*MEMORY[0x263F5FDD0];
  if ([*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) numberOfSections] >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      if ([*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) numberOfRowsInSection:v5] >= 1)
      {
        uint64_t v6 = 0;
        do
        {
          id v7 = [MEMORY[0x263F088C8] indexPathForRow:v6 inSection:v5];
          uint64_t v8 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) cellForRowAtIndexPath:v7];
          objc_msgSend(v8, "setChecked:", objc_msgSend(v7, "isEqual:", v9));

          ++v6;
        }
        while ([*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) numberOfRowsInSection:v5] > v6);
      }
      ++v5;
    }
    while ([*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) numberOfSections] > v5);
  }
}

- (int64_t)_indexOfDefaultRotorItem
{
  v2 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  id v3 = [v2 objectForKey:*MEMORY[0x263F22BA0]];

  if (v3) {
    int64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_291];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

uint64_t __72__VoiceOverBrailleTableVariantsTableController__indexOfDefaultRotorItem__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = [a2 objectForKeyedSubscript:@"Default"];
  uint64_t v6 = [v5 BOOLValue];

  if (v6) {
    *a4 = 1;
  }
  return v6;
}

- (void)_ensureDefaultRotorItemExists
{
  v18[1] = *MEMORY[0x263EF8340];
  if ([(VoiceOverBrailleTableVariantsTableController *)self _indexOfDefaultRotorItem] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    uint64_t v4 = *MEMORY[0x263F22BA0];
    uint64_t v5 = [v3 objectForKey:*MEMORY[0x263F22BA0]];

    uint64_t v6 = (void *)[v5 mutableCopy];
    if (!v6)
    {
      uint64_t v6 = [MEMORY[0x263EFF980] array];
    }
    id v7 = [MEMORY[0x263F228D0] sharedInstance];
    uint64_t v8 = [v7 userLocale];

    id v9 = [(VoiceOverBrailleTableVariantsTableController *)self tableEnumerator];
    uint64_t v10 = [(id)objc_opt_class() defaultTableForLocale:v8];

    v11 = [v8 localeIdentifier];
    long long v17 = v11;
    uint64_t v12 = [v10 identifier];
    v18[0] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];

    v15[0] = @"Enabled";
    v15[1] = @"Default";
    v16[0] = MEMORY[0x263EFFA88];
    v16[1] = MEMORY[0x263EFFA88];
    v15[2] = @"LanguageDefaults";
    v16[2] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
    [v6 insertObject:v14 atIndex:0];
    [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v6 forKey:v4];
  }
}

- (void)_popToTopOfBrailleSettings
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(VoiceOverBrailleTableVariantsTableController *)self specifier];
  uint64_t v4 = [v3 propertyForKey:@"DismissBlock"];

  uint64_t v5 = [(VoiceOverBrailleTableVariantsTableController *)self presentingViewController];

  if (v5)
  {
    if (v4) {
      v4[2](v4);
    }
    uint64_t v6 = [(VoiceOverBrailleTableVariantsTableController *)self presentingViewController];
    [v6 dismissViewControllerWithTransition:9 completion:0];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [(VoiceOverBrailleTableVariantsTableController *)self navigationController];
    uint64_t v8 = [v7 viewControllers];
    id v9 = [v8 reverseObjectEnumerator];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
LABEL_7:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
      long long v16 = [(VoiceOverBrailleTableVariantsTableController *)self navigationController];
      id v17 = (id)[v16 popToViewController:v15 animated:1];
    }
    else
    {
LABEL_13:
      id v15 = v9;
    }
  }
LABEL_19:
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 debugDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_246A39000, a2, OS_LOG_TYPE_DEBUG, "Updated braille language rotor items: %@", (uint8_t *)&v4, 0xCu);
}

@end