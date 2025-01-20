@interface MRUIApplication
- (BOOL)_supportsAlwaysOnDisplay;
@end

@implementation MRUIApplication

- (BOOL)_supportsAlwaysOnDisplay
{
  return 1;
}

@end