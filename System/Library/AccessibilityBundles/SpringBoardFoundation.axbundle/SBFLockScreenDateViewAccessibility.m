@interface SBFLockScreenDateViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAllowOutOfBoundsHitTestAtPoint:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)_accessibilityOverridesInvisibility;
- (BOOL)_accessibilityServesAsFirstElement;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (BOOL)_accessibilityViewIsVisible;
- (BOOL)_axIsComplicationViewVisible;
- (BOOL)_axIsCustomSubtitleViewVisible;
- (BOOL)_axIsDateViewVisible;
- (BOOL)_axIsInlineWidgetVisible;
- (CGRect)_axTimeLabelFrame;
- (CGRect)accessibilityFrame;
- (SBFLockScreenDateViewAccessibility)initWithFrame:(CGRect)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_axComplicationContainerViewController;
- (id)_axCustomSubtitleView;
- (id)_axElements:(BOOL)a3;
- (id)_axInlineComplicationViewController;
- (id)_axSidebarComplicationContainerViewController;
- (id)_axWidgetFromController:(id)a3;
- (id)accessibilityElements;
- (id)automationElements;
- (int64_t)_accessibilitySortPriority;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateLabels;
- (void)layoutSubviews;
@end

@implementation SBFLockScreenDateViewAccessibility

