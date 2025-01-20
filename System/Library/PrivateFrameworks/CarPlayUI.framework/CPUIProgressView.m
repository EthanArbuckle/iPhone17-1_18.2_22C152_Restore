@interface CPUIProgressView
- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot;
- (BOOL)showsProgressLabels;
- (CGSize)intrinsicContentSize;
- (CPUIProgressView)initWithFrame:(CGRect)a3;
- (CPUIProgressView)initWithFrame:(CGRect)a3 progressBarHeight:(double)a4 labelHeight:(double)a5 labelStyle:(unint64_t)a6;
- (UIColor)barColor;
- (UIColor)trackColor;
- (void)_displayLinkTick:(id)a3;
- (void)_updateLabelsForElapsedTime:(double)a3 duration:(double)a4;
- (void)_updateProgressForElapsedTime:(double)a3 duration:(double)a4;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)pauseDisplayLinkIfNeeded;
- (void)runUntilNextDisplayLinkEvent;
- (void)setBarColor:(id)a3;
- (void)setDurationSnapshot:(id *)a3;
- (void)setShowsProgressLabels:(BOOL)a3;
- (void)setTrackColor:(id)a3;
- (void)setupConstraints;
- (void)updateLocalizedDurationString:(id)a3;
@end

@implementation CPUIProgressView

