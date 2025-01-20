@interface CSProminentLabeledElementViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityViewIsVisible;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CSProminentLabeledElementViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSProminentLabeledElementView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CSProminentLabeledElementView" isKindOfClass:@"CSProminentTextElementView"];
  [v3 validateClass:@"CSProminentLabeledElementView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSProminentTextElementView", @"textLabel", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(CSProminentLabeledElementViewAccessibility *)self safeValueForKey:@"textLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityViewIsVisible
{
  char v8 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  [v3 alpha];
  double v5 = v4;

  if (v5 > 0.0) {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)CSProminentLabeledElementViewAccessibility;
  return [(CSProminentLabeledElementViewAccessibility *)&v7 _accessibilityViewIsVisible];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CSProminentLabeledElementViewAccessibility;
  return *MEMORY[0x263F1CF68] | [(CSProminentLabeledElementViewAccessibility *)&v3 accessibilityTraits];
}

@end