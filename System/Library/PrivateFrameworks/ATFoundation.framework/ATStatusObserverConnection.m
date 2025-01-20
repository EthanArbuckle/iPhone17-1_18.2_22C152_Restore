@interface ATStatusObserverConnection
- (ATStatusObserverConnection)initWithConnection:(id)a3;
- (void)fetchAllStatusWithCompletion:(id)a3;
- (void)monitor:(id)a3 didUpdateWithStatus:(id)a4;
@end

@implementation ATStatusObserverConnection

- (void).cxx_destruct
{
}

- (void)fetchAllStatusWithCompletion:(id)a3
{
  v3 = (void (**)(id, id, void))a3;
  v4 = +[ATStatusMonitor sharedMonitor];
  id v5 = [v4 allStatus];

  v3[2](v3, v5, 0);
}

- (void)monitor:(id)a3 didUpdateWithStatus:(id)a4
{
  connection = self->_connection;
  id v5 = a4;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 updateWithStatus:v5];
}

- (ATStatusObserverConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATStatusObserverConnection;
  id v6 = [(ATStatusObserverConnection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

@end