@interface SKUIRoundedRectButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SKUIRoundedRectButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIRoundedRectButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [(SKUIRoundedRectButtonAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Skuiaccountbut.isa)];
  v4 = [v3 safeUIViewForKey:@"_accountCreditsLabel"];

  v9.receiver = self;
  v9.super_class = (Class)SKUIRoundedRectButtonAccessibility;
  v5 = [(SKUIRoundedRectButtonAccessibility *)&v9 accessibilityLabel];
  if ([v4 _accessibilityViewIsVisible])
  {
    v8 = [v4 accessibilityLabel];
    v6 = __UIAXStringForVariables();
  }
  else
  {
    v6 = __UIAXStringForVariables();
  }

  return v6;
}

@end