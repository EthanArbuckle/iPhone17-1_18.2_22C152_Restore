@interface HDSimpleGraphDatabaseAttributeEntity
+ (BOOL)addAttributeWithType:(int64_t)a3 value:(id)a4 nodeID:(int64_t)a5 version:(int64_t)a6 slots:(unint64_t)a7 database:(id)a8 error:(id *)a9;
+ (BOOL)deleteAttributesWithNodeID:(int64_t)a3 lessThanVersion:(int64_t)a4 database:(id)a5 error:(id *)a6;
+ (BOOL)deleteAttributesWithNodeID:(int64_t)a3 type:(int64_t)a4 database:(id)a5 error:(id *)a6;
+ (BOOL)enumerateAttributesForNodeWithID:(int64_t)a3 skipDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (BOOL)enumerateAttributesWithPredicate:(id)a3 skipDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (BOOL)updateSlots:(unint64_t)a3 nodeID:(int64_t)a4 type:(int64_t)a5 database:(id)a6 error:(id *)a7;
+ (HDSimpleGraphAttribute)_attributeForRow:(uint64_t)a1;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)indices;
+ (id)predicateForAttributesWithType:(int64_t)a3;
+ (id)uniquedColumns;
+ (int64_t)maxVersion:(int64_t *)a3 slots:(unint64_t *)a4 nodeID:(int64_t)a5 type:(int64_t)a6 database:(id)a7 error:(id *)a8;
- (HDSimpleGraphDatabaseAttributeEntity)init;
@end

@implementation HDSimpleGraphDatabaseAttributeEntity

- (HDSimpleGraphDatabaseAttributeEntity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)addAttributeWithType:(int64_t)a3 value:(id)a4 nodeID:(int64_t)a5 version:(int64_t)a6 slots:(unint64_t)a7 database:(id)a8 error:(id *)a9
{
  id v16 = a4;
  id v17 = a8;
  if (([v17 isWriter] & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseAttributeEntity.m", 43, @"Invalid parameter not satisfying: %@", @"database.isWriter" object file lineNumber description];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __103__HDSimpleGraphDatabaseAttributeEntity_addAttributeWithType_value_nodeID_version_slots_database_error___block_invoke_2;
  v22[3] = &unk_1E62FA4A0;
  id v23 = v16;
  int64_t v24 = a5;
  int64_t v25 = a3;
  int64_t v26 = a6;
  unint64_t v27 = a7;
  id v18 = v16;
  char v19 = [v17 executeCachedStatementForKey:&addAttributeWithType_value_nodeID_version_slots_database_error__key error:a9 SQLGenerator:&__block_literal_global_55 bindingHandler:v22 enumerationHandler:0];

  return v19;
}

__CFString *__103__HDSimpleGraphDatabaseAttributeEntity_addAttributeWithType_value_nodeID_version_slots_database_error___block_invoke()
{
  return @"INSERT INTO attributes (node_id, attribute_type, value, version, slots) VALUES (?, ?, ?, ?, ?)";
}

uint64_t __103__HDSimpleGraphDatabaseAttributeEntity_addAttributeWithType_value_nodeID_version_slots_database_error___block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[5]);
  sqlite3_bind_int64(a2, 2, a1[6]);
  HDSQLiteBindStringToStatement();
  sqlite3_bind_int64(a2, 4, a1[7]);
  sqlite3_int64 v4 = a1[8];

  return sqlite3_bind_int64(a2, 5, v4);
}

+ (BOOL)updateSlots:(unint64_t)a3 nodeID:(int64_t)a4 type:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  id v13 = a6;
  if (([v13 isWriter] & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseAttributeEntity.m", 65, @"Invalid parameter not satisfying: %@", @"database.isWriter" object file lineNumber description];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__HDSimpleGraphDatabaseAttributeEntity_updateSlots_nodeID_type_database_error___block_invoke_2;
  v17[3] = &__block_descriptor_56_e23_v16__0__sqlite3_stmt__8l;
  v17[4] = a3;
  v17[5] = a4;
  v17[6] = a5;
  char v14 = [v13 executeCachedStatementForKey:&updateSlots_nodeID_type_database_error__key error:a7 SQLGenerator:&__block_literal_global_308 bindingHandler:v17 enumerationHandler:0];

  return v14;
}

__CFString *__79__HDSimpleGraphDatabaseAttributeEntity_updateSlots_nodeID_type_database_error___block_invoke()
{
  return @"UPDATE attributes SET slots = ? WHERE node_id = ? AND attribute_type = ?";
}

uint64_t __79__HDSimpleGraphDatabaseAttributeEntity_updateSlots_nodeID_type_database_error___block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[4]);
  sqlite3_bind_int64(a2, 2, a1[5]);
  sqlite3_int64 v4 = a1[6];

  return sqlite3_bind_int64(a2, 3, v4);
}

