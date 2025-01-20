@interface UIPrinterSearchingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)layoutSubviews;
@end

@implementation UIPrinterSearchingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPrinterSearchingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)UIPrinterSearchingViewAccessibility;
  [(UIPrinterSearchingViewAccessibility *)&v6 layoutSubviews];
  v3 = [(UIPrinterSearchingViewAccessibility *)self safeValueForKey:@"superview"];
  v4 = [(UIPrinterSearchingViewAccessibility *)self safeValueForKey:@"messageAndSpinner"];
  v5 = [v4 safeValueForKey:@"messageText"];
  [v3 setAccessibilityLabel:v5];
}

@end