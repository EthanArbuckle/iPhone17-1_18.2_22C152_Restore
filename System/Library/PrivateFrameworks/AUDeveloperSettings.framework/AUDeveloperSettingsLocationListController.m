@interface AUDeveloperSettingsLocationListController
- (id)buildName;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)trainName;
- (void)keyboardWillShow:(id)a3;
- (void)saveNow;
- (void)setBuildName:(id)a3;
- (void)setTrainName:(id)a3;
- (void)showCustomSpecifiersForSelectedSpecifier:(id)a3 show:(BOOL)a4 animated:(BOOL)a5;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AUDeveloperSettingsLocationListController

- (id)specifiers
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  v3 = *(Class *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (v3)
  {
    id v4 = v3;
    goto LABEL_18;
  }
  uint64_t v56 = (int)*MEMORY[0x263F5FDB8];
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:v2 selector:sel_keyboardWillShow_ name:*MEMORY[0x263F1D488] object:0];

  v6 = [(AUDeveloperSettingsLocationListController *)v2 specifier];
  uint64_t v7 = [v6 propertyForKey:@"serialNumber"];
  serialNumber = v2->_serialNumber;
  v2->_serialNumber = (NSString *)v7;

  v9 = [(AUDeveloperSettingsLocationListController *)v2 specifier];
  uint64_t v10 = [v9 propertyForKey:@"assetLocation"];
  assetLocationKey = v2->_assetLocationKey;
  v2->_assetLocationKey = (NSString *)v10;

  v12 = [(AUDeveloperSettingsLocationListController *)v2 specifier];
  uint64_t v13 = [v12 propertyForKey:@"basejumperTrain"];
  basejumperTrainKey = v2->_basejumperTrainKey;
  v2->_basejumperTrainKey = (NSString *)v13;

  v15 = [(AUDeveloperSettingsLocationListController *)v2 specifier];
  uint64_t v16 = [v15 propertyForKey:@"basejumperBuild"];
  basejumperBuildKey = v2->_basejumperBuildKey;
  v2->_basejumperBuildKey = (NSString *)v16;

  v18 = getInfoForAccessory(v2->_serialNumber);
  uint64_t v19 = [v18 mutableCopy];
  modifiedSettings = v2->_modifiedSettings;
  v2->_modifiedSettings = (NSMutableDictionary *)v19;

  v21 = [(AUDeveloperSettingsLocationListController *)v2 loadSpecifiersFromPlistName:@"AUDeveloperSettingsLocation" target:v2];
  uint64_t v22 = [v21 specifierForID:@"CUSTOM_BASEJUMPER_BUILD"];
  customBuildSpecifier = v2->_customBuildSpecifier;
  v2->_customBuildSpecifier = (PSSpecifier *)v22;

  uint64_t v24 = [v21 specifierForID:@"CUSTOMER"];
  customerSpecifier = v2->_customerSpecifier;
  v2->_customerSpecifier = (PSSpecifier *)v24;

  uint64_t v26 = [v21 specifierForID:@"CUSTOMER_STAGING"];
  customerStagingSpecifier = v2->_customerStagingSpecifier;
  v2->_customerStagingSpecifier = (PSSpecifier *)v26;

  uint64_t v28 = [v21 specifierForID:@"PUBLIC_SEED"];
  publicSeedSpecifier = v2->_publicSeedSpecifier;
  v2->_publicSeedSpecifier = (PSSpecifier *)v28;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v30 = v21;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v58;
    uint64_t v33 = *MEMORY[0x263F5FFE0];
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v58 != v32) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        [v35 setProperty:objc_opt_class() forKey:v33];
        [v35 setDetailControllerClass:objc_opt_class()];
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v31);
  }

  uint64_t v36 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  customBasejumperBuildGroup = v2->_customBasejumperBuildGroup;
  v2->_customBasejumperBuildGroup = (PSSpecifier *)v36;

  [(PSSpecifier *)v2->_customBasejumperBuildGroup setCellType:0];
  [(PSSpecifier *)v2->_customBasejumperBuildGroup setName:@"Custom Basejumper Build"];
  uint64_t v38 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  customLivabilityBuildGroup = v2->_customLivabilityBuildGroup;
  v2->_customLivabilityBuildGroup = (PSSpecifier *)v38;

  [(PSSpecifier *)v2->_customLivabilityBuildGroup setCellType:0];
  [(PSSpecifier *)v2->_customLivabilityBuildGroup setName:@"Custom Livability Train"];
  uint64_t v40 = [MEMORY[0x263F5FCA8] preferenceSpecifierNamed:@"Train" target:v2 set:sel_setTrainName_ get:sel_trainName detail:0 cell:8 edit:0];
  p_customTrainSpecifier = &v2->_customTrainSpecifier;
  customTrainSpecifier = v2->_customTrainSpecifier;
  v2->_customTrainSpecifier = (PSTextFieldSpecifier *)v40;

  uint64_t v43 = [MEMORY[0x263F5FCA8] preferenceSpecifierNamed:@"Build" target:v2 set:sel_setBuildName_ get:sel_buildName detail:0 cell:8 edit:0];
  customBuildNumberSpecifier = v2->_customBuildNumberSpecifier;
  v2->_customBuildNumberSpecifier = (PSTextFieldSpecifier *)v43;

  v45 = [(NSMutableDictionary *)v2->_modifiedSettings objectForKeyedSubscript:@"fusing"];
  if ((AUDeveloperSettingsAccessoryFusingStringToType(v45) & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    [v30 removeObject:v2->_customerSpecifier];
    [v30 removeObject:v2->_customerStagingSpecifier];
    [v30 removeObject:v2->_publicSeedSpecifier];
  }
  v2->_defaultSpecifierListLength = [v30 count];
  v46 = [(NSMutableDictionary *)v2->_modifiedSettings objectForKeyedSubscript:v2->_assetLocationKey];
  uint64_t v47 = AUDeveloperSettingsURLStringToType(v46);
  if (!v47)
  {
    v2->_showingCustomLivabilityBuildSpecifiers = 1;
    [v30 addObject:v2->_customLivabilityBuildGroup];
    goto LABEL_16;
  }
  if (v47 == 5)
  {
    v2->_showingCustomBasejumperBuildSpecifiers = 1;
    [v30 addObject:v2->_customBasejumperBuildGroup];
    [v30 addObject:*p_customTrainSpecifier];
    p_customTrainSpecifier = &v2->_customBuildNumberSpecifier;
LABEL_16:
    [v30 addObject:*p_customTrainSpecifier];
  }
  uint64_t v48 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  saveButtonGroup = v2->_saveButtonGroup;
  v2->_saveButtonGroup = (PSSpecifier *)v48;

  [(PSSpecifier *)v2->_saveButtonGroup setCellType:0];
  [(PSSpecifier *)v2->_saveButtonGroup setName:0];
  uint64_t v50 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Apply" target:v2 set:0 get:0 detail:0 cell:13 edit:0];
  saveSettingsButtonSpecifier = v2->_saveSettingsButtonSpecifier;
  v2->_saveSettingsButtonSpecifier = (PSSpecifier *)v50;

  v52 = v2->_saveSettingsButtonSpecifier;
  v53 = [NSNumber numberWithInt:2];
  [(PSSpecifier *)v52 setProperty:v53 forKey:*MEMORY[0x263F5FEF0]];

  [(PSSpecifier *)v2->_saveSettingsButtonSpecifier setButtonAction:sel_saveNow];
  [(PSSpecifier *)v2->_saveSettingsButtonSpecifier setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  [(PSSpecifier *)v2->_saveButtonGroup setProperty:@"Apply will save settings changes and launch an asset check for the accessory if connected." forKey:*MEMORY[0x263F600F8]];
  [v30 addObject:v2->_saveButtonGroup];
  [v30 addObject:v2->_saveSettingsButtonSpecifier];
  v54 = [MEMORY[0x263EFF8C0] arrayWithArray:v30];
  [(AUDeveloperSettingsLocationListController *)v2 setSpecifiers:v54];

  id v4 = *(id *)((char *)&v2->super.super.super.super.super.isa + v56);
LABEL_18:
  objc_sync_exit(v2);

  return v4;
}

- (void)saveNow
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__AUDeveloperSettingsLocationListController_saveNow__block_invoke;
  block[3] = &unk_264838EC0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __52__AUDeveloperSettingsLocationListController_saveNow__block_invoke(uint64_t a1)
{
  v2 = +[AUDeveloperSettingsDatabase sharedDatabase];
  [v2 addAccessoryWithSerialNumber:*(void *)(*(void *)(a1 + 32) + 1528) info:*(void *)(*(void *)(a1 + 32) + 1536)];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F5FE78]));
  [WeakRetained settingsChangedForSerialNumber:*(void *)(*(void *)(a1 + 32) + 1528)];

  [*(id *)(*(void *)(a1 + 32) + 1456) setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[182];
  return [v4 reloadSpecifier:v5];
}

