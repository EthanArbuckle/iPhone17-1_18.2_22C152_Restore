@interface TIKeyboardListController
+ (BOOL)showAddNewKeyboardButton;
+ (id)attributedStringForSymbolName:(id)a3;
+ (id)attributedTitleForSymbolName:(id)a3 cellTitle:(id)a4;
+ (id)availableInputModesForLanguage:(id)a3;
+ (id)availableSoftwareLayoutsForBaseInputMode:(id)a3;
+ (id)displayNameForHardwareLayout:(id)a3 inputMode:(id)a4;
+ (id)inputModes;
+ (id)keyboardDisplayNameForIdentifier:(id)a3;
+ (id)softwareLayoutsForBaseInputMode:(id)a3;
+ (id)supportedBaseInputModesForLanguage:(id)a3;
+ (id)supportedInputModesForLanguage:(id)a3;
+ (unint64_t)count;
+ (void)setInputModes:(id)a3;
- (BOOL)allKeyboardsEnabled;
- (BOOL)newKeyboardsAdded;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)tableViewClass;
- (NSMutableArray)keyboardsArray;
- (TIAboutKeyboardPrivacyController)aboutPrivacyController;
- (TIKeyboardListController)init;
- (id)specifierForExtensionInputMode:(id)a3;
- (id)specifierForInputMode:(id)a3;
- (id)specifierForMultilingualInputModes:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_writeKeyboards;
- (void)addNewKeyboards:(id)a3;
- (void)dealloc;
- (void)emitNavigationEventForKeyboardListController;
- (void)reloadSpecifiers;
- (void)removeInputModeWithIdentifier:(id)a3;
- (void)setAboutPrivacyController:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setNewKeyboardsAdded:(BOOL)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)updateEditButtonState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TIKeyboardListController

- (void)viewDidLoad
{
  v3 = (void *)[MEMORY[0x263F1C748] sharedInputModeController];
  if (objc_opt_respondsToSelector()) {
    [v3 setDisableFloatingKeyboardFilter:1];
  }
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardListController;
  [(TIKeyboardListController *)&v5 viewDidLoad];
  uint64_t v4 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v4) setEstimatedSectionHeaderHeight:0.0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v4) setEstimatedSectionFooterHeight:0.0];
}

- (Class)tableViewClass
{
  return (Class)objc_opt_class();
}

- (TIKeyboardListController)init
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardListController;
  v2 = [(TIKeyboardListController *)&v5 init];
  v2->_groupSeparator = (PSSpecifier *)(id)[MEMORY[0x263F5FC40] emptyGroupSpecifier];
  if ([(id)objc_opt_class() showAddNewKeyboardButton])
  {
    v3 = (PSSpecifier *)(id)objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ADD_NEW_KEYBOARD", &stru_26E29DC78, @"Keyboard"), v2, 0, 0, 0, 13, 0);
    v2->_addNewInputModeSpecifier = v3;
    [(PSSpecifier *)v3 setProperty:@"AddNewKeyboard" forKey:*MEMORY[0x263F60138]];
    [(PSSpecifier *)v2->_addNewInputModeSpecifier setButtonAction:sel_addNewKeyboards_];
  }
  objc_msgSend((id)-[TIKeyboardListController navigationItem](v2, "navigationItem"), "setRightBarButtonItem:", -[TIKeyboardListController editButtonItem](v2, "editButtonItem"));
  objc_msgSend((id)objc_msgSend((id)-[TIKeyboardListController navigationItem](v2, "navigationItem"), "rightBarButtonItem"), "setEnabled:", 0);
  return v2;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F1C748] sharedInputModeController];
  if (objc_opt_respondsToSelector()) {
    [v3 setDisableFloatingKeyboardFilter:0];
  }

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardListController;
  [(TIKeyboardListController *)&v4 dealloc];
}

- (BOOL)allKeyboardsEnabled
{
  return self->_totalKeyboardsCount == self->_numberOfEnabledKeyboards;
}

