@interface UISDisplayContext
+ (id)clb_contextForDisplayStyle:(int64_t)a3;
@end

@implementation UISDisplayContext

+ (id)clb_contextForDisplayStyle:(int64_t)a3
{
  BSDispatchQueueAssertMain();
  v4 = +[UISMutableDisplayContext defaultContext];
  v5 = +[FBDisplayManager sharedInstance];
  v6 = [v5 mainConfiguration];
  [v4 setDisplayConfiguration:v6];

  v7 = +[UISApplicationSupportDisplayEdgeInfo clb_thisDeviceDisplayEdgeInfo];
  [v4 setDisplayEdgeInfo:v7];

  v8 = +[UISDisplaySingleRectShape clb_thisDeviceDisplayShape];
  [v4 setExclusionArea:v8];

  [v4 setArtworkSubtype:sub_10001FE90()];
  v9 = +[UIUserInterfaceStyleArbiter sharedInstance];
  v10 = v9;
  if (v9) {
    objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v9, "currentStyle"));
  }
  if (a3 == 1)
  {
    v11 = [v4 displayConfiguration];
    v12 = objc_msgSend(v11, "clb_displayConfigurationForNonClarityUIApp");
    [v4 setDisplayConfiguration:v12];

    uint64_t v13 = sub_10000730C();
    v14 = +[UISApplicationSupportDisplayEdgeInfo clb_displayEdgeInfoForScreenType:v13];
    [v4 setDisplayEdgeInfo:v14];

    v15 = +[UISDisplaySingleRectShape clb_displayShapeForScreenType:v13];
    [v4 setExclusionArea:v15];
  }

  return v4;
}

@end