@interface CHConfigurationAggregator
- (BOOL)isCloudKitEnabled;
- (CHConfigurationAggregator)initWithConfigurations:(id)a3 queue:(id)a4;
- (CHConfigurationAggregatorDelegate)delegate;
- (NSArray)configurations;
- (OS_dispatch_queue)queue;
- (void)propertiesDidChangeForConfiguration:(id)a3;
- (void)registerConfigurationDelegate;
- (void)setDelegate:(id)a3;
@end

@implementation CHConfigurationAggregator

- (CHConfigurationAggregator)initWithConfigurations:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHConfigurationAggregator;
  v9 = [(CHConfigurationAggregator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configurations, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    [(CHConfigurationAggregator *)v10 registerConfigurationDelegate];
  }

  return v10;
}

- (void)registerConfigurationDelegate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(CHConfigurationAggregator *)self configurations];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        v9 = [(CHConfigurationAggregator *)self queue];
        [v8 addDelegate:self queue:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (BOOL)isCloudKitEnabled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(CHConfigurationAggregator *)self configurations];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    int v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v6 &= [*(id *)(*((void *)&v9 + 1) + 8 * i) isCloudKitEnabled];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)propertiesDidChangeForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CHConfigurationAggregator *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__CHConfigurationAggregator_propertiesDidChangeForConfiguration___block_invoke;
  v7[3] = &unk_1E61C7568;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__CHConfigurationAggregator_propertiesDidChangeForConfiguration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 configurationAggregator:*(void *)(a1 + 32) didChangeConfiguration:*(void *)(a1 + 40)];
  }
}

- (CHConfigurationAggregatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CHConfigurationAggregatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end