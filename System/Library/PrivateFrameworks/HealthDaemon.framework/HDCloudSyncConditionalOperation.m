@interface HDCloudSyncConditionalOperation
+ (BOOL)shouldLogAtOperationEnd;
+ (BOOL)shouldLogAtOperationStart;
+ (BOOL)shouldProduceOperationAnalytics;
- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4;
- (HDCloudSyncConditionalOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncConditionalOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 operation:(id)a5 shouldRunHandler:(id)a6;
- (HDCloudSyncOperation)operation;
- (id)description;
- (id)shouldRunHandler;
- (void)main;
- (void)setOperation:(id)a3;
- (void)setShouldRunHandler:(id)a3;
- (void)skip;
@end

@implementation HDCloudSyncConditionalOperation

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

- (HDCloudSyncConditionalOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncConditionalOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 operation:(id)a5 shouldRunHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncConditionalOperation;
  v12 = [(HDCloudSyncOperation *)&v15 initWithConfiguration:a3 cloudState:a4];
  v13 = v12;
  if (v12)
  {
    [(HDCloudSyncConditionalOperation *)v12 setShouldRunHandler:v11];
    [(HDCloudSyncConditionalOperation *)v13 setOperation:v10];
  }

  return v13;
}

- (void)main
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = [(HDCloudSyncConditionalOperation *)self shouldRunHandler];
  [(HDCloudSyncConditionalOperation *)self setShouldRunHandler:0];
  if (v4 && (((uint64_t (**)(void, HDCloudSyncConditionalOperation *))v4)[2](v4, self) & 1) != 0)
  {
    v5 = [(HDCloudSyncConditionalOperation *)self operation];
    if (!v5)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"HDCloudSyncConditionalOperation.m", 52, @"Invalid parameter not satisfying: %@", @"operation != nil" object file lineNumber description];
    }
    uint64_t v6 = [(HDCloudSyncOperation *)self cloudState];
    [v5 setCloudState:v6];

    [(HDCloudSyncOperation *)self delegateToOperation:v5];
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = self;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping.", buf, 0xCu);
    }
    v8 = [(HDCloudSyncConditionalOperation *)self operation];
    [v8 skip];

    [(HDCloudSyncConditionalOperation *)self finishWithSuccess:1 error:0];
  }
}

- (void)skip
{
  v4.receiver = self;
  v4.super_class = (Class)HDCloudSyncConditionalOperation;
  [(HDCloudSyncOperation *)&v4 skip];
  v3 = [(HDCloudSyncConditionalOperation *)self operation];
  [v3 skip];

  [(HDCloudSyncConditionalOperation *)self setShouldRunHandler:0];
}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(HDCloudSyncConditionalOperation *)self setShouldRunHandler:0];
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncConditionalOperation;
  LOBYTE(v4) = [(HDCloudSyncOperation *)&v8 finishWithSuccess:v4 error:v6];

  return v4;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HDCloudSyncConditionalOperation *)self operation];
  BOOL v4 = [v2 stringWithFormat:@"[? %@]", v3];

  return v4;
}

- (HDCloudSyncOperation)operation
{
  return (HDCloudSyncOperation *)objc_getProperty(self, a2, 104, 1);
}

- (void)setOperation:(id)a3
{
}

- (id)shouldRunHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setShouldRunHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldRunHandler, 0);

  objc_storeStrong((id *)&self->_operation, 0);
}

@end