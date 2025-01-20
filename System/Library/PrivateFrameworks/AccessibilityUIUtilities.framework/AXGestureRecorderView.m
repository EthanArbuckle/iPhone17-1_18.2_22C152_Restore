@interface AXGestureRecorderView
- (AXGestureRecorderStyleProvider)styleProvider;
- (AXGestureRecorderView)initWithCoder:(id)a3;
- (AXGestureRecorderView)initWithFrame:(CGRect)a3;
- (AXGestureRecorderViewDelegate)dataSource;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)replayMode;
- (CGRect)accessibilityFrame;
- (CGRect)constrainedBoundsForDrawing;
- (NSMutableDictionary)previouslyActiveLayersByInstantReplayFingerIndex;
- (UIAccessibilityCustomAction)hideControlsAction;
- (UIAccessibilityCustomAction)showControlsAction;
- (UIColor)dynamicFingerPathBackgroundGradientPatternColor;
- (UIView)dynamicFingerPathsContainerView;
- (id)_dynamicFingerPathAtIndex:(unint64_t)a3;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_commonInit;
- (void)_hideControls;
- (void)_performTransitionToStaticFingers:(id)a3 transitionLayers:(id)a4 hasExistingStaticFingers:(BOOL)a5;
- (void)_showControls;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)clearInstantReplayFingerPaths;
- (void)deleteAllFingerPaths;
- (void)didMoveToWindow;
- (void)drawRect:(CGRect)a3;
- (void)fingerPathDidChange:(unint64_t)a3;
- (void)finishInstantReplayAtIndex:(unint64_t)a3;
- (void)freezeAllDynamicFingerPaths;
- (void)freezeAllDynamicFingerPathsWithInstantReplayOffset:(unint64_t)a3;
- (void)hideStaticView;
- (void)setConstrainedBoundsForDrawing:(CGRect)a3;
- (void)setDataSource:(id)a3;
- (void)setDynamicFingerPathBackgroundGradientPatternColor:(id)a3;
- (void)setDynamicFingerPathsContainerView:(id)a3;
- (void)setHideControlsAction:(id)a3;
- (void)setPreviouslyActiveLayersByInstantReplayFingerIndex:(id)a3;
- (void)setReplayMode:(BOOL)a3;
- (void)setShowControlsAction:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)updateInstantReplayAtIndex:(unint64_t)a3 withPartialPath:(id)a4;
@end

@implementation AXGestureRecorderView

- (void)_commonInit
{
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  activeLayers = self->_activeLayers;
  self->_activeLayers = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  instantReplayViews = self->_instantReplayViews;
  self->_instantReplayViews = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  staticLayers = self->_staticLayers;
  self->_staticLayers = v7;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  transitionLayers = self->_transitionLayers;
  self->_transitionLayers = v9;

  [(AXGestureRecorderView *)self setUserInteractionEnabled:1];
  [(AXGestureRecorderView *)self setMultipleTouchEnabled:1];
  [(AXGestureRecorderView *)self setNeedsDisplay];
}

- (AXGestureRecorderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXGestureRecorderView;
  v3 = -[AXGestureRecorderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AXGestureRecorderView *)v3 _commonInit];
  }
  return v4;
}

- (AXGestureRecorderView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXGestureRecorderView;
  v3 = [(AXGestureRecorderView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AXGestureRecorderView *)v3 _commonInit];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = [(AXGestureRecorderView *)self styleProvider];
  id v10 = [v9 gestureRecorderViewBackgroundColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v10 CGColor]);

  CGFloat v11 = x;
  CGFloat v12 = y;
  CGFloat v13 = width;
  CGFloat v14 = height;
  CGContextFillRect(CurrentContext, *(CGRect *)&v11);
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(AXGestureRecorderView *)self deleteAllFingerPaths];
    uint64_t v5 = [obj numberOfDynamicFingerPathsInGestureRecorderView:self];
    if (v5)
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [(AXGestureRecorderView *)self insertDynamicFingerPathAtIndex:i];
    }
  }
}

