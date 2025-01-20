@interface GAXSBAlertItemsControllerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_gaxShouldAllowSpringBoardAlert:(id)a3;
- (BOOL)_gaxShouldAllowSpringBoardAlertWithClass:(Class)a3 allowedAlertClassNames:(id)a4;
- (void)activateAlertItem:(id)a3;
@end

@implementation GAXSBAlertItemsControllerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBAlertItemsController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAlertItem", @"didFailToActivate", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAlertItemsController", @"activateAlertItem:", "v", "@", 0);
}

- (void)activateAlertItem:(id)a3
{
  id v4 = a3;
  v5 = +[GAXSpringboard sharedInstance];
  if (([v5 isActive] & 1) == 0 && !objc_msgSend(v5, "isInWorkspace"))
  {
LABEL_6:
    v7.receiver = self;
    v7.super_class = (Class)GAXSBAlertItemsControllerOverride;
    [(GAXSBAlertItemsControllerOverride *)&v7 activateAlertItem:v4];
    goto LABEL_10;
  }
  if ([(GAXSBAlertItemsControllerOverride *)self _gaxShouldAllowSpringBoardAlert:v4])
  {
    if (([v5 allowsTouch] & 1) == 0) {
      [v5 notifyBackboardSBMiniAlertIsShowing:1];
    }
    goto LABEL_6;
  }
  v6 = GAXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Guided Access not allowing this alert: %{public}@.  Will fail it now.", buf, 0xCu);
  }

  [v4 didFailToActivate];
LABEL_10:
}

- (BOOL)_gaxShouldAllowSpringBoardAlertWithClass:(Class)a3 allowedAlertClassNames:(id)a4
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a4;
  v6 = (char *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ((Class)AXSafeClassFromString() == a3)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      objc_super v7 = (char *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_gaxShouldAllowSpringBoardAlert:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = +[GAXSpringboard sharedInstance];
  id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"CKCarrierSMSAlertItem", @"CMASBBAlertItem", 0);
  if ([(GAXSBAlertItemsControllerOverride *)self _gaxShouldAllowSpringBoardAlertWithClass:v5 allowedAlertClassNames:v7])
  {
    goto LABEL_6;
  }
  if ([v6 profileConfiguration] != 2) {
    goto LABEL_7;
  }
  id v8 = objc_alloc((Class)NSSet);
  unsigned int v9 = [v6 allowsTouch];
  CFStringRef v10 = @"SBLowPowerAlertItem";
  if (!v9) {
    CFStringRef v10 = 0;
  }
  id v11 = objc_msgSend(v8, "initWithObjects:", @"SBPasscodeAlertItem", v10, 0);
  unsigned __int8 v12 = [(GAXSBAlertItemsControllerOverride *)self _gaxShouldAllowSpringBoardAlertWithClass:v5 allowedAlertClassNames:v11];

  if (v12)
  {
LABEL_6:
    char v13 = 1;
  }
  else
  {
LABEL_7:
    if (v5 == AXSafeClassFromString())
    {
      long long v14 = [v4 safeValueForKey:@"_soundPath"];
      long long v15 = [v4 safeValueForKey:@"_alertSource"];
      v16 = [v15 lowercaseString];

      v27 = v14;
      unsigned __int8 v17 = [v14 hasPrefix:@"/System/Library/PrivateFrameworks/FindMyDevice.framework/fmd_sound"];
      if ([v16 isEqualToString:@"mdmd"]) {
        unsigned __int8 v18 = 1;
      }
      else {
        unsigned __int8 v18 = [v16 isEqualToString:@"dmd"];
      }
      unsigned __int8 v19 = [v16 isEqualToString:@"profiled"];
      unsigned __int8 v20 = [v16 isEqualToString:@"studentd"];
      char v21 = v17 | v18;
      unsigned int v26 = [v6 profileConfiguration];
      unsigned int v22 = [v16 isEqualToString:@"locationd"];
      unsigned int v23 = [v16 isEqualToString:@"tccd"];
      unsigned int v24 = [v16 isEqualToString:@"nehelper"];
      char v13 = 1;
      if ((v21 & 1) == 0 && (v19 & 1) == 0 && (v20 & 1) == 0) {
        char v13 = (v22 | v23 | v24) == 1 && (v26 & 0xFFFFFFFE) == 2;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

@end