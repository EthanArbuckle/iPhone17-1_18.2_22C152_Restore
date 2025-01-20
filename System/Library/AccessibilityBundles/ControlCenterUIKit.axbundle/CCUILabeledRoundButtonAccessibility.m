@interface CCUILabeledRoundButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axLabelsVisible;
- (BOOL)isAccessibilityElement;
- (CCUILabeledRoundButtonAccessibility)initWithGlyphImage:(id)a3 highlightColor:(id)a4;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CCUILabeledRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUILabeledRoundButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUILabeledRoundButton", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUILabeledRoundButton", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUILabeledRoundButton", @"buttonView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUILabeledRoundButton", @"initWithGlyphImage:highlightColor:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUILabeledRoundButton", @"labelsVisible", "B", 0);
}

- (BOOL)_axLabelsVisible
{
  return [(CCUILabeledRoundButtonAccessibility *)self safeBoolForKey:@"labelsVisible"];
}

- (BOOL)isAccessibilityElement
{
  if ([(CCUILabeledRoundButtonAccessibility *)self _axLabelsVisible]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CCUILabeledRoundButtonAccessibility;
  return [(CCUILabeledRoundButtonAccessibility *)&v4 isAccessibilityElement];
}

- (id)accessibilityLabel
{
  if ([(CCUILabeledRoundButtonAccessibility *)self _axLabelsVisible])
  {
    id v3 = [(CCUILabeledRoundButtonAccessibility *)self safeValueForKey:@"buttonView"];
    objc_super v4 = [v3 accessibilityLabel];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CCUILabeledRoundButtonAccessibility;
    objc_super v4 = [(CCUILabeledRoundButtonAccessibility *)&v6 accessibilityLabel];
  }

  return v4;
}

- (id)accessibilityHint
{
  if ([(CCUILabeledRoundButtonAccessibility *)self _axLabelsVisible])
  {
    id v3 = [(CCUILabeledRoundButtonAccessibility *)self safeValueForKey:@"buttonView"];
    objc_super v4 = [v3 accessibilityHint];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CCUILabeledRoundButtonAccessibility;
    objc_super v4 = [(CCUILabeledRoundButtonAccessibility *)&v6 accessibilityHint];
  }

  return v4;
}

- (id)accessibilityValue
{
  if ([(CCUILabeledRoundButtonAccessibility *)self _axLabelsVisible])
  {
    id v3 = [(CCUILabeledRoundButtonAccessibility *)self safeValueForKey:@"buttonView"];
    objc_super v4 = [v3 accessibilityValue];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CCUILabeledRoundButtonAccessibility;
    objc_super v4 = [(CCUILabeledRoundButtonAccessibility *)&v6 accessibilityValue];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  if ([(CCUILabeledRoundButtonAccessibility *)self _axLabelsVisible])
  {
    id v3 = [(CCUILabeledRoundButtonAccessibility *)self safeValueForKey:@"buttonView"];
    unint64_t v4 = [v3 accessibilityTraits];

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CCUILabeledRoundButtonAccessibility;
    return [(CCUILabeledRoundButtonAccessibility *)&v6 accessibilityTraits];
  }
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(CCUILabeledRoundButtonAccessibility *)self _axLabelsVisible])
  {
    id v3 = [(CCUILabeledRoundButtonAccessibility *)self safeValueForKey:@"buttonView"];
    [v3 accessibilityActivationPoint];
    double v5 = v4;
    double v7 = v6;

    double v8 = v5;
    double v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CCUILabeledRoundButtonAccessibility;
    [(CCUILabeledRoundButtonAccessibility *)&v10 accessibilityActivationPoint];
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CCUILabeledRoundButtonAccessibility;
  [(CCUILabeledRoundButtonAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CCUILabeledRoundButtonAccessibility *)self safeValueForKey:@"titleLabel"];
  [v3 setIsAccessibilityElement:0];

  double v4 = [(CCUILabeledRoundButtonAccessibility *)self safeValueForKey:@"subtitleLabel"];
  [v4 setIsAccessibilityElement:0];
}

- (CCUILabeledRoundButtonAccessibility)initWithGlyphImage:(id)a3 highlightColor:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CCUILabeledRoundButtonAccessibility;
  double v4 = [(CCUILabeledRoundButtonAccessibility *)&v6 initWithGlyphImage:a3 highlightColor:a4];
  [(CCUILabeledRoundButtonAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

@end