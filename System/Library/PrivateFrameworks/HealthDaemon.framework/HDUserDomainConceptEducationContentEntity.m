@interface HDUserDomainConceptEducationContentEntity
+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)privateSubEntities;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateLocalizedEducationContentRowsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:;
@end

@implementation HDUserDomainConceptEducationContentEntity

+ (id)databaseTable
{
  return @"user_domain_concept_education_content";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_42;
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

+ (id)privateSubEntities
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v25 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v8 = [a3 propertyCollection];
  v9 = [v8 properties];

  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;
          id v16 = v25;
          self;
          v17 = [v16 protectedDatabase];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __127__HDUserDomainConceptEducationContentEntity__insertLocalizedEducationContentSectionsFor_userDomainConceptID_transaction_error___block_invoke_2;
          v31[3] = &unk_1E62F33F8;
          int64_t v33 = a4;
          id v18 = v15;
          id v32 = v18;
          LODWORD(v15) = [v17 executeCachedStatementForKey:&_insertLocalizedEducationContentSectionsFor_userDomainConceptID_transaction_error__statementKey error:a6 SQLGenerator:&__block_literal_global_83 bindingHandler:v31 enumerationHandler:0];

          if (!v15
            || ([v16 protectedDatabase],
                v19 = objc_claimAutoreleasedReturnValue(),
                [v19 lastInsertRowID],
                v20 = objc_claimAutoreleasedReturnValue(),
                v19,
                !v20))
          {

LABEL_14:
            BOOL v22 = 0;
            goto LABEL_15;
          }
          BOOL v21 = +[HDUserDomainConceptEducationContentSectionEntity insertLocalizedEducationContentSectionsFor:educationContentID:transaction:error:](HDUserDomainConceptEducationContentSectionEntity, "insertLocalizedEducationContentSectionsFor:educationContentID:transaction:error:", v18, [v20 longLongValue], v16, a6);

          if (!v21) {
            goto LABEL_14;
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v22 = 1;
LABEL_15:

  return v22;
}

+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v10 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __151__HDUserDomainConceptEducationContentEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke;
  v18[3] = &unk_1E62FE1C0;
  id v19 = v10;
  id v11 = v10;
  id v12 = a6;
  v13 = v18;
  uint64_t v14 = self;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __141__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke;
  v20[3] = &unk_1E62F58E8;
  id v21 = v12;
  id v22 = v13;
  id v15 = v13;
  id v16 = v12;
  LOBYTE(a7) = +[HDUserDomainConceptEducationContentEntity _enumerateLocalizedEducationContentRowsWithUserDomainConceptID:transaction:error:enumerationHandler:](v14, a4, v16, (uint64_t)a7, v20);

  return (char)a7;
}

uint64_t __151__HDUserDomainConceptEducationContentEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  return 1;
}

+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __108__HDUserDomainConceptEducationContentEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke;
  v15[3] = &unk_1E62F3D60;
  id v16 = v11;
  id v17 = v10;
  id v12 = v10;
  id v13 = v11;
  LOBYTE(a6) = +[HDUserDomainConceptEducationContentEntity _enumerateLocalizedEducationContentRowsWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, v13, (uint64_t)a6, v15);

  return (char)a6;
}

BOOL __108__HDUserDomainConceptEducationContentEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = objc_alloc_init(HDCodableOntologyLocalizedEducationContent);
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v7 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  double v9 = v8;
  uint64_t v10 = HDSQLiteColumnWithNameAsBoolean();
  [(HDCodableOntologyLocalizedEducationContent *)v5 setVersion:v7];
  [(HDCodableOntologyLocalizedEducationContent *)v5 setTimestamp:v9];
  [(HDCodableOntologyLocalizedEducationContent *)v5 setDeleted:v10];
  BOOL v11 = +[HDUserDomainConceptEducationContentSectionEntity addSectionsToCodable:v5 educationContentID:v6 transaction:*(void *)(a1 + 32) error:a3];
  if (v11) {
    [*(id *)(a1 + 40) setOntologyLocalizedEducationContent:v5];
  }

  return v11;
}

+ (uint64_t)_enumerateLocalizedEducationContentRowsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8 = a5;
  id v9 = a3;
  self;
  uint64_t v10 = [v9 protectedDatabase];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __145__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a2;
  uint64_t v11 = [v10 executeCachedStatementForKey:&_enumerateLocalizedEducationContentRowsWithUserDomainConceptID_transaction_error_enumerationHandler__statementKey error:a4 SQLGenerator:&__block_literal_global_317 bindingHandler:v13 enumerationHandler:v8];

  return v11;
}

__CFString *__127__HDUserDomainConceptEducationContentEntity__insertLocalizedEducationContentSectionsFor_userDomainConceptID_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO user_domain_concept_education_content (udc_id, version, timestamp, deleted) VALUES (?, ?, ?, ?)";
}

uint64_t __127__HDUserDomainConceptEducationContentEntity__insertLocalizedEducationContentSectionsFor_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 32) version]);
  [*(id *)(a1 + 32) timestamp];
  sqlite3_bind_double(a2, 3, v4);
  int v5 = [*(id *)(a1 + 32) isDeleted];

  return sqlite3_bind_int(a2, 4, v5);
}

__CFString *__145__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke()
{
  return @"SELECT * FROM user_domain_concept_education_content WHERE (udc_id = ?) ORDER BY ROWID";
}

uint64_t __145__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __141__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnWithNameAsInt64();
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  double v9 = v8;
  uint64_t v10 = HDSQLiteColumnWithNameAsBoolean();
  uint64_t v11 = *(void *)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __141__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2;
  v17[3] = &unk_1E62FE1E8;
  id v12 = v6;
  id v18 = v12;
  if (+[HDUserDomainConceptEducationContentSectionEntity enumerateLocalizedEducationContentSectionsWithEducationContentID:v5 transaction:v11 error:a3 enumerationHandler:v17])
  {
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F2B2E8]) initWithSections:v12 version:v7 timestamp:v10 deleted:v9];
    uint64_t v15 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v13 + 16))(v13, v14, a3);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __141__HDUserDomainConceptEducationContentEntity__enumerateLocalizedEducationContentWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

@end