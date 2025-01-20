@interface PARTask
- (PARRequest)request;
- (PARSession)session;
- (id)completionBlock;
- (unint64_t)queryId;
- (void)resume;
- (void)setCompletionBlock:(id)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation PARTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_session);

  objc_storeStrong(&self->_completionBlock, 0);
}

- (void)setRequest:(id)a3
{
}

- (PARRequest)request
{
  return self->_request;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setSession:(id)a3
{
}

- (PARSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (PARSession *)WeakRetained;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)resume
{
  id v3 = [(PARTask *)self session];
  [v3 loadTask:self];
}

@end