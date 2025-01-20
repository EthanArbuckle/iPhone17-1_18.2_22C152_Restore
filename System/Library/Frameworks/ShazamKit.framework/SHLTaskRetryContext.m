@interface SHLTaskRetryContext
- (SHLTaskOutcome)outcome;
- (SHLTaskRetryContext)initWithOutcome:(id)a3 retryBlock:(id)a4;
- (id)retryBlock;
@end

@implementation SHLTaskRetryContext

- (SHLTaskRetryContext)initWithOutcome:(id)a3 retryBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SHLTaskRetryContext;
  v9 = [(SHLTaskRetryContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outcome, a3);
    id v11 = objc_retainBlock(v8);
    id retryBlock = v10->_retryBlock;
    v10->_id retryBlock = v11;
  }
  return v10;
}

- (SHLTaskOutcome)outcome
{
  return self->_outcome;
}

- (id)retryBlock
{
  return self->_retryBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retryBlock, 0);

  objc_storeStrong((id *)&self->_outcome, 0);
}

@end