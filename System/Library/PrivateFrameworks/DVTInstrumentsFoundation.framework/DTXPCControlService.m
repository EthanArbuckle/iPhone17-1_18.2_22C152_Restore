@interface DTXPCControlService
+ (void)registerCapabilities:(id)a3;
- (DTXPCControlService)initWithChannel:(id)a3;
- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7;
- (void)messageReceived:(id)a3;
- (void)observeServicesWithIdentifier:(id)a3 requestingProcess:(int)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7;
- (void)requestDebugLaunchOfDaemonWithSpecifier:(id)a3 programPath:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7;
- (void)stopObservationsForIdentifier:(id)a3 requestingProcess:(int)a4;
@end

@implementation DTXPCControlService

+ (void)registerCapabilities:(id)a3
{
}

- (DTXPCControlService)initWithChannel:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTXPCControlService;
  v5 = [(DTProcessControlService *)&v9 initWithChannel:v4];
  if (v5)
  {
    if (sub_2308ED0B8() && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v11 = v5;
      _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "XPCControlService %p", buf, 0xCu);
    }
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_2308ED100;
    v7[3] = &unk_264B8D590;
    v8 = v5;
    [v4 registerDisconnectHandler:v7];
  }
  return v5;
}

- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (sub_2308ED0B8() && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    __int16 v33 = 2112;
    id v34 = v14;
    __int16 v35 = 2112;
    id v36 = v15;
    __int16 v37 = 2112;
    id v38 = v16;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "DTXPCControlService launchSuspendedProcessWithDevicePath called: path=%@, bundleIdentifier=%@, environment=%@, arguments=%@, options=%@", buf, 0x34u);
  }
  if (![v13 length]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid bundle identifier"];
  }
  v17 = (void *)[v16 mutableCopy];
  v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_opt_new();
  }
  v20 = v19;

  [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:DTProcessControlServiceOption_OnceOnlyKey[0]];
  id v21 = objc_alloc_init(MEMORY[0x263F38CA8]);
  v22 = +[DTXPCServiceController sharedInstance];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_2308ED434;
  v27[3] = &unk_264B8FBA0;
  v27[4] = self;
  id v23 = v21;
  id v28 = v23;
  [v22 registerClient:self forXPCService:v13 environment:v14 arguments:v15 options:v20 handler:v27];

  v24 = v28;
  id v25 = v23;

  return v25;
}

- (void)messageReceived:(id)a3
{
  if ((id)*MEMORY[0x263F38CC8] == a3)
  {
    id v4 = +[DTXPCServiceController sharedInstance];
    [v4 unregisterClient:self withIdentifier:0 parent:0];
  }
}

- (void)observeServicesWithIdentifier:(id)a3 requestingProcess:(int)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (sub_2308ED0B8() && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    id v27 = v12;
    __int16 v28 = 1024;
    int v29 = v10;
    __int16 v30 = 2112;
    id v31 = v13;
    __int16 v32 = 2112;
    id v33 = v14;
    __int16 v34 = 2112;
    id v35 = v15;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "DTXPCControlService observeServicesWithIdentifier called: serviceID=%@, requestingProcess=%d, environment=%@, arguments=%@, options=%@", buf, 0x30u);
  }
  id v16 = (void *)[v15 mutableCopy];
  v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = (id)objc_opt_new();
  }
  id v19 = v18;

  v20 = [NSNumber numberWithInt:v10];
  [v19 setObject:v20 forKeyedSubscript:DTProcessControlServiceOption_RequestingPidKey[0]];

  id v21 = +[DTXPCServiceController sharedInstance];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_2308ED838;
  v23[3] = &unk_264B8FBA0;
  id v24 = v19;
  id v25 = self;
  id v22 = v19;
  [v21 registerClient:self forXPCService:v12 environment:v13 arguments:v14 options:v22 handler:v23];
}

- (void)requestDebugLaunchOfDaemonWithSpecifier:(id)a3 programPath:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (sub_2308ED0B8() && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v16;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "DTXPCControlService requestDebugLaunchOfDaemonWithSpecifier called: specifier=%@, programPath=%@, environment=%@, arguments=%@, options=%@", buf, 0x34u);
  }
  v17 = +[DTXPCServiceController sharedInstance];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_2308EDAD0;
  v19[3] = &unk_264B8FBA0;
  id v20 = v16;
  id v21 = self;
  id v18 = v16;
  [v17 requestDebugLaunchOfDaemonWithSpecifier:v12 programPath:v13 environment:v14 arguments:v15 options:v18 handler:v19];
}

- (void)stopObservationsForIdentifier:(id)a3 requestingProcess:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = +[DTXPCServiceController sharedInstance];
  [v7 unregisterClient:self withIdentifier:v6 parent:v4];
}

@end