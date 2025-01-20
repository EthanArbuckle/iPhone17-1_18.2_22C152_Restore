@interface OBTrayButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (void)setEnabled:(BOOL)a3;
@end

@implementation OBTrayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBTrayButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"OBTrayButton" isKindOfClass:@"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIControl", @"isEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIControl", @"setEnabled:", "v", "B", 0);
}

- (id)accessibilityLabel
{
  v9.receiver = self;
  v9.super_class = (Class)OBTrayButtonAccessibility;
  v2 = [(OBTrayButtonAccessibility *)&v9 accessibilityLabel];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 configuration];
  int v5 = [v4 showsActivityIndicator];

  if (v5)
  {
    v8 = accessibilityLocalizedString(@"in.progress");
    __UIAXStringForVariables();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v2;
  }

  return v6;
}

- (void)setEnabled:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)OBTrayButtonAccessibility;
  [(OBTrayButtonAccessibility *)&v3 setEnabled:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end