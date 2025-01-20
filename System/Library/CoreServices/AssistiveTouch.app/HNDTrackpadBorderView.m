@interface HNDTrackpadBorderView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)pointOnBorder:(CGPoint)a3;
- (BOOL)pointOnBottomBorder:(CGPoint)a3;
- (BOOL)pointOnLeftBorder:(CGPoint)a3;
- (BOOL)pointOnRightBorder:(CGPoint)a3;
- (BOOL)pointOnTopBorder:(CGPoint)a3;
- (BOOL)pointOnTopLeftCorner:(CGPoint)a3;
- (BOOL)pointWithinBounds:(CGPoint)a3 minX:(double)a4 maxX:(double)a5 minY:(double)a6 maxY:(double)a7;
- (HNDTrackpadBorderView)initWithFrame:(CGRect)a3 trackpadView:(id)a4;
- (HNDTrackpadEventManager)eventManager;
- (UIColor)borderColor;
- (UIPanGestureRecognizer)moveGestureRecognizer;
- (UIPanGestureRecognizer)pointerMoveGestureRecognizer;
- (double)borderOpacity;
- (double)borderWidth;
- (id)getInitialResizeIcon:(double)a3;
- (id)getTrackpadColor;
- (void)changeLeftBorderHeight:(CGPoint)a3;
- (void)changeTopBorderHeight:(CGPoint)a3;
- (void)handleMove:(id)a3;
- (void)handlePointerMove:(id)a3;
- (void)handleTap:(id)a3;
- (void)initSettings;
- (void)registerForSettingsUpdates;
- (void)resizeTrackpadWithDelta:(CGPoint)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderOpacity:(double)a3;
- (void)setBorderWidth:(double)a3;
- (void)setEventManager:(id)a3;
- (void)setMoveGestureRecognizer:(id)a3;
- (void)setPointerMoveGestureRecognizer:(id)a3;
- (void)setUpGestureRecognizers;
- (void)showResizeIcon:(BOOL)a3;
- (void)updateResizeIcon;
- (void)updateTrackpadBorderWidth;
- (void)updateTrackpadFrameLayer;
@end

@implementation HNDTrackpadBorderView

- (HNDTrackpadBorderView)initWithFrame:(CGRect)a3 trackpadView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = (HNDTrackpadView *)a4;
  v24.receiver = self;
  v24.super_class = (Class)HNDTrackpadBorderView;
  v10 = -[HNDTrackpadBorderView initWithFrame:](&v24, "initWithFrame:", x, y, width, height);
  v11 = +[UIColor clearColor];
  [(HNDTrackpadBorderView *)v10 setBackgroundColor:v11];

  id v12 = +[UIColor blackColor];
  id v13 = [v12 CGColor];
  v14 = [(HNDTrackpadBorderView *)v10 layer];
  [v14 setBorderColor:v13];

  v15 = [(HNDTrackpadBorderView *)v10 layer];
  [v15 setBorderWidth:1.0];

  v16 = [(HNDTrackpadBorderView *)v10 layer];
  [v16 setCornerRadius:11.0];

  [(HNDTrackpadBorderView *)v10 setUserInteractionEnabled:1];
  [(HNDTrackpadBorderView *)v10 initSettings];
  trackpadView = v10->_trackpadView;
  v10->_trackpadView = v9;
  v18 = v9;

  uint64_t v19 = [(HNDTrackpadBorderView *)v10 getInitialResizeIcon:v10->_borderWidth];
  resizeIcon = v10->_resizeIcon;
  v10->_resizeIcon = (UIImageView *)v19;

  [(HNDTrackpadBorderView *)v10 frame];
  v10->_minWidth = v21;
  [(HNDTrackpadBorderView *)v10 frame];
  v10->_minHeight = v22;
  [(HNDTrackpadBorderView *)v10 addSubview:v10->_trackpadView];
  [(HNDTrackpadBorderView *)v10 updateTrackpadFrameLayer];
  [(HNDTrackpadBorderView *)v10 addSubview:v10->_resizeIcon];

  [(HNDTrackpadBorderView *)v10 setUpGestureRecognizers];
  [(HNDTrackpadBorderView *)v10 registerForSettingsUpdates];
  return v10;
}

