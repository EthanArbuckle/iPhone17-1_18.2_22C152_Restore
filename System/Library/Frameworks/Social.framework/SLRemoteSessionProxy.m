@interface SLRemoteSessionProxy
- (NSObject)exportedObject;
- (NSXPCInterface)exportedInterface;
- (id)connectionResetBlock;
- (id)initForRemoteServiceName:(id)a3 remoteInterface:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_remoteSessionConnectionWasInterrupted;
- (void)_setupConnection;
- (void)dealloc;
- (void)disconnect;
- (void)dropGuaraneteedRemoteCall:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)registerGuaranteedRemoteCall:(id)a3;
- (void)setConnectionResetBlock:(id)a3;
- (void)setExportedInterface:(id)a3;
- (void)setExportedObject:(id)a3;
@end

@implementation SLRemoteSessionProxy

- (id)initForRemoteServiceName:(id)a3 remoteInterface:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SLRemoteSessionProxy;
  v9 = [(SLRemoteSessionProxy *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceName, a3);
    objc_storeStrong((id *)&v10->_remoteInterface, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    guaranteedRemoteCalls = v10->_guaranteedRemoteCalls;
    v10->_guaranteedRemoteCalls = v11;

    v13 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    guaranteedRemoteCallsLock = v10->_guaranteedRemoteCallsLock;
    v10->_guaranteedRemoteCallsLock = v13;
  }
  return v10;
}

- (void)dealloc
{
  [(SLRemoteSessionProxy *)self disconnect];
  [(NSLock *)self->_guaranteedRemoteCallsLock lock];
  guaranteedRemoteCalls = self->_guaranteedRemoteCalls;
  self->_guaranteedRemoteCalls = 0;

  [(NSLock *)self->_guaranteedRemoteCallsLock unlock];
  v4.receiver = self;
  v4.super_class = (Class)SLRemoteSessionProxy;
  [(SLRemoteSessionProxy *)&v4 dealloc];
}

- (void)_setupConnection
{
  [(SLRemoteSessionProxy *)self disconnect];
  serviceName = self->_serviceName;
  _SLLog(v2, 7, @"Setting up connection to remote session at %@");
  objc_super v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E4F29268]), "initWithServiceName:", self->_serviceName, serviceName);
  connection = self->_connection;
  self->_connection = v4;

  v6 = [(NSXPCInterface *)self->_remoteInterface protocol];
  v21 = NSStringFromProtocol(v6);
  _SLLog(v2, 7, @"Proxy is expecting remote interface %@");

  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", self->_remoteInterface, v21);
  uint64_t v7 = [(SLRemoteSessionProxy *)self exportedObject];
  if (v7)
  {
    id v8 = (void *)v7;
    v9 = [(SLRemoteSessionProxy *)self exportedInterface];

    if (v9)
    {
      v10 = [(SLRemoteSessionProxy *)self exportedInterface];
      v11 = [v10 protocol];
      v22 = NSStringFromProtocol(v11);
      _SLLog(v2, 7, @"Exporting client session with advertised interface %@");

      v12 = [(SLRemoteSessionProxy *)self exportedObject];
      v13 = [(SLRemoteSessionProxy *)self exportedInterface];
      v14 = [v13 protocol];
      char v15 = [v12 conformsToProtocol:v14];

      if ((v15 & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The provided client does not conform to the client protocol specified by the service."];
      }
      objc_super v16 = [(SLRemoteSessionProxy *)self exportedObject];
      [(NSXPCConnection *)self->_connection setExportedObject:v16];

      v17 = [(SLRemoteSessionProxy *)self exportedInterface];
      [(NSXPCConnection *)self->_connection setExportedInterface:v17];
    }
  }
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __40__SLRemoteSessionProxy__setupConnection__block_invoke;
  v25[3] = &unk_1E6467720;
  objc_copyWeak(&v26, &location);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __40__SLRemoteSessionProxy__setupConnection__block_invoke_2;
  v23[3] = &unk_1E6467720;
  objc_copyWeak(&v24, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v23];
  v18 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_8];
  id remoteProxy = self->_remoteProxy;
  self->_id remoteProxy = v18;

  [(NSXPCConnection *)self->_connection resume];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __40__SLRemoteSessionProxy__setupConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _remoteSessionConnectionWasInterrupted];
}

