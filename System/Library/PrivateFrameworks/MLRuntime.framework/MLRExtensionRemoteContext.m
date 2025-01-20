@interface MLRExtensionRemoteContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (BOOL)loadPluginIfNecessaryWithError:(id *)a3;
- (MLRExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (MLRExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5 plugin:(id)a6;
- (MLRTaskPerforming)plugin;
- (OS_os_transaction)stopTransaction;
- (OS_os_transaction)taskTransaction;
- (id)createMLRTrialTaskWithTask:(id)a3;
- (id)performSynchronouslyTask:(id)a3 sandBoxExtensions:(id)a4 error:(id *)a5;
- (id)processTaskResult:(id)a3 forTask:(id)a4 duration:(double)a5 error:(id *)a6;
- (void)performSynchronouslyTrialTask:(id)a3 completion:(id)a4;
- (void)performTask:(id)a3 sandBoxExtensions:(id)a4 completion:(id)a5;
- (void)performTrialTask:(id)a3 completion:(id)a4;
- (void)setPlugin:(id)a3;
- (void)setStopTransaction:(id)a3;
- (void)setTaskTransaction:(id)a3;
- (void)simulateCrash;
- (void)stop;
- (void)stopSynchronously;
@end

@implementation MLRExtensionRemoteContext

- (MLRExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  return [(MLRExtensionRemoteContext *)self initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5 plugin:0];
}

- (MLRExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5 plugin:(id)a6
{
  id v11 = a6;
  v37.receiver = self;
  v37.super_class = (Class)MLRExtensionRemoteContext;
  v12 = [(MLRExtensionRemoteContext *)&v37 initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_plugin, a6);
    v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = [MEMORY[0x263F086E0] mainBundle];
    v18 = [v17 bundleIdentifier];
    v19 = [v14 stringWithFormat:@"%@.%@.execution", v16, v18];

    id v20 = v19;
    v21 = (const char *)[v20 cStringUsingEncoding:4];
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create(v21, v22);
    taskExecutionQueue = v13->_taskExecutionQueue;
    v13->_taskExecutionQueue = (OS_dispatch_queue *)v23;

    v25 = NSString;
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    v28 = [MEMORY[0x263F086E0] mainBundle];
    v29 = [v28 bundleIdentifier];
    v30 = [v25 stringWithFormat:@"%@.%@.stop", v27, v29];

    id v31 = v30;
    v32 = (const char *)[v31 cStringUsingEncoding:4];
    v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v34 = dispatch_queue_create(v32, v33);
    stopQueue = v13->_stopQueue;
    v13->_stopQueue = (OS_dispatch_queue *)v34;
  }
  return v13;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface;

  return v2;
}

uint64_t __60__MLRExtensionRemoteContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CC807E0];

  return MEMORY[0x270F9A758]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_76);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;

  return v2;
}

void __62__MLRExtensionRemoteContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CC7D228];
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v3 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_performTask_sandBoxExtensions_completion_ argumentIndex:0 ofReply:0];
}

- (BOOL)loadPluginIfNecessaryWithError:(id *)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  v5 = [(MLRExtensionRemoteContext *)self plugin];

  if (v5) {
    return 1;
  }
  v7 = [MEMORY[0x263F086E0] mainBundle];
  v8 = [v7 infoDictionary];
  v9 = [v8 objectForKeyedSubscript:@"MLRuntimeTaskPrincipalClass"];

  if (v9)
  {
    NSClassFromString(v9);
    v10 = objc_opt_new();
    if (v10)
    {
      [(MLRExtensionRemoteContext *)self setPlugin:v10];
      id v11 = 0;
      BOOL v6 = 1;
      goto LABEL_13;
    }
    v15 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLRExtensionRemoteContext loadPluginIfNecessaryWithError:]();
    }

    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F3A4A0];
    uint64_t v20 = *MEMORY[0x263F08320];
    v21 = @"Cannot initiate MLRuntimeTaskPrincipalClass";
    v18 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v11 = [v16 errorWithDomain:v17 code:8002 userInfo:v18];
  }
  else
  {
    v12 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MLRExtensionRemoteContext loadPluginIfNecessaryWithError:]();
    }

    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F3A4A0];
    uint64_t v22 = *MEMORY[0x263F08320];
    v23[0] = @"No MLRuntimeTaskPrincipalClass Class found";
    v10 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v11 = [v13 errorWithDomain:v14 code:8001 userInfo:v10];
  }
  BOOL v6 = 0;
