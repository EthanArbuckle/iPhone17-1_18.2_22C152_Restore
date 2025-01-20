@interface MFNanoServerFullMessageLoaderBatchRequest
- (BOOL)enqueueMessageId:(id)a3;
- (BOOL)enqueueMessageIds:(id)a3;
- (BOOL)isRequestCompleted;
- (BOOL)resultIncludesProtectedMessages;
- (MFNanoServerFullMessageLoaderBatchRequest)initWithMessageIds:(id)a3 completion:(id)a4;
- (NSMutableDictionary)resultedMessagesById;
- (NSMutableOrderedSet)outstandingMessageIdRequests;
- (NSMutableSet)pendingMessageIdRequests;
- (id)completionBlock;
- (id)dequeueAllMessageIds;
- (id)dequeueMessageId;
- (id)results;
- (void)addResult:(id)a3 isProtectedMessage:(BOOL)a4;
- (void)addResults:(id)a3 isProtectedMessage:(BOOL)a4;
- (void)cancelRequestForMessageId:(id)a3;
- (void)cancelRequestForMessageIds:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setOutstandingMessageIdRequests:(id)a3;
- (void)setPendingMessageIdRequests:(id)a3;
- (void)setResultIncludesProtectedMessages:(BOOL)a3;
- (void)setResultedMessagesById:(id)a3;
@end

@implementation MFNanoServerFullMessageLoaderBatchRequest

- (MFNanoServerFullMessageLoaderBatchRequest)initWithMessageIds:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MFNanoServerFullMessageLoaderBatchRequest;
  v8 = [(MFNanoServerFullMessageLoaderBatchRequest *)&v18 init];
  if (v8)
  {
    v9 = (NSMutableOrderedSet *)[objc_alloc((Class)NSMutableOrderedSet) initWithArray:v6];
    outstandingMessageIdRequests = v8->_outstandingMessageIdRequests;
    v8->_outstandingMessageIdRequests = v9;

    v11 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithArray:v6];
    pendingMessageIdRequests = v8->_pendingMessageIdRequests;
    v8->_pendingMessageIdRequests = v11;

    id v13 = [v7 copy];
    id completionBlock = v8->_completionBlock;
    v8->_id completionBlock = v13;

    v15 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
    resultedMessagesById = v8->_resultedMessagesById;
    v8->_resultedMessagesById = v15;

    v8->_resultIncludesProtectedMessages = 0;
  }

  return v8;
}

- (id)dequeueAllMessageIds
{
  v3 = [(NSMutableOrderedSet *)self->_outstandingMessageIdRequests array];
  id v4 = [v3 copy];

  if ([v4 count]) {
    [(NSMutableOrderedSet *)self->_outstandingMessageIdRequests removeAllObjects];
  }

  return v4;
}

- (id)dequeueMessageId
{
  v3 = [(NSMutableOrderedSet *)self->_outstandingMessageIdRequests firstObject];
  if (v3) {
    [(NSMutableOrderedSet *)self->_outstandingMessageIdRequests removeObject:v3];
  }

  return v3;
}

- (BOOL)enqueueMessageIds:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  int v5 = 0;
  id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v5 |= -[MFNanoServerFullMessageLoaderBatchRequest enqueueMessageId:](self, "enqueueMessageId:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v8), (void)v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v5 & 1;
}

- (BOOL)enqueueMessageId:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NSMutableSet *)self->_pendingMessageIdRequests containsObject:v4];
  if (v5) {
    [(NSMutableOrderedSet *)self->_outstandingMessageIdRequests addObject:v4];
  }

  return v5;
}

- (void)cancelRequestForMessageId:(id)a3
{
  id v4 = a3;
  -[NSMutableOrderedSet removeObject:](self->_outstandingMessageIdRequests, "removeObject:");
  [(NSMutableSet *)self->_pendingMessageIdRequests removeObject:v4];
  [(NSMutableDictionary *)self->_resultedMessagesById removeObjectForKey:v4];
}

- (void)cancelRequestForMessageIds:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[MFNanoServerFullMessageLoaderBatchRequest cancelRequestForMessageId:](self, "cancelRequestForMessageId:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)addResults:(id)a3 isProtectedMessage:(BOOL)a4
{
  BOOL v4 = a4;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[MFNanoServerFullMessageLoaderBatchRequest addResult:isProtectedMessage:](self, "addResult:isProtectedMessage:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), v4, (void)v10);
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addResult:(id)a3 isProtectedMessage:(BOOL)a4
{
  id v6 = a3;
  pendingMessageIdRequests = self->_pendingMessageIdRequests;
  id v13 = v6;
  uint64_t v8 = [v6 messageId];
  LODWORD(pendingMessageIdRequests) = [(NSMutableSet *)pendingMessageIdRequests containsObject:v8];

  if (pendingMessageIdRequests)
  {
    long long v9 = self->_pendingMessageIdRequests;
    long long v10 = [v13 messageId];
    [(NSMutableSet *)v9 removeObject:v10];

    resultedMessagesById = self->_resultedMessagesById;
    long long v12 = [v13 messageId];
    [(NSMutableDictionary *)resultedMessagesById setObject:v13 forKeyedSubscript:v12];

    self->_resultIncludesProtectedMessages |= a4;
  }
}

- (BOOL)isRequestCompleted
{
  return [(NSMutableSet *)self->_pendingMessageIdRequests count] == 0;
}

- (id)results
{
  return [(MFNanoServerFullMessageLoaderBatchRequest *)self resultedMessagesById];
}

- (BOOL)resultIncludesProtectedMessages
{
  return self->_resultIncludesProtectedMessages;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (NSMutableOrderedSet)outstandingMessageIdRequests
{
  return self->_outstandingMessageIdRequests;
}

- (void)setOutstandingMessageIdRequests:(id)a3
{
}

- (NSMutableSet)pendingMessageIdRequests
{
  return self->_pendingMessageIdRequests;
}

- (void)setPendingMessageIdRequests:(id)a3
{
}

- (NSMutableDictionary)resultedMessagesById
{
  return self->_resultedMessagesById;
}

- (void)setResultedMessagesById:(id)a3
{
}

- (void)setResultIncludesProtectedMessages:(BOOL)a3
{
  self->_resultIncludesProtectedMessages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultedMessagesById, 0);
  objc_storeStrong((id *)&self->_pendingMessageIdRequests, 0);
  objc_storeStrong((id *)&self->_outstandingMessageIdRequests, 0);

  objc_storeStrong(&self->_completionBlock, 0);
}

@end