- (void)updateEditButtonState
{
  v2 = (void *)[(TIKeyboardListController *)self parentController];
  if (objc_opt_respondsToSelector())
  {
    [v2 setNeedsReloadSpecifiers:1];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardListController;
  -[TIKeyboardListController setEditing:animated:](&v15, sel_setEditing_animated_);
  if (!self->deletingRow) {
    objc_msgSend((id)-[TIKeyboardListController navigationItem](self, "navigationItem"), "setHidesBackButton:animated:", v5, 1);
  }
  BOOL deletingRow = self->deletingRow;
  if (v5)
  {
    uint64_t v8 = (int)*MEMORY[0x263F5FDD0];
    if (!self->deletingRow)
    {
      v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v8);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __48__TIKeyboardListController_setEditing_animated___block_invoke;
      v14[3] = &unk_264A00E58;
      v14[4] = self;
      [v9 addEditingChangeHandler:v14];
    }
    v10 = (id *)((char *)&self->super.super.super.super.super.isa + v8);
  }
  else
  {
    v10 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]);
    id v11 = *v10;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__TIKeyboardListController_setEditing_animated___block_invoke_2;
    v12[3] = &unk_264A00FF0;
    v12[4] = self;
    BOOL v13 = deletingRow;
    [v11 addEditingChangeHandler:v12];
  }
  [*v10 setEditing:v5 animated:v4];
}

void *__48__TIKeyboardListController_setEditing_animated___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[176])
  {
    [result removeSpecifier:result[175] animated:1];
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = v3[176];
    return (void *)[v3 removeSpecifier:v4 animated:1];
  }
  return result;
}

uint64_t __48__TIKeyboardListController_setEditing_animated___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) allKeyboardsEnabled] & 1) == 0 && !*(unsigned char *)(a1 + 40))
  {
    v2 = *(void **)(a1 + 32);
    if (v2[176])
    {
      [v2 addSpecifier:v2[175] animated:1];
      [*(id *)(a1 + 32) addSpecifier:*(void *)(*(void *)(a1 + 32) + 1408) animated:1];
    }
  }
  char v3 = [*(id *)(a1 + 32) isEditing];
  uint64_t v4 = *(void **)(a1 + 32);
  BOOL v5 = (v3 & 1) != 0 || v4[179] > 1uLL;
  v6 = objc_msgSend((id)objc_msgSend(v4, "navigationItem"), "rightBarButtonItem");

  return [v6 setEnabled:v5];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  if ([a4 section]) {
    return 0;
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "cellForRowAtIndexPath:", a4), "specifier");
  [v8 propertyForKey:*MEMORY[0x263F60138]];
  return ([(id)TIInputModeGetNormalizedIdentifier() isEqualToString:@"emoji"] & 1) != 0
      || self->_numberOfEnabledKeyboards - self->_emojiEnabled > 1;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  self->BOOL deletingRow = 1;
  [(TIKeyboardListController *)self setEditing:1 animated:1];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  if ([(TIKeyboardListController *)self isEditing] && self->deletingRow) {
    [(TIKeyboardListController *)self setEditing:0 animated:1];
  }
  self->BOOL deletingRow = 0;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  if (objc_msgSend(a4, "section", a3)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TIKeyboardListController.m", 277, @"Row moved from invalid section.");
  }
  if ([a5 section]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TIKeyboardListController.m", 278, @"Row moved to an invalid section.");
  }
  uint64_t v9 = [a4 row] + 1;
  uint64_t v10 = [a5 row] + 1;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v12 = (int)*MEMORY[0x263F5FDB8];
  [v11 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.isa + v12)];
  BOOL v13 = (void *)[v11 objectAtIndex:v9];
  id v14 = v13;
  [v11 removeObject:v13];
  [v11 insertObject:v13 atIndex:v10];

  *(Class *)((char *)&self->super.super.super.super.super.isa + v12) = (Class)v11;

  [(TIKeyboardListController *)self _writeKeyboards];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = (void *)[a3 cellForRowAtIndexPath:a4];
  return [v4 accessoryType] || objc_msgSend(v4, "type") == 13;
}

- (id)specifierForInputMode:(id)a3
{
  BOOL v5 = objc_opt_class();
  if (objc_msgSend((id)objc_msgSend(v5, "availableSoftwareLayoutsForBaseInputMode:", TIInputModeGetNormalizedIdentifier()), "count")|| (TIInputModeIsChineseShuangpin() & 1) != 0|| TIInputModeIsChineseWubi())
  {
    v6 = (void *)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
  }
  else
  {
    v6 = (void *)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:3 edit:0];
  }
  v7 = v6;
  [v6 setProperty:a3 forKey:*MEMORY[0x263F60138]];
  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  return v7;
}

