@interface TKSmartCardSlotEngine
+ (NSNumber)_testing_stateDelay;
+ (void)set_testing_stateDelay:(id)a3;
- (BOOL)_setupWithName:(id)a3 delegate:(id)a4;
- (BOOL)apduSentSinceLastReset;
- (BOOL)connectCardSessionWithParameters:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)reset;
- (BOOL)setProtocol:(unint64_t)a3;
- (BOOL)setupWithName:(id)a3 delegate:(id)a4;
- (NSString)name;
- (NSXPCListenerEndpoint)serverEndpoint;
- (OS_dispatch_queue)powerRequestsQueue;
- (OS_dispatch_queue)queue;
- (TKSlotParameters)slotParameters;
- (TKSmartCardSessionEngine)session;
- (TKSmartCardSlotEngine)initWithSlotParameters:(id)a3;
- (TKSmartCardSlotEngineDelegate)delegate;
- (double)powerDownIdleTimeout;
- (id)_findReservation:(id)a3 connection:(id)a4;
- (id)_getReservationId;
- (id)dictionaryForState:(int64_t)a3;
- (id)slotRegistryWithErrorHandler:(id)a3;
- (void)_changeStateTo:(id)a3 forClient:(id)a4;
- (void)cardPresent:(BOOL)a3;
- (void)changeStateTo:(int64_t)a3 powerState:(int64_t)a4;
- (void)dealloc;
- (void)getAttrib:(unsigned int)a3 reply:(id)a4;
- (void)leaveSession:(id)a3;
- (void)logWithBytes:(id)a3 handler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)powerDownWithEject:(BOOL)a3;
- (void)reserveProtocols:(id)a3 reservationId:(id)a4 exclusive:(BOOL)a5 reply:(id)a6;
- (void)reset;
- (void)runUserInteraction:(id)a3 reply:(id)a4;
- (void)scheduleIdlePowerDown;
- (void)sendControl:(id)a3 data:(id)a4 expectedLength:(unsigned int)a5 reply:(id)a6;
- (void)sessionWithParameters:(id)a3 reply:(id)a4;
- (void)setApduSentSinceLastReset:(BOOL)a3;
- (void)setAttrib:(unsigned int)a3 data:(id)a4 reply:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setPowerDownIdleTimeout:(double)a3;
- (void)setPowerRequestsQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServerEndpoint:(id)a3;
- (void)setSession:(id)a3;
- (void)setupSlotWithReply:(id)a3;
- (void)terminate;
- (void)waitForNextState:(int64_t)a3 reply:(id)a4;
- (void)waitForStateFlushedWithReply:(id)a3;
@end

@implementation TKSmartCardSlotEngine

+ (void)set_testing_stateDelay:(id)a3
{
}

+ (NSNumber)_testing_stateDelay
{
  return (NSNumber *)(id)_stateDelay;
}

- (TKSmartCardSlotEngine)initWithSlotParameters:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKSmartCardSlotEngine;
  v6 = [(TKSmartCardSlotEngine *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_lastId = 0;
    v6->_powerDownIdleTimeout = 5.0;
    objc_storeStrong((id *)&v6->_slotParameters, a3);
  }

  return v7;
}

- (void)logWithBytes:(id)a3 handler:(id)a4
{
  id v13 = a3;
  v6 = (void (**)(id, OS_os_log *, uint64_t))a4;
  if (self->_log)
  {
    v7 = [MEMORY[0x1E4F28E78] string];
    id v8 = v13;
    uint64_t v9 = [v8 bytes];
    if ([v8 length])
    {
      unint64_t v10 = 0;
      do
        objc_msgSend(v7, "appendFormat:", @" %02x", *(unsigned __int8 *)(v9 + v10++));
      while (v10 < [v8 length]);
    }
    log = self->_log;
    id v12 = v7;
    v6[2](v6, log, [v12 UTF8String]);
  }
}

- (BOOL)setupWithName:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = TK_LOG_token_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotEngine setupWithName:delegate:]();
  }

  [(TKSlotParameters *)self->_slotParameters setDelegateWithEscapeMethod:objc_opt_respondsToSelector() & 1];
  [(TKSlotParameters *)self->_slotParameters setDelegateWithControlMethod:objc_opt_respondsToSelector() & 1];
  BOOL v9 = [(TKSmartCardSlotEngine *)self _setupWithName:v6 delegate:v7];

  return v9;
}

