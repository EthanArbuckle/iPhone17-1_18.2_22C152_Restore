@interface AXInvertColors_ScreenTimeSettingsUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_ScreenTimeSettingsUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STMostUsedCell" hasInstanceVariable:@"_allowanceIconView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STMostUsedCell", @"initWithStyle:reuseIdentifier:specifier:", "@", "q", "@", "@", 0);
  [v3 validateClass:@"STAppStoreIconCell" hasInstanceVariable:@"_appIconView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STAppStoreIconCell", @"initWithStyle:reuseIdentifier:specifier:", "@", "q", "@", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"STMostUsedCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"STAppStoreIconCellInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end