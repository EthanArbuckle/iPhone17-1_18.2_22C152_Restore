@interface ProcessTerminator
- (void)assertionTargetProcessDidExit:(id)a3;
- (void)dealloc;
@end

@implementation ProcessTerminator

- (void)dealloc
{
  assertion = self->_assertion;
  if (assertion)
  {
    [(RBSTerminationAssertion *)assertion removeObserver:self];
    [(RBSTerminationAssertion *)self->_assertion invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)ProcessTerminator;
  [(ProcessTerminator *)&v4 dealloc];
}

- (void)assertionTargetProcessDidExit:(id)a3
{
  if ([(NSConditionLock *)self->_condition tryLockWhenCondition:0])
  {
    condition = self->_condition;
    [(NSConditionLock *)condition unlockWithCondition:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

@end