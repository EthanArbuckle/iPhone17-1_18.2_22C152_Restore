@interface AXPIFingerContainerView
- (AXPIFingerAppearanceDelegate)appearanceDelegate;
- (AXPIFingerContainerView)initWithFrame:(CGRect)a3;
- (BOOL)isPinchChainVisible;
- (BOOL)shouldAnimatePress;
- (BOOL)shouldSuppressFingerVisuals;
- (CGRect)rectForFingersAtPoints:(id)a3;
- (NSArray)fingerModels;
- (unint64_t)indexOfFingerAtPoint:(CGPoint)a3;
- (void)_updateFingerModelViews:(BOOL)a3 startPointForAnimation:(CGPoint)a4;
- (void)_updateLumaMeasurementViewFrame;
- (void)_updatePinchChainAppearance;
- (void)_updateSystemFiltersWithBackgroundLuminanceLevel:(unint64_t)a3;
- (void)animateToTapWithDuration:(double)a3;
- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4;
- (void)cancelCircularProgressAnimation;
- (void)clearAllFingersAnimated:(BOOL)a3 endPointForAnimation:(CGPoint)a4;
- (void)performCircularProgressAnimationOnFingersWithDuration:(double)a3 completion:(id)a4;
- (void)setAppearanceDelegate:(id)a3;
- (void)setFingerModels:(id)a3;
- (void)setPressedState:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldAnimatePress:(BOOL)a3;
- (void)setShouldSuppressFingerVisuals:(BOOL)a3;
- (void)showFingerModels:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5 shouldShowPinchChain:(BOOL)a6;
- (void)updateWithFingerModel:(id)a3 forFingerAtIndex:(unint64_t)a4;
@end

@implementation AXPIFingerContainerView

- (AXPIFingerContainerView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)AXPIFingerContainerView;
  v3 = -[AXPIFingerContainerView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    fingerViews = v3->_fingerViews;
    v3->_fingerViews = (NSMutableArray *)v4;

    objc_initWeak(&location, v3);
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    v7 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v8 = *MEMORY[0x263F831B8];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__AXPIFingerContainerView_initWithFrame___block_invoke;
    v11[3] = &unk_264D867A0;
    objc_copyWeak(&v12, &location);
    id v9 = (id)[v6 addObserverForName:v8 object:0 queue:v7 usingBlock:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __41__AXPIFingerContainerView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFingerModelViews:startPointForAnimation:", 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (BOOL)isPinchChainVisible
{
  return self->_pinchChainView != 0;
}

- (void)_updateFingerModelViews:(BOOL)a3 startPointForAnimation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v26 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  [(NSMutableArray *)self->_fingerViews enumerateObjectsUsingBlock:&__block_literal_global_7];
  v7 = [(UIView *)self->_viewForAnimatingAlpha subviews];
  [v7 enumerateObjectsUsingBlock:&__block_literal_global_270];

  [(NSMutableArray *)self->_fingerViews removeAllObjects];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(AXPIFingerContainerView *)self fingerModels];
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    char v11 = !v26;
    if (x != *MEMORY[0x263F00148]) {
      char v11 = 1;
    }
    if (y == *(double *)(MEMORY[0x263F00148] + 8)) {
      char v12 = v11;
    }
    else {
      char v12 = 1;
    }
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        objc_super v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v15 = [(AXPIFingerContainerView *)self appearanceDelegate];
        [v15 fingerWidth];
        double v17 = v16;

        [v14 location];
        if (v26)
        {
          double v19 = y;
          double v18 = x;
        }
        if ((v12 & 1) == 0) {
          objc_msgSend(v14, "location", v18, v19);
        }
        double v20 = v18 - v17 * 0.5;
        double v21 = v19 - v17 * 0.5;
        v22 = [AXPIFingerView alloc];
        v23 = [(AXPIFingerContainerView *)self appearanceDelegate];
        v24 = -[AXPIFingerView initWithFrame:appearanceDelegate:](v22, "initWithFrame:appearanceDelegate:", v23, v20, v21, v17, v17);

        -[AXPIFingerView setPressed:animated:](v24, "setPressed:animated:", [v14 isPressed], -[AXPIFingerContainerView shouldAnimatePress](self, "shouldAnimatePress"));
        -[AXPIFingerView setSelected:](v24, "setSelected:", [v14 isSelected]);
        [v14 force];
        -[AXPIFingerView setForce:](v24, "setForce:");
        [(UIView *)self->_viewForAnimatingAlpha addSubview:v24];
        [(NSMutableArray *)self->_fingerViews addObject:v24];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }
}

