@interface CAMPanoramaView
+ (Class)layerClass;
- (BOOL)_isCurrentlyMovingTooFast;
- (BOOL)_isCurrentlyShowingMoveInstructions;
- (BOOL)isPainting;
- (CAMPanoramaArrowView)_arrowView;
- (CAMPanoramaLabel)_instructionLabel;
- (CAMPanoramaLevelView)_levelView;
- (CAMPanoramaPaintingStatus)_currentPaintingStatus;
- (CAMPanoramaPreviewView)previewView;
- (CAMPanoramaView)initWithCoder:(id)a3;
- (CAMPanoramaView)initWithFrame:(CGRect)a3;
- (CAMPanoramaView)initWithPanoramaPreviewView:(id)a3 layoutStyle:(int64_t)a4;
- (CAMPanoramaViewDelegate)delegate;
- (CGPoint)_initialArrowCenter;
- (CGRect)_frameForArrowViewWithDirection:(int64_t)a3 offset:(double)a4;
- (CGRect)_lastLayoutBounds;
- (CGSize)_previewSizeForBounds:(CGRect)a3;
- (CGSize)panoramaCaptureSize;
- (NSString)_arrowString;
- (NSString)_instructionString;
- (NSString)_moveDownString;
- (NSString)_moveUpString;
- (NSString)_speedString;
- (UIView)_maskingView;
- (UIView)_stripBackgroundView;
- (UIView)_stripContainerView;
- (UIView)instructionView;
- (double)_currentAverageSpeed;
- (double)_filteredNormalizedBaselineOffset;
- (double)_previousSpeeds;
- (int64_t)direction;
- (int64_t)layoutStyle;
- (unint64_t)_arrowUpdateFrame;
- (void)_cancelDelayedMoveInstructions;
- (void)_hideArrowInstructionsAfterDelay;
- (void)_hideInstructionLabel;
- (void)_hideSpeedInstructionsAfterDelay;
- (void)_resetPaintingUIAnimated:(BOOL)a3;
- (void)_setArrowUpdateFrame:(unint64_t)a3;
- (void)_setCurrentAverageSpeed:(double)a3;
- (void)_setCurrentPaintingStatus:(id)a3;
- (void)_setCurrentlyMovingTooFast:(BOOL)a3;
- (void)_setCurrentlyShowingMoveInstructions:(BOOL)a3;
- (void)_setFilteredNormalizedBaselineOffset:(double)a3;
- (void)_setInitialArrowCenter:(CGPoint)a3;
- (void)_setLastLayoutBounds:(CGRect)a3;
- (void)_setPainting:(BOOL)a3;
- (void)_showArrowInstructions;
- (void)_showMoveDownInstructions;
- (void)_showMoveDownInstructionsAfterDelay;
- (void)_showMoveUpInstructions;
- (void)_showMoveUpInstructionsAfterDelay;
- (void)_showSpeedInstructions;
- (void)_updateInstructionLabelForInstruction:(int64_t)a3;
- (void)dealloc;
- (void)finishedProcessingPanorama;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setDirection:(int64_t)a3 animated:(BOOL)a4;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setPanoramaCaptureSize:(CGSize)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)startPainting;
- (void)startProcessingPanorama;
- (void)stopPainting;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePaintingWithStatus:(id)a3;
@end

