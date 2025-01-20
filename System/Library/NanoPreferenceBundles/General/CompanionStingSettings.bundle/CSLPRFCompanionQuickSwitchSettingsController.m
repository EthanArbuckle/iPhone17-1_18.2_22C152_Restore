@interface CSLPRFCompanionQuickSwitchSettingsController
- (CSLPRFCompanionQuickSwitchSettingsController)init;
- (CSLPRFCompanionQuickSwitchSettingsController)initWithSettingsModel:(id)a3 quickSwitchModel:(id)a4;
- (id)_isAppQuickSwitchEnabled:(id)a3;
- (id)_isQuickSwitchEnabled:(id)a3;
- (id)_makeQuickSwitchItemSpecifier:(id)a3;
- (id)specifiers;
- (void)_setAppEnableQuickSwitch:(id)a3 forSpecifier:(id)a4;
- (void)_setEnableQuickSwitch:(id)a3 forSpecifier:(id)a4;
- (void)reloadSpecifiers;
- (void)viewDidLoad;
@end

@implementation CSLPRFCompanionQuickSwitchSettingsController

- (CSLPRFCompanionQuickSwitchSettingsController)init
{
  id v3 = objc_alloc_init((Class)CSLPRFStingSettingsModel);
  id v4 = [objc_alloc((Class)CSLPRFStingQuickSwitchModel) initWithDelegate:self settingsModel:v3];
  v5 = [(CSLPRFCompanionQuickSwitchSettingsController *)self initWithSettingsModel:v3 quickSwitchModel:v4];

  return v5;
}

- (CSLPRFCompanionQuickSwitchSettingsController)initWithSettingsModel:(id)a3 quickSwitchModel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSLPRFCompanionQuickSwitchSettingsController;
  v9 = [(CSLPRFCompanionQuickSwitchSettingsController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_settingsModel, a3);
    objc_storeStrong((id *)&v10->_quickSwitchModel, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CSLPRFCompanionQuickSwitchSettingsController;
  [(CSLPRFCompanionQuickSwitchSettingsController *)&v5 viewDidLoad];
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"QUICK_SWITCH" value:&stru_C350 table:@"LocalizableSettings-N199"];
  [(CSLPRFCompanionQuickSwitchSettingsController *)self setTitle:v4];
}

- (void)reloadSpecifiers
{
  [(CSLPRFCompanionQuickSwitchSettingsController *)self setSpecifiers:0];
  v3.receiver = self;
  v3.super_class = (Class)CSLPRFCompanionQuickSwitchSettingsController;
  [(CSLPRFCompanionQuickSwitchSettingsController *)&v3 reloadSpecifiers];
}

- (id)specifiers
{
  objc_super v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v33 = OBJC_IVAR___PSListController__specifiers;
    id v4 = +[NSMutableArray array];
    objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"QUICK_SWITCH" value:&stru_C350 table:@"LocalizableSettings-N199"];
    id v7 = +[PSSpecifier groupSpecifierWithID:@"StingQuickSwitchToggleGroup" name:v6];

    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"QUICK_SWITCH_FOOTER" value:&stru_C350 table:@"LocalizableSettings-N199"];
    [v7 setProperty:v9 forKey:PSFooterTextGroupKey];

    v32 = v7;
    [v4 addObject:v7];
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"QUICK_SWITCH" value:&stru_C350 table:@"LocalizableSettings-N199"];
    uint64_t v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"_setEnableQuickSwitch:forSpecifier:" get:"_isQuickSwitchEnabled:" detail:0 cell:6 edit:0];

    v31 = (void *)v12;
    [v4 addObject:v12];
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"QUICK_SWITCH_APPS" value:&stru_C350 table:@"LocalizableSettings-N199"];
    uint64_t v15 = +[PSSpecifier groupSpecifierWithID:@"StingQuickSwitchAppGroup" name:v14];

    v30 = (void *)v15;
    [v4 addObject:v15];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v16 = [(CSLPRFStingQuickSwitchModel *)self->_quickSwitchModel allQuickSwitchItems];
    id v17 = [v16 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [(CSLPRFCompanionQuickSwitchSettingsController *)self _makeQuickSwitchItemSpecifier:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          v22 = cslprf_sting_settings_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            quickSwitchModel = self->_quickSwitchModel;
            v24 = [(CSLPRFStingQuickSwitchModel *)quickSwitchModel allQuickSwitchItems];
            *(_DWORD *)buf = 138412802;
            v39 = self;
            __int16 v40 = 2112;
            v41 = quickSwitchModel;
            __int16 v42 = 2112;
            v43 = v24;
            _os_log_debug_impl(&dword_0, v22, OS_LOG_TYPE_DEBUG, "%@: adding specifier %@ for quickSwitchItem %@", buf, 0x20u);
          }
          [v4 addObject:v21];
        }
        id v18 = [v16 countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v18);
    }

    id v25 = [v4 copy];
    v26 = *(void **)&self->PSListController_opaque[v33];
    *(void *)&self->PSListController_opaque[v33] = v25;

    v27 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(CSLPRFStingQuickSwitchModel **)&self->PSListController_opaque[v33];
      *(_DWORD *)buf = 138412546;
      v39 = self;
      __int16 v40 = 2112;
      v41 = v28;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "%@: loaded specifiers %@", buf, 0x16u);
    }

    objc_super v3 = *(void **)&self->PSListController_opaque[v33];
  }

  return v3;
}

- (id)_makeQuickSwitchItemSpecifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 settingsItem];
  v6 = [v5 title];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"_setAppEnableQuickSwitch:forSpecifier:" get:"_isAppQuickSwitchEnabled:" detail:0 cell:6 edit:0];

  id v8 = [v4 settingsItem];
  v9 = [v8 assetName];

  if (v9)
  {
    v10 = +[UIImage _systemImageNamed:v9];
    v11 = +[UIColor systemWhiteColor];
    uint64_t v12 = [v10 imageWithTintColor:v11 renderingMode:1];

    if (v12) {
      [v7 setProperty:v12 forKey:PSIconImageKey];
    }
  }
  [v7 setProperty:v4 forKey:@"kCSLPRFQuickSettingsModelKey"];

  return v7;
}

- (void)_setEnableQuickSwitch:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[CSLPRFStingQuickSwitchModel setQuickSwitchEnabled:](self->_quickSwitchModel, "setQuickSwitchEnabled:", [v5 BOOLValue]);
  }
}

- (id)_isQuickSwitchEnabled:(id)a3
{
  id v3 = [(CSLPRFStingQuickSwitchModel *)self->_quickSwitchModel isQuickSwitchEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)_setAppEnableQuickSwitch:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = [a4 propertyForKey:@"kCSLPRFQuickSettingsModelKey"];
  id v8 = [v6 BOOLValue];

  [v7 setAvailableForQuickSwitch:v8];
  v9 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%@: changing %@", (uint8_t *)&v10, 0x16u);
  }
}

- (id)_isAppQuickSwitchEnabled:(id)a3
{
  id v3 = [a3 propertyForKey:@"kCSLPRFQuickSettingsModelKey"];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isAvailableForQuickSwitch]);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickSwitchModel, 0);

  objc_storeStrong((id *)&self->_settingsModel, 0);
}

@end