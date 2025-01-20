@interface ATXModeConfigurationColoringBookLoggingClient
- (void)logColoringBookWasSeenForModeIdentifier:(id)a3;
@end

@implementation ATXModeConfigurationColoringBookLoggingClient

- (void)logColoringBookWasSeenForModeIdentifier:(id)a3
{
  id v3 = a3;
  v4 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__ATXModeConfigurationColoringBookLoggingClient_logColoringBookWasSeenForModeIdentifier___block_invoke;
  block[3] = &unk_1E5D05300;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __89__ATXModeConfigurationColoringBookLoggingClient_logColoringBookWasSeenForModeIdentifier___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  uint64_t v4 = *MEMORY[0x1E4F4B738];
  id v10 = v3;
  id v5 = [v3 dictionaryForKey:*MEMORY[0x1E4F4B738]];
  v6 = (void *)[v5 mutableCopy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  v9 = v8;

  [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*(void *)(a1 + 32)];
  [v10 setObject:v9 forKey:v4];
}

@end