@interface FBApplicationProcessAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityWasJustLaunched;
- (void)_accessibilitySetWasJustLaunched:(BOOL)a3;
- (void)_bootstrapAndExec;
- (void)_setSceneLifecycleState:(unsigned __int8)a3;
@end

@implementation FBApplicationProcessAccessibility

- (void)_bootstrapAndExec
{
  v3.receiver = self;
  v3.super_class = (Class)FBApplicationProcessAccessibility;
  [(FBApplicationProcessAccessibility *)&v3 _bootstrapAndExec];
  [(FBApplicationProcessAccessibility *)self _accessibilitySetWasJustLaunched:1];
}

- (void)_setSceneLifecycleState:(unsigned __int8)a3
{
  int v3 = a3;
  v16[3] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)FBApplicationProcessAccessibility;
  -[FBApplicationProcessAccessibility _setSceneLifecycleState:](&v14, sel__setSceneLifecycleState_);
  if (v3 == 2)
  {
    if (_AXSApplicationAccessibilityEnabled()
      && [(FBApplicationProcessAccessibility *)self _accessibilityWasJustLaunched])
    {
      v5 = self;
      if (UIAccessibilityIsVoiceOverRunning())
      {
        v6 = [(FBApplicationProcessAccessibility *)v5 bundleIdentifier];
        AXApplicationNameLabelForBundleIdentifier();
      }
      else
      {
        v6 = [(FBApplicationProcessAccessibility *)v5 handle];
        [v6 name];
      v7 = };

      uint64_t v8 = [(FBApplicationProcessAccessibility *)v5 pid];
      if (v7)
      {
        uint64_t v9 = v8;
        v10 = [(FBApplicationProcessAccessibility *)v5 bundleIdentifier];

        if (v10)
        {
          v15[0] = @"bundleID";
          v11 = [(FBApplicationProcessAccessibility *)v5 bundleIdentifier];
          v16[0] = v11;
          v16[1] = v7;
          v15[1] = @"displayName";
          v15[2] = @"pid";
          v12 = [NSNumber numberWithInt:v9];
          v16[2] = v12;
          v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
          UIAccessibilityPostNotification(0x1388u, v13);
        }
      }
    }
    [(FBApplicationProcessAccessibility *)self _accessibilitySetWasJustLaunched:0];
  }
}

- (void)_accessibilitySetWasJustLaunched:(BOOL)a3
{
}

+ (id)safeCategoryTargetClassName
{
  return @"FBApplicationProcess";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWasJustLaunched
{
  return MEMORY[0x270F09620](self, &__FBApplicationProcessAccessibility___accessibilityWasJustLaunched);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FBProcess", @"_bootstrapAndExec", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FBProcess", @"_setSceneLifecycleState:", "v", "C", 0);
}

@end