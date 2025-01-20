@interface _HDMedicationUserDomainConceptEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDMedicationUserDomainConceptEntityEncoder

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F66B80]) _initBareObject];
  return v3;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  LODWORD(a5) = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (a5)
  {
    v12 = [(HDEntityEncoder *)self transaction];
    BOOL v13 = +[HDUserDomainConceptEntity retrievePrivateDataEntitiesForUserDomainConcept:v10 persistentID:a4 transaction:v12 error:a6];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)orderedProperties
{
  v2 = [(HDEntityEncoder *)self superclassEncoder];
  v3 = [v2 orderedProperties];

  return v3;
}

@end