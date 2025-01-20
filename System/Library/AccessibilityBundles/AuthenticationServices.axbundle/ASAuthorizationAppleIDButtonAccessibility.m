@interface ASAuthorizationAppleIDButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityPath;
@end

@implementation ASAuthorizationAppleIDButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASAuthorizationAppleIDButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityPath
{
  [(ASAuthorizationAppleIDButtonAccessibility *)self safeCGFloatForKey:@"cornerRadius"];
  v3 = (void *)MEMORY[0x263F1C478];
  [(ASAuthorizationAppleIDButtonAccessibility *)self bounds];
  v4 = objc_msgSend(v3, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1);
  v5 = UIAccessibilityConvertPathFunction();

  return v5;
}

@end