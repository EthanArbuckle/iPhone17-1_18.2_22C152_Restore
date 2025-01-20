@interface PKCurvedTextLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation PKCurvedTextLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKCurvedTextLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return (id)[(PKCurvedTextLabelAccessibility *)self safeStringForKey:@"text"];
}

@end