@implementation CAMPanoramaView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAMPanoramaView)initWithPanoramaPreviewView:(id)a3 layoutStyle:(int64_t)a4
{
  id v7 = a3;
  v48.receiver = self;
  v48.super_class = (Class)CAMPanoramaView;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  v12 = -[CAMPanoramaView initWithFrame:](&v48, sel_initWithFrame_, *MEMORY[0x263F001A8], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    v12->_layoutStyle = a4;
    p_panoramaCaptureSize = &v12->_panoramaCaptureSize;
    +[CAMPanoramaUtilities bufferSize];
    *(void *)&p_panoramaCaptureSize->width = v15;
    v13->_panoramaCaptureSize.height = v16;
    v13->_direction = 1;
    CGSize v17 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v13->__lastLayoutBounds.origin = (CGPoint)*MEMORY[0x263F001A0];
    v13->__lastLayoutBounds.size = v17;
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
    stripBackgroundView = v13->__stripBackgroundView;
    v13->__stripBackgroundView = (UIView *)v18;

    v20 = v13->__stripBackgroundView;
    v21 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.300000012];
    [(UIView *)v20 setBackgroundColor:v21];

    [(CAMPanoramaView *)v13 addSubview:v13->__stripBackgroundView];
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
    stripContainerView = v13->__stripContainerView;
    v13->__stripContainerView = (UIView *)v22;

    [(UIView *)v13->__stripBackgroundView addSubview:v13->__stripContainerView];
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
    maskingView = v13->__maskingView;
    v13->__maskingView = (UIView *)v24;

    [(UIView *)v13->__stripContainerView addSubview:v13->__maskingView];
    objc_storeStrong((id *)&v13->_previewView, a3);
    [(UIView *)v13->__maskingView addSubview:v7];
    v26 = -[CAMPanoramaLevelView initWithFrame:]([CAMPanoramaLevelView alloc], "initWithFrame:", v8, v9, v10, v11);
    levelView = v13->__levelView;
    v13->__levelView = v26;

    v28 = -[CAMPanoramaArrowView initWithFrame:]([CAMPanoramaArrowView alloc], "initWithFrame:", v8, v9, v10, v11);
    arrowView = v13->__arrowView;
    v13->__arrowView = v28;

    v30 = [(CAMPanoramaArrowView *)v13->__arrowView layer];
    [v30 setZPosition:100.0];
    [(UIView *)v13->__stripBackgroundView insertSubview:v13->__levelView belowSubview:v13->__stripContainerView];
    [(UIView *)v13->__stripBackgroundView addSubview:v13->__arrowView];
    v13->__previousSpeeds = (double *)malloc_type_malloc(0x20uLL, 0x100004000313F17uLL);
    v31 = [MEMORY[0x263F82670] currentDevice];
    v32 = [v31 model];

    v33 = [NSString stringWithFormat:@"PANO_INSTRUCTIONAL_TEXT_%@", v32];
    uint64_t v34 = CAMLocalizedFrameworkString(v33, &stru_26BD78BA0);
    instructionString = v13->__instructionString;
    v13->__instructionString = (NSString *)v34;

    uint64_t v36 = CAMLocalizedFrameworkString(@"PANO_SPEED_TEXT", &stru_26BD78BA0);
    speedString = v13->__speedString;
    v13->__speedString = (NSString *)v36;

    uint64_t v38 = CAMLocalizedFrameworkString(@"PANO_MOVE_UP_TEXT", &stru_26BD78BA0);
    moveUpString = v13->__moveUpString;
    v13->__moveUpString = (NSString *)v38;

    uint64_t v40 = CAMLocalizedFrameworkString(@"PANO_MOVE_DOWN_TEXT", &stru_26BD78BA0);
    moveDownString = v13->__moveDownString;
    v13->__moveDownString = (NSString *)v40;

    uint64_t v42 = CAMLocalizedFrameworkString(@"PANO_ARROW_TEXT", &stru_26BD78BA0);
    arrowString = v13->__arrowString;
    v13->__arrowString = (NSString *)v42;

    v44 = -[CAMInstructionLabel initWithFrame:]([CAMPanoramaLabel alloc], "initWithFrame:", v8, v9, v10, v11);
    instructionLabel = v13->__instructionLabel;
    v13->__instructionLabel = v44;

    [(CAMInstructionLabel *)v13->__instructionLabel setText:v13->__instructionString];
    [(CAMPanoramaView *)v13 addSubview:v13->__instructionLabel];
    v46 = v13;
  }
  return v13;
}

- (CAMPanoramaView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (CAMPanoramaView)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  previousSpeeds = self->__previousSpeeds;
  if (previousSpeeds)
  {
    free(previousSpeeds);
    self->__previousSpeeds = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMPanoramaView;
  [(CAMPanoramaView *)&v4 dealloc];
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(CAMPanoramaView *)self setNeedsLayout];
  }
}

- (UIView)instructionView
{
  return (UIView *)self->__instructionLabel;
}

