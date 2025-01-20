@interface EDAddRemoteContentLinksTableUpgradeStep
+ (id)_remoteContentLinksTableSchema;
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddRemoteContentLinksTableUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v4 = a3;
  v5 = [a1 _remoteContentLinksTableSchema];
  v6 = [v5 definitionWithDatabaseName:0];
  v7 = (sqlite3 *)[v4 sqlDB];
  id v8 = v6;
  LODWORD(v7) = sqlite3_exec(v7, (const char *)[v8 UTF8String], 0, 0, 0);

  return (int)v7;
}

+ (id)_remoteContentLinksTableSchema
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] textColumnWithName:@"url" collation:1 nullable:0];
  v16[0] = v3;
  id v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"requests" nullable:0 defaultValue:&unk_1F35BAB08];
  v16[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"last_seen_date" nullable:0];
  v16[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"last_request_date" nullable:0 defaultValue:&unk_1F35BAB08];
  v16[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  id v8 = (void *)[v2 initWithName:@"remote_content_links" rowIDType:1 columns:v7];

  v15 = @"url";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  [v8 addUniquenessConstraintForColumns:v9 conflictResolution:1];

  v14[0] = @"requests";
  v14[1] = @"last_request_date";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v8 addIndexForColumns:v10];

  v13[0] = @"requests";
  v13[1] = @"last_seen_date";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v8 addIndexForColumns:v11];

  return v8;
}

@end