- (id)slotRegistryWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_registrationConnection synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (BOOL)_setupWithName:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v10 = NSHomeDirectoryForUser(&cfstr_Root.isa);
  char v11 = [v9 fileExistsAtPath:v10 isDirectory:0];

  if ((v11 & 1) == 0)
  {
    id v12 = TK_LOG_token_0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED55000, v12, OS_LOG_TYPE_INFO, "Call 'setupWithName' was postponed, because root's home directory does not exist", buf, 2u);
    }

    id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    v14 = NSHomeDirectoryForUser(&cfstr_Root.isa);
    char v15 = [v13 fileExistsAtPath:v14 isDirectory:0];

    if ((v15 & 1) == 0)
    {
      do
      {
        sleep(1u);
        v16 = [MEMORY[0x1E4F28CB8] defaultManager];
        v17 = NSHomeDirectoryForUser(&cfstr_Root.isa);
        int v18 = [v16 fileExistsAtPath:v17 isDirectory:0];
      }
      while (!v18);
    }
    v19 = TK_LOG_token_0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED55000, v19, OS_LOG_TYPE_INFO, "Method 'setupWithName' continues", buf, 2u);
    }
  }
  objc_storeWeak((id *)&self->_delegate, v8);
  objc_storeStrong((id *)&self->_name, a3);
  self->_previousState = 1;
  *(_OWORD *)&self->_state = xmmword_1BED9CBB0;
  v20 = [MEMORY[0x1E4F1CA48] array];
  sessionRequests = self->_sessionRequests;
  self->_sessionRequests = v20;

  v22 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:5 valueOptions:0];
  stateRequests = self->_stateRequests;
  self->_stateRequests = v22;

  v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qos_class_t v25 = qos_class_main();
  v26 = dispatch_queue_attr_make_with_qos_class(v24, v25, 0);

  id v27 = [NSString stringWithFormat:@"com.apple.scslot:%@", v7];
  v28 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v27 UTF8String], v26);
  queue = self->_queue;
  self->_queue = v28;

  id v30 = [NSString stringWithFormat:@"com.apple.scpwr:%@", v7];
  v31 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v30 UTF8String], v26);
  powerRequestsQueue = self->_powerRequestsQueue;
  self->_powerRequestsQueue = v31;

  v33 = [MEMORY[0x1E4F28D30] hashTableWithOptions:5];
  clients = self->_clients;
  self->_clients = v33;

  v35 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:5 valueOptions:0];
  reservations = self->_reservations;
  self->_reservations = v35;

  v37 = +[TKPowerMonitor defaultMonitor];
  powerMonitor = self->_powerMonitor;
  self->_powerMonitor = v37;

  v39 = self->_powerMonitor;
  v40 = NSStringFromSelector(sel_awaken);
  [(TKPowerMonitor *)v39 addObserver:self forKeyPath:v40 options:5 context:0];

  v41 = [MEMORY[0x1E4F29290] anonymousListener];
  listener = self->_listener;
  self->_listener = v41;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener _setQueue:self->_queue];
  [(NSXPCListener *)self->_listener resume];
  v43 = [(TKSmartCardSlotEngine *)self serverEndpoint];

  id v44 = objc_alloc(MEMORY[0x1E4F29268]);
  v45 = v44;
  if (v43)
  {
    v46 = [(TKSmartCardSlotEngine *)self serverEndpoint];
    v47 = (NSXPCConnection *)[v45 initWithListenerEndpoint:v46];
    registrationConnection = self->_registrationConnection;
    self->_registrationConnection = v47;
  }
  else
  {
    v49 = (NSXPCConnection *)[v44 initWithMachServiceName:@"com.apple.ctkd.slot-registry" options:4096];
    v46 = self->_registrationConnection;
    self->_registrationConnection = v49;
  }

  v50 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A01CE8];
  [(NSXPCConnection *)self->_registrationConnection setRemoteObjectInterface:v50];

  [(NSXPCConnection *)self->_registrationConnection resume];
  *(void *)buf = 0;
  v61 = buf;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke;
  v57[3] = &unk_1E63C86B8;
  id v51 = v7;
  id v58 = v51;
  v59 = self;
  v52 = [(TKSmartCardSlotEngine *)self slotRegistryWithErrorHandler:v57];
  v53 = [(NSXPCListener *)self->_listener endpoint];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_131;
  v56[3] = &unk_1E63C8708;
  v56[4] = self;
  v56[5] = buf;
  [v52 addSlotWithEndpoint:v53 name:v51 type:@"smartcard" reply:v56];

  uint8_t v54 = v61[24];
  _Block_object_dispose(buf, 8);

  return v54;
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = TK_LOG_token_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_cold_1();
  }

  [*(id *)(a1 + 40) terminate];
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_131(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), a2);
  id v5 = TK_LOG_token_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_131_cold_1();
  }

  os_log_t v6 = os_log_create("com.apple.CryptoTokenKit.APDU", "APDULog");
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 120);
  *(void *)(v7 + 120) = v6;

  BOOL v9 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_134;
  v10[3] = &unk_1E63C86E0;
  v10[4] = v9;
  [v9 logWithBytes:0 handler:v10];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_134(uint64_t a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_134_cold_1(a1, oslog);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19FCE60];
  BOOL v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19FD2B0];
  [v8 setInterface:v9 forSelector:sel_sessionWithParameters_reply_ argumentIndex:0 ofReply:1];

  [v7 setExportedInterface:v8];
  [v7 setExportedObject:self];
  unint64_t v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19FA988];
  [v7 setRemoteObjectInterface:v10];

  char v11 = self->_clients;
  objc_sync_enter(v11);
  [(NSHashTable *)self->_clients addObject:v7];
  objc_sync_exit(v11);

  [v7 _setQueue:self->_queue];
  id v12 = TK_LOG_token_0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotEngine listener:shouldAcceptNewConnection:]();
  }

  [v7 resume];
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  id v9 = a3;
  unint64_t v10 = NSStringFromSelector(sel_awaken);
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    id v12 = [v8 objectForKey:*MEMORY[0x1E4F284C8]];
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      if (self->_listener)
      {
        v14 = TK_LOG_token_0();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[TKSmartCardSlotEngine observeValueForKeyPath:ofObject:change:context:]();
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          id v17 = objc_loadWeakRetained((id *)&self->_delegate);
          [v17 didWakeUpOnEngine:self];
LABEL_12:
        }
      }
    }
    else
    {
      int v18 = TK_LOG_token_0();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[TKSmartCardSlotEngine observeValueForKeyPath:ofObject:change:context:]();
      }

      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        id v17 = objc_loadWeakRetained((id *)&self->_delegate);
        [v17 willSleepOnEngine:self];
        goto LABEL_12;
      }
    }
  }
}

- (id)dictionaryForState:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forKey:@"state"];

  id v7 = [NSNumber numberWithInteger:self->_previousState];
  [v5 setObject:v7 forKey:@"prevstate"];

  if (a3 == 4 || a3 == 2)
  {
    atr = self->_atr;
    if (atr)
    {
      id v9 = [(TKSmartCardATR *)atr bytes];
      [v5 setObject:v9 forKey:@"atr"];
    }
    unint64_t v10 = [(NSMapTable *)self->_reservations objectEnumerator];
    int v11 = [v10 nextObject];
    id v12 = [v11 objectEnumerator];
    int v13 = [v12 nextObject];

    if (v13)
    {
      if ([v13 exclusive]) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 1;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    char v15 = [NSNumber numberWithInteger:v14];
    [v5 setObject:v15 forKey:@"share"];

    char v16 = [NSNumber numberWithInteger:self->_powerState];
    [v5 setObject:v16 forKey:@"power"];
  }

  return v5;
}

