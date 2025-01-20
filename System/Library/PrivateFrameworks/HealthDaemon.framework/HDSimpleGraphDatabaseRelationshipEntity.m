@interface HDSimpleGraphDatabaseRelationshipEntity
+ (BOOL)addRelationshipWithType:(int64_t)a3 subjectNodeID:(int64_t)a4 objectNodeID:(int64_t)a5 version:(int64_t)a6 slots:(unint64_t)a7 database:(id)a8 error:(id *)a9;
+ (BOOL)deleteRelationshipsWithSubjectID:(int64_t)a3 lessThanVersion:(int64_t)a4 database:(id)a5 error:(id *)a6;
+ (BOOL)deleteRelationshipsWithSubjectID:(int64_t)a3 relationshipID:(int64_t)a4 database:(id)a5 error:(id *)a6;
+ (BOOL)enumerateRelationshipsWithPredicate:(id)a3 skipDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (BOOL)enumerateRelationshipsWithSubjectID:(int64_t)a3 skipDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (BOOL)removeRelationshipWithType:(int64_t)a3 subjectNodeID:(int64_t)a4 objectNodeID:(int64_t)a5 database:(id)a6 error:(id *)a7;
+ (BOOL)updateSlots:(unint64_t)a3 subjectNodeID:(int64_t)a4 relationshipID:(int64_t)a5 database:(id)a6 error:(id *)a7;
+ (HDSimpleGraphRelationship)_relationshipForRow:;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)indices;
+ (id)uniquedColumns;
+ (int64_t)maxVersion:(int64_t *)a3 slots:(unint64_t *)a4 subjectNodeID:(int64_t)a5 relationshipID:(int64_t)a6 database:(id)a7 error:(id *)a8;
- (HDSimpleGraphDatabaseRelationshipEntity)init;
@end

@implementation HDSimpleGraphDatabaseRelationshipEntity

- (HDSimpleGraphDatabaseRelationshipEntity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)addRelationshipWithType:(int64_t)a3 subjectNodeID:(int64_t)a4 objectNodeID:(int64_t)a5 version:(int64_t)a6 slots:(unint64_t)a7 database:(id)a8 error:(id *)a9
{
  id v16 = a8;
  if (([v16 isWriter] & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseRelationshipEntity.m", 42, @"Invalid parameter not satisfying: %@", @"database.isWriter" object file lineNumber description];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __123__HDSimpleGraphDatabaseRelationshipEntity_addRelationshipWithType_subjectNodeID_objectNodeID_version_slots_database_error___block_invoke_2;
  v20[3] = &__block_descriptor_72_e23_v16__0__sqlite3_stmt__8l;
  v20[4] = a4;
  v20[5] = a3;
  v20[6] = a5;
  v20[7] = a6;
  v20[8] = a7;
  char v17 = [v16 executeCachedStatementForKey:&addRelationshipWithType_subjectNodeID_objectNodeID_version_slots_database_error__key error:a9 SQLGenerator:&__block_literal_global_187 bindingHandler:v20 enumerationHandler:0];

  return v17;
}

__CFString *__123__HDSimpleGraphDatabaseRelationshipEntity_addRelationshipWithType_subjectNodeID_objectNodeID_version_slots_database_error___block_invoke()
{
  return @"INSERT INTO relationships (subject_id, relationship_type, object_id, version, slots) VALUES (?, ?, ?, ?, ?)";
}

uint64_t __123__HDSimpleGraphDatabaseRelationshipEntity_addRelationshipWithType_subjectNodeID_objectNodeID_version_slots_database_error___block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[4]);
  sqlite3_bind_int64(a2, 2, a1[5]);
  sqlite3_bind_int64(a2, 3, a1[6]);
  sqlite3_bind_int64(a2, 4, a1[7]);
  sqlite3_int64 v4 = a1[8];

  return sqlite3_bind_int64(a2, 5, v4);
}

