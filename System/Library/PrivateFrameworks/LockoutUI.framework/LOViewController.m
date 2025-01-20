@interface LOViewController
+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3;
+ (id)messageForApplicationName:(id)a3 style:(unint64_t)a4;
+ (id)messageForBundleIdentifier:(id)a3 style:(unint64_t)a4;
+ (id)messageForWebsiteURL:(id)a3;
- (LOViewController)initWithBundleIdentifier:(id)a3;
@end

@implementation LOViewController

+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F67410];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4];

  return v5;
}

- (LOViewController)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() lockoutViewControllerWithBundleIdentifier:v4];

  return v5;
}

+ (id)messageForApplicationName:(id)a3 style:(unint64_t)a4
{
  if (a4 == 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2 * (a4 != 0);
  }
  return (id)[MEMORY[0x263F67410] messageForApplicationName:a3 style:v4];
}

+ (id)messageForBundleIdentifier:(id)a3 style:(unint64_t)a4
{
  if (a4 == 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2 * (a4 != 0);
  }
  return (id)[MEMORY[0x263F67410] messageForBundleIdentifier:a3 style:v4];
}

+ (id)messageForWebsiteURL:(id)a3
{
  return (id)[MEMORY[0x263F67410] messageForWebsiteURL:a3];
}

@end