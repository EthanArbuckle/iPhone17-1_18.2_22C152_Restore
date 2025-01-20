@interface CKAttachmentSearchResultCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axContact;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_axSetContact:(id)a3;
@end

@implementation CKAttachmentSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAttachmentSearchResultCell";
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
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAttachmentSearchResultCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAttachmentSearchResultCell", @"dateLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(CKAttachmentSearchResultCellAccessibility *)self _axContact];
  v4 = AXCKLocalizedFromStringWithContact(v3);

  v5 = [(CKAttachmentSearchResultCellAccessibility *)self safeValueForKey:@"titleLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = [(CKAttachmentSearchResultCellAccessibility *)self safeValueForKey:@"dateLabel"];
  v8 = [v7 accessibilityLabel];

  v11 = accessibilityLocalizedString(@"search.item.attachment");
  v9 = __UIAXStringForVariables();

  return v9;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end