@interface MFMessageHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (int64_t)accessibilityNavigationStyle;
@end

@implementation MFMessageHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFMessageHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (int64_t)accessibilityContainerType
{
  v2 = [(MFMessageHeaderViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_5 startWithSelf:0];
  objc_opt_class();
  v3 = __UIAccessibilityCastAsSafeCategory();
  v4 = [v3 _accessibilityMessageIndexDescription];

  return 4 * (v4 == 0);
}

uint64_t __62__MFMessageHeaderViewAccessibility_accessibilityContainerType__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Mfexpandedmess_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"message.header");
}

@end