@interface UIColorWellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityColorWellStyle;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation UIColorWellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIColorWell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UIColorWell" hasInstanceVariable:@"_style" withType:"_UIColorWellVisualStyle"];
  [location[0] validateClass:@"_UIColorWelliOSVisualStyle" hasInstanceVariable:@"_button" withType:"UIButton"];
  objc_storeStrong(location, 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v43 = self;
  SEL v42 = a2;
  v41.receiver = self;
  v41.super_class = (Class)UIColorWellAccessibility;
  [(UIColorWellAccessibility *)&v41 _accessibilityLoadAccessibilityInformation];
  id v7 = [(UIColorWellAccessibility *)v43 _accessibilityColorWellStyle];
  uint64_t v8 = [v7 safeIvarForKey:@"_button"];

  v40 = (void **)v8;
  if (v8)
  {
    objc_initWeak(&location, v43);
    v6 = *v40;
    uint64_t v33 = MEMORY[0x263EF8330];
    int v34 = -1073741824;
    int v35 = 0;
    v36 = __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v37 = &unk_2650AE108;
    objc_copyWeak(&v38, &location);
    [v6 _setAccessibilityLabelBlock:&v33];
    v5 = *v40;
    uint64_t v27 = MEMORY[0x263EF8330];
    int v28 = -1073741824;
    int v29 = 0;
    v30 = __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v31 = &unk_2650AE108;
    objc_copyWeak(v32, &location);
    [v5 _setAccessibilityHintBlock:&v27];
    v4 = *v40;
    uint64_t v21 = MEMORY[0x263EF8330];
    int v22 = -1073741824;
    int v23 = 0;
    v24 = __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
    v25 = &unk_2650AE108;
    objc_copyWeak(&v26, &location);
    [v4 _setAccessibilityValueBlock:&v21];
    v3 = *v40;
    uint64_t v15 = MEMORY[0x263EF8330];
    int v16 = -1073741824;
    int v17 = 0;
    v18 = __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
    v19 = &unk_2650AE108;
    objc_copyWeak(&v20, &location);
    [v3 _setAccessibilityIdentifierBlock:&v15];
    v2 = *v40;
    uint64_t v9 = MEMORY[0x263EF8330];
    int v10 = -1073741824;
    int v11 = 0;
    v12 = __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
    v13 = &unk_2650AFB48;
    objc_copyWeak(&v14, &location);
    [v2 _setAccessibilityCustomContentBlock:&v9];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v26);
    objc_destroyWeak(v32);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
}

id __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  id v2 = (id)[v3[0] accessibilityLabel];
  objc_storeStrong(v3, 0);

  return v2;
}

id __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id *a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  id v2 = (id)[v3[0] accessibilityHint];
  objc_storeStrong(v3, 0);

  return v2;
}

id __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(id *a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  id v2 = (id)[v3[0] accessibilityValue];
  objc_storeStrong(v3, 0);

  return v2;
}

id __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(id *a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  id v2 = (id)[v3[0] accessibilityIdentifier];
  objc_storeStrong(v3, 0);

  return v2;
}

id __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(id *a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  id v2 = (id)[v3[0] accessibilityCustomContent];
  objc_storeStrong(v3, 0);

  return v2;
}

- (unint64_t)_accessibilityAutomationType
{
  return 67;
}

- (id)_accessibilityColorWellStyle
{
  v3 = (id *)[(UIColorWellAccessibility *)self safeIvarForKey:@"_style", 0, a2, self];
  if (v3) {
    id v4 = *v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)accessibilityValue
{
  id v7 = self;
  location[1] = (id)a2;
  v5.receiver = self;
  v5.super_class = (Class)UIColorWellAccessibility;
  location[0] = [(UIColorWellAccessibility *)&v5 accessibilityValue];
  if ([location[0] length])
  {
    id v8 = location[0];
  }
  else
  {
    id v4 = (id)[(UIColorWellAccessibility *)v7 selectedColor];
    id v8 = (id)[v4 _accessibilityColorDescription];
  }
  objc_storeStrong(location, 0);
  id v2 = v8;

  return v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  int v16 = self;
  location[1] = (id)a2;
  id v10 = [(UIColorWellAccessibility *)self _accessibilityColorWellStyle];
  location[0] = (id)[v10 safeValueForKey:@"_button"];

  if (location[0])
  {
    [location[0] accessibilityActivationPoint];
    *(void *)&long long v17 = v2;
    *((void *)&v17 + 1) = v3;
    if ((CGFloatIsValid() & 1) == 0 || (CGFloatIsValid() & 1) == 0)
    {
      [location[0] accessibilityFrame];
      CGRect rect = v19;
      CGRectGetMidX(v19);
      CGRectGetMidY(rect);
      CGPointMake_12();
      *(void *)&long long v13 = v4;
      *((void *)&v13 + 1) = v5;
      long long v17 = v13;
    }
    int v12 = 1;
  }
  else
  {
    v11.receiver = v16;
    v11.super_class = (Class)UIColorWellAccessibility;
    [(UIColorWellAccessibility *)&v11 accessibilityActivationPoint];
    *(void *)&long long v17 = v6;
    *((void *)&v17 + 1) = v7;
    int v12 = 1;
  }
  objc_storeStrong(location, 0);
  double v9 = *((double *)&v17 + 1);
  double v8 = *(double *)&v17;
  result.y = v9;
  result.x = v8;
  return result;
}

@end