@interface PMCoreSmartPowerNapClient
- (BOOL)isTestClient;
- (NSXPCConnection)connection;
- (PMCoreSmartPowerNapClient)initWithConnection:(id)a3;
- (void)setIsTestClient:(BOOL)a3;
@end

@implementation PMCoreSmartPowerNapClient

- (PMCoreSmartPowerNapClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMCoreSmartPowerNapClient;
  v6 = [(PMCoreSmartPowerNapClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BOOL)isTestClient
{
  return self->_isTestClient;
}

- (void)setIsTestClient:(BOOL)a3
{
  self->_isTestClient = a3;
}

- (void).cxx_destruct
{
}

@end