@interface ACHEarnedInstanceEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
@end

@implementation ACHEarnedInstanceEntityEncoder

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v5 = [(ACHEarnedInstanceEntityEncoder *)self objectForPersistentID:a3 row:a4 error:a5];
  v6 = ACHCodableFromEarnedInstance();

  return v6;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  id v9 = objc_alloc_init(MEMORY[0x263F236B8]);
  if ([(ACHEarnedInstanceEntityEncoder *)self applyPropertiesToObject:v9 persistentID:a3 row:a4 error:a5])
  {
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v7 = a3;
  [v7 setKey:a4];
  v8 = HDSQLiteColumnWithNameAsString();
  [v7 setTemplateUniqueName:v8];

  id v9 = HDSQLiteColumnWithNameAsDate();
  [v7 setCreatedDate:v9];

  id v10 = HDSQLiteColumnWithNameAsString();
  v11 = ACHYearMonthDayDateComponentsFromString();
  [v7 setEarnedDateComponents:v11];

  [v7 setCreatorDevice:HDSQLiteColumnWithNameAsInt64()];
  if (HDSQLiteColumnWithNameIsNull() & 1) != 0 || (HDSQLiteColumnWithNameIsNull())
  {
    [v7 setValue:0];
  }
  else
  {
    v12 = HDSQLiteColumnWithNameAsString();
    HDSQLiteColumnWithNameAsDouble();
    double v14 = v13;
    v15 = (void *)MEMORY[0x263F0A630];
    v16 = [MEMORY[0x263F0A830] unitFromString:v12];
    v17 = [v15 quantityWithUnit:v16 doubleValue:v14];
    [v7 setValue:v17];
  }
  v18 = HDSQLiteColumnWithNameAsString();
  [v7 setExternalIdentifier:v18];

  return 1;
}

@end