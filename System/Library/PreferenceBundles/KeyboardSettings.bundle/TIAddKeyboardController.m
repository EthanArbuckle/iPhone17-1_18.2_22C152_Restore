@interface TIAddKeyboardController
+ (BOOL)shouldAddInputMode:(id)a3 toEnabledInputModes:(id)a4;
+ (BOOL)shouldShowAddKeyboardControllerForInputModes:(id)a3;
- (BOOL)showsMonolingualOption;
- (BOOL)supportsMultilingual;
- (NSArray)proposedMultilingualInputModes;
- (NSString)koreanEnglishBilingualInputModeIdentifier;
- (id)keyboardTypeSpecifiers;
- (id)koreanEnglishBilingualInputModeIdentifier:(id)a3 enabledInputModes:(id)a4;
- (id)monolingualSpecifiers;
- (id)multilingualSpecifiers;
- (id)newSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)addCheckedInputModes;
- (void)cancelButtonTapped;
- (void)doneButtonTapped;
- (void)enableMonolingualKeyboards:(id)a3;
- (void)enableMultilingualKeyboards:(id)a3;
- (void)setKoreanEnglishBilingualInputModeIdentifier:(id)a3;
- (void)setProposedMultilingualInputModes:(id)a3;
- (void)setShowsMonolingualOption:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)toggleInputMode:(id)a3;
- (void)toggleMultilingualInputMode:(id)a3;
- (void)updateDoneButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TIAddKeyboardController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)TIAddKeyboardController;
  [(TIAddKeyboardController *)&v4 viewDidLoad];
  uint64_t v3 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionHeaderHeight:0.0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionFooterHeight:0.0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TIAddKeyboardController;
  [(TIAddKeyboardController *)&v7 viewWillAppear:a3];
  objc_super v4 = (void *)[(TIAddKeyboardController *)self navigationItem];
  v5 = (void *)[(TIAddKeyboardController *)self specifier];
  objc_msgSend(v4, "setTitle:", objc_msgSend(v5, "propertyForKey:", *MEMORY[0x263F602D0]));
  objc_msgSend(v4, "setRightBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C468]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped));
  objc_msgSend((id)objc_msgSend(v4, "rightBarButtonItem"), "setEnabled:", 0);
  v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel_doneButtonTapped name:*MEMORY[0x263F1D0D8] object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIAddKeyboardController;
  [(TIAddKeyboardController *)&v4 viewDidAppear:a3];
  [(TIAddKeyboardController *)self updateDoneButton];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)TIAddKeyboardController;
  [(TIAddKeyboardController *)&v5 viewDidDisappear:v3];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    id result = [(TIAddKeyboardController *)self newSpecifiers];
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

+ (BOOL)shouldAddInputMode:(id)a3 toEnabledInputModes:(id)a4
{
  return ![(id)TIInputModeGetLanguageWithRegion() isEqualToString:@"ja_JP"]
      || ![(id)TIInputModeGetVariant() hasPrefix:@"Kana"]
      || objc_msgSend((id)objc_msgSend(a4, "indexesOfObjectsPassingTest:", &__block_literal_global_3), "count") == 0;
}

uint64_t __66__TIAddKeyboardController_shouldAddInputMode_toEnabledInputModes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [(id)TIInputModeGetLanguageWithRegion() isEqualToString:@"ja_JP"];
  if (result)
  {
    uint64_t result = [(id)TIInputModeGetVariant() hasPrefix:@"Kana"];
    if (result)
    {
      uint64_t result = 1;
      *a4 = 1;
    }
  }
  return result;
}

