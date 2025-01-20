@interface VoiceOverBrailleTableController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BRLTTableEnumerator)tableEnumerator;
- (VoiceOverBrailleTableController)init;
- (id)_addNewTableSpecifier;
- (id)_defaultTable;
- (id)_tableSpecifiers;
- (id)preCustomBrailleSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_addLanguage:(id)a3;
- (void)_donePressed;
- (void)_editPressed:(id)a3;
- (void)_manageEditButton;
- (void)_removeTableSpecifier:(id)a3;
- (void)reloadSpecifiers;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setTableEnumerator:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation VoiceOverBrailleTableController

- (VoiceOverBrailleTableController)init
{
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverBrailleTableController;
  v2 = [(AccessibilityBridgeBaseController *)&v4 init];
  [(VoiceOverBrailleTableController *)v2 _manageEditButton];
  return v2;
}

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)VoiceOverBrailleTableController;
  [(VoiceOverBrailleTableController *)&v3 reloadSpecifiers];
  [(VoiceOverBrailleTableController *)self _manageEditButton];
}

- (id)specifiers
{
  if (VOSCustomBrailleEnabled())
  {
    uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
      v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"LanguagesGroup"];
      [v5 addObject:v6];
      v7 = [(VoiceOverBrailleTableController *)self _tableSpecifiers];
      [v5 addObjectsFromArray:v7];

      v8 = [(VoiceOverBrailleTableController *)self _addNewTableSpecifier];
      [v5 addObject:v8];

      v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

      objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    }
    id v10 = v4;
  }
  else
  {
    id v10 = [(VoiceOverBrailleTableController *)self preCustomBrailleSpecifiers];
  }

  return v10;
}

