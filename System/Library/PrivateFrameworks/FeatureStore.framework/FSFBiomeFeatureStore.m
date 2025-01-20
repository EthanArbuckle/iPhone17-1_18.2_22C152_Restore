@interface FSFBiomeFeatureStore
+ (id)singletonInstance;
- (BMStoreConfig)config;
- (BOOL)deleteAllStreams;
- (BOOL)deleteStream:(id)a3;
- (FSFBiomeFeatureStore)init;
- (id)getStream:(id)a3;
@end

@implementation FSFBiomeFeatureStore

+ (id)singletonInstance
{
  if (+[FSFUtils isSupportedPlatform])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__FSFBiomeFeatureStore_singletonInstance__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (singletonInstance_onceToken != -1) {
      dispatch_once(&singletonInstance_onceToken, block);
    }
    id v3 = (id)singletonInstance_sharedInstance;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This method is not implemented for the current platform"];
    id v3 = 0;
  }

  return v3;
}

uint64_t __41__FSFBiomeFeatureStore_singletonInstance__block_invoke(uint64_t a1)
{
  singletonInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (FSFBiomeFeatureStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)FSFBiomeFeatureStore;
  v2 = [(FSFBiomeFeatureStore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[FSFUtils biomeStoreConfig];
    config = v2->_config;
    v2->_config = (BMStoreConfig *)v3;
  }
  return v2;
}

- (id)getStream:(id)a3
{
  id v4 = a3;
  v5 = [[FSFBiomeFeatureStoreStream alloc] initWithConfig:self->_config streamId:v4];

  return v5;
}

- (BOOL)deleteStream:(id)a3
{
  id v4 = a3;
  v5 = +[FSFUtils availableStreams];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = [[FSFBiomeFeatureStoreStream alloc] initWithConfig:self->_config streamId:v4];
    BOOL v8 = [(FSFBiomeFeatureStoreStream *)v7 deleteCurrentStream];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FSFBiomeFeatureStore deleteStream:]();
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)deleteAllStreams
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = +[FSFUtils availableStreams];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    int v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v7 &= [(FSFBiomeFeatureStore *)self deleteStream:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BMStoreConfig)config
{
  return self->_config;
}

- (void).cxx_destruct
{
}

- (void)deleteStream:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21D935000, &_os_log_internal, OS_LOG_TYPE_ERROR, "deleteStream: received non available streamId", v0, 2u);
}

@end