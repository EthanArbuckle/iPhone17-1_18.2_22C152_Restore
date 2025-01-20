@interface DCDispatchAfterHandler
+ (id)appLifeCycleHandler;
+ (void)appLifeCycleHandler;
- (DCDispatchAfterHandler)init;
- (NSMutableDictionary)identifierBlockMap;
- (id)identifierForStringIdentifier:(id)a3;
- (void)cancelAll;
- (void)cancelBlocksWithStringIdentifier:(id)a3;
- (void)dispatchAfter:(double)a3 stringIdentifier:(id)a4 withBlock:(id)a5;
- (void)setIdentifierBlockMap:(id)a3;
@end

@implementation DCDispatchAfterHandler

+ (id)appLifeCycleHandler
{
  if (appLifeCycleHandler_predicate != -1) {
    dispatch_once(&appLifeCycleHandler_predicate, &__block_literal_global_11);
  }
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v2 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      +[DCDispatchAfterHandler appLifeCycleHandler](v2);
    }
  }
  v3 = (void *)appLifeCycleHandler_sDispatchAfterHandler;

  return v3;
}

void __45__DCDispatchAfterHandler_appLifeCycleHandler__block_invoke()
{
  v0 = objc_alloc_init(DCDispatchAfterHandler);
  v1 = (void *)appLifeCycleHandler_sDispatchAfterHandler;
  appLifeCycleHandler_sDispatchAfterHandler = (uint64_t)v0;
}

- (DCDispatchAfterHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)DCDispatchAfterHandler;
  v2 = [(DCDispatchAfterHandler *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(DCDispatchAfterHandler *)v2 setIdentifierBlockMap:v3];
  }
  return v2;
}

- (id)identifierForStringIdentifier:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF9D0] null];
  }
  v6 = v5;

  return v6;
}

- (void)dispatchAfter:(double)a3 stringIdentifier:(id)a4 withBlock:(id)a5
{
  id v14 = a5;
  v8 = [(DCDispatchAfterHandler *)self identifierForStringIdentifier:a4];
  uint64_t v9 = objc_opt_class();
  v10 = [(DCDispatchAfterHandler *)self identifierBlockMap];
  v11 = [v10 objectForKeyedSubscript:v8];
  DCCheckedDynamicCast(v9, (uint64_t)v11);
  v12 = (DCDispatchAfterBlocks *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v12 = [[DCDispatchAfterBlocks alloc] initWithIdentifier:v8];
    v13 = [(DCDispatchAfterHandler *)self identifierBlockMap];
    [v13 setObject:v12 forKeyedSubscript:v8];
  }
  [(DCDispatchAfterBlocks *)v12 dispatchAfter:v14 withBlock:a3];
}

- (void)cancelBlocksWithStringIdentifier:(id)a3
{
  id v8 = [(DCDispatchAfterHandler *)self identifierForStringIdentifier:a3];
  uint64_t v4 = objc_opt_class();
  id v5 = [(DCDispatchAfterHandler *)self identifierBlockMap];
  v6 = [v5 objectForKeyedSubscript:v8];
  v7 = DCCheckedDynamicCast(v4, (uint64_t)v6);

  [v7 cancelAll];
}

- (void)cancelAll
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(DCDispatchAfterHandler *)self identifierBlockMap];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        uint64_t v8 = objc_opt_class();
        uint64_t v9 = [v2 objectForKeyedSubscript:v7];
        v10 = DCCheckedDynamicCast(v8, (uint64_t)v9);

        [v10 cancelAll];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (NSMutableDictionary)identifierBlockMap
{
  return self->_identifierBlockMap;
}

- (void)setIdentifierBlockMap:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)appLifeCycleHandler
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "The app handler should only be used on the main thread", v1, 2u);
}

@end