- (id)specifierForMultilingualInputModes:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
  uint64_t v5 = [a3 firstObject];
  [v4 setProperty:v5 forKey:*MEMORY[0x263F60138]];
  [v4 setProperty:a3 forKey:*MEMORY[0x263F60308]];
  [v4 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  return v4;
}

- (id)specifierForExtensionInputMode:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v5 setProperty:a3 forKey:*MEMORY[0x263F60138]];
  [v5 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  v6 = (void *)[MEMORY[0x263F1C740] keyboardInputModeWithIdentifier:a3];
  v24[0] = v6;
  objc_msgSend(v5, "setProperty:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v24, 1), @"TIKBIdentifiersKey");
  v7 = (void *)[MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "extensionInputModes");
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "containingBundle"), "bundlePath"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v6, "containingBundle"), "bundlePath")))objc_msgSend(v7, "addObject:", v13); {
      }
        }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  [v5 setProperty:v7 forKey:@"TIKBAllIdentifiersKey"];
  id v14 = (void *)[v6 containingBundle];
  uint64_t v15 = [v14 objectForInfoDictionaryKey:*MEMORY[0x263EFFA90]];
  if (!v15)
  {
    v16 = (void *)[v6 containingBundle];
    uint64_t v15 = [v16 objectForInfoDictionaryKey:*MEMORY[0x263EFFB68]];
  }
  [v5 setProperty:v15 forKey:*MEMORY[0x263F602D0]];
  v17 = objc_alloc_init(TIAddExtensionKeyboardController);
  [(TIAddExtensionKeyboardController *)v17 setParentController:self];
  [(TIAddExtensionKeyboardController *)v17 setSpecifier:v5];
  [v5 setTarget:self];
  if (objc_msgSend(-[TIAddExtensionKeyboardController specifiers](v17, "specifiers"), "count"))
  {
    [v5 setDetailControllerClass:objc_opt_class()];
    [v5 setCellType:2];
  }
  return v5;
}

- (void)reloadSpecifiers
{
  if (self->_newKeyboardsAdded)
  {
    [(TIKeyboardListController *)self updateEditButtonState];
    self->_newKeyboardsAdded = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardListController;
  [(TIKeyboardListController *)&v4 reloadSpecifiers];
  BOOL v3 = ([(TIKeyboardListController *)self isEditing] & 1) != 0 || self->_numberOfEnabledKeyboards > 1;
  objc_msgSend((id)objc_msgSend((id)-[TIKeyboardListController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", v3);
}

- (id)specifiers
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v21 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (v21) {
    return v21;
  }
  uint64_t v17 = (int)*MEMORY[0x263F5FDB8];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  -[TIKeyboardListController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"KEYBOARDS_SHORT", &stru_26E29DC78, @"Keyboard"));
  long long v21 = v3;
  uint64_t v16 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  objc_msgSend(v3, "addObject:");
  keyboardsArray = self->_keyboardsArray;
  if (keyboardsArray) {

  }
  self->_keyboardsArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  self->_emojiEnabled = 0;
  self->_numberOfEnabledKeyboards = 0;
  self->_totalKeyboardsCount = [(id)UIKeyboardGetSupportedInputModes() count];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "_clearAllExtensionsIfNeeded");
  id obj = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers");
  uint64_t v5 = 0;
  if (_os_feature_enabled_impl()) {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v6)
  {
    char v18 = 0;
    goto LABEL_30;
  }
  uint64_t v7 = v6;
  long long v19 = (void *)v5;
  char v18 = 0;
  uint64_t v8 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
      if (_os_feature_enabled_impl()
        && (id v11 = TIUIGetMultilingualIDFromInputMode(), [v11 length]))
      {
        if ([v19 containsObject:v11]) {
          continue;
        }
        [v19 addObject:v11];
        id MultilingualSetFromInputModes = TIUIInputModeGetMultilingualSetFromInputModes(v10, obj);
      }
      else
      {
        id MultilingualSetFromInputModes = 0;
      }
      [(NSMutableArray *)self->_keyboardsArray addObject:v10];
      NormalizedIdentifier = (void *)TIInputModeGetNormalizedIdentifier();
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "identifierIsValidSystemInputMode:", NormalizedIdentifier))
      {
        if (_os_feature_enabled_impl()
          && (unint64_t)[MultilingualSetFromInputModes count] >= 2)
        {
          id v14 = [(TIKeyboardListController *)self specifierForMultilingualInputModes:MultilingualSetFromInputModes];
        }
        else
        {
          id v14 = [(TIKeyboardListController *)self specifierForInputMode:v10];
        }
        [v21 addObject:v14];
        if ([NormalizedIdentifier isEqualToString:@"emoji"]) {
          self->_emojiEnabled = 1;
        }
      }
      else
      {
        if (![MEMORY[0x263F1C740] keyboardInputModeWithIdentifier:v10]) {
          continue;
        }
        objc_msgSend(v21, "addObject:", -[TIKeyboardListController specifierForExtensionInputMode:](self, "specifierForExtensionInputMode:", v10));
        char v18 = 1;
      }
      ++self->_numberOfEnabledKeyboards;
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v7);
LABEL_30:
  if ((self->deletingRow || ([(TIKeyboardListController *)self isEditing] & 1) == 0)
    && ![(TIKeyboardListController *)self allKeyboardsEnabled]
    && self->_addNewInputModeSpecifier)
  {
    [v21 addObject:self->_groupSeparator];
    [v21 addObject:self->_addNewInputModeSpecifier];
  }
  if (v18)
  {
    if ([(TIKeyboardListController *)self aboutPrivacyController]) {
      [(TIAboutKeyboardPrivacyController *)[(TIKeyboardListController *)self aboutPrivacyController] setSpecifier:v16];
    }
    else {
      [(TIKeyboardListController *)self setAboutPrivacyController:[[TIAboutKeyboardPrivacyController alloc] initWithGroupSpecifier:v16 asHeader:0 inListController:self]];
    }
  }
  *(Class *)((char *)&self->super.super.super.super.super.isa + v17) = (Class)v21;
  return v21;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  uint64_t v7 = [(TIKeyboardListController *)self aboutPrivacyController];

  [(TIAboutKeyboardPrivacyController *)v7 addPrivacyLinkViewIfNecessaryToHeaderView:a4 forSection:a5];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardListController;
  id v6 = -[TIKeyboardListController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3);
  uint64_t v7 = (void *)[(TIKeyboardListController *)self specifierAtIndex:[(TIKeyboardListController *)self indexForIndexPath:a4]];
  objc_msgSend(v6, "setAccessibilityIdentifier:", objc_msgSend(v7, "propertyForKey:", *MEMORY[0x263F60138]));
  return v6;
}