- (CPUIProgressView)initWithFrame:(CGRect)a3
{
  return -[CPUIProgressView initWithFrame:progressBarHeight:labelHeight:labelStyle:](self, "initWithFrame:progressBarHeight:labelHeight:labelStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 6.0, 12.0);
}

- (CPUIProgressView)initWithFrame:(CGRect)a3 progressBarHeight:(double)a4 labelHeight:(double)a5 labelStyle:(unint64_t)a6
{
  v19.receiver = self;
  v19.super_class = (Class)CPUIProgressView;
  v9 = -[CPUIProgressView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    v9->_labelStyle = a6;
    v9->_progressBarViewHeight = a4;
    v9->_progressLabelHeight = a5;
    v11 = [CPUIProgressBarView alloc];
    uint64_t v12 = -[CPUIProgressBarView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    progressBarView = v10->_progressBarView;
    v10->_progressBarView = (CPUIProgressBarView *)v12;

    [(CPUIProgressBarView *)v10->_progressBarView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUIProgressBarView *)v10->_progressBarView setHidden:1];
    [(CPUIProgressView *)v10 addSubview:v10->_progressBarView];
    v14 = [(CPUIProgressView *)v10 layer];
    [v14 setCreatesCompositingGroup:1];

    v15 = [(CPUIProgressView *)v10 layer];
    [v15 setAllowsGroupBlending:1];

    v16 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    v17 = [(CPUIProgressView *)v10 layer];
    [v17 setCompositingFilter:v16];

    [(CPUIProgressView *)v10 setShowsProgressLabels:1];
  }
  return v10;
}

- (UIColor)trackColor
{
  return [(CPUIProgressBarView *)self->_progressBarView trackColor];
}

- (void)setTrackColor:(id)a3
{
}

- (UIColor)barColor
{
  return [(CPUIProgressBarView *)self->_progressBarView barColor];
}

- (void)setBarColor:(id)a3
{
}

- (void)setShowsProgressLabels:(BOOL)a3
{
  if (self->_showsProgressLabels != a3)
  {
    self->_showsProgressLabels = a3;
    if (a3)
    {
      unint64_t labelStyle = self->_labelStyle;
      v5 = [MEMORY[0x263F81708] monospacedDigitSystemFontOfSize:self->_progressLabelHeight weight:*MEMORY[0x263F81838]];
      if (!self->_timeLabel)
      {
        id v6 = objc_alloc(MEMORY[0x263F828E0]);
        [(CPUIProgressView *)self bounds];
        v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:");
        timeLabel = self->_timeLabel;
        self->_timeLabel = v7;

        [(UILabel *)self->_timeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UILabel *)self->_timeLabel setFont:v5];
        v9 = self->_timeLabel;
        if (labelStyle == 1) {
          [MEMORY[0x263F825C8] secondaryLabelColor];
        }
        else {
        v10 = [MEMORY[0x263F825C8] labelColor];
        }
        [(UILabel *)v9 setTextColor:v10];

        [(UILabel *)self->_timeLabel setTextAlignment:1];
        [(UILabel *)self->_timeLabel setAccessibilityIdentifier:@"CPNowPlayingProgressBarTime"];
      }
      if (!self->_timeRemainingLabel)
      {
        id v11 = objc_alloc(MEMORY[0x263F828E0]);
        [(CPUIProgressView *)self bounds];
        uint64_t v12 = (UILabel *)objc_msgSend(v11, "initWithFrame:");
        timeRemainingLabel = self->_timeRemainingLabel;
        self->_timeRemainingLabel = v12;

        [(UILabel *)self->_timeRemainingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UILabel *)self->_timeRemainingLabel setFont:v5];
        [(UILabel *)self->_timeRemainingLabel setTextAlignment:1];
        v14 = self->_timeRemainingLabel;
        if (labelStyle == 1) {
          [MEMORY[0x263F825C8] secondaryLabelColor];
        }
        else {
        v15 = [MEMORY[0x263F825C8] labelColor];
        }
        [(UILabel *)v14 setTextColor:v15];

        [(UILabel *)self->_timeRemainingLabel setAccessibilityIdentifier:@"CPNowPlayingProgressBarTimeRemaining"];
      }
      if (!self->_liveLabel)
      {
        id v16 = objc_alloc(MEMORY[0x263F828E0]);
        v17 = (UILabel *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        liveLabel = self->_liveLabel;
        self->_liveLabel = v17;

        [(UILabel *)self->_liveLabel setTranslatesAutoresizingMaskIntoConstraints:0];
        objc_super v19 = self->_liveLabel;
        if (labelStyle == 1) {
          [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
        }
        else {
        v20 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
        }
        [(UILabel *)v19 setFont:v20];

        [(UILabel *)self->_liveLabel setTextAlignment:1];
        v21 = self->_liveLabel;
        v22 = [MEMORY[0x263F825C8] labelColor];
        [(UILabel *)v21 setTextColor:v22];

        [(UILabel *)self->_liveLabel setHidden:1];
        [(UILabel *)self->_liveLabel setAccessibilityIdentifier:@"CPNowPlayingProgressBarLive"];
      }
      if (!self->_liveTrackView)
      {
        v23 = [_CPUILiveTrackView alloc];
        v24 = -[_CPUILiveTrackView initWithFrame:](v23, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        liveTrackView = self->_liveTrackView;
        self->_liveTrackView = v24;

        [(_CPUILiveTrackView *)self->_liveTrackView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(_CPUILiveTrackView *)self->_liveTrackView setHidden:1];
        [(_CPUILiveTrackView *)self->_liveTrackView setAccessibilityIdentifier:@"CPNowPlayingProgressBarLiveTrackView"];
      }
      [(CPUIProgressView *)self addSubview:self->_timeLabel];
      [(CPUIProgressView *)self addSubview:self->_timeRemainingLabel];
      [(CPUIProgressView *)self addSubview:self->_liveLabel];
      [(CPUIProgressView *)self addSubview:self->_liveTrackView];
    }
    else
    {
      [(UILabel *)self->_timeLabel removeFromSuperview];
      [(UILabel *)self->_timeRemainingLabel removeFromSuperview];
      [(UILabel *)self->_liveLabel removeFromSuperview];
      [(_CPUILiveTrackView *)self->_liveTrackView removeFromSuperview];
    }
    [(CPUIProgressView *)self setupConstraints];
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  double progressBarViewHeight = self->_progressBarViewHeight;
  result.height = progressBarViewHeight;
  result.width = v2;
  return result;
}

- (void)didMoveToWindow
{
  v11.receiver = self;
  v11.super_class = (Class)CPUIProgressView;
  [(CPUIProgressView *)&v11 didMoveToWindow];
  v3 = [(CPUIProgressView *)self window];

  if (v3)
  {
    v4 = [(CPUIProgressView *)self window];
    v5 = [v4 screen];
    id v6 = [v5 displayLinkWithTarget:self selector:sel__displayLinkTick_];
    displayLink = self->_displayLink;
    self->_displayLink = v6;

    v8 = self->_displayLink;
    v9 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [(CADisplayLink *)v8 addToRunLoop:v9 forMode:*MEMORY[0x263EFF588]];

    [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:15];
  }
  else
  {
    [(CADisplayLink *)self->_displayLink invalidate];
    v10 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)setupConstraints
{
  v77[4] = *MEMORY[0x263EF8340];
  if (self->_constraints) {
    objc_msgSend(MEMORY[0x263F08938], "deactivateConstraints:");
  }
  v3 = (void *)MEMORY[0x263EFF980];
  v4 = [(CPUIProgressBarView *)self->_progressBarView heightAnchor];
  v5 = [v4 constraintEqualToConstant:self->_progressBarViewHeight];
  id v6 = [v3 arrayWithObject:v5];

  unint64_t v7 = 0x263EFF000uLL;
  if ([(CPUIProgressView *)self showsProgressLabels])
  {
    v70 = [(UILabel *)self->_liveLabel centerYAnchor];
    v67 = [(CPUIProgressView *)self centerYAnchor];
    v64 = [v70 constraintEqualToAnchor:v67];
    v77[0] = v64;
    v61 = [(UILabel *)self->_liveLabel centerXAnchor];
    v59 = [(CPUIProgressView *)self centerXAnchor];
    [v61 constraintEqualToAnchor:v59];
    v8 = v58 = v6;
    v77[1] = v8;
    v9 = [(UILabel *)self->_timeLabel leftAnchor];
    v10 = [(CPUIProgressView *)self leftAnchor];
    objc_super v11 = [v9 constraintEqualToAnchor:v10];
    v77[2] = v11;
    uint64_t v12 = [(UILabel *)self->_timeRemainingLabel rightAnchor];
    v13 = [(CPUIProgressView *)self rightAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v77[3] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:4];
    [v6 addObjectsFromArray:v15];

    v71 = [(_CPUILiveTrackView *)self->_liveTrackView leadingAnchor];
    v68 = [(CPUIProgressView *)self leadingAnchor];
    v65 = [v71 constraintEqualToAnchor:v68];
    v76[0] = v65;
    v62 = [(_CPUILiveTrackView *)self->_liveTrackView trailingAnchor];
    id v16 = [(CPUIProgressView *)self trailingAnchor];
    v17 = [v62 constraintEqualToAnchor:v16];
    v76[1] = v17;
    v18 = [(_CPUILiveTrackView *)self->_liveTrackView centerYAnchor];
    objc_super v19 = [(CPUIProgressView *)self centerYAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v76[2] = v20;
    v21 = [(_CPUILiveTrackView *)self->_liveTrackView heightAnchor];
    v22 = v21;
    double v23 = 6.0;
    if (self->_labelStyle == 1) {
      double v23 = 11.0;
    }
    v24 = [v21 constraintEqualToConstant:v23];
    v76[3] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:4];
    [v58 addObjectsFromArray:v25];

    timeLabel = self->_timeLabel;
    if (self->_labelStyle)
    {
      v49 = [(UILabel *)timeLabel topAnchor];
      uint64_t v53 = [(CPUIProgressBarView *)self->_progressBarView bottomAnchor];
      v72 = [v49 constraintEqualToAnchor:v53 constant:6.0];
      v74[0] = v72;
      v27 = [(UILabel *)self->_timeLabel leftAnchor];
      v66 = [(CPUIProgressView *)self leftAnchor];
      v69 = v27;
      v63 = objc_msgSend(v27, "constraintEqualToAnchor:");
      v74[1] = v63;
      v51 = [(UILabel *)self->_timeRemainingLabel topAnchor];
      v60 = [(CPUIProgressBarView *)self->_progressBarView bottomAnchor];
      v28 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", 6.0);
      v74[2] = v28;
      v29 = [(CPUIProgressBarView *)self->_progressBarView topAnchor];
      uint64_t v57 = [(CPUIProgressView *)self topAnchor];
      v55 = [v29 constraintEqualToAnchor:v57];
      v74[3] = v55;
      v48 = [(CPUIProgressBarView *)self->_progressBarView leftAnchor];
      v30 = [(CPUIProgressView *)self leftAnchor];
      v31 = [v48 constraintEqualToAnchor:v30];
      v74[4] = v31;
      v32 = [(CPUIProgressBarView *)self->_progressBarView rightAnchor];
      v33 = [(CPUIProgressView *)self rightAnchor];
      v34 = [v32 constraintEqualToAnchor:v33];
      v74[5] = v34;
      v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:6];
      id v6 = v58;
      [v58 addObjectsFromArray:v35];

      v36 = v49;
      unint64_t v7 = 0x263EFF000;

      v37 = (void *)v53;
      v38 = v51;

      v39 = (void *)v57;
    }
    else
    {
      v36 = [(UILabel *)timeLabel centerYAnchor];
      uint64_t v54 = [(CPUIProgressView *)self centerYAnchor];
      v72 = [v36 constraintEqualToAnchor:v54];
      v75[0] = v72;
      v41 = [(UILabel *)self->_timeRemainingLabel centerYAnchor];
      v66 = [(UILabel *)self->_timeLabel centerYAnchor];
      v69 = v41;
      v63 = objc_msgSend(v41, "constraintEqualToAnchor:");
      v75[1] = v63;
      v52 = [(CPUIProgressBarView *)self->_progressBarView centerYAnchor];
      v60 = [(UILabel *)self->_timeLabel centerYAnchor];
      v28 = objc_msgSend(v52, "constraintEqualToAnchor:constant:", 0.5);
      v75[2] = v28;
      v29 = [(CPUIProgressBarView *)self->_progressBarView leftAnchor];
      uint64_t v56 = [(UILabel *)self->_timeLabel rightAnchor];
      v50 = [v29 constraintEqualToAnchor:v56 constant:4.0];
      v75[3] = v50;
      v42 = [(CPUIProgressBarView *)self->_progressBarView rightAnchor];
      v43 = [(UILabel *)self->_timeRemainingLabel leftAnchor];
      v44 = [v42 constraintEqualToAnchor:v43 constant:-4.0];
      v75[4] = v44;
      unint64_t v7 = 0x263EFF000uLL;
      v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:5];
      id v6 = v58;
      [v58 addObjectsFromArray:v45];

      v37 = (void *)v54;
      v38 = v52;

      v39 = (void *)v56;
    }
  }
  else
  {
    v36 = [(CPUIProgressBarView *)self->_progressBarView leadingAnchor];
    v37 = [(CPUIProgressView *)self leadingAnchor];
    v72 = [v36 constraintEqualToAnchor:v37];
    v73[0] = v72;
    v40 = [(CPUIProgressBarView *)self->_progressBarView trailingAnchor];
    v66 = [(CPUIProgressView *)self trailingAnchor];
    v69 = v40;
    v63 = objc_msgSend(v40, "constraintEqualToAnchor:");
    v73[1] = v63;
    v38 = [(CPUIProgressBarView *)self->_progressBarView centerYAnchor];
    v60 = [(CPUIProgressView *)self centerYAnchor];
    v28 = objc_msgSend(v38, "constraintEqualToAnchor:");
    v73[2] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:3];
    [v6 addObjectsFromArray:v29];
  }

  v46 = [*(id *)(v7 + 2240) arrayWithArray:v6];
  constraints = self->_constraints;
  self->_constraints = v46;

  [MEMORY[0x263F08938] activateConstraints:v6];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CPUIProgressView;
  [(CPUIProgressView *)&v7 layoutSubviews];
  [(UILabel *)self->_timeLabel invalidateIntrinsicContentSize];
  [(UILabel *)self->_timeRemainingLabel invalidateIntrinsicContentSize];
  [(UILabel *)self->_liveLabel invalidateIntrinsicContentSize];
  [(_CPUILiveTrackView *)self->_liveTrackView bounds];
  CGFloat v3 = CGRectGetHeight(v8) * 0.5;
  v4 = [(_CPUILiveTrackView *)self->_liveTrackView layer];
  [v4 setCornerRadius:v3];

  [(UILabel *)self->_liveLabel bounds];
  double v5 = CGRectGetWidth(v9) + 8.0;
  [(_CPUILiveTrackView *)self->_liveTrackView bounds];
  double Width = CGRectGetWidth(v10);
  if (Width < 1.0) {
    double Width = 1.0;
  }
  [(_CPUILiveTrackView *)self->_liveTrackView setErasedPercentage:v5 / Width];
}

- (void)updateLocalizedDurationString:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    CPUILocalizedStringForKey(@"LIVE_STREAMING");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;
  liveLabel = self->_liveLabel;
  CGRect v8 = [v5 localizedUppercaseString];
  [(UILabel *)liveLabel setText:v8];
}

