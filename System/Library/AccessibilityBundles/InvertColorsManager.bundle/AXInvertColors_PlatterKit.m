@interface AXInvertColors_PlatterKit
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_PlatterKit

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PLPlatterHeaderContentView" hasInstanceVariable:@"_iconButtons" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPlatterHeaderContentView", @"_configureIconButtonsForIcons:", "v", "@", 0);
  [v3 validateClass:@"PLPlatterView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPlatterView", @"materialRecipe", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPlatterView", @"backgroundMaterialView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTMaterialView", @"_materialLayer", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"PLPlatterHeaderContentViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PLPlatterViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end