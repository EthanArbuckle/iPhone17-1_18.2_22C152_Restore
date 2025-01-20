@interface PKPalettePencilInteractionFeedbackHostView
- (BOOL)_isPencilInteractionFeedbackViewAlmostOffScreen;
- (BOOL)isPencilInteractionFeedbackViewVisible;
- (CGSize)minimizedPaletteSize;
- (NSLayoutConstraint)layoutGuideCenterXConstraint;
- (NSLayoutConstraint)layoutGuideCenterYConstraint;
- (NSLayoutConstraint)layoutGuideHeightConstraint;
- (NSLayoutConstraint)layoutGuideWidthConstraint;
- (NSLayoutConstraint)pencilInteractionFeedbackViewBottomConstraint;
- (NSLayoutConstraint)pencilInteractionFeedbackViewCenterXConstraint;
- (NSLayoutConstraint)pencilInteractionFeedbackViewCenterYConstraint;
- (NSLayoutConstraint)pencilInteractionFeedbackViewLeftConstraint;
- (NSLayoutConstraint)pencilInteractionFeedbackViewRightConstraint;
- (NSLayoutConstraint)pencilInteractionFeedbackViewTopConstraint;
- (NSTimer)pencilInteractionFeedbackViewAutodismissTimer;
- (PKPalettePencilInteractionFeedbackHostView)initWithDelegate:(id)a3;
- (PKPalettePencilInteractionFeedbackHostViewDelegate)delegate;
- (PKPalettePencilInteractionFeedbackView)pencilInteractionFeedbackView;
- (UILayoutGuide)pencilInteractionFeedbackViewLayoutGuide;
- (UIViewFloatAnimatableProperty)feedbackViewVisibilityAnimatableProperty;
- (double)minimizedPaletteScaleFactor;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)_palettePosition;
- (void)_animatePencilInteractionFeedbackViewToVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_updateLayoutGuideConstraints;
- (void)hideFeedbackView;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setFeedbackViewVisibilityAnimatableProperty:(id)a3;
- (void)setLayoutGuideCenterXConstraint:(id)a3;
- (void)setLayoutGuideCenterYConstraint:(id)a3;
- (void)setLayoutGuideHeightConstraint:(id)a3;
- (void)setLayoutGuideWidthConstraint:(id)a3;
- (void)setPencilInteractionFeedbackView:(id)a3;
- (void)setPencilInteractionFeedbackViewAutodismissTimer:(id)a3;
- (void)setPencilInteractionFeedbackViewBottomConstraint:(id)a3;
- (void)setPencilInteractionFeedbackViewCenterXConstraint:(id)a3;
- (void)setPencilInteractionFeedbackViewCenterYConstraint:(id)a3;
- (void)setPencilInteractionFeedbackViewLayoutGuide:(id)a3;
- (void)setPencilInteractionFeedbackViewLeftConstraint:(id)a3;
- (void)setPencilInteractionFeedbackViewRightConstraint:(id)a3;
- (void)setPencilInteractionFeedbackViewTopConstraint:(id)a3;
- (void)setPencilInteractionFeedbackViewVisible:(BOOL)a3;
- (void)showFeedbackForCurrentlySelectedToolInPaletteView;
@end

@implementation PKPalettePencilInteractionFeedbackHostView

