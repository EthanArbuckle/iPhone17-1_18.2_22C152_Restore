@interface HDConceptIndexResetOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDConceptIndexResetOperation)init;
- (HDConceptIndexResetOperation)initWithCoder:(id)a3;
@end

@implementation HDConceptIndexResetOperation

- (HDConceptIndexResetOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDConceptIndexResetOperation;
  return [(HDConceptIndexResetOperation *)&v3 init];
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v6 = a3;
  v7 = [v6 database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__HDConceptIndexResetOperation_performWithProfile_transaction_error___block_invoke;
  v10[3] = &unk_1E62F6130;
  id v11 = v6;
  id v8 = v6;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v7 error:a5 block:v10];

  return (char)a5;
}

BOOL __69__HDConceptIndexResetOperation_performWithProfile_transaction_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v14 = 0;
  v7 = +[HDConceptIndexer stateWithProfile:v6 transaction:v5 error:&v14];
  id v8 = v14;
  if (!v8)
  {
    if (+[HDConceptIndexEntity removeAllConceptIndexEntriesWithProfile:*(void *)(a1 + 32) error:a3])
    {
      v10 = [v5 protectedDatabase];
      BOOL v11 = +[HDSQLiteEntity deleteEntitiesInDatabase:v10 predicate:0 error:a3];

      if (v11)
      {
        uint64_t v12 = +[HDConceptIndexState stateWithGeneration:](HDConceptIndexState, "stateWithGeneration:", [v7 generation] + 1);

        BOOL v9 = +[HDConceptIndexer storeState:v12 profile:*(void *)(a1 + 32) transaction:v5 error:a3];
        v7 = (void *)v12;
        goto LABEL_9;
      }
    }
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  if (!a3)
  {
    _HKLogDroppedError();
    goto LABEL_8;
  }
  BOOL v9 = 0;
  *a3 = v8;
LABEL_9:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDConceptIndexResetOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HDConceptIndexResetOperation;
  return [(HDConceptIndexResetOperation *)&v4 init];
}

@end