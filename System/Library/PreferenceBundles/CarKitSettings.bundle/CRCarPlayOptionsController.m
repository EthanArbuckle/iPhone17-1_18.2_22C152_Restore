@interface CRCarPlayOptionsController
- (CRVehicleSettingManager)vehicleSettingManager;
- (NSArray)optionsSpecifiers;
- (id)carPlayEnabled:(id)a3;
- (id)specifiers;
- (void)_handleSelectedOptionForFerriteEnabled:(BOOL)a3;
- (void)_setFerriteEnabled:(BOOL)a3;
- (void)_showFerriteDisableConfirmationWithCompletion:(id)a3;
- (void)_updateFooterForOptionsGroupSpecifier:(id)a3 ferriteEnabled:(BOOL)a4;
- (void)_updateOptionsGroupVisibility:(BOOL)a3;
- (void)setCarPlayEnabled:(id)a3 specifier:(id)a4;
- (void)setVehicleSettingManager:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CRCarPlayOptionsController

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v34 = OBJC_IVAR___PSListController__specifiers;
    v4 = [(CRCarPlayOptionsController *)self specifier];
    v5 = [v4 userInfo];
    [(CRCarPlayOptionsController *)self setVehicleSettingManager:v5];

    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"CARPLAY_OPTIONS_PAGE_TITLE" value:&stru_24F60 table:@"Localizable"];
    [(CRCarPlayOptionsController *)self setTitle:v7];

    id v32 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v8 = +[PSSpecifier groupSpecifierWithID:@"CARPLAY_GROUP"];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"CARPLAY_SWITCH" value:&stru_24F60 table:@"Localizable"];
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setCarPlayEnabled:specifier:" get:"carPlayEnabled:" detail:0 cell:6 edit:0];

    [v11 setIdentifier:@"CARPLAY_SWITCH"];
    v33 = (void *)v8;
    v36[0] = v8;
    v36[1] = v11;
    v12 = +[NSArray arrayWithObjects:v36 count:2];
    [v32 addObjectsFromArray:v12];

    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"CARPLAY_OPTIONS" value:&stru_24F60 table:@"Localizable"];
    v15 = +[PSSpecifier groupSpecifierWithID:@"OPTIONS_GROUP" name:v14];

    [v15 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v16 = +[PSSpecifier preferenceSpecifierNamed:@"Next Generation of CarPlay" target:self set:0 get:0 detail:0 cell:3 edit:0];
    [v16 setIdentifier:@"OPTIONS_ENABLE"];
    [v16 setProperty:@"ClusterDrawing" forKey:@"CRCarPlayOptionImageNameKey"];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = PSCellClassKey;
    [v16 setProperty:v17 forKey:PSCellClassKey];
    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"CARPLAY_OPTIONS_CARPLAY" value:&stru_24F60 table:@"Localizable"];
    v21 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v21 setIdentifier:@"OPTIONS_DISABLE"];
    [v21 setProperty:@"NoClusterDrawing" forKey:@"CRCarPlayOptionImageNameKey"];
    [v21 setProperty:objc_opt_class() forKey:v18];
    v22 = [(CRCarPlayOptionsController *)self vehicleSettingManager];
    id v23 = [v22 isFerriteEnabled];

    if (v23) {
      v24 = v16;
    }
    else {
      v24 = v21;
    }
    [v15 setProperty:v24 forKey:PSRadioGroupCheckedSpecifierKey];
    [(CRCarPlayOptionsController *)self _updateFooterForOptionsGroupSpecifier:v15 ferriteEnabled:v23];
    v35[0] = v15;
    v35[1] = v16;
    v35[2] = v21;
    v25 = +[NSArray arrayWithObjects:v35 count:3];
    optionsSpecifiers = self->_optionsSpecifiers;
    self->_optionsSpecifiers = v25;

    v27 = [(CRCarPlayOptionsController *)self carPlayEnabled:v11];
    unsigned int v28 = [v27 BOOLValue];

    if (v28) {
      [v32 addObjectsFromArray:self->_optionsSpecifiers];
    }
    uint64_t v29 = +[NSArray arrayWithArray:v32];
    v30 = *(void **)&self->PSListController_opaque[v34];
    *(void *)&self->PSListController_opaque[v34] = v29;

    v3 = *(void **)&self->PSListController_opaque[v34];
  }

  return v3;
}

- (id)carPlayEnabled:(id)a3
{
  v3 = [(CRCarPlayOptionsController *)self vehicleSettingManager];
  v4 = [v3 vehicle];

  v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isPaired]);

  return v5;
}

