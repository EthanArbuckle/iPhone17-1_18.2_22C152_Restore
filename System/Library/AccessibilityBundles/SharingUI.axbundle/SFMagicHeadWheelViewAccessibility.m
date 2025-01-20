@interface SFMagicHeadWheelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsShowingHead;
- (BOOL)isAccessibilityElement;
- (BOOL)updateSelectedHead:(id)a3;
- (NSString)_axStatusText;
- (id)_axDisplayNameForCurrentHead;
- (id)_axPlaceholderView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axAnnounceCurrentHeadForce:(BOOL)a3;
- (void)_axSetStatusText:(id)a3;
- (void)pulseSelectedHead;
@end

@implementation SFMagicHeadWheelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFMagicHeadWheelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSString)_axStatusText
{
}

- (void)_axSetStatusText:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFMagicHeadWheelView", @"selectedHead", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFMagicHeadWheelView", @"centerOfContentBounds", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFMagicHeadWheelView", @"radius", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFMagicHeadWheelView", @"updateSelectedHead:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFMagicHeadWheelView", @"pulseSelectedHead", "v", 0);
  [v3 validateClass:@"SFMagicHead"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFMagicHead", @"node", "@", 0);
  [v3 validateClass:@"SFAirDropNode"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFAirDropNode", @"displayNameForLocale:", "@", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SFMagicHeadWheelViewAccessibility;
  return *MEMORY[0x263F1CF68] | [(SFMagicHeadWheelViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"placeholder.view.label");
}

- (id)accessibilityValue
{
  if ([(SFMagicHeadWheelViewAccessibility *)self _axIsShowingHead])
  {
    objc_super v3 = [(SFMagicHeadWheelViewAccessibility *)self _axDisplayNameForCurrentHead];
    v6 = [(SFMagicHeadWheelViewAccessibility *)self _axStatusText];
    v4 = __UIAXStringForVariables();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)accessibilityHint
{
  if ([(SFMagicHeadWheelViewAccessibility *)self _axIsShowingHead])
  {
    objc_super v3 = [(SFMagicHeadWheelViewAccessibility *)self _axDisplayNameForCurrentHead];
    v4 = [(SFMagicHeadWheelViewAccessibility *)self safeValueForKey:@"selectedHead"];
    v5 = [v4 safeValueForKey:@"node"];
    v6 = __UIAccessibilitySafeClass();

    v7 = [v6 contactIdentifier];

    if (v7) {
      v8 = @"magic.head.share.person.hint";
    }
    else {
      v8 = @"magic.head.share.device.hint";
    }
    v9 = accessibilityLocalizedString(v8);
    v10 = objc_msgSend(NSString, "localizedStringWithFormat:", v9, v3);
  }
  else
  {
    if (AXDeviceIsPad()) {
      v11 = @"magic.head.find.hint.ipad";
    }
    else {
      v11 = @"magic.head.find.hint.iphone";
    }
    v10 = accessibilityLocalizedString(v11);
  }

  return v10;
}

- (id)accessibilityPath
{
  [(SFMagicHeadWheelViewAccessibility *)self accessibilityFrame];
  AX_CGRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  [(SFMagicHeadWheelViewAccessibility *)self safeCGFloatForKey:@"radius"];
  v8 = (void *)MEMORY[0x263F1C478];

  return (id)objc_msgSend(v8, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v7 + -30.0, 0.0, 6.28318531);
}

- (BOOL)updateSelectedHead:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFMagicHeadWheelViewAccessibility;
  BOOL v4 = [(SFMagicHeadWheelViewAccessibility *)&v6 updateSelectedHead:a3];
  if (v4) {
    [(SFMagicHeadWheelViewAccessibility *)self _axAnnounceCurrentHeadForce:1];
  }
  return v4;
}

- (void)pulseSelectedHead
{
  v3.receiver = self;
  v3.super_class = (Class)SFMagicHeadWheelViewAccessibility;
  [(SFMagicHeadWheelViewAccessibility *)&v3 pulseSelectedHead];
  [(SFMagicHeadWheelViewAccessibility *)self _axAnnounceCurrentHeadForce:0];
}

- (id)_axPlaceholderView
{
  return (id)[(SFMagicHeadWheelViewAccessibility *)self safeUIViewForKey:@"placeHolderView"];
}

- (void)_axAnnounceCurrentHeadForce:(BOOL)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v6 = *(void *)&Current;
  if (a3 || Current - *(double *)&_axAnnounceCurrentHeadForce__LastAnnouncementTime > 4.0)
  {
    id v7 = [(SFMagicHeadWheelViewAccessibility *)self _axDisplayNameForCurrentHead];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v7);
    _axAnnounceCurrentHeadForce__LastAnnouncementTime = v6;
  }
}

- (id)_axDisplayNameForCurrentHead
{
  v2 = [(SFMagicHeadWheelViewAccessibility *)self safeValueForKey:@"selectedHead"];
  [v2 safeValueForKey:@"node"];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

void __65__SFMagicHeadWheelViewAccessibility__axDisplayNameForCurrentHead__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v3 = [v2 displayNameForLocale:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)_axIsShowingHead
{
  uint64_t v3 = [(SFMagicHeadWheelViewAccessibility *)self safeValueForKey:@"selectedHead"];
  int v4 = [(SFMagicHeadWheelViewAccessibility *)self safeBoolForKey:@"inGuidanceStates"] ^ 1;
  if (v3) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

@end