+ (BOOL)updateSlots:(unint64_t)a3 subjectNodeID:(int64_t)a4 relationshipID:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  id v13 = a6;
  if (([v13 isWriter] & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseRelationshipEntity.m", 64, @"Invalid parameter not satisfying: %@", @"database.isWriter" object file lineNumber description];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__HDSimpleGraphDatabaseRelationshipEntity_updateSlots_subjectNodeID_relationshipID_database_error___block_invoke_2;
  v17[3] = &__block_descriptor_56_e23_v16__0__sqlite3_stmt__8l;
  v17[4] = a3;
  v17[5] = a4;
  v17[6] = a5;
  char v14 = [v13 executeCachedStatementForKey:&updateSlots_subjectNodeID_relationshipID_database_error__key error:a7 SQLGenerator:&__block_literal_global_308_1 bindingHandler:v17 enumerationHandler:0];

  return v14;
}

__CFString *__99__HDSimpleGraphDatabaseRelationshipEntity_updateSlots_subjectNodeID_relationshipID_database_error___block_invoke()
{
  return @"UPDATE relationships SET slots = ? WHERE subject_id = ? AND relationship_type = ?";
}

uint64_t __99__HDSimpleGraphDatabaseRelationshipEntity_updateSlots_subjectNodeID_relationshipID_database_error___block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[4]);
  sqlite3_bind_int64(a2, 2, a1[5]);
  sqlite3_int64 v4 = a1[6];

  return sqlite3_bind_int64(a2, 3, v4);
}

+ (BOOL)deleteRelationshipsWithSubjectID:(int64_t)a3 relationshipID:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __106__HDSimpleGraphDatabaseRelationshipEntity_deleteRelationshipsWithSubjectID_relationshipID_database_error___block_invoke_2;
  v7[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v7[4] = a3;
  v7[5] = a4;
  return [a5 executeCachedStatementForKey:&deleteRelationshipsWithSubjectID_relationshipID_database_error__key error:a6 SQLGenerator:&__block_literal_global_314_1 bindingHandler:v7 enumerationHandler:0];
}

__CFString *__106__HDSimpleGraphDatabaseRelationshipEntity_deleteRelationshipsWithSubjectID_relationshipID_database_error___block_invoke()
{
  return @"DELETE FROM relationships WHERE subject_id = ? AND relationship_type = ? ";
}

uint64_t __106__HDSimpleGraphDatabaseRelationshipEntity_deleteRelationshipsWithSubjectID_relationshipID_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (BOOL)deleteRelationshipsWithSubjectID:(int64_t)a3 lessThanVersion:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __107__HDSimpleGraphDatabaseRelationshipEntity_deleteRelationshipsWithSubjectID_lessThanVersion_database_error___block_invoke_2;
  v7[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v7[4] = a3;
  v7[5] = a4;
  return [a5 executeCachedStatementForKey:&deleteRelationshipsWithSubjectID_lessThanVersion_database_error__key error:a6 SQLGenerator:&__block_literal_global_320 bindingHandler:v7 enumerationHandler:0];
}

__CFString *__107__HDSimpleGraphDatabaseRelationshipEntity_deleteRelationshipsWithSubjectID_lessThanVersion_database_error___block_invoke()
{
  return @"DELETE FROM relationships WHERE subject_id = ? AND version < ? ";
}

