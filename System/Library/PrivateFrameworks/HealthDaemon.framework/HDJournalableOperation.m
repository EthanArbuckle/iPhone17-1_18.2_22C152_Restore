@interface HDJournalableOperation
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (BOOL)didJournal;
- (BOOL)performOrJournalWithProfile:(id)a3 error:(id *)a4;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)transactionContext;
@end

@implementation HDJournalableOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        id v18 = 0;
        char v12 = [v11 performOrJournalWithProfile:v6 error:&v18];
        id v13 = v18;
        if ((v12 & 1) == 0)
        {
          _HKInitializeLogging();
          v14 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v24 = v11;
            __int16 v25 = 2114;
            id v26 = v13;
            _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform during journal merge: %{public}@", buf, 0x16u);
          }
          v15 = [NSString stringWithFormat:@"%@", objc_opt_class()];
          v16 = [v6 daemon];
          v17 = [v16 autoBugCaptureReporter];
          [v17 reportJournalFailureWithErrorDescription:v15 provenance:0 error:v13];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v8);
  }
}

- (BOOL)performOrJournalWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 database];
  uint64_t v8 = [(HDJournalableOperation *)self transactionContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__HDJournalableOperation_performOrJournalWithProfile_error___block_invoke;
  v14[3] = &unk_1E62F2AE0;
  v14[4] = self;
  id v15 = v6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__HDJournalableOperation_performOrJournalWithProfile_error___block_invoke_2;
  v12[3] = &unk_1E62F6C20;
  v12[4] = self;
  id v13 = v15;
  id v9 = v15;
  char v10 = [v7 performTransactionWithContext:v8 error:a4 block:v14 inaccessibilityHandler:v12];

  if ((v10 & 1) == 0) {
    self->_didJournal = 0;
  }

  return v10;
}

uint64_t __60__HDJournalableOperation_performOrJournalWithProfile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) performWithProfile:*(void *)(a1 + 40) transaction:a2 error:a3];
}

uint64_t __60__HDJournalableOperation_performOrJournalWithProfile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  id v5 = [*(id *)(a1 + 40) database];
  uint64_t v6 = [v5 addJournalEntry:*(void *)(a1 + 32) error:a3];

  return v6;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)transactionContext
{
  return +[HDDatabaseTransactionContext contextForWritingProtectedData];
}

- (BOOL)didJournal
{
  return self->_didJournal;
}

@end