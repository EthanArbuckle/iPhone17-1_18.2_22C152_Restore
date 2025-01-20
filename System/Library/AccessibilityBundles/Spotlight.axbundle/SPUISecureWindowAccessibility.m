@interface SPUISecureWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
@end

@implementation SPUISecureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SPUISecureWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityElementsHidden
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 windowScene];

  if (v3) {
    BOOL v4 = [v3 activationState] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

@end