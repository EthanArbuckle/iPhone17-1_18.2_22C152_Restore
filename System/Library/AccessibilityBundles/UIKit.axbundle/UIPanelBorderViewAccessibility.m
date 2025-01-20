@interface UIPanelBorderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (double)_accessibilityColumnWidth;
- (double)_accessibilityMaxValue;
- (double)_accessibilityMaximumColumnWidth;
- (double)_accessibilityMinValue;
- (double)_accessibilityMinimumColumnWidth;
- (double)_accessibilityNumberValue;
- (double)_accessibilitySplitViewControllerWidth;
- (id)_accessibilityRoleDescription;
- (id)_accessibilityUIViewAccessibilityFrame;
- (id)_axSplitViewControllerImplementation;
- (id)accessibilityValue;
- (int64_t)_accessibilityOrientation;
- (uint64_t)_axIsPrimaryBorder;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetBorderFloatValue:(void *)a1;
- (void)_accessibilitySetValue:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setAccessibilityValue:(id)a3;
@end

@implementation UIPanelBorderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPanelBorderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axSplitViewControllerImplementation
{
  if (a1) {
    id v2 = (id)__UIAccessibilityGetAssociatedNonRetainedObject();
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)_axIsPrimaryBorder
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  id v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UIPanelBorderView" isKindOfClass:@"UIView"];
  v7 = @"UISplitViewControllerPanelImpl";
  v3 = @"_svc";
  v4 = "UISplitViewController";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UISplitViewControllerClassicImpl" hasInstanceVariable:@"_svc" withType:"UISplitViewController"];
  v5 = @"primaryColumnWidth";
  v8 = "d";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UISplitViewControllerPanelImpl", 0);
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"setPreferredPrimaryColumnWidthFraction:", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"minimumPrimaryColumnWidth", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, v5, v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"maximumPrimaryColumnWidth", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"supplementaryColumnWidth", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"setPreferredSupplementaryColumnWidthFraction:", v6, v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"minimumSupplementaryColumnWidth", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"maximumSupplementaryColumnWidth", v8, 0);
  objc_storeStrong(v10, v9);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_accessibilityUIViewAccessibilityFrame
{
  [(UIPanelBorderViewAccessibility *)self accessibilityFrame];
  *(void *)&long long v13 = v3;
  *((void *)&v13 + 1) = v4;
  *(double *)&long long v14 = v2;
  *((void *)&v14 + 1) = v5;
  if (v2 < 1.0 && v2 > 0.0)
  {
    CGRectMake();
    *(void *)&long long v11 = v6;
    *((void *)&v11 + 1) = v7;
    *(void *)&long long v12 = v8;
    *((void *)&v12 + 1) = v9;
    long long v13 = v11;
    long long v14 = v12;
  }
  return (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v13, v14);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8] | *MEMORY[0x263F21B20];
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(@"splitter.role.description");
}

- (id)accessibilityValue
{
  return (id)AXFormatFloatWithPercentage();
}

- (void)setAccessibilityValue:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v4 = v6;
  [location[0] floatValue];
  -[UIPanelBorderViewAccessibility _accessibilitySetBorderFloatValue:](v4, v3);
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySetBorderFloatValue:(void *)a1
{
  id v8 = a1;
  double v7 = a2;
  if (a1)
  {
    [v8 _accessibilityMinValue];
    double v4 = v2;
    [v8 _accessibilityMaxValue];
    double v6 = CGFloatMinMax(v7, v4, v3) / 100.0;
    v5[0] = v8;
    v5[1] = *(id *)&v6;
    AXPerformSafeBlock();
    objc_storeStrong(v5, 0);
  }
}

- (void)_accessibilitySetValue:(id)a3
{
  double v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v4 = v6;
  [location[0] floatValue];
  -[UIPanelBorderViewAccessibility _accessibilitySetBorderFloatValue:](v4, v3);
  objc_storeStrong(location, 0);
}

- (double)_accessibilityNumberValue
{
  double v4 = -[UIPanelBorderViewAccessibility _accessibilityColumnWidth]((uint64_t)self);
  double v2 = -[UIPanelBorderViewAccessibility _accessibilitySplitViewControllerWidth]((uint64_t)self);
  return CGFloatMinMax(v4 / v2, 0.0, 1.0) * 100.0;
}

- (double)_accessibilityColumnWidth
{
  uint64_t v6 = a1;
  if (!a1) {
    return 0.0;
  }
  if (-[UIPanelBorderViewAccessibility _axIsPrimaryBorder](v6)) {
    v1 = @"primaryColumnWidth";
  }
  else {
    v1 = @"supplementaryColumnWidth";
  }
  uint64_t v5 = v1;
  id v4 = -[UIPanelBorderViewAccessibility _axSplitViewControllerImplementation](v6);
  [v4 safeCGFloatForKey:v5];
  double v7 = v2;

  objc_storeStrong((id *)&v5, 0);
  return v7;
}

