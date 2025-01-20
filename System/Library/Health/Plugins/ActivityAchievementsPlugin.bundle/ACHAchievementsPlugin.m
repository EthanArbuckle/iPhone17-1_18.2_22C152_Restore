@interface ACHAchievementsPlugin
+ (BOOL)shouldLoadPluginForDaemon:(id)a3;
- (ACHAchievementsPlugin)init;
- (NSString)pluginIdentifier;
- (NSString)schemaName;
- (NSString)syncSchemaIdentifier;
- (id)databaseEntitiesForProtectionClass:(int64_t)a3;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)orderedSyncEntities;
- (id)taskServerClasses;
- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3;
- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4;
@end

@implementation ACHAchievementsPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F23598];
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  return ACHShouldUseNewAwardsSystem() ^ 1;
}

- (ACHAchievementsPlugin)init
{
  v8.receiver = self;
  v8.super_class = (Class)ACHAchievementsPlugin;
  v2 = [(ACHAchievementsPlugin *)&v8 init];
  if (v2)
  {
    v3 = (HDDatabaseSchemaProvider *)objc_alloc_init(MEMORY[0x263F237C0]);
    schemaProvider = v2->_schemaProvider;
    v2->_schemaProvider = v3;

    v5 = (ACHMobileAssetProvider *)objc_alloc_init(MEMORY[0x263F23800]);
    mobileAssetProvider = v2->_mobileAssetProvider;
    v2->_mobileAssetProvider = v5;
  }
  return v2;
}

- (id)extensionForHealthDaemon:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F23738];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithDaemon:v5 mobileAssetProvider:self->_mobileAssetProvider];

  return v6;
}

- (id)extensionForProfile:(id)a3
{
  id v4 = a3;
  if ([v4 profileType] == 1)
  {
    id v5 = [ACHAchievementsProfileExtension alloc];
    v6 = [(ACHAchievementsProfileExtension *)v5 initWithProfile:v4 mobileAssetProvider:self->_mobileAssetProvider unitTesting:*MEMORY[0x263F43478] != 0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)schemaName
{
  return (NSString *)MEMORY[0x270F9A6D0](self->_schemaProvider, sel_schemaName);
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  return MEMORY[0x270F9A6D0](self->_schemaProvider, sel_currentSchemaVersionForProtectionClass_);
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  return (id)MEMORY[0x270F9A6D0](self->_schemaProvider, sel_databaseEntitiesForProtectionClass_);
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
}

- (NSString)syncSchemaIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F235A0];
}

- (id)orderedSyncEntities
{
  v4[5] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];

  return v2;
}

- (id)taskServerClasses
{
  v4[4] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetProvider, 0);

  objc_storeStrong((id *)&self->_schemaProvider, 0);
}

@end