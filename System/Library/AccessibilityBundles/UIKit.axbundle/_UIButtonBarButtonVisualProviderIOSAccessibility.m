@interface _UIButtonBarButtonVisualProviderIOSAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)configureButton:(id)a3 fromBarButtonItem:(id)a4;
@end

@implementation _UIButtonBarButtonVisualProviderIOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIButtonBarButtonVisualProviderIOS";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIButtonBarButtonVisualProviderIOS", @"configureButton:fromBarButtonItem:", "v", "@", "@", 0);
  objc_storeStrong(v4, obj);
}

- (void)configureButton:(id)a3 fromBarButtonItem:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v8.receiver = v11;
  v8.super_class = (Class)_UIButtonBarButtonVisualProviderIOSAccessibility;
  [(_UIButtonBarButtonVisualProviderIOSAccessibility *)&v8 configureButton:location[0] fromBarButtonItem:v9];
  char v7 = 0;
  objc_opt_class();
  id v6 = (id)__UIAccessibilityCastAsSafeCategory();
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  -[UIBarButtonItemAccessibility _accessibilityAddIdForView:](v5, location[0]);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

@end