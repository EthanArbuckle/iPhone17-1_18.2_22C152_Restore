@interface TIAddExtensionKeyboardController
+ (id)specifiersForExtensionInputMode:(id)a3 parentSpecifier:(id)a4;
- (BOOL)behavesAsModalForAddSheet;
- (NSArray)moduleSpecifiers;
- (PSSpecifier)networkAccessSpecifier;
- (PSSpecifier)specifierForWarning;
- (UIAlertAction)networkAccessAlertActionCancel;
- (UIAlertAction)networkAccessAlertActionDefault;
- (UIAlertController)networkAccessAlertController;
- (id)fetchInputModeEnabled:(id)a3;
- (id)newSpecifiers;
- (id)selectedInputModes;
- (id)specifiers;
- (void)addCheckedInputModes;
- (void)cancelButtonTapped;
- (void)dealloc;
- (void)didEnterBackground:(id)a3;
- (void)doneButtonTapped;
- (void)setBehavesAsModalForAddSheet:(BOOL)a3;
- (void)setModuleSpecifiers:(id)a3;
- (void)setNetworkAccessAlertActionCancel:(id)a3;
- (void)setNetworkAccessAlertActionDefault:(id)a3;
- (void)setNetworkAccessAlertController:(id)a3;
- (void)setNetworkAccessSpecifier:(id)a3;
- (void)setNetworkAccessSpecifierForKeyboardInputMode:(id)a3;
- (void)setNetworkPolicyValue:(id)a3;
- (void)setPrivacyAccess:(id)a3 forSpecifier:(id)a4;
- (void)setSpecifierForWarning:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)trackExtensionsContainedInApp;
- (void)updateDoneButton;
- (void)updateNetworkPolicyState;
- (void)updateNetworkPolicyStateIfNecessaryForCell:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TIAddExtensionKeyboardController

+ (id)specifiersForExtensionInputMode:(id)a3 parentSpecifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (![a3 isExtensionInputMode]) {
    return (id)MEMORY[0x263EFFA68];
  }
  v6 = (void *)[MEMORY[0x263EFF980] array];
  objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithName:", objc_msgSend(a3, "safe__extendedDisplayName")));
  v7 = objc_msgSend((id)objc_msgSend(a3, "extension"), "_extensionBundle");
  if (v7) {
    v8 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithURL:", objc_msgSend((id)objc_msgSend(v7, "bundleURL"), "URLByAppendingPathComponent:", @"Settings.bundle"));
  }
  else {
    v8 = 0;
  }
  [a4 setProperty:v8 forKey:*MEMORY[0x263F5FF08]];
  uint64_t v9 = *MEMORY[0x263F5FF00];
  if (![a4 propertyForKey:*MEMORY[0x263F5FF00]]) {
    objc_msgSend(a4, "setProperty:forKey:", objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F60138]), v9);
  }
  uint64_t v10 = [v8 pathForResource:@"Root" ofType:@"plist"];
  if (!v10) {
    return (id)MEMORY[0x263EFFA68];
  }
  v11 = (void *)[NSDictionary dictionaryWithContentsOfFile:v10];
  uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKey:", *MEMORY[0x263F60288]), "stringByDeletingPathExtension");
  v13 = (void *)[v11 objectForKey:*MEMORY[0x263F60278]];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  v15 = (void *)MEMORY[0x263EFFA68];
  if (v14)
  {
    uint64_t v16 = v14;
    char v17 = 0;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v13);
        }
        uint64_t v20 = [MEMORY[0x263F5FAD8] specifiersFromDictionary:*(void *)(*((void *)&v22 + 1) + 8 * i) stringsTable:v12 parentSpecifier:a4 target:0];
        if (v20)
        {
          [v6 addObjectsFromArray:v20];
          char v17 = 1;
        }
      }
      uint64_t v16 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
    if (v17) {
      return v6;
    }
  }
  return v15;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)TIAddExtensionKeyboardController;
  [(TIAddExtensionKeyboardController *)&v3 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id result = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!result)
  {
    id result = [(TIAddExtensionKeyboardController *)self newSpecifiers];
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (void)setNetworkAccessSpecifierForKeyboardInputMode:(id)a3
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "extension"), "attributes"), "objectForKey:", @"RequestsOpenAccess"), "BOOLValue"))
  {
    -[PSAppListController setSystemPolicy:](self, "setSystemPolicy:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F5FC98]), "initWithBundleIdentifier:", objc_msgSend((id)objc_msgSend(a3, "containingBundle"), "bundleIdentifier")));
    v5 = (void *)[(PSSystemPolicyForApp *)[(PSAppListController *)self systemPolicy] specifiersForPolicyOptions:0x20000 force:1];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __82__TIAddExtensionKeyboardController_setNetworkAccessSpecifierForKeyboardInputMode___block_invoke;
    v6[3] = &unk_264A01388;
    v6[4] = self;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

uint64_t __82__TIAddExtensionKeyboardController_setNetworkAccessSpecifierForKeyboardInputMode___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 target];
  if (result)
  {
    [a2 setTarget:*(void *)(a1 + 32)];
    uint64_t result = [*(id *)(a1 + 32) setNetworkAccessSpecifier:a2];
    *a4 = 1;
  }
  return result;
}

