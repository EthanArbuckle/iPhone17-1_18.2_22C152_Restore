@interface LNPerformAllResultsQueryOperation
- (LNPerformAllResultsQueryOperation)initWithConnectionInterface:(id)a3 entityMangledTypeName:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (LNQueryOutput)output;
- (NSString)entityMangledTypeName;
- (NSString)entityType;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setEntityMangledTypeName:(id)a3;
- (void)setEntityType:(id)a3;
- (void)setOutput:(id)a3;
- (void)start;
@end

@implementation LNPerformAllResultsQueryOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_entityMangledTypeName, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
}

- (void)setOutput:(id)a3
{
}

- (LNQueryOutput)output
{
  return self->_output;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setEntityMangledTypeName:(id)a3
{
}

- (NSString)entityMangledTypeName
{
  return self->_entityMangledTypeName;
}

- (void)setEntityType:(id)a3
{
}

- (NSString)entityType
{
  return self->_entityType;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(LNPerformAllResultsQueryOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNPerformAllResultsQueryOperation *)self output];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNPerformAllResultsQueryOperation *)self completionHandler];
    v9 = [(LNPerformAllResultsQueryOperation *)self output];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNPerformAllResultsQueryOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNPerformAllResultsQueryOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  v6.receiver = self;
  v6.super_class = (Class)LNPerformAllResultsQueryOperation;
  [(LNConnectionOperation *)&v6 start];
  v3 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  id v4 = [(LNPerformAllResultsQueryOperation *)self entityMangledTypeName];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__LNPerformAllResultsQueryOperation_start__block_invoke;
  v5[3] = &unk_1E5B39CD8;
  v5[4] = self;
  [v3 performAllEntitiesQueryWithEntityMangledTypeName:v4 completionHandler:v5];
}

void __42__LNPerformAllResultsQueryOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setOutput:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNPerformAllResultsQueryOperation)initWithConnectionInterface:(id)a3 entityMangledTypeName:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"LNPerformAllResultsQueryOperation.m", 36, @"Invalid parameter not satisfying: %@", @"entityMangledTypeName" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"LNPerformAllResultsQueryOperation.m", 35, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"LNPerformAllResultsQueryOperation.m", 37, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  v15 = [MEMORY[0x1E4F29128] UUID];
  v27.receiver = self;
  v27.super_class = (Class)LNPerformAllResultsQueryOperation;
  v16 = [(LNInterfaceConnectionOperation *)&v27 initWithIdentifier:v15 connectionInterface:v11 priority:1 queue:v13 activity:&__block_literal_global_11480];

  if (v16)
  {
    entityType = v16->_entityType;
    v16->_entityType = 0;

    uint64_t v18 = [v12 copy];
    entityMangledTypeName = v16->_entityMangledTypeName;
    v16->_entityMangledTypeName = (NSString *)v18;

    uint64_t v20 = [v14 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = (id)v20;

    v22 = v16;
  }

  return v16;
}

os_activity_t __111__LNPerformAllResultsQueryOperation_initWithConnectionInterface_entityMangledTypeName_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:entity all results query", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end