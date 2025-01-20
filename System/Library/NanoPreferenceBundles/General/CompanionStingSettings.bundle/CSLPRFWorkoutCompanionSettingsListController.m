@interface CSLPRFWorkoutCompanionSettingsListController
- (CSLPRFWorkoutCompanionSettingsListController)init;
- (id)_makeActionItemSpecifier:(id)a3 actionType:(unint64_t)a4;
- (id)_makeListItemSpecifier:(id)a3 actionType:(unint64_t)a4;
- (id)_settingsModel;
- (id)specifiers;
- (id)subtitle:(id)a3;
- (void)reloadSpecifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CSLPRFWorkoutCompanionSettingsListController

- (CSLPRFWorkoutCompanionSettingsListController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSLPRFWorkoutCompanionSettingsListController;
  v2 = [(CSLPRFWorkoutCompanionSettingsListController *)&v6 init];
  if (v2)
  {
    v3 = (CSLPRFStingConfiguration *)[objc_alloc((Class)CSLPRFStingConfiguration) initWithDelegate:v2];
    stingConfiguration = v2->_stingConfiguration;
    v2->_stingConfiguration = v3;
  }
  return v2;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CSLPRFWorkoutCompanionSettingsListController;
  [(CSLPRFWorkoutCompanionSettingsListController *)&v5 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"FIRST_PRESS" value:&stru_C350 table:@"LocalizableSettings-N199"];
  [(CSLPRFWorkoutCompanionSettingsListController *)self setTitle:v4];
}

