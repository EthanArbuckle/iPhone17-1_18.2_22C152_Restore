@interface GSSHelperPeer
- (NSString)bundleIdentifier;
- (OS_xpc_object)conn;
- (unsigned)session;
- (void)setBundleIdentifier:(id)a3;
- (void)setConn:(id)a3;
- (void)setSession:(unsigned int)a3;
@end

@implementation GSSHelperPeer

- (OS_xpc_object)conn
{
  return self->conn;
}

- (void)setConn:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (unsigned)session
{
  return self->session;
}

- (void)setSession:(unsigned int)a3
{
  self->session = a3;
}

- (void).cxx_destruct
{
}

@end