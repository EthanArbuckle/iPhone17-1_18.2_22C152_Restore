@interface PKPaletteHostView
+ (BOOL)_allowsHitTestAsOpaqueForRemoteEffects;
- (BOOL)_isPaletteAnimating;
- (BOOL)_shouldBeCompact;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isEffectivePaletteVisible;
- (BOOL)isPaletteDragging;
- (BOOL)isPaletteVisible;
- (BOOL)isPaletteVisualStateMinimized;
- (BOOL)paletteScrollGestureShouldScroll;
- (BOOL)panGestureDidStartInPaletteScrollView;
- (BOOL)panGestureShouldDragPaletteView;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGPoint)_projectedLandingPointForGestureRecognizerEnd:(id)a3;
- (CGPoint)draggingInitialPaletteCenterInSelf;
- (CGSize)_paletteSizeForVisualState:(int64_t)a3;
- (CGSize)paletteShadowOffset;
- (NSLayoutConstraint)paletteBottomConstraint;
- (NSLayoutConstraint)paletteCenterXConstraint;
- (NSLayoutConstraint)paletteCenterYConstraint;
- (NSLayoutConstraint)paletteHeightConstraint;
- (NSLayoutConstraint)paletteLeftConstraint;
- (NSLayoutConstraint)paletteRightConstraint;
- (NSLayoutConstraint)paletteTopConstraint;
- (NSLayoutConstraint)paletteWidthConstraint;
- (PKPaletteHostView)initWithPaletteView:(id)a3;
- (PKPaletteHostViewDelegate)delegate;
- (PKPalettePencilInteractionFeedbackHostView)pencilInteractionFeedbackHostView;
- (PKPaletteTooltipPresentationHandle)tooltipPresentationHandle;
- (PKPaletteTransition)paletteTransition;
- (PKPaletteView)paletteView;
- (UILongPressGestureRecognizer)touchDownFeedbackGestureRecognizer;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIPointerInteraction)pointerInteraction;
- (UITapGestureRecognizer)tapToExpandPaletteFromMinimizedGestureRecognizer;
- (double)_paletteEdgeMarginForTopEdge:(BOOL)a3 isBottomEdge:(BOOL)a4 isMinimized:(BOOL)a5;
- (double)_paletteEdgeMarginForTopEdge:(BOOL)a3 isMinimized:(BOOL)a4;
- (double)_paletteViewCompactHeight;
- (double)paletteBorderWidth;
- (double)paletteEdgeSpacing;
- (double)paletteEdgeSpacingForMinimized;
- (double)paletteShadowOpacity;
- (double)paletteShadowRadius;
- (double)paletteSpringAnimationDampingRatio;
- (double)paletteSpringAnimationResponse;
- (double)paletteViewBottomEdgeSpacing;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)paletteBorderColor;
- (id)paletteShadowColor;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)draggingPendingPaletteVisualState;
- (int64_t)lastNonCompactPalettePosition;
- (int64_t)paletteDraggingBehavior;
- (int64_t)palettePosition;
- (int64_t)paletteVisualState;
- (void)_activatePaletteCenterConstraints;
- (void)_cancelPanGestureIfNecessary;
- (void)_deactivatePaletteCenterConstraints;
- (void)_deactivatePaletteEdgeConstraints;
- (void)_dockPaletteToAutoHideCornerAnimated:(BOOL)a3;
- (void)_dockPaletteToPosition:(int64_t)a3 animated:(BOOL)a4;
- (void)_dockPaletteToPosition:(int64_t)a3 isFromUserReposition:(BOOL)a4 animated:(BOOL)a5;
- (void)_fixToBottomEdge;
- (void)_installPencilInteractionFeedbackHostViewIfNeeded;
- (void)_paletteDidDockToPosition:(int64_t)a3 fromUserReposition:(BOOL)a4;
- (void)_paletteWillDockToPosition:(int64_t)a3 prepareForExpansion:(BOOL)a4;
- (void)_panGestureHandler:(id)a3;
- (void)_performAnimated:(BOOL)a3 tracking:(BOOL)a4 animations:(id)a5 completion:(id)a6;
- (void)_processPendingDraggingTransition;
- (void)_scheduleDraggingTransitionToVisualState:(int64_t)a3;
- (void)_setPaletteVisualState:(int64_t)a3;
- (void)_setPaletteVisualState:(int64_t)a3 usingTransition:(BOOL)a4;
- (void)_tapToExpandPaletteFromMinimizedGestureHandler:(id)a3;
- (void)_touchDownFeedbackGestureHandler:(id)a3;
- (void)_updateConstraintsToDockPaletteToPosition:(int64_t)a3;
- (void)_updateConstraintsToFixToBottomEdge;
- (void)_updatePaletteAppearance;
- (void)_updatePaletteContentAlpha;
- (void)_updatePaletteHeightConstraint;
- (void)_updatePaletteSizeAnimated:(BOOL)a3;
- (void)_updatePaletteViewSizeConstraints;
- (void)_updateToolPreviewMinimizedStateAnimated:(BOOL)a3;
- (void)_updateToolPreviewRotationAnimated:(BOOL)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)paletteViewContentSizeDidChange:(id)a3;
- (void)paletteViewReturnKeyTypeDidChange:(id)a3;
- (void)paletteViewShowFeedbackForToolChange:(id)a3;
- (void)paletteViewStateDidChange:(id)a3 updatePaletteAppearance:(BOOL)a4;
- (void)paletteViewStateDidChangeAutoHide:(id)a3;
- (void)paletteViewStateDidChangeScaleFactor:(id)a3;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)safeAreaInsetsDidChange;
- (void)setDelegate:(id)a3;
- (void)setDraggingInitialPaletteCenterInSelf:(CGPoint)a3;
- (void)setDraggingPendingPaletteVisualState:(int64_t)a3;
- (void)setEffectivePaletteVisible:(BOOL)a3;
- (void)setLastNonCompactPalettePosition:(int64_t)a3;
- (void)setPaletteBottomConstraint:(id)a3;
- (void)setPaletteCenterXConstraint:(id)a3;
- (void)setPaletteCenterYConstraint:(id)a3;
- (void)setPaletteDraggingBehavior:(int64_t)a3;
- (void)setPaletteHeightConstraint:(id)a3;
- (void)setPaletteLeftConstraint:(id)a3;
- (void)setPalettePosition:(int64_t)a3;
- (void)setPaletteRightConstraint:(id)a3;
- (void)setPaletteScrollGestureShouldScroll:(BOOL)a3;
- (void)setPaletteTopConstraint:(id)a3;
- (void)setPaletteTransition:(id)a3;
- (void)setPaletteView:(id)a3;
- (void)setPaletteViewBottomEdgeSpacing:(double)a3;
- (void)setPaletteVisible:(BOOL)a3;
- (void)setPaletteVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setPaletteWidthConstraint:(id)a3;
- (void)setPanGestureDidStartInPaletteScrollView:(BOOL)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setPanGestureShouldDragPaletteView:(BOOL)a3;
- (void)setPencilInteractionFeedbackHostView:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setTapToExpandPaletteFromMinimizedGestureRecognizer:(id)a3;
- (void)setTouchDownFeedbackGestureRecognizer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionIntermediateVisualStateDidChange:(id)a3;
- (void)transitionPointingDirectionDidChange:(id)a3;
- (void)updateKeyboardAvoidanceForPalette:(BOOL)a3;
@end

@implementation PKPaletteHostView

+ (BOOL)_allowsHitTestAsOpaqueForRemoteEffects
{
  return 1;
}

- (PKPaletteHostView)initWithPaletteView:(id)a3
{
  v103[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v100.receiver = self;
  v100.super_class = (Class)PKPaletteHostView;
  v6 = [(PKPaletteHostView *)&v100 init];
  v7 = v6;
  if (v6)
  {
    v6->_paletteVisible = 0;
    v6->_paletteViewBottomEdgeSpacing = 20.0;
    p_paletteView = (id *)&v6->_paletteView;
    objc_storeStrong((id *)&v6->_paletteView, a3);
    [*p_paletteView setPaletteViewHosting:v7];
    [*p_paletteView setInternalDelegate:v7];
    v9 = [(PKPaletteHostView *)v7 paletteView];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(PKPaletteHostView *)v7 paletteView];
    [(PKPaletteHostView *)v7 addSubview:v10];

    [(PKPaletteHostView *)v7 setDelegate:*p_paletteView];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v7];
    pointerInteraction = v7->_pointerInteraction;
    v7->_pointerInteraction = (UIPointerInteraction *)v11;

    [(PKPaletteHostView *)v7 addInteraction:v7->_pointerInteraction];
    v13 = [(PKPaletteHostView *)v7 paletteView];
    v14 = [v13 topAnchor];
    v15 = [(PKPaletteHostView *)v7 topAnchor];
    uint64_t v16 = [v14 constraintEqualToAnchor:v15 constant:30.0];
    paletteTopConstraint = v7->_paletteTopConstraint;
    v7->_paletteTopConstraint = (NSLayoutConstraint *)v16;

    v18 = [(PKPaletteHostView *)v7 paletteTopConstraint];
    LODWORD(v19) = 1132068864;
    [v18 setPriority:v19];

    v20 = [(PKPaletteHostView *)v7 bottomAnchor];
    v21 = [(PKPaletteHostView *)v7 paletteView];
    v22 = [v21 bottomAnchor];
    uint64_t v23 = [v20 constraintEqualToAnchor:v22 constant:20.0];
    paletteBottomConstraint = v7->_paletteBottomConstraint;
    v7->_paletteBottomConstraint = (NSLayoutConstraint *)v23;

    v25 = [(PKPaletteHostView *)v7 paletteBottomConstraint];
    LODWORD(v26) = 1132068864;
    [v25 setPriority:v26];

    v27 = [(PKPaletteHostView *)v7 paletteView];
    v28 = [v27 leftAnchor];
    v29 = [(PKPaletteHostView *)v7 leftAnchor];
    uint64_t v30 = [v28 constraintEqualToAnchor:v29 constant:20.0];
    paletteLeftConstraint = v7->_paletteLeftConstraint;
    v7->_paletteLeftConstraint = (NSLayoutConstraint *)v30;

    v32 = [(PKPaletteHostView *)v7 paletteLeftConstraint];
    LODWORD(v33) = 1132068864;
    [v32 setPriority:v33];

    v34 = [(PKPaletteHostView *)v7 rightAnchor];
    v35 = [(PKPaletteHostView *)v7 paletteView];
    v36 = [v35 rightAnchor];
    uint64_t v37 = [v34 constraintEqualToAnchor:v36 constant:20.0];
    paletteRightConstraint = v7->_paletteRightConstraint;
    v7->_paletteRightConstraint = (NSLayoutConstraint *)v37;

    v39 = [(PKPaletteHostView *)v7 paletteRightConstraint];
    LODWORD(v40) = 1132068864;
    [v39 setPriority:v40];

    v41 = (void *)MEMORY[0x1E4F28DC8];
    v42 = [(PKPaletteHostView *)v7 paletteTopConstraint];
    v103[0] = v42;
    v43 = [(PKPaletteHostView *)v7 paletteBottomConstraint];
    v103[1] = v43;
    v44 = [(PKPaletteHostView *)v7 paletteLeftConstraint];
    v103[2] = v44;
    v45 = [(PKPaletteHostView *)v7 paletteRightConstraint];
    v103[3] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:4];
    [v41 activateConstraints:v46];

    v47 = [(PKPaletteHostView *)v7 paletteView];
    v48 = [v47 centerXAnchor];
    v49 = [(PKPaletteHostView *)v7 centerXAnchor];
    uint64_t v50 = [v48 constraintEqualToAnchor:v49];
    paletteCenterXConstraint = v7->_paletteCenterXConstraint;
    v7->_paletteCenterXConstraint = (NSLayoutConstraint *)v50;

    v52 = [(PKPaletteHostView *)v7 paletteCenterXConstraint];
    LODWORD(v53) = 1132068864;
    [v52 setPriority:v53];

    v54 = [(PKPaletteHostView *)v7 paletteView];
    v55 = [v54 centerYAnchor];
    v56 = [(PKPaletteHostView *)v7 centerYAnchor];
    uint64_t v57 = [v55 constraintEqualToAnchor:v56];
    paletteCenterYConstraint = v7->_paletteCenterYConstraint;
    v7->_paletteCenterYConstraint = (NSLayoutConstraint *)v57;

    v59 = [(PKPaletteHostView *)v7 paletteCenterYConstraint];
    LODWORD(v60) = 1132068864;
    [v59 setPriority:v60];

    v61 = (void *)MEMORY[0x1E4F28DC8];
    v62 = [(PKPaletteHostView *)v7 paletteCenterXConstraint];
    v102[0] = v62;
    v63 = [(PKPaletteHostView *)v7 paletteCenterYConstraint];
    v102[1] = v63;
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:2];
    [v61 activateConstraints:v64];

    v65 = [(PKPaletteHostView *)v7 paletteView];
    [v65 paletteSizeForEdge:4];
    double v67 = v66;
    double v69 = v68;

    v70 = [(PKPaletteHostView *)v7 paletteView];
    v71 = [v70 widthAnchor];
    uint64_t v72 = [v71 constraintEqualToConstant:v67];
    paletteWidthConstraint = v7->_paletteWidthConstraint;
    v7->_paletteWidthConstraint = (NSLayoutConstraint *)v72;

    v74 = [(PKPaletteHostView *)v7 paletteView];
    v75 = [v74 heightAnchor];
    uint64_t v76 = [v75 constraintEqualToConstant:v69];
    paletteHeightConstraint = v7->_paletteHeightConstraint;
    v7->_paletteHeightConstraint = (NSLayoutConstraint *)v76;

    v78 = (void *)MEMORY[0x1E4F28DC8];
    v79 = [(PKPaletteHostView *)v7 paletteWidthConstraint];
    v101[0] = v79;
    v80 = [(PKPaletteHostView *)v7 paletteHeightConstraint];
    v101[1] = v80;
    v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:2];
    [v78 activateConstraints:v81];

    uint64_t v82 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v7 action:sel__panGestureHandler_];
    panGestureRecognizer = v7->_panGestureRecognizer;
    v7->_panGestureRecognizer = (UIPanGestureRecognizer *)v82;

    v84 = [(PKPaletteHostView *)v7 panGestureRecognizer];
    [v84 setDelegate:v7];

    v85 = [(PKPaletteHostView *)v7 paletteView];
    v86 = [(PKPaletteHostView *)v7 panGestureRecognizer];
    [v85 addGestureRecognizer:v86];

    v87 = [(PKPaletteHostView *)v7 paletteView];
    v88 = [v87 contentScrollView];
    [v88 setDelegate:v7];

    uint64_t v89 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v7 action:sel__tapToExpandPaletteFromMinimizedGestureHandler_];
    tapToExpandPaletteFromMinimizedGestureRecognizer = v7->_tapToExpandPaletteFromMinimizedGestureRecognizer;
    v7->_tapToExpandPaletteFromMinimizedGestureRecognizer = (UITapGestureRecognizer *)v89;

    v91 = [(PKPaletteHostView *)v7 tapToExpandPaletteFromMinimizedGestureRecognizer];
    [v91 setDelegate:v7];

    v92 = [(PKPaletteHostView *)v7 paletteView];
    v93 = [(PKPaletteHostView *)v7 tapToExpandPaletteFromMinimizedGestureRecognizer];
    [v92 addGestureRecognizer:v93];

    uint64_t v94 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v7 action:sel__touchDownFeedbackGestureHandler_];
    touchDownFeedbackGestureRecognizer = v7->_touchDownFeedbackGestureRecognizer;
    v7->_touchDownFeedbackGestureRecognizer = (UILongPressGestureRecognizer *)v94;

    [(UILongPressGestureRecognizer *)v7->_touchDownFeedbackGestureRecognizer setDelegate:v7];
    [(UILongPressGestureRecognizer *)v7->_touchDownFeedbackGestureRecognizer setMinimumPressDuration:0.0];
    v96 = [(PKPaletteHostView *)v7 paletteView];
    [v96 addGestureRecognizer:v7->_touchDownFeedbackGestureRecognizer];

    v7->_panGestureDidStartInPaletteScrollView = 0;
    v7->_panGestureShouldDragPaletteView = 1;
    v7->_paletteScrollGestureShouldScroll = 1;
    v97 = [[PKPaletteTooltipPresentationHandle alloc] initWithHostingView:v7];
    tooltipPresentationHandle = v7->_tooltipPresentationHandle;
    v7->_tooltipPresentationHandle = v97;

    [(PKPaletteHostView *)v7 setClipsToBounds:1];
  }

  return v7;
}