- (CGSize)_previewSizeForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  +[CAMPanoramaUtilities panoramaViewPreviewStripInsetsForLayoutStyle:[(CAMPanoramaView *)self layoutStyle]];
  double v7 = width - v5 - v6;
  double v10 = height - v8 - v9;
  double v11 = v7;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v146.receiver = self;
  v146.super_class = (Class)CAMPanoramaView;
  [(CAMPanoramaView *)&v146 layoutSubviews];
  [(CAMPanoramaView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[CAMPanoramaView _previewSizeForBounds:](self, "_previewSizeForBounds:");
  double v118 = v11;
  double v13 = v12;
  +[CAMPanoramaUtilities singlePreviewFrameWidthForPreviewHeight:v12];
  double v122 = v14;
  [(CAMPanoramaView *)self _lastLayoutBounds];
  CGFloat v16 = v15;
  CGFloat rect2 = v17;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  v147.origin.CGFloat x = v4;
  v147.origin.CGFloat y = v6;
  v147.size.double width = v8;
  v147.size.CGFloat height = v10;
  double v128 = v13;
  double v22 = v13 + 4.0;
  uint64_t v117 = 0;
  double Width = CGRectGetWidth(v147);
  UIRectCenteredIntegralRectScale();
  CGFloat v132 = v24;
  CGFloat v133 = v23;
  CGFloat v130 = v26;
  CGFloat v131 = v25;
  double v124 = v6;
  double v125 = v4;
  v148.origin.CGFloat x = v4;
  v148.origin.CGFloat y = v6;
  double v126 = v10;
  double v127 = v8;
  v148.size.double width = v8;
  v148.size.CGFloat height = v10;
  v156.origin.CGFloat x = v16;
  v156.origin.CGFloat y = rect2;
  v156.size.double width = v19;
  v156.size.CGFloat height = v21;
  if (!CGRectEqualToRect(v148, v156))
  {
    v27 = [(CAMPanoramaView *)self _stripBackgroundView];
    UIRectGetCenter();
    double v28 = v22;
    double v30 = v29;
    double v32 = v31;
    objc_msgSend(v27, "setBounds:", 0.0, 0.0, Width, v28);
    objc_msgSend(v27, "setCenter:", v30, v32);
    v33 = [(CAMPanoramaView *)self _stripContainerView];
    UIRectCenteredIntegralRectScale();
    UIRectGetCenter();
    double v35 = v34;
    double v37 = v36;
    objc_msgSend(v33, "setBounds:", 0.0, 0.0, v118, v128, 0);
    objc_msgSend(v33, "setCenter:", v35, v37);
    uint64_t v38 = [(CAMPanoramaView *)self _levelView];
    [v38 intrinsicContentSize];
    double v40 = v39;
    v149.origin.CGFloat x = 0.0;
    v149.origin.CGFloat y = 0.0;
    v149.size.double width = Width;
    v149.size.CGFloat height = v28;
    double v41 = CGRectGetWidth(v149);
    UIRectCenteredIntegralRectScale();
    UIRectGetCenter();
    double v43 = v42;
    double v45 = v44;
    objc_msgSend(v38, "setBounds:", 0.0, 0.0, v41, v40, 0);
    objc_msgSend(v38, "setCenter:", v43, v45);
  }
  int64_t v46 = [(CAMPanoramaView *)self direction];
  v47 = [(CAMPanoramaView *)self _currentPaintingStatus];
  [v47 cropRectangle];
  CGFloat rect2a = v48;
  CGFloat v50 = v49;
  double v52 = v51;
  CGFloat v54 = v53;
  +[CAMPanoramaUtilities bufferSize];
  double v56 = v55;
  [(CAMPanoramaView *)self panoramaCaptureSize];
  CGFloat v58 = v52 * (v56 / v57);
  v59 = [(CAMPanoramaView *)self _stripContainerView];
  [v59 bounds];
  CGFloat x = v150.origin.x;
  CGFloat y = v150.origin.y;
  CGFloat v62 = v150.size.width;
  CGFloat height = v150.size.height;
  double v64 = CGRectGetWidth(v150);
  v151.origin.CGFloat x = x;
  v151.origin.CGFloat y = y;
  v151.size.double width = v62;
  v151.size.CGFloat height = height;
  CGFloat v65 = CGRectGetHeight(v151);
  v152.origin.CGFloat x = rect2a;
  v152.origin.CGFloat y = v50;
  v152.size.double width = v58;
  v152.size.CGFloat height = v54;
  double v66 = CGRectGetWidth(v152);
  if (v122 >= v66) {
    double v67 = v122;
  }
  else {
    double v67 = v66;
  }
  double v68 = v64 - v122;
  if (v64 - v122 >= v64 - v67) {
    double v68 = v64 - v67;
  }
  if (v46 == 2) {
    double v69 = v68;
  }
  else {
    double v69 = 0.0;
  }
  v70 = [(CAMPanoramaView *)self _maskingView];
  v71 = (void *)MEMORY[0x263F82E00];
  v140[0] = MEMORY[0x263EF8330];
  v140[1] = 3221225472;
  v140[2] = __33__CAMPanoramaView_layoutSubviews__block_invoke;
  v140[3] = &unk_263FA06F8;
  id v72 = v70;
  id v141 = v72;
  double v142 = v69;
  uint64_t v143 = 0;
  double v144 = v67;
  CGFloat v145 = v65;
  [v71 performWithoutAnimation:v140];
  double v73 = v65;
  double v74 = 0.0;
  objc_msgSend(v59, "convertRect:toView:", v72, v69, 0.0, v67, v73);
  CGFloat v76 = v75;
  CGFloat v78 = v77;
  CGFloat v80 = v79;
  CGFloat v82 = v81;
  +[CAMPanoramaUtilities bufferSize];
  double v85 = v128 * (v83 / v84);
  if (v46 == 2)
  {
    v153.origin.CGFloat x = v76;
    v153.origin.CGFloat y = v78;
    v153.size.double width = v80;
    v153.size.CGFloat height = v82;
    double v74 = CGRectGetWidth(v153) - v85;
  }
  v86 = [(CAMPanoramaView *)self previewView];
  v87 = (void *)MEMORY[0x263F82E00];
  v134[0] = MEMORY[0x263EF8330];
  v134[1] = 3221225472;
  v134[2] = __33__CAMPanoramaView_layoutSubviews__block_invoke_2;
  v134[3] = &unk_263FA06F8;
  id v135 = v86;
  double v136 = v74;
  uint64_t v137 = 0;
  double v138 = v85;
  double v139 = v128;
  id v88 = v86;
  [v87 performWithoutAnimation:v134];
  [v72 size];
  -[CAMPanoramaView _frameForArrowViewWithDirection:offset:](self, "_frameForArrowViewWithDirection:offset:", v46);
  double v90 = v89;
  double v92 = v91;
  double v94 = v93;
  double v96 = v95;
  UIRectGetCenter();
  double v98 = v97;
  if ([(CAMPanoramaView *)self isPainting])
  {
    [(CAMPanoramaView *)self _currentAverageSpeed];
    if (v99 < 1.0)
    {
      [(CAMPanoramaView *)self _initialArrowCenter];
      double v101 = v98 - v100;
      double v102 = vabdd_f64(v98, v100);
      v103 = [(CAMPanoramaView *)self _stripBackgroundView];
      [v103 frame];
      -[CAMPanoramaView convertRect:toView:](self, "convertRect:toView:", v103);
      double v104 = CGRectGetHeight(v154);
      BOOL v105 = [(CAMPanoramaView *)self _isCurrentlyShowingMoveInstructions];
      if (v102 <= v104 * 0.25)
      {
        if (v102 <= v104 * 0.125)
        {
          if (v105)
          {
            [(CAMPanoramaView *)self _cancelDelayedMoveInstructions];
            [(CAMPanoramaView *)self _hideInstructionLabel];
          }
        }
        else if (v101 <= 0.0)
        {
          [(CAMPanoramaView *)self _showMoveDownInstructionsAfterDelay];
        }
        else
        {
          [(CAMPanoramaView *)self _showMoveUpInstructionsAfterDelay];
        }
      }
      else if (v101 <= 0.0)
      {
        [(CAMPanoramaView *)self _showMoveDownInstructions];
      }
      else
      {
        [(CAMPanoramaView *)self _showMoveUpInstructions];
      }
    }
  }
  v106 = [(CAMPanoramaView *)self _arrowView];
  CAMViewSetBoundsAndCenterForFrame(v106, v90, v92, v94, v96);

  v107 = [(CAMPanoramaView *)self _instructionLabel];
  objc_msgSend(v107, "sizeThatFits:", v127, v126);
  double v129 = v108;
  double v110 = v109;
  double v111 = *MEMORY[0x263F00148];
  double v112 = *(double *)(MEMORY[0x263F00148] + 8);
  UIRectCenteredIntegralRectScale();
  double v114 = v113;
  UIRectGetCenter();
  double v123 = v115;
  v155.origin.CGFloat y = v132;
  v155.origin.CGFloat x = v133;
  v155.size.CGFloat height = v130;
  v155.size.double width = v131;
  CGFloat v116 = CGRectGetMaxY(v155) + v114 * 0.5 + 10.0;
  objc_msgSend(v107, "setBounds:", v111, v112, v129, v110, 0);
  objc_msgSend(v107, "setCenter:", v123, v116);
  -[CAMPanoramaView _setLastLayoutBounds:](self, "_setLastLayoutBounds:", v125, v124, v127, v126);
}

uint64_t __33__CAMPanoramaView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __33__CAMPanoramaView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGRect)_frameForArrowViewWithDirection:(int64_t)a3 offset:(double)a4
{
  CGFloat v6 = [(CAMPanoramaView *)self _stripBackgroundView];
  double v7 = [(CAMPanoramaView *)self _arrowView];
  [v7 intrinsicContentSize];
  [v6 bounds];
  UIRectCenteredIntegralRectScale();
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  UIRectGetCenter();
  if (a3 == 1 || a3 == 2)
  {
    objc_msgSend(v6, "bounds", 0);
    CGRectGetWidth(v28);
  }
  UIRoundToViewScale();
  [(CAMPanoramaView *)self bounds];
  -[CAMPanoramaView _previewSizeForBounds:](self, "_previewSizeForBounds:");
  [(CAMPanoramaView *)self _filteredNormalizedBaselineOffset];
  CEKClamp();
  v29.origin.CGFloat x = v9;
  v29.origin.CGFloat y = v11;
  v29.size.double width = v13;
  v29.size.CGFloat height = v15;
  CGRectGetMidY(v29);
  UIRectCenteredAboutPointScale();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.CGFloat height = v27;
  result.size.double width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CAMPanoramaView;
  long long v5 = *(_OWORD *)&a3->c;
  long long v19 = *(_OWORD *)&a3->a;
  long long v20 = v5;
  long long v21 = *(_OWORD *)&a3->tx;
  [(CAMPanoramaView *)&v22 setTransform:&v19];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  CGAffineTransformMakeRotation(&v18, 3.14159265);
  UIIntegralTransform();
  CGFloat v6 = [(CAMPanoramaView *)self _instructionLabel];
  double v7 = (void *)MEMORY[0x263F82E00];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  long long v8 = *(_OWORD *)&a3->c;
  long long v12 = *(_OWORD *)&a3->a;
  long long v13 = v8;
  long long v14 = *(_OWORD *)&a3->tx;
  long long v15 = v19;
  v10[2] = __32__CAMPanoramaView_setTransform___block_invoke;
  v10[3] = &unk_263FA4F90;
  long long v16 = v20;
  long long v17 = v21;
  id v11 = v6;
  id v9 = v6;
  [v7 performWithoutAnimation:v10];
}