- (id)preCustomBrailleSpecifiers
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v19 = (int)*MEMORY[0x263F5FDB8];
    objc_super v4 = [MEMORY[0x263EFF980] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = [&unk_26FB00838 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(&unk_26FB00838);
          }
          v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
          id v10 = (void *)[objc_alloc(MEMORY[0x263F2BAB0]) initWithIdentifier:v9];
          v11 = [v10 localizedName];
          char v12 = [v9 isEqualToString:@"com.apple.scrod.braille.table.duxbury.eng-xueb"];
          v13 = @"ENGLISH_UNIFIED_BRAILLE_TABLE";
          if ((v12 & 1) != 0
            || (int v14 = [v9 isEqualToString:@"com.apple.scrod.braille.table.duxbury.eng-xna"],
                v13 = @"ENGLISH_US_BRAILLE_TABLE",
                v14))
          {
            uint64_t v15 = settingsLocString(v13, @"VoiceOverSettings");

            v11 = (void *)v15;
          }
          v16 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];
          [v16 setProperty:v9 forKey:@"tableIdentifier"];
          [v4 addObject:v16];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [&unk_26FB00838 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }
    v17 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v19);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v19) = (Class)v4;

    uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v19);
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VoiceOverBrailleTableController;
  objc_super v4 = [(VoiceOverBrailleTableController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  uint64_t v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v21 = v7;
  v9 = [v21 specifier];
  if (VOSCustomBrailleEnabled())
  {
    id v10 = [v9 propertyForKey:@"IsLanguage"];
    int v11 = [v10 BOOLValue];

    if ([*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) isEditing])
    {
      if (v11)
      {
        [v21 setUserInteractionEnabled:1];
        [v21 setCellEnabled:1];
        char v12 = v21;
        uint64_t v13 = 1;
LABEL_11:
        [v12 setShowsReorderControl:v13];
        goto LABEL_15;
      }
      [v21 setUserInteractionEnabled:0];
      [v21 setCellEnabled:0];
      v18 = [v21 titleLabel];
      uint64_t v19 = v18;
      uint64_t v20 = 0;
    }
    else
    {
      [v21 setUserInteractionEnabled:1];
      [v21 setCellEnabled:1];
      if (v11)
      {
        char v12 = v21;
        uint64_t v13 = 0;
        goto LABEL_11;
      }
      v18 = [v21 titleLabel];
      uint64_t v19 = v18;
      uint64_t v20 = 1;
    }
    [v18 setEnabled:v20];
  }
  else
  {
    int v14 = [v9 propertyForKey:@"tableIdentifier"];
    uint64_t v15 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    v16 = [v15 objectForKey:*MEMORY[0x263F22BC0]];

    if (v16 || [v8 row]) {
      uint64_t v17 = [v14 isEqual:v16];
    }
    else {
      uint64_t v17 = 1;
    }
    [v21 setChecked:v17];
  }
LABEL_15:
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  objc_super v4 = [(VoiceOverBrailleTableController *)self specifierAtIndex:[(VoiceOverBrailleTableController *)self indexForIndexPath:a4]];
  uint64_t v5 = [v4 propertyForKey:@"IsLanguage"];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  objc_super v4 = [(VoiceOverBrailleTableController *)self specifierAtIndex:[(VoiceOverBrailleTableController *)self indexForIndexPath:a4]];
  uint64_t v5 = [v4 propertyForKey:@"IsLanguage"];
  if ([v5 BOOLValue])
  {
    char v6 = [v4 identifier];
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
  objc_super v4 = [(VoiceOverBrailleTableController *)self specifierAtIndex:[(VoiceOverBrailleTableController *)self indexForIndexPath:a4]];
  uint64_t v5 = [v4 propertyForKey:@"IsLanguage"];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [a3 cellForRowAtIndexPath:v8];
  id v10 = [v9 specifier];

  int v11 = [v10 propertyForKey:@"IsLanguage"];
  int v12 = [v11 BOOLValue];

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
  objc_super v4 = [(AccessibilityBridgeBaseController *)self specifierForIndexPath:a4];
  uint64_t v5 = [v4 propertyForKey:@"IsLanguage"];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqual:v10]) {
    goto LABEL_26;
  }
  int v11 = [v8 cellForRowAtIndexPath:v9];
  int v12 = [v11 specifier];

  v51 = [v12 propertyForKey:@"Table"];
  v47 = v12;
  uint64_t v13 = [v12 identifier];
  int v14 = [v13 isEqualToString:@"DefaultLanguage"];

  uint64_t v15 = [v8 cellForRowAtIndexPath:v10];
  v16 = [v15 specifier];

  v48 = [v16 propertyForKey:@"Table"];
  v46 = v16;
  uint64_t v17 = [v16 identifier];
  int v18 = [v17 isEqualToString:@"DefaultLanguage"];

  v45 = self;
  uint64_t v19 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v42 = *MEMORY[0x263F22BA0];
  uint64_t v20 = objc_msgSend(v19, "objectForKey:");

  id v21 = (void *)[v20 mutableCopy];
  if (![v21 count]) {
    goto LABEL_25;
  }
  v43 = v20;
  id v44 = v10;
  id v40 = v9;
  id v41 = v8;
  unint64_t v22 = 0;
  uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    long long v23 = objc_msgSend(v21, "objectAtIndexedSubscript:", v22, v40, v41);
    v24 = v23;
    if (v14)
    {
      uint64_t v20 = [v23 objectForKeyedSubscript:@"Default"];
      if ([v20 BOOLValue])
      {

LABEL_13:
        uint64_t v49 = v22;
        goto LABEL_19;
      }
    }
    uint64_t v25 = [v24 objectForKeyedSubscript:@"RotorItem"];
    v26 = [v51 identifier];
    char v27 = [v25 isEqualToString:v26];

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
        int v28 = 1;
LABEL_15:

        goto LABEL_16;
      }
    }
    v29 = [v24 objectForKeyedSubscript:@"RotorItem"];
    v30 = [v48 identifier];
    int v28 = [v29 isEqualToString:v30];

    if (v18) {
      goto LABEL_15;
    }
LABEL_16:
    uint64_t v31 = v50;
    if (v28) {
      uint64_t v31 = v22;
    }
    uint64_t v50 = v31;
