@interface SearchLinkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.SearchLinkView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SearchLinkViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SearchLinkViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  v2 = [(SearchLinkViewAccessibility *)self safeSwiftValueForKey:@"linkLabel"];
  objc_super v3 = __UIAXStringForVariables();

  return v3;
}

@end