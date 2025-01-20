@interface HUClipScrubberView
- (AVBackgroundView)contentBackgroundView;
- (BOOL)_isDataSourceUpdating;
- (BOOL)isPlayingMedia;
- (HUBlendedSeparatorView)leftBlendedSeparator;
- (HUBlendedSeparatorView)rightBlendedSeparator;
- (HUClipScrubberPlayheadView)backgroundPlayheadView;
- (HUClipScrubberPlayheadView)playheadView;
- (HUClipScrubberView)initWithFrame:(CGRect)a3;
- (UIButton)playPauseButton;
- (UIButton)rightActionButton;
- (UICollectionView)clipCollectionView;
- (UIView)collectionViewContainer;
- (UIView)contentView;
- (id)_deleteImage;
- (id)_pauseImage;
- (id)_playImage;
- (id)displayModeDescription;
- (id)playOrPauseImageForEngineMode:(unint64_t)a3;
- (unint64_t)displayMode;
- (void)_addConstraints;
- (void)activateLiveButtonDisplay;
- (void)deactivateLiveButtonDisplay;
- (void)didUpdatePlaybackEngine:(id)a3;
- (void)displayEditInterface;
- (void)hideEditInterface;
- (void)layoutSubviews;
- (void)navigateToLivePosition;
- (void)navigateToOffset:(double)a3;
- (void)setBackgroundPlayheadView:(id)a3;
- (void)setClipCollectionView:(id)a3;
- (void)setCollectionViewContainer:(id)a3;
- (void)setContentBackgroundView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDisplayMode:(unint64_t)a3;
- (void)setIsPlayingMedia:(BOOL)a3;
- (void)setLeftBlendedSeparator:(id)a3;
- (void)setPlayPauseButton:(id)a3;
- (void)setPlayheadView:(id)a3;
- (void)setRightActionButton:(id)a3;
- (void)setRightBlendedSeparator:(id)a3;
- (void)updateAccessoryButtonsForPlaybackEngine:(id)a3;
- (void)updateDisplayMode:(unint64_t)a3;
@end

@implementation HUClipScrubberView

- (HUClipScrubberView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUClipScrubberView;
  v3 = -[HUClipScrubberView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] clearColor];
    [(HUClipScrubberView *)v3 setBackgroundColor:v4];

    [(HUClipScrubberView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(HUClipScrubberView *)v3 contentView];
    [(HUClipScrubberView *)v3 addSubview:v5];

    v6 = [(HUClipScrubberView *)v3 playheadView];
    [(HUClipScrubberView *)v3 addSubview:v6];

    [(HUClipScrubberView *)v3 _addConstraints];
  }
  return v3;
}

