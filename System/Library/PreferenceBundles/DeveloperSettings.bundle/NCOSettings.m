@interface NCOSettings
+ (id)ncoAlertWithText:(id)a3 cancelHandler:(id)a4 defaultHandler:(id)a5;
- (BOOL)cachedCellularOverrideValue;
- (BOOL)cachedPrefer5GValue;
- (BOOL)shouldShowExpirationFooter;
- (NCOData)ncoData;
- (NCOSettings)init;
- (NSArray)wifiShortTitles;
- (id)getNCOCellularValue:(id)a3;
- (id)getNCOPrefer5GValue:(id)a3;
- (id)getNCOWiFiValue:(id)a3;
- (id)specifiers;
- (int64_t)cachedWifiOverrideValue;
- (void)enablePrefer5G:(BOOL)a3 specifier:(id)a4;
- (void)reloadNCOGroup;
- (void)reloadPrefer5GSpecifier:(id)a3;
- (void)setCachedCellularOverrideValue:(BOOL)a3;
- (void)setCachedPrefer5GValue:(BOOL)a3;
- (void)setCachedWifiOverrideValue:(int64_t)a3;
- (void)setNCOPrefer5GValue:(id)a3 specifier:(id)a4;
- (void)setNcoData:(id)a3;
- (void)setWifiShortTitles:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NCOSettings

- (NCOSettings)init
{
  v14.receiver = self;
  v14.super_class = (Class)NCOSettings;
  v2 = [(NCOSettings *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    ncoData = v2->_ncoData;
    v2->_ncoData = (NCOData *)v3;

    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"NCO_DEFAULT" value:&stru_35910 table:@"NCOSettings"];
    v15[0] = v6;
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"NCO_INEXPENSIVE" value:&stru_35910 table:@"NCOSettings"];
    v15[1] = v8;
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"NCO_EXPENSIVE" value:&stru_35910 table:@"NCOSettings"];
    v15[2] = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:v15 count:3];
    wifiShortTitles = v2->_wifiShortTitles;
    v2->_wifiShortTitles = (NSArray *)v11;
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = [(NCOSettings *)self ncoData];
    unsigned int v7 = [v6 isHighDataModeSupported];

    if (v7)
    {
      v8 = +[PSSpecifier preferenceSpecifierNamed:&stru_35910 target:self set:0 get:0 detail:0 cell:0 edit:0];
      [v8 setIdentifier:@"NCO_Group_Id"];
      [v5 addObject:v8];
      v9 = +[NSBundle bundleForClass:objc_opt_class()];
      v10 = [v9 localizedStringForKey:@"NCO_CELLULAR_COST" value:&stru_35910 table:@"NCOSettings"];
      v24 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:"getNCOCellularValue:" detail:objc_opt_class() cell:2 edit:0];

      [v5 addObject:v24];
      uint64_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
      v12 = [v11 localizedStringForKey:@"NCO_WIFI_COST" value:&stru_35910 table:@"NCOSettings"];
      v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:"getNCOWiFiValue:" detail:objc_opt_class() cell:2 edit:0];

      [v5 addObject:v13];
      objc_super v14 = +[NSBundle bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:@"NCO_PREFER5G" value:&stru_35910 table:@"NCOSettings"];
      v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:"setNCOPrefer5GValue:specifier:" get:"getNCOPrefer5GValue:" detail:0 cell:6 edit:0];

      [v5 addObject:v16];
      LODWORD(v14) = [(NCOSettings *)self shouldShowExpirationFooter];
      v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = v17;
      if (v14) {
        CFStringRef v19 = @"NCO_GROUP_EXPIRE_FOOTER";
      }
      else {
        CFStringRef v19 = @"NCO_GROUP_EMPTY_FOOTER";
      }
      v20 = [v17 localizedStringForKey:v19 value:&stru_35910 table:@"NCOSettings"];

      [v8 setProperty:v20 forKey:PSFooterTextGroupKey];
    }
    id v21 = [v5 copy];
    v22 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v21;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (BOOL)shouldShowExpirationFooter
{
  if ([(NCOSettings *)self cachedCellularOverrideValue]
    || [(NCOSettings *)self cachedWifiOverrideValue] > 0)
  {
    return 1;
  }

  return [(NCOSettings *)self cachedPrefer5GValue];
}

