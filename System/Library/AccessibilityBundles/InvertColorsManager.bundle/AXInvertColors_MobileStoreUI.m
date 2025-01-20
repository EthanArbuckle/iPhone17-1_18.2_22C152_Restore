@interface AXInvertColors_MobileStoreUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_MobileStoreUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIBannerView", @"layoutSubviews", "v", 0);
  [v3 validateClass:@"SUUIBannerView" hasInstanceVariable:@"_iconImageView" withType:"UIImageView"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"SUUIImageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SUUIBannerViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end