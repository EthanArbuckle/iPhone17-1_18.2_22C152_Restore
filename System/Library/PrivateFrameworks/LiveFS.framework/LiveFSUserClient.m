@interface LiveFSUserClient
+ (id)defaultClient;
- (LiveFSUserClient)init;
- (int)callStructMethod:(unsigned int)a3 inStruct:(const void *)a4 inSize:(unint64_t)a5 outStruct:(void *)a6 outStructSize:(unint64_t *)a7;
- (int)checkUserClientPort;
- (int)configureUserClient:(unsigned int)a3 pid:(int)a4 pidversion:(int)a5 supportKOIO:(int)a6;
- (int)getUserClientPort;
- (int)getUserClientPortForService:(const char *)a3;
- (int)setMainMachPort:(unsigned int)a3 forDomain:(id)a4;
- (unsigned)getConnPort;
- (void)dealloc;
@end

@implementation LiveFSUserClient

- (LiveFSUserClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)LiveFSUserClient;
  result = [(LiveFSUserClient *)&v3 init];
  if (result) {
    result->ourPort = 0;
  }
  return result;
}

- (void)dealloc
{
  io_connect_t ourPort = self->ourPort;
  if (ourPort + 1 >= 2) {
    IOServiceClose(ourPort);
  }
  v4.receiver = self;
  v4.super_class = (Class)LiveFSUserClient;
  [(LiveFSUserClient *)&v4 dealloc];
}

+ (id)defaultClient
{
  if (gDefaultClient)
  {
    id v2 = (id)gDefaultClient;
  }
  else
  {
    id v3 = a1;
    objc_sync_enter(v3);
    objc_super v4 = (void *)gDefaultClient;
    if (!gDefaultClient)
    {
      id v5 = objc_alloc_init((Class)v3);
      v6 = (void *)gDefaultClient;
      gDefaultClient = (uint64_t)v5;

      objc_super v4 = (void *)gDefaultClient;
    }
    id v2 = v4;
    objc_sync_exit(v3);
  }

  return v2;
}

- (unsigned)getConnPort
{
  return self->ourPort;
}

- (int)getUserClientPortForService:(const char *)a3
{
  kern_return_t v7;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  CFDictionaryRef v4 = IOServiceMatching(a3);
  if (v4)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC90], v4);
    if (MatchingService)
    {
      io_connect_t v6 = MatchingService;
      v7 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &self->ourPort);
      IOServiceClose(v6);
      return v7;
    }
    v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 0;
      v10 = "Didn't find matching client";
      v11 = (uint8_t *)&v12;
      goto LABEL_8;
    }
  }
  else
  {
    v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13 = 0;
      v10 = "No matching dict";
      v11 = (uint8_t *)&v13;
LABEL_8:
      _os_log_impl(&dword_23AB0B000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
    }
  }

  return -536870911;
}

- (int)getUserClientPort
{
  return [(LiveFSUserClient *)self getUserClientPortForService:"com_apple_filesystems_lifs"];
}

- (int)checkUserClientPort
{
  id v2 = self;
  objc_sync_enter(v2);
  if (v2->ourPort + 1 > 1) {
    int v3 = 0;
  }
  else {
    int v3 = [(LiveFSUserClient *)v2 getUserClientPort];
  }
  objc_sync_exit(v2);

  return v3;
}

- (int)setMainMachPort:(unsigned int)a3 forDomain:(id)a4
{
  kern_return_t v10;
  NSObject *v11;
  os_log_type_t v12;
  size_t outputStructCnt;
  uint8_t buf[4];
  int v16;
  _OWORD inputStruct[65];
  uint64_t v18;

  uint64_t v4 = *(void *)&a3;
  v18 = *MEMORY[0x263EF8340];
  memset(inputStruct, 0, 512);
  outputStructCnt = 0;
  [a4 UTF8String];
  __strlcpy_chk();
  int v6 = [(LiveFSUserClient *)self checkUserClientPort];
  if (v6)
  {
    int v7 = v6;
    v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v16 = v7;
      v9 = "get client returned %x";
LABEL_7:
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
      _os_log_impl(&dword_23AB0B000, v11, v12, v9, buf, 8u);
    }
  }
  else
  {
    v10 = IOConnectCallStructMethod(self->ourPort, 1u, inputStruct, 0x28uLL, 0, &outputStructCnt);
    if (!v10)
    {
      int v7 = MEMORY[0x23ECC11D0](self->ourPort, 0, v4, 0);
      v8 = livefs_std_log();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 67109120;
      v16 = v7;
      v9 = "set notification port returned %x";
      v11 = v8;
      v12 = OS_LOG_TYPE_INFO;
      goto LABEL_8;
    }
    int v7 = v10;
    v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v16 = v7;
      v9 = "set client domain returned %x";
      goto LABEL_7;
    }
  }
LABEL_9:

  return v7;
}

- (int)callStructMethod:(unsigned int)a3 inStruct:(const void *)a4 inSize:(unint64_t)a5 outStruct:(void *)a6 outStructSize:(unint64_t *)a7
{
  int result = [(LiveFSUserClient *)self checkUserClientPort];
  if (!result)
  {
    mach_port_t ourPort = self->ourPort;
    return IOConnectCallStructMethod(ourPort, a3, a4, a5, a6, a7);
  }
  return result;
}

- (int)configureUserClient:(unsigned int)a3 pid:(int)a4 pidversion:(int)a5 supportKOIO:(int)a6
{
  kern_return_t v11;
  NSObject *v12;
  size_t v14;
  _DWORD inputStruct[4];
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  uint64_t v47;

  v47 = *MEMORY[0x263EF8340];
  v11 = [(LiveFSUserClient *)self checkUserClientPort];
  if (!v11)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    v19 = 0u;
    v18 = 0u;
    v17 = 0u;
    v16 = 0u;
    inputStruct[0] = a3;
    inputStruct[1] = a4;
    inputStruct[2] = a5;
    inputStruct[3] = a6;
    v11 = IOConnectCallStructMethod([(LiveFSUserClient *)self getConnPort], 0x2Bu, inputStruct, 0x10uLL, 0, &v14);
    if (v11)
    {
      v12 = livefs_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[LiveFSUserClient configureUserClient:pid:pidversion:supportKOIO:]();
      }
    }
  }
  return v11;
}

- (void)configureUserClient:pid:pidversion:supportKOIO:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_23AB0B000, v0, v1, "configureUserClient returned %d", v2, v3, v4, v5, v6);
}

@end