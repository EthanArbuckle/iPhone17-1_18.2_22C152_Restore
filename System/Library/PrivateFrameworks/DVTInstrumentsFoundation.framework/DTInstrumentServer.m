@interface DTInstrumentServer
+ (BOOL)isAppleInternal;
+ (unsigned)taskForPid:(int)a3;
+ (void)_taskInvalid:(unsigned int)a3 forPid:(int)a4;
+ (void)_tfpPortReceived:(unsigned int)a3;
+ (void)takeOwnershipOfSharedAuthorization:(void *)a3;
- (DTInstrumentServer)initWithTransport:(id)a3;
- (DTXConnection)connection;
- (id)_blessSimulatorHub:(int)a3;
- (void)_notifyOfTFPCommunicationsPort:(unsigned int)a3;
- (void)cancel;
- (void)loadServicesAtPath:(id)a3;
- (void)resume;
- (void)setMaxConnectionEnqueue:(unint64_t)a3;
@end

@implementation DTInstrumentServer

+ (BOOL)isAppleInternal
{
  return [MEMORY[0x263F08AB0] isAppleInternal];
}

- (DTInstrumentServer)initWithTransport:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)DTInstrumentServer;
  v5 = [(DTInstrumentServer *)&v33 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x263F38C88]) initWithTransport:v4];
      [v7 setMaximumEnqueueSize:0x800000];
      [v7 setDispatchTarget:v6];
      v31[0] = 0;
      v31[1] = v31;
      v31[2] = 0x3032000000;
      v31[3] = sub_2308C8E40;
      v31[4] = sub_2308C8E50;
      id v32 = (id)os_transaction_create();
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = sub_2308C8E58;
      v30[3] = &unk_264B8E278;
      v30[4] = v31;
      [v7 registerDisconnectHandler:v30];
      [v7 setChannelHandler:&unk_26E515688];
      v8 = objc_opt_new();
      v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v10 = v9;
      if (v9
        && ([v9 executablePath], v11 = objc_claimAutoreleasedReturnValue(), (v27 = v11) != 0))
      {
        if ([v11 length]) {
          [v8 addObject:v27];
        }
      }
      else
      {
        v27 = 0;
      }
      v12 = [MEMORY[0x263F086E0] mainBundle];
      v13 = [v12 executablePath];

      if (v13 && [v13 length]) {
        [v8 addObject:v13];
      }
      if (v10)
      {
        v14 = [MEMORY[0x263F086E0] mainBundle];
        v15 = [v14 bundlePath];
        v16 = [v10 bundlePath];
        int v17 = [v15 isEqualToString:v16];

        if (v17)
        {
          v18 = [v10 bundleURL];
          v19 = [v18 URLByDeletingPathExtension];
          v20 = [v19 lastPathComponent];

          if (v20)
          {
            v21 = [v10 bundlePath];
            v22 = [v21 stringByAppendingPathComponent:v20];

            if (v22 && [v22 length]) {
              [v8 addObject:v22];
            }
          }
          else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v10;
            _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failed to construct base name for DTInstrumentServer bundle '%@'", buf, 0xCu);
          }
        }
      }
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = sub_2308C8EE4;
      v28[3] = &unk_264B8F1C0;
      id v23 = v7;
      id v29 = v23;
      [v8 enumerateObjectsUsingBlock:v28];
      if (![v8 count] && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "no services to publish - this DTXConnection is likely to be useless", buf, 2u);
      }
      [v23 publishCapability:@"com.apple.dt.Instruments.inlineCapabilities" withVersion:1 forClass:0];
      connection = v6->_connection;
      v6->_connection = (DTXConnection *)v23;
      id v25 = v23;

      _Block_object_dispose(v31, 8);
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

- (void)resume
{
}

- (void)cancel
{
}

- (void)setMaxConnectionEnqueue:(unint64_t)a3
{
}

- (void)loadServicesAtPath:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = DVTIUCurrentDylibRootPath();
  uint64_t v5 = [v4 stringByAppendingPathComponent:v3];

  [MEMORY[0x263F08850] defaultManager];
  id v25 = v34 = 0;
  v28 = (void *)v5;
  v6 = [v25 contentsOfDirectoryAtPath:v5 error:&v34];
  id v24 = v34;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v13 = [v12 pathExtension];
        int v14 = [v13 isEqualToString:@"bundle"];

        if (v14)
        {
          v15 = [v28 stringByAppendingPathComponent:v12];
          v16 = [MEMORY[0x263F086E0] bundleWithPath:v15];
          if ([v16 isLoaded])
          {
            id v17 = 0;
          }
          else
          {
            id v29 = 0;
            char v18 = [v16 loadAndReturnError:&v29];
            id v17 = v29;
            if ((v18 & 1) == 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              id v26 = [v16 bundlePath];
              uint64_t v21 = [v26 UTF8String];
              id v22 = [v17 localizedDescription];
              uint64_t v23 = [v22 UTF8String];
              *(_DWORD *)buf = 136446466;
              uint64_t v36 = v21;
              __int16 v37 = 2082;
              uint64_t v38 = v23;
              _os_log_error_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to register services in bundle \"%{public}s\" - bundle could not be loaded: %{public}s", buf, 0x16u);
            }
          }
          connection = self->_connection;
          v20 = [v16 executablePath];
          [(DTXConnection *)connection publishServicesInImagePath:v20];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v9);
  }
}

