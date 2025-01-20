@interface AXUIPassiveWindow
- (BOOL)_allowsOcclusionDetectionOverride;
- (BOOL)_ignoresHitTest;
- (BOOL)accessibilityElementsHidden;
@end

@implementation AXUIPassiveWindow

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

- (BOOL)_ignoresHitTest
{
  return 1;
}

- (BOOL)_allowsOcclusionDetectionOverride
{
  return 1;
}

@end