@interface CSLPRFShortcutCompanionSettingsListController
- (CSLPRFShortcutCompanionSettingsListController)init;
- (id)_makeListItemSpecifier:(id)a3 value:(id)a4;
- (id)_settingsModel;
- (id)specifiers;
- (void)reloadSpecifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CSLPRFShortcutCompanionSettingsListController

- (CSLPRFShortcutCompanionSettingsListController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSLPRFShortcutCompanionSettingsListController;
  v2 = [(CSLPRFShortcutCompanionSettingsListController *)&v6 init];
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
  v5.super_class = (Class)CSLPRFShortcutCompanionSettingsListController;
  [(CSLPRFShortcutCompanionSettingsListController *)&v5 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"SHORTCUT_TITLE" value:&stru_C350 table:@"LocalizableSettings-N199"];
  [(CSLPRFShortcutCompanionSettingsListController *)self setTitle:v4];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = +[NSMutableArray array];
    objc_super v6 = [(CSLPRFStingConfiguration *)self->_stingConfiguration workoutIdentifier];
    v7 = +[PSSpecifier groupSpecifierWithID:@"StingShortcutGroupID"];
    selectedGroupSpecifier = self->_selectedGroupSpecifier;
    self->_selectedGroupSpecifier = v7;

    [(PSSpecifier *)self->_selectedGroupSpecifier setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    [v5 addObject:self->_selectedGroupSpecifier];
    v9 = [(CSLPRFShortcutCompanionSettingsListController *)self _settingsModel];
    v10 = [v9 shortcutItems];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_6B50;
    v16[3] = &unk_C310;
    v16[4] = self;
    id v17 = v6;
    id v18 = v5;
    id v11 = v5;
    id v12 = v6;
    [v10 enumerateKeysAndObjectsUsingBlock:v16];
    id v13 = [v11 copy];
    v14 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v13;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
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
  uint64_t v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;

  v4.receiver = self;
  v4.super_class = (Class)CSLPRFShortcutCompanionSettingsListController;
  [(CSLPRFShortcutCompanionSettingsListController *)&v4 reloadSpecifiers];
}

- (id)_settingsModel
{
  model = self->_model;
  if (!model)
  {
    objc_super v4 = [(CSLPRFShortcutCompanionSettingsListController *)self specifier];
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
  id v8 = [(CSLPRFShortcutCompanionSettingsListController *)self indexForIndexPath:v6];
  v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  v10 = [v9 propertyForKey:PSValueKey];
  [(CSLPRFStingConfiguration *)self->_stingConfiguration setConfigurationForBundleID:0 actionType:2 identifier:v10 source:1];
  [(PSSpecifier *)self->_selectedGroupSpecifier setProperty:v9 forKey:PSRadioGroupCheckedSpecifierKey];
  v11.receiver = self;
  v11.super_class = (Class)CSLPRFShortcutCompanionSettingsListController;
  [(CSLPRFShortcutCompanionSettingsListController *)&v11 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_selectedGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_stingConfiguration, 0);
}

@end