- (void)setPaletteViewBottomEdgeSpacing:(double)a3
{
  if (self->_paletteViewBottomEdgeSpacing != a3)
  {
    self->_paletteViewBottomEdgeSpacing = a3;
    int64_t v4 = [(PKPaletteHostView *)self palettePosition];
    [(PKPaletteHostView *)self _updateConstraintsToDockPaletteToPosition:v4];
  }
}

- (void)didMoveToWindow
{
  v3 = [(PKPaletteHostView *)self window];
  if (v3)
  {
    id v9 = v3;
    [(PKPaletteHostView *)self _updatePaletteViewSizeConstraints];
    if ([(PKPaletteHostView *)self _shouldBeCompact])
    {
      [(PKPaletteHostView *)self _fixToBottomEdge];
    }
    else
    {
      int64_t v4 = [(PKPaletteHostView *)self paletteView];
      if ([v4 isAutoHideEnabled])
      {
      }
      else
      {
        id v5 = [(PKPaletteHostView *)self paletteView];
        int v6 = [v5 shouldStartUpMinimized];

        if (!v6)
        {
          int64_t v7 = [(PKPaletteView *)self->_paletteView palettePosition];
          if (v7) {
            uint64_t v8 = v7;
          }
          else {
            uint64_t v8 = 3;
          }
          [(PKPaletteHostView *)self _dockPaletteToPosition:v8 animated:0];
          goto LABEL_12;
        }
      }
      [(PKPaletteHostView *)self _dockPaletteToAutoHideCornerAnimated:0];
    }
LABEL_12:
    v3 = v9;
  }
}

- (void)_installPencilInteractionFeedbackHostViewIfNeeded
{
  if (!self->_pencilInteractionFeedbackHostView)
  {
    v3 = [[PKPalettePencilInteractionFeedbackHostView alloc] initWithDelegate:self];
    pencilInteractionFeedbackHostView = self->_pencilInteractionFeedbackHostView;
    self->_pencilInteractionFeedbackHostView = v3;

    [(PKPaletteHostView *)self insertSubview:self->_pencilInteractionFeedbackHostView atIndex:0];
    [(PKPaletteHostView *)self layoutIfNeeded];
  }
}

- (void)_cancelPanGestureIfNecessary
{
  if ([(UIPanGestureRecognizer *)self->_panGestureRecognizer state])
  {
    panGestureRecognizer = self->_panGestureRecognizer;
    [(UIPanGestureRecognizer *)panGestureRecognizer setState:4];
  }
}

- (void)setPaletteVisible:(BOOL)a3
{
}

- (void)setPaletteVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (self->_paletteVisible != v6)
  {
    self->_paletteVisible = v6;
    [(PKPaletteHostView *)self _cancelPanGestureIfNecessary];
    [(PKPaletteHostView *)self layoutIfNeeded];
    BOOL v9 = [(PKPaletteHostView *)self isPaletteVisible];
    v10 = [(PKPaletteHostView *)self paletteView];
    uint64_t v11 = v10;
    if (v9)
    {
      [v10 setNeedsLayout];

      v12 = [(PKPaletteHostView *)self paletteView];
      [v12 layoutIfNeeded];

      v13 = [(PKPaletteHostView *)self pencilInteractionFeedbackHostView];
      [v13 hideFeedbackView];
    }
    else
    {
      [v10 dismissPalettePopoverWithCompletion:0];

      v13 = [(PKPaletteHostView *)self paletteView];
      [v13 dismissContextMenu];
    }

    v14 = [(PKPaletteHostView *)self paletteView];
    [v14 willStartAppearanceAnimation:v6];

    [(PKPaletteHostView *)self updateKeyboardAvoidanceForPalette:v6];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__PKPaletteHostView_setPaletteVisible_animated_completion___block_invoke;
    v17[3] = &unk_1E64C8030;
    v17[4] = self;
    BOOL v18 = v6;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__PKPaletteHostView_setPaletteVisible_animated_completion___block_invoke_2;
    v15[3] = &unk_1E64C6848;
    v15[4] = self;
    id v16 = v8;
    [(PKPaletteHostView *)self _performAnimated:v5 tracking:0 animations:v17 completion:v15];
  }
}

uint64_t __59__PKPaletteHostView_setPaletteVisible_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEffectivePaletteVisible:*(unsigned __int8 *)(a1 + 40)];
  if ([*(id *)(a1 + 32) _shouldBeCompact]) {
    [*(id *)(a1 + 32) _updateConstraintsToFixToBottomEdge];
  }
  else {
    objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsToDockPaletteToPosition:", objc_msgSend(*(id *)(a1 + 32), "palettePosition"));
  }
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t __59__PKPaletteHostView_setPaletteVisible_animated_completion___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    v3 = [*(id *)(result + 32) paletteView];
    [v3 didEndAppearanceAnimation];

    result = *(void *)(v2 + 40);
    if (result)
    {
      int64_t v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  return result;
}

- (void)updateKeyboardAvoidanceForPalette:(BOOL)a3
{
  double v4 = 0.0;
  if (a3 && [(PKPaletteHostView *)self _shouldBeCompact])
  {
    [(PKPaletteHostView *)self _paletteViewCompactHeight];
    double v4 = v5;
  }
  id v6 = [(PKPaletteHostView *)self keyboardSceneDelegate];
  if (objc_opt_respondsToSelector()) {
    [v6 refreshWithLocalMinimumKeyboardHeight:v4];
  }
}

- (void)_setPaletteVisualState:(int64_t)a3
{
}

- (void)_setPaletteVisualState:(int64_t)a3 usingTransition:(BOOL)a4
{
  int64_t paletteVisualState = self->_paletteVisualState;
  if (paletteVisualState != a3)
  {
    self->_int64_t paletteVisualState = a3;
    if (a4)
    {
      uint64_t v6 = [(PKPaletteHostView *)self paletteTransition];
      if (!v6
        || (int64_t v7 = (void *)v6,
            [(PKPaletteHostView *)self paletteTransition],
            id v8 = objc_claimAutoreleasedReturnValue(),
            char v9 = [v8 isTransitionInProgress],
            v8,
            v7,
            (v9 & 1) == 0))
      {
        v10 = [(PKPaletteHostView *)self paletteTransition];
        [v10 setDelegate:0];

        uint64_t v11 = [[PKPaletteTransition alloc] initWithInitialVisualState:paletteVisualState];
        [(PKPaletteHostView *)self setPaletteTransition:v11];

        v12 = [(PKPaletteHostView *)self paletteTransition];
        [v12 setDelegate:self];
      }
      id v13 = [(PKPaletteHostView *)self paletteTransition];
      objc_msgSend(v13, "transitionToVisualState:", -[PKPaletteHostView paletteVisualState](self, "paletteVisualState"));
    }
    else
    {
      [(PKPaletteHostView *)self _updatePaletteSizeAnimated:0];
      [(PKPaletteHostView *)self _updateToolPreviewRotationAnimated:0];
      [(PKPaletteHostView *)self _updateToolPreviewMinimizedStateAnimated:0];
      [(PKPaletteHostView *)self _updatePaletteContentAlpha];
      [(PKPaletteHostView *)self _updatePaletteAppearance];
    }
  }
}

- (BOOL)isPaletteDragging
{
  if ([(PKPaletteHostView *)self paletteVisualState] == 3) {
    return 1;
  }
  double v4 = [(PKPaletteHostView *)self panGestureRecognizer];
  if ([v4 state] == 1)
  {
    BOOL v3 = 1;
  }
  else
  {
    double v5 = [(PKPaletteHostView *)self panGestureRecognizer];
    BOOL v3 = [v5 state] == 2;
  }
  return v3;
}

- (void)_updatePaletteAppearance
{
  BOOL v3 = [(PKPaletteHostView *)self paletteView];
  double v4 = [(PKPaletteHostView *)self traitCollection];
  double v5 = [v3 borderColorForTraitCollection:v4];

  uint64_t v6 = [(PKPaletteHostView *)self paletteView];
  int64_t v7 = [(PKPaletteHostView *)self traitCollection];
  [v6 borderWidthForTraitCollection:v7];
  double v9 = v8;

  id v46 = v5;
  uint64_t v10 = [v46 CGColor];
  uint64_t v11 = [(PKPaletteHostView *)self paletteView];
  v12 = [v11 layer];
  [v12 setBorderColor:v10];

  id v13 = [(PKPaletteHostView *)self paletteView];
  v14 = [v13 layer];
  [v14 setBorderWidth:v9];

  v15 = [(PKPaletteHostView *)self paletteView];
  id v16 = [v15 layer];
  [v16 setMasksToBounds:0];

  double v17 = *MEMORY[0x1E4F1DB30];
  double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v19 = [(PKPaletteHostView *)self paletteView];
  v20 = [v19 layer];
  objc_msgSend(v20, "setShadowOffset:", v17, v18);

  uint64_t v21 = [(PKPaletteHostView *)self paletteVisualState];
  v22 = [(PKPaletteHostView *)self paletteTransition];
  LODWORD(v12) = [v22 isTransitionInProgress];

  if (v12)
  {
    uint64_t v23 = [(PKPaletteHostView *)self paletteTransition];
    uint64_t v21 = [v23 intermediateVisualState];
  }
  if ((unint64_t)(v21 - 4) < 4)
  {
    v24 = [(PKPaletteHostView *)self paletteView];
    [v24 shadowOpacity];
    double v26 = v25;

    v27 = [(PKPaletteHostView *)self paletteView];
    [v27 shadowRadius];
    double v29 = v28;
LABEL_10:

    v35 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_paletteShadowColor");
    goto LABEL_11;
  }
  if ((unint64_t)(v21 - 2) <= 1)
  {
    uint64_t v30 = [(PKPaletteHostView *)self paletteView];
    [v30 shadowOpacity];
    double v26 = v31;

    v27 = [(PKPaletteHostView *)self paletteView];
    int v32 = [v27 shouldAdjustShadowRadiusForMinimized];
    double v33 = [(PKPaletteHostView *)self paletteView];
    [v33 shadowRadius];
    if (v32) {
      double v29 = v34 * 0.5;
    }
    else {
      double v29 = v34;
    }

    goto LABEL_10;
  }
  v35 = 0;
  double v26 = 0.0;
  double v29 = 0.0;
LABEL_11:
  uint64_t v37 = [(PKPaletteHostView *)self paletteView];
  v38 = [v37 layer];
  float v36 = v26;
  *(float *)&double v39 = v36;
  [v38 setShadowOpacity:v39];

  double v40 = [(PKPaletteHostView *)self paletteView];
  v41 = [v40 layer];
  [v41 setShadowRadius:v29];

  id v42 = v35;
  uint64_t v43 = [v42 CGColor];
  v44 = [(PKPaletteHostView *)self paletteView];
  v45 = [v44 layer];
  [v45 setShadowColor:v43];
}

