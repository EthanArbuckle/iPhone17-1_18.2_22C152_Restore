@interface MFMailComposeControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_composeViewDidDraw:(id)a3;
- (void)viewDidLoad;
@end

@implementation MFMailComposeControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFMailComposeController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailComposeController", @"_composeViewDidDraw:", "v", "@", 0);
  [v3 validateClass:@"MFMailComposeController" hasInstanceVariable:@"_toField" withType:"MFMailComposeToField"];
  [v3 validateClass:@"MFMailComposeController" hasInstanceVariable:@"_sendButtonItem" withType:"UIBarButtonItem"];
  [v3 validateClass:@"MFMailComposeController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"WKScrollView"];
  [v3 validateClass:@"MFMailComposeController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)MFMailComposeControllerAccessibility;
  [(MFMailComposeControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MFMailComposeControllerAccessibility *)self safeUIViewForKey:@"view"];
  v4 = [v3 _accessibilityFindSubviewDescendant:&__block_literal_global_6];

  [v4 _accessibilitySetShouldUseFallbackForVisibleContentInset:1];
  v5 = [(MFMailComposeControllerAccessibility *)self safeValueForKey:@"_sendButtonItem"];
  v6 = accessibilityLocalizedString(@"send.button");
  [v5 setAccessibilityLabel:v6];
}

uint64_t __82__MFMailComposeControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Wkscrollview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_composeViewDidDraw:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeControllerAccessibility;
  [(MFMailComposeControllerAccessibility *)&v3 _composeViewDidDraw:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __60__MFMailComposeControllerAccessibility__composeViewDidDraw___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];
  id v2 = [*(id *)(a1 + 32) valueForKey:@"_toField"];
  UIAccessibilityPostNotification(v1, v2);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeControllerAccessibility;
  [(MFMailComposeControllerAccessibility *)&v3 viewDidLoad];
  [(MFMailComposeControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end