uint64_t __40__SLRemoteSessionProxy__setupConnection__block_invoke_2(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 32))) {
    _SLLog(v1, 3, @"The connection to %@ was invalidated.");
  }

  return MEMORY[0x1F41817F8]();
}

void __40__SLRemoteSessionProxy__setupConnection__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 localizedDescription];
  _SLLog(v2, 3, @"Remote proxy hit an error: %@");
}

- (void)disconnect
{
  if (self->_connection)
  {
    _SLLog(v2, 7, @"Client is invalidating its remote connection.");
    connection = self->_connection;
    [(NSXPCConnection *)connection invalidate];
  }
}

- (void)_remoteSessionConnectionWasInterrupted
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  _SLLog(v2, 3, @"Connection to remote session was interrupted! Reconnecting...");
  id v4 = self->_remoteProxy;
  v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_30];
  v6 = [(SLRemoteSessionProxy *)self connectionResetBlock];

  if (v6)
  {
    _SLLog(v2, 7, @"Executing connection reset block.");
    uint64_t v7 = [(SLRemoteSessionProxy *)self connectionResetBlock];
    v7[2]();
  }
  [(NSLock *)self->_guaranteedRemoteCallsLock lock];
  id v8 = (void *)[(NSMutableArray *)self->_guaranteedRemoteCalls copy];
  [(NSLock *)self->_guaranteedRemoteCallsLock unlock];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        _SLLog(v2, 7, @"Processing guranteed remote call.");
        objc_msgSend(v14, "proxy", (void)v17);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v4)
        {
          [v14 setProxy:v5];
          objc_super v16 = [v14 block];
          v16[2]();
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

void __62__SLRemoteSessionProxy__remoteSessionConnectionWasInterrupted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 localizedDescription];
  _SLLog(v2, 3, @"Remote proxy hit an error: %@");
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (!self->_connection) {
    [(SLRemoteSessionProxy *)self _setupConnection];
  }
  id remoteProxy = self->_remoteProxy;
  if (!remoteProxy)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"SLRemoteSessionProxy: Cannot obtain method signature without a remote proxy"];
    id remoteProxy = self->_remoteProxy;
  }

  return (id)[remoteProxy methodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
  id v7 = a3;
  if (!self->_connection) {
    [(SLRemoteSessionProxy *)self _setupConnection];
  }
  if (!self->_remoteProxy) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"SLRemoteSessionProxy: Cannot forward invocation to nil proxy"];
  }
  v5 = NSStringFromSelector((SEL)[v7 selector]);
  id remoteProxy = self->_remoteProxy;
  _SLLog(v3, 7, @"SLRemoteSessionProxy is forwarding invocation of %@ to %@");

  objc_msgSend(v7, "invokeWithTarget:", self->_remoteProxy, v5, remoteProxy);
}

- (void)registerGuaranteedRemoteCall:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"Registering guaranteed remote call %@");
  objc_msgSend(v5, "setProxy:", self->_remoteProxy, v5);
  [(NSLock *)self->_guaranteedRemoteCallsLock lock];
  [(NSMutableArray *)self->_guaranteedRemoteCalls addObject:v5];

  guaranteedRemoteCallsLock = self->_guaranteedRemoteCallsLock;

  [(NSLock *)guaranteedRemoteCallsLock unlock];
}

- (void)dropGuaraneteedRemoteCall:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"No longer tracking guaranteed remote call %@");
  [(NSLock *)self->_guaranteedRemoteCallsLock lock];
  [(NSMutableArray *)self->_guaranteedRemoteCalls removeObject:v5];

  guaranteedRemoteCallsLock = self->_guaranteedRemoteCallsLock;

  [(NSLock *)guaranteedRemoteCallsLock unlock];
}

- (NSObject)exportedObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);

  return WeakRetained;
}

- (void)setExportedObject:(id)a3
{
}

- (NSXPCInterface)exportedInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExportedInterface:(id)a3
{
}

- (id)connectionResetBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setConnectionResetBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionResetBlock, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_destroyWeak((id *)&self->_exportedObject);
  objc_storeStrong((id *)&self->_guaranteedRemoteCallsLock, 0);
  objc_storeStrong((id *)&self->_guaranteedRemoteCalls, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_remoteProxy, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end