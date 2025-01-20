@interface VSJSApp
+ (id)currentContext;
- (BOOL)enforceSystemTrust;
- (JSContext)context;
- (NSMutableArray)scriptEvaluators;
- (NSOperationQueue)privateQueue;
- (NSString)script;
- (NSURL)effectiveURL;
- (NSURL)url;
- (OS_dispatch_source)watchdog;
- (VSJSApp)initWithScriptURL:(id)a3;
- (VSJSAppDelegate)delegate;
- (VSSingleThreadDispatchQueue)jsSingleThreadQueue;
- (VSStateMachine)stateMachine;
- (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4;
- (id)_exceptionErrorWithCode:(int64_t)a3;
- (int64_t)state;
- (void)_configureWatchdogWithSeconds:(unint64_t)a3;
- (void)_initializeContext;
- (void)_invokeOnExit;
- (void)_invokeOnLaunch;
- (void)evaluateScript:(id)a3 withSourceURL:(id)a4;
- (void)evaluateWithBlock:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectiveURL:(id)a3;
- (void)setEnforceSystemTrust:(BOOL)a3;
- (void)setExceptionWithMessage:(id)a3;
- (void)setJsSingleThreadQueue:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setScript:(id)a3;
- (void)setScriptEvaluators:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateMachine:(id)a3;
- (void)setUrl:(id)a3;
- (void)setWatchdog:(id)a3;
- (void)start;
- (void)stop;
- (void)transitionToErrorState;
- (void)transitionToReadyState;
- (void)transitionToStoppedState;
- (void)transitionToWaitingForBootScriptState;
- (void)transitionToWaitingForBootUrlState;
- (void)transitionToWaitingForOnExitCallbackState;
- (void)transitionToWaitingForOnLaunchCallbackState;
@end

@implementation VSJSApp

- (VSJSApp)initWithScriptURL:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VSJSApp;
  v6 = [(VSJSApp *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = v7;
    v9 = [[VSSingleThreadDispatchQueue alloc] initWithName:@"VSJSContext JS"];
    jsSingleThreadQueue = v8->_jsSingleThreadQueue;
    v8->_jsSingleThreadQueue = v9;

    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    privateQueue = v8->_privateQueue;
    v8->_privateQueue = v11;

    v13 = v8->_privateQueue;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [(NSOperationQueue *)v13 setName:v15];

    v8->_state = 0;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    scriptEvaluators = v8->_scriptEvaluators;
    v8->_scriptEvaluators = v16;

    v18 = objc_alloc_init(VSStateMachine);
    stateMachine = v8->_stateMachine;
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    [(VSStateMachine *)stateMachine setName:v21];

    v22 = v8->_stateMachine;
    v8->_stateMachine = v18;
    v23 = v18;

    [(VSStateMachine *)v23 setDelegate:v8];
    [(VSStateMachine *)v23 setDestinationState:@"Waiting For Boot URL" forEvent:@"Start" inState:@"Initial"];
    [(VSStateMachine *)v23 setDestinationState:@"Stopped" forEvent:@"Stop" inState:@"Initial"];
    [(VSStateMachine *)v23 setDestinationState:@"Waiting For Boot Script" forEvent:@"Fetched Boot URL" inState:@"Waiting For Boot URL"];
    [(VSStateMachine *)v23 setDestinationState:@"Error" forEvent:@"Error" inState:@"Waiting For Boot URL"];
    [(VSStateMachine *)v23 setDestinationState:@"Waiting For On Launch Callback" forEvent:@"Fetching Boot Script" inState:@"Waiting For Boot Script"];
    [(VSStateMachine *)v23 setDestinationState:@"Error" forEvent:@"Error" inState:@"Waiting For Boot Script"];
    [(VSStateMachine *)v23 setDestinationState:@"Ready" forEvent:@"Invoked OnLaunch Callback" inState:@"Waiting For On Launch Callback"];
    [(VSStateMachine *)v23 setDestinationState:@"Error" forEvent:@"Error" inState:@"Waiting For On Launch Callback"];
    [(VSStateMachine *)v23 setDestinationState:@"Error" forEvent:@"Timed Out" inState:@"Waiting For On Launch Callback"];
    [(VSStateMachine *)v23 setDestinationState:@"Waiting For On Exit Callback" forEvent:@"Stop" inState:@"Ready"];
    [(VSStateMachine *)v23 setDestinationState:@"Waiting For On Exit Callback" forEvent:@"Invoked OnExit" inState:@"Ready"];
    [(VSStateMachine *)v23 setDestinationState:@"Stopped" forEvent:@"Received OnExit Callback" inState:@"Waiting For On Exit Callback"];
    [(VSStateMachine *)v23 setDestinationState:@"Error" forEvent:@"Error" inState:@"Waiting For On Exit Callback"];
    [(VSStateMachine *)v23 setDestinationState:@"Error" forEvent:@"Timed Out" inState:@"Waiting For On Exit Callback"];
    [(VSStateMachine *)v23 activateWithState:@"Initial"];
  }
  return v7;
}

+ (id)currentContext
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [MEMORY[0x1E4F29060] currentThread];
    int v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "currentContext thread=%@", (uint8_t *)&v8, 0xCu);
  }
  v4 = [MEMORY[0x1E4F29060] currentThread];
  id v5 = [v4 threadDictionary];
  v6 = [v5 objectForKeyedSubscript:@"VSJSContextThread"];

  return v6;
}

