@interface AXSB_SBSystemNotesInteractionManager
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
@end

@implementation AXSB_SBSystemNotesInteractionManager

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
  v5 = [MEMORY[0x263F22968] server];
  int v6 = [v5 areSystemGesturesDisabledByAccessibility];

  if (v6)
  {
    v7 = AXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226EBC000, v7, OS_LOG_TYPE_INFO, "Quick Notes disabled by accessibility gestures", buf, 2u);
    }

    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)AXSB_SBSystemNotesInteractionManager;
    BOOL v8 = [(AXSB_SBSystemNotesInteractionManager *)&v10 gestureRecognizerShouldBegin:v4];
  }

  return v8;
}

@end