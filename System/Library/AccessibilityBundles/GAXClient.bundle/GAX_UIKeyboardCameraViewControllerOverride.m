@interface GAX_UIKeyboardCameraViewControllerOverride
+ (BOOL)isEnabled;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation GAX_UIKeyboardCameraViewControllerOverride

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardCameraViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

+ (BOOL)isEnabled
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___GAX_UIKeyboardCameraViewControllerOverride;
  unsigned int v2 = objc_msgSendSuper2(&v6, "isEnabled");
  if (v2)
  {
    v3 = +[GAXClient sharedInstance];
    unsigned __int8 v4 = [v3 isActive];

    LOBYTE(v2) = v4 ^ 1;
  }
  return v2;
}

@end