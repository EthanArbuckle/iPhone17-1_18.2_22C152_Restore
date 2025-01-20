@interface AUPBClientConnection
- (AUPBInspecting)proxyInterface;
- (NSXPCConnection)xpcconnection;
- (void)setProxyInterface:(id)a3;
- (void)setXpcconnection:(id)a3;
@end

@implementation AUPBClientConnection

- (void)setProxyInterface:(id)a3
{
}

- (AUPBInspecting)proxyInterface
{
  return self->proxyInterface;
}

- (void)setXpcconnection:(id)a3
{
}

- (NSXPCConnection)xpcconnection
{
  return self->xpcconnection;
}

@end