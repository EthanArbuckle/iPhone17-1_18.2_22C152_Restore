@interface CFXReviewControlsViewController
- (CFXReviewControlsViewController)init;
@end

@implementation CFXReviewControlsViewController

- (CFXReviewControlsViewController)init
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = (void *)MEMORY[0x263F1C9E8];
  v6 = [MEMORY[0x263F086E0] jfxBundle];
  v7 = [v5 storyboardWithName:v4 bundle:v6];

  v8 = [v7 instantiateViewControllerWithIdentifier:v4];

  return v8;
}

@end