+ (BOOL)shouldShowAddKeyboardControllerForInputModes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v4 = _os_feature_enabled_impl();
  [a3 firstObject];
  char v5 = TIGetAddKeyboardUsesPickerForInputMode();
  LOBYTE(v6) = v4 | v5;
  if (v4)
  {
    if ((v5 & 1) == 0)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(a3);
            }
            NormalizedIdentifier = (void *)TIInputModeGetNormalizedIdentifier();
            if (objc_msgSend(TIUIGetProposedMultilingualSetsForAddingInputMode(NormalizedIdentifier, objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers")), "count"))
            {
              LOBYTE(v6) = 1;
              return v6;
            }
          }
          uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
          LOBYTE(v6) = 0;
          if (v7) {
            continue;
          }
          break;
        }
      }
    }
  }
  return v6;
}

- (void)setSpecifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)TIAddKeyboardController;
  [(TIAddKeyboardController *)&v17 setSpecifier:a3];
  int v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers");
  char v5 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) propertyForKey:*MEMORY[0x263F60138]];
  if (_os_feature_enabled_impl())
  {
    id v7 = +[TIKeyboardListController supportedBaseInputModesForLanguage:v6];
    if (_os_feature_enabled_impl())
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(v5, "addObjectsFromArray:", TIUIGetProposedMultilingualSetsForAddingInputMode(*(void **)(*((void *)&v13 + 1) + 8 * v11++), v4));
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        }
        while (v9);
      }
    }
  }
  if (_os_feature_enabled_impl()) {
    id v12 = [(TIAddKeyboardController *)self koreanEnglishBilingualInputModeIdentifier:v6 enabledInputModes:v4];
  }
  else {
    id v12 = 0;
  }
  [(TIAddKeyboardController *)self setProposedMultilingualInputModes:v5];
  [(TIAddKeyboardController *)self setKoreanEnglishBilingualInputModeIdentifier:v12];
}

- (id)newSpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(TIAddKeyboardController *)self supportsMultilingual]
    && (objc_msgSend(v3, "addObjectsFromArray:", -[TIAddKeyboardController keyboardTypeSpecifiers](self, "keyboardTypeSpecifiers")), !-[TIAddKeyboardController showsMonolingualOption](self, "showsMonolingualOption")))
  {
    if ([(NSArray *)[(TIAddKeyboardController *)self proposedMultilingualInputModes] count] < 2)return v3; {
    id v4 = [(TIAddKeyboardController *)self multilingualSpecifiers];
    }
  }
  else
  {
    id v4 = [(TIAddKeyboardController *)self monolingualSpecifiers];
  }
  [v3 addObjectsFromArray:v4];
  return v3;
}

