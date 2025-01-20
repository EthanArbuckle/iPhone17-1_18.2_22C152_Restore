@interface AKURLDataTask
- (BOOL)canceledOrCompleted;
- (NSError)lastRetryError;
- (NSMutableData)receivedData;
- (NSURLRequest)request;
- (NSURLSessionDataTask)underlyingTask;
- (id)completionHandler;
- (id)description;
- (unint64_t)retryCount;
- (void)_completeWithError:(id)a3;
- (void)setCanceledOrCompleted:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setLastRetryError:(id)a3;
- (void)setReceivedData:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setUnderlyingTask:(id)a3;
@end

@implementation AKURLDataTask

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  [(AKURLDataTask *)self setCanceledOrCompleted:1];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1996FE880](self->_completionHandler);
    v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AKURLDataTask _completeWithError:]();
    }

    v7 = 0;
    v8 = 0;
  }
  else
  {
    v7 = [(AKURLDataTask *)self receivedData];
    v8 = [(NSURLSessionDataTask *)self->_underlyingTask response];
    v5 = (void *)MEMORY[0x1996FE880](self->_completionHandler);
  }
  v9 = dispatch_get_global_queue(2, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __36__AKURLDataTask__completeWithError___block_invoke;
  v14[3] = &unk_1E575F3D8;
  id v15 = v7;
  id v16 = v8;
  id v17 = v4;
  id v18 = v5;
  id v10 = v4;
  id v11 = v8;
  id v12 = v7;
  id v13 = v5;
  dispatch_async(v9, v14);
}

uint64_t __36__AKURLDataTask__completeWithError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p, _underlylingTask: %@>", v5, self, self->_underlyingTask];

  return v6;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (NSURLSessionDataTask)underlyingTask
{
  return self->_underlyingTask;
}

- (void)setUnderlyingTask:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSMutableData)receivedData
{
  return self->_receivedData;
}

- (void)setReceivedData:(id)a3
{
}

- (NSError)lastRetryError
{
  return self->_lastRetryError;
}

- (void)setLastRetryError:(id)a3
{
}

- (BOOL)canceledOrCompleted
{
  return self->_canceledOrCompleted;
}

- (void)setCanceledOrCompleted:(BOOL)a3
{
  self->_canceledOrCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRetryError, 0);
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_underlyingTask, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)_completeWithError:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_6_0(&dword_193494000, v1, (uint64_t)v1, "%{public}@ completed with error:%@", v2);
}

@end