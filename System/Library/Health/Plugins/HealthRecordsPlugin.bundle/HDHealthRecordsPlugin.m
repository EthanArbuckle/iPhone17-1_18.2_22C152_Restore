@interface HDHealthRecordsPlugin
- (NSString)pluginIdentifier;
- (NSString)schemaName;
- (NSString)syncSchemaIdentifier;
- (id)_databaseSchemaForProtectionClass:(int64_t)a3;
- (id)databaseEntitiesForProtectionClass:(int64_t)a3;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)ontologyFeatureEvaluatorsForDaemon:(id)a3;
- (id)orderedSyncEntities;
- (id)taskServerClasses;
- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3;
- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4;
@end

@implementation HDHealthRecordsPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)HKHealthRecordsPluginIdentifier;
}

- (id)extensionForHealthDaemon:(id)a3
{
  id v3 = a3;
  v4 = [[HDHealthRecordsDaemonExtension alloc] initWithHealthDaemon:v3];

  return v4;
}

- (id)extensionForProfile:(id)a3
{
  id v3 = a3;
  v4 = [[HDHealthRecordsProfileExtension alloc] initWithProfile:v3];

  return v4;
}

- (NSString)schemaName
{
  return (NSString *)@"HealthRecordsPlugin";
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  id v3 = [(HDHealthRecordsPlugin *)self _databaseSchemaForProtectionClass:a3];
  id v4 = [v3 currentSchemaVersion];

  return (int64_t)v4;
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  id v3 = [(HDHealthRecordsPlugin *)self _databaseSchemaForProtectionClass:a3];
  id v4 = [v3 databaseEntities];

  return v4;
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  id v6 = a4;
  id v8 = [(HDHealthRecordsPlugin *)self _databaseSchemaForProtectionClass:a3];
  v7 = [(HDHealthRecordsPlugin *)self schemaName];
  [v8 registerMigrationStepsWithMigrator:v6 schemaName:v7];
}

- (id)_databaseSchemaForProtectionClass:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = &off_111060;
  }
  else
  {
    if (a3 != 2) {
      goto LABEL_6;
    }
    id v4 = off_111058;
  }
  self = (HDHealthRecordsPlugin *)objc_alloc_init(*v4);
LABEL_6:
  return self;
}

- (NSString)syncSchemaIdentifier
{
  return (NSString *)@"com.apple.healthd.healthrecords.sync-schema";
}

- (id)orderedSyncEntities
{
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v4 count:11];

  return v2;
}

- (id)taskServerClasses
{
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v4 count:8];

  return v2;
}

- (id)ontologyFeatureEvaluatorsForDaemon:(id)a3
{
  uint64_t v3 = [a3 healthRecordsDaemonExtension];
  id v4 = [v3 ontologyFeatureEvaluators];

  return v4;
}

@end