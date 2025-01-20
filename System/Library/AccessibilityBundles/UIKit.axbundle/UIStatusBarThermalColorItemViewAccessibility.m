@interface UIStatusBarThermalColorItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIStatusBarThermalColorItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarThermalColorItemView";
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
  [location[0] validateClass:@"UIStatusBarThermalColorItemView" hasInstanceVariable:@"_sunlightMode" withType:"B"];
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v24 = self;
  SEL v23 = a2;
  v22[8] = 0;
  *(void *)v22 = [(UIStatusBarThermalColorItemViewAccessibility *)self safeBoolForKey:@"_sunlightMode"] & 1;
  id v18 = (id)[(UIStatusBarThermalColorItemViewAccessibility *)v24 safeValueForKey:@"_thermalColor"];
  unsigned int v19 = [v18 intValue];

  if (v19)
  {
    uint64_t v3 = v19;
    char v2 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    char v2 = 0;
  }
  if ((v2 & 1) == 0)
  {
    switch(v3)
    {
      case 0:
        break;
      case 1:
        id v4 = accessibilityLocalizedString(@"status.thermal.warning");
        v5 = *(void **)&v22[1];
        *(void *)&v22[1] = v4;

        break;
      case 2:
        id v6 = accessibilityLocalizedString(@"status.thermal.warning.severe");
        v7 = *(void **)&v22[1];
        *(void *)&v22[1] = v6;

        break;
      case 3:
        id v8 = accessibilityLocalizedString(@"status.thermal.warning.app.terminate");
        v9 = *(void **)&v22[1];
        *(void *)&v22[1] = v8;

        break;
      case 4:
        id v10 = accessibilityLocalizedString(@"status.thermal.warning.device.restart");
        v11 = *(void **)&v22[1];
        *(void *)&v22[1] = v10;

        break;
      case 5:
        id v12 = accessibilityLocalizedString(@"status.thermal.warning.blue");
        v13 = *(void **)&v22[1];
        *(void *)&v22[1] = v12;

        break;
      case 6:
        id v14 = accessibilityLocalizedString(@"status.thermal.warning.white");
        v15 = *(void **)&v22[1];
        *(void *)&v22[1] = v14;

        break;
      default:
        JUMPOUT(0);
    }
  }
  if (!*(void *)&v22[1])
  {
    *(void *)&v22[1] = accessibilityLocalizedString(@"status.thermal.normal");
  }
  char v20 = 0;
  if (v22[0])
  {
    id v21 = accessibilityLocalizedString(@"status.thermal.sunlight.mode");
    char v20 = 1;
  }
  id v25 = (id)__UIAXStringForVariables();
  if (v20) {

  }
  objc_storeStrong((id *)&v22[1], 0);
  v16 = v25;

  return v16;
}

- (unint64_t)accessibilityTraits
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarThermalColorItemViewAccessibility;
  return [(UIStatusBarThermalColorItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

@end