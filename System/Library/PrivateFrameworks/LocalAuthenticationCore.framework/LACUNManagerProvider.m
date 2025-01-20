@interface LACUNManagerProvider
+ (id)sharedInstance;
- (LACUNManagerProvider)init;
- (NSMutableDictionary)sharedInstances;
- (id)sharedInstanceWithBundleIdentifier:(id)a3 categories:(id)a4 replyQueue:(id)a5;
- (id)sharedInstanceWithBundleIdentifier:(id)a3 replyQueue:(id)a4;
- (void)setSharedInstances:(id)a3;
@end

@implementation LACUNManagerProvider

- (LACUNManagerProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)LACUNManagerProvider;
  v2 = [(LACUNManagerProvider *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(LACUNManagerProvider *)v2 setSharedInstances:v3];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1) {
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_20);
  }
  v2 = (void *)sharedInstance_sharedInstance_10;
  return v2;
}

uint64_t __38__LACUNManagerProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_10 = objc_alloc_init(LACUNManagerProvider);
  return MEMORY[0x270F9A758]();
}

- (id)sharedInstanceWithBundleIdentifier:(id)a3 replyQueue:(id)a4
{
  return [(LACUNManagerProvider *)self sharedInstanceWithBundleIdentifier:a3 categories:MEMORY[0x263EFFA68] replyQueue:a4];
}

- (id)sharedInstanceWithBundleIdentifier:(id)a3 categories:(id)a4 replyQueue:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v7 = a4;
  id v25 = a5;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v8 = [v7 sortedArrayUsingSelector:sel_identifier];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    v12 = &stru_2704025D8;
    do
    {
      uint64_t v13 = 0;
      v14 = v12;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        v15 = NSString;
        v16 = [*(id *)(*((void *)&v30 + 1) + 8 * v13) identifier];
        v12 = [v15 stringWithFormat:@"%@-%@", v14, v16];

        ++v13;
        v14 = v12;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v10);
  }
  else
  {
    v12 = &stru_2704025D8;
  }

  v17 = [NSString stringWithFormat:@"%@-%@", v26, v12];
  v18 = [(LACUNManagerProvider *)self sharedInstances];
  v19 = [v18 objectForKeyedSubscript:v17];

  if (!v19)
  {
    v20 = [LACUNManagerQueueDecorator alloc];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke;
    v27[3] = &unk_2653B7108;
    id v28 = v26;
    id v29 = v7;
    v21 = __81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke((uint64_t)v27);
    v19 = [(LACUNManagerQueueDecorator *)v20 initWithManager:v21 replyQueue:v25];

    v22 = [(LACUNManagerProvider *)self sharedInstances];
    [v22 setObject:v19 forKeyedSubscript:v17];
  }
  return v19;
}

LACUNManagerSetUpDecorator *__81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke(uint64_t a1)
{
  v2 = [LACUNManagerSetUpDecorator alloc];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke_2;
  v5[3] = &unk_2653B70E0;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  v3 = [(LACUNManagerSetUpDecorator *)v2 initWithManagerBuilder:v5];

  return v3;
}

LACUNManager *__81__LACUNManagerProvider_sharedInstanceWithBundleIdentifier_categories_replyQueue___block_invoke_2(uint64_t a1)
{
  v1 = [[LACUNManager alloc] initWithBundleIdentifier:*(void *)(a1 + 32) categories:*(void *)(a1 + 40)];
  return v1;
}

- (NSMutableDictionary)sharedInstances
{
  return self->_sharedInstances;
}

- (void)setSharedInstances:(id)a3
{
}

- (void).cxx_destruct
{
}

@end