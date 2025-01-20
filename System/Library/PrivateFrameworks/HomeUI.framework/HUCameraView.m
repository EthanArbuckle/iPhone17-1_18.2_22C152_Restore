@interface HUCameraView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)hideCameraContentWhenDisplayingErrors;
- (BOOL)isBadgeHidden;
- (BOOL)shouldRespectAspectRatio;
- (BOOL)showActivityIndicator;
- (CGRect)cameraContentFrame;
- (CGRect)derivedCameraContentFrame;
- (HMCameraSource)cameraSource;
- (HMCameraView)cameraView;
- (HUCameraBadgeView)badgeView;
- (HUCameraErrorContent)errorContent;
- (HUCameraErrorViewable)errorView;
- (HUCameraErrorViewable)overrideErrorView;
- (HUCameraView)init;
- (HUCameraView)initWithBadgeView:(id)a3;
- (HURemoteContextHostingView)cameraContainerView;
- (NADecayingTimer)snapshotAgeUpdateTimer;
- (NSArray)staticConstraints;
- (NSLayoutConstraint)badgeBottomConstraint;
- (NSLayoutConstraint)badgeTrailingConstraint;
- (NSLayoutConstraint)cameraAspectRatioConstraint;
- (NSLayoutYAxisAnchor)badgeBottomAnchor;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIImageView)demoSnapshotImageView;
- (UIOffset)badgeOffset;
- (UIView)backgroundView;
- (UIView)cameraDimmingView;
- (UIView)cameraOverlaySnapshot;
- (UIView)cameraOverlayView;
- (double)_continuousCornerRadius;
- (id)backgroundColor;
- (id)cameraContentSnapshot;
- (int64_t)contentModeForAspectRatio:(double)a3;
- (unint64_t)maskedCameraCorners;
- (void)_scheduleNextSnapshotAgeUpdateForCaptureDate:(id)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_updateBadgeView;
- (void)_updateBadgeViewReschedulingTimerIfNecessary:(BOOL)a3;
- (void)_updateErrorAndActivityIndicatorVisibilityAnimated:(BOOL)a3;
- (void)_updateMaskedCameraCorners;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setActivityIndicatorView:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBadgeBottomAnchor:(id)a3;
- (void)setBadgeBottomConstraint:(id)a3;
- (void)setBadgeHidden:(BOOL)a3;
- (void)setBadgeOffset:(UIOffset)a3;
- (void)setBadgeTrailingConstraint:(id)a3;
- (void)setCameraAspectRatioConstraint:(id)a3;
- (void)setCameraContentMode:(int64_t)a3;
- (void)setCameraDimmingView:(id)a3;
- (void)setCameraSource:(id)a3;
- (void)setCameraSource:(id)a3 animated:(BOOL)a4;
- (void)setCameraSource:(id)a3 withDemoSnapshotURL:(id)a4 animated:(BOOL)a5;
- (void)setContentMode:(int64_t)a3;
- (void)setDemoSnapshotImageView:(id)a3;
- (void)setErrorContent:(id)a3;
- (void)setErrorContent:(id)a3 animated:(BOOL)a4;
- (void)setErrorView:(id)a3;
- (void)setHideCameraContentWhenDisplayingErrors:(BOOL)a3;
- (void)setMaskedCameraCorners:(unint64_t)a3;
- (void)setOverrideErrorView:(id)a3;
- (void)setShouldRespectAspectRatio:(BOOL)a3;
- (void)setShowActivityIndicator:(BOOL)a3;
- (void)setShowActivityIndicator:(BOOL)a3 animated:(BOOL)a4;
- (void)setSnapshotAgeUpdateTimer:(id)a3;
- (void)setStaticConstraints:(id)a3;
- (void)updateConstraints;
@end

@implementation HUCameraView

- (void)setOverrideErrorView:(id)a3
{
}

- (HUCameraView)init
{
  return [(HUCameraView *)self initWithBadgeView:0];
}

