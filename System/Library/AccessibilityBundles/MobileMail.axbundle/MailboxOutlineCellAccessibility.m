@interface MailboxOutlineCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MailboxOutlineCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MailboxOutlineCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  if ([(MailboxOutlineCellAccessibility *)self safeBoolForKey:@"showFocusIcon"])
  {
    v8.receiver = self;
    v8.super_class = (Class)MailboxOutlineCellAccessibility;
    v3 = [(MailboxOutlineCellAccessibility *)&v8 accessibilityLabel];
    v6 = accessibilityLocalizedString(@"mailbox.focus.filtered");
    v4 = __AXStringForVariables();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MailboxOutlineCellAccessibility;
    v4 = [(MailboxOutlineCellAccessibility *)&v7 accessibilityLabel];
  }

  return v4;
}

@end