LABEL_19:

    ++v22;
  }
  while (v22 < [v21 count]);
  id v9 = v40;
  id v8 = v41;
  uint64_t v20 = v43;
  id v10 = v44;
  if (v49 != 0x7FFFFFFFFFFFFFFFLL && v50 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = [v21 objectAtIndexedSubscript:v49];
    [v21 removeObjectAtIndex:v49];
    [v21 insertObject:v32 atIndex:v50];
    [(AccessibilityBridgeBaseController *)v45 setGizmoAccessibilityPref:v21 forKey:v42];
    v33 = BRLLogTranslation();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = [v21 debugDescription];
      *(_DWORD *)buf = 138412290;
      v53 = v34;
      _os_log_impl(&dword_246A39000, v33, OS_LOG_TYPE_DEFAULT, "Reordered braille languages settings %@", buf, 0xCu);
    }
    uint64_t v35 = (int)*MEMORY[0x263F5FDB8];
    v36 = (void *)[*(id *)((char *)&v45->super.super.super.super.super.super.isa + v35) mutableCopy];
    uint64_t v37 = [(VoiceOverBrailleTableController *)v45 indexOfSpecifier:v47];
    v38 = [v36 objectAtIndexedSubscript:v37];
    [v36 removeObjectAtIndex:v37];
    [v36 insertObject:v38 atIndex:v50 - v49 + v37];
    v39 = *(Class *)((char *)&v45->super.super.super.super.super.super.isa + v35);
    *(Class *)((char *)&v45->super.super.super.super.super.super.isa + v35) = (Class)v36;

    uint64_t v20 = v43;
    id v10 = v44;
  }
LABEL_25:

LABEL_26:
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = [(VoiceOverBrailleTableController *)self specifierAtIndex:[(VoiceOverBrailleTableController *)self indexForIndexPath:a5]];
  id v8 = [v7 propertyForKey:@"IsLanguage"];
  int v9 = [v8 BOOLValue];

  if (a4 == 1 && v9)
  {
    id v10 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    uint64_t v34 = *MEMORY[0x263F22BA0];
    int v11 = objc_msgSend(v10, "objectForKey:");

    uint64_t v35 = v11;
    int v12 = (void *)[v11 mutableCopy];
    uint64_t v13 = [v7 propertyForKey:@"Table"];
    if ([v12 count])
    {
      uint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = [v12 objectAtIndexedSubscript:v14];
        v16 = [v15 objectForKeyedSubscript:@"RotorItem"];
        uint64_t v17 = [v13 identifier];
        int v18 = [v16 isEqualToString:v17];

        if (v18) {
          break;
        }

        if ([v12 count] <= (unint64_t)++v14) {
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
      v38 = v12;
      _os_log_impl(&dword_246A39000, v19, OS_LOG_TYPE_DEFAULT, "Setting new items after removing: %@", buf, 0xCu);
    }

    [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v12 forKey:v34];
    if (VOSCustomBrailleEnabled())
    {
      uint64_t v20 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
      uint64_t v21 = *MEMORY[0x263F22BB0];
      unint64_t v22 = [v20 objectForKey:*MEMORY[0x263F22BB0]];

      long long v23 = [v13 identifier];
      int v24 = [v23 isEqualToString:v22];

      if (v24)
      {
        uint64_t v25 = [(VoiceOverBrailleTableController *)self _defaultTable];
        v26 = [v25 identifier];
        [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v26 forKey:v21];
      }
      char v27 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
      uint64_t v28 = *MEMORY[0x263F22B98];
      v29 = [v27 objectForKey:*MEMORY[0x263F22B98]];

      v30 = [v13 identifier];
      int v31 = [v30 isEqualToString:v29];

      if (v31)
      {
        v32 = [(VoiceOverBrailleTableController *)self _defaultTable];
        v33 = [v32 identifier];
        [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v33 forKey:v28];
      }
    }
    [(VoiceOverBrailleTableController *)self removeSpecifier:v7 animated:1];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__VoiceOverBrailleTableController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
  block[3] = &unk_2651F24D8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __82__VoiceOverBrailleTableController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accessibilityDomainAccessor];
  id v3 = [v2 objectForKey:*MEMORY[0x263F22BA0]];

  if ((unint64_t)[v3 count] <= 1)
  {
    [*(id *)(a1 + 32) setEditing:0 animated:1];
    [*(id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F5FDD0]) reloadData];
    [*(id *)(a1 + 32) _manageEditButton];
  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  objc_super v4 = [(VoiceOverBrailleTableController *)self specifierAtIndex:[(VoiceOverBrailleTableController *)self indexForIndexPath:a4]];
  uint64_t v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:@"DefaultLanguage"];

  if (v6) {
    id v7 = objc_alloc_init(MEMORY[0x263F82C30]);
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VoiceOverBrailleTableController;
  [(VoiceOverBrailleTableController *)&v11 tableView:v6 didSelectRowAtIndexPath:v7];
  if ((VOSCustomBrailleEnabled() & 1) == 0)
  {
    id v8 = [v6 cellForRowAtIndexPath:v7];
    int v9 = [v8 specifier];

    id v10 = [v9 propertyForKey:@"tableIdentifier"];
    [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v10 forKey:*MEMORY[0x263F22BC0]];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + v7) beginUpdates];
  v8.receiver = self;
  v8.super_class = (Class)VoiceOverBrailleTableController;
  [(VoiceOverBrailleTableController *)&v8 setEditing:v5 animated:v4];
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + v7) endUpdates];
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + v7) setEditing:v5 animated:v4];
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + v7) reloadData];
}

