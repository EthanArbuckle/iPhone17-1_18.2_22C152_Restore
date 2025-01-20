@interface PLProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateValueBasedOnPercentComplete:(float)a3;
- (void)setPercentComplete:(float)a3;
@end

@implementation PLProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLProgressView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v2 = [(PLProgressViewAccessibility *)self safeValueForKey:@"alpha"];
  [v2 doubleValue];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (id)accessibilityLabel
{
  v2 = [(PLProgressViewAccessibility *)self safeValueForKey:@"_labelView"];
  double v3 = [v2 accessibilityLabel];

  return v3;
}

- (void)_axUpdateValueBasedOnPercentComplete:(float)a3
{
  id v4 = objc_allocWithZone(NSString);
  v5 = UIKitAccessibilityLocalizedString();
  v6 = AXFormatFloatWithPercentage();
  id v7 = (id)objc_msgSend(v4, "initWithFormat:", v5, v6);

  [(PLProgressViewAccessibility *)self setAccessibilityValue:v7];
}

- (void)setPercentComplete:(float)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLProgressViewAccessibility;
  -[PLProgressViewAccessibility setPercentComplete:](&v8, sel_setPercentComplete_);
  id v4 = objc_allocWithZone(NSString);
  v5 = UIKitAccessibilityLocalizedString();
  v6 = AXFormatFloatWithPercentage();
  id v7 = objc_msgSend(v4, "initWithFormat:", v5, v6);

  [(PLProgressViewAccessibility *)self setAccessibilityValue:v7];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PLProgressViewAccessibility;
  [(PLProgressViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  double v3 = [(PLProgressViewAccessibility *)self safeValueForKey:@"percentComplete"];
  [v3 floatValue];
  -[PLProgressViewAccessibility _axUpdateValueBasedOnPercentComplete:](self, "_axUpdateValueBasedOnPercentComplete:");
}

@end