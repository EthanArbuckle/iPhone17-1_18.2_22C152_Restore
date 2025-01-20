@interface BKUIPearlEnrollView
- (BKUIPearlCrossHairsView)crossHairs;
- (BKUIPearlEnrollView)initWithFrame:(CGRect)a3 videoCaptureSession:(id)a4 inSheet:(BOOL)a5 positioningGuideView:(id)a6 squareNeedsPositionLayout:(BOOL)a7;
- (BKUIPearlEnrollView)initWithFrame:(CGRect)a3 videoCaptureSession:(id)a4 inSheet:(BOOL)a5 squareNeedsPositionLayout:(BOOL)a6;
- (BKUIPearlEnrollView)initWithVideoCaptureSession:(id)a3 inSheet:(BOOL)a4 squareNeedsPositionLayout:(BOOL)a5;
- (BKUIPearlEnrollViewDelegate)delegate;
- (BKUIPearlEnrollViewStateTransitionDelegate)transitionDelegate;
- (BKUIPearlMovieLoopView)tutorialMovieView;
- (BKUIPearlPillContainerView)pillContainer;
- (BOOL)_animateCircleMaskWithPositioningGuide;
- (BOOL)active;
- (BOOL)debugOverlayVisible;
- (BOOL)expectsRunningVideoCaptureSession:(id)a3;
- (BOOL)inSheet;
- (BOOL)isTransitioningToState;
- (BOOL)needsMaskedNeedsPositionStyleEnrollment;
- (BOOL)squareNeedsPositionLayout;
- (CATransform3D)_needsPositioningPreviewTransform;
- (CATransform3D)_scanningAndPartialCapturePreviewTransform;
- (CGPoint)portalCenter;
- (CGPoint)portalOffset;
- (CGSize)tutorialMovieSize;
- (NSArray)portalLayoutGuideConstraints;
- (NSLayoutConstraint)successAnimationViewCenterYConstraint;
- (OBAnimationController)animationController;
- (OBAnimationView)animationView;
- (UILayoutGuide)portalLayoutGuide;
- (UITraitChangeRegistration)traitChangeRegistration;
- (double)_nonOccludingCircleMaskRadius;
- (double)_previewZoomLevel;
- (double)_progressiveBlurAmountForPitch:(double)a3;
- (double)percentOfPillsCompleted;
- (double)pillRingRadius;
- (double)portalRadius;
- (double)tutorialRingRadius;
- (id)_enrollMaskPathWithRadius:(double)a3;
- (id)_maskPathWithRadius:(double)a3 inFrame:(CGRect)a4;
- (id)previewLayer;
- (int)state;
- (void)_animateToEntryAnimation;
- (void)_animateToFinishedWithCompletion:(id)a3;
- (void)_animateToFirstScanCompleteWithCompletion:(id)a3;
- (void)_animateToFirstScanWithCompletion:(id)a3;
- (void)_animateToNeedsCenterBinWithCompletion:(id)a3;
- (void)_animateToNeedsPositioningFromState:(int)a3 withCompletion:(id)a4;
- (void)_animateToPartialCaptureWithCompletion:(id)a3;
- (void)_animateToScanCompleteWithCompletion:(id)a3;
- (void)_animateToScanningStateWithCompletion:(id)a3;
- (void)_animateToState:(int)a3 fromState:(int)a4 completion:(id)a5;
- (void)_animateToTutorialWithCompletion:(id)a3;
- (void)_cleanupUIState;
- (void)_endAndCleanupEnrollSessionIfNeeded;
- (void)_nudgeIfNecessary;
- (void)_recordDataFrameWithFaceState:(id)a3;
- (void)_runTutorialLoopWithDuration:(double)a3 delay:(double)a4 loopDelay:(double)a5;
- (void)_setRaiseLowerGuidanceLabelState:(unint64_t)a3;
- (void)_setState:(int)a3 completion:(id)a4;
- (void)_startNudgeTimer;
- (void)_stopNudgeTimer;
- (void)_updateCorrectionEstimates:(double)a3 yaw:(double)a4;
- (void)_updateDebugOverlay;
- (void)_updateRaiseLowerGuidanceLabelIfNeededForPitch:(double)a3;
- (void)_updateToNeedsPositionWithoutAnimationWithCompletion:(id)a3;
- (void)dealloc;
- (void)didDisappear;
- (void)layoutSubviews;
- (void)postEnrollDeActivate;
- (void)preEnrollActivate;
- (void)setActive:(BOOL)a3;
- (void)setAnimationController:(id)a3;
- (void)setAnimationView:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCameraBlurAmount:(double)a3 useShade:(BOOL)a4 duration:(double)a5 completion:(id)a6;
- (void)setCameraBlurred:(BOOL)a3;
- (void)setCrossHairs:(id)a3;
- (void)setCrosshairsHidden:(BOOL)a3;
- (void)setDebugOverlayVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFailed;
- (void)setInSheet:(BOOL)a3;
- (void)setMovieViewHidden:(BOOL)a3;
- (void)setNudgesPaused:(BOOL)a3;
- (void)setPillContainer:(id)a3;
- (void)setPillsHidden:(BOOL)a3;
- (void)setPitch:(double)a3 yaw:(double)a4;
- (void)setPortalLayoutGuideConstraints:(id)a3;
- (void)setSquareNeedsPositionLayout:(BOOL)a3;
- (void)setState:(int)a3;
- (void)setState:(int)a3 completion:(id)a4;
- (void)setSuccessAnimationViewCenterYConstraint:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)setTransitionDelegate:(id)a3;
- (void)setTransitioningToState:(BOOL)a3;
- (void)setTutorialMovieView:(id)a3;
- (void)setupAnimationViewWithSuperView:(id)a3;
- (void)startCapture;
- (void)updatePortalLayoutGuide;
- (void)updateWithFaceState:(id)a3;
- (void)updateWithProgress:(id)a3;
@end

@implementation BKUIPearlEnrollView

- (BKUIPearlEnrollView)initWithVideoCaptureSession:(id)a3 inSheet:(BOOL)a4 squareNeedsPositionLayout:(BOOL)a5
{
  return -[BKUIPearlEnrollView initWithFrame:videoCaptureSession:inSheet:squareNeedsPositionLayout:](self, "initWithFrame:videoCaptureSession:inSheet:squareNeedsPositionLayout:", a3, a4, a5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (BKUIPearlEnrollView)initWithFrame:(CGRect)a3 videoCaptureSession:(id)a4 inSheet:(BOOL)a5 squareNeedsPositionLayout:(BOOL)a6
{
  return -[BKUIPearlEnrollView initWithFrame:videoCaptureSession:inSheet:positioningGuideView:squareNeedsPositionLayout:](self, "initWithFrame:videoCaptureSession:inSheet:positioningGuideView:squareNeedsPositionLayout:", a4, a5, 0, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BKUIPearlEnrollView)initWithFrame:(CGRect)a3 videoCaptureSession:(id)a4 inSheet:(BOOL)a5 positioningGuideView:(id)a6 squareNeedsPositionLayout:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v77[2] = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v71 = a6;
  v76.receiver = self;
  v76.super_class = (Class)BKUIPearlEnrollView;
  v16 = -[BKUIPearlEnrollView initWithFrame:](&v76, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    v16->_inSheet = a5;
    if (v15) {
      v18 = (BKUIPearlVideoCaptureSession *)v15;
    }
    else {
      v18 = objc_alloc_init(BKUIPearlVideoCaptureSession);
    }
    videoCaptureSession = v17->_videoCaptureSession;
    v17->_videoCaptureSession = v18;

    [(BKUIPearlVideoCaptureSession *)v17->_videoCaptureSession setDelegate:v17];
    v17->_squareNeedsPositionLayout = v7;
    v17->_didStartCapture = 0;
    v17->_activated = 0;
    v20 = [(BKUIPearlEnrollView *)v17 layer];
    [v20 setMasksToBounds:1];

    [(BKUIPearlEnrollView *)v17 setClipsToBounds:1];
    v17->_pitchCorrectionSamples = 0.0;
    v17->_pitchCorrection = 0.0;
    v17->_correctionSamplesCount = 0;
    v17->_pitchMin = 1.79769313e308;
    v17->_pitchMadouble x = -1.79769313e308;
    uint64_t v21 = objc_opt_new();
    cameraShadeView = v17->_cameraShadeView;
    v17->_cameraShadeView = (UIView *)v21;

    [(UIView *)v17->_cameraShadeView setAlpha:0.0];
    v23 = v17->_cameraShadeView;
    v24 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.5];
    [(UIView *)v23 setBackgroundColor:v24];

    [(BKUIPearlEnrollView *)v17 addSubview:v17->_cameraShadeView];
    uint64_t v25 = objc_opt_new();
    circleMaskLayer = v17->_circleMaskLayer;
    v17->_circleMaskLayer = (CAShapeLayer *)v25;

    uint64_t v27 = *MEMORY[0x1E4F39FB8];
    [(CAShapeLayer *)v17->_circleMaskLayer setFillRule:*MEMORY[0x1E4F39FB8]];
    uint64_t v28 = objc_opt_new();
    circleMaskView = v17->_circleMaskView;
    v17->_circleMaskView = (UIView *)v28;

    v30 = [(UIView *)v17->_circleMaskView layer];
    [v30 setMask:v17->_circleMaskLayer];

    [(UIView *)v17->_circleMaskView setClipsToBounds:1];
    [(UIView *)v17->_circleMaskView setAlpha:0.0];
    [(BKUIPearlEnrollView *)v17 addSubview:v17->_circleMaskView];
    uint64_t v31 = objc_opt_new();
    roundedRectMaskLayer = v17->_roundedRectMaskLayer;
    v17->_roundedRectMaskLayer = (CAShapeLayer *)v31;

    [(CAShapeLayer *)v17->_roundedRectMaskLayer setFillRule:v27];
    uint64_t v33 = objc_opt_new();
    roundedRectMaskView = v17->_roundedRectMaskView;
    v17->_roundedRectMaskView = (UIView *)v33;

    v35 = [(UIView *)v17->_roundedRectMaskView layer];
    [v35 setMask:v17->_roundedRectMaskLayer];

    [(UIView *)v17->_roundedRectMaskView setClipsToBounds:1];
    [(UIView *)v17->_roundedRectMaskView setAlpha:0.0];
    [(BKUIPearlEnrollView *)v17 addSubview:v17->_roundedRectMaskView];
    if (v71)
    {
      objc_storeStrong((id *)&v17->_positioningGuide, a6);
      double v36 = *MEMORY[0x1E4F1DB28];
      double v37 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      v40 = [BKUIPearlPositioningGuideView alloc];
      double v36 = *MEMORY[0x1E4F1DB28];
      double v37 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      uint64_t v41 = -[BKUIPearlPositioningGuideView initWithFrame:](v40, "initWithFrame:", *MEMORY[0x1E4F1DB28], v37, v38, v39);
      positioningGuide = v17->_positioningGuide;
      v17->_positioningGuide = (BKUIPearlPositioningGuideView *)v41;
    }
    [(BKUIPearlPositioningGuideView *)v17->_positioningGuide setInSheet:[(BKUIPearlEnrollView *)v17 inSheet]];
    [(BKUIPearlPositioningGuideView *)v17->_positioningGuide setAlpha:0.0];
    v43 = v17->_positioningGuide;
    [(BKUIPearlEnrollView *)v17 pillRingRadius];
    -[BKUIPearlPositioningGuideView setRingRadius:](v43, "setRingRadius:");
    [(BKUIPearlEnrollView *)v17 addSubview:v17->_positioningGuide];
    [(BKUIPearlPositioningGuideView *)v17->_positioningGuide setRoundedRectMaskLayer:v17->_roundedRectMaskLayer];
    v44 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    repositionPhoneLabel = v17->_repositionPhoneLabel;
    v17->_repositionPhoneLabel = v44;

    [(UILabel *)v17->_repositionPhoneLabel setAlpha:0.0];
    [(UILabel *)v17->_repositionPhoneLabel setTextAlignment:1];
    v46 = v17->_repositionPhoneLabel;
    v47 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UILabel *)v46 setTextColor:v47];

    [(UILabel *)v17->_repositionPhoneLabel setNumberOfLines:0];
    v48 = v17->_repositionPhoneLabel;
    v49 = [MEMORY[0x1E4F42A30] systemFontOfSize:20.0 weight:*MEMORY[0x1E4F43908]];
    [(UILabel *)v48 setFont:v49];

    v50 = [(UILabel *)v17->_repositionPhoneLabel layer];
    v51 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    [v50 setCompositingFilter:v51];

    [(BKUIPearlEnrollView *)v17 addSubview:v17->_repositionPhoneLabel];
    uint64_t v52 = objc_opt_new();
    pillContainer = v17->_pillContainer;
    v17->_pillContainer = (BKUIPearlPillContainerView *)v52;

    [(BKUIPearlPillContainerView *)v17->_pillContainer setSquareNeedsPositionLayout:v7];
    [(BKUIPearlPillContainerView *)v17->_pillContainer setAlpha:0.0];
    [(BKUIPearlEnrollView *)v17 addSubview:v17->_pillContainer];
    v54 = -[BKUIPearlCrossHairsView initWithFrame:]([BKUIPearlCrossHairsView alloc], "initWithFrame:", v36, v37, v38, v39);
    [(BKUIPearlEnrollView *)v17 setCrossHairs:v54];

    v55 = [(BKUIPearlEnrollView *)v17 crossHairs];
    [v55 setAlpha:0.0];

    v56 = [(BKUIPearlEnrollView *)v17 crossHairs];
    [(BKUIPearlEnrollView *)v17 addSubview:v56];

    v57 = [MEMORY[0x1E4F42948] currentDevice];
    LODWORD(v50) = objc_msgSend(v57, "bkui_IsInternalInstall");

    if (v50)
    {
      v58 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
      debugLabel = v17->_debugLabel;
      v17->_debugLabel = v58;

      v60 = v17->_debugLabel;
      v61 = [MEMORY[0x1E4F428B8] whiteColor];
      [(UILabel *)v60 setTextColor:v61];

      v62 = v17->_debugLabel;
      v63 = [MEMORY[0x1E4F42A30] systemFontOfSize:20.0];
      [(UILabel *)v62 setFont:v63];

      [(UILabel *)v17->_debugLabel setNumberOfLines:0];
      [(UILabel *)v17->_debugLabel setHidden:1];
      [(BKUIPearlEnrollView *)v17 addSubview:v17->_debugLabel];
    }
    v64 = [MEMORY[0x1E4F428B8] blackColor];
    [(BKUIPearlEnrollView *)v17 setBackgroundColor:v64];

    v65 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
    portalLayoutGuide = v17->_portalLayoutGuide;
    v17->_portalLayoutGuide = v65;

    [(BKUIPearlEnrollView *)v17 addLayoutGuide:v17->_portalLayoutGuide];
    v17->_transitioningToState = 0;
    objc_initWeak(&location, v17);
    v77[0] = objc_opt_class();
    v77[1] = objc_opt_class();
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __112__BKUIPearlEnrollView_initWithFrame_videoCaptureSession_inSheet_positioningGuideView_squareNeedsPositionLayout___block_invoke;
    v72[3] = &unk_1E6EA2E20;
    objc_copyWeak(&v74, &location);
    v68 = v17;
    v73 = v68;
    v69 = [(BKUIPearlEnrollView *)v68 registerForTraitChanges:v67 withHandler:v72];
    [(BKUIPearlEnrollView *)v68 setTraitChangeRegistration:v69];

    objc_destroyWeak(&v74);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __112__BKUIPearlEnrollView_initWithFrame_videoCaptureSession_inSheet_positioningGuideView_squareNeedsPositionLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1 && ![v15 horizontalSizeClass])
  {
    BOOL v7 = [WeakRetained traitCollection];
    uint64_t v8 = [v7 horizontalSizeClass];

    if (v8)
    {
      v9 = *(void **)(*(void *)(a1 + 32) + 728);
      [WeakRetained tutorialRingRadius];
      double v11 = v10;
      [WeakRetained portalCenter];
      objc_msgSend(v9, "setRadius:center:animated:completion:", 0, 0, v11, v12, v13);
      v14 = *(void **)(*(void *)(a1 + 32) + 616);
      [WeakRetained pillRingRadius];
      objc_msgSend(v14, "setRingRadius:");
      [WeakRetained setNeedsLayout];
    }
  }
}