- (id)specifiers
{
  v2 = self;
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = +[NSMutableArray array];
    objc_super v6 = [(CSLPRFWorkoutCompanionSettingsListController *)v2 _settingsModel];
    uint64_t v7 = [(CSLPRFStingConfiguration *)v2->_stingConfiguration bundleID];
    v60 = [(CSLPRFStingConfiguration *)v2->_stingConfiguration workoutIdentifier];
    v59 = (char *)[(CSLPRFStingConfiguration *)v2->_stingConfiguration actionType];
    v8 = +[PSSpecifier groupSpecifierWithID:@"StingWorkoutAppActionTypeGroupID"];
    uint64_t v57 = PSIsRadioGroupKey;
    objc_msgSend(v8, "setProperty:forKey:", &__kCFBooleanTrue);
    v9 = +[NSNumber numberWithUnsignedInteger:[(CSLPRFStingConfiguration *)v2->_stingConfiguration actionType]];
    [v8 setProperty:v9 forKey:PSValueKey];

    [v5 addObject:v8];
    p_selectedActionGroupSpecifier = (id *)&v2->_selectedActionGroupSpecifier;
    v53 = v8;
    objc_storeStrong((id *)&v2->_selectedActionGroupSpecifier, v8);
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v56 = [v11 localizedStringForKey:@"OPEN_APP" value:&stru_C350 table:@"LocalizableSettings-N199"];

    v55 = (void *)v7;
    if (v7)
    {
      v12 = +[CSLPRFApplicationLibrary sharedLibraryForLocation:0];
      v13 = [v12 applicationWithBundleIdentifier:v7];
      v14 = [v13 localizedName];

      if (v14)
      {
        v52 = v14;
        if ([v14 length])
        {
          v15 = +[NSBundle bundleForClass:objc_opt_class()];
          [v15 localizedStringForKey:@"OPEN_APP_NAME" value:&stru_C350 table:@"LocalizableSettings-N199"];
          v17 = v16 = v6;
          uint64_t v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v14);

          objc_super v6 = v16;
          v56 = (void *)v18;
        }
      }
      else
      {
        v52 = 0;
      }
      uint64_t v7 = (uint64_t)v55;
    }
    else
    {
      v52 = 0;
    }
    v19 = [(CSLPRFWorkoutCompanionSettingsListController *)v2 _makeActionItemSpecifier:v56 actionType:9];
    [v5 addObject:v19];
    v54 = [v6 startWorkoutsListForBundleID:v7];
    if ([v54 count])
    {
      v20 = +[NSBundle bundleForClass:objc_opt_class()];
      v21 = [v20 localizedStringForKey:@"START_WORKOUT" value:&stru_C350 table:@"LocalizableSettings-N199"];

      v22 = [(CSLPRFWorkoutCompanionSettingsListController *)v2 _makeActionItemSpecifier:v21 actionType:6];
      [v5 addObject:v22];
    }
    else
    {
      v22 = 0;
    }
    if ([(CSLPRFStingConfiguration *)v2->_stingConfiguration actionType] == (char *)&dword_4 + 2)
    {
      v24 = v54;
      v23 = v55;
      if (v22) {
        [*p_selectedActionGroupSpecifier setProperty:v22 forKey:PSRadioGroupCheckedSpecifierKey];
      }
      if ([v54 count])
      {
        v48 = v22;
        v49 = v19;
        v50 = v6;
        uint64_t v51 = v3;
        v25 = v5;
        v26 = +[NSBundle bundleForClass:objc_opt_class()];
        v27 = [v26 localizedStringForKey:@"WORKOUT" value:&stru_C350 table:@"LocalizableSettings-N199"];
        v28 = +[PSSpecifier groupSpecifierWithID:@"StingStartWorkoutGroupID" name:v27];

        [v28 setProperty:&__kCFBooleanTrue forKey:v57];
        if ([v55 isEqualToString:@"com.apple.SessionTrackerApp"])
        {
          v29 = +[NSBundle bundleForClass:objc_opt_class()];
          v30 = [v29 localizedStringForKey:@"RECENT_WORKOUT_FOOTER" value:&stru_C350 table:@"LocalizableSettings-N199"];
          [v28 setProperty:v30 forKey:PSFooterTextGroupKey];
        }
        v31 = v2;
        p_selectedStartWorkoutsGroupSpecifier = (id *)&v2->_selectedStartWorkoutsGroupSpecifier;
        objc_storeStrong((id *)&v2->_selectedStartWorkoutsGroupSpecifier, v28);
        v47 = v28;
        [v25 addObject:v28];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v32 = v54;
        id v33 = [v32 countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v62;
          uint64_t v36 = PSRadioGroupCheckedSpecifierKey;
          do
          {
            for (i = 0; i != v34; i = (char *)i + 1)
            {
              if (*(void *)v62 != v35) {
                objc_enumerationMutation(v32);
              }
              v38 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              v39 = [v38 title];

              if (v39)
              {
                v40 = [(CSLPRFWorkoutCompanionSettingsListController *)v31 _makeListItemSpecifier:v38 actionType:6];
                v41 = [v38 workoutIdentifier];
                unsigned int v42 = [v41 isEqualToString:v60];

                if (v42) {
                  BOOL v43 = v59 == (unsigned char *)&dword_4 + 2;
                }
                else {
                  BOOL v43 = 0;
                }
                if (v43) {
                  [*p_selectedStartWorkoutsGroupSpecifier setProperty:v40 forKey:v36];
                }
                [v25 addObject:v40];
              }
            }
            id v34 = [v32 countByEnumeratingWithState:&v61 objects:v65 count:16];
          }
          while (v34);
        }

        v2 = v31;
        objc_super v6 = v50;
        uint64_t v3 = v51;
        objc_super v5 = v25;
        v24 = v54;
        v23 = v55;
        v22 = v48;
        v19 = v49;
      }
    }
    else
    {
      [*p_selectedActionGroupSpecifier setProperty:v19 forKey:PSRadioGroupCheckedSpecifierKey];
      v24 = v54;
      v23 = v55;
    }
    id v44 = [v5 copy];
    v45 = *(void **)&v2->PSListController_opaque[v3];
    *(void *)&v2->PSListController_opaque[v3] = v44;

    v4 = *(void **)&v2->PSListController_opaque[v3];
  }

  return v4;
}

