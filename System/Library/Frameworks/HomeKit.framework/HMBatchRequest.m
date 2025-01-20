@interface HMBatchRequest
+ (BOOL)validateRequestTypes:(id)a3 requestClass:(Class)a4;
+ (id)batchRequestWithExecuteRequests:(id)a3;
+ (id)batchRequestWithReadRequests:(id)a3;
+ (id)batchRequestWithWriteRequests:(id)a3;
- (HMBatchRequest)initWithRequests:(id)a3 requestClass:(Class)a4;
- (HMClientContext)clientContext;
- (HMReportContext)reportContext;
- (NSArray)requests;
- (id)completionHandler;
- (id)progressHandler;
- (void)setClientContext:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setReportContext:(id)a3;
- (void)setRequests:(id)a3;
@end

@implementation HMBatchRequest

- (NSArray)requests
{
  return self->_requests;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (HMReportContext)reportContext
{
  return self->_reportContext;
}

- (HMClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setProgressHandler:(id)a3
{
}

- (void)setCompletionHandler:(id)a3
{
}

+ (id)batchRequestWithReadRequests:(id)a3
{
  id v3 = a3;
  v4 = [[HMBatchRequest alloc] initWithRequests:v3 requestClass:objc_opt_class()];

  return v4;
}

- (HMBatchRequest)initWithRequests:(id)a3 requestClass:(Class)a4
{
  id v6 = a3;
  if (+[HMBatchRequest validateRequestTypes:v6 requestClass:a4])
  {
    v12.receiver = self;
    v12.super_class = (Class)HMBatchRequest;
    v7 = [(HMBatchRequest *)&v12 init];
    if (v7)
    {
      uint64_t v8 = [v6 copy];
      requests = v7->_requests;
      v7->_requests = (NSArray *)v8;
    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)validateRequestTypes:(id)a3 requestClass:(Class)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            BOOL v10 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v10 = 1;
LABEL_12:
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_reportContext, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);

  objc_storeStrong((id *)&self->_requests, 0);
}

- (void)setRequests:(id)a3
{
}

- (void)setReportContext:(id)a3
{
  id v4 = (HMReportContext *)[a3 copy];
  reportContext = self->_reportContext;
  self->_reportContext = v4;

  MEMORY[0x1F41817F8](v4, reportContext);
}

- (void)setClientContext:(id)a3
{
  id v4 = (HMClientContext *)[a3 copy];
  clientContext = self->_clientContext;
  self->_clientContext = v4;

  MEMORY[0x1F41817F8](v4, clientContext);
}

+ (id)batchRequestWithExecuteRequests:(id)a3
{
  id v3 = a3;
  id v4 = [[HMBatchRequest alloc] initWithRequests:v3 requestClass:objc_opt_class()];

  return v4;
}

+ (id)batchRequestWithWriteRequests:(id)a3
{
  id v3 = a3;
  id v4 = [[HMBatchRequest alloc] initWithRequests:v3 requestClass:objc_opt_class()];

  return v4;
}

@end