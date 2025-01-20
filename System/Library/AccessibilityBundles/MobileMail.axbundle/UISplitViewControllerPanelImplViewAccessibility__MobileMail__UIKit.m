@interface UISplitViewControllerPanelImplViewAccessibility__MobileMail__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityScannerGroupElements;
@end

@implementation UISplitViewControllerPanelImplViewAccessibility__MobileMail__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"_UISplitViewControllerPanelImplView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MailAppController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailAppController", @"mostRecentMainScene", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailMainScene", @"splitViewController", "@", 0);
}

- (id)_accessibilityScannerGroupElements
{
  id v3 = [MEMORY[0x263F1C408] sharedApplication];
  NSClassFromString(&cfstr_Mailappcontrol_0.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v4 = [v3 safeValueForKey:@"mostRecentMainScene"];
    v5 = __UIAccessibilityCastAsClass();

    char v13 = 0;
    objc_opt_class();
    v6 = [v5 safeValueForKey:@"splitViewController"];
    v7 = __UIAccessibilityCastAsClass();

    v8 = [v7 view];

    if (v8 != self
      || (char v13 = 0,
          objc_opt_class(),
          __UIAccessibilityCastAsSafeCategory(),
          v10 = objc_claimAutoreleasedReturnValue(),
          [v10 _accessibilitySplitViewControllerScannerGroupElements],
          v9 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v9))
    {
      v12.receiver = self;
      v12.super_class = (Class)UISplitViewControllerPanelImplViewAccessibility__MobileMail__UIKit;
      v9 = [(UISplitViewControllerPanelImplViewAccessibility__MobileMail__UIKit *)&v12 _accessibilityScannerGroupElements];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end