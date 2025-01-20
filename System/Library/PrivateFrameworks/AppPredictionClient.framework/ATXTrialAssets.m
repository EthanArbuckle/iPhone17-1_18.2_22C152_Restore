@interface ATXTrialAssets
- (ATXTrialAssets)init;
- (NSString)trialDeploymentId;
- (NSString)trialExperimentId;
- (NSString)trialTreatmentId;
- (id)client;
- (id)dictionaryForClass:(Class)a3;
- (id)dictionaryForClassName:(id)a3;
- (id)dictionaryForResource:(id)a3;
- (id)directoryPathForTrialResource:(id)a3;
- (id)filePathForClass:(Class)a3;
- (id)filePathForResource:(id)a3;
- (id)trialFactorName:(id)a3;
- (void)addUpdateHandlerWithBlock:(id)a3;
- (void)fetchTrialExperimentIdentifiers;
@end

@implementation ATXTrialAssets

- (ATXTrialAssets)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXTrialAssets;
  v2 = [(ATXTrialAssets *)&v10 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1AD0D3C30]();
    v4 = (id *)objc_opt_new();
    uint64_t v5 = [MEMORY[0x1E4FB0098] clientWithIdentifier:105];
    id v6 = v4[1];
    v4[1] = (id)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v4];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v7;

    [v4[1] refresh];
    [(ATXTrialAssets *)v2 fetchTrialExperimentIdentifiers];
  }
  return v2;
}

- (id)client
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  objc_super v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__ATXTrialAssets_client__block_invoke;
  v5[3] = &unk_1E5D05538;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __24__ATXTrialAssets_client__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a2 + 8) copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return MEMORY[0x1F41817F8](v3, v5);
}

- (id)dictionaryForResource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXTrialAssets *)self filePathForResource:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = loadLazyOrRegularPlist(v5);
  }
  else
  {
    uint64_t v8 = __atxlog_handle_trial_assets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXTrialAssets dictionaryForResource:]((uint64_t)v4, v8);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (id)dictionaryForClass:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  uint64_t v5 = [(ATXTrialAssets *)self dictionaryForClassName:v4];

  return v5;
}

- (id)dictionaryForClassName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXTrialAssets *)self filePathForClassName:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = loadLazyOrRegularPlist(v5);
  }
  else
  {
    uint64_t v8 = __atxlog_handle_trial_assets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXTrialAssets dictionaryForClassName:]((uint64_t)v4, v8);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (id)filePathForClass:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  uint64_t v5 = [(ATXTrialAssets *)self filePathForClassName:v4];

  return v5;
}

- (id)trialFactorName:(id)a3
{
  return (id)[@"A" stringByAppendingString:a3];
}

- (id)filePathForResource:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__ATXTrialAssets_filePathForResource___block_invoke;
  v9[3] = &unk_1E5D05560;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [(_PASLock *)lock runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __38__ATXTrialAssets_filePathForResource___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = (void *)MEMORY[0x1AD0D3C30]();
  id v4 = (void *)v11[1];
  uint64_t v5 = [*(id *)(a1 + 32) trialFactorName:*(void *)(a1 + 40)];
  id v6 = [v4 levelForFactor:v5 withNamespaceName:@"SYSTEM_SPACE_INTELLIGENCE_SPOTLIGHT_SUGGESTIONS"];

  id v7 = [v6 fileValue];
  uint64_t v8 = [v7 path];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)directoryPathForTrialResource:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__ATXTrialAssets_directoryPathForTrialResource___block_invoke;
  v9[3] = &unk_1E5D05560;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [(_PASLock *)lock runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__ATXTrialAssets_directoryPathForTrialResource___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = (void *)MEMORY[0x1AD0D3C30]();
  id v4 = (void *)v11[1];
  uint64_t v5 = [*(id *)(a1 + 32) trialFactorName:*(void *)(a1 + 40)];
  id v6 = [v4 levelForFactor:v5 withNamespaceName:@"SYSTEM_SPACE_INTELLIGENCE_SPOTLIGHT_SUGGESTIONS"];

  id v7 = [v6 directoryValue];
  uint64_t v8 = [v7 path];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)addUpdateHandlerWithBlock:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ATXTrialAssets_addUpdateHandlerWithBlock___block_invoke;
  v7[3] = &unk_1E5D055B0;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __44__ATXTrialAssets_addUpdateHandlerWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__ATXTrialAssets_addUpdateHandlerWithBlock___block_invoke_2;
  v4[3] = &unk_1E5D05588;
  id v5 = *(id *)(a1 + 32);
  id v3 = (id)[v2 addUpdateHandlerForNamespaceName:@"SYSTEM_SPACE_INTELLIGENCE_SPOTLIGHT_SUGGESTIONS" usingBlock:v4];
}

uint64_t __44__ATXTrialAssets_addUpdateHandlerWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTrialExperimentIdentifiers
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__ATXTrialAssets_fetchTrialExperimentIdentifiers__block_invoke;
  v3[3] = &unk_1E5D055D8;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __49__ATXTrialAssets_fetchTrialExperimentIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a2 + 8) experimentIdentifiersWithNamespaceName:@"SYSTEM_SPACE_INTELLIGENCE_SPOTLIGHT_SUGGESTIONS"];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 experimentId];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v5;

    uint64_t v8 = [v4 treatmentId];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = v8;

    id v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "deploymentId"));
    uint64_t v12 = [v11 stringValue];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 32);
    *(void *)(v13 + 32) = v12;
  }
  else
  {
    v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_INFO, "ATXTrialClientWrapper: Unable to fetch experimentId, deploymentId, treatmentId", v16, 2u);
    }
  }
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (NSString)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)dictionaryForResource:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Could not get file path for resource: %@", (uint8_t *)&v2, 0xCu);
}

- (void)dictionaryForClassName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Could not get file path for class: %@", (uint8_t *)&v2, 0xCu);
}

@end