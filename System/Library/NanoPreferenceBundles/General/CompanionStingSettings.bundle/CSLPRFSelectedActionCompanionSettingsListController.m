@interface CSLPRFSelectedActionCompanionSettingsListController
- (CSLPRFSelectedActionCompanionSettingsListController)init;
- (id)_makeListItemSpecifier:(id)a3 label:(id)a4 systemImageName:(id)a5 value:(unint64_t)a6;
- (id)_settingsModel;
- (id)specifiers;
- (void)reloadSpecifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CSLPRFSelectedActionCompanionSettingsListController

- (CSLPRFSelectedActionCompanionSettingsListController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSLPRFSelectedActionCompanionSettingsListController;
  v2 = [(CSLPRFSelectedActionCompanionSettingsListController *)&v6 init];
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
  v5.super_class = (Class)CSLPRFSelectedActionCompanionSettingsListController;
  [(CSLPRFSelectedActionCompanionSettingsListController *)&v5 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ACTION" value:&stru_C350 table:@"LocalizableSettings-N199"];
  [(CSLPRFSelectedActionCompanionSettingsListController *)self setTitle:v4];
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v27 = OBJC_IVAR___PSListController__specifiers;
    v4 = +[NSMutableArray array];
    [(CSLPRFStingConfiguration *)self->_stingConfiguration actionType];
    uint64_t v30 = CSLActionTypeToSettingsActionType();
    objc_super v5 = +[PSSpecifier groupSpecifierWithID:@"StingSystemSettingsSelectedActionTypeGroupID"];
    selectedActionGroupSpecifier = self->_selectedActionGroupSpecifier;
    self->_selectedActionGroupSpecifier = v5;

    [(PSSpecifier *)self->_selectedActionGroupSpecifier setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v7 = v4;
    [v4 addObject:self->_selectedActionGroupSpecifier];
    v8 = [(CSLPRFSelectedActionCompanionSettingsListController *)self _settingsModel];
    v9 = [v8 quickActionItems];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v9;
    id v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v32;
      uint64_t v28 = PSRadioGroupCheckedSpecifierKey;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v15 = [v14 actionType];
          [v15 unsignedIntegerValue];
          uint64_t v16 = CSLActionTypeToSettingsActionType();

          v17 = [v14 title];
          v18 = [v14 assetName];
          v19 = [(CSLPRFSelectedActionCompanionSettingsListController *)self _makeListItemSpecifier:@"StingSystemSettingsSelectedActionTypeItem" label:v17 systemImageName:v18 value:v16];

          [v7 addObject:v19];
          if (v30 == v16) {
            [(PSSpecifier *)self->_selectedActionGroupSpecifier setProperty:v19 forKey:v28];
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v11);
    }

    v20 = +[CSLPRFStingSettingsModel sfSymbolAssetNameForActionType:18];
    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"NONE_ACTION" value:&stru_C350 table:@"LocalizableSettings-N199"];
    v23 = [(CSLPRFSelectedActionCompanionSettingsListController *)self _makeListItemSpecifier:@"StingSystemSettingsSelectedActionTypeItem" label:v22 systemImageName:v20 value:7];

    [v7 addObject:v23];
    if (v30 == 7) {
      [(PSSpecifier *)self->_selectedActionGroupSpecifier setProperty:v23 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    id v24 = [v7 copy];
    v25 = *(void **)&self->PSListController_opaque[v27];
    *(void *)&self->PSListController_opaque[v27] = v24;

    v3 = *(void **)&self->PSListController_opaque[v27];
  }

  return v3;
}

- (void)reloadSpecifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;

  v4.receiver = self;
  v4.super_class = (Class)CSLPRFSelectedActionCompanionSettingsListController;
  [(CSLPRFSelectedActionCompanionSettingsListController *)&v4 reloadSpecifiers];
}

- (id)_settingsModel
{
  model = self->_model;
  if (!model)
  {
    objc_super v4 = [(CSLPRFSelectedActionCompanionSettingsListController *)self specifier];
    objc_super v5 = [v4 propertyForKey:@"StingSettingsModel"];
    objc_super v6 = self->_model;
    self->_model = v5;

    model = self->_model;
  }

  return model;
}

- (id)_makeListItemSpecifier:(id)a3 label:(id)a4 systemImageName:(id)a5 value:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = +[PSSpecifier preferenceSpecifierNamed:a4 target:self set:0 get:0 detail:0 cell:3 edit:0];
  if (v11)
  {
    v13 = +[UIImage _systemImageNamed:v11];
    v14 = +[UIColor systemWhiteColor];
    v15 = [v13 imageWithTintColor:v14 renderingMode:1];

    if (v15) {
      [v12 setProperty:v15 forKey:PSIconImageKey];
    }
  }
  [v12 setIdentifier:v10];
  uint64_t v16 = +[NSNumber numberWithUnsignedInteger:a6];
  [v12 setProperty:v16 forKey:PSValueKey];

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSLPRFSelectedActionCompanionSettingsListController *)self indexForIndexPath:v7];
  v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  id v10 = [v9 propertyForKey:PSValueKey];
  [v10 integerValue];

  id v11 = (id)CSLSettingsActionTypeToLinkActionType();
  [(PSSpecifier *)self->_selectedActionGroupSpecifier setProperty:v9 forKey:PSRadioGroupCheckedSpecifierKey];
  if (v11 != [(CSLPRFStingConfiguration *)self->_stingConfiguration actionType])
  {
    [(CSLPRFStingConfiguration *)self->_stingConfiguration setExpectedConfigurationForAction:v11 source:1];
    v12.receiver = self;
    v12.super_class = (Class)CSLPRFSelectedActionCompanionSettingsListController;
    [(CSLPRFSelectedActionCompanionSettingsListController *)&v12 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_selectedActionGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_stingConfiguration, 0);
}

@end