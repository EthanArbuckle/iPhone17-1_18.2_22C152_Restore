@interface _UIStatusBarThermalItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)imageForUpdate:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UIStatusBarThermalItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarThermalItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"_UIStatusBarItemUpdate";
  objc_msgSend(location[0], "validateClass:");
  v5 = @"_UIStatusBarThermalItem";
  v3 = @"_UIStatusBarIndicatorItem";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", @"_UIStatusBarIndicatorItem", @"imageView");
  [location[0] validateClass:@"_UIStatusBarData" hasProperty:@"thermalEntry" withType:"@"];
  [location[0] validateClass:@"_UIStatusBarItemUpdate" hasProperty:@"data" withType:"@"];
  [location[0] validateClass:@"_UIStatusBarDataThermalEntry" hasProperty:@"color" withType:"q"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarThermalItem", @"imageForUpdate:", "@", 0);
  objc_storeStrong(v8, v7);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v23 = self;
  SEL v22 = a2;
  v21.receiver = self;
  v21.super_class = (Class)_UIStatusBarThermalItemAccessibility;
  [(_UIStatusBarThermalItemAccessibility *)&v21 _accessibilityLoadAccessibilityInformation];
  id v20 = (id)[(_UIStatusBarThermalItemAccessibility *)v23 _accessibilityValueForKey:@"AccessibilityStatusBarUpdateData"];
  NSClassFromString(&cfstr_Uistatusbarite_3.isa);
  if (objc_opt_isKindOfClass())
  {
    id v19 = (id)[(_UIStatusBarThermalItemAccessibility *)v23 safeValueForKey:@"imageView"];
    id v16 = (id)[v20 safeValueForKeyPath:@"data.thermalEntry"];
    v17 = (void *)[v16 safeIntegerForKey:@"color"];

    v18[1] = v17;
    v18[0] = 0;
    if (v17)
    {
      v3 = v17;
      char v2 = 1;
    }
    else
    {
      v3 = 0;
      char v2 = 0;
    }
    if ((v2 & 1) == 0)
    {
      switch((unint64_t)v3)
      {
        case 0uLL:
          id v4 = accessibilityLocalizedString(@"status.thermal.warning");
          id v5 = v18[0];
          v18[0] = v4;

          break;
        case 1uLL:
          id v6 = accessibilityLocalizedString(@"status.thermal.warning.severe");
          id v7 = v18[0];
          v18[0] = v6;

          break;
        case 2uLL:
          id v8 = accessibilityLocalizedString(@"status.thermal.warning.app.terminate");
          id v9 = v18[0];
          v18[0] = v8;

          break;
        case 3uLL:
          id v10 = accessibilityLocalizedString(@"status.thermal.warning.device.restart");
          id v11 = v18[0];
          v18[0] = v10;

          break;
        case 4uLL:
          id v12 = accessibilityLocalizedString(@"status.thermal.warning.blue");
          id v13 = v18[0];
          v18[0] = v12;

          break;
        case 5uLL:
          id v14 = accessibilityLocalizedString(@"status.thermal.warning.white");
          id v15 = v18[0];
          v18[0] = v14;

          break;
        default:
          JUMPOUT(0);
      }
    }
    [v19 setIsAccessibilityElement:1];
    [v19 setAccessibilityLabel:v18[0]];
    objc_storeStrong(v18, 0);
    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(&v20, 0);
}

- (id)imageForUpdate:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v8;
  v5.super_class = (Class)_UIStatusBarThermalItemAccessibility;
  id v6 = [(_UIStatusBarThermalItemAccessibility *)&v5 imageForUpdate:location[0]];
  [(_UIStatusBarThermalItemAccessibility *)v8 _accessibilitySetRetainedValue:location[0] forKey:@"AccessibilityStatusBarUpdateData"];
  [(_UIStatusBarThermalItemAccessibility *)v8 _accessibilityLoadAccessibilityInformation];
  id v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);

  return v4;
}

@end