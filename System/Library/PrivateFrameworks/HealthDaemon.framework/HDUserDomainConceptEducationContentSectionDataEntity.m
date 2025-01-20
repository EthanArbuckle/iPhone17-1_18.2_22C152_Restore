@interface HDUserDomainConceptEducationContentSectionDataEntity
+ (BOOL)addSectionDataToCodable:(id)a3 educationContentSectionID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)enumerateSectionDataForEducationContentSectionID:(int64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)insertEducationContentSectionData:(id)a3 sectionPersistentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (id)privateSubEntities;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateSectionDataRowsForEducationContentSectionPersistentID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:;
@end

@implementation HDUserDomainConceptEducationContentSectionDataEntity

+ (id)databaseTable
{
  return @"user_domain_concept_education_content_section_data";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_9;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"section_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
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

+ (BOOL)insertEducationContentSectionData:(id)a3 sectionPersistentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = [v10 protectedDatabase];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __128__HDUserDomainConceptEducationContentSectionDataEntity_insertEducationContentSectionData_sectionPersistentID_transaction_error___block_invoke_2;
  v27[3] = &unk_1E62F33F8;
  int64_t v29 = a4;
  id v12 = v9;
  id v28 = v12;
  LODWORD(v9) = [v11 executeCachedStatementForKey:&insertEducationContentSectionData_sectionPersistentID_transaction_error__statementKey error:a6 SQLGenerator:&__block_literal_global_21 bindingHandler:v27 enumerationHandler:0];

  if (v9)
  {
    v13 = [v10 protectedDatabase];
    v14 = [v13 lastInsertRowID];

    if (v14)
    {
      uint64_t v15 = [v14 longLongValue];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v16 = objc_msgSend(v12, "stringValues", 0);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v30 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v16);
            }
            if (!+[HDUserDomainConceptEducationContentSectionDataStringsEntity insertEducationContentSectionDataString:*(void *)(*((void *)&v23 + 1) + 8 * i) sectionDataPersistentID:v15 transaction:v10 error:a6])
            {
              BOOL v21 = 0;
              goto LABEL_14;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v30 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
      BOOL v21 = 1;
LABEL_14:
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

__CFString *__128__HDUserDomainConceptEducationContentSectionDataEntity_insertEducationContentSectionData_sectionPersistentID_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO user_domain_concept_education_content_section_data (section_id, metadata_kind, version, timestamp, deleted) VALUES (?, ?, ?, ?, ?)";
}

uint64_t __128__HDUserDomainConceptEducationContentSectionDataEntity_insertEducationContentSectionData_sectionPersistentID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 32) sectionDataType]);
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 32) version]);
  [*(id *)(a1 + 32) timestamp];
  sqlite3_bind_double(a2, 4, v4);
  int v5 = [*(id *)(a1 + 32) deleted];

  return sqlite3_bind_int(a2, 5, v5);
}

+ (BOOL)enumerateSectionDataForEducationContentSectionID:(int64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __142__HDUserDomainConceptEducationContentSectionDataEntity_enumerateSectionDataForEducationContentSectionID_transaction_error_enumerationHandler___block_invoke;
  v15[3] = &unk_1E62F58E8;
  id v16 = v10;
  id v17 = v11;
  id v12 = v11;
  id v13 = v10;
  LOBYTE(a5) = +[HDUserDomainConceptEducationContentSectionDataEntity _enumerateSectionDataRowsForEducationContentSectionPersistentID:transaction:error:enumerationHandler:]((uint64_t)a1, a3, v13, (uint64_t)a5, v15);

  return (char)a5;
}

uint64_t __142__HDUserDomainConceptEducationContentSectionDataEntity_enumerateSectionDataForEducationContentSectionID_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v7 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  double v9 = v8;
  uint64_t v10 = HDSQLiteColumnWithNameAsBoolean();
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = *(void *)(a1 + 32);
  id v26 = 0;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  long long v23 = __142__HDUserDomainConceptEducationContentSectionDataEntity_enumerateSectionDataForEducationContentSectionID_transaction_error_enumerationHandler___block_invoke_2;
  long long v24 = &unk_1E62F58C0;
  id v13 = v11;
  id v25 = v13;
  BOOL v14 = +[HDUserDomainConceptEducationContentSectionDataStringsEntity enumerateSectionDataStringsForEducationContentSectionDataID:v5 transaction:v12 error:&v26 enumerationHandler:&v21];
  id v15 = v26;
  id v16 = v15;
  if (v14)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F2B2E0]);
    uint64_t v18 = objc_msgSend(v17, "initWithStringValues:sectionDataType:version:timestamp:deleted:", v13, v6, v7, v10, v9, v21, v22, v23, v24);
    uint64_t v19 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v19 = 0;
    if (a3) {
      *a3 = v15;
    }
  }

  return v19;
}

uint64_t __142__HDUserDomainConceptEducationContentSectionDataEntity_enumerateSectionDataForEducationContentSectionID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (uint64_t)_enumerateSectionDataRowsForEducationContentSectionPersistentID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8 = a5;
  id v9 = a3;
  self;
  uint64_t v10 = [v9 protectedDatabase];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __157__HDUserDomainConceptEducationContentSectionDataEntity__enumerateSectionDataRowsForEducationContentSectionPersistentID_transaction_error_enumerationHandler___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[4] = a2;
  uint64_t v11 = [v10 executeCachedStatementForKey:&_enumerateSectionDataRowsForEducationContentSectionPersistentID_transaction_error_enumerationHandler__statementKey error:a4 SQLGenerator:&__block_literal_global_321_0 bindingHandler:v13 enumerationHandler:v8];

  return v11;
}

+ (BOOL)addSectionDataToCodable:(id)a3 educationContentSectionID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __124__HDUserDomainConceptEducationContentSectionDataEntity_addSectionDataToCodable_educationContentSectionID_transaction_error___block_invoke;
  v15[3] = &unk_1E62F3D60;
  id v16 = v11;
  id v17 = v10;
  id v12 = v10;
  id v13 = v11;
  LOBYTE(a6) = +[HDUserDomainConceptEducationContentSectionDataEntity _enumerateSectionDataRowsForEducationContentSectionPersistentID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, v13, (uint64_t)a6, v15);

  return (char)a6;
}

BOOL __124__HDUserDomainConceptEducationContentSectionDataEntity_addSectionDataToCodable_educationContentSectionID_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v7 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  double v9 = v8;
  uint64_t v10 = HDSQLiteColumnWithNameAsBoolean();
  id v11 = objc_alloc_init(HDCodableSectionData);
  [(HDCodableSectionData *)v11 setSectionDataType:v6];
  [(HDCodableSectionData *)v11 setVersion:v7];
  [(HDCodableSectionData *)v11 setTimestamp:v9];
  [(HDCodableSectionData *)v11 setDeleted:v10];
  BOOL v12 = +[HDUserDomainConceptEducationContentSectionDataStringsEntity addSectionDataStringsToCodable:v11 sectionDataID:v5 transaction:*(void *)(a1 + 32) error:a3];
  if (v12) {
    [*(id *)(a1 + 40) addSectionData:v11];
  }

  return v12;
}

__CFString *__157__HDUserDomainConceptEducationContentSectionDataEntity__enumerateSectionDataRowsForEducationContentSectionPersistentID_transaction_error_enumerationHandler___block_invoke()
{
  return @"SELECT * FROM user_domain_concept_education_content_section_data WHERE (section_id = ?) ORDER BY ROWID";
}

uint64_t __157__HDUserDomainConceptEducationContentSectionDataEntity__enumerateSectionDataRowsForEducationContentSectionPersistentID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

@end