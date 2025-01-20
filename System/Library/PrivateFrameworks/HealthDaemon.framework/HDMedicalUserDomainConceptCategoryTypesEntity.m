@interface HDMedicalUserDomainConceptCategoryTypesEntity
+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateCategoryTypesWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:;
@end

@implementation HDMedicalUserDomainConceptCategoryTypesEntity

+ (id)databaseTable
{
  return @"medical_user_domain_concept_category_types";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_50;
}

+ (id)uniquedColumns
{
  return &unk_1F17E9708;
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
  id obj = [v9 categoryTypes];
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
        v20[2] = __118__HDMedicalUserDomainConceptCategoryTypesEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
        v20[3] = &unk_1E62F33F8;
        v20[4] = v15;
        v20[5] = a4;
        if (!objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertDataForUserDomainConcept_userDomainConceptID_transaction_error__statementKey_0, a6, &__block_literal_global_92, v20, 0, v18))
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

__CFString *__118__HDMedicalUserDomainConceptCategoryTypesEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO medical_user_domain_concept_category_types (udc_id, category_type) VALUES (?, ?)";
}

uint64_t __118__HDMedicalUserDomainConceptCategoryTypesEntity_insertDataForUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_int64 v4 = [*(id *)(a1 + 32) longLongValue];

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11 = a3;
  uint64_t v12 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v13 = a6;
  id v14 = objc_alloc_init(v12);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __155__HDMedicalUserDomainConceptCategoryTypesEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke;
  v18[3] = &unk_1E62FFB00;
  id v15 = v14;
  id v19 = v15;
  int v16 = +[HDMedicalUserDomainConceptCategoryTypesEntity _enumerateCategoryTypesWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, v13, (uint64_t)a7, v18);

  if (v16) {
    [v11 _setCategoryTypes:v15];
  }

  return v16;
}

uint64_t __155__HDMedicalUserDomainConceptCategoryTypesEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (uint64_t)_enumerateCategoryTypesWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8 = a5;
  id v9 = a3;
  self;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __133__HDMedicalUserDomainConceptCategoryTypesEntity__enumerateCategoryTypesWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke;
  id v19 = &unk_1E62F33D0;
  id v20 = v8;
  id v10 = v8;
  id v11 = &v16;
  id v12 = v9;
  self;
  id v13 = objc_msgSend(v12, "protectedDatabase", v16, v17, v18, v19);

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __136__HDMedicalUserDomainConceptCategoryTypesEntity__enumerateCategoryTypeRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2;
  v21[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v21[4] = a2;
  uint64_t v14 = [v13 executeCachedStatementForKey:&_enumerateCategoryTypeRowsWithUserDomainConceptID_transaction_error_enumerationHandler__statementKey error:a4 SQLGenerator:&__block_literal_global_307_2 bindingHandler:v21 enumerationHandler:v11];

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
  v13[2] = __112__HDMedicalUserDomainConceptCategoryTypesEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke;
  v13[3] = &unk_1E62FFB00;
  id v14 = v10;
  id v11 = v10;
  LOBYTE(a6) = +[HDMedicalUserDomainConceptCategoryTypesEntity _enumerateCategoryTypesWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, a5, (uint64_t)a6, v13);

  return (char)a6;
}

uint64_t __112__HDMedicalUserDomainConceptCategoryTypesEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

__CFString *__136__HDMedicalUserDomainConceptCategoryTypesEntity__enumerateCategoryTypeRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke()
{
  return @"SELECT category_type FROM medical_user_domain_concept_category_types WHERE udc_id = ? ORDER BY ROWID";
}

uint64_t __136__HDMedicalUserDomainConceptCategoryTypesEntity__enumerateCategoryTypeRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __133__HDMedicalUserDomainConceptCategoryTypesEntity__enumerateCategoryTypesWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);

  return v6;
}

@end