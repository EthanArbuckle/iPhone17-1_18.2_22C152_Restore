@interface TripleClickController
- (BOOL)_deviceSupportsShortcutMenu;
- (id)enabledTripleClickSettings;
- (id)specifiers;
- (int)_optionFromSpecifierKey:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_saveTripleClickOptions:(id)a3;
- (void)dealloc;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TripleClickController

- (int)_optionFromSpecifierKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"voiceover"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"zoom"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"touchaccommodations"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"hearingdevices"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"watchcontrol"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"reducetransparency"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"increasecontrast"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"reducemotion"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"leftrightbalance"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"off"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"controlnearbydevices"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"livespeech"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"colorfilters"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"increasebrightnessfloor"])
  {
    int v4 = 41;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  int v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(TripleClickController *)self loadSpecifiersFromPlistName:@"TripleClickSettings" target:self];
    v6 = AXGetActivePairedDevice();
    v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"D7B1DB8F-6F20-44A7-B454-95B8A418D208"];
    int v8 = [v6 supportsCapability:v7];

    if (v8)
    {
      v9 = (void *)MEMORY[0x263F5FC40];
      v10 = settingsLocString(@"WATCH_CONTROL_TRIPLE_CLICK_TITLE", @"AccessibilitySettings-watchcontrol");
      v11 = [v9 preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v11 setProperty:@"watchcontrol" forKey:@"tripleClickOption"];
      uint64_t v12 = [v5 indexOfObjectPassingTest:&__block_literal_global_3];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        [v5 addObject:v11];
      }
      else {
        [v5 insertObject:v11 atIndex:v12 + 1];
      }
    }
    BOOL v13 = [(TripleClickController *)self _deviceSupportsShortcutMenu];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __35__TripleClickController_specifiers__block_invoke_2;
    v17[3] = &__block_descriptor_33_e28_B32__0__PSSpecifier_8Q16_B24l;
    BOOL v18 = v13;
    v14 = [v5 indexesOfObjectsPassingTest:v17];
    if ([v14 count]) {
      [v5 removeObjectsAtIndexes:v14];
    }
    [v5 sortUsingComparator:&__block_literal_global_336];
    v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    int v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

uint64_t __35__TripleClickController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"TRIPLE_CLICK_ZOOM_ROW_ID"];

  return v3;
}

uint64_t __35__TripleClickController_specifiers__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 propertyForKey:@"requiresShortcutMenu"];
  if ([v3 BOOLValue])
  {
    int v4 = *(unsigned __int8 *)(a1 + 32);

    if (!v4) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

uint64_t __35__TripleClickController_specifiers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 identifier];
  char v7 = [v6 isEqualToString:@"TRIPLE_CLICK_INTRO_TEXT"];

  if (v7)
  {
    uint64_t v8 = -1;
  }
  else
  {
    v9 = [v5 identifier];
    char v10 = [v9 isEqualToString:@"TRIPLE_CLICK_INTRO_TEXT"];

    if (v10)
    {
      uint64_t v8 = 1;
    }
    else
    {
      v11 = [v4 name];
      uint64_t v12 = [v5 name];
      uint64_t v8 = [v11 localizedCompare:v12];
    }
  }

  return v8;
}

- (BOOL)_deviceSupportsShortcutMenu
{
  v2 = AXGetActivePairedDevice();
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"FEE09F8C-155A-48C0-AF0E-5F62F88238BC"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

- (id)enabledTripleClickSettings
{
  v2 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v3 = [v2 objectForKey:@"TripleClickOptions"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = (id)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (void)_saveTripleClickOptions:(id)a3
{
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v17 = a4;
  v6 = [v17 specifier];
  char v7 = [v6 propertyForKey:@"tripleClickOption"];
  uint64_t v8 = [(TripleClickController *)self _optionFromSpecifierKey:v7];

  v9 = [(TripleClickController *)self enabledTripleClickSettings];
  char v10 = [NSNumber numberWithUnsignedInt:v8];
  if ([v9 containsObject:v10])
  {

LABEL_5:
    [v17 setChecked:1];
    goto LABEL_6;
  }
  v11 = [(TripleClickController *)self enabledTripleClickSettings];
  uint64_t v12 = [v11 count];

  if (!v12 && !v8) {
    goto LABEL_5;
  }
LABEL_6:
  if (v8 == 23)
  {
    BOOL v13 = NSNumber;
    v14 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    int v15 = [v14 BOOLForKey:@"VoiceOverTouchEnabled"];
  }
  else
  {
    if (v8 != 1) {
      goto LABEL_11;
    }
    BOOL v13 = NSNumber;
    v14 = [MEMORY[0x263F85B10] sharedInstance];
    int v15 = [v14 featureEnabled];
  }
  v16 = [v13 numberWithInt:v15 ^ 1u];
  [v6 setProperty:v16 forKey:*MEMORY[0x263F600A8]];

LABEL_11:
}

- (void)viewWillAppear:(BOOL)a3
{
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) setDelegate:self];
  v4.receiver = self;
  v4.super_class = (Class)TripleClickController;
  [(AccessibilityBridgeBaseController *)&v4 viewWillAppear:1];
  [(TripleClickController *)self willBecomeActive];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TripleClickController;
  [(AccessibilityBridgeBaseController *)&v4 dealloc];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)TripleClickController;
  [(TripleClickController *)&v32 tableView:v6 didSelectRowAtIndexPath:v7];
  uint64_t v8 = [v6 cellForRowAtIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v9 = [v8 isChecked];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    char v10 = objc_msgSend(v6, "visibleCells", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) setChecked:0];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v12);
    }

    int v15 = [v8 specifier];
    [v8 setChecked:v9 ^ 1u];
    v16 = [v15 propertyForKey:@"tripleClickOption"];
    uint64_t v17 = [(TripleClickController *)self _optionFromSpecifierKey:v16];

    if ([(TripleClickController *)self _deviceSupportsShortcutMenu])
    {
      BOOL v18 = (void *)MEMORY[0x263EFF980];
      v19 = [(TripleClickController *)self enabledTripleClickSettings];
      v20 = [v18 arrayWithArray:v19];

      [v20 removeObject:&unk_26FB00628];
      char v21 = [v8 isChecked];
      v22 = [NSNumber numberWithUnsignedInt:v17];
      if (v21) {
        [v20 addObject:v22];
      }
      else {
        [v20 removeObject:v22];
      }

      if (v17 == 11)
      {
        v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isChecked"));
        uint64_t v26 = *MEMORY[0x263F22AC0];
        v27 = [(AccessibilityBridgeBaseController *)self touchAccommodationsDomainAccessor];
        [(AccessibilityBridgeBaseController *)self setGizmoPref:v25 forKey:v26 domainAccessor:v27];
      }
      [(TripleClickController *)self _saveTripleClickOptions:v20];
    }
    else
    {
      if ([v8 isChecked]) {
        uint64_t v23 = v17;
      }
      else {
        uint64_t v23 = 0;
      }
      v20 = [NSNumber numberWithUnsignedInt:v23];
      v33 = v20;
      v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
      [(TripleClickController *)self _saveTripleClickOptions:v24];
    }
  }
}

@end