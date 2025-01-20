@interface CalCancellationTokenSource
- (BOOL)isCancelled;
- (void)cancel;
@end

@implementation CalCancellationTokenSource

- (void)cancel
{
}

- (BOOL)isCancelled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isCancelled);
  return v2 & 1;
}

@end