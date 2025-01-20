@interface PXCMMAssetsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_createAddButton;
@end

@implementation PXCMMAssetsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXCMMAssetsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCMMAssetsViewController", @"_createAddButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCMMTileReusableView", @"view", "@", 0);
}

- (id)_createAddButton
{
  v7.receiver = self;
  v7.super_class = (Class)PXCMMAssetsViewControllerAccessibility;
  v2 = [(PXCMMAssetsViewControllerAccessibility *)&v7 _createAddButton];
  objc_opt_class();
  id v3 = [v2 safeValueForKey:@"view"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = accessibilityPhotosUICoreLocalizedString(@"add.photo");
  [v4 setAccessibilityLabel:v5];

  return v2;
}

@end