@interface WatchControlCustomizeActionMenuController
- (BOOL)canShowAction:(unint64_t)a3 forDetailController:(id)a4;
- (BOOL)canShowActionGroup:(unint64_t)a3 forDetailController:(id)a4;
- (id)actionMenuLargerSize;
- (id)specifiers;
- (unint64_t)selectedActionForDetailController:(id)a3;
- (void)_removeActionSpecifier:(id)a3;
- (void)setAction:(unint64_t)a3 forDetailController:(id)a4;
- (void)setActionMenuLargerSize:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation WatchControlCustomizeActionMenuController

- (id)specifiers
{
  v56[1] = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v50 = (int)*MEMORY[0x263F5FDB8];
    v4 = [MEMORY[0x263EFF980] array];
    v5 = (void *)MEMORY[0x263F5FC40];
    v6 = settingsLocString(@"WATCH_CONTROL_ACTION_MENU_FAVORITES", @"AccessibilitySettings-watchcontrol");
    v7 = [v5 groupSpecifierWithName:v6];
    [v4 addObject:v7];

    v8 = [MEMORY[0x263F85B10] sharedInstance];
    v9 = [v8 actionMenuFavorites];

    if ([v9 count])
    {
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __55__WatchControlCustomizeActionMenuController_specifiers__block_invoke;
      v53[3] = &unk_2651F2218;
      v53[4] = self;
      id v54 = v4;
      [v9 enumerateObjectsUsingBlock:v53];
    }
    v49 = v9;
    unint64_t v10 = [v9 count];
    if (v10 < *MEMORY[0x263F85B18])
    {
      v11 = (void *)MEMORY[0x263F5FC40];
      v12 = settingsLocString(@"WATCH_CONTROL_ACTION_MENU_ADD_NEW_FAVORITE", @"AccessibilitySettings-watchcontrol");
      v13 = [v11 preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      v55 = @"ActionDetailDelegate";
      v56[0] = self;
      v14 = [NSDictionary dictionaryWithObjects:v56 forKeys:&v55 count:1];
      [v13 setUserInfo:v14];

      [v4 addObject:v13];
    }
    v52 = self;
    v15 = (void *)MEMORY[0x263F5FC40];
    v16 = settingsLocString(@"WATCH_CONTROL_ACTION_MENU_POSITION", @"AccessibilitySettings-watchcontrol");
    v17 = [v15 groupSpecifierWithID:@"kGroupActionMenuPositionIdentifier" name:v16];

    uint64_t v18 = *MEMORY[0x263F60168];
    [v17 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    v51 = v17;
    [v4 addObject:v17];
    v19 = [MEMORY[0x263F85B10] sharedInstance];
    uint64_t v20 = [v19 actionMenuPosition];

    v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = *MEMORY[0x263F60308];
    do
    {
      v24 = (void *)MEMORY[0x263F5FC40];
      v25 = WCNameForActionMenuPosition();
      v26 = [v24 preferenceSpecifierNamed:v25 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      v27 = [NSNumber numberWithInteger:v22];
      [v26 setProperty:v27 forKey:v23];

      [v4 addObject:v26];
      if (v20 == v22)
      {
        id v28 = v26;

        v21 = v28;
      }

      ++v22;
    }
    while (v22 != 3);
    uint64_t v48 = *MEMORY[0x263F60200];
    objc_msgSend(v17, "setProperty:forKey:", v21);
    v29 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v4 addObject:v29];

    v30 = (void *)MEMORY[0x263F5FC40];
    v31 = settingsLocString(@"WATCH_CONTROL_ACTION_MENU_LARGER_SIZE", @"AccessibilitySettings-watchcontrol");
    v32 = [v30 preferenceSpecifierNamed:v31 target:v52 set:sel_setActionMenuLargerSize_ get:sel_actionMenuLargerSize detail:0 cell:6 edit:0];
    [v4 addObject:v32];

    v33 = (void *)MEMORY[0x263F5FC40];
    v34 = settingsLocString(@"WATCH_CONTROL_AUTOSCROLL_SPEED", @"AccessibilitySettings-watchcontrol");
    v35 = [v33 groupSpecifierWithID:@"kGroupAutoScrollSpeedIdentifier" name:v34];

    [v35 setProperty:MEMORY[0x263EFFA88] forKey:v18];
    [v4 addObject:v35];
    v36 = [MEMORY[0x263F85B10] sharedInstance];
    uint64_t v37 = [v36 defaultAutoScrollSpeed];

    uint64_t v38 = 0;
    v39 = 0;
    do
    {
      v40 = (void *)MEMORY[0x263F5FC40];
      v41 = WCNameForAutoMovementSpeed();
      v42 = [v40 preferenceSpecifierNamed:v41 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      v43 = [NSNumber numberWithUnsignedInteger:v38];
      [v42 setProperty:v43 forKey:v23];

      [v4 addObject:v42];
      if (v37 == v38)
      {
        id v44 = v42;

        v39 = v44;
      }

      ++v38;
    }
    while (v38 != 3);
    [v35 setProperty:v39 forKey:v48];
    v45 = *(Class *)((char *)&v52->super.super.super.super.super.super.isa + v50);
    *(Class *)((char *)&v52->super.super.super.super.super.super.isa + v50) = (Class)v4;
    id v46 = v4;

    v3 = *(Class *)((char *)&v52->super.super.super.super.super.super.isa + v50);
  }

  return v3;
}

void __55__WatchControlCustomizeActionMenuController_specifiers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 unsignedIntegerValue];
  v6 = (void *)MEMORY[0x263F5FB40];
  v7 = WCNameForAction();
  id v17 = [v6 preferenceSpecifierNamed:v7 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:13 edit:0];

  [v17 setButtonAction:sel__removeActionSpecifier_];
  [v17 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60000]];
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  [v17 setProperty:v8 forKey:@"kWCActionIndexSpecKey"];

  v9 = NSString;
  unint64_t v10 = settingsLocString(@"WATCH_CONTROL_ACTION_MENU_REMOVE_FAVORITE_CONFIRM_TITLE", @"AccessibilitySettings-watchcontrol");
  v11 = WCNameForAction();
  v12 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v11);
  [v17 setPrompt:v12];

  v13 = settingsLocString(@"WATCH_CONTROL_ACTION_MENU_REMOVE_FAVORITE_OK_ACTION", @"AccessibilitySettings-watchcontrol");
  [v17 setTitle:v13];

  v14 = settingsLocString(@"WATCH_CONTROL_ACTION_MENU_REMOVE_FAVORITE_CANCEL_ACTION", @"AccessibilitySettings-watchcontrol");
  [v17 setCancelButton:v14];

  v15 = WCImageForAction();
  [v17 setProperty:v15 forKey:*MEMORY[0x263F60140]];

  v16 = [NSNumber numberWithUnsignedInteger:v5];
  [v17 setProperty:v16 forKey:*MEMORY[0x263F60308]];

  [*(id *)(a1 + 40) addObject:v17];
}

