@interface MRUNowPlayingTimeControlsView
- (AVTimeFormatter)elapsedTimeFormatter;
- (AVTimeFormatter)remainingTimeFormatter;
- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3;
- (BOOL)debugPreviousDisplayLinkPaused;
- (BOOL)isDimmed;
- (BOOL)isOnScreen;
- (BOOL)leftAlignLive;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CADisplayLink)displayLink;
- (CAGradientLayer)liveBackgroundMask;
- (CGRect)hitRect;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUNowPlayingTimeControlsView)initWithFrame:(CGRect)a3;
- (MRUSlider)slider;
- (MRUTimeControls)timeControls;
- (MRUVisualStylingProvider)stylingProvider;
- (MSVTimer)updateElapsedTimeThrottleTimer;
- (NSRegularExpression)regexNumberDecimalDigit;
- (UILabel)elapsedTimeLabel;
- (UILabel)liveLabel;
- (UILabel)remainingTimeLabel;
- (UIView)liveBackground;
- (double)accessibilityElapsedDuration;
- (double)accessibilityTotalDuration;
- (double)contentScale;
- (double)sliderExpansionFactor;
- (double)sliderHeight;
- (double)timeLabelsAlpha;
- (id)viewForLastBaselineLayout;
- (int64_t)labelStyle;
- (int64_t)layout;
- (void)layoutSubviews;
- (void)layoutSubviewsLive;
- (void)layoutTimeLabels;
- (void)setContentScale:(double)a3;
- (void)setDebugPreviousDisplayLinkPaused:(BOOL)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setDisplayLink:(id)a3;
- (void)setElapsedTimeFormatter:(id)a3;
- (void)setElapsedTimeLabel:(id)a3;
- (void)setLayout:(int64_t)a3;
- (void)setLeftAlignLive:(BOOL)a3;
- (void)setLiveBackground:(id)a3;
- (void)setLiveBackgroundMask:(id)a3;
- (void)setLiveLabel:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setRegexNumberDecimalDigit:(id)a3;
- (void)setRemainingTimeFormatter:(id)a3;
- (void)setRemainingTimeLabel:(id)a3;
- (void)setSlider:(id)a3;
- (void)setSliderExpansionFactor:(double)a3;
- (void)setSliderHeight:(double)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTimeControls:(id)a3;
- (void)setTimeControls:(id)a3 forPresentationInterval:(id)a4;
- (void)setUpdateElapsedTimeThrottleTimer:(id)a3;
- (void)sliderTouchCancel:(id)a3;
- (void)sliderValueChanged:(id)a3;
- (void)updateBackgroundMask;
- (void)updateContentSizeCategory;
- (void)updateDisplayLink;
- (void)updateDisplayLinkPaused;
- (void)updateElapsedTime;
- (void)updateElapsedTimeForDate:(id)a3;
- (void)updateElapsedTimeOnDisplayLinkTick:(id)a3;
- (void)updateElapsedTimeWithElapsedTime:(double)a3;
- (void)updateElapsedTimeWithThrottle;
- (void)updateVisibility;
- (void)updateVisualStyling;
@end

@implementation MRUNowPlayingTimeControlsView

