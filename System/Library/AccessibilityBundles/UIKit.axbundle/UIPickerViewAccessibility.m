@interface UIPickerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (double)scrollAnimationDuration;
- (id)accessibilityElements;
- (int64_t)_accessibilityPickerType;
- (unint64_t)_accessibilityAutomationType;
- (void)reloadAllComponents;
@end

@implementation UIPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPickerView";
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
  v4 = @"UIPickerView";
  v3 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"UIPickerView" hasInstanceVariable:@"_tables" withType:"NSMutableArray"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"numberOfComponents", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"reloadAllComponents", "v", 0);
  objc_storeStrong(v6, obj);
}

- (double)scrollAnimationDuration
{
  return 0.0;
}

- (unint64_t)_accessibilityAutomationType
{
  return 38;
}

- (int64_t)_accessibilityPickerType
{
  NSClassFromString(&cfstr_Uidatepickervi.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 1;
  }
  id v5 = (id)[(UIPickerViewAccessibility *)self safeValueForKey:@"datePickerMode"];
  uint64_t v6 = [v5 unsignedIntValue];

  if (v6)
  {
    uint64_t v3 = v6;
    char v2 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    char v2 = 0;
  }
  if (v2)
  {
    if (v6 == 4270) {
      return 7;
    }
    if (v6 == 4271) {
      return 8;
    }
    return 1;
  }
  switch(v3)
  {
    case 0:
      int64_t v8 = 3;
      break;
    case 1:
      int64_t v8 = 5;
      break;
    case 2:
      int64_t v8 = 4;
      break;
    case 3:
      int64_t v8 = 2;
      break;
    case 4:
      int64_t v8 = 6;
      break;
    default:
      JUMPOUT(0);
  }
  return v8;
}

- (id)accessibilityElements
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24 = self;
  v23[1] = (id)a2;
  v23[0] = (id)[(UIPickerViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  id v15 = (id)[(UIPickerViewAccessibility *)v24 safeValueForKey:@"numberOfComponents"];
  uint64_t v16 = [v15 integerValue];

  uint64_t v22 = v16;
  if (!v23[0] || v22 != [v23[0] count])
  {
    memset(__b, 0, sizeof(__b));
    id obj = v23[0];
    uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
    if (v14)
    {
      uint64_t v10 = *(void *)__b[2];
      uint64_t v11 = 0;
      unint64_t v12 = v14;
      while (1)
      {
        uint64_t v9 = v11;
        if (*(void *)__b[2] != v10) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(id *)(__b[1] + 8 * v11);
        [v21 setAccessibilityContainer:0];
        ++v11;
        if (v9 + 1 >= v12)
        {
          uint64_t v11 = 0;
          unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
          if (!v12) {
            break;
          }
        }
      }
    }

    char v2 = (void *)[objc_allocWithZone(MEMORY[0x263EFF980]) init];
    id v3 = v23[0];
    v23[0] = v2;

    [(UIPickerViewAccessibility *)v24 _accessibilitySetRetainedValue:v23[0] forKey:*MEMORY[0x263F81490]];
    uint64_t v19 = 0;
    id v7 = (id)[(UIPickerViewAccessibility *)v24 safeValueForKey:@"numberOfComponents"];
    uint64_t v8 = [v7 integerValue];

    uint64_t v18 = v8;
    while (v19 < v18)
    {
      id v4 = objc_allocWithZone((Class)UIAccessibilityPickerComponent);
      v17 = (id *)[v4 initWithAccessibilityContainer:v24];
      -[UIAccessibilityPickerComponent setComponent:]((uint64_t)v17, v19);
      -[UIAccessibilityPickerComponent setPicker:](v17, v24);
      [v23[0] addObject:v17];
      objc_storeStrong((id *)&v17, 0);
      ++v19;
    }
  }
  id v6 = v23[0];
  objc_storeStrong(v23, 0);

  return v6;
}

- (void)reloadAllComponents
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIPickerViewAccessibility;
  [(UIPickerViewAccessibility *)&v2 reloadAllComponents];
  [(UIPickerViewAccessibility *)v4 _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  id v6 = self;
  SEL v5 = a2;
  char v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIPickerViewAccessibility;
  char v4 = [(UIPickerViewAccessibility *)&v3 canBecomeFocused];
  if ([(UIPickerViewAccessibility *)v6 _accessibilityIsFKARunningForFocusItem])char v4 = 0; {
  return v4 & 1;
  }
}

@end