uint64_t __32__CAMPanoramaView_setTransform___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&t1.c = v2;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a1 + 72);
  long long v3 = *(_OWORD *)(a1 + 104);
  *(_OWORD *)&v9.a = *(_OWORD *)(a1 + 88);
  *(_OWORD *)&v9.c = v3;
  *(_OWORD *)&v9.tCGFloat x = *(_OWORD *)(a1 + 120);
  BOOL v4 = CGAffineTransformEqualToTransform(&t1, &v9);
  long long v5 = *(void **)(a1 + 32);
  if (v4) {
    CGFloat v6 = (_OWORD *)(a1 + 88);
  }
  else {
    CGFloat v6 = (_OWORD *)MEMORY[0x263F000D0];
  }
  long long v7 = v6[1];
  *(_OWORD *)&t1.a = *v6;
  *(_OWORD *)&t1.c = v7;
  *(_OWORD *)&t1.tCGFloat x = v6[2];
  return [v5 setTransform:&t1];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  BOOL v4 = [(CAMPanoramaView *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0) {
    [(CAMPanoramaView *)self setNeedsLayout];
  }
}

- (void)setPanoramaCaptureSize:(CGSize)a3
{
  if (self->_panoramaCaptureSize.width != a3.width || self->_panoramaCaptureSize.height != a3.height)
  {
    self->_panoramaCaptureSize = a3;
    [(CAMPanoramaView *)self setNeedsLayout];
  }
}

