@interface RPBroadcastHandler
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSDictionary)serviceInfo;
- (NSExtensionContext)extensionContext;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (RPBroadcastHandler)init;
- (void)_completeRequestWithReturnItems:(id)a3;
- (void)setConnection:(id)a3;
- (void)setExtensionContext:(id)a3;
- (void)setListener:(id)a3;
- (void)setListenerEndpoint:(id)a3;
- (void)setServiceInfo:(id)a3;
@end

@implementation RPBroadcastHandler

- (void)_completeRequestWithReturnItems:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_serviceInfo)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F08810]);
    id v6 = objc_alloc(MEMORY[0x263F086A0]);
    v7 = [NSString _rpLocalizationNotNeeded:@"RPBroadcastExtensionKeyExtensionServiceInfo"];
    v8 = (void *)[v6 initWithString:v7];
    [v5 setAttributedTitle:v8];

    id v9 = objc_alloc(MEMORY[0x263F088E0]);
    v10 = (void *)[v9 initWithItem:self->_serviceInfo typeIdentifier:*MEMORY[0x263F01A08]];
    v14[0] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [v5 setAttachments:v11];

    uint64_t v12 = [v4 arrayByAddingObject:v5];

    [(RPBroadcastHandler *)self setServiceInfo:0];
    id v4 = (id)v12;
  }
  v13 = [(RPBroadcastHandler *)self extensionContext];
  [v13 completeRequestReturningItems:v4 completionHandler:0];
}

- (RPBroadcastHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPBroadcastHandler;
  v2 = [(RPBroadcastHandler *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08D88] anonymousListener];
    [(RPBroadcastHandler *)v2 setListener:v3];

    [(NSXPCListener *)v2->_listener resume];
    [(NSXPCListener *)v2->_listener setDelegate:v2];
    id v4 = [(NSXPCListener *)v2->_listener endpoint];
    [(RPBroadcastHandler *)v2 setListenerEndpoint:v4];
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v11[8] = *MEMORY[0x263EF8340];
  [(RPBroadcastHandler *)self setConnection:a4];
  [(NSXPCConnection *)self->_connection setExportedObject:self];
  id v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D138FE0];
  objc_super v6 = (void *)MEMORY[0x263EFFA08];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:8];
  v8 = [v6 setWithArray:v7];
  [v5 setClasses:v8 forSelector:sel_processPayload_completion_ argumentIndex:0 ofReply:0];

  [(NSXPCConnection *)self->_connection setExportedInterface:v5];
  id v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D139048];
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v9];

  [(NSXPCConnection *)self->_connection resume];
  return 1;
}

- (NSDictionary)serviceInfo
{
  return self->_serviceInfo;
}

- (void)setServiceInfo:(id)a3
{
}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (void)setExtensionContext:(id)a3
{
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);

  objc_storeStrong((id *)&self->_serviceInfo, 0);
}

@end