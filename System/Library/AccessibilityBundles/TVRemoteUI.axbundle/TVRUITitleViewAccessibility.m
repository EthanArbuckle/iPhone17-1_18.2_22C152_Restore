@interface TVRUITitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVRUITitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRUITitleView";
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
  v3.super_class = (Class)TVRUITitleViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(TVRUITitleViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  objc_super v3 = [(TVRUITitleViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TVRUITitleViewAccessibility;
    id v6 = [(TVRUITitleViewAccessibility *)&v9 accessibilityLabel];
  }
  v7 = v6;

  return v7;
}

@end