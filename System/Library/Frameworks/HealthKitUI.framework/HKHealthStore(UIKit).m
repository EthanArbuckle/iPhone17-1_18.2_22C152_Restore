@interface HKHealthStore(UIKit)
- (uint64_t)authorizationViewControllerPresenter;
- (void)setAuthorizationViewControllerPresenter:()UIKit;
@end

@implementation HKHealthStore(UIKit)

- (void)setAuthorizationViewControllerPresenter:()UIKit
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_msgSend(a1, "set_hkui_authorizationViewControllerPresenter:", v4);
}

- (uint64_t)authorizationViewControllerPresenter
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);

  return objc_msgSend(a1, "_hkui_authorizationViewControllerPresenter");
}

@end