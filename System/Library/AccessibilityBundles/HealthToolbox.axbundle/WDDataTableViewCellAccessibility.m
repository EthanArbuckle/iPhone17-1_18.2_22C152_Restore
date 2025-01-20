@interface WDDataTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation WDDataTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WDDataTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WDDataTableViewCell", @"source", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WDDataTableViewCell", @"displayValue", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WDDataTableViewCell", @"dateString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKSource", @"name", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(WDDataTableViewCellAccessibility *)self safeStringForKey:@"displayValue"];
  v4 = [(WDDataTableViewCellAccessibility *)self safeStringForKey:@"dateString"];
  v5 = [(WDDataTableViewCellAccessibility *)self safeValueForKey:@"source"];
  v8 = [v5 safeStringForKey:@"name"];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end