- (void)reloadNCOGroup
{
  uint64_t v3 = [(NCOSettings *)self ncoData];
  -[NCOSettings setCachedCellularOverrideValue:](self, "setCachedCellularOverrideValue:", [v3 isCellularInexpensive]);

  v4 = [(NCOSettings *)self ncoData];
  -[NCOSettings setCachedWifiOverrideValue:](self, "setCachedWifiOverrideValue:", [v4 wifiOverride]);

  v5 = [(NCOSettings *)self ncoData];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_11340;
  v6[3] = &unk_35100;
  v6[4] = self;
  [v5 fetchPrefer5GEnabledWithCompletion:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCOSettings;
  [(NCOSettings *)&v4 viewWillAppear:a3];
  [(NCOSettings *)self reloadNCOGroup];
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NCOSettings;
  [(NCOSettings *)&v14 viewDidAppear:a3];
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 bundleURL];

  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  unsigned int v7 = +[NSLocale currentLocale];
  id v8 = [v6 initWithKey:@"DEVELOPER" table:@"DTSettings" locale:v7 bundleURL:v5];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  v10 = +[NSLocale currentLocale];
  id v11 = [v9 initWithKey:@"NCO_TITLE" table:@"NCOSettings" locale:v10 bundleURL:v5];

  id v15 = v8;
  v12 = +[NSArray arrayWithObjects:&v15 count:1];
  v13 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Developer/NCO"];
  [(NCOSettings *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.developer-tools" title:v11 localizedNavigationComponents:v12 deepLink:v13];
}

- (id)getNCOCellularValue:(id)a3
{
  unsigned int v3 = [(NCOSettings *)self cachedCellularOverrideValue];
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = v4;
  if (v3) {
    CFStringRef v6 = @"NCO_INEXPENSIVE";
  }
  else {
    CFStringRef v6 = @"NCO_DEFAULT";
  }
  unsigned int v7 = [v4 localizedStringForKey:v6 value:&stru_35910 table:@"NCOSettings"];

  return v7;
}

- (id)getNCOWiFiValue:(id)a3
{
  unint64_t v4 = [(NCOSettings *)self cachedWifiOverrideValue];
  v5 = [(NCOSettings *)self wifiShortTitles];
  id v6 = [v5 count];

  if (v4 > (unint64_t)v6) {
    [(NCOSettings *)self setCachedWifiOverrideValue:0];
  }
  unsigned int v7 = [(NCOSettings *)self wifiShortTitles];
  id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", -[NCOSettings cachedWifiOverrideValue](self, "cachedWifiOverrideValue"));

  return v8;
}

- (id)getNCOPrefer5GValue:(id)a3
{
  BOOL v3 = [(NCOSettings *)self cachedPrefer5GValue];

  return +[NSNumber numberWithBool:v3];
}

- (void)setNCOPrefer5GValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:PSControlIsLoadingKey];
  [(NCOSettings *)self reloadSpecifier:v7 animated:1];
  if ([v6 isEqualToNumber:&__kCFBooleanTrue])
  {
    id v8 = [(NCOSettings *)self ncoData];
    unsigned int v9 = [v8 isCellularInexpensive];

    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    id v11 = v10;
    if (v9)
    {
      v12 = [v10 localizedStringForKey:@"NCO_PREFER5G_INEXPENSIVE_ALERT_TEXT" value:&stru_35910 table:@"NCOSettings"];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_11A9C;
      v29[3] = &unk_35128;
      v29[4] = self;
      id v30 = v7;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_11AA8;
      v26[3] = &unk_35150;
      v26[4] = self;
      id v27 = v6;
      id v28 = v30;
      v13 = +[NCOSettings ncoAlertWithText:v12 cancelHandler:v29 defaultHandler:v26];

      [(NCOSettings *)self presentViewController:v13 animated:1 completion:0];
      id v14 = v30;
    }
    else
    {
      id v15 = [v10 localizedStringForKey:@"NCO_PREFER5G_DEFAULT_ALERT_TEXT" value:&stru_35910 table:@"NCOSettings"];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_11B24;
      v24[3] = &unk_35128;
      v24[4] = self;
      id v25 = v7;
      v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      CFStringRef v19 = sub_11B30;
      v20 = &unk_35150;
      id v21 = self;
      id v22 = v6;
      id v23 = v25;
      v16 = +[NCOSettings ncoAlertWithText:v15 cancelHandler:v24 defaultHandler:&v17];

      -[NCOSettings presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0, v17, v18, v19, v20, v21);
      id v14 = v25;
    }
  }
  else
  {
    -[NCOSettings enablePrefer5G:specifier:](self, "enablePrefer5G:specifier:", [v6 BOOLValue], v7);
  }
}

