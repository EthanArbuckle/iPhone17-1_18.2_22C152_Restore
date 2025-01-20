@interface ACXPCEventSubscriber
+ (id)sharedSubscriber;
- (ACXPCEventSubscriber)init;
- (OS_dispatch_queue)replyQueue;
- (void)registerAccountChangeEventHandler:(id)a3;
@end

@implementation ACXPCEventSubscriber

+ (id)sharedSubscriber
{
  if (sharedSubscriber_onceToken != -1) {
    dispatch_once(&sharedSubscriber_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)sharedSubscriber__sharedSubscriber;

  return v2;
}

void __40__ACXPCEventSubscriber_sharedSubscriber__block_invoke()
{
  if (!sharedSubscriber__sharedSubscriber)
  {
    sharedSubscriber__sharedSubscriber = objc_alloc_init(ACXPCEventSubscriber);
    MEMORY[0x1F41817F8]();
  }
}

- (ACXPCEventSubscriber)init
{
  v7.receiver = self;
  v7.super_class = (Class)ACXPCEventSubscriber;
  v2 = [(ACXPCEventSubscriber *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ACXPCEventHandler", v3);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)registerAccountChangeEventHandler:(id)a3
{
  id v4 = a3;
  v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACXPCEventSubscriber registerAccountChangeEventHandler:]();
  }

  replyQueue = self->_replyQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke;
  handler[3] = &unk_1E5BCECB0;
  id v9 = v4;
  id v7 = v4;
  xpc_set_event_stream_handler("com.apple.accounts.changes", replyQueue, handler);
}

void __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _ACLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke_cold_3();
  }

  if (MEMORY[0x1A626DD90](v3) == MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(v3, "MessageType");
    if (string)
    {
      v6 = [NSString stringWithUTF8String:string];
      id v7 = _ACLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke_cold_2();
      }

      if ([v6 isEqualToString:@"ping"])
      {
        xpc_object_t reply = xpc_dictionary_create_reply(v3);
        if (reply) {
          xpc_dictionary_send_reply();
        }
      }
      else if ([v6 isEqualToString:@"AccountChange"])
      {
        xpc_dictionary_get_uint64(v3, "ChangeType");
        id v9 = _ACLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke_cold_1();
        }

        size_t length = 0;
        data = xpc_dictionary_get_data(v3, "AccountData", &length);
        if (data && length)
        {
          v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", data);
          id v14 = 0;
          v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v14];
          id v13 = v14;
          if (v12) {
            (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
          }
        }
      }
    }
  }
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void).cxx_destruct
{
}

- (void)registerAccountChangeEventHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
}

void __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 8u);
}

void __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
}

void __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 2u);
}

@end