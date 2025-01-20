@interface MTLabelStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MTLabelStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTLabelStackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTLabelStackView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTLabelStackView", @"subtitleLabel", "@", 0);
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(MTLabelStackViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 accessibilityLabel];
  objc_opt_class();
  v6 = [(MTLabelStackViewAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v7 = __UIAccessibilityCastAsClass();

  v10 = [v7 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  return v8;
}

@end