@interface HUGridCameraCell
+ (BOOL)requiresConstraintBasedLayout;
+ (Class)layoutOptionsClass;
- (BOOL)shouldDisplayAccessModeErrorContent;
- (BOOL)shouldDisplayErrorContent;
- (CGRect)cameraViewFrame;
- (HUCameraView)cameraView;
- (HUGridCameraCell)initWithFrame:(CGRect)a3;
- (HUGridCameraCellLayoutOptions)layoutOptions;
- (HULegibilityLabel)descriptionLabel;
- (HUVisualEffectContainerView)exclamationView;
- (NADecayingTimer)descriptionLabelUpdateTimer;
- (NSArray)allConstraints;
- (NSArray)labelsConstraints;
- (UIImage)exclamationImage;
- (UIImageView)exclamationImageView;
- (UIImageView)recordingIndicatorImageView;
- (UILabel)titleLabel;
- (UIView)topBarView;
- (_UILegibilitySettings)legibilitySettings;
- (double)cameraViewAlpha;
- (id)_descriptionLabelText:(id)a3;
- (id)item;
- (void)_animateTransitionWithView:(id)a3 animations:(id)a4;
- (void)_populateExclamationImageIfNeeded;
- (void)_updateCameraViewAppearance;
- (void)_updateRecordIndicatorColor;
- (void)dealloc;
- (void)layoutOptionsDidChange;
- (void)prepareForReuse;
- (void)setAllConstraints:(id)a3;
- (void)setCameraView:(id)a3;
- (void)setCameraViewAlpha:(double)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDescriptionLabelUpdateTimer:(id)a3;
- (void)setItem:(id)a3;
- (void)setLabelsConstraints:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setRecordingIndicatorImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopBarView:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUGridCameraCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUGridCameraCell)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)HUGridCameraCell;
  v3 = -[HUGridCell initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(HUGridCameraCell *)v3 contentView];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    topBarView = v4->_topBarView;
    v4->_topBarView = v6;

    [(UIView *)v4->_topBarView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UIView *)v4->_topBarView setBackgroundColor:v8];

    [v5 addSubview:v4->_topBarView];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v9;

    v11 = [MEMORY[0x1E4F428B8] darkTextColor];
    [(UILabel *)v4->_titleLabel setTextColor:v11];

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:v4->_titleLabel];
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    recordingIndicatorImageView = v4->_recordingIndicatorImageView;
    v4->_recordingIndicatorImageView = v12;

    [(UIImageView *)v4->_recordingIndicatorImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_recordingIndicatorImageView setContentMode:1];
    [v5 addSubview:v4->_recordingIndicatorImageView];
    v14 = [(HUGridCameraCell *)v4 exclamationView];
    [v5 addSubview:v14];

    v15 = objc_alloc_init(HUCameraView);
    cameraView = v4->_cameraView;
    v4->_cameraView = v15;

    [(HUCameraView *)v4->_cameraView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUCameraView *)v4->_cameraView setUserInteractionEnabled:0];
    [v5 addSubview:v4->_cameraView];
    uint64_t v17 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:0];
    legibilitySettings = v4->_legibilitySettings;
    v4->_legibilitySettings = (_UILegibilitySettings *)v17;

    v19 = [HULegibilityLabel alloc];
    v20 = v4->_legibilitySettings;
    double v21 = *MEMORY[0x1E4F440D8];
    v22 = [MEMORY[0x1E4F42A30] systemFontOfSize:6.0];
    uint64_t v23 = [(HULegibilityLabel *)v19 initWithSettings:v20 strength:&stru_1F18F92B8 text:v22 font:*MEMORY[0x1E4F440F8] options:v21];
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = (HULegibilityLabel *)v23;

    [(HULegibilityLabel *)v4->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v25) = 1144766464;
    [(HULegibilityLabel *)v4->_descriptionLabel setContentCompressionResistancePriority:0 forAxis:v25];
    LODWORD(v26) = 1132134400;
    [(HULegibilityLabel *)v4->_descriptionLabel setContentHuggingPriority:0 forAxis:v26];
    [v5 addSubview:v4->_descriptionLabel];
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v4 selector:sel__handleShouldDifferentiateWithoutColorDidChange name:*MEMORY[0x1E4F43498] object:0];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3 = [(HUGridCameraCell *)self titleLabel];
  [v3 setText:0];

  v4 = [(HUGridCameraCell *)self descriptionLabel];
  [v4 setText:0];

  [(HUGridCameraCell *)self setItem:0];
  v5 = [(HUGridCameraCell *)self descriptionLabelUpdateTimer];
  [v5 invalidate];

  [(HUGridCameraCell *)self setDescriptionLabelUpdateTimer:0];
  v6.receiver = self;
  v6.super_class = (Class)HUGridCameraCell;
  [(HUGridCell *)&v6 prepareForReuse];
}