- (void)setupAnimationViewWithSuperView:(id)a3
{
  v55[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(BKUIPearlEnrollView *)self squareNeedsPositionLayout])
  {
    v5 = [(BKUIPearlEnrollView *)self animationView];

    if (!v5)
    {
      uint64_t v6 = [BKUIMicaAnimationView alloc];
      BOOL v7 = -[OBAnimationView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(BKUIPearlEnrollView *)self setAnimationView:v7];
    }
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F83A68]) initWithStateName:@"enrolling" darkStateName:@"enrolling" transitionDuration:0.01 transitionSpeed:1.0];
    v55[0] = v8;
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F83A68]) initWithStateName:@"done" darkStateName:@"done" transitionDuration:1.5 transitionSpeed:1.0];
    v55[1] = v9;
    double v10 = (void *)[objc_alloc(MEMORY[0x1E4F83A68]) initWithStateName:@"check" darkStateName:@"check" transitionDuration:1.5 transitionSpeed:1.0];
    v55[2] = v10;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:3];

    double v12 = [(BKUIPearlEnrollView *)self animationView];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v13 = [(BKUIPearlEnrollView *)self animationView];
    [v13 setAlpha:0.0];

    v14 = [(BKUIPearlEnrollView *)self animationController];

    if (!v14)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F83A60]);
      v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v17 = [v16 URLForResource:@"faceid-completion" withExtension:@"ca"];
      v18 = [(BKUIPearlEnrollView *)self animationView];
      v19 = [v11 objectAtIndexedSubscript:0];
      v20 = (void *)[v15 initWithUrlToPackage:v17 animationView:v18 animatedStates:v11 startAtFirstState:v19];
      [(BKUIPearlEnrollView *)self setAnimationController:v20];
    }
    uint64_t v21 = [(BKUIPearlEnrollView *)self animationView];
    v22 = [v21 packageLayer];

    v23 = [(BKUIPearlEnrollView *)self animationView];
    [v23 setScale:1.0];

    v24 = [(BKUIPearlEnrollView *)self animationView];
    [v4 addSubview:v24];

    uint64_t v25 = +[BKUIDevice sharedInstance];
    v51 = v11;
    if ([v25 mainScreenClass] == 31)
    {
      CGFloat v26 = 5.0;
      CGFloat v27 = 5.0;
    }
    else
    {
      CGFloat v26 = 4.0;
      CGFloat v27 = 4.0;
    }
    CGAffineTransformMakeScale(&v53, v26, v27);
    uint64_t v28 = [(BKUIPearlEnrollView *)self animationView];
    CGAffineTransform v52 = v53;
    [v28 setTransform:&v52];

    v29 = [(BKUIPearlEnrollView *)self animationView];
    v30 = [v29 centerYAnchor];
    uint64_t v31 = [v4 centerYAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [(BKUIPearlEnrollView *)self setSuccessAnimationViewCenterYConstraint:v32];

    v46 = (void *)MEMORY[0x1E4F28DC8];
    v50 = [(BKUIPearlEnrollView *)self animationView];
    v49 = [v50 widthAnchor];
    [v22 bounds];
    v47 = [v49 constraintEqualToConstant:v33];
    v54[0] = v47;
    [(BKUIPearlEnrollView *)self animationView];
    v34 = v22;
    v35 = v48 = v22;
    double v36 = [v35 heightAnchor];
    [v34 bounds];
    double v38 = [v36 constraintEqualToConstant:v37];
    v54[1] = v38;
    double v39 = [(BKUIPearlEnrollView *)self animationView];
    v40 = [v39 centerXAnchor];
    [v4 centerXAnchor];
    v42 = id v41 = v4;
    v43 = [v40 constraintEqualToAnchor:v42];
    v54[2] = v43;
    v44 = [(BKUIPearlEnrollView *)self successAnimationViewCenterYConstraint];
    v54[3] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:4];
    [v46 activateConstraints:v45];

    id v4 = v41;
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(BKUIPearlEnrollView *)self backgroundColor];

  if (v5 != v4)
  {
    [(UIView *)self->_circleMaskView setBackgroundColor:v4];
    circleMaskLayer = self->_circleMaskLayer;
    id v7 = v4;
    -[CAShapeLayer setBackgroundColor:](circleMaskLayer, "setBackgroundColor:", [v7 CGColor]);
    [(UIView *)self->_roundedRectMaskView setBackgroundColor:v7];
    -[CAShapeLayer setBackgroundColor:](self->_roundedRectMaskLayer, "setBackgroundColor:", [v7 CGColor]);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKUIPearlEnrollView;
  [(BKUIPearlEnrollView *)&v8 setBackgroundColor:v4];
}

- (void)setDebugOverlayVisible:(BOOL)a3
{
  self->_debugOverlayVisible = a3;
  [(UILabel *)self->_debugLabel setHidden:!a3];

  [(BKUIPearlEnrollView *)self setNeedsLayout];
}

- (void)preEnrollActivate
{
  if (!self->_activated)
  {
    self->_activated = 1;
    [(BKUIPearlEnrollView *)self setActive:1];
  }
}

- (void)postEnrollDeActivate
{
}

- (void)dealloc
{
  [(BKUIPearlEnrollView *)self setActive:0];
  v3.receiver = self;
  v3.super_class = (Class)BKUIPearlEnrollView;
  [(BKUIPearlEnrollView *)&v3 dealloc];
}

- (void)setActive:(BOOL)a3
{
  if (!a3) {
    [(BKUIPearlEnrollView *)self _endAndCleanupEnrollSessionIfNeeded];
  }
  self->_active = a3;
}

- (void)_endAndCleanupEnrollSessionIfNeeded
{
  if ([(BKUIPearlEnrollView *)self active])
  {
    [(BKUIPearlPositioningGuideView *)self->_positioningGuide setHidden:1];
    objc_super v3 = [(BKUIPearlEnrollView *)self previewLayer];
    [v3 setHidden:1];

    [(BKUIPearlEnrollView *)self _stopNudgeTimer];
  }
  videoCaptureSession = self->_videoCaptureSession;
  if (videoCaptureSession)
  {
    [(BKUIPearlVideoCaptureSession *)videoCaptureSession endCapture];
  }
}

- (id)previewLayer
{
  return [(BKUIPearlVideoCaptureSession *)self->_videoCaptureSession previewLayer];
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(BKUIPearlEnrollView *)self _stopNudgeTimer];
    [(BKUIPearlEnrollView *)self setCameraBlurred:1];
  }
  else
  {
    unsigned int state = self->_state;
    BOOL v6 = state > 7;
    int v7 = (1 << state) & 0xB8;
    if (!v6 && v7 != 0) {
      [(BKUIPearlEnrollView *)self setCameraBlurred:0];
    }
    [(BKUIPearlEnrollView *)self _startNudgeTimer];
  }
  v9 = [(BKUIPearlEnrollView *)self previewLayer];
  double v10 = [v9 connection];
  [v10 setEnabled:v3 ^ 1];

  positioningGuide = self->_positioningGuide;

  [(BKUIPearlPositioningGuideView *)positioningGuide setHidden:v3];
}

- (void)_animateToState:(int)a3 fromState:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  if ((v5 & 0xFFFFFFFD) == 5 && (a3 == 9 || a3 == 3)) {
    [(BKUIPearlPillContainerView *)self->_pillContainer stashPillStates];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__BKUIPearlEnrollView__animateToState_fromState_completion___block_invoke;
  v18[3] = &unk_1E6EA20C0;
  v18[4] = self;
  +[UIView bkui_animateWithDuration:animations:](0.3, MEMORY[0x1E4F42FF0], v18);
  [(BKUIPearlEnrollView *)self setTransitioningToState:1];
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __60__BKUIPearlEnrollView__animateToState_fromState_completion___block_invoke_2;
  v14 = &unk_1E6EA2E48;
  objc_copyWeak(&v16, &location);
  id v9 = v8;
  id v15 = v9;
  double v10 = (void (**)(void))_Block_copy(&v11);
  switch(self->_state)
  {
    case 0:
      [(BKUIPearlEnrollView *)self _cleanupUIState];
      goto LABEL_8;
    case 1:
      [(BKUIPearlEnrollView *)self _animateToEntryAnimation];
LABEL_8:
      v10[2](v10);
      break;
    case 2:
      -[BKUIPearlEnrollView _animateToTutorialWithCompletion:](self, "_animateToTutorialWithCompletion:", v10, v11, v12, v13, v14);
      break;
    case 3:
      -[BKUIPearlEnrollView _animateToNeedsPositioningFromState:withCompletion:](self, "_animateToNeedsPositioningFromState:withCompletion:", v5, v10, v11, v12, v13, v14);
      break;
    case 4:
      -[BKUIPearlEnrollView _animateToNeedsCenterBinWithCompletion:](self, "_animateToNeedsCenterBinWithCompletion:", v10, v11, v12, v13, v14);
      break;
    case 5:
      -[BKUIPearlEnrollView _animateToFirstScanWithCompletion:](self, "_animateToFirstScanWithCompletion:", v10, v11, v12, v13, v14);
      break;
    case 6:
      -[BKUIPearlEnrollView _animateToFirstScanCompleteWithCompletion:](self, "_animateToFirstScanCompleteWithCompletion:", v10, v11, v12, v13, v14);
      break;
    case 7:
      -[BKUIPearlEnrollView _animateToScanningStateWithCompletion:](self, "_animateToScanningStateWithCompletion:", v10, v11, v12, v13, v14);
      break;
    case 8:
      -[BKUIPearlEnrollView _animateToScanCompleteWithCompletion:](self, "_animateToScanCompleteWithCompletion:", v10, v11, v12, v13, v14);
      break;
    case 9:
      -[BKUIPearlEnrollView _animateToPartialCaptureWithCompletion:](self, "_animateToPartialCaptureWithCompletion:", v10, v11, v12, v13, v14);
      break;
    case 0xA:
      -[BKUIPearlEnrollView _animateToFinishedWithCompletion:](self, "_animateToFinishedWithCompletion:", v10, v11, v12, v13, v14);
      break;
    default:
      break;
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __60__BKUIPearlEnrollView__animateToState_fromState_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) crossHairs];
  [v1 setAlpha:0.0];
}

