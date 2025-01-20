@interface UIBarItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityLocalizationBundleID;
- (id)accessibilityLocalizationBundlePath;
- (id)accessibilityLocalizedStringKey;
- (id)accessibilityLocalizedStringTableName;
@end

@implementation UIBarItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIBarItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIBarButtonItem", @"title", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  v8 = self;
  v7[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)UIBarItemAccessibility;
  v7[0] = [(UIBarItemAccessibility *)&v6 accessibilityLabel];
  if (!v7[0])
  {
    id v2 = (id)[(UIBarItemAccessibility *)v8 safeValueForKey:@"title"];
    id v3 = v7[0];
    v7[0] = v2;
  }
  id v5 = v7[0];
  objc_storeStrong(v7, 0);

  return v5;
}

- (id)accessibilityLocalizedStringKey
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)[(UIBarItemAccessibility *)self safeValueForKey:@"title"];
  id v5 = (id)[v6[0] _accessibilityAttributedLocalizedString];
  id v4 = (id)[v5 safeValueForKey:@"UIAccessibilityTokenLocalizedStringKey"];
  id v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);

  return v3;
}

- (id)accessibilityLocalizationBundleID
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)[(UIBarItemAccessibility *)self safeValueForKey:@"title"];
  id v5 = (id)[v6[0] _accessibilityAttributedLocalizedString];
  id v4 = (id)[v5 safeValueForKey:@"UIAccessibilityTokenLocalizedStringBundleID"];
  id v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);

  return v3;
}

- (id)accessibilityLocalizationBundlePath
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)[(UIBarItemAccessibility *)self safeValueForKey:@"title"];
  id v5 = (id)[v6[0] _accessibilityAttributedLocalizedString];
  id v4 = (id)[v5 safeValueForKey:@"UIAccessibilityTokenLocalizationBundlePath"];
  id v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);

  return v3;
}

- (id)accessibilityLocalizedStringTableName
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)[(UIBarItemAccessibility *)self safeValueForKey:@"title"];
  id v5 = (id)[v6[0] _accessibilityAttributedLocalizedString];
  id v4 = (id)[v5 safeValueForKey:@"UIAccessibilityTokenLocalizedStringTableName"];
  id v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);

  return v3;
}

@end