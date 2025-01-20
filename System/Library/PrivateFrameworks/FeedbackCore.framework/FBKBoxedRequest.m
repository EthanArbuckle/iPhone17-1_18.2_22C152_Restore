@interface FBKBoxedRequest
- (FBKBoxedRequest)initWithRequest:(id)a3 successBlock:(id)a4 errorBlock:(id)a5;
- (NSURLRequest)request;
- (id)errorBlock;
- (id)successBlock;
- (void)setErrorBlock:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSuccessBlock:(id)a3;
@end

@implementation FBKBoxedRequest

- (FBKBoxedRequest)initWithRequest:(id)a3 successBlock:(id)a4 errorBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FBKBoxedRequest;
  v12 = [(FBKBoxedRequest *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    v14 = _Block_copy(v10);
    id successBlock = v13->_successBlock;
    v13->_id successBlock = v14;

    v16 = _Block_copy(v11);
    id errorBlock = v13->_errorBlock;
    v13->_id errorBlock = v16;
  }
  return v13;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (id)successBlock
{
  return self->_successBlock;
}

- (void)setSuccessBlock:(id)a3
{
}

- (id)errorBlock
{
  return self->_errorBlock;
}

- (void)setErrorBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorBlock, 0);
  objc_storeStrong(&self->_successBlock, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end