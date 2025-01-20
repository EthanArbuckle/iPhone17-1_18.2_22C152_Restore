@interface IPXPCEventSubscriptionBlackhole
- (IPXPCEventSubscriptionBlackhole)initWithStreamName:(id)a3;
- (void)resume;
@end

@implementation IPXPCEventSubscriptionBlackhole

- (IPXPCEventSubscriptionBlackhole)initWithStreamName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IPXPCEventSubscriptionBlackhole;
  v5 = [(IPXPCEventSubscriptionBlackhole *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    streamName = v5->_streamName;
    v5->_streamName = (NSString *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.InstallProgress.IPXPCEventSubscriptionBlackhole", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

- (void)resume
{
  v3 = self->_streamName;
  [(NSString *)v3 UTF8String];
  xpc_event_publisher_create();
  id v4 = (OS_xpc_event_publisher *)objc_claimAutoreleasedReturnValue();
  publisher = self->_publisher;
  self->_publisher = v4;

  v7 = v3;
  uint64_t v6 = v3;
  xpc_event_publisher_set_handler();
  xpc_event_publisher_set_error_handler();
  xpc_event_publisher_activate();
}

void __41__IPXPCEventSubscriptionBlackhole_resume__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v7 = (void *)IPXPCCopyDescription(a4);
  v8 = _IPServerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 134218754;
    uint64_t v11 = a2;
    __int16 v12 = 2048;
    uint64_t v13 = a3;
    __int16 v14 = 2112;
    v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_252AA9000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring event %lu %llu %@ on %@", (uint8_t *)&v10, 0x2Au);
  }
}

void __41__IPXPCEventSubscriptionBlackhole_resume__block_invoke_2(uint64_t a1, int a2)
{
  v3 = _IPServerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __41__IPXPCEventSubscriptionBlackhole_resume__block_invoke_2_cold_1(a2, v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_streamName, 0);
}

void __41__IPXPCEventSubscriptionBlackhole_resume__block_invoke_2_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_252AA9000, a2, OS_LOG_TYPE_ERROR, "Error on blackhole XPC event publisher! %{darwin.errno}d", (uint8_t *)v2, 8u);
}

@end