- (void)_changeStateTo:(id)a3 forClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 remoteObjectProxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__TKSmartCardSlotEngine__changeStateTo_forClient___block_invoke;
  v12[3] = &unk_1E63C8730;
  v12[4] = self;
  id v13 = v8;
  id v14 = v7;
  SEL v15 = a2;
  id v10 = v7;
  id v11 = v8;
  [v9 notifyWithParameters:v10 reply:v12];
}

void __50__TKSmartCardSlotEngine__changeStateTo_forClient___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 96);
  objc_sync_enter(v2);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKey:*(void *)(a1 + 40)];
  id v4 = v3;
  if (v3)
  {
    if (![v3 activeStateNotifications])
    {
      if (![v4 activeStateNotifications])
      {
        id v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"TKSmartCardSlotEngine.m" lineNumber:382 description:@"Mismatch in active state notifications count"];
      }
      id v5 = TK_LOG_token_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __50__TKSmartCardSlotEngine__changeStateTo_forClient___block_invoke_cold_1();
      }
    }
    objc_msgSend(v4, "setActiveStateNotifications:", objc_msgSend(v4, "activeStateNotifications") - 1);
    id v6 = [v4 replyNextState];

    if (v6)
    {
      id v7 = [v4 replyNextState];
      id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"state"];
      v7[2](v7, [v8 integerValue]);

      [v4 setReplyNextState:0];
    }
    id v9 = [v4 replyFlushedState];
    if (v9)
    {
      uint64_t v10 = [v4 activeStateNotifications];

      if (!v10)
      {
        id v11 = [v4 replyFlushedState];
        v11[2]();

        [v4 setReplyFlushedState:0];
      }
    }
  }

  objc_sync_exit(v2);
}

- (void)changeStateTo:(int64_t)a3 powerState:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int64_t state = self->_state;
  self->_powerState = a4;
  self->_previousState = state;
  id v6 = -[TKSmartCardSlotEngine dictionaryForState:](self, "dictionaryForState:");
  id v7 = TK_LOG_token_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotEngine changeStateTo:powerState:]((uint64_t)self, v6, v7);
  }

  v22 = self->_clients;
  objc_sync_enter(v22);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = self->_clients;
  uint64_t v8 = [(NSHashTable *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * v10);
        id v12 = self->_stateRequests;
        objc_sync_enter(v12);
        id v13 = [(NSMapTable *)self->_stateRequests objectForKey:v11];
        if (!v13)
        {
          id v13 = objc_opt_new();
          [(NSMapTable *)self->_stateRequests setObject:v13 forKey:v11];
        }
        objc_msgSend(v13, "setActiveStateNotifications:", objc_msgSend(v13, "activeStateNotifications") + 1);

        objc_sync_exit(v12);
        id v14 = +[TKSmartCardSlotEngine _testing_stateDelay];
        BOOL v15 = v14 == 0;

        if (v15)
        {
          [(TKSmartCardSlotEngine *)self _changeStateTo:v6 forClient:v11];
        }
        else
        {
          char v16 = +[TKSmartCardSlotEngine _testing_stateDelay];
          [v16 floatValue];
          dispatch_time_t v18 = dispatch_time(0, (uint64_t)(float)(v17 * 1000000000.0));
          powerRequestsQueue = self->_powerRequestsQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __50__TKSmartCardSlotEngine_changeStateTo_powerState___block_invoke;
          block[3] = &unk_1E63C83C8;
          block[4] = self;
          id v25 = v6;
          uint64_t v26 = v11;
          dispatch_after(v18, powerRequestsQueue, block);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v22);
  char v20 = self->_stateRequests;
  objc_sync_enter(v20);
  self->_int64_t state = a3;
  objc_sync_exit(v20);
}

uint64_t __50__TKSmartCardSlotEngine_changeStateTo_powerState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _changeStateTo:*(void *)(a1 + 40) forClient:*(void *)(a1 + 48)];
}

- (void)waitForNextState:(int64_t)a3 reply:(id)a4
{
  uint64_t v10 = (void (**)(void))a4;
  id v6 = self->_stateRequests;
  objc_sync_enter(v6);
  if (self->_state == a3)
  {
    id v7 = [MEMORY[0x1E4F29268] currentConnection];
    uint64_t v8 = [(NSMapTable *)self->_stateRequests objectForKey:v7];
    if (v8)
    {
      uint64_t v9 = objc_opt_new();

      [(NSMapTable *)self->_stateRequests setObject:v9 forKey:v7];
    }
    else
    {
      uint64_t v9 = 0;
    }
    [v9 setStateWhenRequested:a3];
    [v9 setReplyNextState:v10];
  }
  else
  {
    v10[2]();
  }
  objc_sync_exit(v6);
}

- (void)waitForStateFlushedWithReply:(id)a3
{
  uint64_t v8 = (void (**)(void))a3;
  id v4 = self->_stateRequests;
  objc_sync_enter(v4);
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  id v6 = [(NSMapTable *)self->_stateRequests objectForKey:v5];
  id v7 = v6;
  if (v6 && [v6 activeStateNotifications]) {
    [v7 setReplyFlushedState:v8];
  }
  else {
    v8[2]();
  }

  objc_sync_exit(v4);
}

- (BOOL)reset
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v4 = TK_LOG_token_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCardSlotEngine reset]();
    }

    [(TKSmartCardSlotEngine *)self changeStateTo:2 powerState:0];
    id v5 = [WeakRetained engineResetCard:self];
    id v6 = TK_LOG_token_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCardSlotEngine reset]();
    }

    if (self->_state == 2)
    {
      objc_storeStrong((id *)&self->_atr, v5);
      if (v5)
      {
        id v7 = [v5 bytes];
        [(TKSmartCardSlotEngine *)self logWithBytes:v7 handler:&__block_literal_global_196];

        BOOL v8 = 1;
        [(TKSmartCardSlotEngine *)self changeStateTo:4 powerState:1];
        self->_apduSentSinceLastReset = 0;
        self->_protocol = 0;
LABEL_14:

        goto LABEL_15;
      }
      [(TKSmartCardSlotEngine *)self logWithBytes:0 handler:&__block_literal_global_199_0];
      uint64_t v9 = TK_LOG_token_0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        int v12 = 138543362;
        id v13 = name;
        _os_log_impl(&dword_1BED55000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: failed to reset the card", (uint8_t *)&v12, 0xCu);
      }

      [(TKSmartCardSlotEngine *)self changeStateTo:3 powerState:0];
    }
    BOOL v8 = 0;
    goto LABEL_14;
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

