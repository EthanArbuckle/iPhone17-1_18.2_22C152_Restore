@interface HDCloudSyncIgnoredErrorsPipelineStage
- (HDCloudSyncIgnoredErrorsPipelineStage)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncIgnoredErrorsPipelineStage)initWithConfiguration:(id)a3 cloudState:(id)a4 stage:(id)a5;
- (HDCloudSyncPipelineStage)stage;
- (id)description;
- (void)main;
- (void)setStage:(id)a3;
@end

@implementation HDCloudSyncIgnoredErrorsPipelineStage

- (HDCloudSyncIgnoredErrorsPipelineStage)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncIgnoredErrorsPipelineStage)initWithConfiguration:(id)a3 cloudState:(id)a4 stage:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncIgnoredErrorsPipelineStage;
  v9 = [(HDCloudSyncPipelineStage *)&v12 initWithConfiguration:a3 cloudState:a4];
  v10 = v9;
  if (v9) {
    [(HDCloudSyncIgnoredErrorsPipelineStage *)v9 setStage:v8];
  }

  return v10;
}

- (void)main
{
  v4 = [(HDCloudSyncIgnoredErrorsPipelineStage *)self stage];
  if (!v4)
  {
    objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDCloudSyncIgnoredErrorsPipelineStage.m", 33, @"Invalid parameter not satisfying: %@", @"stage != nil" object file lineNumber description];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__HDCloudSyncIgnoredErrorsPipelineStage_main__block_invoke;
  v14[3] = &unk_1E6308400;
  v14[4] = self;
  [v4 setOnSuccess:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__HDCloudSyncIgnoredErrorsPipelineStage_main__block_invoke_2;
  v13[3] = &unk_1E6308428;
  v13[4] = self;
  [v4 setOnError:v13];
  v5 = [v4 progress];
  uint64_t v6 = [v5 totalUnitCount];
  v7 = [(HDCloudSyncOperation *)self progress];
  [v7 setTotalUnitCount:v6];

  id v8 = [(HDCloudSyncOperation *)self progress];
  [v8 setCompletedUnitCount:0];

  v9 = [(HDCloudSyncOperation *)self progress];
  v10 = [v4 progress];
  v11 = [v4 progress];
  objc_msgSend(v9, "addChild:withPendingUnitCount:", v10, objc_msgSend(v11, "totalUnitCount"));

  [v4 start];
}

uint64_t __45__HDCloudSyncIgnoredErrorsPipelineStage_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
}

void __45__HDCloudSyncIgnoredErrorsPipelineStage_main__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Underlying pipeline stage failed with an ignored error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
}

- (id)description
{
  v2 = NSString;
  v3 = [(HDCloudSyncIgnoredErrorsPipelineStage *)self stage];
  id v4 = [v2 stringWithFormat:@"[! %@]", v3];

  return v4;
}

- (HDCloudSyncPipelineStage)stage
{
  return (HDCloudSyncPipelineStage *)objc_getProperty(self, a2, 128, 1);
}

- (void)setStage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end