@interface EDLensView
- (BOOL)_isScreenScaleEven;
- (BOOL)floatingMode;
- (BOOL)isAccessibilityElement;
- (BOOL)isActive;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGPoint)_lensViewLocalCenter;
- (CGPoint)centerOffsetAtTouchDown;
- (CGPoint)lastPosition;
- (EDLensView)initWithFrame:(CGRect)a3;
- (EDLensViewDelegate)delegate;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)dragItemsForInteraction:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)_lensPosition;
- (int64_t)interfaceOrientation;
- (unint64_t)accessibilityTraits;
- (void)_displayLinkFired;
- (void)_layoutStaticElements;
- (void)_updateLastPosition:(CGPoint)a3;
- (void)layoutSubviews;
- (void)presentAtLocation:(CGPoint)a3;
- (void)selectColor;
- (void)setActive:(BOOL)a3;
- (void)setCenterOffsetAtTouchDown:(CGPoint)a3;
- (void)setDelegate:(id)a3;
- (void)setFloatingMode:(BOOL)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setLastPosition:(CGPoint)a3;
- (void)updateCenterOffsetAtTouchDown:(CGPoint)a3;
- (void)updateLensViewWithEvent:(id)a3;
@end

@implementation EDLensView

- (id)dragItemsForInteraction:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F1C550];
  v4 = [a3 view];
  v5 = [v4 layer];
  v6 = objc_msgSend(v3, "colorWithCGColor:", objc_msgSend(v5, "backgroundColor"));

  id v7 = objc_alloc(MEMORY[0x263F088E0]);
  v8 = (void *)MEMORY[0x263F00608];
  id v9 = v6;
  v10 = objc_msgSend(v8, "colorWithCGColor:", objc_msgSend(v9, "CGColor"));
  v11 = [v10 stringRepresentation];
  v12 = (void *)[v7 initWithObject:v11];

  v13 = (void *)[objc_alloc(MEMORY[0x263F1C5E0]) initWithItemProvider:v12];
  v16[0] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];

  return v14;
}

