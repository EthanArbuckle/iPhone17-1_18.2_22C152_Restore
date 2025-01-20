@interface HDMedicalUserDomainConceptMappingEntity
+ (BOOL)insertUserDomainConceptID:(int64_t)a3 medicalRecordID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)migrateMappingsFromUserDomainConceptID:(int64_t)a3 toUserDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)updateMappingFromRecordWithPersistentID:(int64_t)a3 withMapToUDCWithPersistentID:(int64_t)a4 toMapToUDCWithPersistentID:(int64_t)a5 transaction:(id)a6 error:(id *)a7;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)joinClausesForProperty:(id)a3;
+ (id)uniquedColumns;
+ (id)unitTest_medicalRecordIDsForUserDomainConceptID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (id)unitTest_userDomainConceptIDsForMedicalRecordID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (int64_t)protectionClass;
@end

@implementation HDMedicalUserDomainConceptMappingEntity

+ (id)databaseTable
{
  return @"medical_user_domain_concept_mappings";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_63;
}

+ (id)uniquedColumns
{
  return &unk_1F17EA3E0;
}

+ (id)foreignKeys
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"udc_id";
  v2 = +[HDUserDomainConceptEntity defaultForeignKey];
  v6[1] = @"data_id";
  v7[0] = v2;
  v3 = +[HDDataEntity defaultForeignKey];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"user_domain_concepts.uuid"])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v6 = +[HDUserDomainConceptEntity joinClausesForProperty:@"uuid"];
    v7 = (void *)[v5 initWithSet:v6];

    v8 = (void *)MEMORY[0x1E4F65D38];
    v9 = [a1 disambiguatedDatabaseTable];
    uint64_t v10 = objc_opt_class();
    v11 = HDUserDomainConceptEntityPropertyUserDomainConceptID;
LABEL_5:
    v14 = [v8 innerJoinClauseFromTable:v9 toTargetEntity:v10 as:0 localReference:*v11 targetKey:*v11];
    [v7 addObject:v14];

    v15 = (void *)[v7 copy];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"objects.uuid"])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v13 = +[HDMedicalRecordEntity joinClausesForProperty:@"uuid"];
    v7 = (void *)[v12 initWithSet:v13];

    v8 = (void *)MEMORY[0x1E4F65D38];
    v9 = [a1 disambiguatedDatabaseTable];
    uint64_t v10 = objc_opt_class();
    v11 = HDDataEntityPropertyDataID;
    goto LABEL_5;
  }
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___HDMedicalUserDomainConceptMappingEntity;
  v15 = objc_msgSendSuper2(&v17, sel_joinClausesForProperty_, v4);
LABEL_7:

  return v15;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)insertUserDomainConceptID:(int64_t)a3 medicalRecordID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  v9 = [a5 protectedDatabase];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __103__HDMedicalUserDomainConceptMappingEntity_insertUserDomainConceptID_medicalRecordID_transaction_error___block_invoke_2;
  v11[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v11[4] = a3;
  v11[5] = a4;
  LOBYTE(a6) = [v9 executeCachedStatementForKey:&insertUserDomainConceptID_medicalRecordID_transaction_error__statementKey error:a6 SQLGenerator:&__block_literal_global_151 bindingHandler:v11 enumerationHandler:0];

  return (char)a6;
}

__CFString *__103__HDMedicalUserDomainConceptMappingEntity_insertUserDomainConceptID_medicalRecordID_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO medical_user_domain_concept_mappings (udc_id, data_id) VALUES (?, ?)";
}

uint64_t __103__HDMedicalUserDomainConceptMappingEntity_insertUserDomainConceptID_medicalRecordID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (BOOL)migrateMappingsFromUserDomainConceptID:(int64_t)a3 toUserDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  v9 = [a5 protectedDatabase];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __122__HDMedicalUserDomainConceptMappingEntity_migrateMappingsFromUserDomainConceptID_toUserDomainConceptID_transaction_error___block_invoke_2;
  v11[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v11[4] = a4;
  v11[5] = a3;
  LOBYTE(a6) = [v9 executeCachedStatementForKey:&migrateMappingsFromUserDomainConceptID_toUserDomainConceptID_transaction_error__statementKey error:a6 SQLGenerator:&__block_literal_global_314_0 bindingHandler:v11 enumerationHandler:0];

  return (char)a6;
}

__CFString *__122__HDMedicalUserDomainConceptMappingEntity_migrateMappingsFromUserDomainConceptID_toUserDomainConceptID_transaction_error___block_invoke()
{
  return @"UPDATE OR REPLACE medical_user_domain_concept_mappings SET (udc_id) = (?) WHERE udc_id = ?";
}