- (void)addNewKeyboards:(id)a3
{
  uint64_t v5 = objc_alloc_init(TIAddKeyboardLanguageListSetupController);
  [(PSSetupController *)v5 setParentController:self];
  [(PSRootController *)v5 setSpecifier:a3];
  [a3 setTarget:self];

  [(TIKeyboardListController *)self showController:v5];
}

- (void)_writeKeyboards
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v21 = (void *)[MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    uint64_t v7 = *MEMORY[0x263F60138];
    unint64_t v8 = 0x26869B000uLL;
    objc_super v9 = "TextInputCore";
    uint64_t v10 = "multilingual_keyboard";
    do
    {
      uint64_t v11 = 0;
      uint64_t v20 = v5;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v11), "propertyForKey:", v7, v20);
        if ([*(id *)((char *)&self->super.super.super.super.super.isa + *(int *)(v8 + 4016)) containsObject:v12])
        {
          if (_os_feature_enabled_impl())
          {
            uint64_t v13 = v7;
            uint64_t v14 = v6;
            unint64_t v15 = v8;
            uint64_t v16 = v3;
            uint64_t v17 = v10;
            char v18 = v9;
            id MultilingualSet = TIUIInputModeGetMultilingualSet(v12);
            if ((unint64_t)[MultilingualSet count] < 2) {
              [v21 addObject:v12];
            }
            else {
              [v21 addObjectsFromArray:MultilingualSet];
            }
            objc_super v9 = v18;
            uint64_t v10 = v17;
            id v3 = v16;
            unint64_t v8 = v15;
            uint64_t v6 = v14;
            uint64_t v7 = v13;
            uint64_t v5 = v20;
          }
          else
          {
            [v21 addObject:v12];
          }
        }
        ++v11;
      }
      while (v5 != v11);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }
  [(id)objc_opt_class() setInputModes:v21];
  if ([(TIKeyboardListController *)self allKeyboardsEnabled])
  {
    if (self->_addNewInputModeSpecifier)
    {
      [(TIKeyboardListController *)self removeSpecifier:self->_groupSeparator animated:1];
      [(TIKeyboardListController *)self removeSpecifier:self->_addNewInputModeSpecifier animated:1];
    }
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    uint64_t v6 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]), "objectAtIndex:", objc_msgSend(a5, "row", a3) + 1);
    -[TIKeyboardListController removeInputModeWithIdentifier:](self, "removeInputModeWithIdentifier:", [v6 propertyForKey:*MEMORY[0x263F60138]]);
    [(TIKeyboardListController *)self removeSpecifier:v6 animated:1];
    [(TIKeyboardListController *)self updateEditButtonState];
    if ([(TIKeyboardListController *)self isEditing] && self->_numberOfEnabledKeyboards == 1)
    {
      [(TIKeyboardListController *)self setEditing:0 animated:1];
    }
    else
    {
      [(TIKeyboardListController *)self reloadSpecifiers];
    }
  }
}

