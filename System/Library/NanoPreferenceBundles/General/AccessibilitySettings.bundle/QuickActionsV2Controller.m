@interface QuickActionsV2Controller
- (id)quickActionSwitchState;
- (id)specifiers;
- (void)setQuickActionSwitchState:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation QuickActionsV2Controller

- (id)specifiers
{
  v2 = self;
  uint64_t v70 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v55 = (int)*MEMORY[0x263F5FDB8];
    v4 = [MEMORY[0x263EFF980] array];
    v5 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v6 = settingsLocString(@"QUICK_ACTIONS_INSTRUCTIONS_FOOTER", @"AccessibilitySettings-elton");
    [v5 setProperty:v6 forKey:*MEMORY[0x263F600F8]];

    v54 = v5;
    [v4 addObject:v5];
    char v7 = AXActivePairedDeviceSupportsQuickActionsAlwaysOnState();
    v8 = (void *)MEMORY[0x263F5FC40];
    v9 = (void *)MEMORY[0x263F60168];
    v10 = (void *)MEMORY[0x263F60138];
    v59 = v4;
    v56 = v2;
    if (v7)
    {
      v11 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [v11 setProperty:MEMORY[0x263EFFA88] forKey:*v9];
      [v11 setProperty:@"QuickActionsStateGroupID" forKey:*v10];
      [v4 addObject:v11];
      v12 = [(AccessibilityBridgeBaseController *)v2 accessibilityDomainAccessor];
      v13 = [v12 objectForKey:*MEMORY[0x263F8B430]];
      int v57 = [v13 intValue];

      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      uint64_t v14 = [&unk_26FB00808 countByEnumeratingWithState:&v64 objects:v69 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        v52 = v11;
        v16 = 0;
        uint64_t v17 = *(void *)v65;
        uint64_t v18 = *MEMORY[0x263F60308];
        uint64_t v19 = *MEMORY[0x263F5FEF8];
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v65 != v17) {
              objc_enumerationMutation(&unk_26FB00808);
            }
            v21 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            uint64_t v22 = [v21 intValue];
            int v23 = v22;
            v24 = (void *)MEMORY[0x263F5FC40];
            v25 = AXLocalizedStringForQuickActionsState(v22);
            v26 = [v24 preferenceSpecifierNamed:v25 target:0 set:0 get:0 detail:0 cell:3 edit:0];

            [v26 setProperty:v21 forKey:v18];
            [v26 setProperty:MEMORY[0x263EFFA88] forKey:v19];
            [v59 addObject:v26];
            if (v23 == v57)
            {
              id v27 = v26;

              v16 = v27;
            }
          }
          uint64_t v15 = [&unk_26FB00808 countByEnumeratingWithState:&v64 objects:v69 count:16];
        }
        while (v15);
        v2 = v56;
        v4 = v59;
        v10 = (void *)MEMORY[0x263F60138];
        v9 = (void *)MEMORY[0x263F60168];
        v11 = v52;
        if (v16)
        {
          [v52 setProperty:v16 forKey:*MEMORY[0x263F60200]];
        }
      }
    }
    else
    {
      v28 = settingsLocString(@"QUICK_ACTIONS_ROW_TITLE", @"AccessibilitySettings-quickactions");
      v29 = [v8 preferenceSpecifierNamed:v28 target:v2 set:sel_setQuickActionSwitchState_ get:sel_quickActionSwitchState detail:0 cell:6 edit:0];

      [v4 addObject:v29];
    }
    if ((AXActivePairedDeviceSupportsQuickActionsAlwaysOnState() & 1) != 0
      || ([(QuickActionsV2Controller *)v2 quickActionSwitchState],
          v30 = objc_claimAutoreleasedReturnValue(),
          int v31 = [v30 BOOLValue],
          v30,
          v31))
    {
      v32 = (void *)MEMORY[0x263F5FC40];
      v33 = settingsLocString(@"QUICK_ACTIONS_BANNER_HEADER", @"AccessibilitySettings-quickactions");
      v34 = [v32 preferenceSpecifierNamed:v33 target:v2 set:0 get:0 detail:0 cell:0 edit:0];

      [v34 setProperty:MEMORY[0x263EFFA88] forKey:*v9];
      [v34 setProperty:@"QuickActionsBannerAppearanceGroupID" forKey:*v10];
      v53 = v34;
      [v4 addObject:v34];
      v35 = [(AccessibilityBridgeBaseController *)v2 accessibilityDomainAccessor];
      v36 = [v35 objectForKey:*MEMORY[0x263F8B428]];
      int v58 = [v36 intValue];

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v37 = [&unk_26FB00820 countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        v39 = 0;
        uint64_t v40 = *(void *)v61;
        uint64_t v41 = *MEMORY[0x263F60308];
        uint64_t v42 = *MEMORY[0x263F5FEF8];
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v61 != v40) {
              objc_enumerationMutation(&unk_26FB00820);
            }
            v44 = *(void **)(*((void *)&v60 + 1) + 8 * j);
            int v45 = [v44 intValue];
            v46 = (void *)MEMORY[0x263F5FC40];
            v47 = AXLocalizedStringForQuickActionBannerAppearance(v45);
            v48 = [v46 preferenceSpecifierNamed:v47 target:0 set:0 get:0 detail:0 cell:3 edit:0];

            [v48 setProperty:v44 forKey:v41];
            [v48 setProperty:MEMORY[0x263EFFA88] forKey:v42];
            v4 = v59;
            [v59 addObject:v48];
            if (v45 == v58)
            {
              id v49 = v48;

              v39 = v49;
            }
          }
          uint64_t v38 = [&unk_26FB00820 countByEnumeratingWithState:&v60 objects:v68 count:16];
        }
        while (v38);
      }
      else
      {
        v39 = 0;
      }
      [v53 setProperty:v39 forKey:*MEMORY[0x263F60200]];

      v2 = v56;
    }
    v50 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v55);
    *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v55) = (Class)v4;

    v3 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v55);
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)QuickActionsV2Controller;
  id v6 = a4;
  [(QuickActionsV2Controller *)&v20 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[QuickActionsV2Controller indexForIndexPath:](self, "indexForIndexPath:", v6, v20.receiver, v20.super_class);
  v8 = [(QuickActionsV2Controller *)self specifiers];
  v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  v11 = [(QuickActionsV2Controller *)self specifierAtIndex:[(QuickActionsV2Controller *)self indexOfGroup:v10]];
  v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    uint64_t v14 = [v11 identifier];
    int v15 = [v14 isEqualToString:@"QuickActionsStateGroupID"];

    if (v15)
    {
      v16 = [v9 propertyForKey:*MEMORY[0x263F60308]];
      if (v16)
      {
        uint64_t v17 = (void *)MEMORY[0x263F8B430];
LABEL_8:
        [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v16 forKey:*v17];
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    uint64_t v18 = [v11 identifier];
    int v19 = [v18 isEqualToString:@"QuickActionsBannerAppearanceGroupID"];

    if (v19)
    {
      v16 = [v9 propertyForKey:*MEMORY[0x263F60308]];
      if (v16)
      {
        uint64_t v17 = (void *)MEMORY[0x263F8B428];
        goto LABEL_8;
      }
LABEL_9:
    }
  }
}

- (id)quickActionSwitchState
{
  v2 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v3 = [v2 objectForKey:*MEMORY[0x263F8B430]];
  int v4 = [v3 intValue];

  v5 = NSNumber;

  return (id)[v5 numberWithInt:v4 != 2];
}

- (void)setQuickActionSwitchState:(id)a3
{
  if ([a3 BOOLValue]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 2;
  }
  v5 = [NSNumber numberWithUnsignedInt:v4];
  [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v5 forKey:*MEMORY[0x263F8B430]];

  [(QuickActionsV2Controller *)self reloadSpecifiers];
}

@end