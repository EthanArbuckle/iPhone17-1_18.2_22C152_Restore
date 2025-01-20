@interface CNAutocompleteSuggestionsViewSectionHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CNAutocompleteSuggestionsViewSectionHeaderAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CNAutocompleteSuggestionsViewSectionHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNAutocompleteSuggestionsViewSectionHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAutocompleteSuggestionsViewSectionHeader", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAutocompleteSuggestionsViewSectionHeader", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CNAutocompleteSuggestionsViewSectionHeaderAccessibility;
  [(CNAutocompleteSuggestionsViewSectionHeaderAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CNAutocompleteSuggestionsViewSectionHeaderAccessibility *)self safeValueForKey:@"titleLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (CNAutocompleteSuggestionsViewSectionHeaderAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNAutocompleteSuggestionsViewSectionHeaderAccessibility;
  id v3 = -[CNAutocompleteSuggestionsViewSectionHeaderAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3) {
    [(CNAutocompleteSuggestionsViewSectionHeaderAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  }

  return v4;
}

@end