@interface CPUITemplateDashboardSceneSpecification
- (Class)settingsClass;
- (Class)uiSceneMinimumClass;
- (id)baseSceneComponentClassDictionary;
- (id)initialSettingsDiffActions;
- (id)uiSceneSessionRole;
@end

@implementation CPUITemplateDashboardSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)uiSceneMinimumClass
{
  return (Class)MEMORY[0x270F9A730](CPTemplateApplicationDashboardScene, a2);
}

- (id)uiSceneSessionRole
{
  return @"CPTemplateApplicationDashboardSceneSessionRoleApplication";
}

- (id)initialSettingsDiffActions
{
  v8[4] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  v8[0] = v2;
  v3 = objc_opt_new();
  v8[1] = v3;
  v4 = objc_opt_new();
  v8[2] = v4;
  v5 = objc_opt_new();
  v8[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];

  return v6;
}

- (id)baseSceneComponentClassDictionary
{
  return (id)MEMORY[0x263EFFA78];
}

@end