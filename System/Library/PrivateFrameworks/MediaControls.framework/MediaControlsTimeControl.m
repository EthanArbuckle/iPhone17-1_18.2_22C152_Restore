@interface MediaControlsTimeControl
- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isCurrentlyTracking;
- (BOOL)isEmpty;
- (BOOL)isTimeControlOnScreen;
- (BOOL)isTransitioning;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CAGradientLayer)liveBackgroundMask;
- (CGSize)sizeThatFits:(CGSize)result;
- (MPCPlayerResponse)response;
- (MPCPlayerResponseItem)responseItem;
- (MTVisualStylingProvider)visualStylingProvider;
- (MediaControlsTimeControl)initWithFrame:(CGRect)a3;
- (UILabel)elapsedTimeLabel;
- (UILabel)liveLabel;
- (UILabel)remainingTimeLabel;
- (UILayoutGuide)trackLayoutGuide;
- (UIView)elapsedTrack;
- (UIView)knobView;
- (UIView)liveBackground;
- (UIView)remainingTrack;
- (double)sliderValue;
- (int64_t)style;
- (void)_updateDisplayLinkPause;
- (void)_updateLabels:(double)a3 withRemainingDuration:(double)a4;
- (void)_updateLabels:(id *)a3 withTargetTimestamp:(double)a4;
- (void)_updateSliderPosition;
- (void)_updateStyle;
- (void)_updateTimeControl;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)createDisplayLinkIfNeeded;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)invalidateDisplayLinkIfNeeded;
- (void)layoutSubviews;
- (void)providedStylesDidChangeForProvider:(id)a3;
- (void)setCurrentlyTracking:(BOOL)a3;
- (void)setDurationSnapshot:(id *)a3;
- (void)setElapsedTimeLabel:(id)a3;
- (void)setElapsedTrack:(id)a3;
- (void)setEmpty:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setKnobView:(id)a3;
- (void)setLiveBackground:(id)a3;
- (void)setLiveBackgroundMask:(id)a3;
- (void)setLiveLabel:(id)a3;
- (void)setRemainingTimeLabel:(id)a3;
- (void)setRemainingTrack:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResponseItem:(id)a3;
- (void)setSliderValue:(double)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTimeControlOnScreen:(BOOL)a3;
- (void)setTrackLayoutGuide:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3;
- (void)tintColorDidChange;
- (void)updateBackgroundMask;
- (void)updateLabelAvoidance;
- (void)updateSliderConstraint;
- (void)viewDidMoveToSuperview;
@end

@implementation MediaControlsTimeControl