- (HUCameraView)initWithBadgeView:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HUCameraView;
  v6 = [(HUCameraView *)&v20 init];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F2E768]);
    [v7 setContentMode:1];
    v8 = [[HURemoteContextHostingView alloc] initWithContentView:v7];
    v9 = (void *)*((void *)v6 + 57);
    *((void *)v6 + 57) = v8;

    [*((id *)v6 + 57) setClipsToBounds:1];
    [*((id *)v6 + 57) setAlpha:0.0];
    [*((id *)v6 + 57) setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 addSubview:*((void *)v6 + 57)];
    id v10 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    v11 = (void *)*((void *)v6 + 59);
    *((void *)v6 + 59) = v10;

    v12 = [*((id *)v6 + 59) layer];
    [v12 setMasksToBounds:1];

    [*((id *)v6 + 59) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v6 + 59) setUserInteractionEnabled:0];
    [v6 addSubview:*((void *)v6 + 59)];
    char v13 = [MEMORY[0x1E4F69758] shouldSuppressAllErrorsForDemo];
    if (v5 && (v13 & 1) == 0)
    {
      objc_storeStrong((id *)v6 + 58, a3);
      [*((id *)v6 + 58) setTranslatesAutoresizingMaskIntoConstraints:0];
      [v6 addSubview:*((void *)v6 + 58)];
      __asm { FMOV            V0.2D, #16.0 }
      *(_OWORD *)(v6 + 552) = _Q0;
      [v6 _updateBadgeView];
    }
    objc_msgSend(v6, "setContentMode:", objc_msgSend(v7, "contentMode"));
  }
  return (HUCameraView *)v6;
}

- (void)setContentMode:(int64_t)a3
{
  if ([(HUCameraView *)self contentMode] != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)HUCameraView;
    [(HUCameraView *)&v8 setContentMode:a3];
    uint64_t v5 = [(HUCameraView *)self contentMode];
    v6 = [(HUCameraView *)self cameraContainerView];
    id v7 = [v6 contentView];
    [v7 setContentMode:v5];
  }
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)HUCameraView;
  [(HUCameraView *)&v36 layoutSubviews];
  [(HUCameraView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(HUCameraView *)self cameraContainerView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(HUCameraView *)self cameraContainerView];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(HUCameraView *)self cameraView];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    v22 = [(HUCameraView *)self cameraContainerView];
    [v22 bounds];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    v31 = [(HUCameraView *)self demoSnapshotImageView];
    objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);
  }
  [(HUCameraView *)self cameraContentFrame];
  if (v33 == *MEMORY[0x1E4F1DB30] && v32 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v35 = [(HUCameraView *)self cameraContainerView];
    [v35 layoutIfNeeded];
  }
  [(HUCameraView *)self _updateMaskedCameraCorners];
}

- (CGRect)cameraContentFrame
{
  double v3 = [(HUCameraView *)self cameraView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(HUCameraView *)self cameraView];
  -[HUCameraView convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
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

- (void)setHideCameraContentWhenDisplayingErrors:(BOOL)a3
{
  self->_hideCameraContentWhenDisplayingErrors = a3;
}

- (HUCameraErrorViewable)overrideErrorView
{
  return self->_overrideErrorView;
}

- (void)setMaskedCameraCorners:(unint64_t)a3
{
  self->_maskedCameraCorners = a3;
  [(HUCameraView *)self _updateMaskedCameraCorners];
}

- (void)setErrorContent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v37[4] = *MEMORY[0x1E4F143B8];
  double v7 = (HUCameraErrorContent *)a3;
  if (([MEMORY[0x1E4F69758] shouldSuppressAllErrorsForDemo] & 1) == 0 && self->_errorContent != v7)
  {
    objc_storeStrong((id *)&self->_errorContent, a3);
    if (v7)
    {
      double v8 = [(HUCameraView *)self errorView];

      if (!v8)
      {
        double v9 = [(HUCameraView *)self overrideErrorView];
        if (v9)
        {
          [(HUCameraView *)self setErrorView:v9];
        }
        else
        {
          double v10 = objc_alloc_init(HUCameraErrorView);
          [(HUCameraView *)self setErrorView:v10];
        }
        double v11 = [(HUCameraView *)self errorView];
        [v11 setAlpha:0.0];

        v12 = [(HUCameraView *)self errorView];
        [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

        double v13 = [(HUCameraView *)self cameraOverlayView];
        double v14 = [(HUCameraView *)self errorView];
        [v13 addSubview:v14];

        double v29 = (void *)MEMORY[0x1E4F28DC8];
        objc_super v36 = [(HUCameraView *)self errorView];
        v35 = [v36 centerXAnchor];
        v34 = [(HUCameraView *)self centerXAnchor];
        double v33 = [v35 constraintEqualToAnchor:v34];
        v37[0] = v33;
        double v32 = [(HUCameraView *)self errorView];
        v31 = [v32 centerYAnchor];
        double v30 = [(HUCameraView *)self centerYAnchor];
        double v28 = [v31 constraintEqualToAnchor:v30];
        v37[1] = v28;
        double v27 = [(HUCameraView *)self errorView];
        double v26 = [v27 widthAnchor];
        double v15 = [(HUCameraView *)self widthAnchor];
        double v16 = [v26 constraintEqualToAnchor:v15];
        v37[2] = v16;
        double v17 = [(HUCameraView *)self errorView];
        double v18 = [v17 heightAnchor];
        double v19 = [(HUCameraView *)self heightAnchor];
        double v20 = [v18 constraintEqualToAnchor:v19];
        v37[3] = v20;
        double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
        [v29 activateConstraints:v21];
      }
    }
    double v22 = [(HUCameraErrorContent *)v7 titleText];
    double v23 = [(HUCameraView *)self errorView];
    [v23 setTitleText:v22];

    double v24 = [(HUCameraErrorContent *)v7 descriptionText];
    double v25 = [(HUCameraView *)self errorView];
    [v25 setDescriptionText:v24];

    [(HUCameraView *)self _updateErrorAndActivityIndicatorVisibilityAnimated:v4];
  }
}

- (HUCameraErrorViewable)errorView
{
  return self->_errorView;
}

- (void)setCameraSource:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(HUCameraView *)self cameraView];
  id v8 = [v7 cameraSource];

  if (v8 != v6)
  {
    double v9 = [(HUCameraView *)self cameraView];
    [v9 setCameraSource:v6];

    [v6 aspectRatio];
    -[HUCameraView setCameraContentMode:](self, "setCameraContentMode:", -[HUCameraView contentModeForAspectRatio:](self, "contentModeForAspectRatio:"));
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __41__HUCameraView_setCameraSource_animated___block_invoke;
    double v17 = &unk_1E63850E0;
    double v18 = self;
    id v19 = v6;
    double v10 = _Block_copy(&v14);
    double v11 = v10;
    if (v4)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F39D18], "animation", v14, v15, v16, v17, v18);
      [v12 setType:*MEMORY[0x1E4F3A5B8]];
      [v12 setDuration:0.5];
      double v13 = [(HUCameraView *)self cameraView];
      [v13 addAnimation:v12 forKey:@"cameraSourceTransition"];

      [MEMORY[0x1E4F42FF0] animateWithDuration:v11 animations:0.5];
    }
    else
    {
      (*((void (**)(void *))v10 + 2))(v10);
    }
    [(HUCameraView *)self _updateBadgeView];
    [(HUCameraView *)self _updateErrorAndActivityIndicatorVisibilityAnimated:v4];
    [(HUCameraView *)self setNeedsUpdateConstraints];
    [(HUCameraView *)self setNeedsLayout];
    [(HUCameraView *)self _updateMaskedCameraCorners];
  }
}

