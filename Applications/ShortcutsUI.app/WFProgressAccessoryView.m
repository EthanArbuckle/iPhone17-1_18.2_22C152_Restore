@interface WFProgressAccessoryView
- (BOOL)hasCompleted;
- (BOOL)isRunningFromActionButton;
- (BOOL)isTouchingDownButton;
- (BSUICAPackageView)micaView;
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (NSTimer)progressSuppressionTimer;
- (UIAction)cancelAction;
- (UIButton)cancelButton;
- (WFProgressAccessoryView)initWithTintColor:(id)a3 runningContext:(id)a4;
- (WFWorkflowRunningContext)runningContext;
- (double)lastKnownProgressValue;
- (int64_t)activeLayoutMode;
- (int64_t)progressSuppressionState;
- (void)layoutSubviews;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setCancelAction:(id)a3;
- (void)setHasCompleted:(BOOL)a3;
- (void)setIsTouchingDownButton:(BOOL)a3;
- (void)setLastKnownProgressValue:(double)a3;
- (void)setMicaViewHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setProgressSuppressionState:(int64_t)a3;
- (void)setProgressSuppressionTimer:(id)a3;
- (void)tintControlWithColor:(id)a3 animated:(BOOL)a4;
- (void)touchedDownCancelButton;
- (void)touchedUpCancelButton;
- (void)updateMicaViewState;
- (void)updateProgressWithValue:(double)a3;
@end

@implementation WFProgressAccessoryView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressSuppressionTimer, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_micaView, 0);

  objc_storeStrong((id *)&self->_cancelAction, 0);
}

- (void)setProgressSuppressionTimer:(id)a3
{
}

- (NSTimer)progressSuppressionTimer
{
  return self->_progressSuppressionTimer;
}

- (void)setHasCompleted:(BOOL)a3
{
  self->_hasCompleted = a3;
}

- (BOOL)hasCompleted
{
  return self->_hasCompleted;
}

- (void)setLastKnownProgressValue:(double)a3
{
  self->_lastKnownProgressValue = a3;
}

- (double)lastKnownProgressValue
{
  return self->_lastKnownProgressValue;
}

- (void)setIsTouchingDownButton:(BOOL)a3
{
  self->_isTouchingDownButton = a3;
}

- (BOOL)isTouchingDownButton
{
  return self->_isTouchingDownButton;
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (BSUICAPackageView)micaView
{
  return self->_micaView;
}

- (int64_t)progressSuppressionState
{
  return self->_progressSuppressionState;
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (UIAction)cancelAction
{
  return self->_cancelAction;
}

- (void)touchedUpCancelButton
{
  [(WFProgressAccessoryView *)self setIsTouchingDownButton:0];

  [(WFProgressAccessoryView *)self updateMicaViewState];
}

- (void)touchedDownCancelButton
{
  [(WFProgressAccessoryView *)self setIsTouchingDownButton:1];

  [(WFProgressAccessoryView *)self updateMicaViewState];
}

- (void)setMicaViewHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v7 = [(WFProgressAccessoryView *)self micaView];
  unsigned int v8 = [v7 isHidden];

  if (v8 != v5)
  {
    if (v4)
    {
      if (v5)
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000032FC;
        v15[3] = &unk_100038C80;
        v15[4] = self;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100003344;
        v14[3] = &unk_100038AC8;
        v14[4] = self;
        +[UIView animateWithDuration:v15 animations:v14 completion:0.4];
      }
      else
      {
        v9 = [(WFProgressAccessoryView *)self micaView];
        [v9 setHidden:0];

        v10 = [(WFProgressAccessoryView *)self micaView];
        [v10 setAlpha:0.0];

        dispatch_time_t v11 = dispatch_time(0, 50000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000338C;
        block[3] = &unk_100038C80;
        block[4] = self;
        dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
    else
    {
      id v12 = [(WFProgressAccessoryView *)self micaView];
      [v12 setHidden:v5];
    }
  }
}

- (void)setProgressSuppressionState:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([(WFProgressAccessoryView *)self progressSuppressionState] != a3)
  {
    self->_progressSuppressionState = a3;
    BOOL v5 = [(WFProgressAccessoryView *)self progressSuppressionTimer];
    [v5 invalidate];

    [(WFProgressAccessoryView *)self setProgressSuppressionTimer:0];
    if (a3 == 3)
    {
      [(WFProgressAccessoryView *)self setMicaViewHidden:0 animated:1];
    }
    else
    {
      if ((id)[(WFProgressAccessoryView *)self activeLayoutMode] != (id)4) {
        [(WFProgressAccessoryView *)self setMicaViewHidden:1 animated:0];
      }
      if ((id)[(WFProgressAccessoryView *)self progressSuppressionState] == (id)1)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_1000035B0;
        v8[3] = &unk_100038938;
        v8[4] = self;
        v6 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v8 block:1.0];
        [(WFProgressAccessoryView *)self setProgressSuppressionTimer:v6];
      }
    }
    v7 = [(WFProgressAccessoryView *)self systemApertureElementContext];
    [v7 setElementNeedsUpdate];
  }
}

