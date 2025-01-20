@interface CKConversationSearchResultCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CKConversationSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKConversationSearchResultCell";
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

- (id)accessibilityLabel
{
  v2 = [(CKConversationSearchResultCellAccessibility *)self safeValueForKey:@"searchCell"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CKConversationSearchResultCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CKConversationSearchResultCellAccessibility *)&v3 accessibilityTraits];
}

@end