- (void)_removeActionSpecifier:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF980];
  uint64_t v5 = (void *)MEMORY[0x263F85B10];
  id v6 = a3;
  v7 = [v5 sharedInstance];
  v8 = [v7 actionMenuFavorites];
  id v12 = [v4 arrayWithArray:v8];

  v9 = [v6 propertyForKey:@"kWCActionIndexSpecKey"];

  unint64_t v10 = [v9 unsignedIntegerValue];
  if (v10 < [v12 count])
  {
    [v12 removeObjectAtIndex:v10];
    v11 = [MEMORY[0x263F85B10] sharedInstance];
    [v11 setActionMenuFavorites:v12];

    [(WatchControlCustomizeActionMenuController *)self reloadSpecifiers];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)WatchControlCustomizeActionMenuController;
  [(WatchControlCustomizeActionMenuController *)&v20 tableView:v6 didSelectRowAtIndexPath:v7];
  uint64_t v8 = [(WatchControlCustomizeActionMenuController *)self indexForIndexPath:v7];
  v9 = [(WatchControlCustomizeActionMenuController *)self specifiers];
  unint64_t v10 = [v9 objectAtIndex:v8];

  v11 = -[WatchControlCustomizeActionMenuController specifierAtIndex:](self, "specifierAtIndex:", -[WatchControlCustomizeActionMenuController indexOfGroup:](self, "indexOfGroup:", [v7 section]));
  id v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    v14 = [v11 identifier];
    int v15 = [v14 isEqualToString:@"kGroupAutoScrollSpeedIdentifier"];

    if (v15)
    {
      v16 = [v10 propertyForKey:*MEMORY[0x263F60308]];
      if (v16)
      {
        id v17 = [MEMORY[0x263F85B10] sharedInstance];
        objc_msgSend(v17, "setDefaultAutoScrollSpeed:", objc_msgSend(v16, "unsignedIntegerValue"));
LABEL_8:

        [(WatchControlCustomizeActionMenuController *)self reloadSpecifiers];
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    uint64_t v18 = [v11 identifier];
    int v19 = [v18 isEqualToString:@"kGroupActionMenuPositionIdentifier"];

    if (v19)
    {
      v16 = [v10 propertyForKey:*MEMORY[0x263F60308]];
      if (v16)
      {
        id v17 = [MEMORY[0x263F85B10] sharedInstance];
        objc_msgSend(v17, "setActionMenuPosition:", objc_msgSend(v16, "integerValue"));
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (id)actionMenuLargerSize
{
  v2 = NSNumber;
  v3 = [MEMORY[0x263F85B10] sharedInstance];
  v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "actionMenuLargerSize"));

  return v4;
}

- (void)setActionMenuLargerSize:(id)a3
{
  v3 = (void *)MEMORY[0x263F85B10];
  id v4 = a3;
  id v6 = [v3 sharedInstance];
  uint64_t v5 = [v4 BOOLValue];

  [v6 setActionMenuLargerSize:v5];
}

- (unint64_t)selectedActionForDetailController:(id)a3
{
  return 0;
}

- (BOOL)canShowAction:(unint64_t)a3 forDetailController:(id)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F85B10], "sharedInstance", a3, a4);
  id v6 = [v5 actionMenuFavorites];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  char v8 = [v6 containsObject:v7];

  if (v8) {
    return 0;
  }
  if (a3 <= 0x15) {
    return (0x1FFBFEu >> a3) & 1;
  }
  return 1;
}

- (BOOL)canShowActionGroup:(unint64_t)a3 forDetailController:(id)a4
{
  return a3 != 10002;
}

- (void)setAction:(unint64_t)a3 forDetailController:(id)a4
{
  id v12 = a4;
  if (a3)
  {
    uint64_t v5 = [MEMORY[0x263F85B10] sharedInstance];
    id v6 = [v5 actionMenuFavorites];

    id v7 = [MEMORY[0x263F85B10] sharedInstance];
    char v8 = [NSNumber numberWithUnsignedInteger:a3];
    v9 = [v6 arrayByAddingObject:v8];
    [v7 setActionMenuFavorites:v9];
  }
  unint64_t v10 = [v12 navigationController];
  id v11 = (id)[v10 popViewControllerAnimated:1];
}

@end