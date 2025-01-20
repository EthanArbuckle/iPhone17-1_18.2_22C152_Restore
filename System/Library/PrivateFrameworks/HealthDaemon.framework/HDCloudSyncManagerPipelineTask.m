@interface HDCloudSyncManagerPipelineTask
- (BOOL)requiresExistingShareOwnerParticipant;
- (HDAssertion)accessibilityAssertion;
- (HDCloudSyncManagerPipelineTask)initWithManager:(id)a3 context:(id)a4;
- (HDCloudSyncManagerPipelineTask)initWithManager:(id)a3 context:(id)a4 accessibilityAssertion:(id)a5 completion:(id)a6;
- (NSArray)pipelines;
- (id)pipelineForRepository:(id)a3;
- (void)callCompletionWithSuccess:(BOOL)a3 error:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)mainWithRepositories:(id)a3 error:(id)a4;
- (void)setAccessibilityAssertion:(id)a3;
- (void)setPipelines:(id)a3;
@end

@implementation HDCloudSyncManagerPipelineTask

- (HDCloudSyncManagerPipelineTask)initWithManager:(id)a3 context:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncManagerPipelineTask)initWithManager:(id)a3 context:(id)a4 accessibilityAssertion:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HDCloudSyncManagerPipelineTask;
  v13 = [(HDCloudSyncManagerRepositoryTask *)&v26 initWithManager:v10 context:a4];
  v14 = v13;
  if (v13)
  {
    v13->_lock._os_unfair_lock_opaque = 0;
    if (v11)
    {
      v15 = [v10 profile];
      v16 = [v15 database];
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      id v25 = 0;
      uint64_t v19 = [v16 cloneAccessibilityAssertion:v11 ownerIdentifier:v18 error:&v25];
      id v20 = v25;
      accessibilityAssertion = v14->_accessibilityAssertion;
      v14->_accessibilityAssertion = (HDAssertion *)v19;
    }
    uint64_t v22 = [v12 copy];
    id completion = v14->_completion;
    v14->_id completion = (id)v22;
  }
  return v14;
}

- (void)dealloc
{
  [(HDAssertion *)self->_accessibilityAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDCloudSyncManagerPipelineTask;
  [(HDCloudSyncManagerPipelineTask *)&v3 dealloc];
}

- (void)mainWithRepositories:(id)a3 error:(id)a4
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    if (v8)
    {
      v54[0] = v8;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
      [(HDCloudSyncManagerPipelineTask *)self didFailWithErrors:v35];
    }
    else
    {
      [(HDCloudSyncManagerPipelineTask *)self didFailWithErrors:MEMORY[0x1E4F1CBF0]];
    }
    v36 = self;
    uint64_t v37 = 0;
    v38 = v9;
    goto LABEL_23;
  }
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __61__HDCloudSyncManagerPipelineTask_mainWithRepositories_error___block_invoke;
  v47[3] = &unk_1E630F050;
  v47[4] = self;
  id v10 = objc_msgSend(v7, "hk_map:", v47);
  [(HDCloudSyncManagerPipelineTask *)self setPipelines:v10];

  id v11 = [(HDCloudSyncManagerPipelineTask *)self pipelines];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    [(HDCloudSyncManagerPipelineTask *)self didFinishWithSuccess];
    v36 = self;
    uint64_t v37 = 1;
    v38 = 0;
