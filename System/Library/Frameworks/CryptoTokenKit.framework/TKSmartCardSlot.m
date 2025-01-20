@interface TKSmartCardSlot
- (NSInteger)maxInputLength;
- (NSInteger)maxOutputLength;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (TKSmartCard)makeSmartCard;
- (TKSmartCardATR)ATR;
- (TKSmartCardSlot)initWithEndpoint:(id)a3 error:(id *)a4;
- (TKSmartCardSlotProxy)proxy;
- (TKSmartCardSlotState)state;
- (id)description;
- (id)screen;
- (id)slotParameters;
- (id)synchronous:(BOOL)a3 remoteSlotWithErrorHandler:(id)a4;
- (id)userInteractionForConfirmation;
- (id)userInteractionForStringEntry;
- (int64_t)powerState;
- (int64_t)previousState;
- (int64_t)shareState;
- (void)connectToEndpoint:(id)a3 synchronous:(BOOL)a4 reply:(id)a5;
- (void)control:(id)a3 data:(id)a4 expectedLength:(unsigned int)a5 reply:(id)a6;
- (void)dealloc;
- (void)getAttrib:(unsigned int)a3 reply:(id)a4;
- (void)invalidate;
- (void)setATR:(id)a3;
- (void)setAttrib:(unsigned int)a3 data:(id)a4 reply:(id)a5;
- (void)setPowerState:(int64_t)a3;
- (void)setPreviousState:(int64_t)a3;
- (void)setShareState:(int64_t)a3;
- (void)setState:(int64_t)a3;
@end

@implementation TKSmartCardSlot

- (id)description
{
  return (id)[NSString stringWithFormat:@"<TKSmartCardSlot: %p '%@'>", self, self->_name];
}

- (id)synchronous:(BOOL)a3 remoteSlotWithErrorHandler:(id)a4
{
  connection = self->_connection;
  if (a3) {
    [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:a4];
  }
  else {
  v5 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:a4];
  }

  return v5;
}

- (void)connectToEndpoint:(id)a3 synchronous:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v8];
  connection = self->_connection;
  self->_connection = v10;

  v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19FCE60];
  v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19FD2B0];
  [v12 setInterface:v13 forSelector:sel_sessionWithParameters_reply_ argumentIndex:0 ofReply:1];

  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v12];
  v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19FA988];
  [(NSXPCConnection *)self->_connection setExportedInterface:v14];

  v15 = [[TKSmartCardSlotProxy alloc] initWithSlot:self];
  proxy = self->_proxy;
  self->_proxy = v15;

  [(NSXPCConnection *)self->_connection setExportedObject:self->_proxy];
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke;
  v26[3] = &unk_1E63C8270;
  objc_copyWeak(&v27, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v26];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_118;
  v24[3] = &unk_1E63C8270;
  objc_copyWeak(&v25, &location);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v24];
  [(NSXPCConnection *)self->_connection resume];
  self->_state = 1;
  self->_previousState = 1;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_119;
  v22[3] = &unk_1E63C8298;
  id v17 = v9;
  id v23 = v17;
  v18 = [(TKSmartCardSlot *)self synchronous:v6 remoteSlotWithErrorHandler:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_120;
  v20[3] = &unk_1E63C82C0;
  v20[4] = self;
  id v19 = v17;
  id v21 = v19;
  [v18 setupSlotWithReply:v20];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = TK_LOG_smartcard();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_cold_1();
    }

    id v3 = WeakRetained;
    objc_sync_enter(v3);
    [v3 setState:0];
    objc_sync_exit(v3);

    [v3 setPreviousState:0];
    [v3 setATR:0];
  }
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_118(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = TK_LOG_smartcard();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_118_cold_1();
    }

    [WeakRetained invalidate];
  }
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_119(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = TK_LOG_smartcard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_119_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_120(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:@"name"];
  uint64_t v6 = a1 + 32;
  uint64_t v5 = *(void *)(a1 + 32);
  v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v4;

  id v8 = [v3 objectForKey:@"state"];
  *(void *)(*(void *)v6 + 40) = [v8 integerValue];

  id v9 = [v3 objectForKey:@"prevstate"];
  *(void *)(*(void *)v6 + 72) = [v9 integerValue];

  v10 = [TKSmartCardATR alloc];
  v11 = [v3 objectForKey:@"atr"];
  uint64_t v12 = [(TKSmartCardATR *)v10 initWithBytes:v11];
  v13 = *(void **)(*(void *)(a1 + 32) + 48);
  *(void *)(*(void *)v6 + 48) = v12;

  v14 = [v3 objectForKey:@"power"];
  *(void *)(*(void *)v6 + 16) = [v14 integerValue];

  v15 = [v3 objectForKey:@"share"];
  *(void *)(*(void *)v6 + 24) = [v15 integerValue];

  [*(id *)(*(void *)(a1 + 32) + 64) slotInitialized];
  v16 = [TKSlotParameters alloc];
  id v17 = [v3 objectForKey:@"params"];

  uint64_t v18 = [(TKSlotParameters *)v16 initWithEntriesFromDictionary:v17];
  id v19 = *(void **)(*(void *)(a1 + 32) + 32);
  *(void *)(*(void *)v6 + 32) = v18;

  v20 = TK_LOG_smartcard();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_120_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)slotParameters
{
  return self->_slotParameters;
}

