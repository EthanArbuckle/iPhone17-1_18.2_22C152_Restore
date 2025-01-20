@interface HDCloudSyncIgnoredErrorsOperation
+ (BOOL)shouldLogAtOperationEnd;
+ (BOOL)shouldLogAtOperationStart;
+ (BOOL)shouldProduceOperationAnalytics;
- (HDCloudSyncIgnoredErrorsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncIgnoredErrorsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 operation:(id)a5;
- (HDCloudSyncOperation)operation;
- (id)description;
- (void)main;
- (void)setOperation:(id)a3;
- (void)skip;
@end

@implementation HDCloudSyncIgnoredErrorsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldLogAtOperationEnd
{
  return 0;
}

+ (BOOL)shouldProduceOperationAnalytics
{
  return 0;
}

- (HDCloudSyncIgnoredErrorsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncIgnoredErrorsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 operation:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncIgnoredErrorsOperation;
  v9 = [(HDCloudSyncOperation *)&v12 initWithConfiguration:a3 cloudState:a4];
  v10 = v9;
  if (v9) {
    [(HDCloudSyncIgnoredErrorsOperation *)v9 setOperation:v8];
  }

  return v10;
}

- (void)main
{
  v4 = [(HDCloudSyncIgnoredErrorsOperation *)self operation];
  if (!v4)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDCloudSyncIgnoredErrorsOperation.m", 39, @"Invalid parameter not satisfying: %@", @"operation != nil" object file lineNumber description];
  }
  v5 = [(HDCloudSyncOperation *)self cloudState];
  [v4 setCloudState:v5];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __41__HDCloudSyncIgnoredErrorsOperation_main__block_invoke;
  v15[3] = &unk_1E62F2928;
  v15[4] = self;
  [v4 setOnSuccess:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__HDCloudSyncIgnoredErrorsOperation_main__block_invoke_2;
  v14[3] = &unk_1E62F2950;
  v14[4] = self;
  [v4 setOnError:v14];
  uint64_t v6 = [v4 progress];
  uint64_t v7 = [v6 totalUnitCount];
  id v8 = [(HDCloudSyncOperation *)self progress];
  [v8 setTotalUnitCount:v7];

  v9 = [(HDCloudSyncOperation *)self progress];
  [v9 setCompletedUnitCount:0];

  v10 = [(HDCloudSyncOperation *)self progress];
  v11 = [v4 progress];
  objc_super v12 = [v4 progress];
  objc_msgSend(v10, "addChild:withPendingUnitCount:", v11, objc_msgSend(v12, "totalUnitCount"));

  [v4 start];
}

uint64_t __41__HDCloudSyncIgnoredErrorsOperation_main__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 cloudState];
  [*(id *)(a1 + 32) setCloudState:v3];

  v4 = *(void **)(a1 + 32);

  return [v4 finishWithSuccess:1 error:0];
}

void __41__HDCloudSyncIgnoredErrorsOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 cloudState];
  [*(id *)(a1 + 32) setCloudState:v6];

  _HKInitializeLogging();
  uint64_t v7 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Underlying operation failed with an ignored error: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
}

- (void)skip
{
  v4.receiver = self;
  v4.super_class = (Class)HDCloudSyncIgnoredErrorsOperation;
  [(HDCloudSyncOperation *)&v4 skip];
  v3 = [(HDCloudSyncIgnoredErrorsOperation *)self operation];
  [v3 skip];
}

- (id)description
{
  v2 = NSString;
  v3 = [(HDCloudSyncIgnoredErrorsOperation *)self operation];
  objc_super v4 = [v2 stringWithFormat:@"[! %@]", v3];

  return v4;
}

- (HDCloudSyncOperation)operation
{
  return (HDCloudSyncOperation *)objc_getProperty(self, a2, 104, 1);
}

- (void)setOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end