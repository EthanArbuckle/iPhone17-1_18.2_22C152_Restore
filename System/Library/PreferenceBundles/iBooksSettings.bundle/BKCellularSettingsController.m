@interface BKCellularSettingsController
- (BUCellularSettings)settings;
- (id)_formattedNetworkLimit;
- (id)specifiers;
- (void)setSettings:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation BKCellularSettingsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(BKCellularSettingsController *)self _formattedNetworkLimit];
    v6 = +[BKCellularSettingsUtilities cellularSettingsForCurrentIdentity];
    [(BKCellularSettingsController *)self setSettings:v6];

    id v7 = objc_alloc_init((Class)NSMutableArray);
    v8 = +[PSSpecifier groupSpecifierWithID:@"CELLULAR_GROUP_ID"];
    v9 = BKSettingsBundle();
    v10 = [v9 localizedStringForKey:@"Choose whether books and audiobooks can automatically download over a cellular network." value:&stru_18CA0 table:@"Settings"];
    [v8 setProperty:v10 forKey:PSFooterTextGroupKey];

    v11 = +[NSNumber numberWithBool:1];
    [v8 setProperty:v11 forKey:PSIsRadioGroupKey];

    [v7 addObject:v8];
    v12 = BKSettingsBundle();
    v13 = [v12 localizedStringForKey:@"Always Allow" value:&stru_18CA0 table:@"Settings"];
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v14 setIdentifier:@"ALWAYS_ALLOW"];
    [v7 addObject:v14];
    v15 = [(BKCellularSettingsController *)self settings];
    v16 = (char *)[v15 cellularDataPrompt];

    if (v16 == (unsigned char *)&dword_0 + 2) {
      [v8 setProperty:v14 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    v17 = BKSettingsBundle();
    v18 = [v17 localizedStringForKey:@"Ask If Over %@" value:&stru_18CA0 table:@"Settings"];
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v5);
    v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v20 setIdentifier:@"ASK_IF_OVER_XXX_MB_ID"];
    [v7 addObject:v20];
    v21 = [(BKCellularSettingsController *)self settings];
    id v22 = [v21 cellularDataPrompt];

    if (!v22) {
      [v8 setProperty:v20 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    v23 = BKSettingsBundle();
    v24 = [v23 localizedStringForKey:@"Always Ask" value:&stru_18CA0 table:@"Settings"];
    v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v25 setIdentifier:@"ALWAYS_ASK_ID"];
    [v7 addObject:v25];
    v26 = [(BKCellularSettingsController *)self settings];
    v27 = (char *)[v26 cellularDataPrompt];

    if (v27 == (unsigned char *)&dword_0 + 1) {
      [v8 setProperty:v25 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    v28 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v7;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)BKCellularSettingsController;
  id v6 = a4;
  [(BKCellularSettingsController *)&v19 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = -[BKCellularSettingsController indexForIndexPath:](self, "indexForIndexPath:", v6, v19.receiver, v19.super_class);

  v8 = [(BKCellularSettingsController *)self specifierAtIndex:v7];
  v9 = [(BKCellularSettingsController *)self specifierForID:@"CELLULAR_GROUP_ID"];
  v10 = [v8 identifier];
  unsigned int v11 = [v10 isEqualToString:@"ALWAYS_ALLOW"];

  if (v11)
  {
    v12 = [(BKCellularSettingsController *)self settings];
    v13 = v12;
    uint64_t v14 = 2;
LABEL_7:
    [v12 setCellularDataPrompt:v14];

    [v9 setProperty:v8 forKey:PSRadioGroupCheckedSpecifierKey];
    goto LABEL_8;
  }
  v15 = [v8 identifier];
  unsigned int v16 = [v15 isEqualToString:@"ASK_IF_OVER_XXX_MB_ID"];

  if (v16)
  {
    v12 = [(BKCellularSettingsController *)self settings];
    v13 = v12;
    uint64_t v14 = 0;
    goto LABEL_7;
  }
  v17 = [v8 identifier];
  unsigned int v18 = [v17 isEqualToString:@"ALWAYS_ASK_ID"];

  if (v18)
  {
    v12 = [(BKCellularSettingsController *)self settings];
    v13 = v12;
    uint64_t v14 = 1;
    goto LABEL_7;
  }
LABEL_8:
  [(BKCellularSettingsController *)self reload];
}

- (id)_formattedNetworkLimit
{
  return +[BKCellularSettingsUtilities formattedNetworkLimitForDownloadKind:@"book" runBlockIfNeedsUpdate:0];
}

- (BUCellularSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end