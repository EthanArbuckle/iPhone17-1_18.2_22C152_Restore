@interface _HDScoredAssessmentEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)orderedProperties;
@end

@implementation _HDScoredAssessmentEntityEncoder

- (id)orderedProperties
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"score";
  v8[1] = @"answers";
  v8[2] = @"risk";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  int v9 = HDSQLiteColumnWithName();
  if (MEMORY[0x1C1879FC0](a4, v9))
  {
    v10 = 0;
  }
  else
  {
    v10 = [MEMORY[0x1E4F2B448] dataTypeWithCode:HDSQLiteColumnAsInt64()];
  }
  v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "dataObjectClass")), "_init");
  if ([(_HDScoredAssessmentEntityEncoder *)self applyPropertiesToObject:v11 persistentID:a3 row:a4 error:a5])
  {
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v8 = [(HDEntityEncoder *)self superclassEncoder];
  int v9 = [v8 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableScoredAssessment);
    [(HDCodableScoredAssessment *)v10 setSample:v9];
    [(HDCodableScoredAssessment *)v10 setScore:HDSQLiteColumnWithNameAsInt64()];
    v11 = HDSQLiteColumnWithNameAsData();
    [(HDCodableScoredAssessment *)v10 setAnswers:v11];

    [(HDCodableScoredAssessment *)v10 setRisk:HDSQLiteColumnWithNameAsInt64()];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = [(HDEntityEncoder *)self superclassEncoder];
  LODWORD(a6) = [v10 applyPropertiesToObject:v9 persistentID:a4 row:a5 error:a6];

  if (a6)
  {
    [v9 _setScore:(int)HDSQLiteColumnWithNameAsInt64()];
    a6 = (id *)MEMORY[0x1E4F28DC0];
    uint64_t v12 = objc_opt_class();
    v13 = HDSQLiteColumnWithNameAsData();
    uint64_t v16 = 0;
    v14 = [a6 unarchivedArrayOfObjectsOfClass:v12 fromData:v13 error:&v16];

    LOBYTE(a6) = v14 != 0;
    if (v14)
    {
      [v9 _setAnswers:v14];
      [v9 _setRisk:HDSQLiteColumnWithNameAsInt64()];
    }
  }
  return (char)a6;
}

@end