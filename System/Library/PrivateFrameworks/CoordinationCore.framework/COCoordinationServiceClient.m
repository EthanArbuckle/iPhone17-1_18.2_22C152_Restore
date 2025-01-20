@interface COCoordinationServiceClient
- (BOOL)isEqual:(id)a3;
- (COCoordinationServiceClient)initWithConnection:(id)a3;
- (NSString)clientBundleIdentifier;
- (NSXPCConnection)connection;
- (id)description;
- (unint64_t)hash;
- (void)_withLock:(id)a3;
@end

@implementation COCoordinationServiceClient

- (COCoordinationServiceClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COCoordinationServiceClient;
  v6 = [(COCoordinationServiceClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (COCoordinationServiceClient *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      connection = self->_connection;
      v6 = [(COCoordinationServiceClient *)v4 connection];
      BOOL v7 = connection == v6;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(COCoordinationServiceClient *)self connection];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(COCoordinationServiceClient *)self connection];
  BOOL v7 = [v3 stringWithFormat:@"<%@: %p, connection = %p>", v5, self, v6];

  return v7;
}

- (NSString)clientBundleIdentifier
{
  v2 = [(COCoordinationServiceClient *)self connection];
  unint64_t v3 = objc_msgSend(v2, "co_ClientBundleIdentifier");

  return (NSString *)v3;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end