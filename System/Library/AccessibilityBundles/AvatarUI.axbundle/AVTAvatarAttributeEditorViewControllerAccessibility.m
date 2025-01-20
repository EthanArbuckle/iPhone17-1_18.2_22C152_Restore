@interface AVTAvatarAttributeEditorViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation AVTAvatarAttributeEditorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTAvatarAttributeEditorViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorViewController", @"alphaAssetsLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorViewController", @"avtViewSession", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorViewController", @"attributesCollectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTViewSession", @"avtView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorViewController", @"viewDidLoad", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)AVTAvatarAttributeEditorViewControllerAccessibility;
  [(AVTAvatarAttributeEditorViewControllerAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(AVTAvatarAttributeEditorViewControllerAccessibility *)self safeValueForKey:@"alphaAssetsLabel"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setIsAccessibilityElement:0];
  v5 = [(AVTAvatarAttributeEditorViewControllerAccessibility *)self safeValueForKeyPath:@"avtViewSession.avtView"];
  v6 = accessibilityLocalizedString(@"editor.puppet");
  [v5 setAccessibilityLabel:v6];

  objc_opt_class();
  v7 = [(AVTAvatarAttributeEditorViewControllerAccessibility *)self safeValueForKey:@"attributesCollectionView"];
  v8 = __UIAccessibilityCastAsClass();

  v9 = [v8 indexPathsForVisibleItems];
  [v8 reloadItemsAtIndexPaths:v9];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarAttributeEditorViewControllerAccessibility;
  [(AVTAvatarAttributeEditorViewControllerAccessibility *)&v3 viewDidLoad];
  [(AVTAvatarAttributeEditorViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end