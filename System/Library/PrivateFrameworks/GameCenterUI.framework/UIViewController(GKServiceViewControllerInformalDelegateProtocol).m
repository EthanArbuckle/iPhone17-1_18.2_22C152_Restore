@interface UIViewController(GKServiceViewControllerInformalDelegateProtocol)
- (uint64_t)_gkServiceWantsCustomRightBarButtonItemInViewService;
@end

@implementation UIViewController(GKServiceViewControllerInformalDelegateProtocol)

- (uint64_t)_gkServiceWantsCustomRightBarButtonItemInViewService
{
  return 0;
}

@end