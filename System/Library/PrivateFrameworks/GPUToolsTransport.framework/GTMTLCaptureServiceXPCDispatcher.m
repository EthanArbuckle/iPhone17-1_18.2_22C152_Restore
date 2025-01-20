@interface GTMTLCaptureServiceXPCDispatcher
- (GTMTLCaptureServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4 notifyConnection:(id)a5;
- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4;
- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4;
- (void)nextRequestID:(id)a3 replyConnection:(id)a4;
- (void)query_:(id)a3 replyConnection:(id)a4;
- (void)registerObserver_:(id)a3 replyConnection:(id)a4;
- (void)startWithDescriptor_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)stop:(id)a3 replyConnection:(id)a4;
- (void)update_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTMTLCaptureServiceXPCDispatcher

- (GTMTLCaptureServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4 notifyConnection:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [a4 protocolMethods];
  v12 = (void *)[v11 mutableCopy];

  [v12 addObject:@"broadcastDisconnect"];
  v22.receiver = self;
  v22.super_class = (Class)GTMTLCaptureServiceXPCDispatcher;
  v13 = [(GTXPCDispatcher *)&v22 initWithProtocolMethods:v12];
  if (v13)
  {
    v14 = allServices(v10);
    v15 = filteredArrayByService(v14, (Protocol *)&unk_26EFBD7A0);
    v16 = [v15 firstObject];

    v17 = [GTURLAccessProviderXPCProxy alloc];
    v18 = [v16 serviceProperties];
    uint64_t v19 = [(GTURLAccessProviderXPCProxy *)v17 initWithConnection:v10 remoteProperties:v18];
    urlService = v13->_urlService;
    v13->_urlService = (GTURLAccessProviderXPCProxy *)v19;

    objc_storeStrong((id *)&v13->_implInstance, a3);
  }

  return v13;
}

- (void)stop:(id)a3 replyConnection:(id)a4
{
}

- (void)registerObserver_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(GTServiceObserver *)[GTMTLCaptureServiceObserver alloc] initWithMessage:v7 notifyConnection:v6];
  uint64_t v8 = [(GTMTLCaptureService *)self->_implInstance registerObserver:v10];
  id v9 = gt_xpc_dictionary_create_reply(v7);

  xpc_dictionary_set_uint64(v9, "observerId", v8);
  [v6 sendMessage:v9];
}

- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(GTMTLCaptureService *)self->_implInstance deregisterObserver:xpc_dictionary_get_uint64(v7, "observerId")];
  gt_xpc_dictionary_create_reply(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v6 sendMessage:v8];
}

- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  xpc_dictionary_get_array(a3, "_pathHistory");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(GTMTLCaptureService *)self->_implInstance deregisterObserversForConnection:v6 path:v7];
}

- (void)startWithDescriptor_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x263EFFA08];
  id v8 = a3;
  id v9 = [v7 alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v9, "initWithObjects:", v10, v11, objc_opt_class(), 0);
  nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v8, "descriptor", v12);
  v14 = gt_xpc_dictionary_create_reply(v8);

  objc_initWeak(&location, self->_urlService);
  implInstance = self->_implInstance;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __91__GTMTLCaptureServiceXPCDispatcher_startWithDescriptor_completionHandler__replyConnection___block_invoke;
  v19[3] = &unk_264E289D0;
  objc_copyWeak(&v22, &location);
  id v20 = v14;
  id v21 = v6;
  id v16 = v6;
  id v17 = v14;
  id v18 = (id)[(GTMTLCaptureService *)implInstance startWithDescriptor:nsobject_classes completionHandler:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __91__GTMTLCaptureServiceXPCDispatcher_startWithDescriptor_completionHandler__replyConnection___block_invoke(void **a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_new();
  v5 = [v3 error];

  if (v5)
  {
    WeakRetained = [v3 error];
    [v4 setObject:WeakRetained forKeyedSubscript:@"error"];
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    if (WeakRetained)
    {
      id v7 = [v3 archiveURL];
      id v8 = [WeakRetained makeURL:v7];

      [v4 setObject:v8 forKeyedSubscript:@"archiveURL"];
      xpc_dictionary_set_flag(a1[4], "_flags", 5);
    }
  }

  id v9 = objc_opt_new();
  uint64_t v10 = (void *)MEMORY[0x263F08910];
  uint64_t v11 = (void *)[v4 copy];
  id v14 = 0;
  v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v14];
  id v13 = v14;
  [v9 setData:v12];

  [v9 setError:v13];
  xpc_dictionary_set_nsobject(a1[4], "response", (uint64_t)v9);
  xpc_dictionary_set_nserror(a1[4], "_error", v13);
  [a1[5] sendMessage:a1[4]];
}

- (void)update_:(id)a3 replyConnection:(id)a4
{
  DispatchCaptureBatchRequest(a4, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[(GTMTLCaptureService *)self->_implInstance update:v6];
}

- (void)query_:(id)a3 replyConnection:(id)a4
{
  DispatchCaptureBatchRequest(a4, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[(GTMTLCaptureService *)self->_implInstance query:v6];
}

- (void)nextRequestID:(id)a3 replyConnection:(id)a4
{
  implInstance = self->_implInstance;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(GTMTLCaptureService *)implInstance nextRequestID];
  gt_xpc_dictionary_create_reply(v7);
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_uint64(xdict, "requestID", v8);
  [v6 sendMessage:xdict];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlService, 0);

  objc_storeStrong((id *)&self->_implInstance, 0);
}

@end