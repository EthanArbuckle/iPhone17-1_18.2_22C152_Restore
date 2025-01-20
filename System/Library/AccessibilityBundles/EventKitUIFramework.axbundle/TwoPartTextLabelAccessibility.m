@interface TwoPartTextLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation TwoPartTextLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TwoPartTextLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"add.event.tablecells.hint");
}

- (id)accessibilityLabel
{
  v7.receiver = self;
  v7.super_class = (Class)TwoPartTextLabelAccessibility;
  v3 = [(TwoPartTextLabelAccessibility *)&v7 accessibilityLabel];
  v6 = [(TwoPartTextLabelAccessibility *)self safeValueForKey:@"_secondTextPart"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)accessibilityValue
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end