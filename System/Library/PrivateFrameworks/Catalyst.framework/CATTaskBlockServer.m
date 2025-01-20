@interface CATTaskBlockServer
- (CATTaskBlockServer)init;
- (NSArray)clientSessions;
- (id)createClientTransport;
- (id)didInvalidate;
- (id)server:(id)a3 clientSession:(id)a4 operationForRequest:(id)a5 error:(id *)a6;
- (id)sessionDidConnect;
- (id)sessionDidDisconnect;
- (id)sessionDidInterruptWithError;
- (id)sessionDidInvalidate;
- (id)sessionDidReceiveNotification;
- (void)cancelLongRunningOperationsForRequestClass:(Class)a3;
- (void)dealloc;
- (void)disconnectAllClientSessions;
- (void)invalidate;
- (void)postNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)registerBlock:(id)a3 forRequestClass:(Class)a4;
- (void)registerLongRunningOperationForRequestClass:(Class)a3;
- (void)server:(id)a3 clientSession:(id)a4 didInterruptWithError:(id)a5;
- (void)server:(id)a3 clientSession:(id)a4 didReceiveNotificationWithName:(id)a5 userInfo:(id)a6;
- (void)server:(id)a3 clientSessionDidConnect:(id)a4;
- (void)server:(id)a3 clientSessionDidDisconnect:(id)a4;
- (void)server:(id)a3 clientSessionDidInvalidate:(id)a4;
- (void)serverDidInvalidate:(id)a3;
- (void)setDidInvalidate:(id)a3;
- (void)setSessionDidConnect:(id)a3;
- (void)setSessionDidDisconnect:(id)a3;
- (void)setSessionDidInterruptWithError:(id)a3;
- (void)setSessionDidInvalidate:(id)a3;
- (void)setSessionDidReceiveNotification:(id)a3;
@end

@implementation CATTaskBlockServer

- (CATTaskBlockServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)CATTaskBlockServer;
  v2 = [(CATTaskBlockServer *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mServer = v2->mServer;
    v2->mServer = (CATTaskServer *)v3;

    [(CATTaskServer *)v2->mServer setDelegate:v2];
    uint64_t v5 = objc_opt_new();
    mOperationBlocksByRequestClassName = v2->mOperationBlocksByRequestClassName;
    v2->mOperationBlocksByRequestClassName = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    mLongRunningOperationRequestClassNames = v2->mLongRunningOperationRequestClassNames;
    v2->mLongRunningOperationRequestClassNames = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    mLongRunningOperationsByUUID = v2->mLongRunningOperationsByUUID;
    v2->mLongRunningOperationsByUUID = (NSMapTable *)v9;
  }
  return v2;
}

- (void)dealloc
{
  [(CATTaskServer *)self->mServer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CATTaskBlockServer;
  [(CATTaskBlockServer *)&v3 dealloc];
}

- (id)createClientTransport
{
  id v6 = 0;
  id v7 = 0;
  +[CATRemoteTransport createRemoteTransportPairWithTransport:&v7 andTransport:&v6];
  id v3 = v7;
  id v4 = v6;
  [(CATTaskServer *)self->mServer connectWithClientTransport:v4];

  return v3;
}

- (void)registerBlock:(id)a3 forRequestClass:(Class)a4
{
  id v8 = (id)MEMORY[0x216693330](a3, a2);
  mOperationBlocksByRequestClassName = self->mOperationBlocksByRequestClassName;
  id v7 = NSStringFromClass(a4);
  [(NSMutableDictionary *)mOperationBlocksByRequestClassName setObject:v8 forKeyedSubscript:v7];
}

- (void)registerLongRunningOperationForRequestClass:(Class)a3
{
  mLongRunningOperationRequestClassNames = self->mLongRunningOperationRequestClassNames;
  NSStringFromClass(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableSet *)mLongRunningOperationRequestClassNames addObject:v4];
}

- (void)cancelLongRunningOperationsForRequestClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMapTable *)self->mLongRunningOperationsByUUID objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [v9 request];
        int v11 = [v10 isMemberOfClass:a3];

        if (v11) {
          [v9 cancel];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4
{
}

- (void)disconnectAllClientSessions
{
}

- (void)invalidate
{
}

- (id)server:(id)a3 clientSession:(id)a4 operationForRequest:(id)a5 error:(id *)a6
{
  id v7 = a5;
  id v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  if ([(NSMutableSet *)self->mLongRunningOperationRequestClassNames containsObject:v9])
  {
    v10 = [(CATTaskOperation *)[_CATLongRunningTaskOperation alloc] initWithRequest:v7];
    mLongRunningOperationsByUUID = self->mLongRunningOperationsByUUID;
    long long v12 = [(CATOperation *)v10 UUID];
    [(NSMapTable *)mLongRunningOperationsByUUID setObject:v10 forKey:v12];
  }
  else
  {
    long long v12 = [(NSMutableDictionary *)self->mOperationBlocksByRequestClassName objectForKeyedSubscript:v9];
    if (v12) {
      v10 = [[_CATBlockTaskOperation alloc] initWithBlock:v12 request:v7];
    }
    else {
      v10 = 0;
    }
  }

  return v10;
}

- (void)server:(id)a3 clientSession:(id)a4 didInterruptWithError:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = [(CATTaskBlockServer *)self sessionDidInterruptWithError];

  if (v8)
  {
    uint64_t v9 = [(CATTaskBlockServer *)self sessionDidInterruptWithError];
    ((void (**)(void, CATTaskBlockServer *, id, id))v9)[2](v9, self, v10, v7);
  }
  else
  {
    [v10 invalidate];
  }
}

