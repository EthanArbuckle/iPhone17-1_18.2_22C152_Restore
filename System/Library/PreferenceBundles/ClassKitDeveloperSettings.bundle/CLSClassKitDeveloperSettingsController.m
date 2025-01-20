@interface CLSClassKitDeveloperSettingsController
- (BOOL)devModeEnabled;
- (PSSpecifier)actAsGroupSpecifier;
- (PSSpecifier)actAsOffSpecifier;
- (PSSpecifier)actAsStudentSpecifier;
- (PSSpecifier)actAsTeacherSpecifier;
- (PSSpecifier)catalogEnvDevSpecifier;
- (PSSpecifier)catalogEnvGroupSpecifier;
- (PSSpecifier)catalogEnvProdSpecifier;
- (id)specifiers;
- (void)resetDevelopmentData:(id)a3;
- (void)setActAsGroupSpecifier:(id)a3;
- (void)setActAsOffSpecifier:(id)a3;
- (void)setActAsStudentSpecifier:(id)a3;
- (void)setActAsTeacherSpecifier:(id)a3;
- (void)setCatalogEnvDevSpecifier:(id)a3;
- (void)setCatalogEnvGroupSpecifier:(id)a3;
- (void)setCatalogEnvProdSpecifier:(id)a3;
- (void)setDevModeEnabled:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCheckedSpecifierFromPreferences;
@end

@implementation CLSClassKitDeveloperSettingsController

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v42 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"ACT_AS" value:&stru_42E8 table:@"ClassKitDeveloperSettings"];
    v7 = +[PSSpecifier groupSpecifierWithID:@"CLSSettingsActAsGroupID" name:v6];
    [(CLSClassKitDeveloperSettingsController *)self setActAsGroupSpecifier:v7];

    v8 = [(CLSClassKitDeveloperSettingsController *)self actAsGroupSpecifier];
    uint64_t v41 = PSIsRadioGroupKey;
    objc_msgSend(v8, "setProperty:forKey:", &__kCFBooleanTrue);

    v9 = [(CLSClassKitDeveloperSettingsController *)self actAsGroupSpecifier];
    [v4 addObject:v9];

    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"ACT_AS_OFF" value:&stru_42E8 table:@"ClassKitDeveloperSettings"];
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];
    [(CLSClassKitDeveloperSettingsController *)self setActAsOffSpecifier:v12];

    v13 = [(CLSClassKitDeveloperSettingsController *)self actAsOffSpecifier];
    [v4 addObject:v13];

    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"ACT_AS_TEACHER" value:&stru_42E8 table:@"ClassKitDeveloperSettings"];
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:3 edit:0];
    [(CLSClassKitDeveloperSettingsController *)self setActAsTeacherSpecifier:v16];

    v17 = [(CLSClassKitDeveloperSettingsController *)self actAsTeacherSpecifier];
    [v4 addObject:v17];

    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"ACT_AS_STUDENT" value:&stru_42E8 table:@"ClassKitDeveloperSettings"];
    v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:0 cell:3 edit:0];
    [(CLSClassKitDeveloperSettingsController *)self setActAsStudentSpecifier:v20];

    v21 = [(CLSClassKitDeveloperSettingsController *)self actAsStudentSpecifier];
    [v4 addObject:v21];

    v40 = +[PSSpecifier groupSpecifierWithID:@"CLSSettingsResetDataGroupID"];
    [v4 addObject:v40];
    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"RESET_DATA" value:&stru_42E8 table:@"ClassKitDeveloperSettings"];
    v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v24 setButtonAction:"resetDevelopmentData:"];
    [v4 addObject:v24];
    v25 = +[NSBundle bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"CLASSKIT_CATALOG_ENVIRONMENT" value:&stru_42E8 table:@"ClassKitDeveloperSettings"];
    v27 = +[PSSpecifier groupSpecifierWithID:@"CLSSettingsCatalogEnvGroupID" name:v26];
    [(CLSClassKitDeveloperSettingsController *)self setCatalogEnvGroupSpecifier:v27];

    v28 = [(CLSClassKitDeveloperSettingsController *)self catalogEnvGroupSpecifier];
    [v28 setProperty:&__kCFBooleanTrue forKey:v41];

    v29 = [(CLSClassKitDeveloperSettingsController *)self catalogEnvGroupSpecifier];
    [v4 addObject:v29];

    v30 = +[NSBundle bundleForClass:objc_opt_class()];
    v31 = [v30 localizedStringForKey:@"CLASSKIT_CATALOG_ENVIRONMENT_PROD" value:&stru_42E8 table:@"ClassKitDeveloperSettings"];
    v32 = +[PSSpecifier preferenceSpecifierNamed:v31 target:self set:0 get:0 detail:0 cell:3 edit:0];
    [(CLSClassKitDeveloperSettingsController *)self setCatalogEnvProdSpecifier:v32];

    v33 = [(CLSClassKitDeveloperSettingsController *)self catalogEnvProdSpecifier];
    [v4 addObject:v33];

    v34 = +[NSBundle bundleForClass:objc_opt_class()];
    v35 = [v34 localizedStringForKey:@"CLASSKIT_CATALOG_ENVIRONMENT_DEV" value:&stru_42E8 table:@"ClassKitDeveloperSettings"];
    v36 = +[PSSpecifier preferenceSpecifierNamed:v35 target:self set:0 get:0 detail:0 cell:3 edit:0];
    [(CLSClassKitDeveloperSettingsController *)self setCatalogEnvDevSpecifier:v36];

    v37 = [(CLSClassKitDeveloperSettingsController *)self catalogEnvDevSpecifier];
    [v4 addObject:v37];

    v38 = *(void **)&self->PSListController_opaque[v42];
    *(void *)&self->PSListController_opaque[v42] = v4;

    [(CLSClassKitDeveloperSettingsController *)self updateCheckedSpecifierFromPreferences];
    v3 = *(void **)&self->PSListController_opaque[v42];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CLSClassKitDeveloperSettingsController;
  [(CLSClassKitDeveloperSettingsController *)&v31 tableView:v6 didSelectRowAtIndexPath:v7];
  v8 = [(CLSClassKitDeveloperSettingsController *)self specifierAtIndex:[(CLSClassKitDeveloperSettingsController *)self indexForIndexPath:v7]];
  v9 = [(CLSClassKitDeveloperSettingsController *)self actAsOffSpecifier];

  if (v8 == v9)
  {
    int v16 = 0;
    uint64_t v15 = 0;
    uint64_t v17 = 0;
LABEL_9:
    int v14 = 1;
    goto LABEL_10;
  }
  v10 = [(CLSClassKitDeveloperSettingsController *)self actAsTeacherSpecifier];

  if (v8 == v10)
  {
    int v16 = 0;
    uint64_t v17 = 0;
    uint64_t v15 = 2;
    goto LABEL_9;
  }
  v11 = [(CLSClassKitDeveloperSettingsController *)self actAsStudentSpecifier];

  if (v8 == v11)
  {
    int v16 = 0;
    uint64_t v17 = 0;
    int v14 = 1;
    uint64_t v15 = 1;
  }
  else
  {
    v12 = [(CLSClassKitDeveloperSettingsController *)self catalogEnvProdSpecifier];

    if (v8 == v12)
    {
      int v14 = 0;
      uint64_t v15 = 0;
      uint64_t v17 = 0;
      int v16 = 1;
    }
    else
    {
      v13 = [(CLSClassKitDeveloperSettingsController *)self catalogEnvDevSpecifier];

      if (v8 != v13) {
        goto LABEL_15;
      }
      int v14 = 0;
      uint64_t v15 = 0;
      int v16 = 1;
      uint64_t v17 = 1;
    }
  }