uint64_t __122__HDMedicalUserDomainConceptMappingEntity_migrateMappingsFromUserDomainConceptID_toUserDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (BOOL)updateMappingFromRecordWithPersistentID:(int64_t)a3 withMapToUDCWithPersistentID:(int64_t)a4 toMapToUDCWithPersistentID:(int64_t)a5 transaction:(id)a6 error:(id *)a7
{
  v11 = [a6 protectedDatabase];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __157__HDMedicalUserDomainConceptMappingEntity_updateMappingFromRecordWithPersistentID_withMapToUDCWithPersistentID_toMapToUDCWithPersistentID_transaction_error___block_invoke_2;
  v13[3] = &__block_descriptor_56_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a5;
  v13[5] = a4;
  v13[6] = a3;
  LOBYTE(a7) = [v11 executeCachedStatementForKey:&updateMappingFromRecordWithPersistentID_withMapToUDCWithPersistentID_toMapToUDCWithPersistentID_transaction_error__statementKey error:a7 SQLGenerator:&__block_literal_global_319_0 bindingHandler:v13 enumerationHandler:0];

  return (char)a7;
}

__CFString *__157__HDMedicalUserDomainConceptMappingEntity_updateMappingFromRecordWithPersistentID_withMapToUDCWithPersistentID_toMapToUDCWithPersistentID_transaction_error___block_invoke()
{
  return @"UPDATE OR REPLACE medical_user_domain_concept_mappings SET (udc_id) = (?) WHERE udc_id = ?AND data_id = ?";
}

uint64_t __157__HDMedicalUserDomainConceptMappingEntity_updateMappingFromRecordWithPersistentID_withMapToUDCWithPersistentID_toMapToUDCWithPersistentID_transaction_error___block_invoke_2(sqlite3_int64 *a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, a1[4]);
  sqlite3_bind_int64(a2, 2, a1[5]);
  sqlite3_int64 v4 = a1[6];

  return sqlite3_bind_int64(a2, 3, v4);
}

+ (id)unitTest_medicalRecordIDsForUserDomainConceptID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5
{
  v7 = [a4 protectedDatabase];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__HDMedicalUserDomainConceptMappingEntity_unitTest_medicalRecordIDsForUserDomainConceptID_transaction_error___block_invoke_2;
  v14[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v14[4] = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __109__HDMedicalUserDomainConceptMappingEntity_unitTest_medicalRecordIDsForUserDomainConceptID_transaction_error___block_invoke_3;
  v12[3] = &unk_1E62F3D38;
  id v8 = v13;
  if ([v7 executeCachedStatementForKey:&unitTest_medicalRecordIDsForUserDomainConceptID_transaction_error__lookupKey error:a5 SQLGenerator:&__block_literal_global_323 bindingHandler:v14 enumerationHandler:v12])v9 = v8; {
  else
  }
    v9 = 0;
  id v10 = v9;

  return v10;
}

__CFString *__109__HDMedicalUserDomainConceptMappingEntity_unitTest_medicalRecordIDsForUserDomainConceptID_transaction_error___block_invoke()
{
  return @"SELECT data_id FROM medical_user_domain_concept_mappings WHERE udc_id = ?";
}

uint64_t __109__HDMedicalUserDomainConceptMappingEntity_unitTest_medicalRecordIDsForUserDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __109__HDMedicalUserDomainConceptMappingEntity_unitTest_medicalRecordIDsForUserDomainConceptID_transaction_error___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [NSNumber numberWithLongLong:HDSQLiteColumnAsInt64()];
  [v1 addObject:v2];

  return 1;
}

+ (id)unitTest_userDomainConceptIDsForMedicalRecordID:(unint64_t)a3 transaction:(id)a4 error:(id *)a5
{
  v7 = [a4 protectedDatabase];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__HDMedicalUserDomainConceptMappingEntity_unitTest_userDomainConceptIDsForMedicalRecordID_transaction_error___block_invoke_2;
  v14[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v14[4] = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __109__HDMedicalUserDomainConceptMappingEntity_unitTest_userDomainConceptIDsForMedicalRecordID_transaction_error___block_invoke_3;
  v12[3] = &unk_1E62F3D38;
  id v8 = v13;
  if ([v7 executeCachedStatementForKey:&unitTest_userDomainConceptIDsForMedicalRecordID_transaction_error__lookupKey error:a5 SQLGenerator:&__block_literal_global_331 bindingHandler:v14 enumerationHandler:v12])v9 = v8; {
  else
  }
    v9 = 0;
  id v10 = v9;

  return v10;
}

__CFString *__109__HDMedicalUserDomainConceptMappingEntity_unitTest_userDomainConceptIDsForMedicalRecordID_transaction_error___block_invoke()
{
  return @"SELECT udc_id FROM medical_user_domain_concept_mappings WHERE data_id = ?";
}

uint64_t __109__HDMedicalUserDomainConceptMappingEntity_unitTest_userDomainConceptIDsForMedicalRecordID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __109__HDMedicalUserDomainConceptMappingEntity_unitTest_userDomainConceptIDsForMedicalRecordID_transaction_error___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [NSNumber numberWithLongLong:HDSQLiteColumnAsInt64()];
  [v1 addObject:v2];

  return 1;
}

@end