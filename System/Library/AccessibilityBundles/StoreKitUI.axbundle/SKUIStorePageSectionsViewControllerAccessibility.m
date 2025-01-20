@interface SKUIStorePageSectionsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation SKUIStorePageSectionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIStorePageSectionsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIStorePageSectionsViewController", @"loadView", "v", 0);
  [v3 validateClass:@"SKUIStorePageSectionsViewController" hasInstanceVariable:@"_collectionView" withType:"SKUICollectionView"];
  [v3 validateClass:@"UIViewController" hasInstanceVariable:@"_title" withType:"NSString"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIStorePageSectionsViewControllerAccessibility;
  [(SKUIStorePageSectionsViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SKUIStorePageSectionsViewControllerAccessibility *)self safeValueForKey:@"_collectionView"];
  objc_opt_class();
  v4 = [(SKUIStorePageSectionsViewControllerAccessibility *)self safeValueForKey:@"_title"];
  v5 = __UIAccessibilityCastAsClass();

  [v3 setAccessibilityLabel:v5];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIStorePageSectionsViewControllerAccessibility;
  [(SKUIStorePageSectionsViewControllerAccessibility *)&v3 loadView];
  [(SKUIStorePageSectionsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end