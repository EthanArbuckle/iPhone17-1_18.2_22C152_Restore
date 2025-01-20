@interface CKDetailsSearchResultsTitleHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation CKDetailsSearchResultsTitleHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKDetailsSearchResultsTitleHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKDetailsSearchResultsTitleHeaderCell" isKindOfClass:@"CKSearchResultsTitleHeaderCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSearchResultsTitleHeaderCell", @"sectionTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSearchResultsTitleHeaderCell", @"showAllButton", "@", 0);
}

- (id)accessibilityElements
{
  id v3 = [(CKDetailsSearchResultsTitleHeaderCellAccessibility *)self safeValueForKey:@"showAllButton"];
  objc_opt_class();
  v4 = [(CKDetailsSearchResultsTitleHeaderCellAccessibility *)self safeValueForKey:@"sectionTitle"];
  v5 = __UIAccessibilityCastAsClass();

  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x263F1CF48] | *MEMORY[0x263F1CEF8] | objc_msgSend(v5, "accessibilityTraits"));
  v6 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v5, v3);

  return v6;
}

@end