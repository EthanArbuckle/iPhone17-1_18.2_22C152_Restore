@interface MusicApplicationSearchBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4;
- (void)textFieldDidBeginEditing:(id)a3;
@end

@implementation MusicApplicationSearchBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TtCC16MusicApplication6Search3Bar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TtCC16MusicApplication6Search3Bar" hasSwiftField:@"scopeBarContentView" withSwiftType:"ScopeBarContainerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TtCC16MusicApplication6Search3Bar", @"textFieldDidBeginEditing:", "v", "{UITextField=#}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TtCC16MusicApplication6Search3Bar", @"setShowsScopeBar:animated:", "v", "B", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)MusicApplicationSearchBarAccessibility;
  [(MusicApplicationSearchBarAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MusicApplicationSearchBarAccessibility *)self safeSwiftValueForKey:@"scopeBarContentView"];
  v4 = [v3 subviews];
  v5 = [v4 axFilterObjectsUsingBlock:&__block_literal_global_1];

  [v3 setAccessibilityElements:v5];
}

uint64_t __84__MusicApplicationSearchBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityViewIsVisible];
}

- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MusicApplicationSearchBarAccessibility;
  [(MusicApplicationSearchBarAccessibility *)&v5 setShowsScopeBar:a3 animated:a4];
  [(MusicApplicationSearchBarAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MusicApplicationSearchBarAccessibility;
  [(MusicApplicationSearchBarAccessibility *)&v4 textFieldDidBeginEditing:a3];
  [(MusicApplicationSearchBarAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end