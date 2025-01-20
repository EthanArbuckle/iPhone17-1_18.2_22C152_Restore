@interface UIViewController(PopoverSizeClassSupport)
- (id)_gkSourcePresentingViewController;
- (uint64_t)_gkRepresentedObject;
- (uint64_t)_gkShouldPushViewControllerInsteadOfUsingPopoverOnCompactWidthPad;
- (uint64_t)_gkViewControllersForRestoringPopover;
- (void)_gkSetSourcePresentingViewController:()PopoverSizeClassSupport;
@end

@implementation UIViewController(PopoverSizeClassSupport)

- (id)_gkSourcePresentingViewController
{
  return objc_getAssociatedObject(a1, "gkSourcePresentingViewControllerKey");
}

- (void)_gkSetSourcePresentingViewController:()PopoverSizeClassSupport
{
}

- (uint64_t)_gkViewControllersForRestoringPopover
{
  return 0;
}

- (uint64_t)_gkRepresentedObject
{
  return 0;
}

- (uint64_t)_gkShouldPushViewControllerInsteadOfUsingPopoverOnCompactWidthPad
{
  return 1;
}

@end