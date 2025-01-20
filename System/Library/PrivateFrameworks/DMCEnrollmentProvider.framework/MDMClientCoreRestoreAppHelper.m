@interface MDMClientCoreRestoreAppHelper
- (MDMClientCoreRestoreAppHelper)initWithApps:(id)a3 persona:(id)a4 operation:(unint64_t)a5 originator:(id)a6 completion:(id)a7;
- (NSMutableDictionary)errorsForApps;
- (NSMutableSet)appsWaitingForResult;
- (NSSet)apps;
- (NSString)originator;
- (NSString)persona;
- (OS_dispatch_queue)queue;
- (id)_errorForBatch;
- (id)_logMessageForBatch;
- (id)completion;
- (id)onComplete;
- (unint64_t)operation;
- (void)_notifyCallerThatAllOperationsAreComplete;
- (void)_recordResponseForApp:(id)a3 error:(id)a4;
- (void)_sendManageRequestForApp:(id)a3;
- (void)_sendUnmanageRequestForApp:(id)a3;
- (void)setApps:(id)a3;
- (void)setAppsWaitingForResult:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setErrorsForApps:(id)a3;
- (void)setOnComplete:(id)a3;
- (void)setOperation:(unint64_t)a3;
- (void)setOriginator:(id)a3;
- (void)setPersona:(id)a3;
- (void)setQueue:(id)a3;
- (void)start;
@end

@implementation MDMClientCoreRestoreAppHelper

- (MDMClientCoreRestoreAppHelper)initWithApps:(id)a3 persona:(id)a4 operation:(unint64_t)a5 originator:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MDMClientCoreRestoreAppHelper;
  v16 = [(MDMClientCoreRestoreAppHelper *)&v27 init];
  if (v16)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v12];
    apps = v16->_apps;
    v16->_apps = (NSSet *)v17;

    objc_storeStrong((id *)&v16->_persona, a4);
    v16->_operation = a5;
    objc_storeStrong((id *)&v16->_originator, a6);
    uint64_t v19 = MEMORY[0x223C90320](v15);
    id completion = v16->_completion;
    v16->_id completion = (id)v19;

    appsWaitingForResult = v16->_appsWaitingForResult;
    v16->_appsWaitingForResult = 0;

    errorsForApps = v16->_errorsForApps;
    v16->_errorsForApps = 0;

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.MDMClientLibrary.RestoreHelper", 0);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v23;

    id onComplete = v16->_onComplete;
    v16->_id onComplete = 0;
  }
  return v16;
}

- (void)start
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(MDMClientCoreRestoreAppHelper *)self apps];
  v4 = (void *)[v3 mutableCopy];
  [(MDMClientCoreRestoreAppHelper *)self setAppsWaitingForResult:v4];

  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(MDMClientCoreRestoreAppHelper *)self setErrorsForApps:v5];

  v6 = [(MDMClientCoreRestoreAppHelper *)self apps];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = [(MDMClientCoreRestoreAppHelper *)self apps];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if ([(MDMClientCoreRestoreAppHelper *)self operation]) {
            [(MDMClientCoreRestoreAppHelper *)self _sendUnmanageRequestForApp:v13];
          }
          else {
            [(MDMClientCoreRestoreAppHelper *)self _sendManageRequestForApp:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  else
  {
    [(MDMClientCoreRestoreAppHelper *)self _notifyCallerThatAllOperationsAreComplete];
  }
}

- (id)_errorForBatch
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(MDMClientCoreRestoreAppHelper *)self operation];
  uint64_t v4 = 1;
  if (v3) {
    uint64_t v4 = 2;
  }
  uint64_t v27 = v4;
  unint64_t v5 = [(MDMClientCoreRestoreAppHelper *)self operation];
  v6 = @"unmanaged";
  if (!v5) {
    v6 = @"managed";
  }
  v29 = v6;
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = self;
  id obj = [(MDMClientCoreRestoreAppHelper *)self errorsForApps];
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    uint64_t v11 = *MEMORY[0x263F08608];
    uint64_t v12 = *MEMORY[0x263F08320];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        long long v15 = [(MDMClientCoreRestoreAppHelper *)v7 errorsForApps];
        long long v16 = [v15 objectForKey:v14];

        long long v17 = [NSString stringWithFormat:@"The app \"%@\" could not be marked as %@.", v14, v29];
        v18 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
        [v18 setObject:v16 forKeyedSubscript:v11];
        [v18 setObject:v17 forKeyedSubscript:v12];
        uint64_t v19 = [MEMORY[0x263F087E8] errorWithDomain:@"DMCRFRestoreAppHelper" code:v27 userInfo:v18];
        [v28 addObject:v19];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v9);
  }

  if ([(MDMClientCoreRestoreAppHelper *)v7 operation]) {
    uint64_t v20 = 4;
  }
  else {
    uint64_t v20 = 3;
  }
  v21 = (void *)MEMORY[0x263F087E8];
  uint64_t v34 = *MEMORY[0x263F083F0];
  v22 = (void *)[v28 copy];
  v35 = v22;
  dispatch_queue_t v23 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v24 = [v21 errorWithDomain:@"DMCRFRestoreAppHelper" code:v20 userInfo:v23];

  return v24;
}

