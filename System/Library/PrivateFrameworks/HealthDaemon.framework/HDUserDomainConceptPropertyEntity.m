@interface HDUserDomainConceptPropertyEntity
+ (BOOL)addPropertyDataToCodable:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)deleteDeviceLocalPropertiesWithType:(int64_t)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)insertDeviceLocalProperty:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)pruneDataForUpdatedUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)willDeleteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)deviceLocalPropertiesWithUserDomainConceptID:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (id)foreignKeys;
+ (id)indices;
+ (int64_t)protectionClass;
+ (uint64_t)_enumerateConceptPropertiesWithUserDomainConceptID:(uint64_t)a3 propertyCategory:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:;
+ (uint64_t)_enumerateConceptPropertyRowsWithUserDomainConceptID:(uint64_t)a3 propertyCategory:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:;
+ (uint64_t)_insertUserDomainConceptProperty:(uint64_t)a3 propertyCategory:(uint64_t)a4 userDomainConceptID:(void *)a5 transaction:(uint64_t)a6 error:;
@end

@implementation HDUserDomainConceptPropertyEntity

+ (id)databaseTable
{
  return @"user_domain_concept_properties";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 12;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_82;
}

+ (id)indices
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v3 = objc_opt_class();
  v8[0] = @"udc_id";
  v8[1] = @"property_type";
  v8[2] = @"version";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  v5 = (void *)[v2 initWithEntity:v3 name:@"udc_property_version" columns:v4];
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v6;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"udc_id";
  id v2 = +[HDUserDomainConceptEntity defaultForeignKey];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)insertDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v11 = objc_msgSend(a3, "propertyCollection", 0);
  v12 = [v11 allBasicProperties];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v17 type];
        if ((HKIsDeprecatedPropertyType() & 1) == 0
          && !+[HDUserDomainConceptPropertyEntity _insertUserDomainConceptProperty:propertyCategory:userDomainConceptID:transaction:error:]((uint64_t)a1, v17, 1, a4, v10, (uint64_t)a6))
        {
          BOOL v18 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_12:

  return v18;
}

+ (uint64_t)_insertUserDomainConceptProperty:(uint64_t)a3 propertyCategory:(uint64_t)a4 userDomainConceptID:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10 = a2;
  id v11 = a5;
  self;
  v12 = [v11 protectedDatabase];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __125__HDUserDomainConceptPropertyEntity__insertUserDomainConceptProperty_propertyCategory_userDomainConceptID_transaction_error___block_invoke_2;
  v16[3] = &unk_1E62F3618;
  uint64_t v18 = a4;
  uint64_t v19 = a3;
  id v17 = v10;
  id v13 = v10;
  uint64_t v14 = [v12 executeCachedStatementForKey:&_insertUserDomainConceptProperty_propertyCategory_userDomainConceptID_transaction_error__statementKey error:a6 SQLGenerator:&__block_literal_global_358 bindingHandler:v16 enumerationHandler:0];

  return v14;
}

+ (BOOL)retrieveDataForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 mutableUserDomainConceptProperties:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __143__HDUserDomainConceptPropertyEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke;
  v14[3] = &unk_1E6308708;
  id v15 = v11;
  id v12 = v11;
  LOBYTE(a7) = +[HDUserDomainConceptPropertyEntity _enumerateConceptPropertiesWithUserDomainConceptID:propertyCategory:transaction:error:enumerationHandler:]((uint64_t)a1, a4, 1, a6, (uint64_t)a7, v14);

  return (char)a7;
}

