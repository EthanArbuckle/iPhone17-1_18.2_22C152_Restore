@interface UIWindow_Custom
- (BOOL)isInternalWindow;
@end

@implementation UIWindow_Custom

- (BOOL)isInternalWindow
{
  return 1;
}

@end