- (void)_updatePaletteViewSizeConstraints
{
  if ([(PKPaletteHostView *)self _shouldBeCompact])
  {
    [(PKPaletteHostView *)self _updateConstraintsToFixToBottomEdge];
  }
  else
  {
    [(PKPaletteHostView *)self _paletteSizeForVisualState:[(PKPaletteHostView *)self paletteVisualState]];
    double v4 = v3;
    double v6 = v5;
    int64_t v7 = [(PKPaletteHostView *)self paletteWidthConstraint];
    [v7 setConstant:v4];

    double v8 = [(PKPaletteHostView *)self paletteHeightConstraint];
    [v8 setConstant:v6];

    [(PKPaletteHostView *)self setNeedsLayout];
  }
}

- (void)_updatePaletteContentAlpha
{
  double v3 = [(PKPaletteHostView *)self paletteTransition];
  int v4 = [v3 isTransitionInProgress];

  if (v4)
  {
    double v5 = [(PKPaletteHostView *)self paletteTransition];
    [v5 expandedToCollapsedRatio];
    double v7 = 1.0 - (v6 + v6);

    if (v7 < 0.0) {
      double v7 = 0.0;
    }
  }
  else
  {
    unint64_t v8 = [(PKPaletteHostView *)self paletteVisualState] - 1;
    double v7 = 0.0;
    if (v8 <= 6) {
      double v7 = dbl_1C482A738[v8];
    }
  }
  id v9 = [(PKPaletteHostView *)self paletteView];
  [v9 setPaletteContentAlpha:v7];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKPaletteHostView;
  [(PKPaletteHostView *)&v12 layoutSubviews];
  [(PKPaletteHostView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(PKPaletteHostView *)self pencilInteractionFeedbackHostView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)safeAreaInsetsDidChange
{
  if ([(PKPaletteHostView *)self _shouldBeCompact])
  {
    if ([(PKPaletteHostView *)self isEffectivePaletteVisible])
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __44__PKPaletteHostView_safeAreaInsetsDidChange__block_invoke;
      v3[3] = &unk_1E64C61C0;
      v3[4] = self;
      [(PKPaletteHostView *)self _performAnimated:1 tracking:0 animations:v3 completion:0];
      [(PKPaletteHostView *)self updateKeyboardAvoidanceForPalette:1];
    }
  }
}

uint64_t __44__PKPaletteHostView_safeAreaInsetsDidChange__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePaletteHeightConstraint];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)_fixToBottomEdge
{
  [(PKPaletteHostView *)self _paletteWillDockToPosition:3 prepareForExpansion:0];
  [(PKPaletteHostView *)self _deactivatePaletteCenterConstraints];
  [(PKPaletteHostView *)self _deactivatePaletteEdgeConstraints];
  [(PKPaletteHostView *)self _setPaletteVisualState:1 usingTransition:0];
  double v3 = [(PKPaletteHostView *)self paletteWidthConstraint];
  LODWORD(v4) = 1132068864;
  [v3 setPriority:v4];

  [(PKPaletteHostView *)self _updateConstraintsToFixToBottomEdge];

  [(PKPaletteHostView *)self _paletteDidDockToPosition:3 fromUserReposition:0];
}

- (void)_updateConstraintsToFixToBottomEdge
{
  double v3 = -3.0;
  if (![(PKPaletteHostView *)self isEffectivePaletteVisible])
  {
    [(PKPaletteHostView *)self _paletteViewCompactHeight];
    double v3 = v4 * -2.0;
  }
  double v5 = [(PKPaletteHostView *)self paletteBottomConstraint];
  [v5 setConstant:v3];

  double v6 = [(PKPaletteHostView *)self paletteBottomConstraint];
  LODWORD(v7) = 1148846080;
  [v6 setPriority:v7];

  double v8 = [(PKPaletteHostView *)self traitCollection];
  uint64_t v9 = [v8 layoutDirection];

  double v10 = [(PKPaletteHostView *)self paletteView];
  [v10 edgeInsetsInCompactSize];
  double v12 = v11;
  double v14 = v13;
  v15 = [(PKPaletteHostView *)self paletteLeftConstraint];
  id v16 = v15;
  if (v9 == 1)
  {
    [v15 setConstant:v14];

    double v17 = [(PKPaletteHostView *)self paletteView];
    [v17 edgeInsetsInCompactSize];
    double v19 = v18;
  }
  else
  {
    [v15 setConstant:v12];

    double v17 = [(PKPaletteHostView *)self paletteView];
    [v17 edgeInsetsInCompactSize];
    double v19 = v20;
  }
  uint64_t v21 = [(PKPaletteHostView *)self paletteRightConstraint];
  [v21 setConstant:v19];

  v22 = [(PKPaletteHostView *)self paletteLeftConstraint];
  LODWORD(v23) = 1148846080;
  [v22 setPriority:v23];

  v24 = [(PKPaletteHostView *)self paletteRightConstraint];
  LODWORD(v25) = 1148846080;
  [v24 setPriority:v25];

  [(PKPaletteHostView *)self _updatePaletteHeightConstraint];
}

- (void)_updatePaletteHeightConstraint
{
  [(PKPaletteHostView *)self _paletteViewCompactHeight];
  double v4 = v3;
  double v5 = [(PKPaletteHostView *)self paletteHeightConstraint];
  [v5 setConstant:v4];

  id v7 = [(PKPaletteHostView *)self paletteHeightConstraint];
  LODWORD(v6) = 1148846080;
  [v7 setPriority:v6];
}

- (double)_paletteViewCompactHeight
{
  double v3 = [(PKPaletteHostView *)self paletteView];
  [v3 compactPaletteHeight];
  double v5 = v4;
  uint64_t v6 = [(PKPaletteHostView *)self paletteView];
  [(id)v6 edgeInsetsInCompactSize];
  double v8 = v5 + v7;

  uint64_t v9 = [(PKPaletteHostView *)self paletteView];
  LOBYTE(v6) = [v9 ignoresSafeAreaInsetsInCompactSize];

  if ((v6 & 1) == 0)
  {
    double v10 = [(PKPaletteHostView *)self window];
    [v10 safeAreaInsets];
    double v8 = v8 + v11;
  }
  return v8 + 3.0;
}

- (void)_dockPaletteToAutoHideCornerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(PKPaletteHostView *)self _shouldBeCompact])
  {
    unint64_t v5 = [(PKPaletteView *)self->_paletteView autoHideCorner] - 1;
    if (v5 > 7) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = qword_1C482A7D0[v5];
    }
    [(PKPaletteHostView *)self _dockPaletteToPosition:v6 animated:v3];
  }
}

- (void)_dockPaletteToPosition:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)_dockPaletteToPosition:(int64_t)a3 isFromUserReposition:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v9 = a3 - 1;
  BOOL v10 = (unint64_t)(a3 - 1) < 4;
  BOOL v11 = ([(PKPaletteHostView *)self paletteVisualState] & 0xFFFFFFFFFFFFFFFELL) == 2 && v10;
  [(PKPaletteHostView *)self _paletteWillDockToPosition:a3 prepareForExpansion:v11];
  if (v9 >= 4) {
    [(PKPaletteHostView *)self layoutIfNeeded];
  }
  double v12 = [(PKPaletteHostView *)self paletteHeightConstraint];
  LODWORD(v13) = 1148846080;
  [v12 setPriority:v13];

  double v14 = [(PKPaletteHostView *)self paletteWidthConstraint];
  LODWORD(v15) = 1148846080;
  [v14 setPriority:v15];

  if (v9 > 7) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = qword_1C482A770[v9];
  }
  [(PKPaletteHostView *)self _setPaletteVisualState:v16 usingTransition:v5];
  [(PKPaletteHostView *)self layoutIfNeeded];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__PKPaletteHostView__dockPaletteToPosition_isFromUserReposition_animated___block_invoke;
  v19[3] = &unk_1E64C61E8;
  v19[4] = self;
  v19[5] = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__PKPaletteHostView__dockPaletteToPosition_isFromUserReposition_animated___block_invoke_2;
  v17[3] = &unk_1E64C8E70;
  v17[4] = self;
  void v17[5] = a3;
  BOOL v18 = a4;
  [(PKPaletteHostView *)self _performAnimated:v5 tracking:0 animations:v19 completion:v17];
}

uint64_t __74__PKPaletteHostView__dockPaletteToPosition_isFromUserReposition_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateConstraintsToDockPaletteToPosition:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t __74__PKPaletteHostView__dockPaletteToPosition_isFromUserReposition_animated___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _paletteDidDockToPosition:*(void *)(result + 40) fromUserReposition:*(unsigned __int8 *)(result + 48)];
  }
  return result;
}

- (double)_paletteEdgeMarginForTopEdge:(BOOL)a3 isMinimized:(BOOL)a4
{
  [(PKPaletteHostView *)self _paletteEdgeMarginForTopEdge:a3 isBottomEdge:0 isMinimized:a4];
  return result;
}

- (double)_paletteEdgeMarginForTopEdge:(BOOL)a3 isBottomEdge:(BOOL)a4 isMinimized:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if ([(PKPaletteHostView *)self isEffectivePaletteVisible])
  {
    double result = 20.0;
    if (v7) {
      double result = 30.0;
    }
    if (v6 && !v5 && !v7)
    {
      [(PKPaletteHostView *)self paletteViewBottomEdgeSpacing];
    }
  }
  else
  {
    BOOL v10 = [(PKPaletteHostView *)self paletteView];
    [v10 paletteScaleFactor];
    double v12 = v11 * 122.0;

    double v13 = 20.0;
    if (v7 || v5) {
      double v13 = 30.0;
    }
    return -(v13 + v12);
  }
  return result;
}

