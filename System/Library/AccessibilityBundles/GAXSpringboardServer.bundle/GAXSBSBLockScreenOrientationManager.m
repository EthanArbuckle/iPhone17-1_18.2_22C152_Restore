@interface GAXSBSBLockScreenOrientationManager
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateInterfaceOrientationWithRequestedOrientation:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation GAXSBSBLockScreenOrientationManager

+ (id)safeCategoryTargetClassName
{
  return @"SBLockScreenOrientationManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)updateInterfaceOrientationWithRequestedOrientation:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = +[GAXSpringboard sharedInstance];
  if (([v7 isInactive] & 1) != 0 || objc_msgSend(v7, "allowsMotion"))
  {
    v8.receiver = self;
    v8.super_class = (Class)GAXSBSBLockScreenOrientationManager;
    [(GAXSBSBLockScreenOrientationManager *)&v8 updateInterfaceOrientationWithRequestedOrientation:a3 animated:v4];
  }
}

@end