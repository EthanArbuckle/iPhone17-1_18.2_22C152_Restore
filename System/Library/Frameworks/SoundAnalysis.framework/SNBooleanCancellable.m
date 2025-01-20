@interface SNBooleanCancellable
- (BOOL)isCancelled;
- (SNBooleanCancellable)init;
- (void)cancel;
- (void)setIsCancelled:(BOOL)a3;
@end

@implementation SNBooleanCancellable

- (BOOL)isCancelled
{
  return sub_1DCAB6498() & 1;
}

- (void)setIsCancelled:(BOOL)a3
{
}

- (SNBooleanCancellable)init
{
  return (SNBooleanCancellable *)sub_1DCAB64E0();
}

- (void)cancel
{
}

@end