@interface SBFLockScreenDateSubtitleDateViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityViewIsVisible;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_accessibilityParentView;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SBFLockScreenDateSubtitleDateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFLockScreenDateSubtitleDateView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBFLockScreenDateSubtitleDateView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SBFLockScreenDateSubtitleDateView" hasProperty:@"string" withType:"@"];
  [v3 validateClass:@"SBFLockScreenDateView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFLockScreenDateSubtitleDateView", @"alternateDateLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFLockScreenAlternateDateLabel", @"label", "@", 0);
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
  v7.super_class = (Class)SBFLockScreenDateSubtitleDateViewAccessibility;
  return [(SBFLockScreenDateSubtitleDateViewAccessibility *)&v7 _accessibilityViewIsVisible];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(SBFLockScreenDateSubtitleDateViewAccessibility *)self safeStringForKey:@"string"];
  double v4 = [(SBFLockScreenDateSubtitleDateViewAccessibility *)self safeValueForKey:@"alternateDateLabel"];

  if (v4)
  {
    double v5 = [(SBFLockScreenDateSubtitleDateViewAccessibility *)self safeValueForKeyPath:@"alternateDateLabel.label"];
    v6 = [v5 accessibilityLabel];

    objc_super v7 = __UIAXStringForVariables();
  }
  else
  {
    if (v3)
    {
      id v8 = v3;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)SBFLockScreenDateSubtitleDateViewAccessibility;
      id v8 = [(SBFLockScreenDateSubtitleDateViewAccessibility *)&v10 accessibilityLabel];
    }
    objc_super v7 = v8;
  }

  return v7;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return MEMORY[0x270F09FE0](self, a2);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF48];
}

- (CGRect)accessibilityFrame
{
  v2 = [(SBFLockScreenDateSubtitleDateViewAccessibility *)self safeValueForKey:@"alternateDateLabel"];

  if (v2)
  {
    [MEMORY[0x263F38720] frameForElements:2];
  }
  else
  {
    objc_opt_class();
    objc_super v7 = __UIAccessibilityCastAsClass();
    [v7 frame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    [MEMORY[0x263F38720] frameForElements:2];
    v14.origin.x = v9;
    v14.size.width = v11;
    v14.size.height = v13;
    *(CGRect *)&CGFloat v3 = CGRectInset(v14, -50.0, -5.0);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)_accessibilityParentView
{
  CGFloat v3 = [(SBFLockScreenDateSubtitleDateViewAccessibility *)self accessibilityContainer];
  if (v3
    && (NSClassFromString(&cfstr_Sbflockscreend_3.isa), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFLockScreenDateSubtitleDateViewAccessibility;
    id v4 = [(SBFLockScreenDateSubtitleDateViewAccessibility *)&v7 _accessibilityParentView];
  }
  double v5 = v4;

  return v5;
}

@end