- (PKPalettePencilInteractionFeedbackHostView)initWithDelegate:(id)a3
{
  v31[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKPalettePencilInteractionFeedbackHostView;
  v5 = -[PKPalettePencilInteractionFeedbackHostView initWithFrame:](&v30, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    pencilInteractionFeedbackViewLayoutGuide = v6->_pencilInteractionFeedbackViewLayoutGuide;
    v6->_pencilInteractionFeedbackViewLayoutGuide = v7;

    [(PKPalettePencilInteractionFeedbackHostView *)v6 addLayoutGuide:v6->_pencilInteractionFeedbackViewLayoutGuide];
    v9 = [(UILayoutGuide *)v6->_pencilInteractionFeedbackViewLayoutGuide widthAnchor];
    v10 = [(PKPalettePencilInteractionFeedbackHostView *)v6 widthAnchor];
    uint64_t v11 = [v9 constraintEqualToAnchor:v10];
    layoutGuideWidthConstraint = v6->_layoutGuideWidthConstraint;
    v6->_layoutGuideWidthConstraint = (NSLayoutConstraint *)v11;

    v13 = [(UILayoutGuide *)v6->_pencilInteractionFeedbackViewLayoutGuide heightAnchor];
    v14 = [(PKPalettePencilInteractionFeedbackHostView *)v6 heightAnchor];
    uint64_t v15 = [v13 constraintEqualToAnchor:v14];
    layoutGuideHeightConstraint = v6->_layoutGuideHeightConstraint;
    v6->_layoutGuideHeightConstraint = (NSLayoutConstraint *)v15;

    v17 = [(UILayoutGuide *)v6->_pencilInteractionFeedbackViewLayoutGuide centerXAnchor];
    v18 = [(PKPalettePencilInteractionFeedbackHostView *)v6 centerXAnchor];
    uint64_t v19 = [v17 constraintEqualToAnchor:v18];
    layoutGuideCenterXConstraint = v6->_layoutGuideCenterXConstraint;
    v6->_layoutGuideCenterXConstraint = (NSLayoutConstraint *)v19;

    v21 = [(UILayoutGuide *)v6->_pencilInteractionFeedbackViewLayoutGuide centerYAnchor];
    v22 = [(PKPalettePencilInteractionFeedbackHostView *)v6 centerYAnchor];
    uint64_t v23 = [v21 constraintEqualToAnchor:v22];
    layoutGuideCenterYConstraint = v6->_layoutGuideCenterYConstraint;
    v6->_layoutGuideCenterYConstraint = (NSLayoutConstraint *)v23;

    v25 = (void *)MEMORY[0x1E4F28DC8];
    v31[0] = v6->_layoutGuideWidthConstraint;
    v31[1] = v6->_layoutGuideHeightConstraint;
    v31[2] = v6->_layoutGuideCenterXConstraint;
    v31[3] = v6->_layoutGuideCenterYConstraint;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
    [v25 activateConstraints:v26];

    v27 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    feedbackViewVisibilityAnimatableProperty = v6->_feedbackViewVisibilityAnimatableProperty;
    v6->_feedbackViewVisibilityAnimatableProperty = v27;

    [(UIViewFloatAnimatableProperty *)v6->_feedbackViewVisibilityAnimatableProperty setValue:0.0];
  }

  return v6;
}

- (CGSize)minimizedPaletteSize
{
  v3 = [(PKPalettePencilInteractionFeedbackHostView *)self traitCollection];
  id v4 = [(PKPalettePencilInteractionFeedbackHostView *)self window];
  v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  v7 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
  v8 = [v7 paletteView];
  [v8 minimizedPaletteSize];
  double v10 = v9;
  double v12 = v11;

  if (v6)
  {
    double v10 = v10 * 0.8;
    double v12 = v12 * 0.8;
  }
  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)minimizedPaletteScaleFactor
{
  v3 = [(PKPalettePencilInteractionFeedbackHostView *)self traitCollection];
  id v4 = [(PKPalettePencilInteractionFeedbackHostView *)self window];
  v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  v7 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
  v8 = [v7 paletteView];
  double v9 = v8;
  if (v6)
  {
    double v10 = [v8 paletteScaleFactorPolicy];
    double v11 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
    double v12 = [v11 paletteView];
    [v12 adjustedWindowSceneBounds];
    objc_msgSend(v10, "scaleFactorForWindowBounds:");
    double v14 = v13;
  }
  else
  {
    [v8 paletteScaleFactor];
    double v14 = v15;
  }

  return v14 * 0.8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PKPalettePencilInteractionFeedbackHostView;
  -[PKPalettePencilInteractionFeedbackHostView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PKPalettePencilInteractionFeedbackHostView *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)PKPalettePencilInteractionFeedbackHostView;
  [(PKPalettePencilInteractionFeedbackHostView *)&v39 layoutSubviews];
  v3 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];

  if (v3)
  {
    [(PKPalettePencilInteractionFeedbackHostView *)self minimizedPaletteSize];
    double v5 = v4 * 0.5;
    BOOL v6 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    [v6 _setCornerRadius:v5];

    v7 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
    id v8 = [v7 paletteShadowColor];
    uint64_t v9 = [v8 CGColor];
    double v10 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    double v11 = [v10 layer];
    [v11 setShadowColor:v9];

    double v12 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
    [v12 paletteShadowOpacity];
    *(float *)&double v5 = v13;
    double v14 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    double v15 = [v14 layer];
    LODWORD(v16) = LODWORD(v5);
    [v15 setShadowOpacity:v16];

    v17 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
    [v17 paletteShadowOffset];
    double v19 = v18;
    double v21 = v20;
    v22 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    uint64_t v23 = [v22 layer];
    objc_msgSend(v23, "setShadowOffset:", v19, v21);

    v24 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
    [v24 paletteShadowRadius];
    double v26 = v25;
    v27 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    v28 = [v27 layer];
    [v28 setShadowRadius:v26];

    v29 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
    id v30 = [v29 paletteBorderColor];
    uint64_t v31 = [v30 CGColor];
    v32 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    v33 = [v32 layer];
    [v33 setBorderColor:v31];

    v34 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
    [v34 paletteBorderWidth];
    double v36 = v35;
    v37 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    v38 = [v37 layer];
    [v38 setBorderWidth:v36];
  }
}

