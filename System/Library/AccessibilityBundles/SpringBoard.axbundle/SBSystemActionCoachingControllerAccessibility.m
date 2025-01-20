@interface SBSystemActionCoachingControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)systemActionCoachingHUDViewController:(id)a3 didBeginTransitionToState:(int64_t)a4;
@end

@implementation SBSystemActionCoachingControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSystemActionCoachingController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)systemActionCoachingHUDViewController:(id)a3 didBeginTransitionToState:(int64_t)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBSystemActionCoachingControllerAccessibility;
  [(SBSystemActionCoachingControllerAccessibility *)&v15 systemActionCoachingHUDViewController:v6 didBeginTransitionToState:a4];
  objc_opt_class();
  v7 = [v6 safeValueForKey:@"_coachingLabel"];
  v8 = __UIAccessibilityCastAsClass();

  if ((unint64_t)(a4 - 1) <= 1 && v8)
  {
    v9 = [v8 text];
    if ([v9 length])
    {
      v10 = accessibilityLocalizedString(@"word.separator");
      uint64_t v11 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:v10];

      id v12 = objc_alloc(MEMORY[0x263F086A0]);
      uint64_t v16 = *MEMORY[0x263F216D8];
      v17[0] = *MEMORY[0x263F1CE40];
      v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
      v14 = (void *)[v12 initWithString:v11 attributes:v13];

      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v14);
      v9 = (void *)v11;
    }
  }
}

@end