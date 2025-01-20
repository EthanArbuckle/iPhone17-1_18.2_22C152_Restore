@interface PHVoicemailInboxListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PHVoicemailInboxListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHVoicemailInboxListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailInboxListViewController", @"tableView:didSelectRowAtIndexPath:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailInboxListViewController", @"tableView:didDeselectRowAtIndexPath:", "v", "@", "@", 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PHVoicemailInboxListViewControllerAccessibility;
  id v5 = a4;
  id v6 = a3;
  [(PHVoicemailInboxListViewControllerAccessibility *)&v8 tableView:v6 didSelectRowAtIndexPath:v5];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  v7 = objc_msgSend(v6, "cellForRowAtIndexPath:", v5, v8.receiver, v8.super_class);

  [v7 _accessibilitySetBoolValue:1 forKey:@"Selected"];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PHVoicemailInboxListViewControllerAccessibility;
  id v5 = a4;
  id v6 = a3;
  [(PHVoicemailInboxListViewControllerAccessibility *)&v8 tableView:v6 didDeselectRowAtIndexPath:v5];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  v7 = objc_msgSend(v6, "cellForRowAtIndexPath:", v5, v8.receiver, v8.super_class);

  [v7 _accessibilitySetBoolValue:0 forKey:@"Selected"];
}

@end