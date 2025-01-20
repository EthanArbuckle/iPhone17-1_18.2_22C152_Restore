@interface GAXSpringBoardOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_gaxShouldAllowOpeningURL:(id)a3;
- (BOOL)allowCaseLatchLockAndUnlock;
- (BOOL)handleDoubleHeightStatusBarTapWithStyleOverride:(unint64_t)a3;
- (BOOL)handleEvent:(__GSEvent *)a3 withNewEvent:(id)a4;
- (BOOL)handleStatusBarHoverActionForRegion:(int64_t)a3;
- (void)_handleGotoHomeScreenShortcut:(id)a3;
- (void)_toggleSearch;
- (void)applicationOpenURL:(id)a3 withApplication:(id)a4 animating:(BOOL)a5 activationSettings:(id)a6 origin:(id)a7 notifyLSOnFailure:(BOOL)a8 withResult:(id)a9;
- (void)batteryStatusDidChange:(id)a3;
@end

@implementation GAXSpringBoardOverride

+ (id)safeCategoryTargetClassName
{
  return @"SpringBoard";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"batteryStatusDidChange:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_accessibilityIsSystemGestureActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_accessibilitySetSystemGesturesDisabledByAccessibility:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_accessibilitySystemGesturesDisabledByAccessibility", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"applicationOpenURL:withApplication:animating:activationSettings:origin:notifyLSOnFailure:withResult:", "v", "@", "@", "B", "@", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_toggleSearch", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindow", @"_toWindowOrientation", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_handleGotoHomeScreenShortcut:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"allowCaseLatchLockAndUnlock", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"handleDoubleHeightStatusBarTapWithStyleOverride:", "B", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"handleStatusBarHoverActionForRegion:", "B", "q", 0);
}

- (void)_toggleSearch
{
  id v3 = +[GAXSpringboard sharedInstance];
  unsigned __int8 v4 = [v3 isActive];

  if ((v4 & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)GAXSpringBoardOverride;
    [(GAXSpringBoardOverride *)&v5 _toggleSearch];
  }
}

- (BOOL)_gaxShouldAllowOpeningURL:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[GAXSpringboard sharedInstance];
  if (![v4 isActive]
    || GAXURLSchemeIsPhoneRelated(v3)
    && ([v4 frontmostAppIdentifier],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = GAXAppIsMobilePhoneOrFacetime(v5),
        v5,
        (v6 & 1) != 0))
  {
    BOOL v7 = 1;
  }
  else
  {
    v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "GuidedAccces (SB) returning NO for shouldAllowURL: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)handleDoubleHeightStatusBarTapWithStyleOverride:(unint64_t)a3
{
  objc_super v5 = +[GAXSpringboard sharedInstance];
  if ([v5 isActive])
  {
    unsigned __int8 v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Guided Access blocking double height status bar tap.", buf, 2u);
    }

    BOOL v7 = [v5 frontmostAppIdentifier];
    unsigned int v8 = [v7 isEqualToString:@"com.apple.ContactlessUIService"];

    if (v8)
    {
      v9 = GAXLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Informing Tap2Pay of double height status bar tap.", buf, 2u);
      }

      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2050000000;
      int v10 = (void *)qword_37A30;
      uint64_t v23 = qword_37A30;
      if (!qword_37A30)
      {
        *(void *)buf = _NSConcreteStackBlock;
        uint64_t v16 = 3221225472;
        v17 = sub_B9F4;
        v18 = &unk_28990;
        v19 = &v20;
        sub_B9F4((uint64_t)buf);
        int v10 = (void *)v21[3];
      }
      id v11 = v10;
      _Block_object_dispose(&v20, 8);
      [v11 notifyIncomingCallAction:&stru_2B7E0];
    }
    BOOL v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)GAXSpringBoardOverride;
    BOOL v12 = [(GAXSpringBoardOverride *)&v14 handleDoubleHeightStatusBarTapWithStyleOverride:a3];
  }

  return v12;
}

- (void)applicationOpenURL:(id)a3 withApplication:(id)a4 animating:(BOOL)a5 activationSettings:(id)a6 origin:(id)a7 notifyLSOnFailure:(BOOL)a8 withResult:(id)a9
{
  BOOL v9 = a8;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  if ([(GAXSpringBoardOverride *)self _gaxShouldAllowOpeningURL:v15])
  {
    v21.receiver = self;
    v21.super_class = (Class)GAXSpringBoardOverride;
    [(GAXSpringBoardOverride *)&v21 applicationOpenURL:v15 withApplication:v16 animating:v12 activationSettings:v17 origin:v18 notifyLSOnFailure:v9 withResult:v19];
  }
  else
  {
    uint64_t v20 = GAXLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v15;
      __int16 v24 = 2114;
      id v25 = v16;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Guided Access blocking open URL: %{public}@ app:%{public}@", buf, 0x16u);
    }
  }
}

- (BOOL)handleEvent:(__GSEvent *)a3 withNewEvent:(id)a4
{
  id v6 = a4;
  BOOL v7 = +[GAXSpringboard sharedInstance];
  unsigned int v8 = v7;
  if (a3
    && [v7 isActive]
    && ((int Type = GSEventGetType(), (Type - 5000) < 0x3E8)
     || (int v11 = Type, (Type - 1018) < 6) && ((0x33u >> (Type + 6)) & 1) != 0
     || (Type - 1025) <= 1 && ![v8 allowsLockButton]
     || (+[AXSpringBoardServer server],
         BOOL v12 = objc_claimAutoreleasedReturnValue(),
         unsigned __int8 v13 = [v12 isSystemSleeping],
         v12,
         v11 == 1010)
     && (v13 & 1) != 0))
  {
    BOOL v10 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)GAXSpringBoardOverride;
    BOOL v10 = [(GAXSpringBoardOverride *)&v15 handleEvent:a3 withNewEvent:v6];
  }

  return v10;
}

- (void)_handleGotoHomeScreenShortcut:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[GAXSpringboard sharedInstance];
  unsigned __int8 v6 = [v5 isActive];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)GAXSpringBoardOverride;
    [(GAXSpringBoardOverride *)&v7 _handleGotoHomeScreenShortcut:v4];
  }
}

- (void)batteryStatusDidChange:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[GAXSpringboard sharedInstance];
  if ([v5 isActive]
    && ([v4 objectForKey:@"AtCriticalLevel"],
        unsigned __int8 v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 BOOLValue],
        v6,
        v7))
  {
    [v5 systemDidRestartDueToLowBattery];
    BOOL v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    int v11 = sub_B89C;
    BOOL v12 = &unk_28848;
    id v13 = v4;
    objc_super v14 = self;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GAXSpringBoardOverride;
    [(GAXSpringBoardOverride *)&v8 batteryStatusDidChange:v4];
  }
}

- (BOOL)allowCaseLatchLockAndUnlock
{
  id v3 = +[GAXSpringboard sharedInstance];
  if (![v3 isActive]
    || ([v3 allowsLockButton] & 1) != 0
    || [v3 allowsAutolock])
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXSpringBoardOverride;
    BOOL v4 = [(GAXSpringBoardOverride *)&v6 allowCaseLatchLockAndUnlock];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)handleStatusBarHoverActionForRegion:(int64_t)a3
{
  objc_super v5 = +[GAXSpringboard sharedInstance];
  if (([v5 isActive] & 1) != 0
    || ([v5 isInWorkspace] & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GAXSpringBoardOverride;
    BOOL v6 = [(GAXSpringBoardOverride *)&v8 handleStatusBarHoverActionForRegion:a3];
  }

  return v6;
}

@end