@interface COMeshControllerQueuedBroadcastRequest
- (COMeshControllerQueuedBroadcastRequest)initWithRequest:(id)a3 destination:(id)a4 completionHandler:(id)a5;
- (COMeshNode)destination;
- (COMeshRequest)request;
- (COMeshResponse)response;
- (id)completionHandler;
- (void)invokeCallbackWithError:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation COMeshControllerQueuedBroadcastRequest

- (COMeshControllerQueuedBroadcastRequest)initWithRequest:(id)a3 destination:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)COMeshControllerQueuedBroadcastRequest;
  v12 = [(COMeshControllerQueuedBroadcastRequest *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_destination, a4);
    uint64_t v14 = [v11 copy];
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = (id)v14;
  }
  return v13;
}

- (void)invokeCallbackWithError:(id)a3
{
  id v4 = a3;
  v8 = [(COMeshControllerQueuedBroadcastRequest *)self completionHandler];
  v5 = [(COMeshControllerQueuedBroadcastRequest *)self request];
  v6 = [(COMeshControllerQueuedBroadcastRequest *)self destination];
  v7 = [(COMeshControllerQueuedBroadcastRequest *)self response];
  v8[2](v8, v5, v6, v7, v4);
}

- (COMeshRequest)request
{
  return self->_request;
}

- (COMeshNode)destination
{
  return self->_destination;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (COMeshResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end