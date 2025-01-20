@interface FKAAlertController
- (BOOL)requiresNativeFocus;
@end

@implementation FKAAlertController

- (BOOL)requiresNativeFocus
{
  return 1;
}

@end