@interface _UIStatusBarSignalViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIStatusBarSignalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarSignalView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIStatusBarSignalView";
  v4 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"numberOfBars", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"numberOfActiveBars", v4, 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)isAccessibilityElement
{
  return [(_UIStatusBarSignalViewAccessibility *)self _accessibilityViewIsVisible] & 1;
}

- (id)accessibilityValue
{
  v20 = self;
  v19[1] = (id)a2;
  v19[0] = 0;
  uint64_t v18 = [(_UIStatusBarSignalViewAccessibility *)self safeIntegerForKey:@"signalMode"];
  if (v18)
  {
    if (v18 == 1)
    {
      id v4 = accessibilityLocalizedString(@"status.signal.searching");
      id v5 = v19[0];
      v19[0] = v4;
    }
    else if (v18 == 2)
    {
      uint64_t v17 = [(_UIStatusBarSignalViewAccessibility *)v20 safeIntegerForKey:@"numberOfBars"];
      uint64_t v16 = [(_UIStatusBarSignalViewAccessibility *)v20 safeIntegerForKey:@"numberOfActiveBars"];
      id location = (id)[(_UIStatusBarSignalViewAccessibility *)v20 _accessibilityValueForKey:@"AccessibilityStatusBarSignalViewLabelKey"];
      if (location)
      {
        v12 = NSString;
        id v13 = accessibilityLocalizedString(location);
        id v6 = (id)objc_msgSend(v12, "localizedStringWithFormat:", v16, v17);
        id v7 = v19[0];
        v19[0] = v6;
      }
      objc_storeStrong(&location, 0);
    }
    else
    {
      v14.receiver = v20;
      v14.super_class = (Class)_UIStatusBarSignalViewAccessibility;
      id v8 = [(_UIStatusBarSignalViewAccessibility *)&v14 accessibilityLabel];
      id v9 = v19[0];
      v19[0] = v8;
    }
  }
  else
  {
    id v2 = accessibilityLocalizedString(@"status.signal.no.signal");
    id v3 = v19[0];
    v19[0] = v2;
  }
  id v11 = v19[0];
  objc_storeStrong(v19, 0);

  return v11;
}

- (unint64_t)accessibilityTraits
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarSignalViewAccessibility;
  return [(_UIStatusBarSignalViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0] | *MEMORY[0x263F81368];
}

- (id)accessibilityHint
{
  return AXStatusBarItemHint(self);
}

@end