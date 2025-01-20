@interface HDUserDomainConceptNamedQuantityEntity
+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)foreignKeys;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateNamedQuantityRowsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:;
@end

@implementation HDUserDomainConceptNamedQuantityEntity

+ (id)databaseTable
{
  return @"user_domain_concept_named_quantities";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 9;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_39;
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
            v27[2] = __101__HDUserDomainConceptNamedQuantityEntity__insertNamedQuantity_userDomainConceptID_transaction_error___block_invoke_2;
            v27[3] = &unk_1E62F33F8;
            id v28 = v14;
            int64_t v29 = a4;
            id v17 = v14;
            LODWORD(v15) = [v16 executeCachedStatementForKey:&_insertNamedQuantity_userDomainConceptID_transaction_error__statementKey error:a6 SQLGenerator:&__block_literal_global_82 bindingHandler:v27 enumerationHandler:0];

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
  v17[2] = __148__HDUserDomainConceptNamedQuantityEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke;
  v17[3] = &unk_1E62FDDC0;
  id v18 = v10;
  id v11 = v10;
  v12 = v17;
  id v13 = a6;
  uint64_t v14 = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __128__HDUserDomainConceptNamedQuantityEntity__enumerateNamedQuantitiesWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke;
  v19[3] = &unk_1E62F33D0;
  id v20 = v12;
  id v15 = v12;
  LOBYTE(a7) = +[HDUserDomainConceptNamedQuantityEntity _enumerateNamedQuantityRowsWithUserDomainConceptID:transaction:error:enumerationHandler:](v14, a4, v13, (uint64_t)a7, v19);

  return (char)a7;
}

uint64_t __148__HDUserDomainConceptNamedQuantityEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
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
  v13[2] = __105__HDUserDomainConceptNamedQuantityEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke;
  v13[3] = &unk_1E62F3D38;
  id v14 = v10;
  id v11 = v10;
  LOBYTE(a6) = +[HDUserDomainConceptNamedQuantityEntity _enumerateNamedQuantityRowsWithUserDomainConceptID:transaction:error:enumerationHandler:]((uint64_t)a1, a4, a5, (uint64_t)a6, v13);

  return (char)a6;
}

uint64_t __105__HDUserDomainConceptNamedQuantityEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsString();
  HDSQLiteColumnWithNameAsDouble();
  double v4 = v3;
  v5 = HDSQLiteColumnWithNameAsString();
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v7 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  double v9 = v8;
  uint64_t v10 = HDSQLiteColumnWithNameAsBoolean();
  id v11 = objc_alloc_init(HDCodableUserDomainConceptNamedQuantity);
  [(HDCodableUserDomainConceptNamedQuantity *)v11 setName:v2];
  [(HDCodableUserDomainConceptNamedQuantity *)v11 setValue:v4];
  [(HDCodableUserDomainConceptNamedQuantity *)v11 setUnit:v5];
  [(HDCodableUserDomainConceptNamedQuantity *)v11 setType:v6];
  [(HDCodableUserDomainConceptNamedQuantity *)v11 setVersion:v7];
  [(HDCodableUserDomainConceptNamedQuantity *)v11 setTimestamp:v9];
  [(HDCodableUserDomainConceptNamedQuantity *)v11 setDeleted:v10];
  [*(id *)(a1 + 32) addNamedQuantities:v11];

  return 1;
}

+ (uint64_t)_enumerateNamedQuantityRowsWithUserDomainConceptID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8 = a5;
  id v9 = a3;
  self;
  uint64_t v10 = [v9 protectedDatabase];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __130__HDUserDomainConceptNamedQuantityEntity__enumerateNamedQuantityRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2;
  v13[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  void v13[4] = a2;
  uint64_t v11 = [v10 executeCachedStatementForKey:&_enumerateNamedQuantityRowsWithUserDomainConceptID_transaction_error_enumerationHandler__statementKey error:a4 SQLGenerator:&__block_literal_global_333 bindingHandler:v13 enumerationHandler:v8];

  return v11;
}

__CFString *__101__HDUserDomainConceptNamedQuantityEntity__insertNamedQuantity_userDomainConceptID_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO user_domain_concept_named_quantities (udc_id, name, value, unit, property_type, version, timestamp, deleted) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
}

uint64_t __101__HDUserDomainConceptNamedQuantityEntity__insertNamedQuantity_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  double v4 = [*(id *)(a1 + 32) name];
  HDSQLiteBindFoundationValueToStatement();

  [*(id *)(a1 + 32) value];
  sqlite3_bind_double(a2, 3, v5);
  uint64_t v6 = [*(id *)(a1 + 32) unitString];
  HDSQLiteBindStringToStatement();

  sqlite3_bind_int64(a2, 5, [*(id *)(a1 + 32) type]);
  sqlite3_bind_int64(a2, 6, [*(id *)(a1 + 32) version]);
  [*(id *)(a1 + 32) timestamp];
  sqlite3_bind_double(a2, 7, v7);
  int v8 = [*(id *)(a1 + 32) isDeleted];

  return sqlite3_bind_int(a2, 8, v8);
}

__CFString *__130__HDUserDomainConceptNamedQuantityEntity__enumerateNamedQuantityRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke()
{
  return @"SELECT name, value, unit, property_type, version, timestamp, deleted FROM user_domain_concept_named_quantities WHERE (udc_id = ?) ORDER BY ROWID";
}

uint64_t __130__HDUserDomainConceptNamedQuantityEntity__enumerateNamedQuantityRowsWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __128__HDUserDomainConceptNamedQuantityEntity__enumerateNamedQuantitiesWithUserDomainConceptID_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsString();
  HDSQLiteColumnWithNameAsDouble();
  double v4 = v3;
  double v5 = HDSQLiteColumnWithNameAsString();
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v7 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F2B658]) initWithName:v2 value:v5 unitString:v6 type:v7 version:HDSQLiteColumnWithNameAsBoolean() timestamp:v4 deleted:v8];
  uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v10;
}

@end