- (void)setTrainName:(id)a3
{
}

- (id)trainName
{
  return (id)[(NSMutableDictionary *)self->_modifiedSettings objectForKeyedSubscript:self->_basejumperTrainKey];
}

- (void)setBuildName:(id)a3
{
}

- (id)buildName
{
  return (id)[(NSMutableDictionary *)self->_modifiedSettings objectForKeyedSubscript:self->_basejumperBuildKey];
}

- (void)showCustomSpecifiersForSelectedSpecifier:(id)a3 show:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v32[2] = *MEMORY[0x263EF8340];
  v8 = [a3 propertyForKey:*MEMORY[0x263F60138]];
  saveSettingsButtonSpecifier = self->_saveSettingsButtonSpecifier;
  v32[0] = self->_saveButtonGroup;
  v32[1] = saveSettingsButtonSpecifier;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  if (!v6)
  {
    self->_showingCustomBasejumperBuildSpecifiers = 0;
    self->_showingCustomLivabilityBuildSpecifiers = 0;
    if (!self->_showingCustomBasejumperBuildSpecifiers) {
      goto LABEL_8;
    }
LABEL_6:
    customTrainSpecifier = self->_customTrainSpecifier;
    customBasejumperBuildGroup = self->_customBasejumperBuildGroup;
    uint64_t v28 = customTrainSpecifier;
    saveButtonGroup = self->_saveButtonGroup;
    customBuildNumberSpecifier = self->_customBuildNumberSpecifier;
    id v30 = saveButtonGroup;
    uint64_t v31 = self->_saveSettingsButtonSpecifier;
    v15 = (void *)MEMORY[0x263EFF8C0];
    p_customBasejumperBuildGroup = &customBasejumperBuildGroup;
    uint64_t v17 = 5;
    goto LABEL_7;
  }
  self->_showingCustomBasejumperBuildSpecifiers = [v8 isEqual:@"CUSTOM_BASEJUMPER_BUILD"];
  int v11 = [v8 isEqual:@"LIVABILITY"];
  self->_showingCustomLivabilityBuildSpecifiers = v11;
  if (self->_showingCustomBasejumperBuildSpecifiers) {
    goto LABEL_6;
  }
  if (v11)
  {
    v12 = self->_customTrainSpecifier;
    uint64_t v13 = self->_saveButtonGroup;
    customLivabilityBuildGroup = self->_customLivabilityBuildGroup;
    uint64_t v24 = v12;
    v14 = self->_saveSettingsButtonSpecifier;
    v25 = v13;
    uint64_t v26 = v14;
    v15 = (void *)MEMORY[0x263EFF8C0];
    p_customBasejumperBuildGroup = &customLivabilityBuildGroup;
    uint64_t v17 = 4;
LABEL_7:
    uint64_t v20 = objc_msgSend(v15, "arrayWithObjects:count:", p_customBasejumperBuildGroup, v17, customLivabilityBuildGroup, v24, v25, v26, customBasejumperBuildGroup, v28, customBuildNumberSpecifier, v30, v31);

    uint64_t v10 = (void *)v20;
  }
