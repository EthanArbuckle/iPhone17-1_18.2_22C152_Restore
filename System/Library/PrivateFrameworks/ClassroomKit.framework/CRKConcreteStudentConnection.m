@interface CRKConcreteStudentConnection
+ (id)connectionWithStudentDaemonProxy:(id)a3 invalidationHandler:(id)a4;
- (CRKConcreteStudentConnection)initWithStudentDaemonProxy:(id)a3 invalidationHandler:(id)a4;
- (CRKStudentDaemonProxy)studentDaemonProxy;
- (NSHashTable)notificationObservations;
- (id)invalidationHandler;
- (id)observeNotificationWithName:(id)a3 handler:(id)a4;
- (id)operationForRequest:(id)a3;
- (void)daemonProxy:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5;
- (void)daemonProxyDidDisconnect:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation CRKConcreteStudentConnection

- (void)dealloc
{
  [(CRKConcreteStudentConnection *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteStudentConnection;
  [(CRKConcreteStudentConnection *)&v3 dealloc];
}

- (CRKConcreteStudentConnection)initWithStudentDaemonProxy:(id)a3 invalidationHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRKConcreteStudentConnection;
  v9 = [(CRKConcreteStudentConnection *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_studentDaemonProxy, a3);
    uint64_t v11 = MEMORY[0x22A620AF0](v8);
    id invalidationHandler = v10->_invalidationHandler;
    v10->_id invalidationHandler = (id)v11;

    uint64_t v13 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    notificationObservations = v10->_notificationObservations;
    v10->_notificationObservations = (NSHashTable *)v13;
  }
  return v10;
}

+ (id)connectionWithStudentDaemonProxy:(id)a3 invalidationHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if (([v8 isConnected] & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"CRKConcreteStudentConnection.m" lineNumber:45 description:@"Must be handed a connected daemon proxy"];
  }
  v9 = (void *)[objc_alloc((Class)a1) initWithStudentDaemonProxy:v8 invalidationHandler:v7];

  [v8 addObserver:v9];

  return v9;
}

- (id)operationForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(CRKConcreteStudentConnection *)self studentDaemonProxy];
  v6 = [v5 operationForRequest:v4];

  return v6;
}

- (void)invalidate
{
  id v2 = [(CRKConcreteStudentConnection *)self studentDaemonProxy];
  [v2 disconnect];
}

- (id)observeNotificationWithName:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CRKConcreteStudentNotificationObservation alloc] initWithNotificationName:v7 notificationHandler:v6];

  v9 = [(CRKConcreteStudentConnection *)self notificationObservations];
  [v9 addObject:v8];

  return v8;
}

- (void)daemonProxyDidDisconnect:(id)a3
{
  id v4 = [(CRKConcreteStudentConnection *)self invalidationHandler];

  if (v4)
  {
    v5 = [(CRKConcreteStudentConnection *)self invalidationHandler];
    [(CRKConcreteStudentConnection *)self setInvalidationHandler:0];
    v5[2]();
  }
}

- (void)daemonProxy:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = [(CRKConcreteStudentConnection *)self notificationObservations];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) receiveNotificationWithName:v7 userInfo:v8];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (CRKStudentDaemonProxy)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSHashTable)notificationObservations
{
  return self->_notificationObservations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObservations, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
}

@end