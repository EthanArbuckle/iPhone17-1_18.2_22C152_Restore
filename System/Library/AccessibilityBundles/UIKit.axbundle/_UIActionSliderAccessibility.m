@interface _UIActionSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIActionSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIActionSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"_UIActionSlider";
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"trackMaskPath", v3, 0);
  [location[0] validateClass:v4 hasInstanceVariable:@"_knobView" withType:"_UIActionSliderKnob"];
  [location[0] validateClass:v4 hasInstanceVariable:@"_trackBackgroundView" withType:"UIView"];
  objc_storeStrong(v6, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v9 = self;
  location[1] = (id)a2;
  id v2 = (id)[(_UIActionSliderAccessibility *)self accessibilityUserDefinedLabel];
  BOOL v5 = v2 == 0;

  if (v5)
  {
    location[0] = (id)[(_UIActionSliderAccessibility *)v9 safeValueForKey:@"trackText"];
    if ([location[0] length])
    {
      id v10 = location[0];
    }
    else
    {
      v6.receiver = v9;
      v6.super_class = (Class)_UIActionSliderAccessibility;
      id v10 = [(_UIActionSliderAccessibility *)&v6 accessibilityLabel];
    }
    int v7 = 1;
    objc_storeStrong(location, 0);
  }
  else
  {
    id v10 = (id)[(_UIActionSliderAccessibility *)v9 accessibilityUserDefinedLabel];
  }
  v3 = v10;

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  v11 = self;
  v10[1] = (id)a2;
  v10[0] = (id)[(_UIActionSliderAccessibility *)self safeValueForKey:@"delegate"];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  objc_super v6 = __53___UIActionSliderAccessibility_accessibilityActivate__block_invoke;
  int v7 = &unk_2650ADFB0;
  id v8 = v10[0];
  v9 = v11;
  AXPerformSafeBlock();
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v10, 0);
  return 1;
}

- (id)accessibilityPath
{
  id v10 = self;
  v9[1] = (id)a2;
  char v8 = 0;
  id v5 = (id)[(_UIActionSliderAccessibility *)self safeValueForKey:@"trackMaskPath"];
  id v7 = (id)__UIAccessibilitySafeClass();

  objc_super v6 = (UIBezierPath *)v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  uint64_t v3 = (UIView *)(id)[(_UIActionSliderAccessibility *)v10 safeUIViewForKey:@"_trackBackgroundView"];
  int v4 = UIAccessibilityConvertPathToScreenCoordinates(v6, v3);

  objc_storeStrong(v9, 0);

  return v4;
}

- (CGRect)accessibilityFrame
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = [(_UIActionSliderAccessibility *)self accessibilityPath];
  if (location[0])
  {
    *(CGRect *)&double v2 = CGPathGetBoundingBox((CGPathRef)[location[0] CGPath]);
  }
  else
  {
    v10.receiver = v12;
    v10.super_class = (Class)_UIActionSliderAccessibility;
    [(_UIActionSliderAccessibility *)&v10 accessibilityFrame];
  }
  double v13 = v2;
  double v14 = v3;
  double v15 = v4;
  double v16 = v5;
  objc_storeStrong(location, 0);
  double v6 = v13;
  double v7 = v14;
  double v8 = v15;
  double v9 = v16;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  id v6 = (id)[(_UIActionSliderAccessibility *)self safeValueForKey:@"_knobView"];
  [v6 accessibilityActivationPoint];
  double v7 = v2;
  double v8 = v3;

  double v4 = v7;
  double v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)accessibilityHint
{
  id v4 = (id)[(_UIActionSliderAccessibility *)self accessibilityUserDefinedHint];
  char v7 = 0;
  char v5 = 0;
  if (v4)
  {
    id v6 = (id)[(_UIActionSliderAccessibility *)self accessibilityUserDefinedHint];
    char v5 = 1;
    id v2 = v6;
  }
  else
  {
    id v8 = (id)UIKitAccessibilityLocalizedString();
    char v7 = 1;
    id v2 = v8;
  }
  objc_super v10 = v2;
  if (v5) {

  }
  if (v7) {

  }
  return v10;
}

@end