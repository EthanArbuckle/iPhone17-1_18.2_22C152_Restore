@interface _EMRemoteContentDataTaskInfo
- (BOOL)didCollectMetrics;
- (BOOL)didComplete;
- (BOOL)failOpen;
- (BOOL)isSynthetic;
- (NSData)data;
- (NSString)debugDescription;
- (NSURLSessionDataTask)dataTask;
- (_EMRemoteContentDataTaskInfo)initWithDataTask:(id)a3 isSynthetic:(BOOL)a4 failOpen:(BOOL)a5 completion:(id)a6;
- (id)completion;
- (void)cancel;
- (void)finishWithError:(id)a3;
- (void)receiveData:(id)a3;
- (void)setDidCollectMetrics:(BOOL)a3;
- (void)setDidComplete:(BOOL)a3;
@end

@implementation _EMRemoteContentDataTaskInfo

- (_EMRemoteContentDataTaskInfo)initWithDataTask:(id)a3 isSynthetic:(BOOL)a4 failOpen:(BOOL)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_EMRemoteContentDataTaskInfo;
  v13 = [(_EMRemoteContentDataTaskInfo *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_dataTask, a3);
    uint64_t v15 = [v12 copy];
    id completion = v14->_completion;
    v14->_id completion = (id)v15;

    v14->_isSynthetic = a4;
    v14->_failOpen = a5;
  }

  return v14;
}

- (NSString)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = @" (synthetic)";
  if (!self->_isSynthetic) {
    v5 = &stru_1F1A3DFB0;
  }
  return (NSString *)[v3 stringWithFormat:@"<%@: %@>%@ %@", v4, self, v5, self->_dataTask];
}

- (NSData)data
{
  return (NSData *)self->_data;
}

- (void)cancel
{
}

- (void)receiveData:(id)a3
{
  uint64_t v4 = a3;
  if (self->_completion)
  {
    data = self->_data;
    v8 = v4;
    if (data) {
      concat = (OS_dispatch_data *)dispatch_data_create_concat(data, v4);
    }
    else {
      concat = v4;
    }
    v7 = self->_data;
    self->_data = concat;

    uint64_t v4 = v8;
  }
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  id completion = (void (**)(id, void, void *, id))self->_completion;
  if (completion)
  {
    id v9 = v4;
    if (v4)
    {
      v6 = [(NSURLSessionDataTask *)self->_dataTask response];
      completion[2](completion, 0, v6, v9);
    }
    else
    {
      data = self->_data;
      v6 = [(NSURLSessionDataTask *)self->_dataTask response];
      ((void (**)(id, OS_dispatch_data *, void *, id))completion)[2](completion, data, v6, 0);
    }

    id v8 = self->_completion;
    self->_id completion = 0;

    id v4 = v9;
  }
}

- (NSURLSessionDataTask)dataTask
{
  return self->_dataTask;
}

- (id)completion
{
  return self->_completion;
}

- (BOOL)isSynthetic
{
  return self->_isSynthetic;
}

- (BOOL)failOpen
{
  return self->_failOpen;
}

- (BOOL)didComplete
{
  return self->_didComplete;
}

- (void)setDidComplete:(BOOL)a3
{
  self->_didComplete = a3;
}

- (BOOL)didCollectMetrics
{
  return self->_didCollectMetrics;
}

- (void)setDidCollectMetrics:(BOOL)a3
{
  self->_didCollectMetrics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end