@interface ACCTransportClientBridge
+ (id)sharedBridge;
- (ACCTransportClient)transportClient;
- (ACCTransportClientBridge)init;
- (id)connectionAuthStatusChangedHandler;
- (id)connectionPropertiesChangedHandler;
- (id)endpointPropertiesChangedHandler;
- (id)serverDisconnectedHandler;
- (void)setConnectionAuthStatusChangedHandler:(id)a3;
- (void)setConnectionPropertiesChangedHandler:(id)a3;
- (void)setEndpointPropertiesChangedHandler:(id)a3;
- (void)setServerDisconnectedHandler:(id)a3;
- (void)setTransportClient:(id)a3;
- (void)transportClient:(id)a3 authStatusDidChange:(BOOL)a4 forConnectionWithUUID:(id)a5;
- (void)transportClient:(id)a3 propertiesDidChange:(id)a4 forConnectionWithUUID:(id)a5 previousProperties:(id)a6;
- (void)transportClient:(id)a3 propertiesDidChange:(id)a4 forEndpointWithUUID:(id)a5 previousProperties:(id)a6 connectionUUID:(id)a7;
- (void)transportClientServerDisconnected:(id)a3;
@end

@implementation ACCTransportClientBridge

- (ACCTransportClientBridge)init
{
  v10.receiver = self;
  v10.super_class = (Class)ACCTransportClientBridge;
  v2 = [(ACCTransportClientBridge *)&v10 init];
  if (v2)
  {
    v3 = [[ACCTransportClient alloc] _init];
    transportClient = v2->_transportClient;
    v2->_transportClient = v3;

    [(ACCTransportClient *)v2->_transportClient setDelegate:v2];
    id connectionAuthStatusChangedHandler = v2->_connectionAuthStatusChangedHandler;
    v2->_id connectionAuthStatusChangedHandler = 0;

    id connectionPropertiesChangedHandler = v2->_connectionPropertiesChangedHandler;
    v2->_id connectionPropertiesChangedHandler = 0;

    id endpointPropertiesChangedHandler = v2->_endpointPropertiesChangedHandler;
    v2->_id endpointPropertiesChangedHandler = 0;

    id serverDisconnectedHandler = v2->_serverDisconnectedHandler;
    v2->_id serverDisconnectedHandler = 0;
  }
  return v2;
}

- (void)transportClient:(id)a3 authStatusDidChange:(BOOL)a4 forConnectionWithUUID:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  v7 = [(ACCTransportClientBridge *)self connectionAuthStatusChangedHandler];

  if (v7)
  {
    v8 = [(ACCTransportClientBridge *)self connectionAuthStatusChangedHandler];
    ((void (**)(void, id, BOOL))v8)[2](v8, v9, v5);
  }
}

- (void)transportClient:(id)a3 propertiesDidChange:(id)a4 forConnectionWithUUID:(id)a5 previousProperties:(id)a6
{
  id v13 = a4;
  id v9 = a5;
  id v10 = a6;
  v11 = [(ACCTransportClientBridge *)self connectionPropertiesChangedHandler];

  if (v11)
  {
    v12 = [(ACCTransportClientBridge *)self connectionPropertiesChangedHandler];
    ((void (**)(void, id, id, id))v12)[2](v12, v9, v13, v10);
  }
}

- (void)transportClient:(id)a3 propertiesDidChange:(id)a4 forEndpointWithUUID:(id)a5 previousProperties:(id)a6 connectionUUID:(id)a7
{
  id v16 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  v14 = [(ACCTransportClientBridge *)self endpointPropertiesChangedHandler];

  if (v14)
  {
    v15 = [(ACCTransportClientBridge *)self endpointPropertiesChangedHandler];
    ((void (**)(void, id, id, id, id))v15)[2](v15, v11, v16, v12, v13);
  }
}

- (void)transportClientServerDisconnected:(id)a3
{
  v4 = [(ACCTransportClientBridge *)self serverDisconnectedHandler];

  if (v4)
  {
    BOOL v5 = [(ACCTransportClientBridge *)self serverDisconnectedHandler];
    v5[2]();
  }
}

+ (id)sharedBridge
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ACCTransportClientBridge_sharedBridge__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBridge_once != -1) {
    dispatch_once(&sharedBridge_once, block);
  }
  v2 = (void *)sharedBridge_sharedInstance;

  return v2;
}

uint64_t __40__ACCTransportClientBridge_sharedBridge__block_invoke(uint64_t a1)
{
  sharedBridge_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (ACCTransportClient)transportClient
{
  return self->_transportClient;
}

- (void)setTransportClient:(id)a3
{
}

- (id)connectionAuthStatusChangedHandler
{
  return self->_connectionAuthStatusChangedHandler;
}

- (void)setConnectionAuthStatusChangedHandler:(id)a3
{
}

- (id)connectionPropertiesChangedHandler
{
  return self->_connectionPropertiesChangedHandler;
}

- (void)setConnectionPropertiesChangedHandler:(id)a3
{
}

- (id)endpointPropertiesChangedHandler
{
  return self->_endpointPropertiesChangedHandler;
}

- (void)setEndpointPropertiesChangedHandler:(id)a3
{
}

- (id)serverDisconnectedHandler
{
  return self->_serverDisconnectedHandler;
}

- (void)setServerDisconnectedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serverDisconnectedHandler, 0);
  objc_storeStrong(&self->_endpointPropertiesChangedHandler, 0);
  objc_storeStrong(&self->_connectionPropertiesChangedHandler, 0);
  objc_storeStrong(&self->_connectionAuthStatusChangedHandler, 0);

  objc_storeStrong((id *)&self->_transportClient, 0);
}

@end