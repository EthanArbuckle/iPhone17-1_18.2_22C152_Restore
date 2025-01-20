@interface ZoomUI_SBFluidSwitcherGestureManager
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
@end

@implementation ZoomUI_SBFluidSwitcherGestureManager

+ (id)safeCategoryTargetClassName
{
  return @"SBFluidSwitcherGestureManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!+[ZoomServicesUI _shouldUnmapPointsForFluidGestures])goto LABEL_12; {
  v8 = [getAXSettingsClass() sharedInstance];
  }
  if ([v8 zoomInStandby])
  {

LABEL_12:
    v37.receiver = self;
    v37.super_class = (Class)ZoomUI_SBFluidSwitcherGestureManager;
    unsigned __int8 v35 = [(ZoomUI_SBFluidSwitcherGestureManager *)&v37 gestureRecognizer:v6 shouldReceiveTouch:v7];
    goto LABEL_13;
  }
  BOOL v9 = +[ZoomServicesUI _deviceIsPortrait];

  if (!v9) {
    goto LABEL_12;
  }
  char v38 = 0;
  uint64_t v10 = objc_opt_class();
  v11 = [(ZoomUI_SBFluidSwitcherGestureManager *)self safeValueForKey:@"activateReachabilityGestureRecognizer"];
  soft___UIAccessibilityCastAsClass(v10, v11, (uint64_t)&v38);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v38) {
    goto LABEL_14;
  }
  if (v12 != v6)
  {
LABEL_11:

    goto LABEL_12;
  }
  char v38 = 0;
  uint64_t v13 = objc_opt_class();
  v14 = [(ZoomUI_SBFluidSwitcherGestureManager *)self safeValueForKey:@"switcherContentController"];
  v15 = soft___UIAccessibilityCastAsClass(v13, v14, (uint64_t)&v38);

  if (v38) {
LABEL_14:
  }
    abort();
  v16 = [v15 view];
  [v16 bounds];
  double v18 = v17;
  v19 = [(ZoomUI_SBFluidSwitcherGestureManager *)self safeValueForKey:@"reachabilitySettings"];
  soft_AXSafeClassFromString(@"SBReachabilitySettings");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_11;
  }
  [v19 safeCGFloatForKey:@"homeGestureSwipeDownHeight"];
  double v21 = v20;
  v22 = [v6 view];
  [v7 locationInView:v22];
  double v24 = v23;
  double v26 = v25;

  v27 = [getZoomServicesClass() sharedInstance];
  v28 = [MEMORY[0x263F1C920] mainScreen];
  v29 = [v28 displayIdentity];
  objc_msgSend(v27, "zoomFrameOnDisplay:", objc_msgSend(v29, "displayID"));
  *(void *)zoomFrame = v30;
  *(void *)&zoomFrame[8] = v31;
  *(void *)&zoomFrame[16] = v32;
  *(void *)&zoomFrame[24] = v33;

  +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:", v24, v26);
  unsigned __int8 v35 = v34 > v18 - v21;

LABEL_13:
  return v35;
}

@end