void __30__TKSmartCardSlotEngine_reset__block_invoke(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __30__TKSmartCardSlotEngine_reset__block_invoke_cold_1();
  }
}

void __30__TKSmartCardSlotEngine_reset__block_invoke_197(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __30__TKSmartCardSlotEngine_reset__block_invoke_197_cold_1();
  }
}

- (BOOL)setProtocol:(unint64_t)a3
{
  id v5 = TK_LOG_token_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotEngine setProtocol:]();
  }

  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      unint64_t v8 = [v7 engine:self setProtocol:a3];

      if (self->_state == 4)
      {
        uint64_t v9 = TK_LOG_token_0();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[TKSmartCardSlotEngine setProtocol:]();
        }

        self->_protocol = v8;
        if (v8)
        {
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __37__TKSmartCardSlotEngine_setProtocol___block_invoke;
          v13[3] = &__block_descriptor_40_e33_v24__0__NSObject_OS_os_log__8r_16l;
          v13[4] = v8;
          [(TKSmartCardSlotEngine *)self logWithBytes:0 handler:v13];
          [(TKSmartCardSlotEngine *)self changeStateTo:4 powerState:2];
          BOOL v10 = 1;
LABEL_15:

          return v10;
        }
        [(TKSmartCardSlotEngine *)self logWithBytes:0 handler:&__block_literal_global_203];
        uint64_t v11 = TK_LOG_token_0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[TKSmartCardSlotEngine setProtocol:]();
        }
      }
    }
    BOOL v10 = 0;
    goto LABEL_15;
  }
  return 1;
}

void __37__TKSmartCardSlotEngine_setProtocol___block_invoke(uint64_t a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __37__TKSmartCardSlotEngine_setProtocol___block_invoke_cold_1(a1, oslog);
  }
}

void __37__TKSmartCardSlotEngine_setProtocol___block_invoke_201(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __37__TKSmartCardSlotEngine_setProtocol___block_invoke_201_cold_1();
  }
}

- (void)powerDownWithEject:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = TK_LOG_token_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCardSlotEngine powerDownWithEject:]();
    }

    char v7 = [WeakRetained engine:self powerDownWithEject:v3];
    unint64_t v8 = TK_LOG_token_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCardSlotEngine powerDownWithEject:]();
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke;
    v9[3] = &__block_descriptor_33_e33_v24__0__NSObject_OS_os_log__8r_16l;
    char v10 = v7;
    [(TKSmartCardSlotEngine *)self logWithBytes:0 handler:v9];
    [(TKSmartCardSlotEngine *)self changeStateTo:self->_state powerState:0];
  }
}

void __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  LODWORD(a1) = *(unsigned __int8 *)(a1 + 32);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (a1)
  {
    if (v4) {
      __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke_cold_2();
    }
  }
  else if (v4)
  {
    __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke_cold_1();
  }
}

- (void)scheduleIdlePowerDown
{
  if (![(NSMapTable *)self->_reservations count])
  {
    [(TKSmartCardSlotEngine *)self powerDownIdleTimeout];
    if (v3 > 0.0)
    {
      BOOL v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
      idlePowerDownSource = self->_idlePowerDownSource;
      self->_idlePowerDownSource = v4;

      [(TKSmartCardSlotEngine *)self powerDownIdleTimeout];
      uint64_t v7 = (uint64_t)(v6 * 1000000000.0);
      unint64_t v8 = self->_idlePowerDownSource;
      dispatch_time_t v9 = dispatch_time(0, v7);
      dispatch_source_set_timer(v8, v9, v7, v7);
      char v10 = self->_idlePowerDownSource;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke;
      handler[3] = &unk_1E63C80E0;
      handler[4] = self;
      dispatch_source_set_event_handler(v10, handler);
      dispatch_resume((dispatch_object_t)self->_idlePowerDownSource);
    }
  }
}

void __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke(uint64_t a1)
{
  id v2 = TK_LOG_token_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke_cold_1();
  }

  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 56));
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(NSObject **)(v5 + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke_205;
  block[3] = &unk_1E63C80E0;
  block[4] = v5;
  dispatch_sync(v6, block);
}

uint64_t __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke_205(uint64_t a1)
{
  return [*(id *)(a1 + 32) powerDownWithEject:0];
}

- (void)cardPresent:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__TKSmartCardSlotEngine_cardPresent___block_invoke;
  v4[3] = &unk_1E63C87B8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0;
  }
  int v5 = *(unsigned __int8 *)(a1 + 40);
  double v6 = TK_LOG_token_0();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 168);
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v8;
      _os_log_impl(&dword_1BED55000, v6, OS_LOG_TYPE_INFO, "%{public}@: card inserted", buf, 0xCu);
    }

    [*(id *)(a1 + 32) logWithBytes:0 handler:&__block_literal_global_208];
    uint64_t v9 = *(void *)(a1 + 32);
    char v10 = *(NSObject **)(v9 + 184);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__TKSmartCardSlotEngine_cardPresent___block_invoke_209;
    block[3] = &unk_1E63C80E0;
    block[4] = v9;
    dispatch_async(v10, block);
  }
  else
  {
    if (v7)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 168);
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v11;
      _os_log_impl(&dword_1BED55000, v6, OS_LOG_TYPE_INFO, "%{public}@: card removed", buf, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    [*(id *)(a1 + 32) logWithBytes:0 handler:&__block_literal_global_212];
    [*(id *)(a1 + 32) changeStateTo:1 powerState:0];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
    [WeakRetained setValid:0];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = *(id *)(*(void *)(a1 + 32) + 88);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v19), "reply", (void)v22);
          char v20 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
          v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
          ((void (**)(void, void, void, void *))v20)[2](v20, 0, 0, v21);

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v17);
    }

    [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
  }
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_206(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __37__TKSmartCardSlotEngine_cardPresent___block_invoke_206_cold_1();
  }
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_209(uint64_t a1)
{
  if ([*(id *)(a1 + 32) reset])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(NSObject **)(v2 + 176);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__TKSmartCardSlotEngine_cardPresent___block_invoke_2;
    block[3] = &unk_1E63C80E0;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __37__TKSmartCardSlotEngine_cardPresent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleIdlePowerDown];
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_210(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __37__TKSmartCardSlotEngine_cardPresent___block_invoke_210_cold_1();
  }
}

