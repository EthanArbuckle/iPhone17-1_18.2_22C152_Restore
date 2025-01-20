@interface AAUIRemotePage
- (BOOL)canBeShownFromSuspendedState;
@end

@implementation AAUIRemotePage

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

@end