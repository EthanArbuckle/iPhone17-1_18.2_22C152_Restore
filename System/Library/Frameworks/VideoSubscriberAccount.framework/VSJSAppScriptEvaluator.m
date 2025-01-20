@interface VSJSAppScriptEvaluator
- (NSArray)urls;
- (NSMutableArray)remainingURLs;
- (NSMutableArray)results;
- (NSString)currentURL;
- (VSJSApp)app;
- (VSJSAppScriptEvaluator)initWithApp:(id)a3 urls:(id)a4;
- (VSStateMachine)stateMachine;
- (id)completionBlock;
- (void)setApp:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCurrentURL:(id)a3;
- (void)setRemainingURLs:(id)a3;
- (void)setResults:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)start;
- (void)transitionToDoneState;
- (void)transitionToEnqueueingNextUrlState;
- (void)transitionToFetchingScriptState;
@end

@implementation VSJSAppScriptEvaluator

- (VSJSAppScriptEvaluator)initWithApp:(id)a3 urls:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)VSJSAppScriptEvaluator;
  v9 = [(VSJSAppScriptEvaluator *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_app, a3);
    uint64_t v11 = [v8 copy];
    urls = v10->_urls;
    v10->_urls = (NSArray *)v11;

    uint64_t v13 = [(NSArray *)v10->_urls mutableCopy];
    remainingURLs = v10->_remainingURLs;
    v10->_remainingURLs = (NSMutableArray *)v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    results = v10->_results;
    v10->_results = v15;

    v17 = objc_alloc_init(VSStateMachine);
    stateMachine = v10->_stateMachine;
    v10->_stateMachine = v17;

    v19 = v10->_stateMachine;
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    [(VSStateMachine *)v19 setName:v21];

    [(VSStateMachine *)v10->_stateMachine setDelegate:v10];
    [(VSStateMachine *)v10->_stateMachine setDestinationState:@"Enqueueing Next URL" forEvent:@"Start" inState:@"Idle"];
    [(VSStateMachine *)v10->_stateMachine setDestinationState:@"Fetching Script" forEvent:@"Enqueued Next URL" inState:@"Enqueueing Next URL"];
    [(VSStateMachine *)v10->_stateMachine setDestinationState:@"Done" forEvent:@"Done" inState:@"Enqueueing Next URL"];
    [(VSStateMachine *)v10->_stateMachine setDestinationState:@"Enqueueing Next URL" forEvent:@"Done" inState:@"Fetching Script"];
    [(VSStateMachine *)v10->_stateMachine setDestinationState:@"Enqueueing Next URL" forEvent:@"Error" inState:@"Fetching Script"];
    [(VSStateMachine *)v10->_stateMachine activateWithState:@"Idle"];
  }

  return v10;
}

- (void)start
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(VSJSAppScriptEvaluator *)self stateMachine];
  v4 = [v3 currentState];
  v5 = [v4 forceUnwrapObject];
  char v6 = [v5 isEqual:@"Idle"];

  if ((v6 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"-start invoked in non-idle state."];
  }
  id v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(VSJSAppScriptEvaluator *)self urls];
    int v9 = 134217984;
    uint64_t v10 = [v8 count];
    _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Starting script evaluation for %lu URLs", (uint8_t *)&v9, 0xCu);
  }
  [v3 enqueueEvent:@"Start"];
}

- (void)transitionToEnqueueingNextUrlState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[VSJSAppScriptEvaluator transitionToEnqueueingNextUrlState]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v12, 0xCu);
  }

  v4 = [(VSJSAppScriptEvaluator *)self remainingURLs];
  v5 = [v4 firstObject];

  char v6 = VSDefaultLogObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v12 = 138412290;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Enqueued URL: %@", (uint8_t *)&v12, 0xCu);
    }

    id v8 = [(VSJSAppScriptEvaluator *)self remainingURLs];
    [v8 removeObject:v5];

    [(VSJSAppScriptEvaluator *)self setCurrentURL:v5];
    int v9 = [(VSJSAppScriptEvaluator *)self stateMachine];
    uint64_t v10 = v9;
    uint64_t v11 = @"Enqueued Next URL";
  }
  else
  {
    if (v7)
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "No remaining URLs for evaluation.", (uint8_t *)&v12, 2u);
    }

    int v9 = [(VSJSAppScriptEvaluator *)self stateMachine];
    uint64_t v10 = v9;
    uint64_t v11 = @"Done";
  }
  [v9 enqueueEvent:v11];
}

- (void)transitionToFetchingScriptState
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 currentURL];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Invalid URL: %@", (uint8_t *)&v4, 0xCu);
}

void __57__VSJSAppScriptEvaluator_transitionToFetchingScriptState__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      uint64_t v10 = VSErrorLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __57__VSJSAppScriptEvaluator_transitionToFetchingScriptState__block_invoke_cold_2(a1, (uint64_t)v7, v10);
      }

      [*(id *)(a1 + 40) setLoadError:v7];
      [*(id *)(a1 + 40) setLoaded:0];
    }
    else
    {
      if (v6)
      {
        uint64_t v11 = [WeakRetained app];
        int v12 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
        if (v12)
        {
          [v11 evaluateScript:v12 withSourceURL:*(void *)(a1 + 32)];
          [*(id *)(a1 + 40) setLoaded:1];
        }
      }
      else
      {
        uint64_t v11 = VSErrorLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __57__VSJSAppScriptEvaluator_transitionToFetchingScriptState__block_invoke_cold_1(a1, v11);
        }
      }
    }
    uint64_t v13 = [v9 results];
    [v13 addObject:*(void *)(a1 + 40)];

    uint64_t v14 = [v9 stateMachine];
    [v14 enqueueEvent:@"Done"];
  }
}

- (void)transitionToDoneState
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[VSJSAppScriptEvaluator transitionToDoneState]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v6, 0xCu);
  }

  int v4 = [(VSJSAppScriptEvaluator *)self completionBlock];
  if (v4)
  {
    v5 = [(VSJSAppScriptEvaluator *)self results];
    ((void (**)(void, void *))v4)[2](v4, v5);
  }
}

- (NSArray)urls
{
  return self->_urls;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (VSJSApp)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
}

- (VSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (NSMutableArray)remainingURLs
{
  return self->_remainingURLs;
}

- (void)setRemainingURLs:(id)a3
{
}

- (NSString)currentURL
{
  return self->_currentURL;
}

- (void)setCurrentURL:(id)a3
{
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_storeStrong((id *)&self->_remainingURLs, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_urls, 0);
}

void __57__VSJSAppScriptEvaluator_transitionToFetchingScriptState__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Reived no data for script evaluation with URL: %@", (uint8_t *)&v3, 0xCu);
}

void __57__VSJSAppScriptEvaluator_transitionToFetchingScriptState__block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Error fetching script for evaluation with URL: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

@end