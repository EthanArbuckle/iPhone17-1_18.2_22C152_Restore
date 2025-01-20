@interface CellularSettingsController
- (ASDCellularSettings)settings;
- (CellularSettingsController)init;
- (ISURLBag)bag;
- (id)_formattedNetworkLimit;
- (id)specifiers;
- (void)setBag:(id)a3;
- (void)setSettings:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CellularSettingsController

- (CellularSettingsController)init
{
  v3.receiver = self;
  v3.super_class = (Class)CellularSettingsController;
  return [(CellularSettingsController *)&v3 init];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v44 = [(CellularSettingsController *)self _formattedNetworkLimit];
    id v5 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
    id v46 = 0;
    uint64_t v6 = [v5 getCurrentDataSubscriptionContextSync:&v46];
    id v7 = v46;
    if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v48 = v7;
      _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "No subscription context available: %{public}@", buf, 0xCu);
    }
    id v45 = v7;
    v43 = v5;
    uint64_t v8 = +[ASDCellularIdentity identityForSubscription:v6 usingClient:v5 error:&v45];
    id v9 = v45;

    if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v48 = v9;
      _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "No cellular identity available: %{public}@", buf, 0xCu);
    }
    v41 = v9;
    v42 = (void *)v6;
    v40 = (void *)v8;
    v10 = +[ASDCellularSettings settingsForIdentity:v8];
    [(CellularSettingsController *)self setSettings:v10];

    id v11 = objc_alloc_init((Class)NSMutableArray);
    v12 = +[PSSpecifier groupSpecifierWithID:@"CELLULAR_GROUP_ID"];
    v13 = +[NSNumber numberWithBool:1];
    [v12 setProperty:v13 forKey:PSIsRadioGroupKey];

    [v11 addObject:v12];
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"ALWAYS_ALLOW" value:&stru_14C40 table:@"StoreSettings"];
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v16 setIdentifier:@"ALWAYS_ALLOW"];
    [v11 addObject:v16];
    v17 = [(CellularSettingsController *)self settings];
    v18 = (char *)[v17 cellularDataPrompt];

    if (v18 == (unsigned char *)&dword_0 + 2)
    {
      [v12 setProperty:v16 forKey:PSRadioGroupCheckedSpecifierKey];
      v19 = +[NSBundle bundleForClass:objc_opt_class()];
      v20 = [v19 localizedStringForKey:@"ALWAYS_ALLOW_EXPLANATION" value:&stru_14C40 table:@"StoreSettings"];
      v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v44);
      [v12 setProperty:v21 forKey:PSFooterTextGroupKey];
    }
    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"UNDER_XXX_MB_%@" value:&stru_14C40 table:@"StoreSettings"];
    v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v44);
    v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v25 setIdentifier:@"UNDER_XXX_MB_ID"];
    [v11 addObject:v25];
    v26 = [(CellularSettingsController *)self settings];
    id v27 = [v26 cellularDataPrompt];

    if (!v27)
    {
      [v12 setProperty:v25 forKey:PSRadioGroupCheckedSpecifierKey];
      v28 = +[NSBundle bundleForClass:objc_opt_class()];
      v29 = [v28 localizedStringForKey:@"UNDER_XXX_MB_EXPLANATION_%@" value:&stru_14C40 table:@"StoreSettings"];
      v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v44);
      [v12 setProperty:v30 forKey:PSFooterTextGroupKey];
    }
    v31 = +[NSBundle bundleForClass:objc_opt_class()];
    v32 = [v31 localizedStringForKey:@"ASK_FIRST" value:&stru_14C40 table:@"StoreSettings"];
    v33 = +[PSSpecifier preferenceSpecifierNamed:v32 target:0 set:0 get:0 detail:0 cell:3 edit:0];

    [v33 setIdentifier:@"ASK_FIRST_ID"];
    [v11 addObject:v33];
    v34 = [(CellularSettingsController *)self settings];
    v35 = (char *)[v34 cellularDataPrompt];

    if (v35 == (unsigned char *)&dword_0 + 1)
    {
      [v12 setProperty:v33 forKey:PSRadioGroupCheckedSpecifierKey];
      v36 = +[NSBundle bundleForClass:objc_opt_class()];
      v37 = [v36 localizedStringForKey:@"ASK_FIRST_EXPLANATION" value:&stru_14C40 table:@"StoreSettings"];
      [v12 setProperty:v37 forKey:PSFooterTextGroupKey];
    }
    v38 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v11;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v25.receiver = self;
  v25.super_class = (Class)CellularSettingsController;
  id v6 = a4;
  [(CellularSettingsController *)&v25 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(CellularSettingsController *)self _formattedNetworkLimit];
  id v8 = [(CellularSettingsController *)self indexForIndexPath:v6];

  id v9 = [(CellularSettingsController *)self specifierAtIndex:v8];
  v10 = [(CellularSettingsController *)self specifierForID:@"CELLULAR_GROUP_ID"];
  id v11 = [v9 identifier];
  unsigned int v12 = [v11 isEqualToString:@"ALWAYS_ALLOW"];

  if (v12)
  {
    v13 = [(CellularSettingsController *)self settings];
    [v13 setCellularDataPrompt:2];

    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = v14;
    CFStringRef v16 = @"ALWAYS_ALLOW_EXPLANATION";
LABEL_5:
    v20 = [v14 localizedStringForKey:v16 value:&stru_14C40 table:@"StoreSettings"];
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v7);
    [v10 setProperty:v21 forKey:PSFooterTextGroupKey];

    goto LABEL_6;
  }
  v17 = [v9 identifier];
  unsigned int v18 = [v17 isEqualToString:@"UNDER_XXX_MB_ID"];

  if (v18)
  {
    v19 = [(CellularSettingsController *)self settings];
    [v19 setCellularDataPrompt:0];

    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = v14;
    CFStringRef v16 = @"UNDER_XXX_MB_EXPLANATION_%@";
    goto LABEL_5;
  }
  v22 = [v9 identifier];
  unsigned int v23 = [v22 isEqualToString:@"ASK_FIRST_ID"];

  if (!v23) {
    goto LABEL_7;
  }
  v24 = [(CellularSettingsController *)self settings];
  [v24 setCellularDataPrompt:1];

  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v20 = [v15 localizedStringForKey:@"ASK_FIRST_EXPLANATION" value:&stru_14C40 table:@"StoreSettings"];
  [v10 setProperty:v20 forKey:PSFooterTextGroupKey];