- (void)updateMicaViewState
{
  int64_t v3 = [(WFProgressAccessoryView *)self activeLayoutMode];
  [(WFProgressAccessoryView *)self lastKnownProgressValue];
  if (v3 == 4)
  {
    if (v4 >= 1.0)
    {
      CFStringRef v5 = @"zoom-done";
    }
    else if ([(WFProgressAccessoryView *)self isTouchingDownButton])
    {
      CFStringRef v5 = @"zoom-press";
    }
    else
    {
      CFStringRef v5 = @"zoom";
    }
  }
  else if (v4 >= 1.0)
  {
    CFStringRef v5 = @"compact-done";
  }
  else
  {
    CFStringRef v5 = @"compact";
  }
  id v6 = [(WFProgressAccessoryView *)self micaView];
  [v6 setState:v5];
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  self->_activeLayoutMode = a3;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100003738;
  v3[3] = &unk_100038AA0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)updateProgressWithValue:(double)a3
{
  if (![(WFProgressAccessoryView *)self hasCompleted])
  {
    CFStringRef v5 = [(WFProgressAccessoryView *)self micaView];
    id v6 = [v5 publishedObjectWithName:@"progress fill"];

    [v6 setStrokeStart:0.999 - a3 * 0.999 / 0.999];
    if (a3 <= 0.0 || a3 >= 1.0)
    {
      if (a3 >= 1.0) {
        [(WFProgressAccessoryView *)self setHasCompleted:1];
      }
      if ((id)[(WFProgressAccessoryView *)self progressSuppressionState] != (id)1) {
        goto LABEL_11;
      }
      if (a3 > 0.0) {
        [(WFProgressAccessoryView *)self setProgressSuppressionState:3];
      }
      if (a3 >= 1.0)
      {
        v7 = +[UIColor whiteColor];
        [(WFProgressAccessoryView *)self tintControlWithColor:v7 animated:0];

        dispatch_time_t v8 = dispatch_time(0, 150000000);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_10000397C;
        v9[3] = &unk_100038AA0;
        v9[4] = self;
        *(double *)&v9[5] = a3;
        dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
      }
      else
      {
LABEL_11:
        [(WFProgressAccessoryView *)self setLastKnownProgressValue:a3];
        [(WFProgressAccessoryView *)self updateMicaViewState];
      }
    }
  }
}

