@interface AFUIServiceListener
- (BSServiceConnectionListener)bsConnectionListener;
- (NSString)domainName;
- (NSString)serviceName;
- (OS_dispatch_queue)serviceQueue;
- (id)initDefaultServiceWithServiceQueue:(id)a3;
- (id)listenerEndpoint;
- (void)_createListenerIfNecessary;
- (void)_destroyListenerIfNecessary;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setBsConnectionListener:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation AFUIServiceListener

- (id)initDefaultServiceWithServiceQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFUIServiceListener;
  v6 = [(AFUIServiceListener *)&v9 init];
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_domainName, @"com.apple.inputservice.input-ui-host");
    objc_storeStrong(p_isa + 4, @"com.apple.inputservice.AutoFillUI");
    objc_storeStrong(p_isa + 1, a3);
    [p_isa _createListenerIfNecessary];
  }

  return p_isa;
}

- (void)_createListenerIfNecessary
{
  if (!self->_bsConnectionListener && self->_domainName)
  {
    if (self->_serviceName)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __49__AFUIServiceListener__createListenerIfNecessary__block_invoke;
      v5[3] = &unk_265249110;
      v5[4] = self;
      v3 = [MEMORY[0x263F2B9E0] listenerWithConfigurator:v5];
      bsConnectionListener = self->_bsConnectionListener;
      self->_bsConnectionListener = v3;

      [(BSServiceConnectionListener *)self->_bsConnectionListener activate];
    }
  }
}

void __49__AFUIServiceListener__createListenerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  id v4 = a2;
  [v4 setDomain:v3];
  [v4 setService:*(void *)(*(void *)(a1 + 32) + 32)];
  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)_destroyListenerIfNecessary
{
  bsConnectionListener = self->_bsConnectionListener;
  if (bsConnectionListener)
  {
    [(BSServiceConnectionListener *)bsConnectionListener invalidate];
    id v4 = self->_bsConnectionListener;
    self->_bsConnectionListener = 0;
  }
}

- (id)listenerEndpoint
{
  return 0;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  v7 = [v6 remoteProcess];
  v8 = [v6 extractNSXPCConnectionWithConfigurator:&__block_literal_global_1];

  objc_super v9 = [(AFUIServiceListener *)self serviceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__AFUIServiceListener_listener_didReceiveConnection_withContext___block_invoke_2;
  block[3] = &unk_265249138;
  block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

uint64_t __65__AFUIServiceListener_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  v2 = [AFUIServiceSession alloc];
  uint64_t v3 = [*(id *)(a1 + 32) serviceQueue];

  id v4 = *(void **)(a1 + 40);

  return [v4 activate];
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (BSServiceConnectionListener)bsConnectionListener
{
  return self->_bsConnectionListener;
}

- (void)setBsConnectionListener:(id)a3
{
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_bsConnectionListener, 0);

  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

@end