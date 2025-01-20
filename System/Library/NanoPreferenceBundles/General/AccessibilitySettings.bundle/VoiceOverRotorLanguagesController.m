@interface VoiceOverRotorLanguagesController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (VoiceOverRotorLanguagesController)init;
- (id)_languageSpecs;
- (id)specifiers;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_donePressed;
- (void)_editPressed:(id)a3;
- (void)_manageEditButton;
- (void)reloadSpecifiers;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setGizmoPref:(id)a3 forKey:(id)a4 domainAccessor:(id)a5;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation VoiceOverRotorLanguagesController

- (VoiceOverRotorLanguagesController)init
{
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverRotorLanguagesController;
  v2 = [(AccessibilityBridgeBaseController *)&v4 init];
  [(VoiceOverRotorLanguagesController *)v2 _manageEditButton];
  return v2;
}

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)VoiceOverRotorLanguagesController;
  [(VoiceOverRotorLanguagesController *)&v3 reloadSpecifiers];
  [(VoiceOverRotorLanguagesController *)self _manageEditButton];
}

- (void)setGizmoPref:(id)a3 forKey:(id)a4 domainAccessor:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)VoiceOverRotorLanguagesController;
  [(AccessibilityBridgeBaseController *)&v6 setGizmoPref:a3 forKey:a4 domainAccessor:a5];
  [(VoiceOverRotorLanguagesController *)self reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    objc_super v6 = [(VoiceOverRotorLanguagesController *)self _languageSpecs];
    [v5 addObjectsFromArray:v6];

    v7 = (void *)MEMORY[0x263F5FC40];
    v8 = settingsLocString(@"ADD_NEW_LANGUAGE", @"VoiceOverSettings");
    v9 = [v7 preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    v10 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v5 addObject:v10];

    [v5 addObject:v9];
    v11 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)_languageSpecs
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v30 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = *MEMORY[0x263F8B400];
  objc_super v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v29 = self;
  v5 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v3 domainAccessor:v4];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = @"RotorItem";
    uint64_t v10 = *(void *)v32;
    v11 = @"Enabled";
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v14 = [v13 objectForKey:v9];
        if (([v14 isEqualToString:@"ms"] & 1) == 0)
        {
          v15 = [v13 objectForKeyedSubscript:v11];
          int v16 = [v15 BOOLValue];

          if (v16)
          {
            v17 = v9;
            id v18 = v6;
            v19 = v11;
            v20 = [MEMORY[0x263F228D0] sharedInstance];
            v21 = [v20 dialectForLanguageID:v14];

            if (!v21)
            {
              v28 = v14;
              _AXAssert();
            }
            v22 = (void *)MEMORY[0x263F5FC40];
            v23 = objc_msgSend(v21, "languageNameAndLocaleInCurrentLocale", v28);
            v28 = 0;
            v24 = objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, v29, 0, 0, 0, 3);

            [v24 setProperty:MEMORY[0x263EFFA88] forKey:@"IsLanguage"];
            v25 = AXCLanguageConvertToCanonicalForm();
            [v24 setProperty:v25 forKey:@"LanguageKey"];

            [v30 addObject:v24];
            v11 = v19;
            id v6 = v18;
            v9 = v17;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }

  if ([v30 count])
  {
    v26 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v30 insertObject:v26 atIndex:0];
  }

  return v30;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v12 = a4;
  id v6 = [v12 specifier];
  int v7 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) isEditing];
  uint64_t v8 = [v6 propertyForKey:@"IsLanguage"];
  int v9 = [v8 BOOLValue];

  if (v7)
  {
    if (v9)
    {
      [v12 setEnabled:1];
      [v12 setCellEnabled:1];
      [v12 setShowsReorderControl:1];
    }
    else
    {
      uint64_t v10 = [v12 titleLabel];
      [v10 setEnabled:0];

      [v12 setEnabled:0];
      [v12 setCellEnabled:0];
    }
  }
  else
  {
    if (v9)
    {
      [v12 setEnabled:1];
      [v12 setCellEnabled:1];
      [v12 setShowsReorderControl:0];
    }
    else
    {
      v11 = [v12 titleLabel];
      [v11 setEnabled:1];

      [v12 setEnabled:1];
      [v12 setCellEnabled:1];
    }
    [v12 setSelectionStyle:1];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if (v8 >= [v6 numberOfSections]
    || (uint64_t v9 = [v7 row], v9 >= objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section"))))
  {
    char v12 = 0;
  }
  else
  {
    uint64_t v10 = [(VoiceOverRotorLanguagesController *)self specifierAtIndex:[(VoiceOverRotorLanguagesController *)self indexForIndexPath:v7]];
    v11 = [v10 propertyForKey:@"IsLanguage"];
    char v12 = [v11 BOOLValue];
  }
  return v12;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  objc_super v4 = [(VoiceOverRotorLanguagesController *)self specifierAtIndex:[(VoiceOverRotorLanguagesController *)self indexForIndexPath:a4]];
  v5 = [v4 propertyForKey:@"IsLanguage"];
  unsigned int v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  objc_super v4 = [(VoiceOverRotorLanguagesController *)self specifierAtIndex:[(VoiceOverRotorLanguagesController *)self indexForIndexPath:a4]];
  v5 = [v4 propertyForKey:@"IsLanguage"];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v8 = a5;
  long long v32 = [(VoiceOverRotorLanguagesController *)self specifierAtIndex:[(VoiceOverRotorLanguagesController *)self indexForIndexPath:v8]];
  if (a4 == 1)
  {
    uint64_t v9 = [v32 propertyForKey:@"IsLanguage"];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      v11 = [v32 propertyForKey:@"LanguageKey"];
      char v12 = MEMORY[0x24C53F430]();
      uint64_t v13 = *MEMORY[0x263F8B400];
      v14 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
      v29 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v13 domainAccessor:v14];

      v15 = (void *)[v29 mutableCopy];
      uint64_t v41 = 0;
      v42 = &v41;
      uint64_t v43 = 0x2020000000;
      uint64_t v44 = 0;
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __84__VoiceOverRotorLanguagesController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
      v37[3] = &unk_2651F2268;
      v40 = &v41;
      id v27 = v11;
      id v38 = v27;
      id v28 = v12;
      id v39 = v28;
      v30 = v15;
      int v16 = [v15 indexesOfObjectsPassingTest:v37];
      if ([v16 count])
      {
        v17 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v16, "count"));
        [v30 objectsAtIndexes:v16];
        v26 = v16;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v45 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v34;
          uint64_t v21 = MEMORY[0x263EFFA80];
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v34 != v20) {
                objc_enumerationMutation(v18);
              }
              v23 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * v22) mutableCopy];
              [v23 setObject:v21 forKey:@"Enabled"];
              [v17 addObject:v23];
              --v42[3];

              ++v22;
            }
            while (v19 != v22);
            uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v45 count:16];
          }
          while (v19);
        }

        [v30 replaceObjectsAtIndexes:v26 withObjects:v17];
        int v16 = v26;
      }
      [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v30 forKey:*MEMORY[0x263F8B400]];

      _Block_object_dispose(&v41, 8);
    }
  }
  v24 = [(VoiceOverRotorLanguagesController *)self _languageSpecs];
  BOOL v25 = [v24 count] == 0;

  if (v25)
  {
    [(VoiceOverRotorLanguagesController *)self setEditing:0 animated:1];
    [(VoiceOverRotorLanguagesController *)self _manageEditButton];
  }
}

