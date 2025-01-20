@interface DKRequestContext
- (BOOL)completionHandlerExecuted;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setCompletionHandlerExecuted:(BOOL)a3;
@end

@implementation DKRequestContext

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (BOOL)completionHandlerExecuted
{
  return self->_completionHandlerExecuted;
}

- (void)setCompletionHandlerExecuted:(BOOL)a3
{
  self->_completionHandlerExecuted = a3;
}

- (void).cxx_destruct
{
}

@end