- (void)dealloc
{
  v3 = [(HUGridCameraCell *)self descriptionLabelUpdateTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)HUGridCameraCell;
  [(HUGridCameraCell *)&v4 dealloc];
}

- (double)cameraViewAlpha
{
  v2 = [(HUGridCameraCell *)self cameraView];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

- (void)setCameraViewAlpha:(double)a3
{
  id v4 = [(HUGridCameraCell *)self cameraView];
  [v4 setAlpha:a3];
}

- (CGRect)cameraViewFrame
{
  double v3 = [(HUGridCameraCell *)self cameraView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(HUGridCameraCell *)self cameraView];
  -[HUGridCameraCell convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

+ (Class)layoutOptionsClass
{
  return (Class)objc_opt_class();
}

- (void)setLayoutOptions:(id)a3
{
  double v5 = (HUGridCameraCellLayoutOptions *)a3;
  if (self->_layoutOptions != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    [(HUGridCameraCell *)self layoutOptionsDidChange];
    double v5 = v6;
  }
}

- (BOOL)shouldDisplayErrorContent
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F69758] isPressDemoModeEnabled] & 1) == 0)
  {
    objc_opt_class();
    double v4 = [(HUGridCameraCell *)self item];
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
    id v6 = v5;

    double v7 = [v6 profile];

    double v8 = [v7 accessory];
    LOBYTE(v6) = [v8 isReachable];

    if (v6)
    {
      double v9 = objc_msgSend(v7, "hf_cameraManager");
      double v10 = [v9 cachedStreamError];

      if (!v10) {
        goto LABEL_13;
      }
      double v11 = objc_msgSend(v7, "hf_cameraManager");
      v12 = [v11 cachedStreamError];
      if ([v12 code] == 23)
      {

        goto LABEL_13;
      }
      double v15 = objc_msgSend(v7, "hf_cameraManager");
      double v16 = [v15 cachedStreamError];
      uint64_t v17 = [v16 code];

      if (v17 == 14)
      {
LABEL_13:
        double v18 = [(HUGridCameraCell *)self item];
        double v19 = [v18 latestResults];
        double v13 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F688D0]];

        if (v13
          || ([(HUGridCameraCell *)self item],
              double v22 = objc_claimAutoreleasedReturnValue(),
              [v22 latestResults],
              double v23 = objc_claimAutoreleasedReturnValue(),
              v23,
              v22,
              !v23))
        {
          if (!objc_msgSend(v7, "hf_thermalShutdownModeActive"))
          {
            BOOL v3 = 0;
LABEL_27:

            return v3;
          }
          double v14 = HFLogForCategory();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_25;
          }
          double v20 = [v7 uniqueIdentifier];
          int v26 = 138412290;
          v27 = v20;
          double v21 = "Displaying error in tile because cameraProfile[%@] is in thermal shutdown mode";
          goto LABEL_21;
        }
        double v14 = HFLogForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          double v20 = [v7 uniqueIdentifier];
          int v26 = 138412290;
          v27 = v20;
          double v21 = "Displaying error in tile because cameraProfile[%@] has no snapshot";
LABEL_21:
          _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v26, 0xCu);
LABEL_24:
        }