- (id)keyboardTypeSpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = (void *)[MEMORY[0x263F5FC40] groupSpecifierWithID:0 name:&stru_26E29DC78];
  [v3 addObject:v4];
  if ([(TIAddKeyboardController *)self koreanEnglishBilingualInputModeIdentifier])
  {
    if (![(TIAddKeyboardController *)self showsMonolingualOption])
    {
      id v5 = +[TIKeyboardListController keyboardDisplayNameForIdentifier:@"ko_KR"];
      objc_msgSend(v4, "setProperty:forKey:", objc_msgSend(NSString, "localizedStringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MULTILINGUAL_KEYBOARD_ADD_FOOTER", &stru_26E29DC78, @"Keyboard"), v5), *MEMORY[0x263F600F8]);
    }
    id v6 = +[TIKeyboardListController keyboardDisplayNameForIdentifier:@"en"];
    id v7 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(NSString, "localizedStringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MULTILINGUAL_KEYBOARD_ADD_TITLE_WITH_LANGUAGE", &stru_26E29DC78, @"Keyboard"), v6), self, 0, 0, 0, 3, 0);
    [v7 setButtonAction:sel_enableMultilingualKeyboards_];
    uint64_t v8 = [(TIAddKeyboardController *)self koreanEnglishBilingualInputModeIdentifier];
    uint64_t v9 = *MEMORY[0x263F60138];
    goto LABEL_10;
  }
  if ([(NSArray *)[(TIAddKeyboardController *)self proposedMultilingualInputModes] count] > 1)
  {
    id v7 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MULTILINGUAL_KEYBOARD_ADD_TITLE", &stru_26E29DC78, @"Keyboard"), self, 0, 0, 0, 3, 0);
    [v7 setButtonAction:sel_enableMultilingualKeyboards_];
    uint64_t v9 = *MEMORY[0x263F60138];
    uint64_t v8 = @"Multilingual";
LABEL_10:
    [v7 setProperty:v8 forKey:v9];
    [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    goto LABEL_11;
  }
  id v10 = [(NSArray *)[(TIAddKeyboardController *)self proposedMultilingualInputModes] firstObject];
  if (![(TIAddKeyboardController *)self showsMonolingualOption])
  {
    id MultilingualSet = TIUIProposedInputModeGetMultilingualSet(v10);
    id v13 = TIUIGetLocalizedConcatenatedLanguageNamesForInputModesWithStyle(MultilingualSet, 0);
    objc_msgSend(v4, "setProperty:forKey:", objc_msgSend(NSString, "localizedStringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MULTILINGUAL_KEYBOARD_ADD_FOOTER", &stru_26E29DC78, @"Keyboard"), v13), *MEMORY[0x263F600F8]);
  }
  Current = (void *)TIUIProposedInputModeGetCurrent(v10, v11);
  id v15 = TIUIGetLocalizedConcatenatedLanguageNamesForInputModesWithStyle(Current, 0);
  id v7 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(NSString, "localizedStringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MULTILINGUAL_KEYBOARD_ADD_TITLE_WITH_LANGUAGE", &stru_26E29DC78, @"Keyboard"), v15), self, 0, 0, 0, 3, 0);
  [v7 setButtonAction:sel_enableMultilingualKeyboards_];
  [v7 setProperty:v10 forKey:*MEMORY[0x263F60308]];
  uint64_t v9 = *MEMORY[0x263F60138];
  [v7 setProperty:@"Multilingual" forKey:*MEMORY[0x263F60138]];
  [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  [v7 setUserInfo:&unk_26E2A7210];
LABEL_11:
  [v3 addObject:v7];
  long long v16 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ADD_MONOLINGUAL_KEYBOARD_TITLE", &stru_26E29DC78, @"Keyboard"), self, 0, 0, 0, 3, 0);
  [v16 setButtonAction:sel_enableMonolingualKeyboards_];
  [v16 setProperty:@"Monolingual" forKey:v9];
  [v3 addObject:v16];
  return v3;
}

- (id)multilingualSpecifiers
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MULTILINGUAL_KEYBOARD_TITLE", &stru_26E29DC78, @"Keyboard"), self, 0, 0, 0, 0, 0));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = self;
  obj = [(TIAddKeyboardController *)self proposedMultilingualInputModes];
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v19;
    uint64_t v8 = *MEMORY[0x263F60138];
    uint64_t v9 = *MEMORY[0x263F60308];
    uint64_t v10 = *MEMORY[0x263F5FEF8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        Current = (void *)TIUIProposedInputModeGetCurrent(v12, v5);
        long long v14 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", TIUIGetLocalizedConcatenatedLanguageNamesForInputModesWithStyle(Current, 0), v3, 0, 0, 0, 3, 0);
        [v14 setButtonAction:sel_toggleMultilingualInputMode_];
        [v14 setProperty:@"Multilingual" forKey:v8];
        [v14 setProperty:v12 forKey:v9];
        [v14 setProperty:MEMORY[0x263EFFA88] forKey:v10];
        [v14 setUserInfo:&unk_26E2A7238];
        [v17 addObject:v14];
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  return v17;
}

