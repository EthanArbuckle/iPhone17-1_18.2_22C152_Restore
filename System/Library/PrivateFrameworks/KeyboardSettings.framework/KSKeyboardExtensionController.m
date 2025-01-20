@interface KSKeyboardExtensionController
+ (id)keyboardsForBundleID:(id)a3;
- (KSAboutKeyboardPrivacyController)aboutPrivacyController;
- (KSAddExtensionKeyboardController)addExtensionKeyboardController;
- (PSSpecifier)lastInputModeSpecifier;
- (id)isKeyboardEnabled:(id)a3;
- (id)specifiers;
- (void)dealloc;
- (void)setAboutPrivacyController:(id)a3;
- (void)setAddExtensionKeyboardController:(id)a3;
- (void)setKeyboardEnabled:(id)a3 specifier:(id)a4;
- (void)setLastInputModeSpecifier:(id)a3;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidLoad;
@end

@implementation KSKeyboardExtensionController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)KSKeyboardExtensionController;
  [(KSKeyboardExtensionController *)&v4 viewDidLoad];
  uint64_t v3 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionHeaderHeight:0.0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setEstimatedSectionFooterHeight:0.0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KSKeyboardExtensionController;
  [(KSKeyboardExtensionController *)&v3 dealloc];
}

- (id)isKeyboardEnabled:(id)a3
{
  id v4 = +[KSKeyboardListController inputModes];
  v5 = NSNumber;
  uint64_t v6 = objc_msgSend(v4, "containsObject:", objc_msgSend(a3, "propertyForKey:", *MEMORY[0x263F60138]));
  return (id)[v5 numberWithBool:v6];
}

- (void)setKeyboardEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v6 = [a4 propertyForKey:*MEMORY[0x263F60138]];
  id v7 = (id)objc_msgSend(+[KSKeyboardListController inputModes](KSKeyboardListController, "inputModes"), "mutableCopy");
  uint64_t v8 = [v7 count];
  if ([a3 BOOLValue])
  {
    if (([v7 containsObject:v6] & 1) == 0) {
      [v7 addObject:v6];
    }
  }
  else
  {
    [v7 removeObject:v6];
  }
  if (v8 != [v7 count])
  {
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C758], "sharedPreferencesController"), "preferencesActions");
    if ([v7 count]) {
      id v10 = v7;
    }
    else {
      id v10 = 0;
    }
    [v9 saveInputModes:v10];
  }
  if ([(KSAddExtensionKeyboardController *)[(KSKeyboardExtensionController *)self addExtensionKeyboardController] networkAccessSpecifier])
  {
    v11 = objc_msgSend((id)-[KSKeyboardExtensionController specifier](self, "specifier"), "propertyForKey:", @"TIKBIdentifiersKey");
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__KSKeyboardExtensionController_setKeyboardEnabled_specifier___block_invoke;
    v17[3] = &unk_2653A9550;
    v17[4] = v7;
    uint64_t v12 = [v11 indexOfObjectPassingTest:v17];
    uint64_t v13 = (int)*MEMORY[0x263F5FDB8];
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v13);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __62__KSKeyboardExtensionController_setKeyboardEnabled_specifier___block_invoke_2;
    v16[3] = &unk_2653A9578;
    v16[4] = self;
    uint64_t v15 = [v14 indexOfObjectPassingTest:v16];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL || v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v12 == 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL) {
        -[KSKeyboardExtensionController removeSpecifier:animated:](self, "removeSpecifier:animated:", [*(id *)((char *)&self->super.super.super.super.super.isa + v13) objectAtIndexedSubscript:v15], 1);
      }
    }
    else
    {
      [(KSKeyboardExtensionController *)self insertSpecifier:[(KSAddExtensionKeyboardController *)[(KSKeyboardExtensionController *)self addExtensionKeyboardController] networkAccessSpecifier] afterSpecifier:[(KSKeyboardExtensionController *)self lastInputModeSpecifier] animated:1];
      [(KSAddExtensionKeyboardController *)[(KSKeyboardExtensionController *)self addExtensionKeyboardController] updateNetworkPolicyState];
    }
  }
}

uint64_t __62__KSKeyboardExtensionController_setKeyboardEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  return [v2 containsObject:v3];
}

uint64_t __62__KSKeyboardExtensionController_setKeyboardEnabled_specifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 name];
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "addExtensionKeyboardController"), "networkAccessSpecifier"), "name");
  return [v3 isEqualToString:v4];
}

