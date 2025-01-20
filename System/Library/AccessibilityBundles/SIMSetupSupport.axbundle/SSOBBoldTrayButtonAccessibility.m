@interface SSOBBoldTrayButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SSOBBoldTrayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SSOBBoldTrayButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SSOBBoldTrayButton" isKindOfClass:@"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SSOBBoldTrayButton", @"normalStateTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SSOBBoldTrayButton", @"spinner", "@", 0);
  [v3 validateClass:@"SSSpinner" hasInstanceVariable:@"_label" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  if ([v3 isEnabled])
  {
    v4 = [(SSOBBoldTrayButtonAccessibility *)self safeStringForKey:@"normalStateTitle"];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
      v5 = v6;
    }
    else
    {
      id v6 = [v3 titleForState:0];
    }
    v9 = v6;
  }
  else
  {
    v5 = [(SSOBBoldTrayButtonAccessibility *)self safeUIViewForKey:@"spinner"];
    objc_opt_class();
    v7 = [v5 safeUIViewForKey:@"_label"];
    v8 = __UIAccessibilityCastAsClass();

    v9 = [v8 accessibilityLabel];
  }

  return v9;
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)SSOBBoldTrayButtonAccessibility;
  id v2 = [(SSOBBoldTrayButtonAccessibility *)&v5 accessibilityTraits];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  if (![v3 isEnabled]) {
    id v2 = (id)*MEMORY[0x263F1CF18];
  }

  return (unint64_t)v2;
}

@end