- (void)setExceptionWithMessage:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v9];

  v7 = [(VSJSApp *)self context];
  int v8 = [MEMORY[0x1E4F30938] valueWithNewErrorFromMessage:v6 inContext:v7];
  [v7 setException:v8];
}

- (void)evaluateWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(VSJSApp *)self jsSingleThreadQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__VSJSApp_evaluateWithBlock___block_invoke;
  v7[3] = &unk_1E6BD3AB8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 dispatchBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __29__VSJSApp_evaluateWithBlock___block_invoke(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 40))) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

- (void)evaluateScript:(id)a3 withSourceURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__VSJSApp_evaluateScript_withSourceURL___block_invoke;
  v10[3] = &unk_1E6BD4838;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(VSJSApp *)self evaluateWithBlock:v10];
}

void __40__VSJSApp_evaluateScript_withSourceURL___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 context];
  id v3 = (id)[v4 evaluateScript:*(void *)(a1 + 32) withSourceURL:*(void *)(a1 + 40)];
}

- (void)start
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[VSJSApp start]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  [(VSJSApp *)self setState:1];
  id v4 = [(VSJSApp *)self jsSingleThreadQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __16__VSJSApp_start__block_invoke;
  v5[3] = &unk_1E6BD4860;
  v5[4] = self;
  [v4 startWithCompletionHandler:v5];
}

void __16__VSJSApp_start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 underlyingThread];
  id v4 = [v3 threadDictionary];
  [v4 setObject:*(void *)(a1 + 32) forKey:@"VSJSContextThread"];

  [*(id *)(a1 + 32) _initializeContext];
  id v5 = [*(id *)(a1 + 32) stateMachine];
  [v5 enqueueEvent:@"Start"];
}

- (void)stop
{
  id v2 = [(VSJSApp *)self stateMachine];
  [v2 enqueueEvent:@"Stop"];
}