- (EDLensView)initWithFrame:(CGRect)a3
{
  v43.receiver = self;
  v43.super_class = (Class)EDLensView;
  v3 = -[EDLensView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x263F1C550] blackColor];
    uint64_t v5 = [v4 CGColor];
    v6 = [(EDLensView *)v3 layer];
    [v6 setShadowColor:v5];

    id v7 = [(EDLensView *)v3 layer];
    LODWORD(v8) = 1050253722;
    [v7 setShadowOpacity:v8];

    id v9 = [(EDLensView *)v3 layer];
    [v9 setShadowRadius:20.0];

    v10 = [(EDLensView *)v3 layer];
    objc_msgSend(v10, "setShadowOffset:", 0.0, 1.0);

    v11 = [(EDLensView *)v3 layer];
    [v11 setDisableUpdateMask:2];

    uint64_t v12 = objc_opt_new();
    hoverColorRingView = v3->_hoverColorRingView;
    v3->_hoverColorRingView = (UIView *)v12;

    v14 = [MEMORY[0x263F1C550] clearColor];
    [(UIView *)v3->_hoverColorRingView setBackgroundColor:v14];

    id v15 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v16 = [v15 CGColor];
    v17 = [(UIView *)v3->_hoverColorRingView layer];
    [v17 setBorderColor:v16];

    v18 = [(UIView *)v3->_hoverColorRingView layer];
    [v18 setBorderWidth:3.0];

    [(UIView *)v3->_hoverColorRingView setUserInteractionEnabled:0];
    [(EDLensView *)v3 addSubview:v3->_hoverColorRingView];
    uint64_t v19 = objc_opt_new();
    ringBorderView = v3->_ringBorderView;
    v3->_ringBorderView = (UIView *)v19;

    [(UIView *)v3->_ringBorderView setClipsToBounds:1];
    v21 = [(UIView *)v3->_ringBorderView layer];
    [v21 setBorderWidth:13.0];

    [(EDLensView *)v3 addSubview:v3->_ringBorderView];
    uint64_t v22 = objc_opt_new();
    screenshotSurfaceView = v3->_screenshotSurfaceView;
    v3->_screenshotSurfaceView = (UIView *)v22;

    [(UIView *)v3->_screenshotSurfaceView setClipsToBounds:1];
    uint64_t v24 = *MEMORY[0x263F15D28];
    v25 = [(UIView *)v3->_screenshotSurfaceView layer];
    [v25 setMagnificationFilter:v24];

    [(UIView *)v3->_screenshotSurfaceView setUserInteractionEnabled:0];
    [(EDLensView *)v3 addSubview:v3->_screenshotSurfaceView];
    v26 = [[EDGridView alloc] initWithWithCellCount:9];
    gridView = v3->_gridView;
    v3->_gridView = v26;

    [(EDGridView *)v3->_gridView setClipsToBounds:1];
    v28 = [(EDGridView *)v3->_gridView layer];
    [v28 setBorderWidth:5.0];

    v29 = [MEMORY[0x263F1C550] clearColor];
    [(EDGridView *)v3->_gridView setBackgroundColor:v29];

    v30 = [(EDGridView *)v3->_gridView layer];
    [v30 setMagnificationFilter:v24];

    [(EDGridView *)v3->_gridView setUserInteractionEnabled:0];
    [(EDLensView *)v3 addSubview:v3->_gridView];
    uint64_t v31 = objc_opt_new();
    hoverColorCenterView = v3->_hoverColorCenterView;
    v3->_hoverColorCenterView = (UIView *)v31;

    v33 = [(UIView *)v3->_hoverColorCenterView layer];
    [v33 setBorderWidth:4.0];

    [(UIView *)v3->_hoverColorCenterView _setContinuousCornerRadius:2.0];
    [(EDLensView *)v3 addSubview:v3->_hoverColorCenterView];
    uint64_t v34 = objc_opt_new();
    colorAnalyzer = v3->_colorAnalyzer;
    v3->_colorAnalyzer = (EDColorAnalyzer *)v34;

    uint64_t v36 = [MEMORY[0x263F15780] displayLinkWithTarget:v3 selector:sel__displayLinkFired];
    displayLink = v3->_displayLink;
    v3->_displayLink = (CADisplayLink *)v36;

    v38 = v3->_displayLink;
    v39 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [(CADisplayLink *)v38 addToRunLoop:v39 forMode:*MEMORY[0x263EFF588]];

    [(CADisplayLink *)v3->_displayLink setPaused:1];
    uint64_t v40 = [objc_alloc(MEMORY[0x263F1C878]) initWithDelegate:v3];
    pointerInteraction = v3->_pointerInteraction;
    v3->_pointerInteraction = (UIPointerInteraction *)v40;

    [(EDLensView *)v3 addInteraction:v3->_pointerInteraction];
  }
  return v3;
}

