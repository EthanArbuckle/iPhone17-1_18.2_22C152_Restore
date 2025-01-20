@interface ASTLockScreenSuggestionSpecifier
- (ASTLockScreenSuggestionSpecifier)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (id)isLockScreenSwitchEnabled:(id)a3;
- (id)specifierForBundleID:(id)a3;
- (id)specifiers;
- (void)setLockScreenSwitchEnabled:(id)a3 forSpecifier:(id)a4;
- (void)specifiers;
@end

@implementation ASTLockScreenSuggestionSpecifier

- (ASTLockScreenSuggestionSpecifier)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ASTLockScreenSuggestionSpecifier;
  return [(ASTLockScreenSuggestionSpecifier *)&v5 init];
}

- (id)specifiers
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!self->_disabledLockScreenBundles)
  {
    v3 = [MEMORY[0x263F287A8] sharedInstance];
    v4 = [v3 disabledLockScreenBundles];
    disabledLockScreenBundles = self->_disabledLockScreenBundles;
    self->_disabledLockScreenBundles = v4;
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  v6 = (void (*)(void))getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
  v25 = getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
  if (!getSBSCopyDisplayIdentifiersSymbolLoc_ptr)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke;
    v21[3] = &unk_26457D098;
    v21[4] = &v22;
    __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke((uint64_t)v21);
    v6 = (void (*)(void))v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (!v6) {
    -[ASTLockScreenSuggestionSpecifier specifiers]();
  }
  v7 = v6();
  uint64_t v8 = [v7 count];
  v9 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = -[ASTLockScreenSuggestionSpecifier specifierForBundleID:](self, "specifierForBundleID:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        if (v14) {
          [v9 addObject:v14];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }
    while (v11);
  }

  v15 = [v9 sortedArrayUsingComparator:&__block_literal_global_3];

  return v15;
}

uint64_t __46__ASTLockScreenSuggestionSpecifier_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_super v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (id)specifierForBundleID:(id)a3
{
  id v4 = [MEMORY[0x263F01868] applicationProxyForIdentifier:a3];
  objc_super v5 = [v4 bundleIdentifier];

  if (v5)
  {
    v6 = [v4 localizedName];
    if ([v6 length])
    {
LABEL_6:
      uint64_t v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:self set:sel_setLockScreenSwitchEnabled_forSpecifier_ get:sel_isLockScreenSwitchEnabled_ detail:0 cell:6 edit:0];
      [v8 setProperty:v6 forKey:@"APP_NAME"];
      v9 = [v4 bundleIdentifier];
      [v8 setProperty:v9 forKey:@"BUNDLE_ID"];

      [v8 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601A8]];
      id v10 = [v4 bundleIdentifier];
      [v8 setProperty:v10 forKey:*MEMORY[0x263F60188]];

      goto LABEL_8;
    }
    uint64_t v7 = [v4 localizedShortName];

    if ([v7 length])
    {
      v6 = v7;
      goto LABEL_6;
    }
    v6 = [v4 itemName];

    if (v6) {
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (id)isLockScreenSwitchEnabled:(id)a3
{
  v3 = NSNumber;
  disabledLockScreenBundles = self->_disabledLockScreenBundles;
  objc_super v5 = [a3 propertyForKey:@"BUNDLE_ID"];
  v6 = objc_msgSend(v3, "numberWithInt:", -[NSSet containsObject:](disabledLockScreenBundles, "containsObject:", v5) ^ 1);

  return v6;
}

- (void)setLockScreenSwitchEnabled:(id)a3 forSpecifier:(id)a4
{
  v6 = (void *)MEMORY[0x263F287A8];
  id v7 = a4;
  id v8 = a3;
  id v13 = [v6 sharedInstance];
  uint64_t v9 = [v8 BOOLValue];

  id v10 = [v7 propertyForKey:@"BUNDLE_ID"];

  [v13 setLockScreenEnabled:v9 bundleId:v10];
  uint64_t v11 = [v13 disabledLockScreenBundles];
  disabledLockScreenBundles = self->_disabledLockScreenBundles;
  self->_disabledLockScreenBundles = v11;
}

- (void).cxx_destruct
{
}

- (void)specifiers
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"CFSetRef PSSBSCopyDisplayIdentifiers(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ASTLockScreenSuggestionSpecifier.m", 18, @"%s", dlerror());

  __break(1u);
}

@end