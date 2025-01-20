@interface FPDNotReachableServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)start;
@end

@implementation FPDNotReachableServer

- (void)start
{
  v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.FileProvider"];
  listener = self->_listener;
  self->_listener = v3;

  [(NSXPCListener *)self->_listener setDelegate:self];
  v5 = self->_listener;

  [(NSXPCListener *)v5 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
}

@end