- (void)_addConstraints
{
  v134[32] = *MEMORY[0x1E4F143B8];
  v133 = [(HUClipScrubberView *)self contentView];
  v132 = [v133 heightAnchor];
  v131 = [v132 constraintEqualToConstant:94.0];
  v134[0] = v131;
  v130 = [(HUClipScrubberView *)self contentView];
  v129 = [v130 leftAnchor];
  v128 = [(HUClipScrubberView *)self leftAnchor];
  v127 = [v129 constraintEqualToAnchor:v128];
  v134[1] = v127;
  v126 = [(HUClipScrubberView *)self contentView];
  v125 = [v126 rightAnchor];
  v124 = [(HUClipScrubberView *)self rightAnchor];
  v123 = [v125 constraintEqualToAnchor:v124];
  v134[2] = v123;
  v122 = [(HUClipScrubberView *)self contentView];
  v121 = [v122 bottomAnchor];
  v120 = [(HUClipScrubberView *)self bottomAnchor];
  v119 = [v121 constraintEqualToAnchor:v120];
  v134[3] = v119;
  v118 = [(HUClipScrubberView *)self contentBackgroundView];
  v117 = [v118 heightAnchor];
  v116 = [v117 constraintEqualToConstant:47.0];
  v134[4] = v116;
  v115 = [(HUClipScrubberView *)self contentBackgroundView];
  v113 = [v115 leftAnchor];
  v114 = [(HUClipScrubberView *)self contentView];
  v112 = [v114 leftAnchor];
  v111 = [v113 constraintEqualToAnchor:v112];
  v134[5] = v111;
  v110 = [(HUClipScrubberView *)self contentBackgroundView];
  v108 = [v110 rightAnchor];
  v109 = [(HUClipScrubberView *)self contentView];
  v107 = [v109 rightAnchor];
  v106 = [v108 constraintEqualToAnchor:v107];
  v134[6] = v106;
  v105 = [(HUClipScrubberView *)self contentBackgroundView];
  v103 = [v105 bottomAnchor];
  v104 = [(HUClipScrubberView *)self contentView];
  v102 = [v104 bottomAnchor];
  v101 = [v103 constraintEqualToAnchor:v102];
  v134[7] = v101;
  v100 = [(HUClipScrubberView *)self collectionViewContainer];
  v99 = [v100 heightAnchor];
  v98 = [v99 constraintEqualToConstant:94.0];
  v134[8] = v98;
  v97 = [(HUClipScrubberView *)self collectionViewContainer];
  v95 = [v97 leftAnchor];
  v96 = [(HUClipScrubberView *)self contentView];
  v94 = [v96 leftAnchor];
  v93 = [v95 constraintEqualToAnchor:v94 constant:54.0];
  v134[9] = v93;
  v92 = [(HUClipScrubberView *)self collectionViewContainer];
  v90 = [v92 rightAnchor];
  v91 = [(HUClipScrubberView *)self contentView];
  v89 = [v91 rightAnchor];
  v88 = [v90 constraintEqualToAnchor:v89 constant:-54.0];
  v134[10] = v88;
  v87 = [(HUClipScrubberView *)self collectionViewContainer];
  v86 = [v87 bottomAnchor];
  v85 = [(HUClipScrubberView *)self bottomAnchor];
  v84 = [v86 constraintEqualToAnchor:v85];
  v134[11] = v84;
  v83 = [(HUClipScrubberView *)self backgroundPlayheadView];
  v81 = [v83 bottomAnchor];
  v82 = [(HUClipScrubberView *)self collectionViewContainer];
  v80 = [v82 bottomAnchor];
  v79 = [v81 constraintEqualToAnchor:v80];
  v134[12] = v79;
  v78 = [(HUClipScrubberView *)self backgroundPlayheadView];
  v76 = [v78 centerXAnchor];
  v77 = [(HUClipScrubberView *)self collectionViewContainer];
  v75 = [v77 centerXAnchor];
  v74 = [v76 constraintEqualToAnchor:v75];
  v134[13] = v74;
  v73 = [(HUClipScrubberView *)self backgroundPlayheadView];
  v72 = [v73 widthAnchor];
  v71 = [v72 constraintEqualToConstant:24.0];
  v134[14] = v71;
  v70 = [(HUClipScrubberView *)self backgroundPlayheadView];
  v69 = [v70 heightAnchor];
  v68 = [v69 constraintEqualToConstant:55.0];
  v134[15] = v68;
  v67 = [(HUClipScrubberView *)self playheadView];
  v66 = [v67 bottomAnchor];
  v65 = [(HUClipScrubberView *)self bottomAnchor];
  v64 = [v66 constraintEqualToAnchor:v65];
  v134[16] = v64;
  v63 = [(HUClipScrubberView *)self playheadView];
  v62 = [v63 centerXAnchor];
  v61 = [(HUClipScrubberView *)self centerXAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v134[17] = v60;
  v59 = [(HUClipScrubberView *)self playheadView];
  v58 = [v59 widthAnchor];
  v56 = [v58 constraintEqualToConstant:24.0];
  v134[18] = v56;
  v55 = [(HUClipScrubberView *)self playheadView];
  v54 = [v55 heightAnchor];
  v53 = [v54 constraintEqualToConstant:55.0];
  v134[19] = v53;
  v52 = [(HUClipScrubberView *)self playPauseButton];
  v51 = [v52 widthAnchor];
  v50 = [v51 constraintEqualToConstant:54.0];
  v134[20] = v50;
  v49 = [(HUClipScrubberView *)self playPauseButton];
  v47 = [v49 leftAnchor];
  v48 = [(HUClipScrubberView *)self contentView];
  v46 = [v48 leftAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v134[21] = v45;
  v44 = [(HUClipScrubberView *)self playPauseButton];
  v42 = [v44 bottomAnchor];
  v43 = [(HUClipScrubberView *)self contentView];
  v41 = [v43 bottomAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v134[22] = v40;
  v39 = [(HUClipScrubberView *)self playPauseButton];
  v38 = [v39 heightAnchor];
  v37 = [v38 constraintEqualToConstant:47.0];
  v134[23] = v37;
  v36 = [(HUClipScrubberView *)self clipCollectionView];
  v34 = [v36 leftAnchor];
  v35 = [(HUClipScrubberView *)self collectionViewContainer];
  v33 = [v35 leftAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v134[24] = v32;
  v31 = [(HUClipScrubberView *)self clipCollectionView];
  v29 = [v31 bottomAnchor];
  v30 = [(HUClipScrubberView *)self collectionViewContainer];
  v28 = [v30 bottomAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v134[25] = v27;
  v26 = [(HUClipScrubberView *)self clipCollectionView];
  v25 = [v26 heightAnchor];
  v24 = [v25 constraintEqualToConstant:47.0];
  v134[26] = v24;
  v23 = [(HUClipScrubberView *)self clipCollectionView];
  v21 = [v23 rightAnchor];
  v22 = [(HUClipScrubberView *)self collectionViewContainer];
  v20 = [v22 rightAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v134[27] = v19;
  v18 = [(HUClipScrubberView *)self rightActionButton];
  v17 = [v18 widthAnchor];
  v16 = [v17 constraintEqualToConstant:54.0];
  v134[28] = v16;
  v15 = [(HUClipScrubberView *)self rightActionButton];
  v13 = [v15 rightAnchor];
  v14 = [(HUClipScrubberView *)self contentView];
  v3 = [v14 rightAnchor];
  v4 = [v13 constraintEqualToAnchor:v3];
  v134[29] = v4;
  v5 = [(HUClipScrubberView *)self rightActionButton];
  v6 = [v5 bottomAnchor];
  v7 = [(HUClipScrubberView *)self contentView];
  objc_super v8 = [v7 bottomAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  v134[30] = v9;
  v10 = [(HUClipScrubberView *)self rightActionButton];
  v11 = [v10 heightAnchor];
  v12 = [v11 constraintEqualToConstant:47.0];
  v134[31] = v12;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:32];

  [MEMORY[0x1E4F28DC8] activateConstraints:v57];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)HUClipScrubberView;
  [(HUClipScrubberView *)&v5 layoutSubviews];
  v3 = [(HUClipScrubberView *)self clipCollectionView];
  v4 = [v3 collectionViewLayout];
  [v4 invalidateLayout];
}

- (id)playOrPauseImageForEngineMode:(unint64_t)a3
{
  if (a3 && [(HUClipScrubberView *)self isPlayingMedia])
  {
    v4 = [(HUClipScrubberView *)self _pauseImage];
  }
  else
  {
    v4 = [(HUClipScrubberView *)self _playImage];
  }

  return v4;
}

- (void)activateLiveButtonDisplay
{
  v3 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  v4 = [(HUClipScrubberView *)self rightActionButton];
  [v4 setBackgroundColor:v3];

  id v6 = [MEMORY[0x1E4F428B8] systemBlackColor];
  objc_super v5 = [(HUClipScrubberView *)self rightActionButton];
  [v5 setTintColor:v6];
}

- (void)deactivateLiveButtonDisplay
{
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  v4 = [(HUClipScrubberView *)self rightActionButton];
  [v4 setBackgroundColor:v3];

  id v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  objc_super v5 = [(HUClipScrubberView *)self rightActionButton];
  [v5 setTintColor:v6];
}

- (void)didUpdatePlaybackEngine:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 timeControlStatus];
  uint64_t v6 = [v4 engineMode];
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = [v4 timeControlStatusDescription];
    v9 = [(HUClipScrubberView *)self displayModeDescription];
    v10 = [v4 engineModeDescription];
    int v11 = 138412802;
    v12 = v8;
    __int16 v13 = 2112;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Scrubber didUpdate timeControlStatus:%@  displayMode:%@ engineMode:%@.", (uint8_t *)&v11, 0x20u);
  }
  switch(v5)
  {
    case 0:
      [(HUClipScrubberView *)self setIsPlayingMedia:0];
      [(HUClipScrubberView *)self deactivateLiveButtonDisplay];
      break;
    case 2:
      if (v6) {
        [(HUClipScrubberView *)self deactivateLiveButtonDisplay];
      }
      else {
        [(HUClipScrubberView *)self activateLiveButtonDisplay];
      }
      goto LABEL_12;
    case 1:
      [(HUClipScrubberView *)self deactivateLiveButtonDisplay];
      if (v6 == 1) {
LABEL_12:
      }
        [(HUClipScrubberView *)self setIsPlayingMedia:1];
      break;
  }
  [(HUClipScrubberView *)self updateAccessoryButtonsForPlaybackEngine:v4];
}

- (void)updateAccessoryButtonsForPlaybackEngine:(id)a3
{
  id v8 = a3;
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    if ([v8 engineMode]) {
      [(HUClipScrubberView *)self deactivateLiveButtonDisplay];
    }
    else {
      [(HUClipScrubberView *)self activateLiveButtonDisplay];
    }
  }
  BOOL v4 = [v8 timelineState] == 2;
  uint64_t v5 = [(HUClipScrubberView *)self playPauseButton];
  [v5 setEnabled:v4];

  if ([v8 timelineState] == 2) {
    -[HUClipScrubberView playOrPauseImageForEngineMode:](self, "playOrPauseImageForEngineMode:", [v8 engineMode]);
  }
  else {
  uint64_t v6 = [(HUClipScrubberView *)self _playImage];
  }
  v7 = [(HUClipScrubberView *)self playPauseButton];
  [v7 setImage:v6 forState:0];
}

- (BOOL)_isDataSourceUpdating
{
  objc_opt_class();
  v3 = [(HUClipScrubberView *)self clipCollectionView];
  BOOL v4 = [v3 dataSource];
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  char v7 = [v6 isUpdating];
  return v7;
}

- (void)navigateToLivePosition
{
  if (![(HUClipScrubberView *)self _isDataSourceUpdating])
  {
    v3 = [(HUClipScrubberView *)self clipCollectionView];
    [v3 contentOffset];
    double v5 = v4;

    id v6 = [(HUClipScrubberView *)self clipCollectionView];
    [v6 contentSize];
    double v8 = v7;
    v9 = [(HUClipScrubberView *)self clipCollectionView];
    [v9 bounds];
    double v11 = v8 - v10;

    id v12 = [(HUClipScrubberView *)self clipCollectionView];
    objc_msgSend(v12, "setContentOffset:", v11, v5);
  }
}

- (void)navigateToOffset:(double)a3
{
  if (![(HUClipScrubberView *)self _isDataSourceUpdating])
  {
    double v5 = [(HUClipScrubberView *)self clipCollectionView];
    [v5 contentOffset];
    double v7 = v6;

    double v8 = [(HUClipScrubberView *)self clipCollectionView];
    [v8 bounds];
    double v10 = a3 + v9 * -0.5;

    id v11 = [(HUClipScrubberView *)self clipCollectionView];
    objc_msgSend(v11, "setContentOffset:", v10, v7);
  }
}

- (void)updateDisplayMode:(unint64_t)a3
{
  if ([(HUClipScrubberView *)self displayMode] != a3)
  {
    if (a3 == 1)
    {
      [(HUClipScrubberView *)self displayEditInterface];
    }
    else if (!a3)
    {
      [(HUClipScrubberView *)self hideEditInterface];
    }
  }

  [(HUClipScrubberView *)self setDisplayMode:a3];
}

- (void)displayEditInterface
{
  v3 = [(HUClipScrubberView *)self rightActionButton];
  [v3 setTitle:0 forState:0];

  double v4 = [(HUClipScrubberView *)self rightActionButton];
  [v4 setAttributedTitle:0 forState:0];

  double v5 = [(HUClipScrubberView *)self rightActionButton];
  double v6 = [(HUClipScrubberView *)self _deleteImage];
  [v5 setImage:v6 forState:0];

  [(HUClipScrubberView *)self deactivateLiveButtonDisplay];
  id v7 = [(HUClipScrubberView *)self playheadView];
  [v7 setEditing:1];
}

- (void)hideEditInterface
{
  v3 = [(HUClipScrubberView *)self rightActionButton];
  [v3 setImage:0 forState:0];

  double v4 = [(HUClipScrubberView *)self rightActionButton];
  objc_msgSend(v4, "setContentEdgeInsets:", 0.0, 4.0, 0.0, 4.0);

  double v5 = [(HUClipScrubberView *)self rightActionButton];
  double v6 = _HULocalizedStringWithDefaultValue(@"HUCameraLive", @"HUCameraLive", 1);
  [v5 setTitle:v6 forState:0];

  [(HUClipScrubberView *)self deactivateLiveButtonDisplay];
  id v7 = [(HUClipScrubberView *)self traitCollection];
  LODWORD(v6) = objc_msgSend(v7, "hu_hasExtendedWidth");

  if (v6)
  {
    double v8 = [(HUClipScrubberView *)self leftBlendedSeparator];
    [v8 setHidden:0];

    double v9 = [(HUClipScrubberView *)self rightBlendedSeparator];
    [v9 setHidden:0];
  }
  id v10 = [(HUClipScrubberView *)self playheadView];
  [v10 setEditing:0];
}

- (UICollectionView)clipCollectionView
{
  clipCollectionView = self->_clipCollectionView;
  if (!clipCollectionView)
  {
    [(UIView *)self->_contentView bounds];
    double v5 = v4 + -108.0;
    id v6 = objc_alloc_init(MEMORY[0x1E4F42890]);
    [v6 setScrollDirection:1];
    id v7 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42858]), "initWithFrame:collectionViewLayout:", v6, 54.0, 0.0, v5, 47.0);
    double v8 = _HULocalizedStringWithDefaultValue(@"HUClipScrubberCollectionViewAccessibilityLabel", @"HUClipScrubberCollectionViewAccessibilityLabel", 1);
    [(UICollectionView *)v7 setAccessibilityLabel:v8];

    [(UICollectionView *)v7 setSemanticContentAttribute:3];
    double v9 = [MEMORY[0x1E4F428B8] clearColor];
    [(UICollectionView *)v7 setBackgroundColor:v9];

    [(UICollectionView *)v7 setClipsToBounds:0];
    [(UICollectionView *)v7 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"HUCameraEventRecordingCellIdentifier"];
    [(UICollectionView *)v7 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"HUCameraEventReachabilityCellIdentifier"];
    [(UICollectionView *)v7 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"HUCameraEventSpacerCellIdentifier"];
    [(UICollectionView *)v7 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4F43758] withReuseIdentifier:@"header"];
    [(UICollectionView *)v7 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4F43750] withReuseIdentifier:@"footer"];
    [(UICollectionView *)v7 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"liveSpacer"];
    [(UICollectionView *)v7 setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v10 = self->_clipCollectionView;
    self->_clipCollectionView = v7;

    clipCollectionView = self->_clipCollectionView;
  }

  return clipCollectionView;
}