- (void)setDurationSnapshot:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = CarPlayUIGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double var3 = a3->var3;
    double var4 = a3->var4;
    int v20 = 134218240;
    double v21 = var3;
    __int16 v22 = 2048;
    double v23 = var4;
    _os_log_impl(&dword_227AC2000, v5, OS_LOG_TYPE_DEFAULT, "Progress view set duration: %f, with elapsed duration: %f", (uint8_t *)&v20, 0x16u);
  }

  long long v9 = *(_OWORD *)&a3->var2;
  long long v8 = *(_OWORD *)&a3->var4;
  long long v10 = *(_OWORD *)&a3->var0;
  *(void *)&self->_durationSnapshot.isLiveContent = *(void *)&a3->var7;
  *(_OWORD *)&self->_durationSnapshot.endTime = v9;
  *(_OWORD *)&self->_durationSnapshot.elapsedDuration = v8;
  *(_OWORD *)&self->_durationSnapshot.snapshotTime = v10;
  BOOL var7 = a3->var7;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double duration = self->_durationSnapshot.elapsedDuration
           + (v12 - self->_durationSnapshot.snapshotTime) * self->_durationSnapshot.rate;
  if (duration >= self->_durationSnapshot.duration) {
    double duration = self->_durationSnapshot.duration;
  }
  double v14 = fmax(duration, 0.0);
  if ([(CPUIProgressView *)self showsProgressLabels]) {
    [(CPUIProgressView *)self _updateLabelsForElapsedTime:v14 duration:self->_durationSnapshot.duration];
  }
  [(CPUIProgressView *)self _updateProgressForElapsedTime:v14 duration:self->_durationSnapshot.duration];
  BOOL v15 = [(CPUIProgressView *)self showsProgressLabels];
  BOOL v16 = !var7;
  BOOL v17 = !var7;
  uint64_t v18 = !v16;
  uint64_t v19 = !v16 || !v15;
  [(UILabel *)self->_timeLabel setHidden:v19];
  [(UILabel *)self->_timeRemainingLabel setHidden:v19];
  [(CPUIProgressBarView *)self->_progressBarView setHidden:v18];
  [(UILabel *)self->_liveLabel setHidden:v17];
  [(_CPUILiveTrackView *)self->_liveTrackView setHidden:v17];
  [(CPUIProgressView *)self setNeedsDisplay];
  [(CPUIProgressView *)self runUntilNextDisplayLinkEvent];
}