- (void)_updateConstraintsToDockPaletteToPosition:(int64_t)a3
{
  BOOL v5 = [(PKPaletteHostView *)self window];

  if (v5)
  {
    [(PKPaletteHostView *)self _deactivatePaletteEdgeConstraints];
    [(PKPaletteHostView *)self _deactivatePaletteCenterConstraints];
    switch(a3)
    {
      case 1:
        [(PKPaletteHostView *)self _paletteEdgeMarginForTopEdge:1 isMinimized:0];
        double v7 = v6;
        double v8 = [(PKPaletteHostView *)self paletteTopConstraint];
        [v8 setConstant:v7];

        unint64_t v9 = [(PKPaletteHostView *)self paletteTopConstraint];
        goto LABEL_6;
      case 2:
        [(PKPaletteHostView *)self _paletteEdgeMarginForTopEdge:0 isMinimized:0];
        double v12 = v11;
        double v13 = [(PKPaletteHostView *)self paletteRightConstraint];
        [v13 setConstant:v12];

        double v14 = [(PKPaletteHostView *)self paletteRightConstraint];
        goto LABEL_10;
      case 3:
        [(PKPaletteHostView *)self _paletteEdgeMarginForTopEdge:0 isBottomEdge:1 isMinimized:0];
        double v17 = v16;
        BOOL v18 = [(PKPaletteHostView *)self paletteBottomConstraint];
        [v18 setConstant:v17];

        unint64_t v9 = [(PKPaletteHostView *)self paletteBottomConstraint];
LABEL_6:
        double v19 = v9;
        LODWORD(v10) = 1144750080;
        [v9 setPriority:v10];

        double v20 = [(PKPaletteHostView *)self paletteView];
        int v21 = [v20 isAutoHideEnabled];

        if (!v21)
        {
          v56 = [(PKPaletteHostView *)self paletteCenterXConstraint];
          [v56 setConstant:0.0];

          uint64_t v57 = [(PKPaletteHostView *)self paletteCenterXConstraint];
          goto LABEL_20;
        }
        v22 = [(PKPaletteHostView *)self paletteView];
        uint64_t v23 = [v22 autoHideCorner];

        switch(v23)
        {
          case 1:
          case 4:
            v24 = [(PKPaletteHostView *)self paletteLeftConstraint];
            goto LABEL_35;
          case 2:
          case 8:
            v24 = [(PKPaletteHostView *)self paletteRightConstraint];
LABEL_35:
            v79 = v24;
            LODWORD(v25) = 1144750080;
            [v24 setPriority:v25];

            break;
          default:
            break;
        }
        uint64_t v57 = [(PKPaletteHostView *)self paletteCenterXConstraint];
        goto LABEL_37;
      case 4:
        [(PKPaletteHostView *)self _paletteEdgeMarginForTopEdge:0 isMinimized:0];
        double v27 = v26;
        double v28 = [(PKPaletteHostView *)self paletteLeftConstraint];
        [v28 setConstant:v27];

        double v14 = [(PKPaletteHostView *)self paletteLeftConstraint];
LABEL_10:
        double v29 = v14;
        LODWORD(v15) = 1144750080;
        [v14 setPriority:v15];

        uint64_t v30 = [(PKPaletteHostView *)self paletteCenterYConstraint];
        LODWORD(v31) = 1144750080;
        [v30 setPriority:v31];

        int v32 = [(PKPaletteHostView *)self paletteView];
        int v33 = [v32 isAutoHideEnabled];

        if (!v33)
        {
          v59 = [(PKPaletteHostView *)self paletteCenterYConstraint];
          [v59 setConstant:0.0];

          uint64_t v57 = [(PKPaletteHostView *)self paletteCenterYConstraint];
LABEL_20:
          id v80 = v57;
          LODWORD(v58) = 1144750080;
          goto LABEL_38;
        }
        double v34 = [(PKPaletteHostView *)self paletteView];
        uint64_t v35 = [v34 autoHideCorner];

        if ((unint64_t)(v35 - 1) <= 1)
        {
          float v36 = [(PKPaletteHostView *)self paletteTopConstraint];
LABEL_32:
          v78 = v36;
          LODWORD(v37) = 1144750080;
          [v36 setPriority:v37];

          goto LABEL_33;
        }
        if (v35 == 8 || v35 == 4)
        {
          float v36 = [(PKPaletteHostView *)self paletteBottomConstraint];
          goto LABEL_32;
        }
LABEL_33:
        uint64_t v57 = [(PKPaletteHostView *)self paletteCenterYConstraint];
LABEL_37:
        LODWORD(v58) = 1132068864;
        id v80 = v57;
LABEL_38:
        [v57 setPriority:v58];
LABEL_39:

        break;
      case 5:
        v38 = [(PKPaletteHostView *)self paletteTopConstraint];
        [v38 setConstant:30.0];

        double v39 = [(PKPaletteHostView *)self paletteLeftConstraint];
        [v39 setConstant:30.0];

        double v40 = [(PKPaletteHostView *)self paletteTopConstraint];
        LODWORD(v41) = 1144750080;
        [v40 setPriority:v41];

        id v42 = [(PKPaletteHostView *)self paletteLeftConstraint];
        LODWORD(v43) = 1144750080;
        [v42 setPriority:v43];

        v44 = [(PKPaletteHostView *)self paletteView];
        uint64_t v45 = [v44 edgeLocationToDockFromCorner:1];

        if (v45 == 1) {
          goto LABEL_22;
        }
        goto LABEL_16;
      case 6:
        double v60 = [(PKPaletteHostView *)self paletteTopConstraint];
        [v60 setConstant:30.0];

        v61 = [(PKPaletteHostView *)self paletteRightConstraint];
        [v61 setConstant:30.0];

        v62 = [(PKPaletteHostView *)self paletteTopConstraint];
        LODWORD(v63) = 1144750080;
        [v62 setPriority:v63];

        v64 = [(PKPaletteHostView *)self paletteRightConstraint];
        LODWORD(v65) = 1144750080;
        [v64 setPriority:v65];

        double v66 = [(PKPaletteHostView *)self paletteView];
        uint64_t v67 = [v66 edgeLocationToDockFromCorner:2];

        if (v67 != 1) {
          goto LABEL_24;
        }
LABEL_22:
        [(PKPaletteHostView *)self _paletteEdgeMarginForTopEdge:1 isMinimized:1];
        double v54 = v68;
        v55 = [(PKPaletteHostView *)self paletteTopConstraint];
        goto LABEL_28;
      case 7:
        double v69 = [(PKPaletteHostView *)self paletteBottomConstraint];
        [v69 setConstant:30.0];

        v70 = [(PKPaletteHostView *)self paletteRightConstraint];
        [v70 setConstant:30.0];

        v71 = [(PKPaletteHostView *)self paletteBottomConstraint];
        LODWORD(v72) = 1144750080;
        [v71 setPriority:v72];

        v73 = [(PKPaletteHostView *)self paletteRightConstraint];
        LODWORD(v74) = 1144750080;
        [v73 setPriority:v74];

        v75 = [(PKPaletteHostView *)self paletteView];
        uint64_t v67 = [v75 edgeLocationToDockFromCorner:8];

        if (v67 == 4) {
          goto LABEL_27;
        }
LABEL_24:
        if (v67 != 8) {
          return;
        }
        [(PKPaletteHostView *)self _paletteEdgeMarginForTopEdge:0 isMinimized:1];
        double v54 = v76;
        v55 = [(PKPaletteHostView *)self paletteRightConstraint];
        goto LABEL_28;
      case 8:
        id v46 = [(PKPaletteHostView *)self paletteBottomConstraint];
        [v46 setConstant:30.0];

        v47 = [(PKPaletteHostView *)self paletteLeftConstraint];
        [v47 setConstant:30.0];

        v48 = [(PKPaletteHostView *)self paletteBottomConstraint];
        LODWORD(v49) = 1144750080;
        [v48 setPriority:v49];

        uint64_t v50 = [(PKPaletteHostView *)self paletteLeftConstraint];
        LODWORD(v51) = 1144750080;
        [v50 setPriority:v51];

        v52 = [(PKPaletteHostView *)self paletteView];
        uint64_t v45 = [v52 edgeLocationToDockFromCorner:4];

        if (v45 == 4)
        {
LABEL_27:
          [(PKPaletteHostView *)self _paletteEdgeMarginForTopEdge:0 isMinimized:1];
          double v54 = v77;
          v55 = [(PKPaletteHostView *)self paletteBottomConstraint];
        }
        else
        {
LABEL_16:
          if (v45 != 2) {
            return;
          }
          [(PKPaletteHostView *)self _paletteEdgeMarginForTopEdge:0 isMinimized:1];
          double v54 = v53;
          v55 = [(PKPaletteHostView *)self paletteLeftConstraint];
        }
LABEL_28:
        id v80 = v55;
        [v55 setConstant:v54];
        goto LABEL_39;
      default:
        return;
    }
  }
}

- (void)_paletteWillDockToPosition:(int64_t)a3 prepareForExpansion:(BOOL)a4
{
  BOOL v4 = a4;
  -[PKPaletteHostView setPalettePosition:](self, "setPalettePosition:");
  id v7 = [(PKPaletteHostView *)self delegate];
  [v7 hostView:self willDockPaletteToPosition:a3 prepareForExpansion:v4];
}

- (void)_paletteDidDockToPosition:(int64_t)a3 fromUserReposition:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(PKPaletteHostView *)self delegate];
  [v7 hostView:self didDockPaletteToPosition:a3];

  if (v4)
  {
    +[PKStatisticsManager sharedStatisticsManager]();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    double v8 = [(PKPaletteHostView *)self paletteView];
    -[PKStatisticsManager recordPalettePositionChange:type:]((uint64_t)v9, a3, [v8 paletteViewType]);
  }
}

- (void)_touchDownFeedbackGestureHandler:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(PKPaletteHostView *)self layoutIfNeeded];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__PKPaletteHostView__touchDownFeedbackGestureHandler___block_invoke;
    v12[3] = &unk_1E64C61C0;
    v12[4] = self;
    [(PKPaletteHostView *)self _performAnimated:1 tracking:0 animations:v12 completion:&__block_literal_global_52];
    [(PKPaletteHostView *)self _setPaletteVisualState:3 usingTransition:1];
  }
  else
  {
    BOOL v5 = [v4 state] != 3 && objc_msgSend(v4, "state") != 5 && objc_msgSend(v4, "state") != 4;
    double v6 = [(PKPaletteHostView *)self tapToExpandPaletteFromMinimizedGestureRecognizer];
    uint64_t v7 = [v6 state];

    double v8 = [(PKPaletteHostView *)self panGestureRecognizer];
    if ([v8 state] == 2)
    {
    }
    else
    {
      id v9 = [(PKPaletteHostView *)self panGestureRecognizer];
      uint64_t v10 = [v9 state];

      char v11 = v7 == 3 || v5;
      if ((v11 & 1) == 0 && v10 != 3) {
        [(PKPaletteHostView *)self _dockPaletteToPosition:[(PKPaletteHostView *)self palettePosition] animated:1];
      }
    }
  }
}

uint64_t __54__PKPaletteHostView__touchDownFeedbackGestureHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) paletteView];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v11[0] = *MEMORY[0x1E4F1DAB8];
  v11[1] = v3;
  v11[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v11];

  switch([*(id *)(a1 + 32) palettePosition])
  {
    case 5:
      id v4 = [*(id *)(a1 + 32) paletteLeftConstraint];
      goto LABEL_4;
    case 6:
      id v4 = [*(id *)(a1 + 32) paletteRightConstraint];
LABEL_4:
      BOOL v5 = v4;
      [v4 setConstant:20.0];

      double v6 = [*(id *)(a1 + 32) paletteTopConstraint];
      goto LABEL_8;
    case 7:
      uint64_t v7 = [*(id *)(a1 + 32) paletteRightConstraint];
      goto LABEL_7;
    case 8:
      uint64_t v7 = [*(id *)(a1 + 32) paletteLeftConstraint];
LABEL_7:
      double v8 = v7;
      [v7 setConstant:20.0];

      double v6 = [*(id *)(a1 + 32) paletteBottomConstraint];
LABEL_8:
      id v9 = v6;
      [v6 setConstant:20.0];

      break;
    default:
      return [*(id *)(a1 + 32) layoutIfNeeded];
  }
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_tapToExpandPaletteFromMinimizedGestureHandler:(id)a3
{
  if ([a3 state] == 3)
  {
    unint64_t v4 = [(PKPaletteHostView *)self palettePosition] - 5;
    if (v4 > 3) {
      uint64_t v5 = -1;
    }
    else {
      uint64_t v5 = qword_1C482A7B0[v4];
    }
    double v6 = [(PKPaletteHostView *)self paletteView];
    uint64_t v7 = [v6 edgeLocationToDockFromCorner:v5];

    if ((unint64_t)(v7 - 1) > 7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = qword_1C482A880[v7 - 1];
    }
    [(PKPaletteHostView *)self _dockPaletteToPosition:v8 animated:1];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKPaletteHostView *)self _shouldBeCompact];
  id v6 = [(PKPaletteHostView *)self panGestureRecognizer];
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = v4;
    if (v6 != v4)
    {
      uint64_t v9 = [(PKPaletteHostView *)self touchDownFeedbackGestureRecognizer];
      if ((id)v9 != v4)
      {
        uint64_t v10 = (void *)v9;
        id v11 = [(PKPaletteHostView *)self tapToExpandPaletteFromMinimizedGestureRecognizer];

        if (v11 == v4) {
          goto LABEL_14;
        }
LABEL_17:
        LOBYTE(self) = 1;
        goto LABEL_19;
      }

      uint64_t v8 = v7;
    }

