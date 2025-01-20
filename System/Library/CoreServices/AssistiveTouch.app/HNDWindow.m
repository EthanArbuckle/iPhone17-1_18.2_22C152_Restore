@interface HNDWindow
- (BOOL)_accessibilityIsIsolatedWindow;
- (BOOL)_allowsOcclusionDetectionOverride;
@end

@implementation HNDWindow

- (BOOL)_accessibilityIsIsolatedWindow
{
  return 1;
}

- (BOOL)_allowsOcclusionDetectionOverride
{
  return 1;
}

@end