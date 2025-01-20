@interface DKNavigationController
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation DKNavigationController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

@end