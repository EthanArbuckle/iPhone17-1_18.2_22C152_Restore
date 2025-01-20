@interface AAFService
- (AAFService)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (NSArray)preConnectEntitlements;
- (NSString)serviceName;
- (NSXPCListener)serviceListener;
- (Protocol)exportedProtocol;
- (id)exportedObject;
- (void)_configureListener;
- (void)setServiceListener:(id)a3;
- (void)startup;
@end

@implementation AAFService

- (AAFService)init
{
  v3.receiver = self;
  v3.super_class = (Class)AAFService;
  return [(AAFService *)&v3 init];
}

- (void)startup
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = _AAFLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(AAFService *)self serviceName];
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DD937000, v3, OS_LOG_TYPE_DEFAULT, "Service: starting up xpc service - %@", (uint8_t *)&v5, 0xCu);
  }
  [(AAFService *)self _configureListener];
}

- (void)_configureListener
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD937000, log, OS_LOG_TYPE_ERROR, "Fatal Error: nil service name is not allowed.", v1, 2u);
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v5 = [(AAFService *)self preConnectEntitlements];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    v9 = (void *)MEMORY[0x1E4F1CC38];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v12 = [v4 valueForEntitlement:v11];
        if (!v12 || ([v9 isEqual:v12] & 1) == 0)
        {
          v19 = _AAFLogSystem();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[AAFService shouldAcceptNewConnection:](v11, v19);
          }

          goto LABEL_16;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v13 = [(AAFService *)self exportedProtocol];

  if (!v13)
  {
    int v5 = _AAFLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[AAFService shouldAcceptNewConnection:](v5);
    }
    goto LABEL_16;
  }
  v14 = (void *)MEMORY[0x1E4F29280];
  v15 = [(AAFService *)self exportedProtocol];
  int v5 = [v14 interfaceWithProtocol:v15];

  [v4 setExportedInterface:v5];
  v16 = [(AAFService *)self exportedObject];

  if (!v16)
  {
    v21 = _AAFLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[AAFService shouldAcceptNewConnection:](v21);
    }

LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  v17 = [(AAFService *)self exportedObject];
  [v4 setExportedObject:v17];

  [(AAFService *)self configureExportedInterface:v5];
  [v4 resume];
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return [(AAFService *)self shouldAcceptNewConnection:a4];
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSArray)preConnectEntitlements
{
  return self->_preConnectEntitlements;
}

- (Protocol)exportedProtocol
{
  return self->_exportedProtocol;
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (NSXPCListener)serviceListener
{
  return self->_serviceListener;
}

- (void)setServiceListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedProtocol, 0);
  objc_storeStrong((id *)&self->_preConnectEntitlements, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)shouldAcceptNewConnection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DD937000, log, OS_LOG_TYPE_FAULT, "\"Fatal Error: There is no protol to expose.\"", v1, 2u);
}

- (void)shouldAcceptNewConnection:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DD937000, log, OS_LOG_TYPE_FAULT, "\"Fatal Error: There is no exported object to handle incoming messages.\"", v1, 2u);
}

- (void)shouldAcceptNewConnection:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DD937000, a2, OS_LOG_TYPE_ERROR, "Client doesn't have entitlement - %@. Terminating connection!", (uint8_t *)&v2, 0xCu);
}

@end