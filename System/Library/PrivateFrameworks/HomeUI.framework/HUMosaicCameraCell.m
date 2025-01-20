@interface HUMosaicCameraCell
+ (BOOL)requiresConstraintBasedLayout;
+ (Class)layoutOptionsClass;
+ (id)legibilityLabel;
- (BOOL)isSingleCell;
- (BOOL)shouldDisplayAccessModeErrorContent;
- (BOOL)shouldDisplayErrorContent;
- (CGRect)cameraViewFrame;
- (CGSize)currentSize;
- (HUCameraView)cameraView;
- (HULegibilityLabel)cameraNameLabel;
- (HULegibilityLabel)timingLabel;
- (HUMosaicCameraCell)initWithFrame:(CGRect)a3;
- (NADecayingTimer)timingLabelUpdateTimer;
- (NSArray)allConstraints;
- (NSArray)legibilityLabelConstraints;
- (UIImageView)recordingIndicatorImageView;
- (double)cameraViewAlpha;
- (double)currentCornerRadius;
- (id)_timingLabelText:(id)a3;
- (id)item;
- (id)layoutOptions;
- (void)_animateTransitionWithView:(id)a3 animations:(id)a4;
- (void)_updateCornerRadiusIfNeeded;
- (void)_updateRecordIndicatorColor;
- (void)_updateUIForSizeChange;
- (void)_updateViewCorners:(double)a3;
- (void)createLegibilityLabelsIfNecessary;
- (void)dealloc;
- (void)layoutOptionsDidChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAllConstraints:(id)a3;
- (void)setCameraNameLabel:(id)a3;
- (void)setCameraView:(id)a3;
- (void)setCameraViewAlpha:(double)a3;
- (void)setCurrentCornerRadius:(double)a3;
- (void)setCurrentSize:(CGSize)a3;
- (void)setIsSingleCell:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setLegibilityLabelConstraints:(id)a3;
- (void)setRecordingIndicatorImageView:(id)a3;
- (void)setTimingLabel:(id)a3;
- (void)setTimingLabelUpdateTimer:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUMosaicCameraCell

- (HUMosaicCameraCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)HUMosaicCameraCell;
  v7 = -[HUGridCell initWithFrame:](&v16, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    [(HUMosaicCameraCell *)v7 setMaximumContentSizeCategory:*MEMORY[0x1E4F43790]];
    v8->_currentSize.double width = width;
    v8->_currentSize.double height = height;
    v9 = objc_alloc_init(HUCameraView);
    cameraView = v8->_cameraView;
    v8->_cameraView = v9;

    v11 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.75];
    [(HUCameraView *)v8->_cameraView setTintColor:v11];

    v12 = -[HUMosaicCameraErrorView initWithFrame:]([HUMosaicCameraErrorView alloc], "initWithFrame:", x, y, width, height);
    [(HUCameraView *)v8->_cameraView setOverrideErrorView:v12];

    [(HUCameraView *)v8->_cameraView setHideCameraContentWhenDisplayingErrors:1];
    [(HUCameraView *)v8->_cameraView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUCameraView *)v8->_cameraView setUserInteractionEnabled:0];
    [(HUMosaicCameraCell *)v8 addSubview:v8->_cameraView];
    v13 = [(HUMosaicCameraCell *)v8 recordingIndicatorImageView];
    [(HUMosaicCameraCell *)v8 addSubview:v13];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v8 selector:sel__handleShouldDifferentiateWithoutColorDidChange name:*MEMORY[0x1E4F43498] object:0];
  }
  return v8;
}

- (void)setItem:(id)a3
{
}

- (void)setLayoutOptions:(id)a3
{
  v5 = (HUGridCellLayoutOptions *)a3;
  if (self->_layoutOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    [(HUMosaicCameraCell *)self layoutOptionsDidChange];
    v5 = v6;
  }
}

