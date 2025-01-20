@interface VoiceOverBrailleInputOutputController
- (BOOL)_isActivityMode;
- (BOOL)_isDisplayInput;
- (BOOL)_isGesturesInput;
- (BOOL)_shouldShowAutoTranslate;
- (BOOL)_shouldShowEightDotBraille;
- (id)gradeTwoAutoTranslatedEnabled:(id)a3;
- (id)preCustomBrailleSpecifiers;
- (id)specifiers;
- (void)setGradeTwoAutoTransateEnabled:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation VoiceOverBrailleInputOutputController

- (BOOL)_isDisplayInput
{
  v2 = [(VoiceOverBrailleInputOutputController *)self specifier];
  v3 = [v2 propertyForKey:*MEMORY[0x263F60138]];
  char v4 = [v3 isEqualToString:@"BrailleDisplayInput"];

  return v4;
}

- (BOOL)_isActivityMode
{
  v2 = [(VoiceOverBrailleInputOutputController *)self specifier];
  v3 = [v2 propertyForKey:*MEMORY[0x263F60138]];
  char v4 = [v3 isEqualToString:@"VoiceOverBrailleActivityModeID"];

  return v4;
}

- (BOOL)_isGesturesInput
{
  v2 = [(VoiceOverBrailleInputOutputController *)self specifier];
  v3 = [v2 propertyForKey:*MEMORY[0x263F60138]];
  char v4 = [v3 isEqualToString:@"BrailleGesturesInput"];

  return v4;
}

- (BOOL)_shouldShowEightDotBraille
{
  if ([(VoiceOverBrailleInputOutputController *)self _isGesturesInput])
  {
    JUMPOUT(0x24C53F400);
  }
  return 1;
}

- (id)specifiers
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (VOSCustomBrailleEnabled())
  {
    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
    if (!v3)
    {
      uint64_t v24 = (int)*MEMORY[0x263F5FDB8];
      char v4 = [MEMORY[0x263EFF980] array];
      v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
      v25 = v4;
      [v4 addObject:v5];
      v26 = self;
      v6 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
      v7 = [v6 objectForKey:*MEMORY[0x263F22BA0]];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v28 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = VOSBrailleTableForRotorItem();
            v14 = [v13 replacements];
            uint64_t v15 = [v14 count];

            if (!v15)
            {
              v16 = (void *)MEMORY[0x263F5FC40];
              v17 = [v13 localizedNameWithService];
              v18 = [v16 preferenceSpecifierNamed:v17 target:v26 set:0 get:0 detail:0 cell:3 edit:0];

              [v18 setProperty:MEMORY[0x263EFFA88] forKey:@"IsLanguage"];
              [v18 setProperty:v13 forKey:@"Table"];
              v19 = [v13 identifier];
              [v18 setProperty:v19 forKey:@"TableIdentifier"];

              [v25 addObject:v18];
              v5 = v18;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v10);
      }

      v20 = *(Class *)((char *)&v26->super.super.super.super.super.super.isa + v24);
      *(Class *)((char *)&v26->super.super.super.super.super.super.isa + v24) = (Class)v25;
      id v21 = v25;

      v3 = *(Class *)((char *)&v26->super.super.super.super.super.super.isa + v24);
    }
    id v22 = v3;
  }
  else
  {
    id v22 = [(VoiceOverBrailleInputOutputController *)self preCustomBrailleSpecifiers];
  }

  return v22;
}

