@interface CondensedEditorialSearchResultContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CondensedEditorialSearchResultContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.CondensedEditorialSearchResultContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.CondensedEditorialSearchResultContentView", @"accessibilityHeaderLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProductPageExtension.CondensedEditorialSearchResultContentView", @"accessibilityTitleLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityAppStoreLocalizedString(@"view.developer.hint");
}

- (id)accessibilityLabel
{
  id v3 = [(CondensedEditorialSearchResultContentViewAccessibility *)self safeValueForKey:@"accessibilityHeaderLabel"];
  v6 = [(CondensedEditorialSearchResultContentViewAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CondensedEditorialSearchResultContentViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CondensedEditorialSearchResultContentViewAccessibility *)&v3 accessibilityTraits];
}

@end