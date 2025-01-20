@interface AXInvertColors_iTunesStoreUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_iTunesStoreUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUNavigationController" isKindOfClass:@"UINavigationController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"viewWillLayoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITabBarController", @"tabBar", "@", 0);
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 1;
}

@end