- (id)_logMessageForBatch
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(MDMClientCoreRestoreAppHelper *)self operation];
  uint64_t v4 = @"mark as unmanaged";
  if (!v3) {
    uint64_t v4 = @"mark as managed";
  }
  uint64_t v20 = v4;
  unint64_t v5 = [(MDMClientCoreRestoreAppHelper *)self operation];
  v6 = @"unmanaged";
  if (!v5) {
    v6 = @"managed";
  }
  v21 = v6;
  id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [(MDMClientCoreRestoreAppHelper *)self apps];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [(MDMClientCoreRestoreAppHelper *)self errorsForApps];
        long long v15 = [v14 objectForKey:v13];

        if (v15)
        {
          long long v16 = [v15 description];
        }
        else
        {
          long long v16 = v21;
        }
        long long v17 = v16;
        [v7 appendFormat:@"\n\t%@: %@", v13, v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  v18 = [NSString stringWithFormat:@"managed restore, %@: %@", v20, v7];

  return v18;
}

- (void)_notifyCallerThatAllOperationsAreComplete
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(MDMClientCoreRestoreAppHelper *)self _logMessageForBatch];
  os_log_type_t v4 = 16 * ([(NSMutableDictionary *)self->_errorsForApps count] != 0);
  unint64_t v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, v4))
  {
    int v13 = 138543362;
    uint64_t v14 = v3;
    _os_log_impl(&dword_221CC5000, v5, v4, "%{public}@", (uint8_t *)&v13, 0xCu);
  }
  v6 = [(MDMClientCoreRestoreAppHelper *)self errorsForApps];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(MDMClientCoreRestoreAppHelper *)self _errorForBatch];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [(MDMClientCoreRestoreAppHelper *)self completion];

  if (v9)
  {
    uint64_t v10 = [(MDMClientCoreRestoreAppHelper *)self completion];
    ((void (**)(void, void *))v10)[2](v10, v8);
  }
  uint64_t v11 = [(MDMClientCoreRestoreAppHelper *)self onComplete];

  if (v11)
  {
    uint64_t v12 = [(MDMClientCoreRestoreAppHelper *)self onComplete];
    ((void (**)(void, MDMClientCoreRestoreAppHelper *))v12)[2](v12, self);
  }
}

- (void)_recordResponseForApp:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v8 = [(MDMClientCoreRestoreAppHelper *)self queue];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  int v13 = __61__MDMClientCoreRestoreAppHelper__recordResponseForApp_error___block_invoke;
  uint64_t v14 = &unk_2645E9828;
  id v9 = v7;
  id v15 = v9;
  long long v16 = self;
  id v10 = v6;
  id v17 = v10;
  v18 = &v19;
  dispatch_sync(v8, &v11);

  if (!v20[3]) {
    [(MDMClientCoreRestoreAppHelper *)self _notifyCallerThatAllOperationsAreComplete];
  }

  _Block_object_dispose(&v19, 8);
}

void __61__MDMClientCoreRestoreAppHelper__recordResponseForApp_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) errorsForApps];
    [v2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 48)];
  }
  unint64_t v3 = [*(id *)(a1 + 40) appsWaitingForResult];
  [v3 removeObject:*(void *)(a1 + 48)];

  id v4 = [*(id *)(a1 + 40) appsWaitingForResult];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v4 count];
}

- (void)_sendManageRequestForApp:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F39DA8]);
  [v5 setBundleIdentifier:v4];
  uint64_t v6 = MEMORY[0x263EFFA88];
  [v5 setInternal:MEMORY[0x263EFFA88]];
  id v7 = [(MDMClientCoreRestoreAppHelper *)self originator];
  [v5 setSourceIdentifier:v7];

  uint64_t v8 = [(MDMClientCoreRestoreAppHelper *)self originator];
  [v5 setOriginator:v8];

  id v9 = [(MDMClientCoreRestoreAppHelper *)self persona];
  [v5 setPersonaIdentifier:v9];

  [v5 setRemovable:v6];
  [v5 setManagementOptions:1];
  id v10 = [MEMORY[0x263F39D18] systemConnection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__MDMClientCoreRestoreAppHelper__sendManageRequestForApp___block_invoke;
  v12[3] = &unk_2645E9850;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [v10 performRequest:v5 completion:v12];
}

uint64_t __58__MDMClientCoreRestoreAppHelper__sendManageRequestForApp___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _recordResponseForApp:*(void *)(a1 + 40) error:a3];
}

- (void)_sendUnmanageRequestForApp:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F39E70]);
  [v5 setBundleIdentifier:v4];
  uint64_t v6 = [(MDMClientCoreRestoreAppHelper *)self originator];
  [v5 setSourceIdentifier:v6];

  id v7 = [(MDMClientCoreRestoreAppHelper *)self persona];
  [v5 setPersonaIdentifier:v7];

  uint64_t v8 = [MEMORY[0x263F39D18] systemConnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__MDMClientCoreRestoreAppHelper__sendUnmanageRequestForApp___block_invoke;
  v10[3] = &unk_2645E9850;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 performRequest:v5 completion:v10];
}

uint64_t __60__MDMClientCoreRestoreAppHelper__sendUnmanageRequestForApp___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _recordResponseForApp:*(void *)(a1 + 40) error:a3];
}

- (id)onComplete
{
  return self->_onComplete;
}

- (void)setOnComplete:(id)a3
{
}

- (NSSet)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
}

- (NSString)persona
{
  return self->_persona;
}

- (void)setPersona:(id)a3
{
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_operation = a3;
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSMutableSet)appsWaitingForResult
{
  return self->_appsWaitingForResult;
}

- (void)setAppsWaitingForResult:(id)a3
{
}

- (NSMutableDictionary)errorsForApps
{
  return self->_errorsForApps;
}

- (void)setErrorsForApps:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_errorsForApps, 0);
  objc_storeStrong((id *)&self->_appsWaitingForResult, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_persona, 0);
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong(&self->_onComplete, 0);
}

@end