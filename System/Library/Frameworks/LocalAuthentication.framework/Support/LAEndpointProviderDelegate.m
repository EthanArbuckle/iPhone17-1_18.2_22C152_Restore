@interface LAEndpointProviderDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (LAEndpointProviderDelegate)init;
- (void)start;
@end

@implementation LAEndpointProviderDelegate

- (LAEndpointProviderDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)LAEndpointProviderDelegate;
  v2 = [(LAEndpointProviderDelegate *)&v6 init];
  if (v2)
  {
    v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.CoreAuthentication.daemon.EndpointProvider"];
    clientListener = v2->_clientListener;
    v2->_clientListener = v3;

    [(NSXPCListener *)v2->_clientListener setDelegate:v2];
  }
  return v2;
}

- (void)start
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  BOOL v5 = +[LAEndpointProviderServer handleConnection:v4];
  if (v5) {
    [v4 resume];
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end