- (MRUNowPlayingTimeControlsView)initWithFrame:(CGRect)a3
{
  v38[6] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)MRUNowPlayingTimeControlsView;
  v3 = -[MRUNowPlayingTimeControlsView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_sliderHeight = 7.0;
    v5 = objc_alloc_init(MRUSlider);
    slider = v4->_slider;
    v4->_slider = v5;

    -[MRUSlider setHitRectInset:](v4->_slider, "setHitRectInset:", -24.0, -24.0, -24.0, -24.0);
    [(MRUSlider *)v4->_slider setExpansionFactor:1.71428571];
    [(MRUSlider *)v4->_slider setStretchLimit:8.0];
    [(MRUSlider *)v4->_slider setSemanticContentAttribute:3];
    objc_initWeak(&location, v4);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __47__MRUNowPlayingTimeControlsView_initWithFrame___block_invoke;
    v34[3] = &unk_1E5F0E120;
    objc_copyWeak(&v35, &location);
    [(MRUSlider *)v4->_slider setAnimations:v34];
    [(MRUSlider *)v4->_slider addTarget:v4 action:sel_sliderTouchDown_ forControlEvents:1];
    [(MRUSlider *)v4->_slider addTarget:v4 action:sel_sliderValueChanged_ forControlEvents:4544];
    [(MRUSlider *)v4->_slider addTarget:v4 action:sel_sliderTouchCancel_ forControlEvents:256];
    [(MRUNowPlayingTimeControlsView *)v4 addSubview:v4->_slider];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    elapsedTimeLabel = v4->_elapsedTimeLabel;
    v4->_elapsedTimeLabel = v7;

    [(MRUNowPlayingTimeControlsView *)v4 addSubview:v4->_elapsedTimeLabel];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    remainingTimeLabel = v4->_remainingTimeLabel;
    v4->_remainingTimeLabel = v9;

    [(MRUNowPlayingTimeControlsView *)v4 addSubview:v4->_remainingTimeLabel];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    liveLabel = v4->_liveLabel;
    v4->_liveLabel = v11;

    [(MRUNowPlayingTimeControlsView *)v4 addSubview:v4->_liveLabel];
    v13 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
    liveBackgroundMask = v4->_liveBackgroundMask;
    v4->_liveBackgroundMask = v13;

    -[CAGradientLayer setStartPoint:](v4->_liveBackgroundMask, "setStartPoint:", 0.0, 0.0);
    -[CAGradientLayer setEndPoint:](v4->_liveBackgroundMask, "setEndPoint:", 1.0, 0.0);
    id v15 = [MEMORY[0x1E4FB1618] blackColor];
    v38[0] = [v15 CGColor];
    id v16 = [MEMORY[0x1E4FB1618] blackColor];
    v38[1] = [v16 CGColor];
    id v17 = [MEMORY[0x1E4FB1618] clearColor];
    v38[2] = [v17 CGColor];
    id v18 = [MEMORY[0x1E4FB1618] clearColor];
    v38[3] = [v18 CGColor];
    id v19 = [MEMORY[0x1E4FB1618] blackColor];
    v38[4] = [v19 CGColor];
    id v20 = [MEMORY[0x1E4FB1618] blackColor];
    v38[5] = [v20 CGColor];
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:6];
    [(CAGradientLayer *)v4->_liveBackgroundMask setColors:v21];

    v22 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    liveBackground = v4->_liveBackground;
    v4->_liveBackground = v22;

    v24 = v4->_liveBackgroundMask;
    v25 = [(UIView *)v4->_liveBackground layer];
    [v25 setMask:v24];

    [(MRUNowPlayingTimeControlsView *)v4 addSubview:v4->_liveBackground];
    v26 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x1E4F166B8]);
    elapsedTimeFormatter = v4->_elapsedTimeFormatter;
    v4->_elapsedTimeFormatter = v26;

    [(AVTimeFormatter *)v4->_elapsedTimeFormatter setStyle:1];
    v28 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x1E4F166B8]);
    remainingTimeFormatter = v4->_remainingTimeFormatter;
    v4->_remainingTimeFormatter = v28;

    [(AVTimeFormatter *)v4->_remainingTimeFormatter setStyle:2];
    uint64_t v30 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\d" options:0 error:0];
    regexNumberDecimalDigit = v4->_regexNumberDecimalDigit;
    v4->_regexNumberDecimalDigit = (NSRegularExpression *)v30;

    v4->_contentScale = 1.0;
    v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:v4 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MRUNowPlayingTimeControlsView *)v4 updateContentSizeCategory];
    [(MRUNowPlayingTimeControlsView *)v4 updateVisibility];
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __47__MRUNowPlayingTimeControlsView_initWithFrame___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateVisualStyling];

  id v3 = objc_loadWeakRetained(v1);
  [v3 layoutTimeLabels];
}

