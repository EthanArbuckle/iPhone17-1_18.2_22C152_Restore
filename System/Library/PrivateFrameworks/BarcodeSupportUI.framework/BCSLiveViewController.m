@interface BCSLiveViewController
- (BCSActionCoordinator)actionCoordinator;
- (BCSLiveViewController)initWithPreviewLayer:(id)a3;
- (BCSLiveViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (CGPoint)_convertLogicalPoint:(CGPoint)a3 inBounds:(CGRect)a4;
- (CGPoint)_convertPointFromCaptureDeviceLocation:(CGPoint)a3;
- (CGPoint)_convertPointToCaptureDeviceLocation:(CGPoint)a3;
- (CGPoint)_normalize:(CGPoint)a3 inBounds:(CGRect)a4;
- (CGPoint)_pointFromNormalizedPoint:(CGPoint)a3;
- (id)_perspectiveCorrectedImage:(id)a3 imageQuad:(id)a4;
- (id)actionCoordinatorViewForContextMenu:(id)a3;
- (void)_applyTorchButtonRotationForDeviceOrientation;
- (void)_continueToPopAnimationForDetectedCode:(id)a3;
- (void)_layOutWithPreviewSize:(CGSize)a3 angle:(double)a4 isPortrait:(BOOL)a5;
- (void)_liveViewTapped;
- (void)_setTorchButtonPosition;
- (void)_updateCoacheMessageWithString:(id)a3;
- (void)actionCoordinator:(id)a3 didFinishPerformingAction:(id)a4;
- (void)actionCoordinator:(id)a3 didParseCode:(id)a4 withAction:(id)a5;
- (void)actionCoordinator:(id)a3 willDismissViewController:(id)a4;
- (void)cameraDeviceDidChange;
- (void)compensateForInterfaceOrientationInLiveView:(int64_t)a3 referenceSize:(CGSize)a4;
- (void)compensateForVideoRotationAngleInLiveView:(double)a3;
- (void)didCaptureVisualCode:(id)a3 image:(id)a4 shouldAnimate:(BOOL)a5;
- (void)resetUIAndStartCapturing:(BOOL)a3;
- (void)rotationAnimationDidFinish;
- (void)rotationAnimationWillStart;
- (void)sessionControlsDidBecomeActive:(id)a3;
- (void)sessionControlsDidBecomeInactive:(id)a3;
- (void)setDelegate:(id)a3;
- (void)torchActivenessChangedTo:(BOOL)a3;
- (void)torchAvailabilityChangedTo:(BOOL)a3;
- (void)torchButtonView:(id)a3 torchModeChangedTo:(BOOL)a4;
- (void)updateQRCodeAvailability:(int64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation BCSLiveViewController

- (BCSLiveViewController)initWithPreviewLayer:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSLiveViewController;
  v6 = [(BCSLiveViewController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_previewLayer, a3);
    v8 = objc_alloc_init(BCSActionCoordinator);
    actionCoordinator = v7->_actionCoordinator;
    v7->_actionCoordinator = v8;

    [(BCSActionCoordinator *)v7->_actionCoordinator setDelegate:v7];
    v10 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  v66[10] = *MEMORY[0x263EF8340];
  v65.receiver = self;
  v65.super_class = (Class)BCSLiveViewController;
  [(BCSLiveViewController *)&v65 viewDidLoad];
  v3 = objc_alloc_init(BCSPreviewContainerView);
  previewContainerView = self->_previewContainerView;
  self->_previewContainerView = v3;

  [(BCSPreviewContainerView *)self->_previewContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BCSPreviewContainerView *)self->_previewContainerView setAccessibilityIgnoresInvertColors:1];
  id v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__liveViewTapped];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v5;

  [(BCSPreviewContainerView *)self->_previewContainerView addGestureRecognizer:self->_tapGestureRecognizer];
  v7 = [(BCSLiveViewController *)self view];
  [v7 addSubview:self->_previewContainerView];

  [(BCSPreviewContainerView *)self->_previewContainerView setPreviewLayer:self->_previewLayer];
  v8 = [BCSSubjectIndicatorView alloc];
  v9 = -[BCSSubjectIndicatorView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  focusIndicator = self->_focusIndicator;
  self->_focusIndicator = v9;

  [(BCSSubjectIndicatorView *)self->_focusIndicator setInactive:1];
  [(BCSSubjectIndicatorView *)self->_focusIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
  -[BCSSubjectIndicatorView sizeThatFits:](self->_focusIndicator, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  -[BCSSubjectIndicatorView setBounds:](self->_focusIndicator, "setBounds:", 0.0, 0.0, v11, v12);
  v13 = [(BCSLiveViewController *)self view];
  [v13 center];
  -[BCSSubjectIndicatorView setCenter:](self->_focusIndicator, "setCenter:");

  v14 = [(BCSLiveViewController *)self view];
  [v14 addSubview:self->_focusIndicator];

  v15 = objc_alloc_init(BCSTorchButtonView);
  torchButtonView = self->_torchButtonView;
  self->_torchButtonView = v15;

  [(BCSTorchButtonView *)self->_torchButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BCSTorchButtonView *)self->_torchButtonView setDelegate:self];
  v17 = [(BCSLiveViewController *)self delegate];
  -[BCSTorchButtonView setHidden:](self->_torchButtonView, "setHidden:", [v17 liveViewControllerTorchModeSupported:self] ^ 1);

  v18 = [(BCSLiveViewController *)self view];
  [v18 addSubview:self->_torchButtonView];

  v19 = objc_alloc_init(BCSCoachingMessageView);
  coachingMessageView = self->_coachingMessageView;
  self->_coachingMessageView = v19;

  [(BCSCoachingMessageView *)self->_coachingMessageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = [(BCSCoachingMessageView *)self->_coachingMessageView topAnchor];
  v22 = [(BCSLiveViewController *)self view];
  v23 = [v22 topAnchor];
  v24 = [v21 constraintEqualToAnchor:v23 constant:80.0];
  coachingMessageTopAnchorConstraint = self->_coachingMessageTopAnchorConstraint;
  self->_coachingMessageTopAnchorConstraint = v24;

  v26 = [(BCSLiveViewController *)self view];
  [v26 addSubview:self->_coachingMessageView];

  v27 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
  focusIndicatorInsetView = self->_focusIndicatorInsetView;
  self->_focusIndicatorInsetView = v27;

  [(UIView *)self->_focusIndicatorInsetView setTranslatesAutoresizingMaskIntoConstraints:0];
  v29 = [(BCSLiveViewController *)self view];
  [v29 addSubview:self->_focusIndicatorInsetView];

  v53 = (void *)MEMORY[0x263F08938];
  v66[0] = self->_coachingMessageTopAnchorConstraint;
  v63 = [(BCSCoachingMessageView *)self->_coachingMessageView centerXAnchor];
  v64 = [(BCSLiveViewController *)self view];
  v62 = [v64 centerXAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v66[1] = v61;
  v60 = [(BCSCoachingMessageView *)self->_coachingMessageView bottomAnchor];
  v59 = [(BCSSubjectIndicatorView *)self->_focusIndicator topAnchor];
  v58 = [v60 constraintLessThanOrEqualToAnchor:v59 constant:-10.0];
  v66[2] = v58;
  v56 = [(BCSCoachingMessageView *)self->_coachingMessageView widthAnchor];
  v57 = [(BCSLiveViewController *)self view];
  v55 = [v57 widthAnchor];
  v54 = [v56 constraintLessThanOrEqualToAnchor:v55];
  v66[3] = v54;
  v51 = [(BCSSubjectIndicatorView *)self->_focusIndicator centerXAnchor];
  v52 = [(BCSLiveViewController *)self view];
  v50 = [v52 centerXAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v66[4] = v49;
  v47 = [(BCSSubjectIndicatorView *)self->_focusIndicator centerYAnchor];
  v48 = [(BCSLiveViewController *)self view];
  v46 = [v48 centerYAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v66[5] = v45;
  v44 = [(UIView *)self->_focusIndicatorInsetView centerXAnchor];
  v43 = [(BCSSubjectIndicatorView *)self->_focusIndicator centerXAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v66[6] = v42;
  v41 = [(UIView *)self->_focusIndicatorInsetView centerYAnchor];
  v40 = [(BCSSubjectIndicatorView *)self->_focusIndicator centerYAnchor];
  v30 = [v41 constraintEqualToAnchor:v40];
  v66[7] = v30;
  v31 = [(UIView *)self->_focusIndicatorInsetView widthAnchor];
  v32 = [(BCSSubjectIndicatorView *)self->_focusIndicator widthAnchor];
  v33 = [v31 constraintEqualToAnchor:v32 multiplier:0.8];
  v66[8] = v33;
  v34 = [(UIView *)self->_focusIndicatorInsetView heightAnchor];
  v35 = [(BCSSubjectIndicatorView *)self->_focusIndicator heightAnchor];
  v36 = [v34 constraintEqualToAnchor:v35 multiplier:0.8];
  v66[9] = v36;
  v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:10];
  [v53 activateConstraints:v37];

  v38 = [MEMORY[0x263F82B60] mainScreen];
  [v38 bounds];
  -[BCSPreviewContainerView setBounds:](self->_previewContainerView, "setBounds:");

  v39 = [(BCSLiveViewController *)self view];
  [v39 bounds];
  UIRectGetCenter();
  -[BCSPreviewContainerView setCenter:](self->_previewContainerView, "setCenter:");

  [(BCSPreviewContainerView *)self->_previewContainerView setNeedsLayout];
  [(BCSSubjectIndicatorView *)self->_focusIndicator setBouncing:1];
}

- (void)resetUIAndStartCapturing:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIImageView *)self->_targetQRImage removeFromSuperview];
  targetQRImage = self->_targetQRImage;
  self->_targetQRImage = 0;

  animator = self->_animator;
  if (v3)
  {
    [(BCSScanningAnimator *)animator reset];
    v7 = self->_animator;
    self->_animator = 0;

    [(BCSSubjectIndicatorView *)self->_focusIndicator _removeAllAnimations:1];
    v8 = [(BCSSubjectIndicatorView *)self->_focusIndicator layer];
    [v8 setMeshTransform:0];

    focusIndicator = self->_focusIndicator;
    long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v15[0] = *MEMORY[0x263F000D0];
    v15[1] = v10;
    v15[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [(BCSSubjectIndicatorView *)focusIndicator setTransform:v15];
    double v11 = [(BCSLiveViewController *)self delegate];
    [v11 liveViewControllerDidResetCapture:self];
  }
  else
  {
    [(BCSScanningAnimator *)animator showCoverView];
  }
  [(BCSSubjectIndicatorView *)self->_focusIndicator setBouncing:v3];
  uint64_t v12 = v3 ^ 1;
  [(BCSCoachingMessageView *)self->_coachingMessageView setContentHidden:v12];
  if ((v12 & 1) == 0)
  {
    v13 = _BCSLocalizedString();
    [(BCSLiveViewController *)self _updateCoacheMessageWithString:v13];
  }
  v14 = [(BCSLiveViewController *)self parentViewController];
  [v14 setNeedsStatusBarAppearanceUpdate];
}

- (void)_liveViewTapped
{
  BOOL v3 = [(UIImageView *)self->_targetQRImage superview];

  if (!v3)
  {
    [(UITapGestureRecognizer *)self->_tapGestureRecognizer locationInView:self->_previewContainerView];
    -[BCSLiveViewController _convertPointToCaptureDeviceLocation:](self, "_convertPointToCaptureDeviceLocation:");
    double v5 = v4;
    double v7 = v6;
    v8 = [(BCSLiveViewController *)self delegate];
    objc_msgSend(v8, "liveViewController:didTapAtDevicePoint:", self, v5, v7);
  }

  [(BCSLiveViewController *)self resetUIAndStartCapturing:1];
}

- (void)_updateCoacheMessageWithString:(id)a3
{
  coachingMessageView = self->_coachingMessageView;
  id v5 = a3;
  [(BCSCoachingMessageView *)coachingMessageView setContentHidden:0];
  [(BCSCoachingMessageView *)self->_coachingMessageView setMessage:v5];
}

- (void)updateQRCodeAvailability:(int64_t)a3
{
  if (a3 == 2 || !a3)
  {
    _BCSLocalizedString();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(BCSLiveViewController *)self _updateCoacheMessageWithString:v4];
  }
}

- (void)didCaptureVisualCode:(id)a3 image:(id)a4 shouldAnimate:(BOOL)a5
{
  BOOL v130 = a5;
  id v7 = a3;
  id v8 = a4;
  [(BCSActionCoordinator *)self->_actionCoordinator startParsingVisualCode:v7];
  v9 = [BCSImageQuad alloc];
  [v7 topLeft];
  double v11 = v10;
  double v13 = v12;
  [v7 topRight];
  double v15 = v14;
  double v17 = v16;
  [v7 bottomRight];
  double v19 = v18;
  double v21 = v20;
  [v7 bottomLeft];
  v24 = -[BCSImageQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](v9, "initWithTopLeft:topRight:bottomRight:bottomLeft:", v11, v13, v15, v17, v19, v21, v22, v23);
  [(BCSImageQuad *)v24 boundingBox];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  [v8 extent];
  CGAffineTransformMakeScale(&v154, v33, v34);
  v155.origin.double x = v26;
  v155.origin.double y = v28;
  v155.size.double width = v30;
  v155.size.height = v32;
  CGRect v156 = CGRectApplyAffineTransform(v155, &v154);
  v35 = objc_msgSend(v8, "imageByCroppingToRect:", v156.origin.x, v156.origin.y, v156.size.width, v156.size.height);
  [(BCSImageQuad *)v24 normalize];
  [v35 extent];
  [(BCSImageQuad *)v24 topLeft];
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  double v135 = v37;
  double v137 = v36;
  [(BCSImageQuad *)v24 topRight];
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  double v39 = v38;
  double v41 = v40;
  [(BCSImageQuad *)v24 bottomRight];
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  double v43 = v42;
  double v45 = v44;
  [(BCSImageQuad *)v24 bottomLeft];
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  v48 = -[BCSImageQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([BCSImageQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v137, v135, v39, v41, v43, v45, v46, v47);
  [(BCSImageQuad *)v48 adjustOrientationInImageSpace:1];
  v129 = v35;
  uint64_t v49 = [(BCSLiveViewController *)self _perspectiveCorrectedImage:v35 imageQuad:v48];
  [(UIImageView *)self->_targetQRImage removeFromSuperview];
  v134 = (void *)v49;
  v50 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v49];
  targetQRImage = self->_targetQRImage;
  self->_targetQRImage = v50;

  -[AVCaptureVideoPreviewLayer rectForMetadataOutputRectOfInterest:](self->_previewLayer, "rectForMetadataOutputRectOfInterest:", 0.0, 0.0, 1.0, 1.0);
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  v60 = [(BCSLiveViewController *)self view];
  objc_msgSend(v60, "convertRect:fromView:", self->_previewContainerView, v53, v55, v57, v59);

  [v7 topLeft];
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  double v136 = v61;
  double v138 = v62;
  [v7 topRight];
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  double v64 = v63;
  double v66 = v65;
  [v7 bottomRight];
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  double v68 = v67;
  double v70 = v69;
  [v7 bottomLeft];
  -[BCSLiveViewController _convertLogicalPoint:inBounds:](self, "_convertLogicalPoint:inBounds:");
  double v72 = v71;
  double v74 = v73;
  v75 = [BCSImageQuad alloc];
  double v132 = v66;
  double v133 = v64;
  double v76 = v66;
  double v77 = v68;
  double v78 = v72;
  double v131 = v74;
  v79 = -[BCSImageQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](v75, "initWithTopLeft:topRight:bottomRight:bottomLeft:", v136, v138, v64, v76, v77, v70, v72, v74);
  [(BCSImageQuad *)v79 boundingBox];
  CGFloat v81 = v80;
  CGFloat v83 = v82;
  CGFloat v85 = v84;
  CGFloat v87 = v86;
  v88 = [(BCSLiveViewController *)self view];
  [v88 bounds];
  CGFloat Height = CGRectGetHeight(v157);

  v153.b = 0.0;
  v153.c = 0.0;
  v153.a = 1.0;
  *(_OWORD *)&v153.d = xmmword_248AEDAD0;
  v153.tdouble y = Height;
  v158.origin.double x = v81;
  v158.origin.double y = v83;
  v158.size.double width = v85;
  v158.size.height = v87;
  CGRect v159 = CGRectApplyAffineTransform(v158, &v153);
  double x = v159.origin.x;
  double y = v159.origin.y;
  double width = v159.size.width;
  double v93 = v159.size.height;
  _bcs_roundRectToPixels();
  -[UIImageView setFrame:](self->_targetQRImage, "setFrame:");
  if ([v7 codeType] == 1)
  {
    [(UIImageView *)self->_targetQRImage bounds];
    double v94 = CGRectGetWidth(v160);
    [(UIImageView *)self->_targetQRImage bounds];
    double v95 = CGRectGetHeight(v161);
    double v96 = v94 / v95;
    double v127 = y;
    double v128 = v70;
    if (v94 > v95) {
      double v96 = 1.0;
    }
    CGFloat v125 = v96;
    double v126 = v77;
    if (v94 > v95) {
      double v97 = v95 / v94;
    }
    else {
      double v97 = 1.0;
    }
    if (v94 <= v95) {
      double v94 = v95;
    }
    [(UIImageView *)self->_targetQRImage position];
    double v98 = v93;
    double v99 = v78;
    double v101 = v100;
    double v102 = width;
    double v103 = x;
    double v105 = v104;
    -[UIImageView setFrame:](self->_targetQRImage, "setFrame:", 0.0, 0.0, v94, v94);
    double v106 = v101;
    double v78 = v99;
    double v93 = v98;
    -[UIImageView setPosition:](self->_targetQRImage, "setPosition:", v106, v105);
    v107 = [(UIImageView *)self->_targetQRImage layer];
    double x = v103;
    double width = v102;
    [v107 setCornerRadius:v94 * 0.5];

    long long v108 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v153.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v153.c = v108;
    *(_OWORD *)&v153.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    double y = v127;
    double v70 = v128;
    *(double *)&long long v108 = v97;
    double v77 = v126;
    CGAffineTransformScale(&v152, &v153, v125, *(CGFloat *)&v108);
    v109 = self->_targetQRImage;
    CGAffineTransform v151 = v152;
    [(UIImageView *)v109 setTransform:&v151];
    v110 = [(UIImageView *)self->_targetQRImage layer];
    [v110 setMasksToBounds:1];

    [(UIImageView *)self->_targetQRImage setClipsToBounds:1];
  }
  animator = self->_animator;
  if (!animator)
  {
    v112 = objc_alloc_init(BCSScanningAnimator);
    v113 = self->_animator;
    self->_animator = v112;

    animator = self->_animator;
  }
  [(BCSScanningAnimator *)animator setFocusIndicator:self->_focusIndicator];
  v114 = -[BCSImageQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([BCSImageQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v136, v138, v133, v132, v77, v70, v78, v131);
  -[BCSImageQuad setBounds:](v114, "setBounds:", x, y, width, v93);
  [(BCSImageQuad *)v114 normalize];
  [(BCSImageQuad *)v114 flip];
  [(BCSScanningAnimator *)self->_animator setImageQuad:v114];
  [(BCSScanningAnimator *)self->_animator setTargetQRImage:self->_targetQRImage];
  [(BCSScanningAnimator *)self->_animator setTargetCode:v7];
  [(BCSSubjectIndicatorView *)self->_focusIndicator setBouncing:0];
  v150[0] = MEMORY[0x263EF8330];
  v150[1] = 3221225472;
  v150[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke;
  v150[3] = &unk_26524BD30;
  v150[4] = self;
  v149[0] = MEMORY[0x263EF8330];
  v149[1] = 3221225472;
  v149[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_2;
  v149[3] = &unk_26524BD78;
  v149[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v150 animations:v149 completion:0.25];
  v115 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  if (os_signpost_enabled(v115))
  {
    LOWORD(v153.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_248ACF000, v115, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "pushAnimationStarts", "start QR code animation", (uint8_t *)&v153, 2u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_30;
  aBlock[3] = &unk_26524BDC8;
  id v116 = v7;
  id v146 = v116;
  id v117 = v8;
  id v147 = v117;
  v148 = self;
  v118 = _Block_copy(aBlock);
  uint64_t v119 = [v116 codeType];
  v120 = self->_animator;
  if (v119 == 1)
  {
    v142[0] = MEMORY[0x263EF8330];
    v142[1] = 3221225472;
    v142[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_39;
    v142[3] = &unk_26524BE18;
    v142[4] = self;
    v121 = &v143;
    v122 = &v144;
    id v143 = v116;
    v144 = v118;
    id v123 = v118;
    [(BCSScanningAnimator *)v120 animateAppClipCodeBounceWithCompletion:v142 shouldAnimate:v130];
  }
  else
  {
    v139[0] = MEMORY[0x263EF8330];
    v139[1] = 3221225472;
    v139[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_3;
    v139[3] = &unk_26524BE18;
    v139[4] = self;
    v121 = &v140;
    v122 = &v141;
    id v140 = v116;
    v141 = v118;
    id v124 = v118;
    [(BCSScanningAnimator *)v120 animatePushWithCompletion:v139 shouldAnimate:v130];
  }
}

uint64_t __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) setAlpha:0.0];
}

uint64_t __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 992) setContentHidden:1];
  v2 = *(void **)(*(void *)(a1 + 32) + 992);

  return [v2 setAlpha:1.0];
}

BOOL __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_30(void *a1)
{
  v13[2] = *MEMORY[0x263EF8340];
  BOOL v2 = +[BCSSecureCaptureSession hasActiveSession];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F08D38]);
    id v4 = (void *)[v3 initWithActivityType:*MEMORY[0x263F10580]];
    v12[0] = @"detectedCode";
    id v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:a1[4]];
    v12[1] = @"detectedImage";
    v13[0] = v5;
    double v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a1[5]];
    v13[1] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    [v4 setUserInfo:v7];

    id v8 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_248ACF000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "captureExtensionCodePayload", "created Capture Extension code payload", buf, 2u);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_35;
    v10[3] = &unk_26524BDA0;
    v10[4] = a1[6];
    +[BCSSecureCaptureSession authenticateWithUserActivity:v4 completionHandler:v10];
  }
  return v2;
}

