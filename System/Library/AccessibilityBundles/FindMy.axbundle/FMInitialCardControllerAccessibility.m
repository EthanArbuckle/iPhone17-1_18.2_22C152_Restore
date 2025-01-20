@interface FMInitialCardControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)presentCard:(id)a3 completion:(id)a4;
@end

@implementation FMInitialCardControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FindMy.FMInitialCardController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)presentCard:(id)a3 completion:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)FMInitialCardControllerAccessibility;
  id v5 = a3;
  [(FMInitialCardControllerAccessibility *)&v6 presentCard:v5 completion:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v5);
}

@end