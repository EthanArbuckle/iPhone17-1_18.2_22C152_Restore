@interface SKUISettingsTableViewCellAcccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_axLockupView;
- (id)_axViewContainsSwitch;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SKUISettingsTableViewCellAcccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUISettingsTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKUISettingsTableViewCell" isKindOfClass:@"UITableViewCell"];
  [v3 validateClass:@"SKUISettingsTableViewCell" hasInstanceVariable:@"_settingDescriptionView" withType:"SKUISettingDescriptionView"];
  [v3 validateClass:@"SKUIDefaultSettingDescriptionView" hasInstanceVariable:@"_viewReuseView" withType:"SKUIViewReuseView"];
  [v3 validateClass:@"SKUICheckboxFieldSettingDescriptionView"];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(SKUISettingsTableViewCellAcccessibility *)self safeValueForKey:@"_settingDescriptionView"];
  NSClassFromString(&cfstr_Skuieditprofil_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)_axLockupView
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(SKUISettingsTableViewCellAcccessibility *)self safeValueForKey:@"_settingDescriptionView"];
  NSClassFromString(&cfstr_Skuidefaultset.isa);
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 safeValueForKey:@"_viewReuseView"];
    [v3 subviews];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          NSClassFromString(&cfstr_Skuihorizontal_2.isa);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            NSClassFromString(&cfstr_Skuitabularloc_0.isa);
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
          }
          id v10 = v9;
          goto LABEL_15;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        id v10 = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v10 = 0;
    }
LABEL_15:
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_axViewContainsSwitch
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(SKUISettingsTableViewCellAcccessibility *)self safeValueForKey:@"_settingDescriptionView"];
  NSClassFromString(&cfstr_Skuicheckboxfi.isa);
  if (objc_opt_isKindOfClass())
  {
    [v2 subviews];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          NSClassFromString(&cfstr_Uiswitch.isa);
          if (objc_opt_isKindOfClass())
          {
            id v9 = v8;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    id v9 = 0;
LABEL_13:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)accessibilityLabel
{
  id v3 = [(SKUISettingsTableViewCellAcccessibility *)self _axLockupView];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityLabel];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SKUISettingsTableViewCellAcccessibility;
    uint64_t v5 = [(SKUISettingsTableViewCellAcccessibility *)&v8 accessibilityLabel];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (id)accessibilityCustomActions
{
  id v3 = [(SKUISettingsTableViewCellAcccessibility *)self _axLockupView];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityCustomActions];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SKUISettingsTableViewCellAcccessibility;
    uint64_t v5 = [(SKUISettingsTableViewCellAcccessibility *)&v8 accessibilityCustomActions];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(SKUISettingsTableViewCellAcccessibility *)self _axViewContainsSwitch];

  if (v3)
  {
    uint64_t v4 = [(SKUISettingsTableViewCellAcccessibility *)self _axViewContainsSwitch];
    unint64_t v5 = [v4 accessibilityTraits];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUISettingsTableViewCellAcccessibility;
    return *MEMORY[0x263F1CEE8] | [(SKUISettingsTableViewCellAcccessibility *)&v7 accessibilityTraits];
  }
}

- (id)accessibilityValue
{
  id v3 = [(SKUISettingsTableViewCellAcccessibility *)self _axViewContainsSwitch];

  if (v3)
  {
    uint64_t v4 = [(SKUISettingsTableViewCellAcccessibility *)self _axViewContainsSwitch];
    unint64_t v5 = [v4 accessibilityValue];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUISettingsTableViewCellAcccessibility;
    unint64_t v5 = [(SKUISettingsTableViewCellAcccessibility *)&v7 accessibilityValue];
  }

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  id v3 = [(SKUISettingsTableViewCellAcccessibility *)self _axViewContainsSwitch];

  if (v3)
  {
    uint64_t v4 = [(SKUISettingsTableViewCellAcccessibility *)self _axViewContainsSwitch];
    [v4 accessibilityActivationPoint];
    double v6 = v5;
    double v8 = v7;

    double v9 = v6;
    double v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SKUISettingsTableViewCellAcccessibility;
    [(SKUISettingsTableViewCellAcccessibility *)&v11 accessibilityActivationPoint];
  }
  result.y = v10;
  result.x = v9;
  return result;
}

@end