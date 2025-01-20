@interface EDAddBrandIndicatorsTableUpgradeStep
+ (id)_brandIndicatorsTableSchema;
+ (int)runWithConnection:(id)a3 databaseName:(id)a4;
@end

@implementation EDAddBrandIndicatorsTableUpgradeStep

+ (int)runWithConnection:(id)a3 databaseName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sqlite3_exec((sqlite3 *)[v6 sqlDB], "DROP TABLE IF EXISTS brand_indicators", 0, 0, 0);
  if (!v8)
  {
    v9 = [a1 _brandIndicatorsTableSchema];
    v10 = [v9 definitionWithDatabaseName:v7];
    v11 = (sqlite3 *)[v6 sqlDB];
    id v12 = v10;
    int v8 = sqlite3_exec(v11, (const char *)[v12 UTF8String], 0, 0, 0);
  }
  return v8;
}

+ (id)_brandIndicatorsTableSchema
{
  v16[6] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] textColumnWithName:@"url" collation:1 nullable:0];
  v16[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] textColumnWithName:@"evidence_url" collation:1 nullable:0];
  v16[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] blobColumnWithName:@"indicator" nullable:1];
  v16[2] = v5;
  id v6 = [MEMORY[0x1E4F60E80] textColumnWithName:@"indicator_hash" collation:1 nullable:1];
  v16[3] = v6;
  id v7 = [MEMORY[0x1E4F60E80] textColumnWithName:@"hash_algorithm" collation:1 nullable:1];
  v16[4] = v7;
  int v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"verified" nullable:0 defaultValue:&unk_1F35BAAF0];
  v16[5] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:6];
  v10 = (void *)[v2 initWithName:@"brand_indicators" rowIDType:2 columns:v9];

  v15 = @"url";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  [v10 addUniquenessConstraintForColumns:v11 conflictResolution:1];

  v14[0] = @"url";
  v14[1] = @"verified";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v10 addIndexForColumns:v12];

  return v10;
}

@end