LABEL_6:

  [v10 setProperty:v9 forKey:PSRadioGroupCheckedSpecifierKey];
LABEL_7:
  [(CellularSettingsController *)self reload];
}

- (id)_formattedNetworkLimit
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"LastNetworkLimit", @"com.apple.appstored", &keyExistsAndHasValidFormat);
  id v3 = (id)AppIntegerValue;
  if (keyExistsAndHasValidFormat) {
    uint64_t v4 = AppIntegerValue;
  }
  else {
    uint64_t v4 = 200000000;
  }
  id v5 = +[ISURLBagCache sharedCache];
  id v6 = +[SSURLBagContext contextWithBagType:0];
  id v7 = [v5 URLBagForContext:v6];

  id v8 = [v7 networkConstraintsForDownloadKind:@"software"];
  id v9 = [v8 sizeLimitForNetworkType:3];
  if (v9 != v3 && v9 != 0)
  {
    uint64_t v11 = (uint64_t)v9;
    CFPreferencesSetAppValue(@"LastNetworkLimit", +[NSNumber numberWithUnsignedLongLong:v9], @"com.apple.appstored");
    uint64_t v4 = v11;
  }
  unsigned int v12 = +[NSByteCountFormatter stringFromByteCount:v4 countStyle:2];

  return v12;
}

- (ISURLBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (ASDCellularSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_bag, 0);
}

@end