- (void)_initializeContext
{
  objc_initWeak(&location, self);
  id v3 = [(VSJSApp *)self jsSingleThreadQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__VSJSApp__initializeContext__block_invoke;
  v4[3] = &unk_1E6BD35C8;
  objc_copyWeak(&v5, &location);
  [v3 dispatchBlockSync:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __29__VSJSApp__initializeContext__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F30920]);
    [WeakRetained setContext:v2];
    id v3 = [WeakRetained jsSingleThreadQueue];
    objc_msgSend(v2, "_setDebuggerRunLoop:", objc_msgSend(v3, "underlyingRunLoop"));

    [v2 setExceptionHandler:&__block_literal_global_53];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v2 setObject:v4 forKeyedSubscript:@"App"];
    [v2 setObject:objc_opt_class() forKeyedSubscript:@"Error"];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v5 setObject:&__block_literal_global_100 forKey:@"log"];
    [v5 setObject:&__block_literal_global_103 forKey:@"error"];
    [v2 setObject:v5 forKeyedSubscript:@"console"];
    [v2 setObject:objc_opt_class() forKeyedSubscript:@"XMLHttpRequest"];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __29__VSJSApp__initializeContext__block_invoke_105;
    aBlock[3] = &unk_1E6BD48C8;
    aBlock[4] = WeakRetained;
    id v6 = _Block_copy(aBlock);
    [v2 setObject:v6 forKeyedSubscript:@"makeXMLHttpRequest"];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __29__VSJSApp__initializeContext__block_invoke_2_107;
    v9[3] = &unk_1E6BD4918;
    v9[4] = WeakRetained;
    id v7 = _Block_copy(v9);
    [v2 setObject:v7 forKeyedSubscript:@"evaluateScripts"];

    uint64_t v8 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 app:WeakRetained prewarmWithContext:v2];
    }
  }
}

void __29__VSJSApp__initializeContext__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __29__VSJSApp__initializeContext__block_invoke_2_cold_1();
  }
}

void __29__VSJSApp__initializeContext__block_invoke_97(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "[JS][LOG] %@", (uint8_t *)&v4, 0xCu);
  }
}

void __29__VSJSApp__initializeContext__block_invoke_101(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __29__VSJSApp__initializeContext__block_invoke_101_cold_1();
  }
}

VSJSXMLHTTPRequest *__29__VSJSApp__initializeContext__block_invoke_105(uint64_t a1)
{
  v1 = [[VSJSXMLHTTPRequest alloc] initWithContext:*(void *)(a1 + 32)];

  return v1;
}

void __29__VSJSApp__initializeContext__block_invoke_2_107(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [[VSJSAppScriptEvaluator alloc] initWithApp:*(void *)(a1 + 32) urls:v5];
  objc_initWeak(&location, v7);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __29__VSJSApp__initializeContext__block_invoke_3;
  v15 = &unk_1E6BD48F0;
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 32);
  id v16 = v8;
  uint64_t v17 = v9;
  objc_copyWeak(&v18, &location);
  [(VSJSAppScriptEvaluator *)v7 setCompletionBlock:&v12];
  [(VSJSAppScriptEvaluator *)v7 start];
  id v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  id v11 = [*(id *)(a1 + 32) scriptEvaluators];
  [v11 addObject:v7];

  objc_sync_exit(v10);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

void __29__VSJSApp__initializeContext__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v6), "loaded", (void)v17))
        {
          uint64_t v7 = 0;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 1;
LABEL_11:

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = (void *)MEMORY[0x1E4F30938];
  id v10 = [*(id *)(a1 + 40) context];
  id v11 = [v9 valueWithBool:v7 inContext:v10];
  v21 = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  id v13 = (id)[v8 callWithArguments:v12];

  id v14 = *(id *)(a1 + 40);
  objc_sync_enter(v14);
  v15 = [*(id *)(a1 + 40) scriptEvaluators];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v15 removeObject:WeakRetained];

  objc_sync_exit(v14);
}

