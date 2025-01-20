@interface PKIdentityHeroViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKIdentityHeroViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKIdentityHeroViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKIdentityHeroViewControllerAccessibility;
  [(PKIdentityHeroViewControllerAccessibility *)&v3 viewWillAppear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end