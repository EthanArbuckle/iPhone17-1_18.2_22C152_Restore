@interface VMPlayerControlsView
- (BOOL)constraintsLoaded;
- (BOOL)isEnabled;
- (UIButton)playPauseButton;
- (VMPlayerControlsDelegate)delegate;
- (VMPlayerControlsView)initWithCoder:(id)a3;
- (VMPlayerTimelineSlider)timelineSlider;
- (double)duration;
- (double)elapsedTime;
- (double)timelineSliderLeadingAnchorConstraintAccessibilityConstant;
- (double)timelineSliderTopAnchorConstraintAccessibilityConstant;
- (int64_t)state;
- (int64_t)style;
- (void)commonInit;
- (void)loadConstraints;
- (void)loadSubviews;
- (void)setConstraintsLoaded:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setElapsedTime:(double)a3;
- (void)setElapsedTime:(double)a3 animated:(BOOL)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setPlayPauseButton:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setState:(int64_t)a3 animated:(BOOL)a4;
- (void)setStyle:(int64_t)a3;
- (void)setTimelineSlider:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation VMPlayerControlsView

- (VMPlayerControlsView)initWithCoder:(id)a3
{
  return 0;
}

- (void)commonInit
{
  v3.receiver = self;
  v3.super_class = (Class)VMPlayerControlsView;
  [(VMPlayerControlsView *)&v3 commonInit];
  self->_constraintsLoaded = 0;
  self->_enabled = 1;
  self->_style = 0;
  [(VMPlayerControlsView *)self loadSubviews];
}

- (double)duration
{
  v2 = [(VMPlayerControlsView *)self timelineSlider];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (void)setDuration:(double)a3
{
  v5 = [(VMPlayerControlsView *)self timelineSlider];
  [v5 duration];
  double v7 = v6;

  if (v7 != a3)
  {
    id v8 = [(VMPlayerControlsView *)self timelineSlider];
    [v8 setDuration:a3];
  }
}

- (double)elapsedTime
{
  v2 = [(VMPlayerControlsView *)self timelineSlider];
  [v2 elapsedTime];
  double v4 = v3;

  return v4;
}

- (void)setElapsedTime:(double)a3
{
  id v4 = [(VMPlayerControlsView *)self timelineSlider];
  [v4 setElapsedTime:a3];
}

- (void)setElapsedTime:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(VMPlayerControlsView *)self timelineSlider];
  [v6 setElapsedTime:v4 animated:a3];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VMPlayerControlsView;
  -[VMPlayerControlsView setUserInteractionEnabled:](&v9, "setUserInteractionEnabled:");
  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    v5 = +[UIColor systemGrayColor];
    if (v3)
    {
      uint64_t v6 = +[UIColor systemBlueColor];

      v5 = (void *)v6;
    }
    double v7 = [(VMPlayerControlsView *)self timelineSlider];
    [v7 setUserInteractionEnabled:v3];

    id v8 = [(VMPlayerControlsView *)self timelineSlider];
    [v8 setTintColor:v5];
  }
}

- (void)setState:(int64_t)a3
{
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_state != a3) {
    self->_state = a3;
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style == a3) {
    return;
  }
  self->_style = a3;
  [(VMPlayerControlsView *)self unloadConstraints];
  if (a3 == 1)
  {
    double v7 = +[VMPlayerControlButton buttonWithState:0];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v8) = 1148846080;
    [v7 setContentHuggingPriority:0 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [v7 setContentHuggingPriority:1 forAxis:v9];
    [(VMPlayerControlsView *)self addSubview:v7];
    uint64_t v6 = v7;
    goto LABEL_7;
  }
  if (!a3)
  {
    v5 = [(VMPlayerControlsView *)self playPauseButton];
    uint64_t v6 = v5;
    if (!v5)
    {
LABEL_8:

      goto LABEL_9;
    }
    [v5 removeFromSuperview];
    double v7 = 0;
LABEL_7:
    [(VMPlayerControlsView *)self setPlayPauseButton:v7];
    goto LABEL_8;
  }
LABEL_9:

  [(VMPlayerControlsView *)self setNeedsUpdateConstraints];
}