- (void)_invokeOnLaunch
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VSJSApp _invokeOnLaunch]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = [(VSJSApp *)self url];
  uint64_t v6 = [v5 absoluteString];
  BOOL v7 = v6 == 0;

  if (v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [[self url] absoluteString] parameter must not be nil."];
  }
  id v8 = [(VSJSApp *)self url];
  uint64_t v9 = [v8 absoluteString];

  [v4 setObject:v9 forKey:@"location"];
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __26__VSJSApp__invokeOnLaunch__block_invoke;
  v11[3] = &unk_1E6BD4968;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v4;
  id v12 = v10;
  [(VSJSApp *)self evaluateWithBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __26__VSJSApp__invokeOnLaunch__block_invoke(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F30938];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __26__VSJSApp__invokeOnLaunch__block_invoke_2;
    aBlock[3] = &unk_1E6BD4940;
    aBlock[4] = WeakRetained;
    BOOL v7 = _Block_copy(aBlock);
    id v8 = [v3 context];
    uint64_t v9 = [v6 valueWithObject:v7 inContext:v8];

    [*(id *)(a1 + 32) setObject:v9 forKey:@"callback"];
    [v5 _configureWatchdogWithSeconds:20];
    id v10 = [v3 context];
    id v11 = [v10 objectForKeyedSubscript:@"App"];

    v22[0] = *(void *)(a1 + 32);
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    id v13 = (id)[v11 invokeMethod:@"onLaunch" withArguments:v12];

    id v14 = [v3 context];
    v15 = [v14 exception];

    if (v15)
    {
      uint64_t v16 = [v5 _exceptionErrorWithCode:0];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __26__VSJSApp__invokeOnLaunch__block_invoke_119;
      block[3] = &unk_1E6BD2C38;
      block[4] = v5;
      id v20 = v16;
      id v17 = v16;
      dispatch_async(MEMORY[0x1E4F14428], block);
      long long v18 = [v5 stateMachine];
      [v18 enqueueEvent:@"Error"];
    }
  }
}

void __26__VSJSApp__invokeOnLaunch__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  BOOL v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "onLaunch callback invoked", v12, 2u);
  }

  [*(id *)(a1 + 32) _configureWatchdogWithSeconds:0];
  char v8 = [v6 toBool];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = VSErrorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __26__VSJSApp__invokeOnLaunch__block_invoke_2_cold_1(v5, v9);
    }

    id v10 = [*(id *)(a1 + 32) stateMachine];
    [v10 enqueueEvent:@"Error"];
  }
  id v11 = [*(id *)(a1 + 32) stateMachine];
  [v11 enqueueEvent:@"Invoked OnLaunch Callback"];
}

void __26__VSJSApp__invokeOnLaunch__block_invoke_119(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 app:*(void *)(a1 + 32) didFailToStartWithError:*(void *)(a1 + 40)];
}

- (void)_invokeOnExit
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __24__VSJSApp__invokeOnExit__block_invoke;
  v3[3] = &unk_1E6BD4398;
  objc_copyWeak(&v4, &location);
  [(VSJSApp *)self evaluateWithBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __24__VSJSApp__invokeOnExit__block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)MEMORY[0x1E4F30938];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __24__VSJSApp__invokeOnExit__block_invoke_2;
    aBlock[3] = &unk_1E6BD29A8;
    aBlock[4] = WeakRetained;
    BOOL v7 = _Block_copy(aBlock);
    char v8 = [v3 context];
    uint64_t v9 = [v6 valueWithObject:v7 inContext:v8];

    [v5 _configureWatchdogWithSeconds:10];
    id v10 = [v3 context];
    id v11 = [v10 objectForKeyedSubscript:@"App"];

    v15[0] = v9;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v13 = (id)[v11 invokeMethod:@"onExit" withArguments:v12];
  }
}

void __24__VSJSApp__invokeOnExit__block_invoke_2(uint64_t a1)
{
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "onExit callback invoked", v4, 2u);
  }

  [*(id *)(a1 + 32) _configureWatchdogWithSeconds:0];
  id v3 = [*(id *)(a1 + 32) stateMachine];
  [v3 enqueueEvent:@"Received OnExit Callback"];
}