+ (BOOL)deleteAttributesWithNodeID:(int64_t)a3 type:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  id v11 = a5;
  if (([v11 isWriter] & 1) == 0)
  {
    char v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseAttributeEntity.m", 84, @"Invalid parameter not satisfying: %@", @"database.isWriter" object file lineNumber description];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__HDSimpleGraphDatabaseAttributeEntity_deleteAttributesWithNodeID_type_database_error___block_invoke_2;
  v15[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v15[4] = a3;
  v15[5] = a4;
  char v12 = [v11 executeCachedStatementForKey:&deleteAttributesWithNodeID_type_database_error__key error:a6 SQLGenerator:&__block_literal_global_313_0 bindingHandler:v15 enumerationHandler:0];

  return v12;
}

__CFString *__87__HDSimpleGraphDatabaseAttributeEntity_deleteAttributesWithNodeID_type_database_error___block_invoke()
{
  return @"DELETE FROM attributes WHERE node_id = ? AND attribute_type = ?";
}

uint64_t __87__HDSimpleGraphDatabaseAttributeEntity_deleteAttributesWithNodeID_type_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (BOOL)deleteAttributesWithNodeID:(int64_t)a3 lessThanVersion:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  id v11 = a5;
  if (([v11 isWriter] & 1) == 0)
  {
    char v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseAttributeEntity.m", 102, @"Invalid parameter not satisfying: %@", @"database.isWriter" object file lineNumber description];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__HDSimpleGraphDatabaseAttributeEntity_deleteAttributesWithNodeID_lessThanVersion_database_error___block_invoke_2;
  v15[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v15[4] = a3;
  v15[5] = a4;
  char v12 = [v11 executeCachedStatementForKey:&deleteAttributesWithNodeID_lessThanVersion_database_error__key error:a6 SQLGenerator:&__block_literal_global_319 bindingHandler:v15 enumerationHandler:0];

  return v12;
}

__CFString *__98__HDSimpleGraphDatabaseAttributeEntity_deleteAttributesWithNodeID_lessThanVersion_database_error___block_invoke()
{
  return @"DELETE FROM attributes WHERE node_id = ? AND version < ?";
}

uint64_t __98__HDSimpleGraphDatabaseAttributeEntity_deleteAttributesWithNodeID_lessThanVersion_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (int64_t)maxVersion:(int64_t *)a3 slots:(unint64_t *)a4 nodeID:(int64_t)a5 type:(int64_t)a6 database:(id)a7 error:(id *)a8
{
  id v13 = a7;
  uint64_t v26 = 0;
  unint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v16[6] = &v26;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__HDSimpleGraphDatabaseAttributeEntity_maxVersion_slots_nodeID_type_database_error___block_invoke_2;
  v17[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v17[4] = a5;
  v17[5] = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__HDSimpleGraphDatabaseAttributeEntity_maxVersion_slots_nodeID_type_database_error___block_invoke_3;
  v16[3] = &unk_1E62FA4E8;
  v16[4] = &v22;
  v16[5] = &v18;
  if ([v13 executeCachedStatementForKey:&maxVersion_slots_nodeID_type_database_error__key error:a8 SQLGenerator:&__block_literal_global_324 bindingHandler:v17 enumerationHandler:v16])
  {
    if (*((unsigned char *)v27 + 24))
    {
      if (a3) {
        *a3 = v23[3];
      }
      if (a4) {
        *a4 = v19[3];
      }
      int64_t v14 = 1;
    }
    else
    {
      int64_t v14 = 2;
    }
  }
  else
  {
    int64_t v14 = 0;
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

__CFString *__84__HDSimpleGraphDatabaseAttributeEntity_maxVersion_slots_nodeID_type_database_error___block_invoke()
{
  return @"SELECT MAX(version), MAX(slots) FROM attributes WHERE node_id = ? AND attribute_type = ? GROUP BY node_id, attribute_type LIMIT 1";
}

uint64_t __84__HDSimpleGraphDatabaseAttributeEntity_maxVersion_slots_nodeID_type_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

uint64_t __84__HDSimpleGraphDatabaseAttributeEntity_maxVersion_slots_nodeID_type_database_error___block_invoke_3(void *a1)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(void *)(*(void *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  return 0;
}

+ (BOOL)enumerateAttributesWithPredicate:(id)a3 skipDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if (v10)
  {
    v15 = (void *)MEMORY[0x1E4F65D58];
    id v16 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"value" notEqualToValue:@"hgNULL"];
    uint64_t v17 = [v15 compoundPredicateWithPredicate:v12 otherPredicate:v16];

    id v12 = (id)v17;
  }
  uint64_t v18 = [a1 queryWithDatabase:v13 predicate:v12];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesWithPredicate_skipDeleted_database_error_enumerationHandler___block_invoke;
  v22[3] = &unk_1E62F87F8;
  id v23 = v14;
  id v24 = a1;
  id v19 = v14;
  char v20 = [v18 enumerateProperties:&unk_1F17E9450 error:a6 enumerationHandler:v22];

  return v20;
}

uint64_t __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesWithPredicate_skipDeleted_database_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = +[HDSimpleGraphDatabaseAttributeEntity _attributeForRow:](*(void *)(a1 + 40), a3);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, a4);

  return v7;
}

+ (HDSimpleGraphAttribute)_attributeForRow:(uint64_t)a1
{
  self;
  uint64_t v3 = HDSQLiteColumnAsInt64();
  uint64_t v4 = HDSQLiteColumnAsInt64();
  uint64_t v5 = HDSQLiteColumnAsInt64();
  v6 = MEMORY[0x1C1879F80](a2, 3);
  uint64_t v7 = HDSQLiteColumnAsInt64();
  v8 = [[HDSimpleGraphAttribute alloc] initWithRowID:v3 type:v5 value:v6 nodeID:v4 version:v7 slots:HDSQLiteColumnAsInt64()];

  return v8;
}

+ (BOOL)enumerateAttributesForNodeWithID:(int64_t)a3 skipDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  if (v9) {
    id v13 = &enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler__skipDeletedKey;
  }
  else {
    id v13 = &enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler__includedDeletedKey;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler___block_invoke;
  v22[3] = &__block_descriptor_41_e15___NSString_8__0l;
  void v22[4] = a1;
  BOOL v23 = v9;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler___block_invoke_2;
  v20[3] = &__block_descriptor_41_e23_v16__0__sqlite3_stmt__8l;
  v20[4] = a3;
  BOOL v21 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler___block_invoke_3;
  v17[3] = &unk_1E62F8820;
  id v18 = v12;
  id v19 = a1;
  id v14 = v12;
  char v15 = [a5 executeCachedStatementForKey:v13 error:a6 SQLGenerator:v22 bindingHandler:v20 enumerationHandler:v17];

  return v15;
}

id __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  self;
  id v2 = [NSString alloc];
  uint64_t v3 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v4 = (void *)v3;
  if (v1) {
    uint64_t v5 = [v2 initWithFormat:@"SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ != ?", @"rowid", @"node_id", @"attribute_type", @"value", @"version", @"slots", v3, @"node_id", @"value"];
  }
  else {
    uint64_t v5 = [v2 initWithFormat:@"SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?", @"rowid", @"node_id", @"attribute_type", @"value", @"version", @"slots", v3, @"node_id", v8];
  }
  v6 = (void *)v5;

  return v6;
}

uint64_t __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  if (*(unsigned char *)(a1 + 40))
  {
    return HDSQLiteBindStringToStatement();
  }
  return result;
}

uint64_t __119__HDSimpleGraphDatabaseAttributeEntity_enumerateAttributesForNodeWithID_skipDeleted_database_error_enumerationHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[HDSimpleGraphDatabaseAttributeEntity _attributeForRow:](*(void *)(a1 + 40), a2);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);

  return v6;
}

+ (id)predicateForAttributesWithType:(int64_t)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v4 = [NSNumber numberWithLongLong:a3];
  uint64_t v5 = [v3 predicateWithProperty:@"attribute_type" equalToValue:v4];

  return v5;
}

+ (id)databaseTable
{
  return @"attributes";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_23;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"node_id";
  id v2 = +[HDSimpleGraphDatabaseNodeEntity nodeEntityForeignKey];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)uniquedColumns
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"node_id";
  v4[1] = @"attribute_type";
  v4[2] = @"value";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

+ (id)indices
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v3 = objc_opt_class();
  v8[0] = @"attribute_type";
  v8[1] = @"value";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  uint64_t v5 = (void *)[v2 initWithEntity:v3 name:@"type_value_index" columns:v4];
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v6;
}

@end