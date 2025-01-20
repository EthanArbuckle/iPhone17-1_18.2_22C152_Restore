@interface UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet

+ (id)safeCategoryTargetClassName
{
  return @"UIActivityGroupViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UICollectionViewController";
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v6 = @"UIViewController";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v5 = @"UIActivityGroupViewController";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:v5 isKindOfClass:v6];
  objc_storeStrong(v8, v7);
}

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet;
  [(UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet *)&v2 viewDidLoad];
  [(UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet *)v4 _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet;
  [(UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet *)&v5 _accessibilityLoadAccessibilityInformation];
  id v4 = (id)[(UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet *)v7 safeValueForKey:@"collectionView"];
  [v4 setAccessibilityShouldSpeakItemReorderEvents:1];
  id v2 = v4;
  id v3 = (id)[(UIActivityGroupViewControllerAccessibility__UIKit__ShareSheet *)v7 safeValueForKey:@"title"];
  objc_msgSend(v2, "setAccessibilityIdentifier:");

  objc_storeStrong(&v4, 0);
}

@end