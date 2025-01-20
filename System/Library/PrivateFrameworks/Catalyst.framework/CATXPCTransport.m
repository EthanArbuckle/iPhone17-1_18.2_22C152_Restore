@interface CATXPCTransport
+ (id)new;
- (BOOL)BOOLValueForEntitlement:(id)a3;
- (CATXPCTransport)init;
- (CATXPCTransport)initWithXPCConnection:(id)a3;
- (id)operationToSendMessage:(id)a3;
- (id)valueForEntitlement:(id)a3;
- (int)auditSessionIdentifier;
- (int)processIdentifier;
- (unsigned)effectiveGroupIdentifier;
- (unsigned)effectiveUserIdentifier;
- (void)dealloc;
- (void)didInvalidate;
- (void)invalidateConnection;
- (void)processMessage:(id)a3 completion:(id)a4;
- (void)resumeConnection;
- (void)setUpConnection;
- (void)suspendConnection;
- (void)tearDownConnection;
- (void)transportSendMessageOperation:(id)a3 processMessage:(id)a4;
@end

@implementation CATXPCTransport

- (int)auditSessionIdentifier
{
  return [(NSXPCConnection *)self->mConnection auditSessionIdentifier];
}

- (int)processIdentifier
{
  return [(NSXPCConnection *)self->mConnection processIdentifier];
}

- (unsigned)effectiveUserIdentifier
{
  return [(NSXPCConnection *)self->mConnection effectiveUserIdentifier];
}

- (unsigned)effectiveGroupIdentifier
{
  return [(NSXPCConnection *)self->mConnection effectiveGroupIdentifier];
}

+ (id)new
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"CATXPCTransport.m", 109, @"%@ cannot call %@", a1, v5 object file lineNumber description];

  return 0;
}

- (CATXPCTransport)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CATXPCTransport.m", 116, @"%@ cannot call %@", v5, v6 object file lineNumber description];

  return 0;
}

- (CATXPCTransport)initWithXPCConnection:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CATXPCTransport.m", 124, @"Invalid parameter not satisfying: %@", @"xpcConnection" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)CATXPCTransport;
  v7 = [(CATTransport *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->mConnection, a3);
  }

  return v8;
}

- (void)dealloc
{
  v4 = [(NSXPCConnection *)self->mConnection exportedObject];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F08690] currentHandler];
    id v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"CATXPCTransport.m", 151, @"%@ cannot call %@ when underlying connection has not been torn down.", self, v6 object file lineNumber description];
  }
  v7.receiver = self;
  v7.super_class = (Class)CATXPCTransport;
  [(CATTransport *)&v7 dealloc];
}

- (id)valueForEntitlement:(id)a3
{
  return (id)[(NSXPCConnection *)self->mConnection valueForEntitlement:a3];
}

- (BOOL)BOOLValueForEntitlement:(id)a3
{
  v3 = [(CATXPCTransport *)self valueForEntitlement:a3];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)resumeConnection
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  self->mConnectionHasResumed = 1;
  [(CATXPCTransport *)self setUpConnection];
  mConnection = self->mConnection;

  [(NSXPCConnection *)mConnection resume];
}

- (void)suspendConnection
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  [(NSXPCConnection *)self->mConnection suspend];
  [(CATXPCTransport *)self tearDownConnection];
  self->mConnectionHasResumed = 0;
}

- (void)invalidateConnection
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  self->mConnectionShouldInvalidate = 1;
  [(NSXPCConnection *)self->mConnection invalidate];
  if (!self->mConnectionHasResumed) {
    [(CATXPCTransport *)self resumeConnection];
  }
  if (self->mConnectionHasInvalidated)
  {
    [(CATXPCTransport *)self didInvalidate];
  }
}

- (id)operationToSendMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  [v5 setTransport:self];
  [v5 setMessage:v4];

  return v5;
}

- (void)didInvalidate
{
  [(CATXPCTransport *)self tearDownConnection];
  v3.receiver = self;
  v3.super_class = (Class)CATXPCTransport;
  [(CATTransport *)&v3 didInvalidate];
}

- (void)processMessage:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_super v7 = (void *)MEMORY[0x2166930C0]();
  v8 = CATGetCatalystQueue();
  CATAssertIsQueue(v8);

  v9 = objc_opt_new();
  [v9 setBlock:v6];
  objc_msgSend(v10, "setCat_assertion:", v9);
  [(CATTransport *)self didReceiveMessage:v10];
}

- (void)transportSendMessageOperation:(id)a3 processMessage:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  objc_super v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  v8 = [(NSXPCConnection *)self->mConnection remoteObjectProxy];
  v9 = v8;
  if (v8)
  {
    [v8 processMessage:v11 completion:&__block_literal_global_24];
    [v6 didProcessMessage];
  }
  else
  {
    uint64_t v10 = CATErrorWithCodeAndUserInfo(404, 0);
    [v6 didFailWithError:v10];

    id v6 = (id)v10;
  }
}

- (void)setUpConnection
{
  objc_super v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  mConnection = self->mConnection;
  uint64_t v5 = CATGetCatalystQueue();
  [(NSXPCConnection *)mConnection _setQueue:v5];

  id v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C4C0848];
  [(NSXPCConnection *)self->mConnection setRemoteObjectInterface:v6];

  [(NSXPCConnection *)self->mConnection setExportedObject:self];
  objc_super v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C4C0848];
  [(NSXPCConnection *)self->mConnection setExportedInterface:v7];

  objc_initWeak(&location, self);
  v8 = self->mConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __34__CATXPCTransport_setUpConnection__block_invoke;
  v12[3] = &unk_2641DBCB0;
  objc_copyWeak(&v13, &location);
  [(NSXPCConnection *)v8 setInterruptionHandler:v12];
  v9 = self->mConnection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__CATXPCTransport_setUpConnection__block_invoke_2;
  v10[3] = &unk_2641DBCB0;
  objc_copyWeak(&v11, &location);
  [(NSXPCConnection *)v9 setInvalidationHandler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __34__CATXPCTransport_setUpConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4097 userInfo:0];
  [WeakRetained didInterruptWithError:v1];
}

void __34__CATXPCTransport_setUpConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (WeakRetained[65])
    {
      [WeakRetained didInvalidate];
    }
    else
    {
      WeakRetained[66] = 1;
      v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4097 userInfo:0];
      [v3 didInterruptWithError:v2];
    }
    id WeakRetained = v3;
  }
}

- (void)tearDownConnection
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  [(NSXPCConnection *)self->mConnection setRemoteObjectInterface:0];
  [(NSXPCConnection *)self->mConnection setExportedObject:0];
  [(NSXPCConnection *)self->mConnection setExportedInterface:0];
  [(NSXPCConnection *)self->mConnection setInterruptionHandler:0];
  mConnection = self->mConnection;

  [(NSXPCConnection *)mConnection setInvalidationHandler:0];
}

- (void).cxx_destruct
{
}

@end