@interface GAXFBSSystemServiceOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canOpenApplication:(id)a3 reason:(int64_t *)a4;
@end

@implementation GAXFBSSystemServiceOverride

+ (id)safeCategoryTargetClassName
{
  return @"FBSSystemService";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)canOpenApplication:(id)a3 reason:(int64_t *)a4
{
  id v6 = a3;
  v7 = +[GAXSpringboard sharedInstance];
  if ([v7 isActive])
  {
    v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Guided Access returning NO for workspace can open application: %{public}@", buf, 0xCu);
    }

    BOOL v9 = 0;
    if (a4) {
      *a4 = 1;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)GAXFBSSystemServiceOverride;
    BOOL v9 = [(GAXFBSSystemServiceOverride *)&v11 canOpenApplication:v6 reason:a4];
  }

  return v9;
}

@end