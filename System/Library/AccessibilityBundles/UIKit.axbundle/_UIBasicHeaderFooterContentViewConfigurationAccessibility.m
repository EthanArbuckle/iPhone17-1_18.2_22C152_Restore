@interface _UIBasicHeaderFooterContentViewConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIBasicHeaderFooterContentViewConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIBasicHeaderFooterContentViewConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIBasicHeaderFooterContentViewConfiguration";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:v3 hasInstanceVariable:@"_defaultStyle" withType:"q"];
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)_UIBasicHeaderFooterContentViewConfigurationAccessibility;
  v8[0] = [(_UIBasicHeaderFooterContentViewConfigurationAccessibility *)&v7 accessibilityLabel];
  if (![v8[0] length])
  {
    id v6 = (id)[(_UIBasicHeaderFooterContentViewConfigurationAccessibility *)v9 safeValueForKey:@"textLabel"];
    id v2 = (id)[v6 accessibilityLabel];
    id v3 = v8[0];
    v8[0] = v2;
  }
  id v5 = v8[0];
  objc_storeStrong(v8, 0);

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v8 = self;
  SEL v7 = a2;
  uint64_t v6 = [(_UIBasicHeaderFooterContentViewConfigurationAccessibility *)self safeIntegerForKey:@"_defaultStyle"];
  v5.receiver = v8;
  v5.super_class = (Class)_UIBasicHeaderFooterContentViewConfigurationAccessibility;
  unint64_t v4 = [(_UIBasicHeaderFooterContentViewConfigurationAccessibility *)&v5 accessibilityTraits];
  if (v6 && v6 != 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *MEMORY[0x263F1CEF8];
  }
  return v4 | v3;
}

@end