@interface HMDBackgroundSystemTaskScheduler
- (BOOL)cancelTaskRequestWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)registerForTaskWithIdentifier:(id)a3 usingQueue:(id)a4 launchHandler:(id)a5;
- (BOOL)submitTaskRequest:(id)a3 error:(id *)a4;
- (id)taskRequestForIdentifier:(id)a3;
@end

@implementation HMDBackgroundSystemTaskScheduler

- (BOOL)submitTaskRequest:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F29900];
  id v6 = a3;
  v7 = [v5 sharedScheduler];
  v8 = [v6 taskRequest];

  LOBYTE(a4) = [v7 submitTaskRequest:v8 error:a4];
  return (char)a4;
}

- (BOOL)cancelTaskRequestWithIdentifier:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F29900];
  id v6 = a3;
  v7 = [v5 sharedScheduler];
  LOBYTE(a4) = [v7 cancelTaskRequestWithIdentifier:v6 error:a4];

  return (char)a4;
}

- (id)taskRequestForIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F29900];
  id v4 = a3;
  v5 = [v3 sharedScheduler];
  id v6 = [v5 taskRequestForIdentifier:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    v9 = [[HMDBackgroundSystemTaskRequest alloc] initWithTaskRequest:v8];
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (BOOL)registerForTaskWithIdentifier:(id)a3 usingQueue:(id)a4 launchHandler:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x263F29900];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 sharedScheduler];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __91__HMDBackgroundSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke;
  v15[3] = &unk_264A2E430;
  id v16 = v7;
  id v12 = v7;
  char v13 = [v11 registerForTaskWithIdentifier:v10 usingQueue:v9 launchHandler:v15];

  return v13;
}

void __91__HMDBackgroundSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[HMDBackgroundSystemTask alloc] initWithUnderlyingTask:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end