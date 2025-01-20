@interface BMContentSource
- (void)sendEvent:(id)a3;
- (void)sendEvent:(id)a3 timestamp:(double)a4;
@end

@implementation BMContentSource

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  char v5 = [v4 isValidWithContext:0 error:&v9];
  id v6 = v9;
  if (v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)BMContentSource;
    [(BMStoreSource *)&v8 sendEvent:v4];
  }
  else
  {
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BMContentSource sendEvent:]((uint64_t)v6, v7);
    }
  }
}

- (void)sendEvent:(id)a3 timestamp:(double)a4
{
  id v6 = a3;
  id v11 = 0;
  char v7 = [v6 isValidWithContext:0 error:&v11];
  id v8 = v11;
  if (v7)
  {
    v10.receiver = self;
    v10.super_class = (Class)BMContentSource;
    [(BMStoreSource *)&v10 sendEvent:v6 timestamp:a4];
  }
  else
  {
    id v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BMContentSource sendEvent:]((uint64_t)v8, v9);
    }
  }
}

- (void)sendEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "BMContentSource: invalid event: %@", (uint8_t *)&v2, 0xCu);
}

@end