void __60__BKUIPearlEnrollView__animateToState_fromState_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setTransitioningToState:0];
  v2 = [WeakRetained transitionDelegate];
  [v2 stateTransitionDidComplete];

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (void)_setState:(int)a3 completion:(id)a4
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t state = self->_state;
  if (a3 < 2 || state > 1)
  {
    self->_uint64_t state = a3;
    if (!a3) {
      goto LABEL_17;
    }
  }
  else
  {
    [(BKUIPearlEnrollView *)self startCapture];
    uint64_t state = self->_state;
    self->_uint64_t state = a3;
  }
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  stateStart = self->_stateStart;
  self->_stateStart = v8;

  [(BKUIPearlEnrollView *)self setNeedsLayout];
  [(BKUIPearlEnrollView *)self updatePortalLayoutGuide];
  BOOL v10 = [(BKUIPearlEnrollView *)self squareNeedsPositionLayout];
  uint64_t v11 = self->_state;
  if (v10 && v11 == 10)
  {
    if (state == 9 || state == 6)
    {
      double v13 = (void *)[objc_alloc(MEMORY[0x1E4F83A68]) initWithStateName:@"enrolling" darkStateName:@"enrolling" transitionDuration:0.01 transitionSpeed:1.0];
      v34[0] = v13;
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F83A68]) initWithStateName:@"done" darkStateName:@"done" transitionDuration:1.5 transitionSpeed:1.0];
      v34[1] = v14;
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F83A68]) initWithStateName:@"check" darkStateName:@"check" transitionDuration:1.5 transitionSpeed:1.0];
      v34[2] = v15;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];

      id v17 = objc_alloc(MEMORY[0x1E4F83A60]);
      v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v19 = [v18 URLForResource:@"faceid-completion-skip-mask" withExtension:@"ca"];
      v20 = [(BKUIPearlEnrollView *)self animationView];
      uint64_t v21 = [v16 objectAtIndexedSubscript:0];
      v22 = (void *)[v17 initWithUrlToPackage:v19 animationView:v20 animatedStates:v16 startAtFirstState:v21];
      [(BKUIPearlEnrollView *)self setAnimationController:v22];

      [(BKUIPearlEnrollView *)self setAlpha:0.0];
      v23 = [(BKUIPearlEnrollView *)self animationView];
      [v23 setAlpha:0.0];

      CGAffineTransformMakeScale(&v33, 1.0, 1.0);
      v24 = [(BKUIPearlEnrollView *)self animationView];
      CGAffineTransform v32 = v33;
      [v24 setTransform:&v32];

      uint64_t v25 = [(BKUIPearlEnrollView *)self successAnimationViewCenterYConstraint];
      [v25 setConstant:4.0];

      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __44__BKUIPearlEnrollView__setState_completion___block_invoke;
      v31[3] = &unk_1E6EA20C0;
      v31[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:196608 delay:v31 options:0 animations:0.349999994 completion:0.150000006];
    }
    else
    {
      CGFloat v26 = [(BKUIPearlEnrollView *)self animationView];
      [v26 setAlpha:0.0];

      CGFloat v27 = (void *)MEMORY[0x1E4F42FF0];
      uint64_t v28 = [MEMORY[0x1E4F43010] behaviorWithDampingRatio:1.0 response:0.5];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __44__BKUIPearlEnrollView__setState_completion___block_invoke_2;
      v30[3] = &unk_1E6EA20C0;
      v30[4] = self;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __44__BKUIPearlEnrollView__setState_completion___block_invoke_3;
      v29[3] = &unk_1E6EA2E70;
      v29[4] = self;
      [v27 _animateUsingSpringBehavior:v28 tracking:0 animations:v30 completion:v29];
    }
  }
  else
  {
    [(BKUIPearlPillContainerView *)self->_pillContainer animateToState:v11 completion:0];
  }
  if ((self->_state | 2) == 7)
  {
    self->_nudgesNudged = 0;
    [(BKUIPearlEnrollView *)self setNudgesPaused:0];
    [(BKUIPearlEnrollView *)self _startNudgeTimer];
    self->_fillHoldoffFrameCount = 0;
  }
  else
  {
    [(BKUIPearlEnrollView *)self _stopNudgeTimer];
  }
LABEL_17:
  [(BKUIPearlEnrollView *)self _animateToState:self->_state fromState:state completion:v6];
}

void __44__BKUIPearlEnrollView__setState_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) animationView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) animationController];
  [v3 startAnimation];
}

uint64_t __44__BKUIPearlEnrollView__setState_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  CGAffineTransformMakeScale(&v10, 0.2, 0.2);
  v2 = *(void **)(a1 + 32);
  CGAffineTransform v9 = v10;
  [v2 setTransform:&v9];
  CGAffineTransformMakeScale(&v8, 1.0, 1.0);
  id v3 = [*(id *)(a1 + 32) animationView];
  CGAffineTransform v7 = v8;
  [v3 setTransform:&v7];

  id v4 = [*(id *)(a1 + 32) animationView];
  [v4 setAlpha:1.0];

  uint64_t v5 = [*(id *)(a1 + 32) animationController];
  [v5 startAnimation];

  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __44__BKUIPearlEnrollView__setState_completion___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) animationView];
  [v1 setAlpha:1.0];
}

- (void)setState:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  CGAffineTransform v7 = v6;
  if (self->_state != v4)
  {
    self->_stateTransitionInProgress = 1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__BKUIPearlEnrollView_setState_completion___block_invoke;
    v8[3] = &unk_1E6EA25E0;
    v8[4] = self;
    id v9 = v6;
    [(BKUIPearlEnrollView *)self _setState:v4 completion:v8];
  }
}

uint64_t __43__BKUIPearlEnrollView_setState_completion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 552) = 0;
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)didDisappear
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __35__BKUIPearlEnrollView_didDisappear__block_invoke;
  v2[3] = &unk_1E6EA20C0;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v2 animations:0 completion:0.15];
}

uint64_t __35__BKUIPearlEnrollView_didDisappear__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 736) setAlphaHideOnZero:0.0];
}

- (void)_updateDebugOverlay
{
  if (self->_debugOverlayVisible)
  {
    double frameCount = (double)self->_frameCount;
    [(NSDate *)self->_startTime timeIntervalSinceNow];
    double v5 = frameCount / -v4;
    debugLabel = self->_debugLabel;
    debugFrameInformation = (__CFString *)self->_debugFrameInformation;
    debugStatusInformation = &stru_1F4081468;
    if (!debugFrameInformation) {
      debugFrameInformation = &stru_1F4081468;
    }
    debugTemplateInformation = (__CFString *)self->_debugTemplateInformation;
    if (!debugTemplateInformation) {
      debugTemplateInformation = &stru_1F4081468;
    }
    if (self->_debugStatusInformation) {
      debugStatusInformation = (__CFString *)self->_debugStatusInformation;
    }
    id v10 = [NSString stringWithFormat:@"%@\nenroll framerate: %0.2f\n%@\n%@", debugFrameInformation, *(void *)&v5, debugTemplateInformation, debugStatusInformation];
    [(UILabel *)debugLabel setText:v10];
  }
}

- (void)_recordDataFrameWithFaceState:(id)a3
{
  id v4 = a3;
  int state = self->_state;
  id v13 = v4;
  if ((state | 2) != 7)
  {
LABEL_5:
    if ((state - 3) > 1) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [(NSDate *)self->_stateStart timeIntervalSinceNow];
  if (v6 >= -1.0)
  {
    int state = self->_state;
    id v4 = v13;
    goto LABEL_5;
  }
  debugStatusInformation = self->_debugStatusInformation;
  self->_debugStatusInformation = 0;

LABEL_6:
  CGAffineTransform v8 = [v13 pitch];
  [v8 doubleValue];
  double v10 = v9;
  uint64_t v11 = [v13 yaw];
  [v11 doubleValue];
  [(BKUIPearlEnrollView *)self setPitch:v10 yaw:v12];

  id v4 = v13;
LABEL_7:
}

- (void)_updateCorrectionEstimates:(double)a3 yaw:(double)a4
{
  if (a3 <= 5.0) {
    self->_pitchMadouble x = fmax(self->_pitchMax, a3);
  }
  if (a3 >= -45.0) {
    self->_double pitchMin = fmin(self->_pitchMin, a3);
  }
  unint64_t correctionSamplesCount = self->_correctionSamplesCount;
  if (a3 < -0.1)
  {
    BOOL v5 = correctionSamplesCount >= 5;
    BOOL v6 = correctionSamplesCount == 5;
  }
  else
  {
    BOOL v5 = 1;
    BOOL v6 = 0;
  }
  if (v6 || !v5)
  {
    unint64_t v9 = correctionSamplesCount + 1;
    self->_unint64_t correctionSamplesCount = v9;
    double v10 = self->_pitchCorrectionSamples + a3;
    self->_pitchCorrectionSamples = v10;
    double v11 = v10 / (double)v9;
LABEL_13:
    self->_pitchCorrection = v11;
    return;
  }
  if (correctionSamplesCount >= 6)
  {
    pitchMadouble x = self->_pitchMax;
    double pitchMin = self->_pitchMin;
    if (pitchMax - pitchMin >= 10.0)
    {
      double v11 = (pitchMax + pitchMin) * 0.5 * 0.1 + self->_pitchCorrection * 0.9;
      goto LABEL_13;
    }
  }
}

- (void)setPitch:(double)a3 yaw:(double)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = MGGetSInt32Answer() - 22;
  double v8 = 10.0;
  if (v7 <= 3) {
    double v8 = dbl_1E4BD1A98[v7];
  }
  if (!self->_stateTransitionInProgress)
  {
    double pitchCorrection = self->_pitchCorrection;
    double v10 = a3 - pitchCorrection;
    self->_currentCorrectedPitch = a3 - pitchCorrection;
    int state = self->_state;
    if (state == 4)
    {
      if (self->_progressiveBlur)
      {
        [(BKUIPearlEnrollView *)self _updateRaiseLowerGuidanceLabelIfNeededForPitch:a3 - pitchCorrection];
        [(BKUIPearlEnrollView *)self _progressiveBlurAmountForPitch:v10];
        -[BKUIPearlEnrollView setCameraBlurAmount:useShade:duration:completion:](self, "setCameraBlurAmount:useShade:duration:completion:", 1, 0);
      }
    }
    else if (state == 7 || state == 5)
    {
      if (!self->_nudging)
      {
        id v13 = [(BKUIPearlEnrollView *)self crossHairs];
        v14 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
        [v13 setTintColor:v14];

        id v15 = [(BKUIPearlEnrollView *)self crossHairs];
        [v15 setPitch:v10 yaw:a4];

        id v16 = [(BKUIPearlEnrollView *)self crossHairs];
        [v16 alpha];
        double v18 = v17;

        if (v18 == 0.0)
        {
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __36__BKUIPearlEnrollView_setPitch_yaw___block_invoke;
          v28[3] = &unk_1E6EA20C0;
          v28[4] = self;
          +[UIView bkui_animateWithDuration:animations:](0.5, MEMORY[0x1E4F42FF0], v28);
        }
      }
      double v19 = sqrt(a4 * a4 + v10 * v10);
      double v20 = atan2(-v10, -a4);
      double v21 = 6.28318531;
      if (v20 >= 0.0) {
        double v21 = 0.0;
      }
      double v22 = v20 + v21;
      if ([(BKUIPearlEnrollView *)self debugOverlayVisible])
      {
        v23 = _BKUILoggingFacility();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          double v24 = self->_pitchCorrection;
          *(_DWORD *)buf = 134219520;
          double v30 = v10;
          __int16 v31 = 2048;
          double v32 = a3;
          __int16 v33 = 2048;
          double v34 = v24;
          __int16 v35 = 2048;
          double v36 = a4;
          __int16 v37 = 2048;
          double v38 = a4;
          __int16 v39 = 2048;
          double v40 = v19;
          __int16 v41 = 2048;
          double v42 = v22;
          _os_log_impl(&dword_1E4B6C000, v23, OS_LOG_TYPE_DEFAULT, "P: %0.2f(%0.2f C: %0.2f) Y: %0.2f(%0.2f) M: %0.2f FA: %0.2f", buf, 0x48u);
        }
      }
      if (v19 > 6.0)
      {
        unint64_t v25 = self->_fillHoldoffFrameCount + 1;
        self->_fillHoldoffFrameCount = v25;
        if (v8 < (double)v25
          && [(BKUIPearlPillContainerView *)self->_pillContainer fillPillsAroundAngle:v22]
          && self->_nudgesNudged != -1)
        {
          [(BKUIPearlEnrollView *)self _startNudgeTimer];
        }
      }
      if (self->_debugOverlayVisible)
      {
        CGFloat v26 = [NSString stringWithFormat:@"p: %0.2f, y: %0.2f, angle: %0.2f\n pC: %0.2f", *(void *)&a3, *(void *)&a4, *(void *)&v22, *(void *)&self->_pitchCorrection];
        debugFrameInformation = self->_debugFrameInformation;
        self->_debugFrameInformation = v26;

        [(BKUIPearlEnrollView *)self _updateDebugOverlay];
      }
      [(BKUIPearlEnrollView *)self _updateCorrectionEstimates:a3 yaw:a4];
    }
  }
}

void __36__BKUIPearlEnrollView_setPitch_yaw___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) crossHairs];
  [v1 setAlpha:1.0];
}

- (void)updateWithFaceState:(id)a3
{
  id v4 = a3;
  if ([v4 faceDetected] && (objc_msgSend(v4, "partiallyOutOfView") & 1) == 0) {
    [(BKUIPearlEnrollView *)self _recordDataFrameWithFaceState:v4];
  }
}

- (void)updateWithProgress:(id)a3
{
  id v16 = a3;
  if (!self->_startTime)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    startTime = self->_startTime;
    self->_startTime = v4;
  }
  BOOL v6 = [MEMORY[0x1E4F28E78] stringWithString:@"Templates:\n"];
  unsigned int v7 = [v16 enrolledPoses];
  if ([v7 count])
  {
    uint64_t v8 = 0;
    unsigned int v9 = 0;
    do
    {
      double v10 = [v7 objectAtIndexedSubscript:v8];
      if ([v10 count])
      {
        uint64_t v11 = 0;
        unsigned int v12 = 1;
        do
        {
          id v13 = [v10 objectAtIndexedSubscript:v11];
          [v6 appendFormat:@"%@ ", v13];

          uint64_t v11 = v12;
        }
        while ([v10 count] > (unint64_t)v12++);
      }
      [v6 appendString:@"\n"];

      uint64_t v8 = ++v9;
    }
    while ([v7 count] > (unint64_t)v9);
  }
  debugTemplateInformation = self->_debugTemplateInformation;
  self->_debugTemplateInformation = (NSString *)v6;

  [(BKUIPearlEnrollView *)self _updateDebugOverlay];
}