+ (void)takeOwnershipOfSharedAuthorization:(void *)a3
{
  if (a3)
  {
    id obj = a1;
    objc_sync_enter(obj);
    qword_268707F70 = (uint64_t)a3;
    objc_sync_exit(obj);
  }
}

+ (unsigned)taskForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_268707F78 != -1) {
    dispatch_once(&qword_268707F78, &unk_26E5159E8);
  }
  id v5 = a1;
  objc_sync_enter(v5);
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_2308C8E40;
  uint64_t v36 = sub_2308C8E50;
  v6 = (void *)qword_268707F80;
  id v7 = [NSNumber numberWithInt:v3];
  id v37 = [v6 objectForKeyedSubscript:v7];

  uint64_t v8 = (void *)v33[5];
  if (!v8)
  {
    mach_port_name_t v31 = 0;
    if (task_for_pid(*MEMORY[0x263EF8960], v3, &v31)) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v31;
    }
    uint64_t v10 = [NSNumber numberWithUnsignedInt:v9];
    v11 = (void *)v33[5];
    v33[5] = v10;

    uintptr_t v12 = (int)[(id)v33[5] intValue];
    v13 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v14 = dispatch_source_create(MEMORY[0x263EF83D0], v12, 0, v13);

    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    id v25 = sub_2308C9654;
    id v26 = &unk_264B8F1E8;
    v28 = &v32;
    id v29 = v5;
    int v30 = v3;
    v15 = v14;
    v27 = v15;
    dispatch_source_set_event_handler(v15, &v23);
    dispatch_resume(v15);
    uint64_t v16 = v33[5];
    id v17 = (void *)qword_268707F80;
    char v18 = [NSNumber numberWithInt:v3 v23 v24 v25 v26];
    [v17 setObject:v16 forKeyedSubscript:v18];

    v19 = (void *)qword_268707F88;
    v20 = [NSNumber numberWithInt:v3];
    [v19 setObject:v15 forKeyedSubscript:v20];

    uint64_t v8 = (void *)v33[5];
  }
  mach_port_name_t v21 = [v8 unsignedIntValue];
  if (v21 - 1 > 0xFFFFFFFD || mach_port_mod_refs(*MEMORY[0x263EF8960], v21, 0, 1)) {
    mach_port_name_t v21 = 0;
  }
  _Block_object_dispose(&v32, 8);

  objc_sync_exit(v5);
  return v21;
}

+ (void)_taskInvalid:(unsigned int)a3 forPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id obj = a1;
  objc_sync_enter(obj);
  v6 = (void *)qword_268707F80;
  id v7 = [NSNumber numberWithInt:v4];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  int v9 = [v8 intValue];

  if (v9 == a3)
  {
    uint64_t v10 = (void *)qword_268707F80;
    v11 = [NSNumber numberWithInt:v4];
    [v10 removeObjectForKey:v11];

    uintptr_t v12 = (void *)qword_268707F88;
    v13 = [NSNumber numberWithInt:v4];
    [v12 removeObjectForKey:v13];
  }
  if (a3 - 1 <= 0xFFFFFFFD) {
    mach_port_deallocate(*MEMORY[0x263EF8960], a3);
  }
  objc_sync_exit(obj);
}

+ (void)_tfpPortReceived:(unsigned int)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  if ((dword_268707F90 - 1) <= 0xFFFFFFFD) {
    mach_port_deallocate(*MEMORY[0x263EF8960], dword_268707F90);
  }
  dword_268707F90 = a3;
  objc_sync_exit(obj);
}

- (void)_notifyOfTFPCommunicationsPort:(unsigned int)a3
{
}

- (id)_blessSimulatorHub:(int)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = *MEMORY[0x263F08320];
  v9[0] = @"Simulated hub authorization not available on this platform";
  id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v4 errorWithDomain:@"com.apple.DTInstrumentServer" code:-11 userInfo:v5];
  [v3 invokeCompletionWithReturnValue:0 error:v6];

  return v3;
}

- (DTXConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end