- (void)_displayLinkTick:(id)a3
{
  objc_msgSend(MEMORY[0x263EFF910], "timeIntervalSinceReferenceDate", a3);
  double v5 = v4;
  double duration = self->_durationSnapshot.elapsedDuration
           + (v4 - self->_durationSnapshot.snapshotTime) * self->_durationSnapshot.rate;
  if (duration >= self->_durationSnapshot.duration) {
    double duration = self->_durationSnapshot.duration;
  }
  double v7 = fmax(duration, 0.0);
  if ([(CPUIProgressView *)self showsProgressLabels])
  {
    double v8 = v5 - self->_lastTargetTimestamp;
    if (v8 < 0.0) {
      double v8 = -v8;
    }
    float rate = self->_durationSnapshot.rate;
    if (rate < 0.0) {
      float rate = -rate;
    }
    if (rate <= 1.0) {
      double v10 = 1.0;
    }
    else {
      double v10 = 1.0 / rate;
    }
    if (v8 >= v10)
    {
      self->_lastTargetTimestamp = v5;
      [(CPUIProgressView *)self _updateLabelsForElapsedTime:v7 duration:self->_durationSnapshot.duration];
    }
  }
  [(CPUIProgressView *)self _updateProgressForElapsedTime:v7 duration:self->_durationSnapshot.duration];
  [(CPUIProgressView *)self setNeedsLayout];
  [(CPUIProgressView *)self pauseDisplayLinkIfNeeded];
}

