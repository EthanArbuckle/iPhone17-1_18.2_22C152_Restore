@interface DNDSXPCEventStream
- (DNDSXPCEventStream)init;
- (void)registerTimerHandlerWithServiceIdentifier:(id)a3 handler:(id)a4;
- (void)setTimer:(id)a3;
- (void)start;
@end

@implementation DNDSXPCEventStream

- (DNDSXPCEventStream)init
{
  v12.receiver = self;
  v12.super_class = (Class)DNDSXPCEventStream;
  v2 = [(DNDSXPCEventStream *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    timerHandlersByToken = v2->_timerHandlersByToken;
    v2->_timerHandlersByToken = (NSMutableDictionary *)v3;

    v5 = NSString;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = [v5 stringWithFormat:@"com.apple.donotdisturb.%@", v7];

    uint64_t v9 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:v8];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)start
{
  objc_initWeak(&location, self);
  uint64_t v3 = +[DNDSXPCEventInterface sharedInstance];
  queue = self->_queue;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __27__DNDSXPCEventStream_start__block_invoke;
  uint64_t v9 = &unk_1E69752A8;
  objc_copyWeak(&v10, &location);
  [v3 registerForStream:@"com.apple.alarm" queue:queue handler:&v6];

  v5 = +[DNDSXPCEventInterface sharedInstance];
  [v5 registerForStream:@"com.apple.notifyd.matching" queue:self->_queue handler:&__block_literal_global_33];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __27__DNDSXPCEventStream_start__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]));
  v5 = +[DNDSXPCEventInterface sharedInstance];
  [v5 setEvent:0 forKey:v4 onStream:@"com.apple.alarm"];

  uint64_t v6 = [WeakRetained[1] objectForKeyedSubscript:v4];
  uint64_t v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, void *, xpc_object_t))(v6 + 16))(v6, v4, xdict);
  }
}

- (void)registerTimerHandlerWithServiceIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = _Block_copy(a4);
  [(NSMutableDictionary *)self->_timerHandlersByToken setObject:v7 forKeyedSubscript:v6];
}

- (void)setTimer:(id)a3
{
  id v9 = a3;
  uint64_t v3 = [v9 date];

  if (v3)
  {
    v4 = [v9 date];
    [v4 timeIntervalSince1970];
    double v6 = ceil(v5);

    uint64_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_date(v3, "Date", (uint64_t)(v6 * 1000000000.0));
    xpc_dictionary_set_BOOL(v3, "UserVisible", 1);
  }
  id v7 = +[DNDSXPCEventInterface sharedInstance];
  v8 = [v9 serviceIdentifier];
  [v7 setEvent:v3 forKey:v8 onStream:@"com.apple.alarm"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerHandlersByToken, 0);
}

@end