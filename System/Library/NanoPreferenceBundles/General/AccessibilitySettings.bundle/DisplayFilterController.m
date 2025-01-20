@interface DisplayFilterController
- (BOOL)_shouldShowColorIntensitySlider;
- (id)_blueCorrectionIntensity;
- (id)_greenCorrectionIntensity;
- (id)_redCorrectionIntensity;
- (id)_subtitleForSpec:(id)a3;
- (id)_supportedDisplayFilters;
- (id)_titleForFilter:(unint64_t)a3;
- (id)globalColorFilterEnabled;
- (id)specifiers;
- (unint64_t)_selectedFilter;
- (void)_setBlueCorrectionIntensity:(id)a3;
- (void)_setGreenCorrectionIntensity:(id)a3;
- (void)_setRedCorrectionIntensity:(id)a3;
- (void)setGlobalColorFilterEnabled:(id)a3;
- (void)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation DisplayFilterController

- (id)specifiers
{
  v2 = self;
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v5 addObject:v6];
    v7 = (void *)MEMORY[0x263F5FC40];
    v8 = settingsLocString(@"COLOR_FILTERS_ROW_TITLE", @"AccessibilitySettings");
    v9 = [v7 preferenceSpecifierNamed:v8 target:v2 set:sel_setGlobalColorFilterEnabled_ get:sel_globalColorFilterEnabled detail:0 cell:6 edit:0];

    uint64_t v10 = MEMORY[0x263EFFA88];
    uint64_t v45 = *MEMORY[0x263F60160];
    objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x263EFFA88]);
    uint64_t v44 = *MEMORY[0x263F601E0];
    objc_msgSend(v9, "setProperty:forKey:", v10);
    uint64_t v43 = *MEMORY[0x263F60070];
    objc_msgSend(v9, "setProperty:forKey:", @"com.apple.Accessibility");
    [v5 addObject:v9];
    v11 = [(DisplayFilterController *)v2 globalColorFilterEnabled];
    LODWORD(v8) = [v11 BOOLValue];

    if (!v8)
    {
LABEL_32:
      v36 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
      *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3) = (Class)v5;

      v4 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
      goto LABEL_33;
    }
    v38 = v9;
    v39 = v5;
    v40 = v6;
    uint64_t v41 = v3;
    v46 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DisplayFilterController _selectedFilter](v2, "_selectedFilter"));
    v47 = [MEMORY[0x263EFF980] array];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v12 = v2;
    id obj = [(DisplayFilterController *)v2 _supportedDisplayFilters];
    uint64_t v13 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v15 = 0;
      uint64_t v16 = *(void *)v49;
      uint64_t v17 = *MEMORY[0x263F60308];
      uint64_t v18 = MEMORY[0x263EFFA88];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v49 != v16) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v21 = -[DisplayFilterController _titleForFilter:](v12, "_titleForFilter:", [v20 unsignedIntegerValue]);
          v22 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v21 target:v12 set:0 get:0 detail:0 cell:3 edit:0];
          [v22 setProperty:v20 forKey:v17];
          [v22 setProperty:v18 forKey:v45];
          [v22 setProperty:v18 forKey:v44];
          [v22 setProperty:@"com.apple.Accessibility" forKey:v43];
          if ([v20 isEqualToNumber:v46])
          {
            id v23 = v22;

            v15 = v23;
          }
          [v47 addObject:v22];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }

    v2 = v12;
    v5 = v39;
    v6 = v40;
    v9 = v38;
    if ([v47 count])
    {
      v24 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:v2 set:0 get:0 detail:0 cell:0 edit:0];
      [v24 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
      [v39 addObject:v24];
      if (v15) {
        [v24 setProperty:v15 forKey:*MEMORY[0x263F60200]];
      }
      [v39 addObjectsFromArray:v47];
    }
    if (![(DisplayFilterController *)v2 _shouldShowColorIntensitySlider])
    {
LABEL_31:

      uint64_t v3 = v41;
      goto LABEL_32;
    }
    uint64_t v25 = [(DisplayFilterController *)v2 _selectedFilter];
    switch(v25)
    {
      case 2:
        v26 = &selRef__setRedCorrectionIntensity_;
        v27 = &selRef__redCorrectionIntensity;
        break;
      case 8:
        v26 = &selRef__setBlueCorrectionIntensity_;
        v27 = &selRef__blueCorrectionIntensity;
        break;
      case 4:
        v26 = &selRef__setGreenCorrectionIntensity_;
        v27 = &selRef__greenCorrectionIntensity;
        break;
      default:
        v32 = AXLogSettings();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[DisplayFilterController specifiers](v32);
        }
