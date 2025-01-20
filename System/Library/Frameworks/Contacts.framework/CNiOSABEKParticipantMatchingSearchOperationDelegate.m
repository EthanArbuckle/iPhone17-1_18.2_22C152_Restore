@interface CNiOSABEKParticipantMatchingSearchOperationDelegate
- (BOOL)predicateShouldContinue:(id)a3;
- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
@end

@implementation CNiOSABEKParticipantMatchingSearchOperationDelegate

- (BOOL)predicateShouldContinue:(id)a3
{
  return 1;
}

- (BOOL)predicateShouldContinue:(id)a3 afterFindingRecord:(void *)a4
{
  if (a4)
  {
    v5 = [(CNiOSABEKParticipantMatchingSearchOperationDelegate *)self completionHandler];
    ((void (**)(void, void *))v5)[2](v5, a4);
  }
  return a4 == 0;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end