- (BRLTTableEnumerator)tableEnumerator
{
  tableEnumerator = self->_tableEnumerator;
  if (!tableEnumerator)
  {
    BOOL v4 = [MEMORY[0x263F2BAC0] tableEnumeratorWithSystemBundlePath];
    BOOL v5 = self->_tableEnumerator;
    self->_tableEnumerator = v4;

    tableEnumerator = self->_tableEnumerator;
  }

  return tableEnumerator;
}

- (id)_tableSpecifiers
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  BOOL v4 = [v3 objectForKey:*MEMORY[0x263F22BA0]];

  BOOL v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = [MEMORY[0x263F228D0] sharedInstance];
  uint64_t v7 = [v6 userLocale];

  if ([v4 count])
  {
    uint64_t v42 = v7;
    v43 = v4;
    id v44 = v5;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v50 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v49 + 1) + 8 * i) objectForKeyedSubscript:@"Default"];
          int v14 = [v13 BOOLValue];

          if (v14)
          {
            uint64_t v15 = VOSBrailleTableForRotorItem();
            v16 = (void *)MEMORY[0x263F5FC40];
            uint64_t v17 = [v15 localizedNameWithService];
            int v18 = [v16 preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

            [v18 setProperty:MEMORY[0x263EFFA88] forKey:@"IsLanguage"];
            [v18 setProperty:v15 forKey:@"Table"];
            [v18 setIdentifier:@"DefaultLanguage"];
            uint64_t v19 = [MEMORY[0x263F228D0] sharedInstance];
            uint64_t v20 = [v19 userLocale];

            [v18 setProperty:v20 forKey:@"Locale"];
            uint64_t v21 = [(VoiceOverBrailleTableController *)self tableEnumerator];
            [v18 setProperty:v21 forKey:@"TableEnumerator"];

            [v5 addObject:v18];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v10);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v22 = v8;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(v22);
          }
          char v27 = [*(id *)(*((void *)&v45 + 1) + 8 * j) objectForKeyedSubscript:@"Default"];
          char v28 = [v27 BOOLValue];

          if ((v28 & 1) == 0)
          {
            v29 = VOSBrailleTableForRotorItem();
            if (VOSCustomBrailleEnabled())
            {
              v30 = [v29 replacements];
              uint64_t v31 = [v30 count];

              if (!v31)
              {
LABEL_21:
                v32 = (void *)MEMORY[0x263F5FC40];
                v33 = [v29 localizedNameWithService];
                uint64_t v34 = [v32 preferenceSpecifierNamed:v33 target:self set:0 get:0 detail:0 cell:3 edit:0];

                [v34 setProperty:MEMORY[0x263EFFA88] forKey:@"IsLanguage"];
                [v34 setProperty:v29 forKey:@"Table"];
                [v44 addObject:v34];
              }
            }
            else if (([v29 isCustomBrailleTable] & 1) == 0)
            {
              goto LABEL_21;
            }

            continue;
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v24);
    }

    BOOL v4 = v43;
    BOOL v5 = v44;
    uint64_t v7 = v42;
  }
  else
  {
    uint64_t v35 = [(VoiceOverBrailleTableController *)self tableEnumerator];
    v36 = [(id)objc_opt_class() defaultTableForLocale:v7];

    uint64_t v37 = (void *)MEMORY[0x263F5FC40];
    v38 = [v36 localizedNameWithService];
    uint64_t v39 = [v37 preferenceSpecifierNamed:v38 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v39 setIdentifier:@"DefaultLanguage"];
    [v39 setProperty:MEMORY[0x263EFFA88] forKey:@"IsLanguage"];
    [v39 setProperty:v7 forKey:@"Locale"];
    id v40 = [(VoiceOverBrailleTableController *)self tableEnumerator];
    [v39 setProperty:v40 forKey:@"TableEnumerator"];

    [v39 setProperty:v36 forKey:@"Table"];
    [v5 addObject:v39];
  }

  return v5;
}