- (id)monolingualSpecifiers
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v26 = *MEMORY[0x263F60138];
  id obj = +[TIKeyboardListController supportedBaseInputModesForLanguage:](TIKeyboardListController, "supportedBaseInputModesForLanguage:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]), "propertyForKey:"));
  if ([(TIAddKeyboardController *)self supportsMultilingual]) {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MONOLINGUAL_KEYBOARD_TITLE", &stru_26E29DC78, @"Keyboard");
  }
  else {
    uint64_t v3 = 0;
  }
  objc_msgSend(v27, "addObject:", objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v3, self, 0, 0, 0, 0, 0));
  unint64_t v29 = [obj count];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v23 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v41;
    uint64_t v4 = *MEMORY[0x263EFF568];
    uint64_t v25 = *MEMORY[0x263F600A8];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(obj);
        }
        id v32 = +[TIKeyboardListController softwareLayoutsForBaseInputMode:*(void *)(*((void *)&v40 + 1) + 8 * v5)];
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers");
        uint64_t v6 = (void *)UIKeyboardInputModesMatchingMode();
        uint64_t v24 = v5;
        v33 = v6;
        if ([v6 count])
        {
          [v6 firstObject];
          uint64_t DefaultHardwareKeyboardForInputMode = [(id)TIInputModeGetComponentsFromIdentifier() objectForKey:@"hw"];
        }
        else
        {
          uint64_t DefaultHardwareKeyboardForInputMode = UIKeyboardGetDefaultHardwareKeyboardForInputMode();
        }
        uint64_t v31 = DefaultHardwareKeyboardForInputMode;
        if ([v32 count])
        {
          unint64_t v28 = [v32 count];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v35 = [v32 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v35)
          {
            uint64_t v34 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v35; ++i)
              {
                if (*(void *)v37 != v34) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v9 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                if (([v9 isEqualToString:@"Korean-With-QWERTY"] & 1) == 0)
                {
                  [(id)TIInputModeGetComponentsFromIdentifier() valueForKey:v4];
                  uint64_t v10 = (void *)TUIKeyboardTitle();
                  uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v9, &stru_26E29DC78, @"KeyboardLayouts");
                  uint64_t v12 = [v10 length];
                  if (v12) {
                    uint64_t v13 = (uint64_t)v10;
                  }
                  else {
                    uint64_t v13 = v11;
                  }
                  if (v12 && v29 >= 2 && v28 >= 2)
                  {
                    v30 = NSString;
                    long long v14 = self;
                    id v15 = (void *)MEMORY[0x263F086E0];
                    uint64_t v16 = objc_opt_class();
                    id v17 = v15;
                    self = v14;
                    uint64_t v13 = [v30 stringWithFormat:objc_msgSend((id)objc_msgSend(v17, "bundleForClass:", v16), "localizedStringForKey:value:table:", @"KEYBOARD_VARIANT_%@_WITH_LAYOUT_%@", &stru_26E29DC78, @"Keyboard", v10, v11];
                  }
                  uint64_t v18 = UIKeyboardInputModeWithNewSWLayout();
                  if (v31) {
                    uint64_t v18 = UIKeyboardInputModeWithNewHWLayout();
                  }
                  if ([(id)objc_opt_class() shouldAddInputMode:v18 toEnabledInputModes:v33])
                  {
                    long long v19 = (void *)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];
                    [v19 setButtonAction:sel_toggleInputMode_];
                    [v19 setProperty:v18 forKey:v26];
                    if ([v33 containsObject:v18]) {
                      [v19 setProperty:MEMORY[0x263EFFA80] forKey:v25];
                    }
                    [v27 addObject:v19];
                  }
                }
              }
              uint64_t v35 = [v32 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v35);
          }
        }
        uint64_t v5 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v23);
  }
  return v27;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)TIAddKeyboardController;
  id v6 = -[TIAddKeyboardController tableView:cellForRowAtIndexPath:](&v11, sel_tableView_cellForRowAtIndexPath_, a3);
  uint64_t v7 = (void *)[(TIAddKeyboardController *)self specifierAtIndex:[(TIAddKeyboardController *)self indexForIndexPath:a4]];
  uint64_t v8 = (void *)[v7 propertyForKey:*MEMORY[0x263F60138]];
  [v6 setAccessibilityIdentifier:v8];
  if ([v6 isUserInteractionEnabled])
  {
    if ([v8 isEqualToString:@"Multilingual"]
      || -[TIAddKeyboardController koreanEnglishBilingualInputModeIdentifier](self, "koreanEnglishBilingualInputModeIdentifier")&& objc_msgSend(v8, "isEqualToString:", -[TIAddKeyboardController koreanEnglishBilingualInputModeIdentifier](self, "koreanEnglishBilingualInputModeIdentifier")))
    {
      BOOL v9 = [(TIAddKeyboardController *)self showsMonolingualOption] ^ 1;
    }
    else
    {
      if (![v8 isEqualToString:@"Monolingual"]) {
        return v6;
      }
      BOOL v9 = [(TIAddKeyboardController *)self showsMonolingualOption];
    }
  }
  else
  {
    BOOL v9 = 1;
  }
  [v6 setChecked:v9];
  return v6;
}

