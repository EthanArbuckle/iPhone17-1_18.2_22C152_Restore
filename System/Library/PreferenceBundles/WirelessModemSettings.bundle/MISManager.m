@interface MISManager
+ (id)sharedManager;
- (BOOL)didUserPreventData;
- (MISManager)init;
- (void)attachMIS;
- (void)authenticate;
- (void)detachMIS;
- (void)getState:(int *)a3 andReason:(int *)a4;
- (void)init;
- (void)readMISState:(int *)a3 andReason:(int *)a4;
- (void)sendStateUpdate;
- (void)setState:(int)a3;
- (void)stopService;
@end

@implementation MISManager

+ (id)sharedManager
{
  v3 = (void *)sharedInstance;
  if (!sharedInstance)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedInstance;
    sharedInstance = (uint64_t)v4;

    v3 = (void *)sharedInstance;
  }

  return v3;
}

- (void)authenticate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_23F3F1000, log, OS_LOG_TYPE_ERROR, "Skipping authentication check (state: %u, reason: %u)", (uint8_t *)v5, 0xEu);
}

- (void)getState:(int *)a3 andReason:(int *)a4
{
  if (self->_needStateUpdate)
  {
    [(MISManager *)self readMISState:&self->_state andReason:&self->_reason];
    self->_needStateUpdate = 0;
  }
  if (a3) {
    *a3 = self->_state;
  }
  if (a4) {
    *a4 = self->_reason;
  }
}

- (MISManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)MISManager;
  v2 = [(MISManager *)&v14 init];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    int v3 = WMSLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[MISManager init](v3);
    }
  }
  v2->_netClient = 0;
  *(void *)&v2->_state = 1020;
  v2->_needStateUpdate = 1;
  v13.version = 0;
  memset(&v13.retain, 0, 24);
  int v4 = v2;
  v13.info = v4;
  v5 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x263F255D8]);
  radioPrefs = v4->_radioPrefs;
  v4->_radioPrefs = v5;

  SCDynamicStoreRef v7 = SCDynamicStoreCreate(0, @"com.apple.wirelessmodemsettings.MISManager", (SCDynamicStoreCallBack)__SCDynamicStoreCallback, &v13);
  v4->_scDynamicStore = v7;
  if (v7)
  {
    uint64_t v8 = WMSLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MISManager init](v8);
    }

    SCDynamicStoreAddWatchedKey();
    v4->_scRunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v4->_scDynamicStore, 0);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v4->_scRunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  }
  v10 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", *(_OWORD *)&v13.version, *(_OWORD *)&v13.retain, v13.copyDescription);
  [v10 addObserver:v4 selector:sel_applicationDidBecomeActive_ name:@"UIApplicationDidBecomeActiveNotification" object:0];

  v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:v4 selector:sel_applicationWillResignActive_ name:@"UIApplicationWillResignActiveNotification" object:0];

  CTTelephonyCenterGetDefault();
  CTTelephonyCenterAddObserver();
  [(MISManager *)v4 attachMIS];
  return v4;
}

- (void)attachMIS
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F3F1000, v0, v1, "Creating MIS client", v2, v3, v4, v5, v6);
}

uint64_t __23__MISManager_attachMIS__block_invoke(int a1, int a2, xpc_object_t xdict)
{
  if (a2 == 1001 && xpc_dictionary_get_uint64(xdict, (const char *)*MEMORY[0x263F581F8]) == 5002)
  {
    uint64_t v3 = WMSLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __23__MISManager_attachMIS__block_invoke_cold_1();
    }

    uint64_t v4 = +[MISManager sharedManager];
    [v4 stopService];
  }
  return 0;
}

void __23__MISManager_attachMIS__block_invoke_22(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = _NETRBClientCreate();
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = WMSLogComponent();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4) {
      __23__MISManager_attachMIS__block_invoke_22_cold_2();
    }
  }
  else if (v4)
  {
    __23__MISManager_attachMIS__block_invoke_22_cold_1();
  }
}

- (void)detachMIS
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F3F1000, v0, v1, "Destroying MIS client", v2, v3, v4, v5, v6);
}

