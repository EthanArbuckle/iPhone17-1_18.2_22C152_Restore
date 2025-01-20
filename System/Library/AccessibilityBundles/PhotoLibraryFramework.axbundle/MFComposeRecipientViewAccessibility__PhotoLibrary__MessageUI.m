@interface MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setLabel:(id)a3;
@end

@implementation MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI

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
  id v3 = a3;
  [v3 validateClass:@"MFComposeRecipientView" hasInstanceVariable:@"_labelView" withType:"MFHeaderLabelView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeHeaderView", @"label", "@", 0);
  [v3 validateClass:@"MFComposeRecipientView" hasInstanceVariable:@"_textField" withType:"_MFMailRecipientTextField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipientView", @"setLabel:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI;
  [(MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI *)self safeValueForKey:@"_textField"];
  v4 = [(MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI *)self safeValueForKey:@"label"];
  [v3 setAccessibilityLabel:v4];

  v5 = [(MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI *)self safeValueForKey:@"_labelView"];
  [v5 setIsAccessibilityElement:0];
}

- (MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI;
  id v3 = -[MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)setLabel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI;
  [(MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI *)&v4 setLabel:a3];
  [(MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI *)self _accessibilityLoadAccessibilityInformation];
}

@end