- (MediaControlsTimeControl)initWithFrame:(CGRect)a3
{
  v180[2] = *MEMORY[0x1E4F143B8];
  v176.receiver = self;
  v176.super_class = (Class)MediaControlsTimeControl;
  v3 = -[MediaControlsTimeControl initWithFrame:](&v176, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    elapsedTrack = v3->_elapsedTrack;
    v3->_elapsedTrack = v4;

    [(UIView *)v3->_elapsedTrack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_elapsedTrack setUserInteractionEnabled:0];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    remainingTrack = v3->_remainingTrack;
    v3->_remainingTrack = v6;

    [(UIView *)v3->_remainingTrack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_remainingTrack setUserInteractionEnabled:0];
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    knobView = v3->_knobView;
    v3->_knobView = v8;

    [(UIView *)v3->_knobView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_knobView setUserInteractionEnabled:0];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    elapsedTimeLabel = v3->_elapsedTimeLabel;
    v3->_elapsedTimeLabel = v10;

    [(UILabel *)v3->_elapsedTimeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    remainingTimeLabel = v3->_remainingTimeLabel;
    v3->_remainingTimeLabel = v12;

    [(UILabel *)v3->_remainingTimeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    liveLabel = v3->_liveLabel;
    v3->_liveLabel = v14;

    [(UILabel *)v3->_liveLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
    v17 = [v16 localizedStringForKey:@"SCRUBBER_LIVE" value:&stru_1F06524E0 table:@"MediaControls"];
    [(UILabel *)v3->_liveLabel setText:v17];

    v18 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    liveBackground = v3->_liveBackground;
    v3->_liveBackground = v18;

    [(UIView *)v3->_liveBackground setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
    liveBackgroundMask = v3->_liveBackgroundMask;
    v3->_liveBackgroundMask = v20;

    v22 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    trackLayoutGuide = v3->_trackLayoutGuide;
    v3->_trackLayoutGuide = v22;

    v24 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x1E4F166B8]);
    elapsedTimeFormatter = v3->_elapsedTimeFormatter;
    v3->_elapsedTimeFormatter = v24;

    v26 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x1E4F166B8]);
    remainingTimeFormatter = v3->_remainingTimeFormatter;
    v3->_remainingTimeFormatter = v26;

    [(AVTimeFormatter *)v3->_elapsedTimeFormatter setStyle:1];
    [(AVTimeFormatter *)v3->_remainingTimeFormatter setStyle:2];
    [(MediaControlsTimeControl *)v3 setSemanticContentAttribute:1];
    v28 = [(MediaControlsTimeControl *)v3 elapsedTrack];
    [(MediaControlsTimeControl *)v3 addSubview:v28];

    v29 = [(MediaControlsTimeControl *)v3 remainingTrack];
    [(MediaControlsTimeControl *)v3 addSubview:v29];

    v30 = [(MediaControlsTimeControl *)v3 knobView];
    [(MediaControlsTimeControl *)v3 addSubview:v30];

    v31 = [(MediaControlsTimeControl *)v3 elapsedTimeLabel];
    [(MediaControlsTimeControl *)v3 addSubview:v31];

    v32 = [(MediaControlsTimeControl *)v3 remainingTimeLabel];
    [(MediaControlsTimeControl *)v3 addSubview:v32];

    v33 = [(MediaControlsTimeControl *)v3 liveLabel];
    [(MediaControlsTimeControl *)v3 addSubview:v33];

    v34 = [(MediaControlsTimeControl *)v3 liveBackground];
    [(MediaControlsTimeControl *)v3 addSubview:v34];

    v35 = [(MediaControlsTimeControl *)v3 knobView];
    v36 = [v35 widthAnchor];
    v37 = [v36 constraintEqualToConstant:7.0];

    v175 = v37;
    LODWORD(v38) = 1148829696;
    [v37 setPriority:v38];
    v180[0] = v37;
    v39 = [(MediaControlsTimeControl *)v3 knobView];
    v40 = [v39 heightAnchor];
    v41 = [v40 constraintEqualToConstant:7.0];
    v180[1] = v41;
    uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:2];
    defaultConstraints = v3->_defaultConstraints;
    v3->_defaultConstraints = (NSArray *)v42;

    v44 = [(MediaControlsTimeControl *)v3 knobView];
    v45 = [v44 widthAnchor];
    v46 = [v45 constraintEqualToConstant:28.0];

    v174 = v46;
    LODWORD(v47) = 1148829696;
    [v46 setPriority:v47];
    v179[0] = v46;
    v48 = [(MediaControlsTimeControl *)v3 knobView];
    v49 = [v48 heightAnchor];
    v50 = [v49 constraintEqualToConstant:28.0];
    v179[1] = v50;
    uint64_t v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v179 count:2];
    trackingConstraints = v3->_trackingConstraints;
    v3->_trackingConstraints = (NSArray *)v51;

    v53 = [(MediaControlsTimeControl *)v3 knobView];
    v54 = [v53 centerXAnchor];
    v55 = [(MediaControlsTimeControl *)v3 leadingAnchor];
    uint64_t v56 = [v54 constraintEqualToAnchor:v55];
    knobViewXConstraint = v3->_knobViewXConstraint;
    v3->_knobViewXConstraint = (NSLayoutConstraint *)v56;

    LODWORD(v58) = 1144750080;
    [(NSLayoutConstraint *)v3->_knobViewXConstraint setPriority:v58];
    v59 = [(MediaControlsTimeControl *)v3 liveLabel];
    v60 = [v59 leadingAnchor];
    v61 = [(MediaControlsTimeControl *)v3 leadingAnchor];
    v62 = [v60 constraintGreaterThanOrEqualToAnchor:v61 constant:20.0];

    v173 = v62;
    LODWORD(v63) = 1148829696;
    [v62 setPriority:v63];
    v135 = (void *)MEMORY[0x1E4F28DC8];
    v172 = [(MediaControlsTimeControl *)v3 liveLabel];
    v171 = [v172 centerYAnchor];
    v170 = [(MediaControlsTimeControl *)v3 centerYAnchor];
    v169 = [v171 constraintEqualToAnchor:v170];
    v178[0] = v169;
    v168 = [(MediaControlsTimeControl *)v3 liveLabel];
    v167 = [v168 centerXAnchor];
    v166 = [(MediaControlsTimeControl *)v3 centerXAnchor];
    v165 = [v167 constraintEqualToAnchor:v166];
    v178[1] = v165;
    v178[2] = v62;
    v164 = [(MediaControlsTimeControl *)v3 liveLabel];
    v163 = [v164 trailingAnchor];
    v162 = [(MediaControlsTimeControl *)v3 trailingAnchor];
    v161 = [v163 constraintLessThanOrEqualToAnchor:v162 constant:20.0];
    v178[3] = v161;
    v160 = [(MediaControlsTimeControl *)v3 liveBackground];
    v159 = [v160 centerYAnchor];
    v158 = [(MediaControlsTimeControl *)v3 centerYAnchor];
    v157 = [v159 constraintEqualToAnchor:v158];
    v178[4] = v157;
    v156 = [(MediaControlsTimeControl *)v3 liveBackground];
    v155 = [v156 leadingAnchor];
    v154 = [(MediaControlsTimeControl *)v3 leadingAnchor];
    v153 = [v155 constraintEqualToAnchor:v154];
    v178[5] = v153;
    v152 = [(MediaControlsTimeControl *)v3 liveBackground];
    v151 = [v152 trailingAnchor];
    v150 = [(MediaControlsTimeControl *)v3 trailingAnchor];
    v149 = [v151 constraintEqualToAnchor:v150];
    v178[6] = v149;
    v148 = [(MediaControlsTimeControl *)v3 liveBackground];
    v147 = [v148 heightAnchor];
    v146 = [v147 constraintEqualToConstant:3.0];
    v178[7] = v146;
    v145 = [(MediaControlsTimeControl *)v3 elapsedTrack];
    v144 = [v145 leadingAnchor];
    v143 = [(MediaControlsTimeControl *)v3 leadingAnchor];
    v142 = [v144 constraintEqualToAnchor:v143];
    v178[8] = v142;
    v141 = [(MediaControlsTimeControl *)v3 elapsedTrack];
    v139 = [v141 trailingAnchor];
    v140 = [(MediaControlsTimeControl *)v3 knobView];
    v138 = [v140 centerXAnchor];
    v137 = [v139 constraintEqualToAnchor:v138];
    v178[9] = v137;
    v136 = [(MediaControlsTimeControl *)v3 elapsedTrack];
    v134 = [v136 centerYAnchor];
    v133 = [(MediaControlsTimeControl *)v3 centerYAnchor];
    v132 = [v134 constraintEqualToAnchor:v133];
    v178[10] = v132;
    v131 = [(MediaControlsTimeControl *)v3 elapsedTrack];
    v130 = [v131 heightAnchor];
    v129 = [v130 constraintEqualToConstant:3.0];
    v178[11] = v129;
    v128 = [(MediaControlsTimeControl *)v3 remainingTrack];
    v126 = [v128 leadingAnchor];
    v127 = [(MediaControlsTimeControl *)v3 knobView];
    v125 = [v127 centerXAnchor];
    v124 = [v126 constraintEqualToAnchor:v125];
    v178[12] = v124;
    v123 = [(MediaControlsTimeControl *)v3 remainingTrack];
    v122 = [v123 trailingAnchor];
    v121 = [(MediaControlsTimeControl *)v3 trailingAnchor];
    v120 = [v122 constraintEqualToAnchor:v121];
    v178[13] = v120;
    v119 = [(MediaControlsTimeControl *)v3 remainingTrack];
    v118 = [v119 centerYAnchor];
    v117 = [(MediaControlsTimeControl *)v3 centerYAnchor];
    v116 = [v118 constraintEqualToAnchor:v117];
    v178[14] = v116;
    v115 = [(MediaControlsTimeControl *)v3 remainingTrack];
    v114 = [v115 heightAnchor];
    v113 = [v114 constraintEqualToConstant:3.0];
    v178[15] = v113;
    v178[16] = v3->_knobViewXConstraint;
    v112 = [(MediaControlsTimeControl *)v3 knobView];
    v111 = [v112 centerYAnchor];
    v110 = [(MediaControlsTimeControl *)v3 centerYAnchor];
    v109 = [v111 constraintEqualToAnchor:v110];
    v178[17] = v109;
    v108 = [(MediaControlsTimeControl *)v3 knobView];
    v106 = [v108 leadingAnchor];
    v107 = [(MediaControlsTimeControl *)v3 elapsedTrack];
    v105 = [v107 leadingAnchor];
    v104 = [v106 constraintGreaterThanOrEqualToAnchor:v105];
    v178[18] = v104;
    v103 = [(MediaControlsTimeControl *)v3 knobView];
    v101 = [v103 trailingAnchor];
    v102 = [(MediaControlsTimeControl *)v3 remainingTrack];
    v100 = [v102 trailingAnchor];
    v99 = [v101 constraintLessThanOrEqualToAnchor:v100];
    v178[19] = v99;
    v98 = [(MediaControlsTimeControl *)v3 elapsedTimeLabel];
    v97 = [v98 leadingAnchor];
    v96 = [(MediaControlsTimeControl *)v3 leadingAnchor];
    v95 = [v97 constraintEqualToAnchor:v96];
    v178[20] = v95;
    v94 = [(MediaControlsTimeControl *)v3 elapsedTimeLabel];
    v93 = [v94 bottomAnchor];
    v92 = [(MediaControlsTimeControl *)v3 bottomAnchor];
    v91 = [v93 constraintEqualToAnchor:v92 constant:-3.5];
    v178[21] = v91;
    v90 = [(MediaControlsTimeControl *)v3 remainingTimeLabel];
    v64 = [v90 trailingAnchor];
    v65 = [(MediaControlsTimeControl *)v3 trailingAnchor];
    v66 = [v64 constraintEqualToAnchor:v65];
    v178[22] = v66;
    v67 = [(MediaControlsTimeControl *)v3 remainingTimeLabel];
    v68 = [v67 bottomAnchor];
    v69 = [(MediaControlsTimeControl *)v3 bottomAnchor];
    v70 = [v68 constraintEqualToAnchor:v69 constant:-3.5];
    v178[23] = v70;
    v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v178 count:24];
    v72 = [v71 arrayByAddingObjectsFromArray:v3->_defaultConstraints];
    [v135 activateConstraints:v72];

    v73 = [MEMORY[0x1E4FB08E0] monospacedDigitSystemFontOfSize:13.0 weight:*MEMORY[0x1E4FB09D0]];
    v74 = [(MediaControlsTimeControl *)v3 liveLabel];
    [v74 setFont:v73];

    v75 = [(MediaControlsTimeControl *)v3 elapsedTimeLabel];
    [v75 setFont:v73];

    v76 = [(MediaControlsTimeControl *)v3 remainingTimeLabel];
    [v76 setFont:v73];

    v77 = [(MediaControlsTimeControl *)v3 elapsedTrack];
    v78 = [v77 layer];
    [v78 setMaskedCorners:5];

    v79 = [(MediaControlsTimeControl *)v3 remainingTrack];
    v80 = [v79 layer];
    [v80 setMaskedCorners:10];

    id v81 = [MEMORY[0x1E4FB1618] blackColor];
    v177[0] = [v81 CGColor];
    id v82 = [MEMORY[0x1E4FB1618] blackColor];
    v177[1] = [v82 CGColor];
    id v83 = [MEMORY[0x1E4FB1618] clearColor];
    v177[2] = [v83 CGColor];
    id v84 = [MEMORY[0x1E4FB1618] clearColor];
    v177[3] = [v84 CGColor];
    id v85 = [MEMORY[0x1E4FB1618] blackColor];
    v177[4] = [v85 CGColor];
    id v86 = [MEMORY[0x1E4FB1618] blackColor];
    v177[5] = [v86 CGColor];
    v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v177 count:6];
    v88 = [(MediaControlsTimeControl *)v3 liveBackgroundMask];
    [v88 setColors:v87];

    v3->_currentlyTracking = 0;
    v3->_currentTimeInTrack = 0.0;
    [(MediaControlsTimeControl *)v3 setEnabled:0];
    [(MediaControlsTimeControl *)v3 setEmpty:1];
    [(MediaControlsTimeControl *)v3 _updateStyle];
  }
  return v3;
}