- (HMCameraSource)cameraSource
{
  v2 = [(HUCameraView *)self cameraView];
  double v3 = [v2 cameraSource];

  return (HMCameraSource *)v3;
}

- (void)_updateErrorAndActivityIndicatorVisibilityAnimated:(BOOL)a3
{
  BOOL v4 = a3;
  if ([MEMORY[0x1E4F69758] shouldSuppressAllErrorsForDemo]) {
    return;
  }
  id v6 = [(HUCameraView *)self errorContent];
  if (!v6 && ![(HUCameraView *)self showActivityIndicator])
  {
    id v6 = 0;
    goto LABEL_8;
  }
  if ([(HUCameraView *)self hideCameraContentWhenDisplayingErrors])
  {
LABEL_8:
    LOBYTE(v3) = 0;
    goto LABEL_9;
  }
  double v7 = [(HUCameraView *)self cameraSource];
  if (v7)
  {
  }
  else
  {
    double v3 = (void *)[MEMORY[0x1E4F69758] isAMac];

    if (!v3) {
      goto LABEL_13;
    }
  }
  id v8 = [(HUCameraView *)self cameraDimmingView];

  if (v8)
  {
    LOBYTE(v3) = 1;
    goto LABEL_13;
  }
  if (+[HUGraphicsUtilities shouldReduceVisualEffects]
    || [MEMORY[0x1E4F69758] isAMac])
  {
    id v11 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(HUCameraView *)self bounds];
    v12 = objc_msgSend(v11, "initWithFrame:");
    [(HUCameraView *)self setCameraDimmingView:v12];
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F43028]);
    v12 = [MEMORY[0x1E4F427D8] effectWithStyle:1102];
    double v3 = (void *)[v13 initWithEffect:v12];
    [(HUCameraView *)self setCameraDimmingView:v3];
  }
  int v14 = [MEMORY[0x1E4F69758] isAMac];
  if (v14)
  {
    double v3 = [MEMORY[0x1E4F428B8] darkGrayColor];
    [v3 colorWithAlphaComponent:0.5];
  }
  else
  {
    [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.5];
  uint64_t v15 = };
  double v16 = [(HUCameraView *)self cameraDimmingView];
  [v16 setBackgroundColor:v15];

  if (v14)
  {

    uint64_t v15 = v3;
  }

  [(HUCameraView *)self bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v25 = [(HUCameraView *)self cameraDimmingView];
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  double v26 = [(HUCameraView *)self cameraDimmingView];
  [v26 setAutoresizingMask:18];

  double v27 = [(HUCameraView *)self cameraDimmingView];
  [v27 setAlpha:0.0];

  id v6 = [(HUCameraView *)self cameraOverlayView];
  double v3 = [(HUCameraView *)self cameraDimmingView];
  [v6 insertSubview:v3 atIndex:0];

  LOBYTE(v3) = 1;
LABEL_9:

LABEL_13:
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __67__HUCameraView__updateErrorAndActivityIndicatorVisibilityAnimated___block_invoke;
  v28[3] = &unk_1E6385A70;
  v28[4] = self;
  char v29 = (char)v3;
  double v9 = _Block_copy(v28);
  double v10 = v9;
  if (v4) {
    [MEMORY[0x1E4F42FF0] animateWithDuration:v9 animations:0.3];
  }
  else {
    (*((void (**)(void *))v9 + 2))(v9);
  }
}