- (void)startPainting
{
  [(CAMPanoramaView *)self _resetPaintingUIAnimated:0];
  [(CAMPanoramaView *)self layoutIfNeeded];
  [(CAMPanoramaView *)self _setPainting:1];
  [(CAMPanoramaView *)self _setArrowUpdateFrame:0];
  id v3 = [(CAMPanoramaView *)self _arrowView];
  [v3 center];
  -[CAMPanoramaView _setInitialArrowCenter:](self, "_setInitialArrowCenter:");
  [(CAMPanoramaView *)self _showArrowInstructions];
  [(CAMPanoramaView *)self _hideArrowInstructionsAfterDelay];
  [(CAMPanoramaView *)self _setCurrentlyShowingMoveInstructions:0];
  [(CAMPanoramaView *)self _setCurrentlyMovingTooFast:0];
  [(CAMPanoramaView *)self setNeedsLayout];
}

- (void)updatePaintingWithStatus:(id)a3
{
  id v18 = a3;
  [v18 speed];
  uint64_t v5 = 0;
  previousSpeeds = self->__previousSpeeds;
  double v7 = 0.0;
  do
  {
    double v8 = previousSpeeds[v5 + 1];
    previousSpeeds[v5] = v8;
    double v7 = v7 + v8;
    ++v5;
  }
  while (v5 != 3);
  previousSpeeds[3] = v4;
  double v9 = (v4 + v7) * 0.25;
  [(CAMPanoramaView *)self _currentAverageSpeed];
  if (v9 >= 1.0 && v10 < 1.0)
  {
    [(CAMPanoramaView *)self _setCurrentlyMovingTooFast:1];
    [(CAMPanoramaView *)self _showSpeedInstructions];
  }
  else if (v9 < 1.0 && v10 >= 1.0)
  {
    [(CAMPanoramaView *)self _setCurrentlyMovingTooFast:0];
    [(CAMPanoramaView *)self _hideSpeedInstructionsAfterDelay];
  }
  unint64_t v13 = [(CAMPanoramaView *)self _arrowUpdateFrame];
  if (v13 == 5)
  {
    [(CAMPanoramaView *)self _setArrowUpdateFrame:0];
    long long v14 = [(CAMPanoramaView *)self _arrowView];
    [v14 animateWithNormalizedSpeed:v9 duration:0.166666667];
  }
  else
  {
    [(CAMPanoramaView *)self _setArrowUpdateFrame:v13 + 1];
  }
  [(CAMPanoramaView *)self _setCurrentAverageSpeed:v9];
  [(CAMPanoramaView *)self _setCurrentPaintingStatus:v18];
  [v18 normalizedBaselineOffset];
  double v16 = v15;
  [(CAMPanoramaView *)self _filteredNormalizedBaselineOffset];
  [(CAMPanoramaView *)self _setFilteredNormalizedBaselineOffset:v17 * 0.8 + v16 * 0.2];
  [(CAMPanoramaView *)self setNeedsLayout];
}

- (void)stopPainting
{
}

- (void)setDirection:(int64_t)a3
{
}