uint64_t __74__AXPIFingerContainerView__updateFingerModelViews_startPointForAnimation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

uint64_t __74__AXPIFingerContainerView__updateFingerModelViews_startPointForAnimation___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (void)showFingerModels:(id)a3 animated:(BOOL)a4 startPointForAnimation:(CGPoint)a5 shouldShowPinchChain:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a5.y;
  double x = a5.x;
  BOOL v9 = a4;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v11 = a3;
  char v12 = (_UILumaTrackingBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x263F83048]), "initWithTransitionBoundaries:delegate:frame:", self, 0.45, 0.55, 0.0, 0.0, 19.0, 19.0);
  pointerLumaMeasurementView = self->_pointerLumaMeasurementView;
  self->_pointerLumaMeasurementView = v12;

  [(_UILumaTrackingBackdropView *)self->_pointerLumaMeasurementView setPaused:1];
  [(_UILumaTrackingBackdropView *)self->_pointerLumaMeasurementView setHidden:1];
  [(AXPIFingerContainerView *)self addSubview:self->_pointerLumaMeasurementView];
  viewForAnimatingAlpha = self->_viewForAnimatingAlpha;
  if (viewForAnimatingAlpha) {
    [(UIView *)viewForAnimatingAlpha removeFromSuperview];
  }
  id v15 = objc_alloc(MEMORY[0x263F82E00]);
  [(AXPIFingerContainerView *)self bounds];
  double v16 = (UIView *)objc_msgSend(v15, "initWithFrame:");
  double v17 = self->_viewForAnimatingAlpha;
  self->_viewForAnimatingAlpha = v16;

  [(UIView *)self->_viewForAnimatingAlpha setAutoresizingMask:18];
  [(AXPIFingerContainerView *)self addSubview:self->_viewForAnimatingAlpha];
  [(AXPIFingerContainerView *)self setFingerModels:v11];
  BOOL v33 = v9;
  -[AXPIFingerContainerView _updateFingerModelViews:startPointForAnimation:](self, "_updateFingerModelViews:startPointForAnimation:", v9, x, y);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v19)
  {
    int v21 = 0;
    int v22 = 0;
    goto LABEL_17;
  }
  uint64_t v20 = v19;
  LOBYTE(v21) = 0;
  LOBYTE(v22) = 0;
  uint64_t v23 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v37 != v23) {
        objc_enumerationMutation(v18);
      }
      v25 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      if (v22)
      {
        int v22 = 1;
        if ((v21 & 1) == 0) {
          goto LABEL_10;
        }
      }
      else
      {
        int v22 = [*(id *)(*((void *)&v36 + 1) + 8 * i) isSelected];
        if ((v21 & 1) == 0)
        {
LABEL_10:
          int v21 = [v25 isPressed];
          continue;
        }
      }
      int v21 = 1;
    }
    uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v20);
LABEL_17:

  if (v6)
  {
    pinchChainView = self->_pinchChainView;
    if (pinchChainView) {
      [(AXPIPinchChainView *)pinchChainView removeFromSuperview];
    }
    long long v27 = objc_alloc_init(AXPIPinchChainView);
    long long v28 = self->_pinchChainView;
    self->_pinchChainView = v27;

    long long v29 = [(AXPIFingerContainerView *)self appearanceDelegate];
    [(AXPIPinchChainView *)self->_pinchChainView setAppearanceDelegate:v29];

    [(UIView *)self->_viewForAnimatingAlpha addSubview:self->_pinchChainView];
    if ([v18 count] == 2)
    {
      long long v30 = [v18 objectAtIndexedSubscript:0];
      [v30 location];
      -[AXPIPinchChainView setStartPoint:](self->_pinchChainView, "setStartPoint:");

      v31 = [v18 objectAtIndexedSubscript:1];
      [v31 location];
      -[AXPIPinchChainView setEndPoint:](self->_pinchChainView, "setEndPoint:");

      [(AXPIFingerContainerView *)self _updatePinchChainAppearance];
    }
  }
  if (+[AXPIFingerUtilities laserEnabled])
  {
    [(AXPIFingerContainerView *)self _updateLumaMeasurementViewFrame];
    [(AXPIFingerContainerView *)self _updateSystemFiltersWithBackgroundLuminanceLevel:0];
    [(AXPIFingerContainerView *)self setPressedState:v22 | v21 animated:0];
  }
  if ([(AXPIFingerContainerView *)self shouldSuppressFingerVisuals])
  {
    [(UIView *)self->_viewForAnimatingAlpha setAlpha:0.0];
  }
  else if (v33)
  {
    [(UIView *)self->_viewForAnimatingAlpha setAlpha:0.0];
    uint64_t v32 = (void *)MEMORY[0x263F82E00];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __97__AXPIFingerContainerView_showFingerModels_animated_startPointForAnimation_shouldShowPinchChain___block_invoke;
    v34[3] = &unk_264D863F0;
    v34[4] = self;
    id v35 = v18;
    [v32 animateWithDuration:v34 animations:0.25];
  }
}

