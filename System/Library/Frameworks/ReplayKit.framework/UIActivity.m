@interface UIActivity
@end

@implementation UIActivity

void __59__UIActivity_RPExtensions__streamActivitiesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v17 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v8 = [v7 attributes];
        v9 = [v8 objectForKeyedSubscript:@"NSExtensionActivationRule"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v11 = [v7 attributes];
          v12 = [v11 objectForKeyedSubscript:@"NSExtensionActivationRule"];
          v13 = [v12 objectForKeyedSubscript:@"NSExtensionActivationSupportsReplayStreaming"];
          int v14 = [v13 BOOLValue];

          if (v14)
          {
            v15 = (void *)[objc_alloc(MEMORY[0x263F6BCA8]) initWithApplicationExtension:v7];
            [v17 addObject:v15];
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end