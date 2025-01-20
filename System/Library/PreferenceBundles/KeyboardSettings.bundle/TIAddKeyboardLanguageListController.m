@interface TIAddKeyboardLanguageListController
- (BOOL)inputMode:(id)a3 matchesPredicate:(id)a4;
- (NSOperationQueue)searchQueue;
- (NSString)searchText;
- (TIAboutKeyboardPrivacyController)aboutPrivacyController;
- (TIAddKeyboardLanguageListController)init;
- (id)generateSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableViewStyle;
- (void)cancelButtonTapped;
- (void)createAboutPrivacyControllerIfNeeded:(id)a3;
- (void)dealloc;
- (void)dismissForDone;
- (void)emitNavigationEventForAddKeyboardLanguageListController;
- (void)handleSoleInputModeAddition:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)setAboutPrivacyController:(id)a3;
- (void)setSearchQueue:(id)a3;
- (void)setSearchText:(id)a3;
- (void)showAddExtensionKeyboardSheet:(id)a3;
- (void)showAddSystemKeyboardSheet:(id)a3;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TIAddKeyboardLanguageListController

- (TIAddKeyboardLanguageListController)init
{
  v5.receiver = self;
  v5.super_class = (Class)TIAddKeyboardLanguageListController;
  v2 = [(TIAddKeyboardLanguageListController *)&v5 init];
  if (v2)
  {
    v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_willResume name:*MEMORY[0x263F1D0D0] object:0];
  }
  return v2;
}

- (NSOperationQueue)searchQueue
{
  result = self->_searchQueue;
  if (!result)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    self->_searchQueue = v4;
    [(NSOperationQueue *)v4 setMaxConcurrentOperationCount:1];
    return self->_searchQueue;
  }
  return result;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)TIAddKeyboardLanguageListController;
  [(TIAddKeyboardLanguageListController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)TIAddKeyboardLanguageListController;
  [(TIAddKeyboardLanguageListController *)&v4 viewDidLoad];
  uint64_t v3 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionHeaderHeight:0.0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionFooterHeight:0.0];
  objc_msgSend((id)-[TIAddKeyboardLanguageListController navigationItem](self, "navigationItem"), "setSearchController:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C958]), "initWithSearchResultsController:", 0));
  objc_msgSend((id)-[TIAddKeyboardLanguageListController navigationItem](self, "navigationItem"), "setHidesSearchBarWhenScrolling:", 0);
  objc_msgSend((id)objc_msgSend((id)-[TIAddKeyboardLanguageListController navigationItem](self, "navigationItem"), "searchController"), "setObscuresBackgroundDuringPresentation:", 0);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TIAddKeyboardLanguageListController navigationItem](self, "navigationItem"), "searchController"), "searchBar"), "setDelegate:", self);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  [(TIAddKeyboardLanguageListController *)self setSearchText:a4];
  [(NSOperationQueue *)[(TIAddKeyboardLanguageListController *)self searchQueue] cancelAllOperations];
  id v5 = objc_alloc_init(MEMORY[0x263F086D0]);
  objc_initWeak(&location, v5);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__TIAddKeyboardLanguageListController_searchBar_textDidChange___block_invoke;
  v6[3] = &unk_264A013B0;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  [v5 addExecutionBlock:v6];
  [(NSOperationQueue *)[(TIAddKeyboardLanguageListController *)self searchQueue] addOperation:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __63__TIAddKeyboardLanguageListController_searchBar_textDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) generateSpecifiers];
  if (([objc_loadWeak((id *)(a1 + 40)) isCancelled] & 1) == 0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __63__TIAddKeyboardLanguageListController_searchBar_textDidChange___block_invoke_2;
    v3[3] = &unk_264A01258;
    v3[4] = *(void *)(a1 + 32);
    v3[5] = v2;
    dispatch_sync(MEMORY[0x263EF83A0], v3);
  }
}

uint64_t __63__TIAddKeyboardLanguageListController_searchBar_textDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSpecifiers:*(void *)(a1 + 40)];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  [(NSOperationQueue *)[(TIAddKeyboardLanguageListController *)self searchQueue] cancelAllOperations];
  [(TIAddKeyboardLanguageListController *)self setSearchText:0];

  [(TIAddKeyboardLanguageListController *)self reloadSpecifiers];
}

