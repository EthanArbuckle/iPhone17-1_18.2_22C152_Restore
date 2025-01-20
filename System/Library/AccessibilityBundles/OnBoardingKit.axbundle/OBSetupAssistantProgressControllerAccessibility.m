@interface OBSetupAssistantProgressControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation OBSetupAssistantProgressControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBSetupAssistantProgressController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"OBSetupAssistantProgressController" isKindOfClass:@"OBWelcomeController"];
  [v3 validateClass:@"OBSetupAssistantProgressController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBWelcomeController", @"contentView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)OBSetupAssistantProgressControllerAccessibility;
  [(OBSetupAssistantProgressControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(OBSetupAssistantProgressControllerAccessibility *)self safeValueForKey:@"contentView"];
  [v3 _accessibilitySetOverridesInvalidFrames:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)OBSetupAssistantProgressControllerAccessibility;
  [(OBSetupAssistantProgressControllerAccessibility *)&v3 viewDidLoad];
  [(OBSetupAssistantProgressControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end