- (void)_configureWatchdogWithSeconds:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = [(VSJSApp *)self watchdog];
  id v6 = VSDefaultLogObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v15 = a3;
      _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Configuring watchdog timer for %lu seconds", buf, 0xCu);
    }

    if (v5)
    {
      dispatch_source_cancel(v5);
      [(VSJSApp *)self setWatchdog:0];
    }
    char v8 = [(VSJSApp *)self privateQueue];
    uint64_t v9 = [v8 underlyingQueue];
    id v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v9);

    dispatch_time_t v11 = dispatch_time(0, 1000000000 * a3);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak((id *)buf, self);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __41__VSJSApp__configureWatchdogWithSeconds___block_invoke;
    handler[3] = &unk_1E6BD35C8;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_source_set_event_handler(v10, handler);
    [(VSJSApp *)self setWatchdog:v10];
    dispatch_activate(v10);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
    goto LABEL_11;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling watchdog timer", buf, 2u);
  }

  if (v5)
  {
    dispatch_source_cancel(v5);
    [(VSJSApp *)self setWatchdog:0];
    id v10 = v5;
LABEL_11:
  }
}

void __41__VSJSApp__configureWatchdogWithSeconds___block_invoke(uint64_t a1)
{
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Watchdog timer fired.", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained stateMachine];
    [v5 enqueueEvent:@"Timed Out"];
  }
}

- (void)transitionToWaitingForBootUrlState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v19 = "-[VSJSApp transitionToWaitingForBootUrlState]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v4 = [VSApplicationBootURLOperation alloc];
  id v5 = [(VSJSApp *)self url];
  id v6 = [(VSApplicationBootURLOperation *)v4 initWithBootURL:v5 isDeveloper:0];

  [(VSApplicationBootURLOperation *)v6 setSkipSystemTrustVerification:[(VSJSApp *)self enforceSystemTrust] ^ 1];
  objc_initWeak((id *)buf, self);
  BOOL v7 = (void *)MEMORY[0x1E4F28B48];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke;
  unint64_t v15 = &unk_1E6BD49B8;
  objc_copyWeak(&v17, (id *)buf);
  char v8 = v6;
  uint64_t v16 = v8;
  uint64_t v9 = [v7 blockOperationWithBlock:&v12];
  objc_msgSend(v9, "addDependency:", v8, v12, v13, v14, v15);
  id v10 = [(VSJSApp *)self privateQueue];
  [v10 addOperation:v8];

  dispatch_time_t v11 = [(VSJSApp *)self privateQueue];
  [v11 addOperation:v9];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) urlOrError];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_2;
    v5[3] = &unk_1E6BD4990;
    v5[4] = WeakRetained;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_123;
    v4[3] = &unk_1E6BD28B0;
    void v4[4] = WeakRetained;
    [v3 unwrapObject:v5 error:v4];
  }
}

void __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Fetched final boot URL: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) setEffectiveURL:v3];
  id v5 = [*(id *)(a1 + 32) stateMachine];
  [v5 enqueueEvent:@"Fetched Boot URL"];
}

void __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_123(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_123_cold_1();
  }

  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = VSJSAppErrorDomain;
  uint64_t v13 = *MEMORY[0x1E4F28A50];
  v14[0] = v3;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v8 = [v5 errorWithDomain:v6 code:1 userInfo:v7];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_126;
  block[3] = &unk_1E6BD2C38;
  block[4] = *(void *)(a1 + 32);
  id v12 = v8;
  id v9 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
  id v10 = [*(id *)(a1 + 32) stateMachine];
  [v10 enqueueEvent:@"Error"];
}

void __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_126(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 app:*(void *)(a1 + 32) didFailToStartWithError:*(void *)(a1 + 40)];
}

- (id)_errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v5;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:VSJSAppErrorDomain code:a3 userInfo:v7];

  return v8;
}

- (id)_exceptionErrorWithCode:(int64_t)a3
{
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = VSJSAppErrorDomain;
  uint64_t v6 = [(VSJSApp *)self context];
  id v7 = [v6 exception];
  uint64_t v8 = [v7 toDictionary];
  id v9 = [v4 errorWithDomain:v5 code:a3 userInfo:v8];

  return v9;
}