- (void)_updateLabelsForElapsedTime:(double)a3 duration:(double)a4
{
  if (a4 <= 1.17549435e-38)
  {
    id v6 = &stru_26DC16290;
    double v14 = &stru_26DC16290;
    [(UILabel *)self->_timeLabel setText:&stru_26DC16290];
  }
  else
  {
    float v8 = a3;
    CPUITimeDurationForSeconds(v8);
    double v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (a4 - a3 >= 0.0) {
      double v9 = a4 - a3;
    }
    else {
      double v9 = 0.0;
    }
    double v10 = NSString;
    objc_super v11 = CPUILocalizedStringForKey(@"PROGRESS_TIME_WITH_NEGATIVE_PREFIX_%@");
    float v12 = v9;
    v13 = CPUITimeDurationForSeconds(v12);
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v13);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    [(UILabel *)self->_timeLabel setText:v14];
  }
  [(UILabel *)self->_timeRemainingLabel setText:v6];
}

- (void)_updateProgressForElapsedTime:(double)a3 duration:(double)a4
{
  if (fabs(a4) <= 0.00000011920929)
  {
    progressBarView = self->_progressBarView;
    double v6 = 0.0;
  }
  else
  {
    double v4 = a3 / a4;
    progressBarView = self->_progressBarView;
    if (v4 < 0.0) {
      double v4 = 0.0;
    }
    double v6 = fmin(v4, 1.0);
  }
  [(CPUIProgressBarView *)progressBarView setProgress:v6];
}

