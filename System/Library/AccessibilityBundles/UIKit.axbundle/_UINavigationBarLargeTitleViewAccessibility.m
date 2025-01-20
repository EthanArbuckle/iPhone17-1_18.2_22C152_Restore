@interface _UINavigationBarLargeTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_UINavigationBarLargeTitleViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation _UINavigationBarLargeTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UINavigationBarLargeTitleView";
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
  v3 = @"_UINavigationBarLargeTitleView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UINavigationBarLargeTitleView", @"initWithFrame:", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [location[0] validateClass:v3 hasInstanceVariable:@"_layout" withType:"_UINavigationBarLargeTitleViewLayout"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UINavigationBarLargeTitleViewLayout", @"titleLabel", v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarLargeTitleViewAccessibility;
  [(_UINavigationBarLargeTitleViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = (id)[(_UINavigationBarLargeTitleViewAccessibility *)v6 safeValueForKey:@"_layout"];
  id v2 = (id)[v3 safeValueForKey:@"titleLabel"];
  [v2 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (_UINavigationBarLargeTitleViewAccessibility)initWithFrame:(CGRect)a3
{
  CGRect v8 = a3;
  v6[1] = (id)a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarLargeTitleViewAccessibility;
  v7 = -[_UINavigationBarLargeTitleViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6[0] = v7;
  [(_UINavigationBarLargeTitleViewAccessibility *)v7 _accessibilityLoadAccessibilityInformation];
  objc_super v4 = (_UINavigationBarLargeTitleViewAccessibility *)v6[0];
  objc_storeStrong(v6, 0);
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (void)layoutSubviews
{
  objc_super v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarLargeTitleViewAccessibility;
  [(_UINavigationBarLargeTitleViewAccessibility *)&v3 layoutSubviews];
  id v2 = (id)[(_UINavigationBarLargeTitleViewAccessibility *)v5 _accessibilityFindAncestor:&__block_literal_global_54 startWithSelf:0];
  objc_msgSend(v2, "_accessibility_navigationBarContentsDidChange");
  objc_storeStrong(&v2, 0);
}

@end