- (void)setDirection:(int64_t)a3 animated:(BOOL)a4
{
  v38[3] = *MEMORY[0x263EF8340];
  if (self->_direction != a3)
  {
    BOOL v4 = a4;
    self->_direction = a3;
    if (a3 == 2) {
      double v7 = 3.14159265;
    }
    else {
      double v7 = 0.0;
    }
    double v8 = [(CAMPanoramaView *)self _arrowView];
    double v9 = [v8 layer];
    if (v4)
    {
      if (a3 == 2) {
        double v10 = 10.0;
      }
      else {
        double v10 = -10.0;
      }
      id v11 = [(CAMPanoramaView *)self _stripContainerView];
      long long v12 = (void *)MEMORY[0x263F82E00];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __41__CAMPanoramaView_setDirection_animated___block_invoke;
      v35[3] = &unk_263FA0208;
      id v36 = v11;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __41__CAMPanoramaView_setDirection_animated___block_invoke_2;
      v31[3] = &unk_263FA5260;
      int64_t v33 = a3;
      uint64_t v34 = 6;
      v31[4] = self;
      id v32 = v36;
      id v29 = v36;
      [v12 animateWithDuration:6 delay:v35 options:v31 animations:0.3 completion:0.0];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __41__CAMPanoramaView_setDirection_animated___block_invoke_5;
      v30[3] = &unk_263FA04E0;
      v30[4] = self;
      v30[5] = a3;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v30 options:0 animations:0.4 completion:0.0];
      unint64_t v13 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.scale"];
      [v13 setKeyTimes:&unk_26BDE03A0];
      [v13 setValues:&unk_26BDE03B8];
      long long v14 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.translation.x"];
      [v14 setKeyTimes:&unk_26BDE03D0];
      v38[0] = &unk_26BDDF4E8;
      double v15 = [NSNumber numberWithDouble:v10];
      v38[1] = v15;
      v38[2] = &unk_26BDDF4E8;
      double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:3];
      [v14 setValues:v16];

      double v17 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.y"];
      uint64_t v18 = [v9 presentationLayer];
      long long v19 = (void *)v18;
      if (v18) {
        long long v20 = (void *)v18;
      }
      else {
        long long v20 = v9;
      }
      id v21 = v20;

      objc_super v22 = [v21 valueForKeyPath:@"transform.rotation.y"];
      [v17 setFromValue:v22];

      double v23 = [NSNumber numberWithDouble:v7];
      [v17 setToValue:v23];

      [v17 setDuration:0.4];
      uint64_t v24 = *MEMORY[0x263F15AA8];
      [v17 setFillMode:*MEMORY[0x263F15AA8]];
      double v25 = [MEMORY[0x263F15750] animation];
      v37[0] = v17;
      v37[1] = v13;
      v37[2] = v14;
      double v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:3];
      [v25 setAnimations:v26];

      [v25 setDuration:0.4];
      [v9 convertTime:0 fromLayer:CACurrentMediaTime()];
      [v25 setBeginTime:v27 + 0.2];
      [v25 setFillMode:v24];
      [v9 addAnimation:v25 forKey:@"panoramaDirectionChange"];
    }
    else
    {
      [(CAMPanoramaView *)self setNeedsLayout];
    }
    CGRect v28 = [NSNumber numberWithDouble:v7];
    [v9 setValue:v28 forKeyPath:@"transform.rotation.y"];
  }
}

uint64_t __41__CAMPanoramaView_setDirection_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __41__CAMPanoramaView_setDirection_animated___block_invoke_2(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__CAMPanoramaView_setDirection_animated___block_invoke_3;
  v9[3] = &unk_263FA0208;
  v9[4] = *(void *)(a1 + 32);
  [MEMORY[0x263F82E00] performWithoutAnimation:v9];
  if (a2)
  {
    BOOL v4 = [*(id *)(a1 + 32) delegate];
    [v4 panoramaViewDidRequestSynchronizedDirectionChange:*(void *)(a1 + 32) toDirection:*(void *)(a1 + 48)];
    uint64_t v5 = (void *)MEMORY[0x263F82E00];
    uint64_t v6 = *(void *)(a1 + 56);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__CAMPanoramaView_setDirection_animated___block_invoke_4;
    v7[3] = &unk_263FA0208;
    id v8 = *(id *)(a1 + 40);
    [v5 animateWithDuration:v6 delay:v7 options:0 animations:0.3 completion:0.0];
  }
}

uint64_t __41__CAMPanoramaView_setDirection_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __41__CAMPanoramaView_setDirection_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __41__CAMPanoramaView_setDirection_animated___block_invoke_5(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) _stripContainerView];
  [v2 size];
  +[CAMPanoramaUtilities singlePreviewFrameWidthForPreviewHeight:v3];
  double v5 = v4;

  [*(id *)(a1 + 32) _frameForArrowViewWithDirection:*(void *)(a1 + 40) offset:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [*(id *)(a1 + 32) _arrowView];
  CAMViewSetBoundsAndCenterForFrame(v14, v7, v9, v11, v13);
}

- (void)startProcessingPanorama
{
  double v3 = [(CAMPanoramaView *)self _instructionLabel];
  double v4 = [(CAMPanoramaView *)self _arrowView];
  double v5 = [(CAMPanoramaView *)self _levelView];
  double v6 = (void *)MEMORY[0x263F82E00];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__CAMPanoramaView_startProcessingPanorama__block_invoke;
  v10[3] = &unk_263FA0CD0;
  id v11 = v3;
  id v12 = v4;
  id v13 = v5;
  id v7 = v5;
  id v8 = v4;
  id v9 = v3;
  [v6 animateWithDuration:2 delay:v10 options:0 animations:0.1 completion:0.0];
}

uint64_t __42__CAMPanoramaView_startProcessingPanorama__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 40) setAlpha:0.0];
  long long v2 = *(void **)(a1 + 48);
  return [v2 setAlpha:0.0];
}

- (void)finishedProcessingPanorama
{
  if (![(CAMPanoramaView *)self isPainting])
  {
    [(CAMPanoramaView *)self _resetPaintingUIAnimated:1];
  }
}

