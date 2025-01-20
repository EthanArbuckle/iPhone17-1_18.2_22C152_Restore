@interface GAXSBSyncControllerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)beginRestoring;
- (void)resetService:(id)a3 willBeginDataResetWithMode:(int64_t)a4;
@end

@implementation GAXSBSyncControllerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBSyncController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSyncController", @"resetService:willBeginDataResetWithMode:", "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSyncController", @"beginRestoring", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSyncController", @"isInUse", "B", 0);
}

- (void)beginRestoring
{
  id v3 = +[GAXSpringboard sharedInstance];
  if (([v3 isInactive] & 1) != 0
    || [v3 profileConfiguration] != 1)
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXSBSyncControllerOverride;
    [(GAXSBSyncControllerOverride *)&v6 beginRestoring];
  }
  else
  {
    v4 = GAXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Guided Access not allowing restore to begin", v5, 2u);
    }
  }
}

- (void)resetService:(id)a3 willBeginDataResetWithMode:(int64_t)a4
{
  id v6 = a3;
  v7 = +[GAXSpringboard sharedInstance];
  if (([v7 isInactive] & 1) != 0
    || [v7 profileConfiguration] != 1)
  {
    v10.receiver = self;
    v10.super_class = (Class)GAXSBSyncControllerOverride;
    [(GAXSBSyncControllerOverride *)&v10 resetService:v6 willBeginDataResetWithMode:a4];
  }
  else
  {
    v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Guided Access not allowing reset to begin", v9, 2u);
    }
  }
}

@end