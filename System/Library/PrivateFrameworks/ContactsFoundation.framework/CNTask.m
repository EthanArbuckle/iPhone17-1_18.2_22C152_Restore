@interface CNTask
+ (id)taskWithBlock:(id)a3;
+ (id)taskWithError:(id)a3;
+ (id)taskWithName:(id)a3 block:(id)a4;
+ (id)taskWithName:(id)a3 error:(id)a4;
+ (id)taskWithName:(id)a3 result:(id)a4;
+ (id)taskWithName:(id)a3 subtasks:(id)a4;
+ (id)taskWithResult:(id)a3;
- (BOOL)cancel;
- (BOOL)isCancelled;
- (CNTask)init;
- (CNTask)initWithName:(id)a3;
- (NSString)name;
- (id)description;
- (id)flatMap:(id)a3;
- (id)map:(id)a3;
- (id)profileWithTimeProvider:(id)a3 os_log:(id)a4;
- (id)recover:(id)a3;
- (id)run;
- (id)run:(id *)a3;
- (id)runWithRetryDelegate:(id)a3;
- (void)setName:(id)a3;
@end

@implementation CNTask

- (id)runWithRetryDelegate:(id)a3
{
  id v4 = a3;
  v5 = [[CNRetry alloc] initWithDelegate:v4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__CNTask_Retry__runWithRetryDelegate___block_invoke;
  v8[3] = &unk_1E56A0048;
  v8[4] = self;
  v6 = [(CNRetry *)v5 performAndWait:v8];

  return v6;
}

uint64_t __38__CNTask_Retry__runWithRetryDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) run];
}

+ (id)taskWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = [[_CNBlockTask alloc] initWithBlock:v3];

  return v4;
}

+ (id)taskWithName:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_CNBlockTask alloc] initWithName:v6 block:v5];

  return v7;
}

+ (id)taskWithName:(id)a3 subtasks:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_CNAggregateTask alloc] initWithName:v6 tasks:v5];

  return v7;
}

+ (id)taskWithResult:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__CNTask_taskWithResult___block_invoke;
  v7[3] = &unk_1E56A0290;
  id v8 = v3;
  id v4 = v3;
  id v5 = +[CNTask taskWithBlock:v7];

  return v5;
}

id __25__CNTask_taskWithResult___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)taskWithName:(id)a3 result:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__CNTask_taskWithName_result___block_invoke;
  v9[3] = &unk_1E56A0290;
  id v10 = v5;
  id v6 = v5;
  v7 = +[CNTask taskWithName:a3 block:v9];

  return v7;
}

id __30__CNTask_taskWithName_result___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)taskWithError:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __24__CNTask_taskWithError___block_invoke;
  v7[3] = &unk_1E56A0290;
  id v8 = v3;
  id v4 = v3;
  id v5 = +[CNTask taskWithBlock:v7];

  return v5;
}

uint64_t __24__CNTask_taskWithError___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(id *)(a1 + 32);
  }
  return 0;
}

+ (id)taskWithName:(id)a3 error:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__CNTask_taskWithName_error___block_invoke;
  v9[3] = &unk_1E56A0290;
  id v10 = v5;
  id v6 = v5;
  v7 = +[CNTask taskWithName:a3 block:v9];

  return v7;
}

uint64_t __29__CNTask_taskWithName_error___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = *(id *)(a1 + 32);
  }
  return 0;
}

- (CNTask)init
{
  return [(CNTask *)self initWithName:&stru_1EE0267A8];
}

- (CNTask)initWithName:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_1 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_26);
    }
    id v5 = CNGuardOSLog_cn_once_object_0_1;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT)) {
      -[CNTask initWithName:](v5);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CNTask;
  id v6 = [(CNTask *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    name = v6->_name;
    v6->_name = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (BOOL)isCancelled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (BOOL)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = !v2->_cancelled;
  v2->_BOOL cancelled = 1;
  objc_sync_exit(v2);

  return v3;
}

- (id)run:(id *)a3
{
  uint64_t v5 = [(CNTask *)self methodForSelector:&sel_run];
  if (v5 == +[CNTask instanceMethodForSelector:&sel_run])
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
  }
  else
  {
    id v6 = [(CNTask *)self run];
    uint64_t v7 = [v6 value];

    if (v7)
    {
      id v8 = [v6 value];
    }
    else
    {
      v9 = [v6 error];
      id v10 = v9;
      if (a3) {
        *a3 = v9;
      }

      id v8 = 0;
    }
  }

  return v8;
}

- (id)run
{
  uint64_t v3 = [(CNTask *)self methodForSelector:sel_run_];
  if (v3 == +[CNTask instanceMethodForSelector:sel_run_])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    id v6 = +[CNResult successWithValue:v7];
  }
  else
  {
    id v9 = 0;
    id v4 = [(CNTask *)self run:&v9];
    id v5 = v9;
    id v6 = +[CNResult resultWithValue:v4 orError:v5];
  }

  return v6;
}

- (id)flatMap:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __18__CNTask_flatMap___block_invoke;
  v8[3] = &unk_1E56A02B8;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = +[CNTask taskWithBlock:v8];

  return v6;
}

id __18__CNTask_flatMap___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  id v14 = 0;
  id v5 = [v4 run:&v14];
  id v6 = v14;
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];

  if (v5 == v7)
  {
    id v8 = v5;
  }
  else if (v6)
  {
    id v8 = 0;
    if (a2) {
      *a2 = v6;
    }
  }
  else
  {
    id v9 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v13 = 0;
    id v10 = [v9 run:&v13];
    id v11 = v13;
    id v8 = +[CNFoundationError ifResultIsNil:v10 setOutputError:a2 toError:v11];
  }

  return v8;
}

- (id)map:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __14__CNTask_map___block_invoke;
  v8[3] = &unk_1E56A02E0;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(CNTask *)self flatMap:v8];

  return v6;
}

id __14__CNTask_map___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = +[CNTask taskWithResult:v1];

  return v2;
}

- (id)recover:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __18__CNTask_recover___block_invoke;
  v8[3] = &unk_1E56A02B8;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = +[CNTask taskWithBlock:v8];

  return v6;
}

id __18__CNTask_recover___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  id v13 = 0;
  id v5 = [v4 run:&v13];
  id v6 = v13;
  if (v6)
  {
    uint64_t v7 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v12 = 0;
    id v8 = [v7 run:&v12];
    id v9 = v12;
    id v10 = +[CNFoundationError ifResultIsNil:v8 setOutputError:a2 toError:v9];
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

- (id)profileWithTimeProvider:(id)a3 os_log:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_CNTimeProfilingTask alloc] initWithTask:self timeProvider:v7 os_log:v6];

  return v8;
}

- (id)description
{
  return +[CNDescriptionBuilder descriptionForObject:self->_name withNamesAndObjects:0];
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithName:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19091D000, log, OS_LOG_TYPE_FAULT, "parameter ‘name’ must be nonnull", v1, 2u);
}

@end