- (void)tintControlWithColor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(WFProgressAccessoryView *)self lastKnownProgressValue];
  if (v7 < 1.0)
  {
    dispatch_time_t v8 = [(WFProgressAccessoryView *)self micaView];
    v9 = [v8 publishedObjectWithName:@"stop button"];

    v10 = [(WFProgressAccessoryView *)self micaView];
    dispatch_time_t v11 = [v10 publishedObjectWithName:@"back fill"];

    id v12 = [(WFProgressAccessoryView *)self micaView];
    v13 = [v12 publishedObjectWithName:@"progress fill"];

    double v29 = 0.0;
    double v30 = 0.0;
    uint64_t v27 = 0;
    double v28 = 0.0;
    [v6 getRed:&v30 green:&v29 blue:&v28 alpha:&v27];
    v14 = +[UIColor colorWithRed:v30 green:v29 blue:v28 alpha:0.37];
    v15 = v14;
    if (v4)
    {
      id v16 = [v11 strokeColor];
      CFRetain(v16);
      id v17 = v15;
      [v11 setStrokeColor:[v17 CGColor]];
      v18 = +[CABasicAnimation animationWithKeyPath:@"strokeColor"];
      [v18 setFromValue:v16];
      [v18 setToValue:[v17 CGColor]];
      [v18 setDuration:0.300000012];
      [v18 setFillMode:kCAFillModeForwards];
      [v11 addAnimation:v18 forKey:@"strokeColor"];
      CFRelease(v16);
      id v19 = [v13 strokeColor];
      CFRetain(v19);
      id v20 = v6;
      [v13 setStrokeColor:[v20 CGColor]];
      v21 = +[CABasicAnimation animationWithKeyPath:@"strokeColor"];
      [v21 setFromValue:v19];
      id v22 = v20;
      [v21 setToValue:[v22 CGColor]];
      [v21 setDuration:0.300000012];
      [v21 setFillMode:kCAFillModeForwards];
      [v13 addAnimation:v21 forKey:@"strokeColor"];
      CFRelease(v19);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100003D34;
      v24[3] = &unk_100038BC0;
      id v25 = v9;
      id v26 = v22;
      +[UIView animateWithDuration:0 delay:v24 options:0 animations:2.0 completion:0.15];
    }
    else
    {
      objc_msgSend(v11, "setStrokeColor:", objc_msgSend(v14, "CGColor"));
      id v23 = v6;
      objc_msgSend(v13, "setStrokeColor:", objc_msgSend(v23, "CGColor"));
      [v9 setBackgroundColor:[v23 CGColor]];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  if (a4 == 4)
  {
    double width = 50.0;
    double height = 50.0;
  }
  else if ((id)[(WFProgressAccessoryView *)self progressSuppressionState] == (id)3)
  {
    double height = 24.0;
    double width = 23.0;
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isRunningFromActionButton
{
  v2 = [(WFProgressAccessoryView *)self runningContext];
  int64_t v3 = [v2 runSource];
  unsigned __int8 v4 = [v3 isEqualToString:WFWorkflowRunSourceActionButton];

  return v4;
}

- (void)setCancelAction:(id)a3
{
  id v8 = a3;
  if (v8 || !self->_cancelAction)
  {
    unsigned __int8 v4 = [(WFProgressAccessoryView *)self cancelButton];
    [v4 addAction:v8 forControlEvents:64];

    uint64_t v5 = (UIAction *)v8;
    cancelAction = self->_cancelAction;
    self->_cancelAction = v5;
  }
  else
  {
    double v7 = [(WFProgressAccessoryView *)self cancelButton];
    [v7 removeAction:self->_cancelAction forControlEvents:64];

    cancelAction = self->_cancelAction;
    self->_cancelAction = 0;
  }
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)WFProgressAccessoryView;
  [(WFProgressAccessoryView *)&v16 layoutSubviews];
  int64_t v3 = [(WFProgressAccessoryView *)self traitCollection];
  [v3 displayScale];
  CGFloat v5 = 1.0 / v4;

  [(WFProgressAccessoryView *)self bounds];
  CGRect v18 = CGRectOffset(v17, v5, 0.0);
  double x = v18.origin.x;
  double y = v18.origin.y;
  double width = v18.size.width;
  double height = v18.size.height;
  v10 = [(WFProgressAccessoryView *)self micaView];
  [v10 setFrame:x, y, width, height];

  [(WFProgressAccessoryView *)self bounds];
  CGRect v20 = CGRectOffset(v19, v5, 0.0);
  double v11 = v20.origin.x;
  double v12 = v20.origin.y;
  double v13 = v20.size.width;
  double v14 = v20.size.height;
  v15 = [(WFProgressAccessoryView *)self cancelButton];
  [v15 setFrame:v11, v12, v13, v14];
}

- (WFProgressAccessoryView)initWithTintColor:(id)a3 runningContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)WFProgressAccessoryView;
  id v8 = -[WFProgressAccessoryView initWithFrame:](&v23, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v8)
  {
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [objc_alloc((Class)BSUICAPackageView) initWithPackageName:@"zoomy-progress-D73" inBundle:v9];
    [v10 setState:@"compact"];
    micaView = v8->_micaView;
    v8->_micaView = (BSUICAPackageView *)v10;
    id v12 = v10;

    double v13 = +[UIButtonConfiguration plainButtonConfiguration];
    double v14 = +[UIButton buttonWithConfiguration:v13 primaryAction:0];
    [(UIButton *)v14 addTarget:v8 action:"touchedDownCancelButton" forControlEvents:17];
    [(UIButton *)v14 addTarget:v8 action:"touchedUpCancelButton" forControlEvents:480];
    cancelButton = v8->_cancelButton;
    v8->_cancelButton = v14;
    objc_super v16 = v14;

    objc_storeStrong((id *)&v8->_runningContext, a4);
    [(WFProgressAccessoryView *)v8 addSubview:v12];
    [(WFProgressAccessoryView *)v8 addSubview:v16];
    [(WFProgressAccessoryView *)v8 tintControlWithColor:v6 animated:0];
    [(WFProgressAccessoryView *)v8 updateProgressWithValue:0.0];
    v24[0] = WFWorkflowRunKindAppShortcut;
    v24[1] = WFWorkflowRunKindAppIntent;
    v24[2] = WFWorkflowRunKindContextualAction;
    v24[3] = WFWorkflowRunKindINShortcut;
    CGRect v17 = +[NSArray arrayWithObjects:v24 count:4];

    CGRect v18 = [(WFProgressAccessoryView *)v8 runningContext];
    CGRect v19 = [v18 runKind];
    LODWORD(cancelButton) = [v17 containsObject:v19];

    if (cancelButton) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 3;
    }
    [(WFProgressAccessoryView *)v8 setProgressSuppressionState:v20];
    v21 = v8;
  }
  return v8;
}

@end