- (void)setStyleProvider:(id)a3
{
  uint64_t v5 = (AXGestureRecorderStyleProvider *)a3;
  p_styleProvider = &self->_styleProvider;
  if (self->_styleProvider != v5)
  {
    CGFloat v14 = v5;
    objc_storeStrong((id *)p_styleProvider, a3);
    uint64_t v5 = v14;
    if (v14)
    {
      v7 = [(AXGestureRecorderStyleProvider *)v14 fingerLineGradientTopColor];
      v8 = [(AXGestureRecorderStyleProvider *)v14 fingerLineGradientBottomColor];
      [(AXGestureRecorderStyleProvider *)v14 fingerLineGradientTopColorLocation];
      int v10 = v9;
      [(AXGestureRecorderStyleProvider *)v14 fingerLineGradientBottomColorLocation];
      LODWORD(v12) = v11;
      LODWORD(v13) = v10;
      [(AXGestureRecorderGradientView *)self configureGradientWithTopColor:v7 bottomColor:v8 topColorLocation:v13 bottomColorLocation:v12];

      uint64_t v5 = v14;
    }
  }
  MEMORY[0x1F41817F8](p_styleProvider, v5);
}

- (UIColor)dynamicFingerPathBackgroundGradientPatternColor
{
  locations[2] = *(CGFloat *)MEMORY[0x1E4F143B8];
  dynamicFingerPathBackgroundGradientPatternColor = self->_dynamicFingerPathBackgroundGradientPatternColor;
  if (!dynamicFingerPathBackgroundGradientPatternColor)
  {
    v4 = [(AXGestureRecorderView *)self styleProvider];
    uint64_t v5 = [(AXGestureRecorderView *)self window];
    [(AXGestureRecorderView *)self bounds];
    CGFloat x = v35.origin.x;
    CGFloat y = v35.origin.y;
    CGFloat width = v35.size.width;
    CGFloat height = v35.size.height;
    double v10 = CGRectGetWidth(v35);
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double v11 = CGRectGetHeight(v36);
    if (v4)
    {
      if (v5)
      {
        if (v10 > 0.0)
        {
          CGFloat v12 = v11;
          if (v11 > 0.0)
          {
            double v13 = [v5 screen];
            [v13 scale];
            CGFloat v15 = v14;

            v32.CGFloat width = width;
            v32.CGFloat height = height;
            UIGraphicsBeginImageContextWithOptions(v32, 1, v15);
            CurrentContext = UIGraphicsGetCurrentContext();
            CGContextSaveGState(CurrentContext);
            id v17 = objc_alloc(MEMORY[0x1E4F1C978]);
            id v18 = [v4 dynamicFingerLineGradientTopColor];
            uint64_t v19 = [v18 CGColor];
            id v20 = [v4 dynamicFingerLineGradientBottomColor];
            CFArrayRef v21 = (const __CFArray *)objc_msgSend(v17, "initWithObjects:", v19, objc_msgSend(v20, "CGColor"), 0);

            [v4 dynamicFingerLineGradientTopColorLocation];
            locations[0] = v22;
            [v4 dynamicFingerLineGradientBottomColorLocation];
            locations[1] = v23;
            DeviceRGB = CGColorSpaceCreateDeviceRGB();
            v25 = CGGradientCreateWithColors(DeviceRGB, v21, locations);
            CGColorSpaceRelease(DeviceRGB);
            v33.CGFloat x = v10 * 0.5;
            v33.CGFloat y = 0.0;
            v34.CGFloat x = v10 * 0.5;
            v34.CGFloat y = v12;
            CGContextDrawLinearGradient(CurrentContext, v25, v33, v34, 0);
            CGGradientRelease(v25);
            v26 = UIGraphicsGetImageFromCurrentImageContext();
            v27 = (UIColor *)[objc_alloc(MEMORY[0x1E4FB1618]) initWithPatternImage:v26];
            v28 = self->_dynamicFingerPathBackgroundGradientPatternColor;
            self->_dynamicFingerPathBackgroundGradientPatternColor = v27;

            CGContextRestoreGState(CurrentContext);
            UIGraphicsEndImageContext();
          }
        }
      }
    }

    dynamicFingerPathBackgroundGradientPatternColor = self->_dynamicFingerPathBackgroundGradientPatternColor;
  }
  return dynamicFingerPathBackgroundGradientPatternColor;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  v3 = [(AXGestureRecorderView *)self safeAreaLayoutGuide];
  [v3 layoutFrame];
  CGRect v13 = UIAccessibilityConvertFrameToScreenCoordinates(v12, &self->super.super);
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;

  double v8 = x;
  double v9 = y;
  double v10 = width;
  double v11 = height;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (id)accessibilityLabel
{
  return AXUILocalizedStringForKey(@"CustomGestureVoiceOverLabel");
}

- (id)accessibilityHint
{
  return AXUILocalizedStringForKey(@"CustomInstructions");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4FB2538];
}

- (void)_hideControls
{
  id v3 = [(AXGestureRecorderView *)self dataSource];
  [v3 gestureRecorderView:self setChromeVisible:0];
}

