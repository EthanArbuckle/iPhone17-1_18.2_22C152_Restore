@interface _CAMExpandingControlButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axCameraExpandingControl;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation _CAMExpandingControlButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_CAMExpandingControlButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_CAMExpandingControlButton", @"titleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_CAMExpandingControlButton", @"isSlashed", "B", 0);
  [v3 validateClass:@"CAMExpandingControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExpandingControl", @"_titleView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExpandingControl", @"_menuButtons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExpandingControl", @"menu", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExpandingControl", @"_selectedMenuItem", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(_CAMExpandingControlButtonAccessibility *)self safeStringForKey:@"titleText"];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(_CAMExpandingControlButtonAccessibility *)self _axCameraExpandingControl];
    id v5 = [v6 accessibilityLabel];
  }

  return v5;
}

- (id)accessibilityValue
{
  id v3 = [(_CAMExpandingControlButtonAccessibility *)self _axCameraExpandingControl];
  v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  id v5 = [v3 safeValueForKey:@"_titleView"];
  v6 = [(_CAMExpandingControlButtonAccessibility *)self safeStringForKey:@"titleText"];
  v7 = v6;
  if (v5 != self)
  {

LABEL_4:
    v12.receiver = self;
    v12.super_class = (Class)_CAMExpandingControlButtonAccessibility;
    v8 = [(_CAMExpandingControlButtonAccessibility *)&v12 accessibilityValue];
    goto LABEL_12;
  }
  if (v6)
  {
    if ([(_CAMExpandingControlButtonAccessibility *)self safeBoolForKey:@"isSlashed"]) {
      v9 = @"EXPANDING_CONTROL_OFF";
    }
    else {
      v9 = @"EXPANDING_CONTROL_ON";
    }
    uint64_t v10 = accessibilityCameraUILocalizedString(v9);
  }
  else
  {
    uint64_t v10 = [v4 accessibilityValue];
  }
  v8 = (void *)v10;

LABEL_12:

  return v8;
}

- (unint64_t)accessibilityTraits
{
  v13.receiver = self;
  v13.super_class = (Class)_CAMExpandingControlButtonAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(_CAMExpandingControlButtonAccessibility *)&v13 accessibilityTraits];
  v4 = [(_CAMExpandingControlButtonAccessibility *)self _axCameraExpandingControl];
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 safeArrayForKey:@"_menuButtons"];
    uint64_t v7 = [v6 indexOfObject:self];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = v7;
      v9 = [v5 safeArrayForKey:@"menu"];
      uint64_t v10 = [v9 objectAtIndex:v8];
      v11 = [v5 safeValueForKey:@"_selectedMenuItem"];
      if (v10 == v11) {
        v3 |= *MEMORY[0x263F1CF38];
      }
      else {
        v3 &= ~*MEMORY[0x263F1CF38];
      }
    }
  }

  return v3;
}

- (id)_axCameraExpandingControl
{
  return (id)[(_CAMExpandingControlButtonAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_2 startWithSelf:1];
}

@end