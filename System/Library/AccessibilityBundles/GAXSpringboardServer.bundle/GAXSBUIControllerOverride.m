@interface GAXSBUIControllerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_activateApplicationFromAccessibility:(id)a3;
@end

@implementation GAXSBUIControllerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBUIController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_activateApplicationFromAccessibility:(id)a3
{
  id v4 = a3;
  v5 = +[GAXSpringboard sharedInstanceIfExists];
  unsigned int v6 = [v5 isActive];

  if (v6)
  {
    v7 = GAXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Blocking activation of application: %@", buf, 0xCu);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GAXSBUIControllerOverride;
    [(GAXSBUIControllerOverride *)&v8 _activateApplicationFromAccessibility:v4];
  }
}

@end