LABEL_14:
    LOBYTE(self) = 0;
    goto LABEL_19;
  }

  if (v7 == v4)
  {
    double v14 = [(PKPaletteHostView *)self paletteView];
    LOBYTE(self) = [v14 draggingEnabled];
  }
  else
  {
    id v12 = [(PKPaletteHostView *)self touchDownFeedbackGestureRecognizer];

    if (v12 == v4)
    {
      LOBYTE(self) = [(PKPaletteHostView *)self isPaletteVisualStateMinimized];
      goto LABEL_19;
    }
    id v13 = [(PKPaletteHostView *)self tapToExpandPaletteFromMinimizedGestureRecognizer];

    if (v13 == v4)
    {
      if (![(PKPaletteHostView *)self isPaletteVisualStateMinimized])
      {
        LOBYTE(self) = [(PKPaletteHostView *)self paletteVisualState] == 3;
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    double v14 = [(PKPaletteHostView *)self paletteView];
    LODWORD(self) = [v14 isPalettePresentingPopover] ^ 1;
  }

LABEL_19:
  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PKPaletteHostView *)self panGestureRecognizer];
  v17[0] = v8;
  uint64_t v9 = [(PKPaletteHostView *)self tapToExpandPaletteFromMinimizedGestureRecognizer];
  v17[1] = v9;
  uint64_t v10 = [(PKPaletteHostView *)self touchDownFeedbackGestureRecognizer];
  v17[2] = v10;
  id v11 = [(PKPaletteHostView *)self paletteView];
  id v12 = [v11 contentScrollView];
  id v13 = [v12 panGestureRecognizer];
  v17[3] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  LODWORD(v8) = [v14 containsObject:v7];
  if (v8) {
    char v15 = [v14 containsObject:v6];
  }
  else {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(PKPaletteHostView *)self bounds];
  v21.double x = x;
  v21.double y = y;
  if (!CGRectContainsPoint(v22, v21))
  {
LABEL_12:
    BOOL v15 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(PKPaletteHostView *)self paletteView];
  -[PKPaletteHostView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  id v13 = [(PKPaletteHostView *)self paletteView];
  char v14 = objc_msgSend(v13, "pointInside:withEvent:", v7, v10, v12);

  if ((v14 & 1) == 0)
  {
    if (v7)
    {
      if ([v7 type] != 11)
      {
        double v16 = [(PKPaletteHostView *)self paletteView];
        char v17 = [v16 isPalettePresentingPopover];

        if ((v17 & 1) == 0 && ![(PKPaletteHostView *)self _shouldBeCompact])
        {
          BOOL v18 = [(PKPaletteHostView *)self paletteView];
          if ([v18 isAutoHideEnabled])
          {
            int64_t v19 = [(PKPaletteHostView *)self paletteVisualState];

            if (v19 != 2) {
              [(PKPaletteHostView *)self _dockPaletteToAutoHideCornerAnimated:1];
            }
          }
          else
          {
          }
        }
      }
    }
    goto LABEL_12;
  }
  BOOL v15 = 1;
LABEL_13:

  return v15;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  int v8 = objc_msgSend(v7, "PK_isEventFromPencil");
  double v9 = [(PKPaletteHostView *)self paletteView];
  int v10 = [v9 isPalettePresentingPopover];

  double v11 = [(PKPaletteHostView *)self paletteView];
  int v12 = [v11 hasContextMenuVisible];

  uint64_t v13 = [v7 type];
  if (([(PKPaletteHostView *)self isHidden] & 1) == 0)
  {
    [(PKPaletteHostView *)self alpha];
    if (v14 != 0.0)
    {
      if (([(PKPaletteHostView *)self isPaletteVisible] | v10)) {
        goto LABEL_4;
      }
LABEL_32:
      double v27 = [(PKPaletteHostView *)self pencilInteractionFeedbackHostView];
      -[PKPaletteHostView convertPoint:toView:](self, "convertPoint:toView:", v27, x, y);
      double v29 = v28;
      double v31 = v30;

      int v32 = [(PKPaletteHostView *)self pencilInteractionFeedbackHostView];
      objc_msgSend(v32, "hitTest:withEvent:", v7, v29, v31);
      char v17 = (PKPaletteHostView *)objc_claimAutoreleasedReturnValue();

      goto LABEL_33;
    }
  }
  if ((v10 & 1) == 0) {
    goto LABEL_32;
  }
LABEL_4:
  if (![(PKPaletteHostView *)self isPaletteVisible]
    && ((v10 ^ 1) & 1) == 0
    && ((v8 ^ 1) & 1) == 0
    && v13 != 11)
  {
    BOOL v15 = [(PKPaletteHostView *)self paletteView];
    [v15 dismissPalettePopoverWithCompletion:0];
  }
  v67.receiver = self;
  v67.super_class = (Class)PKPaletteHostView;
  uint64_t v16 = -[PKPaletteHostView hitTest:withEvent:](&v67, sel_hitTest_withEvent_, v7, x, y);
  char v17 = (PKPaletteHostView *)v16;
  if (v7)
  {
    if ((v10 | v12) == 1)
    {
      if (v16) {
        int v18 = 0;
      }
      else {
        int v18 = v12;
      }
      if (v18 == 1 && v13 != 11)
      {
        int64_t v19 = [(PKPaletteHostView *)self paletteView];
        [v19 dismissContextMenu];
      }
      char v20 = v17 ? 0 : v8;
      if ((v20 & 1) == 0 && v13 != 11)
      {
        if (v10)
        {
          CGPoint v21 = [(PKPaletteHostView *)self paletteView];
          [v21 dismissPalettePopoverWithCompletion:0];
        }
        if (!((v17 != 0) | v8 & 1)) {
          char v17 = self;
        }
        goto LABEL_33;
      }
    }
    if (v17) {
      goto LABEL_33;
    }
    CGRect v22 = [(PKPaletteHostView *)self paletteView];
    uint64_t v23 = [v22 palettePopoverPresentingController];
    v24 = [v23 presentedViewController];

    if (v24)
    {
      double v25 = [v24 view];
      double v26 = objc_msgSend(v25, "hitTest:withEvent:", v7, PK_convertRectFromCoordinateSpaceToCoordinateSpace(self, v25, x, y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8)));

      if (v26)
      {
        char v17 = 0;
LABEL_30:

        goto LABEL_33;
      }
    }
    if (v13 != 11)
    {
      double v34 = [(PKPaletteHostView *)self paletteView];
      [v34 dismissPalettePopoverWithCompletion:0];
    }
    if (![(PKPaletteHostView *)self _shouldBeCompact])
    {
      uint64_t v35 = [(PKPaletteHostView *)self paletteView];
      if ([v35 isAutoHideEnabled])
      {
        BOOL v36 = [(PKPaletteHostView *)self isPaletteVisualStateMinimized];

        if (!v36 && v13 != 11) {
          [(PKPaletteHostView *)self _dockPaletteToAutoHideCornerAnimated:1];
        }
      }
      else
      {
      }
    }
    double v37 = [(PKPaletteHostView *)self paletteView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v39 = [(PKPaletteHostView *)self paletteView];
      double v40 = [v39 selectedTool];
      double v41 = [v40 ink];
      char v42 = [v41 _isHandwritingInk];

      double v43 = [v39 selectedTool];
      char v44 = [v43 _isLassoTool];

      if ((v42 & 1) == 0 && (v44 & 1) == 0)
      {
        uint64_t v45 = [(PKPaletteHostView *)self window];
        id v46 = [(PKPaletteHostView *)self paletteView];
        v47 = [v46 presentationController];
        v48 = [v47 view];
        double v49 = [v48 window];

        if (v45 != v49)
        {
          -[PKPaletteHostView convertPoint:toView:](self, "convertPoint:toView:", 0, x, y);
          double v51 = v50;
          double v53 = v52;
          double v54 = [(PKPaletteHostView *)self window];
          v55 = [(PKPaletteHostView *)self paletteView];
          v56 = [v55 presentationController];
          uint64_t v57 = [v56 view];
          double v58 = [v57 window];
          objc_msgSend(v54, "convertPoint:toWindow:", v58, v51, v53);
          double v60 = v59;
          double v62 = v61;

          double v63 = [(PKPaletteHostView *)self paletteView];
          v64 = [v63 presentationController];
          double v65 = [v64 view];
          double v66 = [v65 window];
          objc_msgSend(v66, "hitTest:withEvent:", v7, v60, v62);
          char v17 = (PKPaletteHostView *)objc_claimAutoreleasedReturnValue();

          goto LABEL_30;
        }
      }
    }
    char v17 = 0;
  }
LABEL_33:

  return v17;
}

- (void)_deactivatePaletteCenterConstraints
{
  long long v3 = [(PKPaletteHostView *)self paletteCenterXConstraint];
  LODWORD(v4) = 1132068864;
  [v3 setPriority:v4];

  id v6 = [(PKPaletteHostView *)self paletteCenterYConstraint];
  LODWORD(v5) = 1132068864;
  [v6 setPriority:v5];
}

- (void)_activatePaletteCenterConstraints
{
  long long v3 = [(PKPaletteHostView *)self paletteCenterXConstraint];
  LODWORD(v4) = 1144750080;
  [v3 setPriority:v4];

  id v6 = [(PKPaletteHostView *)self paletteCenterYConstraint];
  LODWORD(v5) = 1144750080;
  [v6 setPriority:v5];
}

- (void)_deactivatePaletteEdgeConstraints
{
  long long v3 = [(PKPaletteHostView *)self paletteTopConstraint];
  LODWORD(v4) = 1132068864;
  [v3 setPriority:v4];

  double v5 = [(PKPaletteHostView *)self paletteBottomConstraint];
  LODWORD(v6) = 1132068864;
  [v5 setPriority:v6];

  id v7 = [(PKPaletteHostView *)self paletteLeftConstraint];
  LODWORD(v8) = 1132068864;
  [v7 setPriority:v8];

  id v10 = [(PKPaletteHostView *)self paletteRightConstraint];
  LODWORD(v9) = 1132068864;
  [v10 setPriority:v9];
}

