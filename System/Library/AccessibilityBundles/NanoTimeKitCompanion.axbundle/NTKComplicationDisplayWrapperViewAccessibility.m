@interface NTKComplicationDisplayWrapperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityFKAShouldProcessChildren;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)accessibilityActivate;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityUserTestingChildren;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3;
- (id)accessibilityComplicationIdentifier;
- (id)accessibilityComplicationKeylineStyle;
- (id)accessibilityComplicationPathOverride;
- (id)accessibilityComplicationSlotIdentifier;
- (id)accessibilityFaceIdentifier;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (int64_t)_accessibilityFocusRingStyle;
- (unint64_t)accessibilityTraits;
- (void)accessibilitySetComplicationIdentifier:(id)a3;
- (void)accessibilitySetComplicationKeylineStyle:(id)a3;
- (void)accessibilitySetComplicationPathOverride:(id)a3;
- (void)accessibilitySetComplicationSlotIdentifier:(id)a3;
- (void)accessibilitySetFaceIdentifier:(id)a3;
- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4 animation:(unint64_t)a5;
@end

@implementation NTKComplicationDisplayWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKComplicationDisplayWrapperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityFaceIdentifier
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__NTKComplicationDisplayWrapperViewAccessibility__accessibilityFaceIdentifier);
}

- (void)accessibilitySetFaceIdentifier:(id)a3
{
}

- (id)accessibilityComplicationIdentifier
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__NTKComplicationDisplayWrapperViewAccessibility__accessibilityComplicationIdentifier);
}

- (void)accessibilitySetComplicationIdentifier:(id)a3
{
}

- (id)accessibilityComplicationSlotIdentifier
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__NTKComplicationDisplayWrapperViewAccessibility__accessibilityComplicationSlotIdentifier);
}

- (void)accessibilitySetComplicationSlotIdentifier:(id)a3
{
}

- (id)accessibilityComplicationKeylineStyle
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__NTKComplicationDisplayWrapperViewAccessibility__accessibilityComplicationKeylineStyle);
}

- (void)accessibilitySetComplicationKeylineStyle:(id)a3
{
}

- (id)accessibilityComplicationPathOverride
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__NTKComplicationDisplayWrapperViewAccessibility__accessibilityComplicationPathOverride);
}

- (void)accessibilitySetComplicationPathOverride:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKComplicationDisplayWrapperView" hasInstanceVariable:@"_currentComplicationView" withType:"UIView<CDComplicationDisplay>"];
  [v3 validateClass:@"NTKComplicationDisplayWrapperView" hasInstanceVariable:@"_template" withType:"CLKComplicationTemplate"];
  [v3 validateClass:@"NTKComplicationDisplayWrapperView" isKindOfClass:@"UIControl"];
  [v3 validateClass:@"NTKComplicationDisplayWrapperView" hasInstanceVariable:@"_tapEnabled" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplicationDisplayWrapperView", @"complicationSlotIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKComplicationDisplayWrapperView", @"setComplicationTemplate:reason:animation:", "v", "@", "q", "Q", 0);
  [v3 validateClass:@"NTKComplicationDisplayWrapperView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_isEligibleForFocusInteraction", "B", 0);
  [v3 validateProtocol:@"_UIFocusItemInternal" hasOptionalInstanceMethod:@"_viewToAddFocusLayer"];
}

