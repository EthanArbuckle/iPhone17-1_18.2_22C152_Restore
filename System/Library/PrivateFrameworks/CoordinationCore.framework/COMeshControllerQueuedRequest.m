@interface COMeshControllerQueuedRequest
- (COMeshControllerQueuedRequest)initWithRequest:(id)a3 completionHandler:(id)a4;
- (COMeshNode)destination;
- (COMeshRequest)request;
- (COMeshResponse)response;
- (id)completionHandler;
- (void)invokeCallbackWithError:(id)a3;
- (void)setDestination:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation COMeshControllerQueuedRequest

- (COMeshControllerQueuedRequest)initWithRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)COMeshControllerQueuedRequest;
  v9 = [(COMeshControllerQueuedRequest *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    uint64_t v11 = [v8 copy];
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = (id)v11;
  }
  return v10;
}

- (void)invokeCallbackWithError:(id)a3
{
  id v4 = a3;
  id v8 = [(COMeshControllerQueuedRequest *)self completionHandler];
  v5 = [(COMeshControllerQueuedRequest *)self request];
  v6 = [(COMeshControllerQueuedRequest *)self destination];
  id v7 = [(COMeshControllerQueuedRequest *)self response];
  v8[2](v8, v5, v6, v7, v4);
}

- (COMeshRequest)request
{
  return self->_request;
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

- (COMeshNode)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end