- (void)removeInputModeWithIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3)
  {
    -[NSMutableArray removeObject:](self->_keyboardsArray, "removeObject:");
    --self->_numberOfEnabledKeyboards;
    [(TIKeyboardListController *)self _writeKeyboards];
    uint64_t NormalizedIdentifier = TIInputModeGetNormalizedIdentifier();
    if (NormalizedIdentifier)
    {
      uint64_t v5 = NormalizedIdentifier;
      uint64_t v6 = (void *)[MEMORY[0x263F7E6C8] sharedPreferencesController];
      uint64_t v7 = *MEMORY[0x263F7E800];
      id v8 = (id)objc_msgSend((id)objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x263F7E800]), "mutableCopy");
      if (v8)
      {
        objc_super v9 = v8;
        uint64_t v10 = (void *)[MEMORY[0x263EFF980] array];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v9);
              }
              uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
              [v9 objectForKey:v15];
              if ([(id)TIInputModeGetNormalizedIdentifier() isEqualToString:v5]) {
                [v10 addObject:v15];
              }
            }
            uint64_t v12 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v12);
        }
        [v9 removeObjectsForKeys:v10];
        if ([v9 count]) {
          uint64_t v16 = v9;
        }
        else {
          uint64_t v16 = 0;
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E6C8], "sharedPreferencesController"), "setValue:forPreferenceKey:", v16, v7);
      }
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardListController;
  [(TIKeyboardListController *)&v5 viewWillAppear:a3];
  [(TIKeyboardListController *)self reloadSpecifiers];
  uint64_t v4 = (void *)[MEMORY[0x263F7E568] sharedManager];
  [v4 addListener:self];
  [v4 startMonitoringAssetUpdateStatusForInputModes:UIKeyboardGetActiveInputModes()];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardListController;
  [(TIKeyboardListController *)&v4 viewDidAppear:a3];
  [(TIKeyboardListController *)self emitNavigationEventForKeyboardListController];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E568], "sharedManager"), "removeListener:", self);
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardListController;
  [(TIKeyboardListController *)&v5 viewWillDisappear:v3];
}

+ (unint64_t)count
{
  if (_os_feature_enabled_impl())
  {
    return TIUIGetCountOfUserVisibleInputModes();
  }
  else
  {
    objc_super v4 = (void *)[a1 inputModes];
    return [v4 count];
  }
}

+ (id)inputModes
{
  v2 = (void *)[MEMORY[0x263F1C748] sharedInputModeController];

  return (id)[v2 enabledInputModeIdentifiers];
}

+ (void)setInputModes:(id)a3
{
  objc_super v4 = (void *)[MEMORY[0x263F1C738] sharedInstance];
  [v4 saveInputModesPreference:a3];

  [v4 setShouldUpdateCacheOnInputModesChange:1];
}

+ (id)supportedBaseInputModesForLanguage:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "_clearAllExtensions");
  objc_super v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7E570], "sharedInputModeController"), "supportedInputModeIdentifiers");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__TIKeyboardListController_supportedBaseInputModesForLanguage___block_invoke;
  v6[3] = &unk_264A00FB8;
  v6[4] = a3;
  return (id)objc_msgSend(v4, "objectsAtIndexes:", objc_msgSend(v4, "indexesOfObjectsPassingTest:", v6));
}

uint64_t __63__TIKeyboardListController_supportedBaseInputModesForLanguage___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isEqualToString:*(void *)(a1 + 32)]) {
    return 1;
  }
  LanguageWithRegion = (void *)TIInputModeGetLanguageWithRegion();
  uint64_t v5 = *(void *)(a1 + 32);

  return [LanguageWithRegion isEqualToString:v5];
}