uint64_t __143__HDUserDomainConceptPropertyEntity_retrieveDataForUserDomainConcept_userDomainConceptID_mutableUserDomainConceptProperties_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (uint64_t)_enumerateConceptPropertiesWithUserDomainConceptID:(uint64_t)a3 propertyCategory:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:
{
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = self;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __142__HDUserDomainConceptPropertyEntity__enumerateConceptPropertiesWithUserDomainConceptID_propertyCategory_transaction_error_enumerationHandler___block_invoke;
  v16[3] = &unk_1E62F33D0;
  id v17 = v10;
  id v13 = v10;
  uint64_t v14 = +[HDUserDomainConceptPropertyEntity _enumerateConceptPropertyRowsWithUserDomainConceptID:propertyCategory:transaction:error:enumerationHandler:](v12, a2, a3, v11, a5, v16);

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
  v13[2] = __100__HDUserDomainConceptPropertyEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke;
  v13[3] = &unk_1E62F3D38;
  id v14 = v10;
  id v11 = v10;
  LOBYTE(a6) = +[HDUserDomainConceptPropertyEntity _enumerateConceptPropertyRowsWithUserDomainConceptID:propertyCategory:transaction:error:enumerationHandler:]((uint64_t)a1, a4, 1, a5, (uint64_t)a6, v13);

  return (char)a6;
}

uint64_t __100__HDUserDomainConceptPropertyEntity_addPropertyDataToCodable_userDomainConceptID_transaction_error___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(HDCodableUserDomainConceptProperty);
  [(HDCodableUserDomainConceptProperty *)v2 setType:HDSQLiteColumnWithNameAsInt64()];
  [(HDCodableUserDomainConceptProperty *)v2 setVersion:HDSQLiteColumnWithNameAsInt64()];
  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableUserDomainConceptProperty setTimestamp:](v2, "setTimestamp:");
  uint64_t v3 = HDSQLiteColumnWithNameAsInt64();
  [(HDCodableUserDomainConceptProperty *)v2 setValueType:v3];
  v4 = v2;
  switch(v3)
  {
    case 1:
      v5 = HDSQLiteColumnWithNameAsString();
      [(HDCodableUserDomainConceptProperty *)v4 setStringValue:v5];
      goto LABEL_7;
    case 2:
    case 5:
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableUserDomainConceptProperty setDoubleValue:](v4, "setDoubleValue:");
      break;
    case 3:
      [(HDCodableUserDomainConceptProperty *)v4 setIntegerValue:HDSQLiteColumnWithNameAsInt64()];
      break;
    case 4:
      [(HDCodableUserDomainConceptProperty *)v4 setBoolValue:HDSQLiteColumnWithNameAsBoolean()];
      break;
    case 6:
    case 7:
      v5 = HDSQLiteColumnWithNameAsData();
      [(HDCodableUserDomainConceptProperty *)v4 setDataValue:v5];
LABEL_7:

      break;
    default:
      break;
  }

  [*(id *)(a1 + 32) addProperties:v4];
  return 1;
}

+ (uint64_t)_enumerateConceptPropertyRowsWithUserDomainConceptID:(uint64_t)a3 propertyCategory:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:
{
  id v10 = a6;
  id v11 = a4;
  self;
  uint64_t v12 = [v11 protectedDatabase];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __144__HDUserDomainConceptPropertyEntity__enumerateConceptPropertyRowsWithUserDomainConceptID_propertyCategory_transaction_error_enumerationHandler___block_invoke_2;
  v15[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v15[4] = a2;
  v15[5] = a3;
  uint64_t v13 = [v12 executeCachedStatementForKey:&_enumerateConceptPropertyRowsWithUserDomainConceptID_propertyCategory_transaction_error_enumerationHandler__statementKey error:a5 SQLGenerator:&__block_literal_global_363_0 bindingHandler:v15 enumerationHandler:v10];

  return v13;
}

+ (BOOL)pruneDataForUpdatedUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  v8 = objc_msgSend(a5, "protectedDatabase", a3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __112__HDUserDomainConceptPropertyEntity_pruneDataForUpdatedUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
  v10[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v10[4] = a4;
  LOBYTE(a6) = [v8 executeCachedStatementForKey:&pruneDataForUpdatedUserDomainConcept_userDomainConceptID_transaction_error__statementKey error:a6 SQLGenerator:&__block_literal_global_192 bindingHandler:v10 enumerationHandler:0];

  return (char)a6;
}

__CFString *__112__HDUserDomainConceptPropertyEntity_pruneDataForUpdatedUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return @"DELETE FROM user_domain_concept_properties WHERE udc_id = ?AND category = ?";
}

uint64_t __112__HDUserDomainConceptPropertyEntity_pruneDataForUpdatedUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));

  return sqlite3_bind_int64(a2, 2, 1);
}

