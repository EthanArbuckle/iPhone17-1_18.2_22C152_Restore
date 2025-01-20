@interface NCOCellularDetail
- (BOOL)cachedValue;
- (NCOCellularDetail)init;
- (NCOData)ncoData;
- (id)specifiers;
- (void)confirmInexpensiveSelection;
- (void)selectDefaultSpecifier:(id)a3;
- (void)selectInexpensiveSpecifier:(id)a3;
- (void)setCachedValue:(BOOL)a3;
- (void)setNcoData:(id)a3;
- (void)updateCellularToInexpensive:(BOOL)a3;
@end

@implementation NCOCellularDetail

- (NCOCellularDetail)init
{
  v6.receiver = self;
  v6.super_class = (Class)NCOCellularDetail;
  v2 = [(NCOCellularDetail *)&v6 init];
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
    v7 = [v6 localizedStringForKey:@"NCO_CELLULAR_COST" value:&stru_35910 table:@"NCOSettings"];
    v8 = +[PSSpecifier groupSpecifierWithID:@"NCO_CELLULAR_DETAIL" name:v7];

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
    v15 = [(NCOCellularDetail *)self ncoData];
    -[NCOCellularDetail setCachedValue:](self, "setCachedValue:", [v15 isCellularInexpensive]);

    if ([(NCOCellularDetail *)self cachedValue]) {
      v16 = v14;
    }
    else {
      v16 = v11;
    }
    [v8 setProperty:v16 forKey:PSRadioGroupCheckedSpecifierKey];
    v17 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)selectDefaultSpecifier:(id)a3
{
  if ([(NCOCellularDetail *)self cachedValue])
  {
    [(NCOCellularDetail *)self updateCellularToInexpensive:0];
  }
}

- (void)selectInexpensiveSpecifier:(id)a3
{
  if (![(NCOCellularDetail *)self cachedValue])
  {
    [(NCOCellularDetail *)self confirmInexpensiveSelection];
  }
}

- (void)confirmInexpensiveSelection
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"NCO_CELLULAR_ALERT_TEXT" value:&stru_35910 table:@"NCOSettings"];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_FE30;
  v6[3] = &unk_35010;
  v6[4] = self;
  id v5 = +[NCOSettings ncoAlertWithText:v4 cancelHandler:0 defaultHandler:v6];

  [(NCOCellularDetail *)self presentViewController:v5 animated:1 completion:0];
}

- (void)updateCellularToInexpensive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NCOCellularDetail *)self ncoData];
  [v5 setCellularInexpensive:v3];

  [(NCOCellularDetail *)self reloadSpecifiers];
}

- (NCOData)ncoData
{
  return self->_ncoData;
}

- (void)setNcoData:(id)a3
{
}

- (BOOL)cachedValue
{
  return self->_cachedValue;
}

- (void)setCachedValue:(BOOL)a3
{
  self->_cachedValue = a3;
}

- (void).cxx_destruct
{
}

@end