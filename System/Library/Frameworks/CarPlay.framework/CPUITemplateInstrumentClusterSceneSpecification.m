@interface CPUITemplateInstrumentClusterSceneSpecification
- (Class)settingsClass;
- (Class)uiSceneMinimumClass;
- (id)baseSceneComponentClassDictionary;
- (id)initialActionHandlers;
- (id)initialSettingsDiffActions;
- (id)uiSceneSessionRole;
@end

@implementation CPUITemplateInstrumentClusterSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)uiSceneMinimumClass
{
  return (Class)MEMORY[0x270F9A730](CPTemplateApplicationInstrumentClusterScene, a2);
}

- (id)uiSceneSessionRole
{
  return @"CPTemplateApplicationInstrumentClusterSceneSessionRoleApplication";
}

- (id)initialSettingsDiffActions
{
  v9[5] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  v9[0] = v2;
  v3 = objc_opt_new();
  v9[1] = v3;
  v4 = objc_opt_new();
  v9[2] = v4;
  v5 = objc_opt_new();
  v9[3] = v5;
  v6 = objc_opt_new();
  v9[4] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:5];

  return v7;
}

- (id)initialActionHandlers
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)baseSceneComponentClassDictionary
{
  return (id)MEMORY[0x263EFFA78];
}

@end