- (BOOL)_isPencilInteractionFeedbackViewAlmostOffScreen
{
  v2 = [(PKPalettePencilInteractionFeedbackHostView *)self feedbackViewVisibilityAnimatableProperty];
  [v2 presentationValue];
  BOOL v4 = v3 < 0.5;

  return v4;
}

- (void)showFeedbackForCurrentlySelectedToolInPaletteView
{
  v92[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewAutodismissTimer];
  [v3 invalidate];

  [(PKPalettePencilInteractionFeedbackHostView *)self setPencilInteractionFeedbackViewAutodismissTimer:0];
  objc_initWeak(&location, self);
  BOOL v4 = (void *)MEMORY[0x1E4F1CB00];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __95__PKPalettePencilInteractionFeedbackHostView_showFeedbackForCurrentlySelectedToolInPaletteView__block_invoke;
  v80[3] = &unk_1E64C9870;
  objc_copyWeak(&v81, &location);
  double v5 = [v4 scheduledTimerWithTimeInterval:0 repeats:v80 block:0.9];
  [(PKPalettePencilInteractionFeedbackHostView *)self setPencilInteractionFeedbackViewAutodismissTimer:v5];

  BOOL v6 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
  LODWORD(v3) = v6 == 0;

  if (v3)
  {
    v7 = objc_alloc_init(PKPalettePencilInteractionFeedbackView);
    [(PKPalettePencilInteractionFeedbackHostView *)self setPencilInteractionFeedbackView:v7];

    id v8 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v9 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    [(PKPalettePencilInteractionFeedbackHostView *)self addSubview:v9];

    [(PKPalettePencilInteractionFeedbackHostView *)self minimizedPaletteSize];
    double v11 = v10;
    double v13 = v12;
    double v14 = (void *)MEMORY[0x1E4F28DC8];
    double v15 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    double v16 = [v15 widthAnchor];
    v17 = [v16 constraintEqualToConstant:v11];
    v92[0] = v17;
    double v18 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    double v19 = [v18 heightAnchor];
    double v20 = [v19 constraintEqualToConstant:v13];
    v92[1] = v20;
    double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
    [v14 activateConstraints:v21];

    v22 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
    [v22 paletteEdgeSpacingForMinimized];
    double v24 = v23;

    double v25 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    double v26 = [v25 bottomAnchor];
    v27 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewLayoutGuide];
    v28 = [v27 bottomAnchor];
    v29 = [v26 constraintEqualToAnchor:v28 constant:-v24];
    [(PKPalettePencilInteractionFeedbackHostView *)self setPencilInteractionFeedbackViewBottomConstraint:v29];

    id v30 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    uint64_t v31 = [v30 leftAnchor];
    v32 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewLayoutGuide];
    v33 = [v32 leftAnchor];
    v34 = [v31 constraintEqualToAnchor:v33 constant:v24];
    [(PKPalettePencilInteractionFeedbackHostView *)self setPencilInteractionFeedbackViewLeftConstraint:v34];

    double v35 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    double v36 = [v35 topAnchor];
    v37 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewLayoutGuide];
    v38 = [v37 topAnchor];
    objc_super v39 = [v36 constraintEqualToAnchor:v38 constant:v24];
    [(PKPalettePencilInteractionFeedbackHostView *)self setPencilInteractionFeedbackViewTopConstraint:v39];

    v40 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    v41 = [v40 rightAnchor];
    v42 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewLayoutGuide];
    v43 = [v42 rightAnchor];
    v44 = [v41 constraintEqualToAnchor:v43 constant:-v24];
    [(PKPalettePencilInteractionFeedbackHostView *)self setPencilInteractionFeedbackViewRightConstraint:v44];

    v45 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    v46 = [v45 centerXAnchor];
    v47 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewLayoutGuide];
    v48 = [v47 centerXAnchor];
    v49 = [v46 constraintEqualToAnchor:v48];
    [(PKPalettePencilInteractionFeedbackHostView *)self setPencilInteractionFeedbackViewCenterXConstraint:v49];

    v50 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
    v51 = [v50 centerYAnchor];
    v52 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewLayoutGuide];
    v53 = [v52 centerYAnchor];
    v54 = [v51 constraintEqualToAnchor:v53];
    [(PKPalettePencilInteractionFeedbackHostView *)self setPencilInteractionFeedbackViewCenterYConstraint:v54];
  }
  if (![(PKPalettePencilInteractionFeedbackHostView *)self isPencilInteractionFeedbackViewVisible])
  {
    v55 = (void *)MEMORY[0x1E4F28DC8];
    v56 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewBottomConstraint];
    v91[0] = v56;
    v57 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewLeftConstraint];
    v91[1] = v57;
    v58 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewTopConstraint];
    v91[2] = v58;
    v59 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewRightConstraint];
    v91[3] = v59;
    v60 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewCenterXConstraint];
    v91[4] = v60;
    v61 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewCenterYConstraint];
    v91[5] = v61;
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:6];
    [v55 deactivateConstraints:v62];

    switch([(PKPalettePencilInteractionFeedbackHostView *)self _palettePosition])
    {
      case 1:
        v63 = (void *)MEMORY[0x1E4F28DC8];
        v64 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewTopConstraint];
        v89[0] = v64;
        v65 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewCenterXConstraint];
        v89[1] = v65;
        v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
        [v63 activateConstraints:v66];
        goto LABEL_13;
      case 2:
        v67 = (void *)MEMORY[0x1E4F28DC8];
        v64 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewRightConstraint];
        v87[0] = v64;
        v65 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewCenterYConstraint];
        v87[1] = v65;
        v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
        [v67 activateConstraints:v66];
        goto LABEL_13;
      case 3:
        v68 = (void *)MEMORY[0x1E4F28DC8];
        v64 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewBottomConstraint];
        v90[0] = v64;
        v65 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewCenterXConstraint];
        v90[1] = v65;
        v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
        [v68 activateConstraints:v66];
        goto LABEL_13;
      case 4:
        v69 = (void *)MEMORY[0x1E4F28DC8];
        v64 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewLeftConstraint];
        v88[0] = v64;
        v65 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewCenterYConstraint];
        v88[1] = v65;
        v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
        [v69 activateConstraints:v66];
        goto LABEL_13;
      case 5:
        v70 = (void *)MEMORY[0x1E4F28DC8];
        v64 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewTopConstraint];
        v86[0] = v64;
        v65 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewLeftConstraint];
        v86[1] = v65;
        v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
        [v70 activateConstraints:v66];
        goto LABEL_13;
      case 6:
        v71 = (void *)MEMORY[0x1E4F28DC8];
        v64 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewTopConstraint];
        v85[0] = v64;
        v65 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewRightConstraint];
        v85[1] = v65;
        v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
        [v71 activateConstraints:v66];
        goto LABEL_13;
      case 7:
        v72 = (void *)MEMORY[0x1E4F28DC8];
        v64 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewBottomConstraint];
        v83[0] = v64;
        v65 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewRightConstraint];
        v83[1] = v65;
        v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
        [v72 activateConstraints:v66];
        goto LABEL_13;
      case 8:
        v73 = (void *)MEMORY[0x1E4F28DC8];
        v64 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewBottomConstraint];
        v84[0] = v64;
        v65 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackViewLeftConstraint];
        v84[1] = v65;
        v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
        [v73 activateConstraints:v66];