- (void)updateConstraints
{
  v3 = [(HUMosaicCameraCell *)self allConstraints];

  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    objc_opt_class();
    v5 = [(HUMosaicCameraCell *)self layoutOptions];
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      [v7 descriptionInset];
      double v9 = v8;
    }
    else
    {
      double v9 = 0.0;
    }
    v10 = [(HUMosaicCameraCell *)self recordingIndicatorImageView];
    v11 = [v10 topAnchor];
    v12 = [(HUMosaicCameraCell *)self topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:v9];
    [v4 addObject:v13];

    v14 = [(HUMosaicCameraCell *)self recordingIndicatorImageView];
    v15 = [v14 trailingAnchor];
    objc_super v16 = [(HUMosaicCameraCell *)self trailingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16 constant:-v9];
    [v4 addObject:v17];

    v18 = [(HUMosaicCameraCell *)self recordingIndicatorImageView];
    v19 = [v18 widthAnchor];
    v20 = [v19 constraintEqualToConstant:12.0];
    [v4 addObject:v20];

    v21 = [(HUMosaicCameraCell *)self recordingIndicatorImageView];
    v22 = [v21 heightAnchor];
    v23 = [v22 constraintEqualToConstant:12.0];
    [v4 addObject:v23];

    v24 = [(HUMosaicCameraCell *)self cameraView];
    v25 = [v24 leadingAnchor];
    v26 = [(HUMosaicCameraCell *)self leadingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    [v4 addObject:v27];

    v28 = [(HUMosaicCameraCell *)self cameraView];
    v29 = [v28 trailingAnchor];
    v30 = [(HUMosaicCameraCell *)self trailingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    [v4 addObject:v31];

    v32 = [(HUMosaicCameraCell *)self cameraView];
    v33 = [v32 topAnchor];
    v34 = [(HUMosaicCameraCell *)self topAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    [v4 addObject:v35];

    v36 = [(HUMosaicCameraCell *)self cameraView];
    v37 = [v36 bottomAnchor];
    v38 = [(HUMosaicCameraCell *)self bottomAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    [v4 addObject:v39];

    [(HUMosaicCameraCell *)self setAllConstraints:v4];
    [MEMORY[0x1E4F28DC8] activateConstraints:v4];
  }
  v40.receiver = self;
  v40.super_class = (Class)HUMosaicCameraCell;
  [(HUMosaicCameraCell *)&v40 updateConstraints];
}

- (UIImageView)recordingIndicatorImageView
{
  recordingIndicatorImageView = self->_recordingIndicatorImageView;
  if (!recordingIndicatorImageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    [(UIImageView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4 setUserInteractionEnabled:0];
    [(UIImageView *)v4 setContentMode:1];
    v5 = self->_recordingIndicatorImageView;
    self->_recordingIndicatorImageView = v4;

    recordingIndicatorImageView = self->_recordingIndicatorImageView;
  }

  return recordingIndicatorImageView;
}

- (void)_updateCornerRadiusIfNeeded
{
  v3 = [(HUMosaicCameraCell *)self layoutOptions];

  if (v3)
  {
    [(HUMosaicCameraCell *)self frame];
    double v5 = v4;
    double v7 = v6;
    id v8 = [(HUMosaicCameraCell *)self layoutOptions];
    objc_msgSend(v8, "cornerRadiusForCellSize:", v5, v7);
    -[HUMosaicCameraCell setCurrentCornerRadius:](self, "setCurrentCornerRadius:");
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)HUMosaicCameraCell;
  [(HUGridCell *)&v12 layoutSubviews];
  [(HUMosaicCameraCell *)self currentSize];
  double v4 = v3;
  double v6 = v5;
  [(HUMosaicCameraCell *)self frame];
  if (v4 != v8 || v6 != v7)
  {
    [(HUMosaicCameraCell *)self frame];
    -[HUMosaicCameraCell setCurrentSize:](self, "setCurrentSize:", v10, v11);
    [(HUMosaicCameraCell *)self _updateUIForSizeChange];
  }
}

- (CGSize)currentSize
{
  double width = self->_currentSize.width;
  double height = self->_currentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCurrentCornerRadius:(double)a3
{
  if (vabdd_f64(self->_currentCornerRadius, a3) >= 0.00000011920929)
  {
    self->_currentCornerRadius = a3;
    -[HUMosaicCameraCell _updateViewCorners:](self, "_updateViewCorners:");
  }
}

- (void)_updateUIForSizeChange
{
  double v3 = [(HUMosaicCameraCell *)self layoutOptions];

  if (v3)
  {
    double v4 = [(HUMosaicCameraCell *)self layoutOptions];
    -[HUMosaicCameraCell setIsSingleCell:](self, "setIsSingleCell:", [v4 isSingleCell]);

    [(HUMosaicCameraCell *)self _updateCornerRadiusIfNeeded];
  }
}

- (void)setIsSingleCell:(BOOL)a3
{
  self->_isSingleCell = a3;
}

- (void)layoutOptionsDidChange
{
  v15.receiver = self;
  v15.super_class = (Class)HUMosaicCameraCell;
  [(HUGridCell *)&v15 layoutOptionsDidChange];
  double v3 = [(HUMosaicCameraCell *)self cameraView];
  [v3 setMaskedCameraCorners:-1];

  double v4 = [(HUMosaicCameraCell *)self layoutOptions];
  double v5 = [v4 timingLabelFont];
  double v6 = [(HUMosaicCameraCell *)self timingLabel];
  [v6 setFont:v5];

  double v7 = [v4 font];
  double v8 = [(HUMosaicCameraCell *)self cameraNameLabel];
  [v8 setFont:v7];

  [(HUMosaicCameraCell *)self _updateUIForSizeChange];
  uint64_t v9 = [(HUMosaicCameraCell *)self isSingleCell] ^ 1;
  double v10 = [(HUMosaicCameraCell *)self cameraView];
  [v10 setHideCameraContentWhenDisplayingErrors:v9];

  objc_opt_class();
  double v11 = [(HUMosaicCameraCell *)self cameraView];
  objc_super v12 = [v11 overrideErrorView];
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  objc_msgSend(v14, "setVisualEffectViewHidden:", -[HUMosaicCameraCell isSingleCell](self, "isSingleCell"));
}

- (BOOL)isSingleCell
{
  return self->_isSingleCell;
}

- (id)layoutOptions
{
  return self->_layoutOptions;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v52.receiver = self;
  v52.super_class = (Class)HUMosaicCameraCell;
  -[HUGridCell updateUIWithAnimation:](&v52, sel_updateUIWithAnimation_);
  double v5 = [(HUMosaicCameraCell *)self item];
  double v6 = [v5 latestResults];
  double v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  BOOL v8 = [(HUMosaicCameraCell *)self shouldDisplayAccessModeErrorContent];
  if (v8)
  {
    objc_opt_class();
    uint64_t v9 = [(HUMosaicCameraCell *)self item];
    if (objc_opt_isKindOfClass()) {
      double v10 = v9;
    }
    else {
      double v10 = 0;
    }
    id v11 = v10;

    objc_super v12 = [v11 profile];

    v13 = [v12 userSettings];
    if ([v13 currentAccessMode])
    {
      id v14 = [v12 userSettings];
      [v14 isCameraManuallyDisabled];
    }
    v18 = HFLocalizedString();
    goto LABEL_17;
  }
  if ([(HUMosaicCameraCell *)self shouldDisplayErrorContent])
  {
    objc_opt_class();
    objc_super v15 = [(HUMosaicCameraCell *)self item];
    if (objc_opt_isKindOfClass()) {
      objc_super v16 = v15;
    }
    else {
      objc_super v16 = 0;
    }
    id v17 = v16;

    objc_super v12 = [v17 profile];

    v18 = HFLocalizedString();
    uint64_t v19 = objc_msgSend(v12, "hf_thermalShutdownMode");
    if (v19 == 1 || v19 == 2)
    {
      uint64_t v20 = HFLocalizedString();

      v18 = (void *)v20;
    }
LABEL_17:
    v21 = +[HUCameraErrorContent errorWithTitle:v7 description:v18];

    if (v21) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  BOOL v8 = 1;
LABEL_18:
  [(HUMosaicCameraCell *)self createLegibilityLabelsIfNecessary];
  v21 = 0;
LABEL_19:
  v22 = [(HUMosaicCameraCell *)self item];
  v23 = [v22 latestResults];
  v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F688D0]];

  v25 = [(HUMosaicCameraCell *)self cameraView];
  v26 = [v25 cameraSource];

  uint64_t v46 = MEMORY[0x1E4F143A8];
  uint64_t v47 = 3221225472;
  v48 = __44__HUMosaicCameraCell_updateUIWithAnimation___block_invoke;
  v49 = &unk_1E63850E0;
  v50 = self;
  id v27 = v24;
  id v51 = v27;
  v28 = (void (**)(void))_Block_copy(&v46);
  v29 = [(HUMosaicCameraCell *)self timingLabelUpdateTimer];
  v30 = v29;
  if (v24 == v26)
  {

    if (v30) {
      goto LABEL_24;
    }
  }
  else
  {
    [v29 invalidate];
  }
  if (v27) {
    v28[2](v28);
  }
LABEL_24:
  v31 = [(HUMosaicCameraCell *)self cameraNameLabel];
  [v31 setText:v7];

  v32 = [(HUMosaicCameraCell *)self _timingLabelText:v27];
  v33 = [(HUMosaicCameraCell *)self timingLabel];
  [v33 setText:v32];

  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    v34 = [(HUMosaicCameraCell *)self item];
    v35 = [v34 latestResults];
    v36 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F688B8]];

    v37 = [(HUMosaicCameraCell *)self cameraView];
    [v37 setCameraSource:v27 withDemoSnapshotURL:v36 animated:v3];
  }
  else
  {
    v36 = [(HUMosaicCameraCell *)self cameraView];
    [v36 setCameraSource:v27 animated:v3];
  }

  v38 = [(HUMosaicCameraCell *)self timingLabel];
  [v38 setHidden:v21 != 0];

  if (v21) {
    uint64_t v39 = 1;
  }
  else {
    uint64_t v39 = [(HUMosaicCameraCell *)self isSingleCell] ^ 1;
  }
  objc_super v40 = [(HUMosaicCameraCell *)self cameraNameLabel];
  [v40 setHidden:v39];

  if (v8) {
    uint64_t v41 = [(HUMosaicCameraCell *)self isSingleCell] ^ 1;
  }
  else {
    uint64_t v41 = 1;
  }
  v42 = [(HUMosaicCameraCell *)self recordingIndicatorImageView];
  [v42 setHidden:v41];

  v43 = [(HUMosaicCameraCell *)self cameraView];
  [v43 setErrorContent:v21 animated:v3];

  if (v21) {
    [MEMORY[0x1E4F428B8] clearColor];
  }
  else {
  v44 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.4];
  }
  v45 = [(HUMosaicCameraCell *)self cameraView];
  [v45 setBackgroundColor:v44];

  [(HUMosaicCameraCell *)self _updateRecordIndicatorColor];
}

