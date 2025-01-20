@interface SUUIStorePageSectionsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation SUUIStorePageSectionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIStorePageSectionsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIStorePageSectionsViewController", @"loadView", "v", 0);
  [v3 validateClass:@"SUUIStorePageSectionsViewController" hasInstanceVariable:@"_collectionView" withType:"SUUICollectionView"];
  [v3 validateClass:@"UIViewController" hasInstanceVariable:@"_title" withType:"NSString"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIStorePageSectionsViewControllerAccessibility;
  [(SUUIStorePageSectionsViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SUUIStorePageSectionsViewControllerAccessibility *)self safeValueForKey:@"_collectionView"];
  objc_opt_class();
  v4 = [(SUUIStorePageSectionsViewControllerAccessibility *)self safeValueForKey:@"_title"];
  v5 = __UIAccessibilityCastAsClass();

  [v3 setAccessibilityLabel:v5];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIStorePageSectionsViewControllerAccessibility;
  [(SUUIStorePageSectionsViewControllerAccessibility *)&v3 loadView];
  [(SUUIStorePageSectionsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end