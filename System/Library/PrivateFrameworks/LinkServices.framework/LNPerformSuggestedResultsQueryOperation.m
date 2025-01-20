@interface LNPerformSuggestedResultsQueryOperation
- (LNPerformSuggestedResultsQueryOperation)initWithConnectionInterface:(id)a3 entityMangledTypeName:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (LNPerformSuggestedResultsQueryOperation)initWithConnectionInterface:(id)a3 entityType:(id)a4 queue:(id)a5 completionHandler:(id)a6;
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

@implementation LNPerformSuggestedResultsQueryOperation

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
  v5 = [(LNPerformSuggestedResultsQueryOperation *)self completionHandler];

  if (v5)
  {
    v6 = [(LNPerformSuggestedResultsQueryOperation *)self output];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    v8 = [(LNPerformSuggestedResultsQueryOperation *)self completionHandler];
    v9 = [(LNPerformSuggestedResultsQueryOperation *)self output];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNPerformSuggestedResultsQueryOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNPerformSuggestedResultsQueryOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (void)start
{
  v8.receiver = self;
  v8.super_class = (Class)LNPerformSuggestedResultsQueryOperation;
  [(LNConnectionOperation *)&v8 start];
  v3 = [(LNPerformSuggestedResultsQueryOperation *)self entityMangledTypeName];

  id v4 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  if (v3)
  {
    v5 = [(LNPerformSuggestedResultsQueryOperation *)self entityMangledTypeName];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__LNPerformSuggestedResultsQueryOperation_start__block_invoke;
    v7[3] = &unk_1E5B39CD8;
    v7[4] = self;
    [v4 performSuggestedEntitiesQueryWithEntityMangledTypeName:v5 completionHandler:v7];
  }
  else
  {
    v5 = [(LNPerformSuggestedResultsQueryOperation *)self entityType];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__LNPerformSuggestedResultsQueryOperation_start__block_invoke_2;
    v6[3] = &unk_1E5B39CD8;
    v6[4] = self;
    [v4 performSuggestedResultsQueryWithEntityType:v5 completionHandler:v6];
  }
}

void __48__LNPerformSuggestedResultsQueryOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setOutput:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

void __48__LNPerformSuggestedResultsQueryOperation_start__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setOutput:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (LNPerformSuggestedResultsQueryOperation)initWithConnectionInterface:(id)a3 entityType:(id)a4 queue:(id)a5 completionHandler:(id)a6
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
    [v25 handleFailureInMethod:a2, self, @"LNPerformSuggestedResultsQueryOperation.m", 60, @"Invalid parameter not satisfying: %@", @"entityType" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"LNPerformSuggestedResultsQueryOperation.m", 59, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"LNPerformSuggestedResultsQueryOperation.m", 61, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  v15 = [MEMORY[0x1E4F29128] UUID];
  v27.receiver = self;
  v27.super_class = (Class)LNPerformSuggestedResultsQueryOperation;
  v16 = [(LNInterfaceConnectionOperation *)&v27 initWithIdentifier:v15 connectionInterface:v11 priority:1 queue:v13 activity:&__block_literal_global_25];

  if (v16)
  {
    uint64_t v17 = [v12 copy];
    entityType = v16->_entityType;
    v16->_entityType = (NSString *)v17;

    entityMangledTypeName = v16->_entityMangledTypeName;
    v16->_entityMangledTypeName = 0;

    uint64_t v20 = [v14 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = (id)v20;

    v22 = v16;
  }

  return v16;
}

os_activity_t __106__LNPerformSuggestedResultsQueryOperation_initWithConnectionInterface_entityType_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:suggested results query", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

- (LNPerformSuggestedResultsQueryOperation)initWithConnectionInterface:(id)a3 entityMangledTypeName:(id)a4 queue:(id)a5 completionHandler:(id)a6
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
    [v25 handleFailureInMethod:a2, self, @"LNPerformSuggestedResultsQueryOperation.m", 36, @"Invalid parameter not satisfying: %@", @"entityMangledTypeName" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"LNPerformSuggestedResultsQueryOperation.m", 35, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"LNPerformSuggestedResultsQueryOperation.m", 37, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  v15 = [MEMORY[0x1E4F29128] UUID];
  v27.receiver = self;
  v27.super_class = (Class)LNPerformSuggestedResultsQueryOperation;
  v16 = [(LNInterfaceConnectionOperation *)&v27 initWithIdentifier:v15 connectionInterface:v11 priority:1 queue:v13 activity:&__block_literal_global_10204];

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

os_activity_t __117__LNPerformSuggestedResultsQueryOperation_initWithConnectionInterface_entityMangledTypeName_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:suggested results query", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

@end