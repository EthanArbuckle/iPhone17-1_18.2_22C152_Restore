@interface AXSB_SBIconControllerSafeCategory
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)iconManager:(id)a3 launchIconForIconView:(id)a4 withActions:(id)a5 modifierFlags:(int64_t)a6;
@end

@implementation AXSB_SBIconControllerSafeCategory

- (void)iconManager:(id)a3 launchIconForIconView:(id)a4 withActions:(id)a5 modifierFlags:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = +[AXSpringBoardServerSideAppManager sharedInstance];
  if ([v13 _isDockIconView:v11])
  {
    v14 = [v13 _bundleIdentifierForIconView:v11];
    v15 = [v13 _appWithIdentifier:v14];
    uint64_t v16 = [v13 dockIconActivationMode];
    switch(v16)
    {
      case 1:
        if ([v13 canLaunchAsPinnedApplicationForIconView:v11])
        {
          v17 = v13;
          v18 = v15;
          uint64_t v19 = 1;
LABEL_12:
          [v17 launchPinnedApplication:v18 onLeadingSide:v19];
          goto LABEL_17;
        }
        break;
      case 2:
        if ([v13 canLaunchAsPinnedApplicationForIconView:v11])
        {
          v17 = v13;
          v18 = v15;
          uint64_t v19 = 0;
          goto LABEL_12;
        }
        break;
      case 3:
        if ([v13 canLaunchAsFloatingApplicationForIconView:v11])
        {
          [v13 launchFloatingApplication:v15];
LABEL_17:
          [v13 setDockIconActivationMode:0];

          goto LABEL_18;
        }
        v20 = [v13 delegate];
        [v20 didFailToFloatAppForSideAppManager:v13];
LABEL_16:

        goto LABEL_17;
      default:
        v22.receiver = self;
        v22.super_class = (Class)AXSB_SBIconControllerSafeCategory;
        [(AXSB_SBIconControllerSafeCategory *)&v22 iconManager:v10 launchIconForIconView:v11 withActions:v12 modifierFlags:a6];
        goto LABEL_17;
    }
    v20 = [v13 delegate];
    [v20 didFailToPinAppForSideAppManager:v13];
    goto LABEL_16;
  }
  v21.receiver = self;
  v21.super_class = (Class)AXSB_SBIconControllerSafeCategory;
  [(AXSB_SBIconControllerSafeCategory *)&v21 iconManager:v10 launchIconForIconView:v11 withActions:v12 modifierFlags:a6];
LABEL_18:
}

+ (id)safeCategoryTargetClassName
{
  return @"SBIconController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end