- (void)_showControls
{
  id v3 = [(AXGestureRecorderView *)self dataSource];
  [v3 gestureRecorderView:self setChromeVisible:1];
}

- (id)accessibilityCustomActions
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(AXGestureRecorderView *)self dataSource];
  int v4 = [v3 canToggleChromeForGestureRecorderView:self];

  if (v4)
  {
    uint64_t v5 = [(AXGestureRecorderView *)self dataSource];
    int v6 = [v5 isChromeVisibleForGestureRecorderView:self];

    if (v6)
    {
      v7 = [(AXGestureRecorderView *)self hideControlsAction];

      if (!v7)
      {
        id v8 = objc_alloc(MEMORY[0x1E4FB13B8]);
        double v9 = AXUILocalizedStringForKey(@"CustomGesturesHideControls");
        double v10 = (void *)[v8 initWithName:v9 target:self selector:sel__hideControls];

        [(AXGestureRecorderView *)self setHideControlsAction:v10];
      }
      double v11 = [(AXGestureRecorderView *)self hideControlsAction];
      v20[0] = v11;
      CGRect v12 = (void **)v20;
    }
    else
    {
      double v14 = [(AXGestureRecorderView *)self showControlsAction];

      if (!v14)
      {
        id v15 = objc_alloc(MEMORY[0x1E4FB13B8]);
        v16 = AXUILocalizedStringForKey(@"CustomGesturesShowControls");
        id v17 = (void *)[v15 initWithName:v16 target:self selector:sel__showControls];

        [(AXGestureRecorderView *)self setShowControlsAction:v17];
      }
      double v11 = [(AXGestureRecorderView *)self showControlsAction];
      uint64_t v19 = v11;
      CGRect v12 = &v19;
    }
    CGRect v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    CGRect v13 = 0;
  }
  return v13;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)AXGestureRecorderView;
  [(AXGestureRecorderView *)&v3 didMoveToWindow];
  [(AXGestureRecorderView *)self setNeedsDisplay];
}

- (void)fingerPathDidChange:(unint64_t)a3
{
  uint64_t v5 = -[AXGestureRecorderView _dynamicFingerPathAtIndex:](self, "_dynamicFingerPathAtIndex:");
  activeLayers = self->_activeLayers;
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  id v8 = [(NSMutableDictionary *)activeLayers objectForKey:v7];

  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F39C88] layer];
    BOOL v9 = [(AXGestureRecorderView *)self replayMode];
    double v10 = [(AXGestureRecorderView *)self styleProvider];
    double v11 = v10;
    if (v9) {
      [v10 finalDynamicFingerColor];
    }
    else {
    id v12 = [v10 tracingDynamicFingerColor];
    }
    objc_msgSend(v8, "setFillColor:", objc_msgSend(v12, "CGColor"));

    CGRect v13 = [(AXGestureRecorderView *)self layer];
    [v13 addSublayer:v8];

    double v14 = self->_activeLayers;
    id v15 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v14 setObject:v8 forKey:v15];
  }
  id v16 = v5;
  objc_msgSend(v8, "setPath:", objc_msgSend(v16, "CGPath"));
}

- (id)_dynamicFingerPathAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_freezedDynamicPaths count])
  {
    uint64_t v5 = [(NSMutableArray *)self->_freezedDynamicPaths objectAtIndex:a3];
  }
  else
  {
    int v6 = [(AXGestureRecorderView *)self dataSource];
    if ([v6 numberOfDynamicFingerPathsInGestureRecorderView:self] <= a3)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [v6 gestureRecorderView:self dynamicFingerPathAtIndex:a3];
    }
  }
  return v5;
}

- (void)updateInstantReplayAtIndex:(unint64_t)a3 withPartialPath:(id)a4
{
  id v6 = a4;
  instantReplayViews = self->_instantReplayViews;
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  BOOL v9 = [(NSMutableDictionary *)instantReplayViews objectForKey:v8];

  if (!v9)
  {
    BOOL v9 = [MEMORY[0x1E4F39C88] layer];
    double v10 = [(AXGestureRecorderView *)self styleProvider];
    id v11 = [v10 finalDynamicFingerColor];
    objc_msgSend(v9, "setFillColor:", objc_msgSend(v11, "CGColor"));

    id v12 = [(AXGestureRecorderView *)self layer];
    [v12 addSublayer:v9];

    CGRect v13 = self->_instantReplayViews;
    double v14 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v13 setObject:v9 forKey:v14];
  }
  id v15 = v6;
  objc_msgSend(v9, "setPath:", objc_msgSend(v15, "CGPath"));
}

