@interface UIViewController
- (BOOL)requiresNativeFocus;
@end

@implementation UIViewController

- (BOOL)requiresNativeFocus
{
  return 0;
}

@end