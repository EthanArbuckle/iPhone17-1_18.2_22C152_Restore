@interface _HDECGSampleEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDECGSampleEntityEncoder

- (id)orderedProperties
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"private_classification";
  v8[1] = @"average_heart_rate";
  v8[2] = @"voltage_payload";
  v8[3] = @"symptoms_status";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
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
    v10 = objc_alloc_init(HDCodableECGSample);
    [(HDCodableECGSample *)v10 setSample:v9];
    [(HDCodableECGSample *)v10 setPrivateClassification:HDSQLiteColumnWithNameAsInt64()];
    v11 = HDSQLiteColumnWithNameAsData();
    [(HDCodableECGSample *)v10 setVoltagePayload:v11];

    [(HDCodableECGSample *)v10 setSymptomsStatus:HDSQLiteColumnWithNameAsInt64()];
    uint64_t v12 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1C1879FC0](a4, v12) & 1) == 0)
    {
      MEMORY[0x1C1879F40](a4, v12);
      -[HDCodableECGSample setAverageHeartRateInBPM:](v10, "setAverageHeartRateInBPM:");
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
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2AF88]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    [v10 _setPrivateClassification:HDSQLiteColumnWithNameAsInt64()];
    v13 = HDSQLiteColumnWithNameAsData();
    [v10 _setPayload:v13];

    [v10 _setSymptomsStatus:HDSQLiteColumnWithNameAsInt64()];
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E4F2B370];
      v15 = [MEMORY[0x1E4F2B618] _countPerMinuteUnit];
      HDSQLiteColumnWithNameAsDouble();
      v16 = objc_msgSend(v14, "quantityWithUnit:doubleValue:", v15);
      [v10 _setAverageHeartRate:v16];
    }
  }

  return v12;
}

@end