- (void)loadSubviews
{
  BOOL v3 = objc_alloc_init(VMPlayerTimelineSlider);
  timelineSlider = self->_timelineSlider;
  self->_timelineSlider = v3;

  v5 = +[UIColor clearColor];
  [(VMPlayerTimelineSlider *)self->_timelineSlider setBackgroundColor:v5];

  [(VMPlayerTimelineSlider *)self->_timelineSlider setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v6) = 1144750080;
  [(VMPlayerTimelineSlider *)self->_timelineSlider setContentCompressionResistancePriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [(VMPlayerTimelineSlider *)self->_timelineSlider setContentCompressionResistancePriority:1 forAxis:v7];
  LODWORD(v8) = 1132068864;
  [(VMPlayerTimelineSlider *)self->_timelineSlider setContentHuggingPriority:0 forAxis:v8];
  LODWORD(v9) = 1148846080;
  [(VMPlayerTimelineSlider *)self->_timelineSlider setContentHuggingPriority:1 forAxis:v9];
  [(VMPlayerControlsView *)self addSubview:self->_timelineSlider];

  [(VMPlayerControlsView *)self setSemanticContentAttribute:1];
}

- (void)loadConstraints
{
  if (![(VMPlayerControlsView *)self constraintsLoaded])
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    unsigned int v4 = [(VMPlayerControlsView *)self isAccessiblityConstraintsEnabled];
    v5 = [(VMPlayerControlsView *)self timelineSlider];
    double v6 = [v5 topAnchor];
    double v7 = [(VMPlayerControlsView *)self topAnchor];
    if (v4)
    {
      [(VMPlayerControlsView *)self timelineSliderTopAnchorConstraintAccessibilityConstant];
      [v6 constraintEqualToAnchor:v7];
    }
    else
    {
      [v6 constraintEqualToAnchor:v7];
    double v8 = };

    [v3 addObject:v8];
    int64_t v9 = [(VMPlayerControlsView *)self style];
    if (v9 == 1)
    {
      v14 = [(VMPlayerControlsView *)self playPauseButton];
      v15 = [v14 leadingAnchor];
      v16 = [(VMPlayerControlsView *)self leadingAnchor];
      v17 = [v15 constraintEqualToAnchor:v16];

      [v3 addObject:v17];
      v18 = [(VMPlayerControlsView *)self timelineSlider];
      v19 = [v18 leadingAnchor];
      v20 = [(VMPlayerControlsView *)self playPauseButton];
      v21 = [v20 trailingAnchor];
      v22 = [v19 constraintEqualToAnchor:v21 constant:16.0];

      [v3 addObject:v22];
      v10 = [(VMPlayerControlsView *)self playPauseButton];
      v11 = [v10 centerYAnchor];
      v12 = [(VMPlayerControlsView *)self timelineSlider];
      double v8 = [v12 slider];
      v23 = [v8 centerYAnchor];
      uint64_t v13 = [v11 constraintEqualToAnchor:v23];
    }
    else
    {
      if (v9)
      {
LABEL_10:
        v24 = [(VMPlayerControlsView *)self timelineSlider];
        v25 = [v24 trailingAnchor];
        v26 = [(VMPlayerControlsView *)self trailingAnchor];
        v27 = [v25 constraintEqualToAnchor:v26];
        [v3 addObject:v27];

        v28 = [(VMPlayerControlsView *)self timelineSlider];
        v29 = [v28 bottomAnchor];
        v30 = [(VMPlayerControlsView *)self bottomAnchor];
        v31 = [v29 constraintEqualToAnchor:v30];
        [v3 addObject:v31];

        +[NSLayoutConstraint activateConstraints:v3];
        [(VMPlayerControlsView *)self setConstraintsLoaded:1];

        goto LABEL_11;
      }
      v10 = [(VMPlayerControlsView *)self timelineSlider];
      v11 = [v10 leadingAnchor];
      v12 = [(VMPlayerControlsView *)self leadingAnchor];
      uint64_t v13 = [v11 constraintEqualToAnchor:v12];
    }

    [v3 addObject:v13];
    double v8 = (void *)v13;
    goto LABEL_10;
  }
LABEL_11:
  v32.receiver = self;
  v32.super_class = (Class)VMPlayerControlsView;
  [(VMPlayerControlsView *)&v32 loadConstraints];
}

- (double)timelineSliderLeadingAnchorConstraintAccessibilityConstant
{
  return 7.0;
}

- (double)timelineSliderTopAnchorConstraintAccessibilityConstant
{
  return 9.0;
}

- (VMPlayerControlsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VMPlayerControlsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)style
{
  return self->_style;
}

- (UIButton)playPauseButton
{
  return self->_playPauseButton;
}

- (void)setPlayPauseButton:(id)a3
{
}

- (VMPlayerTimelineSlider)timelineSlider
{
  return self->_timelineSlider;
}

- (void)setTimelineSlider:(id)a3
{
}

- (BOOL)constraintsLoaded
{
  return self->_constraintsLoaded;
}

- (void)setConstraintsLoaded:(BOOL)a3
{
  self->_constraintsLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineSlider, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end