- (void)_layoutStaticElements
{
  [(EDLensView *)self bounds];
  CGRect v28 = CGRectInset(v27, 70.0, 70.0);
  -[UIView setFrame:](self->_ringBorderView, "setFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
  [(UIView *)self->_ringBorderView bounds];
  CGFloat v3 = CGRectGetWidth(v29) * 0.5;
  id v4 = [(UIView *)self->_ringBorderView layer];
  [v4 setCornerRadius:v3];

  [(EDLensView *)self bounds];
  CGRect v31 = CGRectInset(v30, 83.0, 83.0);
  -[UIView setFrame:](self->_screenshotSurfaceView, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
  [(UIView *)self->_screenshotSurfaceView bounds];
  CGFloat v5 = CGRectGetWidth(v32) * 0.5;
  v6 = [(UIView *)self->_screenshotSurfaceView layer];
  [v6 setCornerRadius:v5];

  [(EDLensView *)self bounds];
  CGRect v34 = CGRectInset(v33, 82.0, 82.0);
  -[EDGridView setFrame:](self->_gridView, "setFrame:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
  [(UIView *)self->_screenshotSurfaceView bounds];
  CGFloat v7 = CGRectGetWidth(v35) * 0.5;
  double v8 = [(EDGridView *)self->_gridView layer];
  [v8 setCornerRadius:v7];

  [(UIView *)self->_screenshotSurfaceView bounds];
  CGFloat v9 = CGRectGetWidth(v36) / 9.0;
  v10 = [(UIView *)self->_hoverColorCenterView layer];
  [v10 borderWidth];
  double v12 = v11;

  -[UIView setFrame:](self->_hoverColorCenterView, "setFrame:", -v12, -v12, v9 + v12, v9 + v12);
  [(UIView *)self->_ringBorderView center];
  -[UIView setCenter:](self->_hoverColorCenterView, "setCenter:");
  double v13 = 0.4;
  if (self->_hoverColorBrightness <= 0.9) {
    double v13 = 1.0;
  }
  id v25 = [MEMORY[0x263F1C550] colorWithWhite:v13 alpha:0.7];
  double v14 = 0.6;
  if (self->_hoverColorBrightness <= 0.9) {
    double v14 = 1.0;
  }
  id v15 = [MEMORY[0x263F1C550] colorWithWhite:v14 alpha:1.0];
  ColorUIColor(self->_hoverColor.r, self->_hoverColor.g, self->_hoverColor.b);
  id v16 = objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 CGColor];
  v18 = [(UIView *)self->_ringBorderView layer];
  [v18 setBorderColor:v17];

  id v19 = v15;
  uint64_t v20 = [v19 CGColor];
  v21 = [(UIView *)self->_hoverColorCenterView layer];
  [v21 setBorderColor:v20];

  [(EDGridView *)self->_gridView setStrokeColor:v25];
  id v22 = v19;
  uint64_t v23 = [v22 CGColor];
  uint64_t v24 = [(EDGridView *)self->_gridView layer];
  [v24 setBorderColor:v23];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)EDLensView;
  [(EDLensView *)&v3 layoutSubviews];
  [(EDLensView *)self _layoutStaticElements];
  -[EDLensView setCenter:](self, "setCenter:", self->_lastPosition.x, self->_lastPosition.y);
  [(EDLensView *)self setAlpha:(double)[(EDLensView *)self isActive]];
}

- (CGPoint)_lensViewLocalCenter
{
  [(UIView *)self->_screenshotSurfaceView center];
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)accessibilityLabel
{
  return @"Eyedropper hovering over color";
}

- (id)accessibilityValue
{
  return (id)[NSString stringWithFormat:@"RGB value is R: %.2f., G: %.2f., B: %.2f.", *(void *)&self->_hoverColor.r, *(void *)&self->_hoverColor.g, *(void *)&self->_hoverColor.b];
}

- (unint64_t)accessibilityTraits
{
  if (*MEMORY[0x263F1CF68]) {
    BOOL v2 = *MEMORY[0x263F1CEE8] == 0;
  }
  else {
    BOOL v2 = 1;
  }
  return !v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  if (self->_interfaceOrientation != a3) {
    self->_interfaceOrientation = a3;
  }
}

- (void)updateCenterOffsetAtTouchDown:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(EDLensView *)self floatingMode])
  {
    p_centerOffsetAtTouchDown = &self->_centerOffsetAtTouchDown;
LABEL_6:
    p_centerOffsetAtTouchDown->double x = 0.0;
    p_centerOffsetAtTouchDown->double y = 0.0;
    return;
  }
  -[UIView convertPoint:fromView:](self->_hoverColorCenterView, "convertPoint:fromView:", 0, x, y);
  p_centerOffsetAtTouchDown = &self->_centerOffsetAtTouchDown;
  self->_centerOffsetAtTouchDown.double x = v7;
  self->_centerOffsetAtTouchDown.double y = v8;
  [(EDLensView *)self size];
  if (fabs(self->_centerOffsetAtTouchDown.x) >= v10 * 0.5 || fabs(self->_centerOffsetAtTouchDown.y) >= v9 * 0.5) {
    goto LABEL_6;
  }
}