LABEL_13:

        break;
      default:
        break;
    }
    [(PKPalettePencilInteractionFeedbackHostView *)self _updateLayoutGuideConstraints];
  }
  BOOL v74 = [(PKPalettePencilInteractionFeedbackHostView *)self _isPencilInteractionFeedbackViewAlmostOffScreen];
  v75 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
  v76 = [v75 paletteView];
  v77 = [v76 selectedToolView];
  v78 = [v77 tool];

  v79 = [(PKPalettePencilInteractionFeedbackHostView *)self pencilInteractionFeedbackView];
  [(PKPalettePencilInteractionFeedbackHostView *)self minimizedPaletteScaleFactor];
  objc_msgSend(v79, "showPreviewForTool:scalingFactor:animated:", v78, !v74);

  [(PKPalettePencilInteractionFeedbackHostView *)self _animatePencilInteractionFeedbackViewToVisible:1 animated:1 completion:0];
  objc_destroyWeak(&v81);
  objc_destroyWeak(&location);
}

void __95__PKPalettePencilInteractionFeedbackHostView_showFeedbackForCurrentlySelectedToolInPaletteView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _animatePencilInteractionFeedbackViewToVisible:0 animated:1 completion:0];
}

- (int64_t)_palettePosition
{
  v2 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
  double v3 = [v2 paletteView];
  int64_t v4 = [v3 palettePosition];

  return v4;
}

