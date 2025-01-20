@interface MFComposeSubjectViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MFComposeSubjectViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setNotifyOptionSelected:(BOOL)a3;
@end

@implementation MFComposeSubjectViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFComposeSubjectView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeSubjectView", @"setNotifyOptionSelected:", "v", "B", 0);
  [v3 validateClass:@"MFComposeSubjectView" hasInstanceVariable:@"_notifyButton" withType:"MFConfirmationButton"];
  [v3 validateClass:@"MFComposeSubjectView" hasInstanceVariable:@"_textView" withType:"UITextView"];
  [v3 validateClass:@"MFComposeSubjectView" isKindOfClass:@"CNComposeHeaderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeHeaderView", @"labelView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)MFComposeSubjectViewAccessibility;
  [(MFComposeSubjectViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MFComposeSubjectViewAccessibility *)self safeValueForKey:@"_textView"];
  [v3 setAccessibilityIdentifier:@"subjectField"];

  v4 = [(MFComposeSubjectViewAccessibility *)self safeValueForKey:@"_notifyButton"];
  v5 = accessibilityLocalizedString(@"notifyme.label");
  [v4 setAccessibilityLabel:v5];

  v6 = [(MFComposeSubjectViewAccessibility *)self safeValueForKey:@"labelView"];
  [v6 setIsAccessibilityElement:0];
}

- (MFComposeSubjectViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFComposeSubjectViewAccessibility;
  id v3 = -[MFComposeSubjectViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MFComposeSubjectViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)setNotifyOptionSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFComposeSubjectViewAccessibility;
  -[MFComposeSubjectViewAccessibility setNotifyOptionSelected:](&v8, sel_setNotifyOptionSelected_);
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | *MEMORY[0x263F1CEE8];
  objc_super v7 = [(MFComposeSubjectViewAccessibility *)self safeValueForKey:@"_notifyButton"];
  [v7 setAccessibilityTraits:v6];
}

@end