- (void)setupSlotWithReply:(id)a3
{
  int64_t state = self->_state;
  int v5 = (void (**)(id, void *))a3;
  double v6 = [(TKSmartCardSlotEngine *)self dictionaryForState:state];
  [v6 setObject:self->_name forKey:@"name"];
  BOOL v7 = [(TKSmartCardSlotEngine *)self slotParameters];
  uint64_t v8 = [v7 getDictionaryParameters];
  [v6 setObject:v8 forKey:@"params"];

  uint64_t v9 = TK_LOG_token_0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotEngine setupSlotWithReply:]();
  }

  v5[2](v5, v6);
}

- (BOOL)connectCardSessionWithParameters:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"sensitive"];
  double v6 = [v4 objectForKeyedSubscript:@"protocol"];
  BOOL v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 unsignedIntegerValue];
  }
  else {
    uint64_t v8 = 0xFFFFLL;
  }
  uint64_t v9 = TK_LOG_token_0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = name;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v8;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v5;
    _os_log_debug_impl(&dword_1BED55000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: connectCardSession:proto=%04x, sensitive=%@", buf, 0x1Cu);
  }

  objc_initWeak(&location, self);
  powerRequestsQueue = self->_powerRequestsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke;
  block[3] = &unk_1E63C80E0;
  block[4] = self;
  dispatch_sync(powerRequestsQueue, block);
  uint64_t v11 = TK_LOG_token_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotEngine connectCardSessionWithParameters:]();
  }

  if (!self->_powerState || [v5 BOOLValue] && self->_apduSentSinceLastReset)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    buf[24] = 0;
LABEL_12:
    uint64_t v12 = self->_powerRequestsQueue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_214;
    v23[3] = &unk_1E63C87E0;
    v23[4] = self;
    v23[5] = buf;
    v24[1] = (id)v8;
    objc_copyWeak(v24, &location);
    dispatch_sync(v12, v23);
    objc_destroyWeak(v24);
    goto LABEL_19;
  }
  if (self->_powerState != 2)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    buf[24] = 0;
    uint64_t v17 = self->_powerRequestsQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_215;
    v21[3] = &unk_1E63C8808;
    v21[4] = self;
    v21[5] = buf;
    v22[1] = (id)v8;
    objc_copyWeak(v22, &location);
    dispatch_sync(v17, v21);
    objc_destroyWeak(v22);
    goto LABEL_19;
  }
  unint64_t protocol = self->_protocol;
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  buf[24] = 0;
  if ((protocol & ~v8) != 0) {
    goto LABEL_12;
  }
  uint64_t v14 = TK_LOG_token_0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v15 = objc_loadWeakRetained(&location);
    uint64_t v16 = [v15 name];
    -[TKSmartCardSlotEngine connectCardSessionWithParameters:](v16, (uint64_t)v27, v14, v15);
  }

  *(unsigned char *)(*(void *)&buf[8] + 24) = 1;
LABEL_19:
  BOOL v18 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);

  return v18;
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0;
  }
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_214(uint64_t a1)
{
  if ([*(id *)(a1 + 32) reset])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) setProtocol:*(void *)(a1 + 56)];
    uint64_t v2 = TK_LOG_token_0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_214_cold_1(a1, v2);
    }
  }
  else
  {
    uint64_t v3 = TK_LOG_token_0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_214_cold_2(a1, v3);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_215(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) setProtocol:*(void *)(a1 + 56)];
  uint64_t v2 = TK_LOG_token_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_215_cold_1(a1, v2);
  }
}

- (void)leaveSession:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (!v4)
  {
    int v8 = 0;
    goto LABEL_21;
  }
  uint64_t v6 = [v4 endPolicy];
  if ((unint64_t)(v6 - 2) < 2)
  {
    uint64_t v9 = TK_LOG_token_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCardSlotEngine leaveSession:]();
    }

    BOOL v10 = [v5 endPolicy] == 3;
    powerRequestsQueue = self->_powerRequestsQueue;
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __38__TKSmartCardSlotEngine_leaveSession___block_invoke_216;
    v34 = &unk_1E63C87B8;
    char v12 = v10;
    v35 = self;
    char v36 = v12;
    dispatch_sync(powerRequestsQueue, &v31);
  }
  else
  {
    if (v6 == 1)
    {
      id v13 = TK_LOG_token_0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[TKSmartCardSlotEngine leaveSession:]();
      }

      uint64_t v14 = self->_powerRequestsQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__TKSmartCardSlotEngine_leaveSession___block_invoke;
      block[3] = &unk_1E63C80E0;
      block[4] = self;
      dispatch_sync(v14, block);
      goto LABEL_19;
    }
    if (!v6)
    {
      BOOL v7 = TK_LOG_token_0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[TKSmartCardSlotEngine leaveSession:]();
      }

LABEL_19:
      int v8 = 1;
      goto LABEL_20;
    }
  }
  int v8 = 0;
LABEL_20:
  objc_msgSend(v5, "setActive:", 0, v31, v32, v33, v34);