+ (id)softwareLayoutsForBaseInputMode:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  SupportedSoftwareKeyboardsForInputMode = (void *)UIKeyboardGetSupportedSoftwareKeyboardsForInputMode();
  if (([a3 isEqualToString:@"ja_JP-Kana"] & 1) != 0
    || [a3 isEqualToString:@"ja_JP"])
  {
    uint64_t v5 = [SupportedSoftwareKeyboardsForInputMode firstObject];
    if (v5)
    {
      v7[0] = v5;
      return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    }
    return SupportedSoftwareKeyboardsForInputMode;
  }
  if (!TIInputModeIsChineseShuangpin()) {
    return SupportedSoftwareKeyboardsForInputMode;
  }

  return TIFilteredLayoutsByCurrentShuangpinType(SupportedSoftwareKeyboardsForInputMode);
}

+ (id)supportedInputModesForLanguage:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = a1;
  id obj = (id)[a1 supportedBaseInputModesForLanguage:a3];
  uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v6;
        uint64_t v7 = *(void *)(*((void *)&v25 + 1) + 8 * v6);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v8 = (void *)[v18 softwareLayoutsForBaseInputMode:v7];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(__CFString **)(*((void *)&v21 + 1) + 8 * i);
              if ([(__CFString *)v13 hasPrefix:@"Kana"]) {
                uint64_t v13 = @"Kana";
              }
              objc_msgSend((id)objc_msgSend((id)TIInputModeGetComponentsFromIdentifier(), "mutableCopy"), "setObject:forKey:", v13, @"sw");
              uint64_t IdentifierFromComponents = UIKeyboardInputModeGetIdentifierFromComponents();
              if (([v5 containsObject:IdentifierFromComponents] & 1) == 0) {
                [v5 addObject:IdentifierFromComponents];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v10);
        }
        uint64_t v6 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }
  return v5;
}

+ (id)availableInputModesForLanguage:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers");
  id v6 = (id)objc_msgSend((id)objc_msgSend(a1, "supportedInputModesForLanguage:", a3), "mutableCopy");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        if (!_os_feature_enabled_impl()
          || (unint64_t)[TIUIInputModeGetMultilingualSet(v11) count] <= 1)
        {
          id v12 = (id)[(id)TIInputModeGetComponentsFromIdentifier() mutableCopy];
          [v12 removeObjectForKey:@"hw"];
          if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"sw"), "hasPrefix:", @"Kana"))objc_msgSend(v12, "setObject:forKey:", @"Kana", @"sw"); {
          [v6 removeObject:UIKeyboardInputModeGetIdentifierFromComponents()];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  return v6;
}

