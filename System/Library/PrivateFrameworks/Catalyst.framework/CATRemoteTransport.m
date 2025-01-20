@interface CATRemoteTransport
+ (id)new;
+ (void)createRemoteTransportPairWithTransport:(id *)a3 andTransport:(id *)a4;
- (CATRemoteTransport)init;
- (CATRemoteTransport)initWithRemoteConnection:(id)a3;
- (CATRemoteTransportDelegate)remoteTransportDelegate;
- (__SecTrust)peerTrust;
- (id)name;
- (id)operationToSendMessage:(id)a3;
- (void)connection:(id)a3 didFailToSendData:(id)a4 userInfo:(id)a5 error:(id)a6;
- (void)connection:(id)a3 didInterruptWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didSendData:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 encounteredTrustDecisionWhileTryingToSecure:(id)a4;
- (void)connectionDidClose:(id)a3;
- (void)connectionDidSecure:(id)a3;
- (void)connectionWillSecure:(id)a3;
- (void)invalidateConnection;
- (void)remoteTransportSendMessageOperation:(id)a3 sendData:(id)a4;
- (void)resumeConnection;
- (void)setName:(id)a3;
- (void)setRemoteTransportDelegate:(id)a3;
- (void)suspendConnection;
@end

@implementation CATRemoteTransport

+ (id)new
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"CATRemoteTransport.m", 56, @"%@ cannot call %@", a1, v5 object file lineNumber description];

  return 0;
}

- (CATRemoteTransport)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CATRemoteTransport.m", 63, @"%@ cannot call %@", v5, v6 object file lineNumber description];

  return 0;
}

+ (void)createRemoteTransportPairWithTransport:(id *)a3 andTransport:(id *)a4
{
  if (!a3)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"CATRemoteTransport.m", 71, @"Invalid parameter not satisfying: %@", @"transport1" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"CATRemoteTransport.m", 72, @"Invalid parameter not satisfying: %@", @"transport2" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  id v13 = 0;
  id v14 = 0;
  +[CATRemoteConnection createConnectionPairWithConnection:&v14 andConnection:&v13];
  id v8 = v14;
  id v9 = v13;
  *a3 = (id)[objc_alloc((Class)a1) initWithRemoteConnection:v8];
  id v10 = (id)[objc_alloc((Class)a1) initWithRemoteConnection:v9];

  *a4 = v10;
}

- (CATRemoteTransport)initWithRemoteConnection:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CATRemoteTransport.m", 85, @"Invalid parameter not satisfying: %@", @"remoteConnection" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)CATRemoteTransport;
  v7 = [(CATTransport *)&v13 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->mConnection, a3);
    [(CATRemoteConnection *)v8->mConnection setDelegate:v8];
    uint64_t v9 = objc_opt_new();
    mOperationByUUID = v8->mOperationByUUID;
    v8->mOperationByUUID = (NSMutableDictionary *)v9;
  }
  return v8;
}

- (__SecTrust)peerTrust
{
  return [(CATRemoteConnection *)self->mConnection peerTrust];
}

- (void)resumeConnection
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  [(CATRemoteConnection *)self->mConnection scheduleStreams];
  if (!self->mConnectionHasOpened)
  {
    [(CATRemoteConnection *)self->mConnection open];
    self->mConnectionHasOpened = 1;
  }
}

- (void)suspendConnection
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  mConnection = self->mConnection;

  [(CATRemoteConnection *)mConnection unscheduleStreams];
}

- (void)invalidateConnection
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  mConnection = self->mConnection;

  [(CATRemoteConnection *)mConnection close];
}

- (id)operationToSendMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  [v5 setTransport:self];
  [v5 setMessage:v4];

  return v5;
}

- (id)name
{
  return [(CATRemoteConnection *)self->mConnection name];
}

- (void)setName:(id)a3
{
}

