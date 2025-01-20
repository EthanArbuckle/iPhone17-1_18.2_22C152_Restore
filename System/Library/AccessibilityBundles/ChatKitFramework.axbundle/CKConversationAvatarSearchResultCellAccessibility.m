@interface CKConversationAvatarSearchResultCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CKConversationAvatarSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKConversationAvatarSearchResultCell";
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
  v2 = [(CKConversationAvatarSearchResultCellAccessibility *)self safeValueForKey:@"nameLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CKConversationAvatarSearchResultCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CKConversationAvatarSearchResultCellAccessibility *)&v3 accessibilityTraits];
}

@end