LABEL_8:
  uint64_t v21 = (int)*MEMORY[0x263F5FDB8];
  for (unint64_t i = [*(id *)((char *)&self->super.super.super.super.super.isa + v21) count];
        i > self->_defaultSpecifierListLength;
        unint64_t i = [*(id *)((char *)&self->super.super.super.super.super.isa + v21) count])
  {
    [(AUDeveloperSettingsLocationListController *)self removeLastSpecifierAnimated:1];
  }
  if (v10) {
    [(AUDeveloperSettingsLocationListController *)self insertContiguousSpecifiers:v10 atEndOfGroup:0 animated:v5];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = [(AUDeveloperSettingsLocationListController *)self table];
  id v5 = [v4 cellForRowAtIndexPath:self->_lastSelectedIndexPath];

  [v5 setSelected:1 animated:1];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  v8 = [(AUDeveloperSettingsLocationListController *)self specifierAtIndexPath:v7];
  if (v8)
  {
    v9 = [(NSMutableDictionary *)self->_modifiedSettings objectForKeyedSubscript:self->_assetLocationKey];
    uint64_t v10 = [v8 propertyForKey:*MEMORY[0x263F602D0]];
    if (AUDeveloperSettingsURLStringToType(v9) == 6)
    {
      int v11 = @"Customer Staging";

      v9 = v11;
    }
    if (AUDeveloperSettingsURLStringToType(v9) != 5)
    {
      if (AUDeveloperSettingsURLStringToType(v9)
        || ([(NSMutableDictionary *)self->_modifiedSettings objectForKeyedSubscript:self->_basejumperBuildKey], v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
      {
        [(NSMutableDictionary *)self->_modifiedSettings setObject:0 forKeyedSubscript:self->_basejumperTrainKey];
      }
      [(NSMutableDictionary *)self->_modifiedSettings setObject:0 forKeyedSubscript:self->_basejumperBuildKey];
    }
    if ([v10 isEqualToString:v9]
      || AUDeveloperSettingsURLStringToType(v9) == 5
      && [v8 isEqualToSpecifier:self->_customBuildSpecifier])
    {
      [v13 setSelected:1];
      objc_storeStrong((id *)&self->_lastSelectedIndexPath, a5);
    }
    else
    {
      [v13 setSelected:0];
    }
    [v13 reloadWithSpecifier:v8 animated:1];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(AUDeveloperSettingsLocationListController *)self specifierAtIndexPath:v7];
  if (!v8) {
    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(AUDeveloperSettingsLocationListController *)self table];
    [v9 deselectRowAtIndexPath:v7 animated:1];

    uint64_t v10 = [(AUDeveloperSettingsLocationListController *)self selectSpecifier:v8];
    [(AUDeveloperSettingsLocationListController *)self showController:v10];
LABEL_21:

    goto LABEL_22;
  }
  if (![v8 isEqualToSpecifier:self->_saveSettingsButtonSpecifier])
  {
    objc_storeStrong((id *)&self->_lastSelectedIndexPath, a4);
    uint64_t v10 = [v8 propertyForKey:*MEMORY[0x263F60138]];
    [(NSMutableDictionary *)self->_modifiedSettings setObject:0 forKeyedSubscript:self->_basejumperTrainKey];
    [(NSMutableDictionary *)self->_modifiedSettings setObject:0 forKeyedSubscript:self->_basejumperBuildKey];
    [(PSSpecifier *)self->_saveSettingsButtonSpecifier setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
    if ([v10 isEqual:@"BASEJUMPER"])
    {
      uint64_t v12 = 0;
      unint64_t v13 = 4;
    }
    else if ([v10 isEqual:@"CUSTOM_BASEJUMPER_BUILD"])
    {
      uint64_t v12 = 1;
      unint64_t v13 = 5;
    }
    else if ([v10 isEqual:@"CUSTOMER"])
    {
      uint64_t v12 = 0;
      unint64_t v13 = 2;
    }
    else if ([v10 isEqual:@"CUSTOMER_STAGING"])
    {
      uint64_t v12 = 0;
      unint64_t v13 = 6;
    }
    else if ([v10 isEqual:@"INTERNAL_SEED"])
    {
      uint64_t v12 = 0;
      unint64_t v13 = 1;
    }
    else if ([v10 isEqual:@"LIVABILITY"])
    {
      unint64_t v13 = 0;
      uint64_t v12 = 1;
    }
    else
    {
      if (![v10 isEqual:@"PUBLIC_SEED"]) {
        goto LABEL_21;
      }
      uint64_t v12 = 0;
      unint64_t v13 = 3;
    }
    v14 = [NSString stringWithUTF8String:AUDeveloperSettingsURLTypeToString(v13)];
    [(NSMutableDictionary *)self->_modifiedSettings setObject:v14 forKeyedSubscript:self->_assetLocationKey];

    [(AUDeveloperSettingsLocationListController *)self showCustomSpecifiersForSelectedSpecifier:v8 show:v12 animated:1];
    goto LABEL_21;
  }
  int v11 = [(AUDeveloperSettingsLocationListController *)self table];
  [v11 deselectRowAtIndexPath:v7 animated:1];

  [v8 performButtonAction];
LABEL_22:
  v15 = [v6 cellForRowAtIndexPath:self->_lastSelectedIndexPath];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v16 = objc_msgSend(v6, "visibleCells", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v20), "setSelected:", objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v20), "isEqual:", v15));
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v18);
  }

  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE78]));
  [WeakRetained reloadSpecifiers];