- (void)hideFeedbackView
{
}

- (void)_animatePencilInteractionFeedbackViewToVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = (void (**)(void))a5;
  if ([(PKPalettePencilInteractionFeedbackHostView *)self isPencilInteractionFeedbackViewVisible] != v6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __113__PKPalettePencilInteractionFeedbackHostView__animatePencilInteractionFeedbackViewToVisible_animated_completion___block_invoke;
    aBlock[3] = &unk_1E64C8030;
    aBlock[4] = self;
    BOOL v23 = v6;
    uint64_t v9 = _Block_copy(aBlock);
    double v10 = v9;
    if (v5)
    {
      [(PKPalettePencilInteractionFeedbackHostView *)self layoutIfNeeded];
      double v11 = (void *)MEMORY[0x1E4FB1EB0];
      double v12 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
      [v12 paletteSpringAnimationDampingRatio];
      double v14 = v13;
      double v15 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
      [v15 paletteSpringAnimationResponse];
      double v17 = v16;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __113__PKPalettePencilInteractionFeedbackHostView__animatePencilInteractionFeedbackViewToVisible_animated_completion___block_invoke_2;
      v20[3] = &unk_1E64C6960;
      v20[4] = self;
      id v21 = v10;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __113__PKPalettePencilInteractionFeedbackHostView__animatePencilInteractionFeedbackViewToVisible_animated_completion___block_invoke_3;
      v18[3] = &unk_1E64CA328;
      v18[4] = self;
      double v19 = v8;
      [v11 _animateUsingSpringWithDampingRatio:0 response:v20 tracking:v18 dampingRatioSmoothing:v14 responseSmoothing:v17 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
    }
    else
    {
      (*((void (**)(void *))v9 + 2))(v9);
      if (v8) {
        v8[2](v8);
      }
    }
  }
}

