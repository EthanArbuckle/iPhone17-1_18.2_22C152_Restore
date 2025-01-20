@interface HDSimpleGraphDatabaseNodeEntity
+ (BOOL)deleteNodeWithID:(int64_t)a3 database:(id)a4 error:(id *)a5;
+ (BOOL)enumerateNodesWithPredicate:(id)a3 skipDeleted:(BOOL)a4 limit:(unint64_t)a5 database:(id)a6 error:(id *)a7 enumerationHandler:(id)a8;
+ (BOOL)insertNodeWithID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6 database:(id)a7 error:(id *)a8;
+ (BOOL)updateNodeWithID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6 database:(id)a7 error:(id *)a8;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)joinClausesForProperty:(id)a3;
+ (id)nodeEntityForeignKey;
+ (id)nodeForID:(int64_t)a3 database:(id)a4 error:(id *)a5;
+ (uint64_t)_callEnumerationHandlerForRow:(void *)a3 database:(uint64_t)a4 error:(void *)a5 enumerationHandler:;
- (HDSimpleGraphDatabaseNodeEntity)init;
@end

@implementation HDSimpleGraphDatabaseNodeEntity

- (HDSimpleGraphDatabaseNodeEntity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)insertNodeWithID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6 database:(id)a7 error:(id *)a8
{
  id v15 = a7;
  if (([v15 isWriter] & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseNodeEntity.m", 38, @"Invalid parameter not satisfying: %@", @"database.isWriter" object file lineNumber description];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__HDSimpleGraphDatabaseNodeEntity_insertNodeWithID_version_slots_deleted_database_error___block_invoke_2;
  v19[3] = &__block_descriptor_57_e23_v16__0__sqlite3_stmt__8l;
  v19[4] = a3;
  v19[5] = a4;
  v19[6] = a5;
  BOOL v20 = a6;
  char v16 = [v15 executeCachedStatementForKey:&insertNodeWithID_version_slots_deleted_database_error__key error:a8 SQLGenerator:&__block_literal_global_235 bindingHandler:v19 enumerationHandler:0];

  return v16;
}

__CFString *__89__HDSimpleGraphDatabaseNodeEntity_insertNodeWithID_version_slots_deleted_database_error___block_invoke()
{
  return @"INSERT INTO nodes (rowid, version, slots, deleted) VALUES (?, ?, ?, ?)";
}

uint64_t __89__HDSimpleGraphDatabaseNodeEntity_insertNodeWithID_version_slots_deleted_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 32);
  if (v4 == 0xFFFFFFFF80000000) {
    sqlite3_bind_null(a2, 1);
  }
  else {
    sqlite3_bind_int64(a2, 1, v4);
  }
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 48));
  int v5 = *(unsigned __int8 *)(a1 + 56);

  return sqlite3_bind_int(a2, 4, v5);
}

+ (BOOL)updateNodeWithID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6 database:(id)a7 error:(id *)a8
{
  id v15 = a7;
  if (([v15 isWriter] & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseNodeEntity.m", 64, @"Invalid parameter not satisfying: %@", @"database.isWriter" object file lineNumber description];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__HDSimpleGraphDatabaseNodeEntity_updateNodeWithID_version_slots_deleted_database_error___block_invoke_2;
  v19[3] = &__block_descriptor_57_e23_v16__0__sqlite3_stmt__8l;
  v19[4] = a4;
  v19[5] = a5;
  BOOL v20 = a6;
  v19[6] = a3;
  char v16 = [v15 executeCachedStatementForKey:&updateNodeWithID_version_slots_deleted_database_error__key error:a8 SQLGenerator:&__block_literal_global_302_4 bindingHandler:v19 enumerationHandler:0];

  return v16;
}

__CFString *__89__HDSimpleGraphDatabaseNodeEntity_updateNodeWithID_version_slots_deleted_database_error___block_invoke()
{
  return @"UPDATE nodes SET version = ?, slots = ?, deleted = ? WHERE rowid = ?";
}

uint64_t __89__HDSimpleGraphDatabaseNodeEntity_updateNodeWithID_version_slots_deleted_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 40));
  sqlite3_bind_int(a2, 3, *(unsigned __int8 *)(a1 + 56));
  sqlite3_int64 v4 = *(void *)(a1 + 48);

  return sqlite3_bind_int64(a2, 4, v4);
}

