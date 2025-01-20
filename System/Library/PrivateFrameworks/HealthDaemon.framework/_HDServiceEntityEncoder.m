@interface _HDServiceEntityEncoder
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)orderedProperties;
@end

@implementation _HDServiceEntityEncoder

- (id)orderedProperties
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"device_uuid";
  v4[1] = @"device_name";
  v4[2] = @"device_service";
  v4[3] = @"device_last_connect";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];

  return v2;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  unint64_t v5 = HDSQLiteColumnWithNameAsInt64();
  if (v5 > 3)
  {
    v10 = 0;
  }
  else
  {
    unint64_t v6 = v5;
    id v7 = objc_alloc(MEMORY[0x1E4F2B0A8]);
    v8 = HDSQLiteColumnWithNameAsUUID();
    v9 = HDSQLiteColumnWithNameAsString();
    v10 = (void *)[v7 initWithType:v6 identifier:v8 name:v9];

    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v10, "setLastConnection:");
  }

  return v10;
}

@end