- (double)percentOfPillsCompleted
{
  [(BKUIPearlPillContainerView *)self->_pillContainer percentOfPillsCompleted];
  return result;
}

- (void)_cleanupUIState
{
  id v3 = [BKUIPearlPositioningGuideView alloc];
  [(BKUIPearlEnrollView *)self bounds];
  id v4 = -[BKUIPearlPositioningGuideView initWithFrame:](v3, "initWithFrame:");
  [(BKUIPearlPositioningGuideView *)v4 setInSheet:[(BKUIPearlEnrollView *)self inSheet]];
  [(BKUIPearlPositioningGuideView *)v4 setAlpha:0.0];
  [(BKUIPearlEnrollView *)self pillRingRadius];
  -[BKUIPearlPositioningGuideView setRingRadius:](v4, "setRingRadius:");
  [(BKUIPearlEnrollView *)self center];
  -[BKUIPearlPositioningGuideView setCenter:](v4, "setCenter:");
  [(BKUIPearlPositioningGuideView *)v4 setRoundedRectMaskLayer:self->_roundedRectMaskLayer];
  [(BKUIPearlEnrollView *)self addSubview:v4];
  [(BKUIPearlPositioningGuideView *)self->_positioningGuide removeFromSuperview];
  positioningGuide = self->_positioningGuide;
  self->_positioningGuide = 0;

  BOOL v6 = self->_positioningGuide;
  self->_positioningGuide = v4;
  unsigned int v7 = v4;

  self->_int state = 0;
  stateStart = self->_stateStart;
  self->_stateStart = 0;

  self->_nudgesPaused = 0;
  self->_nudgesNudged = 0;
  unsigned int v9 = [(BKUIPearlEnrollView *)self pillContainer];
  [v9 resetPillsAnimated:0];

  [(BKUIPearlEnrollView *)self _stopNudgeTimer];
}

- (double)_progressiveBlurAmountForPitch:(double)a3
{
  double v3 = 0.0;
  if (a3 < -30.0 || a3 > -10.0)
  {
    double v5 = vabdd_f64(-30.0, a3);
    double v6 = vabdd_f64(-10.0, a3);
    if (v5 < v6) {
      double v6 = v5;
    }
    double v3 = v6 * 0.5 + 2.0;
  }
  double result = 15.0;
  if (v3 <= 15.0) {
    return v3;
  }
  return result;
}

- (void)_updateRaiseLowerGuidanceLabelIfNeededForPitch:(double)a3
{
  if (self->_state == 4)
  {
    if (a3 >= -30.0)
    {
      if (a3 <= -10.0) {
        return;
      }
      unint64_t v4 = 2;
    }
    else
    {
      unint64_t v4 = 1;
    }
    if (!self->_pendingRaiseLowerGuidanceState)
    {
      self->_pendingRaiseLowerGuidanceState = v4;
      [(NSTimer *)self->_raiseLowerGuidanceDelayTimer invalidate];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __70__BKUIPearlEnrollView__updateRaiseLowerGuidanceLabelIfNeededForPitch___block_invoke;
      v7[3] = &unk_1E6EA2E98;
      v7[4] = self;
      double v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v7 block:0.25];
      raiseLowerGuidanceDelayTimer = self->_raiseLowerGuidanceDelayTimer;
      self->_raiseLowerGuidanceDelayTimer = v5;
    }
  }
}

uint64_t __70__BKUIPearlEnrollView__updateRaiseLowerGuidanceLabelIfNeededForPitch___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 664);
  *(void *)(v1 + 664) = 0;
  return [*(id *)(a1 + 32) _setRaiseLowerGuidanceLabelState:v2];
}

- (void)_setRaiseLowerGuidanceLabelState:(unint64_t)a3
{
  unint64_t v4 = @"GENTLY_LOWER";
  if (a3 != 2) {
    unint64_t v4 = 0;
  }
  if (a3 == 1) {
    double v5 = @"GENTLY_RAISE";
  }
  else {
    double v5 = v4;
  }
  double v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v23 = [v6 localizedStringForKey:v5 value:&stru_1F4081468 table:@"Pearl"];

  unsigned int v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    unsigned int v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:v5 value:&stru_1F4081468 table:@"Pearl-j3xx"];

    id v23 = (id)v10;
  }
  uint64_t v11 = [(UILabel *)self->_repositionPhoneLabel text];
  char v12 = [v23 isEqualToString:v11];

  if ((v12 & 1) == 0)
  {
    [(UILabel *)self->_repositionPhoneLabel setText:v23];
    [(UILabel *)self->_repositionPhoneLabel frame];
    double v14 = v13;
    double v16 = v15;
    if ([(BKUIPearlEnrollView *)self squareNeedsPositionLayout])
    {
      [(BKUIPearlEnrollView *)self pillRingRadius];
      double v18 = v17 + v17;
    }
    else
    {
      [(BKUIPearlEnrollView *)self bounds];
      double v20 = v19;
      double v21 = +[BKUIStyle sharedStyle];
      [v21 horizontalMarginForView:self];
      double v18 = v20 + v22 * -2.0;
    }
    -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_repositionPhoneLabel, "textRectForBounds:limitedToNumberOfLines:", [(UILabel *)self->_repositionPhoneLabel numberOfLines], 0.0, 0.0, v18, 1.79769313e308);
    -[UILabel setFrame:](self->_repositionPhoneLabel, "setFrame:", v14, v16, v18);
    [(BKUIPearlEnrollView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (void)setCameraBlurAmount:(double)a3 useShade:(BOOL)a4 duration:(double)a5 completion:(id)a6
{
  BOOL v7 = a4;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  uint64_t v11 = dispatch_group_create();
  double v12 = 0.0;
  if (v7) {
    double v12 = a3 * 0.5 / 15.0 + 0.2;
  }
  if (v12 <= 1.0) {
    double v13 = v12;
  }
  else {
    double v13 = 1.0;
  }
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    a5 = a5 * 0.5;
    double v13 = a3 / 15.0;
    a3 = 0.0;
  }
  dispatch_group_enter(v11);
  uint64_t v14 = MEMORY[0x1E4F42FF0];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke;
  v32[3] = &unk_1E6EA26D0;
  v32[4] = self;
  *(double *)&v32[5] = v13;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke_2;
  v30[3] = &unk_1E6EA2108;
  double v15 = v11;
  __int16 v31 = v15;
  +[UIView bkui_animateWithDuration:animations:completion:](a5, v14, v32, v30);
  dispatch_group_enter(v15);
  if (a3 <= 0.0)
  {
    double v20 = +[BKUIPearlEnrollAnimationManager sharedManager];
    double v21 = [(BKUIPearlEnrollView *)self previewLayer];
    uint64_t v25 = *MEMORY[0x1E4F3A4A0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke_93;
    v26[3] = &unk_1E6EA2180;
    v26[4] = self;
    double v24 = (id *)&v27;
    CGFloat v27 = v15;
    [v20 runBasicAnimationOnLayer:v21 withDuration:@"filters.gaussianBlur.inputRadius" keyPath:0 fromValue:&unk_1F40949D8 toValue:0 removedOnCompletion:v25 timingFunction:a5 completion:v26];
  }
  else
  {
    self->_blurInProgress = 1;
    double v16 = [(BKUIPearlEnrollView *)self previewLayer];
    double v17 = +[BKUIPearlEnrollAnimationManager sharedManager];
    double v18 = [v17 gaussianBlurWithRadius:0.0];
    v33[0] = v18;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    [v16 setFilters:v19];

    double v20 = +[BKUIPearlEnrollAnimationManager sharedManager];
    double v21 = [(BKUIPearlEnrollView *)self previewLayer];
    double v22 = [NSNumber numberWithDouble:a3];
    uint64_t v23 = *MEMORY[0x1E4F3A4A0];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke_3;
    v28[3] = &unk_1E6EA2180;
    v28[4] = self;
    double v24 = (id *)&v29;
    v29 = v15;
    [v20 runBasicAnimationOnLayer:v21 withDuration:@"filters.gaussianBlur.inputRadius" keyPath:0 fromValue:v22 toValue:0 removedOnCompletion:v23 timingFunction:a5 completion:v28];
  }
  if (v10) {
    dispatch_group_notify(v15, MEMORY[0x1E4F14428], v10);
  }
}

uint64_t __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:*(double *)(a1 + 40)];
}

void __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke_2(uint64_t a1)
{
}

void __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 448) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __72__BKUIPearlEnrollView_setCameraBlurAmount_useShade_duration_completion___block_invoke_93(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (!v2[448])
  {
    double v3 = [v2 previewLayer];
    [v3 setFilters:0];

    unint64_t v4 = [*(id *)(a1 + 32) previewLayer];
    [v4 removeAllAnimations];
  }
  double v5 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v5);
}

- (void)setCameraBlurred:(BOOL)a3
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 15.0;
  }
  [(BKUIPearlEnrollView *)self setCameraBlurAmount:0 useShade:0 duration:v3 completion:0.5];
}

- (void)setFailed
{
  [(BKUIPearlEnrollView *)self setCameraBlurred:1];

  [(BKUIPearlEnrollView *)self setActive:0];
}

- (void)setNudgesPaused:(BOOL)a3
{
  self->_nudgesPaused = a3;
}

