@interface AMSMetricsFlushOperation
- (AMSMetricsFlushOperation)initWithStrategy:(id)a3 promise:(id)a4;
- (AMSMetricsFlushStrategy)strategy;
- (AMSMutablePromise)promise;
@end

@implementation AMSMetricsFlushOperation

- (AMSMetricsFlushOperation)initWithStrategy:(id)a3 promise:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSMetricsFlushOperation;
  v9 = [(AMSMetricsOperation *)&v12 _init];
  v10 = (AMSMetricsFlushOperation *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong((id *)&v10->_promise, a4);
  }

  return v10;
}

- (AMSMetricsFlushStrategy)strategy
{
  return self->_strategy;
}

- (AMSMutablePromise)promise
{
  return self->_promise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
}

@end