- (void)finishInstantReplayAtIndex:(unint64_t)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AXGestureRecorderView *)self previouslyActiveLayersByInstantReplayFingerIndex];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = [(AXGestureRecorderView *)self styleProvider];
  id v9 = [v8 finalDynamicFingerColor];
  objc_msgSend(v7, "setFillColor:", objc_msgSend(v9, "CGColor"));

  uint64_t v10 = [(NSMutableArray *)self->_staticLayers count];
  if (v10)
  {
    uint64_t v11 = v10;
    [v7 removeFromSuperlayer];
    id v12 = [(AXGestureRecorderView *)self layer];
    [v12 insertSublayer:v7 atIndex:v11];
  }
  v21[0] = v7;
  CGRect v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [(AXGestureRecorderView *)self _performTransitionToStaticFingers:v13 transitionLayers:0 hasExistingStaticFingers:0];

  double v14 = [(AXGestureRecorderView *)self previouslyActiveLayersByInstantReplayFingerIndex];
  id v15 = [NSNumber numberWithUnsignedInteger:a3];
  [v14 removeObjectForKey:v15];

  instantReplayViews = self->_instantReplayViews;
  id v17 = [NSNumber numberWithUnsignedInteger:a3];
  id v18 = [(NSMutableDictionary *)instantReplayViews objectForKeyedSubscript:v17];
  [v18 removeFromSuperlayer];

  uint64_t v19 = self->_instantReplayViews;
  id v20 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v19 removeObjectForKey:v20];
}

- (void)clearInstantReplayFingerPaths
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = [(NSMutableDictionary *)self->_instantReplayViews allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) removeFromSuperlayer];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_instantReplayViews removeAllObjects];
}

- (void)_performTransitionToStaticFingers:(id)a3 transitionLayers:(id)a4 hasExistingStaticFingers:(BOOL)a5
{
  BOOL v22 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
        double v14 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"fillColor"];
        [v14 setDuration:0.53];
        id v15 = [(AXGestureRecorderView *)self styleProvider];
        id v16 = [v15 finalDynamicFingerColor];
        objc_msgSend(v14, "setFromValue:", objc_msgSend(v16, "CGColor"));

        id v17 = [(AXGestureRecorderView *)self styleProvider];
        id v18 = [v17 staticFingerColor];
        objc_msgSend(v14, "setToValue:", objc_msgSend(v18, "CGColor"));

        [v14 setValue:@"GrayTransition" forKey:@"AnimationName"];
        uint64_t v19 = [NSNumber numberWithBool:v22];
        [v14 setValue:v19 forKey:@"HasExistingStaticFingers"];

        [v14 setDelegate:self];
        [v14 setValue:v7 forKey:@"AnimatingLayers"];
        [v14 setValue:v8 forKey:@"TransitionLayers"];
        id v20 = [(AXGestureRecorderView *)self styleProvider];
        id v21 = [v20 staticFingerColor];
        objc_msgSend(v13, "setFillColor:", objc_msgSend(v21, "CGColor"));

        [v13 addAnimation:v14 forKey:@"Change"];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 valueForKey:@"AnimatingLayers"];
  id v8 = [v6 valueForKey:@"TransitionLayers"];
  uint64_t v9 = [v6 valueForKey:@"AnimationName"];
  int v10 = [v9 isEqualToString:@"GrayTransition"];

  if (!v10) {
    goto LABEL_28;
  }
  uint64_t v11 = [v6 valueForKey:@"HasExistingStaticFingers"];
  int v12 = [v11 BOOLValue];

  if (v12)
  {
    v31 = v8;
    CGSize v32 = v7;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "removeFromSuperlayer", v31);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v15);
    }
LABEL_19:
    id v7 = v32;

    id v8 = v31;
    goto LABEL_20;
  }
  if (v4)
  {
    v31 = v8;
    CGSize v32 = v7;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v18 = v7;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          long long v24 = [(AXGestureRecorderView *)self styleProvider];
          id v25 = [v24 staticFingerColor];
          objc_msgSend(v23, "setFillColor:", objc_msgSend(v25, "CGColor"));

          [(NSMutableArray *)self->_staticLayers addObject:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v20);
    }
    goto LABEL_19;
  }
LABEL_20:
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v26 = v8;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * k), "removeFromSuperlayer", v31);
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v28);
  }

LABEL_28:
}

- (void)freezeAllDynamicFingerPaths
{
}

