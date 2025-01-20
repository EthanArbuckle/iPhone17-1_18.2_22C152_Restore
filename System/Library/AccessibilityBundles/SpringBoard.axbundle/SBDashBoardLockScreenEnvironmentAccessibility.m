@interface SBDashBoardLockScreenEnvironmentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5;
@end

@implementation SBDashBoardLockScreenEnvironmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBDashBoardLockScreenEnvironment";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBLockScreenManager"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"_shouldPlayLockSound", "B", 0);
  [v3 validateClass:@"SBDashBoardLockScreenEnvironment" conformsToProtocol:@"SBLockScreenBacklightControlling"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDashBoardLockScreenEnvironment", @"setInScreenOffMode:forAutoUnlock:fromUnlockSource:", "v", "B", "B", "i", 0);
}

- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  v25[2] = *MEMORY[0x263EF8340];
  v9 = +[AXSpringBoardGlue sharedInstance];
  uint64_t v10 = [v9 isUILocked];

  v21.receiver = self;
  v21.super_class = (Class)SBDashBoardLockScreenEnvironmentAccessibility;
  [(SBDashBoardLockScreenEnvironmentAccessibility *)&v21 setInScreenOffMode:v7 forAutoUnlock:v6 fromUnlockSource:v5];
  if (v7)
  {
    v11 = +[AXSpringBoardGlue sharedInstance];
    int v12 = [v11 lastLockSource];

    if (AXSpringBoardScreenCurtainIsBeingEnabled()) {
      return;
    }
    if (v12 == 15) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v10;
    }
    UIAccessibilityNotifications v14 = *MEMORY[0x263F81310];
    v24[0] = @"isUserLocked";
    v15 = [NSNumber numberWithBool:v13];
    v24[1] = @"playLockSound";
    v25[0] = v15;
    v16 = NSNumber;
    v17 = [NSClassFromString(&cfstr_Sblockscreenma.isa) safeValueForKey:@"sharedInstance"];
    v18 = objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "safeBoolForKey:", @"_shouldPlayLockSound"));
    v25[1] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    UIAccessibilityPostNotification(v14, v19);
  }
  else
  {
    if (AXSpringBoardScreenCurtainIsBeingEnabled()) {
      return;
    }
    UIAccessibilityNotifications v20 = *MEMORY[0x263F81318];
    v22 = @"isUserLocked";
    v15 = [NSNumber numberWithBool:v10];
    v23 = v15;
    v17 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    UIAccessibilityPostNotification(v20, v17);
  }
}

@end