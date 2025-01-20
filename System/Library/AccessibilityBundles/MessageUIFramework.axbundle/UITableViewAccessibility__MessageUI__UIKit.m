@interface UITableViewAccessibility__MessageUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityViewIsModal;
- (id)_accessibilityObscuredScreenAllowedViews;
@end

@implementation UITableViewAccessibility__MessageUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_UIPopoverView"];
  [v3 validateClass:@"MFMailComposeView" hasInstanceVariable:@"_activeRecipientView" withType:"MFMailComposeRecipientTextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFAutocompleteResultsTableViewController", @"delegate", "@", 0);
}

- (BOOL)accessibilityViewIsModal
{
  id v3 = [(UITableViewAccessibility__MessageUI__UIKit *)self accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"MessageRecipientSearchTable"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)UITableViewAccessibility__MessageUI__UIKit;
  return [(UITableViewAccessibility__MessageUI__UIKit *)&v6 accessibilityViewIsModal];
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  id v3 = [(UITableViewAccessibility__MessageUI__UIKit *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uipopoverview.isa)];

  if (v3
    || ([(UITableViewAccessibility__MessageUI__UIKit *)self accessibilityIdentifier],
        char v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:@"MessageRecipientSearchTable"],
        v4,
        !v5))
  {
    v11.receiver = self;
    v11.super_class = (Class)UITableViewAccessibility__MessageUI__UIKit;
    v9 = [(UITableViewAccessibility__MessageUI__UIKit *)&v11 _accessibilityObscuredScreenAllowedViews];
  }
  else
  {
    objc_super v6 = [(UITableViewAccessibility__MessageUI__UIKit *)self safeValueForKey:@"delegate"];
    v7 = [v6 safeValueForKey:@"delegate"];
    v8 = [v7 safeValueForKey:@"_activeRecipientView"];
    v9 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v8);
  }

  return v9;
}

@end