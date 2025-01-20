@interface NTKAnalogHandsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityLabel;
@end

@implementation NTKAnalogHandsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKAnalogHandsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKAnalogHandsView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(NTKAnalogHandsViewAccessibility *)self isAccessibilityUserDefinedElement];

  if (v3)
  {
    v4 = [(NTKAnalogHandsViewAccessibility *)self isAccessibilityUserDefinedElement];
    unsigned __int8 v5 = [v4 BOOLValue];

    return v5;
  }
  else
  {
    return [(NTKAnalogHandsViewAccessibility *)self _accessibilityViewIsVisible];
  }
}

- (id)accessibilityLabel
{
  id v3 = [(NTKAnalogHandsViewAccessibility *)self accessibilityUserDefinedLabel];

  if (v3) {
    [(NTKAnalogHandsViewAccessibility *)self accessibilityUserDefinedLabel];
  }
  else {
  v4 = AXClockTimeVoiceOverSpokenStringForWatchFaces();
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  v2 = [(NTKAnalogHandsViewAccessibility *)self accessibilityPath];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(NTKAnalogHandsViewAccessibility *)self _accessibilityParentView];
  UIAccessibilityPointForPoint();
  double v10 = v9;
  double v12 = v11;

  double v13 = [(NTKAnalogHandsViewAccessibility *)self accessibilityPath];
  if (v13)
  {
    if (![(NTKAnalogHandsViewAccessibility *)self isAccessibilityElement]
      || !objc_msgSend(v13, "containsPoint:", x, y))
    {
      v15 = 0;
      goto LABEL_8;
    }
    double v14 = self;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NTKAnalogHandsViewAccessibility;
    -[NTKAnalogHandsViewAccessibility _accessibilityHitTest:withEvent:](&v17, "_accessibilityHitTest:withEvent:", v7, v10, v12);
    double v14 = (NTKAnalogHandsViewAccessibility *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
LABEL_8:

  return v15;
}

- (BOOL)canBecomeFocused
{
  if ([(NTKAnalogHandsViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)NTKAnalogHandsViewAccessibility;
  return [(NTKAnalogHandsViewAccessibility *)&v4 canBecomeFocused];
}

@end