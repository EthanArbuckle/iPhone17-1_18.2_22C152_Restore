@interface DTLeaksService
+ (void)registerCapabilities:(id)a3;
- (DTLeaksService)initWithChannel:(id)a3;
- (id)_preserveDict:(id)a3 forPid:(int)a4;
- (id)requestGraph:(unint64_t)a3 options:(id)a4;
- (id)requestMallocStackLog:(int)a3 forAddress:(unint64_t *)a4 size:(unint64_t)a5 isLiteZone:(unsigned int)a6;
- (id)requestVMregionStackLog:(int)a3 forAddress:(unint64_t *)a4 size:(unint64_t)a5;
- (int)setMallocStackLoggingMode:(int)a3 forPid:(int)a4;
- (void)_internalRequestForPid:(int)a3 message:(id)a4 completion:(id)a5;
- (void)_lookupGraphByToken:(unint64_t)a3 response:(id)a4;
- (void)cancelAllRequests;
- (void)messageReceived:(id)a3;
@end

@implementation DTLeaksService

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  [v4 publishCapability:@"com.apple.instruments.server.services.remoteleaks" withVersion:9 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.remoteleaks.immediate" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.remoteleaks.deferred" withVersion:1 forClass:a1];
}

- (DTLeaksService)initWithChannel:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)DTLeaksService;
  v3 = [(DTXService *)&v15 initWithChannel:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("Leaks service helper queue", 0);
    coordinationQueue = v3->_coordinationQueue;
    v3->_coordinationQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("Leaks service file preservation queue", 0);
    preservationQueue = v3->_preservationQueue;
    v3->_preservationQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    helperConnectionByTargetPid = v3->_helperConnectionByTargetPid;
    v3->_helperConnectionByTargetPid = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    helperPidByTargetPid = v3->_helperPidByTargetPid;
    v3->_helperPidByTargetPid = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    fileByPid = v3->_fileByPid;
    v3->_fileByPid = (NSMutableDictionary *)v12;
  }
  return v3;
}

- (void)messageReceived:(id)a3
{
  if ([a3 errorStatus] == 2)
  {
    MEMORY[0x270F9A6D0](self, sel_cancelAllRequests);
  }
}

- (void)_internalRequestForPid:(int)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!a3) {
    [MEMORY[0x263EFF940] raise:@"DTLeaksServiceNoPidException" format:@"No pid was provided to DTLeaksService for leaks analysis"];
  }
  coordinationQueue = self->_coordinationQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2308D8F80;
  v13[3] = &unk_264B8F6F8;
  int v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(coordinationQueue, v13);
}

- (id)_preserveDict:(id)a3 forPid:(int)a4
{
  uint64_t v6 = DTLeaksServiceSerializedGraphKey;
  id v7 = a3;
  id v8 = [v7 objectForKeyedSubscript:v6];
  id v9 = (void *)[v7 mutableCopy];

  [v9 removeObjectForKey:DTLeaksServiceSerializedGraphKey];
  if ([v8 length]) {
    unint64_t v10 = a4 | ((unint64_t)(atomic_fetch_add_explicit(&dword_268707FB8, 1u, memory_order_relaxed) + 1) << 32);
  }
  else {
    unint64_t v10 = 0;
  }
  id v11 = [NSNumber numberWithUnsignedLongLong:v10];
  [v9 setObject:v11 forKeyedSubscript:DTLeaksServiceGraphLookupTokenKey];

  if (v10)
  {
    preservationQueue = self->_preservationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2308D9678;
    block[3] = &unk_264B8F720;
    int v19 = a4;
    unint64_t v18 = v10;
    id v15 = v8;
    id v16 = v9;
    v17 = self;
    dispatch_async(preservationQueue, block);
  }
  return v9;
}

- (void)_lookupGraphByToken:(unint64_t)a3 response:(id)a4
{
  id v6 = a4;
  preservationQueue = self->_preservationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308D9928;
  block[3] = &unk_264B8EF50;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(preservationQueue, block);
}

- (id)requestGraph:(unint64_t)a3 options:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_opt_new();
  if (a3)
  {
    if (HIDWORD(a3))
    {
      [(DTLeaksService *)self _lookupGraphByToken:a3 response:v7];
    }
    else
    {
      if (v6) {
        id v12 = v6;
      }
      else {
        id v12 = (id)MEMORY[0x263EFFA78];
      }
      v13 = [MEMORY[0x263F38CA0] messageWithSelector:sel_serializedGraphWithOptions_ objectArguments:v12];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = sub_2308D9E40;
      v15[3] = &unk_264B8F748;
      id v16 = v6;
      v17 = self;
      int v19 = a3;
      id v18 = v7;
      [(DTLeaksService *)self _internalRequestForPid:a3 message:v13 completion:v15];
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08320];
    id v9 = [NSString stringWithFormat:@"invalid target specified (%llx)", 0];
    v21[0] = v9;
    id v10 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    unint64_t v11 = [v8 errorWithDomain:@"DTLeaksService" code:-1 userInfo:v10];
    [v7 invokeCompletionWithReturnValue:0 error:v11];
  }
  return v7;
}

- (id)requestMallocStackLog:(int)a3 forAddress:(unint64_t *)a4 size:(unint64_t)a5 isLiteZone:(unsigned int)a6
{
  uint64_t v9 = *(void *)&a3;
  unint64_t v11 = objc_opt_new();
  id v12 = [NSNumber numberWithUnsignedLongLong:a4];
  v13 = [NSNumber numberWithUnsignedLongLong:a5];
  id v14 = [NSNumber numberWithBool:a6 != 0];
  id v15 = [MEMORY[0x263F38CA0] messageWithSelector:sel_mallocStackLogForAddress_size_isLiteZone_ objectArguments:v12, v13, v14, 0];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2308DA07C;
  v18[3] = &unk_264B8F770;
  id v16 = v11;
  id v19 = v16;
  [(DTLeaksService *)self _internalRequestForPid:v9 message:v15 completion:v18];

  return v16;
}

- (id)requestVMregionStackLog:(int)a3 forAddress:(unint64_t *)a4 size:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = objc_opt_new();
  id v10 = [NSNumber numberWithUnsignedLongLong:a4];
  unint64_t v11 = [NSNumber numberWithUnsignedLongLong:a5];
  id v12 = [MEMORY[0x263F38CA0] messageWithSelector:sel_vmRegionStackLogForAddress_size_ objectArguments:v10, v11, 0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2308DA24C;
  v15[3] = &unk_264B8F770;
  id v13 = v9;
  id v16 = v13;
  [(DTLeaksService *)self _internalRequestForPid:v7 message:v12 completion:v15];

  return v13;
}

- (int)setMallocStackLoggingMode:(int)a3 forPid:(int)a4
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a4;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Received request to disable MSL for pid [%d]", (uint8_t *)v6, 8u);
  }
  return msl_set_mode_for_pid();
}

- (void)cancelAllRequests
{
  coordinationQueue = self->_coordinationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308DA418;
  block[3] = &unk_264B8D590;
  void block[4] = self;
  dispatch_async(coordinationQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileByPid, 0);
  objc_storeStrong((id *)&self->_helperPidByTargetPid, 0);
  objc_storeStrong((id *)&self->_helperConnectionByTargetPid, 0);
  objc_storeStrong((id *)&self->_preservationQueue, 0);
  objc_storeStrong((id *)&self->_coordinationQueue, 0);
}

@end