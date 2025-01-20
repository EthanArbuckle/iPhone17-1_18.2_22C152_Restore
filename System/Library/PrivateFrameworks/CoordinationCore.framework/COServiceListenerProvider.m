@interface COServiceListenerProvider
- (BOOL)serviceShouldAcceptNewConnection:(id)a3;
- (COServiceListenerProvider)initWithServiceName:(id)a3 entitlement:(id)a4;
- (NSString)entitlement;
- (NSString)serviceName;
- (OS_dispatch_queue)dispatchQueue;
- (id)serviceListener;
@end

@implementation COServiceListenerProvider

- (COServiceListenerProvider)initWithServiceName:(id)a3 entitlement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COServiceListenerProvider;
  v9 = [(COServiceListenerProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceName, a3);
    objc_storeStrong((id *)&v10->_entitlement, a4);
  }

  return v10;
}

- (OS_dispatch_queue)dispatchQueue
{
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
    id v4 = [(COServiceListenerProvider *)self serviceName];
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = (OS_dispatch_queue *)dispatch_queue_create(v5, v6);
    id v8 = self->_dispatchQueue;
    self->_dispatchQueue = v7;

    dispatchQueue = self->_dispatchQueue;
  }
  return dispatchQueue;
}

- (id)serviceListener
{
  id v3 = objc_alloc(MEMORY[0x263F08D88]);
  id v4 = [(COServiceListenerProvider *)self serviceName];
  v5 = (void *)[v3 initWithMachServiceName:v4];

  return v5;
}

- (BOOL)serviceShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  v5 = [(COServiceListenerProvider *)self entitlement];
  if (v5)
  {
    v6 = [(COServiceListenerProvider *)self entitlement];
    id v7 = [v4 valueForEntitlement:v6];
    char v8 = [v7 BOOLValue];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end