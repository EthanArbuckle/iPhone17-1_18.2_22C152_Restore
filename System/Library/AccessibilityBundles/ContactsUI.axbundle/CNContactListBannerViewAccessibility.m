@interface CNContactListBannerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CNContactListBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNContactListBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = [(CNContactListBannerViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_4];
  v3 = AXLabelForElements();

  return v3;
}

uint64_t __58__CNContactListBannerViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end