- (void)layoutSubviews
{
  v93.receiver = self;
  v93.super_class = (Class)MRUNowPlayingTimeControlsView;
  [(MRUNowPlayingTimeControlsView *)&v93 layoutSubviews];
  if ([(MRUTimeControls *)self->_timeControls isLive])
  {
    [(MRUNowPlayingTimeControlsView *)self layoutSubviewsLive];
    return;
  }
  [(MRUNowPlayingTimeControlsView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MRUNowPlayingTimeControlsView *)self traitCollection];
  [v11 displayScale];

  int64_t layout = self->_layout;
  if (layout == 4)
  {
    v96.origin.x = v4;
    v96.origin.y = v6;
    v96.size.width = v8;
    v96.size.height = v10;
    double MinX = CGRectGetMinX(v96);
    v97.origin.x = v4;
    v97.origin.y = v6;
    v97.size.width = v8;
    v97.size.height = v10;
    CGFloat MinY = CGRectGetMinY(v97);
    v98.origin.y = v6;
    double v17 = MinY;
    v98.origin.x = v4;
    v98.size.width = v8;
    v98.size.height = v10;
    double Width = CGRectGetWidth(v98);
    double sliderHeight = self->_sliderHeight;
    -[MRUSlider setFrame:](self->_slider, "setFrame:", MinX, v17, Width, sliderHeight);
    v99.origin.x = MinX;
    CGFloat v92 = v17;
    v99.origin.y = v17;
    v99.size.width = Width;
    v99.size.height = sliderHeight;
    CGRectGetMaxY(v99);
    UIRectInset();
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    double v23 = v22;
    double v25 = v24;
    -[UILabel sizeThatFits:](self->_elapsedTimeLabel, "sizeThatFits:", v22, v24);
    MRUSizeCeilToViewScale(self);
    v100.origin.x = v19;
    v100.origin.y = v21;
    v100.size.width = v23;
    v100.size.height = v25;
    CGRectGetMinY(v100);
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_elapsedTimeLabel, "setFrame:");
    -[UILabel sizeThatFits:](self->_remainingTimeLabel, "sizeThatFits:", v23, v25);
    MRUSizeCeilToViewScale(self);
    CGFloat v26 = v19;
    double v14 = Width;
    v101.origin.x = v26;
    v101.origin.y = v21;
    v101.size.width = v23;
    v101.size.height = v25;
    CGRectGetMaxX(v101);
    v102.origin.x = v26;
    v102.origin.y = v21;
    v102.size.width = v23;
    v102.size.height = v25;
    CGRectGetMinY(v102);
    double v13 = MinX;
LABEL_9:
    UIRectIntegralWithScale();
    remainingTimeLabel = self->_remainingTimeLabel;
LABEL_15:
    objc_msgSend(remainingTimeLabel, "setFrame:", v43, v44, v45, v46, v85);
    goto LABEL_16;
  }
  if (layout == 3)
  {
    v103.origin.x = v4;
    v103.origin.y = v6;
    v103.size.width = v8;
    v103.size.height = v10;
    CGRectGetMinX(v103);
    v104.origin.x = v4;
    v104.origin.y = v6;
    v104.size.width = v8;
    v104.size.height = v10;
    CGRectGetWidth(v104);
    v27 = [(MRUNowPlayingTimeControlsView *)self traitCollection];
    [v27 displayScale];
    uint64_t v86 = v28;
    UIRectCenteredYInRectScale();
    double v30 = v29;
    double v91 = v29;
    double v32 = v31;
    double v14 = v33;
    double sliderHeight = v34;

    -[MRUSlider setFrame:](self->_slider, "setFrame:", v30, v32, v14, sliderHeight, v86);
    v105.origin.x = v30;
    CGFloat v92 = v32;
    v105.origin.y = v32;
    v105.size.width = v14;
    v105.size.height = sliderHeight;
    CGRectGetMaxY(v105);
    UIRectInset();
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    double v40 = v39;
    double v42 = v41;
    -[UILabel sizeThatFits:](self->_elapsedTimeLabel, "sizeThatFits:", v39, v41);
    MRUSizeCeilToViewScale(self);
    v106.origin.x = v36;
    v106.origin.y = v38;
    v106.size.width = v40;
    v106.size.height = v42;
    CGRectGetMinY(v106);
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_elapsedTimeLabel, "setFrame:");
    -[UILabel sizeThatFits:](self->_remainingTimeLabel, "sizeThatFits:", v40, v42);
    MRUSizeCeilToViewScale(self);
    v107.origin.x = v36;
    v107.origin.y = v38;
    v107.size.width = v40;
    v107.size.height = v42;
    CGRectGetMaxX(v107);
    v108.origin.x = v36;
    v108.origin.y = v38;
    v108.size.width = v40;
    v108.size.height = v42;
    CGRectGetMinY(v108);
    double v13 = v91;
    goto LABEL_9;
  }
  if (layout != 2)
  {
    -[UILabel sizeThatFits:](self->_elapsedTimeLabel, "sizeThatFits:", v8, v10);
    MRUSizeCeilToViewScale(self);
    v48 = [(MRUNowPlayingTimeControlsView *)self traitCollection];
    [v48 displayScale];
    uint64_t v87 = v49;
    UIRectCenteredYInRectScale();
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;

    -[UILabel setFrame:](self->_elapsedTimeLabel, "setFrame:", v51, v53, v55, v57, v87);
    if (([(UILabel *)self->_elapsedTimeLabel isHidden] & 1) == 0)
    {
      v109.origin.x = v51;
      v109.origin.y = v53;
      v109.size.width = v55;
      v109.size.height = v57;
      CGRectGetWidth(v109);
      UIRectInset();
      CGFloat v4 = v58;
      CGFloat v6 = v59;
      double v8 = v60;
      double v10 = v61;
    }
    -[UILabel sizeThatFits:](self->_remainingTimeLabel, "sizeThatFits:", v8, v10);
    MRUSizeCeilToViewScale(self);
    v110.origin.x = v4;
    v110.origin.y = v6;
    v110.size.width = v8;
    v110.size.height = v10;
    CGRectGetMaxX(v110);
    v62 = [(MRUNowPlayingTimeControlsView *)self traitCollection];
    [v62 displayScale];
    uint64_t v88 = v63;
    UIRectCenteredYInRectScale();
    double v65 = v64;
    double v67 = v66;
    double v69 = v68;
    double v71 = v70;

    -[UILabel setFrame:](self->_remainingTimeLabel, "setFrame:", v65, v67, v69, v71, v88);
    if (([(UILabel *)self->_remainingTimeLabel isHidden] & 1) == 0)
    {
      v111.origin.x = v65;
      v111.origin.y = v67;
      v111.size.width = v69;
      v111.size.height = v71;
      CGRectGetWidth(v111);
      UIRectInset();
      CGFloat v4 = v72;
      CGFloat v6 = v73;
      double v8 = v74;
      double v10 = v75;
    }
    v112.origin.x = v4;
    v112.origin.y = v6;
    v112.size.width = v8;
    v112.size.height = v10;
    CGRectGetMinX(v112);
    v113.origin.x = v4;
    v113.origin.y = v6;
    v113.size.width = v8;
    v113.size.height = v10;
    CGRectGetWidth(v113);
    v76 = [(MRUNowPlayingTimeControlsView *)self traitCollection];
    [v76 displayScale];
    uint64_t v85 = v77;
    UIRectCenteredYInRectScale();
    double v13 = v78;
    double v80 = v79;
    double v14 = v81;
    double sliderHeight = v82;

    remainingTimeLabel = self->_slider;
    double v43 = v13;
    CGFloat v92 = v80;
    double v44 = v80;
    double v45 = v14;
    double v46 = sliderHeight;
    goto LABEL_15;
  }
  v94.origin.x = v4;
  v94.origin.y = v6;
  v94.size.width = v8;
  v94.size.height = v10;
  double v13 = CGRectGetMinX(v94);
  v95.origin.x = v4;
  v95.origin.y = v6;
  v95.size.width = v8;
  v95.size.height = v10;
  double v14 = CGRectGetWidth(v95);
  double sliderHeight = self->_sliderHeight;
  CGFloat v92 = 0.0;
  -[MRUSlider setFrame:](self->_slider, "setFrame:", v13, 0.0, v14, sliderHeight);
  [(MRUNowPlayingTimeControlsView *)self layoutTimeLabels];
