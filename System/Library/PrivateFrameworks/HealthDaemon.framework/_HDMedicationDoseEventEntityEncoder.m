@interface _HDMedicationDoseEventEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDMedicationDoseEventEntityEncoder

- (id)orderedProperties
{
  v8[8] = *MEMORY[0x1E4F143B8];
  v8[0] = @"log_origin";
  v8[1] = @"schedule_item_identifier";
  v8[2] = @"medication_uuid";
  v8[3] = @"medication_identifier";
  v8[4] = @"scheduled_dose_quantity";
  v8[5] = @"dose_quantity";
  v8[6] = @"scheduled_date";
  v8[7] = @"status";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:8];
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
    v10 = objc_alloc_init(HDCodableMedicationDoseEvent);
    [(HDCodableMedicationDoseEvent *)v10 setSample:v9];
    [(HDCodableMedicationDoseEvent *)v10 setLogOrigin:HDSQLiteColumnWithNameAsInt64()];
    [(HDCodableMedicationDoseEvent *)v10 setStatus:HDSQLiteColumnWithNameAsInt64()];
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v11 = HDSQLiteColumnWithNameAsString();
      [(HDCodableMedicationDoseEvent *)v10 setScheduleItemIdentifier:v11];
    }
    v12 = HDSQLiteColumnWithNameAsUUID();
    v13 = objc_msgSend(v12, "hk_dataForUUIDBytes");
    [(HDCodableMedicationDoseEvent *)v10 setMedicationUuid:v13];

    v14 = HDSQLiteColumnWithNameAsString();
    [(HDCodableMedicationDoseEvent *)v10 setMedicationIdentifier:v14];

    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableMedicationDoseEvent setScheduledDoseQuantity:](v10, "setScheduledDoseQuantity:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableMedicationDoseEvent setDoseQuantity:](v10, "setDoseQuantity:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableMedicationDoseEvent setScheduledDate:](v10, "setScheduledDate:");
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
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B1F0]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    [v10 _setLogOrigin:HDSQLiteColumnWithNameAsInt64()];
    [v10 _setStatus:HDSQLiteColumnWithNameAsInt64()];
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v13 = HDSQLiteColumnWithNameAsString();
      [v10 _setScheduleItemIdentifier:v13];
    }
    v14 = HDSQLiteColumnWithNameAsUUID();
    [v10 _setMedicationUUID:v14];

    v15 = HDSQLiteColumnWithNameAsString();
    [v10 _setMedicationIdentifier:v15];

    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v16 = HDSQLiteColumnWithNameAsNumber();
      [v10 _setScheduledDoseQuantity:v16];
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v17 = HDSQLiteColumnWithNameAsNumber();
      [v10 _setDoseQuantity:v17];
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v18 = HDSQLiteColumnWithNameAsDate();
      [v10 _setScheduledDate:v18];
    }
  }

  return v12;
}

@end