- (BOOL)isAccessibilityElement
{
  if (AXDoesRequestingClientDeserveAutomation()) {
    return 0;
  }
  v4 = [(NTKComplicationDisplayWrapperViewAccessibility *)self safeValueForKey:@"_currentComplicationView"];
  unsigned __int8 v5 = [v4 isAccessibilityElement];

  if (v5) {
    return 1;
  }
  if ([(NTKComplicationDisplayWrapperViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    v6 = [(NTKComplicationDisplayWrapperViewAccessibility *)self safeValueForKey:@"_template"];
    BOOL v3 = v6 != 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKComplicationDisplayWrapperViewAccessibility;
    return [(NTKComplicationDisplayWrapperViewAccessibility *)&v8 isAccessibilityElement];
  }
  return v3;
}

- (BOOL)_accessibilityFKAShouldProcessChildren
{
  return 0;
}

- (id)accessibilityIdentifier
{
  return [(NTKComplicationDisplayWrapperViewAccessibility *)self safeStringForKey:@"complicationSlotIdentifier"];
}

- (id)_accessibilityUserTestingChildren
{
  v4.receiver = self;
  v4.super_class = (Class)NTKComplicationDisplayWrapperViewAccessibility;
  v2 = [(NTKComplicationDisplayWrapperViewAccessibility *)&v4 _accessibilityUserTestingChildren];

  return v2;
}

- (id)accessibilityLabel
{
  BOOL v3 = [(NTKComplicationDisplayWrapperViewAccessibility *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    objc_super v4 = [(NTKComplicationDisplayWrapperViewAccessibility *)self accessibilityUserDefinedLabel];
  }
  else
  {
    unsigned __int8 v5 = [(NTKComplicationDisplayWrapperViewAccessibility *)self safeValueForKey:@"_currentComplicationView"];
    v6 = [v5 accessibilityLabel];

    if ([v6 length])
    {
      id v7 = v6;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)NTKComplicationDisplayWrapperViewAccessibility;
      id v7 = [(NTKComplicationDisplayWrapperViewAccessibility *)&v9 accessibilityLabel];
    }
    objc_super v4 = v7;
  }

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(NTKComplicationDisplayWrapperViewAccessibility *)self safeValueForKey:@"_currentComplicationView"];
  BOOL v3 = [v2 accessibilityValue];

  return v3;
}

- (id)accessibilityHint
{
  v7.receiver = self;
  v7.super_class = (Class)NTKComplicationDisplayWrapperViewAccessibility;
  BOOL v3 = [(NTKComplicationDisplayWrapperViewAccessibility *)&v7 accessibilityHint];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    unsigned __int8 v5 = [(NTKComplicationDisplayWrapperViewAccessibility *)self safeValueForKey:@"_currentComplicationView"];
    id v4 = [v5 accessibilityHint];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_opt_class();
  BOOL v3 = __UIAccessibilityCastAsClass();
  id v4 = [(NTKComplicationDisplayWrapperViewAccessibility *)self safeValueForKey:@"_currentComplicationView"];
  unint64_t v5 = (unint64_t)[v4 accessibilityTraits];

  [v3 alpha];
  uint64_t v6 = kAXNotEnabledTrait;
  if (v7 >= 1.0) {
    uint64_t v6 = 0;
  }
  unint64_t v8 = v6 | v5;

  return v8;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(NTKComplicationDisplayWrapperViewAccessibility *)self safeValueForKey:@"_currentComplicationView"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityPath
{
  double v3 = [(NTKComplicationDisplayWrapperViewAccessibility *)self safeValueForKey:@"_currentComplicationView"];
  double v4 = v3;
  if (v3)
  {
    double v5 = [v3 accessibilityPath];
    if (v5
      || ([(NTKComplicationDisplayWrapperViewAccessibility *)self accessibilityComplicationPathOverride], (double v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v6 = v5;

      goto LABEL_10;
    }
    double v7 = [(NTKComplicationDisplayWrapperViewAccessibility *)self accessibilityComplicationKeylineStyle];
    double v8 = v7;
    if (v7 && [v7 integerValue] == (char *)&dword_0 + 1)
    {
      id v6 = [v4 _accessibilityCirclePathBasedOnBoundsWidth];

      goto LABEL_10;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)NTKComplicationDisplayWrapperViewAccessibility;
  id v6 = [(NTKComplicationDisplayWrapperViewAccessibility *)&v10 accessibilityPath];
LABEL_10:

  return v6;
}

- (BOOL)accessibilityActivate
{
  char v7 = 0;
  objc_opt_class();
  double v3 = __UIAccessibilityCastAsClass();
  if (v3)
  {
    if ([(NTKComplicationDisplayWrapperViewAccessibility *)self safeBoolForKey:@"_tapEnabled"])
    {
      BOOL v4 = 1;
      [v3 sendActionsForControlEvents:1];
      [v3 sendActionsForControlEvents:64];
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NTKComplicationDisplayWrapperViewAccessibility;
    BOOL v4 = [(NTKComplicationDisplayWrapperViewAccessibility *)&v6 accessibilityActivate];
  }

  return v4;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  switch(a3)
  {
    case 15002:
      double v3 = [(NTKComplicationDisplayWrapperViewAccessibility *)self accessibilityComplicationSlotIdentifier];
      break;
    case 15001:
      double v3 = [(NTKComplicationDisplayWrapperViewAccessibility *)self accessibilityComplicationIdentifier];
      break;
    case 15000:
      double v3 = [(NTKComplicationDisplayWrapperViewAccessibility *)self accessibilityFaceIdentifier];
      break;
    default:
      v5.receiver = self;
      v5.super_class = (Class)NTKComplicationDisplayWrapperViewAccessibility;
      double v3 = -[NTKComplicationDisplayWrapperViewAccessibility _iosAccessibilityAttributeValue:](&v5, "_iosAccessibilityAttributeValue:");
      break;
  }

  return v3;
}

- (int64_t)_accessibilityFocusRingStyle
{
  v2 = [(NTKComplicationDisplayWrapperViewAccessibility *)self safeValueForKey:@"_currentComplicationView"];
  id v3 = [v2 _accessibilityFocusRingStyle];

  return (int64_t)v3;
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4 animation:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(NTKComplicationDisplayWrapperViewAccessibility *)self safeValueForKey:@"_template"];

  v10.receiver = self;
  v10.super_class = (Class)NTKComplicationDisplayWrapperViewAccessibility;
  [(NTKComplicationDisplayWrapperViewAccessibility *)&v10 setComplicationTemplate:v8 reason:a4 animation:a5];
  LODWORD(a5) = UIAccessibilityIsVoiceOverRunning();

  if (a5 && v9 != v8 && _accessibilityTimeTravelIsActive())
  {
    if ([(NTKComplicationDisplayWrapperViewAccessibility *)self accessibilityElementIsFocused])AudioServicesPlaySystemSound(0x5F2u); {
  }
    }
}

- (BOOL)canBecomeFocused
{
  if ([(NTKComplicationDisplayWrapperViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    if ([(NTKComplicationDisplayWrapperViewAccessibility *)self isAccessibilityElement])
    {
      return 1;
    }
    else
    {
      BOOL v4 = [(NTKComplicationDisplayWrapperViewAccessibility *)self safeUIViewForKey:@"_currentComplicationView"];
      unsigned __int8 v5 = [v4 _accessibilityViewIsVisible];

      return v5;
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NTKComplicationDisplayWrapperViewAccessibility;
    return [(NTKComplicationDisplayWrapperViewAccessibility *)&v6 canBecomeFocused];
  }
}

- (BOOL)_isEligibleForFocusInteraction
{
  if ([(NTKComplicationDisplayWrapperViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    id v3 = [(NTKComplicationDisplayWrapperViewAccessibility *)self safeUIViewForKey:@"_currentComplicationView"];
    unsigned __int8 v4 = [v3 _accessibilityViewIsVisible];

    if (v4) {
      return 1;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)NTKComplicationDisplayWrapperViewAccessibility;
  return [(NTKComplicationDisplayWrapperViewAccessibility *)&v6 _isEligibleForFocusInteraction];
}

@end