- (BOOL)inputMode:(id)a3 matchesPredicate:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t LanguageWithRegion = TIInputModeGetLanguageWithRegion();
  if ([a4 evaluateWithObject:LanguageWithRegion]) {
    return 1;
  }
  id v7 = +[TIKeyboardListController keyboardDisplayNameForIdentifier:LanguageWithRegion];
  v8 = (void *)[MEMORY[0x263EFF9C0] setWithObject:v7];
  objc_msgSend(v8, "addObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "currentLocale"), "localizedStringForLanguage:context:length:", LanguageWithRegion, 0, 2));
  [v8 addObject:TUIKeyboardTitleInLanguage()];
  objc_msgSend(v8, "addObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "localeWithLocaleIdentifier:", LanguageWithRegion), "localizedStringForLocaleIdentifier:", LanguageWithRegion));
  id v9 = +[TIKeyboardListController supportedBaseInputModesForLanguage:LanguageWithRegion];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        [(id)TIInputModeGetComponentsFromIdentifier() valueForKey:@"kCFLocaleVariantCodeKey"];
        v14 = (void *)TUIKeyboardTitle();
        if ([v14 length]) {
          [v8 addObject:v14];
        }
        v15 = (void *)TUIKeyboardTitleInLanguage();
        if ([v15 length]) {
          [v8 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v11);
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v16 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v8);
        }
        v20 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        if ([a4 evaluateWithObject:v20])
        {
          *((unsigned char *)v29 + 24) = 1;
          goto LABEL_25;
        }
        uint64_t v21 = [v20 length];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __66__TIAddKeyboardLanguageListController_inputMode_matchesPredicate___block_invoke;
        v23[3] = &unk_264A013D8;
        v23[4] = a4;
        v23[5] = &v28;
        objc_msgSend(v20, "enumerateSubstringsInRange:options:usingBlock:", 0, v21, 3, v23);
        if (*((unsigned char *)v29 + 24)) {
          goto LABEL_25;
        }
      }
      uint64_t v17 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_25:
  BOOL v6 = *((unsigned char *)v29 + 24) != 0;
  _Block_object_dispose(&v28, 8);
  return v6;
}