- (id)koreanEnglishBilingualInputModeIdentifier:(id)a3 enabledInputModes:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = +[TIKeyboardListController supportedBaseInputModesForLanguage:a3];
  uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (!v16) {
    return 0;
  }
  uint64_t v17 = *(void *)v23;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v23 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void *)(*((void *)&v22 + 1) + 8 * i);
      if (![a4 count]
        || ([a4 firstObject],
            (uint64_t DefaultHardwareKeyboardForInputMode = [(id)TIInputModeGetComponentsFromIdentifier() objectForKey:@"hw"]) == 0))
      {
        uint64_t DefaultHardwareKeyboardForInputMode = UIKeyboardGetDefaultHardwareKeyboardForInputMode();
      }
      id v8 = +[TIKeyboardListController softwareLayoutsForBaseInputMode:v6];
      if ([v8 count])
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
LABEL_12:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            if ([*(id *)(*((void *)&v18 + 1) + 8 * v12) isEqualToString:@"Korean-With-QWERTY"])
            {
              uint64_t v13 = (void *)UIKeyboardInputModeWithNewSWLayout();
              if (DefaultHardwareKeyboardForInputMode) {
                uint64_t v13 = (void *)UIKeyboardInputModeWithNewHWLayout();
              }
              if (![a4 containsObject:v13]) {
                return v13;
              }
            }
            if (v10 == ++v12)
            {
              uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v10) {
                goto LABEL_12;
              }
              break;
            }
          }
        }
      }
    }
    uint64_t v13 = 0;
    uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v16) {
      continue;
    }
    return v13;
  }
}

- (BOOL)supportsMultilingual
{
  return [(NSArray *)[(TIAddKeyboardController *)self proposedMultilingualInputModes] count]|| [(TIAddKeyboardController *)self koreanEnglishBilingualInputModeIdentifier] != 0;
}

- (void)addCheckedInputModes
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v15 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers");
  long long v14 = (void *)[MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v16 = self;
  id v3 = [(TIAddKeyboardController *)self specifiers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    uint64_t v7 = *MEMORY[0x263F602B0];
    uint64_t v8 = *MEMORY[0x263F60138];
    uint64_t v13 = *MEMORY[0x263F60308];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "propertyForKey:", v7, v13);
        uint64_t v12 = (void *)[v10 propertyForKey:v8];
        if ((![v12 isEqualToString:@"Multilingual"]
           || -[NSArray count](-[TIAddKeyboardController proposedMultilingualInputModes](v16, "proposedMultilingualInputModes"), "count") <= 1)&& ([v12 isEqualToString:@"Monolingual"] & 1) == 0&& objc_msgSend(v11, "isChecked"))
        {
          if (_os_feature_enabled_impl()
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "userInfo"), "objectForKeyedSubscript:", @"multilingual"), "BOOLValue"))
          {
            id v15 = TIUIGetInputModesByAddingProposedInputMode((void *)[v10 propertyForKey:v13], v15);
          }
          else if (([v15 containsObject:v12] & 1) == 0)
          {
            [v14 addObject:v12];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  +[TIKeyboardListController setInputModes:](TIKeyboardListController, "setInputModes:", [v15 arrayByAddingObjectsFromArray:v14]);
}

