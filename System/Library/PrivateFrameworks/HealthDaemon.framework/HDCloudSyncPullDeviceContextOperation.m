@interface HDCloudSyncPullDeviceContextOperation
- (BOOL)performWithError:(id *)a3;
- (HDCloudSyncPullDeviceContextOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncPullDeviceContextOperation)initWithConfiguration:(id)a3 container:(id)a4;
@end

@implementation HDCloudSyncPullDeviceContextOperation

- (HDCloudSyncPullDeviceContextOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncPullDeviceContextOperation)initWithConfiguration:(id)a3 container:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncPullDeviceContextOperation;
  v8 = [(HDCloudSyncOperation *)&v11 initWithConfiguration:a3 cloudState:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_container, a4);
  }

  return v9;
}

- (BOOL)performWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v5 = [(HDCloudSyncOperation *)self configuration];
  uint64_t v6 = [v5 cachedCloudState];
  id v7 = [(CKContainer *)self->_container containerIdentifier];
  id v26 = 0;
  v8 = [v6 contextSyncZoneForContainerID:v7 error:&v26];
  id v9 = v26;

  if (v8)
  {
    v10 = [HDIngestDeviceContextsOperation alloc];
    objc_super v11 = [(HDCloudSyncOperation *)self configuration];
    v12 = [v11 accessibilityAssertion];
    v13 = [(CKContainer *)self->_container containerIdentifier];
    v14 = [(HDIngestDeviceContextsOperation *)v10 initWithAccessibilityAssertion:v12 containerIdentifier:v13];

    v15 = [(HDCloudSyncOperation *)self profile];
    BOOL v16 = [(HDJournalableOperation *)v14 performOrJournalWithProfile:v15 error:a3];

    if (v16)
    {
      if ([(HDJournalableOperation *)v14 didJournal])
      {
        _HKInitializeLogging();
        v17 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          v19 = [(HDCloudSyncOperation *)self profile];
          v20 = [(CKContainer *)self->_container containerIdentifier];
          *(_DWORD *)buf = 138543874;
          v28 = self;
          __int16 v29 = 2114;
          v30 = v19;
          __int16 v31 = 2114;
          v32 = v20;
          _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Journaled key value entries for profile: %{public}@, container identifier: %{public}@", buf, 0x20u);
        }
      }
    }
  }
  else if (v9)
  {
    if (a3)
    {
      LOBYTE(v16) = 0;
      *a3 = v9;
    }
    else
    {
      _HKLogDroppedError();
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    v22 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      container = self->_container;
      v24 = v22;
      v25 = [(CKContainer *)container containerIdentifier];
      *(_DWORD *)buf = 138412290;
      v28 = v25;
      _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "Context sync zone not present for container identifier: %@", buf, 0xCu);
    }
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (void).cxx_destruct
{
}

@end