uint64_t __66__TIAddKeyboardLanguageListController_inputMode_matchesPredicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t result = [*(id *)(a1 + 32) evaluateWithObject:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a7 = 1;
  }
  return result;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id result = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!result)
  {
    id result = [(TIAddKeyboardLanguageListController *)self generateSpecifiers];
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (id)generateSpecifiers
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  objc_super v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "suggestedInputModesForPreferredLanguages");
  uint64_t v5 = [v4 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        if (([v9 isExtensionInputMode] & 1) == 0)
        {
          [v9 identifier];
          uint64_t LanguageWithRegion = TIInputModeGetLanguageWithRegion();
          if (([v3 containsObject:LanguageWithRegion] & 1) == 0) {
            [v3 addObject:LanguageWithRegion];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v6);
  }
  v47 = (void *)[MEMORY[0x263EFF9C0] set];
  v39 = (void *)[MEMORY[0x263EFF980] array];
  v40 = (void *)[MEMORY[0x263EFF980] array];
  v44 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  val = self;
  if ([(NSString *)[(TIAddKeyboardLanguageListController *)self searchText] length]) {
    uint64_t v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF beginswith[cd] %@", -[TIAddKeyboardLanguageListController searchText](self, "searchText")];
  }
  else {
    uint64_t v11 = 0;
  }
  long long v57 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v54 = 0u;
  obuint64_t j = (id)UIKeyboardGetSupportedInputModes();
  uint64_t v12 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v55;
    uint64_t v45 = *MEMORY[0x263EFFA90];
    uint64_t v41 = *MEMORY[0x263EFFB68];
    uint64_t v43 = *MEMORY[0x263F602D0];
    uint64_t v46 = *MEMORY[0x263F60138];
    uint64_t v42 = *MEMORY[0x263F5FFE0];
    uint64_t v38 = *MEMORY[0x263F5FF68];
    uint64_t v37 = *MEMORY[0x263F5FF20];
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v54 + 1) + 8 * j);
        if ((!v11
           || [(TIAddKeyboardLanguageListController *)val inputMode:*(void *)(*((void *)&v54 + 1) + 8 * j) matchesPredicate:v11])&& (!_os_feature_enabled_impl() || (TIInputModeIsMultilingualOnly() & 1) == 0))
        {
          uint64_t v17 = (void *)[MEMORY[0x263F1C740] keyboardInputModeWithIdentifier:v16];
          if (([v17 isExtensionInputMode] & 1) != 0
            || objc_msgSend(+[TIKeyboardListController availableInputModesForLanguage:](TIKeyboardListController, "availableInputModesForLanguage:", v16), "count"))
          {
            if ([v17 isExtensionInputMode])
            {
              uint64_t v18 = objc_msgSend((id)objc_msgSend(v17, "containingBundle"), "bundlePath");
              if (!v18) {
                continue;
              }
              uint64_t v19 = v18;
              uint64_t v20 = [v17 identifier];
              uint64_t v21 = objc_msgSend((id)objc_msgSend(v17, "containingBundle"), "bundleIdentifier");
              uint64_t v22 = objc_msgSend((id)objc_msgSend(v17, "containingBundle"), "objectForInfoDictionaryKey:", v45);
              if (!v22) {
                uint64_t v22 = objc_msgSend((id)objc_msgSend(v17, "containingBundle"), "objectForInfoDictionaryKey:", v41);
              }
              id v23 = (id)v22;
            }
            else
            {
              uint64_t v20 = TIInputModeGetLanguageWithRegion();
              id v23 = +[TIKeyboardListController keyboardDisplayNameForIdentifier:v20];
              uint64_t v19 = 0;
              uint64_t v21 = v20;
            }
            if (![v47 member:v20])
            {
              [v47 addObject:v20];
              if (![v17 isExtensionInputMode]
                || (id v24 = (id)objc_msgSend(v44, "objectForKey:", objc_msgSend((id)objc_msgSend(v17, "containingBundle"), "bundlePath"))) == 0)
              {
                id v24 = (id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:v23 target:val set:0 get:0 detail:0 cell:3 edit:0];
                [v24 setControllerLoadAction:sel_showAddSystemKeyboardSheet_];
                [v24 setProperty:v23 forKey:v43];
                [v24 setProperty:v21 forKey:v46];
                [v24 setProperty:objc_opt_class() forKey:v42];
              }
              if ([v17 isExtensionInputMode])
              {
                long long v25 = (void *)[v24 propertyForKey:@"TIKBAllIdentifiersKey"];
                if (!v25)
                {
                  long long v25 = (void *)[MEMORY[0x263EFF980] array];
                  [v24 setProperty:v25 forKey:@"TIKBAllIdentifiersKey"];
                }
                [v25 addObject:v17];
                if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "activeInputModes"), "containsObject:", v17) & 1) == 0)
                {
                  long long v26 = (void *)[v24 propertyForKey:@"TIKBIdentifiersKey"];
                  if (!v26)
                  {
                    long long v26 = (void *)[MEMORY[0x263EFF980] array];
                    [v24 setProperty:v26 forKey:@"TIKBIdentifiersKey"];
                  }
                  [v26 addObject:v17];
                  [v24 setProperty:v19 forKey:v38];
                  [v24 setProperty:MEMORY[0x263EFFA88] forKey:v37];
                  [v24 setControllerLoadAction:sel_showAddExtensionKeyboardSheet_];
                  [v44 setObject:v24 forKey:v19];
                }
              }
              else
              {
                if (objc_msgSend(v3, "containsObject:", objc_msgSend(v24, "propertyForKey:", v46))) {
                  long long v27 = v39;
                }
                else {
                  long long v27 = v40;
                }
                [v27 addObject:v24];
              }
            }
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v13);
  }
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __57__TIAddKeyboardLanguageListController_generateSpecifiers__block_invoke;
  v53[3] = &unk_264A01400;
  v53[4] = v3;
  [v39 sortUsingComparator:v53];
  [v40 sortUsingComparator:&__block_literal_global_10];
  uint64_t v28 = objc_msgSend((id)objc_msgSend(v44, "allValues"), "sortedArrayUsingSelector:", sel_titleCompare_);
  uint64_t v29 = [v39 count];
  uint64_t v30 = [v28 count];
  uint64_t v31 = [v40 count];
  long long v32 = (void *)[MEMORY[0x263EFF980] array];
  if (v29) {
    objc_msgSend(v32, "addObject:", objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithName:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SUGGESTED_KEYBOARDS", &stru_26E29DC78, @"Keyboard")));
  }
  [v32 addObjectsFromArray:v39];
  if (v30)
  {
    uint64_t v33 = objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithName:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"APP_KEYBOARDS", &stru_26E29DC78, @"Keyboard"));
    [v32 addObject:v33];
    [(TIAddKeyboardLanguageListController *)val createAboutPrivacyControllerIfNeeded:v33];
  }
  else
  {
    objc_initWeak(&location, val);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__TIAddKeyboardLanguageListController_generateSpecifiers__block_invoke_3;
    block[3] = &unk_264A01428;
    objc_copyWeak(&v51, &location);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);
  }
  [v32 addObjectsFromArray:v28];
  if (v31)
  {
    uint64_t v34 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"DEVICE_KEYBOARDS"];
    uint64_t v35 = objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithName:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v34, &stru_26E29DC78, @"Keyboard"));
  }
  else
  {
    uint64_t v35 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  }
  [v32 addObject:v35];
  [v32 addObjectsFromArray:v40];
  return v32;
}

