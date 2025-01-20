@interface HTHangReporterService
- (HTHangReporterService)init;
- (void)getProcessingHangsWithCompletion:(id)a3;
@end

@implementation HTHangReporterService

- (HTHangReporterService)init
{
  v13.receiver = self;
  v13.super_class = (Class)HTHangReporterService;
  v2 = [(HTHangReporterService *)&v13 init];
  if (!v2) {
    return 0;
  }
  p_isa = &v2->super.isa;
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.hangreporter", 0, 0);
  xpc_connection_t v5 = p_isa[1];
  p_isa[1] = mach_service;

  xpc_connection_t v6 = p_isa[1];
  if (v6)
  {
    objc_initWeak(&location, v6);
    v7 = p_isa[1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __29__HTHangReporterService_init__block_invoke;
    v10[3] = &unk_265354160;
    objc_copyWeak(&v11, &location);
    xpc_connection_set_event_handler(v7, v10);
    xpc_connection_resume(p_isa[1]);
    v8 = p_isa;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __29__HTHangReporterService_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (MEMORY[0x253383E90](v3) != MEMORY[0x263EF8720])
  {
    xpc_connection_t v5 = (void *)MEMORY[0x253383E40](v3);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      __29__HTHangReporterService_init__block_invoke_cold_3((uint64_t)v5);
    }
LABEL_4:
    free(v5);
    goto LABEL_5;
  }
  if (v3 != (id)MEMORY[0x263EF86A0])
  {
    if (v3 == (id)MEMORY[0x263EF86A8])
    {
      xpc_connection_t v5 = (void *)xpc_connection_copy_invalidation_reason();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        v7 = v5;
        _os_log_impl(&dword_250BB6000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Connection to hangreporter invalidated: %s", (uint8_t *)&v6, 0xCu);
      }
    }
    else
    {
      xpc_connection_t v5 = (void *)MEMORY[0x253383E40](v3);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __29__HTHangReporterService_init__block_invoke_cold_2((uint64_t)v5);
      }
    }
    goto LABEL_4;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __29__HTHangReporterService_init__block_invoke_cold_1();
  }
LABEL_5:
}

- (void)getProcessingHangsWithCompletion:(id)a3
{
  id v4 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "message", "get-processing-hangs-list");
  hangReporterConnection = self->_hangReporterConnection;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke;
  handler[3] = &unk_265354188;
  id v9 = v4;
  id v7 = v4;
  xpc_connection_send_message_with_reply(hangReporterConnection, empty, 0, handler);
}

void __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  *(void *)&v29[5] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x253383E90]();
  uint64_t v5 = MEMORY[0x263EF8708];
  if (v4 == MEMORY[0x263EF8708])
  {
    v12 = [MEMORY[0x263EFF980] array];
    xpc_dictionary_get_array(v3, "hangs");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    size_t count = xpc_array_get_count(v10);
    if (count)
    {
      size_t v14 = count;
      size_t v15 = 0;
      v16 = &_os_log_internal;
      do
      {
        v17 = xpc_array_get_value(v10, v15);
        if (MEMORY[0x253383E90]() == v5)
        {
          v19 = [[HTHang alloc] initWithXPCDictionary:v17];
          [v12 addObject:v19];
        }
        else
        {
          v18 = (void *)MEMORY[0x253383E40](v17);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
            __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke_cold_1(buf, (uint64_t)v18, v29);
          }
          free(v18);
        }

        ++v15;
      }
      while (v14 != v15);
    }
    v20 = dispatch_get_global_queue(21, 0);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke_11;
    v22[3] = &unk_265354020;
    id v21 = *(id *)(a1 + 32);
    id v23 = v12;
    id v24 = v21;
    id v11 = v12;
    dispatch_async(v20, v22);
  }
  else
  {
    int v6 = (void *)MEMORY[0x253383E40](v3);
    id v7 = [NSString stringWithUTF8String:v6];
    free(v6);
    uint64_t v8 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke_2;
    block[3] = &unk_265354020;
    id v9 = *(id *)(a1 + 32);
    id v26 = v7;
    id v27 = v9;
    id v10 = v7;
    dispatch_async(v8, block);

    id v11 = v27;
  }
}

void __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263F087E8];
  uint64_t v2 = *MEMORY[0x263F07F70];
  id v3 = &stru_2701C7158;
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    id v3 = *(__CFString **)(a1 + 32);
  }
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = v3;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  int v6 = [v1 errorWithDomain:v2 code:4101 userInfo:v5];
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v6);
}

uint64_t __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void).cxx_destruct
{
}

void __29__HTHangReporterService_init__block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_250BB6000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Connection to hangreporter encountered connection interrupted", v0, 2u);
}

void __29__HTHangReporterService_init__block_invoke_cold_2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_250BB6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Connection to hangreporter encountered error: %s", (uint8_t *)&v1, 0xCu);
}

void __29__HTHangReporterService_init__block_invoke_cold_3(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_250BB6000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Connection to hangreporter encountered non-error: %s", (uint8_t *)&v1, 0xCu);
}

void __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke_cold_1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 136315138;
  *a3 = a2;
  _os_log_fault_impl(&dword_250BB6000, &_os_log_internal, OS_LOG_TYPE_FAULT, "hangs array contains non-dictionary %s", buf, 0xCu);
}

@end