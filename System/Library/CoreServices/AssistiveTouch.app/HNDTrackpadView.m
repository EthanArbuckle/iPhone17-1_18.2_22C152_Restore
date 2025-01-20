@interface HNDTrackpadView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (HNDTrackpadBorderView)trackpadBorder;
- (HNDTrackpadEventManager)eventManager;
- (HNDTrackpadView)initWithFrame:(CGRect)a3;
- (UILongPressGestureRecognizer)pressGestureRecognizer;
- (UIPanGestureRecognizer)scrollGestureRecognizer;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (id)getTrackpadColor;
- (void)handleMove:(id)a3;
- (void)handlePress:(id)a3;
- (void)handleTap:(id)a3;
- (void)registerForSettingsUpdates;
- (void)setEventManager:(id)a3;
- (void)setPinchGestureRecognizer:(id)a3;
- (void)setPressGestureRecognizer:(id)a3;
- (void)setScrollGestureRecognizer:(id)a3;
- (void)setTrackpadBorder:(id)a3;
- (void)setUpGestureRecognizers;
@end

@implementation HNDTrackpadView

- (HNDTrackpadView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HNDTrackpadView;
  v3 = -[HNDTrackpadView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(HNDTrackpadView *)v3 getTrackpadColor];
  [(HNDTrackpadView *)v3 setBackgroundColor:v4];

  v5 = +[AXSettings sharedInstance];
  [v5 assistiveTouchVirtualTrackpadInnerOpacity];
  -[HNDTrackpadView setAlpha:](v3, "setAlpha:");

  id v6 = +[UIColor blackColor];
  id v7 = [v6 CGColor];
  v8 = [(HNDTrackpadView *)v3 layer];
  [v8 setBorderColor:v7];

  v9 = [(HNDTrackpadView *)v3 layer];
  [v9 setCornerRadius:11.0];

  [(HNDTrackpadView *)v3 setUserInteractionEnabled:1];
  [(HNDTrackpadView *)v3 setUpGestureRecognizers];
  [(HNDTrackpadView *)v3 registerForSettingsUpdates];
  return v3;
}

- (void)registerForSettingsUpdates
{
  objc_initWeak(&location, self);
  v3 = +[AXSettings sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A7388;
  v10[3] = &unk_1001AAA68;
  objc_copyWeak(&v11, &location);
  [v3 registerUpdateBlock:v10 forRetrieveSelector:"assistiveTouchVirtualTrackpadInnerColor" withListener:self];

  objc_destroyWeak(&v11);
  v4 = +[AXSettings sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A73F8;
  v8[3] = &unk_1001AAA68;
  objc_copyWeak(&v9, &location);
  [v4 registerUpdateBlock:v8 forRetrieveSelector:"assistiveTouchVirtualTrackpadInnerOpacity" withListener:self];

  objc_destroyWeak(&v9);
  v5 = +[AXSettings sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A7470;
  v6[3] = &unk_1001AAA68;
  objc_copyWeak(&v7, &location);
  [v5 registerUpdateBlock:v6 forRetrieveSelector:"assistiveTouchVirtualTrackpadHoldDuration" withListener:self];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setUpGestureRecognizers
{
  id v11 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
  [(HNDTrackpadView *)self addGestureRecognizer:v11];
  v3 = (UIPanGestureRecognizer *)[objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"handleMove:"];
  [(UIPanGestureRecognizer *)v3 setMaximumNumberOfTouches:1];
  [(UIPanGestureRecognizer *)v3 setDelegate:self];
  moveGestureRecognizer = self->_moveGestureRecognizer;
  self->_moveGestureRecognizer = v3;
  v5 = v3;

  [(HNDTrackpadView *)self addGestureRecognizer:v5];
  id v6 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"handlePress:"];
  id v7 = +[AXSettings sharedInstance];
  [v7 assistiveTouchVirtualTrackpadHoldDuration];
  objc_msgSend(v6, "setMinimumPressDuration:");

  [v6 setDelegate:self];
  [(HNDTrackpadView *)self setPressGestureRecognizer:v6];
  [(HNDTrackpadView *)self addGestureRecognizer:v6];
  id v8 = [objc_alloc((Class)UIPinchGestureRecognizer) initWithTarget:self action:0];
  [v8 setDelaysTouchesBegan:1];
  [v8 setDelegate:self];
  [(HNDTrackpadView *)self setPinchGestureRecognizer:v8];
  [(HNDTrackpadView *)self addGestureRecognizer:v8];
  id v9 = objc_alloc((Class)UIPanGestureRecognizer);

  id v10 = [v9 initWithTarget:self action:0];
  [v10 setMinimumNumberOfTouches:2];
  [v10 setMaximumNumberOfTouches:2];
  [v10 setDelegate:self];
  [(HNDTrackpadView *)self setScrollGestureRecognizer:v10];
  [(HNDTrackpadView *)self addGestureRecognizer:v10];
}

- (void)handleTap:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventManager);
  [WeakRetained handleTrackpadPrimaryClick];
}

- (void)handleMove:(id)a3
{
  p_eventManager = &self->_eventManager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_eventManager);
  [WeakRetained handleTrackpadMovePointer:v4];
}

- (void)handlePress:(id)a3
{
  p_eventManager = &self->_eventManager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_eventManager);
  [WeakRetained handleTrackpadPress:v4];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = (UIPanGestureRecognizer *)a3;
  id v7 = (UIPanGestureRecognizer *)a4;
  id v8 = v7;
  if ((UIPanGestureRecognizer *)self->_pressGestureRecognizer == v6
    && (self->_moveGestureRecognizer == v7
     || (id v10 = objc_loadWeakRetained((id *)&self->_trackpadBorder),
         [v10 pointerMoveGestureRecognizer],
         id v11 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue(),
         v11,
         v10,
         v11 == v8)))
  {
    BOOL v9 = 1;
  }
  else if (self->_moveGestureRecognizer == v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_trackpadBorder);
    v13 = [WeakRetained pointerMoveGestureRecognizer];
    BOOL v9 = v13 == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)getTrackpadColor
{
  v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 assistiveTouchVirtualTrackpadInnerColor];

  switch(v3)
  {
    case 0u:
      id v4 = +[UIColor systemGrayColor];
      break;
    case 1u:
      id v4 = +[UIColor systemWhiteColor];
      break;
    case 2u:
      id v4 = +[UIColor systemBlueColor];
      break;
    case 3u:
      id v4 = +[UIColor systemRedColor];
      break;
    case 4u:
      id v4 = +[UIColor systemGreenColor];
      break;
    case 5u:
      id v4 = +[UIColor systemYellowColor];
      break;
    case 6u:
      id v4 = +[UIColor systemOrangeColor];
      break;
    default:
      id v4 = +[UIColor grayColor];
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

- (HNDTrackpadBorderView)trackpadBorder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackpadBorder);

  return (HNDTrackpadBorderView *)WeakRetained;
}

- (void)setTrackpadBorder:(id)a3
{
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setPinchGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)scrollGestureRecognizer
{
  return self->_scrollGestureRecognizer;
}

- (void)setScrollGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)pressGestureRecognizer
{
  return self->_pressGestureRecognizer;
}

- (void)setPressGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_trackpadBorder);
  objc_destroyWeak((id *)&self->_eventManager);

  objc_storeStrong((id *)&self->_moveGestureRecognizer, 0);
}

@end