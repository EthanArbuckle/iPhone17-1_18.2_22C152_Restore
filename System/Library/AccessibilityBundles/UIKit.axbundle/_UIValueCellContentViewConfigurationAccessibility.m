@interface _UIValueCellContentViewConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation _UIValueCellContentViewConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIValueCellContentViewConfiguration";
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
  v3 = @"_UIValueCellContentViewConfiguration";
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"valueLabel", v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)accessibilityLabel
{
  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)_UIValueCellContentViewConfigurationAccessibility;
  v8[0] = [(_UIValueCellContentViewConfigurationAccessibility *)&v7 accessibilityLabel];
  if (![v8[0] length])
  {
    id v6 = (id)[(_UIValueCellContentViewConfigurationAccessibility *)v9 safeValueForKey:@"textLabel"];
    id v2 = (id)[v6 accessibilityLabel];
    id v3 = v8[0];
    v8[0] = v2;
  }
  id v5 = v8[0];
  objc_storeStrong(v8, 0);

  return v5;
}

- (id)accessibilityValue
{
  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)_UIValueCellContentViewConfigurationAccessibility;
  v8[0] = [(_UIValueCellContentViewConfigurationAccessibility *)&v7 accessibilityValue];
  if (![v8[0] length])
  {
    id v6 = (id)[(_UIValueCellContentViewConfigurationAccessibility *)v9 safeValueForKey:@"valueLabel"];
    id v2 = (id)[v6 accessibilityLabel];
    id v3 = v8[0];
    v8[0] = v2;
  }
  id v5 = v8[0];
  objc_storeStrong(v8, 0);

  return v5;
}

@end