- (NSInteger)maxInputLength
{
  return [(TKSlotParameters *)self->_slotParameters maxInputLength];
}

- (NSInteger)maxOutputLength
{
  return [(TKSlotParameters *)self->_slotParameters maxOutputLength];
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)[(NSXPCConnection *)self->_connection _queue];
}

- (TKSmartCard)makeSmartCard
{
  if ([(TKSmartCardSlot *)self state] != TKSmartCardSlotStateValidCard
    && [(TKSmartCardSlot *)self state] != TKSmartCardSlotStateProbing)
  {
    goto LABEL_7;
  }
  if ([(TKSmartCardSlot *)self state] == TKSmartCardSlotStateProbing)
  {
    id v3 = [(TKSmartCardSlot *)self synchronous:1 remoteSlotWithErrorHandler:&__block_literal_global_124];
    objc_msgSend(v3, "waitForNextState:reply:", -[TKSmartCardSlot state](self, "state"), &__block_literal_global_128);
  }
  if ([(TKSmartCardSlot *)self state] == TKSmartCardSlotStateValidCard) {
    uint64_t v4 = [[TKSmartCard alloc] initWithSlot:self];
  }
  else {
LABEL_7:
  }
    uint64_t v4 = 0;

  return v4;
}

void __32__TKSmartCardSlot_makeSmartCard__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TK_LOG_smartcard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_119_cold_1();
  }
}

- (void)invalidate
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1BED55000, v0, v1, "%{public}@: invalidating slot and connection %{public}@", v2, v3, v4, v5, v6);
}

- (void)dealloc
{
  [(TKSmartCardSlot *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TKSmartCardSlot;
  [(TKSmartCardSlot *)&v3 dealloc];
}

- (TKSmartCardSlot)initWithEndpoint:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TKSmartCardSlot;
  v7 = [(TKSmartCardSlot *)&v21 init];
  id v8 = v7;
  if (v7)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 1;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__0;
    v15 = __Block_byref_object_dispose__0;
    id v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__TKSmartCardSlot_initWithEndpoint_error___block_invoke;
    v10[3] = &unk_1E63C8308;
    v10[4] = &v17;
    v10[5] = &v11;
    [(TKSmartCardSlot *)v7 connectToEndpoint:v6 synchronous:1 reply:v10];
    if (!*((unsigned char *)v18 + 24))
    {

      id v8 = 0;
      if (a4) {
        *a4 = (id) v12[5];
      }
    }
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }

  return v8;
}

void __42__TKSmartCardSlot_initWithEndpoint_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)control:(id)a3 data:(id)a4 expectedLength:(unsigned int)a5 reply:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__TKSmartCardSlot_control_data_expectedLength_reply___block_invoke;
  v15[3] = &unk_1E63C8298;
  id v16 = v10;
  id v11 = v10;
  id v12 = a4;
  id v13 = a3;
  v14 = [(TKSmartCardSlot *)self synchronous:0 remoteSlotWithErrorHandler:v15];
  [v14 sendControl:v13 data:v12 expectedLength:v6 reply:v11];
}

uint64_t __53__TKSmartCardSlot_control_data_expectedLength_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAttrib:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__TKSmartCardSlot_getAttrib_reply___block_invoke;
  v9[3] = &unk_1E63C8298;
  id v10 = v6;
  id v7 = v6;
  id v8 = [(TKSmartCardSlot *)self synchronous:0 remoteSlotWithErrorHandler:v9];
  [v8 getAttrib:v4 reply:v7];
}

uint64_t __35__TKSmartCardSlot_getAttrib_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAttrib:(unsigned int)a3 data:(id)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__TKSmartCardSlot_setAttrib_data_reply___block_invoke;
  v12[3] = &unk_1E63C8298;
  id v13 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = [(TKSmartCardSlot *)self synchronous:0 remoteSlotWithErrorHandler:v12];
  [v11 setAttrib:v6 data:v10 reply:v9];
}

uint64_t __40__TKSmartCardSlot_setAttrib_data_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)screen
{
  return 0;
}

- (id)userInteractionForConfirmation
{
  return 0;
}

- (id)userInteractionForStringEntry
{
  return 0;
}

- (TKSmartCardSlotState)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (TKSmartCardATR)ATR
{
  return (TKSmartCardATR *)objc_getProperty(self, a2, 48, 1);
}

- (void)setATR:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (TKSmartCardSlotProxy)proxy
{
  return self->_proxy;
}

- (int64_t)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(int64_t)a3
{
  self->_previousState = a3;
}

- (int64_t)shareState
{
  return self->_shareState;
}

- (void)setShareState:(int64_t)a3
{
  self->_shareState = a3;
}

- (int64_t)powerState
{
  return self->_powerState;
}

- (void)setPowerState:(int64_t)a3
{
  self->_powerState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_ATR, 0);
  objc_storeStrong((id *)&self->_slotParameters, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1BED55000, v0, v1, "%{public}@: connection invalidated", v2);
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_118_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1BED55000, v0, v1, "%{public}@: connection interrupted, invalidating", v2);
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_119_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1BED55000, v0, OS_LOG_TYPE_ERROR, "SmartCard slot connection failed (%{public}@)", v1, 0xCu);
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_120_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7(&dword_1BED55000, v0, v1, "%{public}@: slot connected with parameters: %{public}@", v2, v3, v4, v5, v6);
}

@end