LABEL_30:

        goto LABEL_31;
    }
    v28 = *v26;
    if (!*v26) {
      goto LABEL_31;
    }
    v29 = *v27;
    if (!*v27) {
      goto LABEL_31;
    }
    v30 = (void *)MEMORY[0x263F5FC40];
    v31 = settingsLocString(@"COLOR_INTENSITY_TITLE", @"AccessibilitySettings");
    v32 = [v30 groupSpecifierWithName:v31];

    [v39 addObject:v32];
    v33 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:v2 set:v28 get:v29 detail:0 cell:5 edit:0];
    v34 = [NSNumber numberWithDouble:0.25];
    [v33 setProperty:v34 forKey:*MEMORY[0x263F60038]];

    v35 = [NSNumber numberWithDouble:1.0];
    [v33 setProperty:v35 forKey:*MEMORY[0x263F60030]];

    [v39 addObject:v33];
    goto LABEL_30;
  }
LABEL_33:

  return v4;
}

- (void)setGlobalColorFilterEnabled:(id)a3
{
  [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:a3 forKey:@"ColorFiltersEnabled"];

  [(DisplayFilterController *)self reloadSpecifiers];
}

- (id)globalColorFilterEnabled
{
  v2 = NSNumber;
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "BOOLForKey:", @"ColorFiltersEnabled"));

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)DisplayFilterController;
  id v6 = a4;
  [(DisplayFilterController *)&v21 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[DisplayFilterController indexForIndexPath:](self, "indexForIndexPath:", v6, v21.receiver, v21.super_class);
  v8 = [(DisplayFilterController *)self specifiers];
  v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  v11 = [(DisplayFilterController *)self specifierAtIndex:[(DisplayFilterController *)self indexOfGroup:v10]];
  v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    uint64_t v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 unsignedIntegerValue];
      uint64_t v17 = [NSNumber numberWithInt:v16 == 2];
      [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v17 forKey:@"RedGreenDisplay"];

      uint64_t v18 = [NSNumber numberWithInt:v16 == 4];
      [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v18 forKey:@"GreenRedDisplay"];

      v19 = [NSNumber numberWithInt:v16 == 8];
      [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v19 forKey:@"BlueYellowDisplay"];

      v20 = [NSNumber numberWithInt:v16 == 1];
      [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v20 forKey:@"GrayscaleDisplay"];

      [(DisplayFilterController *)self reloadSpecifiers];
    }
  }
}

- (id)_supportedDisplayFilters
{
  return &unk_26FB007A8;
}

- (unint64_t)_selectedFilter
{
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  id v4 = (id)[v3 synchronize];

  v5 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  char v6 = [v5 BOOLForKey:@"GrayscaleDisplay"];

  if (v6) {
    return 1;
  }
  v8 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  char v9 = [v8 BOOLForKey:@"RedGreenDisplay"];

  if (v9) {
    return 2;
  }
  uint64_t v10 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  char v11 = [v10 BOOLForKey:@"GreenRedDisplay"];

  if (v11) {
    return 4;
  }
  v12 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  int v13 = [v12 BOOLForKey:@"BlueYellowDisplay"];

  if (v13) {
    return 8;
  }
  else {
    return 0;
  }
}

- (id)_titleForFilter:(unint64_t)a3
{
  unint64_t v4 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v4) & 1) != 0)
  {
    v5 = settingsLocString(off_2651F2300[v4], @"AccessibilitySettings");
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_subtitleForSpec:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:*MEMORY[0x263F60308]];
  uint64_t v4 = [v3 unsignedIntegerValue];
  switch(v4)
  {
    case 2:
      v5 = @"RED_GREEN_ROW_SUBTITLE";
      goto LABEL_7;
    case 8:
      v5 = @"BLUE_YELLOW_ROW_SUBTITLE";
      goto LABEL_7;
    case 4:
      v5 = @"GREEN_RED_ROW_SUBTITLE";
LABEL_7:
      char v6 = settingsLocString(v5, @"AccessibilitySettings");
      goto LABEL_9;
  }
  char v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)_shouldShowColorIntensitySlider
{
  unint64_t v2 = [(DisplayFilterController *)self _selectedFilter];
  return (v2 < 9) & (0x114u >> v2);
}

- (id)_redCorrectionIntensity
{
  unint64_t v2 = NSNumber;
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [v3 floatForKey:@"RedGreenColorIntensity"];
  uint64_t v4 = objc_msgSend(v2, "numberWithFloat:");

  return v4;
}

- (void)_setRedCorrectionIntensity:(id)a3
{
}

- (id)_greenCorrectionIntensity
{
  unint64_t v2 = NSNumber;
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [v3 floatForKey:@"GreenRedColorIntensity"];
  uint64_t v4 = objc_msgSend(v2, "numberWithFloat:");

  return v4;
}

- (void)_setGreenCorrectionIntensity:(id)a3
{
}

- (id)_blueCorrectionIntensity
{
  unint64_t v2 = NSNumber;
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [v3 floatForKey:@"BlueYellowColorIntensity"];
  uint64_t v4 = objc_msgSend(v2, "numberWithFloat:");

  return v4;
}

- (void)_setBlueCorrectionIntensity:(id)a3
{
}

- (void)specifiers
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_246A39000, log, OS_LOG_TYPE_ERROR, "Can't find setter and getter for color intensity slider", v1, 2u);
}

@end