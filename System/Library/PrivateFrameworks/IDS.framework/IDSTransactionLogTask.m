@interface IDSTransactionLogTask
- (id)completionBlock;
- (void)_completeWithError:(id)a3;
- (void)setCompletionBlock:(id)a3;
@end

@implementation IDSTransactionLogTask

- (void)_completeWithError:(id)a3
{
  id v6 = a3;
  v4 = [(IDSTransactionLogTask *)self completionBlock];

  if (v4)
  {
    v5 = [(IDSTransactionLogTask *)self completionBlock];
    ((void (**)(void, id))v5)[2](v5, v6);

    [(IDSTransactionLogTask *)self setCompletionBlock:0];
  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end