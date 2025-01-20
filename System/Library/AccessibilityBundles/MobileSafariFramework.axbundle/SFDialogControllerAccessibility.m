@interface SFDialogControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (int64_t)_presentDialog:(id)a3 forWebProcessID:(int)a4 withAdditionalAnimations:(id)a5;
- (void)_dismissDialogWithAdditionalAnimations:(id)a3;
@end

@implementation SFDialogControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFDialogController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFDialogController", @"_presentDialog:forWebProcessID:withAdditionalAnimations:", "q", "@", "i", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFDialogController", @"_dismissDialogWithAdditionalAnimations:", "v", "@?", 0);
  [v3 validateClass:@"SFDialogController" hasInstanceVariable:@"_dialogView" withType:"SFDialogView"];
  [v3 validateClass:@"SFDialogView" hasInstanceVariable:@"_contentView" withType:"SFDialogContentView"];
  [v3 validateClass:@"SFDialogContentView" hasInstanceVariable:@"_messageTextView" withType:"SFDialogTextView"];
  [v3 validateClass:@"SFDialogTextView" hasInstanceVariable:@"_textView" withType:"UITextView"];
}

- (int64_t)_presentDialog:(id)a3 forWebProcessID:(int)a4 withAdditionalAnimations:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)SFDialogControllerAccessibility;
  id v6 = [(SFDialogControllerAccessibility *)&v14 _presentDialog:a3 forWebProcessID:*(void *)&a4 withAdditionalAnimations:a5];
  if (!v6)
  {
    v7 = [(SFDialogControllerAccessibility *)self safeValueForKey:@"_dialogView"];
    [v7 setAccessibilityViewIsModal:1];

    v8 = [(SFDialogControllerAccessibility *)self safeValueForKey:@"_dialogView"];
    v9 = [v8 safeValueForKey:@"_contentView"];
    v10 = [v9 safeValueForKey:@"_messageTextView"];
    v11 = [v10 safeValueForKey:@"_textView"];
    v12 = [v11 accessibilityValue];

    UIAccessibilityPostNotification(0x3EEu, v12);
  }
  return (int64_t)v6;
}

- (void)_dismissDialogWithAdditionalAnimations:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFDialogControllerAccessibility;
  [(SFDialogControllerAccessibility *)&v5 _dismissDialogWithAdditionalAnimations:a3];
  v4 = [(SFDialogControllerAccessibility *)self safeValueForKey:@"_dialogView"];
  [v4 setAccessibilityViewIsModal:0];

  AXPerformBlockOnMainThreadAfterDelay();
}

void __74__SFDialogControllerAccessibility__dismissDialogWithAdditionalAnimations___block_invoke()
{
}

@end