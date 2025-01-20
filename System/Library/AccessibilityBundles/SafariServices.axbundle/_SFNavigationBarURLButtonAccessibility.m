@interface _SFNavigationBarURLButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (CGRect)accessibilityFrame:(id)a3;
- (id)accessibilityElements;
- (id)accessibilityLabel:(id)a3;
- (id)accessibilityValue:(id)a3;
- (unint64_t)accessibilityTraits:(id)a3;
@end

@implementation _SFNavigationBarURLButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFNavigationBarURLButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_progressView" withType:"_SFFluidProgressView"];
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_URLLabel" withType:"SFURLLabel"];
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_URLOutline" withType:"_SFNavigationBarURLButton"];
  [v3 validateClass:@"_SFFluidProgressView" hasInstanceVariable:@"_state" withType:"WBSFluidProgressState"];
  [v3 validateClass:@"_SFNavigationBarURLButton" isKindOfClass:@"UIButton"];
}

- (id)accessibilityLabel:(id)a3
{
  id v3 = [(_SFNavigationBarURLButtonAccessibility *)self _accessibilityViewAncestorIsKindOf:MEMORY[0x24565E530](@"_SFNavigationBar", a2, a3)];
  v4 = [v3 safeValueForKey:@"_URLOutline"];
  v5 = [v4 accessibilityLabel];

  return v5;
}

- (unint64_t)accessibilityTraits:(id)a3
{
  return *MEMORY[0x263F1CF68];
}

- (CGRect)accessibilityFrame:(id)a3
{
  id v4 = a3;
  v5 = [(_SFNavigationBarURLButtonAccessibility *)self _accessibilityViewAncestorIsKindOf:MEMORY[0x24565E530](@"_SFNavigationBar")];
  objc_opt_class();
  v6 = [v5 safeValueForKey:@"_URLLabel"];
  v7 = __UIAccessibilityCastAsClass();

  [v7 accessibilityFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityValue:(id)a3
{
  id v3 = [(_SFNavigationBarURLButtonAccessibility *)self _accessibilityViewAncestorIsKindOf:MEMORY[0x24565E530](@"_SFNavigationBar", a2, a3)];
  id v4 = [v3 safeValueForKey:@"_progressView"];
  v5 = [v4 safeValueForKey:@"_state"];
  v6 = [v5 safeValueForKey:@"fluidProgressValue"];
  [v6 floatValue];
  float v8 = v7;

  double v9 = 0;
  if (v8 < 1.0 && v8 > 0.0)
  {
    double v9 = AXFormatFloatWithPercentage();
  }
  double v10 = [v3 safeValueForKey:@"_URLOutline"];
  double v13 = [v10 accessibilityValue];
  double v11 = __UIAXStringForVariables();

  return v11;
}

- (BOOL)accessibilityElementsHidden
{
  return [(_SFNavigationBarURLButtonAccessibility *)self isUserInteractionEnabled] ^ 1;
}

- (id)accessibilityElements
{
  v15[1] = *MEMORY[0x263EF8340];
  if ([(_SFNavigationBarURLButtonAccessibility *)self isUserInteractionEnabled])
  {
    id v3 = (void *)MEMORY[0x263F81490];
    id v4 = [(_SFNavigationBarURLButtonAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
    if (!v4)
    {
      id v4 = [MEMORY[0x263EFF980] array];
      v5 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
      [v5 setAccessibilityDelegate:self];
      v6 = [(_SFNavigationBarURLButtonAccessibility *)self accessibilityIdentifier];
      [v5 setAccessibilityIdentifier:v6];

      objc_opt_class();
      float v7 = __UIAccessibilityCastAsClass();
      id v8 = objc_alloc(MEMORY[0x263F1C3B8]);
      double v9 = accessibilitySafariServicesLocalizedString(@"drop.onto.address.bar");
      double v10 = (void *)[v8 initWithName:v9 view:v7];

      v15[0] = v10;
      double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
      [v5 setAccessibilityDropPointDescriptors:v11];

      [v4 addObject:v5];
      [(_SFNavigationBarURLButtonAccessibility *)self _accessibilitySetRetainedValue:v4 forKey:*v3];
    }
    double v12 = (void *)[v4 mutableCopy];

    double v13 = [(_SFNavigationBarURLButtonAccessibility *)self safeValueForKey:@"_accessibleSubviews"];
    [v12 addObjectsFromArray:v13];
    [v12 sortUsingSelector:sel_accessibilityCompareGeometry_];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (CGRect)accessibilityFrame
{
  [(_SFNavigationBarURLButtonAccessibility *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (AXRequestingClient() && AXRequestingClient() != 10)
  {
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    *(CGRect *)v11.n128_u64 = CGRectInset(v20, 10.0, 0.0);
    CGFloat v4 = v11.n128_f64[0];
    CGFloat v6 = v12.n128_f64[0];
    CGFloat v8 = v13.n128_f64[0];
    CGFloat v10 = v14.n128_f64[0];
  }
  v11.n128_f64[0] = v4;
  v12.n128_f64[0] = v6;
  v13.n128_f64[0] = v8;
  v14.n128_f64[0] = v10;

  MEMORY[0x270F80998](self, v11, v12, v13, v14);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 0;
}

@end