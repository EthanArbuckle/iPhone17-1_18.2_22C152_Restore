@interface WindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityViewIsModal;
@end

@implementation WindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Music.Window";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Music.MainSceneDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.MainSceneDelegate", @"window", "@", 0);
}

- (BOOL)accessibilityViewIsModal
{
  v8.receiver = self;
  v8.super_class = (Class)WindowAccessibility;
  if (![(WindowAccessibility *)&v8 accessibilityViewIsModal]) {
    return 0;
  }
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 windowScene];
  v4 = [v3 delegate];

  MEMORY[0x245658030](@"Music.MainSceneDelegate");
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 safeValueForKey:@"window"];
    BOOL v6 = v5 != v2;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

@end