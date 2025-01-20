@interface DTServiceHubClient
+ (id)localDeviceConnection;
+ (id)localDeviceConnectionWithError:(id *)a3;
+ (id)localDeviceConnectionWithXPCConnection:(id)a3;
@end

@implementation DTServiceHubClient

+ (id)localDeviceConnectionWithError:(id *)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F38CB0]) initWithLocalName:0 size:0x400000];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_2308FCA90;
  v26 = sub_2308FCAA0;
  id v27 = (id)[objc_alloc(MEMORY[0x263F38C88]) initWithTransport:v4];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_2308FCA90;
  v20 = sub_2308FCAA0;
  id v21 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v11 = sub_2308FCAA8;
  v12 = &unk_264B90120;
  id v5 = v4;
  id v13 = v5;
  v14 = &v16;
  v15 = &v22;
  v6 = v10;
  mach_service = xpc_connection_create_mach_service("com.apple.instruments.deviceservice.xpc", 0, 0);
  xpc_connection_set_event_handler(mach_service, &unk_26E515848);
  xpc_connection_resume(mach_service);
  v11((uint64_t)v6, mach_service);

  if (a3) {
    *a3 = (id) v17[5];
  }
  id v8 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v8;
}

+ (id)localDeviceConnectionWithXPCConnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x263F38CB0];
    v4 = (_xpc_connection_s *)a3;
    id v5 = (void *)[[v3 alloc] initWithLocalName:0 size:0x400000];
    v6 = (void *)[objc_alloc(MEMORY[0x263F38C88]) initWithTransport:v5];
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v8 = xpc_shmem_create((void *)[v5 sharedMemory], [v5 totalSharedMemorySize]);
    xpc_dictionary_set_value(v7, "dtx_shared_memory", v8);
    xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v4, v7);

    if (MEMORY[0x230FC3070](v9) == MEMORY[0x263EF8720])
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        string = xpc_dictionary_get_string(v9, (const char *)*MEMORY[0x263EF86B0]);
        int v12 = 136315138;
        id v13 = string;
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "xpc error: %s", (uint8_t *)&v12, 0xCu);
      }

      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)localDeviceConnection
{
  return (id)MEMORY[0x270F9A6D0](a1, sel_localDeviceConnectionWithError_);
}

@end