LABEL_13:

  if (a3 && !v6) {
    *a3 = v11;
  }

  return v6;
}

- (id)processTaskResult:(id)a3 forTask:(id)a4 duration:(double)a5 error:(id *)a6
{
  return 0;
}

- (id)createMLRTrialTaskWithTask:(id)a3
{
  id v3 = a3;
  v4 = [[MLRTrialTask alloc] initWithTrialTask:v3];

  return v4;
}

- (void)performSynchronouslyTrialTask:(id)a3 completion:(id)a4
{
  v79[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = (OS_os_transaction *)os_transaction_create();
  taskTransaction = self->_taskTransaction;
  self->_taskTransaction = v8;

  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__1;
  v70 = __Block_byref_object_dispose__1;
  id v71 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__1;
  v64 = __Block_byref_object_dispose__1;
  id v65 = 0;
  v10 = [MEMORY[0x263F3A438] coreChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[MLRExtensionRemoteContext performSynchronouslyTrialTask:completion:]((uint64_t)v6, v10);
  }

  id v11 = (id *)(v67 + 5);
  id obj = (id)v67[5];
  BOOL v12 = [(MLRExtensionRemoteContext *)self loadPluginIfNecessaryWithError:&obj];
  objc_storeStrong(v11, obj);
  if (v12)
  {
    v13 = [(MLRExtensionRemoteContext *)self plugin];
    int v14 = objc_opt_respondsToSelector();

    v15 = [(MLRExtensionRemoteContext *)self plugin];
    int v16 = objc_opt_respondsToSelector();

    if ((v14 | v16))
    {
      uint64_t v17 = (void *)MEMORY[0x21D4A5AA0]();
      v18 = [(MLRExtensionRemoteContext *)self createMLRTrialTaskWithTask:v6];
      if (v18)
      {
        if (v14)
        {
          v19 = [(MLRExtensionRemoteContext *)self plugin];
          uint64_t v20 = (id *)(v67 + 5);
          id v58 = (id)v67[5];
          uint64_t v21 = [v19 performTrialTask:v18 outError:&v58];
          objc_storeStrong(v20, v58);
          uint64_t v22 = v61[5];
          v61[5] = v21;
        }
        else
        {
          dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
          dispatch_queue_t v34 = [(MLRExtensionRemoteContext *)self plugin];
          v54[0] = MEMORY[0x263EF8330];
          v54[1] = 3221225472;
          v54[2] = __70__MLRExtensionRemoteContext_performSynchronouslyTrialTask_completion___block_invoke;
          v54[3] = &unk_2643F2008;
          v56 = &v60;
          v57 = &v66;
          v19 = v33;
          v55 = v19;
          [v34 performAsyncTrialTask:v18 completionHandler:v54];

          dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
          uint64_t v22 = v55;
        }

        if (v67[5])
        {
          v30 = [MEMORY[0x263F3A438] coreChannel];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v45 = [(MLRExtensionRemoteContext *)self plugin];
            uint64_t v46 = objc_opt_class();
            uint64_t v47 = v67[5];
            *(_DWORD *)buf = 138412546;
            uint64_t v73 = v46;
            __int16 v74 = 2112;
            uint64_t v75 = v47;
            _os_log_error_impl(&dword_21C376000, v30, OS_LOG_TYPE_ERROR, "Plugin=%@ return error=%@", buf, 0x16u);
          }
        }
        else
        {
          if (!v61[5])
          {
            v27 = 0;
            goto LABEL_19;
          }
          objc_super v37 = [MEMORY[0x263F3A438] coreChannel];
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            v50 = [(MLRExtensionRemoteContext *)self plugin];
            uint64_t v51 = objc_opt_class();
            uint64_t v52 = v61[5];
            *(_DWORD *)buf = 138412546;
            uint64_t v73 = v51;
            __int16 v74 = 2112;
            uint64_t v75 = v52;
            _os_log_debug_impl(&dword_21C376000, v37, OS_LOG_TYPE_DEBUG, "Plugin=%@ return result=%@", buf, 0x16u);
          }
          v38 = (void *)v61[5];
          v39 = (id *)(v67 + 5);
          id v53 = (id)v67[5];
          char v40 = [v38 submitForTask:v18 error:&v53];
          objc_storeStrong(v39, v53);
          if (v40)
          {
            v41 = [MLRInternalTrialTaskResult alloc];
            v30 = [(id)v61[5] JSONResult];
            v27 = [(MLRInternalTrialTaskResult *)v41 initWithJSONResult:v30];
            goto LABEL_18;
          }
          v30 = [MEMORY[0x263F3A438] coreChannel];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v42 = [(MLRExtensionRemoteContext *)self plugin];
            uint64_t v43 = objc_opt_class();
            uint64_t v44 = v67[5];
            *(_DWORD *)buf = 138412546;
            uint64_t v73 = v43;
            __int16 v74 = 2112;
            uint64_t v75 = v44;
            _os_log_error_impl(&dword_21C376000, v30, OS_LOG_TYPE_ERROR, "Fail to submit results for plugin=%@, error=%@", buf, 0x16u);
          }
        }
      }
      else
      {
        v28 = [MEMORY[0x263F3A438] coreChannel];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v48 = [(MLRExtensionRemoteContext *)self plugin];
          uint64_t v49 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          uint64_t v73 = v49;
          _os_log_error_impl(&dword_21C376000, v28, OS_LOG_TYPE_ERROR, "Cannot create MLRTrialTask for %@, missing entitlement?", buf, 0xCu);
        }
        v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v76 = *MEMORY[0x263F08320];
        v77 = @"fail to create MLRTrialTask.";
        v30 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        uint64_t v31 = [v29 errorWithDomain:*MEMORY[0x263F3A4A0] code:8010 userInfo:v30];
        v32 = (void *)v67[5];
        v67[5] = v31;
      }
      v27 = 0;
