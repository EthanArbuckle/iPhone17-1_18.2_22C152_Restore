@interface ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_viewOrientationDoesNotMatchSBOrientation:(id)a3;
- (CGPoint)_convertPortaitPointToSBOrientation:(CGPoint)a3;
- (CGPoint)_convertSBPointToPortaitOrientation:(CGPoint)a3;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)translationInView:(id)a3;
- (void)setTranslation:(CGPoint)a3 inView:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer

+ (id)safeCategoryTargetClassName
{
  return @"SBFluidSwitcherScreenEdgePanGestureRecognizer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)_convertPortaitPointToSBOrientation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(id)*MEMORY[0x263F1D020] activeInterfaceOrientation];
  v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8 - x;
  double v12 = v10 - y;
  double v13 = v10 - x;
  double v14 = v8 - y;
  if (v5 == 4)
  {
    double v15 = x;
  }
  else
  {
    double v14 = x;
    double v15 = y;
  }
  if (v5 == 3) {
    double v14 = y;
  }
  else {
    double v13 = v15;
  }
  if (v5 != 2)
  {
    double v11 = v14;
    double v12 = v13;
  }
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)_convertSBPointToPortaitOrientation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(id)*MEMORY[0x263F1D020] activeInterfaceOrientation];
  v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8 - x;
  double v12 = v10 - y;
  if (v5 == 4) {
    double v13 = y;
  }
  else {
    double v13 = x;
  }
  if (v5 == 4) {
    double v14 = v8 - x;
  }
  else {
    double v14 = y;
  }
  if (v5 == 3)
  {
    double v13 = v10 - y;
    double v14 = x;
  }
  if (v5 != 2)
  {
    double v11 = v13;
    double v12 = v14;
  }
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [getZoomServicesClass() sharedInstance];
  double v9 = [MEMORY[0x263F1C920] mainScreen];
  double v10 = [v9 displayIdentity];
  objc_msgSend(v8, "zoomFrameOnDisplay:", objc_msgSend(v10, "displayID"));
  *(void *)zoomFrame = v11;
  *(void *)&zoomFrame[8] = v12;
  *(void *)&zoomFrame[16] = v13;
  *(void *)&zoomFrame[24] = v14;

  double v15 = [getAXSettingsClass() sharedInstance];
  zoomInStandByAtGestureStart = [v15 zoomInStandby];

  translatedUpwards = 0;
  v16.receiver = self;
  v16.super_class = (Class)ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer;
  [(ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer *)&v16 touchesBegan:v7 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  long long v4 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  *(_OWORD *)zoomFrame = *MEMORY[0x263F001A8];
  *(_OWORD *)&zoomFrame[16] = v4;
  translatedUpwards = 0;
  v5.receiver = self;
  v5.super_class = (Class)ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer;
  [(ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer *)&v5 touchesEnded:a3 withEvent:a4];
}

- (BOOL)_viewOrientationDoesNotMatchSBOrientation:(id)a3
{
  v3 = (void *)MEMORY[0x263F1C920];
  id v4 = a3;
  objc_super v5 = [v3 mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  [v4 bounds];
  double v11 = v10;
  double v13 = v12;

  BOOL v14 = v9 != v13 || v7 != v11;
  return v14;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  if (+[ZoomServicesUI _shouldUnmapPointsForFluidGestures])
  {
    BOOL v5 = zoomInStandByAtGestureStart == 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  if (v5)
  {
    [(ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer *)self safeCGPointForKey:@"_lastSceneReferenceLocation"];
    -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _convertPortaitPointToSBOrientation:](self, "_convertPortaitPointToSBOrientation:");
    +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:");
    double v11 = v10;
    double v13 = v12;
    if ([(ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer *)self _viewOrientationDoesNotMatchSBOrientation:v4])
    {
      -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _convertSBPointToPortaitOrientation:](self, "_convertSBPointToPortaitOrientation:", v11, v13);
      double v11 = v14;
      double v13 = v15;
    }
    [v4 bounds];
    double v7 = v11 + v16;
    [v4 bounds];
    double v9 = v13 + v17;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer;
    [(ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer *)&v20 locationInView:v4];
    double v7 = v6;
    double v9 = v8;
  }

  double v18 = v7;
  double v19 = v9;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  id v4 = a3;
  if (+[ZoomServicesUI _shouldUnmapPointsForFluidGestures])
  {
    BOOL v5 = zoomInStandByAtGestureStart == 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  if (v5)
  {
    [(ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer *)self safeCGPointForKey:@"_firstSceneReferenceLocation"];
    double v11 = v10;
    double v13 = v12;
    [(ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer *)self safeCGPointForKey:@"_lastSceneReferenceLocation"];
    double v15 = v14;
    double v17 = v16;
    -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _convertPortaitPointToSBOrientation:](self, "_convertPortaitPointToSBOrientation:", v11, v13);
    double v19 = v18;
    double v21 = v20;
    -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _convertPortaitPointToSBOrientation:](self, "_convertPortaitPointToSBOrientation:", v15, v17);
    double v23 = v22;
    double v25 = v24;
    +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:", v19, v21);
    double v27 = v26;
    double v29 = v28;
    +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:", v23, v25);
    double v31 = v30;
    double v33 = v32;
    if ([(ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer *)self _viewOrientationDoesNotMatchSBOrientation:v4])
    {
      -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _convertSBPointToPortaitOrientation:](self, "_convertSBPointToPortaitOrientation:", v27, v29);
      double v27 = v34;
      double v29 = v35;
      -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _convertSBPointToPortaitOrientation:](self, "_convertSBPointToPortaitOrientation:", v31, v33);
      double v31 = v36;
      double v33 = v37;
    }
    double v7 = v31 - v27;
    double v9 = v33 - v29;
    translatedUpwards = v9 < 0.0;
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer;
    [(ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer *)&v40 translationInView:v4];
    double v7 = v6;
    double v9 = v8;
  }

  double v38 = v7;
  double v39 = v9;
  result.double y = v39;
  result.double x = v38;
  return result;
}

- (void)setTranslation:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (+[ZoomServicesUI _shouldUnmapPointsForFluidGestures])
  {
    BOOL v8 = zoomInStandByAtGestureStart == 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer;
    -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer setTranslation:inView:](&v9, sel_setTranslation_inView_, v7, x, y);
  }
}

@end