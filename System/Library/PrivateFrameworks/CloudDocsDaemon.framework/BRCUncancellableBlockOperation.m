@interface BRCUncancellableBlockOperation
- (BOOL)isCancelled;
@end

@implementation BRCUncancellableBlockOperation

- (BOOL)isCancelled
{
  return 0;
}

@end