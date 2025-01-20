@interface _UISubtitleCellContentViewConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation _UISubtitleCellContentViewConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UISubtitleCellContentViewConfiguration";
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
  v3 = @"_UISubtitleCellContentViewConfiguration";
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"subtitleLabel", v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)accessibilityLabel
{
  v12 = self;
  v11[1] = (id)a2;
  v10.receiver = self;
  v10.super_class = (Class)_UISubtitleCellContentViewConfigurationAccessibility;
  v11[0] = [(_UISubtitleCellContentViewConfigurationAccessibility *)&v10 accessibilityLabel];
  if (![v11[0] length])
  {
    id v9 = (id)[(_UISubtitleCellContentViewConfigurationAccessibility *)v12 safeValueForKey:@"textLabel"];
    id v8 = (id)[v9 accessibilityLabel];
    id v7 = (id)[(_UISubtitleCellContentViewConfigurationAccessibility *)v12 safeValueForKey:@"subtitleLabel"];
    id v5 = (id)[v7 accessibilityLabel];
    id v2 = (id)__UIAXStringForVariables();
    id v3 = v11[0];
    v11[0] = v2;
  }
  id v6 = v11[0];
  objc_storeStrong(v11, 0);

  return v6;
}

@end