void __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_2_36;
    block[3] = &unk_26524BD30;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
    id v4 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_35_cold_1(v4, v3);
    }
  }
}

uint64_t __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_2_36(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetUIAndStartCapturing:1];
}

void __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_39(uint64_t a1, int a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1072) actionForVisualCode:*(void *)(a1 + 40)];
  if (a2)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 1072);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_2_40;
    v8[3] = &unk_26524BDF0;
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    v8[4] = v7;
    id v9 = v4;
    [v5 requestDeviceUnlockIfNeededWithCompletion:v8];
  }
}

uint64_t __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_2_40(void *a1, char a2)
{
  uint64_t result = (*(uint64_t (**)(void))(a1[6] + 16))();
  if ((result & 1) == 0)
  {
    id v5 = (void *)a1[4];
    if (a2)
    {
      id v6 = [v5 delegate];
      [v6 liveViewControllerWillPerformAction:a1[4]];

      uint64_t v7 = a1[5];
      id v8 = *(void **)(a1[4] + 1072);
      return [v8 performAction:v7];
    }
    else
    {
      return [v5 resetUIAndStartCapturing:1];
    }
  }
  return result;
}

void __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_3(uint64_t a1)
{
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 1072) actionForVisualCode:*(void *)(a1 + 40)];

  if (v2) {
    int64_t v3 = 100000000;
  }
  else {
    int64_t v3 = 1000000000;
  }
  dispatch_time_t v4 = dispatch_time(0, v3);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_4;
  block[3] = &unk_26524BE40;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v10 = v5;
  block[4] = v6;
  id v9 = v7;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_4(void *a1)
{
  uint64_t result = (*(uint64_t (**)(void))(a1[6] + 16))();
  if ((result & 1) == 0)
  {
    int64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    return [v3 _continueToPopAnimationForDetectedCode:v4];
  }
  return result;
}