- (id)item
{
  return self->_item;
}

- (HUCameraView)cameraView
{
  return self->_cameraView;
}

- (HULegibilityLabel)timingLabel
{
  return self->_timingLabel;
}

- (HULegibilityLabel)cameraNameLabel
{
  return self->_cameraNameLabel;
}

- (NADecayingTimer)timingLabelUpdateTimer
{
  return self->_timingLabelUpdateTimer;
}

- (BOOL)shouldDisplayErrorContent
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F69758] isPressDemoModeEnabled] & 1) == 0)
  {
    objc_opt_class();
    double v4 = [(HUMosaicCameraCell *)self item];
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
    id v6 = v5;

    double v7 = [v6 profile];

    BOOL v8 = [v7 accessory];
    LOBYTE(v6) = [v8 isReachable];

    if ((v6 & 1) == 0)
    {
      v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138412290;
        v25 = v7;
        _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "Displaying error in tile because cameraProfile is unreachable; %@",
          (uint8_t *)&v24,
          0xCu);
      }
      goto LABEL_23;
    }
    uint64_t v9 = objc_msgSend(v7, "hf_cameraManager");
    double v10 = [v9 cachedStreamError];

    if (v10)
    {
      id v11 = objc_msgSend(v7, "hf_cameraManager");
      objc_super v12 = [v11 cachedStreamError];
      if ([v12 code] == 23)
      {
      }
      else
      {
        id v14 = objc_msgSend(v7, "hf_cameraManager");
        objc_super v15 = [v14 cachedStreamError];
        uint64_t v16 = [v15 code];

        if (v16 != 14)
        {
          v13 = HFLogForCategory();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          uint64_t v19 = objc_msgSend(v7, "hf_cameraManager");
          v23 = [v19 cachedStreamError];
          int v24 = 138412546;
          v25 = v7;
          __int16 v26 = 2112;
          id v27 = v23;
          _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "Displaying error in tile because cameraProfile has a cached error; %@; %@",
            (uint8_t *)&v24,
            0x16u);

LABEL_21:
LABEL_23:
          BOOL v3 = 1;
          goto LABEL_24;
        }
      }
    }
    id v17 = [(HUMosaicCameraCell *)self item];
    v18 = [v17 latestResults];
    v13 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F688D0]];

    if (v13
      || ([(HUMosaicCameraCell *)self item],
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          [v20 latestResults],
          v21 = objc_claimAutoreleasedReturnValue(),
          v21,
          v20,
          !v21))
    {
      if (!objc_msgSend(v7, "hf_thermalShutdownModeActive"))
      {
        BOOL v3 = 0;
LABEL_24:

        return v3;
      }
      uint64_t v19 = HFLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        v25 = v7;
        _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "Displaying error in tile because cameraProfile is in thermal shutdown mode; %@",
          (uint8_t *)&v24,
          0xCu);
      }
    }
    else
    {
      uint64_t v19 = HFLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138412290;
        v25 = v7;
        _os_log_error_impl(&dword_1BE345000, v19, OS_LOG_TYPE_ERROR, "Displaying error in tile because cameraProfile has no snapshot; %@",
          (uint8_t *)&v24,
          0xCu);
      }
    }
    goto LABEL_21;
  }
  return 0;
}