- (void)_updateLabels
{
  v3.receiver = self;
  v3.super_class = (Class)SBFLockScreenDateViewAccessibility;
  [(SBFLockScreenDateViewAccessibility *)&v3 _updateLabels];
  [(SBFLockScreenDateViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateViewAccessibility;
  [(SBFLockScreenDateViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(SBFLockScreenDateViewAccessibility *)self safeUIViewForKey:@"_timeLabel"];
  [v3 accessibilitySetIdentification:@"LockScreenTimeLabel"];
}

+ (id)safeCategoryTargetClassName
{
  return @"SBFLockScreenDateView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  if (AXProcessIsSpringBoard())
  {
    [v3 validateClass:@"SBFLockScreenDateView" isKindOfClass:@"UIView"];
    [v3 validateClass:@"CSCoverSheetViewController"];
  }
  [v3 validateClass:@"SBFLockScreenDateView" hasInstanceVariable:@"_timeLabel" withType:"SBUILegibilityLabel"];
  [v3 validateClass:@"SBFLockScreenDateView" hasInstanceVariable:@"_dateSubtitleView" withType:"SBFLockScreenDateSubtitleDateView"];
  [v3 validateClass:@"SBFLockScreenDateView" hasInstanceVariable:@"_customSubtitleView" withType:"SBFLockScreenDateSubtitleView"];
  [v3 validateClass:@"SBFLockScreenDateSubtitleView" hasInstanceVariable:@"_label" withType:"SBUILegibilityLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFLockScreenDateSubtitleView", @"string", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFLockScreenDateView", @"_updateLabels", "v", 0);
  [v3 validateClass:@"SBFLockScreenDateViewController" hasProperty:@"inlineComplicationViewController" withType:"@"];
  [v3 validateClass:@"SBFLockScreenDateViewController" hasProperty:@"complicationContainerViewController" withType:"@"];
  if (NSClassFromString(&cfstr_Chuiswidgethos.isa)) {
    [v3 validateClass:@"CHUISWidgetHostViewController" hasInstanceVariable:@"_vibrancyEffectView" withType:"BSUIVibrancyEffectView"];
  }
  [v3 validateClass:@"BSUIVibrancyEffectView" hasProperty:@"contentView" withType:"@"];
}

- (id)accessibilityElements
{
  return [(SBFLockScreenDateViewAccessibility *)self _axElements:0];
}

- (id)automationElements
{
  return [(SBFLockScreenDateViewAccessibility *)self _axElements:1];
}

- (id)_axElements:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v46 = *MEMORY[0x263EF8340];
  v40 = [MEMORY[0x263EFF980] array];
  v5 = [(SBFLockScreenDateViewAccessibility *)self safeUIViewForKey:@"_timeLabel"];
  v6 = [(SBFLockScreenDateViewAccessibility *)self safeUIViewForKey:@"_customSubtitleView"];
  v7 = [(SBFLockScreenDateViewAccessibility *)self safeUIViewForKey:@"_dateSubtitleView"];
  if ([v6 _accessibilityViewIsVisible]) {
    [v40 axSafelyAddObject:v6];
  }
  if ([(SBFLockScreenDateViewAccessibility *)self _axIsDateViewVisible])
  {
    id v8 = v7;
LABEL_7:
    v10 = v8;
    goto LABEL_8;
  }
  v9 = [(SBFLockScreenDateViewAccessibility *)self _axCustomSubtitleView];

  if (v9)
  {
    id v8 = [(SBFLockScreenDateViewAccessibility *)self _axCustomSubtitleView];
    goto LABEL_7;
  }
  v31 = [(SBFLockScreenDateViewAccessibility *)self _axInlineComplicationViewController];
  v32 = v31;
  if (v3)
  {
    v10 = [v31 view];
  }
  else
  {
    v33 = [v31 safeValueForKeyPath:@"widgetViewController.widgetHostViewController"];

    v10 = [(SBFLockScreenDateViewAccessibility *)self _axWidgetFromController:v33];
  }
LABEL_8:
  [v10 _setAccessibilityIsNotFirstElement:1];
  [v40 axSafelyAddObject:v10];
  if ([v5 _accessibilityViewIsVisible]) {
    [v40 axSafelyAddObject:v5];
  }
  if ([(SBFLockScreenDateViewAccessibility *)self _axIsComplicationViewVisible])
  {
    if ((unint64_t)([(id)*MEMORY[0x263F1D020] activeInterfaceOrientation] - 1) >= 2) {
      [(SBFLockScreenDateViewAccessibility *)self _axSidebarComplicationContainerViewController];
    }
    else {
    v11 = [(SBFLockScreenDateViewAccessibility *)self _axComplicationContainerViewController];
    }
    v12 = v11;
    if (v3)
    {
      v13 = [v11 view];
      [v40 axSafelyAddObject:v13];
    }
    else
    {
      v35 = v10;
      v36 = v7;
      v38 = v5;
      v39 = self;
      v37 = v6;
      v34 = v11;
      v14 = [v11 safeValueForKey:@"widgetGridViewController"];
      id v15 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v16 = v14;
      v17 = [v14 safeValueForKey:@"model"];
      v18 = [v17 safeArrayForKey:@"complicationDescriptors"];

      uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v42 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            v24 = [v23 safeStringForKey:@"uniqueIdentifier"];
            char v25 = [v15 containsObject:v24];

            if ((v25 & 1) == 0)
            {
              v26 = [v16 widgetHostViewControllerForComplicationDescriptor:v23];
              v27 = [(SBFLockScreenDateViewAccessibility *)v39 _axWidgetFromController:v26];
              [v40 axSafelyAddObject:v27];

              v28 = [v23 safeStringForKey:@"uniqueIdentifier"];
              [v15 addObject:v28];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v20);
      }

      v6 = v37;
      v5 = v38;
      v10 = v35;
      v7 = v36;
      v12 = v34;
    }
  }
  v29 = [v40 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];

  return v29;
}

- (BOOL)_accessibilityServesAsFirstElement
{
  if ([(SBFLockScreenDateViewAccessibility *)self _axIsDateViewVisible]) {
    return 0;
  }
  else {
    return ![(SBFLockScreenDateViewAccessibility *)self _axIsCustomSubtitleViewVisible];
  }
}

- (CGRect)accessibilityFrame
{
  v30.receiver = self;
  v30.super_class = (Class)SBFLockScreenDateViewAccessibility;
  [(SBFLockScreenDateViewAccessibility *)&v30 accessibilityFrame];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  v11 = [(SBFLockScreenDateViewAccessibility *)self safeUIViewForKey:@"_timeLabel"];
  if ([v11 _accessibilityViewIsVisible])
  {
    [v11 accessibilityFrame];
    v38.origin.CGFloat x = v12;
    v38.origin.CGFloat y = v13;
    v38.size.CGFloat width = v14;
    v38.size.CGFloat height = v15;
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    CGRect v32 = CGRectUnion(v31, v38);
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
  }
  v16 = [(SBFLockScreenDateViewAccessibility *)self safeUIViewForKey:@"_dateSubtitleView"];
  if ([(SBFLockScreenDateViewAccessibility *)self _axIsDateViewVisible])
  {
    [v16 accessibilityFrame];
    v39.origin.CGFloat x = v17;
    v39.origin.CGFloat y = v18;
    v39.size.CGFloat width = v19;
    v39.size.CGFloat height = v20;
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    CGRect v34 = CGRectUnion(v33, v39);
    CGFloat x = v34.origin.x;
    CGFloat y = v34.origin.y;
    CGFloat width = v34.size.width;
    CGFloat height = v34.size.height;
  }
  uint64_t v21 = [(SBFLockScreenDateViewAccessibility *)self safeUIViewForKey:@"_customSubtitleView"];
  if ([v21 _accessibilityViewIsVisible])
  {
    [v21 accessibilityFrame];
    v40.origin.CGFloat x = v22;
    v40.origin.CGFloat y = v23;
    v40.size.CGFloat width = v24;
    v40.size.CGFloat height = v25;
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    CGRect v36 = CGRectUnion(v35, v40);
    CGFloat x = v36.origin.x;
    CGFloat y = v36.origin.y;
    CGFloat width = v36.size.width;
    CGFloat height = v36.size.height;
  }

  double v26 = x;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (CGRect)_axTimeLabelFrame
{
  v2 = [(SBFLockScreenDateViewAccessibility *)self safeUIViewForKey:@"_timeLabel"];
  [v2 frame];
  CGRect v13 = CGRectInset(v12, -25.0, 0.0);
  CGFloat x = v13.origin.x;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  [MEMORY[0x263F38720] frameForElements:1];
  double v7 = v6;

  double v8 = x;
  double v9 = v7;
  double v10 = width;
  double v11 = height;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (BOOL)_accessibilityOverridesInvisibility
{
  return 1;
}

- (BOOL)_accessibilityViewIsVisible
{
  double v3 = [(SBFLockScreenDateViewAccessibility *)self safeUIViewForKey:@"_timeLabel"];
  if ([v3 _accessibilityViewIsVisible])
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(SBFLockScreenDateViewAccessibility *)self safeUIViewForKey:@"_customSubtitleView"];
    BOOL v4 = ([v5 _accessibilityViewIsVisible] & 1) != 0
      || [(SBFLockScreenDateViewAccessibility *)self _axIsDateViewVisible];
  }
  return v4;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (BOOL)_accessibilityAllowOutOfBoundsHitTestAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  return 1;
}

- (SBFLockScreenDateViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFLockScreenDateViewAccessibility;
  double v3 = -[SBFLockScreenDateViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SBFLockScreenDateViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(SBFLockScreenDateViewAccessibility *)self safeUIViewForKey:@"_dateSubtitleView"];
  double v9 = [(SBFLockScreenDateViewAccessibility *)self safeUIViewForKey:@"_timeLabel"];
  if (v8
    && [(SBFLockScreenDateViewAccessibility *)self _axIsDateViewVisible]
    && ([v8 accessibilityFrame], v15.double x = x, v15.y = y, CGRectContainsPoint(v17, v15)))
  {
    id v10 = v8;
  }
  else if (v9 && ([v9 accessibilityFrame], v16.double x = x, v16.y = y, CGRectContainsPoint(v18, v16)))
  {
    id v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBFLockScreenDateViewAccessibility;
    -[SBFLockScreenDateViewAccessibility _accessibilityHitTest:withEvent:](&v13, sel__accessibilityHitTest_withEvent_, v7, x, y);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v11 = v10;

  return v11;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)SBFLockScreenDateViewAccessibility;
  [(SBFLockScreenDateViewAccessibility *)&v2 layoutSubviews];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)_axInlineComplicationViewController
{
  objc_opt_class();
  double v3 = [(SBFLockScreenDateViewAccessibility *)self _accessibilityViewController];
  BOOL v4 = [v3 safeValueForKey:@"inlineComplicationViewController"];
  objc_super v5 = __UIAccessibilityCastAsClass();

  return v5;
}

- (BOOL)_axIsDateViewVisible
{
  if ([(SBFLockScreenDateViewAccessibility *)self _axIsInlineWidgetVisible]
    || [(SBFLockScreenDateViewAccessibility *)self _axIsCustomSubtitleViewVisible])
  {
    return 0;
  }
  BOOL v4 = [(SBFLockScreenDateViewAccessibility *)self safeUIViewForKey:@"_dateSubtitleView"];
  char v5 = [v4 _accessibilityViewIsVisible];

  return v5;
}

- (BOOL)_axIsCustomSubtitleViewVisible
{
  objc_super v2 = [(SBFLockScreenDateViewAccessibility *)self _axCustomSubtitleView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_axCustomSubtitleView
{
  return (id)[(SBFLockScreenDateViewAccessibility *)self safeValueForKeyPath:@"prominentDisplayViewController.displayView.customSubtitleView"];
}

- (id)_axComplicationContainerViewController
{
  objc_opt_class();
  BOOL v3 = [(SBFLockScreenDateViewAccessibility *)self _accessibilityViewController];
  BOOL v4 = [v3 safeValueForKey:@"complicationContainerViewController"];
  char v5 = __UIAccessibilityCastAsClass();

  return v5;
}

- (id)_axSidebarComplicationContainerViewController
{
  objc_opt_class();
  BOOL v3 = [(SBFLockScreenDateViewAccessibility *)self _accessibilityViewController];
  BOOL v4 = [v3 parentViewController];
  char v5 = [v4 safeValueForKey:@"sidebarComplicationContainerViewController"];
  double v6 = __UIAccessibilityCastAsClass();

  return v6;
}

- (BOOL)_axIsInlineWidgetVisible
{
  objc_super v2 = [(SBFLockScreenDateViewAccessibility *)self _axInlineComplicationViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_axIsComplicationViewVisible
{
  objc_super v2 = [(SBFLockScreenDateViewAccessibility *)self _axComplicationContainerViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_axWidgetFromController:(id)a3
{
  id v4 = a3;
  if (NSClassFromString(&cfstr_Cscoversheetvi_0.isa))
  {
    char v5 = [(SBFLockScreenDateViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Cscoversheetvi_0.isa)];
    double v6 = [v5 safeValueForKey:@"backgroundContentView"];

    if ([v6 _accessibilityViewIsVisible])
    {
      id v7 = 0;
    }
    else
    {
      double v8 = [v4 safeValueForKeyPath:@"_vibrancyEffectView.contentView"];
      id v7 = [v8 _accessibilityDescendantOfType:objc_opt_class()];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end