- (double)_accessibilitySplitViewControllerWidth
{
  uint64_t v10 = a1;
  if (!a1) {
    return 0.0;
  }
  char v8 = 0;
  objc_opt_class();
  id v5 = -[UIPanelBorderViewAccessibility _axSplitViewControllerImplementation](v10);
  id v4 = (id)[v5 safeValueForKey:@"_svc"];
  id v7 = (id)__UIAccessibilityCastAsClass();

  id v6 = v7;
  objc_storeStrong(&v7, 0);
  id v9 = v6;
  id v3 = (id)[v6 view];
  [v3 bounds];
  double v11 = v1;

  objc_storeStrong(&v9, 0);
  return v11;
}

- (double)_accessibilityMinValue
{
  double v4 = -[UIPanelBorderViewAccessibility _accessibilityMinimumColumnWidth]((uint64_t)self);
  double v2 = -[UIPanelBorderViewAccessibility _accessibilitySplitViewControllerWidth]((uint64_t)self);
  return CGFloatMax(v4 / v2, 0.0) * 100.0;
}

- (double)_accessibilityMinimumColumnWidth
{
  uint64_t v8 = a1;
  if (!a1) {
    return 0.0;
  }
  if (-[UIPanelBorderViewAccessibility _axIsPrimaryBorder](v8)) {
    double v1 = @"minimumPrimaryColumnWidth";
  }
  else {
    double v1 = @"minimumSupplementaryColumnWidth";
  }
  id location = v1;
  id v4 = -[UIPanelBorderViewAccessibility _axSplitViewControllerImplementation](v8);
  [v4 safeCGFloatForKey:location];
  double v5 = v2;

  double v6 = v5;
  if (v5 == *MEMORY[0x263F1D5E8]) {
    double v6 = 0.01 * -[UIPanelBorderViewAccessibility _accessibilitySplitViewControllerWidth](v8);
  }
  double v9 = v6;
  objc_storeStrong(&location, 0);
  return v9;
}

- (double)_accessibilityMaxValue
{
  double v4 = -[UIPanelBorderViewAccessibility _accessibilityMaximumColumnWidth]((uint64_t)self);
  double v2 = -[UIPanelBorderViewAccessibility _accessibilitySplitViewControllerWidth]((uint64_t)self);
  return CGFloatMin(v4 / v2, 1.0) * 100.0;
}

- (double)_accessibilityMaximumColumnWidth
{
  uint64_t v8 = a1;
  if (!a1) {
    return 0.0;
  }
  if (-[UIPanelBorderViewAccessibility _axIsPrimaryBorder](v8)) {
    double v1 = @"maximumPrimaryColumnWidth";
  }
  else {
    double v1 = @"maximumSupplementaryColumnWidth";
  }
  id location = v1;
  id v4 = -[UIPanelBorderViewAccessibility _axSplitViewControllerImplementation](v8);
  [v4 safeCGFloatForKey:location];
  double v5 = v2;

  double v6 = v5;
  if (v5 == *MEMORY[0x263F1D5E8]) {
    double v6 = 0.4 * -[UIPanelBorderViewAccessibility _accessibilitySplitViewControllerWidth](v8);
  }
  double v9 = v6;
  objc_storeStrong(&location, 0);
  return v9;
}

- (int64_t)_accessibilityOrientation
{
  return 1;
}

- (void)accessibilityIncrement
{
  [(UIPanelBorderViewAccessibility *)self _accessibilityNumberValue];
  -[UIPanelBorderViewAccessibility _accessibilitySetBorderFloatValue:](self, v2 + 5.0);
}

- (void)accessibilityDecrement
{
  [(UIPanelBorderViewAccessibility *)self _accessibilityNumberValue];
  -[UIPanelBorderViewAccessibility _accessibilitySetBorderFloatValue:](self, v2 - 5.0);
}

void __68__UIPanelBorderViewAccessibility__accessibilitySetBorderFloatValue___block_invoke(uint64_t a1)
{
  if (-[UIPanelBorderViewAccessibility _axIsPrimaryBorder](*(void *)(a1 + 32)))
  {
    id v2 = -[UIPanelBorderViewAccessibility _axSplitViewControllerImplementation](*(void *)(a1 + 32));
    [v2 setPreferredPrimaryColumnWidthFraction:*(double *)(a1 + 40)];
  }
  else
  {
    id v1 = -[UIPanelBorderViewAccessibility _axSplitViewControllerImplementation](*(void *)(a1 + 32));
    [v1 setPreferredSupplementaryColumnWidthFraction:*(double *)(a1 + 40)];
  }
}

@end