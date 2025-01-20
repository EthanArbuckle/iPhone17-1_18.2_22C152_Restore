@interface HDCloudSyncPipelineStageRemoveSharingParticipants
- (BOOL)removeAllParticipants;
- (HDCloudSyncRemoveSharingParticipantsOperation)_delegateToOperationForRemoveSharingParticipants:(void *)a1;
- (NSSet)participantsToRemove;
- (void)main;
- (void)setParticipantsToRemove:(id)a3;
- (void)setRemoveAllParticipants:(BOOL)a3;
@end

@implementation HDCloudSyncPipelineStageRemoveSharingParticipants

- (void)main
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (self->_removeAllParticipants)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v4 = [(HDCloudSyncOperation *)self configuration];
    v5 = [v4 cachedCloudState];
    id v46 = 0;
    v6 = [v5 zonesByIdentifierWithError:&v46];
    id v7 = v46;

    if (v6 || !v7)
    {
      v31 = self;
      id v32 = v7;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v33 = v6;
      obuint64_t j = [v6 allValues];
      uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        id v35 = *(id *)v43;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(id *)v43 != v35) {
              objc_enumerationMutation(obj);
            }
            v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            id v41 = 0;
            v16 = [v15 zoneShareWithError:&v41];
            id v17 = v41;
            v18 = v17;
            if (v16) {
              BOOL v19 = 1;
            }
            else {
              BOOL v19 = v17 == 0;
            }
            if (!v19)
            {
              _HKInitializeLogging();
              v27 = (void *)*MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                v29 = v27;
                v30 = [v15 zoneIdentifier];
                *(_DWORD *)buf = 138543874;
                v49 = v31;
                __int16 v50 = 2114;
                id v51 = v30;
                __int16 v52 = 2114;
                v53 = v18;
                _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch CKShare for cached zone %{public}@, %{public}@", buf, 0x20u);
              }
              [(HDCloudSyncOperation *)v31 finishWithSuccess:0 error:v18];

              goto LABEL_34;
            }
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            v20 = [v16 participants];
            uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v47 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v38;
              do
              {
                for (uint64_t j = 0; j != v22; ++j)
                {
                  if (*(void *)v38 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  v25 = *(void **)(*((void *)&v37 + 1) + 8 * j);
                  if ([v25 role] != 1) {
                    [v3 addObject:v25];
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v47 count:16];
              }
              while (v22);
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      id v26 = -[HDCloudSyncPipelineStageRemoveSharingParticipants _delegateToOperationForRemoveSharingParticipants:](v31, v3);
LABEL_34:
      id v7 = v32;
      v6 = v33;
    }
    else
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v49 = self;
        __int16 v50 = 2114;
        id v51 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
      }
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v7];
    }
  }
  else
  {
    participantsToRemove = self->_participantsToRemove;
    if (participantsToRemove)
    {
      id v11 = -[HDCloudSyncPipelineStageRemoveSharingParticipants _delegateToOperationForRemoveSharingParticipants:](self, participantsToRemove);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForNilArgument:class:selector:", @"_participantsToRemove", objc_opt_class(), a2);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0);
    }
  }
}

- (HDCloudSyncRemoveSharingParticipantsOperation)_delegateToOperationForRemoveSharingParticipants:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    v4 = [HDCloudSyncRemoveSharingParticipantsOperation alloc];
    v5 = [a1 configuration];
    v6 = [a1 cloudState];
    id v7 = [(HDCloudSyncRemoveSharingParticipantsOperation *)v4 initWithConfiguration:v5 cloudState:v6 participantsToRemove:v3];

    [a1 delegateToOperation:v7];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)removeAllParticipants
{
  return self->_removeAllParticipants;
}

- (void)setRemoveAllParticipants:(BOOL)a3
{
  self->_removeAllParticipants = a3;
}

- (NSSet)participantsToRemove
{
  return self->_participantsToRemove;
}

- (void)setParticipantsToRemove:(id)a3
{
}

- (void).cxx_destruct
{
}

@end