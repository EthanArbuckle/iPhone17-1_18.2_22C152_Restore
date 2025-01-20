@interface SBAppResizeGrabberViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation SBAppResizeGrabberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAppResizeGrabberView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBAppResizeGrabberView" hasInstanceVariable:@"_corner" withType:"NSUInteger"];
  [v3 validateClass:@"SBReusableSnapshotItemContainer"];
}

- (id)accessibilityLabel
{
  v2 = [(SBAppResizeGrabberViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbreusablesnap.isa)];
  id v3 = [v2 accessibilityLabel];
  if (v3) {
    [v2 accessibilityLabel];
  }
  else {
  v4 = accessibilityLocalizedString(@"app.resize.grabber.window.label");
  }

  v5 = accessibilityLocalizedString(@"app.resize.grabber.label");
  v6 = AXCFormattedString();

  return v6;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"app.resize.grabber.hint");
}

- (id)accessibilityValue
{
  unint64_t v3 = [(SBAppResizeGrabberViewAccessibility *)self safeIntegerForKey:@"_corner"];
  if (v3 > 3
    || (accessibilityLocalizedString(off_265153D28[v3]), (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6.receiver = self;
    v6.super_class = (Class)SBAppResizeGrabberViewAccessibility;
    v4 = [(SBAppResizeGrabberViewAccessibility *)&v6 accessibilityValue];
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end