LABEL_18:

LABEL_19:
      goto LABEL_20;
    }
    dispatch_queue_t v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v78 = *MEMORY[0x263F08320];
    v79[0] = @"performTrialTask:outError: not implemented";
    v24 = [NSDictionary dictionaryWithObjects:v79 forKeys:&v78 count:1];
    uint64_t v25 = [v23 errorWithDomain:*MEMORY[0x263F3A4A0] code:8008 userInfo:v24];
    v26 = (void *)v67[5];
    v67[5] = v25;
  }
  v27 = 0;
LABEL_20:
  v35 = MLRSanitizeError((void *)v67[5]);
  v7[2](v7, v27, v35);

  v36 = self->_taskTransaction;
  self->_taskTransaction = 0;

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v66, 8);
}

void __70__MLRExtensionRemoteContext_performSynchronouslyTrialTask_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)performTrialTask:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  taskExecutionQueue = self->_taskExecutionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__MLRExtensionRemoteContext_performTrialTask_completion___block_invoke;
  block[3] = &unk_2643F2030;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(taskExecutionQueue, block);
}

uint64_t __57__MLRExtensionRemoteContext_performTrialTask_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSynchronouslyTrialTask:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (id)performSynchronouslyTask:(id)a3 sandBoxExtensions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (OS_os_transaction *)os_transaction_create();
  taskTransaction = self->_taskTransaction;
  self->_taskTransaction = v10;

  id v12 = [MEMORY[0x263F3A438] coreChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[MLRExtensionRemoteContext performSynchronouslyTask:sandBoxExtensions:error:](v8, v12);
  }

  id v28 = 0;
  BOOL v13 = [(MLRExtensionRemoteContext *)self loadPluginIfNecessaryWithError:&v28];
  id v14 = v28;
  v15 = v14;
  if (!v13)
  {
    int v16 = 0;
    v19 = 0;
    id v18 = v14;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (![v9 count])
  {
    uint64_t v25 = a5;
    int v16 = 0;
LABEL_10:
    uint64_t v20 = (void *)MEMORY[0x21D4A5AA0]();
    uint64_t v21 = [(MLRExtensionRemoteContext *)self plugin];
    id v26 = v15;
    v19 = [v8 performOnPlugin:v21 error:&v26];
    id v18 = v26;

    a5 = v25;
    if (!v25) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  int v16 = (void *)[objc_alloc(MEMORY[0x263F3A488]) initWithExtensions:v9];
  id v27 = v15;
  char v17 = [v16 consumeExtensionsWithError:&v27];
  id v18 = v27;

  if (v17)
  {
    uint64_t v25 = a5;
    v15 = v18;
    goto LABEL_10;
  }
  uint64_t v22 = [MEMORY[0x263F3A438] coreChannel];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[MLRExtensionRemoteContext performSynchronouslyTask:sandBoxExtensions:error:]((uint64_t)v9, (uint64_t)v18, v22);
  }

  v19 = 0;
  if (a5)
  {
LABEL_15:
    if (v18) {
      *a5 = v18;
    }
  }
LABEL_17:
  dispatch_queue_t v23 = self->_taskTransaction;
  self->_taskTransaction = 0;

  return v19;
}

