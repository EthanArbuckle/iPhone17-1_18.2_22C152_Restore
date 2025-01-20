@interface StoreCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation StoreCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.StoreCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)StoreCollectionViewControllerAccessibility;
  [(StoreCollectionViewControllerAccessibility *)&v3 loadView];
  [(StoreCollectionViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)StoreCollectionViewControllerAccessibility;
  [(StoreCollectionViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  objc_super v3 = [(StoreCollectionViewControllerAccessibility *)self safeValueForKey:@"_collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  if (_AXSAutomationEnabled() && !UIAccessibilityIsVoiceOverRunning())
  {
    [v4 setIsAccessibilityElement:0];
    [v4 setAccessibilityElements:0];
  }
}

@end