- (void)stopService
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F3F1000, v0, v1, "Stopping MIS service", v2, v3, v4, v5, v6);
}

- (BOOL)didUserPreventData
{
  return ([(RadiosPreferences *)self->_radioPrefs airplaneMode] & 1) != 0
      || CTCellularDataPlanGetIsEnabled() == 0;
}

- (void)setState:(int)a3
{
  if ((a3 & 0xFFFFFFFE) != 0x3FE)
  {
    SCDynamicStoreRef v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"MISManager.m", 173, @"Invalid parameter not satisfying: %@", @"(state == NETRB_SVC_STATE_ON) || (state == NETRB_SVC_STATE_OFF)" object file lineNumber description];
  }
  if (self->_netClient)
  {
    uint64_t v5 = WMSLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MISManager setState:](a3 == 1023, v5);
    }

    _NETRBClientSetGlobalServiceState();
  }
}

- (void)readMISState:(int *)a3 andReason:(int *)a4
{
  int state = self->_state;
  int reason = self->_reason;
  uint64_t v8 = (void *)SCDynamicStoreCopyValue(self->_scDynamicStore, @"com.apple.MobileInternetSharing");
  id v11 = v8;
  if (v8)
  {
    v9 = [v8 objectForKeyedSubscript:@"State"];
    int state = [v9 intValue];

    v10 = [v11 objectForKeyedSubscript:@"Reason"];
    int reason = [v10 intValue];
  }
  if (a3) {
    *a3 = state;
  }
  if (a4) {
    *a4 = reason;
  }
}

- (void)sendStateUpdate
{
  v15[4] = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  [(MISManager *)self readMISState:(char *)&v13 + 4 andReason:&v13];
  uint64_t state = self->_state;
  if (HIDWORD(v13) != state)
  {
    uint64_t reason = self->_reason;
    uint64_t v4 = v13;
    goto LABEL_5;
  }
  uint64_t v4 = v13;
  uint64_t reason = self->_reason;
  if (v13 != reason)
  {
LABEL_5:
    NSLog(&cfstr_MisStateChange.isa, state, HIDWORD(v13), reason, v4);
    v14[0] = @"State";
    uint8_t v6 = [NSNumber numberWithUnsignedInt:HIDWORD(v13)];
    v15[0] = v6;
    v14[1] = @"Reason";
    SCDynamicStoreRef v7 = [NSNumber numberWithUnsignedInt:v13];
    v15[1] = v7;
    v14[2] = @"PreviousState";
    uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_state];
    v15[2] = v8;
    v14[3] = @"PreviousReason";
    v9 = [NSNumber numberWithUnsignedInt:self->_reason];
    v15[3] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

    int v11 = v13;
    self->_uint64_t state = HIDWORD(v13);
    self->_uint64_t reason = v11;
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 postNotificationName:@"MISManagerStateChangedNotification" object:0 userInfo:v10];
  }
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08B88] callStackSymbols];
  int v3 = 136315394;
  uint64_t v4 = "-[MISManager init]";
  __int16 v5 = 2112;
  uint8_t v6 = v2;
  _os_log_error_impl(&dword_23F3F1000, a1, OS_LOG_TYPE_ERROR, "%s ERROR: instantiating MISManager from a background thread will break functionality\n%@", (uint8_t *)&v3, 0x16u);
}

void __23__MISManager_attachMIS__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F3F1000, v0, v1, "MIS authentication was successful", v2, v3, v4, v5, v6);
}

void __23__MISManager_attachMIS__block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F3F1000, v0, v1, "Failed to create MIS client!", v2, v3, v4, v5, v6);
}

void __23__MISManager_attachMIS__block_invoke_22_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F3F1000, v0, v1, "Attached to MIS", v2, v3, v4, v5, v6);
}

- (void)setState:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = "OFF";
  if (a1) {
    uint64_t v2 = "ON";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_23F3F1000, a2, OS_LOG_TYPE_ERROR, "Setting tethering state %s", (uint8_t *)&v3, 0xCu);
}

@end