@interface ASTDwellMovementToleranceHelper
- (ASTDwellMovementToleranceHelper)initWithClientType:(unint64_t)a3;
- (NSString)toleranceSpecifierGroupTitle;
- (PSListController)settingsController;
- (double)dwellControlMovementToleranceRadius;
- (id)dwellSpecifiers;
- (unint64_t)clientType;
- (void)_updateSpecifierState:(id)a3;
- (void)setClientType:(unint64_t)a3;
- (void)setDwellControlMovementToleranceRadius:(double)a3;
- (void)setSettingsController:(id)a3;
- (void)setToleranceSpecifierGroupTitle:(id)a3;
@end

@implementation ASTDwellMovementToleranceHelper

- (ASTDwellMovementToleranceHelper)initWithClientType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASTDwellMovementToleranceHelper;
  result = [(ASTDwellMovementToleranceHelper *)&v5 init];
  if (result) {
    result->_clientType = a3;
  }
  return result;
}

- (id)dwellSpecifiers
{
  v3 = +[NSMutableArray array];
  v4 = [(ASTDwellMovementToleranceHelper *)self toleranceSpecifierGroupTitle];
  id v5 = [v4 length];

  if (v5)
  {
    v6 = [(ASTDwellMovementToleranceHelper *)self toleranceSpecifierGroupTitle];
    v7 = +[PSSpecifier groupSpecifierWithName:v6];
  }
  else
  {
    v7 = +[PSSpecifier emptyGroupSpecifier];
  }
  v8 = settingsLocString(@"DWELL_MOVEMENT_TOLERANCE_FOOTER", @"HandSettings");
  [v7 setProperty:v8 forKey:PSFooterTextGroupKey];

  [v3 addObject:v7];
  v9 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v9 setProperty:objc_opt_class() forKey:PSCellClassKey];
  v10 = +[NSNumber numberWithUnsignedInteger:[(ASTDwellMovementToleranceHelper *)self clientType]];
  [v9 setProperty:v10 forKey:@"DwellMovementToleranceClientType"];

  [v3 addObject:v9];
  v11 = +[PSSpecifier emptyGroupSpecifier];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  [v11 setProperty:v13 forKey:PSHeaderCellClassGroupKey];

  v14 = +[NSNumber numberWithUnsignedInteger:[(ASTDwellMovementToleranceHelper *)self clientType]];
  [v11 setProperty:v14 forKey:@"DwellMovementToleranceClientType"];

  [v3 addObject:v11];

  return v3;
}

- (void)_updateSpecifierState:(id)a3
{
  id v4 = a3;
  id v5 = [(ASTDwellMovementToleranceHelper *)self settingsController];
  [v5 reloadSpecifier:v4];
}

- (PSListController)settingsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsController);

  return (PSListController *)WeakRetained;
}

- (void)setSettingsController:(id)a3
{
}

- (double)dwellControlMovementToleranceRadius
{
  return self->_dwellControlMovementToleranceRadius;
}

- (void)setDwellControlMovementToleranceRadius:(double)a3
{
  self->_dwellControlMovementToleranceRadius = a3;
}

- (NSString)toleranceSpecifierGroupTitle
{
  return self->_toleranceSpecifierGroupTitle;
}

- (void)setToleranceSpecifierGroupTitle:(id)a3
{
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unint64_t)a3
{
  self->_clientType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toleranceSpecifierGroupTitle, 0);

  objc_destroyWeak((id *)&self->_settingsController);
}

@end