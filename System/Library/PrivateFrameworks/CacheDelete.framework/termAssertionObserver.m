@interface termAssertionObserver
- (OS_dispatch_semaphore)completionSem;
- (void)assertionTargetProcessDidExit:(id)a3;
- (void)setCompletionSem:(id)a3;
@end

@implementation termAssertionObserver

- (void)assertionTargetProcessDidExit:(id)a3
{
  v4 = [(termAssertionObserver *)self completionSem];

  if (v4)
  {
    v5 = [(termAssertionObserver *)self completionSem];
    dispatch_semaphore_signal(v5);
  }
}

- (OS_dispatch_semaphore)completionSem
{
  return self->_completionSem;
}

- (void)setCompletionSem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end