LABEL_25:

        goto LABEL_26;
      }
      double v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        double v14 = [v7 uniqueIdentifier];
        double v20 = objc_msgSend(v7, "hf_cameraManager");
        double v24 = [v20 cachedStreamError];
        int v26 = 138412546;
        v27 = v14;
        __int16 v28 = 2112;
        objc_super v29 = v24;
        _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "Displaying error in tile because cameraProfile[%@] has a cached error:%@", (uint8_t *)&v26, 0x16u);

        goto LABEL_24;
      }
    }
    else
    {
      double v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        double v14 = [v7 uniqueIdentifier];
        int v26 = 138412290;
        v27 = v14;
        _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "Displaying error in tile because cameraProfile[%@] is unreachable", (uint8_t *)&v26, 0xCu);
        goto LABEL_25;
      }
    }
LABEL_26:
    BOOL v3 = 1;
    goto LABEL_27;
  }
  return 0;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v46.receiver = self;
  v46.super_class = (Class)HUGridCameraCell;
  -[HUGridCell updateUIWithAnimation:](&v46, sel_updateUIWithAnimation_);
  double v5 = [(HUGridCameraCell *)self item];
  id v6 = [v5 latestResults];
  double v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F688D0]];

  double v8 = [(HUGridCameraCell *)self cameraView];
  double v9 = [v8 cameraSource];

  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  v42 = __42__HUGridCameraCell_updateUIWithAnimation___block_invoke;
  v43 = &unk_1E63850E0;
  v44 = self;
  id v10 = v7;
  id v45 = v10;
  double v11 = (void (**)(void))_Block_copy(&v40);
  v12 = [(HUGridCameraCell *)self descriptionLabelUpdateTimer];
  double v13 = v12;
  if (v7 == v9)
  {

    if (v13) {
      goto LABEL_6;
    }
  }
  else
  {
    [v12 invalidate];
  }
  if (v10) {
    v11[2](v11);
  }
LABEL_6:
  double v14 = [(HUGridCameraCell *)self item];
  double v15 = [v14 latestResults];
  double v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  uint64_t v17 = [(HUGridCameraCell *)self titleLabel];
  [v17 setText:v16];

  double v18 = [(HUGridCameraCell *)self _descriptionLabelText:v10];
  double v19 = [(HUGridCameraCell *)self descriptionLabel];
  [v19 setText:v18];

  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    double v20 = [(HUGridCameraCell *)self item];
    double v21 = [v20 latestResults];
    double v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F688B8]];

    double v23 = [(HUGridCameraCell *)self cameraView];
    [v23 setCameraSource:v10 withDemoSnapshotURL:v22 animated:v3];

    double v24 = [(HUGridCameraCell *)self exclamationView];
    [v24 setHidden:1];
  }
  else
  {
    double v22 = [(HUGridCameraCell *)self cameraView];
    [v22 setCameraSource:v10 animated:v3];
  }

  if ([(HUGridCameraCell *)self shouldDisplayAccessModeErrorContent])
  {
    objc_opt_class();
    double v25 = [(HUGridCameraCell *)self item];
    if (objc_opt_isKindOfClass()) {
      int v26 = v25;
    }
    else {
      int v26 = 0;
    }
    id v27 = v26;

    __int16 v28 = [v27 profile];

    objc_super v29 = [v28 userSettings];
    if ([v29 currentAccessMode])
    {
      uint64_t v30 = [v28 userSettings];
      [v30 isCameraManuallyDisabled];
    }
    v35 = HFLocalizedString();
    v32 = +[HUCameraErrorContent errorWithTitle:v35 description:0];

    v36 = [(HUGridCameraCell *)self exclamationView];
    [v36 setHidden:1];

    v37 = [(HUGridCameraCell *)self recordingIndicatorImageView];
    [v37 setHidden:0];
  }
  else if ([(HUGridCameraCell *)self shouldDisplayErrorContent])
  {
    v31 = HFLocalizedString();
    v32 = +[HUCameraErrorContent errorWithTitle:v31 description:0];

    [(HUGridCameraCell *)self _populateExclamationImageIfNeeded];
    v33 = [(HUGridCameraCell *)self exclamationView];
    [v33 setHidden:0];

    __int16 v28 = [(HUGridCameraCell *)self recordingIndicatorImageView];
    [v28 setHidden:1];
  }
  else
  {
    v34 = [(HUGridCameraCell *)self exclamationView];
    [v34 setHidden:1];

    __int16 v28 = [(HUGridCameraCell *)self recordingIndicatorImageView];
    [v28 setHidden:0];
    v32 = 0;
  }

  v38 = [(HUGridCameraCell *)self descriptionLabel];
  [v38 setHidden:v32 != 0];

  v39 = [(HUGridCameraCell *)self cameraView];
  [v39 setErrorContent:v32 animated:v3];

  [(HUGridCameraCell *)self _updateRecordIndicatorColor];
  [(HUGridCameraCell *)self _updateCameraViewAppearance];
}

