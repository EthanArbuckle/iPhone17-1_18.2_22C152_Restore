@interface CCUISensorAttributionCompactControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CCUISensorAttributionCompactControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUISensorAttributionCompactControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUISensorAttributionCompactControl", @"showingCamera", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUISensorAttributionCompactControl", @"showingLocation", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUISensorAttributionCompactControl", @"showingMicrophone", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUISensorAttributionCompactControl", @"setExpanded:animated:", "v", "B", "B", 0);
  [v3 validateClass:@"CCUISensorAttributionCompactControl" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"isUserInteractionEnabled", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return [(CCUISensorAttributionCompactControlAccessibility *)self safeBoolForKey:@"isUserInteractionEnabled"];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"control.center.services.used");
}

- (id)accessibilityValue
{
  int v3 = [(CCUISensorAttributionCompactControlAccessibility *)self safeBoolForKey:@"showingCamera"];
  int v4 = [(CCUISensorAttributionCompactControlAccessibility *)self safeBoolForKey:@"showingMicrophone"];
  int v5 = [(CCUISensorAttributionCompactControlAccessibility *)self safeBoolForKey:@"showingLocation"];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v3)
  {
    v10 = accessibilityLocalizedString(@"control.center.camera.used");
    [v6 axSafelyAddObject:v10];

    if (!v4)
    {
LABEL_3:
      if (!v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v4)
  {
    goto LABEL_3;
  }
  v11 = accessibilityLocalizedString(@"control.center.microphone.used");
  [v6 axSafelyAddObject:v11];

  if (v5)
  {
LABEL_4:
    v7 = accessibilityLocalizedString(@"control.center.location.used");
    [v6 axSafelyAddObject:v7];
  }
LABEL_5:
  v8 = MEMORY[0x245648D70](v6);

  return v8;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CCUISensorAttributionCompactControlAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CCUISensorAttributionCompactControlAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"control.center.active.services");
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CCUISensorAttributionCompactControlAccessibility;
  [(CCUISensorAttributionCompactControlAccessibility *)&v4 setExpanded:a3 animated:a4];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __73__CCUISensorAttributionCompactControlAccessibility_setExpanded_animated___block_invoke()
{
}

@end