@interface PHVideoOverlayInsulatorView
- (BOOL)isContentViewRotatingOrResizing;
- (PHVideoOverlayContentView)contentView;
- (PHVideoOverlayInsulatorView)init;
- (void)dealloc;
- (void)displayContentView:(id)a3 animated:(BOOL)a4;
- (void)handlePIPControllerNotification:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setIsContentViewRotatingOrResizing:(BOOL)a3;
- (void)setVideoOverlayContentView:(id)a3 animated:(BOOL)a4;
@end

@implementation PHVideoOverlayInsulatorView

- (PHVideoOverlayInsulatorView)init
{
  v9.receiver = self;
  v9.super_class = (Class)PHVideoOverlayInsulatorView;
  v2 = [(PHVideoOverlayInsulatorView *)&v9 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)_UIBackdropView) initWithPrivateStyle:2030];
    [(PHVideoOverlayInsulatorView *)v2 setBackgroundView:v3];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"handlePIPControllerNotification:" name:@"PHPIPControllerWillRotateNotification" object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"handlePIPControllerNotification:" name:@"PHPIPControllerDidRotateNotification" object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"handlePIPControllerNotification:" name:@"PHPIPControllerDidStartResizingNotification" object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"handlePIPControllerNotification:" name:@"PHPIPControllerDidFinishResizingNotification" object:0];
  }
  return v2;
}

- (void)setVideoOverlayContentView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(PHVideoOverlayInsulatorView *)self contentView];

  if (v6 && v7)
  {
    if (v4) {
      double v8 = 0.00749999983;
    }
    else {
      double v8 = 0.0;
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10010C018;
    v12[3] = &unk_1002CD518;
    v12[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10010C060;
    v9[3] = &unk_1002D0C68;
    v9[4] = self;
    id v10 = v6;
    BOOL v11 = v4;
    +[UIView animateWithDuration:v12 animations:v9 completion:v8];
  }
  else if (v6)
  {
    [(PHVideoOverlayInsulatorView *)self displayContentView:v6 animated:v4];
  }
}

- (void)displayContentView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_contentView, a3);
  id v7 = a3;
  double v8 = [(PHVideoOverlayInsulatorView *)self contentView];
  [v8 setAlpha:0.0];

  objc_super v9 = [(PHVideoOverlayInsulatorView *)self contentView];
  [(PHVideoOverlayInsulatorView *)self addSubview:v9];

  id v10 = +[NSLayoutConstraint constraintWithItem:v7 attribute:7 relatedBy:-1 toItem:self attribute:7 multiplier:0.600000024 constant:0.0];
  LODWORD(v11) = 1144913920;
  [v10 setPriority:v11];
  [(PHVideoOverlayInsulatorView *)self addConstraint:v10];
  v12 = +[UIDevice currentDevice];
  double v13 = dbl_100285210[[v12 userInterfaceIdiom] == (id)1];

  v14 = +[NSLayoutConstraint constraintWithItem:v7 attribute:7 relatedBy:-1 toItem:0 attribute:0 multiplier:1.0 constant:v13];
  LODWORD(v15) = 1148846080;
  [v14 setPriority:v15];
  [(PHVideoOverlayInsulatorView *)self addConstraint:v14];
  v16 = +[NSLayoutConstraint constraintWithItem:v7 attribute:7 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:150.0];
  LODWORD(v17) = 1148846080;
  [v16 setPriority:v17];
  [(PHVideoOverlayInsulatorView *)self addConstraint:v16];
  v18 = +[NSLayoutConstraint constraintWithItem:v7 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(PHVideoOverlayInsulatorView *)self addConstraint:v18];

  v19 = +[NSLayoutConstraint constraintWithItem:v7 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  LODWORD(v20) = 1144750080;
  [v19 setPriority:v20];
  [(PHVideoOverlayInsulatorView *)self addConstraint:v19];
  v21 = +[NSLayoutConstraint constraintWithItem:v7 attribute:4 relatedBy:-1 toItem:self attribute:4 multiplier:1.0 constant:-70.0];
  LODWORD(v22) = 1148846080;
  [v21 setPriority:v22];
  [(PHVideoOverlayInsulatorView *)self addConstraint:v21];
  v23 = +[NSLayoutConstraint constraintWithItem:v7 attribute:3 relatedBy:1 toItem:self attribute:3 multiplier:1.0 constant:20.0];
  LODWORD(v24) = 1148846080;
  [v23 setPriority:v24];
  [(PHVideoOverlayInsulatorView *)self addConstraint:v23];
  double v25 = 0.00749999983;
  if (!v4) {
    double v25 = 0.0;
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10010C3FC;
  v26[3] = &unk_1002CD518;
  v26[4] = self;
  +[UIView animateWithDuration:v26 animations:v25];
}

- (void)setBackgroundView:(id)a3
{
  id v4 = a3;
  [(PHVideoOverlayInsulatorView *)self addSubview:v4];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[NSLayoutConstraint constraintWithItem:v4 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(PHVideoOverlayInsulatorView *)self addConstraint:v5];

  id v6 = +[NSLayoutConstraint constraintWithItem:v4 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  [(PHVideoOverlayInsulatorView *)self addConstraint:v6];

  id v7 = +[NSLayoutConstraint constraintWithItem:v4 attribute:7 relatedBy:0 toItem:self attribute:7 multiplier:1.0 constant:0.0];
  [(PHVideoOverlayInsulatorView *)self addConstraint:v7];

  id v8 = +[NSLayoutConstraint constraintWithItem:v4 attribute:8 relatedBy:0 toItem:self attribute:8 multiplier:1.0 constant:0.0];

  [(PHVideoOverlayInsulatorView *)self addConstraint:v8];
}

- (void)handlePIPControllerNotification:(id)a3
{
  unsigned int v4 = [(PHVideoOverlayInsulatorView *)self isContentViewRotatingOrResizing];
  v5 = [(PHVideoOverlayInsulatorView *)self contentView];
  id v6 = v5;
  if (v4)
  {
    [v5 resetView];

    v5 = [(PHVideoOverlayInsulatorView *)self contentView];
    id v6 = v5;
    double v7 = 1.0;
  }
  else
  {
    double v7 = 0.0;
  }
  [v5 setAlpha:v7];

  [(PHVideoOverlayInsulatorView *)self setIsContentViewRotatingOrResizing:v4 ^ 1];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHVideoOverlayInsulatorView;
  [(PHVideoOverlayInsulatorView *)&v4 dealloc];
}

- (PHVideoOverlayContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (BOOL)isContentViewRotatingOrResizing
{
  return self->_isContentViewRotatingOrResizing;
}

- (void)setIsContentViewRotatingOrResizing:(BOOL)a3
{
  self->_isContentViewRotatingOrResizing = a3;
}

- (void).cxx_destruct
{
}

@end