- (id)newSpecifiers
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  char v17 = self;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_msgSend((id)-[TIAddExtensionKeyboardController specifier](self, "specifier"), "propertyForKey:", @"TIKBIdentifiersKey");
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    LOBYTE(v6) = 0;
    uint64_t v7 = *(void *)v19;
    uint64_t v8 = *MEMORY[0x263F60138];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v10, "displayName"), v17, sel_toggleInputMode_specifier_, sel_fetchInputModeEnabled_, 0, 6, 0);
        objc_msgSend(v11, "setProperty:forKey:", objc_msgSend(v10, "identifier"), v8);
        [v3 addObject:v11];
        if (v6) {
          int v6 = 1;
        }
        else {
          int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "extension"), "attributes"), "objectForKey:", @"RequestsOpenAccess"), "BOOLValue");
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }
  -[TIAddExtensionKeyboardController setModuleSpecifiers:](v17, "setModuleSpecifiers:", [v3 sortedArrayUsingComparator:&__block_literal_global_9]);
  unint64_t v12 = [(NSArray *)[(TIAddExtensionKeyboardController *)v17 moduleSpecifiers] count];
  v17->_didRequestOpenAccess = v6;
  if (![obj count]
    || [(TIAddExtensionKeyboardController *)v17 behavesAsModalForAddSheet]
    || ((v6 ^ 1) & 1) != 0)
  {
    v13 = v15;
    if (v12 >= 2) {
      goto LABEL_19;
    }
  }
  else
  {
    -[TIAddExtensionKeyboardController setNetworkAccessSpecifierForKeyboardInputMode:](v17, "setNetworkAccessSpecifierForKeyboardInputMode:", [obj firstObject]);
    v13 = v15;
    objc_msgSend(v15, "addObject:", -[TIAddExtensionKeyboardController networkAccessSpecifier](v17, "networkAccessSpecifier"));
    if (v12 >= 2)
    {
      objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithName:", &stru_26E29DC78));
LABEL_19:
      objc_msgSend(v13, "addObjectsFromArray:", -[TIAddExtensionKeyboardController moduleSpecifiers](v17, "moduleSpecifiers"));
    }
  }
  [(TIAddExtensionKeyboardController *)v17 trackExtensionsContainedInApp];
  return v13;
}

uint64_t __49__TIAddExtensionKeyboardController_newSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 name];
  uint64_t v5 = [a3 name];

  return [v4 localizedStandardCompare:v5];
}