LABEL_21:
  objc_storeWeak((id *)&self->_session, 0);
  if ([(NSMutableArray *)self->_sessionRequests count])
  {
    id v15 = [(NSMutableArray *)self->_sessionRequests objectAtIndexedSubscript:0];
    [(NSMutableArray *)self->_sessionRequests removeObjectAtIndex:0];
    uint64_t v16 = [TKSmartCardSessionEngine alloc];
    uint64_t v17 = [v15 connection];
    BOOL v18 = [(TKSmartCardSessionEngine *)v16 initWithSlot:self connection:v17];

    objc_storeWeak((id *)&self->_session, v18);
    uint64_t v19 = [v15 parameters];
    char v20 = [v19 objectForKeyedSubscript:@"endpolicy"];

    if (v20) {
      uint64_t v21 = [v20 unsignedIntegerValue];
    }
    else {
      uint64_t v21 = 0;
    }
    [(TKSmartCardSessionEngine *)v18 setEndPolicy:v21];
    long long v22 = [v15 parameters];
    BOOL v23 = [(TKSmartCardSlotEngine *)self connectCardSessionWithParameters:v22];

    if (v23)
    {
      [(TKSmartCardSessionEngine *)v18 setActive:1];
      long long v24 = [v15 reply];
      v38 = @"protocol";
      long long v25 = [NSNumber numberWithUnsignedInteger:self->_protocol];
      v39[0] = v25;
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
      ((void (**)(void, TKSmartCardSessionEngine *, void *, void))v24)[2](v24, v18, v26, 0);

      if ([(NSMutableArray *)self->_sessionRequests count])
      {
        long long v27 = [(TKSmartCardSessionEngine *)v18 connection];
        long long v28 = [v27 remoteObjectProxy];

        [v28 cardSessionRequested];
      }
    }
    else
    {
      uint64_t v29 = [v15 reply];
      uint64_t v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:0];
      ((void (**)(void, void, void, void *))v29)[2](v29, 0, 0, v30);

      [(TKSmartCardSlotEngine *)self leaveSession:0];
    }
  }
  else if (v8 && self->_atr)
  {
    [(TKSmartCardSlotEngine *)self scheduleIdlePowerDown];
  }
}

uint64_t __38__TKSmartCardSlotEngine_leaveSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

uint64_t __38__TKSmartCardSlotEngine_leaveSession___block_invoke_216(uint64_t a1)
{
  return [*(id *)(a1 + 32) powerDownWithEject:*(unsigned __int8 *)(a1 + 40)];
}

- (void)sessionWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = objc_alloc_init(TKSmartCardSessionRequest);
  [(TKSmartCardSessionRequest *)v13 setParameters:v7];

  [(TKSmartCardSessionRequest *)v13 setReply:v6];
  int v8 = [MEMORY[0x1E4F29268] currentConnection];
  [(TKSmartCardSessionRequest *)v13 setConnection:v8];

  [(NSMutableArray *)self->_sessionRequests addObject:v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  BOOL v10 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v11 = [WeakRetained connection];
    char v12 = [v11 remoteObjectProxy];

    [v12 cardSessionRequested];
  }
  else
  {
    [(TKSmartCardSlotEngine *)self leaveSession:0];
  }
}

- (id)_findReservation:(id)a3 connection:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = [(NSMapTable *)self->_reservations objectForKey:v7];
    BOOL v10 = [v9 objectForKey:v6];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = self->_reservations;
    uint64_t v12 = [(NSMapTable *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v8 = 0;
      uint64_t v14 = *(void *)v20;
LABEL_5:
      uint64_t v15 = 0;
      uint64_t v16 = v8;
      while (1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v8 = *(id *)(*((void *)&v19 + 1) + 8 * v15);

        uint64_t v17 = -[NSMapTable objectForKey:](self->_reservations, "objectForKey:", v8, (void)v19);
        BOOL v10 = [v17 objectForKey:v6];

        if (v10) {
          break;
        }
        ++v15;
        uint64_t v16 = v8;
        if (v13 == v15)
        {
          uint64_t v13 = [(NSMapTable *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v13) {
            goto LABEL_5;
          }

          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      id v8 = 0;
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (id)_getReservationId
{
  do
  {
    uint64_t v3 = NSNumber;
    ++self->_lastId;
    id v4 = objc_msgSend(v3, "numberWithUnsignedInteger:");
    int v5 = [(TKSmartCardSlotEngine *)self _findReservation:v4 connection:0];
  }
  while (v5);
  id v6 = NSNumber;
  unint64_t lastId = self->_lastId;

  return (id)[v6 numberWithUnsignedInteger:lastId];
}

- (void)reserveProtocols:(id)a3 reservationId:(id)a4 exclusive:(BOOL)a5 reply:(id)a6
{
  BOOL v25 = a5;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v32 = a4;
  id v27 = a6;
  uint64_t v26 = [MEMORY[0x1E4F29268] currentConnection];
  if (v32)
  {
    uint64_t v29 = [(TKSmartCardSlotEngine *)self _findReservation:v32 connection:v26];
    id v8 = v29;
    if (!v29)
    {
      (*((void (**)(id, void, void, uint64_t))v27 + 2))(v27, 0, 0, 3);
      uint64_t v29 = 0;
      goto LABEL_38;
    }
    if (!v28)
    {
      uint64_t v9 = [(NSMapTable *)self->_reservations objectForKey:v26];
      [v9 removeObjectForKey:v32];
      if (![v9 count]) {
        [(NSMapTable *)self->_reservations removeObjectForKey:v26];
      }

      (*((void (**)(id, void, void, void))v27 + 2))(v27, 0, 0, 0);
      goto LABEL_37;
    }
  }
  else
  {
    if (!v28)
    {
      (*((void (**)(id, void, void, void))v27 + 2))(v27, 0, 0, 0);
      uint64_t v29 = 0;
      id v32 = 0;
      goto LABEL_38;
    }
    id v8 = 0;
  }
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0xFFFFLL;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obj = self->_reservations;
  uint64_t v10 = [(NSMapTable *)obj countByEnumeratingWithState:&v39 objects:v55 count:16];
  uint64_t v29 = v8;
  if (v10)
  {
    uint64_t v11 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = [(NSMapTable *)self->_reservations objectForKey:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __72__TKSmartCardSlotEngine_reserveProtocols_reservationId_exclusive_reply___block_invoke;
        v34[3] = &unk_1E63C8830;
        id v35 = v32;
        char v36 = &v43;
        v37 = &v47;
        v38 = &v51;
        [v13 enumerateKeysAndObjectsUsingBlock:v34];
      }
      uint64_t v10 = [(NSMapTable *)obj countByEnumeratingWithState:&v39 objects:v55 count:16];
    }
    while (v10);
  }

  if (!v25)
  {
    if (!*((unsigned char *)v48 + 24))
    {
      uint64_t v16 = v44[3];
      if (([v28 unsignedIntegerValue] & v16) != 0) {
        goto LABEL_25;
      }
      if (!*((unsigned char *)v48 + 24))
      {
        uint64_t v24 = v44[3];
        if (([v28 unsignedIntegerValue] & v24) != 0) {
          uint64_t v14 = 3;
        }
        else {
          uint64_t v14 = 1;
        }
        goto LABEL_21;
      }
    }
LABEL_20:
    uint64_t v14 = 2;
LABEL_21:
    (*((void (**)(id, void, void, uint64_t))v27 + 2))(v27, 0, 0, v14);
    int v15 = 0;
    goto LABEL_36;
  }
  if (*((unsigned char *)v52 + 24)) {
    goto LABEL_20;
  }
LABEL_25:
  if (!v29)
  {
    long long v20 = [MEMORY[0x1E4F29268] currentConnection];
    long long v21 = [(NSMapTable *)self->_reservations objectForKey:v20];
    if (!v21)
    {
      long long v21 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMapTable *)self->_reservations setObject:v21 forKey:v20];
    }
    uint64_t v29 = objc_alloc_init(_TKSmartCardSlotReservation);
    [(_TKSmartCardSlotReservation *)v29 setProtocols:v28];
    [(_TKSmartCardSlotReservation *)v29 setExclusive:v25];
    uint64_t v19 = [(TKSmartCardSlotEngine *)self _getReservationId];

    [v21 setObject:v29 forKey:v19];
    goto LABEL_34;
  }
  uint64_t v17 = [(_TKSmartCardSlotReservation *)v29 protocols];
  if (![v17 isEqual:v28])
  {

    goto LABEL_33;
  }
  BOOL v18 = [(_TKSmartCardSlotReservation *)v29 exclusive];

  if ((v18 ^ v25))
  {
LABEL_33:
    [(_TKSmartCardSlotReservation *)v29 setProtocols:v28];
    uint64_t v19 = (uint64_t)v32;
    [(_TKSmartCardSlotReservation *)v29 setExclusive:v25];
LABEL_34:
    int v15 = 1;
    goto LABEL_35;
  }
  int v15 = 0;
  uint64_t v19 = (uint64_t)v32;
LABEL_35:
  long long v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "unsignedIntegerValue") & v44[3]);
  (*((void (**)(id, void *, uint64_t, void))v27 + 2))(v27, v22, v19, 0);

  id v32 = (id)v19;
LABEL_36:
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  if (v15)
  {
LABEL_37:
    powerRequestsQueue = self->_powerRequestsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__TKSmartCardSlotEngine_reserveProtocols_reservationId_exclusive_reply___block_invoke_2;
    block[3] = &unk_1E63C80E0;
    block[4] = self;
    dispatch_sync(powerRequestsQueue, block);
  }
LABEL_38:
}