- (void)_continueToPopAnimationForDetectedCode:(id)a3
{
  id v4 = a3;
  id v5 = [(BCSActionCoordinator *)self->_actionCoordinator actionForVisualCode:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    actionCoordinator = self->_actionCoordinator;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke;
    v8[3] = &unk_26524BF58;
    v8[4] = self;
    id v9 = v5;
    id v10 = v4;
    [(BCSActionCoordinator *)actionCoordinator requestDeviceUnlockIfNeededWithCompletion:v8];
  }
  else
  {
    [(BCSLiveViewController *)self resetUIAndStartCapturing:1];
  }
}

void __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    int64_t v3 = [*(id *)(a1 + 40) actionPickerItems];
    uint64_t v4 = [v3 count];

    if (v4 == 1)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void **)(v5 + 1072);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_2;
      v25[3] = &unk_26524BEB8;
      v25[4] = v5;
      id v26 = *(id *)(a1 + 48);
      [v7 showFirstTimePromptIfNecessary:v6 completion:v25];
      id v8 = v26;
    }
    else
    {
      id v10 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_248ACF000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "startShowingAlertForUserChoice", "show alert for multiple action items", buf, 2u);
      }
      double v11 = [*(id *)(a1 + 40) actionPickerItems];
      double v12 = [v11 firstObject];
      double v13 = [v12 actionURL];
      int v14 = objc_msgSend(v13, "_bcs_isUPIURL");

      uint64_t v15 = *(void *)(a1 + 32);
      if (v14)
      {
        double v16 = *(void **)(v15 + 1024);
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_42;
        v23[3] = &unk_26524BEE0;
        v23[4] = v15;
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_2_43;
        v21[3] = &unk_26524BE90;
        v21[4] = v15;
        id v22 = *(id *)(a1 + 40);
        [v16 animatePopWithAppImageBlock:v23 completion:v21];
        id v8 = v22;
      }
      else
      {
        double v17 = *(void **)(v15 + 1072);
        double v18 = *(void **)(a1 + 40);
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_4_46;
        v19[3] = &unk_26524BF08;
        v19[4] = v15;
        id v20 = v18;
        [v17 showItemsWithAction:v20 completion:v19];
        id v8 = v20;
      }
    }
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    [v9 resetUIAndStartCapturing:1];
  }
}