- (void)viewDidMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsTimeControl;
  [(MediaControlsTimeControl *)&v3 viewDidMoveToSuperview];
  [(MediaControlsTimeControl *)self _updateTimeControl];
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)MediaControlsTimeControl;
  [(MediaControlsTimeControl *)&v24 layoutSubviews];
  objc_super v3 = [(MediaControlsTimeControl *)self knobView];
  [v3 bounds];
  double v5 = v4 * 0.5;
  v6 = [(MediaControlsTimeControl *)self knobView];
  v7 = [v6 layer];
  [v7 setCornerRadius:v5];

  v8 = [(MediaControlsTimeControl *)self elapsedTrack];
  [v8 bounds];
  double v10 = v9 * 0.5;
  v11 = [(MediaControlsTimeControl *)self elapsedTrack];
  v12 = [v11 layer];
  [v12 setCornerRadius:v10];

  v13 = [(MediaControlsTimeControl *)self remainingTrack];
  [v13 bounds];
  double v15 = v14 * 0.5;
  v16 = [(MediaControlsTimeControl *)self remainingTrack];
  v17 = [v16 layer];
  [v17 setCornerRadius:v15];

  v18 = [(MediaControlsTimeControl *)self liveBackground];
  [v18 bounds];
  double v20 = v19 * 0.5;
  v21 = [(MediaControlsTimeControl *)self liveBackground];
  v22 = [v21 layer];
  [v22 setCornerRadius:v20];

  [(MediaControlsTimeControl *)self updateSliderConstraint];
  [(MediaControlsTimeControl *)self durationSnapshot];
  if (v23) {
    [(MediaControlsTimeControl *)self updateBackgroundMask];
  }
}

