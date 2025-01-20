@interface UIStatusBarBatteryPercentItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityIsBatteryItemVisible;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIStatusBarBatteryPercentItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarBatteryPercentItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityIsBatteryItemVisible
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v14 = a1;
  if (a1)
  {
    id v7 = (id)[v14 superview];
    id location = (id)[v7 subviews];

    memset(__b, 0, sizeof(__b));
    id obj = location;
    uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
    if (v9)
    {
      uint64_t v4 = *(void *)__b[2];
      uint64_t v5 = 0;
      unint64_t v6 = v9;
      while (1)
      {
        uint64_t v3 = v5;
        if (*(void *)__b[2] != v4) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(__b[1] + 8 * v5);
        NSClassFromString(&cfstr_Uistatusbarbat.isa);
        if (objc_opt_isKindOfClass()) {
          break;
        }
        ++v5;
        if (v3 + 1 >= v6)
        {
          uint64_t v5 = 0;
          unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
          if (!v6) {
            goto LABEL_11;
          }
        }
      }
      id v15 = v12;
      int v10 = 1;
    }
    else
    {
LABEL_11:
      int v10 = 0;
    }

    if (!v10) {
      id v15 = 0;
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    id v15 = 0;
  }
  v1 = v15;

  return v1;
}

- (BOOL)isAccessibilityElement
{
  id v2 = -[UIStatusBarBatteryPercentItemViewAccessibility _accessibilityIsBatteryItemVisible](self);
  BOOL v4 = v2 == 0;

  return v4;
}

- (id)accessibilityLabel
{
  uint64_t v3 = NSString;
  id v5 = accessibilityLocalizedString(@"status.battery.capacity");
  id v4 = (id)[(UIStatusBarBatteryPercentItemViewAccessibility *)self safeValueForKey:@"_percentString"];
  id v6 = (id)objc_msgSend(v3, "stringWithFormat:", v5, v4);

  return v6;
}

- (unint64_t)accessibilityTraits
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarBatteryPercentItemViewAccessibility;
  return [(UIStatusBarBatteryPercentItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

@end