- (void)trackExtensionsContainedInApp
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (TIStatisticShouldSample())
  {
    uint64_t v3 = objc_msgSend((id)-[TIAddExtensionKeyboardController specifier](self, "specifier"), "propertyForKey:", @"TIKBAllIdentifiersKey");
    TIStatisticGetKey();
    [v3 count];
    TIStatisticScalarSetValue();
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "specifiersForExtensionInputMode:parentSpecifier:", *(void *)(*((void *)&v9 + 1) + 8 * i), -[TIAddExtensionKeyboardController specifier](self, "specifier")), "count"))
          {
            ++v6;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
    TIStatisticGetKey();
    TIStatisticScalarSetValue();
  }
}

- (void)setPrivacyAccess:(id)a3 forSpecifier:(id)a4
{
  if (objc_msgSend((id)-[PSSpecifier name](-[TIAddExtensionKeyboardController networkAccessSpecifier](self, "networkAccessSpecifier"), "name"), "isEqualToString:", objc_msgSend(a4, "name")))
  {
    int v7 = objc_msgSend((id)-[PSSpecifier identifier](-[TIAddExtensionKeyboardController networkAccessSpecifier](self, "networkAccessSpecifier"), "identifier"), "isEqualToString:", objc_msgSend(a4, "identifier"));
    int v8 = v7;
    BOOL v9 = self->_hasShownWarning || v7 == 0;
    if (!v9 && [a3 BOOLValue])
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __66__TIAddExtensionKeyboardController_setPrivacyAccess_forSpecifier___block_invoke;
      v24[3] = &unk_264A011C0;
      v24[4] = self;
      long long v10 = NSString;
      uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ADD_THIRD_PARTY_KEYBOARD_WARNING_TITLE", &stru_26E29DC78, @"Keyboard");
      long long v12 = (void *)[(TIAddExtensionKeyboardController *)self specifier];
      uint64_t v13 = objc_msgSend(v10, "stringWithFormat:", v11, objc_msgSend(v12, "propertyForKey:", *MEMORY[0x263F602D0]), v24[0], 3221225472, __66__TIAddExtensionKeyboardController_setPrivacyAccess_forSpecifier___block_invoke, &unk_264A011C0, self);
      uint64_t v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ADD_THIRD_PARTY_KEYBOARD_WARNING_MESSAGE", &stru_26E29DC78, @"Keyboard");
      uint64_t v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ADD_THIRD_PARTY_KEYBOARD_WARNING_CANCEL", &stru_26E29DC78, @"Keyboard");
      uint64_t v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ADD_THIRD_PARTY_KEYBOARD_WARNING_ACTION", &stru_26E29DC78, @"Keyboard");
      -[TIAddExtensionKeyboardController setNetworkAccessAlertController:](self, "setNetworkAccessAlertController:", [MEMORY[0x263F1C3F8] alertControllerWithTitle:v13 message:v14 preferredStyle:1]);
      -[TIAddExtensionKeyboardController setNetworkAccessAlertActionDefault:](self, "setNetworkAccessAlertActionDefault:", [MEMORY[0x263F1C3F0] actionWithTitle:v16 style:0 handler:v24]);
      -[TIAddExtensionKeyboardController setNetworkAccessAlertActionCancel:](self, "setNetworkAccessAlertActionCancel:", [MEMORY[0x263F1C3F0] actionWithTitle:v15 style:1 handler:v24]);
      [(UIAlertController *)[(TIAddExtensionKeyboardController *)self networkAccessAlertController] addAction:[(TIAddExtensionKeyboardController *)self networkAccessAlertActionDefault]];
      [(UIAlertController *)[(TIAddExtensionKeyboardController *)self networkAccessAlertController] addAction:[(TIAddExtensionKeyboardController *)self networkAccessAlertActionCancel]];
      [(TIAddExtensionKeyboardController *)self setSpecifierForWarning:a4];
      char v17 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v17 addObserver:self selector:sel_didEnterBackground_ name:*MEMORY[0x263F1D0D8] object:0];
      if (objc_msgSend((id)-[TIAddExtensionKeyboardController view](self, "view"), "window")) {
        long long v18 = self;
      }
      else {
        long long v18 = (TIAddExtensionKeyboardController *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1CBC8], "keyWindow"), "rootViewController");
      }
      uint64_t v23 = [(TIAddExtensionKeyboardController *)v18 view];
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1CB68], "_viewControllerForFullScreenPresentationFromView:", v23), "presentViewController:animated:completion:", -[TIAddExtensionKeyboardController networkAccessAlertController](self, "networkAccessAlertController"), 1, 0);
      return;
    }
    uint64_t v20 = *MEMORY[0x263F602B0];
    objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F602B0]), "setValue:", a3);
    objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", v20), "reloadWithSpecifier:animated:", a4, 1);
    if (v8)
    {
      [(TIAddExtensionKeyboardController *)self setNetworkPolicyValue:a3];
      self->_didGrantOpenAccess = [a3 BOOLValue];
      return;
    }
  }
  else
  {
    uint64_t v19 = *MEMORY[0x263F602B0];
    objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", *MEMORY[0x263F602B0]), "setValue:", a3);
    objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", v19), "reloadWithSpecifier:animated:", a4, 1);
  }
  long long v21 = [(PSAppListController *)self systemPolicy];
  uint64_t v22 = *(void *)((char *)a4 + (int)*MEMORY[0x263F5FE38]);

  [(PSSystemPolicyForApp *)v21 performSelector:v22 withObject:a3 withObject:a4];
}

