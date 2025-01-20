@interface HDUserDomainConceptEducationContentSectionEntity
+ (BOOL)addSectionsToCodable:(id)a3 educationContentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)enumerateLocalizedEducationContentSectionsWithEducationContentID:(int64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)insertLocalizedEducationContentSectionsFor:(id)a3 educationContentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)privateSubEntities;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateLocalizedEducationContentSectionRowsWithEducationContentID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:;
@end

@implementation HDUserDomainConceptEducationContentSectionEntity

+ (id)databaseTable
{
  return @"user_domain_concept_education_content_sections";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_72;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"education_content_id";
  v2 = +[HDHealthEntity defaultForeignKey];
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

__CFString *__149__HDUserDomainConceptEducationContentSectionEntity_insertEducationContentSectionForContentWithID_error_localizedEducationContentSection_transaction___block_invoke()
{
  return @"INSERT OR REPLACE INTO user_domain_concept_education_content_sections (education_content_id, section_type) VALUES (?, ?)";
}

uint64_t __149__HDUserDomainConceptEducationContentSectionEntity_insertEducationContentSectionForContentWithID_error_localizedEducationContentSection_transaction___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_int64 v4 = [*(id *)(a1 + 32) sectionType];

  return sqlite3_bind_int64(a2, 2, v4);
}

+ (BOOL)insertLocalizedEducationContentSectionsFor:(id)a3 educationContentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v11 = [a3 sections];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v35;
    v32 = v11;
    id v33 = v10;
    id v28 = a1;
    int64_t v29 = a4;
    uint64_t v27 = *(void *)v35;
    while (2)
    {
      uint64_t v14 = 0;
      uint64_t v30 = v12;
      do
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v31 = v14;
        id v18 = *(id *)(*((void *)&v34 + 1) + 8 * v14);
        id v15 = v10;
        self;
        v16 = [v15 protectedDatabase];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __149__HDUserDomainConceptEducationContentSectionEntity_insertEducationContentSectionForContentWithID_error_localizedEducationContentSection_transaction___block_invoke_2;
        v42[3] = &unk_1E62F33F8;
        int64_t v44 = a4;
        id v17 = v18;
        id v43 = v17;
        LODWORD(v18) = [v16 executeCachedStatementForKey:&insertEducationContentSectionForContentWithID_error_localizedEducationContentSection_transaction__statementKey error:a6 SQLGenerator:&__block_literal_global_175 bindingHandler:v42 enumerationHandler:0];

        if (!v18)
        {

          goto LABEL_21;
        }
        v19 = [v15 protectedDatabase];
        v20 = [v19 lastInsertRowID];

        if (!v20)
        {

          LOBYTE(v18) = 0;
          goto LABEL_21;
        }
        uint64_t v21 = [v20 longLongValue];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v18 = [v17 sectionData];
        uint64_t v22 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v39;
          while (2)
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v39 != v24) {
                objc_enumerationMutation(v18);
              }
              if (!+[HDUserDomainConceptEducationContentSectionDataEntity insertEducationContentSectionData:sectionPersistentID:transaction:error:](HDUserDomainConceptEducationContentSectionDataEntity, "insertEducationContentSectionData:sectionPersistentID:transaction:error:", *(void *)(*((void *)&v38 + 1) + 8 * i), v21, v15, a6, v27, v28, v29))
              {

                LOBYTE(v18) = 0;
                v11 = v32;
                id v10 = v33;
                goto LABEL_21;
              }
            }
            uint64_t v23 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }

        uint64_t v14 = v31 + 1;
        v11 = v32;
        id v10 = v33;
        a4 = v29;
        uint64_t v13 = v27;
      }
      while (v31 + 1 != v30);
      uint64_t v12 = [v32 countByEnumeratingWithState:&v34 objects:v45 count:16];
      LOBYTE(v18) = 1;
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOBYTE(v18) = 1;
  }
LABEL_21:

  return (char)v18;
}

