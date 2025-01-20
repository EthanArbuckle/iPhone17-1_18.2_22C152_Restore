@interface MFComposeRecipientViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MFComposeRecipientViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_reflowAnimated:(BOOL)a3;
- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5;
- (void)removeRecipient:(id)a3;
@end

@implementation MFComposeRecipientViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFComposeRecipientView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipientView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (MFComposeRecipientViewAccessibility)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFComposeRecipientViewAccessibility;
  return -[MFComposeRecipientViewAccessibility initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5
{
  v5.receiver = self;
  v5.super_class = (Class)MFComposeRecipientViewAccessibility;
  [(MFComposeRecipientViewAccessibility *)&v5 addRecipient:a3 index:a4 animate:a5];
}

- (void)_reflowAnimated:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFComposeRecipientViewAccessibility;
  [(MFComposeRecipientViewAccessibility *)&v6 _reflowAnimated:a3];
  objc_super v4 = [(MFComposeRecipientViewAccessibility *)self safeValueForKey:@"addButton"];
  objc_super v5 = accessibilityLocalizedString(@"add.contact.button");
  [v4 setAccessibilityLabel:v5];
}

- (void)removeRecipient:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MFComposeRecipientViewAccessibility;
  id v3 = a3;
  [(MFComposeRecipientViewAccessibility *)&v9 removeRecipient:v3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
  objc_super v5 = NSString;
  objc_super v6 = accessibilityLocalizedString(@"remove.item.announce");
  v7 = [v3 safeValueForKey:@"displayString"];

  v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  UIAccessibilityPostNotification(v4, v8);
}

@end