uint64_t __113__PKPalettePencilInteractionFeedbackHostView__animatePencilInteractionFeedbackViewToVisible_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPencilInteractionFeedbackViewVisible:*(unsigned __int8 *)(a1 + 40)];
  LOBYTE(v2) = *(unsigned char *)(a1 + 40);
  double v3 = (double)v2;
  int64_t v4 = [*(id *)(a1 + 32) feedbackViewVisibilityAnimatableProperty];
  [v4 setValue:v3];

  BOOL v5 = *(void **)(a1 + 32);

  return [v5 _updateLayoutGuideConstraints];
}

uint64_t __113__PKPalettePencilInteractionFeedbackHostView__animatePencilInteractionFeedbackViewToVisible_animated_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  unint64_t v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t __113__PKPalettePencilInteractionFeedbackHostView__animatePencilInteractionFeedbackViewToVisible_animated_completion___block_invoke_3(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isPencilInteractionFeedbackViewVisible] & 1) == 0)
  {
    unint64_t v2 = [*(id *)(a1 + 32) pencilInteractionFeedbackView];
    [v2 removeFromSuperview];

    [*(id *)(a1 + 32) setPencilInteractionFeedbackView:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_updateLayoutGuideConstraints
{
  double v3 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
  int64_t v4 = [v3 paletteView];
  [v4 paletteSizeForEdge:4];
  double v6 = v5;

  v7 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
  [v7 paletteEdgeSpacing];
  double v9 = v8;

  double v10 = v6 + v9;
  switch([(PKPalettePencilInteractionFeedbackHostView *)self _palettePosition])
  {
    case 1:
      goto LABEL_6;
    case 2:
      goto LABEL_10;
    case 3:
      goto LABEL_15;
    case 4:
      goto LABEL_19;
    case 5:
      double v11 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
      double v12 = [v11 paletteView];
      uint64_t v13 = [v12 edgeLocationToDockFromCorner:1];

      if (v13 == 2) {
        goto LABEL_19;
      }
      goto LABEL_5;
    case 6:
      double v14 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
      double v15 = [v14 paletteView];
      uint64_t v13 = [v15 edgeLocationToDockFromCorner:2];

      if (v13 == 8) {
        goto LABEL_10;
      }
LABEL_5:
      if (v13 != 1) {
        return;
      }
LABEL_6:
      double v16 = [(PKPalettePencilInteractionFeedbackHostView *)self layoutGuideCenterXConstraint];
      [v16 setConstant:0.0];

      if ([(PKPalettePencilInteractionFeedbackHostView *)self isPencilInteractionFeedbackViewVisible])
      {
        double v10 = 0.0;
      }
      else
      {
        double v10 = -v10;
      }
      goto LABEL_17;
    case 7:
      double v17 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
      double v18 = [v17 paletteView];
      uint64_t v19 = [v18 edgeLocationToDockFromCorner:8];

      if (v19 != 8) {
        goto LABEL_14;
      }
LABEL_10:
      if ([(PKPalettePencilInteractionFeedbackHostView *)self isPencilInteractionFeedbackViewVisible])
      {
        double v10 = 0.0;
      }
      goto LABEL_22;
    case 8:
      double v20 = [(PKPalettePencilInteractionFeedbackHostView *)self delegate];
      id v21 = [v20 paletteView];
      uint64_t v19 = [v21 edgeLocationToDockFromCorner:4];

      if (v19 == 2)
      {
LABEL_19:
        if ([(PKPalettePencilInteractionFeedbackHostView *)self isPencilInteractionFeedbackViewVisible])
        {
          double v10 = 0.0;
        }
        else
        {
          double v10 = -v10;
        }
LABEL_22:
        double v25 = [(PKPalettePencilInteractionFeedbackHostView *)self layoutGuideCenterXConstraint];
        [v25 setConstant:v10];

        BOOL v23 = [(PKPalettePencilInteractionFeedbackHostView *)self layoutGuideCenterYConstraint];
        double v24 = 0.0;
        id v26 = v23;
      }
      else
      {
LABEL_14:
        if (v19 != 4) {
          return;
        }
LABEL_15:
        v22 = [(PKPalettePencilInteractionFeedbackHostView *)self layoutGuideCenterXConstraint];
        [v22 setConstant:0.0];

        if ([(PKPalettePencilInteractionFeedbackHostView *)self isPencilInteractionFeedbackViewVisible])
        {
          double v10 = 0.0;
        }
LABEL_17:
        BOOL v23 = [(PKPalettePencilInteractionFeedbackHostView *)self layoutGuideCenterYConstraint];
        id v26 = v23;
        double v24 = v10;
      }
      [v23 setConstant:v24];

      return;
    default:
      return;
  }
}

- (PKPalettePencilInteractionFeedbackHostViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPalettePencilInteractionFeedbackHostViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPalettePencilInteractionFeedbackView)pencilInteractionFeedbackView
{
  return self->_pencilInteractionFeedbackView;
}

- (void)setPencilInteractionFeedbackView:(id)a3
{
}

- (NSTimer)pencilInteractionFeedbackViewAutodismissTimer
{
  return self->_pencilInteractionFeedbackViewAutodismissTimer;
}

- (void)setPencilInteractionFeedbackViewAutodismissTimer:(id)a3
{
}

- (UILayoutGuide)pencilInteractionFeedbackViewLayoutGuide
{
  return self->_pencilInteractionFeedbackViewLayoutGuide;
}

- (void)setPencilInteractionFeedbackViewLayoutGuide:(id)a3
{
}

- (NSLayoutConstraint)layoutGuideWidthConstraint
{
  return self->_layoutGuideWidthConstraint;
}

- (void)setLayoutGuideWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)layoutGuideHeightConstraint
{
  return self->_layoutGuideHeightConstraint;
}

- (void)setLayoutGuideHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)layoutGuideCenterXConstraint
{
  return self->_layoutGuideCenterXConstraint;
}

