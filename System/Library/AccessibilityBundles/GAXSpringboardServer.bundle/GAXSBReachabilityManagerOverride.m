@interface GAXSBReachabilityManagerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateReachabilityModeActive:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation GAXSBReachabilityManagerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBReachabilityManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_updateReachabilityModeActive:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = +[GAXSpringboard sharedInstance];
  v8 = v7;
  if (v5
    && [v7 isActive]
    && ([v8 wantsSingleAppModeOrAppSelfLockMode] & 1) == 0)
  {
    v9 = GAXLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Guided Access active. Not allowing Easy Reach", buf, 2u);
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GAXSBReachabilityManagerOverride;
    [(GAXSBReachabilityManagerOverride *)&v10 _updateReachabilityModeActive:v5 animated:v4];
  }
}

@end