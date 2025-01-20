@interface HTFenceAssertion
- (HTFenceAssertion)initWithFenceName:(unint64_t)a3;
- (void)blown;
- (void)invalidate;
@end

@implementation HTFenceAssertion

- (HTFenceAssertion)initWithFenceName:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)HTFenceAssertion;
  v4 = [(HTFenceAssertion *)&v16 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  v4->__name = a3;
  v4->__startTime = mach_absolute_time();
  if (setupPrefs_onceToken != -1) {
    dispatch_once(&setupPrefs_onceToken, &__block_literal_global_121);
  }
  v6 = +[HTPrefs sharedPrefs];
  char v7 = [v6 hangtracerDaemonEnabled];

  if ((v7 & 1) == 0)
  {
    v12 = shared_ht_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[HTFenceAssertion initWithFenceName:]();
    }
    goto LABEL_12;
  }
  v8 = +[HTPrefs sharedPrefs];
  char v9 = [v8 fenceTrackingEnabled];

  if ((v9 & 1) == 0)
  {
    v12 = shared_ht_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[HTFenceAssertion initWithFenceName:]();
    }
LABEL_12:

    v11 = 0;
    goto LABEL_13;
  }
  connectToHangTracer();
  v10 = HTConnectionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HTFenceAssertion_initWithFenceName___block_invoke;
  block[3] = &unk_1E60718C0;
  v15 = v5;
  dispatch_async(v10, block);

LABEL_7:
  v11 = v5;
LABEL_13:

  return v11;
}

void __38__HTFenceAssertion_initWithFenceName___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E60718A0;
    v6 = "startTime";
    values[0] = xpc_int64_create(6);
    values[1] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 8));
    values[2] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 16));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (uint64_t i = 2; i != -1; --i)
  }
}

- (void)invalidate
{
  uint64_t v3 = mach_absolute_time();
  v4 = HTConnectionQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__HTFenceAssertion_invalidate__block_invoke;
  v5[3] = &unk_1E60718E8;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(v4, v5);
}

void __30__HTFenceAssertion_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E6071908;
    long long v6 = *(_OWORD *)off_1E6071918;
    v4[0] = xpc_int64_create(7);
    v4[1] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 8));
    v4[2] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 16));
    v4[3] = xpc_uint64_create(*(void *)(a1 + 40));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, v4, 4uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (uint64_t i = 3; i != -1; --i)
  }
}

- (void)blown
{
  uint64_t v3 = mach_absolute_time();
  v4 = HTConnectionQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__HTFenceAssertion_blown__block_invoke;
  v5[3] = &unk_1E60718E8;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(v4, v5);
}

void __25__HTFenceAssertion_blown__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E6071908;
    long long v6 = *(_OWORD *)off_1E6071918;
    v4[0] = xpc_int64_create(8);
    v4[1] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 8));
    v4[2] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 16));
    v4[3] = xpc_uint64_create(*(void *)(a1 + 40));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, v4, 4uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (uint64_t i = 3; i != -1; --i)
  }
}

- (void)initWithFenceName:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3C06000, v0, v1, "Fence tracking is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
}

- (void)initWithFenceName:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B3C06000, v0, v1, "HTFenceAssertion init: Daemon Mode HangTracing is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
}

@end