- (UIView)collectionViewContainer
{
  collectionViewContainer = self->_collectionViewContainer;
  if (!collectionViewContainer)
  {
    double v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4 setClipsToBounds:1];
    double v5 = [(HUClipScrubberView *)self backgroundPlayheadView];
    [(UIView *)v4 addSubview:v5];

    id v6 = [(HUClipScrubberView *)self clipCollectionView];
    [(UIView *)v4 addSubview:v6];

    id v7 = self->_collectionViewContainer;
    self->_collectionViewContainer = v4;

    collectionViewContainer = self->_collectionViewContainer;
  }

  return collectionViewContainer;
}

- (AVBackgroundView)contentBackgroundView
{
  contentBackgroundView = self->_contentBackgroundView;
  if (!contentBackgroundView)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F16708]);
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v5 = self->_contentBackgroundView;
    self->_contentBackgroundView = (AVBackgroundView *)v4;

    contentBackgroundView = self->_contentBackgroundView;
  }

  return contentBackgroundView;
}

- (UIView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = [(HUClipScrubberView *)self contentBackgroundView];
    [(UIView *)v5 addSubview:v6];

    id v7 = [(HUClipScrubberView *)self collectionViewContainer];
    [(UIView *)v5 addSubview:v7];

    double v8 = [(HUClipScrubberView *)self playPauseButton];
    [(UIView *)v5 addSubview:v8];

    double v9 = [(HUClipScrubberView *)self rightActionButton];
    [(UIView *)v5 addSubview:v9];

    id v10 = self->_contentView;
    self->_contentView = v5;

    contentView = self->_contentView;
  }

  return contentView;
}

