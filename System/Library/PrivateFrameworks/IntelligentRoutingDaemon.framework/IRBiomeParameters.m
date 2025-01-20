@interface IRBiomeParameters
- (IRBiomeParameters)initWithBiomeEventType:(int64_t)a3;
- (int64_t)eventType;
- (void)biomeEventClass;
- (void)contextPublisher;
- (void)setEventType:(int64_t)a3;
@end

@implementation IRBiomeParameters

- (IRBiomeParameters)initWithBiomeEventType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IRBiomeParameters;
  v4 = [(IRBiomeParameters *)&v7 init];
  v5 = v4;
  if (v4) {
    [(IRBiomeParameters *)v4 setEventType:a3];
  }
  return v5;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (void)queryPublisherWithOptions:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v3 = (const void **)MEMORY[0x263F50120];
  v4 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  if (OUTLINED_FUNCTION_5())
  {
    uint64_t v5 = *(void *)(a1 + 8);
    id v6 = v1;
    ((void (*)(uint64_t))IRBiomeEventTypeToString)(v5);
    id v7 = objc_claimAutoreleasedReturnValue();
    [v7 UTF8String];
    OUTLINED_FUNCTION_0_3();
    OUTLINED_FUNCTION_3_0(&dword_25418E000, v8, v9, "%s[%@], [ErrorId - Biome query publisher unsupported] couldn't find a publisher for biome event type %s", v10, v11, v12, v13, v20);
  }
  dispatch_get_specific(*v3);
  objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_1())
  {
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_2_0(&dword_25418E000, v14, v15, "%s[%@], %s:%d: assertion failure in %s", v16, v17, v18, v19, v20);
  }

  abort();
}

- (void)contextPublisher
{
  v3 = (const void **)MEMORY[0x263F50120];
  v4 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  if (OUTLINED_FUNCTION_5())
  {
    uint64_t v5 = *(void *)(a1 + 8);
    id v6 = v1;
    ((void (*)(uint64_t))IRBiomeEventTypeToString)(v5);
    id v7 = objc_claimAutoreleasedReturnValue();
    [v7 UTF8String];
    OUTLINED_FUNCTION_0_3();
    OUTLINED_FUNCTION_3_0(&dword_25418E000, v8, v9, "%s[%@], [ErrorId - Biome context publisher unsupported] couldn't find a publisher for biome event type %s", v10, v11, v12, v13, v20);
  }
  dispatch_get_specific(*v3);
  objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_1())
  {
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_2_0(&dword_25418E000, v14, v15, "%s[%@], %s:%d: assertion failure in %s", v16, v17, v18, v19, v20);
  }

  abort();
}

- (void)biomeEventClass
{
  v3 = (const void **)MEMORY[0x263F50120];
  v4 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  if (OUTLINED_FUNCTION_5())
  {
    uint64_t v5 = *(void *)(a1 + 8);
    id v6 = v1;
    ((void (*)(uint64_t))IRBiomeEventTypeToString)(v5);
    id v7 = objc_claimAutoreleasedReturnValue();
    [v7 UTF8String];
    OUTLINED_FUNCTION_0_3();
    OUTLINED_FUNCTION_3_0(&dword_25418E000, v8, v9, "%s[%@], [ErrorId - Unsupported biome event class] couldn't find a Class for biome event type %s", v10, v11, v12, v13, v20);
  }
  dispatch_get_specific(*v3);
  objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_1())
  {
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_2_0(&dword_25418E000, v14, v15, "%s[%@], %s:%d: assertion failure in %s", v16, v17, v18, v19, v20);
  }

  abort();
}

@end