void __67__HUCameraView__updateErrorAndActivityIndicatorVisibilityAnimated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) errorContent];
  double v3 = 1.0;
  if (v2)
  {
    double v3 = 0.0;
    if (([*(id *)(a1 + 32) hideCameraContentWhenDisplayingErrors] & 1) == 0) {
      double v3 = (double)([MEMORY[0x1E4F69758] isAMac] ^ 1);
    }
  }
  BOOL v4 = [*(id *)(a1 + 32) cameraContainerView];
  [v4 setAlpha:v3];

  LOBYTE(v5) = *(unsigned char *)(a1 + 40);
  double v6 = (double)v5;
  double v7 = [*(id *)(a1 + 32) cameraDimmingView];
  [v7 setAlpha:v6];

  id v8 = [*(id *)(a1 + 32) errorContent];
  if (v8) {
    double v9 = 1.0;
  }
  else {
    double v9 = 0.0;
  }
  double v10 = [*(id *)(a1 + 32) errorView];
  [v10 setAlpha:v9];

  double v11 = (double)[*(id *)(a1 + 32) showActivityIndicator];
  id v12 = [*(id *)(a1 + 32) activityIndicatorView];
  [v12 setAlpha:v11];
}

- (HUCameraErrorContent)errorContent
{
  return self->_errorContent;
}

- (BOOL)hideCameraContentWhenDisplayingErrors
{
  return self->_hideCameraContentWhenDisplayingErrors;
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (UIView)cameraDimmingView
{
  return self->_cameraDimmingView;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)_updateMaskedCameraCorners
{
  unint64_t v3 = [(HUCameraView *)self maskedCameraCorners];
  BOOL v4 = [(HUCameraView *)self cameraContainerView];
  [v4 setMaskedCorners:v3];

  unint64_t v5 = [(HUCameraView *)self maskedCameraCorners] & 0xF;
  double v6 = [(HUCameraView *)self backgroundView];
  double v7 = [v6 layer];
  [v7 setMaskedCorners:v5];

  unint64_t v8 = [(HUCameraView *)self maskedCameraCorners] & 0xF;
  double v9 = [(HUCameraView *)self cameraOverlayView];
  double v10 = [v9 layer];
  [v10 setMaskedCorners:v8];

  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    unint64_t v11 = [(HUCameraView *)self maskedCameraCorners] & 0xF;
    id v13 = [(HUCameraView *)self demoSnapshotImageView];
    id v12 = [v13 layer];
    [v12 setMaskedCorners:v11];
  }
}

- (unint64_t)maskedCameraCorners
{
  return self->_maskedCameraCorners;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HUCameraView *)self backgroundView];
  if (!v4 || v5)
  {
  }
  else
  {
    double v6 = [MEMORY[0x1E4F428B8] clearColor];
    char v7 = [v4 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __35__HUCameraView_setBackgroundColor___block_invoke;
      v9[3] = &unk_1E6386018;
      v9[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v9];
    }
  }
  unint64_t v8 = [(HUCameraView *)self backgroundView];
  [v8 setBackgroundColor:v4];
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setErrorView:(id)a3
{
}

