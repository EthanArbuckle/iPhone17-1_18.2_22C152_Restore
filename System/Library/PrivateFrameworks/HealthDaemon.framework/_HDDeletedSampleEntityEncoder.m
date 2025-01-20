@interface _HDDeletedSampleEntityEncoder
+ (int64_t)estimatedEncodedSize;
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)orderedProperties;
@end

@implementation _HDDeletedSampleEntityEncoder

- (id)orderedProperties
{
  v4[9] = *MEMORY[0x1E4F143B8];
  v4[0] = @"uuid";
  v4[1] = @"creation_date";
  v4[2] = @"provenance";
  v4[3] = @"data_type";
  v4[4] = @"start_date";
  v4[5] = @"end_date";
  v4[6] = @"external_sync_ids.sid";
  v4[7] = @"external_sync_ids.version";
  v4[8] = @"external_sync_ids.object_code";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:9];

  return v2;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v6 = objc_alloc_init(HDCodableHealthObject);
  v7 = +[HDDeletedSampleEntity _externalSyncMetadataForRow:]();
  v8 = objc_msgSend(v7, "hk_codableMetadata");
  [(HDCodableHealthObject *)v6 setMetadataDictionary:v8];

  v9 = HDSQLiteColumnWithNameAsData();
  [(HDCodableHealthObject *)v6 setUuid:v9];

  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableHealthObject setCreationDate:](v6, "setCreationDate:");
  if ((HDSQLiteColumnWithNameIsNull() & 1) == 0) {
    [(HDCodableHealthObject *)v6 setExternalSyncObjectCode:HDSQLiteColumnWithNameAsInt64()];
  }
  v10 = objc_alloc_init(HDCodableSample);
  [(HDCodableSample *)v10 setObject:v6];
  [(HDCodableSample *)v10 setDataType:HDSQLiteColumnWithNameAsInt64()];
  uint64_t v11 = (int)HDSQLiteColumnWithName();
  if ((MEMORY[0x1C1879FC0](a4, v11) & 1) == 0)
  {
    MEMORY[0x1C1879F40](a4, v11);
    -[HDCodableSample setStartDate:](v10, "setStartDate:");
  }
  uint64_t v12 = (int)HDSQLiteColumnWithName();
  if ((MEMORY[0x1C1879FC0](a4, v12) & 1) == 0)
  {
    MEMORY[0x1C1879F40](a4, v12);
    -[HDCodableSample setEndDate:](v10, "setEndDate:");
  }
  v13 = objc_alloc_init(HDCodableDeletedSample);
  [(HDCodableDeletedSample *)v13 setSample:v10];

  return v13;
}

+ (int64_t)estimatedEncodedSize
{
  return 100;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v5 = HDSQLiteColumnWithNameAsUUID();
  v6 = (void *)MEMORY[0x1E4F2AEF0];
  v7 = +[HDDeletedSampleEntity _externalSyncMetadataForRow:]();
  v8 = [v6 _deletedObjectWithUUID:v5 metadata:v7];

  return v8;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = [(HDEntityEncoder *)self superclassEncoder];
  LOBYTE(a6) = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  return (char)a6;
}

@end