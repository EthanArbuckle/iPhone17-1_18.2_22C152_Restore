@interface EducationWelcomeControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityHideVideoPlayer;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation EducationWelcomeControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriSetup.EducationWelcomeController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriSetup.EducationWelcomeController", @"viewDidAppear:", "v", "B", 0);
  [v3 validateClass:@"SiriSetup.EducationWelcomeController" isKindOfClass:@"OBWelcomeController"];
}

- (void)_accessibilityHideVideoPlayer
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 contentView];
  [v3 setAccessibilityElementsHidden:1];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)EducationWelcomeControllerAccessibility;
  [(EducationWelcomeControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(EducationWelcomeControllerAccessibility *)self _accessibilityHideVideoPlayer];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EducationWelcomeControllerAccessibility;
  [(EducationWelcomeControllerAccessibility *)&v4 viewDidAppear:a3];
  [(EducationWelcomeControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end