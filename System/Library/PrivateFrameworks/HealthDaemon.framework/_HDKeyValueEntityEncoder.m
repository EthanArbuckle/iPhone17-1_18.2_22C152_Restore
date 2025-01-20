@interface _HDKeyValueEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (_HDKeyValueEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)orderedProperties;
@end

@implementation _HDKeyValueEntityEncoder

- (id)orderedProperties
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"key";
  v4[1] = @"value";
  v4[2] = @"mod_date";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v5 = objc_alloc_init(HDCodableTimestampedKeyValuePair);
  v6 = HDSQLiteColumnWithNameAsNaturalType();
  v7 = HDSQLiteColumnWithNameAsNaturalType();
  [(HDCodableTimestampedKeyValuePair *)v5 setKey:v6];
  [(HDCodableTimestampedKeyValuePair *)v5 setValue:v7];
  v8 = HDSQLiteColumnWithNameAsDate();
  [(HDCodableTimestampedKeyValuePair *)v5 setTimestampWithDate:v8];

  return v5;
}

- (_HDKeyValueEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (a6 == 1)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HDKeyValueEntity.m", 1280, @"Invalid parameter not satisfying: %@", @"purpose != HDEntityEncodingPurposeObjectInstantiation" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)_HDKeyValueEntityEncoder;
  v19 = [(HDEntityEncoder *)&v22 initWithHealthEntityClass:a3 profile:v15 transaction:v16 purpose:a6 encodingOptions:v17 authorizationFilter:v18];

  return v19;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2, self, @"HDKeyValueEntity.m", 1316, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];

  return 0;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  [v8 handleFailureInMethod:a2, self, @"HDKeyValueEntity.m", 1325, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];

  return 0;
}

@end