+ (BOOL)insertDeviceLocalProperty:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  return +[HDUserDomainConceptPropertyEntity _insertUserDomainConceptProperty:propertyCategory:userDomainConceptID:transaction:error:]((uint64_t)a1, a3, 2, a4, a5, (uint64_t)a6);
}

+ (id)deviceLocalPropertiesWithUserDomainConceptID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a4;
  id v10 = objc_alloc_init(v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __100__HDUserDomainConceptPropertyEntity_deviceLocalPropertiesWithUserDomainConceptID_transaction_error___block_invoke;
  v14[3] = &unk_1E6308708;
  id v11 = v10;
  id v15 = v11;
  LODWORD(a5) = +[HDUserDomainConceptPropertyEntity _enumerateConceptPropertiesWithUserDomainConceptID:propertyCategory:transaction:error:enumerationHandler:]((uint64_t)a1, a3, 2, v9, (uint64_t)a5, v14);

  if (a5) {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F2B668]) initWithProperties:v11];
  }
  else {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __100__HDUserDomainConceptPropertyEntity_deviceLocalPropertiesWithUserDomainConceptID_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (BOOL)deleteDeviceLocalPropertiesWithType:(int64_t)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9 = [a5 protectedDatabase];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __111__HDUserDomainConceptPropertyEntity_deleteDeviceLocalPropertiesWithType_userDomainConceptID_transaction_error___block_invoke_2;
  v11[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  v11[4] = a4;
  v11[5] = a3;
  LOBYTE(a6) = [v9 executeCachedStatementForKey:&deleteDeviceLocalPropertiesWithType_userDomainConceptID_transaction_error__statementKey error:a6 SQLGenerator:&__block_literal_global_352_0 bindingHandler:v11 enumerationHandler:0];

  return (char)a6;
}

__CFString *__111__HDUserDomainConceptPropertyEntity_deleteDeviceLocalPropertiesWithType_userDomainConceptID_transaction_error___block_invoke()
{
  return @"DELETE FROM user_domain_concept_properties WHERE (udc_id = ?AND category = ? AND property_type = ?)";
}

uint64_t __111__HDUserDomainConceptPropertyEntity_deleteDeviceLocalPropertiesWithType_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, 2);
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 3, v4);
}

__CFString *__125__HDUserDomainConceptPropertyEntity__insertUserDomainConceptProperty_propertyCategory_userDomainConceptID_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO user_domain_concept_properties (udc_id, category, property_type, version, timestamp, value_type, string_value, number_value, date_value, uuid_value, data_value) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
}