- (void)layoutSubviews
{
  [(BKUIPearlEnrollView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  positioningGuide = self->_positioningGuide;
  [(BKUIPearlEnrollView *)self pillRingRadius];
  -[BKUIPearlPositioningGuideView setRingRadius:](positioningGuide, "setRingRadius:");
  if (self->_debugOverlayVisible)
  {
    [(UILabel *)self->_debugLabel sizeToFit];
    [(UILabel *)self->_debugLabel frame];
    -[UILabel setFrame:](self->_debugLabel, "setFrame:", 10.0, 10.0, v8 + -24.0);
  }
  [(BKUIPearlPillContainerView *)self->_pillContainer bounds];
  v94.origin.double x = v12;
  v94.origin.double y = v13;
  v94.size.double width = v14;
  v94.size.double height = v15;
  v91.origin.double x = v4;
  v91.origin.double y = v6;
  v91.size.double width = v8;
  v91.size.double height = v10;
  if (!CGRectEqualToRect(v91, v94))
  {
    -[BKUIPearlPillContainerView setFrame:](self->_pillContainer, "setFrame:", v4, v6, v8, v10);
    if ([(BKUIPearlEnrollView *)self state] == 2) {
      [(BKUIPearlEnrollView *)self tutorialRingRadius];
    }
    else {
      [(BKUIPearlEnrollView *)self pillRingRadius];
    }
    double v17 = v16;
    pillContainer = self->_pillContainer;
    [(BKUIPearlEnrollView *)self portalCenter];
    -[BKUIPearlPillContainerView setRadius:center:animated:completion:](pillContainer, "setRadius:center:animated:completion:", 0, 0, v17, v19, v20);
    [(BKUIPearlPillContainerView *)self->_pillContainer setNeedsLayout];
  }
  double v21 = *MEMORY[0x1E4F1DB28];
  double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [(BKUIPearlEnrollView *)self portalRadius];
  double v24 = v23 * 2.125;
  uint64_t v25 = [(BKUIPearlEnrollView *)self crossHairs];
  objc_msgSend(v25, "setBounds:", v21, v22, v24, v24);

  CGFloat v26 = [(BKUIPearlEnrollView *)self crossHairs];
  [(BKUIPearlEnrollView *)self portalCenter];
  objc_msgSend(v26, "setCenter:");

  CGFloat v27 = [(BKUIPearlEnrollView *)self layer];
  [v27 bounds];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  -[UIView setFrame:](self->_cameraShadeView, "setFrame:", v29, v31, v33, v35);
  double v36 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v37 = [v36 userInterfaceIdiom];

  double v38 = 1.77777778;
  if ((v37 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v38 = 1.0;
  }
  double v39 = v33 * v38;
  double v40 = [(BKUIPearlEnrollView *)self layer];
  [v40 bounds];
  double v42 = (v41 - v39) * 0.5;

  uint64_t v43 = [(BKUIPearlEnrollView *)self previewLayer];
  objc_msgSend(v43, "setFrame:", v29, v42, v33, v39);

  v44 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v45 = [v44 userInterfaceIdiom];

  if ((v45 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v46 = [(BKUIPearlEnrollView *)self traitCollection];
    BOOL v47 = [v46 horizontalSizeClass] == 0;
  }
  else
  {
    BOOL v47 = 0;
  }
  if (!self->_tutorialMovieView && !v47)
  {
    v48 = +[BKUIDevice sharedInstance];
    int v49 = [v48 isN84];

    if (v49) {
      v50 = @"Enrollment_Tutorial_Loop-n84";
    }
    else {
      v50 = @"Enrollment_Tutorial_Loop-D22";
    }
    v51 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v52 = [v51 userInterfaceIdiom];

    if ((v52 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      CGAffineTransform v53 = @"Enrollment_Tutorial_Loop-j3xx";
    }
    else {
      CGAffineTransform v53 = v50;
    }
    v54 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v55 = [v54 userInterfaceIdiom];

    if ((v55 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v56 = +[BKUIVideoAssetHelpers iPadVideoURLForAssetName:v53];
    }
    else
    {
      v57 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v56 = [v57 URLForResource:v53 withExtension:@"mov"];
    }
    v58 = [MEMORY[0x1E4F166C8] assetWithURL:v56];
    [v58 loadValuesAsynchronouslyForKeys:&unk_1F40946D8 completionHandler:0];
    v59 = [MEMORY[0x1E4F153E0] sharedInstance];
    [v59 setCategory:*MEMORY[0x1E4F14F68] withOptions:1 error:0];

    v60 = [MEMORY[0x1E4F16620] playerItemWithAsset:v58];
    v61 = (AVPlayer *)[objc_alloc(MEMORY[0x1E4F16608]) initWithPlayerItem:v60];
    tutorialPlayer = self->_tutorialPlayer;
    self->_tutorialPlayer = v61;

    [(AVPlayer *)self->_tutorialPlayer setMuted:1];
    [(AVPlayer *)self->_tutorialPlayer setAllowsExternalPlayback:0];
    [(BKUIPearlEnrollView *)self tutorialMovieSize];
    v65 = -[BKUIPearlMovieLoopView initWithFrame:player:asset:]([BKUIPearlMovieLoopView alloc], "initWithFrame:player:asset:", self->_tutorialPlayer, v58, 0.0, 0.0, v63, v64);
    tutorialMovieView = self->_tutorialMovieView;
    self->_tutorialMovieView = v65;

    [(BKUIPearlEnrollView *)self addSubview:self->_tutorialMovieView];
  }
  if ([(BKUIPearlEnrollView *)self state] <= 2 && self->_tutorialMovieView)
  {
    [(BKUIPearlEnrollView *)self tutorialMovieSize];
    double v68 = *(double *)&v67;
    id v88 = v67;
    double v70 = v69;
    v92.origin.double x = v4;
    v92.origin.double y = v6;
    v92.size.double width = v8;
    v92.size.double height = v10;
    CGFloat v71 = v8;
    CGFloat v72 = v10;
    CGFloat v73 = v6;
    double v74 = v4;
    double v75 = v68 * 0.5;
    CGFloat v76 = CGRectGetMidX(v92) - v75;
    [(BKUIPearlEnrollView *)self portalOffset];
    CGFloat v78 = v76 + v77;
    v93.origin.double x = v4;
    v93.origin.double y = v73;
    v93.size.double width = v71;
    v93.size.double height = v72;
    CGFloat v79 = CGRectGetMidY(v93) - v70 * 0.5;
    [(BKUIPearlEnrollView *)self portalOffset];
    CGFloat v81 = v79 + v80;
    double v4 = v74;
    double v6 = v73;
    double v10 = v72;
    double v8 = v71;
    -[BKUIPearlMovieLoopView setFrame:](self->_tutorialMovieView, "setFrame:", v78, v81, *(double *)&v88, v70);
    [(BKUIPearlMovieLoopView *)self->_tutorialMovieView _setCornerRadius:v75];
    v82 = [(BKUIPearlMovieLoopView *)self->_tutorialMovieView layer];
    [v82 setMasksToBounds:1];

    v83 = [MEMORY[0x1E4F42948] currentDevice];
    [v83 userInterfaceIdiom];
  }
  -[BKUIPearlPositioningGuideView setFrame:](self->_positioningGuide, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_circleMaskView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_roundedRectMaskView, "setFrame:", v4, v6, v8, v10);
  [(BKUIPearlEnrollView *)self center];
  double v85 = v84;
  double v87 = v86;
  id v89 = [(BKUIPearlEnrollView *)self superview];
  -[BKUIPearlEnrollView convertPoint:fromView:](self, "convertPoint:fromView:", v89, v85, v87);
  -[UILabel setCenter:](self->_repositionPhoneLabel, "setCenter:");
}

- (void)updatePortalLayoutGuide
{
  v29[4] = *MEMORY[0x1E4F143B8];
  double v3 = [(BKUIPearlEnrollView *)self portalLayoutGuideConstraints];

  if (v3)
  {
    double v4 = (void *)MEMORY[0x1E4F28DC8];
    double v5 = [(BKUIPearlEnrollView *)self portalLayoutGuideConstraints];
    [v4 deactivateConstraints:v5];

    [(BKUIPearlEnrollView *)self setPortalLayoutGuideConstraints:0];
  }
  [(BKUIPearlEnrollView *)self portalRadius];
  double v7 = v6 + v6;
  [(BKUIPearlEnrollView *)self portalOffset];
  double v9 = v8;
  double v11 = v10;
  double v28 = [(BKUIPearlEnrollView *)self portalLayoutGuide];
  CGFloat v27 = [v28 widthAnchor];
  CGFloat v26 = [v27 constraintEqualToConstant:v7];
  v29[0] = v26;
  uint64_t v25 = [(BKUIPearlEnrollView *)self portalLayoutGuide];
  double v24 = [v25 heightAnchor];
  double v23 = [v24 constraintEqualToConstant:v7];
  v29[1] = v23;
  CGFloat v12 = [(BKUIPearlEnrollView *)self portalLayoutGuide];
  CGFloat v13 = [v12 centerXAnchor];
  CGFloat v14 = [(BKUIPearlEnrollView *)self centerXAnchor];
  CGFloat v15 = [v13 constraintEqualToAnchor:v14 constant:v9];
  v29[2] = v15;
  double v16 = [(BKUIPearlEnrollView *)self portalLayoutGuide];
  double v17 = [v16 centerYAnchor];
  double v18 = [(BKUIPearlEnrollView *)self centerYAnchor];
  double v19 = [v17 constraintEqualToAnchor:v18 constant:v11];
  v29[3] = v19;
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [(BKUIPearlEnrollView *)self setPortalLayoutGuideConstraints:v20];

  double v21 = (void *)MEMORY[0x1E4F28DC8];
  double v22 = [(BKUIPearlEnrollView *)self portalLayoutGuideConstraints];
  [v21 activateConstraints:v22];
}

- (BOOL)expectsRunningVideoCaptureSession:(id)a3
{
  int v4 = [(BKUIPearlEnrollView *)self active];
  if (v4)
  {
    int v4 = [(BKUIPearlEnrollView *)self state];
    if (v4) {
      LOBYTE(v4) = [(BKUIPearlEnrollView *)self state] < 0xA;
    }
  }
  return v4;
}

- (void)startCapture
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_didStartCapture)
  {
    [(BKUIPearlVideoCaptureSession *)self->_videoCaptureSession startCapture];
    double v3 = _BKUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = [(BKUIPearlVideoCaptureSession *)self->_videoCaptureSession previewLayer];
      int v7 = 138412290;
      double v8 = v4;
      _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "insertSublayer:_videoCaptureSession.previewLayer = %@", (uint8_t *)&v7, 0xCu);
    }
    double v5 = [(BKUIPearlEnrollView *)self layer];
    double v6 = [(BKUIPearlVideoCaptureSession *)self->_videoCaptureSession previewLayer];
    [v5 insertSublayer:v6 atIndex:0];

    self->_didStartCapture = 1;
  }
}

- (id)_maskPathWithRadius:(double)a3 inFrame:(CGRect)a4
{
  double v5 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v6 = (void *)MEMORY[0x1E4F427D0];
  [(BKUIPearlEnrollView *)self portalCenter];
  int v7 = objc_msgSend(v6, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0);
  [v5 appendPath:v7];

  return v5;
}

- (id)_enrollMaskPathWithRadius:(double)a3
{
  [(BKUIPearlEnrollView *)self bounds];

  return -[BKUIPearlEnrollView _maskPathWithRadius:inFrame:](self, "_maskPathWithRadius:inFrame:", a3, v5, v6, v7, v8);
}

- (void)_runTutorialLoopWithDuration:(double)a3 delay:(double)a4 loopDelay:(double)a5
{
  uint64_t v9 = dispatch_get_global_queue(21, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke;
  v10[3] = &unk_1E6EA2EC0;
  v10[4] = self;
  *(double *)&v10[5] = a4;
  *(double *)&v10[6] = a3;
  *(double *)&v10[7] = a5;
  dispatch_async(v9, v10);
}

void __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 691))
  {
    double v3 = MEMORY[0x1E4F14428];
    do
    {
      if (*(_DWORD *)(v1 + 696) != 2) {
        break;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke_2;
      block[3] = &unk_1E6EA20C0;
      block[4] = *(void *)(a1 + 32);
      dispatch_sync(v3, block);
      usleep((*(double *)(a1 + 40) * 1000000.0));
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke_3;
      v12[3] = &unk_1E6EA20C0;
      v12[4] = *(void *)(a1 + 32);
      dispatch_sync(v3, v12);

      usleep(0xF4240u);
      int v4 = [MEMORY[0x1E4F1C9C8] date];
      do
      {
        double v5 = [MEMORY[0x1E4F1C9C8] date];
        [v5 timeIntervalSinceDate:v4];
        double v7 = v6;

        double v8 = v7 / *(double *)(a1 + 48) + v7 / *(double *)(a1 + 48);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke_4;
        v11[3] = &unk_1E6EA26D0;
        double v9 = v8 * 3.14159265 + -0.392699082;
        v11[4] = *(void *)(a1 + 32);
        *(double *)&v11[5] = v9;
        dispatch_async(v3, v11);

        usleep(0x493E0u);
        uint64_t v10 = *(void *)(a1 + 32);
      }
      while (*(unsigned char *)(v10 + 691) && *(_DWORD *)(v10 + 696) == 2 && v9 < 6.28318531);
      usleep((*(double *)(a1 + 56) * 1000000.0));

      uint64_t v1 = *(void *)(a1 + 32);
    }
    while (*(unsigned char *)(v1 + 691));
  }
}

uint64_t __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 728) resetPillsAnimated:1];
}

uint64_t __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 600);
  long long v5 = *MEMORY[0x1E4F1FA48];
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v2 seekToTime:&v5];
  LODWORD(v3) = 1.0;
  return [*(id *)(*(void *)(a1 + 32) + 600) playImmediatelyAtRate:v3];
}

uint64_t __68__BKUIPearlEnrollView__runTutorialLoopWithDuration_delay_loopDelay___block_invoke_4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(_DWORD *)(v1 + 696) == 2) {
    return [*(id *)(v1 + 728) fillPillsAroundAngle:1 forTutorial:*(double *)(result + 40)];
  }
  return result;
}

- (void)_nudgeIfNecessary
{
}

void __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) crossHairs];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  double v7 = __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_2;
  double v8 = &unk_1E6EA20C0;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  objc_msgSend(v2, "nudgeInDirection:smallNudgePeak:largeNudgePeak:completion:", MEMORY[0x1E4F143A8], 3221225472, __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_4, &unk_1E6EA26D0, v9, v3, MEMORY[0x1E4F143A8], 3221225472, __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_3, &unk_1E6EA20C0, v9, MEMORY[0x1E4F143A8], 3221225472, __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_2, &unk_1E6EA20C0, v9);

  ++*(void *)(*(void *)(a1 + 32) + 584);
  int v4 = [*(id *)(a1 + 32) delegate];
  [v4 enrollView:*(void *)(a1 + 32) willNudgeInDirection:*(void *)(a1 + 40) nudgeCount:*(void *)(*(void *)(a1 + 32) + 584)];
}

void __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didReachSmallNudgePeakForEnrollView:*(void *)(a1 + 32)];
}

void __40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didReachLargeNudgePeakForEnrollView:*(void *)(a1 + 32)];
}

void *__40__BKUIPearlEnrollView__nudgeIfNecessary__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setCameraBlurred:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 576) = 0;
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 enrollView:*(void *)(a1 + 32) didNudgeInDirection:*(void *)(a1 + 40) nudgeCount:*(void *)(*(void *)(a1 + 32) + 584)];

  double result = *(void **)(a1 + 32);
  if (result[73] != -1)
  {
    return (void *)[result _startNudgeTimer];
  }
  return result;
}

- (void)_startNudgeTimer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_active && !self->_nudging && (self->_state | 2) == 7)
  {
    uint64_t v3 = _BKUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int state = self->_state;
      *(_DWORD *)buf = 67109120;
      int v9 = state;
      _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "Starting nudge timer, int state = %i", buf, 8u);
    }

    [(NSTimer *)self->_nudgeTimer invalidate];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__BKUIPearlEnrollView__startNudgeTimer__block_invoke;
    v7[3] = &unk_1E6EA2E98;
    v7[4] = self;
    uint64_t v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v7 block:4.0];
    nudgeTimer = self->_nudgeTimer;
    self->_nudgeTimer = v5;
  }
}

void __39__BKUIPearlEnrollView__startNudgeTimer__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _nudgeIfNecessary];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 568);
  *(void *)(v2 + 568) = 0;
}

- (void)_stopNudgeTimer
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_nudgeTimer)
  {
    uint64_t v3 = _BKUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int state = self->_state;
      v6[0] = 67109120;
      v6[1] = state;
      _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "Stopping nudge timer, int state = %i", (uint8_t *)v6, 8u);
    }

    [(NSTimer *)self->_nudgeTimer invalidate];
    nudgeTimer = self->_nudgeTimer;
    self->_nudgeTimer = 0;
  }
}

- (BOOL)_animateCircleMaskWithPositioningGuide
{
  uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) != 1;
}

- (void)_animateToEntryAnimation
{
  pillContainer = self->_pillContainer;
  [(BKUIPearlEnrollView *)self tutorialRingRadius];
  double v5 = v4;
  [(BKUIPearlEnrollView *)self portalCenter];
  -[BKUIPearlPillContainerView setRadius:center:animated:completion:](pillContainer, "setRadius:center:animated:completion:", 0, 0, v5, v6, v7);
  if (self->_entryAnimationAlreadyRan)
  {
    [(BKUIPearlMovieLoopView *)self->_tutorialMovieView setAlphaHideOnZero:1.0];
    [(BKUIPearlPositioningGuideView *)self->_positioningGuide setAlpha:0.0];
    double v8 = _BKUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_1E4B6C000, v8, OS_LOG_TYPE_DEFAULT, "_animateToEntryAnimation: PreviewLayer's opacity will be updated to 0", v11, 2u);
    }

    int v9 = [(BKUIPearlEnrollView *)self previewLayer];
    [v9 setOpacity:0.0];

    [(BKUIPearlPillContainerView *)self->_pillContainer setAlpha:1.0];
  }
  else
  {
    self->_entryAnimationAlreadyRan = 1;
    [(BKUIPearlPillContainerView *)self->_pillContainer setAlpha:1.0];
    tutorialMovieView = self->_tutorialMovieView;
    [(BKUIPearlMovieLoopView *)tutorialMovieView setAlphaHideOnZero:1.0];
  }
}

