@interface PHVoicemailGreetingSliderCell
+ (NSString)reuseIdentifier;
- (NSLayoutConstraint)progressViewCenterYAnchorConstraint;
- (NSLayoutConstraint)progressViewHeightAnchorConstraint;
- (NSLayoutConstraint)progressViewLeadingAnchorConstraint;
- (NSLayoutConstraint)progressViewTrailingAnchorConstraint;
- (NSLayoutConstraint)timelineSliderCenterYAnchorConstraint;
- (NSLayoutConstraint)timelineSliderLeadingAnchorConstraint;
- (NSLayoutConstraint)timelineSliderTrailingAnchorConstraint;
- (UIProgressView)progressView;
- (VMPlayerTimelineSlider)timelineSlider;
- (double)progressViewHeightAnchorConstraintConstant;
- (void)commonInit;
- (void)loadConstraints;
- (void)loadContentView;
- (void)playerTimelineSlider:(id)a3 didChangeElapsedTime:(double)a4;
- (void)setProgressViewCenterYAnchorConstraint:(id)a3;
- (void)setProgressViewHeightAnchorConstraint:(id)a3;
- (void)setProgressViewLeadingAnchorConstraint:(id)a3;
- (void)setProgressViewTrailingAnchorConstraint:(id)a3;
- (void)setTimelineSliderCenterYAnchorConstraint:(id)a3;
- (void)setTimelineSliderLeadingAnchorConstraint:(id)a3;
- (void)setTimelineSliderTrailingAnchorConstraint:(id)a3;
- (void)showProgressView;
- (void)showTimelineSlider;
- (void)unloadConstraints;
- (void)updateConstraintsConstants;
@end

@implementation PHVoicemailGreetingSliderCell

+ (NSString)reuseIdentifier
{
  v2 = NSStringFromClass((Class)a1);
  v3 = +[NSString stringWithFormat:@"%@ReuseIdentifier", v2];

  return (NSString *)v3;
}