LABEL_16:
  v114.origin.x = v13;
  v114.origin.y = v92;
  v114.size.width = v14;
  v114.size.height = sliderHeight;
  CGFloat v83 = -CGRectGetMinX(v114);
  v115.origin.x = v13;
  v115.origin.y = v92;
  v115.size.width = v14;
  v115.size.height = sliderHeight;
  double MaxX = CGRectGetMaxX(v115);
  [(MRUNowPlayingTimeControlsView *)self bounds];
  -[MRUSlider setHitRectInset:](self->_slider, "setHitRectInset:", -24.0, v83, -24.0, MaxX - CGRectGetWidth(v116));
}

- (void)layoutSubviewsLive
{
  [(MRUNowPlayingTimeControlsView *)self bounds];
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;
  CGRect v29 = CGRectInset(v28, 20.0, 0.0);
  -[UILabel sizeThatFits:](self->_liveLabel, "sizeThatFits:", v29.size.width, v29.size.height);
  UIRectGetCenter();
  double v5 = [(MRUNowPlayingTimeControlsView *)self traitCollection];
  [v5 displayScale];
  UIRectCenteredAboutPointScale();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[UILabel setFrame:](self->_liveLabel, "setFrame:", v7, v9, v11, v13);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGRectGetWidth(v30);
  double v14 = [(MRUNowPlayingTimeControlsView *)self traitCollection];
  [v14 displayScale];
  uint64_t v24 = v15;
  UIRectCenteredYInRectScale();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  -[UIView setFrame:](self->_liveBackground, "setFrame:", v17, v19, v21, v23, v24);
  v31.origin.CGFloat x = v17;
  v31.origin.CGFloat y = v19;
  v31.size.CGFloat width = v21;
  v31.size.CGFloat height = v23;
  [(UIView *)self->_liveBackground _setContinuousCornerRadius:CGRectGetHeight(v31) * 0.5];

  [(MRUNowPlayingTimeControlsView *)self updateBackgroundMask];
}