- (void)_animateToTutorialWithCompletion:(id)a3
{
  id v7 = a3;
  BOOL entryAnimationAlreadyRan = self->_entryAnimationAlreadyRan;
  [(BKUIPearlEnrollView *)self _animateToEntryAnimation];
  double v5 = 1.0;
  if (entryAnimationAlreadyRan) {
    double v5 = 0.0;
  }
  [(BKUIPearlEnrollView *)self _runTutorialLoopWithDuration:4.5 delay:v5 loopDelay:1.5];
  double v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    double v6 = v7;
  }
}

- (void)_animateToNeedsPositioningFromState:(int)a3 withCompletion:(id)a4
{
  id v6 = a4;
  BOOL v7 = a3 == 2;
  unsigned int v8 = a3 - 4;
  [(BKUIPearlPositioningGuideView *)self->_positioningGuide setHidden:0];
  [(BKUIPearlEnrollView *)self setCameraBlurred:0];
  [(BKUIPearlEnrollView *)self _nonOccludingCircleMaskRadius];
  int v9 = -[BKUIPearlEnrollView _enrollMaskPathWithRadius:](self, "_enrollMaskPathWithRadius:");
  uint64_t v10 = v9;
  if ((a3 - 4) < 6)
  {
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      if ([(BKUIPearlEnrollView *)self needsMaskedNeedsPositionStyleEnrollment])
      {
        [(BKUIPearlPositioningGuideView *)self->_positioningGuide prepareMaskLayerForReducedMotionOpenTransition];
      }
      uint64_t v11 = MEMORY[0x1E4F42FF0];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke;
      v39[3] = &unk_1E6EA20C0;
      v39[4] = self;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_2;
      v36[3] = &unk_1E6EA2EE8;
      v36[4] = self;
      id v37 = v10;
      id v38 = v6;
      +[UIView bkui_animateWithDuration:animations:completion:](0.3, v11, v39, v36);

      CGFloat v12 = v37;
    }
    else
    {
      BOOL v13 = [(BKUIPearlEnrollView *)self _animateCircleMaskWithPositioningGuide];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_6;
      aBlock[3] = &unk_1E6EA2F38;
      BOOL v35 = v13;
      aBlock[4] = self;
      id v33 = v10;
      id v34 = v6;
      CGFloat v14 = _Block_copy(aBlock);
      objc_initWeak(&location, self);
      if (v8 > 4)
      {
        id v16 = objc_loadWeakRetained(&location);
        double v17 = [v16 pillContainer];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_14;
        v27[3] = &unk_1E6EA2568;
        id v28 = v14;
        [v17 setAllPillState:4 animated:1 completion:v27];
      }
      else
      {
        pillContainer = self->_pillContainer;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_13;
        v29[3] = &unk_1E6EA2568;
        id v30 = v14;
        [(BKUIPearlPillContainerView *)pillContainer setAllPillState:4 animated:1 completion:v29];
        id v16 = v30;
      }

      objc_destroyWeak(&location);
      CGFloat v12 = v33;
    }
LABEL_20:

    goto LABEL_21;
  }
  if (a3)
  {
    -[CAShapeLayer setPath:](self->_circleMaskLayer, "setPath:", [v9 CGPath]);
    [(UIView *)self->_circleMaskView setAlpha:1.0];
    if ([(BKUIPearlEnrollView *)self needsMaskedNeedsPositionStyleEnrollment])
    {
      BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      positioningGuide = self->_positioningGuide;
      if (IsReduceMotionEnabled) {
        [(BKUIPearlPositioningGuideView *)positioningGuide prepareMaskLayerForReducedMotionOpenTransition];
      }
      else {
        [(BKUIPearlPositioningGuideView *)positioningGuide prepareMaskLayerForStartToOpenTransition];
      }
      [(UIView *)self->_roundedRectMaskView setAlpha:1.0];
    }
    if (a3 == 2)
    {
      double v20 = [(BKUIPearlEnrollView *)self previewLayer];
      [(BKUIPearlEnrollView *)self _needsPositioningPreviewTransform];
      [v20 setTransform:v26];

      [(BKUIPearlPositioningGuideView *)self->_positioningGuide resetValuesToStart];
    }
    uint64_t v21 = MEMORY[0x1E4F42FF0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_15;
    v25[3] = &unk_1E6EA20C0;
    v25[4] = self;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_16;
    v22[3] = &unk_1E6EA2880;
    v22[4] = self;
    BOOL v24 = v7;
    id v23 = v6;
    +[UIView bkui_animateWithDuration:animations:completion:](0.3, v21, v25, v22);
    CGFloat v12 = v23;
    goto LABEL_20;
  }
  [(BKUIPearlEnrollView *)self _updateToNeedsPositionWithoutAnimationWithCompletion:v6];
LABEL_21:
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 624) setAlpha:0.0];
  uint64_t v2 = [*(id *)(a1 + 32) previewLayer];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3) {
    [v3 _needsPositioningPreviewTransform];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  [v2 setTransform:v5];

  return [*(id *)(*(void *)(a1 + 32) + 728) setAlpha:0.0];
}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 632), "setPath:", objc_msgSend(*(id *)(a1 + 40), "CGPath"));
  [*(id *)(*(void *)(a1 + 32) + 624) setAlpha:1.0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 616);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_3;
  v4[3] = &unk_1E6EA2748;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 48);
  [v3 animateToOpenValuesOverDuration:2 curve:v4 completion:0.0];
}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1E4F42FF0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_4;
  v4[3] = &unk_1E6EA20C0;
  v4[4] = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_5;
  v2[3] = &unk_1E6EA2478;
  id v3 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:animations:completion:](0.3, v1, v4, v2);
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 616) setAlpha:1.0];
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_6(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 pillRingRadius];
    id v3 = objc_msgSend(v2, "_enrollMaskPathWithRadius:");
    double v4 = +[BKUIPearlEnrollAnimationManager sharedManager];
    id v5 = *(void **)(*(void *)(a1 + 32) + 632);
    uint64_t v6 = [v5 path];
    id v7 = v3;
    uint64_t v8 = [v7 CGPath];
    uint64_t v9 = *MEMORY[0x1E4F3A488];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_7;
    v18[3] = &unk_1E6EA2180;
    uint64_t v10 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v10;
    [v4 runBasicAnimationOnLayer:v5 withDuration:@"path" keyPath:v6 fromValue:v8 toValue:1 removedOnCompletion:v9 timingFunction:0.1 completion:v18];
  }
  uint64_t v11 = MEMORY[0x1E4F42FF0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_8;
  v16[3] = &unk_1E6EA20C0;
  uint64_t v17 = *(void *)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_9;
  v12[3] = &unk_1E6EA2F10;
  v12[4] = v17;
  id v14 = *(id *)(a1 + 48);
  char v15 = *(unsigned char *)(a1 + 56);
  id v13 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:animations:completion:](0.1, v11, v16, v12);
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 632);
  uint64_t v2 = [*(id *)(a1 + 40) CGPath];

  return [v1 setPath:v2];
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 728) setAlpha:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 616);

  return [v2 setAlpha:1.0];
}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_9(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 728) resetPillsAnimated:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 616);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_10;
  v13[3] = &unk_1E6EA2748;
  v13[4] = v2;
  id v14 = *(id *)(a1 + 48);
  [v3 animateToOpenValuesOverDuration:2 curve:v13 completion:0.8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_11;
  v12[3] = &unk_1E6EA20C0;
  v12[4] = *(void *)(a1 + 32);
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.4, 0.1, MEMORY[0x1E4F42FF0], 0, v12, 0);
  if (*(unsigned char *)(a1 + 56))
  {
    double v4 = +[BKUIPearlEnrollAnimationManager sharedManager];
    id v5 = *(void **)(*(void *)(a1 + 32) + 632);
    uint64_t v6 = [v5 path];
    uint64_t v7 = [*(id *)(a1 + 40) CGPath];
    uint64_t v8 = *MEMORY[0x1E4F3A488];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_12;
    v10[3] = &unk_1E6EA2180;
    uint64_t v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    [v4 runBasicAnimationOnLayer:v5 withDuration:@"path" keyPath:v6 fromValue:v7 toValue:1 removedOnCompletion:v8 timingFunction:0.5 completion:v10];
  }
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_10(uint64_t a1, int a2)
{
  if (a2 && !UIAccessibilityIsReduceMotionEnabled()) {
    [*(id *)(*(void *)(a1 + 32) + 616) breathe];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_11(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) previewLayer];
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    [v3 _needsPositioningPreviewTransform];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  [v2 setTransform:v4];
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_12(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 632);
  uint64_t v2 = [*(id *)(a1 + 40) CGPath];

  return [v1 setPath:v2];
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_15(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 616);

  return [v2 setAlpha:1.0];
}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_16(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1E4F42FF0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_17;
  v5[3] = &unk_1E6EA20C0;
  uint64_t v6 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_128;
  v2[3] = &unk_1E6EA2880;
  char v4 = *(unsigned char *)(a1 + 48);
  void v2[4] = v6;
  id v3 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:animations:completion:](0.3, v1, v5, v2);
}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_17(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 736) setAlphaHideOnZero:0.0];
  [*(id *)(*(void *)(a1 + 32) + 728) setAlpha:0.0];
  uint64_t v2 = _BKUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "_animateToNeedsPositioningFromState: PreviewLayer's opacity will be updated to 1", v5, 2u);
  }

  id v3 = [*(id *)(a1 + 32) previewLayer];
  LODWORD(v4) = 1.0;
  [v3 setOpacity:v4];
}

void __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_128(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(v1 + 616);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_2_129;
    v5[3] = &unk_1E6EA2748;
    void v5[4] = v1;
    id v6 = *(id *)(a1 + 40);
    [v2 animateToOpenValuesOverDuration:2 curve:v5 completion:0.8];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      double v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
}

uint64_t __74__BKUIPearlEnrollView__animateToNeedsPositioningFromState_withCompletion___block_invoke_2_129(uint64_t a1, int a2)
{
  if (a2 && !UIAccessibilityIsReduceMotionEnabled()) {
    [*(id *)(*(void *)(a1 + 32) + 616) breathe];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_updateToNeedsPositionWithoutAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  [(BKUIPearlPositioningGuideView *)self->_positioningGuide setHidden:0];
  [(BKUIPearlEnrollView *)self setCameraBlurred:0];
  [(BKUIPearlEnrollView *)self _nonOccludingCircleMaskRadius];
  id v5 = -[BKUIPearlEnrollView _enrollMaskPathWithRadius:](self, "_enrollMaskPathWithRadius:");
  circleMaskLayer = self->_circleMaskLayer;
  id v7 = v5;
  -[CAShapeLayer setPath:](circleMaskLayer, "setPath:", [v7 CGPath]);
  [(UIView *)self->_circleMaskView setAlpha:1.0];
  if ([(BKUIPearlEnrollView *)self needsMaskedNeedsPositionStyleEnrollment])
  {
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    positioningGuide = self->_positioningGuide;
    if (IsReduceMotionEnabled) {
      [(BKUIPearlPositioningGuideView *)positioningGuide prepareMaskLayerForReducedMotionOpenTransition];
    }
    else {
      [(BKUIPearlPositioningGuideView *)positioningGuide prepareMaskLayerForStartToOpenTransition];
    }
    [(UIView *)self->_roundedRectMaskView setAlpha:1.0];
  }
  uint64_t v10 = [(BKUIPearlEnrollView *)self previewLayer];
  [(BKUIPearlEnrollView *)self _needsPositioningPreviewTransform];
  [v10 setTransform:v19];

  [(BKUIPearlPositioningGuideView *)self->_positioningGuide resetValuesToStart];
  [(UILabel *)self->_repositionPhoneLabel setAlpha:0.0];
  [(BKUIPearlPositioningGuideView *)self->_positioningGuide setAlpha:1.0];
  [(BKUIPearlMovieLoopView *)self->_tutorialMovieView setAlphaHideOnZero:0.0];
  [(BKUIPearlPillContainerView *)self->_pillContainer setAlpha:0.0];
  id v11 = _BKUILoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, v11, OS_LOG_TYPE_DEFAULT, "_updateToNeedsPositionWithoutAnimationWithCompletion: PreviewLayer's opacity will be updated to 1", buf, 2u);
  }

  CGFloat v12 = [(BKUIPearlEnrollView *)self previewLayer];
  LODWORD(v13) = 1.0;
  [v12 setOpacity:v13];

  id v14 = self->_positioningGuide;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__BKUIPearlEnrollView__updateToNeedsPositionWithoutAnimationWithCompletion___block_invoke;
  v16[3] = &unk_1E6EA2748;
  void v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  [(BKUIPearlPositioningGuideView *)v14 animateToOpenValuesOverDuration:2 curve:v16 completion:0.0];
}

