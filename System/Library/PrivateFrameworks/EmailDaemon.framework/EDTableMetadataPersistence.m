@interface EDTableMetadataPersistence
+ (BOOL)updateLargestDeletedRowID:(int64_t)a3 forTableName:(id)a4 withConnection:(id)a5;
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
+ (int64_t)largestDeletedRowIDForTableName:(id)a3 withConnection:(id)a4;
@end

@implementation EDTableMetadataPersistence

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc(MEMORY[0x1E4F60F08]);
  v7 = [MEMORY[0x1E4F60E80] textColumnWithName:@"table_name" collation:1 nullable:0];
  v17[0] = v7;
  v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"largest_deleted_rowid" nullable:0 defaultValue:&unk_1F35BB180];
  v17[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v16 = @"table_name";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v11 = (void *)[v6 initWithName:@"table_metadata" columns:v9 primaryKeyColumns:v10];

  v12 = (void *)MEMORY[0x1E4F1CBF0];
  *a3 = (id)MEMORY[0x1E4F1CBF0];
  *a4 = v12;
  v15 = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];

  return v13;
}

+ (BOOL)updateLargestDeletedRowID:(int64_t)a3 forTableName:(id)a4 withConnection:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc(MEMORY[0x1E4F60F18]);
  v21[0] = @"table_name";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v11 = (void *)[v9 initWithTable:@"table_metadata" conflictTarget:v10];

  [v11 setObject:v7 forKeyedSubscript:@"table_name"];
  v12 = [NSNumber numberWithLongLong:a3];
  [v11 setObject:v12 forKeyedSubscript:@"largest_deleted_rowid"];

  v13 = [v11 excludedColumnExpressionForColumnName:@"largest_deleted_rowid"];
  v14 = [MEMORY[0x1E4F60E78] column:@"largest_deleted_rowid"];
  v15 = [v13 greaterThan:v14];
  [v11 setWhereClause:v15];

  id v20 = 0;
  char v16 = [v8 executeUpsertStatement:v11 error:&v20];
  id v17 = v20;
  if ((v16 & 1) == 0)
  {
    v18 = (void *)[[NSString alloc] initWithFormat:@"Updating largest_deleted_rowid for %@", v7];
    [v8 handleError:v17 message:v18];
  }
  return v16;
}

+ (int64_t)largestDeletedRowIDForTableName:(id)a3 withConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"largest_deleted_rowid" table:@"table_metadata"];
  uint64_t v8 = [MEMORY[0x1E4F60E78] column:@"table_name"];
  id v9 = [(id)v8 equalTo:v5];
  [v7 setWhere:v9];

  [v7 setLimit:1];
  id v14 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__EDTableMetadataPersistence_largestDeletedRowIDForTableName_withConnection___block_invoke;
  v15[3] = &unk_1E6BFF4C8;
  v15[4] = &v16;
  LOBYTE(v8) = [v6 executeSelectStatement:v7 withBlock:v15 error:&v14];
  id v10 = v14;
  if ((v8 & 1) == 0)
  {
    v11 = (void *)[[NSString alloc] initWithFormat:@"Getting largest_deleted_rowid for %@", v5];
    [v6 handleError:v10 message:v11];
  }
  int64_t v12 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v12;
}

void __77__EDTableMetadataPersistence_largestDeletedRowIDForTableName_withConnection___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [v4 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue];
}

@end