- (void)layoutTimeLabels
{
  if (self->_layout == 2)
  {
    double v3 = 0.0;
    if ([(MRUSlider *)self->_slider isTracking])
    {
      double sliderHeight = self->_sliderHeight;
      [(MRUSlider *)self->_slider expansionFactor];
      double v3 = -(self->_sliderHeight - sliderHeight * v5) * 0.5;
    }
    [(MRUNowPlayingTimeControlsView *)self bounds];
    [(MRUSlider *)self->_slider frame];
    UIRectInset();
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    double v11 = v10;
    double v13 = v12;
    -[UILabel sizeThatFits:](self->_elapsedTimeLabel, "sizeThatFits:", v10, v12);
    double v32 = MRUSizeCeilToViewScale(self);
    double v33 = v14;
    double v15 = v14;
    v37.origin.CGFloat x = v7;
    v37.origin.CGFloat y = v9;
    v37.size.CGFloat width = v11;
    v37.size.CGFloat height = v13;
    double v16 = v3;
    double v17 = v3 + CGRectGetMinY(v37);
    [(UILabel *)self->_elapsedTimeLabel bounds];
    double v34 = v18;
    double v35 = v19;
    -[UILabel setFrame:](self->_elapsedTimeLabel, "setFrame:", 0.0, v17, v32, v15);
    -[UILabel sizeThatFits:](self->_remainingTimeLabel, "sizeThatFits:", v11, v13);
    double v20 = MRUSizeCeilToViewScale(self);
    double v22 = v21;
    v38.origin.CGFloat x = v7;
    v38.origin.CGFloat y = v9;
    v38.size.CGFloat width = v11;
    v38.size.CGFloat height = v13;
    CGFloat v23 = CGRectGetMaxX(v38) - v20;
    v39.origin.CGFloat x = v7;
    v39.origin.CGFloat y = v9;
    v39.size.CGFloat width = v11;
    v39.size.CGFloat height = v13;
    double v24 = v16 + CGRectGetMinY(v39);
    [(UILabel *)self->_remainingTimeLabel bounds];
    double v26 = v25;
    double v28 = v27;
    -[UILabel setFrame:](self->_remainingTimeLabel, "setFrame:", v23, v24, v20, v22);
    if (v34 != v32 || v35 != v33 || v26 != v20 || v28 != v22)
    {
      [(MRUNowPlayingTimeControlsView *)self invalidateIntrinsicContentSize];
    }
  }
}

- (CGSize)intrinsicContentSize
{
  if (self->_layout == 2)
  {
    [(UILabel *)self->_elapsedTimeLabel intrinsicContentSize];
    MRUSizeCeilToViewScale(self);
    double v4 = v3 + self->_sliderHeight + 6.0;
    double v5 = 0.0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MRUNowPlayingTimeControlsView;
    [(MRUNowPlayingTimeControlsView *)&v6 intrinsicContentSize];
  }
  result.CGFloat height = v4;
  result.CGFloat width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  int64_t layout = self->_layout;
  if (layout == 4)
  {
    double contentScale = self->_contentScale;
    double v6 = 28.0;
LABEL_9:
    double v7 = contentScale * v6;
    goto LABEL_10;
  }
  if (layout != 2)
  {
    if (layout == 1) {
      double contentScale = 24.0;
    }
    else {
      double contentScale = 44.0;
    }
    double v6 = self->_contentScale;
    goto LABEL_9;
  }
  [(MRUNowPlayingTimeControlsView *)self intrinsicContentSize];
LABEL_10:
  double v8 = width;
  result.CGFloat height = v7;
  result.CGFloat width = v8;
  return result;
}

- (id)viewForLastBaselineLayout
{
  if (self->_layout == 2)
  {
    v2 = self->_elapsedTimeLabel;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MRUNowPlayingTimeControlsView;
    v2 = [(MRUNowPlayingTimeControlsView *)&v4 viewForLastBaselineLayout];
  }

  return v2;
}

- (void)setTimeControls:(id)a3 forPresentationInterval:(id)a4
{
  objc_storeStrong((id *)&self->_timeControls, a3);
  id v7 = a3;
  id v8 = a4;
  [v7 startTime];
  *(float *)&double v9 = v9;
  [(MRUSlider *)self->_slider setMinimumValue:v9];
  [v7 duration];
  *(float *)&double v10 = v10;
  [(MRUSlider *)self->_slider setMaximumValue:v10];
  uint64_t v11 = [v7 scrubbable];
  double v12 = [(MRUNowPlayingTimeControlsView *)self slider];
  [v12 setEnabled:v11];

  uint64_t v13 = [v7 isEnabled];
  double v14 = [(MRUNowPlayingTimeControlsView *)self slider];
  [v14 setMinimumTrackVisible:v13];

  double v15 = [v7 liveText];

  double v16 = [(MRUNowPlayingTimeControlsView *)self liveLabel];
  [v16 setText:v15];

  double v17 = [v8 startDate];

  [(MRUNowPlayingTimeControlsView *)self updateElapsedTimeForDate:v17];
  [(MRUNowPlayingTimeControlsView *)self updateDisplayLinkPaused];
  [(MRUNowPlayingTimeControlsView *)self updateVisibility];

  [(MRUNowPlayingTimeControlsView *)self setNeedsLayout];
}

- (void)setTimeControls:(id)a3
{
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  id v7 = v5;
  if (stylingProvider != v5)
  {
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUSlider *)self->_slider setStylingProvider:v7];
    [(MRUNowPlayingTimeControlsView *)self updateVisualStyling];
  }
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    [(MRUNowPlayingTimeControlsView *)self updateDisplayLink];
  }
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[MRUSlider setDimmed:](self->_slider, "setDimmed:");
    [(MRUNowPlayingTimeControlsView *)self updateVisualStyling];
  }
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_int64_t layout = a3;
    [(MRUNowPlayingTimeControlsView *)self updateContentSizeCategory];
    [(MRUSlider *)self->_slider setStretchLimit:MRUNowPlayingTimeControlsStretchLimit(a3)];
    [(MRUNowPlayingTimeControlsView *)self setNeedsLayout];
  }
}

