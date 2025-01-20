@interface UITabBarItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_createViewForTabBar:(id)a3 asProxyView:(BOOL)a4;
- (id)accessibilityLocalizationBundleID;
- (id)accessibilityLocalizationBundlePath;
- (id)accessibilityLocalizedStringKey;
- (id)accessibilityLocalizedStringTableName;
- (id)selectedImage;
- (id)unselectedImage;
- (void)setAccessibilityAttributedHint:(id)a3;
- (void)setAccessibilityAttributedLabel:(id)a3;
- (void)setAccessibilityAttributedValue:(id)a3;
- (void)setAccessibilityHint:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityValue:(id)a3;
@end

@implementation UITabBarItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITabBarItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UITabBarItem";
  v3 = "UIImage";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UITabBarItem" hasInstanceVariable:@"_selectedImage" withType:"UIImage"];
  [location[0] validateClass:@"UITabBarItem" hasInstanceVariable:@"_unselectedImage" withType:"UIImage"];
  v5 = "@";
  [location[0] validateClass:@"UITabBarItem" hasInstanceMethod:@"view" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_createViewForTabBar: asProxyView:", v5, "B", 0);
  objc_storeStrong(v7, v6);
}

- (id)selectedImage
{
  v16 = self;
  SEL v15 = a2;
  id v2 = (id)[(UITabBarItemAccessibility *)self safeValueForKey:@"_selectedImage"];
  BOOL v11 = v2 == 0;

  BOOL v14 = v11;
  v12.receiver = v16;
  v12.super_class = (Class)UITabBarItemAccessibility;
  id v13 = [(UITabBarItemAccessibility *)&v12 selectedImage];
  if (v14)
  {
    id v5 = v13;
    id v7 = (id)-[UITabBarItemAccessibility safeValueForKey:](v16, "safeValueForKey:");
    id v6 = (id)[v7 accessibilityIdentification];
    objc_msgSend(v5, "accessibilitySetIdentification:");

    id v8 = v13;
    id v10 = (id)[(UITabBarItemAccessibility *)v16 safeValueForKey:@"_templateImage"];
    id v9 = (id)[v10 accessibilityIdentifier];
    objc_msgSend(v8, "setAccessibilityIdentifier:");
  }
  id v4 = v13;
  objc_storeStrong(&v13, 0);

  return v4;
}

- (id)unselectedImage
{
  v16 = self;
  SEL v15 = a2;
  id v2 = (id)[(UITabBarItemAccessibility *)self safeValueForKey:@"_unselectedImage"];
  BOOL v11 = v2 == 0;

  BOOL v14 = v11;
  v12.receiver = v16;
  v12.super_class = (Class)UITabBarItemAccessibility;
  id v13 = [(UITabBarItemAccessibility *)&v12 unselectedImage];
  if (v14)
  {
    id v5 = v13;
    id v7 = (id)-[UITabBarItemAccessibility safeValueForKey:](v16, "safeValueForKey:");
    id v6 = (id)[v7 accessibilityIdentification];
    objc_msgSend(v5, "accessibilitySetIdentification:");

    id v8 = v13;
    id v10 = (id)[(UITabBarItemAccessibility *)v16 safeValueForKey:@"_templateImage"];
    id v9 = (id)[v10 accessibilityIdentifier];
    objc_msgSend(v8, "setAccessibilityIdentifier:");
  }
  id v4 = v13;
  objc_storeStrong(&v13, 0);

  return v4;
}

- (void)setAccessibilityLabel:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITabBarItemAccessibility;
  [(UITabBarItemAccessibility *)&v4 setAccessibilityLabel:location[0]];
  id v3 = (id)[(UITabBarItemAccessibility *)v6 safeValueForKey:@"view"];
  [v3 setAccessibilityLabel:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setAccessibilityAttributedLabel:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITabBarItemAccessibility;
  [(UITabBarItemAccessibility *)&v4 setAccessibilityAttributedLabel:location[0]];
  id v3 = (id)[(UITabBarItemAccessibility *)v6 safeValueForKey:@"view"];
  [v3 setAccessibilityAttributedLabel:location[0]];

  objc_storeStrong(location, 0);
}

- (id)accessibilityLocalizedStringKey
{
  return (id)[(UITabBarItemAccessibility *)self _accessibilityRetrieveLocalizedStringKey];
}

- (id)accessibilityLocalizationBundleID
{
  return (id)[(UITabBarItemAccessibility *)self _accessibilityRetrieveLocalizationBundleID];
}

- (id)accessibilityLocalizationBundlePath
{
  return (id)[(UITabBarItemAccessibility *)self _accessibilityRetrieveLocalizationBundlePath];
}

- (id)accessibilityLocalizedStringTableName
{
  return (id)[(UITabBarItemAccessibility *)self _accessibilityRetrieveLocalizedStringTableName];
}

- (void)setAccessibilityValue:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITabBarItemAccessibility;
  [(UITabBarItemAccessibility *)&v4 setAccessibilityValue:location[0]];
  id v3 = (id)[(UITabBarItemAccessibility *)v6 safeValueForKey:@"view"];
  [v3 setAccessibilityValue:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setAccessibilityAttributedValue:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITabBarItemAccessibility;
  [(UITabBarItemAccessibility *)&v4 setAccessibilityAttributedValue:location[0]];
  id v3 = (id)[(UITabBarItemAccessibility *)v6 safeValueForKey:@"view"];
  [v3 setAccessibilityAttributedValue:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setAccessibilityHint:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITabBarItemAccessibility;
  [(UITabBarItemAccessibility *)&v4 setAccessibilityHint:location[0]];
  id v3 = (id)[(UITabBarItemAccessibility *)v6 safeValueForKey:@"view"];
  [v3 setAccessibilityHint:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setAccessibilityAttributedHint:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITabBarItemAccessibility;
  [(UITabBarItemAccessibility *)&v4 setAccessibilityAttributedHint:location[0]];
  id v3 = (id)[(UITabBarItemAccessibility *)v6 safeValueForKey:@"view"];
  [v3 setAccessibilityAttributedHint:location[0]];

  objc_storeStrong(location, 0);
}

- (id)_createViewForTabBar:(id)a3 asProxyView:(BOOL)a4
{
  BOOL v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v9 = a4;
  v7.receiver = v11;
  v7.super_class = (Class)UITabBarItemAccessibility;
  id v8 = [(UITabBarItemAccessibility *)&v7 _createViewForTabBar:location[0] asProxyView:a4];
  AXApplyTabBarItemPropertiesToView(v11, v8);
  id v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v6;
}

@end