uint64_t __97__AXPIFingerContainerView_showFingerModels_animated_startPointForAnimation_shouldShowPinchChain___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __97__AXPIFingerContainerView_showFingerModels_animated_startPointForAnimation_shouldShowPinchChain___block_invoke_2;
  v4[3] = &unk_264D86668;
  v2 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v4];
  [*(id *)(*(void *)(a1 + 32) + 432) setHidden:0];
  return [*(id *)(*(void *)(a1 + 32) + 432) setPaused:0];
}

void __97__AXPIFingerContainerView_showFingerModels_animated_startPointForAnimation_shouldShowPinchChain___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 408);
  id v5 = a2;
  id v6 = [v4 objectAtIndexedSubscript:a3];
  [v5 location];

  [v6 setFrame:_frameCenteredAroundPointForView(v6)];
}

- (void)setShouldSuppressFingerVisuals:(BOOL)a3
{
  if (self->_shouldSuppressFingerVisuals != a3)
  {
    BOOL v3 = a3;
    self->_shouldSuppressFingerVisuals = a3;
    double v5 = 1.0;
    if (a3) {
      double v5 = 0.0;
    }
    [(UIView *)self->_viewForAnimatingAlpha setAlpha:v5];
    [(_UILumaTrackingBackdropView *)self->_pointerLumaMeasurementView setHidden:v3];
    pointerLumaMeasurementView = self->_pointerLumaMeasurementView;
    [(_UILumaTrackingBackdropView *)pointerLumaMeasurementView setPaused:v3];
  }
}

- (void)clearAllFingersAnimated:(BOOL)a3 endPointForAnimation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  BOOL v6 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void *)[(NSMutableArray *)self->_fingerViews copy];
  [(NSMutableArray *)self->_fingerViews removeAllObjects];
  [(AXPIPinchChainView *)self->_pinchChainView removeFromSuperview];
  pinchChainView = self->_pinchChainView;
  self->_pinchChainView = 0;

  uint64_t v10 = self->_viewForAnimatingAlpha;
  viewForAnimatingAlpha = self->_viewForAnimatingAlpha;
  self->_viewForAnimatingAlpha = 0;

  [(_UILumaTrackingBackdropView *)self->_pointerLumaMeasurementView removeFromSuperview];
  pointerLumaMeasurementView = self->_pointerLumaMeasurementView;
  self->_pointerLumaMeasurementView = 0;

  if (v6)
  {
    v13 = (void *)MEMORY[0x263F82E00];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __72__AXPIFingerContainerView_clearAllFingersAnimated_endPointForAnimation___block_invoke;
    v25[3] = &unk_264D867E8;
    BOOL v26 = v10;
    id v27 = v8;
    CGFloat v28 = x;
    CGFloat v29 = y;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __72__AXPIFingerContainerView_clearAllFingersAnimated_endPointForAnimation___block_invoke_2;
    v23[3] = &unk_264D86708;
    v24 = v26;
    [v13 animateWithDuration:v25 animations:v23 completion:0.25];

    objc_super v14 = v26;
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v14 = v8;
    uint64_t v15 = [(UIView *)v14 countByEnumeratingWithState:&v19 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "removeFromSuperview", (void)v19);
        }
        while (v16 != v18);
        uint64_t v16 = [(UIView *)v14 countByEnumeratingWithState:&v19 objects:v30 count:16];
      }
      while (v16);
    }
  }
}