+ (BOOL)deleteNodeWithID:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  id v9 = a4;
  if (([v9 isWriter] & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseNodeEntity.m", 83, @"Invalid parameter not satisfying: %@", @"database.isWriter" object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__HDSimpleGraphDatabaseNodeEntity_deleteNodeWithID_database_error___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a3;
  char v10 = [v9 executeCachedStatementForKey:&deleteNodeWithID_database_error__key error:a5 SQLGenerator:&__block_literal_global_307_5 bindingHandler:v13 enumerationHandler:0];

  return v10;
}

__CFString *__67__HDSimpleGraphDatabaseNodeEntity_deleteNodeWithID_database_error___block_invoke()
{
  return @"DELETE FROM nodes WHERE rowid = ?";
}

uint64_t __67__HDSimpleGraphDatabaseNodeEntity_deleteNodeWithID_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

+ (id)nodeForID:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__198;
  v34 = __Block_byref_object_dispose__198;
  id v35 = 0;
  v24 = &v30;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __60__HDSimpleGraphDatabaseNodeEntity_nodeForID_database_error___block_invoke;
  v28 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  int64_t v29 = a3;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __60__HDSimpleGraphDatabaseNodeEntity_nodeForID_database_error___block_invoke_2;
  v23 = &unk_1E63055B0;
  v8 = @"SELECT rowid, version, slots, deleted FROM nodes WHERE rowid=?";
  id v9 = v7;
  char v10 = &v25;
  v11 = &v20;
  uint64_t v12 = self;
  if (!v9)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:sel__enumerateNodesForSQL_database_error_bindingHandler_enumerationHandler_, v12, @"HDSimpleGraphDatabaseNodeEntity.m", 223, @"Invalid parameter not satisfying: %@", @"database", v20, v21, v22, v23, v24, v25, v26, v27, v28, v29 object file lineNumber description];
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __106__HDSimpleGraphDatabaseNodeEntity__enumerateNodesForSQL_database_error_bindingHandler_enumerationHandler___block_invoke;
  v36[3] = &unk_1E6306F98;
  v38 = v11;
  uint64_t v39 = v12;
  id v37 = v9;
  v13 = v11;
  id v14 = v9;
  int v15 = [v14 executeSQL:@"SELECT rowid, version, slots, deleted FROM nodes WHERE rowid=?", a5, v10, v36 error bindingHandler enumerationHandler];

  if (v15) {
    char v16 = (void *)v31[5];
  }
  else {
    char v16 = 0;
  }
  id v17 = v16;
  _Block_object_dispose(&v30, 8);

  return v17;
}

uint64_t __60__HDSimpleGraphDatabaseNodeEntity_nodeForID_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __60__HDSimpleGraphDatabaseNodeEntity_nodeForID_database_error___block_invoke_2(uint64_t a1, void *a2)
{
  return 0;
}

+ (BOOL)enumerateNodesWithPredicate:(id)a3 skipDeleted:(BOOL)a4 limit:(unint64_t)a5 database:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  BOOL v12 = a4;
  v30[4] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  if (v12)
  {
    id v17 = (void *)MEMORY[0x1E4F65D58];
    v18 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:&unk_1F17EF018];
    uint64_t v19 = [v17 compoundPredicateWithPredicate:v14 otherPredicate:v18];

    id v14 = (id)v19;
  }
  uint64_t v20 = [a1 queryWithDatabase:v15 predicate:v14 limit:a5 orderingTerms:0 groupBy:0];
  v30[0] = @"rowid";
  v30[1] = @"version";
  v30[2] = @"slots";
  v30[3] = @"deleted";
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __115__HDSimpleGraphDatabaseNodeEntity_enumerateNodesWithPredicate_skipDeleted_limit_database_error_enumerationHandler___block_invoke;
  v26[3] = &unk_1E630D858;
  id v28 = v16;
  id v29 = a1;
  id v27 = v15;
  id v22 = v16;
  id v23 = v15;
  char v24 = [v20 enumerateProperties:v21 error:a7 enumerationHandler:v26];

  return v24;
}

