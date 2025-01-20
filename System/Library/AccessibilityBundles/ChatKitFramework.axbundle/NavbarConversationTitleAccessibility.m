@interface NavbarConversationTitleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation NavbarConversationTitleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ChatKit.NavbarConversationTitle";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ChatKit.NavbarConversationTitle" hasSwiftField:@"titleLabel" withSwiftType:"CKLabel"];
  [v3 validateClass:@"ChatKit.NavbarConversationTitle" hasSwiftField:@"title" withSwiftType:"String"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)NavbarConversationTitleAccessibility;
  [(NavbarConversationTitleAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NavbarConversationTitleAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  [v3 setIsAccessibilityElement:0];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(NavbarConversationTitleAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 titleIconImageType];
  if (v5 == 1)
  {
    v6 = accessibilityLocalizedString(@"conversation.verified");
  }
  else
  {
    v6 = 0;
  }
  v7 = [(NavbarConversationTitleAccessibility *)self safeSwiftStringForKey:@"title"];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (id)accessibilityHint
{
  id v3 = [(NavbarConversationTitleAccessibility *)self accessibilityUserDefinedHint];

  if (v3) {
    [(NavbarConversationTitleAccessibility *)self accessibilityUserDefinedHint];
  }
  else {
  objc_super v4 = accessibilityLocalizedString(@"multi.person.header.hint");
  }

  return v4;
}

@end