- (id)preCustomBrailleSpecifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  char v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    uint64_t v7 = [v6 stringForKey:*MEMORY[0x263F22BC0]];

    id v8 = (void *)[objc_alloc(MEMORY[0x263F2BAB0]) initWithIdentifier:v7];
    uint64_t v32 = v8;
    if (v7)
    {
      uint64_t v9 = v8;
      unsigned int v31 = [v8 supportsTranslationModeContracted];
      uint64_t v10 = [v9 supportsTranslationMode8Dot];
    }
    else
    {
      unsigned int v31 = 1;
      uint64_t v10 = 1;
    }
    uint64_t v11 = (void *)MEMORY[0x263F5FC40];
    v12 = settingsLocString(@"SIXDOT_MODE", @"VoiceOverSettings");
    v13 = [v11 preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

    uint64_t v14 = *MEMORY[0x263F60138];
    [v13 setProperty:@"SixDotBraille" forKey:*MEMORY[0x263F60138]];
    [v5 addObject:v13];
    v33 = (void *)v7;
    if ([(VoiceOverBrailleInputOutputController *)self _shouldShowEightDotBraille])
    {
      uint64_t v15 = (void *)MEMORY[0x263F5FC40];
      v16 = settingsLocString(@"EIGHTDOT_MODE", @"VoiceOverSettings");
      v17 = [v15 preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:3 edit:0];

      [v17 setProperty:@"EightDotBraille" forKey:v14];
      v18 = [NSNumber numberWithBool:v10];
      uint64_t v34 = *MEMORY[0x263F600A8];
      objc_msgSend(v17, "setProperty:forKey:", v18);

      [v5 addObject:v17];
      v13 = v17;
    }
    else
    {
      uint64_t v34 = *MEMORY[0x263F600A8];
    }
    v19 = (void *)MEMORY[0x263F5FC40];
    v20 = settingsLocString(@"CONTRACTION_MODE", @"VoiceOverSettings");
    id v21 = [v19 preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v21 setProperty:@"ContractedBraille" forKey:v14];
    id v22 = [NSNumber numberWithBool:v31];
    [v21 setProperty:v22 forKey:v34];

    [v5 addObject:v21];
    if ([(VoiceOverBrailleInputOutputController *)self _isDisplayInput])
    {
      v23 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
      [v5 addObject:v23];
      uint64_t v24 = (void *)MEMORY[0x263F5FC40];
      v25 = settingsLocString(@"GRADE2_AUTO_TRANSLATE", @"VoiceOverSettings");
      v26 = [v24 preferenceSpecifierNamed:v25 target:self set:sel_setGradeTwoAutoTransateEnabled_specifier_ get:sel_gradeTwoAutoTranslatedEnabled_ detail:0 cell:6 edit:0];

      [v26 setProperty:@"GRADE2_AUTO_TRANSLATE" forKey:v14];
      [v5 addObject:v26];
      BOOL v27 = [(VoiceOverBrailleInputOutputController *)self _shouldShowAutoTranslate];
      long long v28 = [NSNumber numberWithBool:v27];
      [v26 setProperty:v28 forKey:v34];

      id v21 = v26;
    }
    long long v29 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    char v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (BOOL)_shouldShowAutoTranslate
{
  if ([(VoiceOverBrailleInputOutputController *)self _isActivityMode]) {
    return 0;
  }
  char v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v5 = [v4 integerForKey:*MEMORY[0x263F22B90]];

  return (v5 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (id)gradeTwoAutoTranslatedEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  char v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x263F22BD0]));

  return v5;
}

