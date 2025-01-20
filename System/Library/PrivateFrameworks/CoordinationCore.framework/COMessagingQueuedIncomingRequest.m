@interface COMessagingQueuedIncomingRequest
- (COMessagingQueuedIncomingRequest)initWithRequest:(id)a3 callback:(id)a4;
- (COMessagingRequest)request;
- (id)callback;
- (id)senderNode;
- (int64_t)remainingTimeUsingCurrentTime:(unint64_t)a3;
- (unint64_t)enqueueTimestamp;
@end

@implementation COMessagingQueuedIncomingRequest

- (COMessagingQueuedIncomingRequest)initWithRequest:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)COMessagingQueuedIncomingRequest;
  v9 = [(COMessagingQueuedIncomingRequest *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    uint64_t v11 = MEMORY[0x223C8B4A0](v8);
    id callback = v10->_callback;
    v10->_id callback = (id)v11;

    v10->_enqueueTimestamp = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  }

  return v10;
}

- (id)senderNode
{
  v2 = [(COMessagingQueuedIncomingRequest *)self request];
  v3 = [v2 sender];

  return v3;
}

- (int64_t)remainingTimeUsingCurrentTime:(unint64_t)a3
{
  return (uint64_t)(3.0e11 - (double)(a3 - [(COMessagingQueuedIncomingRequest *)self enqueueTimestamp]));
}

- (COMessagingRequest)request
{
  return self->_request;
}

- (id)callback
{
  return self->_callback;
}

- (unint64_t)enqueueTimestamp
{
  return self->_enqueueTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end