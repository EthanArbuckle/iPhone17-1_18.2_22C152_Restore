@interface UIInputWindowControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)resetBackdropHeight;
- (void)updateInputAssistantViewForInputViewSet:(id)a3;
@end

@implementation UIInputWindowControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIInputWindowController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  [location[0] validateClass:@"UIKeyboardImpl" hasInstanceMethod:@"candidateController" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardCandidateController", @"isExtended", "B", 0);
  v4 = @"UIInputWindowController";
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIInputViewSet", @"inputView", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"updateInputAssistantViewForInputViewSet:", v5, v3, 0);
  objc_storeStrong(v7, v6);
}

- (void)resetBackdropHeight
{
  v9 = self;
  SEL v8 = a2;
  char v6 = 0;
  char v4 = 0;
  char v2 = 0;
  if (UIAccessibilityIsSwitchControlRunning())
  {
    id v7 = (id)[MEMORY[0x263F1C738] sharedInstance];
    char v6 = 1;
    id v5 = (id)[v7 safeValueForKey:@"candidateController"];
    char v4 = 1;
    char v2 = [v5 safeBoolForKey:@"isExtended"];
  }
  if (v4) {

  }
  if (v6) {
  if ((v2 & 1) == 0)
  }
  {
    v3.receiver = v9;
    v3.super_class = (Class)UIInputWindowControllerAccessibility;
    [(UIInputWindowControllerAccessibility *)&v3 resetBackdropHeight];
  }
}

- (void)updateInputAssistantViewForInputViewSet:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIInputWindowControllerAccessibility;
  [(UIInputWindowControllerAccessibility *)&v5 updateInputAssistantViewForInputViewSet:location[0]];
  id v4 = (id)[location[0] safeValueForKey:@"inputView"];
  NSClassFromString(&cfstr_Uiremotekeyboa_2.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id argument = (id)[v4 _accessibilityDescendantOfType:objc_opt_class()];
    if (argument) {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
    }
    objc_storeStrong(&argument, 0);
  }
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

@end