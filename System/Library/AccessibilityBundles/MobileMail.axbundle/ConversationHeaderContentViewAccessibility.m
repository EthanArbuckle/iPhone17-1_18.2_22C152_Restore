@interface ConversationHeaderContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_createPrimaryViews;
- (void)setText:(id)a3;
@end

@implementation ConversationHeaderContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationHeaderContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationHeaderContentView", @"_createPrimaryViews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationHeaderContentView", @"textLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationHeaderContentView", @"setText:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)ConversationHeaderContentViewAccessibility;
  [(ConversationHeaderContentViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(ConversationHeaderContentViewAccessibility *)self safeValueForKey:@"textLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 text];

  v6 = accessibilityLocalizedString(@"subject");
  if (v5)
  {
    v7 = [v4 text];
    v8 = __AXStringForVariables();
    objc_msgSend(v4, "setAccessibilityLabel:", v8, v7, @"__AXStringForVariablesSentinel");
  }
  else
  {
    [v4 setAccessibilityLabel:v6];
  }
}

- (void)_createPrimaryViews
{
  v3.receiver = self;
  v3.super_class = (Class)ConversationHeaderContentViewAccessibility;
  [(ConversationHeaderContentViewAccessibility *)&v3 _createPrimaryViews];
  [(ConversationHeaderContentViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ConversationHeaderContentViewAccessibility;
  [(ConversationHeaderContentViewAccessibility *)&v4 setText:a3];
  [(ConversationHeaderContentViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end