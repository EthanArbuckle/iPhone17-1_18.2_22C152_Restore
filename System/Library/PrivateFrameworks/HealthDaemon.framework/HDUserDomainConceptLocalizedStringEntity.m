@interface HDUserDomainConceptLocalizedStringEntity
+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateLocalizedStringRowsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:;
@end

@implementation HDUserDomainConceptLocalizedStringEntity

+ (id)databaseTable
{
  return @"user_domain_concept_localized_strings";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_4;
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v22 = a5;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v7 = [a3 propertyCollection];
  v8 = [v7 properties];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v13 type];
          if ((HKIsDeprecatedPropertyType() & 1) == 0)
          {
            id v14 = v13;
            id v15 = v22;
            self;
            v16 = [v15 protectedDatabase];

            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __105__HDUserDomainConceptLocalizedStringEntity__insertLocalizedString_userDomainConceptID_transaction_error___block_invoke_2;
            v27[3] = &unk_1E62F33F8;
            id v28 = v14;
            int64_t v29 = a4;
            id v17 = v14;
            LODWORD(v15) = [v16 executeCachedStatementForKey:&_insertLocalizedString_userDomainConceptID_transaction_error__statementKey error:a6 SQLGenerator:&__block_literal_global_16 bindingHandler:v27 enumerationHandler:0];

            if (!v15)
            {
              BOOL v18 = 0;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v30 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_13:

  return v18;
}

+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v10 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __150__HDUserDomainConceptLocalizedStringEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke;
  v17[3] = &unk_1E62F5018;
  id v18 = v10;
  id v11 = v10;
  v12 = v17;
  id v13 = a6;
  uint64_t v14 = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __131__HDUserDomainConceptLocalizedStringEntity__enumerateLocalizedStringsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke;
  v19[3] = &unk_1E62F33D0;
  id v20 = v12;
  id v15 = v12;
  LOBYTE(a7) = +[HDUserDomainConceptLocalizedStringEntity _enumerateLocalizedStringRowsWithUserDomainConceptID:transaction:error:enumerationHandler:](v14, a4, v13, (uint64_t)a7, v19);

  return (char)a7;
}

uint64_t __150__HDUserDomainConceptLocalizedStringEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
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
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__HDUserDomainConceptLocalizedStringEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke;
  v13[3] = &unk_1E62F3D38;
  id v14 = v10;
  id v11 = v10;
  LOBYTE(a6) = +[HDUserDomainConceptLocalizedStringEntity _enumerateLocalizedStringRowsWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, a5, (uint64_t)a6, v13);

  return (char)a6;
}

uint64_t __107__HDUserDomainConceptLocalizedStringEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsInt64();
  v3 = HDSQLiteColumnWithNameAsString();
  v4 = HDSQLiteColumnWithNameAsString();
  uint64_t v5 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  double v7 = v6;
  uint64_t v8 = HDSQLiteColumnWithNameAsBoolean();
  uint64_t v9 = objc_alloc_init(HDCodableUserDomainConceptLocalizedStringProperty);
  [(HDCodableUserDomainConceptLocalizedStringProperty *)v9 setType:v2];
  [(HDCodableUserDomainConceptLocalizedStringProperty *)v9 setVersion:v5];
  [(HDCodableUserDomainConceptLocalizedStringProperty *)v9 setTimestamp:v7];
  [(HDCodableUserDomainConceptLocalizedStringProperty *)v9 setStringValue:v3];
  [(HDCodableUserDomainConceptLocalizedStringProperty *)v9 setLocale:v4];
  [(HDCodableUserDomainConceptLocalizedStringProperty *)v9 setDeleted:v8];
  [*(id *)(a1 + 32) addLocalizedStringProperties:v9];

  return 1;
}

+ (uint64_t)_enumerateLocalizedStringRowsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8 = a5;
  id v9 = a3;
  self;
  id v10 = [v9 protectedDatabase];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __134__HDUserDomainConceptLocalizedStringEntity__enumerateLocalizedStringRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  void v13[4] = a2;
  uint64_t v11 = [v10 executeCachedStatementForKey:&_enumerateLocalizedStringRowsWithUserDomainConceptID_transaction_error_enumerationHandler__statementKey error:a4 SQLGenerator:&__block_literal_global_327 bindingHandler:v13 enumerationHandler:v8];

  return v11;
}

__CFString *__105__HDUserDomainConceptLocalizedStringEntity__insertLocalizedString_userDomainConceptID_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO user_domain_concept_localized_strings (udc_id, property_type, string_value, locale, version, timestamp, deleted) VALUES (?, ?, ?, ?, ?, ?, ?)";
}

uint64_t __105__HDUserDomainConceptLocalizedStringEntity__insertLocalizedString_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 32) type]);
  v4 = [*(id *)(a1 + 32) stringValue];
  HDSQLiteBindStringToStatement();

  uint64_t v5 = [*(id *)(a1 + 32) locale];
  HDSQLiteBindStringToStatement();

  sqlite3_bind_int64(a2, 5, [*(id *)(a1 + 32) version]);
  [*(id *)(a1 + 32) timestamp];
  sqlite3_bind_double(a2, 6, v6);
  int v7 = [*(id *)(a1 + 32) isDeleted];

  return sqlite3_bind_int(a2, 7, v7);
}

__CFString *__134__HDUserDomainConceptLocalizedStringEntity__enumerateLocalizedStringRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke()
{
  return @"SELECT property_type, string_value, locale, version, timestamp, deleted FROM user_domain_concept_localized_strings WHERE (udc_id = ?) ORDER BY ROWID";
}

uint64_t __134__HDUserDomainConceptLocalizedStringEntity__enumerateLocalizedStringRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __131__HDUserDomainConceptLocalizedStringEntity__enumerateLocalizedStringsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsInt64();
  v3 = HDSQLiteColumnWithNameAsString();
  v4 = HDSQLiteColumnWithNameAsString();
  uint64_t v5 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F2B650]) initWithType:v2 stringValue:v3 locale:v4 version:v5 timestamp:HDSQLiteColumnWithNameAsBoolean() deleted:v6];
  uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v8;
}

@end