uint64_t __66__TIAddExtensionKeyboardController_setPrivacyAccess_forSpecifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) specifierForWarning];
  if (result)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263F1D0D8] object:0];
    *(unsigned char *)(*(void *)(a1 + 32) + 1408) = [*(id *)(a1 + 32) networkAccessAlertActionDefault] == a2;
    objc_msgSend(*(id *)(a1 + 32), "setPrivacyAccess:forSpecifier:", objc_msgSend(NSNumber, "numberWithBool:"), objc_msgSend(*(id *)(a1 + 32), "specifierForWarning"));
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "networkAccessAlertController"), "dismissViewControllerAnimated:completion:", 1, 0);
    [*(id *)(a1 + 32) setSpecifierForWarning:0];
    [*(id *)(a1 + 32) setNetworkAccessAlertController:0];
    [*(id *)(a1 + 32) setNetworkAccessAlertActionCancel:0];
    uint64_t v6 = *(void **)(a1 + 32);
    return [v6 setNetworkAccessAlertActionDefault:0];
  }
  return result;
}

- (void)didEnterBackground:(id)a3
{
  if ([(TIAddExtensionKeyboardController *)self specifierForWarning])
  {
    uint64_t v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x263F1D0D8] object:0];
    [(UIAlertController *)[(TIAddExtensionKeyboardController *)self networkAccessAlertController] dismissViewControllerAnimated:0 completion:0];
    [(TIAddExtensionKeyboardController *)self setSpecifierForWarning:0];
    [(TIAddExtensionKeyboardController *)self setNetworkAccessAlertController:0];
    [(TIAddExtensionKeyboardController *)self setNetworkAccessAlertActionCancel:0];
    [(TIAddExtensionKeyboardController *)self setNetworkAccessAlertActionDefault:0];
  }
  uint64_t v5 = [(TIAddExtensionKeyboardController *)self networkAccessSpecifier];
  uint64_t v6 = (void *)[(PSSpecifier *)v5 propertyForKey:*MEMORY[0x263F602B0]];
  int v7 = [(TIAddExtensionKeyboardController *)self networkAccessSpecifier];

  [v6 reloadWithSpecifier:v7 animated:1];
}

- (void)updateNetworkPolicyStateIfNecessaryForCell:(id)a3
{
  uint64_t v5 = [(TIAddExtensionKeyboardController *)self networkAccessSpecifier];
  if ((id)[(PSSpecifier *)v5 propertyForKey:*MEMORY[0x263F602B0]] == a3)
  {
    [(TIAddExtensionKeyboardController *)self updateNetworkPolicyState];
  }
}

