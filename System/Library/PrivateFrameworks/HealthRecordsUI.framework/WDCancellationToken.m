@interface WDCancellationToken
- (BOOL)isCancelled;
- (void)cancel;
- (void)setCancelled:(BOOL)a3;
@end

@implementation WDCancellationToken

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void)cancel
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(WDCancellationToken *)self setCancelled:1];
}

@end