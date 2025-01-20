@interface _UIBasicCellContentViewConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation _UIBasicCellContentViewConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIBasicCellContentViewConfiguration";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIBasicCellContentViewConfiguration", @"textLabel", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)_UIBasicCellContentViewConfigurationAccessibility;
  v8[0] = [(_UIBasicCellContentViewConfigurationAccessibility *)&v7 accessibilityLabel];
  if (![v8[0] length])
  {
    id v6 = (id)[(_UIBasicCellContentViewConfigurationAccessibility *)v9 safeValueForKey:@"textLabel"];
    id v2 = (id)[v6 accessibilityLabel];
    id v3 = v8[0];
    v8[0] = v2;
  }
  id v5 = v8[0];
  objc_storeStrong(v8, 0);

  return v5;
}

@end