- (BOOL)shouldDisplayAccessModeErrorContent
{
  objc_opt_class();
  BOOL v3 = [(HUMosaicCameraCell *)self item];
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
    double v7 = [v6 userSettings];
    if ([v7 currentAccessMode])
    {
      BOOL v8 = [v6 userSettings];
      if ([v8 currentAccessMode] == 3)
      {
        char v9 = 1;
      }
      else
      {
        double v10 = [v6 userSettings];
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

- (void)_updateRecordIndicatorColor
{
  objc_opt_class();
  BOOL v3 = [(HUMosaicCameraCell *)self item];
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
  double v7 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  [(UIImageView *)self->_recordingIndicatorImageView setTintColor:v7];

  BOOL v8 = (void *)MEMORY[0x1E4F42A80];
  char v9 = objc_msgSend(v11, "hu_indicatorImageNameForCurrentAccessMode");
  double v10 = [v8 systemImageNamed:v9];
  [(UIImageView *)self->_recordingIndicatorImageView setImage:v10];
}

- (id)_timingLabelText:(id)a3
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

- (void)setAllConstraints:(id)a3
{
}

- (NSArray)allConstraints
{
  return self->_allConstraints;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)prepareForReuse
{
  BOOL v3 = [(HUMosaicCameraCell *)self timingLabel];
  [v3 setText:0];

  id v4 = [(HUMosaicCameraCell *)self cameraNameLabel];
  [v4 setText:0];

  [(HUMosaicCameraCell *)self setItem:0];
  id v5 = [(HUMosaicCameraCell *)self timingLabelUpdateTimer];
  [v5 invalidate];

  [(HUMosaicCameraCell *)self setTimingLabelUpdateTimer:0];
  v6.receiver = self;
  v6.super_class = (Class)HUMosaicCameraCell;
  [(HUGridCell *)&v6 prepareForReuse];
}

- (void)dealloc
{
  BOOL v3 = [(HUMosaicCameraCell *)self timingLabelUpdateTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)HUMosaicCameraCell;
  [(HUMosaicCameraCell *)&v4 dealloc];
}

- (double)cameraViewAlpha
{
  v2 = [(HUMosaicCameraCell *)self cameraView];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

- (void)setCameraViewAlpha:(double)a3
{
  id v4 = [(HUMosaicCameraCell *)self cameraView];
  [v4 setAlpha:a3];
}

- (CGRect)cameraViewFrame
{
  double v3 = [(HUMosaicCameraCell *)self cameraView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(HUMosaicCameraCell *)self cameraView];
  -[HUMosaicCameraCell convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

+ (Class)layoutOptionsClass
{
  return (Class)objc_opt_class();
}

+ (id)legibilityLabel
{
  v2 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
  double v3 = [HULegibilityLabel alloc];
  double v4 = [(HULegibilityLabel *)v3 initWithSettings:v2 strength:*MEMORY[0x1E4F440E8]];
  [(HULegibilityLabel *)v4 setOptions:*MEMORY[0x1E4F440F0]];
  [(HULegibilityLabel *)v4 setAdjustsFontForContentSizeCategory:1];
  [(HULegibilityLabel *)v4 setTextAlignment:4];
  [(HULegibilityLabel *)v4 setLineBreakMode:4];
  [(HULegibilityLabel *)v4 setUserInteractionEnabled:0];
  [(HULegibilityLabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v4;
}

- (void)createLegibilityLabelsIfNecessary
{
  v48[6] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  double v3 = [(HUMosaicCameraCell *)self layoutOptions];
  if (objc_opt_isKindOfClass()) {
    double v4 = v3;
  }
  else {
    double v4 = 0;
  }
  id v5 = v4;

  double v6 = [(HUMosaicCameraCell *)self timingLabel];

  if (!v6)
  {
    double v7 = [(id)objc_opt_class() legibilityLabel];
    [(HUMosaicCameraCell *)self setTimingLabel:v7];

    double v8 = [v5 timingLabelFont];
    double v9 = [(HUMosaicCameraCell *)self timingLabel];
    [v9 setFont:v8];

    double v10 = [(HUMosaicCameraCell *)self timingLabel];
    [(HUMosaicCameraCell *)self addSubview:v10];
  }
  double v11 = [(HUMosaicCameraCell *)self cameraNameLabel];

  if (!v11)
  {
    objc_super v12 = [(id)objc_opt_class() legibilityLabel];
    [(HUMosaicCameraCell *)self setCameraNameLabel:v12];

    double v13 = [v5 font];
    double v14 = [(HUMosaicCameraCell *)self cameraNameLabel];
    [v14 setFont:v13];

    double v15 = [(HUMosaicCameraCell *)self cameraNameLabel];
    [(HUMosaicCameraCell *)self addSubview:v15];
  }
  double v16 = [(HUMosaicCameraCell *)self legibilityLabelConstraints];

  if (!v16)
  {
    [v5 descriptionInset];
    double v18 = v17;
    uint64_t v46 = [(HUMosaicCameraCell *)self timingLabel];
    v45 = [v46 bottomAnchor];
    v44 = [(HUMosaicCameraCell *)self bottomAnchor];
    v43 = [v45 constraintEqualToAnchor:v44 constant:-v18];
    v48[0] = v43;
    v42 = [(HUMosaicCameraCell *)self timingLabel];
    uint64_t v41 = [v42 leadingAnchor];
    objc_super v40 = [(HUMosaicCameraCell *)self leadingAnchor];
    uint64_t v39 = [v41 constraintEqualToAnchor:v40 constant:v18];
    v48[1] = v39;
    v38 = [(HUMosaicCameraCell *)self timingLabel];
    v37 = [v38 trailingAnchor];
    v36 = [(HUMosaicCameraCell *)self trailingAnchor];
    v35 = [v37 constraintLessThanOrEqualToAnchor:v36 constant:-v18];
    v48[2] = v35;
    v34 = [(HUMosaicCameraCell *)self cameraNameLabel];
    v32 = [v34 bottomAnchor];
    v33 = [(HUMosaicCameraCell *)self timingLabel];
    v31 = [v33 topAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v48[3] = v30;
    [(HUMosaicCameraCell *)self cameraNameLabel];
    double v19 = v47 = v5;
    double v20 = [v19 leadingAnchor];
    double v21 = [(HUMosaicCameraCell *)self leadingAnchor];
    double v22 = [v20 constraintEqualToAnchor:v21 constant:v18];
    v48[4] = v22;
    double v23 = [(HUMosaicCameraCell *)self cameraNameLabel];
    double v24 = [v23 trailingAnchor];
    v25 = [(HUMosaicCameraCell *)self trailingAnchor];
    __int16 v26 = [v24 constraintLessThanOrEqualToAnchor:v25 constant:-v18];
    v48[5] = v26;
    id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:6];
    [(HUMosaicCameraCell *)self setLegibilityLabelConstraints:v27];

    id v5 = v47;
    uint64_t v28 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [(HUMosaicCameraCell *)self legibilityLabelConstraints];
    [v28 activateConstraints:v29];
  }
}

void __44__HUMosaicCameraCell_updateUIWithAnimation___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4F7A0C8];
  double v3 = [*(id *)(a1 + 40) captureDate];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__HUMosaicCameraCell_updateUIWithAnimation___block_invoke_2;
  v5[3] = &unk_1E6386F68;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 40);
  double v4 = [v2 scheduledTimerWithReferenceDate:v3 minimumUnit:128 block:v5];
  [*(id *)(a1 + 32) setTimingLabelUpdateTimer:v4];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __44__HUMosaicCameraCell_updateUIWithAnimation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained _timingLabelText:*(void *)(a1 + 32)];
  double v3 = [WeakRetained timingLabel];
  [v3 setText:v2];
}

- (void)_updateViewCorners:(double)a3
{
  id v5 = [(HUMosaicCameraCell *)self cameraView];
  [v5 _setContinuousCornerRadius:a3];

  id v6 = [(HUMosaicCameraCell *)self backgroundConfiguration];
  [v6 setCornerRadius:a3];
  [(HUMosaicCameraCell *)self setBackgroundConfiguration:v6];
}

- (void)_animateTransitionWithView:(id)a3 animations:(id)a4
{
}

- (void)setTimingLabel:(id)a3
{
}

- (void)setCameraNameLabel:(id)a3
{
}

- (void)setCameraView:(id)a3
{
}

- (void)setRecordingIndicatorImageView:(id)a3
{
}

- (void)setTimingLabelUpdateTimer:(id)a3
{
}

- (void)setCurrentSize:(CGSize)a3
{
  self->_currentSize = a3;
}

- (double)currentCornerRadius
{
  return self->_currentCornerRadius;
}

- (NSArray)legibilityLabelConstraints
{
  return self->_legibilityLabelConstraints;
}

- (void)setLegibilityLabelConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilityLabelConstraints, 0);
  objc_storeStrong((id *)&self->_timingLabelUpdateTimer, 0);
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_cameraNameLabel, 0);
  objc_storeStrong((id *)&self->_timingLabel, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end