+ (id)availableSoftwareLayoutsForBaseInputMode:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = (id)[(id)UIKeyboardGetSupportedSoftwareKeyboardsForInputMode() mutableCopy];
  if (TIInputModeIsChineseShuangpin()) {
    id v4 = (id)[TIFilteredLayoutsByCurrentShuangpinType(v4) mutableCopy];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  id v5 = +[TIKeyboardListController inputModes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([a3 isEqualToString:TIInputModeGetNormalizedIdentifier()])
        {
          uint64_t v10 = (void *)[(id)TIInputModeGetComponentsFromIdentifier() objectForKey:@"sw"];
          if ([a3 hasPrefix:@"ja_JP"]
            && ([v10 _containsSubstring:@"Kana"] & 1) != 0)
          {
            [v4 removeAllObjects];
            return v4;
          }
          [v4 removeObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v4;
}

+ (id)keyboardDisplayNameForIdentifier:(id)a3
{
  return (id)TUIKeyboardDisplayNameFromIdentifier();
}

+ (id)displayNameForHardwareLayout:(id)a3 inputMode:(id)a4
{
  id v5 = a3;
  if ([a3 isEqualToString:@"Automatic"])
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Automatic", &stru_26E29DC78, @"KeyboardLayouts");
    id v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "hardwareLayoutToUseForInputMode:", a4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)displayNameForHardwareLayout_inputMode____keyboardLayoutsBundle;
  if (displayNameForHardwareLayout_inputMode____keyboardLayoutsBundle
    || (uint64_t v8 = (void *)[(id)MEMORY[0x230FB48C0]() stringByAppendingPathComponent:@"System/Library/KeyboardLayouts/USBKeyboardLayouts.bundle"], v7 = (id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithPath:", objc_msgSend(v8, "stringByResolvingSymlinksInPath")), (displayNameForHardwareLayout_inputMode____keyboardLayoutsBundle = (uint64_t)v7) != 0)|| (NSLog(&cfstr_SErrorCouldNot.isa, "+[TIKeyboardListController displayNameForHardwareLayout:inputMode:]", v8), (v7 = (id)displayNameForHardwareLayout_inputMode____keyboardLayoutsBundle) != 0))
  {
    id v5 = (id)[v7 localizedStringForKey:v5 value:0 table:@"InfoPlist"];
    if (v6) {
      return (id)[NSString localizedStringWithFormat:objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"%@ — %@", &stru_26E29DC78, @"Automatic - <Resolved Keyboard Layout Name>", v6, v5];
    }
  }
  else if (v6)
  {
    return v6;
  }
  return v5;
}

+ (id)attributedTitleForSymbolName:(id)a3 cellTitle:(id)a4
{
  v15[3] = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(MEMORY[0x263F089B8]);
  if (a3)
  {
    uint64_t v7 = [(id)objc_opt_class() attributedStringForSymbolName:a3];
    if (v7)
    {
      uint64_t v8 = v7;
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "userInterfaceLayoutDirection") == 1) {
        objc_msgSend(v6, "appendAttributedString:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F086A0]), "initWithString:", @"\u200F"));
      }
      objc_msgSend(v6, "appendAttributedString:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F086A0]), "initWithString:", @"\t⁨"));
      [v6 appendAttributedString:v8];
      objc_msgSend(v6, "appendAttributedString:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F086A0]), "initWithString:", @"⁩\t"));
    }
  }
  objc_msgSend(v6, "appendAttributedString:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F086A0]), "initWithString:", a4));
  id v9 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C358], "defaultParagraphStyle"), "mutableCopy");
  id v10 = objc_alloc(MEMORY[0x263F1C388]);
  uint64_t v11 = MEMORY[0x263EFFA78];
  v15[0] = (id)[v10 initWithTextAlignment:4 location:MEMORY[0x263EFFA78] options:0.0];
  v15[1] = (id)[objc_alloc(MEMORY[0x263F1C388]) initWithTextAlignment:1 location:v11 options:10.0];
  v15[2] = (id)[objc_alloc(MEMORY[0x263F1C388]) initWithTextAlignment:4 location:v11 options:28.0];
  objc_msgSend(v9, "setTabStops:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v15, 3));
  uint64_t v13 = *MEMORY[0x263F1C268];
  id v14 = v9;
  objc_msgSend(v6, "addAttributes:range:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1), 0, objc_msgSend(v6, "length"));
  return v6;
}

+ (id)attributedStringForSymbolName:(id)a3
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:a3];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "systemImageNamed:", a3), "imageWithRenderingMode:", 2);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  id v7 = (id)[objc_alloc(MEMORY[0x263F1C370]) initWithData:0 ofType:0];
  [v7 setImage:v6];
  if (![v7 image]) {
    return v4;
  }
  uint64_t v8 = (void *)MEMORY[0x263F086A0];

  return (id)[v8 attributedStringWithAttachment:v7];
}

+ (BOOL)showAddNewKeyboardButton
{
  return 1;
}

- (void)emitNavigationEventForKeyboardListController
{
  void v7[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/Keyboard/KEYBOARDS"];
  id v4 = +[KeyboardController localizedStringForGeneralKeyboardSpecifier];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v6 = [MEMORY[0x263EFF960] currentLocale];
  v7[0] = v4;
  -[TIKeyboardListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", @"com.apple.graphic-icon.keyboard", objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", @"KEYBOARDS_SHORT", @"Keyboard", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "bundleURL")), objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v7, 2), v3);
}

- (NSMutableArray)keyboardsArray
{
  return self->_keyboardsArray;
}

- (BOOL)newKeyboardsAdded
{
  return self->_newKeyboardsAdded;
}

- (void)setNewKeyboardsAdded:(BOOL)a3
{
  self->_newKeyboardsAdded = a3;
}

- (TIAboutKeyboardPrivacyController)aboutPrivacyController
{
  return self->_aboutPrivacyController;
}

- (void)setAboutPrivacyController:(id)a3
{
}

@end