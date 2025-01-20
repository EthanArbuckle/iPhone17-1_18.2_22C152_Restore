@interface AEExplorerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_handleAttemptedSelectionToggleOfAssetReference:(id)a3 cancelIfAlreadySelected:(BOOL)a4 suppressLivePhotoContent:(BOOL)a5;
@end

@implementation AEExplorerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AEExplorerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AEExplorerViewController", @"_scrollViewController", "@", 0);
  [v3 validateClass:@"PXScrollViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXScrollViewController", @"scrollView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AEExplorerViewController", @"_handleAttemptedSelectionToggleOfAssetReference: cancelIfAlreadySelected: suppressLivePhotoContent:", "v", "@", "B", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)AEExplorerViewControllerAccessibility;
  [(AEExplorerViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AEExplorerViewControllerAccessibility *)self safeValueForKey:@"_scrollViewController"];
  MEMORY[0x2455E12E0](@"PXScrollViewController");
  if (objc_opt_isKindOfClass())
  {
    [v3 accessibilitySetIdentification:@"AXExplorerViewControllerScrollViewController"];
    v4 = [v3 safeValueForKey:@"scrollView"];
    [v4 setAccessibilityIdentifier:@"AXExplorerViewControllerScrollView"];
  }
}

- (void)_handleAttemptedSelectionToggleOfAssetReference:(id)a3 cancelIfAlreadySelected:(BOOL)a4 suppressLivePhotoContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AEExplorerViewControllerAccessibility;
  [(AEExplorerViewControllerAccessibility *)&v10 _handleAttemptedSelectionToggleOfAssetReference:v8 cancelIfAlreadySelected:v6 suppressLivePhotoContent:v5];
  v9 = [v8 safeValueForKey:@"asset"];

  if (v9) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

@end