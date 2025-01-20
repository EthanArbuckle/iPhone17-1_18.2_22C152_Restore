@interface GAXSBSystemNotesInteractionManagerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
@end

@implementation GAXSBSystemNotesInteractionManagerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBSystemNotesInteractionManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = +[GAXSpringboard sharedInstance];
  if (([v5 isActive] & 1) != 0 || objc_msgSend(v5, "isInWorkspace"))
  {
    v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Guided Access not allowing Quick Notes.", buf, 2u);
    }

    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GAXSBSystemNotesInteractionManagerOverride;
    BOOL v7 = [(GAXSBSystemNotesInteractionManagerOverride *)&v9 gestureRecognizerShouldBegin:v4];
  }

  return v7;
}

@end