@interface HDCloudSyncPullSequenceOperation
+ (BOOL)shouldLogAtOperationStart;
- (BOOL)hasAppliedChange;
- (HDCloudSyncPullSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncPullSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5 sequence:(id)a6 changes:(id)a7;
- (HDCloudSyncSequenceRecord)sequenceRecord;
- (HDCloudSyncTarget)target;
- (void)main;
@end

@implementation HDCloudSyncPullSequenceOperation

- (HDCloudSyncPullSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncPullSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5 sequence:(id)a6 changes:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncPullSequenceOperation;
  v16 = [(HDCloudSyncOperation *)&v21 initWithConfiguration:a3 cloudState:a4];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_target, a5);
    objc_storeStrong((id *)&v17->_sequenceRecord, a6);
    uint64_t v18 = [v15 copy];
    changeRecords = v17->_changeRecords;
    v17->_changeRecords = (NSArray *)v18;
  }
  return v17;
}

- (void)main
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncOperation *)self progress];
  [v3 setTotalUnitCount:0];

  _HKInitializeLogging();
  v4 = (os_log_t *)MEMORY[0x1E4F29FA8];
  v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    changeRecords = self->_changeRecords;
    v7 = v5;
    *(_DWORD *)buf = 138543618;
    *(void *)v42 = self;
    *(_WORD *)&v42[8] = 2048;
    *(void *)&v42[10] = [(NSArray *)changeRecords count];
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning pull for sequence with %ld required record(s).", buf, 0x16u);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = self->_changeRecords;
  uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        _HKInitializeLogging();
        os_log_t v14 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = v14;
          [v13 recordID];
          v17 = v16 = v4;
          uint64_t v18 = [v13 decodedSyncAnchorRangeMap];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v42 = v10;
          *(_WORD *)&v42[4] = 2114;
          *(void *)&v42[6] = v17;
          *(_WORD *)&v42[14] = 2114;
          *(void *)&v42[16] = v18;
          _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "\t%02d: %{public}@: %{public}@", buf, 0x1Cu);

          v4 = v16;
          ++v10;
        }
      }
      uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v9);
  }

  v19 = [HDCloudSyncCompoundOperation alloc];
  v20 = [(HDCloudSyncOperation *)self configuration];
  objc_super v21 = [(HDCloudSyncCompoundOperation *)v19 initWithConfiguration:v20 cloudState:0 name:@"Pull Changes" continueOnSubOperationError:0];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obja = self->_changeRecords;
  uint64_t v22 = [(NSArray *)obja countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(obja);
        }
        uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        v27 = [HDCloudSyncPullChangeRecordOperation alloc];
        v28 = [(HDCloudSyncOperation *)self configuration];
        v29 = [(HDCloudSyncPullChangeRecordOperation *)v27 initWithConfiguration:v28 cloudState:0 target:self->_target sequenceRecord:self->_sequenceRecord changeRecord:v26];

        [(HDCloudSyncCompoundOperation *)v21 addOperation:v29 transitionHandler:0];
      }
      uint64_t v23 = [(NSArray *)obja countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v23);
  }

  [(HDCloudSyncOperation *)self delegateToOperation:v21];
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (HDCloudSyncTarget)target
{
  return self->_target;
}

- (HDCloudSyncSequenceRecord)sequenceRecord
{
  return self->_sequenceRecord;
}

- (BOOL)hasAppliedChange
{
  return self->_hasAppliedChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceRecord, 0);
  objc_storeStrong((id *)&self->_target, 0);

  objc_storeStrong((id *)&self->_changeRecords, 0);
}

@end