- (void)updateConstraints
{
  v60[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HUCameraView *)self staticConstraints];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v5 = [(HUCameraView *)self cameraContainerView];
    double v6 = [v5 centerXAnchor];
    char v7 = [(HUCameraView *)self centerXAnchor];
    unint64_t v8 = [v6 constraintEqualToAnchor:v7];
    [v4 addObject:v8];

    double v9 = [(HUCameraView *)self cameraContainerView];
    double v10 = [v9 centerYAnchor];
    unint64_t v11 = [(HUCameraView *)self centerYAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11];
    [v4 addObject:v12];

    id v13 = [(HUCameraView *)self cameraContainerView];
    int v14 = [v13 widthAnchor];
    uint64_t v15 = [(HUCameraView *)self widthAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15];
    [v4 addObject:v16];

    double v17 = [(HUCameraView *)self cameraContainerView];
    double v18 = [v17 heightAnchor];
    double v19 = [(HUCameraView *)self heightAnchor];
    double v20 = [v18 constraintEqualToAnchor:v19];
    [v4 addObject:v20];

    double v21 = [(HUCameraView *)self cameraOverlayView];
    double v22 = [v21 widthAnchor];
    double v23 = [(HUCameraView *)self widthAnchor];
    double v24 = [v22 constraintEqualToAnchor:v23];
    [v4 addObject:v24];

    double v25 = [(HUCameraView *)self cameraOverlayView];
    double v26 = [v25 heightAnchor];
    double v27 = [(HUCameraView *)self heightAnchor];
    double v28 = [v26 constraintEqualToAnchor:v27];
    [v4 addObject:v28];

    char v29 = [(HUCameraView *)self cameraOverlayView];
    double v30 = [v29 centerXAnchor];
    v31 = [(HUCameraView *)self centerXAnchor];
    double v32 = [v30 constraintEqualToAnchor:v31];
    [v4 addObject:v32];

    double v33 = [(HUCameraView *)self cameraOverlayView];
    v34 = [v33 centerYAnchor];
    v35 = [(HUCameraView *)self centerYAnchor];
    objc_super v36 = [v34 constraintEqualToAnchor:v35];
    [v4 addObject:v36];

    [(HUCameraView *)self setStaticConstraints:v4];
    v37 = (void *)MEMORY[0x1E4F28DC8];
    v38 = [(HUCameraView *)self staticConstraints];
    [v37 activateConstraints:v38];
  }
  uint64_t v39 = [(HUCameraView *)self badgeView];
  if (v39)
  {
    v40 = (void *)v39;
    v41 = [(HUCameraView *)self badgeBottomConstraint];
    if (v41)
    {
    }
    else
    {
      v42 = [(HUCameraView *)self badgeTrailingConstraint];

      if (!v42)
      {
        v43 = [(HUCameraView *)self badgeView];
        v44 = [v43 bottomAnchor];
        v45 = [(HUCameraView *)self badgeBottomAnchor];
        v46 = v45;
        if (!v45)
        {
          v46 = [(HUCameraView *)self bottomAnchor];
        }
        [(HUCameraView *)self badgeOffset];
        v48 = [v44 constraintEqualToAnchor:v46 constant:-v47];
        [(HUCameraView *)self setBadgeBottomConstraint:v48];

        if (!v45) {
        v49 = [(HUCameraView *)self badgeView];
        }
        v50 = [v49 trailingAnchor];
        v51 = [(HUCameraView *)self safeAreaLayoutGuide];
        v52 = [v51 trailingAnchor];
        [(HUCameraView *)self badgeOffset];
        v54 = [v50 constraintEqualToAnchor:v52 constant:-v53];
        [(HUCameraView *)self setBadgeTrailingConstraint:v54];

        v55 = (void *)MEMORY[0x1E4F28DC8];
        v56 = [(HUCameraView *)self badgeBottomConstraint];
        v60[0] = v56;
        v57 = [(HUCameraView *)self badgeTrailingConstraint];
        v60[1] = v57;
        v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
        [v55 activateConstraints:v58];
      }
    }
  }
  v59.receiver = self;
  v59.super_class = (Class)HUCameraView;
  [(HUCameraView *)&v59 updateConstraints];
}

- (UIView)cameraOverlayView
{
  return self->_cameraOverlayView;
}

- (HMCameraView)cameraView
{
  v2 = [(HUCameraView *)self cameraContainerView];
  unint64_t v3 = [v2 contentView];

  return (HMCameraView *)v3;
}

- (HURemoteContextHostingView)cameraContainerView
{
  return self->_cameraContainerView;
}

- (NSArray)staticConstraints
{
  return self->_staticConstraints;
}

- (void)setStaticConstraints:(id)a3
{
}

- (HUCameraBadgeView)badgeView
{
  return self->_badgeView;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)dealloc
{
  unint64_t v3 = [(HUCameraView *)self snapshotAgeUpdateTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)HUCameraView;
  [(HUCameraView *)&v4 dealloc];
}