void __42__HUGridCameraCell_updateUIWithAnimation___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4F7A0C8];
  BOOL v3 = [*(id *)(a1 + 40) captureDate];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__HUGridCameraCell_updateUIWithAnimation___block_invoke_2;
  v5[3] = &unk_1E6386F68;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 40);
  double v4 = [v2 scheduledTimerWithReferenceDate:v3 minimumUnit:128 block:v5];
  [*(id *)(a1 + 32) setDescriptionLabelUpdateTimer:v4];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __42__HUGridCameraCell_updateUIWithAnimation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained _descriptionLabelText:*(void *)(a1 + 32)];
  BOOL v3 = [WeakRetained descriptionLabel];
  [v3 setText:v2];
}

- (BOOL)shouldDisplayAccessModeErrorContent
{
  objc_opt_class();
  BOOL v3 = [(HUGridCameraCell *)self item];
  if (objc_opt_isKindOfClass()) {
    double v4 = v3;
  }
  else {
    double v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 profile];

  if (v6)
  {
    id v7 = [v6 userSettings];
    if ([v7 currentAccessMode])
    {
      double v8 = [v6 userSettings];
      if ([v8 currentAccessMode] == 3)
      {
        char v9 = 1;
      }
      else
      {
        id v10 = [v6 userSettings];
        char v9 = [v10 isCameraManuallyDisabled];
      }
    }
    else
    {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)layoutOptionsDidChange
{
  v23.receiver = self;
  v23.super_class = (Class)HUGridCameraCell;
  [(HUGridCell *)&v23 layoutOptionsDidChange];
  [(HUGridCell *)self secondaryContentDimmingFactor];
  double v4 = v3;
  id v5 = [(HUGridCameraCell *)self descriptionLabel];
  [v5 setAlpha:v4];

  id v6 = [(HUGridCameraCell *)self cameraView];
  [v6 setMaskedCameraCorners:12];

  id v7 = [(HUGridCameraCell *)self topBarView];
  double v8 = [v7 layer];
  [v8 setMaskedCorners:3];

  char v9 = [(HUGridCameraCell *)self layoutOptions];
  [v9 cellCornerRadius];
  double v11 = v10;
  v12 = [(HUGridCameraCell *)self cameraView];
  [v12 _setContinuousCornerRadius:v11];

  double v13 = [(HUGridCameraCell *)self layoutOptions];
  [v13 cellCornerRadius];
  double v15 = v14;
  double v16 = [(HUGridCameraCell *)self topBarView];
  [v16 _setContinuousCornerRadius:v15];

  uint64_t v17 = [(HUGridCameraCell *)self layoutOptions];
  double v18 = [v17 font];
  double v19 = [(HUGridCameraCell *)self titleLabel];
  [v19 setFont:v18];

  double v20 = [(HUGridCameraCell *)self layoutOptions];
  double v21 = [v20 font];
  double v22 = [(HUGridCameraCell *)self descriptionLabel];
  [v22 setFont:v21];
}

- (void)updateConstraints
{
  v115[9] = *MEMORY[0x1E4F143B8];
  double v3 = [(HUGridCameraCell *)self allConstraints];

  if (!v3)
  {
    double v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = [(HUGridCameraCell *)self topBarView];
    id v6 = [v5 topAnchor];
    id v7 = [(HUGridCameraCell *)self contentView];
    double v8 = [v7 topAnchor];
    char v9 = [v6 constraintEqualToAnchor:v8];
    [v4 addObject:v9];

    double v10 = [(HUGridCameraCell *)self topBarView];
    double v11 = [v10 heightAnchor];
    v12 = [(HUGridCameraCell *)self layoutOptions];
    [v12 headerViewHeight];
    double v13 = objc_msgSend(v11, "constraintEqualToConstant:");
    [v4 addObject:v13];

    double v14 = [(HUGridCameraCell *)self topBarView];
    double v15 = [v14 leadingAnchor];
    double v16 = [(HUGridCameraCell *)self contentView];
    uint64_t v17 = [v16 leadingAnchor];
    double v18 = [v15 constraintEqualToAnchor:v17];
    [v4 addObject:v18];

    double v19 = [(HUGridCameraCell *)self topBarView];
    double v20 = [v19 trailingAnchor];
    double v21 = [(HUGridCameraCell *)self contentView];
    double v22 = [v21 trailingAnchor];
    objc_super v23 = [v20 constraintEqualToAnchor:v22];
    [v4 addObject:v23];

    double v24 = [(HUGridCameraCell *)self layoutOptions];
    [v24 headerViewHeight];
    double v26 = v25 * 0.5;

    id v27 = [(HUGridCameraCell *)self labelsConstraints];

    if (!v27)
    {
      v113 = [(HUGridCameraCell *)self titleLabel];
      v111 = [v113 centerYAnchor];
      v112 = [(HUGridCameraCell *)self contentView];
      v110 = [v112 topAnchor];
      v109 = [v111 constraintEqualToAnchor:v110 constant:v26];
      v115[0] = v109;
      v108 = [(HUGridCameraCell *)self descriptionLabel];
      v106 = [v108 centerYAnchor];
      v107 = [(HUGridCameraCell *)self contentView];
      v105 = [v107 bottomAnchor];
      v104 = [v106 constraintEqualToAnchor:v105 constant:-v26];
      v115[1] = v104;
      v103 = [(HUGridCameraCell *)self recordingIndicatorImageView];
      v101 = [v103 centerYAnchor];
      v102 = [(HUGridCameraCell *)self contentView];
      v100 = [v102 topAnchor];
      v99 = [v101 constraintEqualToAnchor:v100 constant:v26];
      v115[2] = v99;
      v98 = [(HUGridCameraCell *)self titleLabel];
      v96 = [v98 leadingAnchor];
      v97 = [(HUGridCameraCell *)self contentView];
      v94 = [v97 leadingAnchor];
      v95 = [(HUGridCameraCell *)self layoutOptions];
      [v95 headerHorizontalInnerMargins];
      v93 = objc_msgSend(v96, "constraintEqualToAnchor:constant:", v94);
      v115[3] = v93;
      v92 = [(HUGridCameraCell *)self titleLabel];
      v90 = [v92 trailingAnchor];
      v91 = [(HUGridCameraCell *)self recordingIndicatorImageView];
      v89 = [v91 leadingAnchor];
      v88 = [v90 constraintEqualToAnchor:v89];
      v115[4] = v88;
      v87 = [(HUGridCameraCell *)self descriptionLabel];
      v85 = [v87 trailingAnchor];
      v86 = [(HUGridCameraCell *)self contentView];
      v83 = [v86 trailingAnchor];
      v84 = [(HUGridCameraCell *)self layoutOptions];
      [v84 headerHorizontalInnerMargins];
      v82 = [v85 constraintEqualToAnchor:v83 constant:-v28];
      v115[5] = v82;
      v81 = [(HUGridCameraCell *)self recordingIndicatorImageView];
      v79 = [v81 trailingAnchor];
      v80 = [(HUGridCameraCell *)self contentView];
      v77 = [v80 trailingAnchor];
      v78 = [(HUGridCameraCell *)self layoutOptions];
      [v78 headerHorizontalInnerMargins];
      uint64_t v30 = [v79 constraintEqualToAnchor:v77 constant:-v29];
      v115[6] = v30;
      v31 = [(HUGridCameraCell *)self recordingIndicatorImageView];
      v32 = [v31 widthAnchor];
      v33 = [v32 constraintEqualToConstant:12.0];
      v115[7] = v33;
      v34 = [(HUGridCameraCell *)self recordingIndicatorImageView];
      v35 = [v34 heightAnchor];
      v36 = [v35 constraintEqualToConstant:12.0];
      v115[8] = v36;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:9];
      [(HUGridCameraCell *)self setLabelsConstraints:v37];

      v38 = [(HUGridCameraCell *)self labelsConstraints];
      [v4 addObjectsFromArray:v38];
    }
    v39 = [(HUGridCameraCell *)self exclamationView];
    uint64_t v40 = [v39 trailingAnchor];
    uint64_t v41 = [(HUGridCameraCell *)self contentView];
    v42 = [v41 trailingAnchor];
    v43 = [(HUGridCameraCell *)self layoutOptions];
    [v43 headerHorizontalInnerMargins];
    id v45 = [v40 constraintEqualToAnchor:v42 constant:-v44];
    [v4 addObject:v45];

    objc_super v46 = [(HUGridCameraCell *)self exclamationView];
    v47 = [v46 widthAnchor];
    v48 = [v47 constraintEqualToConstant:24.0];
    [v4 addObject:v48];

    v49 = [(HUGridCameraCell *)self exclamationView];
    v50 = [v49 heightAnchor];
    v51 = [v50 constraintEqualToConstant:24.0];
    [v4 addObject:v51];

    v52 = [(HUGridCameraCell *)self exclamationView];
    v53 = [v52 centerYAnchor];
    v54 = [(HUGridCameraCell *)self contentView];
    v55 = [v54 topAnchor];
    v56 = [v53 constraintEqualToAnchor:v55 constant:v26];
    [v4 addObject:v56];

    v57 = [(HUGridCameraCell *)self cameraView];
    v58 = [v57 leadingAnchor];
    v59 = [(HUGridCameraCell *)self contentView];
    v60 = [v59 leadingAnchor];
    v61 = [v58 constraintEqualToAnchor:v60];
    [v4 addObject:v61];

    v62 = [(HUGridCameraCell *)self cameraView];
    v63 = [v62 trailingAnchor];
    v64 = [(HUGridCameraCell *)self contentView];
    v65 = [v64 trailingAnchor];
    v66 = [v63 constraintEqualToAnchor:v65];
    [v4 addObject:v66];

    v67 = [(HUGridCameraCell *)self cameraView];
    v68 = [v67 topAnchor];
    v69 = [(HUGridCameraCell *)self topAnchor];
    v70 = [(HUGridCameraCell *)self layoutOptions];
    [v70 headerViewHeight];
    v71 = objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69);
    [v4 addObject:v71];

    v72 = [(HUGridCameraCell *)self cameraView];
    v73 = [v72 bottomAnchor];
    v74 = [(HUGridCameraCell *)self contentView];
    v75 = [v74 bottomAnchor];
    v76 = [v73 constraintEqualToAnchor:v75];
    [v4 addObject:v76];

    [(HUGridCameraCell *)self setAllConstraints:v4];
    [MEMORY[0x1E4F28DC8] activateConstraints:v4];
  }
  v114.receiver = self;
  v114.super_class = (Class)HUGridCameraCell;
  [(HUGridCameraCell *)&v114 updateConstraints];
}

