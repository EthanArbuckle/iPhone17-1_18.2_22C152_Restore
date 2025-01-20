@interface FontSettingsController
+ (id)sharedInstance;
- (FontSettingsController)initWithParentListController:(id)a3 properties:(id)a4;
- (PSListController)parentController;
- (PSSpecifier)specifier;
- (id)_specifier;
- (id)fontSettingsValue:(id)a3;
- (id)specifiersWithSpecifier:(id)a3;
- (void)_updateSpecifierControllerClass;
- (void)_updateSpecifierFontInfo;
- (void)setParentController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)unload;
@end

@implementation FontSettingsController

+ (id)sharedInstance
{
  id WeakRetained = objc_loadWeakRetained(&qword_24820);

  return WeakRetained;
}

- (FontSettingsController)initWithParentListController:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeWeak(&qword_24820, self);
  v10.receiver = self;
  v10.super_class = (Class)FontSettingsController;
  v8 = [(FontSettingsController *)&v10 initWithParentListController:v6 properties:v7];

  if (v8) {
    objc_storeWeak((id *)&v8->_parentController, v6);
  }

  return v8;
}

- (void)unload
{
}

- (id)fontSettingsValue:(id)a3
{
  v3 = [a3 userInfo];
  v4 = [v3 objectForKey:@"info"];

  return v4;
}

- (id)_specifier
{
  specifier = self->_specifier;
  if (!specifier)
  {
    v4 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:"fontSettingsValue:" detail:0 cell:2 edit:0];
    v5 = self->_specifier;
    self->_specifier = v4;

    [(PSSpecifier *)self->_specifier setProperty:@"FONT_SETTING" forKey:PSIDKey];
    specifier = self->_specifier;
  }

  return specifier;
}

- (void)_updateSpecifierFontInfo
{
  v2 = [(FontSettingsController *)self _specifier];
  if (v2)
  {
    id v9 = v2;
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [v3 localizedStringForKey:@"FONT_SETTING_TITLE_PLURAL" value:&stru_1CDF0 table:@"FontSettings"];

    v5 = [v9 userInfo];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = +[NSMutableDictionary dictionary];
    }
    v8 = v7;

    [v8 setObject:&stru_1CDF0 forKey:@"info"];
    [v9 setName:v4];
    [v9 setUserInfo:v8];

    v2 = v9;
  }
}

- (void)_updateSpecifierControllerClass
{
  id v7 = [(FontSettingsController *)self _specifier];
  v2 = [v7 userInfo];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[NSMutableDictionary dictionary];
  }
  v5 = v4;

  uint64_t v6 = objc_opt_class();
  [v7 setUserInfo:v5];
  if (v7) {
    *(void *)&v7[OBJC_IVAR___PSSpecifier_detailControllerClass] = v6;
  }
}

- (id)specifiersWithSpecifier:(id)a3
{
  [(FontSettingsController *)self _updateSpecifierFontInfo];
  if (self->_specifier)
  {
    [(FontSettingsController *)self _updateSpecifierControllerClass];
    id v4 = [(FontSettingsController *)self _specifier];
    id v7 = v4;
    v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PSListController)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  return (PSListController *)WeakRetained;
}

- (void)setParentController:(id)a3
{
}

- (PSSpecifier)specifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);

  objc_destroyWeak((id *)&self->_parentController);
}

@end