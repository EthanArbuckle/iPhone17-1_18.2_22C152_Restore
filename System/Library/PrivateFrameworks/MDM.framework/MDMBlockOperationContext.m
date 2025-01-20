@interface MDMBlockOperationContext
- (MDMBlockOperation)operation;
- (void)endBlockOperation;
- (void)setOperation:(id)a3;
@end

@implementation MDMBlockOperationContext

- (void)endBlockOperation
{
  id v2 = [(MDMBlockOperationContext *)self operation];
  [v2 endOperationWithResultObject:0];
}

- (MDMBlockOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end