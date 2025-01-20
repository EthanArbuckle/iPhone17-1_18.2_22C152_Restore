@interface VoiceOverBrailleController
+ (int64_t)brailleSettingsInputValue;
+ (int64_t)brailleSettingsOutputValue;
- (id)_brailleDisplayAlertDuration:(id)a3;
- (id)_currentBrailleTable:(id)a3;
- (id)_stringForBrailleMode:(int64_t)a3;
- (id)brailleDisplayInput:(id)a3;
- (id)brailleDisplayOutput:(id)a3;
- (id)gradeTwoAutoTranslatedEnabled:(id)a3;
- (id)specifiers;
- (id)syncTablesEnabled:(id)a3;
- (id)wordWrapEnabled:(id)a3;
- (void)setGradeTwoAutoTransateEnabled:(id)a3 specifier:(id)a4;
- (void)setSyncTablesEnabled:(id)a3 specifier:(id)a4;
- (void)setWordWrap:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation VoiceOverBrailleController

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)VoiceOverBrailleController;
  [(AccessibilityBridgeBaseController *)&v16 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x263F22938] sharedInstance];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __41__VoiceOverBrailleController_viewDidLoad__block_invoke;
  v13[3] = &unk_2651F2418;
  objc_copyWeak(&v14, &location);
  [v3 registerUpdateBlock:v13 forRetrieveSelector:sel_voiceOverBrailleTableIdentifier withListener:self];

  objc_destroyWeak(&v14);
  v4 = [MEMORY[0x263F22938] sharedInstance];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__VoiceOverBrailleController_viewDidLoad__block_invoke_2;
  v11[3] = &unk_2651F2418;
  objc_copyWeak(&v12, &location);
  [v4 registerUpdateBlock:v11 forRetrieveSelector:sel_voiceOverBrailleAlertDisplayDuration withListener:self];

  objc_destroyWeak(&v12);
  v5 = [MEMORY[0x263F22938] sharedInstance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__VoiceOverBrailleController_viewDidLoad__block_invoke_3;
  v9[3] = &unk_2651F2418;
  objc_copyWeak(&v10, &location);
  [v5 registerUpdateBlock:v9 forRetrieveSelector:sel_voiceOverTouchBrailleDisplayOutputMode withListener:self];

  objc_destroyWeak(&v10);
  v6 = [MEMORY[0x263F22938] sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__VoiceOverBrailleController_viewDidLoad__block_invoke_4;
  v7[3] = &unk_2651F2418;
  objc_copyWeak(&v8, &location);
  [v6 registerUpdateBlock:v7 forRetrieveSelector:sel_voiceOverTouchBrailleDisplayInputMode withListener:self];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __41__VoiceOverBrailleController_viewDidLoad__block_invoke(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForID:@"tableIdentifier"];
  [v2 reloadSpecifier:v1 animated:0];
}

void __41__VoiceOverBrailleController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForID:@"voiceOverBrailleAlertDisplayDuration"];
  [v2 reloadSpecifier:v1 animated:0];
}

void __41__VoiceOverBrailleController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForID:@"BrailleDisplayOutput"];
  [v2 reloadSpecifier:v1 animated:1];
}

