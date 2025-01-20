@interface GAXSBCommandTabControllerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)activateWithKeyCommand:(id)a3;
@end

@implementation GAXSBCommandTabControllerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBCommandTabController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)activateWithKeyCommand:(id)a3
{
  id v4 = a3;
  v5 = +[GAXSpringboard sharedInstance];
  unsigned __int8 v6 = [v5 isActive];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)GAXSBCommandTabControllerOverride;
    [(GAXSBCommandTabControllerOverride *)&v7 activateWithKeyCommand:v4];
  }
}

@end