- (void)updateNetworkPolicyState
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (![(TIAddExtensionKeyboardController *)self behavesAsModalForAddSheet])
  {
    CFBundleRef v4 = CFBundleCreate(0, (CFURLRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TIAddExtensionKeyboardController specifier](self, "specifier"), "propertyForKey:", @"TIKBAllIdentifiersKey"), "firstObject"), "containingBundle"), "bundleURL"));
    if (!v4) {
      return;
    }
    CFBundleRef cf = v4;
    uint64_t v5 = (void *)TCCAccessCopyInformationForBundle();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int v3 = 0;
      uint64_t v8 = *(void *)v19;
      BOOL v9 = (void *)MEMORY[0x263F7C4E8];
      long long v10 = (void *)MEMORY[0x263F7C570];
      uint64_t v11 = (void *)MEMORY[0x263F7C4D8];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v13, "objectForKey:", *v9), "isEqualToString:", *v10)) {
            v3 |= objc_msgSend((id)objc_msgSend(v13, "objectForKey:", *v11), "BOOLValue");
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
      if (!v5) {
        goto LABEL_15;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
      if (!v5) {
        goto LABEL_15;
      }
    }
    CFRelease(v5);
LABEL_15:
    CFRelease(cf);
    goto LABEL_16;
  }
  LOBYTE(v3) = 0;
LABEL_16:
  uint64_t v14 = [(TIAddExtensionKeyboardController *)self networkAccessSpecifier];
  uint64_t v15 = *MEMORY[0x263F602B0];
  uint64_t v16 = (void *)[(PSSpecifier *)v14 propertyForKey:*MEMORY[0x263F602B0]];
  objc_msgSend(v16, "setValue:", objc_msgSend(NSNumber, "numberWithBool:", v3 & 1));
  objc_msgSend((id)-[PSSpecifier propertyForKey:](-[TIAddExtensionKeyboardController networkAccessSpecifier](self, "networkAccessSpecifier"), "propertyForKey:", v15), "reloadWithSpecifier:animated:", -[TIAddExtensionKeyboardController networkAccessSpecifier](self, "networkAccessSpecifier"), 1);
}

- (void)setNetworkPolicyValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id obj = (id)objc_msgSend((id)-[TIAddExtensionKeyboardController specifier](self, "specifier"), "propertyForKey:", @"TIKBAllIdentifiersKey");
  CFBundleRef v4 = CFBundleCreate(0, (CFURLRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend(obj, "firstObject"), "containingBundle"), "bundleURL"));
  if (v4)
  {
    CFBundleRef v5 = v4;
    [a3 BOOLValue];
    TCCAccessSetForBundle();
    CFRelease(v5);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      BOOL v9 = (void *)MEMORY[0x263EFFA80];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "extension"), "attributes"), "objectForKey:", @"RequestsOpenAccess"), "BOOLValue"))id v12 = a3; {
          else
          }
            id v12 = v9;
          CFBundleRef v13 = CFBundleCreate(0, (CFURLRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "extension"), "_extensionBundle"), "bundleURL"));
          [v12 BOOLValue];
          TCCAccessSetForBundle();
          CFRelease(v13);
          objc_msgSend((id)objc_msgSend(v11, "extension"), "_kill:", 3);
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
}