- (void)tintColorDidChange
{
  v19.receiver = self;
  v19.super_class = (Class)MediaControlsTimeControl;
  [(MediaControlsTimeControl *)&v19 tintColorDidChange];
  if (!self->_visualStylingProvider)
  {
    objc_super v3 = [(MediaControlsTimeControl *)self tintColor];
    double v4 = [(MediaControlsTimeControl *)self knobView];
    [v4 setBackgroundColor:v3];

    double v5 = [(MediaControlsTimeControl *)self tintColor];
    v6 = [(MediaControlsTimeControl *)self elapsedTrack];
    [v6 setBackgroundColor:v5];

    v7 = [(MediaControlsTimeControl *)self tintColor];
    v8 = [(MediaControlsTimeControl *)self liveLabel];
    [v8 setTextColor:v7];

    double v9 = [(MediaControlsTimeControl *)self tintColor];
    double v10 = [(MediaControlsTimeControl *)self traitCollection];
    v11 = objc_msgSend(v9, "secondaryColorForInterfaceStyle:", objc_msgSend(v10, "userInterfaceStyle"));

    v12 = [(MediaControlsTimeControl *)self elapsedTimeLabel];
    [v12 setTextColor:v11];

    v13 = [(MediaControlsTimeControl *)self remainingTimeLabel];
    [v13 setTextColor:v11];

    double v14 = [(MediaControlsTimeControl *)self tintColor];
    double v15 = [(MediaControlsTimeControl *)self traitCollection];
    v16 = objc_msgSend(v14, "tertiaryColorForInterfaceStyle:", objc_msgSend(v15, "userInterfaceStyle"));

    v17 = [(MediaControlsTimeControl *)self remainingTrack];
    [v17 setBackgroundColor:v16];

    v18 = [(MediaControlsTimeControl *)self liveBackground];
    [v18 setBackgroundColor:v16];
  }
}

- (void)setVisualStylingProvider:(id)a3
{
  double v5 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = (id *)&self->_visualStylingProvider;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v32 = v5;
    [(MTVisualStylingProvider *)visualStylingProvider _removeObserver:self];
    id v8 = *p_visualStylingProvider;
    double v9 = [(MediaControlsTimeControl *)self elapsedTrack];
    [v8 stopAutomaticallyUpdatingView:v9];

    id v10 = *p_visualStylingProvider;
    v11 = [(MediaControlsTimeControl *)self remainingTrack];
    [v10 stopAutomaticallyUpdatingView:v11];

    id v12 = *p_visualStylingProvider;
    v13 = [(MediaControlsTimeControl *)self elapsedTimeLabel];
    [v12 stopAutomaticallyUpdatingView:v13];

    id v14 = *p_visualStylingProvider;
    double v15 = [(MediaControlsTimeControl *)self remainingTimeLabel];
    [v14 stopAutomaticallyUpdatingView:v15];

    id v16 = *p_visualStylingProvider;
    v17 = [(MediaControlsTimeControl *)self liveLabel];
    [v16 stopAutomaticallyUpdatingView:v17];

    id v18 = *p_visualStylingProvider;
    objc_super v19 = [(MediaControlsTimeControl *)self liveBackground];
    [v18 stopAutomaticallyUpdatingView:v19];

    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    [*p_visualStylingProvider _addObserver:self];
    id v20 = *p_visualStylingProvider;
    v21 = [(MediaControlsTimeControl *)self elapsedTrack];
    [v20 automaticallyUpdateView:v21 withStyle:0];

    id v22 = *p_visualStylingProvider;
    char v23 = [(MediaControlsTimeControl *)self remainingTrack];
    [v22 automaticallyUpdateView:v23 withStyle:1];

    id v24 = *p_visualStylingProvider;
    v25 = [(MediaControlsTimeControl *)self elapsedTimeLabel];
    [v24 automaticallyUpdateView:v25 withStyle:1];

    id v26 = *p_visualStylingProvider;
    v27 = [(MediaControlsTimeControl *)self remainingTimeLabel];
    [v26 automaticallyUpdateView:v27 withStyle:1];

    id v28 = *p_visualStylingProvider;
    v29 = [(MediaControlsTimeControl *)self liveLabel];
    [v28 automaticallyUpdateView:v29 withStyle:0];

    id v30 = *p_visualStylingProvider;
    v31 = [(MediaControlsTimeControl *)self liveBackground];
    [v30 automaticallyUpdateView:v31 withStyle:1];

    [(MediaControlsTimeControl *)self providedStylesDidChangeForProvider:*p_visualStylingProvider];
    double v5 = v32;
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 54.0;
  result.height = v3;
  return result;
}

- (void)setDurationSnapshot:(id *)a3
{
  p_durationSnapshot = &self->_durationSnapshot;
  long long v6 = *(_OWORD *)&a3->var2;
  long long v5 = *(_OWORD *)&a3->var4;
  long long v7 = *(_OWORD *)&a3->var0;
  *(void *)&self->_durationSnapshot.isLiveContent = *(void *)&a3->var7;
  *(_OWORD *)&self->_durationSnapshot.endTime = v6;
  *(_OWORD *)&self->_durationSnapshot.elapsedDuration = v5;
  *(_OWORD *)&self->_durationSnapshot.snapshotTime = v7;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double duration = p_durationSnapshot->elapsedDuration + (v8 - p_durationSnapshot->snapshotTime) * p_durationSnapshot->rate;
  if (duration >= p_durationSnapshot->duration) {
    double duration = p_durationSnapshot->duration;
  }
  self->_currentTimeInTrack = fmax(duration, 0.0);
  [(MediaControlsTimeControl *)self _updateSliderPosition];
  [(MediaControlsTimeControl *)self _updateStyle];
  [(MediaControlsTimeControl *)self _updateLabels:self->_currentTimeInTrack withRemainingDuration:p_durationSnapshot->duration - self->_currentTimeInTrack];
  [(MediaControlsTimeControl *)self _updateDisplayLinkPause];
  self->_lastRecordedTime = self->_currentTimeInTrack;

  [(MediaControlsTimeControl *)self setNeedsLayout];
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  objc_msgSend(a3, "locationInView:", self, a4);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v9 = [(MediaControlsTimeControl *)self knobView];
  [v9 frame];
  CGRect v19 = CGRectInset(v18, -30.0, -30.0);
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;

  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  v17.CGFloat x = v6;
  v17.CGFloat y = v8;
  BOOL v14 = CGRectContainsPoint(v20, v17);
  if (v14)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__MediaControlsTimeControl_beginTrackingWithTouch_withEvent___block_invoke;
    v16[3] = &unk_1E5F0D7F8;
    v16[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDuration:0 delay:v16 options:0 mass:1.0 stiffness:0.0 damping:1.0 initialVelocity:300.0 animations:24.0 completion:0.0];
    self->_currentlyTracking = 1;
    [(MediaControlsTimeControl *)self _updateDisplayLinkPause];
  }
  return v14;
}

