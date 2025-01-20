@interface MFComposeRecipientTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MFComposeRecipientTextViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_didRemoveRecipient:(id)a3;
- (void)_ensureAddButton;
- (void)_updateInactiveTextView;
- (void)didMoveToWindow;
@end

@implementation MFComposeRecipientTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFComposeRecipientTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MFComposeRecipientTextView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipientTextView", @"_updateInactiveTextView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipientTextView", @"_ensureAddButton", "v", 0);
  [v3 validateClass:@"MFComposeRecipientTextView" hasInstanceVariable:@"_inactiveTextView" withType:"UITextView"];
  [v3 validateClass:@"MFComposeRecipientTextView" hasInstanceVariable:@"_atomContainerView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipientTextView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipientTextView", @"_didRemoveRecipient:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"didMoveToWindow", "v", 0);
  [v3 validateClass:@"MFComposeRecipientTextView" hasInstanceVariable:@"_recipientsBeingRemoved" withType:"NSMutableArray"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)MFComposeRecipientTextViewAccessibility;
  [(MFComposeRecipientTextViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MFComposeRecipientTextViewAccessibility *)self safeValueForKey:@"_atomContainerView"];
  [v3 setAccessibilityIdentifier:@"RecipientAtomContainerView"];
}

- (MFComposeRecipientTextViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFComposeRecipientTextViewAccessibility;
  id v3 = -[MFComposeRecipientTextViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MFComposeRecipientTextViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MFComposeRecipientTextViewAccessibility;
  [(MFComposeRecipientTextViewAccessibility *)&v3 didMoveToWindow];
  [(MFComposeRecipientTextViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_updateInactiveTextView
{
  v4.receiver = self;
  v4.super_class = (Class)MFComposeRecipientTextViewAccessibility;
  [(MFComposeRecipientTextViewAccessibility *)&v4 _updateInactiveTextView];
  objc_super v3 = [(MFComposeRecipientTextViewAccessibility *)self safeValueForKey:@"_inactiveTextView"];
  [v3 setIsAccessibilityElement:0];
}

- (void)_ensureAddButton
{
  v3.receiver = self;
  v3.super_class = (Class)MFComposeRecipientTextViewAccessibility;
  [(MFComposeRecipientTextViewAccessibility *)&v3 _ensureAddButton];
  [(MFComposeRecipientTextViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_didRemoveRecipient:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MFComposeRecipientTextViewAccessibility *)self safeArrayForKey:@"_recipientsBeingRemoved"];
  if ([v5 indexOfObject:v4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    UIAccessibilityNotifications v6 = *MEMORY[0x263F1CDC8];
    v7 = NSString;
    v8 = accessibilityLocalizedString(@"remove.item.announce");
    v9 = [v4 safeValueForKey:@"displayString"];
    v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);
    UIAccessibilityPostNotification(v6, v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)MFComposeRecipientTextViewAccessibility;
  [(MFComposeRecipientTextViewAccessibility *)&v11 _didRemoveRecipient:v4];
}

@end