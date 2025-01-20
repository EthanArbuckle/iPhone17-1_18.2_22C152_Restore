@interface HDUserDomainMedicalCodingEntity
+ (BOOL)_getPersistentIDForString:(void *)a3 transaction:(void *)a4 result:(uint64_t)a5 error:;
+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)enumerateMedicalCodingsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)joinClausesForProperty:(id)a3;
+ (id)privateSubEntities;
+ (id)triggers;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateMedicalCodingsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:;
@end

@implementation HDUserDomainMedicalCodingEntity

+ (id)databaseTable
{
  return @"user_domain_medical_codings";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_58;
}

+ (id)uniquedColumns
{
  return &unk_1F17EA230;
}

+ (id)foreignKeys
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"udc_id";
  v2 = +[HDUserDomainConceptEntity defaultForeignKey];
  v10[0] = v2;
  v9[1] = @"system";
  v3 = +[HDHealthEntity defaultForeignKey];
  v10[1] = v3;
  v9[2] = @"code";
  v4 = +[HDHealthEntity defaultForeignKey];
  v10[2] = v4;
  v9[3] = @"version";
  v5 = +[HDHealthEntity defaultForeignKey];
  v10[3] = v5;
  v9[4] = @"display_string";
  v6 = +[HDHealthEntity defaultForeignKey];
  v10[4] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

+ (id)triggers
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = +[HDUserDomainMedicalCodingStringEntity databaseTable];
  uint64_t v5 = *MEMORY[0x1E4F65C70];
  v6 = [a1 databaseTable];
  v7 = +[HDUserDomainMedicalCodingStringEntity databaseTable];
  v8 = [v3 stringWithFormat:@"DELETE FROM %@ WHERE (%@ IN (OLD.%@, OLD.%@, OLD.%@, OLD.%@) AND NOT EXISTS (SELECT 1 FROM %@ WHERE %@.%@ IN (%@, %@, %@, %@)))", v4, v5, @"system", @"code", @"version", @"display_string", v6, v7, v5, @"system", @"code", @"version", @"display_string"];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F65D88]) initWithEntity:objc_opt_class() name:@"string_garbage_collection" triggerEvent:0 predicateString:0 triggerString:v8];
  v12[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v10;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v5 = a3;
  v6 = [&unk_1F17EF710 objectForKeyedSubscript:v5];
  if (v6)
  {
    v7 = [v5 componentsSeparatedByString:@"."];

    if ([v7 count] != 2)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, a1, @"HDUserDomainMedicalCodingEntity.m", 131, @"Invalid parameter not satisfying: %@", @"[components count] == 2" object file lineNumber description];
    }
    v8 = (void *)MEMORY[0x1E4F65D38];
    v9 = [a1 disambiguatedDatabaseTable];
    uint64_t v10 = objc_opt_class();
    v11 = [v7 firstObject];
    v12 = [v8 leftJoinClauseFromTable:v9 toTargetEntity:v10 as:v11 localReference:v6 targetKey:*MEMORY[0x1E4F65C70]];

    v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
  }
  else
  {
    v16.receiver = a1;
    v16.super_class = (Class)&OBJC_METACLASS___HDUserDomainMedicalCodingEntity;
    v13 = objc_msgSendSuper2(&v16, sel_joinClausesForProperty_, v5);
  }

  return v13;
}

+ (id)privateSubEntities
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v44 = [v9 protectedDatabase];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v10 = [v8 codingCollection];
  v11 = [v10 codings];

  id obj = v11;
  uint64_t v40 = [v11 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (!v40)
  {
    BOOL v33 = 1;
    goto LABEL_23;
  }
  uint64_t v42 = *(void *)v59;
  v38 = a6;
  id v39 = v9;
  id v36 = v8;
  while (2)
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v59 != v42) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v58 + 1) + 8 * v12);
      v14 = objc_msgSend(v13, "codingSystem", v36);
      v15 = [v14 identifier];
      id v57 = 0;
      BOOL v16 = +[HDUserDomainMedicalCodingEntity _getPersistentIDForString:transaction:result:error:]((uint64_t)a1, v15, v9, &v57, (uint64_t)a6);
      id v17 = v57;
      if (!v16)
      {
        id v20 = 0;
LABEL_19:

        id v27 = 0;
        v34 = 0;
        id v8 = v36;
LABEL_21:

        BOOL v33 = 0;
        goto LABEL_23;
      }
      uint64_t v45 = v12;
      v18 = [v13 code];
      id v56 = 0;
      BOOL v19 = +[HDUserDomainMedicalCodingEntity _getPersistentIDForString:transaction:result:error:]((uint64_t)a1, v18, v9, &v56, (uint64_t)a6);
      id v20 = v56;
      if (!v19)
      {

        goto LABEL_19;
      }
      v47 = v17;
      v21 = [v13 codingVersion];
      id v55 = 0;
      v22 = a6;
      BOOL v23 = +[HDUserDomainMedicalCodingEntity _getPersistentIDForString:transaction:result:error:]((uint64_t)a1, v21, v9, &v55, (uint64_t)a6);
      id v46 = v55;
      if (v23)
      {
        v24 = [v13 displayString];
        v25 = v9;
        v26 = v24;
        id v54 = 0;
        BOOL v23 = +[HDUserDomainMedicalCodingEntity _getPersistentIDForString:transaction:result:error:]((uint64_t)a1, v24, v25, &v54, (uint64_t)v22);
        id v27 = v54;
      }
      else
      {
        id v27 = 0;
      }
      id v17 = v47;

      if (!v23)
      {
        id v8 = v36;
        id v9 = v39;
        v34 = v46;
        goto LABEL_21;
      }
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __104__HDUserDomainMedicalCodingEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
      v48[3] = &unk_1E6303358;
      int64_t v53 = a4;
      id v28 = v47;
      id v49 = v28;
      id v29 = v20;
      id v50 = v29;
      id v30 = v46;
      id v51 = v30;
      id v31 = v27;
      id v52 = v31;
      a6 = v38;
      int v32 = [v44 executeCachedStatementForKey:&insertDataForUserDomainConcept_userDomainConceptID_transaction_error__statementKey_1 error:v38 SQLGenerator:&__block_literal_global_131 bindingHandler:v48 enumerationHandler:0];

      if (!v32)
      {
        BOOL v33 = 0;
        id v8 = v36;
        id v9 = v39;
        goto LABEL_23;
      }
      uint64_t v12 = v45 + 1;
      id v9 = v39;
    }
    while (v40 != v45 + 1);
    BOOL v33 = 1;
    id v8 = v36;
    uint64_t v40 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v40) {
      continue;
    }
    break;
  }
