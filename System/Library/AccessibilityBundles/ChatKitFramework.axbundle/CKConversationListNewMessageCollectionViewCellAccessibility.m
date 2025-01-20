@interface CKConversationListNewMessageCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axEmbeddedTableViewCell;
- (id)accessibilityLabel;
@end

@implementation CKConversationListNewMessageCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKConversationListNewMessageCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKConversationListNewMessageCollectionViewCell" isKindOfClass:@"CKConversationListEmbeddedCollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListNewMessageCollectionViewCell", @"embeddedNewMessageTableViewCell", "@", 0);
  [v3 validateClass:@"CKConversationListEmbeddedNewMessageTableViewCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"text", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CKConversationListNewMessageCollectionViewCellAccessibility *)self _axEmbeddedTableViewCell];
  id v3 = [v2 safeStringForKey:@"text"];

  return v3;
}

- (id)_axEmbeddedTableViewCell
{
  return (id)[(CKConversationListNewMessageCollectionViewCellAccessibility *)self safeValueForKey:@"embeddedNewMessageTableViewCell"];
}

@end