void __72__AXPIFingerContainerView_clearAllFingersAnimated_endPointForAnimation___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setAlpha:0.0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    double v6 = *MEMORY[0x263F00148];
    double v7 = *(double *)(MEMORY[0x263F00148] + 8);
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        if (*(double *)(a1 + 48) != v6 || *(double *)(a1 + 56) != v7)
        {
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          double v11 = _frameCenteredAroundPointForView(v10);
          objc_msgSend(v10, "setFrame:", v11, (void)v12);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

uint64_t __72__AXPIFingerContainerView_clearAllFingersAnimated_endPointForAnimation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (unint64_t)indexOfFingerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v6 = self->_fingerViews;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "convertPoint:fromView:", self, x, y, (void)v14);
        if (objc_msgSend(v11, "pointInside:withEvent:", 0))
        {
          unint64_t v12 = [(NSMutableArray *)self->_fingerViews indexOfObject:v11];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v12;
}

- (void)updateWithFingerModel:(id)a3 forFingerAtIndex:(unint64_t)a4
{
  id v11 = a3;
  double v6 = [(NSMutableArray *)self->_fingerViews objectAtIndexedSubscript:a4];
  int v7 = [v6 isPressed];
  int v8 = [v6 isSelected];
  [v11 location];
  [v6 setFrame:_frameCenteredAroundPointForView(v6)];
  objc_msgSend(v6, "setPressed:animated:", objc_msgSend(v11, "isPressed"), -[AXPIFingerContainerView shouldAnimatePress](self, "shouldAnimatePress"));
  objc_msgSend(v6, "setSelected:", objc_msgSend(v11, "isSelected"));
  [v11 force];
  objc_msgSend(v6, "setForce:");
  objc_msgSend(v6, "setShape:", objc_msgSend(v11, "shape"));
  if (self->_pinchChainView)
  {
    [v11 location];
    pinchChainView = self->_pinchChainView;
    if (a4) {
      -[AXPIPinchChainView setEndPoint:](pinchChainView, "setEndPoint:");
    }
    else {
      -[AXPIPinchChainView setStartPoint:](pinchChainView, "setStartPoint:");
    }
    [(AXPIFingerContainerView *)self _updatePinchChainAppearance];
  }
  if (v7 != [v6 isPressed] || v8 != objc_msgSend(v6, "isSelected"))
  {
    if ([v6 isPressed]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = [v6 isSelected];
    }
    [(AXPIFingerContainerView *)self setPressedState:v10 animated:1];
  }
  [(AXPIFingerContainerView *)self _updateLumaMeasurementViewFrame];
}

- (void)setPressedState:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (+[AXPIFingerUtilities laserEnabled])
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __52__AXPIFingerContainerView_setPressedState_animated___block_invoke;
    v18[3] = &unk_264D865E0;
    BOOL v19 = a3;
    v18[4] = self;
    int v7 = (void *)MEMORY[0x23EC9D040](v18);
    int v8 = v7;
    uint64_t v9 = (void *)MEMORY[0x263F82E00];
    if (v4)
    {
      uint64_t v10 = +[AXPIFingerUtilities pointerAnimationSettings];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __52__AXPIFingerContainerView_setPressedState_animated___block_invoke_2;
      v16[3] = &unk_264D86518;
      id v11 = &v17;
      long long v17 = v8;
      id v12 = v8;
      [v9 _animateUsingSpringBehavior:v10 tracking:0 animations:v16 completion:0];
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __52__AXPIFingerContainerView_setPressedState_animated___block_invoke_3;
      v14[3] = &unk_264D86518;
      id v11 = &v15;
      long long v15 = v7;
      id v13 = v7;
      [v9 _performWithoutRetargetingAnimations:v14];
    }
  }
}

void *__52__AXPIFingerContainerView_setPressedState_animated___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) appearanceDelegate];
  BOOL v4 = v3;
  if (v2) {
    [v3 pressedScale];
  }
  else {
    [v3 unpressedScale];
  }
  CGFloat v6 = v5;

  int v7 = *(unsigned __int8 *)(a1 + 40);
  int v8 = [*(id *)(a1 + 32) appearanceDelegate];
  uint64_t v9 = v8;
  if (v7) {
    [v8 pressedAlpha];
  }
  else {
    [v8 unpressedAlpha];
  }
  double v11 = v10;

  long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v30.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v30.c = v12;
  *(_OWORD *)&v30.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformMakeScale(&v30, v6, v6);
  int v13 = [*(id *)(a1 + 32) isPinchChainVisible];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = *(id *)(*(void *)(a1 + 32) + 408);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v21 = [v20 filterLayer];
        float v18 = v11;
        *(float *)&double v22 = v18;
        [v21 setOpacity:v22];

        if ((v13 & 1) == 0)
        {
          CGAffineTransform v25 = v30;
          [v20 setTransform:&v25];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v16);
  }

  result = *(void **)(*(void *)(a1 + 32) + 424);
  if (result) {
    result = (void *)[result setAlpha:v11];
  }
  if (v13)
  {
    v24 = *(void **)(*(void *)(a1 + 32) + 416);
    CGAffineTransform v25 = v30;
    return (void *)[v24 setTransform:&v25];
  }
  return result;
}

