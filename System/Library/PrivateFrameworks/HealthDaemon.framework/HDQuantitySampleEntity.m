@interface HDQuantitySampleEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)joinClausesForProperty:(id)a3;
+ (id)orderingTermForSortDescriptor:(id)a3;
+ (int64_t)compareForReplacmentWithObject:(id)a3 existingObject:(id)a4;
@end

@implementation HDQuantitySampleEntity

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a3;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDQuantitySampleEntity.m", 89, @"Subclasses must override %s", "+[HDQuantitySampleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v16 = [v14 quantity];
  v17 = [v16 _unit];
  v18 = [v14 quantityType];

  v19 = [v18 canonicalUnit];

  char v20 = [v17 isEqual:v19];
  if (v20)
  {
    v21 = 0;
LABEL_6:
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __88__HDQuantitySampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
    v29[3] = &unk_1E630F028;
    id v23 = v13;
    id v30 = v23;
    id v31 = v16;
    id v32 = v19;
    char v35 = v20;
    id v33 = v17;
    id v34 = v21;
    id v24 = v21;
    if ([v12 executeSQL:@"INSERT INTO quantity_samples (data_id, quantity, original_quantity, original_unit) VALUES (?, ?, ?, ?)", a7, v29, 0 error bindingHandler enumerationHandler])v25 = v23; {
    else
    }
      v25 = 0;
    id v26 = v25;

    goto LABEL_10;
  }
  v22 = [v17 unitString];
  v21 = +[HDUnitStringEntity storeUnitString:v22 database:v12 error:a7];

  if (v21) {
    goto LABEL_6;
  }
  id v26 = 0;
LABEL_10:

  return v26;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"unit_strings.unit_string"])
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v6 = (void *)MEMORY[0x1E4F65D38];
    v7 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    v8 = [v6 leftJoinClauseFromTable:v7 toTargetEntity:objc_opt_class() as:@"unit_strings" localReference:@"original_unit" targetKey:*MEMORY[0x1E4F65C70]];
    v9 = [v5 setWithObject:v8];
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleEntity;
    v9 = objc_msgSendSuper2(&v11, sel_joinClausesForProperty_, v4);
  }

  return v9;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addQuantitySamples:a3];
  }
  return a3 != 0;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 quantitySamples];
}

+ (id)databaseTable
{
  return @"quantity_samples";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_109;
}

+ (id)foreignKeys
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"original_unit";
  id v2 = objc_alloc(MEMORY[0x1E4F65D20]);
  v3 = (void *)[v2 initWithEntityClass:objc_opt_class() property:*MEMORY[0x1E4F65C70] deletionAction:0];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [v4 key];
  uint64_t v6 = [v4 ascending];
  if ([v5 isEqualToString:*MEMORY[0x1E4F2A5A8]])
  {
    uint64_t v7 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"quantity" entityClass:objc_opt_class() ascending:v6];
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleEntity;
    uint64_t v7 = objc_msgSendSuper2(&v10, sel_orderingTermForSortDescriptor_, v4);
  }
  v8 = (void *)v7;

  return v8;
}

uint64_t __88__HDQuantitySampleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
  [*(id *)(a1 + 40) doubleValueForUnit:*(void *)(a1 + 48)];
  sqlite3_bind_double(a2, 2, v4);
  if (*(unsigned char *)(a1 + 72))
  {
    sqlite3_bind_null(a2, 3);
    return sqlite3_bind_null(a2, 4);
  }
  else
  {
    [*(id *)(a1 + 40) doubleValueForUnit:*(void *)(a1 + 56)];
    sqlite3_bind_double(a2, 3, v6);
    sqlite3_int64 v7 = [*(id *)(a1 + 64) longLongValue];
    return sqlite3_bind_int64(a2, 4, v7);
  }
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[_HDQuantitySampleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (int64_t)compareForReplacmentWithObject:(id)a3 existingObject:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"HDQuantitySampleEntity.m", 167, @"Invalid parameter not satisfying: %@", @"[replacementObject isKindOfClass:[HKQuantitySample class]]" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HDQuantitySampleEntity.m", 168, @"Invalid parameter not satisfying: %@", @"[existingObject isKindOfClass:[HKQuantitySample class]]" object file lineNumber description];
  }
  int64_t v9 = [v7 _compareFreezeStateWithSample:v8];

  return v9;
}

+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F2B2C0];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 _allTypesOfClass:objc_opt_class()];
  LOBYTE(a4) = [a1 validateEntitiesOfTypes:v11 profile:v10 error:a4 validationErrorHandler:v9];

  return (char)a4;
}

@end