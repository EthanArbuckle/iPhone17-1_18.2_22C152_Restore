@interface UIStatusBarBatteryItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (id)_accessibilityIsBatteryPercentVisible;
- (id)_axCachedAXLabel;
- (id)accessibilityLabel;
- (uint64_t)_accessibilityNonQuantizedBatteryLevel;
- (uint64_t)_accessibilitySetNonQuantizedBatteryLevel:(uint64_t)result;
- (uint64_t)_axIsCapacityDirty;
- (unint64_t)accessibilityTraits;
- (void)_axSetCachedAXLabel:(void *)a1;
- (void)_axSetCapacityDirty:(void *)a1;
@end

@implementation UIStatusBarBatteryItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarBatteryItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (uint64_t)_accessibilityNonQuantizedBatteryLevel
{
  if (a1) {
    return __UIAccessibilityGetAssociatedInteger();
  }
  else {
    return 0;
  }
}

- (uint64_t)_accessibilitySetNonQuantizedBatteryLevel:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedInteger();
  }
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UIStatusBarComposedData"];
  v4 = @"UIStatusBarBatteryItemView";
  v3 = "i";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UIStatusBarBatteryItemView" hasInstanceVariable:@"_state" withType:"i"];
  [location[0] validateClass:@"UIStatusBarBatteryPercentItemView" hasInstanceVariable:@"_percentString" withType:"NSString"];
  v5 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIStatusBarBatteryItemView", @"updateForNewData: actions:", "@", "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"cachedBatteryStyle", "Q", 0);
  [location[0] validateClass:v4 hasInstanceVariable:@"_batterySaverModeActive" withType:v5];
  objc_storeStrong(v7, v6);
}

- (id)_accessibilityIsBatteryPercentVisible
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v15 = a1;
  if (a1)
  {
    id v8 = (id)[v15 superview];
    id location = (id)[v8 subviews];

    memset(__b, 0, sizeof(__b));
    id obj = location;
    uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
    if (v10)
    {
      uint64_t v5 = *(void *)__b[2];
      uint64_t v6 = 0;
      unint64_t v7 = v10;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(id *)(__b[1] + 8 * v6);
        NSClassFromString(&cfstr_Uistatusbarbat_0.isa);
        if (objc_opt_isKindOfClass())
        {
          [v13 alpha];
          if (CGFAbs_1(v1) - 0.0 >= 0.000001) {
            break;
          }
        }
        ++v6;
        if (v4 + 1 >= v7)
        {
          uint64_t v6 = 0;
          unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
          if (!v7) {
            goto LABEL_12;
          }
        }
      }
      id v16 = v13;
      int v11 = 1;
    }
    else
    {
LABEL_12:
      int v11 = 0;
    }

    if (!v11) {
      id v16 = 0;
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    id v16 = 0;
  }
  v2 = v16;

  return v2;
}