uint64_t __57__TIAddKeyboardLanguageListController_generateSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *MEMORY[0x263F60138];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_msgSend(a2, "propertyForKey:", *MEMORY[0x263F60138])));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_msgSend(a3, "propertyForKey:", v5)));

  return [v6 compare:v7];
}

uint64_t __57__TIAddKeyboardLanguageListController_generateSpecifiers__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "titleCompare:");
}

uint64_t __57__TIAddKeyboardLanguageListController_generateSpecifiers__block_invoke_3(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  return [Weak setAboutPrivacyController:0];
}

- (void)createAboutPrivacyControllerIfNeeded:(id)a3
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  uint64_t v5 = __76__TIAddKeyboardLanguageListController_createAboutPrivacyControllerIfNeeded___block_invoke;
  uint64_t v6 = &unk_264A01450;
  objc_copyWeak(&v8, &location);
  id v7 = a3;
  if ([MEMORY[0x263F08B88] isMainThread]) {
    v5((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __76__TIAddKeyboardLanguageListController_createAboutPrivacyControllerIfNeeded___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  if ([Weak aboutPrivacyController])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    objc_super v4 = (void *)[Weak aboutPrivacyController];
    return [v4 setSpecifier:v3];
  }
  else
  {
    uint64_t v6 = [[TIAboutKeyboardPrivacyController alloc] initWithGroupSpecifier:*(void *)(a1 + 32) asHeader:1 inListController:Weak];
    return [Weak setAboutPrivacyController:v6];
  }
}

- (void)handleSoleInputModeAddition:(id)a3
{
  +[TIKeyboardListController setInputModes:](TIKeyboardListController, "setInputModes:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers"), "arrayByAddingObject:", a3));
  objc_super v4 = objc_msgSend((id)-[TIAddKeyboardLanguageListController parentController](self, "parentController"), "parentController");
  if (objc_opt_respondsToSelector())
  {
    [v4 setNewKeyboardsAdded:1];
    [v4 reloadSpecifiers];
  }
  uint64_t v5 = (void *)[(TIAddKeyboardLanguageListController *)self parentController];

  [v5 dismiss];
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7 = [(TIAddKeyboardLanguageListController *)self aboutPrivacyController];

  [(TIAboutKeyboardPrivacyController *)v7 addPrivacyLinkViewIfNecessaryToHeaderView:a4 forSection:a5];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TIAddKeyboardLanguageListController;
  id v6 = -[TIAddKeyboardLanguageListController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3);
  id v7 = (void *)[(TIAddKeyboardLanguageListController *)self specifierAtIndex:[(TIAddKeyboardLanguageListController *)self indexForIndexPath:a4]];
  objc_msgSend(v6, "setAccessibilityIdentifier:", objc_msgSend(v7, "propertyForKey:", *MEMORY[0x263F60138]));
  return v6;
}

