@interface HPRFInstallSpinnerButton
+ (id)applicationSpinnerView;
- (HPRFInstallSpinnerButton)initWithFrame:(CGRect)a3 showSquare:(BOOL)a4;
- (void)layoutSubviews;
- (void)prepareProgressIndicatorIfNeeded;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
- (void)showProgressAnimation;
- (void)stopSpinnerView;
@end

@implementation HPRFInstallSpinnerButton

+ (id)applicationSpinnerView
{
  if (qword_1E768 != -1) {
    dispatch_once(&qword_1E768, &stru_18830);
  }
  v2 = (void *)qword_1E760;

  return v2;
}

- (HPRFInstallSpinnerButton)initWithFrame:(CGRect)a3 showSquare:(BOOL)a4
{
  BOOL v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HPRFInstallSpinnerButton;
  v5 = -[HPRFInstallSpinnerButton initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    id v6 = objc_alloc((Class)UIImageView);
    v7 = +[HPRFInstallSpinnerButton applicationSpinnerView];
    v8 = (UIImageView *)[v6 initWithImage:v7];
    spinnerView = v5->_spinnerView;
    v5->_spinnerView = v8;

    [(HPRFInstallSpinnerButton *)v5 addSubview:v5->_spinnerView];
    if (v4)
    {
      v10 = (UIView *)objc_alloc_init((Class)UIView);
      squareView = v5->_squareView;
      v5->_squareView = v10;

      v12 = v5->_squareView;
      v13 = +[UIColor systemOrangeColor];
      [(UIView *)v12 setBackgroundColor:v13];

      [(HPRFInstallSpinnerButton *)v5 addSubview:v5->_squareView];
    }
    v5->_showingSpinner = 0;
  }
  return v5;
}

- (void)prepareProgressIndicatorIfNeeded
{
  if (!self->_progressIndicator)
  {
    id v3 = objc_alloc((Class)SUUICircleProgressIndicator);
    [(HPRFInstallSpinnerButton *)self bounds];
    BOOL v4 = (SUUICircleProgressIndicator *)objc_msgSend(v3, "initWithFrame:");
    progressIndicator = self->_progressIndicator;
    self->_progressIndicator = v4;

    [(SUUICircleProgressIndicator *)self->_progressIndicator setAutoresizingMask:18];
    id v6 = self->_progressIndicator;
    v7 = +[UIColor clearColor];
    [(SUUICircleProgressIndicator *)v6 setBackgroundColor:v7];

    [(SUUICircleProgressIndicator *)self->_progressIndicator setUserInteractionEnabled:0];
    [(HPRFInstallSpinnerButton *)self addSubview:self->_progressIndicator];
    [(HPRFInstallSpinnerButton *)self layoutIfNeeded];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)HPRFInstallSpinnerButton;
  [(HPRFInstallSpinnerButton *)&v13 layoutSubviews];
  [(HPRFInstallSpinnerButton *)self bounds];
  double v4 = v3 + -0.5;
  [(HPRFInstallSpinnerButton *)self bounds];
  double v6 = v5 + -0.5;
  [(HPRFInstallSpinnerButton *)self bounds];
  double v8 = v7 + 1.0;
  [(HPRFInstallSpinnerButton *)self bounds];
  -[UIImageView setFrame:](self->_spinnerView, "setFrame:", v4, v6, v8, v9 + 1.0);
  if (self->_squareView)
  {
    [(HPRFInstallSpinnerButton *)self bounds];
    -[UIView setFrame:](self->_squareView, "setFrame:");
    progressIndicator = self->_progressIndicator;
    if (progressIndicator)
    {
      [(SUUICircleProgressIndicator *)progressIndicator center];
    }
    else
    {
      double v12 = 14.5;
      double v11 = 14.5;
    }
    -[UIView setCenter:](self->_squareView, "setCenter:", v11, v12);
  }
}

- (void)showProgressAnimation
{
  [(SUUICircleProgressIndicator *)self->_progressIndicator progress];
  if (v3 == 0.0)
  {
    [(SUUICircleProgressIndicator *)self->_progressIndicator setHidden:1];
    double v4 = [(UIImageView *)self->_spinnerView layer];
    double v5 = [v4 animationForKey:@"HPRFRotationAnimationKey"];

    if (!v5)
    {
      double v6 = +[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
      LODWORD(v7) = 1095307227;
      double v8 = +[NSNumber numberWithFloat:v7];
      [v6 setToValue:v8];

      [v6 setDuration:2.0];
      [v6 setCumulative:1];
      LODWORD(v9) = 2139095040;
      [v6 setRepeatCount:v9];
      [v6 setRemovedOnCompletion:0];
      [v6 setFrameInterval:0.0333333333];
      v10 = [(UIImageView *)self->_spinnerView layer];
      [v10 addAnimation:v6 forKey:@"HPRFRotationAnimationKey"];
    }
    [(UIImageView *)self->_spinnerView setHidden:0];
    self->_showingSpinner = 1;
  }
  else
  {
    [(HPRFInstallSpinnerButton *)self stopSpinnerView];
  }
}

- (void)stopSpinnerView
{
  if (self->_showingSpinner)
  {
    self->_showingSpinner = 0;
    double v3 = [(UIImageView *)self->_spinnerView layer];
    [v3 removeAnimationForKey:@"HPRFRotationAnimationKey"];
  }
  [(UIImageView *)self->_spinnerView setHidden:1];
  progressIndicator = self->_progressIndicator;

  [(SUUICircleProgressIndicator *)progressIndicator setHidden:0];
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 > 0.0 && self->_showingSpinner) {
    [(HPRFInstallSpinnerButton *)self stopSpinnerView];
  }
  if (a3 > 0.0) {
    [(HPRFInstallSpinnerButton *)self prepareProgressIndicatorIfNeeded];
  }
  progressIndicator = self->_progressIndicator;

  [(SUUICircleProgressIndicator *)progressIndicator setProgress:v4 animated:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_squareView, 0);

  objc_storeStrong((id *)&self->_spinnerView, 0);
}

@end