- (void)server:(id)a3 clientSession:(id)a4 didReceiveNotificationWithName:(id)a5 userInfo:(id)a6
{
  id v13 = a4;
  id v9 = a5;
  id v10 = a6;
  int v11 = [(CATTaskBlockServer *)self sessionDidReceiveNotification];

  if (v11)
  {
    long long v12 = [(CATTaskBlockServer *)self sessionDidReceiveNotification];
    ((void (**)(void, CATTaskBlockServer *, id, id, id))v12)[2](v12, self, v13, v9, v10);
  }
}

- (void)server:(id)a3 clientSessionDidConnect:(id)a4
{
  id v7 = a4;
  uint64_t v5 = [(CATTaskBlockServer *)self sessionDidConnect];

  if (v5)
  {
    uint64_t v6 = [(CATTaskBlockServer *)self sessionDidConnect];
    ((void (**)(void, CATTaskBlockServer *, id))v6)[2](v6, self, v7);
  }
}

- (void)server:(id)a3 clientSessionDidDisconnect:(id)a4
{
  id v7 = a4;
  uint64_t v5 = [(CATTaskBlockServer *)self sessionDidDisconnect];

  if (v5)
  {
    uint64_t v6 = [(CATTaskBlockServer *)self sessionDidDisconnect];
    ((void (**)(void, CATTaskBlockServer *, id))v6)[2](v6, self, v7);
  }
  else
  {
    [v7 invalidate];
  }
}

- (void)server:(id)a3 clientSessionDidInvalidate:(id)a4
{
  id v7 = a4;
  uint64_t v5 = [(CATTaskBlockServer *)self sessionDidInvalidate];

  if (v5)
  {
    uint64_t v6 = [(CATTaskBlockServer *)self sessionDidInvalidate];
    ((void (**)(void, CATTaskBlockServer *, id))v6)[2](v6, self, v7);
  }
}

- (void)serverDidInvalidate:(id)a3
{
  id v4 = [(CATTaskBlockServer *)self didInvalidate];

  if (v4)
  {
    uint64_t v5 = [(CATTaskBlockServer *)self didInvalidate];
    v5[2](v5, self);
  }
}

- (NSArray)clientSessions
{
  return self->_clientSessions;
}

- (id)sessionDidConnect
{
  return self->_sessionDidConnect;
}

- (void)setSessionDidConnect:(id)a3
{
}

- (id)sessionDidReceiveNotification
{
  return self->_sessionDidReceiveNotification;
}

- (void)setSessionDidReceiveNotification:(id)a3
{
}

- (id)sessionDidInterruptWithError
{
  return self->_sessionDidInterruptWithError;
}

- (void)setSessionDidInterruptWithError:(id)a3
{
}

- (id)sessionDidDisconnect
{
  return self->_sessionDidDisconnect;
}

- (void)setSessionDidDisconnect:(id)a3
{
}

- (id)sessionDidInvalidate
{
  return self->_sessionDidInvalidate;
}

- (void)setSessionDidInvalidate:(id)a3
{
}

- (id)didInvalidate
{
  return self->_didInvalidate;
}

- (void)setDidInvalidate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didInvalidate, 0);
  objc_storeStrong(&self->_sessionDidInvalidate, 0);
  objc_storeStrong(&self->_sessionDidDisconnect, 0);
  objc_storeStrong(&self->_sessionDidInterruptWithError, 0);
  objc_storeStrong(&self->_sessionDidReceiveNotification, 0);
  objc_storeStrong(&self->_sessionDidConnect, 0);
  objc_storeStrong((id *)&self->_clientSessions, 0);
  objc_storeStrong((id *)&self->mLongRunningOperationsByUUID, 0);
  objc_storeStrong((id *)&self->mLongRunningOperationRequestClassNames, 0);
  objc_storeStrong((id *)&self->mOperationBlocksByRequestClassName, 0);

  objc_storeStrong((id *)&self->mServer, 0);
}

@end