- (void)showAddSystemKeyboardSheet:(id)a3
{
  uint64_t v5 = [a3 propertyForKey:*MEMORY[0x263F60138]];
  id v6 = +[TIKeyboardListController supportedInputModesForLanguage:v5];
  if (!+[TIAddKeyboardController shouldShowAddKeyboardControllerForInputModes:](TIAddKeyboardController, "shouldShowAddKeyboardControllerForInputModes:", v6)&& (id v7 = +[TIKeyboardListController availableInputModesForLanguage:](TIKeyboardListController, "availableInputModesForLanguage:", v5), v8 = [v6 count], v8 == objc_msgSend(v7, "count"))&& (v9 = objc_msgSend(v7, "firstObject")) != 0)
  {
    uint64_t v10 = v9;
    if (UIKeyboardGetDefaultHardwareKeyboardForInputMode()) {
      uint64_t v10 = UIKeyboardInputModeWithNewHWLayout();
    }
    [(TIAddKeyboardLanguageListController *)self handleSoleInputModeAddition:v10];
  }
  else
  {
    uint64_t v11 = objc_alloc_init(TIAddKeyboardController);
    [(TIAddKeyboardController *)v11 setParentController:self];
    [(TIAddKeyboardController *)v11 setSpecifier:a3];
    [a3 setTarget:self];
    [(TIAddKeyboardLanguageListController *)self showController:v11 animate:1];
  }
}

- (void)showAddExtensionKeyboardSheet:(id)a3
{
  uint64_t v5 = objc_alloc_init(TIAddExtensionKeyboardController);
  [(TIAddExtensionKeyboardController *)v5 setBehavesAsModalForAddSheet:1];
  [(TIAddExtensionKeyboardController *)v5 setParentController:self];
  [(TIAddExtensionKeyboardController *)v5 setSpecifier:a3];
  [a3 setTarget:self];
  if (objc_msgSend(-[TIAddExtensionKeyboardController specifiers](v5, "specifiers"), "count"))
  {
    [(TIAddKeyboardLanguageListController *)self showController:v5 animate:1];
  }
  else
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", @"TIKBIdentifiersKey"), "firstObject"), "identifier");
    [(TIAddKeyboardLanguageListController *)self handleSoleInputModeAddition:v6];
  }
}

- (void)cancelButtonTapped
{
  uint64_t v2 = (void *)[(TIAddKeyboardLanguageListController *)self parentController];

  [v2 dismiss];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIAddKeyboardLanguageListController;
  [(TIAddKeyboardLanguageListController *)&v4 viewWillAppear:a3];
  -[TIAddKeyboardLanguageListController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ADD_NEW_KEYBOARD_SHORT", &stru_26E29DC78, @"Keyboard"));
  objc_msgSend((id)-[TIAddKeyboardLanguageListController navigationItem](self, "navigationItem"), "setLeftBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C468]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped));
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIAddKeyboardLanguageListController;
  [(TIAddKeyboardLanguageListController *)&v4 viewDidAppear:a3];
  [(TIAddKeyboardLanguageListController *)self emitNavigationEventForAddKeyboardLanguageListController];
}

- (void)dismissForDone
{
  uint64_t v3 = objc_msgSend((id)-[TIAddKeyboardLanguageListController parentController](self, "parentController"), "parentController");
  if (objc_opt_respondsToSelector())
  {
    [v3 setNewKeyboardsAdded:1];
    [v3 reloadSpecifiers];
  }
  objc_super v4 = (void *)[(TIAddKeyboardLanguageListController *)self parentController];

  [v4 dismiss];
}

- (void)emitNavigationEventForAddKeyboardLanguageListController
{
  v10[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/Keyboard/KEYBOARDS/AddNewKeyboard"];
  id v4 = +[KeyboardController localizedStringForGeneralKeyboardSpecifier];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v6 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v7 = objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", @"KEYBOARDS_SHORT", @"Keyboard", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "bundleURL"));
  id v8 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v9 = [MEMORY[0x263EFF960] currentLocale];
  v10[0] = v4;
  v10[1] = v7;
  -[TIAddKeyboardLanguageListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", @"com.apple.graphic-icon.keyboard", objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", @"ADD_NEW_KEYBOARD_SHORT", @"Keyboard", v9, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "bundleURL")), objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v10, 3), v3);
}

- (TIAboutKeyboardPrivacyController)aboutPrivacyController
{
  return self->_aboutPrivacyController;
}

- (void)setAboutPrivacyController:(id)a3
{
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
}

- (void)setSearchQueue:(id)a3
{
}

@end