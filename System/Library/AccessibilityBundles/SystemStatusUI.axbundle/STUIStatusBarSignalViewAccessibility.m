@interface STUIStatusBarSignalViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation STUIStatusBarSignalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarSignalView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarSignalView", @"signalMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarSignalView", @"numberOfBars", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarSignalView", @"numberOfActiveBars", "q", 0);
}

- (id)accessibilityValue
{
  uint64_t v3 = [(STUIStatusBarSignalViewAccessibility *)self safeIntegerForKey:@"signalMode"];
  if (v3 == 2)
  {
    uint64_t v5 = [(STUIStatusBarSignalViewAccessibility *)self safeIntegerForKey:@"numberOfBars"];
    uint64_t v6 = [(STUIStatusBarSignalViewAccessibility *)self safeIntegerForKey:@"numberOfActiveBars"];
    v7 = [(STUIStatusBarSignalViewAccessibility *)self _accessibilityValueForKey:@"AccessibilityStatusBarSignalViewLabelKey"];
    v8 = v7;
    if (v7)
    {
      v9 = NSString;
      v10 = accessibilityLocalizedString(v7);
      v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v6, v5);
    }
    else
    {
      v11 = 0;
    }

    goto LABEL_13;
  }
  if (v3 == 1)
  {
    v4 = @"status.signal.searching";
  }
  else
  {
    if (v3)
    {
      v14.receiver = self;
      v14.super_class = (Class)STUIStatusBarSignalViewAccessibility;
      uint64_t v12 = [(STUIStatusBarSignalViewAccessibility *)&v14 accessibilityLabel];
      goto LABEL_10;
    }
    v4 = @"status.signal.no.signal";
  }
  uint64_t v12 = accessibilityLocalizedString(v4);
LABEL_10:
  v11 = (void *)v12;
LABEL_13:

  return v11;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarSignalViewAccessibility;
  return *MEMORY[0x263F813F0] | [(STUIStatusBarSignalViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F81368];
}

@end