LABEL_23:

  return v33;
}

+ (BOOL)_getPersistentIDForString:(void *)a3 transaction:(void *)a4 result:(uint64_t)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  self;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = @"(null)";
  }
  v11 = +[HDUserDomainMedicalCodingStringEntity persistentIDForString:v10 transaction:v9 error:a5];

  id v12 = v11;
  *a4 = v12;
  BOOL v13 = v12 != 0;

  return v13;
}

__CFString *__104__HDUserDomainMedicalCodingEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO user_domain_medical_codings (udc_id, system, code, version, display_string) VALUES (?, ?, ?, ?, ?)";
}

uint64_t __104__HDUserDomainMedicalCodingEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 64));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v13 = a6;
  id v14 = objc_alloc_init(v12);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __141__HDUserDomainMedicalCodingEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke;
  v21[3] = &unk_1E6303380;
  id v15 = v14;
  id v22 = v15;
  int v16 = +[HDUserDomainMedicalCodingEntity _enumerateMedicalCodingsWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, v13, (uint64_t)a7, v21);

  if (v16)
  {
    if ([v15 count])
    {
      id v17 = (void *)MEMORY[0x1E4F2B178];
      v18 = (void *)[v15 copy];
      BOOL v19 = [v17 collectionWithCodings:v18];
    }
    else
    {
      BOOL v19 = 0;
    }
    [v11 _setCodingCollection:v19];
  }
  return v16;
}

uint64_t __141__HDUserDomainMedicalCodingEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (uint64_t)_enumerateMedicalCodingsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = (void *)MEMORY[0x1E4F65D00];
  id v12 = [NSNumber numberWithLongLong:a2];
  id v13 = [v11 predicateWithProperty:@"udc_id" equalToValue:v12];

  uint64_t v14 = [v10 enumerateMedicalCodingsWithPredicate:v13 transaction:v9 error:a4 enumerationHandler:v8];
  return v14;
}

+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  return 1;
}

+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__HDUserDomainMedicalCodingEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke;
  v13[3] = &unk_1E6303380;
  id v14 = v10;
  id v11 = v10;
  LOBYTE(a6) = +[HDUserDomainMedicalCodingEntity _enumerateMedicalCodingsWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, a5, (uint64_t)a6, v13);

  return (char)a6;
}

uint64_t __98__HDUserDomainMedicalCodingEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 codableRepresentationForSync];
  [v2 addCodings:v3];

  return 1;
}

+ (BOOL)enumerateMedicalCodingsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [a4 databaseForEntityClass:a1];
  id v13 = [a1 queryWithDatabase:v12 predicate:v11];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __109__HDUserDomainMedicalCodingEntity_enumerateMedicalCodingsWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v16[3] = &unk_1E62F35F0;
  id v17 = v10;
  id v14 = v10;
  LOBYTE(a5) = [v13 enumeratePersistentIDsAndProperties:&unk_1F17EA248 error:a5 enumerationHandler:v16];

  return (char)a5;
}

uint64_t __109__HDUserDomainMedicalCodingEntity_enumerateMedicalCodingsWithPredicate_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = MEMORY[0x1C1879F80](a4, 0);
  v6 = MEMORY[0x1C1879F80](a4, 1);
  v7 = MEMORY[0x1C1879F80](a4, 2);
  id v8 = MEMORY[0x1C1879F80](a4, 3);
  id v22 = v5;
  if ([v5 isEqualToString:@"(null)"]) {
    id v9 = 0;
  }
  else {
    id v9 = v5;
  }
  id v10 = v9;
  if ([v6 isEqualToString:@"(null)"]) {
    id v11 = 0;
  }
  else {
    id v11 = v6;
  }
  id v12 = v11;
  if ([v7 isEqualToString:@"(null)"]) {
    id v13 = 0;
  }
  else {
    id v13 = v7;
  }
  id v14 = v13;
  if ([v8 isEqualToString:@"(null)"]) {
    id v15 = 0;
  }
  else {
    id v15 = v8;
  }
  id v16 = v15;
  if (v10)
  {
    id v17 = [MEMORY[0x1E4F2B180] codeSystemWithIdentifier:v10];
  }
  else
  {
    id v17 = 0;
  }
  v18 = [MEMORY[0x1E4F2B170] medicalCodingWithSystem:v17 codingVersion:v14 code:v12 displayString:v16];
  uint64_t v19 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v19;
}

@end