@interface DAIDSMessengerProxy
+ (id)allowedDataClasses;
- (DAIDSMessageReceiver)receiver;
- (DAIDSMessengerProxy)init;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)messageReceiverQueue;
- (id)_createXPCConnection;
- (void)availableDestinationsWithCompletion:(id)a3;
- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7;
- (void)sendMessage:(id)a3 data:(id)a4 toDestination:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8;
- (void)setConnection:(id)a3;
- (void)setMessageReceiverQueue:(id)a3;
- (void)setReceiver:(id)a3;
@end

@implementation DAIDSMessengerProxy

- (DAIDSMessengerProxy)init
{
  v8.receiver = self;
  v8.super_class = (Class)DAIDSMessengerProxy;
  v2 = [(DAIDSMessengerProxy *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Diagnostics.deviceMessageReceiverQueue", 0);
    messageReceiverQueue = v2->_messageReceiverQueue;
    v2->_messageReceiverQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [(DAIDSMessengerProxy *)v2 _createXPCConnection];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v5;
  }
  return v2;
}

- (void)availableDestinationsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DAIDSMessengerProxy *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&stru_10014BC58];

  [v6 availableDestinationsWithCompletion:v4];
}

- (void)sendMessage:(id)a3 data:(id)a4 toDestination:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [(DAIDSMessengerProxy *)self connection];
  id v19 = [v18 remoteObjectProxyWithErrorHandler:&stru_10014BC78];

  [v19 sendMessage:v17 data:v16 toDestination:v15 forceLocalDelivery:v9 expectsResponse:v8 response:v14];
}

- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(DAIDSMessengerProxy *)self messageReceiverQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100017814;
  v21[3] = &unk_10014BCA0;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  BOOL v26 = a6;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, v21);
}

- (id)_createXPCConnection
{
  id v3 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.iosdiagnosticsd" options:4096];
  id v4 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DAIDSMessageSender];
  uint64_t v5 = +[DAIDSMessengerProxy allowedDataClasses];
  [v4 setClasses:v5 forSelector:"sendMessage:data:toDestination:forceLocalDelivery:expectsResponse:response:" argumentIndex:1 ofReply:0];

  id v6 = +[DAIDSMessengerProxy allowedDataClasses];
  [v4 setClasses:v6 forSelector:"sendMessage:data:toDestination:forceLocalDelivery:expectsResponse:response:" argumentIndex:2 ofReply:1];

  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v7 = +[NSArray arrayWithObjects:v16 count:2];
  BOOL v8 = +[NSSet setWithArray:v7];
  [v4 setClasses:v8 forSelector:"availableDestinationsWithCompletion:" argumentIndex:0 ofReply:1];

  [v3 setRemoteObjectInterface:v4];
  BOOL v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DAIDSMessageReceiver];
  v10 = +[DAIDSMessengerProxy allowedDataClasses];
  [v9 setClasses:v10 forSelector:"receiveMessage:data:fromDestination:expectsResponse:response:" argumentIndex:1 ofReply:0];

  v11 = +[DAIDSMessengerProxy allowedDataClasses];
  [v9 setClasses:v11 forSelector:"receiveMessage:data:fromDestination:expectsResponse:response:" argumentIndex:1 ofReply:1];

  [v3 setExportedInterface:v9];
  [v3 setExportedObject:self];
  [v3 setInterruptionHandler:&stru_10014BCC0];
  [v3 setInvalidationHandler:&stru_10014BCE0];
  [v3 resume];
  id v12 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Created connection: %@", (uint8_t *)&v14, 0xCu);
  }

  return v3;
}

+ (id)allowedDataClasses
{
  if (qword_1001868F8 != -1) {
    dispatch_once(&qword_1001868F8, &stru_10014BD00);
  }
  v2 = (void *)qword_1001868F0;

  return v2;
}

- (DAIDSMessageReceiver)receiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);

  return (DAIDSMessageReceiver *)WeakRetained;
}

- (void)setReceiver:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)messageReceiverQueue
{
  return self->_messageReceiverQueue;
}

- (void)setMessageReceiverQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageReceiverQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_receiver);
}

@end