- (void)_updateLastPosition:(CGPoint)a3
{
  self->_lastPosition = a3;
  [(EDLensView *)self setNeedsLayout];
}

- (void)presentAtLocation:(CGPoint)a3
{
  -[EDLensView _updateLastPosition:](self, "_updateLastPosition:", a3.x, a3.y);
  [(EDLensView *)self layoutIfNeeded];
  [(CADisplayLink *)self->_displayLink setPaused:0];

  [(EDLensView *)self setNeedsLayout];
}

- (void)selectColor
{
  id v4 = [(EDLensView *)self delegate];
  double v3 = ColorUIColor(self->_hoverColor.r, self->_hoverColor.g, self->_hoverColor.b);
  [v4 lensView:self didSelectColor:v3];
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    displayLink = self->_displayLink;
    if (a3)
    {
      [(CADisplayLink *)displayLink setPaused:0];
      CGFloat v5 = [(EDLensView *)self delegate];
      [v5 lensViewDidActivate:self];
    }
    else
    {
      [(CADisplayLink *)displayLink setPaused:1];
    }
    [(EDLensView *)self setNeedsLayout];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __24__EDLensView_setActive___block_invoke;
    v6[3] = &unk_264CFF310;
    v6[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v6 usingSpringWithDamping:0 initialSpringVelocity:0.2 options:0.0 animations:1.0 completion:0.0];
  }
}

uint64_t __24__EDLensView_setActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)updateLensViewWithEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        double v10 = [(EDLensView *)self window];
        [v9 locationInView:v10];
        double v12 = v11;
        double v14 = v13;

        -[EDLensView _updateLastPosition:](self, "_updateLastPosition:", v12 - self->_centerOffsetAtTouchDown.x, v14 - self->_centerOffsetAtTouchDown.y);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (BOOL)_isScreenScaleEven
{
  BOOL v2 = [(EDLensView *)self window];
  double v3 = [v2 screen];
  [v3 scale];
  BOOL v5 = ((int)v4 & 1) == 0;

  return v5;
}

- (void)_displayLinkFired
{
  v43[7] = *MEMORY[0x263EF8340];
  double v3 = [(EDLensView *)self window];
  double v4 = [v3 screen];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263F1C920] mainScreen];
  }
  uint64_t v7 = v6;

  [v7 scale];
  double v9 = v8;
  double v10 = [(EDLensView *)self layer];
  double v11 = [v10 presentationLayer];
  [v11 frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v44.origin.double x = v13;
  v44.origin.double y = v15;
  v44.size.width = v17;
  v44.size.height = v19;
  double MidX = CGRectGetMidX(v44);
  v45.origin.double x = v13;
  v45.origin.double y = v15;
  v45.size.width = v17;
  v45.size.height = v19;
  CGFloat MidY = CGRectGetMidY(v45);
  double v22 = 9.0 / v9 * 0.5;
  double v23 = MidX - v22;
  CGFloat v24 = MidY - v22;
  uint64_t v25 = *MEMORY[0x263F1D910];
  v43[0] = v7;
  uint64_t v26 = *MEMORY[0x263F1D8E0];
  v42[0] = v25;
  v42[1] = v26;
  CGRect v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "gamut"));
  uint64_t v28 = *MEMORY[0x263F1D8E8];
  v43[1] = v27;
  v43[2] = MEMORY[0x263EFFA88];
  uint64_t v29 = *MEMORY[0x263F1D8F0];
  v42[2] = v28;
  v42[3] = v29;
  CGRect v30 = [NSNumber numberWithDouble:v9];
  uint64_t v31 = *MEMORY[0x263F1D900];
  v43[3] = v30;
  v43[4] = &unk_26EAE9AF0;
  uint64_t v32 = *MEMORY[0x263F1D8F8];
  v42[4] = v31;
  v42[5] = v32;
  v43[5] = MEMORY[0x263EFFA80];
  v42[6] = *MEMORY[0x263F1D908];
  *(double *)v41 = v23;
  *(CGFloat *)&v41[1] = v24;
  *(double *)&v41[2] = 9.0 / v9;
  *(double *)&v41[3] = 9.0 / v9;
  CGRect v33 = [MEMORY[0x263F08D40] valueWithBytes:v41 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v43[6] = v33;
  CGRect v34 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:7];

  CGRect v35 = (__IOSurface *)_UIRenderDisplay();
  CGRect v36 = [(UIView *)self->_screenshotSurfaceView layer];
  [v36 setContents:v35];

  IOSurfaceLock(v35, 1u, 0);
  v37 = -[EDColorAnalyzer colorAtCenterOfSurface:offset:](self->_colorAnalyzer, "colorAtCenterOfSurface:offset:", v35, 0.0, 0.0);
  double v38 = ColorMakeWithColor(v37);
  self->_hoverColor.r = v38;
  self->_hoverColor.g = v39;
  self->_hoverColor.b = v40;
  self->_hoverColorBrightness = v39 * 0.59 + v38 * 0.3 + v40 * 0.11;
  IOSurfaceUnlock(v35, 1u, 0);
  [(EDLensView *)self setNeedsLayout];
}

