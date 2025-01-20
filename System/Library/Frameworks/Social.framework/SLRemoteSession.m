@interface SLRemoteSession
- (BOOL)clientHasEntitlement:(id)a3;
- (NSXPCConnection)connection;
- (SLDatabase)database;
- (SLRemoteSession)initWithConnection:(id)a3 database:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDatabase:(id)a3;
@end

@implementation SLRemoteSession

- (SLRemoteSession)initWithConnection:(id)a3 database:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  _SLLog(v4, 7, @"SLRemoteSession initializer called with connection %@ and database");
  v12.receiver = self;
  v12.super_class = (Class)SLRemoteSession;
  v9 = [(SLRemoteSession *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(SLRemoteSession *)v9 setConnection:v7];
    [(SLRemoteSession *)v10 setDatabase:v8];
  }

  return v10;
}

- (BOOL)clientHasEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [(SLRemoteSession *)self connection];
  char v6 = objc_msgSend(v5, "sl_clientHasEntitlement:", v4);

  return v6;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (SLDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end