- (id)specifiers
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v24 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v24)
  {
    uint64_t v20 = (int)*MEMORY[0x263F5FDB8];
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    -[KSKeyboardExtensionController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"KEYBOARDS_SHORT", &stru_2703C6C20, @"Keyboard"));
    v24 = v3;
    uint64_t v22 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    objc_msgSend(v3, "addObject:");
    uint64_t v4 = objc_opt_class();
    v23 = self;
    v5 = (void *)[(KSKeyboardExtensionController *)self specifier];
    uint64_t v6 = objc_msgSend(v4, "keyboardsForBundleID:", objc_msgSend(v5, "propertyForKey:", *MEMORY[0x263F5FF00]));
    id v7 = +[KSKeyboardListController inputModes];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v6;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v26;
      uint64_t v12 = *MEMORY[0x263F60138];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v14, "displayName"), v23, sel_setKeyboardEnabled_specifier_, sel_isKeyboardEnabled_, 0, 6, 0);
          objc_msgSend(v15, "setProperty:forKey:", objc_msgSend(v14, "identifier"), v12);
          [v15 setProperty:v22 forKey:@"GroupHeader"];
          [v24 addObject:v15];
          v10 |= objc_msgSend(v7, "containsObject:", objc_msgSend(v14, "identifier"));
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v9);
    }
    else
    {
      LOBYTE(v10) = 0;
    }
    -[KSKeyboardExtensionController setLastInputModeSpecifier:](v23, "setLastInputModeSpecifier:", [v24 lastObject]);
    v16 = (void *)[obj firstObject];
    objc_msgSend((id)-[KSKeyboardExtensionController specifier](v23, "specifier"), "setProperty:forKey:", obj, @"TIKBIdentifiersKey");
    objc_msgSend((id)-[KSKeyboardExtensionController specifier](v23, "specifier"), "setProperty:forKey:", obj, @"TIKBAllIdentifiersKey");
    v17 = (void *)[(KSKeyboardExtensionController *)v23 specifier];
    id v18 = +[KSKeyboardListController keyboardDisplayNameForIdentifier:](KSKeyboardListController, "keyboardDisplayNameForIdentifier:", [v16 identifier]);
    [v17 setProperty:v18 forKey:*MEMORY[0x263F602D0]];
    [(KSKeyboardExtensionController *)v23 setAddExtensionKeyboardController:objc_alloc_init(KSAddExtensionKeyboardController)];
    [(KSAddExtensionKeyboardController *)[(KSKeyboardExtensionController *)v23 addExtensionKeyboardController] setSpecifier:[(KSKeyboardExtensionController *)v23 specifier]];
    [(KSAddExtensionKeyboardController *)[(KSKeyboardExtensionController *)v23 addExtensionKeyboardController] setNetworkAccessSpecifierForKeyboardInputMode:v16];
    if ((v10 & 1) != 0
      && [(KSAddExtensionKeyboardController *)[(KSKeyboardExtensionController *)v23 addExtensionKeyboardController] networkAccessSpecifier])
    {
      objc_msgSend(v24, "addObject:", -[KSAddExtensionKeyboardController networkAccessSpecifier](-[KSKeyboardExtensionController addExtensionKeyboardController](v23, "addExtensionKeyboardController"), "networkAccessSpecifier"));
    }
    if ([(KSKeyboardExtensionController *)v23 aboutPrivacyController]) {
      [(KSAboutKeyboardPrivacyController *)[(KSKeyboardExtensionController *)v23 aboutPrivacyController] setSpecifier:v22];
    }
    else {
      [(KSKeyboardExtensionController *)v23 setAboutPrivacyController:[[KSAboutKeyboardPrivacyController alloc] initWithGroupSpecifier:v22 asHeader:0 inListController:v23]];
    }
    objc_msgSend(v24, "addObjectsFromArray:", +[KSAddExtensionKeyboardController specifiersForExtensionInputMode:parentSpecifier:](KSAddExtensionKeyboardController, "specifiersForExtensionInputMode:parentSpecifier:", objc_msgSend(obj, "firstObject"), -[KSKeyboardExtensionController specifier](v23, "specifier")));
    *(Class *)((char *)&v23->super.super.super.super.super.isa + v20) = (Class)v24;
  }
  return v24;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  [(KSAddExtensionKeyboardController *)[(KSKeyboardExtensionController *)self addExtensionKeyboardController] updateNetworkPolicyState];
  uint64_t v8 = [(KSKeyboardExtensionController *)self aboutPrivacyController];
  [(KSAboutKeyboardPrivacyController *)v8 addPrivacyLinkViewIfNecessaryToHeaderView:a4 forSection:a5];
}

+ (id)keyboardsForBundleID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C748], "sharedInputModeController", 0), "extensionInputModes");
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)objc_msgSend(v10, "containingBundle"), "bundleIdentifier")))objc_msgSend(v4, "addObject:", v10); {
      }
        }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v4;
}

- (KSAboutKeyboardPrivacyController)aboutPrivacyController
{
  return self->_aboutPrivacyController;
}

- (void)setAboutPrivacyController:(id)a3
{
}

- (KSAddExtensionKeyboardController)addExtensionKeyboardController
{
  return self->_addExtensionKeyboardController;
}

- (void)setAddExtensionKeyboardController:(id)a3
{
}

- (PSSpecifier)lastInputModeSpecifier
{
  return self->_lastInputModeSpecifier;
}

- (void)setLastInputModeSpecifier:(id)a3
{
}

@end