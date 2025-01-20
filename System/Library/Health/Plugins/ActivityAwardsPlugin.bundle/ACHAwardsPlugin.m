@interface ACHAwardsPlugin
+ (BOOL)shouldLoadPluginForDaemon:(id)a3;
- (ACHAwardsPlugin)init;
- (ACHMobileAssetProvider)mobileAssetProvider;
- (HDDatabaseSchemaProvider)schemaProvider;
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
- (void)setMobileAssetProvider:(id)a3;
- (void)setSchemaProvider:(id)a3;
@end

@implementation ACHAwardsPlugin

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  return MEMORY[0x270F0A7B0](a1, a2, a3);
}

- (ACHAwardsPlugin)init
{
  v8.receiver = self;
  v8.super_class = (Class)ACHAwardsPlugin;
  v2 = [(ACHAwardsPlugin *)&v8 init];
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

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F23548];
}

- (id)extensionForHealthDaemon:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F23738];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [(ACHAwardsPlugin *)self mobileAssetProvider];
  objc_super v8 = (void *)[v6 initWithDaemon:v5 mobileAssetProvider:v7];

  return v8;
}

- (id)extensionForProfile:(id)a3
{
  id v3 = a3;
  if ([v3 profileType] == 1) {
    v4 = [[ACHAwardsProfileExtension alloc] initWithProfile:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)taskServerClasses
{
  v4[6] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:6];

  return v2;
}

- (NSString)schemaName
{
  v2 = [(ACHAwardsPlugin *)self schemaProvider];
  id v3 = [v2 schemaName];

  return (NSString *)v3;
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  v4 = [(ACHAwardsPlugin *)self schemaProvider];
  int64_t v5 = [v4 currentSchemaVersionForProtectionClass:a3];

  return v5;
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  v4 = [(ACHAwardsPlugin *)self schemaProvider];
  int64_t v5 = [v4 databaseEntitiesForProtectionClass:a3];

  return v5;
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  id v6 = a4;
  id v7 = [(ACHAwardsPlugin *)self schemaProvider];
  [v7 registerMigrationStepsForProtectionClass:a3 migrator:v6];
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

- (HDDatabaseSchemaProvider)schemaProvider
{
  return self->_schemaProvider;
}

- (void)setSchemaProvider:(id)a3
{
}

- (ACHMobileAssetProvider)mobileAssetProvider
{
  return self->_mobileAssetProvider;
}

- (void)setMobileAssetProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetProvider, 0);

  objc_storeStrong((id *)&self->_schemaProvider, 0);
}

@end