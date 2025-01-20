@interface CKMessageEntryContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityUsesScrollParentForOrdering;
- (CKMessageEntryContentViewAccessibility)initWithFrame:(CGRect)a3 shouldShowSubject:(BOOL)a4 shouldDisableAttachments:(BOOL)a5 shouldUseNonEmojiKeyboard:(BOOL)a6 shouldUseNonHandwritingKeyboard:(BOOL)a7 shouldDisableKeyboardStickers:(BOOL)a8;
- (void)_accessibilityClearPlugin;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setPluginEntryViewController:(id)a3;
@end

@implementation CKMessageEntryContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMessageEntryContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryContentView", @"initWithFrame:shouldShowSubject: shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "B", "B", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryContentView", @"subjectView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryContentView", @"textView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryContentView", @"clearPluginButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryContentView", @"clearPluginButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryContentView", @"shouldShowClearButton", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryContentView", @"pluginEntryViewController", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryContentViewAccessibility;
  [(CKMessageEntryContentViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKMessageEntryContentViewAccessibility *)self safeValueForKey:@"subjectView"];
  v4 = accessibilityLocalizedString(@"subject.view");
  [v3 setAccessibilityLabel:v4];

  v5 = [(CKMessageEntryContentViewAccessibility *)self safeValueForKey:@"clearPluginButton"];
  v6 = accessibilityLocalizedString(@"plugin.cancel.button");
  [v5 setAccessibilityLabel:v6];
}

- (CKMessageEntryContentViewAccessibility)initWithFrame:(CGRect)a3 shouldShowSubject:(BOOL)a4 shouldDisableAttachments:(BOOL)a5 shouldUseNonEmojiKeyboard:(BOOL)a6 shouldUseNonHandwritingKeyboard:(BOOL)a7 shouldDisableKeyboardStickers:(BOOL)a8
{
  v10.receiver = self;
  v10.super_class = (Class)CKMessageEntryContentViewAccessibility;
  v8 = -[CKMessageEntryContentViewAccessibility initWithFrame:shouldShowSubject:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:](&v10, sel_initWithFrame_shouldShowSubject_shouldDisableAttachments_shouldUseNonEmojiKeyboard_shouldUseNonHandwritingKeyboard_shouldDisableKeyboardStickers_, a4, a5, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CKMessageEntryContentViewAccessibility *)v8 _accessibilityLoadAccessibilityInformation];

  return v8;
}

- (void)setPluginEntryViewController:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKMessageEntryContentViewAccessibility;
  [(CKMessageEntryContentViewAccessibility *)&v6 setPluginEntryViewController:v4];
  if ([(CKMessageEntryContentViewAccessibility *)self safeBoolForKey:@"shouldShowClearButton"])
  {
    objc_opt_class();
    v5 = __UIAccessibilityCastAsSafeCategory();
    [v5 _axSetCloseActionProviderOnBubbleView:self];
  }
}

- (BOOL)_accessibilityUsesScrollParentForOrdering
{
  return 0;
}

- (void)_accessibilityClearPlugin
{
  AXPerformSafeBlock();
  id v3 = [(CKMessageEntryContentViewAccessibility *)self safeValueForKey:@"textView"];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v3);
}

uint64_t __67__CKMessageEntryContentViewAccessibility__accessibilityClearPlugin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearPluginButtonTapped:0];
}

@end