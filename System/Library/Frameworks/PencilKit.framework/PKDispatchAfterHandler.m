@interface PKDispatchAfterHandler
+ (id)appLifeCycleHandler;
- (NSMutableDictionary)identifierBlockMap;
- (PKDispatchAfterHandler)init;
- (id)identifierForStringIdentifier:(id)a3;
- (void)cancelAll;
- (void)cancelBlocksWithStringIdentifier:(id)a3;
- (void)dispatchAfter:(double)a3 stringIdentifier:(id)a4 withBlock:(id)a5;
- (void)setIdentifierBlockMap:(id)a3;
@end

@implementation PKDispatchAfterHandler

+ (id)appLifeCycleHandler
{
  if (qword_1EB3C5E88 != -1) {
    dispatch_once(&qword_1EB3C5E88, &__block_literal_global_17);
  }
  v2 = (void *)_MergedGlobals_120;

  return v2;
}

void __45__PKDispatchAfterHandler_appLifeCycleHandler__block_invoke()
{
  v0 = objc_alloc_init(PKDispatchAfterHandler);
  v1 = (void *)_MergedGlobals_120;
  _MergedGlobals_120 = (uint64_t)v0;
}

- (PKDispatchAfterHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKDispatchAfterHandler;
  v2 = [(PKDispatchAfterHandler *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(PKDispatchAfterHandler *)v2 setIdentifierBlockMap:v3];
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
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v6 = v5;

  return v6;
}

- (void)dispatchAfter:(double)a3 stringIdentifier:(id)a4 withBlock:(id)a5
{
  id v14 = a5;
  v8 = [(PKDispatchAfterHandler *)self identifierForStringIdentifier:a4];
  uint64_t v9 = objc_opt_class();
  v10 = [(PKDispatchAfterHandler *)self identifierBlockMap];
  v11 = [v10 objectForKeyedSubscript:v8];
  PKCheckedDynamicCast(v9, v11);
  v12 = (PKDispatchAfterBlocks *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v12 = [[PKDispatchAfterBlocks alloc] initWithIdentifier:v8];
    v13 = [(PKDispatchAfterHandler *)self identifierBlockMap];
    [v13 setObject:v12 forKeyedSubscript:v8];
  }
  [(PKDispatchAfterBlocks *)v12 dispatchAfter:v14 withBlock:a3];
}

- (void)cancelBlocksWithStringIdentifier:(id)a3
{
  id v8 = [(PKDispatchAfterHandler *)self identifierForStringIdentifier:a3];
  uint64_t v4 = objc_opt_class();
  id v5 = [(PKDispatchAfterHandler *)self identifierBlockMap];
  v6 = [v5 objectForKeyedSubscript:v8];
  v7 = PKCheckedDynamicCast(v4, v6);

  [v7 cancelAll];
}

- (void)cancelAll
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(PKDispatchAfterHandler *)self identifierBlockMap];
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
        v10 = PKCheckedDynamicCast(v8, v9);

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

@end