- (void)setLeftAlignLive:(BOOL)a3
{
  if (self->_leftAlignLive != a3)
  {
    self->_leftAlignLive = a3;
    [(MRUNowPlayingTimeControlsView *)self setNeedsLayout];
  }
}

- (void)setSliderHeight:(double)a3
{
  if (self->_sliderHeight != a3)
  {
    self->_double sliderHeight = a3;
    [(MRUNowPlayingTimeControlsView *)self setNeedsLayout];
  }
}

- (void)setSliderExpansionFactor:(double)a3
{
  if (self->_sliderExpansionFactor != a3)
  {
    self->_sliderExpansionFactor = a3;
    -[MRUSlider setExpansionFactor:](self->_slider, "setExpansionFactor:");
    [(MRUNowPlayingTimeControlsView *)self setNeedsLayout];
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_double contentScale = a3;
    [(MRUNowPlayingTimeControlsView *)self updateContentSizeCategory];
  }
}

- (void)sliderValueChanged:(id)a3
{
  id v5 = a3;
  [v5 value];
  [(MRUNowPlayingTimeControlsView *)self updateElapsedTimeWithElapsedTime:v4];
  if (self->_layout != 2) {
    [(MRUNowPlayingTimeControlsView *)self layoutIfNeeded];
  }
  if (([v5 isTracking] & 1) == 0) {
    [(MRUNowPlayingTimeControlsView *)self updateElapsedTimeWithThrottle];
  }
}

- (void)sliderTouchCancel:(id)a3
{
  [(MRUNowPlayingTimeControlsView *)self updateDisplayLinkPaused];

  [(MRUNowPlayingTimeControlsView *)self updateElapsedTime];
}

- (CGRect)hitRect
{
  if (self->_layout == 2)
  {
    v23.receiver = self;
    v23.super_class = (Class)MRUNowPlayingTimeControlsView;
    [(MRUNowPlayingTimeControlsView *)&v23 hitRect];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(MRUSlider *)self->_slider hitRectInset];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = v4 + v13;
    double v18 = v6 + v12;
    double v20 = v8 - (v14 + v19);
    double v21 = v10 - (v12 + v16);
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)MRUNowPlayingTimeControlsView;
    [(MRUNowPlayingTimeControlsView *)&v22 hitRect];
  }
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MRUNowPlayingTimeControlsView *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (double)accessibilityTotalDuration
{
  [(MRUTimeControls *)self->_timeControls duration];
  return result;
}

- (double)accessibilityElapsedDuration
{
  [(MRUTimeControls *)self->_timeControls elapsedTime];
  return result;
}

- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3
{
  return 1;
}

- (void)updateVisualStyling
{
  [(MRUVisualStylingProvider *)self->_stylingProvider applyBlendModeToView:self->_elapsedTimeLabel];
  [(MRUVisualStylingProvider *)self->_stylingProvider applyBlendModeToView:self->_remainingTimeLabel];
  int64_t v3 = [(MRUNowPlayingTimeControlsView *)self labelStyle];
  double v4 = [(MRUVisualStylingProvider *)self->_stylingProvider blendColorForStyle:v3];
  [(UILabel *)self->_elapsedTimeLabel setTextColor:v4];

  double v5 = [(MRUVisualStylingProvider *)self->_stylingProvider blendColorForStyle:v3];
  [(UILabel *)self->_remainingTimeLabel setTextColor:v5];

  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:v3 toView:self->_liveLabel];
  stylingProvider = self->_stylingProvider;
  liveBackground = self->_liveBackground;

  [(MRUVisualStylingProvider *)stylingProvider applyStyle:3 toView:liveBackground];
}

- (int64_t)labelStyle
{
  if ([(MRUSlider *)self->_slider isTracking]) {
    return 0;
  }
  if (self->_dimmed) {
    return 2;
  }
  return 1;
}

- (double)timeLabelsAlpha
{
  char v3 = [(MRUSlider *)self->_slider isTracking];
  double result = 1.0;
  if ((v3 & 1) == 0 && !self->_dimmed && self->_layout == 2) {
    return 0.5;
  }
  return result;
}