uint64_t __52__AXPIFingerContainerView_setPressedState_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__AXPIFingerContainerView_setPressedState_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateSystemFiltersWithBackgroundLuminanceLevel:(unint64_t)a3
{
  if (+[AXPIFingerUtilities laserEnabled])
  {
    double v5 = [(AXPIFingerContainerView *)self appearanceDelegate];
    int v6 = [v5 useSystemFilters];

    if (v6)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __76__AXPIFingerContainerView__updateSystemFiltersWithBackgroundLuminanceLevel___block_invoke;
      v10[3] = &unk_264D86810;
      v10[4] = self;
      v10[5] = a3;
      int v7 = (void *)MEMORY[0x23EC9D040](v10);
      int v8 = (void *)MEMORY[0x263F82E00];
      uint64_t v9 = +[AXPIFingerUtilities pointerAnimationSettings];
      [v8 _animateUsingSpringBehavior:v9 tracking:0 animations:v7 completion:0];
    }
  }
}

void __76__AXPIFingerContainerView__updateSystemFiltersWithBackgroundLuminanceLevel___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = +[AXPIFingerUtilities pointerFiltersForLuminanceLevel:*(void *)(a1 + 40)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 408);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "filterLayer", (void)v10);
        [v8 setFilters:v2];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 424) layer];
  [v9 setFilters:v2];
}

- (void)_updateLumaMeasurementViewFrame
{
  if ([(NSMutableArray *)self->_fingerViews count])
  {
    id v3 = [(NSMutableArray *)self->_fingerViews objectAtIndexedSubscript:0];
    [v3 frame];
    double x = v4;
    double y = v6;
    double width = v8;
    double height = v10;

    if ((unint64_t)[(NSMutableArray *)self->_fingerViews count] >= 2)
    {
      unint64_t v12 = 1;
      do
      {
        long long v13 = [(NSMutableArray *)self->_fingerViews objectAtIndexedSubscript:v12];
        [v13 frame];
        v22.origin.double x = v14;
        v22.origin.double y = v15;
        v22.size.double width = v16;
        v22.size.double height = v17;
        v20.origin.double x = x;
        v20.origin.double y = y;
        v20.size.double width = width;
        v20.size.double height = height;
        CGRect v21 = CGRectUnion(v20, v22);
        double x = v21.origin.x;
        double y = v21.origin.y;
        double width = v21.size.width;
        double height = v21.size.height;

        ++v12;
      }
      while (v12 < [(NSMutableArray *)self->_fingerViews count]);
    }
  }
  else
  {
    double width = 19.0;
    double x = 0.0;
    double y = 0.0;
    double height = 19.0;
  }
  pointerLumaMeasurementView = self->_pointerLumaMeasurementView;
  -[_UILumaTrackingBackdropView setFrame:](pointerLumaMeasurementView, "setFrame:", x, y, width, height);
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
}

- (void)_updatePinchChainAppearance
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  double x = *MEMORY[0x263F001A0];
  double y = *(double *)(MEMORY[0x263F001A0] + 8);
  double width = *(double *)(MEMORY[0x263F001A0] + 16);
  double height = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_fingerViews;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    LOBYTE(v11) = 1;
    LOBYTE(v12) = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        CGFloat v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "frame", (void)v19);
        v27.origin.double x = v15;
        v27.origin.double y = v16;
        v27.size.double width = v17;
        v27.size.double height = v18;
        v25.origin.double x = x;
        v25.origin.double y = y;
        v25.size.double width = width;
        v25.size.double height = height;
        CGRect v26 = CGRectUnion(v25, v27);
        double x = v26.origin.x;
        double y = v26.origin.y;
        double width = v26.size.width;
        double height = v26.size.height;
        if (v12)
        {
          uint64_t v12 = [v14 isPressed];
          if ((v11 & 1) == 0) {
            goto LABEL_8;
          }
        }
        else
        {
          uint64_t v12 = 0;
          if ((v11 & 1) == 0)
          {
LABEL_8:
            uint64_t v11 = 0;
            continue;
          }
        }
        uint64_t v11 = [v14 isSelected];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (!v9) {
        goto LABEL_15;
      }
    }
  }
  uint64_t v11 = 1;
  uint64_t v12 = 1;