LABEL_23:
    [(HDCloudSyncManagerPipelineTask *)v36 callCompletionWithSuccess:v37 error:v38];
    [(HDCloudSyncManagerTask *)self finish];
    goto LABEL_24;
  }
  if ([(HDCloudSyncManagerPipelineTask *)self requiresExistingShareOwnerParticipant])
  {
    v13 = [(HDCloudSyncManagerRepositoryTask *)self manager];
    id v46 = 0;
    v14 = [v13 shareOwnerParticipantWithError:&v46];
    id v15 = v46;

    if (v14)
    {

      goto LABEL_6;
    }
    _HKInitializeLogging();
    v39 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v49 = self;
      _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "%{public}@: Sync unavailable before setting a source share participant for this profile.", buf, 0xCu);
      if (v15) {
        goto LABEL_28;
      }
    }
    else if (v15)
    {
LABEL_28:
      id v53 = v15;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
      [(HDCloudSyncManagerPipelineTask *)self didFailWithErrors:v40];

      [(HDCloudSyncManagerPipelineTask *)self callCompletionWithSuccess:0 error:v15];
      [(HDCloudSyncManagerTask *)self finish];

      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:class:selector:format:", 729, objc_opt_class(), a2, @"Sync unavailable before setting a source share participant for this profile.");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
LABEL_6:
  v16 = [(HDCloudSyncManagerPipelineTask *)self pipelines];
  uint64_t v17 = 100 * [v16 count];
  v18 = [(HDCloudSyncManagerTask *)self progress];
  [v18 setTotalUnitCount:v17];

  id v19 = objc_alloc(MEMORY[0x1E4F65CD8]);
  id v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __61__HDCloudSyncManagerPipelineTask_mainWithRepositories_error___block_invoke_289;
  v45[3] = &unk_1E630F078;
  v45[4] = self;
  uint64_t v22 = (void *)[v19 initWithDescription:v21 completion:v45];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v23 = [(HDCloudSyncManagerPipelineTask *)self pipelines];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if ([(HDCloudSyncManagerTask *)self priority] == 100) {
          [v28 setIgnoreCloudKitOperationDelay:1];
        }
        v29 = [v28 beginWithTaskTree:v22];
        v30 = [(HDCloudSyncManagerTask *)self progress];
        [v30 addChild:v29 withPendingUnitCount:100];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v25);
  }

  _HKInitializeLogging();
  v31 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v32 = v31;
    v33 = [(HDCloudSyncManagerPipelineTask *)self pipelines];
    uint64_t v34 = [v33 count];
    *(_DWORD *)buf = 138543618;
    v49 = self;
    __int16 v50 = 2048;
    uint64_t v51 = v34;
    _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning %ld pipelines.", buf, 0x16u);
  }
  [v22 begin];

LABEL_24:
}

id __61__HDCloudSyncManagerPipelineTask_mainWithRepositories_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = [*(id *)(a1 + 32) pipelineForRepository:a2];
  if ([*(id *)(a1 + 32) runWhenSyncProhibited]) {
    [v3 setContinueWhenSyncDisabled:1];
  }

  return v3;
}

void __61__HDCloudSyncManagerPipelineTask_mainWithRepositories_error___block_invoke_289(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 104));
  [*(id *)(*(void *)(a1 + 32) + 120) invalidate];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 104));
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (!a3)
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        int v16 = 138543362;
        uint64_t v17 = v15;
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished successfully.", (uint8_t *)&v16, 0xCu);
      }
      [*(id *)(a1 + 32) didFinishWithSuccess];
      [*(id *)(a1 + 32) callCompletionWithSuccess:1 error:0];
    }
  }
  else
  {
    id v8 = [v5 allErrors];
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = v9;
      int v16 = 138543874;
      uint64_t v17 = v10;
      __int16 v18 = 2048;
      uint64_t v19 = [v8 count];
      __int16 v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed with %ld errors: %{public}@.", (uint8_t *)&v16, 0x20u);
    }
    [*(id *)(a1 + 32) didFailWithErrors:v8];
    uint64_t v12 = *(void **)(a1 + 32);
    v13 = [v8 firstObject];
    [v12 callCompletionWithSuccess:0 error:v13];
  }
  [*(id *)(a1 + 32) finish];
}

- (id)pipelineForRepository:(id)a3
{
  return 0;
}

- (void)cancel
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(HDCloudSyncManagerPipelineTask *)self pipelines];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) cancel];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)callCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (void (**)(void *, HDCloudSyncManagerPipelineTask *, BOOL, id))_Block_copy(self->_completion);
  id completion = self->_completion;
  self->_id completion = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v6) {
    v6[2](v6, self, v4, v8);
  }
}

- (BOOL)requiresExistingShareOwnerParticipant
{
  uint64_t v3 = [(HDCloudSyncManagerRepositoryTask *)self manager];
  BOOL v4 = [v3 profile];
  if ([v4 profileType] == 3)
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [(HDCloudSyncManagerRepositoryTask *)self manager];
    long long v7 = [v6 profile];
    BOOL v5 = [v7 profileType] == 2;
  }
  return v5;
}

- (HDAssertion)accessibilityAssertion
{
  return self->_accessibilityAssertion;
}

- (void)setAccessibilityAssertion:(id)a3
{
}

- (NSArray)pipelines
{
  return self->_pipelines;
}

- (void)setPipelines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelines, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end