@interface EDAddSendersTableUpgradeStep
+ (EFSQLSchema)schema;
+ (EFSQLTableSchema)senderAddressesTableSchema;
+ (EFSQLTableSchema)sendersTableSchema;
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddSendersTableUpgradeStep

+ (EFSQLSchema)schema
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 sendersTableSchema];
  v4 = [a1 senderAddressesTableSchema];
  v5 = [v4 columnForName:@"sender"];
  [v5 setAsForeignKeyForTable:v3 onDelete:2 onUpdate:0];

  id v6 = objc_alloc(MEMORY[0x1E4F60EF0]);
  v10[0] = v3;
  v10[1] = v4;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v8 = (void *)[v6 initWithTables:v7];

  return (EFSQLSchema *)v8;
}

+ (EFSQLTableSchema)sendersTableSchema
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] textColumnWithName:@"contact_identifier" collation:1 nullable:1];
  v13[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"bucket" nullable:0 defaultValue:&unk_1F35BAB20];
  v13[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"user_initiated" nullable:0 defaultValue:MEMORY[0x1E4F1CC38]];
  v13[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  v7 = (void *)[v2 initWithName:@"senders" rowIDType:2 columns:v6];

  v12 = @"contact_identifier";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v7 addUniquenessConstraintForColumns:v8 conflictResolution:1];

  v11 = @"bucket";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [v7 addIndexForColumns:v9];

  return (EFSQLTableSchema *)v7;
}

+ (EFSQLTableSchema)senderAddressesTableSchema
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"sender" nullable:0];
  v9[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v5 = (void *)[v2 initWithName:@"sender_addresses" rowIDType:1 rowIDAlias:@"address" columns:v4];

  v8 = @"sender";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  [v5 addIndexForColumns:v6];

  return (EFSQLTableSchema *)v5;
}

+ (int)runWithConnection:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS senders;",
    @"Dropping senders table");
  objc_msgSend(v4, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS sender_addresses;",
    @"Dropping sender_addresses table");
  v5 = [a1 schema];
  id v6 = [v5 definitionWithDatabaseName:0];

  v7 = (sqlite3 *)[v4 sqlDB];
  id v8 = v6;
  LODWORD(v7) = sqlite3_exec(v7, (const char *)[v8 UTF8String], 0, 0, 0);

  return (int)v7;
}

@end