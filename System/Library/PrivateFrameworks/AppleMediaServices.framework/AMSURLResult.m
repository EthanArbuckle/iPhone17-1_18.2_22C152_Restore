@interface AMSURLResult
+ (id)URLResultPromiseWithTaskInfo:(id)a3 object:(id)a4;
- (AMSURLResult)initWithResult:(id)a3;
- (AMSURLResult)initWithTask:(id)a3 response:(id)a4 data:(id)a5 object:(id)a6;
- (AMSURLResult)initWithTask:(id)a3 response:(id)a4 data:(id)a5 object:(id)a6 logUUID:(id)a7 taskMetrics:(id)a8 loadURLEventDictionary:(id)a9;
- (AMSURLResult)initWithTaskInfo:(id)a3 object:(id)a4 loadURLEventDictionary:(id)a5;
- (NSData)data;
- (NSDictionary)loadURLEventDictionary;
- (NSDictionary)responseHeaders;
- (NSString)logUUID;
- (NSString)responseCorrelationId;
- (NSURLResponse)response;
- (NSURLSessionTask)task;
- (NSURLSessionTaskMetrics)taskMetrics;
- (id)object;
- (int64_t)responseStatusCode;
- (void)setData:(id)a3;
- (void)setLogUUID:(id)a3;
- (void)setObject:(id)a3;
- (void)setResponse:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation AMSURLResult

- (NSDictionary)responseHeaders
{
  v2 = [(AMSURLResult *)self response];
  v3 = objc_msgSend(v2, "ams_allHeaderFields");

  return (NSDictionary *)v3;
}

+ (id)URLResultPromiseWithTaskInfo:(id)a3 object:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  v9 = [v6 properties];
  v10 = [v9 purchaseInfo];

  if (v10)
  {
    v11 = [v6 createMetricsContextForDecodedObject:v7];
    v12 = +[AMSMetricsLoadURLEvent loadURLEventPromiseWithContext:v11];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__AMSURLResult_URLResultPromiseWithTaskInfo_object___block_invoke;
    v15[3] = &unk_1E55A7B48;
    id v19 = a1;
    id v16 = v6;
    id v17 = v8;
    id v18 = v7;
    [v12 addFinishBlock:v15];
  }
  else
  {
    v13 = (void *)[objc_alloc((Class)a1) initWithTaskInfo:v6 object:v7 loadURLEventDictionary:0];
    [v8 finishWithResult:v13];
  }
  return v8;
}

- (AMSURLResult)initWithTaskInfo:(id)a3 object:(id)a4 loadURLEventDictionary:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 task];
  v12 = [v10 response];
  v13 = [v10 data];
  v14 = [v10 properties];
  v15 = [v14 logUUID];
  id v16 = [v10 metrics];

  id v17 = [(AMSURLResult *)self initWithTask:v11 response:v12 data:v13 object:v9 logUUID:v15 taskMetrics:v16 loadURLEventDictionary:v8];
  return v17;
}

- (AMSURLResult)initWithTask:(id)a3 response:(id)a4 data:(id)a5 object:(id)a6 logUUID:(id)a7 taskMetrics:(id)a8 loadURLEventDictionary:(id)a9
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v30.receiver = self;
  v30.super_class = (Class)AMSURLResult;
  id v19 = [(AMSURLResult *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_task, a3);
    objc_storeStrong((id *)&v20->_response, a4);
    objc_storeStrong((id *)&v20->_data, a5);
    objc_storeStrong(&v20->_object, a6);
    uint64_t v21 = objc_msgSend(v16, "copy", v26, v27, v28, v29);
    logUUID = v20->_logUUID;
    v20->_logUUID = (NSString *)v21;

    objc_storeStrong((id *)&v20->_taskMetrics, a8);
    uint64_t v23 = [v18 copy];
    loadURLEventDictionary = v20->_loadURLEventDictionary;
    v20->_loadURLEventDictionary = (NSDictionary *)v23;
  }
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_logUUID, 0);
  objc_storeStrong((id *)&self->_loadURLEventDictionary, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (NSString)responseCorrelationId
{
  v2 = [(AMSURLResult *)self response];
  v3 = objc_msgSend(v2, "ams_valueForHTTPHeaderField:", @"X-Apple-Jingle-Correlation-Key");

  return (NSString *)v3;
}

- (int64_t)responseStatusCode
{
  v2 = [(AMSURLResult *)self response];
  int64_t v3 = objc_msgSend(v2, "ams_statusCode");

  return v3;
}

- (AMSURLResult)initWithResult:(id)a3
{
  id v4 = a3;
  v5 = [v4 task];
  id v6 = [v4 response];
  id v7 = [v4 data];
  id v8 = [v4 object];
  id v9 = [v4 logUUID];
  id v10 = [v4 taskMetrics];
  v11 = [v4 loadURLEventDictionary];

  v12 = [(AMSURLResult *)self initWithTask:v5 response:v6 data:v7 object:v8 logUUID:v9 taskMetrics:v10 loadURLEventDictionary:v11];
  return v12;
}

- (NSData)data
{
  return self->_data;
}

- (NSURLSessionTaskMetrics)taskMetrics
{
  return self->_taskMetrics;
}

- (NSString)logUUID
{
  return self->_logUUID;
}

- (NSDictionary)loadURLEventDictionary
{
  return self->_loadURLEventDictionary;
}

- (NSURLResponse)response
{
  return self->_response;
}

- (id)object
{
  return self->_object;
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (void)setData:(id)a3
{
}

void __52__AMSURLResult_URLResultPromiseWithTaskInfo_object___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = [*(id *)(a1 + 32) properties];
      v11 = [v10 logUUID];
      v12 = AMSLogableError(v6);
      int v19 = 138543874;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      v22 = v11;
      __int16 v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create Load URL event. %{public}@", (uint8_t *)&v19, 0x20u);
    }
  }
  v13 = *(void **)(a1 + 40);
  id v14 = objc_alloc(*(Class *)(a1 + 56));
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 48);
  id v17 = [v5 dictionaryForPosting];
  id v18 = (void *)[v14 initWithTaskInfo:v15 object:v16 loadURLEventDictionary:v17];
  [v13 finishWithResult:v18];
}

- (AMSURLResult)initWithTask:(id)a3 response:(id)a4 data:(id)a5 object:(id)a6
{
  return [(AMSURLResult *)self initWithTask:a3 response:a4 data:a5 object:a6 logUUID:0 taskMetrics:0 loadURLEventDictionary:0];
}

- (void)setLogUUID:(id)a3
{
}

- (void)setResponse:(id)a3
{
}

- (void)setTask:(id)a3
{
}

- (void)setObject:(id)a3
{
}

@end