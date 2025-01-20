@interface MFModernAtomViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MFModernAtomViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFModernAtomView";
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
  v3 = [(MFModernAtomViewAccessibility *)self safeValueForKey:@"presentationOptions"];
  char v4 = [v3 integerValue];

  if ((v4 & 0x10) != 0)
  {
    v5 = accessibilityLocalizedString(@"vip.sender");
    goto LABEL_5;
  }
  if ((v4 & 1) == 0)
  {
    v5 = 0;
LABEL_5:
    v6 = 0;
    goto LABEL_7;
  }
  v6 = accessibilityLocalizedString(@"address.failure.style");
  v5 = 0;
LABEL_7:
  v7 = [(MFModernAtomViewAccessibility *)self safeValueForKey:@"title"];
  v10 = [(MFModernAtomViewAccessibility *)self _accessibilityValueForKey:@"ActualEmail"];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"address.atom.hint");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end