@interface _HDSourceEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDSourceEncoder

- (id)orderedProperties
{
  v8[10] = *MEMORY[0x1E4F143B8];
  v2 = [(HDEntityEncoder *)self purpose];
  if (v2 == (void *)1)
  {
    v7[0] = @"name";
    v7[1] = @"source_options";
    v7[2] = @"local_device";
    v7[3] = @"product_type";
    v7[4] = @"mod_date";
    v7[5] = @"logical_source_id";
    v7[6] = @"logical_sources.bundle_id";
    v7[7] = @"logical_sources.owner_bundle_id";
    v3 = (void *)MEMORY[0x1E4F1C978];
    v4 = v7;
    uint64_t v5 = 8;
  }
  else
  {
    if (v2) {
      goto LABEL_6;
    }
    v8[0] = @"uuid";
    v8[1] = @"name";
    v8[2] = @"source_options";
    v8[3] = @"product_type";
    v8[4] = @"deleted";
    v8[5] = @"mod_date";
    v8[6] = @"logical_source_id";
    v8[7] = @"sync_identity";
    v8[8] = @"logical_sources.bundle_id";
    v8[9] = @"logical_sources.owner_bundle_id";
    v3 = (void *)MEMORY[0x1E4F1C978];
    v4 = v8;
    uint64_t v5 = 10;
  }
  v2 = [v3 arrayWithObjects:v4 count:v5];
LABEL_6:

  return v2;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v6 = objc_alloc_init(HDCodableSource);
  v7 = HDSQLiteColumnWithNameAsData();
  [(HDCodableSource *)v6 setUuid:v7];

  v8 = HDSQLiteColumnWithNameAsString();
  [(HDCodableSource *)v6 setName:v8];

  v9 = HDSQLiteColumnWithNameAsString();
  [(HDCodableSource *)v6 setProductType:v9];

  [(HDCodableSource *)v6 setDeleted:HDSQLiteColumnWithNameAsBoolean()];
  uint64_t v10 = HDSQLiteColumnWithNameAsInt64();
  if (v10) {
    [(HDCodableSource *)v6 setOptions:v10];
  }
  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableSource setModificationDate:](v6, "setModificationDate:");
  v11 = HDSQLiteColumnWithNameAsString();
  if (v11)
  {
    [(HDCodableSource *)v6 setBundleIdentifier:v11];
    v12 = HDSQLiteColumnWithNameAsString();
    if (v12) {
      [(HDCodableSource *)v6 setOwningAppBundleIdentifier:v12];
    }
    v13 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 1401, @"Bundle identifier not present in Source codable");
    v13 = 0;
  }

  return v13;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B560]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v9 = a3;
  uint64_t v10 = [(HDEntityEncoder *)self superclassEncoder];

  if (v10)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDSourceEntity.m", 855, @"Invalid parameter not satisfying: %@", @"[self superclassEncoder] == nil" object file lineNumber description];
  }
  v11 = HDSQLiteColumnWithNameAsString();
  [v9 _setName:v11];

  [v9 _setOptions:HDSQLiteColumnWithNameAsInt64()];
  [v9 _setLocalDevice:HDSQLiteColumnWithNameAsBoolean()];
  v12 = HDSQLiteColumnWithNameAsString();
  [v9 _setProductType:v12];

  v13 = [NSNumber numberWithLongLong:a4];
  [v9 _setSourceID:v13];

  v14 = HDSQLiteColumnWithNameAsString();
  [v9 _setBundleIdentifier:v14];

  v15 = HDSQLiteColumnWithNameAsString();
  [v9 _setOwningAppBundleIdentifier:v15];

  v16 = HDSQLiteColumnWithNameAsDate();
  [v9 _setModificationDate:v16];

  return 1;
}

@end