LABEL_10:
  v18 = +[CLSUtilityService sharedInstance];
  objc_initWeak(&location, self);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_28E8;
  v28 = sub_28F8;
  dispatch_group_t v29 = dispatch_group_create();
  if (v14)
  {
    dispatch_group_enter((dispatch_group_t)v25[5]);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_2900;
    v23[3] = &unk_4168;
    v23[4] = &v24;
    [v18 setDevMode:v15 completion:v23];
  }
  if (v16)
  {
    dispatch_group_enter((dispatch_group_t)v25[5]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_2910;
    v22[3] = &unk_4168;
    v22[4] = &v24;
    [v18 setClassKitCatalogEnvironment:v17 completion:v22];
  }
  v19 = v25[5];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2920;
  block[3] = &unk_4190;
  objc_copyWeak(&v21, &location);
  dispatch_group_notify(v19, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v21);
  _Block_object_dispose(&v24, 8);

  objc_destroyWeak(&location);
LABEL_15:
}

- (void)updateCheckedSpecifierFromPreferences
{
  v3 = +[CLSUtilityService sharedInstance];
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2AB8;
  v6[3] = &unk_41E0;
  objc_copyWeak(&v7, &location);
  [v3 getDevModeWithCompletion:v6];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2C5C;
  v4[3] = &unk_4208;
  objc_copyWeak(&v5, &location);
  [v3 getClassKitCatalogEnvironmentWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)resetDevelopmentData:(id)a3
{
  id v3 = +[CLSUtilityService sharedInstance];
  [v3 recreateDevelopmentDatabaseWithCompletion:&stru_4248];
}

- (PSSpecifier)actAsGroupSpecifier
{
  return self->_actAsGroupSpecifier;
}

- (void)setActAsGroupSpecifier:(id)a3
{
}

- (PSSpecifier)actAsOffSpecifier
{
  return self->_actAsOffSpecifier;
}

- (void)setActAsOffSpecifier:(id)a3
{
}

- (PSSpecifier)actAsTeacherSpecifier
{
  return self->_actAsTeacherSpecifier;
}

- (void)setActAsTeacherSpecifier:(id)a3
{
}

- (PSSpecifier)actAsStudentSpecifier
{
  return self->_actAsStudentSpecifier;
}

- (void)setActAsStudentSpecifier:(id)a3
{
}

- (PSSpecifier)catalogEnvGroupSpecifier
{
  return self->_catalogEnvGroupSpecifier;
}

- (void)setCatalogEnvGroupSpecifier:(id)a3
{
}

- (PSSpecifier)catalogEnvDevSpecifier
{
  return self->_catalogEnvDevSpecifier;
}

- (void)setCatalogEnvDevSpecifier:(id)a3
{
}

- (PSSpecifier)catalogEnvProdSpecifier
{
  return self->_catalogEnvProdSpecifier;
}

- (void)setCatalogEnvProdSpecifier:(id)a3
{
}

- (BOOL)devModeEnabled
{
  return self->_devModeEnabled;
}

- (void)setDevModeEnabled:(BOOL)a3
{
  self->_devModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalogEnvProdSpecifier, 0);
  objc_storeStrong((id *)&self->_catalogEnvDevSpecifier, 0);
  objc_storeStrong((id *)&self->_catalogEnvGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_actAsStudentSpecifier, 0);
  objc_storeStrong((id *)&self->_actAsTeacherSpecifier, 0);
  objc_storeStrong((id *)&self->_actAsOffSpecifier, 0);

  objc_storeStrong((id *)&self->_actAsGroupSpecifier, 0);
}

@end