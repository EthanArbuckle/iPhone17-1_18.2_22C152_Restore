@interface PKPeerPaymentMessagesNumberPadViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_handleActionButton:(id)a3;
@end

@implementation PKPeerPaymentMessagesNumberPadViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPeerPaymentMessagesNumberPadView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentMessagesNumberPadView", @"actionHandler", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentMessagesNumberPadView", @"enabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPeerPaymentMessagesNumberPadView", @"_handleActionButton:", "v", "@", 0);
}

- (void)_handleActionButton:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentMessagesNumberPadViewAccessibility;
  [(PKPeerPaymentMessagesNumberPadViewAccessibility *)&v9 _handleActionButton:v4];
  v5 = [(PKPeerPaymentMessagesNumberPadViewAccessibility *)self safeValueForKey:@"actionHandler"];
  if (!v5
    || ![(PKPeerPaymentMessagesNumberPadViewAccessibility *)self safeBoolForKey:@"enabled"])
  {
    goto LABEL_5;
  }

  if (v4)
  {
    v6 = (void *)MEMORY[0x263F21660];
    v7 = [v4 accessibilityLabel];
    v5 = [v6 axAttributedStringWithString:v7];

    uint64_t v8 = *MEMORY[0x263EFFB40];
    [v5 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21768]];
    [v5 setAttribute:v8 forKey:*MEMORY[0x263F218E0]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
LABEL_5:
  }
}

@end