- (void)enablePrefer5G:(BOOL)a3 specifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3042000000;
  v12[3] = sub_11CD8;
  v12[4] = sub_11CE4;
  objc_initWeak(&v13, self);
  id v7 = [(NCOSettings *)self ncoData];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_11CEC;
  v9[3] = &unk_34F50;
  id v11 = v12;
  id v8 = v6;
  id v10 = v8;
  [v7 enablePrefer5G:v4 completion:v9];

  _Block_object_dispose(v12, 8);
  objc_destroyWeak(&v13);
}

- (void)reloadPrefer5GSpecifier:(id)a3
{
  [a3 setObject:&__kCFBooleanFalse forKeyedSubscript:PSControlIsLoadingKey];

  [(NCOSettings *)self reloadNCOGroup];
}

+ (id)ncoAlertWithText:(id)a3 cancelHandler:(id)a4 defaultHandler:(id)a5
{
  id v7 = a4;
  id v21 = a5;
  id v8 = a3;
  unsigned int v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"NCO_ALERT_TITLE" value:&stru_35910 table:@"NCOSettings"];
  id v11 = +[UIAlertController alertControllerWithTitle:v10 message:v8 preferredStyle:1];

  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"NCO_CANCEL" value:&stru_35910 table:@"NCOSettings"];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_120DC;
  v24[3] = &unk_35178;
  id v25 = v7;
  id v14 = v7;
  id v15 = +[UIAlertAction actionWithTitle:v13 style:1 handler:v24];

  [v11 addAction:v15];
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"NCO_CONTINUE" value:&stru_35910 table:@"NCOSettings"];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_120F4;
  v22[3] = &unk_35178;
  id v23 = v21;
  id v18 = v21;
  CFStringRef v19 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v22];

  [v11 addAction:v19];
  [v11 setPreferredAction:v19];

  return v11;
}

- (NCOData)ncoData
{
  return self->_ncoData;
}

- (void)setNcoData:(id)a3
{
}

- (NSArray)wifiShortTitles
{
  return self->_wifiShortTitles;
}

- (void)setWifiShortTitles:(id)a3
{
}

- (BOOL)cachedCellularOverrideValue
{
  return self->_cachedCellularOverrideValue;
}

- (void)setCachedCellularOverrideValue:(BOOL)a3
{
  self->_cachedCellularOverrideValue = a3;
}

- (int64_t)cachedWifiOverrideValue
{
  return self->_cachedWifiOverrideValue;
}

- (void)setCachedWifiOverrideValue:(int64_t)a3
{
  self->_cachedWifiOverrideValue = a3;
}

- (BOOL)cachedPrefer5GValue
{
  return self->_cachedPrefer5GValue;
}

- (void)setCachedPrefer5GValue:(BOOL)a3
{
  self->_cachedPrefer5GValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiShortTitles, 0);

  objc_storeStrong((id *)&self->_ncoData, 0);
}

@end