- (void)_animateTransitionWithView:(id)a3 animations:(id)a4
{
}

- (void)_updateCameraViewAppearance
{
  double v3 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.4];
  double v4 = [(HUGridCameraCell *)self cameraView];
  [v4 setBackgroundColor:v3];

  id v6 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.75];
  id v5 = [(HUGridCameraCell *)self cameraView];
  [v5 setTintColor:v6];
}

- (void)_updateRecordIndicatorColor
{
  objc_opt_class();
  double v3 = [(HUGridCameraCell *)self item];
  if (objc_opt_isKindOfClass()) {
    double v4 = v3;
  }
  else {
    double v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 profile];

  id v11 = [v6 userSettings];

  if (v11) {
    objc_msgSend(v11, "hu_indicatorColorForCurrentAccessMode");
  }
  else {
  id v7 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  [(UIImageView *)self->_recordingIndicatorImageView setTintColor:v7];

  double v8 = (void *)MEMORY[0x1E4F42A80];
  char v9 = objc_msgSend(v11, "hu_indicatorImageNameForCurrentAccessMode");
  double v10 = [v8 systemImageNamed:v9];
  [(UIImageView *)self->_recordingIndicatorImageView setImage:v10];
}

- (id)_descriptionLabelText:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F69758] shouldSuppressAllErrorsForDemo])
  {
    id v5 = &stru_1F18F92B8;
    goto LABEL_8;
  }
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "hf_localizedAge");
LABEL_5:
    id v5 = (__CFString *)v6;
    goto LABEL_8;
  }
  if (![(HUGridCell *)self primaryState])
  {
    uint64_t v6 = _HULocalizedStringWithDefaultValue(@"HUGridCameraCellNoResponseDescription", @"HUGridCameraCellNoResponseDescription", 1);
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_8:

  return v5;
}

