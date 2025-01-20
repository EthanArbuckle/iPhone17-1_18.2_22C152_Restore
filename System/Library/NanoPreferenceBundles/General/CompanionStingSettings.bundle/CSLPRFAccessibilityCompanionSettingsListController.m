@interface CSLPRFAccessibilityCompanionSettingsListController
- (CSLPRFAccessibilityCompanionSettingsListController)init;
- (id)_makeListItemSpecifier:(id)a3 value:(id)a4;
- (id)_settingsModel;
- (id)specifiers;
- (void)reloadSpecifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CSLPRFAccessibilityCompanionSettingsListController

- (CSLPRFAccessibilityCompanionSettingsListController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSLPRFAccessibilityCompanionSettingsListController;
  v2 = [(CSLPRFAccessibilityCompanionSettingsListController *)&v6 init];
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
  v5.super_class = (Class)CSLPRFAccessibilityCompanionSettingsListController;
  [(CSLPRFAccessibilityCompanionSettingsListController *)&v5 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ACCESSIBILITY_TITLE" value:&stru_C350 table:@"LocalizableSettings-N199"];
  [(CSLPRFAccessibilityCompanionSettingsListController *)self setTitle:v4];
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v22 = OBJC_IVAR___PSListController__specifiers;
    v4 = +[NSMutableArray array];
    objc_super v5 = [(CSLPRFStingConfiguration *)self->_stingConfiguration workoutIdentifier];
    objc_super v6 = +[PSSpecifier groupSpecifierWithID:@"StingAccessibilityGroupID"];
    selectedGroupSpecifier = self->_selectedGroupSpecifier;
    self->_selectedGroupSpecifier = v6;

    [(PSSpecifier *)self->_selectedGroupSpecifier setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    [v4 addObject:self->_selectedGroupSpecifier];
    v8 = [(CSLPRFAccessibilityCompanionSettingsListController *)self _settingsModel];
    v9 = [v8 accessibilityItems];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v9;
    id v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v26;
      uint64_t v23 = PSRadioGroupCheckedSpecifierKey;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v15 = [v14 title];
          v16 = [v14 identifier];
          v17 = [(CSLPRFAccessibilityCompanionSettingsListController *)self _makeListItemSpecifier:v15 value:v16];

          v18 = [v14 identifier];
          LODWORD(v15) = [v18 isEqualToString:v5];

          if (v15) {
            [(PSSpecifier *)self->_selectedGroupSpecifier setProperty:v17 forKey:v23];
          }
          [v4 addObject:v17];
        }
        id v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }

    id v19 = [v4 copy];
    v20 = *(void **)&self->PSListController_opaque[v22];
    *(void *)&self->PSListController_opaque[v22] = v19;

    v3 = *(void **)&self->PSListController_opaque[v22];
  }

  return v3;
}

- (id)_makeListItemSpecifier:(id)a3 value:(id)a4
{
  id v6 = a4;
  v7 = +[PSSpecifier preferenceSpecifierNamed:a3 target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v7 setIdentifier:v6];
  [v7 setProperty:v6 forKey:PSValueKey];

  return v7;
}

- (void)reloadSpecifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;

  v4.receiver = self;
  v4.super_class = (Class)CSLPRFAccessibilityCompanionSettingsListController;
  [(CSLPRFAccessibilityCompanionSettingsListController *)&v4 reloadSpecifiers];
}

- (id)_settingsModel
{
  model = self->_model;
  if (!model)
  {
    objc_super v4 = [(CSLPRFAccessibilityCompanionSettingsListController *)self specifier];
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
  id v8 = [(CSLPRFAccessibilityCompanionSettingsListController *)self indexForIndexPath:v6];
  v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  id v10 = [v9 propertyForKey:PSValueKey];
  [(CSLPRFStingConfiguration *)self->_stingConfiguration setConfigurationForBundleID:@"com.apple.accessibility" actionType:38 identifier:v10 source:1];
  [(PSSpecifier *)self->_selectedGroupSpecifier setProperty:v9 forKey:PSRadioGroupCheckedSpecifierKey];
  v11.receiver = self;
  v11.super_class = (Class)CSLPRFAccessibilityCompanionSettingsListController;
  [(CSLPRFAccessibilityCompanionSettingsListController *)&v11 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_selectedGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_stingConfiguration, 0);
}

@end