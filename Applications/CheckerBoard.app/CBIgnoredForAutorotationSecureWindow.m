@interface CBIgnoredForAutorotationSecureWindow
- (BOOL)_shouldControlAutorotation;
@end

@implementation CBIgnoredForAutorotationSecureWindow

- (BOOL)_shouldControlAutorotation
{
  return 0;
}

@end