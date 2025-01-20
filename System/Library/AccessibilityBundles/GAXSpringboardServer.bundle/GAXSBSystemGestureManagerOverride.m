@interface GAXSBSystemGestureManagerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isGestureWithTypeAllowed:(unint64_t)a3;
@end

@implementation GAXSBSystemGestureManagerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBSystemGestureManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_isGestureWithTypeAllowed:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)GAXSBSystemGestureManagerOverride;
  if (-[GAXSBSystemGestureManagerOverride _isGestureWithTypeAllowed:](&v13, "_isGestureWithTypeAllowed:")) {
    return 1;
  }
  v5 = +[GAXSpringboard sharedInstance];
  unsigned int v6 = [v5 isOnlyGuidedAccessDisablingSystemGestures];

  if (v6)
  {
    if (a3 - 13 < 4 || a3 == 11)
    {
      v11 = +[AXSettings sharedInstance];
      unsigned int v12 = [v11 guidedAccessAllowsMultipleWindows];

      if (v12)
      {
        v7 = GAXLogCommon();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v15 = a3;
          v8 = "Allowing Medusa gesture: %lu";
          v9 = v7;
          uint32_t v10 = 12;
          goto LABEL_13;
        }
LABEL_14:

        return 1;
      }
    }
    else if (a3 == 2 && (AXDeviceHasHomeButton() & 1) == 0)
    {
      v7 = GAXLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "Allowing dismiss cover sheet for this device class.";
        v9 = v7;
        uint32_t v10 = 2;
LABEL_13:
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  return 0;
}

@end