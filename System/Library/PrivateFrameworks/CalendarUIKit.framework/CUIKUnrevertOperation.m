@interface CUIKUnrevertOperation
- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4;
- (Class)_inverseOperationClass;
@end

@implementation CUIKUnrevertOperation

- (Class)_inverseOperationClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  return 0;
}

@end