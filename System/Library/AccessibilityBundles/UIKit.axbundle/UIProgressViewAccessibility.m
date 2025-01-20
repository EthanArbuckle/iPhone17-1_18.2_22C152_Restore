@interface UIProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
@end

@implementation UIProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIProgressView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIProgressView", @"_setProgress:", "v", "f", 0);
  objc_storeStrong(v4, obj);
}

- (unint64_t)_accessibilityAutomationType
{
  return 35;
}

- (unint64_t)accessibilityTraits
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIProgressViewAccessibility;
  return [(UIProgressViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CF68];
}

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(UIProgressViewAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v5 = v2 == 0;

  if (v5) {
    return ([(UIProgressViewAccessibility *)self _accessibilityViewIsVisible] & 1) != 0;
  }
  id v4 = (id)[(UIProgressViewAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (id)accessibilityLabel
{
  id v2 = (id)[(UIProgressViewAccessibility *)self accessibilityUserDefinedLabel];
  BOOL v4 = v2 == 0;

  if (v4) {
    id v6 = accessibilityLocalizedString(@"progress.text");
  }
  else {
    id v6 = (id)[(UIProgressViewAccessibility *)self accessibilityUserDefinedLabel];
  }

  return v6;
}

- (id)accessibilityValue
{
  id v2 = (id)[(UIProgressViewAccessibility *)self accessibilityUserDefinedValue];
  BOOL v8 = v2 == 0;

  if (v8)
  {
    BOOL v4 = NSString;
    id v7 = accessibilityLocalizedString(@"percent.value.formatter");
    id v6 = (id)[(UIProgressViewAccessibility *)self safeValueForKey:@"progress"];
    [v6 floatValue];
    id v5 = (id)AXFormatFloatWithPercentage();
    id v10 = (id)objc_msgSend(v4, "stringWithFormat:", v7, v5);
  }
  else
  {
    id v10 = (id)[(UIProgressViewAccessibility *)self accessibilityUserDefinedValue];
  }

  return v10;
}

- (CGRect)accessibilityFrame
{
  [(UIProgressViewAccessibility *)self bounds];
  v5.origin.y = v2 - 10.0;
  v5.size.height = v3 + 20.0;
  return UIAccessibilityConvertFrameToScreenCoordinates(v5, (UIView *)self);
}

@end