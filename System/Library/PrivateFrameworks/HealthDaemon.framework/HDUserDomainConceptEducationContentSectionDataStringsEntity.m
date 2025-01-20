@interface HDUserDomainConceptEducationContentSectionDataStringsEntity
+ (BOOL)addSectionDataStringsToCodable:(id)a3 sectionDataID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)enumerateSectionDataStringsForEducationContentSectionDataID:(int64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)insertEducationContentSectionDataString:(id)a3 sectionDataPersistentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateSectionDataRowsForEducationContentSectionDataPersistentID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:;
@end

@implementation HDUserDomainConceptEducationContentSectionDataStringsEntity

+ (id)databaseTable
{
  return @"user_domain_concept_education_content_section_data_strings";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_7;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"section_data_id";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)insertEducationContentSectionDataString:(id)a3 sectionDataPersistentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = [a5 protectedDatabase];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __145__HDUserDomainConceptEducationContentSectionDataStringsEntity_insertEducationContentSectionDataString_sectionDataPersistentID_transaction_error___block_invoke_2;
  v13[3] = &unk_1E62F33F8;
  id v14 = v9;
  int64_t v15 = a4;
  id v11 = v9;
  LOBYTE(a6) = [v10 executeCachedStatementForKey:&insertEducationContentSectionDataString_sectionDataPersistentID_transaction_error__statementKey error:a6 SQLGenerator:&__block_literal_global_19 bindingHandler:v13 enumerationHandler:0];

  return (char)a6;
}

__CFString *__145__HDUserDomainConceptEducationContentSectionDataStringsEntity_insertEducationContentSectionDataString_sectionDataPersistentID_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO user_domain_concept_education_content_section_data_strings (section_data_id, string_value) VALUES (?, ?)";
}

uint64_t __145__HDUserDomainConceptEducationContentSectionDataStringsEntity_insertEducationContentSectionDataString_sectionDataPersistentID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));

  return HDSQLiteBindStringToStatement();
}

+ (BOOL)enumerateSectionDataStringsForEducationContentSectionDataID:(int64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __160__HDUserDomainConceptEducationContentSectionDataStringsEntity_enumerateSectionDataStringsForEducationContentSectionDataID_transaction_error_enumerationHandler___block_invoke;
  v13[3] = &unk_1E62F33D0;
  id v14 = v10;
  id v11 = v10;
  LOBYTE(a5) = +[HDUserDomainConceptEducationContentSectionDataStringsEntity _enumerateSectionDataRowsForEducationContentSectionDataPersistentID:transaction:error:enumerationHandler:]((uint64_t)a1, a3, a4, (uint64_t)a5, v13);

  return (char)a5;
}

uint64_t __160__HDUserDomainConceptEducationContentSectionDataStringsEntity_enumerateSectionDataStringsForEducationContentSectionDataID_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsString();
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v3;
}

+ (uint64_t)_enumerateSectionDataRowsForEducationContentSectionDataPersistentID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8 = a5;
  id v9 = a3;
  self;
  id v10 = [v9 protectedDatabase];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __168__HDUserDomainConceptEducationContentSectionDataStringsEntity__enumerateSectionDataRowsForEducationContentSectionDataPersistentID_transaction_error_enumerationHandler___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  void v13[4] = a2;
  uint64_t v11 = [v10 executeCachedStatementForKey:&_enumerateSectionDataRowsForEducationContentSectionDataPersistentID_transaction_error_enumerationHandler__statementKey error:a4 SQLGenerator:&__block_literal_global_309 bindingHandler:v13 enumerationHandler:v8];

  return v11;
}

+ (BOOL)addSectionDataStringsToCodable:(id)a3 sectionDataID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __126__HDUserDomainConceptEducationContentSectionDataStringsEntity_addSectionDataStringsToCodable_sectionDataID_transaction_error___block_invoke;
  v13[3] = &unk_1E62F3D38;
  id v14 = v10;
  id v11 = v10;
  LOBYTE(a6) = +[HDUserDomainConceptEducationContentSectionDataStringsEntity _enumerateSectionDataRowsForEducationContentSectionDataPersistentID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, a5, (uint64_t)a6, v13);

  return (char)a6;
}

uint64_t __126__HDUserDomainConceptEducationContentSectionDataStringsEntity_addSectionDataStringsToCodable_sectionDataID_transaction_error___block_invoke(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsString();
  [*(id *)(a1 + 32) addStringValues:v2];

  return 1;
}

__CFString *__168__HDUserDomainConceptEducationContentSectionDataStringsEntity__enumerateSectionDataRowsForEducationContentSectionDataPersistentID_transaction_error_enumerationHandler___block_invoke()
{
  return @"SELECT string_value FROM user_domain_concept_education_content_section_data_strings WHERE (section_data_id = ?) ORDER BY ROWID";
}

uint64_t __168__HDUserDomainConceptEducationContentSectionDataStringsEntity__enumerateSectionDataRowsForEducationContentSectionDataPersistentID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

@end