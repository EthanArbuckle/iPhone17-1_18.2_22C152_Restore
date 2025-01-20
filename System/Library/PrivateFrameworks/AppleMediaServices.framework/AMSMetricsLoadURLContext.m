@interface AMSMetricsLoadURLContext
- (AMSBagProtocol)bag;
- (AMSMetricsLoadURLContext)initWithTask:(id)a3 metrics:(id)a4;
- (AMSMetricsLoadURLContext)initWithTaskInfo:(id)a3 serverPayload:(id)a4;
- (AMSProcessInfo)processInfo;
- (AMSURLRequestProperties)properties;
- (NSData)responseBody;
- (NSDictionary)decodedResponseBody;
- (NSDictionary)metricsOverlay;
- (NSError)error;
- (NSURLSession)session;
- (NSURLSessionTask)task;
- (NSURLSessionTaskMetrics)taskMetrics;
- (id)bagContract;
- (id)metricsDictionaryPromise;
- (void)setBag:(id)a3;
- (void)setBagContract:(id)a3;
- (void)setDecodedResponseBody:(id)a3;
- (void)setError:(id)a3;
- (void)setProcessInfo:(id)a3;
- (void)setProperties:(id)a3;
- (void)setResponseBody:(id)a3;
- (void)setSession:(id)a3;
- (void)setTask:(id)a3;
- (void)setTaskMetrics:(id)a3;
@end

@implementation AMSMetricsLoadURLContext

- (NSURLSessionTask)task
{
  return self->_task;
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSURLSessionTaskMetrics)taskMetrics
{
  return self->_taskMetrics;
}

- (NSError)error
{
  return self->_error;
}

- (AMSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (id)metricsDictionaryPromise
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSMetricsLoadURLContext *)self task];
  v4 = [v3 originalRequest];
  if (objc_msgSend(v4, "ams_requestIsBagLoad"))
  {
    v5 = [(AMSMetricsLoadURLContext *)self decodedResponseBody];

    if (v5)
    {
      v6 = [(AMSMetricsLoadURLContext *)self decodedResponseBody];
      v7 = +[AMSBagNetworkTask _bagDataByApplyingOverridesToBagData:v6];

      v8 = [v7 objectForKeyedSubscript:@"metrics"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;

        if (v9)
        {
          v10 = +[AMSPromise promiseWithResult:v9];
LABEL_16:

          goto LABEL_25;
        }
      }
      else
      {
      }
      v16 = AMSError(204, @"Metrics dictionary missing", @"The metrics dictionary is not present in the bag", 0);
      v10 = +[AMSPromise promiseWithError:v16];

      id v9 = 0;
      goto LABEL_16;
    }
  }
  else
  {
  }
  v11 = [(AMSMetricsLoadURLContext *)self bag];

  if (v11)
  {
    v12 = [(AMSMetricsLoadURLContext *)self bag];
    v7 = [v12 dictionaryForKey:@"metrics"];
    goto LABEL_9;
  }
  v14 = [(AMSMetricsLoadURLContext *)self bagContract];

  if (!v14)
  {
    v12 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v12)
    {
      v12 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v12 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138543362;
      uint64_t v20 = objc_opt_class();
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load metrics dictionary from bag", (uint8_t *)&v19, 0xCu);
    }

    goto LABEL_22;
  }
  v12 = [(AMSMetricsLoadURLContext *)self bagContract];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_22:

    goto LABEL_23;
  }
  v15 = [(AMSMetricsLoadURLContext *)self bagContract];
  v7 = [v15 metricsDictionary];

LABEL_9:
  if (!v7)
  {
LABEL_23:
    v7 = AMSError(204, @"Metrics dictionary missing", @"The metrics dictionary is not present in the bag", 0);
    uint64_t v13 = +[AMSPromise promiseWithError:v7];
    goto LABEL_24;
  }
  uint64_t v13 = [v7 valuePromise];
LABEL_24:
  v10 = (void *)v13;
LABEL_25:

  return v10;
}

- (id)bagContract
{
  v3 = [AMSDeprecatedBagContract alloc];
  v4 = [(AMSMetricsLoadURLContext *)self bag];
  v5 = [(AMSDeprecatedBagContract *)v3 initWithBag:v4];

  return v5;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSDictionary)decodedResponseBody
{
  return self->_decodedResponseBody;
}

- (AMSMetricsLoadURLContext)initWithTaskInfo:(id)a3 serverPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 task];
  id v9 = [v6 metrics];
  v10 = [(AMSMetricsLoadURLContext *)self initWithTask:v8 metrics:v9];

  if (v10)
  {
    v11 = [v6 properties];
    uint64_t v12 = [v11 bag];
    bag = v10->_bag;
    v10->_bag = (AMSBagProtocol *)v12;

    objc_storeStrong((id *)&v10->_decodedResponseBody, a4);
    uint64_t v14 = [v6 error];
    error = v10->_error;
    v10->_error = (NSError *)v14;

    v16 = [v6 properties];
    uint64_t v17 = [v16 clientInfo];
    processInfo = v10->_processInfo;
    v10->_processInfo = (AMSProcessInfo *)v17;

    uint64_t v19 = [v6 properties];
    properties = v10->_properties;
    v10->_properties = (AMSURLRequestProperties *)v19;

    uint64_t v21 = [v6 data];
    responseBody = v10->_responseBody;
    v10->_responseBody = (NSData *)v21;

    v23 = [v6 session];
    uint64_t v24 = [v23 session];
    session = v10->_session;
    v10->_session = (NSURLSession *)v24;

    v26 = [v6 properties];
    v27 = [v26 purchaseInfo];

    v28 = [v27 purchase];
    v29 = [v28 metricsOverlay];
    uint64_t v30 = [v29 copy];
    metricsOverlay = v10->_metricsOverlay;
    v10->_metricsOverlay = (NSDictionary *)v30;
  }
  return v10;
}

- (AMSMetricsLoadURLContext)initWithTask:(id)a3 metrics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSMetricsLoadURLContext;
  id v9 = [(AMSMetricsLoadURLContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_task, a3);
    objc_storeStrong((id *)&v10->_taskMetrics, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_decodedResponseBody, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

- (AMSURLRequestProperties)properties
{
  return self->_properties;
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setBagContract:(id)a3
{
  id v4 = a3;
  v5 = [[AMSContractBagShim alloc] initWithBagContract:v4];

  [(AMSMetricsLoadURLContext *)self setBag:v5];
}

- (void)setBag:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (void)setProcessInfo:(id)a3
{
}

- (NSData)responseBody
{
  return self->_responseBody;
}

- (void)setResponseBody:(id)a3
{
}

- (void)setSession:(id)a3
{
}

- (void)setTask:(id)a3
{
}

- (void)setTaskMetrics:(id)a3
{
}

- (void)setDecodedResponseBody:(id)a3
{
}

- (void)setProperties:(id)a3
{
}

@end