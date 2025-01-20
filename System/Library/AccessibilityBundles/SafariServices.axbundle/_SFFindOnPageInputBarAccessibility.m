@interface _SFFindOnPageInputBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation _SFFindOnPageInputBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFFindOnPageInputBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_SFFindOnPageInputBar" isKindOfClass:@"UISearchBar"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UISearchBar", @"_visualProvider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UISearchBarVisualProviderBase", @"searchField", "@", 0);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_SFFindOnPageInputBarAccessibility;
  [(_SFFindOnPageInputBarAccessibility *)&v3 layoutSubviews];
  [(_SFFindOnPageInputBarAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)_SFFindOnPageInputBarAccessibility;
  [(_SFFindOnPageInputBarAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(_SFFindOnPageInputBarAccessibility *)self safeValueForKey:@"_visualProvider"];
  v4 = [v3 safeUIViewForKey:@"searchField"];
  [v4 setAccessibilityIdentifier:@"SFFindOnPageBarIdentifier"];
}

@end