- (void)updateDisplayLink
{
  displayLink = self->_displayLink;
  if (self->_onScreen)
  {
    if (!displayLink)
    {
      double v4 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel_updateElapsedTimeOnDisplayLinkTick_];
      double v5 = self->_displayLink;
      self->_displayLink = v4;

      CAFrameRateRange v11 = CAFrameRateRangeMake(1.0, 30.0, 5.0);
      -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", *(double *)&v11.minimum, *(double *)&v11.maximum, *(double *)&v11.preferred);
      uint64_t v6 = self->_displayLink;
      double v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];

      [(MRUNowPlayingTimeControlsView *)self updateDisplayLinkPaused];
    }
  }
  else if (displayLink)
  {
    double v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)displayLink removeFromRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

    [(CADisplayLink *)self->_displayLink invalidate];
    double v9 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)updateDisplayLinkPaused
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = ([(MRUSlider *)self->_slider isTracking] & 1) != 0
    || ([(MRUTimeControls *)self->_timeControls rate], v3 == 0.0)
    || ![(MRUTimeControls *)self->_timeControls isEnabled]
    || self->_timeControls == 0;
  [(CADisplayLink *)self->_displayLink setPaused:v4];
  if (self->_debugPreviousDisplayLinkPaused != v4)
  {
    double v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      int v7 = [(MRUSlider *)self->_slider isTracking];
      timeControls = self->_timeControls;
      int v9 = 138543874;
      uint64_t v10 = v6;
      __int16 v11 = 1024;
      int v12 = v7;
      __int16 v13 = 2114;
      double v14 = timeControls;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ updateDisplayLinkPaused tracking: %{BOOL}u | time controls: %{public}@", (uint8_t *)&v9, 0x1Cu);
    }

    self->_debugPreviousDisplayLinkPaused = v4;
  }
}

- (void)updateElapsedTimeOnDisplayLinkTick:(id)a3
{
  [(MRUNowPlayingTimeControlsView *)self updateElapsedTime];

  [(MRUNowPlayingTimeControlsView *)self layoutIfNeeded];
}

- (void)updateElapsedTime
{
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  [(MRUNowPlayingTimeControlsView *)self updateElapsedTimeForDate:v3];
}

- (void)updateElapsedTimeForDate:(id)a3
{
  id v6 = a3;
  if (([(MRUSlider *)self->_slider isTracking] & 1) == 0)
  {
    [(MRUTimeControls *)self->_timeControls elapsedTimeForDate:v6];
    double v5 = v4;
    *(float *)&double v4 = v4;
    [(MRUSlider *)self->_slider setValue:v4];
    [(MRUNowPlayingTimeControlsView *)self updateElapsedTimeWithElapsedTime:v5];
  }
}

- (void)updateElapsedTimeWithElapsedTime:(double)a3
{
  [(MRUTimeControls *)self->_timeControls duration];
  if (v5 <= a3) {
    a3 = v5;
  }
  id v11 = [(AVTimeFormatter *)self->_elapsedTimeFormatter stringFromSeconds:a3];
  remainingTimeFormatter = self->_remainingTimeFormatter;
  [(MRUTimeControls *)self->_timeControls duration];
  double v8 = [(AVTimeFormatter *)remainingTimeFormatter stringFromSeconds:v7 - a3];
  if (self->_dimmed || ![(MRUTimeControls *)self->_timeControls isEnabled])
  {
    int v9 = -[NSRegularExpression stringByReplacingMatchesInString:options:range:withTemplate:](self->_regexNumberDecimalDigit, "stringByReplacingMatchesInString:options:range:withTemplate:", v11, 0, 0, [v11 length], @"–");
    [(UILabel *)self->_elapsedTimeLabel setText:v9];

    uint64_t v10 = -[NSRegularExpression stringByReplacingMatchesInString:options:range:withTemplate:](self->_regexNumberDecimalDigit, "stringByReplacingMatchesInString:options:range:withTemplate:", v8, 0, 0, [v8 length], @"–");
    [(UILabel *)self->_remainingTimeLabel setText:v10];
  }
  else
  {
    [(UILabel *)self->_elapsedTimeLabel setText:v11];
    [(UILabel *)self->_remainingTimeLabel setText:v8];
  }
  [(MRUNowPlayingTimeControlsView *)self setNeedsLayout];
}

- (void)updateElapsedTimeWithThrottle
{
  [(MSVTimer *)self->_updateElapsedTimeThrottleTimer invalidate];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__MRUNowPlayingTimeControlsView_updateElapsedTimeWithThrottle__block_invoke;
  v5[3] = &unk_1E5F0D7F8;
  v5[4] = self;
  id v3 = [MEMORY[0x1E4F77A30] timerWithInterval:0 repeats:v5 block:0.05];
  updateElapsedTimeThrottleTimer = self->_updateElapsedTimeThrottleTimer;
  self->_updateElapsedTimeThrottleTimer = v3;
}

uint64_t __62__MRUNowPlayingTimeControlsView_updateElapsedTimeWithThrottle__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateDisplayLinkPaused];
  v2 = [*(id *)(a1 + 32) slider];
  [v2 value];
  double v4 = v3;
  double v5 = [*(id *)(a1 + 32) timeControls];
  [v5 setElapsedTime:v4];

  id v6 = *(void **)(a1 + 32);

  return [v6 setUpdateElapsedTimeThrottleTimer:0];
}