- (void)connectionWillSecure:(id)a3
{
  id v4 = [(CATRemoteTransport *)self remoteTransportDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATRemoteTransport *)self remoteTransportDelegate];
    [v6 transportWillSecure:self];
  }
}

- (void)connection:(id)a3 encounteredTrustDecisionWhileTryingToSecure:(id)a4
{
  id v8 = a4;
  char v5 = [(CATRemoteTransport *)self remoteTransportDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(CATRemoteTransport *)self remoteTransportDelegate];
    [v7 transport:self encounteredTrustDecisionWhileTryingToSecure:v8];
  }
}

- (void)connectionDidSecure:(id)a3
{
  id v4 = [(CATRemoteTransport *)self remoteTransportDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CATRemoteTransport *)self remoteTransportDelegate];
    [v6 transportDidSecure:self];
  }
}

- (void)connection:(id)a3 didSendData:(id)a4 userInfo:(id)a5
{
  id v6 = a5;
  v7 = CATGetCatalystQueue();
  CATAssertIsQueue(v7);

  mOperationByUUID = self->mOperationByUUID;
  id v10 = v6;
  uint64_t v9 = [(NSMutableDictionary *)mOperationByUUID objectForKey:v10];
  [(NSMutableDictionary *)self->mOperationByUUID removeObjectForKey:v10];

  [v9 didSendData];
}

- (void)connection:(id)a3 didFailToSendData:(id)a4 userInfo:(id)a5 error:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = CATGetCatalystQueue();
  CATAssertIsQueue(v10);

  mOperationByUUID = self->mOperationByUUID;
  id v13 = v8;
  v12 = [(NSMutableDictionary *)mOperationByUUID objectForKey:v13];
  [(NSMutableDictionary *)self->mOperationByUUID removeObjectForKey:v13];

  [v12 didFailWithError:v9];
}

- (void)connection:(id)a3 didInterruptWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = [(NSMutableDictionary *)self->mOperationByUUID objectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) didFailWithError:v5];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [(NSMutableDictionary *)self->mOperationByUUID removeAllObjects];
  [(CATTransport *)self didInterruptWithError:v5];
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = CATGetCatalystQueue();
  CATAssertIsQueue(v8);

  v14[0] = 0;
  uint64_t v9 = objc_msgSend(MEMORY[0x263F08928], "cat_unarchiveObjectOfClass:withData:error:", objc_opt_class(), v7, v14);
  id v10 = v14[0];
  uint64_t v11 = v10;
  if (v9)
  {
    [(CATTransport *)self didReceiveMessage:v9];
  }
  else
  {
    uint64_t v15 = *MEMORY[0x263F08608];
    v16[0] = v10;
    long long v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v13 = CATErrorWithCodeAndUserInfo(301, v12);

    uint64_t v11 = (void *)v13;
    [(CATTransport *)self didInterruptWithError:v13];
  }
}

- (void)connectionDidClose:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  id v5 = CATErrorWithCodeAndUserInfo(200, 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMutableDictionary *)self->mOperationByUUID objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) didFailWithError:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(NSMutableDictionary *)self->mOperationByUUID removeAllObjects];
  [(CATTransport *)self didInvalidate];
}

- (void)remoteTransportSendMessageOperation:(id)a3 sendData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = CATGetCatalystQueue();
  CATAssertIsQueue(v8);

  id v9 = [MEMORY[0x263F08C38] UUID];
  [(NSMutableDictionary *)self->mOperationByUUID setObject:v7 forKey:v9];

  [(CATRemoteConnection *)self->mConnection sendData:v6 userInfo:v9];
}

- (CATRemoteTransportDelegate)remoteTransportDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteTransportDelegate);

  return (CATRemoteTransportDelegate *)WeakRetained;
}

- (void)setRemoteTransportDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteTransportDelegate);
  objc_storeStrong((id *)&self->mOperationByUUID, 0);

  objc_storeStrong((id *)&self->mConnection, 0);
}

@end