void __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int64_t v3 = *(void **)(v2 + 1024);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_3;
  v7[3] = &unk_26524BE68;
  v7[4] = v2;
  id v8 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_4;
  v5[3] = &unk_26524BE90;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 animatePopWithAppImageBlock:v7 completion:v5];
}

id __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1072) actionForVisualCode:*(void *)(a1 + 40)];
  int64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1072) homeScreenAppIconForAction:v2];

  return v3;
}

void __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 1072) actionForVisualCode:*(void *)(a1 + 40)];
  if (a2)
  {
    id v6 = v4;
    uint64_t v5 = [*(id *)(a1 + 32) delegate];
    [v5 liveViewControllerWillPerformAction:*(void *)(a1 + 32)];

    [*(id *)(*(void *)(a1 + 32) + 1072) performAction:v6];
    uint64_t v4 = v6;
  }
}

uint64_t __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_42(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1040) image];
}

void __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_2_43(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void **)(v2 + 1072);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_3_44;
    v5[3] = &unk_26524BF08;
    v5[4] = v2;
    id v6 = v3;
    [v4 showItemsWithAction:v6 completion:v5];
  }
}

uint64_t __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_3_44(uint64_t a1, void *a2)
{
  int64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 delegate];
  [v5 liveViewControllerWillPerformAction:*(void *)(a1 + 32)];

  [v4 performAction];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 1072);

  return [v7 logActivatedEventForAction:v6];
}

