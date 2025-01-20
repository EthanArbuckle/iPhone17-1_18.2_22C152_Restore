@interface HDBinarySampleEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)isConcreteEntity;
+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
@end

@implementation HDBinarySampleEntity

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDBinarySampleEntity.m", 56, @"Subclasses must override %s", "+[HDBinarySampleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __86__HDBinarySampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v25[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v25[4] = a1;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__HDBinarySampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2;
  v22[3] = &unk_1E62F2900;
  id v23 = v14;
  id v24 = v12;
  id v16 = v12;
  id v17 = v14;
  if ([v13 executeCachedStatementForKey:&insertDataObject_withProvenance_inDatabase_persistentID_error__insertKey error:a7 SQLGenerator:v25 bindingHandler:v22 enumerationHandler:0])v18 = v17; {
  else
  }
    v18 = 0;
  id v19 = v18;

  return v19;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addBinarySamples:a3];
  }
  return a3 != 0;
}

+ (id)databaseTable
{
  return @"binary_samples";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"data_id";
  v2 = +[HDDataEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id __86__HDBinarySampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"INSERT INTO %@ (%@, %@) VALUES (?, ?)", v2, @"data_id", @"payload", 0];

  return v3;
}

void __86__HDBinarySampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
  id v4 = [*(id *)(a1 + 40) payload];
  v3 = _HDSQLiteValueForData();
  HDSQLiteBindFoundationValueToStatement();
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 binarySamples];
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[_HDBinarySampleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F2B2C0];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 _allTypesOfClass:objc_opt_class()];
  LOBYTE(a4) = [a1 validateEntitiesOfTypes:v11 profile:v10 error:a4 validationErrorHandler:v9];

  return (char)a4;
}

@end