- (void)_populateExclamationImageIfNeeded
{
  double v3 = [(HUGridCameraCell *)self exclamationImageView];
  id v4 = [v3 image];

  if (!v4)
  {
    id v6 = [(HUGridCameraCell *)self exclamationImage];
    id v5 = [(HUGridCameraCell *)self exclamationImageView];
    [v5 setImage:v6];
  }
}

- (UIImage)exclamationImage
{
  exclamationImage = self->_exclamationImage;
  if (!exclamationImage)
  {
    id v4 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"exclamationmark.circle.fill"];
    id v5 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438A0]];
    id v6 = [v4 imageWithConfiguration:v5];
    id v7 = self->_exclamationImage;
    self->_exclamationImage = v6;

    exclamationImage = self->_exclamationImage;
  }

  return exclamationImage;
}

- (HUVisualEffectContainerView)exclamationView
{
  exclamationView = self->_exclamationView;
  if (!exclamationView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    id v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    exclamationImageView = self->_exclamationImageView;
    self->_exclamationImageView = v5;

    id v7 = [HUVisualEffectContainerView alloc];
    double v8 = [(HUGridCell *)self contentEffect];
    char v9 = [(HUVisualEffectContainerView *)v7 initWithEffect:v8];

    [(HUVisualEffectContainerView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUVisualEffectContainerView *)v9 setInnerContentView:self->_exclamationImageView];
    double v10 = [MEMORY[0x1E4F428B8] systemRedColor];
    [(HUVisualEffectContainerView *)v9 setTintColor:v10];

    id v11 = self->_exclamationView;
    self->_exclamationView = v9;

    exclamationView = self->_exclamationView;
  }

  return exclamationView;
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (HUGridCameraCellLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (UIImageView)exclamationImageView
{
  return self->_exclamationImageView;
}

- (UIView)topBarView
{
  return self->_topBarView;
}

- (void)setTopBarView:(id)a3
{
}

- (UIImageView)recordingIndicatorImageView
{
  return self->_recordingIndicatorImageView;
}

- (void)setRecordingIndicatorImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (HULegibilityLabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (HUCameraView)cameraView
{
  return self->_cameraView;
}

- (void)setCameraView:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (NSArray)allConstraints
{
  return self->_allConstraints;
}

- (void)setAllConstraints:(id)a3
{
}

- (NSArray)labelsConstraints
{
  return self->_labelsConstraints;
}

- (void)setLabelsConstraints:(id)a3
{
}

- (NADecayingTimer)descriptionLabelUpdateTimer
{
  return self->_descriptionLabelUpdateTimer;
}

- (void)setDescriptionLabelUpdateTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabelUpdateTimer, 0);
  objc_storeStrong((id *)&self->_labelsConstraints, 0);
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_topBarView, 0);
  objc_storeStrong((id *)&self->_exclamationImageView, 0);
  objc_storeStrong((id *)&self->_exclamationView, 0);
  objc_storeStrong((id *)&self->_exclamationImage, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end