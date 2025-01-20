@interface HMDPendingResponse
+ (id)tupleForMessage:(id)a3 originalRequestIdentifier:(id)a4 requestCount:(unint64_t)a5 withCompletionHandler:(id)a6;
- (HMFMessage)requestMessage;
- (NSMutableArray)allResponses;
- (NSMutableArray)latestResponses;
- (NSString)originalRequestIdentifier;
- (double)creationTime;
- (id)description;
- (id)responseHandler;
- (id)retrieveAndClearAllResponses;
- (id)retrieveAndClearLatestResponses;
- (unint64_t)pendingResponseCount;
- (unint64_t)totalRequestsCount;
- (void)addResponsesToPendingResponse:(id)a3;
- (void)addToPendingResponses:(id)a3;
- (void)setAllResponses:(id)a3;
- (void)setCreationTime:(double)a3;
- (void)setLatestResponses:(id)a3;
- (void)setOriginalRequestIdentifier:(id)a3;
- (void)setPendingResponseCount:(unint64_t)a3;
- (void)setRequestMessage:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setTotalRequestsCount:(unint64_t)a3;
@end

@implementation HMDPendingResponse

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_latestResponses, 0);
  objc_storeStrong((id *)&self->_allResponses, 0);
  objc_storeStrong((id *)&self->_originalRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_requestMessage, 0);
}

- (void)setCreationTime:(double)a3
{
  self->_creationTime = a3;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setLatestResponses:(id)a3
{
}

- (NSMutableArray)latestResponses
{
  return self->_latestResponses;
}

- (void)setAllResponses:(id)a3
{
}

- (NSMutableArray)allResponses
{
  return self->_allResponses;
}

- (void)setTotalRequestsCount:(unint64_t)a3
{
  self->_totalRequestsCount = a3;
}

- (unint64_t)totalRequestsCount
{
  return self->_totalRequestsCount;
}

- (void)setPendingResponseCount:(unint64_t)a3
{
  self->_pendingResponseCount = a3;
}

- (unint64_t)pendingResponseCount
{
  return self->_pendingResponseCount;
}

- (void)setOriginalRequestIdentifier:(id)a3
{
}

- (NSString)originalRequestIdentifier
{
  return self->_originalRequestIdentifier;
}

- (void)setRequestMessage:(id)a3
{
}

- (HMFMessage)requestMessage
{
  return self->_requestMessage;
}

- (id)retrieveAndClearLatestResponses
{
  v3 = [(HMDPendingResponse *)self latestResponses];
  v4 = (void *)[v3 copy];

  v5 = [(HMDPendingResponse *)self latestResponses];
  [v5 removeAllObjects];

  return v4;
}

- (id)retrieveAndClearAllResponses
{
  v3 = [(HMDPendingResponse *)self allResponses];
  v4 = (void *)[v3 copy];

  v5 = [(HMDPendingResponse *)self allResponses];
  [v5 removeAllObjects];

  v6 = [(HMDPendingResponse *)self latestResponses];
  [v6 removeAllObjects];

  return v4;
}

- (void)addResponsesToPendingResponse:(id)a3
{
  id v4 = a3;
  v5 = [(HMDPendingResponse *)self allResponses];
  [v5 addObjectsFromArray:v4];

  v6 = [(HMDPendingResponse *)self latestResponses];
  [v6 addObjectsFromArray:v4];

  uint64_t v7 = [v4 count];
  unint64_t v8 = [(HMDPendingResponse *)self pendingResponseCount] - v7;
  [(HMDPendingResponse *)self setPendingResponseCount:v8];
}

- (void)addToPendingResponses:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(HMDPendingResponse *)self allResponses];
    [v5 addObject:v4];

    v6 = [(HMDPendingResponse *)self latestResponses];
    [v6 addObject:v4];

    unint64_t v7 = [(HMDPendingResponse *)self pendingResponseCount] - 1;
    [(HMDPendingResponse *)self setPendingResponseCount:v7];
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = [(HMDPendingResponse *)self requestMessage];
  v5 = [v4 identifier];
  v6 = [v3 stringWithFormat:@"Pending Response for request: %@, total requests: %tu pending responses: %tu", v5, -[HMDPendingResponse totalRequestsCount](self, "totalRequestsCount"), -[HMDPendingResponse pendingResponseCount](self, "pendingResponseCount")];

  return v6;
}

+ (id)tupleForMessage:(id)a3 originalRequestIdentifier:(id)a4 requestCount:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_alloc_init(HMDPendingResponse);
  [(HMDPendingResponse *)v12 setRequestMessage:v11];

  [(HMDPendingResponse *)v12 setOriginalRequestIdentifier:v10];
  [(HMDPendingResponse *)v12 setTotalRequestsCount:a5];
  [(HMDPendingResponse *)v12 setPendingResponseCount:a5];
  v13 = [MEMORY[0x263EFF980] arrayWithCapacity:a5];
  [(HMDPendingResponse *)v12 setAllResponses:v13];

  v14 = [MEMORY[0x263EFF980] arrayWithCapacity:a5];
  [(HMDPendingResponse *)v12 setLatestResponses:v14];

  [(HMDPendingResponse *)v12 setResponseHandler:v9];
  [(HMDPendingResponse *)v12 setCreationTime:CFAbsoluteTimeGetCurrent()];
  return v12;
}

@end