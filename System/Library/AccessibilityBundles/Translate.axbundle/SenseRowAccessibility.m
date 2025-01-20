@interface SenseRowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SenseRowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SequoiaTranslator.SenseRow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.SenseRow", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.SenseRow", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SequoiaTranslator.SenseRow", @"checkmark", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(SenseRowAccessibility *)self safeUIViewForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(SenseRowAccessibility *)self safeUIViewForKey:@"subtitleLabel"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v4 safeStringForKey:@"text"];
  v10 = [v6 safeStringForKey:@"text"];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (unint64_t)accessibilityTraits
{
  char v8 = 0;
  objc_opt_class();
  id v3 = [(SenseRowAccessibility *)self safeUIViewForKey:@"checkmark"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 _accessibilityViewIsVisible])
  {
    id v5 = (id)*MEMORY[0x263F1CF38];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SenseRowAccessibility;
    id v5 = [(SenseRowAccessibility *)&v7 accessibilityTraits];
  }

  return (unint64_t)v5;
}

@end