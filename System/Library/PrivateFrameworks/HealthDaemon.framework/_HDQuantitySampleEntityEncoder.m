@interface _HDQuantitySampleEntityEncoder
+ (int64_t)estimatedEncodedSize;
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDQuantitySampleEntityEncoder

- (id)orderedProperties
{
  v12[3] = *MEMORY[0x1E4F143B8];
  int64_t v4 = [(HDEntityEncoder *)self purpose];
  if (v4 == 1)
  {
    v11[0] = @"quantity";
    v11[1] = @"original_quantity";
    v11[2] = @"unit_strings.unit_string";
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = v11;
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    v12[0] = @"quantity";
    v12[1] = @"original_quantity";
    v12[2] = @"unit_strings.unit_string";
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = v12;
  }
  v7 = [v5 arrayWithObjects:v6 count:3];
  v8 = [(HDEntityEncoder *)self superclassEncoder];
  v9 = [v8 orderedProperties];
  v2 = [v7 arrayByAddingObjectsFromArray:v9];

LABEL_6:

  return v2;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v8 = [(HDEntityEncoder *)self superclassEncoder];
  v9 = [v8 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableQuantitySample);
    [(HDCodableQuantitySample *)v10 setSample:v9];
    if (HDSQLiteColumnWithNameIsNull())
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableQuantitySample setValueInCanonicalUnit:](v10, "setValueInCanonicalUnit:");
    }
    else
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableQuantitySample setValueInOriginalUnit:](v10, "setValueInOriginalUnit:");
      v11 = HDSQLiteColumnWithNameAsString();
      [(HDCodableQuantitySample *)v10 setOriginalUnitString:v11];
    }
    [(HDCodableQuantitySample *)v10 setFrozen:1];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (int64_t)estimatedEncodedSize
{
  return 150;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B388]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    if (HDSQLiteColumnWithNameIsNull())
    {
      v13 = (void *)MEMORY[0x1E4F2B370];
      v14 = [v10 quantityType];
      [v14 canonicalUnit];
    }
    else
    {
      v14 = HDSQLiteColumnWithNameAsString();
      v13 = (void *)MEMORY[0x1E4F2B370];
      [MEMORY[0x1E4F2B618] unitFromString:v14];
    v15 = };
    HDSQLiteColumnWithNameAsDouble();
    v16 = objc_msgSend(v13, "quantityWithUnit:doubleValue:", v15);

    [v10 _setQuantity:v16];
  }

  return v12;
}

@end