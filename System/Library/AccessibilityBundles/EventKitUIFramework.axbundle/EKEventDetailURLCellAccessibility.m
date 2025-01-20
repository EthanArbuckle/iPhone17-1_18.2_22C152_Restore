@interface EKEventDetailURLCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation EKEventDetailURLCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKEventDetailURLCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  v3 = objc_opt_new();
  v4 = [(EKEventDetailURLCellAccessibility *)self safeValueForKey:@"_URLView"];
  [v3 axSafelyAddObject:v4];

  return v3;
}

@end