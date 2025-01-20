@interface TLKSelectableGridButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TLKSelectableGridButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKSelectableGridButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKSelectableGridButton", @"topLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKSelectableGridButton", @"bottomLabel", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(TLKSelectableGridButtonAccessibility *)self _accessibilityStringForLabelKeyValues:@"topLabel, bottomLabel"];
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)TLKSelectableGridButtonAccessibility;
  unint64_t v3 = [(TLKSelectableGridButtonAccessibility *)&v8 accessibilityTraits];
  v4 = [(TLKSelectableGridButtonAccessibility *)self layer];
  uint64_t v5 = [v4 backgroundColor];

  uint64_t v6 = *MEMORY[0x263F1CF38];
  if (!v5) {
    uint64_t v6 = 0;
  }
  return v6 | v3;
}

@end