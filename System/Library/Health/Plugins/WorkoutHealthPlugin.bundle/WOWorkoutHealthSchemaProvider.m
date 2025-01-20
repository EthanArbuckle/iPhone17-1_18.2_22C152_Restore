@interface WOWorkoutHealthSchemaProvider
+ (id)databaseEntitiesForProtectionClass:(int64_t)a3;
+ (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3;
+ (void)_addExternalConfigurationProviderColumnsWithMigrator:(id)a3;
+ (void)_addManagedConfigurationsColumnsWithMigrator:(id)a3;
+ (void)_addManagedProtoConfigurationsColumnsWithMigrator:(id)a3;
+ (void)_addOccurrenceColumnsWithMigrator:(id)a3;
+ (void)_addProtoConfigurationsColumnsWithMigrator:(id)a3;
+ (void)_addSyncIdentityColumnWithMigrator:(id)a3;
+ (void)_addSyncObjectColumnsWithMigrator:(id)a3;
+ (void)_deleteRaceWorkoutConfigurationsWithMigrator:(id)a3;
+ (void)_emptyMigrationToSchemaVersion2WithMigrator:(id)a3;
+ (void)_emptyMigrationToSchemaVersion3WithMigrator:(id)a3;
+ (void)_emptyMigrationToSchemaVersion4WithMigrator:(id)a3;
+ (void)_emptyMigrationToSchemaVersion5WithMigrator:(id)a3;
+ (void)_emptyMigrationToSchemaVersion6WithMigrator:(id)a3;
+ (void)_emptyMigrationToSchemaVersion7WithMigrator:(id)a3;
+ (void)_emptyMigrationToSchemaVersion8WithMigrator:(id)a3;
+ (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4;
@end

@implementation WOWorkoutHealthSchemaProvider

+ (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  return 8;
}

+ (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  if (a3 == 1)
  {
    v5[0] = objc_opt_class();
    v5[1] = objc_opt_class();
    v5[2] = objc_opt_class();
    v3 = +[NSArray arrayWithObjects:v5 count:3];
  }
  else
  {
    v3 = &__NSArray0__struct;
  }

  return v3;
}

+ (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 == 2)
  {
    id v8 = v6;
    [a1 _emptyMigrationToSchemaVersion2WithMigrator:v6];
    [a1 _emptyMigrationToSchemaVersion3WithMigrator:v8];
    [a1 _emptyMigrationToSchemaVersion4WithMigrator:v8];
    [a1 _emptyMigrationToSchemaVersion5WithMigrator:v8];
    [a1 _emptyMigrationToSchemaVersion6WithMigrator:v8];
    [a1 _emptyMigrationToSchemaVersion7WithMigrator:v8];
    id v6 = [a1 _emptyMigrationToSchemaVersion8WithMigrator:v8];
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    id v8 = v6;
    [a1 _addSyncObjectColumnsWithMigrator:v6];
    [a1 _addSyncIdentityColumnWithMigrator:v8];
    [a1 _addManagedConfigurationsColumnsWithMigrator:v8];
    [a1 _addProtoConfigurationsColumnsWithMigrator:v8];
    [a1 _addManagedProtoConfigurationsColumnsWithMigrator:v8];
    [a1 _addExternalConfigurationProviderColumnsWithMigrator:v8];
    [a1 _addOccurrenceColumnsWithMigrator:v8];
    id v6 = [a1 _deleteRaceWorkoutConfigurationsWithMigrator:v8];
  }
  id v7 = v8;
LABEL_6:

  _objc_release_x1(v6, v7);
}

+ (void)_addSyncObjectColumnsWithMigrator:(id)a3
{
}

+ (void)_emptyMigrationToSchemaVersion2WithMigrator:(id)a3
{
}

+ (void)_addSyncIdentityColumnWithMigrator:(id)a3
{
}

+ (void)_emptyMigrationToSchemaVersion3WithMigrator:(id)a3
{
}

+ (void)_addManagedConfigurationsColumnsWithMigrator:(id)a3
{
}

+ (void)_emptyMigrationToSchemaVersion4WithMigrator:(id)a3
{
}

+ (void)_addProtoConfigurationsColumnsWithMigrator:(id)a3
{
}

+ (void)_addManagedProtoConfigurationsColumnsWithMigrator:(id)a3
{
}

+ (void)_emptyMigrationToSchemaVersion5WithMigrator:(id)a3
{
}

+ (void)_addExternalConfigurationProviderColumnsWithMigrator:(id)a3
{
}

+ (void)_emptyMigrationToSchemaVersion6WithMigrator:(id)a3
{
}

+ (void)_addOccurrenceColumnsWithMigrator:(id)a3
{
}

+ (void)_emptyMigrationToSchemaVersion7WithMigrator:(id)a3
{
}

+ (void)_deleteRaceWorkoutConfigurationsWithMigrator:(id)a3
{
}

+ (void)_emptyMigrationToSchemaVersion8WithMigrator:(id)a3
{
}

@end