@interface SessionStackedLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SessionStackedLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.SessionStackedLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.SessionStackedLabelView", @"primaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.SessionStackedLabelView", @"secondaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.SessionStackedLabelView", @"noDataIndicator", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(SessionStackedLabelViewAccessibility *)self safeValueForKey:@"primaryLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(SessionStackedLabelViewAccessibility *)self safeValueForKey:@"secondaryLabel"];
  v6 = [v5 accessibilityLabel];

  uint64_t v7 = [(SessionStackedLabelViewAccessibility *)self safeStringForKey:@"noDataIndicator"];
  if (v7) {
    v8 = (__CFString *)v7;
  }
  else {
    v8 = @"--";
  }
  if ([v6 containsString:v8])
  {
    uint64_t v9 = accessibilityLocalizedString(@"no.data");

    v6 = (void *)v9;
  }
  if (v6)
  {
    if ([v6 containsString:@":"])
    {
      AXDurationForDurationString();
      if (v10 > 0.0)
      {
        uint64_t v11 = AXDurationStringForDuration();

        v6 = (void *)v11;
      }
    }
  }
  v12 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v4, v6);
  v13 = AXLabelForElements();
  v15 = _accessibilityReplaceStylsticBulletsForSpeaking(v13, v14);

  return v15;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SessionStackedLabelViewAccessibility;
  return *MEMORY[0x263F1CF48] | [(SessionStackedLabelViewAccessibility *)&v3 accessibilityTraits];
}

@end