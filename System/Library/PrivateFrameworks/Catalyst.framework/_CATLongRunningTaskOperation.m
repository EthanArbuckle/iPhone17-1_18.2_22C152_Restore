@interface _CATLongRunningTaskOperation
- (BOOL)isAsynchronous;
- (void)cancel;
@end

@implementation _CATLongRunningTaskOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)_CATLongRunningTaskOperation;
  [(_CATLongRunningTaskOperation *)&v4 cancel];
  v3 = CATErrorWithCodeAndUserInfo(404, 0);
  [(CATOperation *)self endOperationWithError:v3];
}

@end