- (void)freezeAllDynamicFingerPathsWithInstantReplayOffset:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_activeLayers copy];
  id v6 = [(NSMutableDictionary *)self->_activeLayers allValues];
  [(NSMutableDictionary *)self->_activeLayers removeAllObjects];
  if ([(AXGestureRecorderView *)self replayMode])
  {
    [(AXGestureRecorderView *)self _performTransitionToStaticFingers:v6 transitionLayers:0 hasExistingStaticFingers:1];
  }
  else if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    _AXAssert();
  }
  else
  {
    uint64_t v19 = v6;
    id v7 = [(AXGestureRecorderView *)self previouslyActiveLayersByInstantReplayFingerIndex];

    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F1CA60] dictionary];
      [(AXGestureRecorderView *)self setPreviouslyActiveLayersByInstantReplayFingerIndex:v8];
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v20 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unint64_t v15 = [v14 unsignedIntegerValue] + a3;
          uint64_t v16 = [v9 objectForKeyedSubscript:v14];
          id v17 = [(AXGestureRecorderView *)self previouslyActiveLayersByInstantReplayFingerIndex];
          id v18 = [NSNumber numberWithUnsignedInteger:v15];
          [v17 setObject:v16 forKeyedSubscript:v18];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v6 = v19;
    uint64_t v5 = v20;
  }
}

- (void)deleteAllFingerPaths
{
  [(AXGestureRecorderView *)self setNeedsDisplay];
  objc_super v3 = [(AXGestureRecorderView *)self layer];
  [v3 removeAllAnimations];

  BOOL v4 = [(AXGestureRecorderView *)self layer];
  uint64_t v5 = [v4 sublayers];
  id v6 = (id)[v5 copy];

  [v6 enumerateObjectsUsingBlock:&__block_literal_global_6];
  [(NSMutableDictionary *)self->_activeLayers removeAllObjects];
  [(AXGestureRecorderView *)self clearInstantReplayFingerPaths];
}

uint64_t __45__AXGestureRecorderView_deleteAllFingerPaths__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperlayer];
}

- (void)hideStaticView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = self->_staticLayers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "removeFromSuperlayer", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_staticLayers removeAllObjects];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 0;
}

- (AXGestureRecorderViewDelegate)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (AXGestureRecorderViewDelegate *)WeakRetained;
}

- (AXGestureRecorderStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (UIView)dynamicFingerPathsContainerView
{
  return self->_dynamicFingerPathsContainerView;
}

- (void)setDynamicFingerPathsContainerView:(id)a3
{
}

- (void)setDynamicFingerPathBackgroundGradientPatternColor:(id)a3
{
}

- (CGRect)constrainedBoundsForDrawing
{
  double x = self->_constrainedBoundsForDrawing.origin.x;
  double y = self->_constrainedBoundsForDrawing.origin.y;
  double width = self->_constrainedBoundsForDrawing.size.width;
  double height = self->_constrainedBoundsForDrawing.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setConstrainedBoundsForDrawing:(CGRect)a3
{
  self->_constrainedBoundsForDrawing = a3;
}

- (BOOL)replayMode
{
  return self->_replayMode;
}

- (void)setReplayMode:(BOOL)a3
{
  self->_replayMode = a3;
}

- (UIAccessibilityCustomAction)hideControlsAction
{
  return self->_hideControlsAction;
}

- (void)setHideControlsAction:(id)a3
{
}

- (UIAccessibilityCustomAction)showControlsAction
{
  return self->_showControlsAction;
}

- (void)setShowControlsAction:(id)a3
{
}

- (NSMutableDictionary)previouslyActiveLayersByInstantReplayFingerIndex
{
  return self->_previouslyActiveLayersByInstantReplayFingerIndex;
}

- (void)setPreviouslyActiveLayersByInstantReplayFingerIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyActiveLayersByInstantReplayFingerIndex, 0);
  objc_storeStrong((id *)&self->_showControlsAction, 0);
  objc_storeStrong((id *)&self->_hideControlsAction, 0);
  objc_storeStrong((id *)&self->_dynamicFingerPathBackgroundGradientPatternColor, 0);
  objc_storeStrong((id *)&self->_dynamicFingerPathsContainerView, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_transitionLayers, 0);
  objc_storeStrong((id *)&self->_staticLayers, 0);
  objc_storeStrong((id *)&self->_instantReplayViews, 0);
  objc_storeStrong((id *)&self->_activeLayers, 0);
  objc_storeStrong((id *)&self->_freezedDynamicPaths, 0);
}

@end