void __72__TKSmartCardSlotEngine_reserveProtocols_reservationId_exclusive_reply___block_invoke(void *a1, uint64_t a2, void *a3)
{
  if (a1[4] != a2)
  {
    id v4 = a3;
    int v5 = [v4 protocols];
    *(void *)(*(void *)(a1[5] + 8) + 24) &= [v5 unsignedIntegerValue];

    LOBYTE(v5) = [v4 exclusive];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v5;
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

uint64_t __72__TKSmartCardSlotEngine_reserveProtocols_reservationId_exclusive_reply___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeStateTo:*(void *)(*(void *)(a1 + 32) + 16) powerState:*(void *)(*(void *)(a1 + 32) + 24)];
}

- (void)sendControl:(id)a3 data:(id)a4 expectedLength:(unsigned int)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v16 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void *))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    int v15 = [v14 engine:self control:v16 data:v10 expectedLength:v7];
  }
  else
  {
    int v15 = 0;
  }
  v11[2](v11, v15);
}

- (void)getAttrib:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void (**)(id, void *, uint64_t))a4;
  uint64_t v7 = 600;
  uint64_t v12 = 600;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v11 = [v10 engine:self getAttrib:v4 error:&v12];

    uint64_t v7 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  v6[2](v6, v11, v7);
}

- (void)setAttrib:(unsigned int)a3 data:(id)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  char v9 = (void (**)(id, uint64_t, BOOL))a5;
  BOOL v10 = 1;
  char v15 = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v14 = [v13 engine:self setAttrib:v6 data:v8 attribNotSupported:&v15];

    BOOL v10 = v15 != 0;
  }
  else
  {
    uint64_t v14 = 0;
  }
  v9[2](v9, v14, v10);
}

- (void)runUserInteraction:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, id))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    id v13 = 0;
    uint64_t v11 = [v10 engine:self runUserInteraction:v6 error:&v13];
    id v12 = v13;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    uint64_t v11 = 0;
  }
  v7[2](v7, v11, v12);
}

- (void)terminate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__TKSmartCardSlotEngine_terminate__block_invoke;
  block[3] = &unk_1E63C80E0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __34__TKSmartCardSlotEngine_terminate__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TK_LOG_token_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __34__TKSmartCardSlotEngine_terminate__block_invoke_cold_1();
  }

  [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
  [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v7++), "invalidate", (void)v12);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(void **)(v8 + 80);
  *(void *)(v8 + 80) = 0;

  id v10 = *(dispatch_source_t **)(a1 + 32);
  if (v10[7])
  {
    dispatch_source_cancel(v10[7]);
    id v10 = *(dispatch_source_t **)(a1 + 32);
  }
  return -[dispatch_source_t logWithBytes:handler:](v10, "logWithBytes:handler:", 0, &__block_literal_global_230, (void)v12);
}

void __34__TKSmartCardSlotEngine_terminate__block_invoke_228(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __34__TKSmartCardSlotEngine_terminate__block_invoke_228_cold_1();
  }
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: dealloc", v2, v3, v4, v5, v6);
}

- (double)powerDownIdleTimeout
{
  return self->_powerDownIdleTimeout;
}

- (void)setPowerDownIdleTimeout:(double)a3
{
  self->_powerDownIdleTimeout = a3;
}

- (TKSlotParameters)slotParameters
{
  return (TKSlotParameters *)objc_getProperty(self, a2, 144, 1);
}

- (NSXPCListenerEndpoint)serverEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 152, 1);
}

