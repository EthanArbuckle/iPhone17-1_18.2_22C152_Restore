@interface ASViewControllerFactory
- (id)newNetworkLockoutViewControllerWithSection:(id)a3;
- (id)newPlaceholderViewController;
@end

@implementation ASViewControllerFactory

- (id)newNetworkLockoutViewControllerWithSection:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F89658]) initWithSection:a3];
  objc_msgSend(v3, "setLocalizationBundle:", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()));
  return v3;
}

- (id)newPlaceholderViewController
{
  id v2 = objc_alloc_init(MEMORY[0x263F89660]);
  objc_msgSend(v2, "setDefaultBackgroundGradient:", objc_msgSend(MEMORY[0x263F895F8], "gradientWithColor:", objc_msgSend(MEMORY[0x263F1C550], "systemBackgroundColor")));
  return v2;
}

@end