- (void)commonInit
{
  v6.receiver = self;
  v6.super_class = (Class)PHVoicemailGreetingSliderCell;
  [(PHVoicemailGreetingSliderCell *)&v6 commonInit];
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  -[PHVoicemailGreetingSliderCell setLayoutMargins:](self, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  [(PHVoicemailGreetingSliderCell *)self setPreservesSuperviewLayoutMargins:0];
  -[PHVoicemailGreetingSliderCell setSeparatorInset:](self, "setSeparatorInset:", UIEdgeInsetsZero.top, left, bottom, right);
}

- (void)loadContentView
{
  v10.receiver = self;
  v10.super_class = (Class)PHVoicemailGreetingSliderCell;
  [(PHVoicemailGreetingSliderCell *)&v10 loadContentView];
  v3 = (UIProgressView *)[objc_alloc((Class)UIProgressView) initWithProgressViewStyle:0];
  progressView = self->_progressView;
  self->_progressView = v3;

  [(UIProgressView *)self->_progressView setProgress:0.0];
  v5 = +[UIColor systemRedColor];
  [(UIProgressView *)self->_progressView setProgressTintColor:v5];

  [(UIProgressView *)self->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = [(PHVoicemailGreetingSliderCell *)self contentView];
  [v6 addSubview:self->_progressView];

  v7 = objc_alloc_init(VMPlayerTimelineSlider);
  timelineSlider = self->_timelineSlider;
  self->_timelineSlider = v7;

  [(VMPlayerTimelineSlider *)self->_timelineSlider setAlpha:0.0];
  [(VMPlayerTimelineSlider *)self->_timelineSlider setDelegate:self];
  [(VMPlayerTimelineSlider *)self->_timelineSlider setLabelsEnabled:0];
  [(VMPlayerTimelineSlider *)self->_timelineSlider setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(PHVoicemailGreetingSliderCell *)self contentView];
  [v9 addSubview:self->_timelineSlider];
}

- (void)loadConstraints
{
  v43.receiver = self;
  v43.super_class = (Class)PHVoicemailGreetingSliderCell;
  [(PHVoicemailGreetingSliderCell *)&v43 loadConstraints];
  v3 = [(PHVoicemailGreetingSliderCell *)self progressView];
  v4 = [v3 leadingAnchor];
  v5 = [(PHVoicemailGreetingSliderCell *)self contentView];
  objc_super v6 = [v5 leadingAnchor];
  v7 = [v4 constraintEqualToAnchor:v6 constant:15.0];

  v8 = NSStringFromSelector("progressViewLeadingAnchorConstraint");
  [v7 setIdentifier:v8];

  [v7 setActive:1];
  [(PHVoicemailGreetingSliderCell *)self setProgressViewLeadingAnchorConstraint:v7];
  v9 = [(PHVoicemailGreetingSliderCell *)self contentView];
  objc_super v10 = [v9 trailingAnchor];
  v11 = [(PHVoicemailGreetingSliderCell *)self progressView];
  v12 = [v11 trailingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 constant:15.0];

  v14 = NSStringFromSelector("progressViewTrailingAnchorConstraint");
  [v13 setIdentifier:v14];

  [v13 setActive:1];
  [(PHVoicemailGreetingSliderCell *)self setProgressViewTrailingAnchorConstraint:v13];
  v15 = [(PHVoicemailGreetingSliderCell *)self progressView];
  v16 = [v15 centerYAnchor];
  v17 = [(PHVoicemailGreetingSliderCell *)self contentView];
  v18 = [v17 centerYAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];

  v20 = NSStringFromSelector("progressViewCenterYAnchorConstraint");
  [v19 setIdentifier:v20];

  [v19 setActive:1];
  [(PHVoicemailGreetingSliderCell *)self setProgressViewCenterYAnchorConstraint:v19];
  v21 = [(PHVoicemailGreetingSliderCell *)self progressView];
  v22 = [v21 heightAnchor];
  [(PHVoicemailGreetingSliderCell *)self progressViewHeightAnchorConstraintConstant];
  v23 = [v22 constraintEqualToConstant:];

  v24 = NSStringFromSelector("progressViewHeightAnchorConstraint");
  [v23 setIdentifier:v24];

  [v23 setActive:1];
  [(PHVoicemailGreetingSliderCell *)self setProgressViewHeightAnchorConstraint:v23];
  v25 = [(PHVoicemailGreetingSliderCell *)self timelineSlider];
  v26 = [v25 leadingAnchor];
  v27 = [(PHVoicemailGreetingSliderCell *)self progressView];
  v28 = [v27 leadingAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];

  v30 = NSStringFromSelector("timelineSliderLeadingAnchorConstraint");
  [v29 setIdentifier:v30];

  [v29 setActive:1];
  [(PHVoicemailGreetingSliderCell *)self setTimelineSliderLeadingAnchorConstraint:v29];
  v31 = [(PHVoicemailGreetingSliderCell *)self progressView];
  v32 = [v31 trailingAnchor];
  v33 = [(PHVoicemailGreetingSliderCell *)self timelineSlider];
  v34 = [v33 trailingAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];

  v36 = NSStringFromSelector("timelineSliderTrailingAnchorConstraint");
  [v35 setIdentifier:v36];

  [v35 setActive:1];
  [(PHVoicemailGreetingSliderCell *)self setTimelineSliderTrailingAnchorConstraint:v35];
  v37 = [(PHVoicemailGreetingSliderCell *)self timelineSlider];
  v38 = [v37 centerYAnchor];
  v39 = [(PHVoicemailGreetingSliderCell *)self progressView];
  v40 = [v39 centerYAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];

  v42 = NSStringFromSelector("timelineSliderCenterYAnchorConstraint");
  [v41 setIdentifier:v42];

  [v41 setActive:1];
  [(PHVoicemailGreetingSliderCell *)self setTimelineSliderCenterYAnchorConstraint:v41];
}

- (void)unloadConstraints
{
  v10.receiver = self;
  v10.super_class = (Class)PHVoicemailGreetingSliderCell;
  [(PHVoicemailGreetingSliderCell *)&v10 unloadConstraints];
  v3 = [(PHVoicemailGreetingSliderCell *)self progressViewCenterYAnchorConstraint];
  [v3 setActive:0];

  v4 = [(PHVoicemailGreetingSliderCell *)self progressViewHeightAnchorConstraint];
  [v4 setActive:0];

  v5 = [(PHVoicemailGreetingSliderCell *)self progressViewLeadingAnchorConstraint];
  [v5 setActive:0];

  objc_super v6 = [(PHVoicemailGreetingSliderCell *)self progressViewTrailingAnchorConstraint];
  [v6 setActive:0];

  v7 = [(PHVoicemailGreetingSliderCell *)self timelineSliderCenterYAnchorConstraint];
  [v7 setActive:0];

  v8 = [(PHVoicemailGreetingSliderCell *)self timelineSliderLeadingAnchorConstraint];
  [v8 setActive:0];

  v9 = [(PHVoicemailGreetingSliderCell *)self timelineSliderTrailingAnchorConstraint];
  [v9 setActive:0];
}

- (void)updateConstraintsConstants
{
  v6.receiver = self;
  v6.super_class = (Class)PHVoicemailGreetingSliderCell;
  [(PHVoicemailGreetingSliderCell *)&v6 updateConstraintsConstants];
  [(PHVoicemailGreetingSliderCell *)self progressViewHeightAnchorConstraintConstant];
  double v4 = v3;
  v5 = [(PHVoicemailGreetingSliderCell *)self progressViewHeightAnchorConstraint];
  [v5 setConstant:v4];
}

- (void)playerTimelineSlider:(id)a3 didChangeElapsedTime:(double)a4
{
  v5 = +[PHVoicemailPlayerController sharedPlayerController];
  CMTimeMake(&v6, (uint64_t)a4, 1);
  [v5 seekToTime:&v6];
}

- (void)showProgressView
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __49__PHVoicemailGreetingSliderCell_showProgressView__block_invoke;
  v2[3] = &unk_10027C670;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:0.300000012];
}

