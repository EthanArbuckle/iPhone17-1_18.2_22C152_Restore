@interface MailboxPickerOutlineControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)shelfButtonItem;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MailboxPickerOutlineControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MailboxPickerOutlineController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailboxPickerOutlineController", @"shelfButtonItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailboxPickerOutlineController", @"_updateToolbarItems:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)MailboxPickerOutlineControllerAccessibility;
  [(MailboxPickerOutlineControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  AXPerformSafeBlock();
}

uint64_t __89__MailboxPickerOutlineControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateToolbarItems:0];
}

- (id)shelfButtonItem
{
  v5.receiver = self;
  v5.super_class = (Class)MailboxPickerOutlineControllerAccessibility;
  objc_super v2 = [(MailboxPickerOutlineControllerAccessibility *)&v5 shelfButtonItem];
  id v3 = accessibilityLocalizedString(@"app.shelf.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

@end