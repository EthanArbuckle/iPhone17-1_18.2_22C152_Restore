@interface MailMailboxGroupedPickerTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MailMailboxGroupedPickerTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MailMailboxGroupedPickerTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = UIAXStringForAllChildren();
  if (![v2 length])
  {
    uint64_t v3 = accessibilityLocalizedString(@"mailbox.location");

    v2 = (void *)v3;
  }

  return v2;
}

@end