LABEL_15:

  -[AXPIPinchChainView setFrame:](self->_pinchChainView, "setFrame:", x, y, width, height);
  [(AXPIPinchChainView *)self->_pinchChainView setPressed:v12];
  [(AXPIPinchChainView *)self->_pinchChainView setSelected:v11];
}

- (CGRect)rectForFingersAtPoints:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    CGFloat v12 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v13 = *(double *)(MEMORY[0x263F001A8] + 24);
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v4);
        }
        CGPoint v15 = CGPointFromString((NSString *)*(void *)(*((void *)&v27 + 1) + 8 * v14));
        v38.origin.CGFloat x = v15.x;
        v38.origin.CGFloat y = v15.y;
        v33.origin.CGFloat x = x;
        v33.origin.CGFloat y = y;
        v33.size.CGFloat width = width;
        v33.size.CGFloat height = height;
        v38.size.CGFloat width = v12;
        v38.size.CGFloat height = v13;
        CGRect v34 = CGRectUnion(v33, v38);
        CGFloat x = v34.origin.x;
        CGFloat y = v34.origin.y;
        CGFloat width = v34.size.width;
        CGFloat height = v34.size.height;
        ++v14;
      }
      while (v10 != v14);
      uint64_t v10 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }
  CGFloat v16 = [(AXPIFingerContainerView *)self appearanceDelegate];
  [v16 fingerWidth];
  double v18 = v17;

  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGRect v36 = CGRectInset(v35, v18 * -0.5, v18 * -0.5);
  CGFloat v19 = v36.origin.x;
  CGFloat v20 = v36.origin.y;
  CGFloat v21 = v36.size.width;
  CGFloat v22 = v36.size.height;

  double v23 = v19;
  double v24 = v20;
  double v25 = v21;
  double v26 = v22;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (void)performCircularProgressAnimationOnFingersWithDuration:(double)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v13 = a4;
  [(AXPIFingerContainerView *)self cancelCircularProgressAnimation];
  double v6 = dispatch_group_create();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 1;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = self->_fingerViews;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        dispatch_group_enter(v6);
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __92__AXPIFingerContainerView_performCircularProgressAnimationOnFingersWithDuration_completion___block_invoke;
        v17[3] = &unk_264D86838;
        CGFloat v19 = v24;
        double v18 = v6;
        [v11 animateCircularProgressWithDuration:v17 completion:a3];
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__AXPIFingerContainerView_performCircularProgressAnimationOnFingersWithDuration_completion___block_invoke_2;
  block[3] = &unk_264D86860;
  id v15 = v13;
  CGFloat v16 = v24;
  block[4] = self;
  id v12 = v13;
  dispatch_group_notify(v6, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v24, 8);
}

void __92__AXPIFingerContainerView_performCircularProgressAnimationOnFingersWithDuration_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __92__AXPIFingerContainerView_performCircularProgressAnimationOnFingersWithDuration_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24));
  }
  char v3 = (void *)a1[4];
  return [v3 cancelCircularProgressAnimation];
}

- (void)cancelCircularProgressAnimation
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = self->_fingerViews;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "cancelExisingCircularProgressAnimation", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)animateToTapWithDuration:(double)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_fingerViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "animateToTapWithDuration:", a3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)shouldAnimatePress
{
  return self->_shouldAnimatePress;
}

- (void)setShouldAnimatePress:(BOOL)a3
{
  self->_shouldAnimatePress = a3;
}

- (BOOL)shouldSuppressFingerVisuals
{
  return self->_shouldSuppressFingerVisuals;
}

- (AXPIFingerAppearanceDelegate)appearanceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  return (AXPIFingerAppearanceDelegate *)WeakRetained;
}

- (void)setAppearanceDelegate:(id)a3
{
}

- (NSArray)fingerModels
{
  return self->_fingerModels;
}

- (void)setFingerModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerModels, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_storeStrong((id *)&self->_pointerLumaMeasurementView, 0);
  objc_storeStrong((id *)&self->_pinchChainView, 0);
  objc_storeStrong((id *)&self->_viewForAnimatingAlpha, 0);
  objc_storeStrong((id *)&self->_fingerViews, 0);
}

@end