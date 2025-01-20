@interface CKMultipleIDSSubscriptionsTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation CKMultipleIDSSubscriptionsTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMultipleIDSSubscriptionsTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMultipleIDSSubscriptionsTableCell", @"nameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMultipleIDSSubscriptionsTableCell", @"numberLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMultipleIDSSubscriptionsTableCell", @"centeredNameLabel", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(CKMultipleIDSSubscriptionsTableCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"nameLabel, numberLabel, centeredNameLabel"];
}

@end