uint64_t __84__VoiceOverRotorLanguagesController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [v3 objectForKey:@"RotorItem"];
  v5 = [v3 objectForKey:@"Enabled"];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v5 BOOLValue];

  if ([*(id *)(a1 + 32) isEqualToString:v4])
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = [v3 objectForKey:@"Enabled"];
    if ([v7 BOOLValue]) {
      uint64_t v6 = [*(id *)(a1 + 40) isEqualToString:v4];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  objc_super v4 = [a3 cellForRowAtIndexPath:a4];
  v5 = [v4 specifier];

  uint64_t v6 = [v5 propertyForKey:@"LanguageKey"];
  LOBYTE(v4) = v6 != 0;

  return (char)v4;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v9 isEqual:v10] & 1) == 0)
  {
    v11 = [v8 cellForRowAtIndexPath:v9];
    char v12 = [v11 specifier];

    id v28 = v12;
    uint64_t v13 = [v12 propertyForKey:@"LanguageKey"];
    v14 = AXCLanguageConvertToCanonicalForm();

    v15 = [v8 cellForRowAtIndexPath:v10];
    int v16 = [v15 specifier];

    id v27 = v16;
    v17 = [v16 propertyForKey:@"LanguageKey"];
    id v18 = AXCLanguageConvertToCanonicalForm();

    uint64_t v19 = *MEMORY[0x263F8B400];
    uint64_t v20 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    uint64_t v21 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v19 domainAccessor:v20];

    v26 = v21;
    uint64_t v22 = (void *)[v21 mutableCopy];
    uint64_t v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v34 = 0;
    long long v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __78__VoiceOverRotorLanguagesController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke;
    v29[3] = &unk_2651F2290;
    id v23 = v14;
    id v30 = v23;
    long long v32 = &v38;
    id v24 = v18;
    id v31 = v24;
    long long v33 = &v34;
    [v22 enumerateObjectsUsingBlock:v29];
    if (v39[3] != 0x7FFFFFFFFFFFFFFFLL && v35[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v25 = objc_msgSend(v22, "objectAtIndex:");
      [v22 removeObjectAtIndex:v39[3]];
      [v22 insertObject:v25 atIndex:v35[3]];
      [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v22 forKey:*MEMORY[0x263F8B400]];
    }
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
  }
}