void __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_4_46(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 actionURL];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 1024);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_5;
    v10[3] = &unk_26524BF30;
    v10[4] = v5;
    id v11 = v3;
    id v12 = *(id *)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_6;
    v7[3] = &unk_26524BF58;
    v7[4] = *(void *)(a1 + 32);
    id v8 = v11;
    id v9 = *(id *)(a1 + 40);
    [v6 animatePopWithAppImageBlock:v10 completion:v7];
  }
  else if ([v3 isCopyActionItem])
  {
    [v3 performAction];
    [*(id *)(a1 + 32) resetUIAndStartCapturing:1];
  }
}

id __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1072);
  id v3 = [*(id *)(a1 + 40) targetApplicationBundleIdentifier];
  if (v3)
  {
    id v4 = [v2 homeScreenAppIconWithIdentifier:v3];
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 48) defaultActionTargetApplicationBundleIdentifier];
    id v4 = [v2 homeScreenAppIconWithIdentifier:v5];
  }

  return v4;
}

uint64_t __64__BCSLiveViewController__continueToPopAnimationForDetectedCode___block_invoke_6(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)result;
    id v3 = [*(id *)(result + 32) delegate];
    [v3 liveViewControllerWillPerformAction:v2[4]];

    [*(id *)(v2[4] + 1072) performActionPickerItem:v2[5]];
    id v4 = *(void **)(v2[4] + 1072);
    uint64_t v5 = v2[6];
    return [v4 logActivatedEventForAction:v5];
  }
  return result;
}