- (void)updateDoneButton
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = [(TIAddKeyboardController *)self specifiers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    uint64_t v6 = *MEMORY[0x263F60138];
    uint64_t v7 = *MEMORY[0x263F602B0];
    uint64_t v8 = *MEMORY[0x263F600A8];
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = (void *)[v10 propertyForKey:v6];
        if (([v11 isEqualToString:@"Monolingual"] & 1) == 0
          && (![v11 isEqualToString:@"Multilingual"]
           || [(NSArray *)[(TIAddKeyboardController *)self proposedMultilingualInputModes] count] <= 1))
        {
          uint64_t v12 = (void *)[v10 propertyForKey:v7];
          uint64_t v13 = (void *)[v10 propertyForKey:v8];
          if ([v12 isChecked])
          {
            if (!v13 || ([v13 BOOLValue] & 1) != 0)
            {
              uint64_t v14 = 1;
              goto LABEL_16;
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_16:
  objc_msgSend((id)objc_msgSend((id)-[TIAddKeyboardController navigationItem](self, "navigationItem"), "rightBarButtonItem"), "setEnabled:", v14);
}

- (void)enableMultilingualKeyboards:(id)a3
{
  [(TIAddKeyboardController *)self setShowsMonolingualOption:0];
  [(TIAddKeyboardController *)self reloadSpecifiers];

  [(TIAddKeyboardController *)self updateDoneButton];
}

- (void)enableMonolingualKeyboards:(id)a3
{
  [(TIAddKeyboardController *)self setShowsMonolingualOption:1];
  [(TIAddKeyboardController *)self reloadSpecifiers];

  [(TIAddKeyboardController *)self updateDoneButton];
}

- (void)toggleInputMode:(id)a3
{
  uint64_t v4 = (void *)[a3 propertyForKey:*MEMORY[0x263F602B0]];
  objc_msgSend(v4, "setChecked:", objc_msgSend(v4, "isChecked") ^ 1);

  [(TIAddKeyboardController *)self updateDoneButton];
}

- (void)toggleMultilingualInputMode:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(TIAddKeyboardController *)self specifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    uint64_t v9 = *MEMORY[0x263F602B0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v12 = (void *)[v11 propertyForKey:v9];
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "userInfo"), "objectForKeyedSubscript:", @"multilingual"), "BOOLValue"))objc_msgSend(v12, "setChecked:", 0); {
      }
        }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  [(TIAddKeyboardController *)self toggleInputMode:a3];
}

- (void)cancelButtonTapped
{
  id v2 = (void *)[(TIAddKeyboardController *)self navigationController];

  [v2 popViewControllerAnimated:1];
}

- (void)doneButtonTapped
{
  [(TIAddKeyboardController *)self addCheckedInputModes];
  uint64_t v3 = (void *)[(TIAddKeyboardController *)self parentController];

  [v3 dismissForDone];
}

- (NSString)koreanEnglishBilingualInputModeIdentifier
{
  return self->_koreanEnglishBilingualInputModeIdentifier;
}

- (void)setKoreanEnglishBilingualInputModeIdentifier:(id)a3
{
}

- (BOOL)showsMonolingualOption
{
  return self->_showsMonolingualOption;
}

- (void)setShowsMonolingualOption:(BOOL)a3
{
  self->_showsMonolingualOption = a3;
}

- (NSArray)proposedMultilingualInputModes
{
  return self->_proposedMultilingualInputModes;
}

- (void)setProposedMultilingualInputModes:(id)a3
{
}

@end