void __125__HDUserDomainConceptPropertyEntity__insertUserDomainConceptProperty_propertyCategory_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 48));
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 32) type]);
  sqlite3_bind_int64(a2, 4, [*(id *)(a1 + 32) version]);
  [*(id *)(a1 + 32) timestamp];
  sqlite3_bind_double(a2, 5, v4);
  sqlite3_bind_int64(a2, 6, [*(id *)(a1 + 32) valueType]);
  id v12 = *(id *)(a1 + 32);
  switch([v12 valueType])
  {
    case 1:
      v5 = [v12 stringValue];
      HDSQLiteBindFoundationValueToStatement();

      goto LABEL_4;
    case 2:
      sqlite3_bind_null(a2, 7);
      v6 = [v12 numberValue];
      [v6 doubleValue];
      sqlite3_bind_double(a2, 8, v7);
      goto LABEL_9;
    case 3:
      sqlite3_bind_null(a2, 7);
      v6 = [v12 numberValue];
      sqlite3_int64 v8 = [v6 longLongValue];
      goto LABEL_8;
    case 4:
      sqlite3_bind_null(a2, 7);
      v6 = [v12 numberValue];
      sqlite3_int64 v8 = [v6 BOOLValue];
LABEL_8:
      sqlite3_bind_int64(a2, 8, v8);
LABEL_9:

      goto LABEL_10;
    case 5:
      sqlite3_bind_null(a2, 7);
      sqlite3_bind_null(a2, 8);
      id v9 = [v12 dateValue];
      HDSQLiteBindFoundationValueToStatement();

      goto LABEL_11;
    case 6:
      sqlite3_bind_null(a2, 7);
      sqlite3_bind_null(a2, 8);
      sqlite3_bind_null(a2, 9);
      id v10 = [v12 UUIDValue];
      HDSQLiteBindFoundationValueToStatement();

      goto LABEL_12;
    case 7:
      sqlite3_bind_null(a2, 7);
      sqlite3_bind_null(a2, 8);
      sqlite3_bind_null(a2, 9);
      sqlite3_bind_null(a2, 10);
      id v11 = [v12 dataValue];
      HDSQLiteBindFoundationValueToStatement();

      goto LABEL_13;
    default:
      sqlite3_bind_null(a2, 7);
LABEL_4:
      sqlite3_bind_null(a2, 8);
LABEL_10:
      sqlite3_bind_null(a2, 9);
LABEL_11:
      sqlite3_bind_null(a2, 10);
LABEL_12:
      sqlite3_bind_null(a2, 11);
LABEL_13:

      return;
  }
}

__CFString *__144__HDUserDomainConceptPropertyEntity__enumerateConceptPropertyRowsWithUserDomainConceptID_propertyCategory_transaction_error_enumerationHandler___block_invoke()
{
  return @"SELECT property_type, version, timestamp, value_type, string_value, number_value, date_value, uuid_value, data_value FROM user_domain_concept_properties WHERE (udc_id = ? AND category = ?) ORDER BY ROWID";
}

uint64_t __144__HDUserDomainConceptPropertyEntity__enumerateConceptPropertyRowsWithUserDomainConceptID_propertyCategory_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
  sqlite3_int64 v4 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v4);
}

uint64_t __142__HDUserDomainConceptPropertyEntity__enumerateConceptPropertiesWithUserDomainConceptID_propertyCategory_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsInt64();
  uint64_t v3 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDouble();
  double v5 = v4;
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  double v7 = [MEMORY[0x1E4F1CA98] null];
  switch(v6)
  {
    case 1:
      uint64_t v8 = HDSQLiteColumnWithNameAsString();
      goto LABEL_9;
    case 2:
      id v9 = NSNumber;
      HDSQLiteColumnWithNameAsDouble();
      uint64_t v8 = objc_msgSend(v9, "numberWithDouble:");
      goto LABEL_9;
    case 3:
      uint64_t v8 = [NSNumber numberWithInteger:HDSQLiteColumnWithNameAsInt64()];
      goto LABEL_9;
    case 4:
      uint64_t v8 = [NSNumber numberWithBool:HDSQLiteColumnWithNameAsBoolean()];
      goto LABEL_9;
    case 5:
      uint64_t v8 = HDSQLiteColumnWithNameAsDate();
      goto LABEL_9;
    case 6:
      uint64_t v8 = HDSQLiteColumnWithNameAsUUID();
      goto LABEL_9;
    case 7:
      uint64_t v8 = HDSQLiteColumnWithNameAsData();
LABEL_9:
      id v10 = (void *)v8;

      double v7 = v10;
      break;
    default:
      break;
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F2B638]) initWithType:v2 version:v3 timestamp:v6 valueType:v7 value:v5];
  uint64_t v12 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v12;
}

@end