void __49__PHVoicemailGreetingSliderCell_showProgressView__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) progressView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) timelineSlider];
  [v3 setAlpha:0.0];
}

- (void)showTimelineSlider
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __51__PHVoicemailGreetingSliderCell_showTimelineSlider__block_invoke;
  v2[3] = &unk_10027C670;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:0.300000012];
}

void __51__PHVoicemailGreetingSliderCell_showTimelineSlider__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) progressView];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) timelineSlider];
  [v3 setAlpha:1.0];
}

- (double)progressViewHeightAnchorConstraintConstant
{
  unsigned int v2 = [(PHVoicemailGreetingSliderCell *)self isAccessiblityConstraintsEnabled];
  double result = 7.0;
  if (v2) {
    return 14.0;
  }
  return result;
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (VMPlayerTimelineSlider)timelineSlider
{
  return self->_timelineSlider;
}

- (NSLayoutConstraint)progressViewCenterYAnchorConstraint
{
  return self->_progressViewCenterYAnchorConstraint;
}

- (void)setProgressViewCenterYAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)progressViewHeightAnchorConstraint
{
  return self->_progressViewHeightAnchorConstraint;
}

- (void)setProgressViewHeightAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)progressViewLeadingAnchorConstraint
{
  return self->_progressViewLeadingAnchorConstraint;
}

- (void)setProgressViewLeadingAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)progressViewTrailingAnchorConstraint
{
  return self->_progressViewTrailingAnchorConstraint;
}

- (void)setProgressViewTrailingAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)timelineSliderCenterYAnchorConstraint
{
  return self->_timelineSliderCenterYAnchorConstraint;
}

- (void)setTimelineSliderCenterYAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)timelineSliderLeadingAnchorConstraint
{
  return self->_timelineSliderLeadingAnchorConstraint;
}

- (void)setTimelineSliderLeadingAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)timelineSliderTrailingAnchorConstraint
{
  return self->_timelineSliderTrailingAnchorConstraint;
}

- (void)setTimelineSliderTrailingAnchorConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineSliderTrailingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_timelineSliderLeadingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_timelineSliderCenterYAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_progressViewTrailingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_progressViewLeadingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_progressViewHeightAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_progressViewCenterYAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_timelineSlider, 0);

  objc_storeStrong((id *)&self->_progressView, 0);
}

@end