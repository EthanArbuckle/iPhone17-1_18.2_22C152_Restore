@interface PKPassFieldViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PKPassFieldViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassFieldView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PKPassFieldViewAccessibility *)self safeValueForKey:@"labelLabel"];
  v3 = [v2 accessibilityLabel];

  if ([v3 isEqualToString:@"***"]) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(PKPassFieldViewAccessibility *)self safeValueForKey:@"valueLabel"];
  v3 = [v2 accessibilityLabel];

  if ([v3 isEqualToString:@"***"]) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }

  return v4;
}

@end