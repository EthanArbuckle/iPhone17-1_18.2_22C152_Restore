@interface NCOWiFiDetail
- (NCOData)ncoData;
- (NCOWiFiDetail)init;
- (id)specifiers;
- (int64_t)cachedValue;
- (unsigned)selectedOverride;
- (void)confirmInexpensiveSelection;
- (void)selectDefaultSpecifier:(id)a3;
- (void)selectExpensiveSpecifier:(id)a3;
- (void)selectInexpensiveSpecifier:(id)a3;
- (void)setCachedValue:(int64_t)a3;
- (void)setNcoData:(id)a3;
- (void)setWifiOverrideValue:(unsigned int)a3;
@end

@implementation NCOWiFiDetail

- (NCOWiFiDetail)init
{
  v6.receiver = self;
  v6.super_class = (Class)NCOWiFiDetail;
  v2 = [(NCOWiFiDetail *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    ncoData = v2->_ncoData;
    v2->_ncoData = (NCOData *)v3;
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"NCO_WIFI_COST" value:&stru_35910 table:@"NCOSettings"];
    v8 = +[PSSpecifier groupSpecifierWithID:@"NCO_WIFI_DETAIL" name:v7];

    [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:PSIsRadioGroupKey];
    [v5 addObject:v8];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"NCO_DEFAULT" value:&stru_35910 table:@"NCOSettings"];
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v11 setButtonAction:"selectDefaultSpecifier:"];
    [v5 addObject:v11];
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"NCO_SET_INEXPENSIVE" value:&stru_35910 table:@"NCOSettings"];
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v14 setButtonAction:"selectInexpensiveSpecifier:"];
    [v5 addObject:v14];
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"NCO_SET_EXPENSIVE" value:&stru_35910 table:@"NCOSettings"];
    v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v17 setButtonAction:"selectExpensiveSpecifier:"];
    [v5 addObject:v17];
    id v18 = v11;
    [(NCOWiFiDetail *)self setCachedValue:[(NCOWiFiDetail *)self selectedOverride]];
    int64_t v19 = [(NCOWiFiDetail *)self cachedValue];
    v20 = v14;
    if (v19 == 1 || (int64_t v21 = [(NCOWiFiDetail *)self cachedValue], v20 = v17, v22 = v18, v21 == 2))
    {
      id v22 = v20;
    }
    [v8 setProperty:v22 forKey:PSRadioGroupCheckedSpecifierKey];
    v23 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (unsigned)selectedOverride
{
  v2 = [(NCOWiFiDetail *)self ncoData];
  unsigned int v3 = [v2 wifiOverride];

  return v3;
}

- (void)selectDefaultSpecifier:(id)a3
{
  if ([(NCOWiFiDetail *)self cachedValue])
  {
    [(NCOWiFiDetail *)self setWifiOverrideValue:0];
  }
}

- (void)selectInexpensiveSpecifier:(id)a3
{
  if ((char *)[(NCOWiFiDetail *)self cachedValue] != (char *)&dword_0 + 1)
  {
    [(NCOWiFiDetail *)self confirmInexpensiveSelection];
  }
}

- (void)selectExpensiveSpecifier:(id)a3
{
  if ((char *)[(NCOWiFiDetail *)self cachedValue] != (char *)&dword_0 + 2)
  {
    [(NCOWiFiDetail *)self setWifiOverrideValue:2];
  }
}

- (void)setWifiOverrideValue:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_initWeak(&location, self);
  id v5 = [(NCOWiFiDetail *)self ncoData];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1280C;
  v6[3] = &unk_351A0;
  objc_copyWeak(&v7, &location);
  [v5 setWifiOverride:v3 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)confirmInexpensiveSelection
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"NCO_WIFI_ALERT_TEXT" value:&stru_35910 table:@"NCOSettings"];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_129EC;
  v6[3] = &unk_35010;
  void v6[4] = self;
  id v5 = +[NCOSettings ncoAlertWithText:v4 cancelHandler:0 defaultHandler:v6];

  [(NCOWiFiDetail *)self presentViewController:v5 animated:1 completion:0];
}

- (NCOData)ncoData
{
  return self->_ncoData;
}

- (void)setNcoData:(id)a3
{
}

- (int64_t)cachedValue
{
  return self->_cachedValue;
}

- (void)setCachedValue:(int64_t)a3
{
  self->_cachedValue = a3;
}

- (void).cxx_destruct
{
}

@end