@interface NTKCCFacesViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation NTKCCFacesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCCFacesViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCCFacesViewController", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCCFacesViewController", @"editButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCCFacesViewController", @"headerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCCFacesViewController", @"collectionView", "@", 0);
  [v3 validateClass:@"NTKCCFacesViewController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v14.receiver = self;
  v14.super_class = (Class)NTKCCFacesViewControllerAccessibility;
  [(NTKCCFacesViewControllerAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NTKCCFacesViewControllerAccessibility *)self safeValueForKey:@"editButton"];
  v4 = accessibilityLocalizedCustomizationString(@"myfaces.edit.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(NTKCCFacesViewControllerAccessibility *)self safeValueForKey:@"headerView"];
  if (v5)
  {
    v6 = +[NSMutableArray array];
    v7 = [(NTKCCFacesViewControllerAccessibility *)self safeValueForKey:@"titleLabel"];
    v8 = __UIAccessibilitySafeClass();

    [v8 setAccessibilityTraits:UIAccessibilityTraitHeader];
    [v6 axSafelyAddObject:v8];
    [v6 axSafelyAddObject:v3];
    [v5 setAccessibilityElements:v6];
    [v5 setIsAccessibilityElement:0];
  }
  objc_opt_class();
  v9 = __UIAccessibilityCastAsClass();
  if (v9)
  {
    v10 = +[NSMutableArray array];
    [v10 axSafelyAddObject:v5];
    v11 = [(NTKCCFacesViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
    [v10 axSafelyAddObject:v11];

    v12 = [v9 view];
    [v12 setAccessibilityElements:v10];

    v13 = [v9 view];
    [v13 setIsAccessibilityElement:0];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCCFacesViewControllerAccessibility;
  [(NTKCCFacesViewControllerAccessibility *)&v3 viewDidLoad];
  [(NTKCCFacesViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end