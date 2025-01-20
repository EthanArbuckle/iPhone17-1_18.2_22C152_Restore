@interface EDNonAcceptingServer
+ (OS_os_log)log;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (EDNonAcceptingServer)initWithMachServiceNames:(id)a3;
- (NSMutableArray)listeners;
- (void)setListeners:(id)a3;
@end

@implementation EDNonAcceptingServer

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__EDNonAcceptingServer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_63 != -1) {
    dispatch_once(&log_onceToken_63, block);
  }
  v2 = (void *)log_log_63;

  return (OS_os_log *)v2;
}

void __27__EDNonAcceptingServer_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_63;
  log_log_63 = (uint64_t)v1;
}

- (EDNonAcceptingServer)initWithMachServiceNames:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EDNonAcceptingServer;
  v5 = [(EDNonAcceptingServer *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    listeners = v5->_listeners;
    v5->_listeners = (NSMutableArray *)v6;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
          id v13 = objc_alloc(MEMORY[0x1E4F29290]);
          v14 = objc_msgSend(v13, "initWithMachServiceName:", v12, (void)v16);
          [v14 setDelegate:v5];
          [(NSMutableArray *)v5->_listeners addObject:v14];
          [v14 resume];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v9);
    }
  }
  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v5 = +[EDNonAcceptingServer log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Not accepting %@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (NSMutableArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

@end