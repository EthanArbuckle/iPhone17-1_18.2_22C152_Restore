@interface AXBasicSettingWithFooterController
- (NSString)footerText;
- (NSString)settingText;
- (id)getterBlock;
- (id)preferenceValue:(id)a3;
- (id)setterBlock;
- (id)specifiers;
- (void)setFooterText:(id)a3;
- (void)setGetterBlock:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setSetterBlock:(id)a3;
- (void)setSettingText:(id)a3;
- (void)setSpecifier:(id)a3;
@end

@implementation AXBasicSettingWithFooterController

- (void)setSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AXBasicSettingWithFooterController;
  id v4 = a3;
  [(AXBasicSettingWithFooterController *)&v9 setSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"AXPSFooterText", v9.receiver, v9.super_class);
  [(AXBasicSettingWithFooterController *)self setFooterText:v5];

  v6 = [v4 propertyForKey:@"AXPSSettingText"];
  [(AXBasicSettingWithFooterController *)self setSettingText:v6];

  v7 = [v4 propertyForKey:@"AXPSGetterBlock"];
  [(AXBasicSettingWithFooterController *)self setGetterBlock:v7];

  v8 = [v4 propertyForKey:@"AXPSSetterBlock"];

  [(AXBasicSettingWithFooterController *)self setSetterBlock:v8];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier emptyGroupSpecifier];
    v7 = [(AXBasicSettingWithFooterController *)self footerText];
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    v8 = [(AXBasicSettingWithFooterController *)self settingText];
    objc_super v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setPreferenceValue:specifier:" get:"preferenceValue:" detail:0 cell:6 edit:0];

    [v5 addObject:v9];
    v10 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    id v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  v6 = [(AXBasicSettingWithFooterController *)self setterBlock];
  v6[2](v6, v5);
}

- (id)preferenceValue:(id)a3
{
  uint64_t v3 = [(AXBasicSettingWithFooterController *)self getterBlock];
  id v4 = v3[2]();

  return v4;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (NSString)settingText
{
  return self->_settingText;
}

- (void)setSettingText:(id)a3
{
}

- (id)getterBlock
{
  return self->_getterBlock;
}

- (void)setGetterBlock:(id)a3
{
}

- (id)setterBlock
{
  return self->_setterBlock;
}

- (void)setSetterBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setterBlock, 0);
  objc_storeStrong(&self->_getterBlock, 0);
  objc_storeStrong((id *)&self->_settingText, 0);

  objc_storeStrong((id *)&self->_footerText, 0);
}

@end