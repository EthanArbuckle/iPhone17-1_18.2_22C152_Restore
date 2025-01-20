@interface MRUIServiceServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MRUIServiceServer)init;
- (NSXPCListener)listener;
@end

@implementation MRUIServiceServer

- (MRUIServiceServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)MRUIServiceServer;
  v2 = [(MRUIServiceServer *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[NSXPCListener anonymousListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    v5 = [(NSXPCListener *)v2->_listener endpoint];
    MRSetUIServiceRelayEndpoint();
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 0;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
}

@end