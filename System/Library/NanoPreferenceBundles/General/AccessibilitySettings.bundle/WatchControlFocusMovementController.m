@interface WatchControlFocusMovementController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation WatchControlFocusMovementController

- (id)specifiers
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v38 = (int)*MEMORY[0x263F5FDB8];
    v4 = [MEMORY[0x263EFF980] array];
    v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
    uint64_t v6 = *MEMORY[0x263F60168];
    [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    [v4 addObject:v5];
    v39 = self;
    v40 = v5;
    objc_storeStrong((id *)&self->_focusMovementStyleGroup, v5);
    v7 = [MEMORY[0x263F85B10] sharedInstance];
    uint64_t v8 = [v7 focusMovementStyle];

    v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *MEMORY[0x263F60308];
    char v12 = 1;
    do
    {
      char v13 = v12;
      v14 = (void *)MEMORY[0x263F5FC40];
      v15 = WCNameForFocusMovementStyle();
      v16 = [v14 preferenceSpecifierNamed:v15 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      v17 = [NSNumber numberWithInteger:v10];
      [v16 setProperty:v17 forKey:v11];

      [v4 addObject:v16];
      if (v10 == v8)
      {
        id v18 = v16;

        v9 = v18;
      }

      char v12 = 0;
      uint64_t v10 = 1;
    }
    while ((v13 & 1) != 0);
    uint64_t v19 = *MEMORY[0x263F60200];
    [v40 setProperty:v9 forKey:*MEMORY[0x263F60200]];
    v20 = [MEMORY[0x263F85B10] sharedInstance];
    uint64_t v21 = [v20 focusMovementStyle];

    if (v21 == 1)
    {
      uint64_t v37 = v19;
      v22 = (void *)MEMORY[0x263F5FC40];
      v23 = settingsLocString(@"WATCH_CONTROL_AUTO_FOCUS_NAVIGATION_SPEED", @"AccessibilitySettings-watchcontrol");
      v24 = [v22 preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:0 edit:0];

      [v24 setProperty:MEMORY[0x263EFFA88] forKey:v6];
      [v4 addObject:v24];
      objc_storeStrong((id *)&self->_autoSpeedGroupSpecifier, v24);
      v25 = [MEMORY[0x263F85B10] sharedInstance];
      uint64_t v26 = [v25 autoFocusNavigationSpeed];

      uint64_t v27 = 0;
      v28 = 0;
      do
      {
        v29 = (void *)MEMORY[0x263F5FC40];
        v30 = WCNameForAutoMovementSpeed();
        v31 = [v29 preferenceSpecifierNamed:v30 target:0 set:0 get:0 detail:0 cell:3 edit:0];

        v32 = [NSNumber numberWithUnsignedInteger:v27];
        [v31 setProperty:v32 forKey:v11];

        [v4 addObject:v31];
        if (v26 == v27)
        {
          id v33 = v31;

          v28 = v33;
        }

        ++v27;
      }
      while (v27 != 3);
      [v24 setProperty:v28 forKey:v37];
    }
    v34 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v38);
    *(Class *)((char *)&v39->super.super.super.super.super.super.isa + v38) = (Class)v4;
    id v35 = v4;

    v3 = *(Class *)((char *)&v39->super.super.super.super.super.super.isa + v38);
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)WatchControlFocusMovementController;
  id v6 = a4;
  [(WatchControlFocusMovementController *)&v16 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[WatchControlFocusMovementController indexForIndexPath:](self, "indexForIndexPath:", v6, v16.receiver, v16.super_class);
  uint64_t v8 = [(WatchControlFocusMovementController *)self specifiers];
  v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  uint64_t v11 = [(WatchControlFocusMovementController *)self specifierAtIndex:[(WatchControlFocusMovementController *)self indexOfGroup:v10]];
  char v12 = [(PSSpecifier *)v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    if (v14)
    {
      if (v11 == self->_focusMovementStyleGroup)
      {
        v15 = [MEMORY[0x263F85B10] sharedInstance];
        objc_msgSend(v15, "setFocusMovementStyle:", objc_msgSend(v14, "integerValue"));
        goto LABEL_7;
      }
      if (v11 == self->_autoSpeedGroupSpecifier)
      {
        v15 = [MEMORY[0x263F85B10] sharedInstance];
        objc_msgSend(v15, "setAutoFocusNavigationSpeed:", objc_msgSend(v14, "integerValue"));
LABEL_7:

        [(WatchControlFocusMovementController *)self reloadSpecifiers];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoSpeedGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_focusMovementStyleGroup, 0);
}

@end