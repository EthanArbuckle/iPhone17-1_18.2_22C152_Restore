@interface UIReferenceLibraryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation UIReferenceLibraryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIReferenceLibraryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIReferenceLibraryViewControllerAccessibility;
  [(UIReferenceLibraryViewControllerAccessibility *)&v3 viewDidLoad];
  id location = (id)[(UIReferenceLibraryViewControllerAccessibility *)v5 safeValueForKey:@"view"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [location setAccessibilityViewIsModal:1];
  }
  objc_storeStrong(&location, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIReferenceLibraryViewControllerAccessibility;
  [(UIReferenceLibraryViewControllerAccessibility *)&v6 viewWillDisappear:a3];
  id location = (id)[(UIReferenceLibraryViewControllerAccessibility *)v9 safeValueForKey:@"view"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (id)[location window];
    [v3 _setAccessibilityIsMainWindow:0];

    id v4 = (id)[location superview];
    [v4 setAccessibilityViewIsModal:0];
  }
  objc_storeStrong(&location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIReferenceLibraryViewControllerAccessibility;
  [(UIReferenceLibraryViewControllerAccessibility *)&v6 viewDidAppear:a3];
  id location = (id)[(UIReferenceLibraryViewControllerAccessibility *)v9 safeValueForKey:@"view"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (id)[location window];
    [v3 _setAccessibilityIsMainWindow:1];

    id v4 = (id)[location superview];
    [v4 setAccessibilityViewIsModal:1];
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  objc_storeStrong(&location, 0);
}

@end