uint64_t __76__BKUIPearlEnrollView__updateToNeedsPositionWithoutAnimationWithCompletion___block_invoke(uint64_t a1, int a2)
{
  if (a2 && !UIAccessibilityIsReduceMotionEnabled()) {
    [*(id *)(*(void *)(a1 + 32) + 616) breathe];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_animateToNeedsCenterBinWithCompletion:(id)a3
{
  id v4 = a3;
  self->_progressiveBlur = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6EA25E0;
  aBlock[4] = self;
  id v5 = v4;
  id v21 = v5;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v6[2](v6);
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_5;
    v18[3] = &unk_1E6EA25E0;
    v18[4] = self;
    id v7 = v6;
    id v19 = v7;
    uint64_t v8 = _Block_copy(v18);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_7;
    v15[3] = &unk_1E6EA2308;
    v15[4] = self;
    id v9 = v8;
    id v16 = v9;
    id v17 = v7;
    uint64_t v10 = _Block_copy(v15);
    id v11 = (void (**)(void))_Block_copy(v10);
    CGFloat v12 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      id v14 = (void (**)(void))_Block_copy(v9);

      id v11 = v14;
    }
    v11[2](v11);
  }
}

uint64_t __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_2;
  block[3] = &unk_1E6EA20C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 696) == 4)
  {
    [(id)v2 _updateRaiseLowerGuidanceLabelIfNeededForPitch:*(double *)(v2 + 440)];
    [*(id *)(a1 + 32) setNeedsLayout];
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v3 = *(double **)(a1 + 32);
    [v3 _progressiveBlurAmountForPitch:v3[55]];
    double v5 = v4 + 1.0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_3;
    v6[3] = &unk_1E6EA2098;
    objc_copyWeak(&v7, &location);
    [v3 setCameraBlurAmount:1 useShade:v6 duration:v5 completion:1.0];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && *((_DWORD *)WeakRetained + 174) == 4)
  {
    *((unsigned char *)WeakRetained + 432) = 1;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_4;
    v3[3] = &unk_1E6EA20C0;
    v3[4] = WeakRetained;
    +[UIView bkui_animateWithDuration:animations:](0.5, MEMORY[0x1E4F42FF0], v3);
  }
}

uint64_t __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:0.5];
}

void __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 616);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_6;
  v3[3] = &unk_1E6EA2748;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 animateToOpenValuesOverDuration:0 curve:v3 completion:0.4];
}

uint64_t __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_6(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(*(void *)(a1 + 32) + 616) breathe];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 616);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_8;
  v3[3] = &unk_1E6EA2450;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 animateToPopOutValuesOverDuration:v3 completion:0.4];
}

uint64_t __62__BKUIPearlEnrollView__animateToNeedsCenterBinWithCompletion___block_invoke_8(uint64_t a1, int a2)
{
  uint64_t v2 = 40;
  if (a2) {
    uint64_t v2 = 32;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + v2) + 16))();
}

- (void)_animateToScanningStateWithCompletion:(id)a3
{
  id v4 = a3;
  [(BKUIPearlEnrollView *)self setCameraBlurred:0];
  pillContainer = self->_pillContainer;
  if (UIAccessibilityIsReduceMotionEnabled()) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 4;
  }
  [(BKUIPearlPillContainerView *)self->_pillContainer alpha];
  [(BKUIPearlPillContainerView *)pillContainer setAllPillState:v6 animated:v7 > 0.0 completion:0];
  uint64_t v8 = self->_pillContainer;
  [(BKUIPearlEnrollView *)self pillRingRadius];
  double v10 = v9;
  [(BKUIPearlEnrollView *)self portalCenter];
  -[BKUIPearlPillContainerView setRadius:center:animated:completion:](v8, "setRadius:center:animated:completion:", 0, 0, v10, v11, v12);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  void v33[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke;
  v33[3] = &unk_1E6EA20C0;
  v33[4] = self;
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.3, 0.0, MEMORY[0x1E4F42FF0], 516, v33, 0);
  BOOL v13 = [(BKUIPearlEnrollView *)self _animateCircleMaskWithPositioningGuide];
  [(BKUIPearlEnrollView *)self portalRadius];
  -[BKUIPearlEnrollView _enrollMaskPathWithRadius:](self, "_enrollMaskPathWithRadius:");
  id v14 = objc_claimAutoreleasedReturnValue();
  id v15 = (const CGPath *)[v14 CGPath];

  if (UIAccessibilityIsReduceMotionEnabled())
  {
    [(BKUIPearlPositioningGuideView *)self->_positioningGuide setAlpha:0.0];
    if (!CGPathEqualToPath([(CAShapeLayer *)self->_circleMaskLayer path], v15))
    {
      [(UIView *)self->_circleMaskView setAlpha:0.0];
      [(CAShapeLayer *)self->_circleMaskLayer setPath:v15];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_2;
      v32[3] = &unk_1E6EA20C0;
      v32[4] = self;
      +[UIView bkui_animateWithDuration:animations:](0.4, MEMORY[0x1E4F42FF0], v32);
    }
  }
  else if (v13)
  {
    id v16 = +[BKUIPearlEnrollAnimationManager sharedManager];
    circleMaskLayer = self->_circleMaskLayer;
    uint64_t v18 = [(CAShapeLayer *)circleMaskLayer path];
    uint64_t v19 = *MEMORY[0x1E4F3A498];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_3;
    v31[3] = &unk_1E6EA26D0;
    v31[4] = self;
    void v31[5] = v15;
    [v16 runBasicAnimationOnLayer:circleMaskLayer withDuration:@"path" keyPath:v18 fromValue:v15 toValue:1 removedOnCompletion:v19 timingFunction:0.5 completion:v31];
  }
  positioningGuide = self->_positioningGuide;
  [(BKUIPearlEnrollView *)self portalCenter];
  double v22 = v21;
  double v24 = v23;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_4;
  v28[3] = &unk_1E6EA2880;
  BOOL v30 = v13;
  v28[4] = self;
  id v29 = v4;
  id v25 = v4;
  -[BKUIPearlPositioningGuideView animateToFinishedValuesOverDuration:center:completion:](positioningGuide, "animateToFinishedValuesOverDuration:center:completion:", v28, 0.5, v22, v24);
  dispatch_time_t v26 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_8;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_after(v26, MEMORY[0x1E4F14428], block);
}

uint64_t __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:0.0];
}

uint64_t __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 624) setAlpha:1.0];
}

uint64_t __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 632) setPath:*(void *)(a1 + 40)];
}

void __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_4(uint64_t a1)
{
  if (!UIAccessibilityIsReduceMotionEnabled() && !*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 pillRingRadius];
    uint64_t v3 = objc_msgSend(v2, "_enrollMaskPathWithRadius:");
    id v4 = *(void **)(*(void *)(a1 + 32) + 632);
    id v15 = v3;
    objc_msgSend(v4, "setPath:", objc_msgSend(v15, "CGPath"));
    id v5 = *(void **)(a1 + 32);
    [v5 portalRadius];
    uint64_t v6 = objc_msgSend(v5, "_enrollMaskPathWithRadius:");
    double v7 = +[BKUIPearlEnrollAnimationManager sharedManager];
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 632);
    uint64_t v9 = [v8 path];
    id v10 = v6;
    uint64_t v11 = [v10 CGPath];
    uint64_t v12 = *MEMORY[0x1E4F3A498];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_5;
    v20[3] = &unk_1E6EA2180;
    v20[4] = *(void *)(a1 + 32);
    id v21 = v10;
    id v13 = v10;
    [v7 runBasicAnimationOnLayer:v8 withDuration:@"path" keyPath:v9 fromValue:v11 toValue:1 removedOnCompletion:v12 timingFunction:0.2 completion:v20];
  }
  uint64_t v14 = MEMORY[0x1E4F42FF0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_6;
  v18[3] = &unk_1E6EA20C0;
  uint64_t v19 = *(void *)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_7;
  v16[3] = &unk_1E6EA2748;
  void v16[4] = v19;
  id v17 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:animations:completion:](0.2, v14, v18, v16);
}

uint64_t __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 632);
  uint64_t v2 = [*(id *)(a1 + 40) CGPath];

  return [v1 setPath:v2];
}

uint64_t __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_6(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 728) setAlpha:1.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 616);

  return [v2 setAlpha:0.0];
}

uint64_t __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_7(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 616) setHidden:1];
  char v2 = [*(id *)(*(void *)(a1 + 32) + 728) unstashPillStatesIfNeededAnimated:1];
  if (!UIAccessibilityIsReduceMotionEnabled() && (v2 & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 728) setAllPillState:2 animated:1 completion:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_8(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_9;
  v1[3] = &unk_1E6EA20C0;
  v1[4] = *(void *)(a1 + 32);
  +[UIView bkui_animateWithDuration:animations:](0.4, MEMORY[0x1E4F42FF0], v1);
}

void __61__BKUIPearlEnrollView__animateToScanningStateWithCompletion___block_invoke_9(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) previewLayer];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3) {
    [v3 _scanningAndPartialCapturePreviewTransform];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  [v2 setTransform:v4];
}

- (void)_animateToFirstScanWithCompletion:(id)a3
{
  pillContainer = self->_pillContainer;
  id v5 = a3;
  [(BKUIPearlPillContainerView *)pillContainer setAlpha:0.0];
  [(BKUIPearlEnrollView *)self _animateToScanningStateWithCompletion:v5];
}

- (void)_animateToFirstScanCompleteWithCompletion:(id)a3
{
  pillContainer = self->_pillContainer;
  id v10 = a3;
  [(BKUIPearlPillContainerView *)pillContainer setAllPillState:5 animated:1 completion:0];
  [(BKUIPearlEnrollView *)self setCameraBlurred:1];
  id v5 = self->_pillContainer;
  [(BKUIPearlEnrollView *)self completedRingRadius];
  double v7 = v6;
  [(BKUIPearlEnrollView *)self portalCenter];
  -[BKUIPearlPillContainerView setRadius:center:animated:completion:](v5, "setRadius:center:animated:completion:", 1, v10, v7, v8, v9);
}

- (void)_animateToScanCompleteWithCompletion:(id)a3
{
  pillContainer = self->_pillContainer;
  id v10 = a3;
  [(BKUIPearlPillContainerView *)pillContainer setAllPillState:5 animated:1 completion:0];
  [(BKUIPearlEnrollView *)self setCameraBlurred:1];
  id v5 = self->_pillContainer;
  [(BKUIPearlEnrollView *)self completedRingRadius];
  double v7 = v6;
  [(BKUIPearlEnrollView *)self portalCenter];
  -[BKUIPearlPillContainerView setRadius:center:animated:completion:](v5, "setRadius:center:animated:completion:", 1, v10, v7, v8, v9);
}

- (void)_animateToFinishedWithCompletion:(id)a3
{
  id v14 = a3;
  if (![(BKUIPearlEnrollView *)self squareNeedsPositionLayout])
  {
    [(BKUIPearlEnrollView *)self bounds];
    -[BKUIPearlEnrollView _maskPathWithRadius:inFrame:](self, "_maskPathWithRadius:inFrame:", 0.001, v4, v5, v6, v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 CGPath];

    id v10 = +[BKUIPearlEnrollAnimationManager sharedManager];
    circleMaskLayer = self->_circleMaskLayer;
    [(BKUIPearlEnrollView *)self portalRadius];
    -[BKUIPearlEnrollView _enrollMaskPathWithRadius:](self, "_enrollMaskPathWithRadius:");
    id v12 = objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 CGPath];
    [v10 runBasicAnimationOnLayer:circleMaskLayer withDuration:@"path" keyPath:v13 fromValue:v9 toValue:0 removedOnCompletion:*MEMORY[0x1E4F3A498] timingFunction:0.3 completion:v14];

    [(CAShapeLayer *)self->_circleMaskLayer setPath:v9];
  }
}

- (void)_animateToPartialCaptureWithCompletion:(id)a3
{
  id v4 = a3;
  [(BKUIPearlEnrollView *)self setCameraBlurred:1];
  [(BKUIPearlPillContainerView *)self->_pillContainer setAllPillState:5 animated:1 completion:0];
  pillContainer = self->_pillContainer;
  [(BKUIPearlEnrollView *)self pillRingRadius];
  double v7 = v6;
  [(BKUIPearlEnrollView *)self portalCenter];
  -[BKUIPearlPillContainerView setRadius:center:animated:completion:](pillContainer, "setRadius:center:animated:completion:", 1, 0, v7, v8, v9);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke;
  v30[3] = &unk_1E6EA20C0;
  void v30[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:516 delay:v30 options:0 animations:0.3 completion:0.0];
  BOOL v10 = [(BKUIPearlEnrollView *)self _animateCircleMaskWithPositioningGuide];
  [(BKUIPearlEnrollView *)self portalRadius];
  -[BKUIPearlEnrollView _enrollMaskPathWithRadius:](self, "_enrollMaskPathWithRadius:");
  id v11 = objc_claimAutoreleasedReturnValue();
  id v12 = (const CGPath *)[v11 CGPath];

  if (UIAccessibilityIsReduceMotionEnabled())
  {
    [(BKUIPearlPositioningGuideView *)self->_positioningGuide setAlpha:0.0];
    if (!CGPathEqualToPath([(CAShapeLayer *)self->_circleMaskLayer path], v12))
    {
      [(UIView *)self->_circleMaskView setAlpha:0.0];
      [(CAShapeLayer *)self->_circleMaskLayer setPath:v12];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_2;
      v29[3] = &unk_1E6EA20C0;
      void v29[4] = self;
      +[UIView bkui_animateWithDuration:animations:](0.4, MEMORY[0x1E4F42FF0], v29);
    }
  }
  else if (v10)
  {
    uint64_t v13 = +[BKUIPearlEnrollAnimationManager sharedManager];
    circleMaskLayer = self->_circleMaskLayer;
    uint64_t v15 = [(CAShapeLayer *)circleMaskLayer path];
    uint64_t v16 = *MEMORY[0x1E4F3A498];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_3;
    v28[3] = &unk_1E6EA26D0;
    v28[4] = self;
    void v28[5] = v12;
    [v13 runBasicAnimationOnLayer:circleMaskLayer withDuration:@"path" keyPath:v15 fromValue:v12 toValue:1 removedOnCompletion:v16 timingFunction:0.5 completion:v28];
  }
  positioningGuide = self->_positioningGuide;
  [(BKUIPearlEnrollView *)self portalCenter];
  double v19 = v18;
  double v21 = v20;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_4;
  v25[3] = &unk_1E6EA2880;
  BOOL v27 = v10;
  v25[4] = self;
  id v26 = v4;
  id v22 = v4;
  -[BKUIPearlPositioningGuideView animateToFinishedValuesOverDuration:center:completion:](positioningGuide, "animateToFinishedValuesOverDuration:center:completion:", v25, 0.5, v19, v21);
  dispatch_time_t v23 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_8;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_after(v23, MEMORY[0x1E4F14428], block);
}

