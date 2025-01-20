@interface AXSB_SBAssistantControllerSafeCategory
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axSiriDismissalIsForAssistiveTouch;
- (id)_axSiriDismissalOptions;
- (void)_axCancelDismissSiriForAssistiveTouch;
- (void)_axDismissSiriForAssistiveTouch;
- (void)_axScheduleDismissSiriForAssistiveTouch;
- (void)_axSetSiriDismissalIsForAssistiveTouch:(BOOL)a3;
- (void)_axSetSiriDismissalOptions:(id)a3;
- (void)_dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 dismissalOptions:(id)a5 windowScene:(id)a6 completion:(id)a7;
@end

@implementation AXSB_SBAssistantControllerSafeCategory

+ (id)safeCategoryTargetClassName
{
  return @"SBAssistantController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_axCancelDismissSiriForAssistiveTouch
{
}

- (id)_axSiriDismissalOptions
{
  return objc_getAssociatedObject(self, &__AXSB_SBAssistantControllerSafeCategory___axSiriDismissalOptions);
}

- (void)_axSetSiriDismissalOptions:(id)a3
{
}

- (BOOL)_axSiriDismissalIsForAssistiveTouch
{
  return MEMORY[0x270F09620](self, &__AXSB_SBAssistantControllerSafeCategory___axSiriDismissalIsForAssistiveTouch);
}

- (void)_axSetSiriDismissalIsForAssistiveTouch:(BOOL)a3
{
}

- (void)_axDismissSiriForAssistiveTouch
{
  [(AXSB_SBAssistantControllerSafeCategory *)self _axCancelDismissSiriForAssistiveTouch];
  v2 = ASTLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226EBC000, v2, OS_LOG_TYPE_DEFAULT, "AssistiveTouch did not handle the up event. Now dismissing Siri.", buf, 2u);
  }

  AXPerformSafeBlock();
}

- (void)_axScheduleDismissSiriForAssistiveTouch
{
  [(AXSB_SBAssistantControllerSafeCategory *)self _axCancelDismissSiriForAssistiveTouch];
  [(AXSB_SBAssistantControllerSafeCategory *)self performSelector:sel__axDismissSiriForAssistiveTouch withObject:0 afterDelay:0.2];
}

- (void)_dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 dismissalOptions:(id)a5 windowScene:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([v13 safeIntegerForKey:@"dismissalReason"] == 23
    && _AXSAssistiveTouchEnabled()
    && ![(AXSB_SBAssistantControllerSafeCategory *)self _axSiriDismissalIsForAssistiveTouch])
  {
    v16 = ASTLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226EBC000, v16, OS_LOG_TYPE_DEFAULT, "Delaying Siri dismissal due to AssistiveTouch.", buf, 2u);
    }

    [(AXSB_SBAssistantControllerSafeCategory *)self _axSetSiriDismissalOptions:v13];
    [(AXSB_SBAssistantControllerSafeCategory *)self _axScheduleDismissSiriForAssistiveTouch];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)AXSB_SBAssistantControllerSafeCategory;
    [(AXSB_SBAssistantControllerSafeCategory *)&v17 _dismissAssistantViewIfNecessaryWithAnimation:a3 factory:v12 dismissalOptions:v13 windowScene:v14 completion:v15];
  }
}

@end