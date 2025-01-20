@interface UITableViewAccessibility__ScreenTimeUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityHeaderElement;
@end

@implementation UITableViewAccessibility__ScreenTimeUI__UIKit

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
  [v3 validateClass:@"STUsageDetailListController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUsageDetailListController", @"datePickerBar", "@", 0);
}

- (id)_accessibilityHeaderElement
{
  id v3 = [(UITableViewAccessibility__ScreenTimeUI__UIKit *)self safeValueForKey:@"delegate"];
  MEMORY[0x24565EFD0](@"STUsageDetailListController");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(UITableViewAccessibility__ScreenTimeUI__UIKit *)self safeValueForKey:@"delegate"];
    v6 = [v5 safeValueForKey:@"datePickerBar"];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewAccessibility__ScreenTimeUI__UIKit;
    v6 = [(UITableViewAccessibility__ScreenTimeUI__UIKit *)&v8 _accessibilityHeaderElement];
  }

  return v6;
}

@end