uint64_t __61__MediaControlsTimeControl_beginTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F28DC8] deactivateConstraints:*(void *)(*(void *)(a1 + 32) + 456)];
  [MEMORY[0x1E4F28DC8] activateConstraints:*(void *)(*(void *)(a1 + 32) + 464)];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  self->_currentlyTracking = 0;
  [(MediaControlsTimeControl *)self _updateDisplayLinkPause];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __59__MediaControlsTimeControl_endTrackingWithTouch_withEvent___block_invoke;
  v25[3] = &unk_1E5F0D7F8;
  v25[4] = self;
  [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDuration:0 delay:v25 options:0 mass:1.0 stiffness:0.0 damping:1.0 initialVelocity:300.0 animations:24.0 completion:0.0];
  double v5 = [(MediaControlsTimeControl *)self response];
  CGFloat v6 = [v5 tracklist];
  double v7 = [v6 playingItemIndexPath];

  if (v7)
  {
    CGFloat v8 = [(MediaControlsTimeControl *)self response];
    double v9 = [v8 tracklist];
    id v10 = [v9 items];
    v11 = [v10 itemAtIndexPath:v7];
  }
  else
  {
    v11 = 0;
  }
  [(MediaControlsTimeControl *)self durationSnapshot];
  [(MediaControlsTimeControl *)self sliderValue];
  double v13 = fmax(v24 * v12, 0.0);
  [(MediaControlsTimeControl *)self durationSnapshot];
  if (v13 >= v23) {
    double v13 = v23;
  }
  BOOL v14 = [v11 seekCommand];
  double v15 = [v14 changePositionToElapsedInterval:v13];

  [MEMORY[0x1E4F76E88] performRequest:v15 completion:0];
  uint64_t v22 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  [(MediaControlsTimeControl *)self durationSnapshot];
  *(double *)&long long v21 = v13;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  *(void *)&long long v19 = v16;
  uint64_t v18 = v22;
  v17[1] = v20;
  v17[2] = v21;
  v17[0] = v19;
  [(MediaControlsTimeControl *)self setDurationSnapshot:v17];
}

uint64_t __59__MediaControlsTimeControl_endTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F28DC8] deactivateConstraints:*(void *)(*(void *)(a1 + 32) + 464)];
  [MEMORY[0x1E4F28DC8] activateConstraints:*(void *)(*(void *)(a1 + 32) + 456)];
  [*(id *)(a1 + 32) layoutIfNeeded];
  v2 = *(void **)(a1 + 32);

  return [v2 updateLabelAvoidance];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  self->_currentlyTracking = 0;
  [(MediaControlsTimeControl *)self _updateDisplayLinkPause];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__MediaControlsTimeControl_cancelTrackingWithEvent___block_invoke;
  v4[3] = &unk_1E5F0D7F8;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDuration:0 delay:v4 options:0 mass:1.0 stiffness:0.0 damping:1.0 initialVelocity:300.0 animations:24.0 completion:0.0];
}

uint64_t __52__MediaControlsTimeControl_cancelTrackingWithEvent___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F28DC8] deactivateConstraints:*(void *)(*(void *)(a1 + 32) + 464)];
  [MEMORY[0x1E4F28DC8] activateConstraints:*(void *)(*(void *)(a1 + 32) + 456)];
  [*(id *)(a1 + 32) layoutIfNeeded];
  v2 = *(void **)(a1 + 32);

  return [v2 updateLabelAvoidance];
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  objc_msgSend(a3, "locationInView:", self, a4);
  double v6 = v5;
  [(MediaControlsTimeControl *)self bounds];
  [(MediaControlsTimeControl *)self setSliderValue:v6 / v7];
  [(MediaControlsTimeControl *)self durationSnapshot];
  [(MediaControlsTimeControl *)self sliderValue];
  double v9 = v12 * v8;
  self->_currentTimeInTrack = v12 * v8;
  [(MediaControlsTimeControl *)self durationSnapshot];
  [(MediaControlsTimeControl *)self _updateLabels:v9 withRemainingDuration:v11 - self->_currentTimeInTrack];
  [(MediaControlsTimeControl *)self updateLabelAvoidance];
  return 1;
}

- (void)_updateSliderPosition
{
  double v3 = 0.0;
  if (self->_currentTimeInTrack > 0.0)
  {
    [(MediaControlsTimeControl *)self durationSnapshot];
    if (v6 > 0.0)
    {
      double currentTimeInTrack = self->_currentTimeInTrack;
      [(MediaControlsTimeControl *)self durationSnapshot];
      double v3 = currentTimeInTrack / v5;
    }
  }
  [(MediaControlsTimeControl *)self setSliderValue:v3];
}

- (void)setSliderValue:(double)a3
{
  if (self->_sliderValue != a3)
  {
    self->_sliderValue = a3;
    [(MediaControlsTimeControl *)self updateSliderConstraint];
  }
}

- (void)updateSliderConstraint
{
  double v3 = fmin(self->_sliderValue, 1.0);
  [(MediaControlsTimeControl *)self bounds];
  double v5 = fmax(v3 * v4, 0.0);
  knobViewXConstraint = self->_knobViewXConstraint;

  [(NSLayoutConstraint *)knobViewXConstraint setConstant:v5];
}

- (void)_updateLabels:(id *)a3 withTargetTimestamp:(double)a4
{
  double var3 = a3->var3;
  double v5 = a3->var4 + (a4 - a3->var0) * a3->var5;
  if (v5 >= var3) {
    double v5 = a3->var3;
  }
  double v6 = fmax(v5, 0.0);
  [(MediaControlsTimeControl *)self _updateLabels:v6 withRemainingDuration:var3 - v6];
}