uint64_t __78__VoiceOverRotorLanguagesController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 objectForKey:@"RotorItem"];
  id v10 = AXCLanguageConvertToCanonicalForm();

  id v7 = [v5 objectForKeyedSubscript:@"Enabled"];

  LODWORD(v5) = [v7 BOOLValue];
  if (v5)
  {
    if ([v10 isEqualToString:a1[4]])
    {
      id v8 = (void *)(*(void *)(a1[6] + 8) + 24);
    }
    else
    {
      if (![v10 isEqualToString:a1[5]]) {
        goto LABEL_7;
      }
      id v8 = (void *)(*(void *)(a1[7] + 8) + 24);
    }
    void *v8 = a3;
  }
LABEL_7:

  return MEMORY[0x270F9A758]();
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [a3 cellForRowAtIndexPath:v8];
  id v10 = [v9 specifier];

  v11 = [v10 propertyForKey:@"LanguageKey"];

  if (v11) {
    char v12 = v8;
  }
  else {
    char v12 = v7;
  }
  id v13 = v12;

  return v13;
}

- (void)_editPressed:(id)a3
{
  [(VoiceOverRotorLanguagesController *)self setEditing:1 animated:1];
  id v5 = (id)[objc_allocWithZone(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel__donePressed];
  objc_super v4 = [(VoiceOverRotorLanguagesController *)self navigationItem];
  [v4 setRightBarButtonItem:v5];
}

- (void)_donePressed
{
  [(VoiceOverRotorLanguagesController *)self setEditing:0 animated:1];

  [(VoiceOverRotorLanguagesController *)self _manageEditButton];
}

- (void)_manageEditButton
{
  id v3 = [(VoiceOverRotorLanguagesController *)self _languageSpecs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    if (([*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) isEditing] & 1) == 0)
    {
      id v7 = (id)[objc_allocWithZone(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:2 target:self action:sel__editPressed_];
      uint64_t v6 = [(VoiceOverRotorLanguagesController *)self navigationItem];
      [v6 setRightBarButtonItem:v7];
    }
  }
  else
  {
    id v5 = [(VoiceOverRotorLanguagesController *)self navigationItem];
    [v5 setRightBarButtonItem:0];

    [(VoiceOverRotorLanguagesController *)self setEditing:0 animated:1];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + v7) beginUpdates];
  v8.receiver = self;
  v8.super_class = (Class)VoiceOverRotorLanguagesController;
  [(VoiceOverRotorLanguagesController *)&v8 setEditing:v5 animated:v4];
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + v7) endUpdates];
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + v7) setEditing:v5 animated:v4];
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + v7) reloadData];
}

@end