- (id)_addNewTableSpecifier
{
  id v3 = settingsLocString(@"ADD_NEW_BRAILLE_LANGUAGE_BUTTON", @"VoiceOverSettings");
  BOOL v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v3 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v4 setButtonAction:sel__addLanguage_];
  BOOL v5 = [(VoiceOverBrailleTableController *)self tableEnumerator];
  [v4 setProperty:v5 forKey:@"TableEnumerator"];

  uint64_t v6 = MEMORY[0x263EFFA88];
  [v4 setProperty:MEMORY[0x263EFFA88] forKey:@"IsAddingNewLanguage"];
  [v4 setProperty:v6 forKey:@"IsNewLanguage"];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__VoiceOverBrailleTableController__addNewTableSpecifier__block_invoke;
  v9[3] = &unk_2651F24D8;
  v9[4] = self;
  uint64_t v7 = (void *)MEMORY[0x24C53FB60](v9);
  [v4 setProperty:v7 forKey:@"DismissBlock"];

  [v4 setProperty:@"ADD_NEW_BRAILLE_LANGUAGE" forKey:*MEMORY[0x263F60138]];

  return v4;
}

uint64_t __56__VoiceOverBrailleTableController__addNewTableSpecifier__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  v2 = *(void **)(a1 + 32);

  return [v2 _manageEditButton];
}

- (void)_addLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_alloc_init(VoiceOverBrailleAllLanguagesController);
  [(VoiceOverBrailleAllLanguagesController *)v6 setModalPresentationStyle:2];
  [(VoiceOverBrailleAllLanguagesController *)v6 setSpecifier:v4];

  BOOL v5 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v6];
  [(VoiceOverBrailleTableController *)self presentViewController:v5 withTransition:8 completion:0];
}

- (void)_removeTableSpecifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v6 = *MEMORY[0x263F22BA0];
  uint64_t v7 = [v5 objectForKey:*MEMORY[0x263F22BA0]];

  v30 = v7;
  id v8 = (void *)[v7 mutableCopy];
  uint64_t v31 = v4;
  uint64_t v9 = [v4 propertyForKey:@"Table"];
  if ([v8 count])
  {
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = [v8 objectAtIndexedSubscript:v10];
      int v12 = [v11 objectForKeyedSubscript:@"RotorItem"];
      uint64_t v13 = [v9 identifier];
      int v14 = [v12 isEqualToString:v13];

      if (v14) {
        break;
      }

      if ([v8 count] <= (unint64_t)++v10) {
        goto LABEL_7;
      }
    }
    [v8 removeObjectAtIndex:v10];
  }