- (void)_updateLabels:(double)a3 withRemainingDuration:(double)a4
{
  if (a3 > 0.0 || a4 > 0.0)
  {
    elapsedTimeFormatter = self->_elapsedTimeFormatter;
    if (a3 >= 0.0) {
      double v8 = a3;
    }
    else {
      double v8 = 0.0;
    }
    [(MediaControlsTimeControl *)self durationSnapshot];
    double v9 = v18;
    if (v8 < v18) {
      double v9 = v8;
    }
    id v10 = [(AVTimeFormatter *)elapsedTimeFormatter stringFromSeconds:v9];
    double v11 = [(MediaControlsTimeControl *)self elapsedTimeLabel];
    [v11 setText:v10];

    remainingTimeFormatter = self->_remainingTimeFormatter;
    [(MediaControlsTimeControl *)self durationSnapshot];
    double v13 = v17;
    if (v17 > a4) {
      double v13 = a4;
    }
    if (v13 < 0.0) {
      double v13 = 0.0;
    }
    BOOL v14 = [(AVTimeFormatter *)remainingTimeFormatter stringFromSeconds:v13];
    double v15 = [(MediaControlsTimeControl *)self remainingTimeLabel];
    [v15 setText:v14];
  }
  else
  {
    double v6 = [(MediaControlsTimeControl *)self elapsedTimeLabel];
    [v6 setText:0];

    id v16 = [(MediaControlsTimeControl *)self remainingTimeLabel];
    [v16 setText:0];
  }
}

- (void)updateLabelAvoidance
{
  double v3 = [(MediaControlsTimeControl *)self knobView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(MediaControlsTimeControl *)self knobView];
  -[MediaControlsTimeControl convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  uint64_t v55 = v14;
  uint64_t v56 = v13;
  uint64_t v53 = v16;
  uint64_t v54 = v15;

  double v17 = [(MediaControlsTimeControl *)self elapsedTimeLabel];
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  id v26 = [(MediaControlsTimeControl *)self elapsedTimeLabel];
  -[MediaControlsTimeControl convertRect:fromView:](self, "convertRect:fromView:", v26, v19, v21, v23, v25);
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;

  v35 = [(MediaControlsTimeControl *)self remainingTimeLabel];
  [v35 bounds];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  v44 = [(MediaControlsTimeControl *)self remainingTimeLabel];
  -[MediaControlsTimeControl convertRect:fromView:](self, "convertRect:fromView:", v44, v37, v39, v41, v43);
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;

  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __48__MediaControlsTimeControl_updateLabelAvoidance__block_invoke;
  v57[3] = &unk_1E5F0E228;
  v57[5] = v56;
  v57[6] = v55;
  v57[7] = v54;
  v57[8] = v53;
  v57[9] = v28;
  v57[10] = v30;
  v57[11] = v32;
  v57[12] = v34;
  v57[4] = self;
  v57[13] = v46;
  v57[14] = v48;
  v57[15] = v50;
  v57[16] = v52;
  [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDuration:0 delay:v57 options:0 mass:0.5 stiffness:0.0 damping:1.0 initialVelocity:500.0 animations:30.0 completion:0.0];
}

void __48__MediaControlsTimeControl_updateLabelAvoidance__block_invoke(uint64_t a1)
{
  double MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
  CGFloat MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 72));
  double v4 = (long long *)MEMORY[0x1E4F1DAB8];
  if (MinX <= MaxX && [*(id *)(a1 + 32) isCurrentlyTracking])
  {
    CGAffineTransformMakeTranslation(&v21, 0.0, 10.0);
    double v5 = [*(id *)(a1 + 32) elapsedTimeLabel];
    double v6 = v5;
    CGAffineTransform v20 = v21;
    double v7 = &v20;
  }
  else
  {
    double v5 = [*(id *)(a1 + 32) elapsedTimeLabel];
    double v6 = v5;
    long long v8 = v4[1];
    v19[0] = *v4;
    v19[1] = v8;
    v19[2] = v4[2];
    double v7 = (CGAffineTransform *)v19;
  }
  [v5 setTransform:v7];

  double v9 = CGRectGetMaxX(*(CGRect *)(a1 + 40));
  if (v9 >= CGRectGetMinX(*(CGRect *)(a1 + 104)) && [*(id *)(a1 + 32) isCurrentlyTracking])
  {
    CGAffineTransformMakeTranslation(&v18, 0.0, 10.0);
    double v10 = [*(id *)(a1 + 32) remainingTimeLabel];
    double v11 = v10;
    CGAffineTransform v17 = v18;
    double v12 = &v17;
  }
  else
  {
    double v10 = [*(id *)(a1 + 32) remainingTimeLabel];
    double v11 = v10;
    long long v13 = v4[1];
    long long v14 = *v4;
    long long v15 = v13;
    long long v16 = v4[2];
    double v12 = (CGAffineTransform *)&v14;
  }
  objc_msgSend(v10, "setTransform:", v12, v14, v15, v16, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MediaControlsTimeControl;
  [(MediaControlsTimeControl *)&v4 setEnabled:a3];
  [(MediaControlsTimeControl *)self _updateStyle];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  long long v8 = [(MediaControlsTimeControl *)self knobView];
  [v8 frame];
  CGRect v18 = CGRectInset(v17, -30.0, -30.0);
  CGFloat v9 = v18.origin.x;
  CGFloat v10 = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;

  v19.origin.double x = v9;
  v19.origin.double y = v10;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  v16.double x = x;
  v16.double y = y;
  if (CGRectContainsPoint(v19, v16))
  {
    BOOL v13 = 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)MediaControlsTimeControl;
    BOOL v13 = -[MediaControlsTimeControl pointInside:withEvent:](&v15, sel_pointInside_withEvent_, v7, x, y);
  }

  return v13;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(MediaControlsTimeControl *)self _updateStyle];
    [(MediaControlsTimeControl *)self setNeedsLayout];
  }
}