- (double)_continuousCornerRadius
{
  v2 = [(HUCameraView *)self cameraContainerView];
  [v2 _continuousCornerRadius];
  double v4 = v3;

  return v4;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    unint64_t v5 = [(HUCameraView *)self demoSnapshotImageView];
    [v5 _setContinuousCornerRadius:a3];
  }
  double v6 = [(HUCameraView *)self cameraContainerView];
  [v6 _setContinuousCornerRadius:a3];

  char v7 = [(HUCameraView *)self backgroundView];
  [v7 _setContinuousCornerRadius:a3];

  unint64_t v8 = [(HUCameraView *)self cameraOverlayView];
  [v8 _setContinuousCornerRadius:a3];

  [(HUCameraView *)self _updateMaskedCameraCorners];
}

- (id)backgroundColor
{
  v2 = [(HUCameraView *)self backgroundView];
  double v3 = [v2 backgroundColor];

  return v3;
}

uint64_t __35__HUCameraView_setBackgroundColor___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  [*(id *)(a1 + 32) setBackgroundView:v2];

  [*(id *)(a1 + 32) bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [*(id *)(a1 + 32) backgroundView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  id v12 = [*(id *)(a1 + 32) backgroundView];
  [v12 setAutoresizingMask:18];

  [*(id *)(a1 + 32) _continuousCornerRadius];
  double v14 = v13;
  uint64_t v15 = [*(id *)(a1 + 32) backgroundView];
  [v15 _setContinuousCornerRadius:v14];

  double v16 = *(void **)(a1 + 32);
  double v17 = [v16 backgroundView];
  [v16 insertSubview:v17 atIndex:0];

  double v18 = *(void **)(a1 + 32);

  return [v18 _updateMaskedCameraCorners];
}

- (void)setCameraContentMode:(int64_t)a3
{
  double v5 = [(HUCameraView *)self cameraView];
  uint64_t v6 = [v5 contentMode];

  if (v6 != a3)
  {
    double v7 = [(HUCameraView *)self cameraView];
    [v7 setContentMode:a3];

    [(HUCameraView *)self setNeedsUpdateConstraints];
  }
}

- (void)setCameraSource:(id)a3 withDemoSnapshotURL:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v18 = a3;
  id v8 = a4;
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    double v9 = [(HUCameraView *)self demoSnapshotImageView];

    if (!v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F42A80]);
      unint64_t v11 = [v8 path];
      id v12 = (void *)[v10 initWithContentsOfFile:v11];

      double v13 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v12];
      [(HUCameraView *)self setDemoSnapshotImageView:v13];
      double v14 = [MEMORY[0x1E4F428B8] systemBlackColor];
      [v13 setBackgroundColor:v14];

      [v13 setClipsToBounds:1];
      [v13 setContentMode:2];
      [v13 setAutoresizingMask:18];
      [(HUCameraView *)self bounds];
      objc_msgSend(v13, "setFrame:");
      [(HUCameraView *)self addSubview:v13];
      [(HUCameraView *)self _continuousCornerRadius];
      double v16 = v15;
      double v17 = [(HUCameraView *)self demoSnapshotImageView];
      [v17 _setContinuousCornerRadius:v16];
    }
  }
  [(HUCameraView *)self setCameraSource:v18 animated:v5];
}

- (void)setCameraSource:(id)a3
{
}

- (int64_t)contentModeForAspectRatio:(double)a3
{
  if (((a3 < 1.0) & [(HUCameraView *)self shouldRespectAspectRatio]) != 0) {
    return 1;
  }
  else {
    return 2;
  }
}

void __41__HUCameraView_setCameraSource_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  if (*(void *)(v2 + 8)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = [v1 cameraContainerView];
  [v4 setAlpha:v3];
}

- (void)setErrorContent:(id)a3
{
}

- (void)setShowActivityIndicator:(BOOL)a3
{
}

- (void)setShowActivityIndicator:(BOOL)a3 animated:(BOOL)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  if (self->_showActivityIndicator != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    if (([MEMORY[0x1E4F69758] shouldSuppressAllErrorsForDemo] & 1) == 0)
    {
      self->_showActivityIndicator = v5;
      double v7 = [(HUCameraView *)self activityIndicatorView];
      id v8 = v7;
      if (v5)
      {

        if (!v8)
        {
          double v9 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:101];
          [(HUCameraView *)self setActivityIndicatorView:v9];

          id v10 = [(HUCameraView *)self activityIndicatorView];
          [v10 setAlpha:0.0];

          unint64_t v11 = [(HUCameraView *)self activityIndicatorView];
          [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

          id v12 = [(HUCameraView *)self cameraOverlayView];
          double v13 = [(HUCameraView *)self activityIndicatorView];
          [v12 addSubview:v13];

          double v23 = (void *)MEMORY[0x1E4F28DC8];
          double v24 = [(HUCameraView *)self activityIndicatorView];
          double v14 = [v24 centerXAnchor];
          double v15 = [(HUCameraView *)self centerXAnchor];
          double v16 = [v14 constraintEqualToAnchor:v15];
          v25[0] = v16;
          double v17 = [(HUCameraView *)self activityIndicatorView];
          id v18 = [v17 centerYAnchor];
          double v19 = [(HUCameraView *)self centerYAnchor];
          double v20 = [v18 constraintEqualToAnchor:v19];
          v25[1] = v20;
          double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
          [v23 activateConstraints:v21];
        }
        double v22 = [(HUCameraView *)self activityIndicatorView];
        [v22 startAnimating];
      }
      else
      {
        [v7 stopAnimating];
      }
      [(HUCameraView *)self _updateErrorAndActivityIndicatorVisibilityAnimated:v4];
    }
  }
}

