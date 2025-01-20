@interface FMServerInteractionController
- (FMServerInteractionController)init;
- (NSOperationQueue)queue;
- (NSURLSession)session;
- (NSURLSessionConfiguration)sessionConfiguration;
- (double)_simulatedLatency;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)cancelAllCommands;
- (void)cancelCommand:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)processResponseForCommand:(id)a3 callback:(id)a4;
- (void)sendCommand:(id)a3 completionBlock:(id)a4;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionConfiguration:(id)a3;
@end

@implementation FMServerInteractionController

void __61__FMServerInteractionController_sendCommand_completionBlock___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [a1[4] _simulatedLatency];
  if (v3 <= 0.0)
  {
    id v6 = objc_loadWeakRetained(a1 + 7);
    [WeakRetained processResponseForCommand:v6 callback:a1[5]];
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__FMServerInteractionController_sendCommand_completionBlock___block_invoke_3;
    block[3] = &unk_1E689EC58;
    block[4] = WeakRetained;
    objc_copyWeak(&v9, a1 + 7);
    id v8 = a1[5];
    dispatch_after(v4, v5, block);

    objc_destroyWeak(&v9);
  }
}

- (void)processResponseForCommand:(id)a3 callback:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  objc_initWeak(&location, self);
  if (v7)
  {
    v7[2](v7);
    [v6 setCompletionBlock:0];
  }
  dq_inFlightCommands = self->dq_inFlightCommands;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__FMServerInteractionController_processResponseForCommand_callback___block_invoke;
  block[3] = &unk_1E689EB50;
  objc_copyWeak(&v12, &location);
  id v11 = v6;
  id v9 = v6;
  dispatch_sync(dq_inFlightCommands, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)sendCommand:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  dq_inFlightCommands = self->dq_inFlightCommands;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__FMServerInteractionController_sendCommand_completionBlock___block_invoke;
  block[3] = &unk_1E689EB50;
  objc_copyWeak(&v22, &location);
  id v9 = v6;
  id v21 = v9;
  dispatch_sync(dq_inFlightCommands, block);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __61__FMServerInteractionController_sendCommand_completionBlock___block_invoke_2;
  v15 = &unk_1E689EC80;
  objc_copyWeak(&v18, &location);
  v16 = self;
  objc_copyWeak(&v19, &from);
  id v10 = v7;
  id v17 = v10;
  [v9 setCompletionBlock:&v12];
  objc_msgSend(v9, "setServerInteractionController:", self, v12, v13, v14, v15, v16);
  id v11 = [(FMServerInteractionController *)self queue];
  [v11 addOperation:v9];

  [(FMServerInteractionController *)self networkActivityStatus:1];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __68__FMServerInteractionController_processResponseForCommand_callback___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[2] removeObject:*(void *)(a1 + 32)];
  if (![WeakRetained[2] count]) {
    [WeakRetained networkActivityStatus:0];
  }
}

void __61__FMServerInteractionController_sendCommand_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[2] addObject:*(void *)(a1 + 32)];
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (double)_simulatedLatency
{
  if (_simulatedLatency_onceToken != -1) {
    dispatch_once(&_simulatedLatency_onceToken, &__block_literal_global_6);
  }
  return *(double *)&_simulatedLatency_retValue;
}

- (void)dealloc
{
  dq_inFlightCommands = self->dq_inFlightCommands;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__FMServerInteractionController_dealloc__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  void block[4] = self;
  dispatch_sync(dq_inFlightCommands, block);
  v4.receiver = self;
  v4.super_class = (Class)FMServerInteractionController;
  [(FMServerInteractionController *)&v4 dealloc];
}

void __40__FMServerInteractionController_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (FMServerInteractionController)init
{
  v18.receiver = self;
  v18.super_class = (Class)FMServerInteractionController;
  v2 = [(FMServerInteractionController *)&v18 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.icloud.iscommon.FMServerInteractionController", 0);
    dq_inFlightCommands = v2->dq_inFlightCommands;
    v2->dq_inFlightCommands = (OS_dispatch_queue *)v3;

    v5 = v2->dq_inFlightCommands;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __37__FMServerInteractionController_init__block_invoke;
    v15 = &unk_1E689E6E0;
    objc_copyWeak(&v16, &location);
    dispatch_sync(v5, &v12);
    id v6 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    -[FMServerInteractionController setQueue:](v2, "setQueue:", v6, v12, v13, v14, v15);

    id v7 = (void *)MEMORY[0x1E4F290E0];
    id v8 = [(FMServerInteractionController *)v2 sessionConfiguration];
    id v9 = [(FMServerInteractionController *)v2 queue];
    id v10 = [v7 sessionWithConfiguration:v8 delegate:v2 delegateQueue:v9];
    [(FMServerInteractionController *)v2 setSession:v10];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __37__FMServerInteractionController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v2 = (void *)WeakRetained[2];
  WeakRetained[2] = v1;
}

void __50__FMServerInteractionController__simulatedLatency__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v0 objectForKey:@"FMSimulateLatency"];

  id v1 = v3;
  if (v3)
  {
    [v3 doubleValue];
    id v1 = v3;
    _simulatedLatency_retValue = v2;
  }
}

- (NSURLSessionConfiguration)sessionConfiguration
{
  sessionConfiguration = self->_sessionConfiguration;
  if (!sessionConfiguration)
  {
    objc_super v4 = [MEMORY[0x1E4F28B50] mainBundle];
    v5 = [v4 bundleIdentifier];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:v5];
    id v7 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    id v8 = self->_sessionConfiguration;
    self->_sessionConfiguration = v7;

    [(NSURLSessionConfiguration *)self->_sessionConfiguration set_appleIDContext:v6];
    sessionConfiguration = self->_sessionConfiguration;
  }
  return sessionConfiguration;
}

void __61__FMServerInteractionController_sendCommand_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v2 processResponseForCommand:WeakRetained callback:*(void *)(a1 + 40)];
}

- (void)cancelCommand:(id)a3
{
}

- (void)cancelAllCommands
{
  objc_initWeak(&location, self);
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  dq_inFlightCommands = self->dq_inFlightCommands;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__FMServerInteractionController_cancelAllCommands__block_invoke;
  block[3] = &unk_1E689ECA8;
  objc_copyWeak(&v5, &location);
  void block[4] = &v6;
  dispatch_sync(dq_inFlightCommands, block);
  [(id)v7[5] enumerateObjectsWithOptions:1 usingBlock:&__block_literal_global_13];
  objc_destroyWeak(&v5);
  _Block_object_dispose(&v6, 8);

  objc_destroyWeak(&location);
}

void __50__FMServerInteractionController_cancelAllCommands__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained[2] allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [WeakRetained[2] removeAllObjects];
}

uint64_t __50__FMServerInteractionController_cancelAllCommands__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (void)invalidate
{
  uint64_t v3 = [(FMServerInteractionController *)self session];
  [v3 invalidateAndCancel];

  [(FMServerInteractionController *)self setSession:0];
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = LogCategory_Networking();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1D0EC4000, v7, OS_LOG_TYPE_DEFAULT, "session: [%@] didBecomeInvalidWithError: [%@]", (uint8_t *)&v8, 0x16u);
  }
}

- (void)setQueue:(id)a3
{
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void)setSessionConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->inFlightCommands, 0);
  objc_storeStrong((id *)&self->dq_inFlightCommands, 0);
}

@end