LABEL_7:
  uint64_t v15 = BRLLogTranslation();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v8;
    _os_log_impl(&dword_246A39000, v15, OS_LOG_TYPE_DEFAULT, "Setting new items after removing: %@", buf, 0xCu);
  }

  [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v8 forKey:v6];
  if (VOSCustomBrailleEnabled())
  {
    v16 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    uint64_t v17 = *MEMORY[0x263F22BB0];
    int v18 = [v16 objectForKey:*MEMORY[0x263F22BB0]];

    uint64_t v19 = [v9 identifier];
    int v20 = [v19 isEqualToString:v18];

    if (v20)
    {
      uint64_t v21 = [(VoiceOverBrailleTableController *)self _defaultTable];
      id v22 = [v21 identifier];
      [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v22 forKey:v17];
    }
    uint64_t v23 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    uint64_t v24 = *MEMORY[0x263F22B98];
    uint64_t v25 = [v23 objectForKey:*MEMORY[0x263F22B98]];

    v26 = [v9 identifier];
    int v27 = [v26 isEqualToString:v25];

    if (v27)
    {
      char v28 = [(VoiceOverBrailleTableController *)self _defaultTable];
      v29 = [v28 identifier];
      [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v29 forKey:v24];
    }
  }
  [(VoiceOverBrailleTableController *)self reloadSpecifiers];
}

- (id)_defaultTable
{
  id v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  id v4 = [v3 objectForKey:*MEMORY[0x263F22BA0]];

  uint64_t v5 = [v4 indexOfObjectPassingTest:&__block_literal_global_6];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [MEMORY[0x263F228D0] sharedInstance];
    uint64_t v7 = [v6 userLocale];

    id v8 = [(VoiceOverBrailleTableController *)self tableEnumerator];
    uint64_t v9 = [(id)objc_opt_class() defaultTableForLocale:v7];
  }
  else
  {
    uint64_t v7 = [v4 objectAtIndexedSubscript:v5];
    uint64_t v9 = VOSBrailleTableForRotorItem();
  }

  return v9;
}

uint64_t __48__VoiceOverBrailleTableController__defaultTable__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = [a2 objectForKeyedSubscript:@"Default"];
  uint64_t v6 = [v5 BOOLValue];

  if (v6) {
    *a4 = 1;
  }
  return v6;
}

- (void)_manageEditButton
{
  id v3 = [(VoiceOverBrailleTableController *)self _tableSpecifiers];
  unint64_t v4 = [v3 count];

  if (v4 < 2)
  {
    uint64_t v5 = [(VoiceOverBrailleTableController *)self navigationItem];
    [v5 setRightBarButtonItem:0];

    [(VoiceOverBrailleTableController *)self setEditing:0 animated:1];
  }
  else if (([*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) isEditing] & 1) == 0)
  {
    id v7 = (id)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:2 target:self action:sel__editPressed_];
    uint64_t v6 = [(VoiceOverBrailleTableController *)self navigationItem];
    [v6 setRightBarButtonItem:v7];
  }
}

- (void)_editPressed:(id)a3
{
  [(VoiceOverBrailleTableController *)self setEditing:1 animated:1];
  unint64_t v4 = [(VoiceOverBrailleTableController *)self table];
  [v4 reloadData];

  id v6 = (id)[objc_allocWithZone(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel__donePressed];
  uint64_t v5 = [(VoiceOverBrailleTableController *)self navigationItem];
  [v5 setRightBarButtonItem:v6];
}

- (void)_donePressed
{
  [(VoiceOverBrailleTableController *)self setEditing:0 animated:1];
  id v3 = [(VoiceOverBrailleTableController *)self table];
  [v3 reloadData];

  [(VoiceOverBrailleTableController *)self _manageEditButton];
}

- (void)setTableEnumerator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end