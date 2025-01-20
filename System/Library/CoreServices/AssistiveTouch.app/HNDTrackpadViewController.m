@interface HNDTrackpadViewController
- (BOOL)_canShowWhileLocked;
- (BSInvalidatable)virtualMouseClientAssertionForVirtualTrackpad;
- (CGRect)getTrackpadBorderFrame;
- (CGRect)getTrackpadFrame:(double)a3 borderFrame:(CGRect)a4;
- (HNDTrackpadEventManager)eventManager;
- (HNDTrackpadViewController)initWithOrientation:(int)a3;
- (double)fadeDelay;
- (void)fadeTrackpad;
- (void)highlightTrackpad;
- (void)load;
- (void)resetVisibility:(BOOL)a3;
- (void)setEventManager:(id)a3;
- (void)setFadeDelay:(double)a3;
- (void)setVirtualMouseClientAssertionForVirtualTrackpad:(id)a3;
- (void)unload;
@end

@implementation HNDTrackpadViewController

- (HNDTrackpadViewController)initWithOrientation:(int)a3
{
  v31.receiver = self;
  v31.super_class = (Class)HNDTrackpadViewController;
  v4 = [(HNDTrackpadViewController *)&v31 init];
  v4->_orientation = a3;
  [(HNDTrackpadViewController *)v4 getTrackpadBorderFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = +[AXSettings sharedInstance];
  [v13 assistiveTouchVirtualTrackpadBorderWidth];
  double v15 = v14;

  -[HNDTrackpadViewController getTrackpadFrame:borderFrame:](v4, "getTrackpadFrame:borderFrame:", v15, v6, v8, v10, v12);
  v20 = -[HNDTrackpadView initWithFrame:]([HNDTrackpadView alloc], "initWithFrame:", v16, v17, v18, v19);
  v21 = -[HNDTrackpadBorderView initWithFrame:trackpadView:]([HNDTrackpadBorderView alloc], "initWithFrame:trackpadView:", v20, v6, v8, v10, v12);
  v22 = [[HNDTrackpadEventManager alloc] initWithTrackpad:v20 trackpadBorder:v21];
  [(HNDTrackpadViewController *)v4 setEventManager:v22];

  [(HNDTrackpadView *)v20 setTrackpadBorder:v21];
  [(HNDTrackpadBorderView *)v21 setEventManager:v4->_eventManager];
  [(HNDTrackpadView *)v20 setEventManager:v4->_eventManager];
  [(HNDTrackpadViewController *)v4 setView:v21];
  [(HNDTrackpadViewController *)v4 load];
  v23 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  fadeTimer = v4->_fadeTimer;
  v4->_fadeTimer = v23;

  v25 = +[AXSettings sharedInstance];
  [v25 assistiveTouchVirtualTrackpadFadeDelay];
  -[HNDTrackpadViewController setFadeDelay:](v4, "setFadeDelay:");

  objc_initWeak(&location, v4);
  v26 = +[AXSettings sharedInstance];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100046C40;
  v28[3] = &unk_1001AAA68;
  objc_copyWeak(&v29, &location);
  [v26 registerUpdateBlock:v28 forRetrieveSelector:"assistiveTouchVirtualTrackpadFadeDelay" withListener:v4];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)highlightTrackpad
{
  if (self->_trackpadDimmed)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100046D78;
    v3[3] = &unk_1001AAA90;
    v3[4] = self;
    +[UIView animateWithDuration:v3 animations:0.15];
    self->_trackpadDimmed = 0;
  }
  else
  {
    [(AXDispatchTimer *)self->_fadeTimer cancel];
  }
  [(HNDTrackpadViewController *)self fadeTrackpad];
}

- (void)fadeTrackpad
{
  if (!self->_trackpadDimmed)
  {
    [(AXDispatchTimer *)self->_fadeTimer cancel];
    fadeTimer = self->_fadeTimer;
    double fadeDelay = self->_fadeDelay;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100046E2C;
    v5[3] = &unk_1001AAA90;
    v5[4] = self;
    [(AXDispatchTimer *)fadeTimer afterDelay:v5 processBlock:fadeDelay];
  }
}

- (CGRect)getTrackpadBorderFrame
{
  -[HNDHandManager screenFrame:]_0();
  double v4 = v2;
  double v5 = v3;
  if (v2 >= v3) {
    double v6 = v3;
  }
  else {
    double v6 = v2;
  }
  if (v2 >= v3) {
    double v7 = v2;
  }
  else {
    double v7 = v3;
  }
  int IsPad = AXDeviceIsPad();
  double v9 = 1.5;
  if (IsPad) {
    double v9 = 2.0;
  }
  double v10 = v6 / v9;
  double v11 = v7 / 3.5;
  double v12 = v4 - v6 / v9;
  double v13 = v5 - v7 / 3.5;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)getTrackpadFrame:(double)a3 borderFrame:(CGRect)a4
{
  double v4 = a4.size.width + a3 * -2.0;
  double v5 = a4.size.height + a3 * -2.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = a3;
  result.origin.x = a3;
  return result;
}

- (void)resetVisibility:(BOOL)a3
{
  if (a3)
  {
    id v7 = [(HNDTrackpadViewController *)self view];
    [v7 setAlpha:1.0];
  }
  else
  {
    id v7 = +[AXSettings sharedInstance];
    [v7 assistiveTouchIdleOpacity];
    double v5 = v4;
    double v6 = [(HNDTrackpadViewController *)self view];
    [v6 setAlpha:v5];
  }
}

- (void)load
{
  if (!self->_virtualMouseClientAssertionForVirtualTrackpad)
  {
    double v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    double v4 = +[HNDVirtualHIDMouse addActiveClientWithReason:v5];
    [(HNDTrackpadViewController *)self setVirtualMouseClientAssertionForVirtualTrackpad:v4];
  }
}

- (void)unload
{
  [(BSInvalidatable *)self->_virtualMouseClientAssertionForVirtualTrackpad invalidate];
  virtualMouseClientAssertionForVirtualTrackpad = self->_virtualMouseClientAssertionForVirtualTrackpad;
  self->_virtualMouseClientAssertionForVirtualTrackpad = 0;
}

- (HNDTrackpadEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (double)fadeDelay
{
  return self->_fadeDelay;
}

- (void)setFadeDelay:(double)a3
{
  self->_double fadeDelay = a3;
}

- (BSInvalidatable)virtualMouseClientAssertionForVirtualTrackpad
{
  return self->_virtualMouseClientAssertionForVirtualTrackpad;
}

- (void)setVirtualMouseClientAssertionForVirtualTrackpad:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualMouseClientAssertionForVirtualTrackpad, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);

  objc_storeStrong((id *)&self->_fadeTimer, 0);
}

@end