- (CGPoint)_normalize:(CGPoint)a3 inBounds:(CGRect)a4
{
  double v4 = (a3.x - a4.origin.x) / a4.size.width;
  double v5 = (a3.y - a4.origin.y) / a4.size.height;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)_convertLogicalPoint:(CGPoint)a3 inBounds:(CGRect)a4
{
  double v4 = a4.origin.x + a3.x * a4.size.width;
  double v5 = a4.origin.y + a3.y * a4.size.height;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (id)_perspectiveCorrectedImage:(id)a3 imageQuad:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x263F00640];
  id v7 = a4;
  id v8 = [v6 filterWithName:@"CIPerspectiveCorrection"];
  id v9 = (void *)MEMORY[0x263F00680];
  [v7 topLeft];
  id v10 = objc_msgSend(v9, "vectorWithCGPoint:");
  [v8 setValue:v10 forKey:@"inputTopLeft"];

  id v11 = (void *)MEMORY[0x263F00680];
  [v7 topRight];
  id v12 = objc_msgSend(v11, "vectorWithCGPoint:");
  [v8 setValue:v12 forKey:@"inputTopRight"];

  double v13 = (void *)MEMORY[0x263F00680];
  [v7 bottomLeft];
  int v14 = objc_msgSend(v13, "vectorWithCGPoint:");
  [v8 setValue:v14 forKey:@"inputBottomLeft"];

  uint64_t v15 = (void *)MEMORY[0x263F00680];
  [v7 bottomRight];
  double v17 = v16;
  double v19 = v18;

  id v20 = objc_msgSend(v15, "vectorWithCGPoint:", v17, v19);
  [v8 setValue:v20 forKey:@"inputBottomRight"];

  [v8 setValue:v5 forKey:*MEMORY[0x263F00968]];
  double v21 = [v8 valueForKey:*MEMORY[0x263F009D0]];
  id v22 = (void *)MEMORY[0x263F827E8];
  _bcs_mainScreenScale();
  double v23 = objc_msgSend(v22, "imageWithCIImage:scale:orientation:", v21, 0);

  return v23;
}