- (void)transitionToWaitingForBootScriptState
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v18 = "-[VSJSApp transitionToWaitingForBootScriptState]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v4 = [(VSJSApp *)self effectiveURL];
  BOOL v5 = v4 == 0;

  if (v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [self effectiveURL] parameter must not be nil."];
  }
  uint64_t v6 = [(VSJSApp *)self effectiveURL];
  id v7 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
  uint64_t v8 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v7 delegate:0 delegateQueue:0];
  objc_initWeak((id *)buf, self);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke;
  id v14 = &unk_1E6BD4348;
  objc_copyWeak(&v16, (id *)buf);
  id v9 = v6;
  id v15 = v9;
  uint64_t v10 = [v8 dataTaskWithURL:v9 completionHandler:&v11];
  objc_msgSend(v10, "resume", v11, v12, v13, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = VSDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v52 = v8;
    _os_log_impl(&dword_1DA674000, v10, OS_LOG_TYPE_DEFAULT, "Got response for boot script: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v9)
    {
      uint64_t v12 = VSErrorLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_cold_3();
      }

      uint64_t v13 = [WeakRetained _errorWithCode:1 underlyingError:v9];
      uint64_t v39 = MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      v41 = __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_140;
      v42 = &unk_1E6BD2C38;
      id v43 = WeakRetained;
      v44 = v13;
      id v14 = v13;
      dispatch_async(MEMORY[0x1E4F14428], &v39);
      id v15 = objc_msgSend(WeakRetained, "stateMachine", v39, v40, v41, v42, v43);
      [v15 enqueueEvent:@"Error"];

      id v16 = v44;
    }
    else
    {
      if (v7)
      {
        id v14 = v7;
        id v17 = (void *)[[NSString alloc] initWithData:v14 encoding:4];
        if (v17)
        {
          [WeakRetained setScript:v17];
          long long v18 = VSDefaultLogObject();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA674000, v18, OS_LOG_TYPE_DEFAULT, "Will evaluate boot script", buf, 2u);
          }

          uint64_t v19 = [WeakRetained jsSingleThreadQueue];
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_136;
          v49[3] = &unk_1E6BD2C38;
          v49[4] = WeakRetained;
          id v50 = v17;
          [v19 dispatchBlock:v49];
        }
        else
        {
          v29 = VSErrorLogObject();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_cold_2(a1, v29, v30, v31, v32, v33, v34, v35);
          }

          v36 = [WeakRetained _errorWithCode:2 underlyingError:0];
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_138;
          v47[3] = &unk_1E6BD2C38;
          v47[4] = WeakRetained;
          id v48 = v36;
          id v37 = v36;
          dispatch_async(MEMORY[0x1E4F14428], v47);
          v38 = [WeakRetained stateMachine];
          [v38 enqueueEvent:@"Error"];
        }
        goto LABEL_21;
      }
      uint64_t v20 = VSErrorLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_cold_1(a1, v20, v21, v22, v23, v24, v25, v26);
      }

      v27 = [WeakRetained _errorWithCode:2 underlyingError:0];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_139;
      block[3] = &unk_1E6BD2C38;
      block[4] = WeakRetained;
      v46 = v27;
      id v14 = v27;
      dispatch_async(MEMORY[0x1E4F14428], block);
      v28 = [WeakRetained stateMachine];
      [v28 enqueueEvent:@"Error"];

      id v16 = v46;
    }

