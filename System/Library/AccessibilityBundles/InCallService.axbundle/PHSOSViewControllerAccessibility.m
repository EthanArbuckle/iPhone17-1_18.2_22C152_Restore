@interface PHSOSViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)_axMoveToCancelButton;
- (void)_axSpeakInfo;
- (void)presentMedicalID;
- (void)showSOSDialCanceled;
- (void)showSOSDialCountdown;
- (void)showSOSNotificationCanceled;
- (void)showSOSNotificationCountdown;
- (void)showSOSNotified;
- (void)showSOSNumbersList;
@end

@implementation PHSOSViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHSOSViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PHSOSViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSOSViewController", @"sosMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSOSViewController", @"infoLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSOSViewController", @"cancelButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSOSViewController", @"showSOSNumbersList", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSOSViewController", @"showSOSDialCountdown", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSOSViewController", @"showSOSDialCanceled", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSOSViewController", @"showSOSNotified", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSOSViewController", @"showSOSNotificationCountdown", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSOSViewController", @"showSOSNotificationCanceled", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSOSViewController", @"presentMedicalID", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSOSViewController", @"buttonPressed:", "v", "@", 0);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3 = [(PHSOSViewControllerAccessibility *)self safeIntegerForKey:@"sosMode"];
  if (v3 == 1)
  {
    v6 = [(PHSOSViewControllerAccessibility *)self safeValueForKey:@"cancelButton"];
    id v4 = v6;
    AXPerformSafeBlock();
  }
  return v3 == 1;
}

uint64_t __62__PHSOSViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) buttonPressed:*(void *)(a1 + 40)];
}

- (void)showSOSNumbersList
{
  v2.receiver = self;
  v2.super_class = (Class)PHSOSViewControllerAccessibility;
  [(PHSOSViewControllerAccessibility *)&v2 showSOSNumbersList];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)showSOSDialCountdown
{
  v3.receiver = self;
  v3.super_class = (Class)PHSOSViewControllerAccessibility;
  [(PHSOSViewControllerAccessibility *)&v3 showSOSDialCountdown];
  [(PHSOSViewControllerAccessibility *)self _axMoveToCancelButton];
}

- (void)showSOSDialCanceled
{
  v3.receiver = self;
  v3.super_class = (Class)PHSOSViewControllerAccessibility;
  [(PHSOSViewControllerAccessibility *)&v3 showSOSDialCanceled];
  [(PHSOSViewControllerAccessibility *)self _axSpeakInfo];
  [(PHSOSViewControllerAccessibility *)self _axMoveToCancelButton];
}

- (void)showSOSNotified
{
  v3.receiver = self;
  v3.super_class = (Class)PHSOSViewControllerAccessibility;
  [(PHSOSViewControllerAccessibility *)&v3 showSOSNotified];
  [(PHSOSViewControllerAccessibility *)self _axSpeakInfo];
  [(PHSOSViewControllerAccessibility *)self _axMoveToCancelButton];
}

- (void)showSOSNotificationCountdown
{
  v3.receiver = self;
  v3.super_class = (Class)PHSOSViewControllerAccessibility;
  [(PHSOSViewControllerAccessibility *)&v3 showSOSNotificationCountdown];
  [(PHSOSViewControllerAccessibility *)self _axMoveToCancelButton];
}

- (void)showSOSNotificationCanceled
{
  v3.receiver = self;
  v3.super_class = (Class)PHSOSViewControllerAccessibility;
  [(PHSOSViewControllerAccessibility *)&v3 showSOSNotificationCanceled];
  [(PHSOSViewControllerAccessibility *)self _axSpeakInfo];
}

- (void)presentMedicalID
{
  v2.receiver = self;
  v2.super_class = (Class)PHSOSViewControllerAccessibility;
  [(PHSOSViewControllerAccessibility *)&v2 presentMedicalID];
  UIAccessibilityPostNotification(0xBD6u, 0);
}

- (void)_axSpeakInfo
{
  objc_opt_class();
  objc_super v3 = [(PHSOSViewControllerAccessibility *)self safeValueForKey:@"infoLabel"];
  id v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 text];

  if (([v5 isEqualToString:_axSpeakInfo_PreviousText] & 1) == 0)
  {
    UIAccessibilitySpeakAndDoNotBeInterrupted();
    objc_storeStrong((id *)&_axSpeakInfo_PreviousText, v5);
  }
}

- (void)_axMoveToCancelButton
{
  id v2 = [(PHSOSViewControllerAccessibility *)self safeValueForKey:@"cancelButton"];
  UIAccessibilityPostNotification(*MEMORY[0x263F812F8], v2);
}

@end