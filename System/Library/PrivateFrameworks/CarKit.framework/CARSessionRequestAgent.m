@interface CARSessionRequestAgent
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)wantsCarPlayControlAdvertisingForUSB;
- (BOOL)wantsCarPlayControlAdvertisingForWiFiUUID:(id)a3;
- (CARSessionRequestAgent)initWithRequestHandler:(id)a3;
- (CARSessionRequestHandlerProxy)handlerProxy;
- (CARSessionRequestHandling)requestHandler;
- (NSXPCListener)listener;
- (void)dealloc;
- (void)setHandlerProxy:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation CARSessionRequestAgent

- (CARSessionRequestAgent)initWithRequestHandler:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CARSessionRequestAgent;
  v5 = [(CARSessionRequestAgent *)&v11 init];
  if (v5)
  {
    v6 = objc_alloc_init(CARSessionRequestHandlerProxy);
    handlerProxy = v5->_handlerProxy;
    v5->_handlerProxy = v6;

    v8 = [(CARSessionRequestAgent *)v5 handlerProxy];
    [v8 setRequestHandler:v4];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.carkit.sessionRequestHandler"];
    [v9 setDelegate:v5];
    [v9 resume];
    [(CARSessionRequestAgent *)v5 setListener:v9];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(CARSessionRequestAgent *)self listener];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CARSessionRequestAgent;
  [(CARSessionRequestAgent *)&v4 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.private.carkit.sessionRequest"];
  char v7 = [v6 BOOLValue];

  v8 = CarGeneralLogging();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12[0] = 67109120;
      v12[1] = [v5 processIdentifier];
      _os_log_impl(&dword_1ABB00000, v9, OS_LOG_TYPE_INFO, "Received CARSessionRequest connection from pid %d", (uint8_t *)v12, 8u);
    }

    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F031BD40];
    [v9 setClass:objc_opt_class() forSelector:sel_service_startSessionWithHost_requestIdentifier_reply_ argumentIndex:0 ofReply:0];
    [v9 setClass:objc_opt_class() forSelector:sel_service_startSessionWithHost_requestIdentifier_reply_ argumentIndex:1 ofReply:0];
    [v5 setExportedInterface:v9];
    v10 = [(CARSessionRequestAgent *)self handlerProxy];
    [v5 setExportedObject:v10];

    [v5 resume];
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[CARSessionRequestAgent listener:shouldAcceptNewConnection:](v5, v9);
  }

  return v7;
}

- (CARSessionRequestHandling)requestHandler
{
  v2 = [(CARSessionRequestAgent *)self handlerProxy];
  v3 = [v2 requestHandler];

  return (CARSessionRequestHandling *)v3;
}

- (BOOL)wantsCarPlayControlAdvertisingForUSB
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke;
  v4[3] = &unk_1E5E3A9D0;
  v4[4] = &v5;
  CRServiceConnectionSynchronousPerform(v4, &__block_literal_global_11);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_2;
  v3[3] = &unk_1E5E3A9A8;
  v3[4] = *(void *)(a1 + 32);
  return [a2 wantsCarPlayControlAdvertisingForUSBWithReply:v3];
}

void __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_2_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
}

void __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_45(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_45_cold_1();
  }
}

- (BOOL)wantsCarPlayControlAdvertisingForWiFiUUID:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke;
  v7[3] = &unk_1E5E3AAC0;
  id v4 = v3;
  id v8 = v4;
  v9 = &v10;
  CRServiceConnectionSynchronousPerform(v7, &__block_literal_global_49_0);
  char v5 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_2;
  v4[3] = &unk_1E5E3A9A8;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [a2 wantsCarPlayControlAdvertisingForWiFiUUID:v2 reply:v4];
}

void __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_2_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
}

void __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_47(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_47_cold_1();
  }
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (CARSessionRequestHandlerProxy)handlerProxy
{
  return self->_handlerProxy;
}

- (void)setHandlerProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerProxy, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = [a1 processIdentifier];
  __int16 v4 = 2112;
  id v5 = @"com.apple.private.carkit.sessionRequest";
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "Process %i does not have the %@ entitlement", (uint8_t *)v3, 0x12u);
}

void __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Error from wantsCarPlayControlAdvertisingForUSB: %@", v2, v3, v4, v5, v6);
}

void __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_45_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Error calling wantsCarPlayControlAdvertisingForUSB: %@", v2, v3, v4, v5, v6);
}

void __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Error from wantsCarPlayControlAdvertisingForWiFiUUID: %@", v2, v3, v4, v5, v6);
}

void __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_47_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Error calling wantsCarPlayControlAdvertisingForWiFiUUID: %@", v2, v3, v4, v5, v6);
}

@end