- (void)initSettings
{
  v3 = [(HNDTrackpadBorderView *)self getTrackpadColor];
  [(HNDTrackpadBorderView *)self setBorderColor:v3];

  v4 = +[AXSettings sharedInstance];
  [v4 assistiveTouchVirtualTrackpadBorderWidth];
  -[HNDTrackpadBorderView setBorderWidth:](self, "setBorderWidth:");

  id v5 = +[AXSettings sharedInstance];
  [v5 assistiveTouchVirtualTrackpadBorderOpacity];
  -[HNDTrackpadBorderView setBorderOpacity:](self, "setBorderOpacity:");
}

- (void)registerForSettingsUpdates
{
  objc_initWeak(&location, self);
  v3 = +[AXSettings sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A61D4;
  v10[3] = &unk_1001AAA68;
  objc_copyWeak(&v11, &location);
  [v3 registerUpdateBlock:v10 forRetrieveSelector:"assistiveTouchVirtualTrackpadBorderColor" withListener:self];

  objc_destroyWeak(&v11);
  v4 = +[AXSettings sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A6260;
  v8[3] = &unk_1001AAA68;
  objc_copyWeak(&v9, &location);
  [v4 registerUpdateBlock:v8 forRetrieveSelector:"assistiveTouchVirtualTrackpadBorderOpacity" withListener:self];

  objc_destroyWeak(&v9);
  id v5 = +[AXSettings sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A62F8;
  v6[3] = &unk_1001AAA68;
  objc_copyWeak(&v7, &location);
  [v5 registerUpdateBlock:v6 forRetrieveSelector:"assistiveTouchVirtualTrackpadBorderWidth" withListener:self];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)getInitialResizeIcon:(double)a3
{
  v4 = +[UIImage systemImageNamed:@"arrow.up.backward.and.arrow.down.forward"];
  id v5 = [objc_alloc((Class)UIImageView) initWithImage:v4];
  objc_msgSend(v5, "setFrame:", a3 / 2.5, a3 / 2.5, a3 * 0.5, a3 * 0.5);
  v6 = +[UIColor whiteColor];
  [v5 setTintColor:v6];

  return v5;
}

- (void)setUpGestureRecognizers
{
  id v5 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
  [(HNDTrackpadBorderView *)self addGestureRecognizer:v5];
  id v3 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"handleMove:"];
  [v3 setMaximumNumberOfTouches:1];
  [(HNDTrackpadBorderView *)self setMoveGestureRecognizer:v3];
  [(HNDTrackpadBorderView *)self addGestureRecognizer:v3];
  id v4 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"handlePointerMove:"];
  [v4 setMinimumNumberOfTouches:2];
  [v4 setMaximumNumberOfTouches:2];
  [(HNDTrackpadBorderView *)self setPointerMoveGestureRecognizer:v4];
  [(HNDTrackpadBorderView *)self addGestureRecognizer:v4];
}

- (void)handleTap:(id)a3
{
  p_eventManager = &self->_eventManager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_eventManager);
  [WeakRetained handleTrackpadBorderTap:v4 moveAmount:20.0];
}

- (void)handleMove:(id)a3
{
  p_eventManager = &self->_eventManager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_eventManager);
  [WeakRetained handleMoveTrackpadBorder:v4];
}

- (void)handlePointerMove:(id)a3
{
  p_eventManager = &self->_eventManager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_eventManager);
  [WeakRetained handlePointerMoveTrackpadBorder:v4];
}

