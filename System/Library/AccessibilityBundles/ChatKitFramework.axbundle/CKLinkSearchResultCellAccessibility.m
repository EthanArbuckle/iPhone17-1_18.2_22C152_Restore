@interface CKLinkSearchResultCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axContact;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_axSetContact:(id)a3;
@end

@implementation CKLinkSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKLinkSearchResultCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axContact
{
}

- (void)_axSetContact:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(CKLinkSearchResultCellAccessibility *)self safeUIViewForKey:@"linkView"];
  v4 = [(CKLinkSearchResultCellAccessibility *)self _axContact];
  v5 = AXCKLocalizedFromStringWithContact(v4);

  v8 = [v3 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end