@interface _IMDRelayPendingServiceReachabilityRequest
- (IMServiceReachabilityRequest)originalRequest;
- (IMServiceReachabilityResult)lastResult;
- (NSArray)sentToDevices;
- (NSDate)lastUpdateTime;
- (NSMapTable)responseHandlers;
- (NSString)requestID;
- (_IMDRelayPendingServiceReachabilityRequest)initWithRequest:(id)a3 responseHandler:(id)a4;
- (id)createIncompleteFinalResult;
- (void)enumerateResponseHandlersWithBlock:(id)a3;
- (void)setLastResult:(id)a3;
- (void)setLastUpdateTime:(id)a3;
- (void)setOriginalRequest:(id)a3;
- (void)setResponseHandlers:(id)a3;
- (void)setSentToDevices:(id)a3;
@end

@implementation _IMDRelayPendingServiceReachabilityRequest

- (_IMDRelayPendingServiceReachabilityRequest)initWithRequest:(id)a3 responseHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_IMDRelayPendingServiceReachabilityRequest;
  v9 = [(_IMDRelayPendingServiceReachabilityRequest *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalRequest, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    responseHandlers = v10->_responseHandlers;
    v10->_responseHandlers = (NSMapTable *)v11;

    [(NSMapTable *)v10->_responseHandlers setObject:v8 forKey:v7];
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    lastUpdateTime = v10->_lastUpdateTime;
    v10->_lastUpdateTime = (NSDate *)v13;
  }
  return v10;
}

- (NSString)requestID
{
  v2 = [(_IMDRelayPendingServiceReachabilityRequest *)self originalRequest];
  v3 = [v2 requestID];

  return (NSString *)v3;
}

- (id)createIncompleteFinalResult
{
  v3 = [(_IMDRelayPendingServiceReachabilityRequest *)self lastResult];
  v4 = (void *)[v3 copy];

  if (v4)
  {
    [v4 setFinal:1];
    id v5 = v4;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F6E990];
    id v7 = [(_IMDRelayPendingServiceReachabilityRequest *)self originalRequest];
    id v8 = [v7 serviceName];
    v9 = [(_IMDRelayPendingServiceReachabilityRequest *)self originalRequest];
    v10 = [v9 handleIDs];
    id v5 = [v6 finalResultForService:v8 handleIDs:v10 allAreReachable:0 checkedServer:0 error:3];
  }

  return v5;
}

- (void)enumerateResponseHandlersWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, void *))a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(_IMDRelayPendingServiceReachabilityRequest *)self responseHandlers];
  v6 = [v5 keyEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        v12 = [(_IMDRelayPendingServiceReachabilityRequest *)self responseHandlers];
        uint64_t v13 = [v12 objectForKey:v11];
        v4[2](v4, v11, v13);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (NSMapTable)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setResponseHandlers:(id)a3
{
}

- (NSArray)sentToDevices
{
  return self->_sentToDevices;
}

- (void)setSentToDevices:(id)a3
{
}

- (IMServiceReachabilityResult)lastResult
{
  return self->_lastResult;
}

- (void)setLastResult:(id)a3
{
}

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void)setLastUpdateTime:(id)a3
{
}

- (IMServiceReachabilityRequest)originalRequest
{
  return self->_originalRequest;
}

- (void)setOriginalRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_lastResult, 0);
  objc_storeStrong((id *)&self->_sentToDevices, 0);

  objc_storeStrong((id *)&self->_responseHandlers, 0);
}

@end