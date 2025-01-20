@interface SKServiceBroker
+ (id)_serviceConnectionWithName:(id)a3;
+ (id)_storeKitClientInterface;
+ (id)_storeKitServiceInterface;
+ (id)defaultBroker;
- (SKServiceBroker)init;
- (id)_serviceConnection;
- (id)externalGatewayServiceWithErrorHandler:(id)a3;
- (id)inAppBindingServiceWithErrorHandler:(id)a3;
- (id)inAppEngagementServiceWithErrorHandler:(id)a3;
- (id)messageServiceWithErrorHandler:(id)a3;
- (id)overrideServiceWithErrorHandler:(id)a3;
- (id)overrideSynchronousServiceWithErrorHandler:(id)a3;
- (id)policyServiceWithErrorHandler:(id)a3;
- (id)productLookupServiceWithErrorHandler:(id)a3;
- (id)productServiceWithErrorHandler:(id)a3;
- (id)purchaseIntentServiceWithErrorHandler:(id)a3;
- (id)storeKitServiceWithErrorHandler:(id)a3;
- (id)storeKitSynchronousServiceWithErrorHandler:(id)a3;
- (id)storefrontServiceWithErrorHandler:(id)a3;
- (void)_serviceConnectionInvalidated;
@end

@implementation SKServiceBroker

+ (id)defaultBroker
{
  if (defaultBroker_onceToken_0 != -1) {
    dispatch_once(&defaultBroker_onceToken_0, &__block_literal_global_13);
  }
  v2 = (void *)defaultBroker__defaultServiceBroker;

  return v2;
}

- (id)storeKitServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__SKServiceBroker_storeKitServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)storefrontServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__SKServiceBroker_storefrontServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)_serviceConnection
{
  [(NSLock *)self->_serviceConnectionLock lock];
  p_serviceConnection = &self->_serviceConnection;
  serviceConnection = self->_serviceConnection;
  if (!serviceConnection)
  {
    v5 = +[SKServiceBroker _serviceConnectionWithName:0x1F08A87E0];
    [v5 resume];
    objc_storeStrong((id *)&self->_serviceConnection, v5);
    objc_initWeak(&location, self);
    id v6 = self->_serviceConnection;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__SKServiceBroker__serviceConnection__block_invoke;
    v12[3] = &unk_1E5FAAC60;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)v6 setInterruptionHandler:v12];
    v7 = *p_serviceConnection;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__SKServiceBroker__serviceConnection__block_invoke_2;
    v10[3] = &unk_1E5FAAC60;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)v7 setInvalidationHandler:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

    serviceConnection = *p_serviceConnection;
  }
  v8 = serviceConnection;
  [(NSLock *)self->_serviceConnectionLock unlock];

  return v8;
}

- (id)purchaseIntentServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__SKServiceBroker_purchaseIntentServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

+ (id)_serviceConnectionWithName:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F29268];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithMachServiceName:v4 options:0];

  id v6 = +[SKServiceBroker _storeKitServiceInterface];
  [v5 setRemoteObjectInterface:v6];

  v7 = +[SKServiceBroker _storeKitClientInterface];
  [v5 setExportedInterface:v7];

  v8 = +[SKClientBroker defaultBroker];
  [v5 setExportedObject:v8];

  return v5;
}

+ (id)_storeKitServiceInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08F1908];
  v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08F1968];
  [v2 setInterface:v16 forSelector:sel_productsWithRequest_responseReceiver_reply_ argumentIndex:1 ofReply:0];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08C1708];
  [v2 setInterface:v3 forSelector:sel_enumerateCurrentReceiptsForProductID_withReceiver_reply_ argumentIndex:1 ofReply:0];
  [v2 setInterface:v3 forSelector:sel_enumerateReceiptsForProductID_withReceiver_reply_ argumentIndex:1 ofReply:0];
  [v2 setInterface:v3 forSelector:sel_enumerateUnfinishedTransactionsWithReceiver_reply_ argumentIndex:0 ofReply:0];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:sel_processPayment_forClient_paymentDelegate_reply_ argumentIndex:0 ofReply:1];

  id v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08ED2E8];
  [v2 setInterface:v13 forSelector:sel_processPayment_forClient_paymentDelegate_reply_ argumentIndex:2 ofReply:0];
  v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08C1690];
  [v2 setInterface:v14 forSelector:sel_enumerateSubscriptionStatusesWithReceiver_reply_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_storeKitClientInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08C19E0];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_downloadStatusChanged_ argumentIndex:0 ofReply:0];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  [v2 setClasses:v18 forSelector:sel_updatedTransactions_ argumentIndex:0 ofReply:0];

  return v2;
}

uint64_t __32__SKServiceBroker_defaultBroker__block_invoke()
{
  defaultBroker__defaultServiceBroker = objc_alloc_init(SKServiceBroker);

  return MEMORY[0x1F41817F8]();
}

- (SKServiceBroker)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKServiceBroker;
  v2 = [(SKServiceBroker *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    serviceConnectionLock = v2->_serviceConnectionLock;
    v2->_serviceConnectionLock = v3;
  }
  return v2;
}

- (id)externalGatewayServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SKServiceBroker_externalGatewayServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

uint64_t __58__SKServiceBroker_externalGatewayServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)inAppBindingServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SKServiceBroker_inAppBindingServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

uint64_t __55__SKServiceBroker_inAppBindingServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)inAppEngagementServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SKServiceBroker_inAppEngagementServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

uint64_t __58__SKServiceBroker_inAppEngagementServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)messageServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__SKServiceBroker_messageServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

uint64_t __50__SKServiceBroker_messageServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)overrideServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__SKServiceBroker_overrideServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

uint64_t __51__SKServiceBroker_overrideServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)overrideSynchronousServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__SKServiceBroker_overrideSynchronousServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

uint64_t __62__SKServiceBroker_overrideSynchronousServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)policyServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__SKServiceBroker_policyServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

uint64_t __49__SKServiceBroker_policyServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)productLookupServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__SKServiceBroker_productLookupServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

uint64_t __56__SKServiceBroker_productLookupServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)productServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__SKServiceBroker_productServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

uint64_t __50__SKServiceBroker_productServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __57__SKServiceBroker_purchaseIntentServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __53__SKServiceBroker_storefrontServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __51__SKServiceBroker_storeKitServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)storeKitSynchronousServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__SKServiceBroker_storeKitSynchronousServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FA9E30;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

uint64_t __62__SKServiceBroker_storeKitSynchronousServiceWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __37__SKServiceBroker__serviceConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _serviceConnectionInvalidated];
}

void __37__SKServiceBroker__serviceConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _serviceConnectionInvalidated];
}

- (void)_serviceConnectionInvalidated
{
  [(NSLock *)self->_serviceConnectionLock lock];
  serviceConnection = self->_serviceConnection;
  self->_serviceConnection = 0;

  serviceConnectionLock = self->_serviceConnectionLock;

  [(NSLock *)serviceConnectionLock unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);

  objc_storeStrong((id *)&self->_serviceConnectionLock, 0);
}

@end