- (void)updateBackgroundMask
{
  v13[5] = *MEMORY[0x1E4F143B8];
  [(UIView *)self->_liveBackground bounds];
  -[CAGradientLayer setFrame:](self->_liveBackgroundMask, "setFrame:");
  [(UIView *)self->_liveBackground frame];
  double v3 = 20.0 / CGRectGetWidth(v14);
  [(UILabel *)self->_liveLabel frame];
  double MinX = CGRectGetMinX(v15);
  [(UIView *)self->_liveBackground frame];
  double v5 = MinX / CGRectGetWidth(v16);
  [(UILabel *)self->_liveLabel frame];
  double MaxX = CGRectGetMaxX(v17);
  [(UIView *)self->_liveBackground frame];
  double v7 = MaxX / CGRectGetWidth(v18);
  double v8 = objc_msgSend(NSNumber, "numberWithDouble:", v5 - v3, &unk_1F069F1D0);
  v13[1] = v8;
  int v9 = [NSNumber numberWithDouble:v5];
  v13[2] = v9;
  uint64_t v10 = [NSNumber numberWithDouble:v7];
  v13[3] = v10;
  id v11 = [NSNumber numberWithDouble:v3 + v7];
  v13[4] = v11;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];
  [(CAGradientLayer *)self->_liveBackgroundMask setLocations:v12];
}

- (void)updateContentSizeCategory
{
  if (self->_layout == 2) {
    objc_msgSend(MEMORY[0x1E4FB08E0], "mru_ambientTimeFont");
  }
  else {
    objc_msgSend(MEMORY[0x1E4FB08E0], "mru_timeFontWithScale:", self->_contentScale);
  }
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_elapsedTimeLabel setFont:v3];
  [(UILabel *)self->_remainingTimeLabel setFont:v3];
  [(UILabel *)self->_liveLabel setFont:v3];
}

- (void)updateVisibility
{
  BOOL v3 = [(MRUTimeControls *)self->_timeControls isLive];
  [(UILabel *)self->_elapsedTimeLabel setHidden:v3];
  [(UILabel *)self->_remainingTimeLabel setHidden:v3];
  [(MRUSlider *)self->_slider setHidden:v3];
  uint64_t v4 = v3 ^ 1;
  [(UILabel *)self->_liveLabel setHidden:v4];
  liveBackground = self->_liveBackground;

  [(UIView *)liveBackground setHidden:v4];
}

- (MRUTimeControls)timeControls
{
  return self->_timeControls;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (BOOL)leftAlignLive
{
  return self->_leftAlignLive;
}

- (double)sliderHeight
{
  return self->_sliderHeight;
}

- (double)sliderExpansionFactor
{
  return self->_sliderExpansionFactor;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (MRUSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
}

- (UILabel)elapsedTimeLabel
{
  return self->_elapsedTimeLabel;
}

- (void)setElapsedTimeLabel:(id)a3
{
}

- (UILabel)remainingTimeLabel
{
  return self->_remainingTimeLabel;
}

- (void)setRemainingTimeLabel:(id)a3
{
}

- (UILabel)liveLabel
{
  return self->_liveLabel;
}

- (void)setLiveLabel:(id)a3
{
}

- (UIView)liveBackground
{
  return self->_liveBackground;
}

- (void)setLiveBackground:(id)a3
{
}

- (CAGradientLayer)liveBackgroundMask
{
  return self->_liveBackgroundMask;
}

- (void)setLiveBackgroundMask:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (AVTimeFormatter)elapsedTimeFormatter
{
  return self->_elapsedTimeFormatter;
}

- (void)setElapsedTimeFormatter:(id)a3
{
}

- (AVTimeFormatter)remainingTimeFormatter
{
  return self->_remainingTimeFormatter;
}

- (void)setRemainingTimeFormatter:(id)a3
{
}

- (NSRegularExpression)regexNumberDecimalDigit
{
  return self->_regexNumberDecimalDigit;
}

- (void)setRegexNumberDecimalDigit:(id)a3
{
}

- (BOOL)debugPreviousDisplayLinkPaused
{
  return self->_debugPreviousDisplayLinkPaused;
}

- (void)setDebugPreviousDisplayLinkPaused:(BOOL)a3
{
  self->_debugPreviousDisplayLinkPaused = a3;
}

- (MSVTimer)updateElapsedTimeThrottleTimer
{
  return self->_updateElapsedTimeThrottleTimer;
}

- (void)setUpdateElapsedTimeThrottleTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateElapsedTimeThrottleTimer, 0);
  objc_storeStrong((id *)&self->_regexNumberDecimalDigit, 0);
  objc_storeStrong((id *)&self->_remainingTimeFormatter, 0);
  objc_storeStrong((id *)&self->_elapsedTimeFormatter, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_liveBackgroundMask, 0);
  objc_storeStrong((id *)&self->_liveBackground, 0);
  objc_storeStrong((id *)&self->_liveLabel, 0);
  objc_storeStrong((id *)&self->_remainingTimeLabel, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabel, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);

  objc_storeStrong((id *)&self->_timeControls, 0);
}

@end