- (void)performTask:(id)a3 sandBoxExtensions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  taskExecutionQueue = self->_taskExecutionQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__MLRExtensionRemoteContext_performTask_sandBoxExtensions_completion___block_invoke;
  v15[3] = &unk_2643F2058;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(taskExecutionQueue, v15);
}

void __70__MLRExtensionRemoteContext_performTask_sandBoxExtensions_completion___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v9 = 0;
  id v5 = [v2 performSynchronouslyTask:v3 sandBoxExtensions:v4 error:&v9];
  id v6 = v9;
  uint64_t v7 = a1[7];
  id v8 = MLRSanitizeError(v6);
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v5, v8);
}

- (void)stopSynchronously
{
  uint64_t v3 = (OS_os_transaction *)os_transaction_create();
  stopTransaction = self->_stopTransaction;
  self->_stopTransaction = v3;

  id v5 = [MEMORY[0x263F3A438] coreChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_21C376000, v5, OS_LOG_TYPE_DEFAULT, "Request plugin to stop", v8, 2u);
  }

  id v6 = [(MLRExtensionRemoteContext *)self plugin];
  [v6 stop];

  uint64_t v7 = self->_stopTransaction;
  self->_stopTransaction = 0;
}

- (void)stop
{
  stopQueue = self->_stopQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__MLRExtensionRemoteContext_stop__block_invoke;
  block[3] = &unk_2643F1F20;
  block[4] = self;
  dispatch_async(stopQueue, block);
}

uint64_t __33__MLRExtensionRemoteContext_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopSynchronously];
}

- (void)simulateCrash
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21C376000, log, OS_LOG_TYPE_FAULT, "Plugin did not terminate in timely fashion when asked to stop. The plugin should exit on request", v1, 2u);
}

- (OS_os_transaction)taskTransaction
{
  return self->_taskTransaction;
}

- (void)setTaskTransaction:(id)a3
{
}

- (OS_os_transaction)stopTransaction
{
  return self->_stopTransaction;
}

- (void)setStopTransaction:(id)a3
{
}

- (MLRTaskPerforming)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_stopTransaction, 0);
  objc_storeStrong((id *)&self->_taskTransaction, 0);
  objc_storeStrong((id *)&self->_stopQueue, 0);

  objc_storeStrong((id *)&self->_taskExecutionQueue, 0);
}

- (void)loadPluginIfNecessaryWithError:.cold.1()
{
  uint64_t v0 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v7 = [v0 bundleIdentifier];
  OUTLINED_FUNCTION_0_3(&dword_21C376000, v1, v2, "No class (%@) found for bundle=%@", v3, v4, v5, v6, 2u);
}

- (void)loadPluginIfNecessaryWithError:.cold.2()
{
  uint64_t v0 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v7 = [v0 bundleIdentifier];
  OUTLINED_FUNCTION_0_3(&dword_21C376000, v1, v2, "Cannot initiate class=%@ for bundle=%@", v3, v4, v5, v6, 2u);
}

- (void)performSynchronouslyTrialTask:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C376000, a2, OS_LOG_TYPE_DEBUG, "Request plugin to start Trial task %@.", (uint8_t *)&v2, 0xCu);
}

- (void)performSynchronouslyTask:(uint64_t)a1 sandBoxExtensions:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21C376000, log, OS_LOG_TYPE_ERROR, "Fail to consume extensions for %@ with error=%@", (uint8_t *)&v3, 0x16u);
}

- (void)performSynchronouslyTask:(void *)a1 sandBoxExtensions:(NSObject *)a2 error:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [a1 taskID];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_debug_impl(&dword_21C376000, a2, OS_LOG_TYPE_DEBUG, "Request plugin to start task %@.", (uint8_t *)&v4, 0xCu);
}

@end