- (void)setGradeTwoAutoTransateEnabled:(id)a3 specifier:(id)a4
{
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v20 = a4;
  uint64_t v7 = [(AccessibilityBridgeBaseController *)self specifierForIndexPath:a5];
  if (VOSCustomBrailleEnabled())
  {
    id v8 = [v7 propertyForKey:@"TableIdentifier"];
    BOOL v9 = [(VoiceOverBrailleInputOutputController *)self _isDisplayInput];
    uint64_t v10 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    uint64_t v11 = v10;
    v12 = (void *)MEMORY[0x263F22B98];
    if (!v9) {
      v12 = (void *)MEMORY[0x263F22BB0];
    }
    v13 = [v10 objectForKey:*v12];

    if (v13 && ([v8 isEqualToString:v13] & 1) != 0) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = 0;
    }
    [v20 setAccessoryType:v14];
  }
  else
  {
    id v8 = [v7 propertyForKey:*MEMORY[0x263F60138]];
    if ([(VoiceOverBrailleInputOutputController *)self _isDisplayInput]) {
      int64_t v15 = +[VoiceOverBrailleController brailleSettingsInputValue];
    }
    else {
      int64_t v15 = +[VoiceOverBrailleController brailleSettingsOutputValue];
    }
    int64_t v16 = v15;
    if ([v8 isEqualToString:@"SixDotBraille"])
    {
      uint64_t v17 = 1;
    }
    else
    {
      int v18 = [v8 isEqualToString:@"EightDotBraille"];
      uint64_t v17 = 2;
      if (!v18) {
        uint64_t v17 = 3;
      }
    }
    if (v17 == v16) {
      uint64_t v19 = 3;
    }
    else {
      uint64_t v19 = 0;
    }
    [v20 setAccessoryType:v19];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = [v6 visibleCells];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = __UIAccessibilitySafeClass();
        [v13 setChecked:0];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [v6 cellForRowAtIndexPath:v7];
  int64_t v15 = __UIAccessibilitySafeClass();

  [v15 setChecked:1];
  int64_t v16 = [(AccessibilityBridgeBaseController *)self specifierForIndexPath:v7];
  if (!VOSCustomBrailleEnabled())
  {
    uint64_t v20 = *MEMORY[0x263F60138];
    id v21 = [v16 propertyForKey:*MEMORY[0x263F60138]];
    if ([v21 isEqualToString:@"SixDotBraille"])
    {
      uint64_t v22 = 1;
    }
    else
    {
      v26 = [v16 propertyForKey:v20];
      if ([v26 isEqualToString:@"EightDotBraille"]) {
        uint64_t v22 = 2;
      }
      else {
        uint64_t v22 = 3;
      }
    }
    BOOL v27 = [(VoiceOverBrailleInputOutputController *)self _isDisplayInput];
    uint64_t v17 = [NSNumber numberWithInteger:v22];
    if (v27)
    {
      [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v17 forKey:*MEMORY[0x263F22B90]];

      uint64_t v17 = [(VoiceOverBrailleInputOutputController *)self specifierForID:@"GRADE2_AUTO_TRANSLATE"];
      long long v28 = objc_msgSend(NSNumber, "numberWithBool:", -[VoiceOverBrailleInputOutputController _shouldShowAutoTranslate](self, "_shouldShowAutoTranslate"));
      [v17 setProperty:v28 forKey:*MEMORY[0x263F600A8]];

      [(VoiceOverBrailleInputOutputController *)self reloadSpecifier:v17];
      goto LABEL_23;
    }
    v25 = (void *)MEMORY[0x263F22BA8];
    goto LABEL_22;
  }
  uint64_t v17 = [v16 propertyForKey:@"TableIdentifier"];
  if (![(VoiceOverBrailleInputOutputController *)self _isDisplayInput])
  {
    [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v17 forKey:*MEMORY[0x263F22BB0]];
    v23 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    int v24 = [v23 BOOLForKey:*MEMORY[0x263F22BB8]];

    if (!v24) {
      goto LABEL_23;
    }
    v25 = (void *)MEMORY[0x263F22B98];
LABEL_22:
    [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v17 forKey:*v25];
    goto LABEL_23;
  }
  [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v17 forKey:*MEMORY[0x263F22B98]];
  int v18 = [(VoiceOverBrailleInputOutputController *)self specifierForID:@"GRADE2_AUTO_TRANSLATE"];
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", -[VoiceOverBrailleInputOutputController _shouldShowAutoTranslate](self, "_shouldShowAutoTranslate"));
  [v18 setProperty:v19 forKey:*MEMORY[0x263F600A8]];

  [(VoiceOverBrailleInputOutputController *)self reloadSpecifier:v18];
LABEL_23:

  [(VoiceOverBrailleInputOutputController *)self reload];
}

@end