- (CGPoint)_pointFromNormalizedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  previewLayer = self->_previewLayer;
  uint64_t v6 = [(BCSLiveViewController *)self view];
  id v7 = [v6 layer];
  -[AVCaptureVideoPreviewLayer convertPoint:toLayer:](previewLayer, "convertPoint:toLayer:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGPoint)_convertPointToCaptureDeviceLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(BCSLiveViewController *)self view];
  id v7 = [v6 layer];
  objc_msgSend(v7, "convertPoint:toLayer:", self->_previewLayer, x, y);
  double v9 = v8;
  double v11 = v10;

  previewLayer = self->_previewLayer;

  -[AVCaptureVideoPreviewLayer captureDevicePointOfInterestForPoint:](previewLayer, "captureDevicePointOfInterestForPoint:", v9, v11);
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPoint)_convertPointFromCaptureDeviceLocation:(CGPoint)a3
{
  -[AVCaptureVideoPreviewLayer pointForCaptureDevicePointOfInterest:](self->_previewLayer, "pointForCaptureDevicePointOfInterest:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  double v8 = [(BCSLiveViewController *)self view];
  double v9 = [v8 layer];
  objc_msgSend(v9, "convertPoint:fromLayer:", self->_previewLayer, v5, v7);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (void)cameraDeviceDidChange
{
  id v3 = [(BCSLiveViewController *)self delegate];
  -[BCSTorchButtonView setHidden:](self->_torchButtonView, "setHidden:", [v3 liveViewControllerTorchModeSupported:self] ^ 1);
}

- (void)torchAvailabilityChangedTo:(BOOL)a3
{
}

- (void)torchActivenessChangedTo:(BOOL)a3
{
}

- (void)_applyTorchButtonRotationForDeviceOrientation
{
  id v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 orientation];

  CGFloat v5 = 0.0;
  if ((unint64_t)(v4 - 2) <= 2) {
    CGFloat v5 = dbl_248AEDAE8[v4 - 2];
  }
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformMakeRotation(&v7, v5);
  CGAffineTransform v6 = v7;
  [(BCSTorchButtonView *)self->_torchButtonView setTransform:&v6];
}

- (void)_setTorchButtonPosition
{
  id v3 = [(BCSLiveViewController *)self view];
  uint64_t v4 = [v3 window];
  CGFloat v5 = [v4 windowScene];
  uint64_t v6 = [v5 interfaceOrientation];

  CGAffineTransform v7 = [(BCSLiveViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  if (v11 > v9) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v6;
  }
  if (v12 == 3)
  {
    double v16 = v9 + -116.0;
    double v17 = [(BCSLiveViewController *)self view];
    [v17 center];
    double v15 = v18;
  }
  else if (v12 == 4)
  {
    double v13 = [(BCSLiveViewController *)self view];
    [v13 center];
    double v15 = v14;

    double v16 = 116.0;
  }
  else
  {
    double v19 = [(BCSLiveViewController *)self view];
    [v19 center];
    double v16 = v20;

    double v15 = v11 + -116.0;
  }
  torchButtonView = self->_torchButtonView;

  -[BCSTorchButtonView setCenter:](torchButtonView, "setCenter:", v16, v15);
}

- (void)compensateForVideoRotationAngleInLiveView:(double)a3
{
  self->_videoRotationAngle = a3;
  double v5 = fabs(remainder(a3, 3.14159265));
  uint64_t v6 = [(BCSLiveViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  if (v5 <= 0.001) {
    double v11 = v10;
  }
  else {
    double v11 = v8;
  }
  if (v5 <= 0.001) {
    double v12 = v8;
  }
  else {
    double v12 = v10;
  }

  -[BCSLiveViewController _layOutWithPreviewSize:angle:isPortrait:](self, "_layOutWithPreviewSize:angle:isPortrait:", v8 < v10, v12, v11, a3);
}

- (void)compensateForInterfaceOrientationInLiveView:(int64_t)a3 referenceSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v8 = [(BCSLiveViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  BOOL v13 = width >= height && v10 < v12;
  if (v13 || width < height && v10 > v12)
  {
    double width = v12;
    double height = v10;
  }
  switch(a3)
  {
    case 2:
      uint64_t v14 = 1;
      double v15 = 3.14159265;
      break;
    case 3:
      uint64_t v14 = 0;
      double v15 = -1.57079633;
      break;
    case 4:
      uint64_t v14 = 0;
      double v15 = 1.57079633;
      break;
    default:
      uint64_t v14 = 1;
      double v15 = 0.0;
      break;
  }

  -[BCSLiveViewController _layOutWithPreviewSize:angle:isPortrait:](self, "_layOutWithPreviewSize:angle:isPortrait:", v14, width, height, v15);
}

- (void)_layOutWithPreviewSize:(CGSize)a3 angle:(double)a4 isPortrait:(BOOL)a5
{
  -[BCSPreviewContainerView setBounds:](self->_previewContainerView, "setBounds:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), a3.width, a3.height);
  double v8 = [(BCSLiveViewController *)self view];
  [v8 bounds];
  UIRectGetCenter();
  -[BCSPreviewContainerView setCenter:](self->_previewContainerView, "setCenter:");

  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeRotation(&v13, a4);
  CGAffineTransform v12 = v13;
  [(BCSPreviewContainerView *)self->_previewContainerView setTransform:&v12];
  if (a5)
  {
    double v9 = 80.0;
  }
  else
  {
    int IsPad = _bcs_deviceIsPad();
    double v9 = 10.0;
    if (IsPad) {
      double v9 = 20.0;
    }
  }
  [(NSLayoutConstraint *)self->_coachingMessageTopAnchorConstraint setConstant:v9];
  LODWORD(v11) = 1144733696;
  [(NSLayoutConstraint *)self->_coachingMessageTopAnchorConstraint setPriority:v11];
  [(BCSLiveViewController *)self _setTorchButtonPosition];
  [(BCSCoachingMessageView *)self->_coachingMessageView setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  if (_os_feature_enabled_impl())
  {
    double videoRotationAngle = self->_videoRotationAngle;
    [(BCSLiveViewController *)self compensateForVideoRotationAngleInLiveView:videoRotationAngle];
  }
  else
  {
    id v8 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v4 = [v8 statusBarOrientation];
    double v5 = [MEMORY[0x263F82B60] mainScreen];
    [v5 _referenceBounds];
    -[BCSLiveViewController compensateForInterfaceOrientationInLiveView:referenceSize:](self, "compensateForInterfaceOrientationInLiveView:referenceSize:", v4, v6, v7);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)rotationAnimationWillStart
{
}

- (void)rotationAnimationDidFinish
{
}

- (void)actionCoordinator:(id)a3 willDismissViewController:(id)a4
{
}

- (id)actionCoordinatorViewForContextMenu:(id)a3
{
  return self->_focusIndicatorInsetView;
}

- (void)actionCoordinator:(id)a3 didFinishPerformingAction:(id)a4
{
}

- (void)actionCoordinator:(id)a3 didParseCode:(id)a4 withAction:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 codeType];
  if (v8 && v9 == 1)
  {
    uint64_t v10 = [(BCSActionCoordinator *)self->_actionCoordinator centerGlyphImageForAction:v8];
    double v11 = (void *)v10;
    if (v7 && v10)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__BCSLiveViewController_actionCoordinator_didParseCode_withAction___block_invoke;
      block[3] = &unk_26524BF80;
      id v13 = v7;
      uint64_t v14 = self;
      id v15 = v11;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __67__BCSLiveViewController_actionCoordinator_didParseCode_withAction___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = [*(id *)(a1[5] + 1024) targetCode];

  if (v2 == v3)
  {
    uint64_t v4 = a1[6];
    double v5 = *(void **)(a1[5] + 1024);
    [v5 prepareCenterGlyphWithImage:v4];
  }
}

- (void)torchButtonView:(id)a3 torchModeChangedTo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(BCSLiveViewController *)self delegate];
  [v6 liveViewController:self torchModeChangedTo:v4];
}

- (void)sessionControlsDidBecomeActive:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__BCSLiveViewController_sessionControlsDidBecomeActive___block_invoke;
  block[3] = &unk_26524BD30;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__BCSLiveViewController_sessionControlsDidBecomeActive___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) setObscuredByOverlay:1];
}

- (void)sessionControlsDidBecomeInactive:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__BCSLiveViewController_sessionControlsDidBecomeInactive___block_invoke;
  block[3] = &unk_26524BD30;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __58__BCSLiveViewController_sessionControlsDidBecomeInactive___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) setObscuredByOverlay:0];
}

- (BCSLiveViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCSLiveViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BCSActionCoordinator)actionCoordinator
{
  return self->_actionCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_coachingMessageTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_targetQRImage, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_torchButtonView, 0);
  objc_storeStrong((id *)&self->_focusIndicatorInsetView, 0);
  objc_storeStrong((id *)&self->_focusIndicator, 0);
  objc_storeStrong((id *)&self->_coachingMessageView, 0);
  objc_storeStrong((id *)&self->_previewContainerView, 0);

  objc_storeStrong((id *)&self->_previewLayer, 0);
}

void __66__BCSLiveViewController_didCaptureVisualCode_image_shouldAnimate___block_invoke_35_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  BOOL v4 = objc_msgSend(a2, "_bcs_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_248ACF000, v3, OS_LOG_TYPE_ERROR, "BCSLiveViewController: capture extension authentication failed with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end