@interface AXUIDaemonNonInteractiveWindow
- (BOOL)_ignoresHitTest;
@end

@implementation AXUIDaemonNonInteractiveWindow

- (BOOL)_ignoresHitTest
{
  return 1;
}

@end