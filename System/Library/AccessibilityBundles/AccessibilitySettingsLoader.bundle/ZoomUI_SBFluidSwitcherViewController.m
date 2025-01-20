@interface ZoomUI_SBFluidSwitcherViewController
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)handleFluidSwitcherGestureManager:(id)a3 didBeginGesture:(id)a4;
- (void)handleFluidSwitcherGestureManager:(id)a3 didEndGesture:(id)a4;
@end

@implementation ZoomUI_SBFluidSwitcherViewController

+ (id)safeCategoryTargetClassName
{
  return @"SBFluidSwitcherViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)handleFluidSwitcherGestureManager:(id)a3 didBeginGesture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ZoomUI_SBFluidSwitcherViewController *)self safeUIViewForKey:@"view"];
  v9 = [v8 window];
  v10 = [v9 screen];
  v11 = [v10 displayIdentity];
  uint64_t v12 = [v11 displayID];

  if ((!soft_AXDeviceHasHomeButton() || soft_AXDeviceIsPad()) && translatedUpwards
    || ([getZoomServicesClass() sharedInstance],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 activeZoomModeOnDisplay:v12],
        v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 isEqualToString:*MEMORY[0x263F22790]],
        v14,
        v13,
        v15))
  {
    v16 = [getZoomServicesClass() sharedInstance];
    [v16 notifyZoomFluidSwitcherGestureWillBegin];
  }
  v17.receiver = self;
  v17.super_class = (Class)ZoomUI_SBFluidSwitcherViewController;
  [(ZoomUI_SBFluidSwitcherViewController *)&v17 handleFluidSwitcherGestureManager:v6 didBeginGesture:v7];
}

- (void)handleFluidSwitcherGestureManager:(id)a3 didEndGesture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (!soft_AXDeviceHasHomeButton() || soft_AXDeviceIsPad())
  {
    if (soft_AXDeviceIsPad())
    {
      v8 = [(ZoomUI_SBFluidSwitcherViewController *)self safeValueForKey:@"rootModifier"];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __88__ZoomUI_SBFluidSwitcherViewController_handleFluidSwitcherGestureManager_didEndGesture___block_invoke;
      v12[3] = &unk_26509DA80;
      id v9 = v8;
      id v13 = v9;
      v14 = &v15;
      soft_AXPerformSafeBlock(v12);
    }
    if (!*((unsigned char *)v16 + 24))
    {
      v10 = [getZoomServicesClass() sharedInstance];
      [v10 performSelector:sel_notifyZoomFluidSwitcherGestureDidFinish withObject:0 afterDelay:0.5];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)ZoomUI_SBFluidSwitcherViewController;
  [(ZoomUI_SBFluidSwitcherViewController *)&v11 handleFluidSwitcherGestureManager:v6 didEndGesture:v7];
  _Block_object_dispose(&v15, 8);
}

@end