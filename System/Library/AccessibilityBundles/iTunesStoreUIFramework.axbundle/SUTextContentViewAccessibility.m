@interface SUTextContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityPlaceholderValue:(BOOL)a3;
- (id)accessibilityPlaceholderValue;
- (id)accessibilityValue;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation SUTextContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUTextContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUTextContentView", @"layoutSubviews", "v", 0);
  [v3 validateClass:@"SUTextContentView" hasInstanceVariable:@"_placeholderLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUTextContentView", @"placeholder", "@", 0);
}

- (id)_accessibilityPlaceholderValue:(BOOL)a3
{
  objc_opt_class();
  v5 = [(SUTextContentViewAccessibility *)self safeValueForKey:@"_placeholderLabel"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 superview];
  if (v7)
  {
    if (([v6 isHidden] & 1) == 0)
    {
      [v6 alpha];
      if (v8 > 0.01)
      {

LABEL_6:
        v9 = [v6 accessibilityLabel];
        v10 = [MEMORY[0x263F21660] axAttributedStringWithString:v9];

        [v10 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21820]];
        goto LABEL_8;
      }
    }
  }

  if (a3) {
    goto LABEL_6;
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (id)accessibilityPlaceholderValue
{
  return [(SUTextContentViewAccessibility *)self _accessibilityPlaceholderValue:1];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SUTextContentViewAccessibility;
  [(SUTextContentViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SUTextContentViewAccessibility *)self safeValueForKey:@"_placeholderLabel"];
  [v3 setIsAccessibilityElement:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SUTextContentViewAccessibility;
  [(SUTextContentViewAccessibility *)&v3 layoutSubviews];
  [(SUTextContentViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)accessibilityValue
{
  [(SUTextContentViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  v7.receiver = self;
  v7.super_class = (Class)SUTextContentViewAccessibility;
  objc_super v3 = [(SUTextContentViewAccessibility *)&v7 accessibilityValue];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [(SUTextContentViewAccessibility *)self _accessibilityPlaceholderValue:0];
  }
  v5 = v4;

  return v5;
}

@end