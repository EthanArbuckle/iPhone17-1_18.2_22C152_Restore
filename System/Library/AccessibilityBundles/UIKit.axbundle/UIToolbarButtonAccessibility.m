@interface UIToolbarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (id)accessibilityLocalizationBundleID;
- (id)accessibilityLocalizationBundlePath;
- (id)accessibilityLocalizedStringKey;
- (id)accessibilityLocalizedStringTableName;
- (unint64_t)accessibilityTraits;
@end

@implementation UIToolbarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIToolbarButton";
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
  [location[0] validateClass:@"UIToolbarButton" hasInstanceVariable:@"_onState" withType:"B"];
  objc_storeStrong(location, 0);
}

- (CGRect)accessibilityFrame
{
  id v6 = (id)[(UIToolbarButtonAccessibility *)self safeValueForKey:@"_info"];
  [v6 accessibilityFrame];
  CGRect v7 = CGRectInset(v8, -5.0, -5.0);

  double y = v7.origin.y;
  double x = v7.origin.x;
  double height = v7.size.height;
  double width = v7.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)accessibilityLabel
{
  v20 = self;
  v19[1] = (id)a2;
  id v2 = (id)[(UIToolbarButtonAccessibility *)self accessibilityUserDefinedLabel];
  BOOL v16 = v2 == 0;

  if (v16)
  {
    id v15 = (id)[(UIToolbarButtonAccessibility *)v20 safeValueForKey:@"label"];
    v19[0] = (id)[v15 accessibilityLabel];

    if (![v19[0] length])
    {
      id v13 = (id)[(UIToolbarButtonAccessibility *)v20 safeValueForKey:@"tag"];
      uint64_t v14 = [v13 integerValue];

      uint64_t v18 = v14;
      if (!v14)
      {
        id v12 = (id)[(UIToolbarButtonAccessibility *)v20 accessibilityIdentification];
        uint64_t v18 = [v12 integerValue];
      }
      id v3 = (id)[MEMORY[0x263F1CB60] _accessibilityTitleForSystemTag:v18];
      id v4 = v19[0];
      v19[0] = v3;
    }
    if (![v19[0] length])
    {
      id v11 = (id)[(UIToolbarButtonAccessibility *)v20 safeValueForKey:@"_info"];
      id v5 = (id)[v11 _accessibilityAXAttributedLabel];
      id v6 = v19[0];
      v19[0] = v5;

      if (![v19[0] length])
      {
        v17.receiver = v20;
        v17.super_class = (Class)UIToolbarButtonAccessibility;
        id v7 = [(UIToolbarButtonAccessibility *)&v17 accessibilityLabel];
        id v8 = v19[0];
        v19[0] = v7;
      }
    }
    id v21 = v19[0];
    objc_storeStrong(v19, 0);
  }
  else
  {
    id v21 = (id)[(UIToolbarButtonAccessibility *)v20 accessibilityUserDefinedLabel];
  }
  v9 = v21;

  return v9;
}

- (id)accessibilityLocalizedStringKey
{
  return (id)[(UIToolbarButtonAccessibility *)self _accessibilityAttributedLocalizedString];
}

- (id)accessibilityLocalizationBundleID
{
  return (id)[(UIToolbarButtonAccessibility *)self _accessibilityRetrieveLocalizationBundleID];
}

- (id)accessibilityLocalizationBundlePath
{
  return (id)[(UIToolbarButtonAccessibility *)self _accessibilityRetrieveLocalizationBundlePath];
}

- (id)accessibilityLocalizedStringTableName
{
  return (id)[(UIToolbarButtonAccessibility *)self _accessibilityRetrieveLocalizedStringTableName];
}

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(UIToolbarButtonAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v5 = v2 == 0;

  if (v5) {
    return 1;
  }
  id v4 = (id)[(UIToolbarButtonAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (unint64_t)accessibilityTraits
{
  id v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)UIToolbarButtonAccessibility;
  unint64_t v4 = [(UIToolbarButtonAccessibility *)&v6 accessibilityTraits] | *MEMORY[0x263F1CEE8];
  id v5 = (id)[(UIToolbarButtonAccessibility *)v8 safeValueForKey:@"_onState"];
  if ([v5 BOOLValue]) {
    uint64_t v3 = *MEMORY[0x263F1CF38];
  }
  else {
    uint64_t v3 = 0;
  }

  return v4 | v3;
}

@end