- (HUClipScrubberPlayheadView)playheadView
{
  playheadView = self->_playheadView;
  if (!playheadView)
  {
    id v4 = objc_alloc_init(HUClipScrubberPlayheadView);
    [(HUClipScrubberPlayheadView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v5 = self->_playheadView;
    self->_playheadView = v4;

    playheadView = self->_playheadView;
  }

  return playheadView;
}

- (HUClipScrubberPlayheadView)backgroundPlayheadView
{
  backgroundPlayheadView = self->_backgroundPlayheadView;
  if (!backgroundPlayheadView)
  {
    id v4 = objc_alloc_init(HUClipScrubberPlayheadView);
    [(HUClipScrubberPlayheadView *)v4 setDrawsUpperContent:1];
    [(HUClipScrubberPlayheadView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v5 = self->_backgroundPlayheadView;
    self->_backgroundPlayheadView = v4;

    backgroundPlayheadView = self->_backgroundPlayheadView;
  }

  return backgroundPlayheadView;
}

- (UIButton)playPauseButton
{
  v24[4] = *MEMORY[0x1E4F143B8];
  playPauseButton = self->_playPauseButton;
  if (!playPauseButton)
  {
    id v4 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    double v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UIButton *)v4 setTintColor:v5];

    [(UIButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = [(HUClipScrubberView *)self _playImage];
    [(UIButton *)v4 setImage:v6 forState:0];

    id v7 = [(UIButton *)v4 imageView];
    [v7 setContentMode:4];

    double v8 = [HUBlendedSeparatorView alloc];
    double v9 = -[HUBlendedSeparatorView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(HUClipScrubberView *)self setLeftBlendedSeparator:v9];
    [(HUBlendedSeparatorView *)v9 setOpaque:0];
    [(HUBlendedSeparatorView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v4 addSubview:v9];
    v23 = [(HUBlendedSeparatorView *)v9 topAnchor];
    v22 = [(UIButton *)v4 topAnchor];
    v21 = [v23 constraintEqualToAnchor:v22 constant:0.0];
    v24[0] = v21;
    v20 = [(HUBlendedSeparatorView *)v9 bottomAnchor];
    v19 = [(UIButton *)v4 bottomAnchor];
    id v10 = [v20 constraintEqualToAnchor:v19];
    v24[1] = v10;
    id v11 = [(HUBlendedSeparatorView *)v9 widthAnchor];
    id v12 = [v11 constraintEqualToConstant:1.0];
    v24[2] = v12;
    __int16 v13 = [(HUBlendedSeparatorView *)v9 rightAnchor];
    v14 = [(UIButton *)v4 rightAnchor];
    __int16 v15 = [v13 constraintEqualToAnchor:v14];
    v24[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];

    [MEMORY[0x1E4F28DC8] activateConstraints:v16];
    uint64_t v17 = self->_playPauseButton;
    self->_playPauseButton = v4;

    playPauseButton = self->_playPauseButton;
  }

  return playPauseButton;
}

- (UIButton)rightActionButton
{
  v23[4] = *MEMORY[0x1E4F143B8];
  rightActionButton = self->_rightActionButton;
  if (!rightActionButton)
  {
    objc_msgSend(MEMORY[0x1E4F427E0], "hu_clipScrubberLiveButton");
    id v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    double v5 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIButton *)v4 setBackgroundColor:v5];

    [(UIButton *)v4 _setContinuousCornerRadius:16.0];
    id v6 = [(UIButton *)v4 layer];
    [v6 setMaskedCorners:10];

    [(UIButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v7 = [HUBlendedSeparatorView alloc];
    double v8 = -[HUBlendedSeparatorView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(HUClipScrubberView *)self setRightBlendedSeparator:v8];
    [(HUBlendedSeparatorView *)v8 setOpaque:0];
    [(HUBlendedSeparatorView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v4 addSubview:v8];
    v22 = [(HUBlendedSeparatorView *)v8 topAnchor];
    v21 = [(UIButton *)v4 topAnchor];
    v20 = [v22 constraintEqualToAnchor:v21 constant:0.0];
    v23[0] = v20;
    v19 = [(HUBlendedSeparatorView *)v8 bottomAnchor];
    v18 = [(UIButton *)v4 bottomAnchor];
    double v9 = [v19 constraintEqualToAnchor:v18];
    v23[1] = v9;
    id v10 = [(HUBlendedSeparatorView *)v8 widthAnchor];
    id v11 = [v10 constraintEqualToConstant:1.0];
    v23[2] = v11;
    id v12 = [(HUBlendedSeparatorView *)v8 leftAnchor];
    __int16 v13 = [(UIButton *)v4 leftAnchor];
    v14 = [v12 constraintEqualToAnchor:v13 constant:0.0];
    v23[3] = v14;
    __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

    [MEMORY[0x1E4F28DC8] activateConstraints:v15];
    v16 = self->_rightActionButton;
    self->_rightActionButton = v4;

    rightActionButton = self->_rightActionButton;
  }

  return rightActionButton;
}

- (id)_playImage
{
  v2 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"play.fill"];
  v3 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
  id v4 = [v2 imageWithConfiguration:v3];

  return v4;
}

- (id)_pauseImage
{
  v2 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"pause.fill"];
  v3 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
  id v4 = [v2 imageWithConfiguration:v3];

  return v4;
}

- (id)_deleteImage
{
  v2 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"trash"];
  v3 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_standardSymbolConfiguration");
  id v4 = [v2 imageWithConfiguration:v3];

  return v4;
}

- (id)displayModeDescription
{
  if ([(HUClipScrubberView *)self displayMode]) {
    return @"Editing";
  }
  else {
    return @"Default";
  }
}

- (void)setPlayPauseButton:(id)a3
{
}

- (void)setRightActionButton:(id)a3
{
}

- (void)setPlayheadView:(id)a3
{
}

- (void)setClipCollectionView:(id)a3
{
}

- (void)setContentView:(id)a3
{
}

- (void)setContentBackgroundView:(id)a3
{
}

- (void)setBackgroundPlayheadView:(id)a3
{
}

- (void)setCollectionViewContainer:(id)a3
{
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (HUBlendedSeparatorView)leftBlendedSeparator
{
  return self->_leftBlendedSeparator;
}

- (void)setLeftBlendedSeparator:(id)a3
{
}

- (HUBlendedSeparatorView)rightBlendedSeparator
{
  return self->_rightBlendedSeparator;
}

- (void)setRightBlendedSeparator:(id)a3
{
}

- (BOOL)isPlayingMedia
{
  return self->_isPlayingMedia;
}

- (void)setIsPlayingMedia:(BOOL)a3
{
  self->_isPlayingMedia = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBlendedSeparator, 0);
  objc_storeStrong((id *)&self->_leftBlendedSeparator, 0);
  objc_storeStrong((id *)&self->_collectionViewContainer, 0);
  objc_storeStrong((id *)&self->_backgroundPlayheadView, 0);
  objc_storeStrong((id *)&self->_contentBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_clipCollectionView, 0);
  objc_storeStrong((id *)&self->_playheadView, 0);
  objc_storeStrong((id *)&self->_rightActionButton, 0);

  objc_storeStrong((id *)&self->_playPauseButton, 0);
}

@end