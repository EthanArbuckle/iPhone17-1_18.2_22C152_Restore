@interface BDSClient
- (BDSClient)initWithConnection:(id)a3;
- (BOOL)monitorsServiceNotifications;
- (NSXPCConnection)connection;
- (id)description;
- (void)setConnection:(id)a3;
- (void)setMonitorsServiceNotifications:(BOOL)a3;
@end

@implementation BDSClient

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(BDSClient *)self connection];
  v5 = [(BDSClient *)self connection];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p connection:%p, pid:%d, monitorsServiceNotifications:%d>", v3, self, v4, [v5 processIdentifier], -[BDSClient monitorsServiceNotifications](self, "monitorsServiceNotifications"));

  return v6;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)monitorsServiceNotifications
{
  return self->_monitorsServiceNotifications;
}

- (BDSClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BDSClient;
  v6 = [(BDSClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)setMonitorsServiceNotifications:(BOOL)a3
{
  self->_monitorsServiceNotifications = a3;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end