- (void)_updateStyle
{
  [(MediaControlsTimeControl *)self durationSnapshot];
  if (v22)
  {
    [(MediaControlsTimeControl *)self updateBackgroundMask];
    BOOL v4 = 1;
  }
  else
  {
    BOOL v4 = [(MediaControlsTimeControl *)self isEmpty];
  }
  double v5 = [(MediaControlsTimeControl *)self responseItem];
  double v6 = [v5 localizedDurationString];
  id v7 = v6;
  if (!v6)
  {
    v2 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
    id v7 = [v2 localizedStringForKey:@"SCRUBBER_LIVE" value:&stru_1F06524E0 table:@"MediaControls"];
  }
  long long v8 = [(MediaControlsTimeControl *)self liveLabel];
  [v8 setText:v7];

  if (!v6)
  {
  }
  BOOL v9 = v22 == 0;

  CGFloat v10 = [(MediaControlsTimeControl *)self liveLabel];
  [v10 setHidden:v9];

  double v11 = [(MediaControlsTimeControl *)self liveBackground];
  [v11 setHidden:v9];

  double v12 = [(MediaControlsTimeControl *)self elapsedTimeLabel];
  [v12 setHidden:v4];

  BOOL v13 = [(MediaControlsTimeControl *)self remainingTimeLabel];
  [v13 setHidden:v4];

  long long v14 = [(MediaControlsTimeControl *)self elapsedTrack];
  [v14 setHidden:v4];

  objc_super v15 = [(MediaControlsTimeControl *)self remainingTrack];
  [v15 setHidden:v22 != 0];

  if ([(MediaControlsTimeControl *)self isEmpty]) {
    uint64_t v16 = 15;
  }
  else {
    uint64_t v16 = 10;
  }
  CGRect v17 = [(MediaControlsTimeControl *)self remainingTrack];
  CGRect v18 = [v17 layer];
  [v18 setMaskedCorners:v16];

  double v19 = 0.0;
  if (!v4)
  {
    if ([(MediaControlsTimeControl *)self isEnabled]) {
      double v19 = 1.0;
    }
    else {
      double v19 = 0.0;
    }
  }
  CGAffineTransform v20 = [(MediaControlsTimeControl *)self knobView];
  [v20 setAlpha:v19];

  CGAffineTransform v21 = [(MediaControlsTimeControl *)self knobView];
  [v21 setHidden:v4];
}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning != a3) {
    self->_transitioning = a3;
  }
}

- (void)setResponse:(id)a3
{
  double v5 = (MPCPlayerResponse *)a3;
  if (self->_response != v5)
  {
    BOOL v13 = v5;
    objc_storeStrong((id *)&self->_response, a3);
    double v6 = [(MPCPlayerResponse *)v13 tracklist];
    id v7 = [v6 playingItemIndexPath];

    if (v7)
    {
      long long v8 = [(MPCPlayerResponse *)v13 tracklist];
      BOOL v9 = [v8 items];
      CGFloat v10 = [v9 itemAtIndexPath:v7];

      [(MediaControlsTimeControl *)self setEmpty:0];
      [(MediaControlsTimeControl *)self setResponseItem:v10];
    }
    else
    {
      [(MediaControlsTimeControl *)self setEmpty:1];
      CGFloat v10 = 0;
    }
    [(MediaControlsTimeControl *)self _updateDisplayLinkPause];
    [(MediaControlsTimeControl *)self _updateStyle];
    double v11 = [v10 seekCommand];
    double v12 = [v11 changePositionToElapsedInterval:0.0];

    [(MediaControlsTimeControl *)self setEnabled:v12 != 0];
    double v5 = v13;
  }
}

- (void)setResponseItem:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_responseItem, a3);
  if (v5)
  {
    [v5 duration];
  }
  else
  {
    uint64_t v11 = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v8 = 0u;
  }
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  uint64_t v7 = v11;
  [(MediaControlsTimeControl *)self setDurationSnapshot:v6];
}

- (void)setEmpty:(BOOL)a3
{
  if (self->_empty != a3)
  {
    BOOL v3 = a3;
    self->_emptdouble y = a3;
    if (a3) {
      [(MediaControlsTimeControl *)self setSliderValue:0.0];
    }
    [(MediaControlsTimeControl *)self setEnabled:v3];
    [(MediaControlsTimeControl *)self _updateDisplayLinkPause];
    [(MediaControlsTimeControl *)self _updateStyle];
    [(MediaControlsTimeControl *)self setNeedsLayout];
  }
}

- (void)_updateTimeControl
{
  [(MediaControlsTimeControl *)self durationSnapshot];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v14 + (v3 - v12) * v15;
  if (v4 >= v13) {
    double v4 = v13;
  }
  self->_double currentTimeInTrack = fmax(v4, 0.0);
  [(MediaControlsTimeControl *)self _updateSliderPosition];
  double v5 = self->_currentTimeInTrack - self->_lastRecordedTime;
  if (v5 >= 0.0) {
    double v6 = self->_currentTimeInTrack - self->_lastRecordedTime;
  }
  else {
    double v6 = -v5;
  }
  [(MediaControlsTimeControl *)self durationSnapshot];
  float v7 = v11;
  if (v11 < 0.0) {
    float v7 = -v11;
  }
  if (v7 >= 1.0) {
    double v8 = 1.0 / v7;
  }
  else {
    double v8 = 1.0;
  }
  if (v6 >= v8)
  {
    double currentTimeInTrack = self->_currentTimeInTrack;
    [(MediaControlsTimeControl *)self durationSnapshot];
    [(MediaControlsTimeControl *)self _updateLabels:currentTimeInTrack withRemainingDuration:v10 - self->_currentTimeInTrack];
    self->_lastRecordedTime = self->_currentTimeInTrack;
  }
}

- (void)_updateDisplayLinkPause
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(MediaControlsTimeControl *)self isCurrentlyTracking]
    || ([(MediaControlsTimeControl *)self durationSnapshot], *(float *)&double v3 = v12, v12 == 0.0)
    || ([(MediaControlsTimeControl *)self durationSnapshot], v11)
    || [(MediaControlsTimeControl *)self isEmpty];
  if ([(MediaControlsTimeControl *)self style] == 3 && self->_debugPreviousDisplayLinkPaused != v4)
  {
    double v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v14 = v4;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "MediaControlsCoverSheet _updateDisplayLinkPaused paused: %{BOOL}u", buf, 8u);
    }

    double v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [(MediaControlsTimeControl *)self isCurrentlyTracking];
      [(MediaControlsTimeControl *)self durationSnapshot];
      [(MediaControlsTimeControl *)self durationSnapshot];
      BOOL v8 = [(MediaControlsTimeControl *)self isEmpty];
      *(_DWORD *)buf = 67109888;
      BOOL v14 = v7;
      __int16 v15 = 2048;
      double v16 = v10;
      __int16 v17 = 1024;
      int v18 = v9;
      __int16 v19 = 1024;
      BOOL v20 = v8;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "MediaControlsCoverSheet _updateDisplayLinkPaused self.isCurrentlyTracking: %{BOOL}u self.durationSnapshot.rate: %0.2f self.durationSnapshot.isLiveContent: %{BOOL}u self.isEmpty: %{BOOL}u", buf, 0x1Eu);
    }

    self->_debugPreviousDisplayLinkPaused = v4;
  }
  [(CADisplayLink *)self->_displayLink setPaused:v4];
}

