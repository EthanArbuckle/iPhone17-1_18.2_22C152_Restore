@interface TextHeaderComponentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation TextHeaderComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"StoreDynamicUIPlugin.TextHeaderComponent";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"StoreDynamicUIPlugin.TextHeaderComponent" hasSwiftField:@"titleLabel" withSwiftType:"DynamicLabel"];
  [v3 validateClass:@"StoreDynamicUIPlugin.TextHeaderComponent" hasSwiftField:@"subtitleLabel" withSwiftType:"DynamicLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(TextHeaderComponentAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v4 = [(TextHeaderComponentAccessibility *)self safeSwiftValueForKey:@"subtitleLabel"];
  if (v3
    && ([v3 accessibilityLabel],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 containsString:@"one-logo"],
        v5,
        v6))
  {
    v7 = accessibilityLocalizedString(@"apple.one");
    v8 = __UIAXStringForVariables();
  }
  else
  {
    v8 = __UIAXStringForVariables();
  }

  return v8;
}

@end