LABEL_21:
  }
}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_136(uint64_t a1)
{
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Evaluating boot script...", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) context];
  id v4 = (id)[v3 evaluateScript:*(void *)(a1 + 40)];

  BOOL v5 = [*(id *)(a1 + 32) context];
  uint64_t v6 = [v5 exception];

  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    id v8 = [v7 _exceptionErrorWithCode:0];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_137;
    id v14 = &unk_1E6BD2C38;
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = v8;
    id v9 = v8;
    dispatch_async(MEMORY[0x1E4F14428], &v11);
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "stateMachine", v11, v12, v13, v14, v15);
    [v10 enqueueEvent:@"Error"];
  }
  else
  {
    id v9 = [v7 stateMachine];
    [v9 enqueueEvent:@"Fetching Boot Script"];
  }
}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_137(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 app:*(void *)(a1 + 32) didFailToStartWithError:*(void *)(a1 + 40)];
}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_138(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 app:*(void *)(a1 + 32) didFailToStartWithError:*(void *)(a1 + 40)];
}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_139(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 app:*(void *)(a1 + 32) didFailToStartWithError:*(void *)(a1 + 40)];
}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_140(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 app:*(void *)(a1 + 32) didFailToStartWithError:*(void *)(a1 + 40)];
}

- (void)transitionToWaitingForOnLaunchCallbackState
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[VSJSApp transitionToWaitingForOnLaunchCallbackState]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v4, 0xCu);
  }

  [(VSJSApp *)self _invokeOnLaunch];
}

- (void)transitionToWaitingForOnExitCallbackState
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[VSJSApp transitionToWaitingForOnExitCallbackState]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v4, 0xCu);
  }

  [(VSJSApp *)self _invokeOnExit];
}

- (void)transitionToReadyState
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[VSJSApp transitionToReadyState]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__VSJSApp_transitionToReadyState__block_invoke;
  block[3] = &unk_1E6BD29A8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __33__VSJSApp_transitionToReadyState__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 appDidStart:*(void *)(a1 + 32)];
}

- (void)transitionToErrorState
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Application stopped in error state.", v1, 2u);
}

- (void)transitionToStoppedState
{
  id v3 = [(VSJSApp *)self jsSingleThreadQueue];
  [v3 stop];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__VSJSApp_transitionToStoppedState__block_invoke;
  block[3] = &unk_1E6BD29A8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __35__VSJSApp_transitionToStoppedState__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 appDidStop:*(void *)(a1 + 32)];
}

- (JSContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (VSJSAppDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VSJSAppDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)enforceSystemTrust
{
  return self->_enforceSystemTrust;
}

- (void)setEnforceSystemTrust:(BOOL)a3
{
  self->_enforceSystemTrust = a3;
}

- (NSString)script
{
  return self->_script;
}

- (void)setScript:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)effectiveURL
{
  return self->_effectiveURL;
}

- (void)setEffectiveURL:(id)a3
{
}

- (VSSingleThreadDispatchQueue)jsSingleThreadQueue
{
  return self->_jsSingleThreadQueue;
}

- (void)setJsSingleThreadQueue:(id)a3
{
}

- (VSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (OS_dispatch_source)watchdog
{
  return self->_watchdog;
}

- (void)setWatchdog:(id)a3
{
}

- (NSMutableArray)scriptEvaluators
{
  return self->_scriptEvaluators;
}

- (void)setScriptEvaluators:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptEvaluators, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_jsSingleThreadQueue, 0);
  objc_storeStrong((id *)&self->_effectiveURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_script, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_context, 0);
}

void __29__VSJSApp__initializeContext__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "[JS][Exception] %@", v2, v3, v4, v5, v6);
}

void __29__VSJSApp__initializeContext__block_invoke_101_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "[JS][ERROR LOG] %@", v2, v3, v4, v5, v6);
}

void __26__VSJSApp__invokeOnLaunch__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 message];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "App indicated it is not ready to receive requests with error %@", v4, 0xCu);
}

void __45__VSJSApp_transitionToWaitingForBootUrlState__block_invoke_123_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching boot URL: %@", v2, v3, v4, v5, v6);
}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, a2, a3, "No JS returned for URL %@", a5, a6, a7, a8, 2u);
}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, a2, a3, "Unexpected encoding for JS returned with URL %@", a5, a6, a7, a8, 2u);
}

void __48__VSJSApp_transitionToWaitingForBootScriptState__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching boot script: %@", v2, v3, v4, v5, v6);
}

@end