- (id)_makeListItemSpecifier:(id)a3 actionType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 title];
  v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:4 edit:0];

  v9 = [v6 subtitle];

  if (v9)
  {
    v10 = [v6 subtitle];
    [v8 setProperty:v10 forKey:PSTableCellSubtitleTextKey];
  }
  v11 = [v6 workoutIdentifier];

  if (v11)
  {
    v12 = [v6 workoutIdentifier];
    [v8 setProperty:v12 forKey:@"CSLPRFWorkoutIdentifier"];
  }
  v13 = +[NSNumber numberWithUnsignedInteger:a4];
  [v8 setProperty:v13 forKey:@"CSLPRFActionType"];

  [v8 setProperty:&off_CD98 forKey:@"CSLPRFCellTypeKey"];
  [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];

  return v8;
}

- (id)_makeActionItemSpecifier:(id)a3 actionType:(unint64_t)a4
{
  objc_super v5 = +[PSSpecifier preferenceSpecifierNamed:a3 target:self set:0 get:0 detail:0 cell:4 edit:0];
  id v6 = +[NSNumber numberWithUnsignedInteger:a4];
  [v5 setProperty:v6 forKey:@"CSLPRFActionType"];

  [v5 setProperty:&off_CDB0 forKey:@"CSLPRFCellTypeKey"];

  return v5;
}

- (id)subtitle:(id)a3
{
  return [a3 propertyForKey:@"CSLPRFWorkoutSubtitle"];
}

- (void)reloadSpecifiers
{
  uint64_t v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;

  v4.receiver = self;
  v4.super_class = (Class)CSLPRFWorkoutCompanionSettingsListController;
  [(CSLPRFWorkoutCompanionSettingsListController *)&v4 reloadSpecifiers];
}

- (id)_settingsModel
{
  model = self->_model;
  if (!model)
  {
    objc_super v4 = [(CSLPRFWorkoutCompanionSettingsListController *)self specifier];
    objc_super v5 = [v4 propertyForKey:@"StingSettingsModel"];
    id v6 = self->_model;
    self->_model = v5;

    model = self->_model;
  }

  return model;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSLPRFWorkoutCompanionSettingsListController *)self indexForIndexPath:v6];
  v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  v10 = [v9 propertyForKey:@"CSLPRFCellTypeKey"];
  v11 = [v9 propertyForKey:@"CSLPRFActionType"];
  v12 = (char *)[v11 integerValue];
  v13 = [(CSLPRFStingConfiguration *)self->_stingConfiguration bundleID];
  if ([v10 integerValue] == (char *)&dword_0 + 1)
  {
    if (v12 == (unsigned char *)&dword_4 + 2)
    {
      v19 = [(CSLPRFWorkoutCompanionSettingsListController *)self _settingsModel];
      uint64_t v18 = [v19 startWorkoutsListForBundleID:v13];
      v14 = [v18 firstObject];
      stingConfiguration = self->_stingConfiguration;
      v16 = [v14 workoutIdentifier];
      [(CSLPRFStingConfiguration *)stingConfiguration setConfigurationForBundleID:v13 actionType:6 identifier:v16 source:1];
    }
    else
    {
      [(CSLPRFStingConfiguration *)self->_stingConfiguration setConfigurationForBundleID:v13 actionType:9 identifier:0 source:1];
    }
  }
  else
  {
    v17 = [v9 propertyForKey:@"CSLPRFWorkoutIdentifier"];
    [(CSLPRFStingConfiguration *)self->_stingConfiguration setConfigurationForBundleID:v13 actionType:6 identifier:v17 source:1];
    [(PSSpecifier *)self->_selectedStartWorkoutsGroupSpecifier setProperty:v9 forKey:PSRadioGroupCheckedSpecifierKey];
  }
  v20.receiver = self;
  v20.super_class = (Class)CSLPRFWorkoutCompanionSettingsListController;
  [(CSLPRFWorkoutCompanionSettingsListController *)&v20 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_selectedActionGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_selectedStartWorkoutsGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_stingConfiguration, 0);
}

@end