@interface _HDWorkoutZonesSampleEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDWorkoutZonesSampleEntityEncoder

- (id)orderedProperties
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = @"zones";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B810]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    objc_opt_class();
    v13 = HDSQLiteColumnWithNameAsArrayOfClass();
    if (v13)
    {
      [v10 _setZones:v13];
      LOBYTE(v12) = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 129, @"Failed unarchiving zones");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = v14 == 0;
      if (v14)
      {
        if (a6) {
          *a6 = v14;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }

  return v12;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v8 = [(HDEntityEncoder *)self superclassEncoder];
  v9 = [v8 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (v9)
  {
    id v10 = objc_alloc_init(HDCodableWorkoutZones);
    [(HDCodableWorkoutZones *)v10 setSample:v9];
    v11 = HDSQLiteColumnWithNameAsData();
    [(HDCodableWorkoutZones *)v10 setZones:v11];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end