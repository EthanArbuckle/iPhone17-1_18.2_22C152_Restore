@interface PUActivityViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PUActivityViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUActivityViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PUActivityViewControllerAccessibility;
  [(PUActivityViewControllerAccessibility *)&v11 viewDidAppear:a3];
  if (AXDeviceIsTallPhoneIdiom())
  {
    objc_opt_class();
    v4 = __UIAccessibilityCastAsClass();
    v5 = [v4 view];
    v6 = [v5 window];
    v7 = [v6 windowScene];
    unint64_t v8 = [v7 interfaceOrientation] - 5;

    if (v8 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = [(PUActivityViewControllerAccessibility *)self safeValueForKey:@"view"];
      [v9 setAccessibilityViewIsModal:0];
    }
  }
  v10 = [(PUActivityViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v10 setAccessibilityIdentifier:@"ActivityListView"];
}

@end