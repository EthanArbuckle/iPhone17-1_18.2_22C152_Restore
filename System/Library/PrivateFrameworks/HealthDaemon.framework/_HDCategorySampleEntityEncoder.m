@interface _HDCategorySampleEntityEncoder
+ (int64_t)estimatedEncodedSize;
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (_HDCategorySampleEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDCategorySampleEntityEncoder

- (id)orderedProperties
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = @"value";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v9 = [(HDEntityEncoder *)self superclassEncoder];
  v10 = [v9 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (v10)
  {
    v11 = objc_alloc_init(HDCodableCategorySample);
    [(HDCodableCategorySample *)v11 setSample:v10];
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      uint64_t v12 = HDSQLiteColumnWithNameAsInt64();
      uint64_t v13 = v12;
      if (self->_overrideMCCategorySampleValue && (unint64_t)(v10[1] - 157) < 0xF && v12 != 1) {
        uint64_t v13 = 0;
      }
      [(HDCodableCategorySample *)v11 setValue:v13];
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (int64_t)estimatedEncodedSize
{
  return 150;
}

- (_HDCategorySampleEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8
{
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)_HDCategorySampleEntityEncoder;
  v15 = [(HDEntityEncoder *)&v18 initWithHealthEntityClass:a3 profile:a4 transaction:a5 purpose:a6 encodingOptions:v14 authorizationFilter:a8];
  if (v15)
  {
    v16 = [v14 objectForKeyedSubscript:@"OverrideMCCategorySampleValue"];
    v15->_overrideMCCategorySampleValue = [v16 BOOLValue];
  }
  return v15;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2ACB0]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12) {
    [v10 _setValue:HDSQLiteColumnWithNameAsInt64()];
  }

  return v12;
}

@end