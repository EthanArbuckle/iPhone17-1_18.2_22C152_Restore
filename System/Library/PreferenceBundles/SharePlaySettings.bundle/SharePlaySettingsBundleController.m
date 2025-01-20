@interface SharePlaySettingsBundleController
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)mainSpecifier;
- (SharePlayProviderController)providerController;
- (SharePlaySettingsBundleController)initWithParentListController:(id)a3;
- (TUUserConfiguration)userConfiguration;
- (id)parentListController;
- (id)specifiersWithSpecifier:(id)a3;
- (void)propertiesDidChangeForConfiguration:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setMainSpecifier:(id)a3;
@end

@implementation SharePlaySettingsBundleController

- (SharePlaySettingsBundleController)initWithParentListController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SharePlaySettingsBundleController;
  v3 = [(SharePlaySettingsBundleController *)&v9 initWithParentListController:a3];
  if (v3)
  {
    v4 = objc_alloc_init(SharePlayProviderController);
    providerController = v3->_providerController;
    v3->_providerController = v4;

    v6 = (TUUserConfiguration *)objc_alloc_init((Class)TUUserConfiguration);
    userConfiguration = v3->_userConfiguration;
    v3->_userConfiguration = v6;

    [(TUUserConfiguration *)v3->_userConfiguration addDelegate:v3 queue:&_dispatch_main_q];
  }
  return v3;
}

- (id)specifiersWithSpecifier:(id)a3
{
  v4 = +[NSMutableArray array];
  v5 = [(SharePlaySettingsBundleController *)self groupSpecifier];
  if (v5)
  {
LABEL_2:

    goto LABEL_4;
  }
  v6 = [(SharePlaySettingsBundleController *)self mainSpecifier];

  if (!v6)
  {
    v5 = +[PSSpecifier emptyGroupSpecifier];
    [v5 setIdentifier:@"SHAREPLAY_SETTINGS_GROUP"];
    objc_super v9 = +[SharePlaySettingsStrings localizedStringForKey:@"BUNDLE_CONTROLLER_GROUP_SPECIFIER_DETAIL"];
    [v5 setProperty:v9 forKey:PSFooterTextGroupKey];

    [v4 addObject:v5];
    [(SharePlaySettingsBundleController *)self setGroupSpecifier:v5];
    v10 = +[SharePlaySettingsStrings localizedStringForKey:@"LIST_CONTROLLER_TITLE"];
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    v12 = v11;
    if (v11)
    {
      [v11 setIdentifier:@"SHAREPLAY_SETTINGS"];
      v13 = [(SharePlaySettingsBundleController *)self providerController];
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      [v12 setProperty:v13 forKey:v15];

      v16 = [(SharePlaySettingsBundleController *)self userConfiguration];
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      [v12 setProperty:v16 forKey:v18];

      [v4 addObject:v12];
    }
    [(SharePlaySettingsBundleController *)self setMainSpecifier:v12];

    goto LABEL_2;
  }
LABEL_4:
  id v7 = [v4 copy];

  return v7;
}

- (id)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSBundleController_opaque[OBJC_IVAR___PSBundleController__parent]);

  return WeakRetained;
}

- (void)propertiesDidChangeForConfiguration:(id)a3
{
  id v5 = [(SharePlaySettingsBundleController *)self parentListController];
  v4 = [(SharePlaySettingsBundleController *)self mainSpecifier];
  [v5 reloadSpecifier:v4];
}

- (SharePlayProviderController)providerController
{
  return self->_providerController;
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (PSSpecifier)mainSpecifier
{
  return self->_mainSpecifier;
}

- (void)setMainSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_userConfiguration, 0);

  objc_storeStrong((id *)&self->_providerController, 0);
}

@end