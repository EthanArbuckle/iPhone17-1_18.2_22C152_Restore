@interface GAXNCNotificationRequestOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)sb_shouldSuppressAlert;
@end

@implementation GAXNCNotificationRequestOverride

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationRequest";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)sb_shouldSuppressAlert
{
  v4 = +[GAXSpringboard sharedInstance];
  unsigned int v5 = [v4 isActive];

  if (v5)
  {
    v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      Name = sel_getName(a2);
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "GAX blocking notification request: returning true for %{public}s because GAX is active.", buf, 0xCu);
    }

    return 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GAXNCNotificationRequestOverride;
    return [(GAXNCNotificationRequestOverride *)&v8 sb_shouldSuppressAlert];
  }
}

@end