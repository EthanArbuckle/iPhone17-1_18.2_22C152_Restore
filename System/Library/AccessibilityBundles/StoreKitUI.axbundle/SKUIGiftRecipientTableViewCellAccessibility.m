@interface SKUIGiftRecipientTableViewCellAccessibility
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

@implementation SKUIGiftRecipientTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIGiftRecipientTableViewCell";
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
  return ![(SKUIGiftRecipientTableViewCellAccessibility *)self _accessibilityIsRecipientViewFocused];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityHint
{
  return accessibilitySKUILocalizedString(@"gift.recipient.table.cell.hint");
}

- (id)accessibilityLabel
{
  return (id)[(SKUIGiftRecipientTableViewCellAccessibility *)self safeValueForKey:@"label"];
}

- (id)accessibilityValue
{
  v2 = [(SKUIGiftRecipientTableViewCellAccessibility *)self safeValueForKey:@"recipientAddresses"];
  v3 = MEMORY[0x2455E57F0]();

  return v3;
}

- (id)accessibilityElements
{
  v2 = [(SKUIGiftRecipientTableViewCellAccessibility *)self safeValueForKey:@"_recipientView"];
  v3 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v2);

  return v3;
}

- (BOOL)_accessibilityIsRecipientViewFocused
{
  v2 = [(SKUIGiftRecipientTableViewCellAccessibility *)self safeValueForKey:@"_recipientView"];
  v3 = [v2 safeValueForKey:@"focused"];
  char v4 = [v3 BOOLValue];

  return v4;
}

@end