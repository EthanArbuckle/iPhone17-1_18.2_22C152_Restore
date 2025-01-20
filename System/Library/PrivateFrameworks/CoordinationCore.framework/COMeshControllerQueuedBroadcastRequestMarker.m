@interface COMeshControllerQueuedBroadcastRequestMarker
- (BOOL)includeSelfInBroadcast;
- (COMeshControllerQueuedBroadcastRequestMarker)initWithRequest:(id)a3 includeSelf:(BOOL)a4 recipientBlock:(id)a5 completionHandler:(id)a6;
- (COMeshRequest)request;
- (id)completionHandler;
- (id)destination;
- (id)recipientCallback;
@end

@implementation COMeshControllerQueuedBroadcastRequestMarker

- (COMeshControllerQueuedBroadcastRequestMarker)initWithRequest:(id)a3 includeSelf:(BOOL)a4 recipientBlock:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)COMeshControllerQueuedBroadcastRequestMarker;
  v14 = [(COMeshControllerQueuedBroadcastRequestMarker *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_request, a3);
    v15->_includeSelfInBroadcast = a4;
    uint64_t v16 = MEMORY[0x223C8B4A0](v12);
    id recipientCallback = v15->_recipientCallback;
    v15->_id recipientCallback = (id)v16;

    uint64_t v18 = MEMORY[0x223C8B4A0](v13);
    id completionHandler = v15->_completionHandler;
    v15->_id completionHandler = (id)v18;
  }
  return v15;
}

- (id)destination
{
  return 0;
}

- (COMeshRequest)request
{
  return self->_request;
}

- (id)recipientCallback
{
  return self->_recipientCallback;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (BOOL)includeSelfInBroadcast
{
  return self->_includeSelfInBroadcast;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_recipientCallback, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end