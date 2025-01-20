@interface CKRecipientSelectionControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateLabelOnToField;
- (void)addRecipient:(id)a3;
- (void)viewDidLoad;
@end

@implementation CKRecipientSelectionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKRecipientSelectionController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKComposeRecipientView" isKindOfClass:@"CNComposeRecipientTextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTextView", @"textView", "@", 0);
  [v3 validateClass:@"CNAutocompleteResultsTableViewController" isKindOfClass:@"UITableViewController"];
  [v3 validateClass:@"CKRecipientSearchListController" isKindOfClass:@"CNAutocompleteResultsTableViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipient", @"displayString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKRecipientSelectionController", @"searchListController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewController", @"tableView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKRecipientSelectionController", @"addRecipient:", "v", "@", 0);
}

- (void)_updateLabelOnToField
{
  id v4 = [(CKRecipientSelectionControllerAccessibility *)self safeValueForKey:@"toField"];
  v2 = [v4 safeValueForKey:@"textView"];
  id v3 = accessibilityLocalizedString(@"to.field");
  [v2 setAccessibilityLabel:v3];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CKRecipientSelectionControllerAccessibility;
  [(CKRecipientSelectionControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CKRecipientSelectionControllerAccessibility *)self _updateLabelOnToField];
}

- (id)accessibilityElements
{
  objc_super v3 = [(CKRecipientSelectionControllerAccessibility *)self safeUIViewForKey:@"toField"];
  objc_opt_class();
  id v4 = [(CKRecipientSelectionControllerAccessibility *)self safeValueForKeyPath:@"searchListController.tableView"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v3, v5);

  return v6;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CKRecipientSelectionControllerAccessibility;
  [(CKRecipientSelectionControllerAccessibility *)&v3 viewDidLoad];
  [(CKRecipientSelectionControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)addRecipient:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKRecipientSelectionControllerAccessibility;
  id v3 = a3;
  [(CKRecipientSelectionControllerAccessibility *)&v8 addRecipient:v3];
  id v4 = [v3 safeStringForKey:@"displayString"];

  v5 = NSString;
  v6 = accessibilityLocalizedString(@"recipient.added.announcement");
  v7 = objc_msgSend(v5, "stringWithFormat:", v6, v4);

  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v7);
}

@end