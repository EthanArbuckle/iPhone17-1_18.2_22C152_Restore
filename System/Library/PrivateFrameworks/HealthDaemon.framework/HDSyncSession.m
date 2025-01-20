@interface HDSyncSession
- (BOOL)requiresSyncForChangesFromAnchorRangeMap:(id)a3;
- (BOOL)shouldOverrideCycleTrackingSymptomsForBackwardsCompatibilty;
- (BOOL)syncDidBeginWithProfile:(id)a3 error:(id *)a4;
- (BOOL)transactionDidEndWithError:(id *)a3;
- (HDAssertion)databaseAccessibilityAssertion;
- (HDSyncPredicate)syncPredicate;
- (HDSyncSession)init;
- (HDSyncSession)initWithSyncStore:(id)a3 reason:(id)a4 delegate:(id)a5;
- (HDSyncSessionDelegate)delegate;
- (HDSyncStore)syncStore;
- (NSCalendar)calendar;
- (NSDate)startDate;
- (NSString)reason;
- (NSString)shortSessionIdentifier;
- (NSUUID)sessionUUID;
- (double)databaseAccessibilityTimeout;
- (id)description;
- (id)excludedSyncIdentities;
- (id)excludedSyncStores;
- (id)newChangeWithSyncEntityClass:(Class)a3 version:(id)a4;
- (int64_t)maxEncodedBytesPerChangeSetForSyncEntityClass:(Class)a3;
- (int64_t)maxEncodedBytesPerCodableChangeForSyncEntityClass:(Class)a3;
- (void)sendChanges:(id)a3 completion:(id)a4;
- (void)setDatabaseAccessibilityAssertion:(id)a3;
- (void)setDatabaseAccessibilityTimeout:(double)a3;
- (void)syncDidFinishWithSuccess:(BOOL)a3 error:(id)a4;
- (void)syncWillBegin;
- (void)willSyncAnchorRanges:(id)a3;
@end

@implementation HDSyncSession

- (HDSyncStore)syncStore
{
  return self->_syncStore;
}

- (void)syncWillBegin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained syncSessionWillBegin:self];
}

- (void)syncDidFinishWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained syncSession:self didFinishSuccessfully:v4 error:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_shortSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_syncStore, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NSUUID *)self->_sessionUUID UUIDString];
  v6 = [v3 stringWithFormat:@"<%@:%p uuid:%@ reason:\"%@\">", v4, self, v5, self->_reason];

  return v6;
}

- (BOOL)syncDidBeginWithProfile:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)excludedSyncStores
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HDSyncSession *)self syncStore];
  uint64_t v4 = [v2 setWithObject:v3];

  return v4;
}

- (void)sendChanges:(id)a3 completion:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained syncSession:self sendChanges:v8 completion:v7];
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (HDSyncSession)initWithSyncStore:(id)a3 reason:(id)a4 delegate:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"HDSyncSession.m", 30, @"Invalid parameter not satisfying: %@", @"syncStore != nil" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)HDSyncSession;
  v13 = [(HDSyncSession *)&v29 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v12);
    objc_storeStrong((id *)&v14->_syncStore, a3);
    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    sessionUUID = v14->_sessionUUID;
    v14->_sessionUUID = (NSUUID *)v15;

    v17 = [(NSUUID *)v14->_sessionUUID UUIDString];
    uint64_t v18 = [v17 substringToIndex:4];
    shortSessionIdentifier = v14->_shortSessionIdentifier;
    v14->_shortSessionIdentifier = (NSString *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v14->_startDate;
    v14->_startDate = (NSDate *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    calendar = v14->_calendar;
    v14->_calendar = (NSCalendar *)v22;

    uint64_t v24 = [v11 copy];
    reason = v14->_reason;
    v14->_reason = (NSString *)v24;

    databaseAccessibilityAssertion = v14->_databaseAccessibilityAssertion;
    v14->_databaseAccessibilityAssertion = 0;
    v14->_databaseAccessibilityTimeout = 30.0;
  }
  return v14;
}

- (HDSyncSession)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDSyncPredicate)syncPredicate
{
  v3 = [HDSyncPredicate alloc];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDSyncStore syncProvenance](self->_syncStore, "syncProvenance"));
  v6 = [v4 setWithObject:v5];
  id v7 = [(HDSyncPredicate *)v3 initWithExcludedSyncProvenances:v6 dateInterval:0 includedObjectTypes:0 defaultMaximumObjectAge:0 defaultMaximumTombstoneAge:0 maximumObjectAgeByType:0];

  return v7;
}

- (void)willSyncAnchorRanges:(id)a3
{
  id v4 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  id v5 = objc_loadWeakRetained(&to);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained(&to);
    [v7 syncSession:self willSyncAnchorRanges:v4];
  }
  objc_destroyWeak(&to);
}

- (BOOL)transactionDidEndWithError:(id *)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    char v10 = [v9 syncSession:self didEndTransactionWithError:a3];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = objc_opt_class();
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    v13 = NSStringFromSelector(sel_syncSession_didEndTransactionWithError_);
    objc_msgSend(v11, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v12, a2, @"%@ does not respond to selector %@"", v9, v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (a3) {
        *a3 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }

    char v10 = 0;
  }

  return v10;
}

- (BOOL)requiresSyncForChangesFromAnchorRangeMap:(id)a3
{
  return 1;
}

- (id)excludedSyncIdentities
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)shouldOverrideCycleTrackingSymptomsForBackwardsCompatibilty
{
  return 0;
}

- (id)newChangeWithSyncEntityClass:(Class)a3 version:(id)a4
{
  return 0;
}

- (int64_t)maxEncodedBytesPerCodableChangeForSyncEntityClass:(Class)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)maxEncodedBytesPerChangeSetForSyncEntityClass:(Class)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (HDSyncSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSyncSessionDelegate *)WeakRetained;
}

- (NSString)shortSessionIdentifier
{
  return self->_shortSessionIdentifier;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSString)reason
{
  return self->_reason;
}

- (HDAssertion)databaseAccessibilityAssertion
{
  return self->_databaseAccessibilityAssertion;
}

- (void)setDatabaseAccessibilityAssertion:(id)a3
{
}

- (double)databaseAccessibilityTimeout
{
  return self->_databaseAccessibilityTimeout;
}

- (void)setDatabaseAccessibilityTimeout:(double)a3
{
  self->_databaseAccessibilityTimeout = a3;
}

@end