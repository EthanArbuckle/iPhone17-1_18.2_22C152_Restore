@interface _HDAccountOwnerEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDAccountOwnerEntityEncoder

- (id)orderedProperties
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"name";
  v8[1] = @"birth_date";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2AB80]) _init];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    v13 = HDSQLiteColumnWithNameAsString();
    [v10 _setName:v13];
    objc_opt_class();
    v14 = HDSQLiteColumnWithNameAsObject();
    [v10 _setBirthDate:v14];
  }
  return v12;
}

@end