@interface AXInvertColors_OnBoardingKit
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_OnBoardingKit

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"OBTintInheritingImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBBulletedListItem", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBHeaderView", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBHeaderView", @"animationView", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"OBTintInheritingImageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"OBBulletedListItemInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"OBHeaderViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end