- (void)_panGestureHandler:(id)a3
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = [(PKPaletteHostView *)self paletteView];
  id v7 = PKDynamicCast(v5, v6);

  double v8 = [v7 tools];
  uint64_t v9 = [v8 count];

  if ([v4 state] == 1)
  {
    id v10 = [(PKPaletteHostView *)self tooltipPresentationHandle];
    [v10 hideFloatingLabel];

    double v11 = [(PKPaletteHostView *)self paletteView];
    [(PKPaletteHostView *)self bringSubviewToFront:v11];

    int v12 = [(PKPaletteHostView *)self paletteView];
    [v12 center];
    -[PKPaletteHostView setDraggingInitialPaletteCenterInSelf:](self, "setDraggingInitialPaletteCenterInSelf:");

    [(PKPaletteHostView *)self setPaletteDraggingBehavior:0];
    [(PKPaletteHostView *)self setDraggingPendingPaletteVisualState:0];
    uint64_t v13 = [(PKPaletteHostView *)self paletteView];
    double v14 = [v13 contentScrollView];
    [v4 locationInView:v14];
    double v16 = v15;
    double v18 = v17;

    if (v9 > 7)
    {
      id v19 = [(PKPaletteHostView *)self paletteView];
      char v20 = [v19 contentScrollView];
      -[PKPaletteHostView setPanGestureDidStartInPaletteScrollView:](self, "setPanGestureDidStartInPaletteScrollView:", objc_msgSend(v20, "pointInside:withEvent:", 0, v16, v18));

LABEL_77:
      goto LABEL_78;
    }
    [(PKPaletteHostView *)self setPanGestureDidStartInPaletteScrollView:0];
    goto LABEL_78;
  }
  if ([v4 state] != 2)
  {
    if ([v4 state] != 3 && objc_msgSend(v4, "state") != 4 && objc_msgSend(v4, "state") != 5) {
      goto LABEL_78;
    }
    if (![(PKPaletteHostView *)self panGestureShouldDragPaletteView])
    {
LABEL_57:
      [(PKPaletteHostView *)self setPanGestureShouldDragPaletteView:1];
      [(PKPaletteHostView *)self setPaletteScrollGestureShouldScroll:v9 > 7];
      uint64_t v82 = [(PKPaletteHostView *)self paletteView];
      v83 = [v82 contentScrollView];
      [v83 setScrollEnabled:1];

      goto LABEL_78;
    }
    v135[0] = MEMORY[0x1E4F143A8];
    v135[1] = 3221225472;
    v135[2] = __40__PKPaletteHostView__panGestureHandler___block_invoke_3;
    v135[3] = &unk_1E64C61C0;
    v135[4] = self;
    [(PKPaletteHostView *)self _performAnimated:1 tracking:0 animations:v135 completion:0];
    [(PKPaletteHostView *)self _projectedLandingPointForGestureRecognizerEnd:v4];
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    [(PKPaletteHostView *)self bounds];
    CGRect v149 = CGRectInset(v148, 20.0, 20.0);
    CGFloat x = v149.origin.x;
    CGFloat y = v149.origin.y;
    CGFloat width = v149.size.width;
    CGFloat height = v149.size.height;
    uint64_t v30 = _PKPaletteVisualStateForPointInRectToSettle(1, v149.origin.x, v149.origin.y, v149.size.width, v149.size.height, v23, v25);
    CGFloat v31 = x;
    CGFloat v32 = y;
    CGFloat v33 = width;
    CGFloat v34 = height;
    if (v30 == 2)
    {
      CGFloat MinX = CGRectGetMinX(*(CGRect *)&v31);
      v150.origin.CGFloat x = x;
      v150.origin.CGFloat y = y;
      v150.size.CGFloat width = width;
      v150.size.CGFloat height = height;
      CGFloat MinY = CGRectGetMinY(v150);
      v151.origin.CGFloat x = x;
      v151.origin.CGFloat y = y;
      v151.size.CGFloat width = width;
      v151.size.CGFloat height = height;
      CGFloat MaxX = CGRectGetMaxX(v151);
      v152.origin.CGFloat x = x;
      v152.origin.CGFloat y = y;
      v152.size.CGFloat width = width;
      v152.size.CGFloat height = height;
      CGFloat v125 = CGRectGetMinY(v152);
      v153.origin.CGFloat x = x;
      v153.origin.CGFloat y = y;
      v153.size.CGFloat width = width;
      v153.size.CGFloat height = height;
      CGFloat v124 = CGRectGetMaxX(v153);
      v154.origin.CGFloat x = x;
      v154.origin.CGFloat y = y;
      v154.size.CGFloat width = width;
      v154.size.CGFloat height = height;
      CGFloat MaxY = CGRectGetMaxY(v154);
      v155.origin.CGFloat x = x;
      v155.origin.CGFloat y = y;
      v155.size.CGFloat width = width;
      v155.size.CGFloat height = height;
      CGFloat v36 = CGRectGetMinX(v155);
      v156.origin.CGFloat x = x;
      v156.origin.CGFloat y = y;
      v156.size.CGFloat width = width;
      v156.size.CGFloat height = height;
      CGFloat v37 = CGRectGetMaxY(v156);
      uint64_t v38 = 0;
      CGFloat v139 = MinX;
      CGFloat v140 = MinY;
      CGFloat v141 = MaxX;
      CGFloat v142 = v125;
      CGFloat v143 = v124;
      CGFloat v144 = MaxY;
      double v39 = qword_1C482A7B0;
      uint64_t v40 = 1;
      double v41 = 3.40282347e38;
      CGFloat v145 = v36;
      CGFloat v146 = v37;
      do
      {
        double v42 = (v25 - *(CGFloat *)((char *)&v139 + v38 + 8)) * (v25 - *(CGFloat *)((char *)&v139 + v38 + 8));
        if (v42 + (v23 - *(CGFloat *)((char *)&v139 + v38)) * (v23 - *(CGFloat *)((char *)&v139 + v38)) < v41)
        {
          uint64_t v40 = *v39;
          double v41 = v42 + (v23 - *(CGFloat *)((char *)&v139 + v38)) * (v23 - *(CGFloat *)((char *)&v139 + v38));
        }
        v38 += 16;
        ++v39;
      }
      while (v38 != 64);
      uint64_t v43 = v40 - 1;
      if ((unint64_t)(v40 - 1) < 8)
      {
        char v44 = qword_1C482A7D0;
LABEL_54:
        uint64_t v74 = v44[v43];
LABEL_56:
        int64_t v75 = [(PKPaletteHostView *)self palettePosition];
        [(PKPaletteHostView *)self setPalettePosition:v74];
        [(PKPaletteHostView *)self setDraggingPendingPaletteVisualState:0];
        [(PKPaletteHostView *)self _setPaletteVisualState:v30 usingTransition:1];
        [(PKPaletteHostView *)self layoutIfNeeded];
        double v76 = [(PKPaletteHostView *)self paletteView];
        [v4 velocityInView:self];
        objc_msgSend(v76, "responseForThrowingFromPosition:toPosition:withVelocity:", v75, v74);
        double v78 = v77;

        v79 = [(PKPaletteHostView *)self paletteView];
        [v4 velocityInView:self];
        objc_msgSend(v79, "dampingRatioForThrowingFromPosition:toPosition:withVelocity:", v75, v74);
        double v81 = v80;

        v134[0] = MEMORY[0x1E4F143A8];
        v134[1] = 3221225472;
        v134[2] = __40__PKPaletteHostView__panGestureHandler___block_invoke_4;
        v134[3] = &unk_1E64C61E8;
        v134[4] = self;
        v134[5] = v74;
        v133[0] = MEMORY[0x1E4F143A8];
        v133[1] = 3221225472;
        v133[2] = __40__PKPaletteHostView__panGestureHandler___block_invoke_5;
        v133[3] = &unk_1E64C8EE0;
        v133[4] = self;
        v133[5] = v74;
        [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDampingRatio:0 response:v134 tracking:v133 dampingRatioSmoothing:v81 responseSmoothing:v78 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
        goto LABEL_57;
      }
    }
    else
    {
      CGFloat MidX = CGRectGetMidX(*(CGRect *)&v31);
      v157.origin.CGFloat x = x;
      v157.origin.CGFloat y = y;
      v157.size.CGFloat width = width;
      v157.size.CGFloat height = height;
      CGFloat v130 = CGRectGetMinY(v157);
      v158.origin.CGFloat x = x;
      v158.origin.CGFloat y = y;
      v158.size.CGFloat width = width;
      v158.size.CGFloat height = height;
      CGFloat v128 = CGRectGetMaxX(v158);
      v159.origin.CGFloat x = x;
      v159.origin.CGFloat y = y;
      v159.size.CGFloat width = width;
      v159.size.CGFloat height = height;
      CGFloat MidY = CGRectGetMidY(v159);
      v160.origin.CGFloat x = x;
      v160.origin.CGFloat y = y;
      v160.size.CGFloat width = width;
      v160.size.CGFloat height = height;
      CGFloat v124 = CGRectGetMidX(v160);
      v161.origin.CGFloat x = x;
      v161.origin.CGFloat y = y;
      v161.size.CGFloat width = width;
      v161.size.CGFloat height = height;
      CGFloat v66 = CGRectGetMaxY(v161);
      v162.origin.CGFloat x = x;
      v162.origin.CGFloat y = y;
      v162.size.CGFloat width = width;
      v162.size.CGFloat height = height;
      CGFloat v67 = CGRectGetMinX(v162);
      v163.origin.CGFloat x = x;
      v163.origin.CGFloat y = y;
      v163.size.CGFloat width = width;
      v163.size.CGFloat height = height;
      CGFloat v68 = CGRectGetMidY(v163);
      uint64_t v69 = 0;
      CGFloat v139 = MidX;
      CGFloat v140 = v130;
      CGFloat v141 = v128;
      CGFloat v142 = MidY;
      CGFloat v143 = v124;
      CGFloat v144 = v66;
      v70 = &qword_1C482A6E0;
      uint64_t v71 = 1;
      double v72 = 3.40282347e38;
      CGFloat v145 = v67;
      CGFloat v146 = v68;
      do
      {
        double v73 = (v25 - *(CGFloat *)((char *)&v139 + v69 + 8)) * (v25 - *(CGFloat *)((char *)&v139 + v69 + 8));
        if (v73 + (v23 - *(CGFloat *)((char *)&v139 + v69)) * (v23 - *(CGFloat *)((char *)&v139 + v69)) < v72)
        {
          uint64_t v71 = *v70;
          double v72 = v73 + (v23 - *(CGFloat *)((char *)&v139 + v69)) * (v23 - *(CGFloat *)((char *)&v139 + v69));
        }
        v69 += 16;
        ++v70;
      }
      while (v69 != 64);
      uint64_t v43 = v71 - 1;
      if ((unint64_t)(v71 - 1) < 8)
      {
        char v44 = qword_1C482A880;
        goto LABEL_54;
      }
    }
    uint64_t v74 = 0;
    goto LABEL_56;
  }
  if (v9 >= 8
    && (unint64_t)([(PKPaletteHostView *)self palettePosition] - 5) >= 4
    && [(PKPaletteHostView *)self panGestureDidStartInPaletteScrollView])
  {
    uint64_t v21 = [(PKPaletteHostView *)self paletteScrollGestureShouldScroll] ^ 1;
  }
  else
  {
    uint64_t v21 = 1;
  }
  [(PKPaletteHostView *)self setPanGestureShouldDragPaletteView:v21];
  if ([(PKPaletteHostView *)self panGestureDidStartInPaletteScrollView])
  {
    uint64_t v45 = [(PKPaletteHostView *)self paletteView];
    id v46 = [v45 contentScrollView];
    [v4 translationInView:v46];
    double v48 = v47;
    double v50 = v49;

    double v51 = [(PKPaletteHostView *)self paletteView];
    double v52 = [v51 contentScrollView];
    [v4 velocityInView:v52];
    double v54 = v53;
    double v56 = v55;

    unint64_t v57 = [(PKPaletteHostView *)self palettePosition] & 0xFFFFFFFFFFFFFFFDLL;
    if (v50 < 0.0) {
      double v50 = -v50;
    }
    BOOL v59 = v50 > 20.0 && v57 == 1;
    int64_t v60 = [(PKPaletteHostView *)self palettePosition];
    BOOL v62 = v60 == 2 || v60 == 4;
    if (v48 < 0.0) {
      double v48 = -v48;
    }
    BOOL v63 = v48 > 20.0 && v62;
    if (([(PKPaletteHostView *)self palettePosition] & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      double v64 = -v54;
      if (v54 >= 0.0) {
        double v64 = v54;
      }
      BOOL v65 = v64 > 4500.0 || v48 > 250.0;
    }
    else
    {
      BOOL v65 = 0;
    }
    int64_t v84 = [(PKPaletteHostView *)self palettePosition];
    if (v84 == 4 || v84 == 2)
    {
      double v85 = -v56;
      if (v56 >= 0.0) {
        double v85 = v56;
      }
      if (v85 > 4500.0) {
        goto LABEL_68;
      }
      BOOL v86 = v50 > 250.0;
    }
    else
    {
      BOOL v86 = 0;
    }
    if (v59 || v63 || v65 || v86)
    {
LABEL_68:
      [(PKPaletteHostView *)self setPanGestureShouldDragPaletteView:1];
      [(PKPaletteHostView *)self setPaletteScrollGestureShouldScroll:0];
      v87 = [(PKPaletteHostView *)self paletteView];
      v88 = [v87 contentScrollView];
      [v88 contentOffset];
      double v90 = v89;
      double v92 = v91;

      v93 = [(PKPaletteHostView *)self paletteView];
      uint64_t v94 = [v93 contentScrollView];
      [v94 setScrollEnabled:0];

      v95 = [(PKPaletteHostView *)self paletteView];
      v96 = [v95 contentScrollView];
      objc_msgSend(v96, "setContentOffset:", v90, v92);
    }
  }
  if ([(PKPaletteHostView *)self panGestureShouldDragPaletteView])
  {
    [v4 locationInView:self];
    CGFloat v98 = v97;
    CGFloat v100 = v99;
    [(PKPaletteHostView *)self bounds];
    [(PKPaletteHostView *)self _scheduleDraggingTransitionToVisualState:_PKPaletteVisualStateForPointInRectToSettle(0, v101, v102, v103, v104, v98, v100)];
    [v4 translationInView:self];
    double v106 = v105;
    double v108 = v107;
    [(PKPaletteHostView *)self draggingInitialPaletteCenterInSelf];
    double v110 = v109;
    [(PKPaletteHostView *)self draggingInitialPaletteCenterInSelf];
    double v112 = v111;
    int64_t v113 = [(PKPaletteHostView *)self paletteDraggingBehavior];
    [(PKPaletteHostView *)self bounds];
    double v114 = CGRectGetMidX(v164);
    [(PKPaletteHostView *)self bounds];
    double v115 = CGRectGetMidY(v165);
    v116 = [(PKPaletteHostView *)self paletteTransition];
    uint64_t v117 = [v116 intermediateVisualState];
    if ((unint64_t)(v117 - 4) < 4 || v117 == 1)
    {
      double v118 = v108 + v112;
      if (v113) {
        double v118 = v100;
      }
      double v119 = v118 - v115;
      double v120 = v106 + v110;
      if (v113) {
        double v120 = v98;
      }
      double v121 = v120 - v114;
    }
    else
    {

      [(PKPaletteHostView *)self setPaletteDraggingBehavior:1];
      [(PKPaletteHostView *)self bounds];
      double v121 = v98 - CGRectGetMidX(v166);
      [(PKPaletteHostView *)self bounds];
      double v119 = v100 - CGRectGetMidY(v167);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__PKPaletteHostView__panGestureHandler___block_invoke;
    aBlock[3] = &unk_1E64C8EB8;
    aBlock[4] = self;
    *(double *)&aBlock[5] = v121;
    *(double *)&aBlock[6] = v119;
    v122 = _Block_copy(aBlock);
    [(PKPaletteHostView *)self layoutIfNeeded];
    v123 = (void *)MEMORY[0x1E4FB1EB0];
    v136[0] = MEMORY[0x1E4F143A8];
    v136[1] = 3221225472;
    v136[2] = __40__PKPaletteHostView__panGestureHandler___block_invoke_2;
    v136[3] = &unk_1E64C6060;
    id v137 = v122;
    id v19 = v122;
    [v123 _animateUsingSpringWithDampingRatio:1 response:v136 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.15 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];

    goto LABEL_77;
  }
LABEL_78:
}

uint64_t __40__PKPaletteHostView__panGestureHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _activatePaletteCenterConstraints];
  [*(id *)(a1 + 32) _deactivatePaletteEdgeConstraints];
  double v2 = *(double *)(a1 + 40);
  long long v3 = [*(id *)(a1 + 32) paletteCenterXConstraint];
  [v3 setConstant:v2];

  double v4 = *(double *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 32) paletteCenterYConstraint];
  [v5 setConstant:v4];

  double v6 = *(void **)(a1 + 32);

  return [v6 layoutIfNeeded];
}

uint64_t __40__PKPaletteHostView__panGestureHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__PKPaletteHostView__panGestureHandler___block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) paletteView];
  long long v3 = [v2 contentScrollView];
  double v4 = [*(id *)(a1 + 32) paletteView];
  uint64_t v5 = [v4 contentScrollView];
  [v5 contentOffset];
  objc_msgSend(v3, "_pk_closestContentOffsetFromOffset:");
  double v7 = v6;
  double v9 = v8;

  id v11 = [*(id *)(a1 + 32) paletteView];
  id v10 = [v11 contentScrollView];
  objc_msgSend(v10, "setContentOffset:animated:", 0, v7, v9);
}

uint64_t __40__PKPaletteHostView__panGestureHandler___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsToDockPaletteToPosition:");
  }
  double v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t __40__PKPaletteHostView__panGestureHandler___block_invoke_5(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1) {
    return [*(id *)(result + 32) _paletteDidDockToPosition:v1 fromUserReposition:1];
  }
  return result;
}

- (void)_scheduleDraggingTransitionToVisualState:(int64_t)a3
{
  if ([(PKPaletteHostView *)self draggingPendingPaletteVisualState] != a3)
  {
    [(PKPaletteHostView *)self setDraggingPendingPaletteVisualState:a3];
    if ((unint64_t)(a3 - 4) < 4 || a3 == 1)
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__processPendingDraggingTransition object:0];
      [(PKPaletteHostView *)self performSelector:sel__processPendingDraggingTransition withObject:0 afterDelay:0.3];
    }
    else
    {
      [(PKPaletteHostView *)self _processPendingDraggingTransition];
    }
  }
}

- (void)_processPendingDraggingTransition
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__processPendingDraggingTransition object:0];
  int64_t v3 = [(PKPaletteHostView *)self draggingPendingPaletteVisualState];
  if (v3)
  {
    [(PKPaletteHostView *)self _setPaletteVisualState:v3 usingTransition:1];
  }
}

