@interface HDUserDomainConceptLinkEntity
+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)unitTesting_enumerateConceptLinksWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateConceptLinkRowsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:;
@end

@implementation HDUserDomainConceptLinkEntity

+ (id)databaseTable
{
  return @"user_domain_concept_links";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_26;
}

+ (id)uniquedColumns
{
  return &unk_1F17E9468;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"udc_id";
  v2 = +[HDUserDomainConceptEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = [a5 protectedDatabase];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v9 linkCollection];
  uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v18 = v9;
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __102__HDUserDomainConceptLinkEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
        v20[3] = &unk_1E62F33F8;
        v20[4] = v15;
        v20[5] = a4;
        if (!objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertDataForUserDomainConcept_userDomainConceptID_transaction_error__statementKey, a6, &__block_literal_global_59, v20, 0, v18))
        {
          BOOL v16 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    BOOL v16 = 1;
LABEL_11:
    id v9 = v18;
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

__CFString *__102__HDUserDomainConceptLinkEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO user_domain_concept_links (udc_id, target_uuid, link_type) SELECT ?, ?, ? WHERE NOT EXISTS (SELECT 1 FROM user_domain_concepts WHERE uuid = ? AND deleted)";
}

void __102__HDUserDomainConceptLinkEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  v4 = [*(id *)(a1 + 32) targetUUID];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 32) type]);
  id v5 = [*(id *)(a1 + 32) targetUUID];
  HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [v10 linkCollection];

  if (v12)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    long long v24 = __139__HDUserDomainConceptLinkEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke;
    v25 = &unk_1E62FACE0;
    id v15 = v14;
    id v26 = v15;
    BOOL v16 = &v22;
    id v17 = v11;
    uint64_t v18 = self;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __116__HDUserDomainConceptLinkEntity__enumerateConceptLinksWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke;
    v27[3] = &unk_1E62F33D0;
    v28 = v16;
    v19 = v16;
    int v13 = +[HDUserDomainConceptLinkEntity _enumerateConceptLinkRowsWithUserDomainConceptID:transaction:error:enumerationHandler:](v18, a4, v17, (uint64_t)a7, v27);

    if (v13)
    {
      if (objc_msgSend(v15, "count", v22, v23, v24, v25)) {
        v20 = (void *)[objc_alloc(MEMORY[0x1E4F2B648]) _initWithLinks:v15];
      }
      else {
        v20 = 0;
      }
      [v10 _setLinkCollection:v20];
    }
  }

  return v13;
}

uint64_t __139__HDUserDomainConceptLinkEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v10 = a3;
  id v11 = [a7 protectedDatabase];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __122__HDUserDomainConceptLinkEntity_willDeleteUserDomainConcept_userDomainConceptID_syncProvenance_profile_transaction_error___block_invoke_2;
  v14[3] = &unk_1E62F43C8;
  id v15 = v10;
  id v12 = v10;
  LOBYTE(a8) = [v11 executeCachedStatementForKey:&willDeleteUserDomainConcept_userDomainConceptID_syncProvenance_profile_transaction_error__statementKey error:a8 SQLGenerator:&__block_literal_global_314 bindingHandler:v14 enumerationHandler:0];

  return (char)a8;
}

__CFString *__122__HDUserDomainConceptLinkEntity_willDeleteUserDomainConcept_userDomainConceptID_syncProvenance_profile_transaction_error___block_invoke()
{
  return @"DELETE FROM user_domain_concept_links WHERE target_uuid = ? ";
}

void __122__HDUserDomainConceptLinkEntity_willDeleteUserDomainConcept_userDomainConceptID_syncProvenance_profile_transaction_error___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) UUID];
  HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__HDUserDomainConceptLinkEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke;
  v13[3] = &unk_1E62F3D38;
  id v14 = v10;
  id v11 = v10;
  LOBYTE(a6) = +[HDUserDomainConceptLinkEntity _enumerateConceptLinkRowsWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, a5, (uint64_t)a6, v13);

  return (char)a6;
}

uint64_t __96__HDUserDomainConceptLinkEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = objc_alloc_init(HDCodableUserDomainConceptLink);
  id v5 = MEMORY[0x1C1879F20](a2, 0);
  [(HDCodableUserDomainConceptLink *)v4 setTargetUUID:v5];

  [(HDCodableUserDomainConceptLink *)v4 setType:HDSQLiteColumnAsInt64()];
  [*(id *)(a1 + 32) addLinks:v4];

  return 1;
}

+ (uint64_t)_enumerateConceptLinkRowsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8 = a5;
  id v9 = a3;
  self;
  id v10 = [v9 protectedDatabase];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __119__HDUserDomainConceptLinkEntity__enumerateConceptLinkRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  void v13[4] = a2;
  uint64_t v11 = [v10 executeCachedStatementForKey:&_enumerateConceptLinkRowsWithUserDomainConceptID_transaction_error_enumerationHandler__statementKey error:a4 SQLGenerator:&__block_literal_global_329_1 bindingHandler:v13 enumerationHandler:v8];

  return v11;
}

+ (BOOL)unitTesting_enumerateConceptLinksWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [a4 databaseForEntityClass:a1];
  int v13 = [a1 queryWithDatabase:v12 predicate:v11];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __117__HDUserDomainConceptLinkEntity_unitTesting_enumerateConceptLinksWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v16[3] = &unk_1E62F35F0;
  id v17 = v10;
  id v14 = v10;
  LOBYTE(a5) = [v13 enumeratePersistentIDsAndProperties:&unk_1F17E9480 error:a5 enumerationHandler:v16];

  return (char)a5;
}

uint64_t __117__HDUserDomainConceptLinkEntity_unitTesting_enumerateConceptLinksWithPredicate_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = MEMORY[0x1C1879F90](a4, 0);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F2B640]) initWithTarget:v5 type:HDSQLiteColumnAsInt64()];
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v7;
}

__CFString *__119__HDUserDomainConceptLinkEntity__enumerateConceptLinkRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke()
{
  return @"SELECT target_uuid, link_type FROM user_domain_concept_links WHERE udc_id = ? ORDER BY ROWID";
}

uint64_t __119__HDUserDomainConceptLinkEntity__enumerateConceptLinkRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __116__HDUserDomainConceptLinkEntity__enumerateConceptLinksWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc(MEMORY[0x1E4F2B640]);
  id v5 = MEMORY[0x1C1879F90](a2, 0);
  v6 = (void *)[v4 initWithTarget:v5 type:HDSQLiteColumnAsInt64()];

  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return v7;
}

@end