void __41__VoiceOverBrailleController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 specifierForID:@"BrailleDisplayInput"];
  [v2 reloadSpecifier:v1 animated:1];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = settingsLocString(@"BrailleOutput", @"VoiceOverSettings");
    if (VOSCustomBrailleEnabled())
    {
      v7 = (void *)MEMORY[0x263F5FC40];
      id v8 = settingsLocString(@"BrailleSyncInputOutput", @"VoiceOverSettings");
      v9 = [v7 preferenceSpecifierNamed:v8 target:self set:sel_setSyncTablesEnabled_specifier_ get:sel_syncTablesEnabled_ detail:0 cell:6 edit:0];

      [v5 addObject:v9];
      id v10 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
      int v11 = [v10 BOOLForKey:*MEMORY[0x263F22BB8]];

      if (v11)
      {
        uint64_t v12 = settingsLocString(@"BrailleInputAndOutput", @"VoiceOverSettings");

        v6 = (void *)v12;
      }
      int v13 = v11 ^ 1;
    }
    else
    {
      int v13 = 1;
    }
    id v14 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:self set:0 get:sel_brailleDisplayOutput_ detail:objc_opt_class() cell:2 edit:0];
    uint64_t v15 = *MEMORY[0x263F60138];
    [v14 setProperty:@"BrailleDisplayOutput" forKey:*MEMORY[0x263F60138]];
    [v5 addObject:v14];
    v38 = v6;
    if (v13)
    {
      objc_super v16 = (void *)MEMORY[0x263F5FC40];
      v17 = settingsLocString(@"BrailleInput", @"VoiceOverSettings");
      v18 = [v16 preferenceSpecifierNamed:v17 target:self set:0 get:sel_brailleDisplayInput_ detail:objc_opt_class() cell:2 edit:0];

      [v18 setProperty:@"BrailleDisplayInput" forKey:v15];
      [v5 addObject:v18];
      id v14 = v18;
    }
    v19 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];

    [v5 addObject:v19];
    if (VOSCustomBrailleEnabled())
    {
      v20 = (void *)MEMORY[0x263F5FC40];
      v21 = settingsLocString(@"GRADE2_AUTO_TRANSLATE", @"VoiceOverSettings");
      uint64_t v22 = [v20 preferenceSpecifierNamed:v21 target:self set:sel_setGradeTwoAutoTransateEnabled_specifier_ get:sel_gradeTwoAutoTranslatedEnabled_ detail:0 cell:6 edit:0];

      [v5 addObject:v22];
      v19 = (void *)v22;
    }
    v23 = (void *)MEMORY[0x263F5FC40];
    v24 = settingsLocString(@"WORD_WRAP", @"VoiceOverSettings");
    v25 = [v23 preferenceSpecifierNamed:v24 target:self set:sel_setWordWrap_specifier_ get:sel_wordWrapEnabled_ detail:0 cell:6 edit:0];

    [v5 addObject:v25];
    v26 = (void *)MEMORY[0x263F5FC40];
    v27 = settingsLocString(@"BRAILLE_DISPLAY_TIMEOUT", @"VoiceOverSettings");
    v28 = [v26 preferenceSpecifierNamed:v27 target:self set:0 get:sel__brailleDisplayAlertDuration_ detail:objc_opt_class() cell:2 edit:0];

    [v28 setProperty:@"voiceOverBrailleAlertDisplayDuration" forKey:v15];
    [v5 addObject:v28];
    v29 = [MEMORY[0x263EFF960] preferredLanguages];
    v30 = [v29 firstObject];
    int v31 = [v30 hasPrefix:@"en"];

    if (v31)
    {
      v32 = (void *)MEMORY[0x263F5FC40];
      v33 = settingsLocString(@"BRAILLE_TABLES", @"VoiceOverSettings");
      v34 = [v32 preferenceSpecifierNamed:v33 target:self set:0 get:sel__currentBrailleTable_ detail:objc_opt_class() cell:1 edit:0];

      [v34 setProperty:@"tableIdentifier" forKey:v15];
      [v5 addObject:v34];
      v25 = v34;
    }
    v35 = (objc_class *)[v5 copy];
    v36 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v35;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)_currentBrailleTable:(id)a3
{
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v4 = [v3 objectForKey:*MEMORY[0x263F22BC0]];

  if (!v4
    || [v4 isEqualToString:@"com.apple.scrod.braille.table.duxbury.eng-xueb"])
  {
    v5 = @"ENGLISH_UNIFIED_BRAILLE_TABLE";
LABEL_4:
    v6 = settingsLocString(v5, @"VoiceOverSettings");
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"com.apple.scrod.braille.table.duxbury.eng-xna"])
  {
    v5 = @"ENGLISH_US_BRAILLE_TABLE";
    goto LABEL_4;
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x263F2BAB0]) initWithIdentifier:v4];
  v6 = [v8 localizedName];

LABEL_5:

  return v6;
}

- (id)_brailleDisplayAlertDuration:(id)a3
{
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v4 = [v3 objectForKey:*MEMORY[0x263F22B88]];

  if (v4) {
    [v4 doubleValue];
  }
  v5 = AXLocalizedTimeSummary();

  return v5;
}

- (void)setWordWrap:(id)a3 specifier:(id)a4
{
}

- (id)wordWrapEnabled:(id)a3
{
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v4 = [v3 objectForKey:*MEMORY[0x263F22BC8]];

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)MEMORY[0x263EFFA88];
  }

  return v5;
}

+ (int64_t)brailleSettingsOutputValue
{
  id v2 = [a1 accessibilityDomainAccessor];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F22BA8]];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

+ (int64_t)brailleSettingsInputValue
{
  id v2 = [a1 accessibilityDomainAccessor];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F22B90]];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (id)brailleDisplayOutput:(id)a3
{
  if (VOSCustomBrailleEnabled())
  {
    int64_t v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    id v5 = [v4 objectForKey:*MEMORY[0x263F22BB0]];

    v6 = (void *)[objc_alloc(MEMORY[0x263F2BAB0]) initWithIdentifier:v5];
    v7 = [v6 localizedNameWithService];
  }
  else
  {
    v7 = -[VoiceOverBrailleController _stringForBrailleMode:](self, "_stringForBrailleMode:", [(id)objc_opt_class() brailleSettingsOutputValue]);
  }

  return v7;
}

- (id)brailleDisplayInput:(id)a3
{
  if (VOSCustomBrailleEnabled())
  {
    int64_t v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    id v5 = [v4 objectForKey:*MEMORY[0x263F22B98]];

    v6 = (void *)[objc_alloc(MEMORY[0x263F2BAB0]) initWithIdentifier:v5];
    v7 = [v6 localizedNameWithService];
  }
  else
  {
    v7 = -[VoiceOverBrailleController _stringForBrailleMode:](self, "_stringForBrailleMode:", [(id)objc_opt_class() brailleSettingsInputValue]);
  }

  return v7;
}

- (id)_stringForBrailleMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = settingsLocString(off_2651F2490[a3 - 1], @"VoiceOverSettings");
  }
  return v4;
}

- (id)syncTablesEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  int64_t v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x263F22BB8]));

  return v5;
}

- (void)setSyncTablesEnabled:(id)a3 specifier:(id)a4
{
  [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:a3 forKey:*MEMORY[0x263F22BB8]];
  id v5 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  id v6 = [v5 objectForKey:*MEMORY[0x263F22BB0]];

  [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v6 forKey:*MEMORY[0x263F22B98]];
  [(VoiceOverBrailleController *)self reloadSpecifiers];
}

- (id)gradeTwoAutoTranslatedEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  int64_t v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x263F22BD0]));

  return v5;
}

- (void)setGradeTwoAutoTransateEnabled:(id)a3 specifier:(id)a4
{
}

@end