@interface AppUpdatesDatabaseSession
- (AppUpdatesDatabaseSession)initWithConnection:(id)a3;
- (SQLiteConnection)connection;
@end

@implementation AppUpdatesDatabaseSession

- (AppUpdatesDatabaseSession)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AppUpdatesDatabaseSession;
  v6 = [(AppUpdatesDatabaseSession *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (SQLiteConnection)connection
{
  return (SQLiteConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end