- (void)updateTrackpadFrameLayer
{
  trackpadFrameLayer = self->_trackpadFrameLayer;
  if (trackpadFrameLayer) {
    [(CAShapeLayer *)trackpadFrameLayer removeFromSuperlayer];
  }
  [(HNDTrackpadBorderView *)self bounds];
  id v4 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  [(HNDTrackpadView *)self->_trackpadView frame];
  id v5 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  [v4 appendPath:v5];
  [v4 setUsesEvenOddFillRule:1];
  v6 = +[CAShapeLayer layer];
  id v10 = v4;
  -[CAShapeLayer setPath:](v6, "setPath:", [v10 CGPath]);
  [(CAShapeLayer *)v6 setFillRule:kCAFillRuleEvenOdd];
  id v7 = [(UIColor *)self->_borderColor colorWithAlphaComponent:self->_borderOpacity];
  -[CAShapeLayer setFillColor:](v6, "setFillColor:", [v7 CGColor]);

  v8 = [(HNDTrackpadBorderView *)self layer];
  [v8 insertSublayer:v6 atIndex:0];

  id v9 = self->_trackpadFrameLayer;
  self->_trackpadFrameLayer = v6;
}

- (void)updateTrackpadBorderWidth
{
  double borderWidth = self->_borderWidth;
  [(HNDTrackpadBorderView *)self frame];
  double v5 = v4 + self->_borderWidth * -2.0;
  [(HNDTrackpadBorderView *)self frame];
  trackpadView = self->_trackpadView;
  double v8 = v7 + self->_borderWidth * -2.0;

  -[HNDTrackpadView setFrame:](trackpadView, "setFrame:", borderWidth, borderWidth, v5, v8);
}

- (void)updateResizeIcon
{
}

- (void)showResizeIcon:(BOOL)a3
{
  if (a3) {
    [(HNDTrackpadBorderView *)self addSubview:self->_resizeIcon];
  }
  else {
    [(UIImageView *)self->_resizeIcon removeFromSuperview];
  }
}

- (void)resizeTrackpadWithDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[HNDTrackpadBorderView changeTopBorderHeight:](self, "changeTopBorderHeight:");

  -[HNDTrackpadBorderView changeLeftBorderHeight:](self, "changeLeftBorderHeight:", x, y);
}

- (void)changeTopBorderHeight:(CGPoint)a3
{
  double y = a3.y;
  [(HNDTrackpadBorderView *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(HNDTrackpadView *)self->_trackpadView frame];
  double v13 = v12 - y;
  if (v13 >= self->_minHeight)
  {
    double v14 = y + v8;
    if (v14 >= 0.0)
    {
      -[HNDTrackpadView setFrame:](self->_trackpadView, "setFrame:");
      -[HNDTrackpadBorderView setFrame:](self, "setFrame:", v6, v14, v10, v13);
      [(HNDTrackpadBorderView *)self updateTrackpadFrameLayer];
    }
  }
}

- (void)changeLeftBorderHeight:(CGPoint)a3
{
  double x = a3.x;
  [(HNDTrackpadBorderView *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(HNDTrackpadView *)self->_trackpadView frame];
  double v13 = v10 - x;
  if (v13 >= self->_minWidth)
  {
    double v14 = x + v6;
    if (v14 >= 0.0)
    {
      -[HNDTrackpadView setFrame:](self->_trackpadView, "setFrame:");
      -[HNDTrackpadBorderView setFrame:](self, "setFrame:", v14, v8, v13, v12);
      [(HNDTrackpadBorderView *)self updateTrackpadFrameLayer];
    }
  }
}

- (BOOL)pointOnTopLeftCorner:(CGPoint)a3
{
  return -[HNDTrackpadBorderView pointWithinBounds:minX:maxX:minY:maxY:](self, "pointWithinBounds:minX:maxX:minY:maxY:", a3.x, a3.y, -5.0, self->_borderWidth, -5.0, self->_borderWidth);
}

- (BOOL)pointOnBorder:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (-[HNDTrackpadBorderView pointOnTopBorder:](self, "pointOnTopBorder:")
    || -[HNDTrackpadBorderView pointOnBottomBorder:](self, "pointOnBottomBorder:", x, y)
    || -[HNDTrackpadBorderView pointOnLeftBorder:](self, "pointOnLeftBorder:", x, y))
  {
    return 1;
  }

  return -[HNDTrackpadBorderView pointOnRightBorder:](self, "pointOnRightBorder:", x, y);
}

- (BOOL)pointOnTopBorder:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(HNDTrackpadBorderView *)self frame];
  double borderWidth = self->_borderWidth;

  return -[HNDTrackpadBorderView pointWithinBounds:minX:maxX:minY:maxY:](self, "pointWithinBounds:minX:maxX:minY:maxY:", x, y, 0.0, v6, 0.0, borderWidth);
}

