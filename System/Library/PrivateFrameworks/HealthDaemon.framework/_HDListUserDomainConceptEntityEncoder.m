@interface _HDListUserDomainConceptEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDListUserDomainConceptEntityEncoder

- (id)orderedProperties
{
  v2 = [(HDEntityEncoder *)self superclassEncoder];
  v3 = [v2 orderedProperties];
  v4 = [&unk_1F17EA3F8 arrayByAddingObjectsFromArray:v3];

  return v4;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B148]) _initBareObject];

  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    uint64_t v13 = HDSQLiteColumnWithNameAsInt64();
    v14 = HDSQLiteColumnWithNameAsString();
    [v10 _setListType:v13];
    [v10 _setListName:v14];
  }
  return v12;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v5 = objc_alloc_init(HDCodableListUserDomainConcept);
  [(HDCodableListUserDomainConcept *)v5 setType:HDSQLiteColumnWithNameAsInt64()];
  v6 = HDSQLiteColumnWithNameAsString();
  [(HDCodableListUserDomainConcept *)v5 setName:v6];

  return v5;
}

@end