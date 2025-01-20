@interface WatchControlGreyQuickActionController
- (id)greyQuickActionAutoScrollNotificationEnabled;
- (id)greyQuickActionsEnabled;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)setGreyQuickActionAutoScrollNotificationEnabled:(id)a3;
- (void)setGreyQuickActionsEnabled:(id)a3;
@end

@implementation WatchControlGreyQuickActionController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v7 = settingsLocString(@"GREY_QUICK_ACTIONS_FOOTER", @"AccessibilitySettings-watchcontrol");
    [v6 setProperty:v7 forKey:*MEMORY[0x263F600F8]];

    [v5 addObject:v6];
    v8 = (void *)MEMORY[0x263F5FC40];
    v9 = settingsLocString(@"GREY_QUICK_ACTIONS_SWITCH", @"AccessibilitySettings-watchcontrol");
    v10 = [v8 preferenceSpecifierNamed:v9 target:self set:sel_setGreyQuickActionsEnabled_ get:sel_greyQuickActionsEnabled detail:0 cell:6 edit:0];
    [v5 addObject:v10];

    v11 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v5 addObject:v11];

    v12 = (void *)MEMORY[0x263F5FC40];
    v13 = settingsLocString(@"GREY_QUICK_ACTION_LONG_LOOK_AUTOSCROLL_SWITCH", @"AccessibilitySettings-watchcontrol");
    v14 = [v12 preferenceSpecifierNamed:v13 target:self set:sel_setGreyQuickActionAutoScrollNotificationEnabled_ get:sel_greyQuickActionAutoScrollNotificationEnabled detail:0 cell:6 edit:0];

    [v14 setProperty:@"AutoScrollLongLookNotificationsSpecifier" forKey:*MEMORY[0x263F60138]];
    v15 = [(WatchControlGreyQuickActionController *)self greyQuickActionsEnabled];
    [v14 setProperty:v15 forKey:*MEMORY[0x263F600A8]];

    [v14 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    [v5 addObject:v14];
    v16 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)WatchControlGreyQuickActionController;
  id v6 = a4;
  v7 = [(WatchControlGreyQuickActionController *)&v12 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = -[WatchControlGreyQuickActionController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v12.receiver, v12.super_class);

  v9 = [v8 propertyForKey:*MEMORY[0x263F60138]];
  LODWORD(v6) = [v9 isEqualToString:@"AutoScrollLongLookNotificationsSpecifier"];

  if (v6)
  {
    v10 = [v7 textLabel];
    [v10 setNumberOfLines:0];
  }

  return v7;
}

- (id)greyQuickActionsEnabled
{
  v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x263F85B10] sharedInstance];
  v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "greyQuickActionsEnabled"));

  return v4;
}

- (void)setGreyQuickActionsEnabled:(id)a3
{
  v4 = (void *)MEMORY[0x263F85B10];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  uint64_t v7 = [v5 BOOLValue];

  [v6 setGreyQuickActionsEnabled:v7];

  [(WatchControlGreyQuickActionController *)self reloadSpecifiers];
}

- (id)greyQuickActionAutoScrollNotificationEnabled
{
  v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x263F85B10] sharedInstance];
  if ([v3 greyQuickActionsEnabled])
  {
    v4 = [MEMORY[0x263F85B10] sharedInstance];
    id v5 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v4, "greyQuickActionAutoScrollNotificationsEnabled"));
  }
  else
  {
    id v5 = [v2 numberWithInt:0];
  }

  return v5;
}

- (void)setGreyQuickActionAutoScrollNotificationEnabled:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F85B10];
  id v4 = a3;
  id v6 = [v3 sharedInstance];
  uint64_t v5 = [v4 BOOLValue];

  [v6 setGreyQuickActionAutoScrollNotificationsEnabled:v5];
}

@end