- (id)fetchInputModeEnabled:(id)a3
{
  int v3 = (void *)[a3 propertyForKey:*MEMORY[0x263F602B0]];

  return (id)[v3 controlValue];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TIAddExtensionKeyboardController;
  [(PSAppListController *)&v6 viewWillAppear:a3];
  if ([(TIAddExtensionKeyboardController *)self behavesAsModalForAddSheet])
  {
    CFBundleRef v4 = (void *)[(TIAddExtensionKeyboardController *)self navigationItem];
    CFBundleRef v5 = (void *)[(TIAddExtensionKeyboardController *)self specifier];
    objc_msgSend(v4, "setTitle:", objc_msgSend(v5, "propertyForKey:", *MEMORY[0x263F602D0]));
    objc_msgSend(v4, "setRightBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C468]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped));
    objc_msgSend((id)objc_msgSend(v4, "rightBarButtonItem"), "setEnabled:", 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIAddExtensionKeyboardController;
  [(TIAddExtensionKeyboardController *)&v4 viewDidAppear:a3];
  [(TIAddExtensionKeyboardController *)self updateDoneButton];
}

- (id)selectedInputModes
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v3 = (void *)[MEMORY[0x263EFF980] array];
  if ([(NSArray *)[(TIAddExtensionKeyboardController *)self moduleSpecifiers] count] > 1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    CFBundleRef v5 = [(TIAddExtensionKeyboardController *)self moduleSpecifiers];
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      uint64_t v9 = *MEMORY[0x263F602B0];
      uint64_t v10 = *MEMORY[0x263F60138];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "propertyForKey:", v9), "controlValue"), "BOOLValue"))objc_msgSend(v3, "addObject:", objc_msgSend(v12, "propertyForKey:", v10)); {
        }
          }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = [(NSArray *)[(TIAddExtensionKeyboardController *)self moduleSpecifiers] firstObject];
    objc_msgSend(v3, "addObject:", objc_msgSend(v4, "propertyForKey:", *MEMORY[0x263F60138]));
  }
  return v3;
}

- (void)addCheckedInputModes
{
  int v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController"), "enabledInputModeIdentifiers");
  id v4 = [(TIAddExtensionKeyboardController *)self selectedInputModes];
  if ([v4 count])
  {
    +[TIKeyboardListController setInputModes:](TIKeyboardListController, "setInputModes:", [v3 arrayByAddingObjectsFromArray:v4]);
    if (TIStatisticShouldSample())
    {
      if (self->_didRequestOpenAccess)
      {
        TIStatisticGetKey();
        TIStatisticScalarIncrement();
        if (self->_didGrantOpenAccess)
        {
          TIStatisticGetKey();
          TIStatisticScalarIncrement();
        }
      }
    }
  }
}

- (void)updateDoneButton
{
  if ([(TIAddExtensionKeyboardController *)self behavesAsModalForAddSheet])
  {
    BOOL v3 = objc_msgSend(-[TIAddExtensionKeyboardController selectedInputModes](self, "selectedInputModes"), "count") != 0;
    id v4 = objc_msgSend((id)-[TIAddExtensionKeyboardController navigationItem](self, "navigationItem"), "rightBarButtonItem");
    [v4 setEnabled:v3];
  }
}

- (void)cancelButtonTapped
{
  v2 = (void *)[(TIAddExtensionKeyboardController *)self parentController];

  [v2 dismiss];
}

- (void)doneButtonTapped
{
  [(TIAddExtensionKeyboardController *)self addCheckedInputModes];
  BOOL v3 = (void *)[(TIAddExtensionKeyboardController *)self parentController];

  [v3 dismissForDone];
}

- (BOOL)behavesAsModalForAddSheet
{
  return self->_behavesAsModalForAddSheet;
}

- (void)setBehavesAsModalForAddSheet:(BOOL)a3
{
  self->_behavesAsModalForAddSheet = a3;
}

- (PSSpecifier)networkAccessSpecifier
{
  return self->_networkAccessSpecifier;
}

- (void)setNetworkAccessSpecifier:(id)a3
{
}

- (NSArray)moduleSpecifiers
{
  return self->_moduleSpecifiers;
}

- (void)setModuleSpecifiers:(id)a3
{
}

- (PSSpecifier)specifierForWarning
{
  return self->_specifierForWarning;
}

- (void)setSpecifierForWarning:(id)a3
{
}

- (UIAlertController)networkAccessAlertController
{
  return self->_networkAccessAlertController;
}

- (void)setNetworkAccessAlertController:(id)a3
{
}

- (UIAlertAction)networkAccessAlertActionDefault
{
  return self->_networkAccessAlertActionDefault;
}

- (void)setNetworkAccessAlertActionDefault:(id)a3
{
}

- (UIAlertAction)networkAccessAlertActionCancel
{
  return self->_networkAccessAlertActionCancel;
}

- (void)setNetworkAccessAlertActionCancel:(id)a3
{
}

@end