- (void)setBadgeHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUCameraView *)self badgeView];
  [v4 setHidden:v3];
}

- (BOOL)isBadgeHidden
{
  BOOL v3 = [(HUCameraView *)self badgeView];
  if (v3)
  {
    id v4 = [(HUCameraView *)self badgeView];
    char v5 = [v4 isHidden];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (void)setBadgeOffset:(UIOffset)a3
{
  p_badgeOffset = &self->_badgeOffset;
  if (a3.horizontal != self->_badgeOffset.horizontal || a3.vertical != self->_badgeOffset.vertical)
  {
    p_badgeOffset->horizontal = a3.horizontal;
    self->_badgeOffset.vertical = a3.vertical;
    CGFloat v6 = -a3.vertical;
    double v7 = [(HUCameraView *)self badgeBottomConstraint];
    [v7 setConstant:v6];

    CGFloat v8 = -p_badgeOffset->horizontal;
    id v9 = [(HUCameraView *)self badgeTrailingConstraint];
    [v9 setConstant:v8];
  }
}

- (void)setBadgeBottomAnchor:(id)a3
{
  char v5 = (NSLayoutYAxisAnchor *)a3;
  if (self->_badgeBottomAnchor != v5)
  {
    CGFloat v8 = v5;
    objc_storeStrong((id *)&self->_badgeBottomAnchor, a3);
    CGFloat v6 = [(HUCameraView *)self badgeBottomConstraint];
    [v6 setActive:0];

    double v7 = [(HUCameraView *)self badgeTrailingConstraint];
    [v7 setActive:0];

    [(HUCameraView *)self setBadgeBottomConstraint:0];
    [(HUCameraView *)self setBadgeTrailingConstraint:0];
    [(HUCameraView *)self setNeedsUpdateConstraints];
    char v5 = v8;
  }
}

- (CGRect)derivedCameraContentFrame
{
  BOOL v3 = [(HUCameraView *)self cameraView];
  id v4 = [v3 cameraSource];

  if (v4)
  {
    [v4 aspectRatio];
    double v6 = v5;
    [(HUCameraView *)self bounds];
    double v8 = v7 / v6;
    [(HUCameraView *)self bounds];
    double v10 = (v9 - v8) * 0.5;
    [(HUCameraView *)self bounds];
    double v12 = v11;
    double v13 = 0.0;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v14 = v13;
  double v15 = v10;
  double v16 = v12;
  double v17 = v8;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)cameraContentSnapshot
{
  BOOL v3 = [(HUCameraView *)self cameraView];
  id v4 = [v3 snapshotViewAfterScreenUpdates:0];

  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(HUCameraView *)self cameraView];
  -[HUCameraView convertRect:fromView:](self, "convertRect:fromView:", v13, v6, v8, v10, v12);
  objc_msgSend(v4, "setFrame:");

  return v4;
}

- (UIView)cameraOverlaySnapshot
{
  BOOL v3 = [(HUCameraView *)self errorContent];

  if (v3)
  {
    id v4 = [(HUCameraView *)self cameraOverlayView];
    BOOL v3 = [v4 snapshotViewAfterScreenUpdates:0];

    [v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = [(HUCameraView *)self cameraOverlayView];
    -[HUCameraView convertRect:fromView:](self, "convertRect:fromView:", v13, v6, v8, v10, v12);
    objc_msgSend(v3, "setFrame:");
  }

  return (UIView *)v3;
}

- (void)_updateBadgeView
{
}

- (void)_updateBadgeViewReschedulingTimerIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(HUCameraView *)self badgeView];

  if (!v5)
  {
LABEL_9:
    double v15 = [(HUCameraView *)self snapshotAgeUpdateTimer];
    [v15 invalidate];

    [(HUCameraView *)self setSnapshotAgeUpdateTimer:0];
    return;
  }
  double v6 = [(HUCameraView *)self cameraView];
  uint64_t v7 = [v6 cameraSource];
  if (!v7)
  {

    goto LABEL_7;
  }
  double v8 = (void *)v7;
  BOOL v9 = [(HUCameraView *)self isBadgeHidden];

  if (v9)
  {
LABEL_7:
    double v13 = [(HUCameraView *)self badgeView];
    [v13 setHidden:1];
    goto LABEL_8;
  }
  double v10 = [(HUCameraView *)self cameraView];
  double v11 = [v10 cameraSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v13 = _HULocalizedStringWithDefaultValue(@"HUCameraLive", @"HUCameraLive", 1);
    double v14 = [(HUCameraView *)self badgeView];
    [v14 setLabelText:v13];

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v16 = objc_opt_class();
  double v17 = [(HUCameraView *)self cameraView];
  id v18 = [v17 cameraSource];
  if (v18)
  {
    if (objc_opt_isKindOfClass()) {
      double v19 = v18;
    }
    else {
      double v19 = 0;
    }
    id v26 = v18;
    if (v19) {
      goto LABEL_19;
    }
    double v20 = [MEMORY[0x1E4F28B00] currentHandler];
    double v21 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v20 handleFailureInFunction:v21, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v16, objc_opt_class() file lineNumber description];
  }
  id v26 = 0;
LABEL_19:

  double v22 = objc_msgSend(v26, "hf_localizedAge");
  double v23 = [(HUCameraView *)self badgeView];
  [v23 setLabelText:v22];

  double v24 = [(HUCameraView *)self snapshotAgeUpdateTimer];

  if (!v24 || v3)
  {
    double v25 = [v26 captureDate];
    [(HUCameraView *)self _scheduleNextSnapshotAgeUpdateForCaptureDate:v25];
  }
}

- (void)_scheduleNextSnapshotAgeUpdateForCaptureDate:(id)a3
{
  id v4 = a3;
  double v5 = [(HUCameraView *)self snapshotAgeUpdateTimer];
  [v5 invalidate];

  objc_initWeak(&location, self);
  double v6 = (void *)MEMORY[0x1E4F7A0C8];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __61__HUCameraView__scheduleNextSnapshotAgeUpdateForCaptureDate___block_invoke;
  double v11 = &unk_1E638E8D8;
  objc_copyWeak(&v12, &location);
  uint64_t v7 = [v6 scheduledTimerWithReferenceDate:v4 minimumUnit:128 block:&v8];
  -[HUCameraView setSnapshotAgeUpdateTimer:](self, "setSnapshotAgeUpdateTimer:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __61__HUCameraView__scheduleNextSnapshotAgeUpdateForCaptureDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateBadgeViewReschedulingTimerIfNecessary:0];
}

- (UIOffset)badgeOffset
{
  double horizontal = self->_badgeOffset.horizontal;
  double vertical = self->_badgeOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (NSLayoutYAxisAnchor)badgeBottomAnchor
{
  return self->_badgeBottomAnchor;
}

- (UIImageView)demoSnapshotImageView
{
  return self->_demoSnapshotImageView;
}

- (void)setDemoSnapshotImageView:(id)a3
{
}

- (BOOL)shouldRespectAspectRatio
{
  return self->_shouldRespectAspectRatio;
}

- (void)setShouldRespectAspectRatio:(BOOL)a3
{
  self->_shouldRespectAspectRatio = a3;
}

- (void)setCameraDimmingView:(id)a3
{
}

- (void)setBackgroundView:(id)a3
{
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (NADecayingTimer)snapshotAgeUpdateTimer
{
  return self->_snapshotAgeUpdateTimer;
}

- (void)setSnapshotAgeUpdateTimer:(id)a3
{
}

- (NSLayoutConstraint)cameraAspectRatioConstraint
{
  return self->_cameraAspectRatioConstraint;
}

- (void)setCameraAspectRatioConstraint:(id)a3
{
}

- (NSLayoutConstraint)badgeBottomConstraint
{
  return self->_badgeBottomConstraint;
}

- (void)setBadgeBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)badgeTrailingConstraint
{
  return self->_badgeTrailingConstraint;
}

- (void)setBadgeTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_badgeBottomConstraint, 0);
  objc_storeStrong((id *)&self->_cameraAspectRatioConstraint, 0);
  objc_storeStrong((id *)&self->_staticConstraints, 0);
  objc_storeStrong((id *)&self->_snapshotAgeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_cameraDimmingView, 0);
  objc_storeStrong((id *)&self->_cameraOverlayView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_cameraContainerView, 0);
  objc_storeStrong((id *)&self->_demoSnapshotImageView, 0);
  objc_storeStrong((id *)&self->_overrideErrorView, 0);
  objc_storeStrong((id *)&self->_errorContent, 0);

  objc_storeStrong((id *)&self->_badgeBottomAnchor, 0);
}

@end