- (BOOL)pointOnBottomBorder:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(HNDTrackpadBorderView *)self frame];
  double v7 = v6;
  [(HNDTrackpadView *)self->_trackpadView bounds];
  double borderWidth = self->_borderWidth;

  return -[HNDTrackpadBorderView pointWithinBounds:minX:maxX:minY:maxY:](self, "pointWithinBounds:minX:maxX:minY:maxY:", x, y, 0.0, v7, borderWidth + v8, v8 + borderWidth * 2.0);
}

- (BOOL)pointOnLeftBorder:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(HNDTrackpadBorderView *)self frame];
  double borderWidth = self->_borderWidth;

  return -[HNDTrackpadBorderView pointWithinBounds:minX:maxX:minY:maxY:](self, "pointWithinBounds:minX:maxX:minY:maxY:", x, y, 0.0, borderWidth);
}

- (BOOL)pointOnRightBorder:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(HNDTrackpadBorderView *)self frame];
  [(HNDTrackpadView *)self->_trackpadView bounds];
  double borderWidth = self->_borderWidth;
  double v8 = v7 + borderWidth * 2.0;
  double v9 = borderWidth + v7;

  return -[HNDTrackpadBorderView pointWithinBounds:minX:maxX:minY:maxY:](self, "pointWithinBounds:minX:maxX:minY:maxY:", x, y, v9, v8);
}

- (BOOL)pointWithinBounds:(CGPoint)a3 minX:(double)a4 maxX:(double)a5 minY:(double)a6 maxY:(double)a7
{
  if (a3.x < a4 || a3.x > a5) {
    return 0;
  }
  if (a3.y <= a7) {
    return a3.y >= a6;
  }
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (id)getTrackpadColor
{
  v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 assistiveTouchVirtualTrackpadBorderColor];

  switch(v3)
  {
    case 0u:
      double v4 = +[UIColor systemGrayColor];
      break;
    case 1u:
      double v4 = +[UIColor systemWhiteColor];
      break;
    case 2u:
      double v4 = +[UIColor systemBlueColor];
      break;
    case 3u:
      double v4 = +[UIColor systemRedColor];
      break;
    case 4u:
      double v4 = +[UIColor systemGreenColor];
      break;
    case 5u:
      double v4 = +[UIColor systemYellowColor];
      break;
    case 6u:
      double v4 = +[UIColor systemOrangeColor];
      break;
    default:
      double v4 = +[UIColor grayColor];
      break;
  }

  return v4;
}

- (HNDTrackpadEventManager)eventManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventManager);

  return (HNDTrackpadEventManager *)WeakRetained;
}

- (void)setEventManager:(id)a3
{
}

- (UIPanGestureRecognizer)moveGestureRecognizer
{
  return self->_moveGestureRecognizer;
}

- (void)setMoveGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)pointerMoveGestureRecognizer
{
  return self->_pointerMoveGestureRecognizer;
}

- (void)setPointerMoveGestureRecognizer:(id)a3
{
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_double borderWidth = a3;
}

- (double)borderOpacity
{
  return self->_borderOpacity;
}

- (void)setBorderOpacity:(double)a3
{
  self->_borderOpacitdouble y = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_pointerMoveGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_moveGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_eventManager);
  objc_storeStrong((id *)&self->_resizeIcon, 0);
  objc_storeStrong((id *)&self->_trackpadFrameLayer, 0);

  objc_storeStrong((id *)&self->_trackpadView, 0);
}

@end