@interface UIListContentConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation UIListContentConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIListContentConfiguration";
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
  v4 = @"UIListContentConfiguration";
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"attributedText", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"secondaryText", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"secondaryAttributedText", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"prefersSideBySideTextAndSecondaryText", "B", 0);
  objc_storeStrong(v6, obj);
}

- (id)accessibilityLabel
{
  v23 = self;
  v22[1] = (id)a2;
  v21.receiver = self;
  v21.super_class = (Class)UIListContentConfigurationAccessibility;
  v22[0] = [(UIListContentConfigurationAccessibility *)&v21 accessibilityLabel];
  if (![v22[0] length])
  {
    id v2 = (id)[(UIListContentConfigurationAccessibility *)v23 safeStringForKey:@"text"];
    id v3 = v22[0];
    v22[0] = v2;

    if (![v22[0] length])
    {
      char v20 = 0;
      objc_opt_class();
      id v13 = (id)[(UIListContentConfigurationAccessibility *)v23 safeValueForKey:@"attributedText"];
      id v19 = (id)__UIAccessibilityCastAsClass();

      id v18 = v19;
      objc_storeStrong(&v19, 0);
      id v4 = (id)[v18 string];
      id v5 = v22[0];
      v22[0] = v4;
    }
    if (([(UIListContentConfigurationAccessibility *)v23 safeBoolForKey:@"prefersSideBySideTextAndSecondaryText"] & 1) == 0)
    {
      id v17 = (id)[(UIListContentConfigurationAccessibility *)v23 safeStringForKey:@"secondaryText"];
      if (![v17 length])
      {
        char v16 = 0;
        objc_opt_class();
        id v12 = (id)[(UIListContentConfigurationAccessibility *)v23 safeValueForKey:@"secondaryAttributedText"];
        id v15 = (id)__UIAccessibilityCastAsClass();

        id v14 = v15;
        objc_storeStrong(&v15, 0);
        id v6 = (id)[v14 string];
        id v7 = v17;
        id v17 = v6;
      }
      id v8 = (id)__UIAXStringForVariables();
      id v9 = v22[0];
      v22[0] = v8;

      objc_storeStrong(&v17, 0);
    }
  }
  id v11 = v22[0];
  objc_storeStrong(v22, 0);

  return v11;
}

- (id)accessibilityValue
{
  id v13 = self;
  v12[1] = (id)a2;
  v11.receiver = self;
  v11.super_class = (Class)UIListContentConfigurationAccessibility;
  v12[0] = [(UIListContentConfigurationAccessibility *)&v11 accessibilityValue];
  if (![v12[0] length]
    && ([(UIListContentConfigurationAccessibility *)v13 safeBoolForKey:@"prefersSideBySideTextAndSecondaryText"] & 1) != 0)
  {
    id v10 = (id)[(UIListContentConfigurationAccessibility *)v13 safeStringForKey:@"secondaryText"];
    if (![v10 length])
    {
      char v9 = 0;
      objc_opt_class();
      id v6 = (id)[(UIListContentConfigurationAccessibility *)v13 safeValueForKey:@"secondaryAttributedText"];
      id v8 = (id)__UIAccessibilityCastAsClass();

      id v7 = v8;
      objc_storeStrong(&v8, 0);
      id v2 = (id)[v7 string];
      id v3 = v10;
      id v10 = v2;
    }
    objc_storeStrong(v12, v10);
    objc_storeStrong(&v10, 0);
  }
  id v5 = v12[0];
  objc_storeStrong(v12, 0);

  return v5;
}

- (unint64_t)accessibilityTraits
{
  id v8 = self;
  SEL v7 = a2;
  id v4 = (id)[(UIListContentConfigurationAccessibility *)self image];
  id v3 = (id)[v4 accessibilityIdentifier];
  char v5 = [v3 containsString:@"checkmark"];

  if (v5) {
    return *MEMORY[0x263F1CF38];
  }
  v6.receiver = v8;
  v6.super_class = (Class)UIListContentConfigurationAccessibility;
  return [(UIListContentConfigurationAccessibility *)&v6 accessibilityTraits];
}

@end