uint64_t __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:0.0];
}

uint64_t __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 624) setAlpha:1.0];
}

uint64_t __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 632) setPath:*(void *)(a1 + 40)];
}

void __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_4(uint64_t a1)
{
  if (!UIAccessibilityIsReduceMotionEnabled() && !*(unsigned char *)(a1 + 48))
  {
    char v2 = *(void **)(a1 + 32);
    [v2 pillRingRadius];
    uint64_t v3 = objc_msgSend(v2, "_enrollMaskPathWithRadius:");
    id v4 = *(void **)(*(void *)(a1 + 32) + 632);
    id v15 = v3;
    objc_msgSend(v4, "setPath:", objc_msgSend(v15, "CGPath"));
    double v5 = *(void **)(a1 + 32);
    [v5 portalRadius];
    double v6 = objc_msgSend(v5, "_enrollMaskPathWithRadius:");
    double v7 = +[BKUIPearlEnrollAnimationManager sharedManager];
    double v8 = *(void **)(*(void *)(a1 + 32) + 632);
    uint64_t v9 = [v8 path];
    id v10 = v6;
    uint64_t v11 = [v10 CGPath];
    uint64_t v12 = *MEMORY[0x1E4F3A498];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_5;
    v20[3] = &unk_1E6EA2180;
    v20[4] = *(void *)(a1 + 32);
    id v21 = v10;
    id v13 = v10;
    [v7 runBasicAnimationOnLayer:v8 withDuration:@"path" keyPath:v9 fromValue:v11 toValue:1 removedOnCompletion:v12 timingFunction:0.2 completion:v20];
  }
  uint64_t v14 = MEMORY[0x1E4F42FF0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_6;
  v18[3] = &unk_1E6EA20C0;
  uint64_t v19 = *(void *)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_7;
  v16[3] = &unk_1E6EA2748;
  void v16[4] = v19;
  id v17 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:animations:completion:](0.2, v14, v18, v16);
}

uint64_t __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 632);
  uint64_t v2 = [*(id *)(a1 + 40) CGPath];

  return [v1 setPath:v2];
}

uint64_t __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_6(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 728) setAlpha:1.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 616);

  return [v2 setAlpha:0.0];
}

uint64_t __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_7(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 616) setHidden:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_8(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_9;
  v1[3] = &unk_1E6EA20C0;
  v1[4] = *(void *)(a1 + 32);
  +[UIView bkui_animateWithDuration:animations:](0.4, MEMORY[0x1E4F42FF0], v1);
}

void __62__BKUIPearlEnrollView__animateToPartialCaptureWithCompletion___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) previewLayer];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3) {
    [v3 _scanningAndPartialCapturePreviewTransform];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  [v2 setTransform:v4];
}

- (CGSize)tutorialMovieSize
{
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && ![(BKUIPearlEnrollView *)self inSheet]) {
    double v5 = 200.0;
  }
  else {
    double v5 = 133.333333;
  }
  double v6 = v5;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (double)portalRadius
{
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && ![(BKUIPearlEnrollView *)self inSheet])
  {
    positioningGuide = self->_positioningGuide;
    [(BKUIPearlPositioningGuideView *)positioningGuide minimumMaskLayerDistanceFromCenter];
  }
  else
  {
    double v5 = +[BKUIDevice sharedInstance];
    if ([v5 isZoomEnabled])
    {
      double v6 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v7 = [v6 userInterfaceIdiom] == 0;

      double v8 = dbl_1E4BD1A80[v7];
    }
    else
    {

      double v8 = 150.0;
    }
    if ([(BKUIPearlEnrollView *)self squareNeedsPositionLayout])
    {
      uint64_t v9 = +[BKUIDevice sharedInstance];
      int v10 = [v9 isZoomEnabled];

      if (v10)
      {
        uint64_t v11 = +[BKUIDevice sharedInstance];
        int v12 = [v11 mainScreenClass];
        [(BKUIPearlEnrollView *)self bounds];
        double v14 = -45.0;
        if (v12 == 31) {
          double v14 = -60.0;
        }
        double v8 = v13 * 0.5 + v14;
      }
      else
      {
        [(BKUIPearlEnrollView *)self bounds];
        return v17 * 0.5 + -48.6 + -5.0;
      }
    }
    return v8;
  }
  return result;
}

- (double)_nonOccludingCircleMaskRadius
{
  [(BKUIPearlEnrollView *)self bounds];
  double v4 = v3;
  double v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return v4;
  }
  [(BKUIPearlPositioningGuideView *)self->_positioningGuide maximumMaskLayerDistanceFromCenter];
  return sqrt(v7 * v7 + v7 * v7);
}

- (double)tutorialRingRadius
{
  double v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && ![(BKUIPearlEnrollView *)self inSheet]) {
    return 172.5;
  }
  else {
    return 116.0;
  }
}

- (double)pillRingRadius
{
  [(BKUIPearlEnrollView *)self portalRadius];
  return v2 + 4.0;
}

- (CGPoint)portalCenter
{
  [(BKUIPearlEnrollView *)self bounds];
  CGFloat MidX = CGRectGetMidX(v7);
  [(BKUIPearlEnrollView *)self bounds];
  double MidY = CGRectGetMidY(v8);
  double v5 = MidX;
  result.double y = MidY;
  result.double x = v5;
  return result;
}

- (CGPoint)portalOffset
{
  [(BKUIPearlEnrollView *)self portalCenter];
  double v4 = v3;
  double v6 = v5;
  [(BKUIPearlEnrollView *)self bounds];
  double v7 = v4 - CGRectGetMidX(v11);
  [(BKUIPearlEnrollView *)self bounds];
  double v8 = v6 - CGRectGetMidY(v12);
  double v9 = v7;
  result.double y = v8;
  result.double x = v9;
  return result;
}

- (double)_previewZoomLevel
{
  double v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0.8;
  }
  double v5 = [(BKUIPearlEnrollView *)self previewLayer];
  [v5 bounds];
  double v7 = v6;

  [(BKUIPearlEnrollView *)self portalRadius];
  return (v8 + 5.0 + v8 + 5.0) / v7;
}

- (CATransform3D)_scanningAndPartialCapturePreviewTransform
{
  [(BKUIPearlEnrollView *)self portalOffset];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [(BKUIPearlEnrollView *)self _previewZoomLevel];
  memset(&v14, 0, sizeof(v14));
  CATransform3DMakeScale(&v14, v9, v9, v9);
  memset(&v13, 0, sizeof(v13));
  CATransform3DMakeTranslation(&v13, v6, v8, 0.0);
  CATransform3D a = v14;
  CATransform3D v11 = v13;
  return CATransform3DConcat(retstr, &a, &v11);
}

- (CATransform3D)_needsPositioningPreviewTransform
{
  double v5 = (_OWORD *)MEMORY[0x1E4F39B10];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&retstr->m33 = v6;
  long long v7 = v5[7];
  *(_OWORD *)&retstr->m41 = v5[6];
  *(_OWORD *)&retstr->m43 = v7;
  long long v8 = v5[1];
  *(_OWORD *)&retstr->m11 = *v5;
  *(_OWORD *)&retstr->m13 = v8;
  long long v9 = v5[3];
  *(_OWORD *)&retstr->m21 = v5[2];
  *(_OWORD *)&retstr->m23 = v9;
  int v10 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(BKUIPearlEnrollView *)self portalOffset];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(BKUIPearlEnrollView *)self _previewZoomLevel];
    double v18 = v17;
    [(BKUIPearlVideoCaptureSession *)self->_videoCaptureSession additionalPreviewScalingAllowedByCameraFormat];
    memset(&v28, 0, sizeof(v28));
    CATransform3DMakeScale(&v28, v18 * v19, v18 * v19, v18 * v19);
    memset(&v27, 0, sizeof(v27));
    CATransform3DMakeTranslation(&v27, v14, v16, 0.0);
    CATransform3D a = v28;
    CATransform3D v24 = v27;
    CGPoint result = CATransform3DConcat(&v26, &a, &v24);
    long long v20 = *(_OWORD *)&v26.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v26.m31;
    *(_OWORD *)&retstr->m33 = v20;
    long long v21 = *(_OWORD *)&v26.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v26.m41;
    *(_OWORD *)&retstr->m43 = v21;
    long long v22 = *(_OWORD *)&v26.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v26.m11;
    *(_OWORD *)&retstr->m13 = v22;
    long long v23 = *(_OWORD *)&v26.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v26.m21;
    *(_OWORD *)&retstr->m23 = v23;
  }
  return result;
}

- (void)setMovieViewHidden:(BOOL)a3
{
  tutorialMovieView = self->_tutorialMovieView;
  if (a3) {
    [(BKUIPearlMovieLoopView *)tutorialMovieView hideAVPlayerReplaceWithSnapshot];
  }
  else {
    [(BKUIPearlMovieLoopView *)tutorialMovieView unhideAVPlayerRemoveSnapshot];
  }
}

- (BOOL)needsMaskedNeedsPositionStyleEnrollment
{
  double v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 1;
  }

  return [(BKUIPearlEnrollView *)self squareNeedsPositionLayout];
}

- (void)setPillsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(BKUIPearlEnrollView *)self pillContainer];
  id v6 = v4;
  double v5 = 1.0;
  if (v3) {
    double v5 = 0.0;
  }
  [v4 setAlpha:v5];
}

- (void)setCrosshairsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(BKUIPearlEnrollView *)self crossHairs];
  id v6 = v4;
  double v5 = 1.0;
  if (v3) {
    double v5 = 0.0;
  }
  [v4 setAlpha:v5];
}

- (BKUIPearlEnrollViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKUIPearlEnrollViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isTransitioningToState
{
  return self->_transitioningToState;
}

- (void)setTransitioningToState:(BOOL)a3
{
  self->_transitioningToState = a3;
}

- (BKUIPearlEnrollViewStateTransitionDelegate)transitionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionDelegate);

  return (BKUIPearlEnrollViewStateTransitionDelegate *)WeakRetained;
}

- (void)setTransitionDelegate:(id)a3
{
}

- (BOOL)debugOverlayVisible
{
  return self->_debugOverlayVisible;
}

- (UILayoutGuide)portalLayoutGuide
{
  return self->_portalLayoutGuide;
}

- (BKUIPearlPillContainerView)pillContainer
{
  return self->_pillContainer;
}

- (void)setPillContainer:(id)a3
{
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (void)setInSheet:(BOOL)a3
{
  self->_inSheet = a3;
}

- (BKUIPearlMovieLoopView)tutorialMovieView
{
  return self->_tutorialMovieView;
}

- (void)setTutorialMovieView:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_int state = a3;
}

- (NSArray)portalLayoutGuideConstraints
{
  return self->_portalLayoutGuideConstraints;
}

- (void)setPortalLayoutGuideConstraints:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)squareNeedsPositionLayout
{
  return self->_squareNeedsPositionLayout;
}

- (void)setSquareNeedsPositionLayout:(BOOL)a3
{
  self->_squareNeedsPositionLayout = a3;
}

- (BKUIPearlCrossHairsView)crossHairs
{
  return self->_crossHairs;
}

- (void)setCrossHairs:(id)a3
{
}

- (OBAnimationView)animationView
{
  return self->_animationView;
}

- (void)setAnimationView:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (NSLayoutConstraint)successAnimationViewCenterYConstraint
{
  return self->_successAnimationViewCenterYConstraint;
}

- (void)setSuccessAnimationViewCenterYConstraint:(id)a3
{
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_successAnimationViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_crossHairs, 0);
  objc_storeStrong((id *)&self->_portalLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_tutorialMovieView, 0);
  objc_storeStrong((id *)&self->_pillContainer, 0);
  objc_storeStrong((id *)&self->_portalLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_transitionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_raiseLowerGuidanceDelayTimer, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_roundedRectMaskLayer, 0);
  objc_storeStrong((id *)&self->_roundedRectMaskView, 0);
  objc_storeStrong((id *)&self->_circleMaskLayer, 0);
  objc_storeStrong((id *)&self->_circleMaskView, 0);
  objc_storeStrong((id *)&self->_positioningGuide, 0);
  objc_storeStrong((id *)&self->_tutorialPlayer, 0);
  objc_storeStrong((id *)&self->_nudgeTimer, 0);
  objc_storeStrong((id *)&self->_stateStart, 0);
  objc_storeStrong((id *)&self->_debugStatusInformation, 0);
  objc_storeStrong((id *)&self->_debugTemplateInformation, 0);
  objc_storeStrong((id *)&self->_debugFrameInformation, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_repositionPhoneLabel, 0);
  objc_storeStrong((id *)&self->_cameraShadeView, 0);

  objc_storeStrong((id *)&self->_videoCaptureSession, 0);
}

@end