- (void)setServerEndpoint:(id)a3
{
}

- (TKSmartCardSlotEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TKSmartCardSlotEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)powerRequestsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 184, 1);
}

- (void)setPowerRequestsQueue:(id)a3
{
}

- (BOOL)apduSentSinceLastReset
{
  return self->_apduSentSinceLastReset;
}

- (void)setApduSentSinceLastReset:(BOOL)a3
{
  self->_apduSentSinceLastReset = a3;
}

- (TKSmartCardSessionEngine)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (TKSmartCardSessionEngine *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_powerRequestsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverEndpoint, 0);
  objc_storeStrong((id *)&self->_slotParameters, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_powerMonitor, 0);
  objc_storeStrong((id *)&self->_reservations, 0);
  objc_storeStrong((id *)&self->_stateRequests, 0);
  objc_storeStrong((id *)&self->_sessionRequests, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_registrationConnection, 0);
  objc_storeStrong((id *)&self->_idlePowerDownSource, 0);

  objc_storeStrong((id *)&self->_atr, 0);
}

- (void)setupWithName:delegate:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "setupWithName:'%{public}@'", v2, v3, v4, v5, v6);
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_9_0();
  _os_log_error_impl(&dword_1BED55000, v0, OS_LOG_TYPE_ERROR, "%{public}@: failed to register, error:%{public}@", v1, 0x16u);
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_131_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "initWithName:'%{public}@' successfully registered", v2, v3, v4, v5, v6);
}

void __49__TKSmartCardSlotEngine__setupWithName_delegate___block_invoke_134_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 168);
  uint64_t v3 = a2;
  [v2 UTF8String];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1BED55000, v3, v4, "logging slot %{public}s", v5);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: new client connection established", v2, v3, v4, v5, v6);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: wakeup notification", v2, v3, v4, v5, v6);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: sleep notification", v2, v3, v4, v5, v6);
}

void __50__TKSmartCardSlotEngine__changeStateTo_forClient___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1BED55000, v0, OS_LOG_TYPE_ERROR, "Mismatch in active state notifications count", v1, 2u);
}

- (void)changeStateTo:(NSObject *)a3 powerState:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 168);
  uint64_t v5 = [a2 description];
  uint8_t v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F19EDBB0];
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_debug_impl(&dword_1BED55000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: broadcasting state change %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)reset
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: card reset", v2, v3, v4, v5, v6);
}

void __30__TKSmartCardSlotEngine_reset__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "ATR:%{public}s", v2, v3, v4, v5, v6);
}

void __30__TKSmartCardSlotEngine_reset__block_invoke_197_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "Reset FAILED", v2, v3, v4, v5, v6);
}

- (void)setProtocol:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_1();
  _os_log_error_impl(&dword_1BED55000, v0, OS_LOG_TYPE_ERROR, "%{public}@: failed to set protocol for the card", v1, 0xCu);
}

- (void)setProtocol:.cold.2()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_6_1(&dword_1BED55000, v0, v1, "%{public}@: used protocol %04x");
}

- (void)setProtocol:.cold.3()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_6_1(&dword_1BED55000, v0, v1, "%{public}@: set protocol %04x");
}

void __37__TKSmartCardSlotEngine_setProtocol___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 32) - 1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1BED55000, a2, OS_LOG_TYPE_DEBUG, "T=%d", (uint8_t *)v3, 8u);
}

void __37__TKSmartCardSlotEngine_setProtocol___block_invoke_201_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "PPS FAILED", v2, v3, v4, v5, v6);
}

- (void)powerDownWithEject:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_1(&dword_1BED55000, v0, v1, "%{public}@: unpower done (%d)");
}

- (void)powerDownWithEject:.cold.2()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_1(&dword_1BED55000, v0, v1, "%{public}@: unpowerCard(eject=%d)");
}

void __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "unpower FAILED", v2, v3, v4, v5, v6);
}

void __44__TKSmartCardSlotEngine_powerDownWithEject___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "unpower", v2, v3, v4, v5, v6);
}

void __46__TKSmartCardSlotEngine_scheduleIdlePowerDown__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: going to idle-unpower card", v2, v3, v4, v5, v6);
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_206_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "card in", v2, v3, v4, v5, v6);
}

void __37__TKSmartCardSlotEngine_cardPresent___block_invoke_210_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "card out", v2, v3, v4, v5, v6);
}

- (void)setupSlotWithReply:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: slot was set up", v2, v3, v4, v5, v6);
}

- (void)connectCardSessionWithParameters:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_1BED55000, a3, (uint64_t)a3, "%{public}@: connectCardSession already in nego state", (uint8_t *)a2);
}

- (void)connectCardSessionWithParameters:.cold.2()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[6];
  int v6 = 138544130;
  uint64_t v7 = v4;
  __int16 v8 = 1024;
  int v9 = v1;
  __int16 v10 = 1024;
  int v11 = v2;
  __int16 v12 = 1024;
  int v13 = v3;
  _os_log_debug_impl(&dword_1BED55000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: connect:_state=%d,_power=%d,_proto=%d", (uint8_t *)&v6, 0x1Eu);
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_214_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained name];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1BED55000, a2, v5, "%{public}@: connectCardSession did RESET & PPS", v6);
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_214_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained name];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1BED55000, a2, v5, "%{public}@: connectCardSession RESET failed", v6);
}

void __58__TKSmartCardSlotEngine_connectCardSessionWithParameters___block_invoke_215_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained name];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1BED55000, a2, v5, "%{public}@: connectCardSession did only PPS", v6);
}

- (void)leaveSession:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: leaving session, policyLeave", v2, v3, v4, v5, v6);
}

- (void)leaveSession:.cold.2()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: leaving session, policyReset", v2, v3, v4, v5, v6);
}

- (void)leaveSession:.cold.3()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: leaving session, policyPowerDown/Eject", v2, v3, v4, v5, v6);
}

void __34__TKSmartCardSlotEngine_terminate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "%{public}@: terminate", v2, v3, v4, v5, v6);
}

void __34__TKSmartCardSlotEngine_terminate__block_invoke_228_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "slot gone", v2, v3, v4, v5, v6);
}

@end