- (void)_resetPaintingUIAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CAMPanoramaView *)self _updateInstructionLabelForInstruction:1];
  [(CAMPanoramaView *)self _setCurrentlyShowingMoveInstructions:0];
  [(CAMPanoramaView *)self _setCurrentlyMovingTooFast:0];
  [(CAMPanoramaView *)self _setCurrentAverageSpeed:0.0];
  [(CAMPanoramaView *)self _setArrowUpdateFrame:0];
  double v5 = [(CAMPanoramaView *)self _instructionLabel];
  double v6 = [(CAMPanoramaView *)self _arrowView];
  id v7 = [(CAMPanoramaView *)self _levelView];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__CAMPanoramaView__resetPaintingUIAnimated___block_invoke;
  aBlock[3] = &unk_263FA0CD0;
  id v8 = v5;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  id v11 = (void (**)(void))_Block_copy(aBlock);
  [v9 reset];
  if (v3) {
    [MEMORY[0x263F82E00] animateWithDuration:2 delay:v11 options:0 animations:0.1 completion:0.0];
  }
  else {
    v11[2](v11);
  }
  [(CAMPanoramaView *)self _setCurrentPaintingStatus:0];
  [(CAMPanoramaView *)self _setFilteredNormalizedBaselineOffset:0.0];
  [(CAMPanoramaView *)self setNeedsLayout];
}

uint64_t __44__CAMPanoramaView__resetPaintingUIAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(a1 + 40) setAlpha:1.0];
  long long v2 = *(void **)(a1 + 48);
  return [v2 setAlpha:1.0];
}

- (void)_hideInstructionLabel
{
  if (![(CAMPanoramaView *)self _isCurrentlyMovingTooFast])
  {
    BOOL v3 = [(CAMPanoramaView *)self _instructionLabel];
    double v4 = (void *)MEMORY[0x263F82E00];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__CAMPanoramaView__hideInstructionLabel__block_invoke;
    v6[3] = &unk_263FA0208;
    id v7 = v3;
    id v5 = v3;
    [v4 animateWithDuration:2 delay:v6 options:0 animations:0.5 completion:0.0];
  }
}

uint64_t __40__CAMPanoramaView__hideInstructionLabel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)_updateInstructionLabelForInstruction:(int64_t)a3
{
  id v5 = [(CAMPanoramaView *)self _instructionLabel];
  switch(a3)
  {
    case 1:
      uint64_t v6 = [(CAMPanoramaView *)self _instructionString];
      goto LABEL_8;
    case 2:
      uint64_t v6 = [(CAMPanoramaView *)self _arrowString];
      goto LABEL_8;
    case 3:
      uint64_t v6 = [(CAMPanoramaView *)self _speedString];
      goto LABEL_8;
    case 4:
      uint64_t v6 = [(CAMPanoramaView *)self _moveUpString];
      goto LABEL_8;
    case 5:
      uint64_t v6 = [(CAMPanoramaView *)self _moveDownString];
LABEL_8:
      id v7 = (__CFString *)v6;
      break;
    default:
      id v7 = &stru_26BD78BA0;
      break;
  }
  [v5 setText:v7];
  [v5 alpha];
  if (v8 < 1.0)
  {
    id v9 = (void *)MEMORY[0x263F82E00];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__CAMPanoramaView__updateInstructionLabelForInstruction___block_invoke;
    v11[3] = &unk_263FA0208;
    id v12 = v5;
    [v9 animateWithDuration:2 delay:v11 options:0 animations:0.5 completion:0.0];
  }
  id v10 = [(CAMPanoramaView *)self delegate];
  [v10 panoramaView:self didUpdateInstruction:a3];
}

uint64_t __57__CAMPanoramaView__updateInstructionLabelForInstruction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_showMoveDownInstructions
{
  if ([(CAMPanoramaView *)self isPainting])
  {
    [(CAMPanoramaView *)self _updateInstructionLabelForInstruction:5];
    [(CAMPanoramaView *)self _setCurrentlyShowingMoveInstructions:1];
  }
}

- (void)_showMoveUpInstructions
{
  if ([(CAMPanoramaView *)self isPainting])
  {
    [(CAMPanoramaView *)self _updateInstructionLabelForInstruction:4];
    [(CAMPanoramaView *)self _setCurrentlyShowingMoveInstructions:1];
  }
}

- (void)_cancelDelayedMoveInstructions
{
  +[CAMPanoramaView cancelPreviousPerformRequestsWithTarget:self selector:sel__showMoveDownInstructions object:0];
  +[CAMPanoramaView cancelPreviousPerformRequestsWithTarget:self selector:sel__showMoveUpInstructions object:0];
}

- (void)_showMoveDownInstructionsAfterDelay
{
  if (![(CAMPanoramaView *)self _isCurrentlyShowingMoveInstructions])
  {
    [(CAMPanoramaView *)self _cancelDelayedMoveInstructions];
    [(CAMPanoramaView *)self performSelector:sel__showMoveDownInstructions withObject:0 afterDelay:2.0];
  }
}

