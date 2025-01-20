@interface SUUIGiftRecipientTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsRecipientViewFocused;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIGiftRecipientTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIGiftRecipientTableViewCell";
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
  return ![(SUUIGiftRecipientTableViewCellAccessibility *)self _accessibilityIsRecipientViewFocused];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"gift.recipient.table.cell.hint");
}

- (id)accessibilityLabel
{
  return (id)[(SUUIGiftRecipientTableViewCellAccessibility *)self safeValueForKey:@"label"];
}

- (id)accessibilityValue
{
  v2 = [(SUUIGiftRecipientTableViewCellAccessibility *)self safeValueForKey:@"recipientAddresses"];
  v3 = MEMORY[0x245656BA0]();

  return v3;
}

- (id)accessibilityElements
{
  v2 = [(SUUIGiftRecipientTableViewCellAccessibility *)self safeValueForKey:@"_recipientView"];
  v3 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v2);

  return v3;
}

- (BOOL)_accessibilityIsRecipientViewFocused
{
  v2 = [(SUUIGiftRecipientTableViewCellAccessibility *)self safeValueForKey:@"_recipientView"];
  v3 = [v2 safeValueForKey:@"focused"];
  char v4 = [v3 BOOLValue];

  return v4;
}

@end