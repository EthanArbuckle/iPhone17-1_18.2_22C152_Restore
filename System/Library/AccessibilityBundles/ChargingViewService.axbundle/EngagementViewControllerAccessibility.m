@interface EngagementViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidLoad;
@end

@implementation EngagementViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EngagementViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EngagementViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EngagementViewController", @"engagementDismissButton", "@", 0);
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)EngagementViewControllerAccessibility;
  [(EngagementViewControllerAccessibility *)&v4 viewDidLoad];
  id v3 = [(EngagementViewControllerAccessibility *)self safeValueForKey:@"engagementDismissButton"];
  [v3 setIsAccessibilityElement:0];
}

@end