+ (BOOL)enumerateLocalizedEducationContentSectionsWithEducationContentID:(int64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __154__HDUserDomainConceptEducationContentSectionEntity_enumerateLocalizedEducationContentSectionsWithEducationContentID_transaction_error_enumerationHandler___block_invoke;
  v15[3] = &unk_1E62F58E8;
  id v16 = v10;
  id v17 = v11;
  id v12 = v11;
  id v13 = v10;
  LOBYTE(a5) = +[HDUserDomainConceptEducationContentSectionEntity _enumerateLocalizedEducationContentSectionRowsWithEducationContentID:transaction:error:enumerationHandler:]((uint64_t)a1, a3, v13, (uint64_t)a5, v15);

  return (char)a5;
}

uint64_t __154__HDUserDomainConceptEducationContentSectionEntity_enumerateLocalizedEducationContentSectionsWithEducationContentID_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = *(void *)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __154__HDUserDomainConceptEducationContentSectionEntity_enumerateLocalizedEducationContentSectionsWithEducationContentID_transaction_error_enumerationHandler___block_invoke_2;
  v15[3] = &unk_1E63064E0;
  id v9 = v7;
  id v16 = v9;
  if (+[HDUserDomainConceptEducationContentSectionDataEntity enumerateSectionDataForEducationContentSectionID:v5 transaction:v8 error:a3 enumerationHandler:v15])
  {
    id v10 = objc_msgSend(v9, "hk_mapToDictionary:", &__block_literal_global_307_3);
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F2B2F0]) initWithSectionDataTypeMapping:v10 sectionType:v6];
    uint64_t v13 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v12, a3);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __154__HDUserDomainConceptEducationContentSectionEntity_enumerateLocalizedEducationContentSectionsWithEducationContentID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

void __154__HDUserDomainConceptEducationContentSectionEntity_enumerateLocalizedEducationContentSectionsWithEducationContentID_transaction_error_enumerationHandler___block_invoke_3(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  uint64_t v5 = NSNumber;
  uint64_t v6 = a3;
  id v7 = a2;
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v7, "sectionDataType"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id, id))a3)[2](v6, v8, v7);
}

+ (uint64_t)_enumerateLocalizedEducationContentSectionRowsWithEducationContentID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8 = a5;
  id v9 = a3;
  self;
  id v10 = [v9 protectedDatabase];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __158__HDUserDomainConceptEducationContentSectionEntity__enumerateLocalizedEducationContentSectionRowsWithEducationContentID_transaction_error_enumerationHandler___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a2;
  uint64_t v11 = [v10 executeCachedStatementForKey:&_enumerateLocalizedEducationContentSectionRowsWithEducationContentID_transaction_error_enumerationHandler__statementKey error:a4 SQLGenerator:&__block_literal_global_316_0 bindingHandler:v13 enumerationHandler:v8];

  return v11;
}

+ (BOOL)addSectionsToCodable:(id)a3 educationContentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110__HDUserDomainConceptEducationContentSectionEntity_addSectionsToCodable_educationContentID_transaction_error___block_invoke;
  v15[3] = &unk_1E62F3D60;
  id v16 = v11;
  id v17 = v10;
  id v12 = v10;
  id v13 = v11;
  LOBYTE(a6) = +[HDUserDomainConceptEducationContentSectionEntity _enumerateLocalizedEducationContentSectionRowsWithEducationContentID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, v13, (uint64_t)a6, v15);

  return (char)a6;
}

BOOL __110__HDUserDomainConceptEducationContentSectionEntity_addSectionsToCodable_educationContentID_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  id v7 = objc_alloc_init(HDCodableOntologyLocalizedEducationContentSection);
  [(HDCodableOntologyLocalizedEducationContentSection *)v7 setSectionType:v6];
  BOOL v8 = +[HDUserDomainConceptEducationContentSectionDataEntity addSectionDataToCodable:v7 educationContentSectionID:v5 transaction:*(void *)(a1 + 32) error:a3];
  if (v8) {
    [*(id *)(a1 + 40) addSections:v7];
  }

  return v8;
}

__CFString *__158__HDUserDomainConceptEducationContentSectionEntity__enumerateLocalizedEducationContentSectionRowsWithEducationContentID_transaction_error_enumerationHandler___block_invoke()
{
  return @"SELECT * FROM user_domain_concept_education_content_sections WHERE (education_content_id = ?) ORDER BY ROWID";
}

uint64_t __158__HDUserDomainConceptEducationContentSectionEntity__enumerateLocalizedEducationContentSectionRowsWithEducationContentID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

@end