@interface SLServiceListener
- (BOOL)_verifyAuthorizationForConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)managedObjectModelPath;
- (NSString)persistentStoreName;
- (NSString)serviceName;
- (NSXPCInterface)clientInterface;
- (SLServiceListener)initWithExportedSessionClass:(Class)a3 serviceProtocol:(id)a4;
- (void)beginAcceptingConnections;
- (void)restrictToClientsWithEntitlements:(id)a3;
- (void)setClientInterface:(id)a3;
- (void)setManagedObjectModelPath:(id)a3;
- (void)setPersistentStoreName:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation SLServiceListener

- (SLServiceListener)initWithExportedSessionClass:(Class)a3 serviceProtocol:(id)a4
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SLServiceListener;
  v9 = [(SLServiceListener *)&v13 init];
  if (v9)
  {
    _SLLog(v4, 7, @"Initializing listener for session class: %@");
    v9->_sessionClass = a3;
    objc_storeStrong((id *)&v9->_serviceProtocol, a4);
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F29290], "serviceListener", a3);
    listener = v9->_listener;
    v9->_listener = (NSXPCListener *)v10;

    [(NSXPCListener *)v9->_listener setDelegate:v9];
  }

  return v9;
}

- (void)restrictToClientsWithEntitlements:(id)a3
{
}

- (void)beginAcceptingConnections
{
  uint64_t v4 = [(SLServiceListener *)self serviceName];
  listener = self->_listener;
  long long v6 = *(_OWORD *)&self->_sessionClass;
  _SLLog(v2, 5, @"Service with type %@ session class %@ and protocol %@ is accepting connections at listener %@");

  objc_msgSend(MEMORY[0x1E4F29290], "enableTransactions", v4, v6, listener);
  v5 = self->_listener;

  [(NSXPCListener *)v5 resume];
}

- (BOOL)_verifyAuthorizationForConnection:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  allowedEntitlements = self->_allowedEntitlements;
  if (allowedEntitlements)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v7 = allowedEntitlements;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(v5, "sl_clientHasEntitlement:", *(void *)(*((void *)&v14 + 1) + 8 * i)))
          {
            _SLLog(v3, 7, @"Client has required entitlement %@");
            BOOL v12 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 0;
LABEL_12:
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(SLServiceListener *)self _verifyAuthorizationForConnection:v6];
  if (v7)
  {
    uint64_t v8 = self->_persistentStoreName;
    uint64_t v9 = self->_managedObjectModelPath;
    v23 = [(SLServiceListener *)self serviceName];
    _SLLog(v4, 7, @"Service %@ wants persistent store named %@ matching MOM at %@");

    uint64_t v10 = 0;
    if (v8 && v9) {
      uint64_t v10 = -[SLDatabase initWithStoreName:modelPath:]([SLDatabase alloc], "initWithStoreName:modelPath:", v8, v9, v23, v8, v9);
    }
    v28 = v9;
    Class sessionClass = self->_sessionClass;
    v24 = [(SLServiceListener *)self serviceName];
    Class v27 = self->_sessionClass;
    _SLLog(v4, 7, @"Service %@ is expecting the remote session to be of class %@");

    if ((-[objc_class isSubclassOfClass:](sessionClass, "isSubclassOfClass:", objc_opt_class(), v24, v27) & 1) == 0)
    {
      BOOL v12 = (void *)MEMORY[0x1E4F1CA00];
      objc_super v13 = v10;
      uint64_t v14 = *MEMORY[0x1E4F1C3B8];
      long long v15 = NSStringFromClass(self->_sessionClass);
      uint64_t v16 = v14;
      uint64_t v10 = v13;
      [v12 raise:v16, @"%@ is not a subclass of SLRemoteSession", v15 format];
    }
    long long v17 = (void *)[[sessionClass alloc] initWithConnection:v6 database:v10];
    _SLLog(v4, 5, @"New remote session: %@");
    v18 = self->_serviceProtocol;
    v25 = NSStringFromProtocol(v18);
    _SLLog(v4, 7, @"Expecting remote session to conform to %@");

    if ((objc_msgSend(v17, "conformsToProtocol:", v18, v25) & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The remote session does not conform to the required protocol."];
    }
    uint64_t v19 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v18];
    [v6 setExportedInterface:v19];

    [v6 setExportedObject:v17];
    clientInterface = self->_clientInterface;
    if (clientInterface)
    {
      v21 = [(NSXPCInterface *)clientInterface protocol];
      v26 = NSStringFromProtocol(v21);
      _SLLog(v4, 7, @"Expecting client session to conform to %@");

      objc_msgSend(v6, "setRemoteObjectInterface:", self->_clientInterface, v26);
    }
    [v6 resume];
  }
  else
  {
    objc_msgSend(v6, "sl_localizedClientName");
    uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    _SLLog(v4, 3, @"Denying client %@ because it lacks the proper entitlement to connect");
  }

  return v7;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setServiceName:(id)a3
{
}

- (NSXPCInterface)clientInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientInterface:(id)a3
{
}

- (NSString)persistentStoreName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPersistentStoreName:(id)a3
{
}

- (NSString)managedObjectModelPath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setManagedObjectModelPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_allowedEntitlements, 0);
  objc_storeStrong((id *)&self->_managedObjectModelPath, 0);
  objc_storeStrong((id *)&self->_persistentStoreName, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);

  objc_storeStrong((id *)&self->_serviceProtocol, 0);
}

@end