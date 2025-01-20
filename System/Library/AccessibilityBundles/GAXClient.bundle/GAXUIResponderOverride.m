@interface GAXUIResponderOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_canBecomeFirstResponder;
@end

@implementation GAXUIResponderOverride

+ (id)safeCategoryTargetClassName
{
  return @"UIResponder";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_canBecomeFirstResponder
{
  v3 = +[GAXClient sharedInstance];
  if ([v3 isActive] && !objc_msgSend(v3, "allowsKeyboardTextInput")
    || [v3 providesViewServices]
    && ([v3 shouldShowKeyboardsInViewServices] & 1) == 0)
  {
    v5 = GAXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Guided Access blocking canBecomeFirstResponder:", buf, 2u);
    }

    BOOL v4 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)GAXUIResponderOverride;
    BOOL v4 = [(GAXUIResponderOverride *)&v7 _canBecomeFirstResponder];
  }

  return v4;
}

@end