LABEL_30:
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = [(AUDeveloperSettingsLocationListController *)self specifierAtIndexPath:a4];
  if (v5)
  {
    id v13 = v5;
    id v6 = objc_alloc_init(AUInternalSettingsDetailsController);
    id v7 = [v13 propertyForKey:*MEMORY[0x263F602D0]];
    v8 = [v13 propertyForKey:@"description"];
    v9 = [v13 propertyForKey:@"assetURL"];
    uint64_t v10 = [(NSMutableDictionary *)self->_modifiedSettings objectForKeyedSubscript:@"assetURLOverride"];

    if (v10)
    {
      uint64_t v11 = [(NSMutableDictionary *)self->_modifiedSettings objectForKeyedSubscript:@"assetURLOverride"];
      uint64_t v12 = [v7 stringByAppendingFormat:@" :\nProfile Asset URL Override\n\nThis resolves to a URL that looks like this :\n%@", v11];

      v8 = (void *)v11;
    }
    else
    {
      uint64_t v12 = [v7 stringByAppendingFormat:@" :\n%@\n\nThis resolves to a URL that looks like this :\n%@", v8, v9];
    }

    [(AUInternalSettingsDetailsController *)v6 setDescription:v12];
    [(AUDeveloperSettingsLocationListController *)self showController:v6];

    id v5 = v13;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)AUDeveloperSettingsLocationListController;
  id v5 = [(AUDeveloperSettingsLocationListController *)&v16 tableView:a3 cellForRowAtIndexPath:a4];
  if ([v5 tag] == 8)
  {
    id v6 = [v5 editableTextField];
    if (v6)
    {
      id v7 = [v5 specifier];
      v8 = [v7 name];
      v9 = [(PSTextFieldSpecifier *)self->_customBuildNumberSpecifier name];
      int v10 = [v8 isEqualToString:v9];

      uint64_t v11 = &OBJC_IVAR___AUDeveloperSettingsLocationListController__trainTextField;
      if (v10)
      {
        uint64_t v11 = &OBJC_IVAR___AUDeveloperSettingsLocationListController__buildTextField;
        uint64_t v12 = &OBJC_IVAR___AUDeveloperSettingsLocationListController__basejumperBuildKey;
      }
      else
      {
        uint64_t v12 = &OBJC_IVAR___AUDeveloperSettingsLocationListController__basejumperTrainKey;
      }
      id v13 = (id *)((char *)&self->super.super.super.super.super.isa + *v11);
      objc_storeStrong(v13, v6);
      v14 = [(NSMutableDictionary *)self->_modifiedSettings objectForKeyedSubscript:*(Class *)((char *)&self->super.super.super.super.super.isa + *v12)];
      [*v13 setText:v14];

      [v6 addTarget:self action:sel_textFieldDidEndEditing_ forEvents:0x40000];
      [v6 setDelegate:self];
      [v6 setReturnKeyType:9];
      [v6 setAutocorrectionType:1];
      [v6 setTextAlignment:2];
      [v6 setAutocapitalizationType:1];
      [v6 setClearButtonMode:1];
      [(AUDeveloperSettingsLocationListController *)self reloadSpecifier:self->_customTrainSpecifier];
    }
  }
  return v5;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v8 text];
    id v5 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v6 = [v4 stringByTrimmingCharactersInSet:v5];

    if (![v6 length]) {
      [v8 setText:&stru_26DCD2B00];
    }
    if ([v8 isEqual:self->_trainTextField]) {
      [(AUDeveloperSettingsLocationListController *)self setTrainName:v6];
    }
    else {
      [(AUDeveloperSettingsLocationListController *)self setBuildName:v6];
    }
    [(PSSpecifier *)self->_saveSettingsButtonSpecifier setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
    id v7 = [MEMORY[0x263F1C710] activeKeyboard];
    [v7 setReturnKeyEnabled:1];

    [(AUDeveloperSettingsLocationListController *)self reloadSpecifier:self->_saveSettingsButtonSpecifier];
  }
  MEMORY[0x270F9A758]();
}

- (void)keyboardWillShow:(id)a3
{
  objc_msgSend(MEMORY[0x263F1C710], "activeKeyboard", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setReturnKeyEnabled:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedSettings, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_buildTextField, 0);
  objc_storeStrong((id *)&self->_trainTextField, 0);
  objc_storeStrong((id *)&self->_basejumperBuildKey, 0);
  objc_storeStrong((id *)&self->_basejumperTrainKey, 0);
  objc_storeStrong((id *)&self->_assetLocationKey, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_saveSettingsButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_saveButtonGroup, 0);
  objc_storeStrong((id *)&self->_customBuildNumberSpecifier, 0);
  objc_storeStrong((id *)&self->_customTrainSpecifier, 0);
  objc_storeStrong((id *)&self->_customLivabilityBuildGroup, 0);
  objc_storeStrong((id *)&self->_customBasejumperBuildGroup, 0);
  objc_storeStrong((id *)&self->_publicSeedSpecifier, 0);
  objc_storeStrong((id *)&self->_customerStagingSpecifier, 0);
  objc_storeStrong((id *)&self->_customerSpecifier, 0);
  objc_storeStrong((id *)&self->_customBuildSpecifier, 0);
}

@end