- (CGPoint)_projectedLandingPointForGestureRecognizerEnd:(id)a3
{
  v51[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  [v4 velocityInView:self];
  double v10 = v9;
  double v12 = v11;
  double v13 = sqrt(v11 * v11 + v10 * v10);
  [(PKPaletteHostView *)self bounds];
  CGRect v55 = CGRectInset(v54, 20.0, 20.0);
  CGFloat x = v55.origin.x;
  CGFloat y = v55.origin.y;
  CGFloat width = v55.size.width;
  CGFloat height = v55.size.height;
  unint64_t v17 = [(PKPaletteHostView *)self paletteVisualState] - 1;
  if (v17 > 6) {
    double v18 = 1350.0;
  }
  else {
    double v18 = dbl_1C482A810[v17];
  }
  if (v13 >= v18)
  {
    double v19 = v12 * (1.0 / v13);
    double v20 = v6 + v10 * (1.0 / v13);
    double v43 = v8 + v19;
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    CGFloat MinX = CGRectGetMinX(v56);
    v57.origin.CGFloat x = x;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat width = width;
    v57.size.CGFloat height = height;
    *(CGFloat *)double v51 = MinX;
    v51[1] = CGRectGetMinY(v57);
    v58.origin.CGFloat x = x;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    v58.size.CGFloat height = height;
    CGFloat MaxX = CGRectGetMaxX(v58);
    v59.origin.CGFloat x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    *(CGFloat *)&v51[2] = MaxX;
    v51[3] = CGRectGetMinY(v59);
    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = y;
    v60.size.CGFloat width = width;
    v60.size.CGFloat height = height;
    CGFloat v23 = CGRectGetMaxX(v60);
    v61.origin.CGFloat x = x;
    v61.origin.CGFloat y = y;
    v61.size.CGFloat width = width;
    v61.size.CGFloat height = height;
    *(CGFloat *)double v50 = v23;
    v50[1] = CGRectGetMinY(v61);
    v62.origin.CGFloat x = x;
    v62.origin.CGFloat y = y;
    v62.size.CGFloat width = width;
    v62.size.CGFloat height = height;
    CGFloat v24 = CGRectGetMaxX(v62);
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = height;
    *(CGFloat *)&v50[2] = v24;
    v50[3] = CGRectGetMaxY(v63);
    v64.origin.CGFloat x = x;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = width;
    v64.size.CGFloat height = height;
    CGFloat v25 = CGRectGetMinX(v64);
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = width;
    v65.size.CGFloat height = height;
    *(CGFloat *)double v49 = v25;
    v49[1] = CGRectGetMaxY(v65);
    v66.origin.CGFloat x = x;
    v66.origin.CGFloat y = y;
    v66.size.CGFloat width = width;
    v66.size.CGFloat height = height;
    CGFloat v26 = CGRectGetMaxX(v66);
    v67.origin.CGFloat x = x;
    v67.origin.CGFloat y = y;
    v67.size.CGFloat width = width;
    v67.size.CGFloat height = height;
    *(CGFloat *)&v49[2] = v26;
    v49[3] = CGRectGetMaxY(v67);
    v68.origin.CGFloat x = x;
    v68.origin.CGFloat y = y;
    v68.size.CGFloat width = width;
    v68.size.CGFloat height = height;
    CGFloat v27 = CGRectGetMinX(v68);
    v69.origin.CGFloat x = x;
    v69.origin.CGFloat y = y;
    v69.size.CGFloat width = width;
    v69.size.CGFloat height = height;
    *(CGFloat *)double v48 = v27;
    v48[1] = CGRectGetMinY(v69);
    v70.origin.CGFloat x = x;
    v70.origin.CGFloat y = y;
    v70.size.CGFloat width = width;
    v70.size.CGFloat height = height;
    CGFloat v28 = CGRectGetMinX(v70);
    double v44 = y;
    double v45 = x;
    v71.origin.CGFloat x = x;
    v71.origin.CGFloat y = y;
    v71.size.CGFloat width = width;
    v71.size.CGFloat height = height;
    uint64_t v29 = 0;
    *(CGFloat *)&v48[2] = v28;
    v48[3] = CGRectGetMaxY(v71);
    v47[0] = v51;
    v47[1] = v50;
    v47[2] = v49;
    v47[3] = v48;
    double v30 = v20 - v6;
    double v31 = v43 - v8;
    double v32 = -(v20 - v6);
    while (1)
    {
      CGFloat v33 = (double *)v47[v29];
      double v34 = ((v6 - *v33) * (v33[3] - v33[1]) + (v33[1] - v8) * (v33[2] - *v33))
          / ((v33[3] - v33[1]) * v32 + v31 * (v33[2] - *v33));
      if (v34 >= 0.0)
      {
        double v35 = v8 + v34 * v31;
        double v36 = v6 + v34 * v30;
        [(PKPaletteHostView *)self bounds];
        v53.CGFloat x = v36;
        v53.CGFloat y = v35;
        if (CGRectContainsPoint(v72, v53)) {
          break;
        }
      }
      if (++v29 == 4)
      {
        double v35 = v8;
        double v36 = v6;
        break;
      }
    }
    double v8 = v35;
    double v6 = v36;
    CGFloat y = v44;
    CGFloat x = v45;
  }
  _PKPaletteClosestReferencePointFromPointInRect(x, y, width, height, v6, v8);
  double v38 = v37;
  double v40 = v39;

  double v41 = v38;
  double v42 = v40;
  result.CGFloat y = v42;
  result.CGFloat x = v41;
  return result;
}

- (void)transitionIntermediateVisualStateDidChange:(id)a3
{
  [(PKPaletteHostView *)self _updatePaletteSizeAnimated:1];
  [(PKPaletteHostView *)self _updateToolPreviewMinimizedStateAnimated:1];

  [(PKPaletteHostView *)self _updatePaletteAppearance];
}

- (void)transitionPointingDirectionDidChange:(id)a3
{
}

- (void)_performAnimated:(BOOL)a3 tracking:(BOOL)a4 animations:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v9 = a5;
  id v10 = a6;
  double v11 = (void (**)(void, void))v10;
  if (v8)
  {
    if (v7) {
      double v12 = 0.86;
    }
    else {
      double v12 = 0.845;
    }
    if (v7) {
      double v13 = 0.15;
    }
    else {
      double v13 = 0.531;
    }
    double v14 = (void *)MEMORY[0x1E4FB1EB0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__PKPaletteHostView__performAnimated_tracking_animations_completion___block_invoke;
    v15[3] = &unk_1E64C8F08;
    id v16 = v10;
    [v14 _animateUsingSpringWithDampingRatio:v7 response:v9 tracking:v15 dampingRatioSmoothing:v12 responseSmoothing:v13 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
  }
  else
  {
    [MEMORY[0x1E4FB1EB0] _performWithoutRetargetingAnimations:v9];
    if (v11) {
      v11[2](v11, 1);
    }
  }
}

uint64_t __69__PKPaletteHostView__performAnimated_tracking_animations_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateToolPreviewMinimizedStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKPaletteHostView *)self paletteVisualState];
  double v6 = [(PKPaletteHostView *)self paletteTransition];
  int v7 = [v6 isTransitionInProgress];

  if (v7)
  {
    BOOL v8 = [(PKPaletteHostView *)self paletteTransition];
    uint64_t v5 = [v8 intermediateVisualState];
  }
  id v9 = [(PKPaletteHostView *)self paletteView];
  [v9 setToolPreviewMinimized:v5 == 2 animated:v3];
}

- (void)_updateToolPreviewRotationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKPaletteHostView *)self paletteTransition];
  int v6 = [v5 isTransitionInProgress];

  if (v6)
  {
    int v7 = [(PKPaletteHostView *)self paletteTransition];
    uint64_t v8 = [v7 pointingDirection];

    double v9 = 1.57079633;
    if (v8 != 2) {
      double v9 = 0.0;
    }
    BOOL v10 = v8 == 1;
  }
  else
  {
    int64_t v11 = [(PKPaletteHostView *)self paletteVisualState];
    double v9 = 1.57079633;
    if (v11 != 6) {
      double v9 = 0.0;
    }
    BOOL v10 = v11 == 7;
  }
  if (v10) {
    double v12 = -1.57079633;
  }
  else {
    double v12 = v9;
  }
  if (v3)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__PKPaletteHostView__updateToolPreviewRotationAnimated___block_invoke;
    v16[3] = &unk_1E64C61E8;
    v16[4] = self;
    *(double *)&v16[5] = v12;
    [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDampingRatio:0 response:v16 tracking:&__block_literal_global_53 dampingRatioSmoothing:0.845 responseSmoothing:0.431 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
  }
  else
  {
    double v13 = [(PKPaletteHostView *)self paletteView];
    double v14 = [v13 toolPreviewView];
    CGAffineTransformMakeRotation(&v15, v12);
    [v14 setTransform:&v15];
  }
}

void __56__PKPaletteHostView__updateToolPreviewRotationAnimated___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) paletteView];
  BOOL v3 = [v2 toolPreviewView];
  CGAffineTransformMakeRotation(&v5, *(CGFloat *)(a1 + 40));
  [v3 setTransform:&v5];

  id v4 = [*(id *)(a1 + 32) paletteTransition];
  [v4 paletteDidBeginRotationAnimation];
}

- (void)_updatePaletteSizeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKPaletteHostView *)self paletteVisualState];
  int v6 = [(PKPaletteHostView *)self paletteTransition];
  int v7 = [v6 isTransitionInProgress];

  if (v7
    && ([(PKPaletteHostView *)self paletteTransition],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v8 intermediateVisualState],
        v8,
        v5 == 3))
  {
    double v9 = [(PKPaletteHostView *)self paletteTransition];
    uint64_t v10 = [v9 pointingDirection];

    double v11 = dbl_1C482A6D0[(unint64_t)(v10 - 1) < 2];
    uint64_t v5 = 3;
LABEL_6:
    if ((unint64_t)([(PKPaletteHostView *)self palettePosition] - 5) <= 3)
    {
      int64_t v13 = [(PKPaletteHostView *)self palettePosition];
      double v12 = self;
      uint64_t v14 = 0;
LABEL_8:
      [(PKPaletteHostView *)v12 _paletteWillDockToPosition:v13 prepareForExpansion:v14];
    }
  }
  else
  {
    double v11 = 0.531;
    switch(v5)
    {
      case 1:
      case 5:
        double v12 = self;
        int64_t v13 = 3;
        uint64_t v14 = 1;
        goto LABEL_8;
      case 2:
      case 3:
        goto LABEL_6;
      case 4:
        [(PKPaletteHostView *)self _paletteWillDockToPosition:1 prepareForExpansion:1];
        uint64_t v5 = 4;
        break;
      case 6:
        [(PKPaletteHostView *)self _paletteWillDockToPosition:4 prepareForExpansion:1];
        uint64_t v5 = 6;
        break;
      case 7:
        [(PKPaletteHostView *)self _paletteWillDockToPosition:2 prepareForExpansion:1];
        uint64_t v5 = 7;
        break;
      default:
        break;
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PKPaletteHostView__updatePaletteSizeAnimated___block_invoke;
  aBlock[3] = &unk_1E64C61E8;
  aBlock[4] = self;
  aBlock[5] = v5;
  CGAffineTransform v15 = _Block_copy(aBlock);
  id v16 = v15;
  if (v3)
  {
    [(PKPaletteHostView *)self layoutIfNeeded];
    unint64_t v17 = (void *)MEMORY[0x1E4FB1EB0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __48__PKPaletteHostView__updatePaletteSizeAnimated___block_invoke_2;
    v18[3] = &unk_1E64C6960;
    v18[4] = self;
    id v19 = v16;
    [v17 _animateUsingSpringWithDampingRatio:0 response:v18 tracking:&__block_literal_global_55 dampingRatioSmoothing:0.845 responseSmoothing:v11 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
  }
  else
  {
    (*((void (**)(void *))v15 + 2))(v15);
  }
}

void __48__PKPaletteHostView__updatePaletteSizeAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _paletteSizeForVisualState:*(void *)(a1 + 40)];
  double v3 = v2;
  double v5 = v4;
  int v6 = [*(id *)(a1 + 32) paletteWidthConstraint];
  [v6 setConstant:v3];

  int v7 = [*(id *)(a1 + 32) paletteHeightConstraint];
  [v7 setConstant:v5];

  unint64_t v8 = *(void *)(a1 + 40) - 1;
  if (v8 <= 6 && ((0x79u >> v8) & 1) != 0)
  {
    uint64_t v9 = qword_1C482A848[v8];
    id v10 = [*(id *)(a1 + 32) paletteView];
    [v10 configureForDockedAtEdge:v9];
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) paletteView];
    [v10 configureForDockedAtCorner];
  }
}

uint64_t __48__PKPaletteHostView__updatePaletteSizeAnimated___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  double v2 = [*(id *)(a1 + 32) paletteTransition];
  [v2 paletteDidBeginResizingAnimation];

  double v3 = *(void **)(a1 + 32);

  return [v3 layoutIfNeeded];
}

