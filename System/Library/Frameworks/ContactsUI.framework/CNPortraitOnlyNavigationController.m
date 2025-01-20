@interface CNPortraitOnlyNavigationController
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation CNPortraitOnlyNavigationController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

@end