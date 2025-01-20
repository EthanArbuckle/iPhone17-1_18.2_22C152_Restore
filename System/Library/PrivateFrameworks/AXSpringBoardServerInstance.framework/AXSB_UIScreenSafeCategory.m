@interface AXSB_UIScreenSafeCategory
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_preferredFocusedWindow;
@end

@implementation AXSB_UIScreenSafeCategory

+ (id)safeCategoryTargetClassName
{
  return @"UIScreen";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_preferredFocusedWindow
{
  if (AXProcessIsSpringBoard()
    && _UIAccessibilityFullKeyboardAccessEnabled()
    && ([(AXSB_UIScreenSafeCategory *)self _isCarScreen] & 1) == 0)
  {
    v5 = +[AXSpringBoardServerHelper sharedServerHelper];
    v6 = [v5 presentationWindow];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)AXSB_UIScreenSafeCategory;
      id v8 = [(AXSB_UIScreenSafeCategory *)&v10 _preferredFocusedWindow];
    }
    v3 = v8;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AXSB_UIScreenSafeCategory;
    v3 = [(AXSB_UIScreenSafeCategory *)&v9 _preferredFocusedWindow];
  }
  return v3;
}

@end