- (void)setTimeControlOnScreen:(BOOL)a3
{
  if (self->_timeControlOnScreen != a3)
  {
    self->_timeControlOnScreen = a3;
    if (a3) {
      [(MediaControlsTimeControl *)self createDisplayLinkIfNeeded];
    }
    else {
      [(MediaControlsTimeControl *)self invalidateDisplayLinkIfNeeded];
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  [a4 locationInView:self];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  unsigned __int8 v9 = [(MediaControlsTimeControl *)self knobView];
  [v9 frame];
  CGRect v23 = CGRectInset(v22, -30.0, -30.0);
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;

  CGFloat v14 = x;
  CGFloat v15 = y;
  CGFloat v16 = width;
  CGFloat v17 = height;
  uint64_t v18 = v6;
  uint64_t v19 = v8;

  return CGRectContainsPoint(*(CGRect *)&v14, *(CGPoint *)&v18);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v8 = 1;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v4 minimumNumberOfTouches] <= 1)
  {
    uint64_t v5 = [v4 view];

    if (v5 != self)
    {
      [v4 translationInView:self];
      if (fabs(v6) > fabs(v7)) {
        BOOL v8 = 0;
      }
    }
  }

  return v8;
}

- (void)createDisplayLinkIfNeeded
{
  if (!self->_displayLink)
  {
    double v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkTick_];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    uint64_t v5 = self->_displayLink;
    double v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];

    [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:30];
    [(MediaControlsTimeControl *)self _updateDisplayLinkPause];
  }
}

- (void)invalidateDisplayLinkIfNeeded
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    id v4 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)displayLink removeFromRunLoop:v4 forMode:*MEMORY[0x1E4F1C4B0]];

    [(CADisplayLink *)self->_displayLink invalidate];
    uint64_t v5 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)updateBackgroundMask
{
  v34[5] = *MEMORY[0x1E4F143B8];
  double v3 = [(MediaControlsTimeControl *)self liveBackgroundMask];
  id v4 = [(MediaControlsTimeControl *)self liveBackground];
  uint64_t v5 = [v4 layer];
  [v5 setMask:v3];

  double v6 = [(MediaControlsTimeControl *)self liveBackground];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  CGFloat v15 = [(MediaControlsTimeControl *)self liveBackgroundMask];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  CGFloat v16 = [(MediaControlsTimeControl *)self liveBackground];
  [v16 frame];
  double v17 = 20.0 / CGRectGetWidth(v35);

  uint64_t v18 = [(MediaControlsTimeControl *)self liveLabel];
  [v18 frame];
  double MinX = CGRectGetMinX(v36);
  BOOL v20 = [(MediaControlsTimeControl *)self liveBackground];
  [v20 frame];
  double v21 = MinX / CGRectGetWidth(v37);

  CGRect v22 = [(MediaControlsTimeControl *)self liveLabel];
  [v22 frame];
  double MaxX = CGRectGetMaxX(v38);
  double v24 = [(MediaControlsTimeControl *)self liveBackground];
  [v24 frame];
  double v25 = MaxX / CGRectGetWidth(v39);

  id v26 = objc_msgSend(NSNumber, "numberWithDouble:", v21 - v17, &unk_1F069F140);
  v34[1] = v26;
  uint64_t v27 = [NSNumber numberWithDouble:v21];
  v34[2] = v27;
  uint64_t v28 = [NSNumber numberWithDouble:v25];
  v34[3] = v28;
  uint64_t v29 = [NSNumber numberWithDouble:v17 + v25];
  v34[4] = v29;
  uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];
  uint64_t v31 = [(MediaControlsTimeControl *)self liveBackgroundMask];
  [v31 setLocations:v30];

  uint64_t v32 = [(MediaControlsTimeControl *)self liveBackgroundMask];
  objc_msgSend(v32, "setStartPoint:", 0.0, 0.0);

  uint64_t v33 = [(MediaControlsTimeControl *)self liveBackgroundMask];
  objc_msgSend(v33, "setEndPoint:", 1.0, 0.0);
}

- (void)providedStylesDidChangeForProvider:(id)a3
{
  id v7 = [a3 _visualStylingForStyle:0];
  id v4 = [v7 color];
  uint64_t v5 = [v4 colorWithAlphaComponent:1.0];
  double v6 = [(MediaControlsTimeControl *)self knobView];
  [v6 setBackgroundColor:v5];
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (int64_t)style
{
  return self->_style;
}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (MPCPlayerResponseItem)responseItem
{
  return self->_responseItem;
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot
{
  long long v3 = *(_OWORD *)&self[12].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[11].var7;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[12].var3;
  *(void *)&retstr->var7 = *(void *)&self[12].var5;
  return self;
}

- (BOOL)isTimeControlOnScreen
{
  return self->_timeControlOnScreen;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (UIView)elapsedTrack
{
  return self->_elapsedTrack;
}

- (void)setElapsedTrack:(id)a3
{
}

- (UIView)remainingTrack
{
  return self->_remainingTrack;
}

- (void)setRemainingTrack:(id)a3
{
}

- (UIView)knobView
{
  return self->_knobView;
}

- (void)setKnobView:(id)a3
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

- (UILayoutGuide)trackLayoutGuide
{
  return self->_trackLayoutGuide;
}

- (void)setTrackLayoutGuide:(id)a3
{
}

- (double)sliderValue
{
  return self->_sliderValue;
}

- (BOOL)isCurrentlyTracking
{
  return self->_currentlyTracking;
}

- (void)setCurrentlyTracking:(BOOL)a3
{
  self->_currentlyTracking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackLayoutGuide, 0);
  objc_storeStrong((id *)&self->_liveBackgroundMask, 0);
  objc_storeStrong((id *)&self->_liveBackground, 0);
  objc_storeStrong((id *)&self->_liveLabel, 0);
  objc_storeStrong((id *)&self->_remainingTimeLabel, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabel, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
  objc_storeStrong((id *)&self->_remainingTrack, 0);
  objc_storeStrong((id *)&self->_elapsedTrack, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_responseItem, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_remainingTime, 0);
  objc_storeStrong((id *)&self->_elapsedTime, 0);
  objc_storeStrong((id *)&self->_remainingTimeFormatter, 0);
  objc_storeStrong((id *)&self->_elapsedTimeFormatter, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_knobViewXConstraint, 0);
  objc_storeStrong((id *)&self->_initialConstraints, 0);
  objc_storeStrong((id *)&self->_trackingConstraints, 0);

  objc_storeStrong((id *)&self->_defaultConstraints, 0);
}

@end