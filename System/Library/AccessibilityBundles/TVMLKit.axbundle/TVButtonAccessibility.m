@interface TVButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVButton";
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
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TVButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(TVButtonAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  objc_super v3 = [(TVButtonAccessibility *)self safeValueForKey:@"textContentView"];
  v4 = [v3 accessibilityLabel];

  v5 = [(TVButtonAccessibility *)self safeValueForKey:@"imageView"];
  v6 = [v5 accessibilityLabel];

  if ([v4 length])
  {
    if ([v6 length]) {
      [(TVButtonAccessibility *)self setAccessibilityHint:v6];
    }
  }
  else
  {
    id v7 = v6;

    v4 = v7;
  }
  if (![v4 length])
  {
    v8 = [(TVButtonAccessibility *)self safeValueForKey:@"accessoryView"];
    uint64_t v9 = [v8 accessibilityLabel];

    v4 = (void *)v9;
  }

  return v4;
}

@end