uint64_t __107__HDSimpleGraphDatabaseRelationshipEntity_deleteRelationshipsWithSubjectID_lessThanVersion_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (int64_t)maxVersion:(int64_t *)a3 slots:(unint64_t *)a4 subjectNodeID:(int64_t)a5 relationshipID:(int64_t)a6 database:(id)a7 error:(id *)a8
{
  id v15 = a7;
  if (([v15 isWriter] & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseRelationshipEntity.m", 119, @"Invalid parameter not satisfying: %@", @"database.isWriter" object file lineNumber description];
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  v19[6] = &v29;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __104__HDSimpleGraphDatabaseRelationshipEntity_maxVersion_slots_subjectNodeID_relationshipID_database_error___block_invoke_2;
  v20[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v20[4] = a5;
  v20[5] = a6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __104__HDSimpleGraphDatabaseRelationshipEntity_maxVersion_slots_subjectNodeID_relationshipID_database_error___block_invoke_3;
  v19[3] = &unk_1E62FA4E8;
  v19[4] = &v25;
  v19[5] = &v21;
  if ([v15 executeCachedStatementForKey:&maxVersion_slots_subjectNodeID_relationshipID_database_error__key error:a8 SQLGenerator:&__block_literal_global_325_0 bindingHandler:v20 enumerationHandler:v19])
  {
    if (*((unsigned char *)v30 + 24))
    {
      if (a3) {
        *a3 = v26[3];
      }
      if (a4) {
        *a4 = v22[3];
      }
      int64_t v16 = 1;
    }
    else
    {
      int64_t v16 = 2;
    }
  }
  else
  {
    int64_t v16 = 0;
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

__CFString *__104__HDSimpleGraphDatabaseRelationshipEntity_maxVersion_slots_subjectNodeID_relationshipID_database_error___block_invoke()
{
  return @"SELECT MAX(version), MAX(slots) FROM relationships WHERE subject_id = ? AND relationship_type = ? GROUP BY subject_id, relationship_type LIMIT 1";
}

uint64_t __104__HDSimpleGraphDatabaseRelationshipEntity_maxVersion_slots_subjectNodeID_relationshipID_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

uint64_t __104__HDSimpleGraphDatabaseRelationshipEntity_maxVersion_slots_subjectNodeID_relationshipID_database_error___block_invoke_3(void *a1)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(void *)(*(void *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  return 0;
}

+ (BOOL)removeRelationshipWithType:(int64_t)a3 subjectNodeID:(int64_t)a4 objectNodeID:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  id v13 = a6;
  if (([v13 isWriter] & 1) == 0)
  {
    int64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"HDSimpleGraphDatabaseRelationshipEntity.m", 159, @"Invalid parameter not satisfying: %@", @"database.isWriter" object file lineNumber description];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __112__HDSimpleGraphDatabaseRelationshipEntity_removeRelationshipWithType_subjectNodeID_objectNodeID_database_error___block_invoke;
  v17[3] = &__block_descriptor_56_e23_v16__0__sqlite3_stmt__8l;
  v17[4] = a4;
  v17[5] = a3;
  v17[6] = a5;
  char v14 = [v13 executeSQL:@"DELETE FROM relationships WHERE subject_id = ? AND relationship_type = ? AND object_id = ?" error:a7 bindingHandler:v17 enumerationHandler:0];

  return v14;
}

uint64_t __112__HDSimpleGraphDatabaseRelationshipEntity_removeRelationshipWithType_subjectNodeID_objectNodeID_database_error___block_invoke(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[4]);
  sqlite3_bind_int64(a2, 2, a1[5]);
  sqlite3_int64 v4 = a1[6];

  return sqlite3_bind_int64(a2, 3, v4);
}

+ (BOOL)enumerateRelationshipsWithPredicate:(id)a3 skipDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if (v10)
  {
    id v15 = (void *)MEMORY[0x1E4F65D58];
    int64_t v16 = (void *)MEMORY[0x1E4F65D00];
    char v17 = [NSNumber numberWithLongLong:204];
    v18 = [v16 predicateWithProperty:@"object_id" notEqualToValue:v17];
    uint64_t v19 = [v15 compoundPredicateWithPredicate:v12 otherPredicate:v18];

    id v12 = (id)v19;
  }
  v20 = [a1 queryWithDatabase:v13 predicate:v12];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithPredicate_skipDeleted_database_error_enumerationHandler___block_invoke;
  v24[3] = &unk_1E62F87F8;
  id v25 = v14;
  id v26 = a1;
  id v21 = v14;
  char v22 = [v20 enumerateProperties:&unk_1F17EA680 error:a6 enumerationHandler:v24];

  return v22;
}

uint64_t __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithPredicate_skipDeleted_database_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = +[HDSimpleGraphDatabaseRelationshipEntity _relationshipForRow:]();
  uint64_t v7 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, a4);

  return v7;
}

+ (HDSimpleGraphRelationship)_relationshipForRow:
{
  self;
  uint64_t v0 = HDSQLiteColumnAsInt64();
  uint64_t v1 = HDSQLiteColumnAsInt64();
  uint64_t v2 = HDSQLiteColumnAsInt64();
  uint64_t v3 = HDSQLiteColumnAsInt64();
  uint64_t v4 = HDSQLiteColumnAsInt64();
  uint64_t v5 = [[HDSimpleGraphRelationship alloc] initWithRowID:v0 subjectID:v1 type:v2 objectID:v3 version:v4 slots:HDSQLiteColumnAsInt64()];

  return v5;
}

+ (BOOL)enumerateRelationshipsWithSubjectID:(int64_t)a3 skipDeleted:(BOOL)a4 database:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  if (v9) {
    id v13 = &enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler__skipDeletedKey;
  }
  else {
    id v13 = &enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler__includedDeletedKey;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler___block_invoke;
  v22[3] = &__block_descriptor_41_e15___NSString_8__0l;
  v22[4] = a1;
  BOOL v23 = v9;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler___block_invoke_2;
  v20[3] = &__block_descriptor_41_e23_v16__0__sqlite3_stmt__8l;
  v20[4] = a3;
  BOOL v21 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler___block_invoke_3;
  v17[3] = &unk_1E62F8820;
  id v18 = v12;
  id v19 = a1;
  id v14 = v12;
  char v15 = [a5 executeCachedStatementForKey:v13 error:a6 SQLGenerator:v22 bindingHandler:v20 enumerationHandler:v17];

  return v15;
}

id __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  self;
  id v2 = [NSString alloc];
  uint64_t v3 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  uint64_t v4 = (void *)v3;
  if (v1) {
    uint64_t v5 = [v2 initWithFormat:@"SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ? AND %@ != ?", @"rowid", @"subject_id", @"relationship_type", @"object_id", @"version", @"slots", v3, @"subject_id", @"object_id"];
  }
  else {
    uint64_t v5 = [v2 initWithFormat:@"SELECT %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ = ?", @"rowid", @"subject_id", @"relationship_type", @"object_id", @"version", @"slots", v3, @"subject_id", v8];
  }
  v6 = (void *)v5;

  return v6;
}

uint64_t __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  if (*(unsigned char *)(a1 + 40))
  {
    return sqlite3_bind_int64(a2, 2, 204);
  }
  return result;
}

uint64_t __125__HDSimpleGraphDatabaseRelationshipEntity_enumerateRelationshipsWithSubjectID_skipDeleted_database_error_enumerationHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[HDSimpleGraphDatabaseRelationshipEntity _relationshipForRow:]();
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);

  return v6;
}

+ (id)databaseTable
{
  return @"relationships";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_80;
}

+ (id)foreignKeys
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"subject_id";
  id v2 = +[HDSimpleGraphDatabaseNodeEntity nodeEntityForeignKey];
  v6[1] = @"object_id";
  v7[0] = v2;
  uint64_t v3 = +[HDSimpleGraphDatabaseNodeEntity nodeEntityForeignKey];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)uniquedColumns
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"subject_id";
  v4[1] = @"relationship_type";
  v4[2] = @"object_id";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

+ (id)indices
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v3 = objc_opt_class();
  uint64_t v8 = @"object_id";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  uint64_t v5 = (void *)[v2 initWithEntity:v3 name:@"object_id_index" columns:v4];
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v6;
}

@end