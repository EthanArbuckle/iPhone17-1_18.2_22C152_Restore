@interface WGWidgetPlatterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (id)accessibilityIdentifier;
- (int64_t)accessibilityNavigationStyle;
@end

@implementation WGWidgetPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WGWidgetPlatterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WGWidgetPlatterView" hasInstanceVariable:@"_headerContentView" withType:"WGPlatterHeaderContentView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGWidgetPlatterView", @"contentView", "@", 0);
}

- (id)accessibilityIdentifier
{
  return @"WGWidgetPlatterView";
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (id)accessibilityElements
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(WGWidgetPlatterViewAccessibility *)self safeValueForKey:@"_headerContentView"];
  v5 = [(WGWidgetPlatterViewAccessibility *)self safeValueForKey:@"contentView"];
  v6 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);

  return v6;
}

@end