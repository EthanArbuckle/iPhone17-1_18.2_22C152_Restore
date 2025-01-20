@interface UIPrinterBrowserViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateSearching;
@end

@implementation UIPrinterBrowserViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPrinterBrowserViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPrintMessageAndSpinnerView", @"messageText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPrinterSearchingView", @"messageAndSpinner", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPrinterBrowserViewController", @"updateSearching", "v", 0);
}

- (void)updateSearching
{
  v7.receiver = self;
  v7.super_class = (Class)UIPrinterBrowserViewControllerAccessibility;
  [(UIPrinterBrowserViewControllerAccessibility *)&v7 updateSearching];
  id v3 = [(UIPrinterBrowserViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4 = [(UIPrinterBrowserViewControllerAccessibility *)self safeValueForKey:@"_searchingView"];
  v5 = [v4 safeValueForKey:@"messageAndSpinner"];
  v6 = [v5 safeValueForKey:@"messageText"];
  [v3 setAccessibilityLabel:v6];
}

@end