- (CGSize)_paletteSizeForVisualState:(int64_t)a3
{
  uint64_t v4 = 1;
  switch(a3)
  {
    case 1:
      double v5 = [(PKPaletteHostView *)self paletteView];
      [v5 paletteSizeForEdge:4];
      double v7 = v6;

      [(PKPaletteHostView *)self _paletteViewCompactHeight];
      double v9 = v8;
      break;
    case 2:
      id v10 = [(PKPaletteHostView *)self paletteView];
      [v10 minimizedPaletteSize];
      goto LABEL_10;
    case 3:
      int64_t v13 = [(PKPaletteHostView *)self paletteView];
      [v13 paletteSizeForEdge:4];
      double v9 = v14;

      double v7 = v9;
      break;
    case 4:
      goto LABEL_9;
    case 5:
      uint64_t v4 = 4;
      goto LABEL_9;
    case 6:
      uint64_t v4 = 2;
      goto LABEL_9;
    case 7:
      uint64_t v4 = 8;
LABEL_9:
      id v10 = [(PKPaletteHostView *)self paletteView];
      [v10 paletteSizeForEdge:v4];
LABEL_10:
      double v7 = v11;
      double v9 = v12;

      break;
    default:
      double v7 = *MEMORY[0x1E4F1DB30];
      double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
  }
  double v15 = v7;
  double v16 = v9;
  result.CGFloat height = v16;
  result.CGFloat width = v15;
  return result;
}

- (BOOL)_isPaletteAnimating
{
  double v2 = [(PKPaletteHostView *)self paletteTransition];
  char v3 = [v2 isTransitionInProgress];

  return v3;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([(PKPaletteHostView *)self isPaletteVisualStateMinimized])
  {
    double v9 = [v7 view];
    CGAffineTransformMakeScale(&v14, 1.15, 1.15);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    CGAffineTransform v13 = v14;
    v11[2] = __65__PKPaletteHostView_pointerInteraction_willEnterRegion_animator___block_invoke;
    _OWORD v11[3] = &unk_1E64C8F50;
    id v12 = v9;
    id v10 = v9;
    [v8 addAnimations:v11];
  }
}

void __65__PKPaletteHostView_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "paletteView", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
  [v1 setTransform:&v2];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v6 = a5;
  id v7 = [a3 view];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__PKPaletteHostView_pointerInteraction_willExitRegion_animator___block_invoke;
  v9[3] = &unk_1E64C61C0;
  id v10 = v7;
  id v8 = v7;
  [v6 addAnimations:v9];
}

void __64__PKPaletteHostView_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) paletteView];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v3[0] = *MEMORY[0x1E4F1DAB8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v1 setTransform:v3];
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1AE8], "systemPointerStyle", a3, a4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaletteHostView;
  [(PKPaletteHostView *)&v13 traitCollectionDidChange:v4];
  double v5 = [(PKPaletteHostView *)self traitCollection];
  uint64_t v6 = [v5 verticalSizeClass];
  if (v6 == [v4 verticalSizeClass])
  {
    id v7 = [(PKPaletteHostView *)self traitCollection];
    uint64_t v8 = [v7 horizontalSizeClass];
    uint64_t v9 = [v4 horizontalSizeClass];

    if (v8 == v9) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  [(PKPaletteHostView *)self _updatePaletteViewSizeConstraints];
  if ([(PKPaletteHostView *)self _shouldBeCompact])
  {
    [(PKPaletteHostView *)self setLastNonCompactPalettePosition:[(PKPaletteHostView *)self palettePosition]];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__PKPaletteHostView_traitCollectionDidChange___block_invoke;
    v12[3] = &unk_1E64C61C0;
    v12[4] = self;
    [MEMORY[0x1E4FB1EB0] _performWithoutRetargetingAnimations:v12];
  }
  else
  {
    int64_t v10 = [(PKPaletteHostView *)self lastNonCompactPalettePosition];
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 3;
    }
    [(PKPaletteHostView *)self _dockPaletteToPosition:v11 animated:0];
  }
LABEL_11:
  [(PKPaletteHostView *)self _updatePaletteAppearance];
}

uint64_t __46__PKPaletteHostView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _fixToBottomEdge];
  long long v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (BOOL)_shouldBeCompact
{
  char v3 = [(PKPaletteHostView *)self traitCollection];
  id v4 = [(PKPaletteHostView *)self window];
  double v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  return v6;
}

- (BOOL)isPaletteVisualStateMinimized
{
  return [(PKPaletteHostView *)self paletteVisualState] == 2;
}

- (void)paletteViewShowFeedbackForToolChange:(id)a3
{
  [(PKPaletteHostView *)self _installPencilInteractionFeedbackHostViewIfNeeded];
  id v4 = [(PKPaletteHostView *)self pencilInteractionFeedbackHostView];
  double v5 = [(PKPaletteHostView *)self window];
  BOOL v6 = [v5 traitCollection];
  objc_msgSend(v4, "setOverrideUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  id v7 = [(PKPaletteHostView *)self pencilInteractionFeedbackHostView];
  [v7 showFeedbackForCurrentlySelectedToolInPaletteView];
}

- (void)paletteViewContentSizeDidChange:(id)a3
{
}

- (void)paletteViewReturnKeyTypeDidChange:(id)a3
{
  id v8 = a3;
  if ((unint64_t)([v8 palettePosition] - 5) <= 3
    && [v8 shouldExpandFromCorner])
  {
    id v4 = [(PKPaletteHostView *)self paletteView];
    double v5 = [(PKPaletteHostView *)self paletteView];
    uint64_t v6 = objc_msgSend(v4, "edgeLocationToDockFromCorner:", objc_msgSend(v5, "autoHideCorner"));

    if ((unint64_t)(v6 - 1) > 7) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = qword_1C482A880[v6 - 1];
    }
    [(PKPaletteHostView *)self _dockPaletteToPosition:v7 animated:[(PKPaletteHostView *)self isPaletteVisible]];
  }
}

- (void)paletteViewStateDidChange:(id)a3 updatePaletteAppearance:(BOOL)a4
{
  BOOL v4 = a4;
  [(PKPaletteHostView *)self _updatePaletteViewSizeConstraints];
  if (v4)
  {
    [(PKPaletteHostView *)self _updatePaletteAppearance];
  }
}

- (void)paletteViewStateDidChangeScaleFactor:(id)a3
{
  [(PKPaletteHostView *)self _updatePaletteViewSizeConstraints];
  int64_t v4 = [(PKPaletteHostView *)self palettePosition];

  [(PKPaletteHostView *)self _updateConstraintsToDockPaletteToPosition:v4];
}

- (void)paletteViewStateDidChangeAutoHide:(id)a3
{
  if ([a3 isAutoHideEnabled])
  {
    [(PKPaletteHostView *)self _dockPaletteToAutoHideCornerAnimated:1];
  }
  else
  {
    int64_t v4 = [(PKPaletteHostView *)self paletteView];
    double v5 = [(PKPaletteHostView *)self paletteView];
    uint64_t v6 = objc_msgSend(v4, "edgeLocationToDockFromCorner:", objc_msgSend(v5, "autoHideCorner"));

    if ((unint64_t)(v6 - 1) > 7) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = qword_1C482A880[v6 - 1];
    }
    [(PKPaletteHostView *)self _dockPaletteToPosition:v7 animated:1];
  }
}

- (id)paletteShadowColor
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "pk_paletteShadowColor");
}

- (id)paletteBorderColor
{
  char v3 = [(PKPaletteHostView *)self paletteView];
  int64_t v4 = [(PKPaletteHostView *)self window];
  double v5 = [v4 traitCollection];
  uint64_t v6 = [v3 borderColorForTraitCollection:v5];

  return v6;
}

- (CGSize)paletteShadowOffset
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (double)paletteShadowOpacity
{
  double v2 = [(PKPaletteHostView *)self paletteView];
  [v2 shadowOpacity];
  double v4 = v3;

  return v4;
}

- (double)paletteShadowRadius
{
  double v2 = [(PKPaletteHostView *)self paletteView];
  [v2 shadowRadius];
  double v4 = v3;

  return v4;
}

- (double)paletteBorderWidth
{
  double v3 = [(PKPaletteHostView *)self paletteView];
  double v4 = [(PKPaletteHostView *)self window];
  double v5 = [v4 traitCollection];
  [v3 borderWidthForTraitCollection:v5];
  double v7 = v6;

  return v7;
}

- (double)paletteSpringAnimationDampingRatio
{
  return 0.845;
}

- (double)paletteSpringAnimationResponse
{
  return 0.531;
}

- (double)paletteEdgeSpacing
{
  return 20.0;
}

- (double)paletteEdgeSpacingForMinimized
{
  return 30.0;
}

- (PKPaletteTooltipPresentationHandle)tooltipPresentationHandle
{
  return self->_tooltipPresentationHandle;
}

- (PKPaletteView)paletteView
{
  return self->_paletteView;
}

- (void)setPaletteView:(id)a3
{
}

- (double)paletteViewBottomEdgeSpacing
{
  return self->_paletteViewBottomEdgeSpacing;
}

- (BOOL)isPaletteVisible
{
  return self->_paletteVisible;
}

- (PKPaletteHostViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaletteHostViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEffectivePaletteVisible
{
  return self->_effectivePaletteVisible;
}

- (void)setEffectivePaletteVisible:(BOOL)a3
{
  self->_effectivePaletteVisible = a3;
}

- (NSLayoutConstraint)paletteWidthConstraint
{
  return self->_paletteWidthConstraint;
}

- (void)setPaletteWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteHeightConstraint
{
  return self->_paletteHeightConstraint;
}

- (void)setPaletteHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteTopConstraint
{
  return self->_paletteTopConstraint;
}

- (void)setPaletteTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteBottomConstraint
{
  return self->_paletteBottomConstraint;
}

- (void)setPaletteBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteLeftConstraint
{
  return self->_paletteLeftConstraint;
}

- (void)setPaletteLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteRightConstraint
{
  return self->_paletteRightConstraint;
}

- (void)setPaletteRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteCenterXConstraint
{
  return self->_paletteCenterXConstraint;
}

- (void)setPaletteCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)paletteCenterYConstraint
{
  return self->_paletteCenterYConstraint;
}

- (void)setPaletteCenterYConstraint:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapToExpandPaletteFromMinimizedGestureRecognizer
{
  return self->_tapToExpandPaletteFromMinimizedGestureRecognizer;
}

- (void)setTapToExpandPaletteFromMinimizedGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)touchDownFeedbackGestureRecognizer
{
  return self->_touchDownFeedbackGestureRecognizer;
}

- (void)setTouchDownFeedbackGestureRecognizer:(id)a3
{
}

- (int64_t)paletteDraggingBehavior
{
  return self->_paletteDraggingBehavior;
}

- (void)setPaletteDraggingBehavior:(int64_t)a3
{
  self->_paletteDraggingBehavior = a3;
}

- (int64_t)paletteVisualState
{
  return self->_paletteVisualState;
}

- (int64_t)palettePosition
{
  return self->_palettePosition;
}

- (void)setPalettePosition:(int64_t)a3
{
  self->_palettePosition = a3;
}

- (int64_t)lastNonCompactPalettePosition
{
  return self->_lastNonCompactPalettePosition;
}

- (void)setLastNonCompactPalettePosition:(int64_t)a3
{
  self->_lastNonCompactPalettePosition = a3;
}

- (int64_t)draggingPendingPaletteVisualState
{
  return self->_draggingPendingPaletteVisualState;
}

- (void)setDraggingPendingPaletteVisualState:(int64_t)a3
{
  self->_draggingPendingPaletteVisualState = a3;
}

- (CGPoint)draggingInitialPaletteCenterInSelf
{
  double x = self->_draggingInitialPaletteCenterInSelf.x;
  double y = self->_draggingInitialPaletteCenterInSelf.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDraggingInitialPaletteCenterInSelf:(CGPoint)a3
{
  self->_draggingInitialPaletteCenterInSelf = a3;
}

- (PKPaletteTransition)paletteTransition
{
  return self->_paletteTransition;
}

- (void)setPaletteTransition:(id)a3
{
}

- (PKPalettePencilInteractionFeedbackHostView)pencilInteractionFeedbackHostView
{
  return self->_pencilInteractionFeedbackHostView;
}

- (void)setPencilInteractionFeedbackHostView:(id)a3
{
}

- (BOOL)panGestureDidStartInPaletteScrollView
{
  return self->_panGestureDidStartInPaletteScrollView;
}

- (void)setPanGestureDidStartInPaletteScrollView:(BOOL)a3
{
  self->_panGestureDidStartInPaletteScrollView = a3;
}

- (BOOL)panGestureShouldDragPaletteView
{
  return self->_panGestureShouldDragPaletteView;
}

- (void)setPanGestureShouldDragPaletteView:(BOOL)a3
{
  self->_panGestureShouldDragPaletteView = a3;
}

- (BOOL)paletteScrollGestureShouldScroll
{
  return self->_paletteScrollGestureShouldScroll;
}

- (void)setPaletteScrollGestureShouldScroll:(BOOL)a3
{
  self->_paletteScrollGestureShouldScroll = a3;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_pencilInteractionFeedbackHostView, 0);
  objc_storeStrong((id *)&self->_paletteTransition, 0);
  objc_storeStrong((id *)&self->_touchDownFeedbackGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToExpandPaletteFromMinimizedGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_paletteCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_paletteCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_paletteRightConstraint, 0);
  objc_storeStrong((id *)&self->_paletteLeftConstraint, 0);
  objc_storeStrong((id *)&self->_paletteBottomConstraint, 0);
  objc_storeStrong((id *)&self->_paletteTopConstraint, 0);
  objc_storeStrong((id *)&self->_paletteHeightConstraint, 0);
  objc_storeStrong((id *)&self->_paletteWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_paletteView, 0);

  objc_storeStrong((id *)&self->_tooltipPresentationHandle, 0);
}

@end