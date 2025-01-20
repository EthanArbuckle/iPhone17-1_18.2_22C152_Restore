@interface EDRenameThreadsTableUpgradeStep
+ (int)runWithConnection:(id)a3;
@end

@implementation EDRenameThreadsTableUpgradeStep

+ (int)runWithConnection:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F60F08]);
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message" nullable:0];
  v20[0] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"reference" nullable:0 defaultValue:&unk_1F35BAF40];
  v20[1] = v6;
  v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"is_originator" nullable:0 defaultValue:&unk_1F35BAF40];
  v20[2] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v9 = (void *)[v4 initWithName:@"message_references" rowIDType:1 columns:v8];

  [v9 addIndexForColumns:&unk_1F35BB528];
  [v9 addIndexForColumns:&unk_1F35BB540];
  id v10 = objc_alloc(MEMORY[0x1E4F60F08]);
  v11 = (void *)[v10 initWithName:@"messages" rowIDType:2 columns:MEMORY[0x1E4F1CBF0]];
  v12 = [v9 columnForName:@"message"];
  [v12 setAsForeignKeyForTable:v11 onDelete:2 onUpdate:0];

  v13 = [v9 definitionWithDatabaseName:0];
  v19[0] = v13;
  v19[1] = @"INSERT INTO message_references (message, reference, is_originator) SELECT message_id, reference, IFNULL(is_originator, 0) FROM threads";
  v19[2] = @"DROP TABLE IF EXISTS threads";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];

  v15 = [v14 componentsJoinedByString:@";\n"];
  v16 = (sqlite3 *)[v3 sqlDB];
  id v17 = v15;
  LODWORD(v16) = sqlite3_exec(v16, (const char *)[v17 UTF8String], 0, 0, 0);

  return (int)v16;
}

@end