uint64_t __115__HDSimpleGraphDatabaseNodeEntity_enumerateNodesWithPredicate_skipDeleted_limit_database_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[HDSimpleGraphDatabaseNodeEntity _callEnumerationHandlerForRow:database:error:enumerationHandler:](*(void *)(a1 + 48), a3, *(void **)(a1 + 32), a4, *(void **)(a1 + 40));
}

+ (uint64_t)_callEnumerationHandlerForRow:(void *)a3 database:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v7 = a5;
  id v8 = a3;
  self;
  self;
  id v9 = [HDSimpleGraphNode alloc];
  uint64_t v10 = HDSQLiteColumnAsInt64();
  uint64_t v11 = HDSQLiteColumnAsInt64();
  uint64_t v12 = HDSQLiteColumnAsInt64();
  v13 = [(HDSimpleGraphNode *)v9 initWithRowID:v10 attributes:0 relationships:0 version:v11 slots:v12 deleted:HDSQLiteColumnAsInt64() != 0];

  if (v13) {
    uint64_t v14 = v7[2](v7, v13, a4);
  }
  else {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)nodeEntityForeignKey
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F65D20]) initWithEntityClass:a1 property:@"rowid" deletionAction:2];

  return v2;
}

+ (id)databaseTable
{
  return @"nodes";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_99;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  int v5 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  int v6 = [v4 hasPrefix:v5];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F65D38];
    id v8 = [a1 disambiguatedDatabaseTable];
    id v9 = [v7 innerJoinClauseFromTable:v8 toTargetEntity:objc_opt_class() as:0 localReference:@"rowid" targetKey:@"node_id"];

    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
LABEL_8:

    goto LABEL_11;
  }
  uint64_t v11 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  int v12 = [v4 hasPrefix:v11];

  if (v12)
  {
    v13 = [v4 componentsSeparatedByString:@"."];
    id v9 = [v13 lastObject];

    char v14 = [v9 isEqualToString:@"subject_id"];
    id v15 = @"object_id";
    if ((v14 & 1) != 0
      || (v16 = [v9 isEqualToString:@"object_id"], id v15 = @"subject_id", v16))
    {
      id v17 = v15;
      if (v17)
      {
        v18 = v17;
        uint64_t v19 = (void *)MEMORY[0x1E4F65D38];
        uint64_t v20 = [a1 disambiguatedDatabaseTable];
        uint64_t v21 = [v19 innerJoinClauseFromTable:v20 toTargetEntity:objc_opt_class() as:0 localReference:@"rowid" targetKey:v18];

        uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v21];

        goto LABEL_8;
      }
    }
  }
  v23.receiver = a1;
  v23.super_class = (Class)&OBJC_METACLASS___HDSimpleGraphDatabaseNodeEntity;
  uint64_t v10 = objc_msgSendSuper2(&v23, sel_joinClausesForProperty_, v4);
LABEL_11:

  return v10;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  int v5 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  if ([v4 hasPrefix:v5])
  {

LABEL_4:
    id v8 = v4;
    goto LABEL_6;
  }
  int v6 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  int v7 = [v4 hasPrefix:v6];

  if (v7) {
    goto LABEL_4;
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HDSimpleGraphDatabaseNodeEntity;
  objc_msgSendSuper2(&v11, sel_disambiguatedSQLForProperty_, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  id v9 = v8;

  return v9;
}

uint64_t __106__HDSimpleGraphDatabaseNodeEntity__enumerateNodesForSQL_database_error_bindingHandler_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDSimpleGraphDatabaseNodeEntity _callEnumerationHandlerForRow:database:error:enumerationHandler:](*(void *)(a1 + 48), a2, *(void **)(a1 + 32), a3, *(void **)(a1 + 40));
}

@end