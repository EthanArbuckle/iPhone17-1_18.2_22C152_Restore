@interface DTDmstSettings
- (id)specifiers;
- (void)setServiceTypeForSpecifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DTDmstSettings

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)DTDmstSettings;
  [(DTDmstSettings *)&v5 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"MULTIPATH_NETWORKING" value:&stru_35910 table:@"DTDmstSettings"];
  [(DTDmstSettings *)self setTitle:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)DTDmstSettings;
  [(DTDmstSettings *)&v14 viewDidAppear:a3];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 bundleURL];

  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  v7 = +[NSLocale currentLocale];
  id v8 = [v6 initWithKey:@"DEVELOPER" table:@"DTSettings" locale:v7 bundleURL:v5];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  v10 = +[NSLocale currentLocale];
  id v11 = [v9 initWithKey:@"MULTIPATH_NETWORKING" table:@"DTDmstSettings" locale:v10 bundleURL:v5];

  id v15 = v8;
  v12 = +[NSArray arrayWithObjects:&v15 count:1];
  v13 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Developer/MULTI_PATH_AGG"];
  [(DTDmstSettings *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.developer-tools" title:v11 localizedNavigationComponents:v12 deepLink:v13];
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v35 = OBJC_IVAR___PSListController__specifiers;
    v33 = +[NSNumber numberWithInt:network_config_get_default_multipath_service_type()];
    id v4 = objc_alloc_init((Class)NSMutableArray);
    +[PSSpecifier preferenceSpecifierNamed:&stru_35910 target:self set:0 get:0 detail:0 cell:0 edit:0];
    v37 = v36 = v4;
    objc_msgSend(v4, "addObject:");
    objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"DMST" value:&stru_35910 table:@"DTDmstSettings"];
    v34 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:0 edit:0];

    v7 = +[NSNumber numberWithBool:1];
    [v34 setProperty:v7 forKey:PSIsRadioGroupKey];

    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"NONE" value:&stru_35910 table:@"DTDmstSettings"];
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v10 setButtonAction:"setServiceTypeForSpecifier:"];
    id v11 = +[NSNumber numberWithInt:0];
    [v10 setProperty:v11 forKey:@"dmstValue"];

    v12 = +[NSNumber numberWithInt:0];
    if (v33 == v12) {
      v13 = v10;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    id v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"HANDOVER" value:&stru_35910 table:@"DTDmstSettings"];
    v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v17 setButtonAction:"setServiceTypeForSpecifier:"];
    v18 = +[NSNumber numberWithInt:1];
    [v17 setProperty:v18 forKey:@"dmstValue"];

    v19 = +[NSNumber numberWithInt:1];
    if (v33 == v19) {
      v20 = v17;
    }
    else {
      v20 = v14;
    }
    id v21 = v20;

    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"INTERACTIVE" value:&stru_35910 table:@"DTDmstSettings"];
    v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v24 setButtonAction:"setServiceTypeForSpecifier:"];
    v25 = +[NSNumber numberWithInt:2];
    [v24 setProperty:v25 forKey:@"dmstValue"];

    v26 = +[NSNumber numberWithInt:2];
    if (v33 == v26) {
      v27 = v24;
    }
    else {
      v27 = v21;
    }
    id v28 = v27;

    if (v28)
    {
      [v34 setProperty:v28 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    v29 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v34, v10, v17, v24, 0);
    dmstSpecifiers = self->_dmstSpecifiers;
    self->_dmstSpecifiers = v29;

    [v36 addObjectsFromArray:self->_dmstSpecifiers];
    v31 = *(void **)&self->PSListController_opaque[v35];
    *(void *)&self->PSListController_opaque[v35] = v36;

    v3 = *(void **)&self->PSListController_opaque[v35];
  }

  return v3;
}

- (void)setServiceTypeForSpecifier:(id)a3
{
  v3 = [a3 propertyForKey:@"dmstValue"];
  id v4 = [v3 intValue];

  _network_config_set_default_multipath_service_type(v4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)DTDmstSettings;
  [(DTDmstSettings *)&v21 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(DTDmstSettings *)self specifierAtIndex:[(DTDmstSettings *)self indexForIndexPath:v6]];
  if ([v7 cellType] == (char *)&dword_0 + 3)
  {
    uint64_t v8 = PSTableCellKey;
    id v9 = [v7 propertyForKey:PSTableCellKey];
    [v9 setChecked:1];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = [(DTDmstSettings *)self specifiers];
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v14);
          if (v15 != v7)
          {
            v16 = [v15 propertyForKey:v8];
            [v16 setChecked:0];
          }
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }
  }
}

- (void).cxx_destruct
{
}

@end