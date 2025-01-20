@interface ZhuGeLockerService
- (NSXPCConnection)xpcConnection;
- (void)setXpcConnection:(id)a3;
@end

@implementation ZhuGeLockerService

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end