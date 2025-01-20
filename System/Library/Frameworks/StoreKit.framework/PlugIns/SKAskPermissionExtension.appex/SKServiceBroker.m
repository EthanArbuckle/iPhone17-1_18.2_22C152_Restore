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

- (SKServiceBroker)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKServiceBroker;
  v2 = [(SKServiceBroker *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    serviceConnectionLock = v2->_serviceConnectionLock;
    v2->_serviceConnectionLock = v3;
  }
  return v2;
}

+ (id)defaultBroker
{
  if (qword_1000127E8 != -1) {
    dispatch_once(&qword_1000127E8, &stru_10000C5D0);
  }
  v2 = (void *)qword_1000127E0;

  return v2;
}

- (id)externalGatewayServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006380;
  v9[3] = &unk_10000C5F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)inAppBindingServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006468;
  v9[3] = &unk_10000C5F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)inAppEngagementServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006550;
  v9[3] = &unk_10000C5F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)messageServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006638;
  v9[3] = &unk_10000C5F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)overrideServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006720;
  v9[3] = &unk_10000C5F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)overrideSynchronousServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006808;
  v9[3] = &unk_10000C5F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)policyServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000068F0;
  v9[3] = &unk_10000C5F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)productLookupServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000069D8;
  v9[3] = &unk_10000C5F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)productServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006AC0;
  v9[3] = &unk_10000C5F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)purchaseIntentServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006BA8;
  v9[3] = &unk_10000C5F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)storefrontServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006C90;
  v9[3] = &unk_10000C5F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)storeKitServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006D78;
  v9[3] = &unk_10000C5F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (id)storeKitSynchronousServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKServiceBroker *)self _serviceConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006E60;
  v9[3] = &unk_10000C5F8;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

+ (id)_storeKitServiceInterface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ServiceProtocol];
  v15 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ProductResponseReceiver];
  [v2 setInterface:v15 forSelector:"productsWithRequest:responseReceiver:reply:" argumentIndex:1 ofReply:0];
  v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKTransactionReceiverProtocol];
  [v2 setInterface:v3 forSelector:"enumerateCurrentReceiptsForProductID:withReceiver:reply:" argumentIndex:1 ofReply:0];
  [v2 setInterface:v3 forSelector:"enumerateReceiptsForProductID:withReceiver:reply:" argumentIndex:1 ofReply:0];
  [v2 setInterface:v3 forSelector:"enumerateUnfinishedTransactionsWithReceiver:reply:" argumentIndex:0 ofReply:0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:"processPayment:forClient:paymentDelegate:reply:" argumentIndex:0 ofReply:1];

  v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKPaymentDelegateProtocol];
  [v2 setInterface:v12 forSelector:"processPayment:forClient:paymentDelegate:reply:" argumentIndex:2 ofReply:0];
  v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKStatusReceiverProtocol];
  [v2 setInterface:v13 forSelector:"enumerateSubscriptionStatusesWithReceiver:reply:" argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_storeKitClientInterface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKClientProtocol];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:"downloadStatusChanged:" argumentIndex:0 ofReply:0];

  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
  [v2 setClasses:v16 forSelector:"updatedTransactions:" argumentIndex:0 ofReply:0];

  return v2;
}

- (id)_serviceConnection
{
  [(NSLock *)self->_serviceConnectionLock lock];
  p_serviceConnection = &self->_serviceConnection;
  serviceConnection = self->_serviceConnection;
  if (!serviceConnection)
  {
    uint64_t v5 = +[SKServiceBroker _serviceConnectionWithName:@"com.apple.storekitd"];
    [v5 resume];
    objc_storeStrong((id *)&self->_serviceConnection, v5);
    objc_initWeak(&location, self);
    uint64_t v6 = self->_serviceConnection;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100007468;
    v12[3] = &unk_10000C620;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)v6 setInterruptionHandler:v12];
    uint64_t v7 = *p_serviceConnection;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000074A8;
    v10[3] = &unk_10000C620;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)v7 setInvalidationHandler:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

    serviceConnection = *p_serviceConnection;
  }
  uint64_t v8 = serviceConnection;
  [(NSLock *)self->_serviceConnectionLock unlock];

  return v8;
}

+ (id)_serviceConnectionWithName:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:v3 options:0];

  uint64_t v5 = +[SKServiceBroker _storeKitServiceInterface];
  [v4 setRemoteObjectInterface:v5];

  uint64_t v6 = +[SKServiceBroker _storeKitClientInterface];
  [v4 setExportedInterface:v6];

  uint64_t v7 = +[SKClientBroker defaultBroker];
  [v4 setExportedObject:v7];

  return v4;
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