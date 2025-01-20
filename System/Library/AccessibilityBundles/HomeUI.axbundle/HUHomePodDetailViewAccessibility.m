@interface HUHomePodDetailViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HUHomePodDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUHomePodDetailView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUHomePodDetailView", @"mediaSystemRole", "Q", 0);
  [v3 validateClass:@"HUHomePodDetailView" hasInstanceVariable:@"_unitNameLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(HUHomePodDetailViewAccessibility *)self safeIntegerForKey:@"mediaSystemRole"];
  if (v3 == 1)
  {
    v4 = @"left.homepod";
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    v4 = @"right.homepod";
LABEL_5:
    v5 = accessibilityHomeLocalizedString(v4);
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:
  v8 = [(HUHomePodDetailViewAccessibility *)self safeValueForKey:@"_unitNameLabel"];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityHint
{
  return accessibilityHomeLocalizedString(@"identify.homepod.hint");
}

@end