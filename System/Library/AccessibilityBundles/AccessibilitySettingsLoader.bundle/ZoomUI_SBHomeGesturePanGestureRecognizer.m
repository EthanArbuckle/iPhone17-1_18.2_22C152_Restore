@interface ZoomUI_SBHomeGesturePanGestureRecognizer
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGPoint)translationInView:(id)a3;
@end

@implementation ZoomUI_SBHomeGesturePanGestureRecognizer

+ (id)safeCategoryTargetClassName
{
  return @"SBHomeGesturePanGestureRecognizer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)translationInView:(id)a3
{
  id v4 = a3;
  if (!+[ZoomServicesUI _shouldUnmapPointsForFluidGestures])goto LABEL_6; {
  v5 = [getAXSettingsClass() sharedInstance];
  }
  if ([v5 zoomInStandby])
  {

LABEL_6:
    v36.receiver = self;
    v36.super_class = (Class)ZoomUI_SBHomeGesturePanGestureRecognizer;
    [(ZoomUI_SBHomeGesturePanGestureRecognizer *)&v36 translationInView:v4];
    double v29 = v32;
    double v31 = v33;
    goto LABEL_7;
  }
  BOOL v6 = +[ZoomServicesUI _deviceIsPortrait];

  if (!v6) {
    goto LABEL_6;
  }
  [(ZoomUI_SBHomeGesturePanGestureRecognizer *)self safeCGPointForKey:@"_firstSceneReferenceLocation"];
  double v8 = v7;
  double v10 = v9;
  [(ZoomUI_SBHomeGesturePanGestureRecognizer *)self safeCGPointForKey:@"_lastSceneReferenceLocation"];
  double v12 = v11;
  double v14 = v13;
  v15 = [v4 window];
  v16 = [v15 screen];
  v17 = [v16 displayIdentity];
  uint64_t v18 = [v17 displayID];

  v19 = [getZoomServicesClass() sharedInstance];
  [v19 zoomFrameOnDisplay:v18];
  *(void *)zoomFrame = v20;
  *(void *)&zoomFrame[8] = v21;
  *(void *)&zoomFrame[16] = v22;
  *(void *)&zoomFrame[24] = v23;

  +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:", v8, v10);
  double v25 = v24;
  double v27 = v26;
  +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:", v12, v14);
  double v29 = v28 - v25;
  double v31 = v30 - v27;
LABEL_7:

  double v34 = v29;
  double v35 = v31;
  result.y = v35;
  result.x = v34;
  return result;
}

@end