- (void)setLayoutGuideCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)layoutGuideCenterYConstraint
{
  return self->_layoutGuideCenterYConstraint;
}

- (void)setLayoutGuideCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)pencilInteractionFeedbackViewBottomConstraint
{
  return self->_pencilInteractionFeedbackViewBottomConstraint;
}

- (void)setPencilInteractionFeedbackViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)pencilInteractionFeedbackViewLeftConstraint
{
  return self->_pencilInteractionFeedbackViewLeftConstraint;
}

- (void)setPencilInteractionFeedbackViewLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)pencilInteractionFeedbackViewTopConstraint
{
  return self->_pencilInteractionFeedbackViewTopConstraint;
}

- (void)setPencilInteractionFeedbackViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)pencilInteractionFeedbackViewRightConstraint
{
  return self->_pencilInteractionFeedbackViewRightConstraint;
}

- (void)setPencilInteractionFeedbackViewRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)pencilInteractionFeedbackViewCenterXConstraint
{
  return self->_pencilInteractionFeedbackViewCenterXConstraint;
}

- (void)setPencilInteractionFeedbackViewCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)pencilInteractionFeedbackViewCenterYConstraint
{
  return self->_pencilInteractionFeedbackViewCenterYConstraint;
}

- (void)setPencilInteractionFeedbackViewCenterYConstraint:(id)a3
{
}

- (BOOL)isPencilInteractionFeedbackViewVisible
{
  return self->_pencilInteractionFeedbackViewVisible;
}

- (void)setPencilInteractionFeedbackViewVisible:(BOOL)a3
{
  self->_pencilInteractionFeedbackViewVisible = a3;
}

- (UIViewFloatAnimatableProperty)feedbackViewVisibilityAnimatableProperty
{
  return self->_feedbackViewVisibilityAnimatableProperty;
}

- (void)setFeedbackViewVisibilityAnimatableProperty:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackViewVisibilityAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackViewAutodismissTimer, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end