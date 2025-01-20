@interface HDOnboardingCompletionJournalOperation
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (BOOL)performOrJournalWithProfile:(id)a3 error:(id *)a4;
- (HDOnboardingCompletionJournalOperation)initWithCodableOnboardingCompletions:(id)a3 syncProvenance:(int64_t)a4;
- (HDOnboardingCompletionJournalOperation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDOnboardingCompletionJournalOperation

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v19 = 0;
        char v13 = [v12 performOrJournalWithProfile:v6 error:&v19];
        id v14 = v19;
        if ((v13 & 1) == 0)
        {
          _HKInitializeLogging();
          v15 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v25 = v12;
            __int16 v26 = 2114;
            id v27 = v14;
            _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform during journal merge: %{public}@", buf, 0x16u);
          }
          if (objc_msgSend(v14, "hk_isTransactionInterruptedError"))
          {

            goto LABEL_15;
          }
          v16 = [NSString stringWithFormat:@"%@", v12];
          v17 = [v6 daemon];
          v18 = [v17 autoBugCaptureReporter];
          [v18 reportJournalFailureWithErrorDescription:v16 provenance:0 error:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (HDOnboardingCompletionJournalOperation)initWithCodableOnboardingCompletions:(id)a3 syncProvenance:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDOnboardingCompletionJournalOperation;
  uint64_t v8 = [(HDOnboardingCompletionJournalOperation *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_codableOnboardingCompletions, a3);
    v9->_syncProvenance = a4;
  }

  return v9;
}

- (BOOL)performOrJournalWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 onboardingCompletionManager];
  codableOnboardingCompletions = self->_codableOnboardingCompletions;
  int64_t syncProvenance = self->_syncProvenance;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__HDOnboardingCompletionJournalOperation_performOrJournalWithProfile_error___block_invoke;
  v15[3] = &unk_1E62F6C20;
  id v16 = v6;
  v17 = self;
  id v10 = v6;
  objc_super v11 = codableOnboardingCompletions;
  v12 = v11;
  if (v7)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __113__HDOnboardingCompletionManager__insertCodableOnboardingCompletions_syncProvenance_error_inaccessabilityHandler___block_invoke;
    v18[3] = &unk_1E62FB030;
    long long v20 = v7;
    int64_t v21 = syncProvenance;
    id v19 = v11;
    BOOL v13 = -[HDOnboardingCompletionManager _performWriteTransactionAndNotifyObserversWithError:block:inaccessibilityHandler:]((uint64_t)v7, (uint64_t)a4, v18, v15);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __76__HDOnboardingCompletionJournalOperation_performOrJournalWithProfile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) database];
  uint64_t v6 = [v5 addJournalEntry:*(void *)(a1 + 40) error:a3];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  codableOnboardingCompletions = self->_codableOnboardingCompletions;
  id v5 = a3;
  [v5 encodeObject:codableOnboardingCompletions forKey:@"onboardingCompletions"];
  [v5 encodeInt64:self->_syncProvenance forKey:@"syncProvenance"];
}

- (HDOnboardingCompletionJournalOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDOnboardingCompletionJournalOperation;
  id v5 = [(HDJournalEntry *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"onboardingCompletions"];
    codableOnboardingCompletions = v5->_codableOnboardingCompletions;
    v5->_codableOnboardingCompletions = (NSArray *)v9;

    v5->_int64_t syncProvenance = [v4 decodeInt64ForKey:@"syncProvenance"];
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end