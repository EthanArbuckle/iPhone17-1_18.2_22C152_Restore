@interface OBPrivacyLinkButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation OBPrivacyLinkButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBPrivacyLinkButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"OBPrivacyLinkButton" isKindOfClass:@"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBPrivacyLinkButton", @"textView", "@", 0);
  [v3 validateClass:@"OBPrivacyLinkButton" hasInstanceVariable:@"_iconView" withType:"UIImageView"];
}

- (BOOL)accessibilityActivate
{
  char v8 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = v3;
  if (v3)
  {
    [v3 sendActionsForControlEvents:0x2000];
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)OBPrivacyLinkButtonAccessibility;
    BOOL v5 = [(OBPrivacyLinkButtonAccessibility *)&v7 accessibilityActivate];
  }

  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)OBPrivacyLinkButtonAccessibility;
  [(OBPrivacyLinkButtonAccessibility *)&v3 layoutSubviews];
  [(OBPrivacyLinkButtonAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)OBPrivacyLinkButtonAccessibility;
  [(OBPrivacyLinkButtonAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(OBPrivacyLinkButtonAccessibility *)self safeUIViewForKey:@"_iconView"];
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  BOOL v5 = [v4 image];

  if (v5)
  {
    v6 = accessibilityLocalizedString(@"privacy.icon");
    [v4 setAccessibilityLabel:v6];

    [v4 setIsAccessibilityElement:1];
    [v4 setAccessibilityTraits:*MEMORY[0x263F21A90]];
  }
}

- (id)automationElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  objc_super v3 = [(OBPrivacyLinkButtonAccessibility *)self safeUIViewForKey:@"_iconView"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (id)accessibilityElements
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_super v3 = [(OBPrivacyLinkButtonAccessibility *)self safeUIViewForKey:@"textView"];
  v4 = [v3 accessibilityValue];

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBPrivacyLinkButtonAccessibility;
    id v5 = [(OBPrivacyLinkButtonAccessibility *)&v8 accessibilityLabel];
  }
  v6 = v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)_accessibilitySupplementaryFooterViews
{
  objc_super v3 = (void *)MEMORY[0x263EFF980];
  v8.receiver = self;
  v8.super_class = (Class)OBPrivacyLinkButtonAccessibility;
  v4 = [(OBPrivacyLinkButtonAccessibility *)&v8 _accessibilitySupplementaryFooterViews];
  id v5 = [v3 arrayWithArray:v4];

  v6 = [(OBPrivacyLinkButtonAccessibility *)self safeUIViewForKey:@"iconView"];
  if (v6) {
    [v5 axSafelyAddObject:v6];
  }

  return v5;
}

@end