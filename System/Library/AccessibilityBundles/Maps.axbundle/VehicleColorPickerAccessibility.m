@interface VehicleColorPickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation VehicleColorPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VehicleColorPicker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)VehicleColorPickerAccessibility;
  [(VehicleColorPickerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__VehicleColorPickerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  block[3] = &unk_26512D688;
  block[4] = self;
  if (_accessibilityLoadAccessibilityInformation_onceToken != -1) {
    dispatch_once(&_accessibilityLoadAccessibilityInformation_onceToken, block);
  }
}

void __77__VehicleColorPickerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  v3 = [*(id *)(a1 + 32) safeArrayForKey:@"colors"];
  if ([v3 count] != 12)
  {
    objc_super v4 = AXLogAppAccessibility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __77__VehicleColorPickerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_cold_2(v4);
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = AXMapsStringForVehicleColor(v10);
          if ([v2 containsObject:v11])
          {
            v14 = AXLogAppAccessibility();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
              __77__VehicleColorPickerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_cold_1((uint64_t)v11, v14);
            }

            goto LABEL_21;
          }
          [v2 addObject:v11];
        }
        else
        {
          v11 = AXLogAppAccessibility();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            v12 = (objc_class *)objc_opt_class();
            v13 = NSStringFromClass(v12);
            *(_DWORD *)buf = 138412546;
            v20 = v10;
            __int16 v21 = 2112;
            v22 = v13;
            _os_log_fault_impl(&dword_24223A000, v11, OS_LOG_TYPE_FAULT, "Unexpected format for vehicle colors array. Found %@ of type %@.", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_21:
}

void __77__VehicleColorPickerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_24223A000, a2, OS_LOG_TYPE_FAULT, "Found two vehicle colors with the same description: %@", (uint8_t *)&v2, 0xCu);
}

void __77__VehicleColorPickerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_24223A000, log, OS_LOG_TYPE_FAULT, "Expected 12 vehicle colors.", v1, 2u);
}

@end