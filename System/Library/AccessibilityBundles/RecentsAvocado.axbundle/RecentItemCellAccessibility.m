@interface RecentItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
@end

@implementation RecentItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RecentsAvocado.RecentItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RecentsAvocado.RecentItemCell", @"accessibilityItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RecentsAvocado.RecentItemCell", @"accessibilityTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RecentsAvocado.RecentItemCell", @"accessibilitySubtitle", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  id v3 = [(RecentItemCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitle, accessibilitySubtitle"];
  v4 = [(RecentItemCellAccessibility *)self safeValueForKey:@"accessibilityItem"];
  v5 = __UIAccessibilitySafeClass();

  if (v5)
  {
    int v6 = AXDoesRequestingClientDeserveAutomation();
    v7 = [v5 filename];
    v8 = [v7 pathExtension];
    if (!v6)
    {
      uint64_t v9 = UIAXFileTypeDescriptionForFileExtension();

      v8 = (void *)v9;
    }
  }
  else
  {
    v8 = 0;
  }
  v10 = __UIAXStringForVariables();

  return v10;
}

- (id)accessibilityUserInputLabels
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(RecentItemCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitle"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

@end