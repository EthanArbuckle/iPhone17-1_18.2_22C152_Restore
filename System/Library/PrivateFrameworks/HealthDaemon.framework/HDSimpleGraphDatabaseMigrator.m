@interface HDSimpleGraphDatabaseMigrator
+ (id)migrationStepsWithBehavior:(id)a3;
@end

@implementation HDSimpleGraphDatabaseMigrator

+ (id)migrationStepsWithBehavior:(id)a3
{
  v13[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  self;
  v4 = +[HDSimpleGraphDatabaseMigrationStep migrationToVersion:5 function:_removeUserDataAndAdHocConcepts];
  v13[0] = v4;
  v5 = +[HDSimpleGraphDatabaseMigrationStep migrationToVersion:6 function:_improveOntologyDatabaseSchema];
  v13[1] = v5;
  v6 = +[HDSimpleGraphDatabaseMigrationStep migrationToVersion:7 function:_shardedOntologySupport];
  v13[2] = v6;
  v7 = +[HDSimpleGraphDatabaseMigrationStep migrationToVersion:8 function:_removeOrphanedSydneyContent];
  v13[3] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];

  LODWORD(v4) = [v3 supportsOntologyDatabaseFutureMigrations];
  if (v4)
  {
    self;
    v9 = +[HDSimpleGraphDatabaseMigrationStep migrationToVersion:10001 function:_noOpSuccess];
    v13[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

    uint64_t v11 = [v8 arrayByAddingObjectsFromArray:v10];

    v8 = (void *)v11;
  }

  return v8;
}

@end