- (void)runUntilNextDisplayLinkEvent
{
  if ([(CADisplayLink *)self->_displayLink isPaused])
  {
    CGFloat v3 = CarPlayUIGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v4 = 0;
      _os_log_impl(&dword_227AC2000, v3, OS_LOG_TYPE_DEFAULT, "Progress view animation resumed", v4, 2u);
    }

    [(CADisplayLink *)self->_displayLink setPaused:0];
  }
}

- (void)pauseDisplayLinkIfNeeded
{
  p_durationSnapshot = &self->_durationSnapshot;
  if ((fabsf(self->_durationSnapshot.rate) <= 0.00000011921 || self->_durationSnapshot.isLiveContent)
    && ![(CADisplayLink *)self->_displayLink isPaused])
  {
    double v4 = CarPlayUIGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_227AC2000, v4, OS_LOG_TYPE_DEFAULT, "Progress view animation paused", v6, 2u);
    }

    BOOL v5 = fabsf(p_durationSnapshot->rate) <= 0.00000011921 || p_durationSnapshot->isLiveContent;
    [(CADisplayLink *)self->_displayLink setPaused:v5];
  }
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot
{
  long long v3 = *(_OWORD *)&self[9].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[9].var0;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->double var4 = *(_OWORD *)&self[9].var4;
  *(void *)&retstr->BOOL var7 = *(void *)&self[9].var7;
  return self;
}

- (BOOL)showsProgressLabels
{
  return self->_showsProgressLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_liveTrackView, 0);
  objc_storeStrong((id *)&self->_progressBarView, 0);
  objc_storeStrong((id *)&self->_liveLabel, 0);
  objc_storeStrong((id *)&self->_timeRemainingLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end