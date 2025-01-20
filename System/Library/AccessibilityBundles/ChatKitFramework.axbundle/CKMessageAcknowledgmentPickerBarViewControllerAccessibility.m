@interface CKMessageAcknowledgmentPickerBarViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CKMessageAcknowledgmentPickerBarViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMessageAcknowledgmentPickerBarViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKMessageAcknowledgmentPickerBarViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKFullScreenBalloonViewController", @"delegate", "@", 0);
  [v3 validateProtocol:@"CKPickerBarView" hasRequiredInstanceMethod:@"acknowledgmentViews"];
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [(CKMessageAcknowledgmentPickerBarViewControllerAccessibility *)self safeValueForKey:@"parentViewController"];
  NSClassFromString(&cfstr_Ckfullscreenba_3.isa);
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 accessibilityPerformEscape];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKMessageAcknowledgmentPickerBarViewControllerAccessibility;
  [(CKMessageAcknowledgmentPickerBarViewControllerAccessibility *)&v8 viewDidAppear:a3];
  v4 = [(CKMessageAcknowledgmentPickerBarViewControllerAccessibility *)self safeValueForKey:@"view"];
  objc_opt_class();
  v5 = [v4 safeValueForKey:@"acknowledgmentViews"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 firstObject];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v7);
}

@end