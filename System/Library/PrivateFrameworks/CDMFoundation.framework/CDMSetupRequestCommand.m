@interface CDMSetupRequestCommand
+ (id)setupWithLanguageCode:(id)a3;
- (BOOL)shouldPerformWarmup;
- (CDMDataDispatcherContext)dataDispatcherContext;
- (CDMDynamicConfig)dynamicConfig;
- (CDMSetupRequestCommand)initWithDynamicConfig:(id)a3;
- (CDMSetupRequestCommand)initWithDynamicConfig:(id)a3 selfMetadata:(id)a4 dataDispatcherContext:(id)a5;
- (CDMSetupRequestCommand)initWithDynamicConfig:(id)a3 selfMetadata:(id)a4 dataDispatcherContext:(id)a5 shouldPerformWarmup:(BOOL)a6;
- (NLXSchemaNLXClientEventMetadata)selfMetadata;
- (void)setDataDispatcherContext:(id)a3;
- (void)setShouldPerformWarmup:(BOOL)a3;
@end

@implementation CDMSetupRequestCommand

- (CDMDynamicConfig)dynamicConfig
{
  return self->_dynamicConfig;
}

- (CDMDataDispatcherContext)dataDispatcherContext
{
  return self->_dataDispatcherContext;
}

- (BOOL)shouldPerformWarmup
{
  return self->_shouldPerformWarmup;
}

- (NLXSchemaNLXClientEventMetadata)selfMetadata
{
  return self->_selfMetadata;
}

- (CDMSetupRequestCommand)initWithDynamicConfig:(id)a3 selfMetadata:(id)a4 dataDispatcherContext:(id)a5
{
  return [(CDMSetupRequestCommand *)self initWithDynamicConfig:a3 selfMetadata:a4 dataDispatcherContext:a5 shouldPerformWarmup:1];
}

- (CDMSetupRequestCommand)initWithDynamicConfig:(id)a3 selfMetadata:(id)a4 dataDispatcherContext:(id)a5 shouldPerformWarmup:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CDMSetupRequestCommand;
  v14 = [(CDMBaseCommand *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dynamicConfig, a3);
    objc_storeStrong((id *)&v15->_selfMetadata, a4);
    objc_storeStrong((id *)&v15->_dataDispatcherContext, a5);
    v15->_shouldPerformWarmup = a6;
  }

  return v15;
}

- (void)setDataDispatcherContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, 0);
  objc_storeStrong((id *)&self->_selfMetadata, 0);
  objc_storeStrong((id *)&self->_dynamicConfig, 0);
}

- (void)setShouldPerformWarmup:(BOOL)a3
{
  self->_shouldPerformWarmup = a3;
}

- (CDMSetupRequestCommand)initWithDynamicConfig:(id)a3
{
  return [(CDMSetupRequestCommand *)self initWithDynamicConfig:a3 selfMetadata:0 dataDispatcherContext:0];
}

+ (id)setupWithLanguageCode:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 length])
  {
    v4 = [[CDMDynamicConfig alloc] initWithLanguageCode:v3 graphName:0 sandboxId:0 assetPaths:0];
    v5 = [[CDMSetupRequestCommand alloc] initWithDynamicConfig:v4];
  }
  else
  {
    v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      v9 = "+[CDMSetupRequestCommand setupWithLanguageCode:]";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s ERROR: Invalid setup: Lang:%@", (uint8_t *)&v8, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

@end