- (CGPoint)accessibilityActivationPoint
{
  v14 = self;
  SEL v13 = a2;
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarBatteryItemViewAccessibility;
  [(UIStatusBarBatteryItemViewAccessibility *)&v8 accessibilityFrame];
  uint64_t v9 = v2;
  uint64_t v10 = v3;
  uint64_t v11 = v4;
  uint64_t v12 = v5;
  AX_CGRectGetCenter();
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGRect)accessibilityFrame
{
  SEL v13 = self;
  SEL v12 = a2;
  memset(&v14, 0, sizeof(v14));
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarBatteryItemViewAccessibility;
  [(UIStatusBarBatteryItemViewAccessibility *)&v11 accessibilityFrame];
  v14.origin.double x = v2;
  v14.origin.double y = v3;
  v14.size.double width = v4;
  v14.size.double height = v5;
  id location = -[UIStatusBarBatteryItemViewAccessibility _accessibilityIsBatteryPercentVisible](v13);
  if (location)
  {
    [location accessibilityFrame];
    CGRect v14 = CGRectUnion(v15, v14);
  }
  objc_storeStrong(&location, 0);
  double y = v14.origin.y;
  double x = v14.origin.x;
  double height = v14.size.height;
  double width = v14.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v31 = self;
  v30[1] = (id)a2;
  id v16 = -[UIStatusBarBatteryItemViewAccessibility _axCachedAXLabel](self);
  LOBYTE(v17) = 0;
  if (v16) {
    int v17 = -[UIStatusBarBatteryItemViewAccessibility _axIsCapacityDirty](v31) ^ 1;
  }

  if (v17)
  {
    id v32 = -[UIStatusBarBatteryItemViewAccessibility _axCachedAXLabel](v31);
    goto LABEL_28;
  }
  v30[0] = (id)[MEMORY[0x263F1C5C0] currentDevice];
  char v29 = [v30[0] isBatteryMonitoringEnabled] & 1;
  if (!v29) {
    [v30[0] setBatteryMonitoringEnabled:1];
  }
  float v28 = -1.0;
  id v27 = -[UIStatusBarBatteryItemViewAccessibility _accessibilityIsBatteryPercentVisible](v31);
  if (v27)
  {
    id v15 = (id)[v27 safeStringForKey:@"_percentString"];
    float v2 = (float)(int)[v15 intValue] / 100.0;
    float v28 = v2;
  }
  else if (-[UIStatusBarBatteryItemViewAccessibility _axIsCapacityDirty](v31))
  {
    int v26 = -[UIStatusBarBatteryItemViewAccessibility _accessibilityNonQuantizedBatteryLevel]((uint64_t)v31);
    float v3 = (float)v26 / 100.0;
    float v28 = v3;
  }
  double v4 = v28;
  if (v28 <= 0.0 || (double v4 = v28, v28 > 1.0))
  {
    objc_msgSend(v30[0], "batteryLevel", v4);
    float v28 = v5;
  }
  SEL v12 = NSString;
  id v14 = accessibilityLocalizedString(@"status.battery.capacity");
  id v13 = (id)AXFormatFloatWithPercentage();
  id v25 = (id)objc_msgSend(v12, "stringWithFormat:", v14, v13);

  uint64_t v24 = [v30[0] batteryState];
  id v23 = 0;
  if (v24 == 2)
  {
    uint64_t v22 = [(UIStatusBarBatteryItemViewAccessibility *)v31 safeIntegerForKey:@"cachedBatteryStyle"];
    if (v22) {
      id v6 = accessibilityLocalizedString(@"status.battery.charging");
    }
    else {
      id v6 = accessibilityLocalizedString(@"status.not.charging");
    }
  }
  else
  {
    if (v24 != 3) {
      goto LABEL_23;
    }
    char v20 = MGGetBoolAnswer() & 1;
    char v21 = v20;
    if (v20) {
      id v6 = accessibilityLocalizedString(@"status.battery.charging.usb-c");
    }
    else {
      id v6 = accessibilityLocalizedString(@"status.battery.charging.lightning");
    }
  }
  id v7 = v23;
  id v23 = v6;

LABEL_23:
  id v19 = 0;
  if ([(UIStatusBarBatteryItemViewAccessibility *)v31 safeBoolForKey:@"_batterySaverModeActive"])
  {
    id v8 = accessibilityLocalizedString(@"status.low.power.mode");
    id v9 = v19;
    id v19 = v8;
  }
  if ((v29 & 1) == 0) {
    [v30[0] setBatteryMonitoringEnabled:0];
  }
  id v18 = (id)__UIAXStringForVariables();
  -[UIStatusBarBatteryItemViewAccessibility _axSetCachedAXLabel:](v31, v18);
  id v32 = v18;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(v30, 0);
LABEL_28:
  uint64_t v10 = v32;

  return v10;
}

- (id)_axCachedAXLabel
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &AXCachedAXLabelKey);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)_axIsCapacityDirty
{
  id v3 = a1;
  if (a1)
  {
    id location = objc_getAssociatedObject(v3, &AXBatteryLevelIsDirtyKey);
    if (location) {
      char v4 = [location BOOLValue] & 1;
    }
    else {
      char v4 = 0;
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (void)_axSetCachedAXLabel:(void *)a1
{
  id v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    objc_setAssociatedObject(v3, &AXCachedAXLabelKey, location, (void *)1);
  }
  objc_storeStrong(&location, 0);
}

- (unint64_t)accessibilityTraits
{
  float v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarBatteryItemViewAccessibility;
  return [(UIStatusBarBatteryItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  char v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v18 = a4;
  char v17 = 0;
  v16.receiver = v20;
  v16.super_class = (Class)UIStatusBarBatteryItemViewAccessibility;
  char v17 = [(UIStatusBarBatteryItemViewAccessibility *)&v16 updateForNewData:location[0] actions:a4];
  NSClassFromString(&cfstr_Uistatusbarcom.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = 0;
    uint64_t v10 = 0;
    objc_super v11 = &v10;
    int v12 = 0x20000000;
    int v13 = 32;
    uint64_t v14 = 0;
    v9[1] = &v10;
    v9[0] = location[0];
    AXPerformSafeBlock();
    uint64_t v8 = v11[3];
    objc_storeStrong(v9, 0);
    _Block_object_dispose(&v10, 8);
    uint64_t v15 = v8;
    uint64_t v4 = -[UIStatusBarBatteryItemViewAccessibility _accessibilityNonQuantizedBatteryLevel]((uint64_t)v20);
    if (v4 != *(_DWORD *)(v15 + 2104))
    {
      -[UIStatusBarBatteryItemViewAccessibility _accessibilitySetNonQuantizedBatteryLevel:]((uint64_t)v20);
      -[UIStatusBarBatteryItemViewAccessibility _axSetCapacityDirty:](v20, 1);
    }
  }
  char v6 = v17;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

uint64_t __68__UIStatusBarBatteryItemViewAccessibility_updateForNewData_actions___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) rawData];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_axSetCapacityDirty:(void *)a1
{
  if (a1)
  {
    id v2 = (id)[NSNumber numberWithBool:a2 & 1];
    objc_setAssociatedObject(a1, &AXBatteryLevelIsDirtyKey, v2, (void *)1);
  }
}

@end