- (void)setCarPlayEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 BOOLValue];
  v9 = [(CRCarPlayOptionsController *)self vehicleSettingManager];
  v10 = [v9 vehicle];

  if (v8) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  [v10 setPairingStatus:v11];
  objc_initWeak(&location, self);
  v12 = [(CRCarPlayOptionsController *)self vehicleSettingManager];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_14298;
  v16 = &unk_247C8;
  objc_copyWeak(&v17, &location);
  [v12 saveVehicleWithCompletion:&v13];

  -[CRCarPlayOptionsController _updateOptionsGroupVisibility:](self, "_updateOptionsGroupVisibility:", v8, v13, v14, v15, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_setFerriteEnabled:(BOOL)a3
{
  uint64_t v3 = a3;
  v5 = [(CRCarPlayOptionsController *)self vehicleSettingManager];
  LOBYTE(v3) = [v5 setFerriteEnabled:v3];

  if ((v3 & 1) == 0)
  {
    [(CRCarPlayOptionsController *)self reloadSpecifiers];
  }
}

- (void)_updateOptionsGroupVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  [(CRCarPlayOptionsController *)self beginUpdates];
  v5 = [(CRCarPlayOptionsController *)self optionsSpecifiers];
  if (v3) {
    [(CRCarPlayOptionsController *)self insertContiguousSpecifiers:v5 afterSpecifierID:@"CARPLAY_SWITCH" animated:1];
  }
  else {
    [(CRCarPlayOptionsController *)self removeContiguousSpecifiers:v5 animated:1];
  }

  [(CRCarPlayOptionsController *)self endUpdates];
}

- (void)_handleSelectedOptionForFerriteEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CRCarPlayOptionsController *)self optionsSpecifiers];
  id v6 = [v5 specifierForID:@"OPTIONS_GROUP"];

  [(CRCarPlayOptionsController *)self _updateFooterForOptionsGroupSpecifier:v6 ferriteEnabled:v3];
  dispatch_time_t v7 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14540;
  block[3] = &unk_24840;
  block[4] = self;
  id v8 = v6;
  id v11 = v8;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  if (v3)
  {
    [(CRCarPlayOptionsController *)self _setFerriteEnabled:1];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_14550;
    v9[3] = &unk_24D00;
    v9[4] = self;
    [(CRCarPlayOptionsController *)self _showFerriteDisableConfirmationWithCompletion:v9];
  }
}

- (void)_updateFooterForOptionsGroupSpecifier:(id)a3 ferriteEnabled:(BOOL)a4
{
  if (a4) {
    CFStringRef v5 = @"Next Generation of CarPlay will be shown on multiple screens in your car, including the instrument cluster.";
  }
  else {
    CFStringRef v5 = @"CarPlay will only be shown on the main screen in your car. Vehicle functions like radio and climate controls can be controlled using the built-in system.";
  }
  [a3 setProperty:v5 forKey:PSFooterTextGroupKey];
}

- (void)_showFerriteDisableConfirmationWithCompletion:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"CARPLAY_OPTIONS_PROMPT_CONTINUE" value:&stru_24F60 table:@"Localizable"];

  dispatch_time_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"CARPLAY_OPTIONS_PROMPT_CANCEL" value:&stru_24F60 table:@"Localizable"];

  v9 = +[UIAlertController alertControllerWithTitle:@"Use CarPlay" message:@"Vehicle functions like radio and climate controls can be controlled using the built-in system." preferredStyle:0];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_147CC;
  v19[3] = &unk_24CD0;
  id v10 = v4;
  id v20 = v10;
  id v11 = +[UIAlertAction actionWithTitle:v6 style:0 handler:v19];
  [v9 addAction:v11];

  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_14858;
  id v17 = &unk_24CD0;
  id v18 = v10;
  id v12 = v10;
  v13 = +[UIAlertAction actionWithTitle:v8 style:1 handler:&v14];
  objc_msgSend(v9, "addAction:", v13, v14, v15, v16, v17);

  [(CRCarPlayOptionsController *)self presentViewController:v9 animated:1 completion:&stru_24D20];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CRCarPlayOptionsController;
  id v6 = a4;
  [(CRCarPlayOptionsController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  dispatch_time_t v7 = -[CRCarPlayOptionsController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v12.receiver, v12.super_class);

  id v8 = [v7 identifier];
  id v9 = [v8 isEqualToString:@"OPTIONS_ENABLE"];

  if ((v9 & 1) != 0
    || ([v7 identifier],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = [v10 isEqualToString:@"OPTIONS_DISABLE"],
        v10,
        v11))
  {
    [(CRCarPlayOptionsController *)self _handleSelectedOptionForFerriteEnabled:v9];
  }
}

- (CRVehicleSettingManager)vehicleSettingManager
{
  return self->_vehicleSettingManager;
}

- (void)setVehicleSettingManager:(id)a3
{
}

- (NSArray)optionsSpecifiers
{
  return self->_optionsSpecifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsSpecifiers, 0);

  objc_storeStrong((id *)&self->_vehicleSettingManager, 0);
}

@end