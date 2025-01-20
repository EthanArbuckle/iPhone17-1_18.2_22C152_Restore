@interface FIUIPushyLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation FIUIPushyLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FIUIPushyLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"FIUIPushyLabelView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FIUIPushyLabelView", @"currentAttributedText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FIUIPushyLabelView", @"pushToAttributedText: direction: perCharacter:", "v", "@", "Q", "B", 0);
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(FIUIPushyLabelViewAccessibility *)self safeValueForKey:@"currentAttributedText"];
  if (v3)
  {
    v4 = (void *)v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 string];

      v4 = (void *)v5;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)FIUIPushyLabelViewAccessibility;
    v4 = [(FIUIPushyLabelViewAccessibility *)&v7 accessibilityLabel];
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  char v9 = 0;
  objc_opt_class();
  uint64_t v3 = __UIAccessibilityCastAsClass();
  if ([v3 _accessibilityViewIsVisible])
  {
    v4 = [(FIUIPushyLabelViewAccessibility *)self safeValueForKey:@"currentAttributedText"];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  v6 = [(FIUIPushyLabelViewAccessibility *)self isAccessibilityUserDefinedElement];

  if (v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)FIUIPushyLabelViewAccessibility;
    return [(FIUIPushyLabelViewAccessibility *)&v8 isAccessibilityElement] && v5;
  }
  return v5;
}

@end