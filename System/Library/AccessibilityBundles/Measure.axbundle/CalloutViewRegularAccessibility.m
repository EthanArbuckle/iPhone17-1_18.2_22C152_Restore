@interface CalloutViewRegularAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateText:(int64_t)a3;
@end

@implementation CalloutViewRegularAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.CalloutViewRegular";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)updateText:(int64_t)a3
{
  v5 = [(CalloutViewAccessibility *)self axCalloutText];
  v6.receiver = self;
  v6.super_class = (Class)CalloutViewRegularAccessibility;
  [(CalloutViewRegularAccessibility *)&v6 updateText:a3];
  [(CalloutViewAccessibility *)self axDidUpdateFromPreviousCalloutText:v5];
}

@end