uint64_t __31__EDLensView__displayLinkFired__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F06398](a2);
}

- (int64_t)_lensPosition
{
  [(EDLensView *)self frame];
  double MinY = CGRectGetMinY(v17);
  double v4 = [(EDLensView *)self superview];
  [v4 bounds];
  double v5 = CGRectGetMinY(v18);

  [(EDLensView *)self frame];
  double MaxY = CGRectGetMaxY(v19);
  uint64_t v7 = [(EDLensView *)self superview];
  [v7 bounds];
  double v8 = CGRectGetMaxY(v20);

  [(EDLensView *)self frame];
  double MinX = CGRectGetMinX(v21);
  double v10 = [(EDLensView *)self superview];
  [v10 bounds];
  double v11 = CGRectGetMinX(v22);

  [(EDLensView *)self frame];
  double MaxX = CGRectGetMaxX(v23);
  CGFloat v13 = [(EDLensView *)self superview];
  [v13 bounds];
  double v14 = CGRectGetMaxX(v24);

  if (MinY >= v5)
  {
    if (MaxY <= v8)
    {
      if (MinX >= v11) {
        return 2 * (MaxX > v14);
      }
      else {
        return 1;
      }
    }
    else if (MinX >= v11)
    {
      if (MaxX <= v14) {
        return 4;
      }
      else {
        return 8;
      }
    }
    else
    {
      return 7;
    }
  }
  else
  {
    int64_t v15 = 3;
    if (MaxX > v14) {
      int64_t v15 = 6;
    }
    if (MinX >= v11) {
      return v15;
    }
    else {
      return 5;
    }
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIView *)self->_ringBorderView frame];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  [(UIView *)self->_hoverColorCenterView frame];
  CGRect v9 = CGRectInset(v8, -10.0, -10.0);
  double v5 = (void *)MEMORY[0x263F1C888];

  return (id)objc_msgSend(v5, "regionWithRect:identifier:", @"CenterView", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263F1C890], "hiddenPointerStyle", a3, a4);
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (EDLensViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EDLensViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)floatingMode
{
  return self->_floatingMode;
}

- (void)setFloatingMode:(BOOL)a3
{
  self->_floatingMode = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (CGPoint)lastPosition
{
  double x = self->_lastPosition.x;
  double y = self->_lastPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastPosition:(CGPoint)a3
{
  self->_lastPosition = a3;
}

- (CGPoint)centerOffsetAtTouchDown
{
  double x = self->_centerOffsetAtTouchDown.x;
  double y = self->_centerOffsetAtTouchDown.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenterOffsetAtTouchDown:(CGPoint)a3
{
  self->_centerOffsetAtTouchDown = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_colorAnalyzer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_ringBorderView, 0);
  objc_storeStrong((id *)&self->_screenshotSurfaceView, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_hoverColorRingView, 0);

  objc_storeStrong((id *)&self->_hoverColorCenterView, 0);
}

@end