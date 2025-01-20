@interface CRXFServiceConnection
- (BOOL)isActivated;
- (CRXFServiceConnection)initWithServiceName:(id)a3 protocol:(id)a4;
- (id)activate;
- (void)activate;
- (void)forceInvalidate;
- (void)invalidate;
@end

@implementation CRXFServiceConnection

- (CRXFServiceConnection)initWithServiceName:(id)a3 protocol:(id)a4
{
  id v7 = a4;
  if (self)
  {
    v8 = (NSString *)[a3 copy];
    serviceName = self->_serviceName;
    self->_serviceName = v8;

    objc_storeStrong((id *)&self->_protocol, a4);
    self->_activateCount = 0;
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = 0;

    v11 = (OS_os_log *)os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
    log = self->_log;
    self->_log = v11;
  }
  return self;
}

- (id)activate
{
  v2 = self;
  objc_sync_enter(v2);
  int activateCount = v2->_activateCount;
  v2->_int activateCount = activateCount + 1;
  BOOL v4 = os_log_type_enabled((os_log_t)v2->_log, OS_LOG_TYPE_DEBUG);
  if (activateCount)
  {
    if (v4) {
      -[CRXFServiceConnection activate]();
    }
  }
  else
  {
    if (v4) {
      -[CRXFServiceConnection activate]();
    }
    uint64_t v5 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:v2->_serviceName];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v5;

    id v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:v2->_protocol];
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v7];

    [(NSXPCConnection *)v2->_xpcConnection activate];
  }
  v8 = v2->_xpcConnection;
  objc_sync_exit(v2);

  return v8;
}

- (void)invalidate
{
  OUTLINED_FUNCTION_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_24C484000, v0, v1, "%s @%d: Invalidating connection to %{public}@", v2, v3, v4, v5, 2u);
}

- (void)forceInvalidate
{
  OUTLINED_FUNCTION_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_24C484000, v0, v1, "%s @%d: Invalidating connection to %{public}@", v2, v3, v4, v5, 2u);
}

- (BOOL)isActivated
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_activateCount > 0;
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)activate
{
  OUTLINED_FUNCTION_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_24C484000, v0, v1, "%s @%d: Reusing connection to %{public}@", v2, v3, v4, v5, 2u);
}

@end