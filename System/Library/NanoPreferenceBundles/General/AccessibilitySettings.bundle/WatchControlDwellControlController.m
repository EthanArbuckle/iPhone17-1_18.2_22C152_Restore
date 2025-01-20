@interface WatchControlDwellControlController
- (id)dwellControlEnabled;
- (id)dwellControlShakeToStartEnabled;
- (id)specifiers;
- (void)setDwellControlEnabled:(id)a3;
- (void)setDwellControlShakeToStartEnabled:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation WatchControlDwellControlController

- (id)specifiers
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v35 = (int)*MEMORY[0x263F5FDB8];
    v4 = [MEMORY[0x263EFF980] array];
    v5 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v4 addObject:v5];

    v6 = (void *)MEMORY[0x263F5FC40];
    v7 = settingsLocString(@"WATCH_CONTROL_DWELL_CONTROL_TITLE", @"AccessibilitySettings-watchcontrol");
    v36 = self;
    v8 = [v6 preferenceSpecifierNamed:v7 target:self set:sel_setDwellControlEnabled_ get:sel_dwellControlEnabled detail:0 cell:6 edit:0];
    [v4 addObject:v8];

    v9 = (void *)MEMORY[0x263F5FC40];
    v10 = settingsLocString(@"WATCH_CONTROL_DWELL_CONTROL_TIMER_ACTION", @"AccessibilitySettings-watchcontrol");
    v11 = [v9 groupSpecifierWithID:@"GroupDefaultAction" name:v10];

    [v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    v12 = v4;
    v34 = v11;
    [v4 addObject:v11];
    v13 = [MEMORY[0x263F85B10] sharedInstance];
    uint64_t v14 = [v13 dwellControlTimerAction];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v15 = [&unk_26FB007F0 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      v17 = 0;
      uint64_t v18 = *(void *)v38;
      uint64_t v19 = *MEMORY[0x263F60308];
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(&unk_26FB007F0);
          }
          uint64_t v21 = [*(id *)(*((void *)&v37 + 1) + 8 * i) unsignedIntegerValue];
          v22 = (void *)MEMORY[0x263F5FC40];
          v23 = WCNameForAction();
          v24 = [v22 preferenceSpecifierNamed:v23 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          v25 = [NSNumber numberWithUnsignedInteger:v21];
          [v24 setProperty:v25 forKey:v19];

          [v12 addObject:v24];
          if (v21 == v14)
          {
            id v26 = v24;

            v17 = v26;
          }
        }
        uint64_t v16 = [&unk_26FB007F0 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v16);
    }
    else
    {
      v17 = 0;
    }
    [v34 setProperty:v17 forKey:*MEMORY[0x263F60200]];
    v27 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v12 addObject:v27];

    v28 = (void *)MEMORY[0x263F5FC40];
    v29 = settingsLocString(@"WATCH_CONTROL_DWELL_CONTROL_SHAKE_TO_START", @"AccessibilitySettings-watchcontrol");
    v30 = [v28 preferenceSpecifierNamed:v29 target:v36 set:sel_setDwellControlShakeToStartEnabled_ get:sel_dwellControlShakeToStartEnabled detail:0 cell:6 edit:0];
    [v12 addObject:v30];

    v31 = *(Class *)((char *)&v36->super.super.super.super.super.super.isa + v35);
    *(Class *)((char *)&v36->super.super.super.super.super.super.isa + v35) = (Class)v12;
    id v32 = v12;

    v3 = *(Class *)((char *)&v36->super.super.super.super.super.super.isa + v35);
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)WatchControlDwellControlController;
  id v6 = a4;
  [(WatchControlDwellControlController *)&v18 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[WatchControlDwellControlController indexForIndexPath:](self, "indexForIndexPath:", v6, v18.receiver, v18.super_class);
  v8 = [(WatchControlDwellControlController *)self specifiers];
  v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  v11 = [(WatchControlDwellControlController *)self specifierAtIndex:[(WatchControlDwellControlController *)self indexOfGroup:v10]];
  v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    uint64_t v14 = [v11 identifier];
    int v15 = [v14 isEqualToString:@"GroupDefaultAction"];

    if (v15)
    {
      uint64_t v16 = [v9 propertyForKey:*MEMORY[0x263F60308]];
      if (v16)
      {
        v17 = [MEMORY[0x263F85B10] sharedInstance];
        objc_msgSend(v17, "setDwellControlTimerAction:", objc_msgSend(v16, "unsignedIntegerValue"));

        [(WatchControlDwellControlController *)self reloadSpecifiers];
      }
    }
  }
}

- (id)dwellControlEnabled
{
  v2 = NSNumber;
  v3 = [MEMORY[0x263F85B10] sharedInstance];
  v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "dwellControlEnabled"));

  return v4;
}

- (void)setDwellControlEnabled:(id)a3
{
  v3 = (void *)MEMORY[0x263F85B10];
  id v4 = a3;
  id v6 = [v3 sharedInstance];
  uint64_t v5 = [v4 BOOLValue];

  [v6 setDwellControlEnabled:v5];
}

- (id)dwellControlShakeToStartEnabled
{
  v2 = NSNumber;
  v3 = [MEMORY[0x263F85B10] sharedInstance];
  id v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "dwellControlShakeToStart"));

  return v4;
}

- (void)setDwellControlShakeToStartEnabled:(id)a3
{
  v3 = (void *)MEMORY[0x263F85B10];
  id v4 = a3;
  id v6 = [v3 sharedInstance];
  uint64_t v5 = [v4 BOOLValue];

  [v6 setDwellControlShakeToStart:v5];
}

@end