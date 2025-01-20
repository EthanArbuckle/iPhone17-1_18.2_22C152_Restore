@interface WDProfileTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation WDProfileTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WDProfileTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WDProfileTableViewCell", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WDProfileTableViewCell", @"displayValue", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  if (![(WDProfileTableViewCellAccessibility *)self isEditing]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)WDProfileTableViewCellAccessibility;
  return [(WDProfileTableViewCellAccessibility *)&v4 isAccessibilityElement];
}

- (id)accessibilityLabel
{
  v2 = [(WDProfileTableViewCellAccessibility *)self safeValueForKey:@"displayName"];
  id v3 = __UIAccessibilitySafeClass();

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(WDProfileTableViewCellAccessibility *)self safeValueForKey:@"displayValue"];
  id v3 = __UIAccessibilitySafeClass();

  return v3;
}

@end