@interface AccessibilityInfoPanelWindow
- (BOOL)_ignoresHitTest;
@end

@implementation AccessibilityInfoPanelWindow

- (BOOL)_ignoresHitTest
{
  return 1;
}

@end