- (void)_showMoveUpInstructionsAfterDelay
{
  if (![(CAMPanoramaView *)self _isCurrentlyShowingMoveInstructions])
  {
    [(CAMPanoramaView *)self _cancelDelayedMoveInstructions];
    [(CAMPanoramaView *)self performSelector:sel__showMoveUpInstructions withObject:0 afterDelay:2.0];
  }
}

- (void)_hideSpeedInstructionsAfterDelay
{
}

- (void)_showSpeedInstructions
{
  +[CAMPanoramaView cancelPreviousPerformRequestsWithTarget:self selector:sel__hideInstructionLabel object:0];
  [(CAMPanoramaView *)self _cancelDelayedMoveInstructions];
  [(CAMPanoramaView *)self _updateInstructionLabelForInstruction:3];
  [(CAMPanoramaView *)self _setCurrentlyShowingMoveInstructions:0];
}

- (void)_hideArrowInstructionsAfterDelay
{
}

- (void)_showArrowInstructions
{
  [(CAMPanoramaView *)self _updateInstructionLabelForInstruction:2];
  [(CAMPanoramaView *)self setNeedsLayout];
}

- (int64_t)direction
{
  return self->_direction;
}

- (CAMPanoramaViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMPanoramaViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CAMPanoramaPreviewView)previewView
{
  return self->_previewView;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (CGSize)panoramaCaptureSize
{
  double width = self->_panoramaCaptureSize.width;
  double height = self->_panoramaCaptureSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isPainting
{
  return self->_painting;
}

- (void)_setPainting:(BOOL)a3
{
  self->_painting = a3;
}

- (UIView)_stripBackgroundView
{
  return self->__stripBackgroundView;
}

- (UIView)_stripContainerView
{
  return self->__stripContainerView;
}

- (UIView)_maskingView
{
  return self->__maskingView;
}

- (CAMPanoramaArrowView)_arrowView
{
  return self->__arrowView;
}

- (CAMPanoramaLevelView)_levelView
{
  return self->__levelView;
}

- (CAMPanoramaLabel)_instructionLabel
{
  return self->__instructionLabel;
}

- (NSString)_speedString
{
  return self->__speedString;
}

- (NSString)_moveUpString
{
  return self->__moveUpString;
}

- (NSString)_moveDownString
{
  return self->__moveDownString;
}

- (NSString)_arrowString
{
  return self->__arrowString;
}

- (NSString)_instructionString
{
  return self->__instructionString;
}

- (CGPoint)_initialArrowCenter
{
  double x = self->__initialArrowCenter.x;
  double y = self->__initialArrowCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setInitialArrowCenter:(CGPoint)a3
{
  self->__initialArrowCenter = a3;
}

- (CGRect)_lastLayoutBounds
{
  double x = self->__lastLayoutBounds.origin.x;
  double y = self->__lastLayoutBounds.origin.y;
  double width = self->__lastLayoutBounds.size.width;
  double height = self->__lastLayoutBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setLastLayoutBounds:(CGRect)a3
{
  self->__lastLayoutBounds = a3;
}

- (CAMPanoramaPaintingStatus)_currentPaintingStatus
{
  return self->__currentPaintingStatus;
}

- (void)_setCurrentPaintingStatus:(id)a3
{
}

- (double)_filteredNormalizedBaselineOffset
{
  return self->__filteredNormalizedBaselineOffset;
}

- (void)_setFilteredNormalizedBaselineOffset:(double)a3
{
  self->__filteredNormalizedBaselineOffset = a3;
}

- (BOOL)_isCurrentlyShowingMoveInstructions
{
  return self->__currentlyShowingMoveInstructions;
}

- (void)_setCurrentlyShowingMoveInstructions:(BOOL)a3
{
  self->__currentlyShowingMoveInstructions = a3;
}

- (double)_previousSpeeds
{
  return self->__previousSpeeds;
}

- (BOOL)_isCurrentlyMovingTooFast
{
  return self->__currentlyMovingTooFast;
}

- (void)_setCurrentlyMovingTooFast:(BOOL)a3
{
  self->__currentlyMovingTooFast = a3;
}

- (double)_currentAverageSpeed
{
  return self->__currentAverageSpeed;
}

- (void)_setCurrentAverageSpeed:(double)a3
{
  self->__currentAverageSpeed = a3;
}

- (unint64_t)_arrowUpdateFrame
{
  return self->__arrowUpdateFrame;
}

- (void)_setArrowUpdateFrame:(unint64_t)a3
{
  self->__arrowUpdateFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentPaintingStatus, 0);
  objc_storeStrong((id *)&self->__instructionString, 0);
  objc_storeStrong((id *)&self->__arrowString, 0);
  objc_storeStrong((id *)&self->__moveDownString, 0);
  objc_storeStrong((id *)&self->__moveUpString, 0);
  objc_storeStrong((id *)&self->__speedString, 0);
  objc_storeStrong((id *)&self->__instructionLabel, 0);
  objc_storeStrong((id *)&self->__levelView, 0);
  objc_storeStrong((id *)&self->__arrowView, 0);
  objc_storeStrong((id *)&self->__maskingView, 0);
  objc_storeStrong((id *)&self->__stripContainerView, 0);
  objc_storeStrong((id *)&self->__stripBackgroundView, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end