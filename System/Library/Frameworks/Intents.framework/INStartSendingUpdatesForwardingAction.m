@interface INStartSendingUpdatesForwardingAction
+ (BOOL)supportsBSXPCSecureCoding;
+ (Class)responseClass;
- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4;
- (INIntentResponseObserver)observer;
- (INStartSendingUpdatesForwardingAction)initWithBSXPCCoder:(id)a3;
- (INStartSendingUpdatesForwardingAction)initWithIntent:(id)a3 endpoint:(id)a4 observer:(id)a5;
- (INStartSendingUpdatesForwardingAction)initWithIntent:(id)a3 endpointProvider:(id)a4 observer:(id)a5;
- (NSXPCConnection)connection;
- (NSXPCListenerEndpoint)endpoint;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation INStartSendingUpdatesForwardingAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_observer, 0);
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (INIntentResponseObserver)observer
{
  return self->_observer;
}

- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSXPCConnection *)self->_connection resume];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__104412;
  v16[4] = __Block_byref_object_dispose__104413;
  v8 = self;
  v17 = v8;
  v9 = [(INIntentForwardingAction *)v8 intent];
  v10 = [(INStartSendingUpdatesForwardingAction *)v8 observer];
  v11 = v10;
  if (!v10)
  {
    v11 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__INStartSendingUpdatesForwardingAction_executeLocallyWithIntentDeliverer_completionHandler___block_invoke;
  v13[3] = &unk_1E551E410;
  id v12 = v7;
  id v14 = v12;
  v15 = v16;
  [v6 startSendingUpdatesForIntent:v9 toObserver:v11 completionHandler:v13];
  if (!v10) {

  }
  _Block_object_dispose(v16, 8);
}

void __93__INStartSendingUpdatesForwardingAction_executeLocallyWithIntentDeliverer_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [[INIntentForwardingActionResponse alloc] initWithError:0];
  (*(void (**)(uint64_t, INIntentForwardingActionResponse *))(v2 + 16))(v2, v3);

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, INIntentForwardingActionResponse *))a4;
  v15.receiver = self;
  v15.super_class = (Class)INStartSendingUpdatesForwardingAction;
  if ([(INIntentForwardingAction *)&v15 executeRemotelyWithVendorRemote:v6 completionHandler:v7])
  {
    goto LABEL_4;
  }
  if (objc_opt_respondsToSelector())
  {
    v8 = [(INIntentForwardingAction *)self intent];
    v9 = INIntentWithTypedIntent(v8);

    v10 = [(INStartSendingUpdatesForwardingAction *)self observer];
    [v6 startSendingUpdatesForIntent:v9 toObserver:v10];

    v11 = [[INIntentForwardingActionResponse alloc] initWithError:0];
    v7[2](v7, v11);

LABEL_4:
    BOOL v12 = 1;
    goto LABEL_8;
  }
  v13 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[INStartSendingUpdatesForwardingAction executeRemotelyWithVendorRemote:completionHandler:]";
    _os_log_error_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_ERROR, "%s The extension context doesn't implement startSendingUpdatesForIntent:toObserver:", buf, 0xCu);
  }
  BOOL v12 = 0;
LABEL_8:

  return v12;
}

- (INStartSendingUpdatesForwardingAction)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
  if (v5)
  {
    id v6 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F145A0] forKey:@"endpoint"];
    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F292A0]);
      [v7 _setEndpoint:v6];
      self = [(INStartSendingUpdatesForwardingAction *)self initWithIntent:v5 endpoint:v7 observer:0];

      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentForwardingAction *)self intent];
  [v4 encodeObject:v5 forKey:@"intent"];

  id v7 = [(INStartSendingUpdatesForwardingAction *)self endpoint];
  id v6 = [v7 _endpoint];
  [v4 encodeXPCObject:v6 forKey:@"endpoint"];
}

- (INStartSendingUpdatesForwardingAction)initWithIntent:(id)a3 endpoint:(id)a4 observer:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)INStartSendingUpdatesForwardingAction;
  v11 = [(INIntentForwardingAction *)&v18 initWithIntent:a3];
  BOOL v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_endpoint, a4);
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v9];
    connection = v12->_connection;
    v12->_connection = (NSXPCConnection *)v13;

    objc_super v15 = v12->_connection;
    v16 = INIntentResponseObserverXPCInterface();
    [(NSXPCConnection *)v15 setRemoteObjectInterface:v16];

    if (v10)
    {
      objc_storeStrong((id *)&v12->_observer, a5);
      [(NSXPCConnection *)v12->_connection resume];
    }
  }

  return v12;
}

- (INStartSendingUpdatesForwardingAction)initWithIntent:(id)a3 endpointProvider:(id)a4 observer:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = INIntentResponseObserverXPCInterface();
  BOOL v12 = [v9 xpcListenerEndpointWithInterface:v11 object:v8];

  uint64_t v13 = [(INStartSendingUpdatesForwardingAction *)self initWithIntent:v10 endpoint:v12 observer:v8];
  return v13;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end