@interface _HDSampleEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDSampleEntityEncoder

- (id)orderedProperties
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"data_type";
  v8[1] = @"start_date";
  v8[2] = @"end_date";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v8 = [(HDEntityEncoder *)self superclassEncoder];
  v9 = [v8 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableSample);
    [(HDCodableSample *)v10 setObject:v9];
    [(HDCodableSample *)v10 setDataType:HDSQLiteColumnWithNameAsInt64()];
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableSample setStartDate:](v10, "setStartDate:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableSample setEndDate:](v10, "setEndDate:");
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B420]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "_setStartTimestamp:");
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "_setEndTimestamp:");
    int v13 = HDSQLiteColumnWithName();
    if (MEMORY[0x1C1879FC0](a5, v13))
    {
      v14 = 0;
    }
    else
    {
      v14 = [MEMORY[0x1E4F2B448] dataTypeWithCode:HDSQLiteColumnAsInt64()];
    }
    [v10 _setSampleType:v14];
  }
  return v12;
}

@end