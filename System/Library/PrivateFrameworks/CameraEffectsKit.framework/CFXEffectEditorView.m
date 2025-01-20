@interface CFXEffectEditorView
- (BOOL)CFX_isPreviewingEditEffect;
- (BOOL)CFX_isRemoveAlwaysAvailableInCurrentMode;
- (BOOL)CFX_isRemoveAvailableInCurrentMode;
- (BOOL)CFX_updateOverlayForTranslation;
- (BOOL)CFX_updateTrackingTypeForTouchLocation;
- (BOOL)CFX_useFaceReticle;
- (BOOL)delegateSupportsApplyAnimationTransformsToEffect;
- (BOOL)delegateSupportsCalculatingAnimatedFaceTrackingTransform;
- (BOOL)delegateSupportsDidMoveEffect;
- (BOOL)effectWasEdited;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isBeginningEditing;
- (BOOL)isEditing;
- (BOOL)isEndingEditing;
- (BOOL)isTextEditing;
- (BOOL)textEffectEditorView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)truncateTextToMaximumLength;
- (CADisplayLink)debugDisplayLink;
- (CADisplayLink)editControlsTrackingDisplayLink;
- (CADisplayLink)effectAnimationDisplayLink;
- (CFXEffect)editEffect;
- (CFXEffectEditorView)initWithMode:(unint64_t)a3 delegate:(id)a4;
- (CFXEffectEditorViewDelegate)delegate;
- (CFXFaceReticleView)faceTrackingReticle;
- (CFXTextEffectEditorView)textEditorView;
- (CGAffineTransform)editTransform;
- (CGPoint)lastSpacingBetweenTouchAndCenterOfEffect;
- (CGPoint)lastTouchLocation;
- (CGPoint)lastTouchLocationInView;
- (CGRect)CFX_textEditingFrame;
- (CGRect)renderBounds;
- (JFXEffectsPreviewGenerator)previewGenerator;
- (JFXImageView)editEffectPreview;
- (JFXOverlayEffectAnimationView)effectAnimationView;
- (JFXOverlayEffectDebugView)debugOverlayView;
- (NSMutableArray)beginEditingCompletionBlocks;
- (NSMutableArray)endEditingCompletionBlocks;
- (NSString)oldEditText;
- (OS_dispatch_queue)effectRenderingQueue;
- (UIButton)removeButton;
- (double)displayScale;
- (double)lastEffectMovedNotifyTime;
- (double)lastFaceRectacleUpdateTime;
- (id)CFX_getTextEditingProperties;
- (id)CFX_springForTextEditAnimation;
- (id)overlayEffectDebugViewOptions;
- (unint64_t)appliedEditingGestures;
- (unint64_t)maximumTextLength;
- (unint64_t)mode;
- (void)CFX_addBeginEditingCompletionBlock:(id)a3;
- (void)CFX_addEndEditingCompletionBlock:(id)a3;
- (void)CFX_applyEffectAnimationView:(BOOL)a3;
- (void)CFX_applyEffectTransformChanges;
- (void)CFX_beginEditingEffect:(id)a3 isAnimating:(BOOL)a4;
- (void)CFX_beginPreviewingEditEffect;
- (void)CFX_beginTextEditing;
- (void)CFX_effectAnimationDisplayLinkFired:(id)a3;
- (void)CFX_effectPreviewBoundsDidChange;
- (void)CFX_endEditingEffect;
- (void)CFX_endPreviewingEditEffect;
- (void)CFX_endTextEditing:(BOOL)a3;
- (void)CFX_forceHideEditControls;
- (void)CFX_hideEditControls;
- (void)CFX_hideEditControls:(BOOL)a3;
- (void)CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock:(id)a3;
- (void)CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock:(id)a3;
- (void)CFX_previewEditEffectIfNeeded;
- (void)CFX_removeEffect;
- (void)CFX_rotateEffect:(double)a3;
- (void)CFX_scaleEffect:(double)a3;
- (void)CFX_setUserInteractionEnabledIfPossible:(BOOL)a3;
- (void)CFX_setupControls;
- (void)CFX_setupGestures;
- (void)CFX_showEditControls;
- (void)CFX_startApplyingEffectAnimationViewDisplayLink;
- (void)CFX_startTrackingExternalEffectChanges;
- (void)CFX_stopApplyingEffectAnimationViewDisplayLink;
- (void)CFX_stopTrackingExternalEffectChanges;
- (void)CFX_updateEditControlsLayout;
- (void)CFX_updateEffectText:(id)a3 updateTextProperties:(BOOL)a4;
- (void)CFX_updateExternalEffectTrackingRunningState;
- (void)CFX_updateSpacingBetweenTouchAndCenterOfEffectWithGesture:(id)a3;
- (void)CFX_updateTextEditFieldLayout;
- (void)beginEditingEffect:(id)a3;
- (void)beginEditingEffect:(id)a3 animated:(BOOL)a4 withCompletionBlock:(id)a5;
- (void)dealloc;
- (void)didTap:(id)a3;
- (void)endEditingAnimated:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)externalEffectTrackingDisplayLinkFired:(id)a3;
- (void)handlePanGesture:(id)a3;
- (void)handlePinchGesture:(id)a3;
- (void)handleRotateGesture:(id)a3;
- (void)initializeAvailabilityOfFrequentCalledDelegateMethods;
- (void)layoutSubviews;
- (void)notifyEffectTrackingDidChangeToType:(int64_t)a3;
- (void)onDebugDisplayLink:(id)a3;
- (void)setAppliedEditingGestures:(unint64_t)a3;
- (void)setBeginEditingCompletionBlocks:(id)a3;
- (void)setDebugDisplayLink:(id)a3;
- (void)setDebugOverlayView:(id)a3;
- (void)setDisplayScale:(double)a3;
- (void)setEditControlsTrackingDisplayLink:(id)a3;
- (void)setEditEffect:(id)a3;
- (void)setEditEffectPreview:(id)a3;
- (void)setEditTransform:(CGAffineTransform *)a3;
- (void)setEffectAnimationDisplayLink:(id)a3;
- (void)setEffectAnimationView:(id)a3;
- (void)setEffectWasEdited:(BOOL)a3;
- (void)setEndEditingCompletionBlocks:(id)a3;
- (void)setFaceTrackingReticle:(id)a3;
- (void)setIsBeginningEditing:(BOOL)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setIsEndingEditing:(BOOL)a3;
- (void)setIsTextEditing:(BOOL)a3;
- (void)setLastEffectMovedNotifyTime:(double)a3;
- (void)setLastFaceRectacleUpdateTime:(double)a3;
- (void)setLastSpacingBetweenTouchAndCenterOfEffect:(CGPoint)a3;
- (void)setLastTouchLocationInView:(CGPoint)a3;
- (void)setMaximumTextLength:(unint64_t)a3;
- (void)setOldEditText:(id)a3;
- (void)setPreviewGenerator:(id)a3;
- (void)setRemoveButton:(id)a3;
- (void)setTextEditorView:(id)a3;
- (void)setTruncateTextToMaximumLength:(BOOL)a3;
- (void)startUpdatingDebugOverlayView;
- (void)stopUpdatingDebugOverlayView;
- (void)textEffectEditorView:(id)a3 textChanged:(id)a4 shouldUpdateTextEditingProperties:(BOOL)a5;
@end

@implementation CFXEffectEditorView

- (CFXEffectEditorView)initWithMode:(unint64_t)a3 delegate:(id)a4
{
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CFXEffectEditorView;
  v8 = -[CFXEffectEditorView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegate, a4);
    v9->_mode = a3;
    [(CFXEffectEditorView *)v9 setBackgroundColor:0];
    v10 = [MEMORY[0x263F1C920] mainScreen];
    [v10 scale];
    -[CFXEffectEditorView setDisplayScale:](v9, "setDisplayScale:");

    uint64_t v11 = MEMORY[0x263F000D0];
    long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v9->_editTransform.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v9->_editTransform.c = v12;
    *(_OWORD *)&v9->_editTransform.tx = *(_OWORD *)(v11 + 32);
    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v14 = dispatch_queue_create("CFXEffectEditorView.effectUpdateQueue", v13);
    effectRenderingQueue = v9->_effectRenderingQueue;
    v9->_effectRenderingQueue = (OS_dispatch_queue *)v14;

    [(CFXEffectEditorView *)v9 setClipsToBounds:1];
    v9->_appliedEditingGestures = 0;
    v9->_lastTouchLocationInView = (CGPoint)kInvalidTouchLocation;
    v9->_lastSpacingBetweenTouchAndCenterOfEffect = (CGPoint)kInvalidTouchLocation;
    v9->_displayLinkBusyOnRenderQueue = 0;
    v9->_isRenderingEditEffect = 0;
    v9->_isRenderPendingForEditEffect = 0;
    [(CFXEffectEditorView *)v9 CFX_setupGestures];
    [(CFXEffectEditorView *)v9 CFX_setupControls];
    if (a3 == 1) {
      [(CFXEffectEditorView *)v9 CFX_setUserInteractionEnabledIfPossible:0];
    }
    if (isDrawEffectsEditorBoundsEnabled())
    {
      v16 = [(CFXEffectEditorView *)v9 layer];
      [v16 setBorderWidth:2.0];

      id v17 = [MEMORY[0x263F1C550] greenColor];
      uint64_t v18 = [v17 CGColor];
      v19 = [(CFXEffectEditorView *)v9 layer];
      [v19 setBorderColor:v18];
    }
    [(CFXEffectEditorView *)v9 startUpdatingDebugOverlayView];
    [(CFXEffectEditorView *)v9 initializeAvailabilityOfFrequentCalledDelegateMethods];
  }
  return v9;
}

- (void)initializeAvailabilityOfFrequentCalledDelegateMethods
{
  v3 = [(CFXEffectEditorView *)self delegate];
  self->_delegateSupportsDidMoveEffect = objc_opt_respondsToSelector() & 1;

  v4 = [(CFXEffectEditorView *)self delegate];
  self->_delegateSupportsCalculatingAnimatedFaceTrackingTransform = objc_opt_respondsToSelector() & 1;

  id v5 = [(CFXEffectEditorView *)self delegate];
  self->_delegateSupportsApplyAnimationTransformsToEffect = objc_opt_respondsToSelector() & 1;
}

- (void)dealloc
{
  v3 = [(CFXEffectEditorView *)self editControlsTrackingDisplayLink];
  [v3 invalidate];

  v4 = [(CFXEffectEditorView *)self effectAnimationDisplayLink];
  [v4 invalidate];

  [(CFXEffectEditorView *)self stopUpdatingDebugOverlayView];
  v5.receiver = self;
  v5.super_class = (Class)CFXEffectEditorView;
  [(CFXEffectEditorView *)&v5 dealloc];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CFXEffectEditorView;
  [(CFXEffectEditorView *)&v3 layoutSubviews];
  [(CFXEffectEditorView *)self CFX_effectPreviewBoundsDidChange];
}

- (void)CFX_effectPreviewBoundsDidChange
{
  [(CFXEffectEditorView *)self CFX_updateEditControlsLayout];
  [(CFXEffectEditorView *)self CFX_updateTextEditFieldLayout];
  objc_super v3 = [(CFXEffectEditorView *)self effectRenderingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CFXEffectEditorView_CFX_effectPreviewBoundsDidChange__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __55__CFXEffectEditorView_CFX_effectPreviewBoundsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_previewEditEffectIfNeeded");
}

- (void)CFX_setupGestures
{
  id v6 = (id)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_didTap_];
  [v6 setNumberOfTapsRequired:1];
  [(CFXEffectEditorView *)self addGestureRecognizer:v6];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F1C860]) initWithTarget:self action:sel_didPinch_];
  [v3 setDelegate:self];
  [v3 setScale:1.0];
  [(CFXEffectEditorView *)self addGestureRecognizer:v3];
  v4 = (void *)[objc_alloc(MEMORY[0x263F1C900]) initWithTarget:self action:sel_didRotate_];
  [v4 setDelegate:self];
  [(CFXEffectEditorView *)self addGestureRecognizer:v4];
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x263F1C838]) initWithTarget:self action:sel_didPan_];
  [v5 setDelegate:self];
  [v5 setMinimumNumberOfTouches:1];
  [(CFXEffectEditorView *)self addGestureRecognizer:v5];
}

- (void)didTap:(id)a3
{
  id v25 = a3;
  BOOL v4 = [v25 state] == 3;
  objc_super v5 = v25;
  if (v4)
  {
    [v25 locationInView:self];
    double v7 = v6;
    double v9 = v8;
    v10 = [(CFXEffectEditorView *)self delegate];
    uint64_t v11 = objc_msgSend(v10, "effectEditorView:effectAtPoint:", self, v7, v9);

    long long v12 = [v11 jtEffect];
    if (v12) {
      goto LABEL_4;
    }
    if (![(CFXEffectEditorView *)self CFX_isPreviewingEditEffect]) {
      goto LABEL_9;
    }
    v15 = [(CFXEffectEditorView *)self delegate];
    v16 = [(CFXEffectEditorView *)self editEffect];
    int v17 = objc_msgSend(v15, "effectEditorView:isEffectAtPoint:effect:", self, v16, v7, v9);

    if (!v17) {
      goto LABEL_9;
    }
    uint64_t v18 = [(CFXEffectEditorView *)self editEffect];
    long long v12 = [v18 jtEffect];

    if (v12)
    {
LABEL_4:
      v13 = [(CFXEffectEditorView *)self editEffect];
      dispatch_queue_t v14 = [v13 jtEffect];

      if (v12 == v14)
      {
        [(CFXEffectEditorView *)self beginTextEditing];
      }
      else
      {
        [(CFXEffectEditorView *)self CFX_endEditingEffect];
        [(CFXEffectEditorView *)self CFX_beginEditingEffect:v11 isAnimating:0];
        [(CFXEffectEditorView *)self CFX_beginTextEditing];
      }
    }
    else
    {
LABEL_9:
      v19 = [(CFXEffectEditorView *)self delegate];
      char v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) == 0)
      {
        [(CFXEffectEditorView *)self endEditingAnimated:1 withCompletionBlock:0];
        goto LABEL_13;
      }
      -[CFXEffectEditorView convertPoint:toView:](self, "convertPoint:toView:", 0, v7, v9);
      double v22 = v21;
      double v24 = v23;
      [(CFXEffectEditorView *)self endEditingAnimated:1 withCompletionBlock:0];
      long long v12 = [(CFXEffectEditorView *)self delegate];
      objc_msgSend(v12, "effectEditorView:didEndEditingByTappingOutSideEffectAtScreenPoint:", self, v22, v24);
    }

LABEL_13:
    objc_super v5 = v25;
  }
}

- (void)setAppliedEditingGestures:(unint64_t)a3
{
  if (self->_appliedEditingGestures == a3) {
    return;
  }
  objc_super v5 = [(CFXEffectEditorView *)self editEffect];
  id v9 = [v5 jtEffect];

  unint64_t appliedEditingGestures = self->_appliedEditingGestures;
  if (a3) {
    BOOL v7 = appliedEditingGestures == 0;
  }
  else {
    BOOL v7 = 0;
  }
  uint64_t v8 = v7;
  if (v7)
  {
    [v9 beginInteractiveEditing];
LABEL_14:
    [MEMORY[0x263F61248] setInteractiveMode:v8];
    goto LABEL_15;
  }
  if (!a3 && appliedEditingGestures)
  {
    [v9 endInteractiveEditing];
    goto LABEL_14;
  }
LABEL_15:
  self->_unint64_t appliedEditingGestures = a3;
}

- (void)handlePinchGesture:(id)a3
{
  id v6 = a3;
  if (![(CFXEffectEditorView *)self isTextEditing])
  {
    if ([v6 state] == 1)
    {
      [(CFXEffectEditorView *)self CFX_hideEditControls];
      unint64_t v4 = [(CFXEffectEditorView *)self appliedEditingGestures] | 2;
      [(CFXEffectEditorView *)self setAppliedEditingGestures:v4];
      [(CFXEffectEditorView *)self setAppliedEditingGestures:v4];
    }
    [v6 scale];
    -[CFXEffectEditorView CFX_scaleEffect:](self, "CFX_scaleEffect:");
    [v6 setScale:1.0];
    if ([v6 state] == 3 || objc_msgSend(v6, "state") == 4)
    {
      unint64_t v5 = [(CFXEffectEditorView *)self appliedEditingGestures] & 0xFFFFFFFFFFFFFFFDLL;
      [(CFXEffectEditorView *)self setAppliedEditingGestures:v5];
      [(CFXEffectEditorView *)self setAppliedEditingGestures:v5];
      [(CFXEffectEditorView *)self CFX_showEditControls];
    }
  }
}

- (void)handleRotateGesture:(id)a3
{
  id v6 = a3;
  if (![(CFXEffectEditorView *)self isTextEditing])
  {
    if ([v6 state] == 1)
    {
      [(CFXEffectEditorView *)self CFX_hideEditControls];
      unint64_t v4 = [(CFXEffectEditorView *)self appliedEditingGestures] | 4;
      [(CFXEffectEditorView *)self setAppliedEditingGestures:v4];
      [(CFXEffectEditorView *)self setAppliedEditingGestures:v4];
    }
    [v6 rotation];
    -[CFXEffectEditorView CFX_rotateEffect:](self, "CFX_rotateEffect:");
    [v6 setRotation:0.0];
    if ([v6 state] == 3 || objc_msgSend(v6, "state") == 4)
    {
      unint64_t v5 = [(CFXEffectEditorView *)self appliedEditingGestures] & 0xFFFFFFFFFFFFFFFBLL;
      [(CFXEffectEditorView *)self setAppliedEditingGestures:v5];
      [(CFXEffectEditorView *)self setAppliedEditingGestures:v5];
      [(CFXEffectEditorView *)self CFX_showEditControls];
    }
  }
}

- (void)handlePanGesture:(id)a3
{
  id v7 = a3;
  if (![(CFXEffectEditorView *)self isTextEditing])
  {
    if ([v7 state] == 1)
    {
      [(CFXEffectEditorView *)self CFX_hideEditControls];
      unint64_t v4 = [(CFXEffectEditorView *)self appliedEditingGestures] | 1;
      [(CFXEffectEditorView *)self setAppliedEditingGestures:v4];
      [(CFXEffectEditorView *)self setAppliedEditingGestures:v4];
    }
    if ([v7 state] == 3 || objc_msgSend(v7, "state") == 4)
    {
      unint64_t v5 = [(CFXEffectEditorView *)self appliedEditingGestures] & 0xFFFFFFFFFFFFFFFELL;
      [(CFXEffectEditorView *)self setAppliedEditingGestures:v5];
      [(CFXEffectEditorView *)self setAppliedEditingGestures:v5];
      [(CFXEffectEditorView *)self CFX_showEditControls];
    }
    [(CFXEffectEditorView *)self CFX_updateSpacingBetweenTouchAndCenterOfEffectWithGesture:v7];
    id v6 = [v7 view];
    objc_msgSend(v7, "setTranslation:inView:", v6, 0.0, 0.0);
  }
}

- (void)CFX_updateSpacingBetweenTouchAndCenterOfEffectWithGesture:(id)a3
{
  id v29 = a3;
  uint64_t v4 = [v29 state];
  if ((unint64_t)(v4 - 3) < 2)
  {
    if ([(CFXEffectEditorView *)self appliedEditingGestures]) {
      goto LABEL_9;
    }
    -[CFXEffectEditorView setLastTouchLocationInView:](self, "setLastTouchLocationInView:", 1.79769313e308, 1.79769313e308);
    -[CFXEffectEditorView setLastSpacingBetweenTouchAndCenterOfEffect:](self, "setLastSpacingBetweenTouchAndCenterOfEffect:", 1.79769313e308, 1.79769313e308);
    goto LABEL_7;
  }
  if (v4 != 2)
  {
    if (v4 != 1) {
      goto LABEL_9;
    }
    unint64_t v5 = [v29 view];
    [v29 locationInView:v5];
    double v7 = v6;
    double v9 = v8;
    v10 = [v29 view];
    -[CFXEffectEditorView convertPoint:fromView:](self, "convertPoint:fromView:", v10, v7, v9);
    -[CFXEffectEditorView setLastTouchLocationInView:](self, "setLastTouchLocationInView:");

    uint64_t v11 = [(CFXEffectEditorView *)self delegate];
    long long v12 = [(CFXEffectEditorView *)self editEffect];
    [(CFXEffectEditorView *)self lastTouchLocation];
    double v14 = v13;
    double v16 = v15;
    [(CFXEffectEditorView *)self renderBounds];
    objc_msgSend(v11, "effectEditorView:spacingBetweenCenterPointOfEffect:point:relativeToBounds:", self, v12, v14, v16, v17, v18, v19, v20);
    -[CFXEffectEditorView setLastSpacingBetweenTouchAndCenterOfEffect:](self, "setLastSpacingBetweenTouchAndCenterOfEffect:");

LABEL_7:
    [(CFXEffectEditorView *)self CFX_updateExternalEffectTrackingRunningState];
    goto LABEL_9;
  }
  double v21 = [v29 view];
  [v29 translationInView:v21];
  double v23 = v22;
  double v25 = v24;

  [(CFXEffectEditorView *)self lastTouchLocationInView];
  double v27 = v23 + v26;
  [(CFXEffectEditorView *)self lastTouchLocationInView];
  -[CFXEffectEditorView setLastTouchLocationInView:](self, "setLastTouchLocationInView:", v27, v25 + v28);
LABEL_9:
}

- (void)CFX_setUserInteractionEnabledIfPossible:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CFXEffectEditorView *)self mode] != 1 && v3;
  [(CFXEffectEditorView *)self setUserInteractionEnabled:v5];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();
  }
  char v9 = isKindOfClass & v8;

  return v9 & 1;
}

- (BOOL)isEditing
{
  v2 = [(CFXEffectEditorView *)self editEffect];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)beginEditingEffect:(id)a3
{
}

- (void)beginEditingEffect:(id)a3 animated:(BOOL)a4 withCompletionBlock:(id)a5
{
  int v6 = a4;
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(CFXEffectEditorView *)self isEditing];
  if (v9) {
    [(CFXEffectEditorView *)self CFX_addBeginEditingCompletionBlock:v9];
  }
  if (![(CFXEffectEditorView *)self isBeginningEditing])
  {
    [(CFXEffectEditorView *)self setIsBeginningEditing:1];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __71__CFXEffectEditorView_beginEditingEffect_animated_withCompletionBlock___block_invoke;
    v24[3] = &unk_264C0A0C0;
    BOOL v25 = v10;
    v24[4] = self;
    uint64_t v11 = (void (**)(void))MEMORY[0x237DD15A0](v24);
    [(CFXEffectEditorView *)self CFX_setUserInteractionEnabledIfPossible:0];
    long long v12 = [(CFXEffectEditorView *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      double v14 = [(CFXEffectEditorView *)self delegate];
      int v15 = [v14 effectEditorView:self shouldDisableEditingAnimationForEffect:v8];

      v6 &= ~v15;
    }
    if ([(CFXEffectEditorView *)self mode] == 2 && v6)
    {
      double v16 = [v8 jtEffect];
      [v16 setHidden:1];
      [(CFXEffectEditorView *)self CFX_beginEditingEffect:v8 isAnimating:1];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __71__CFXEffectEditorView_beginEditingEffect_animated_withCompletionBlock___block_invoke_2;
      v22[3] = &unk_264C0A3F0;
      double v23 = v11;
      [(CFXEffectEditorView *)self CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock:v22];
    }
    else
    {
      [(CFXEffectEditorView *)self CFX_beginEditingEffect:v8 isAnimating:0];
      if ([(CFXEffectEditorView *)self CFX_useFaceReticle])
      {
        double v17 = [v8 jtEffect];
        int v18 = [v17 type];

        if (v18 == 2)
        {
          double v19 = [v8 jtEffect];
          double v20 = [(CFXEffectEditorView *)self faceTrackingReticle];
          double v21 = [v19 trackingProps];
          objc_msgSend(v20, "userFeedbackForTrackingType:needsHaptics:", objc_msgSend(v21, "trackingType"), 1);
        }
      }
      v11[2](v11);
    }
  }
}

uint64_t __71__CFXEffectEditorView_beginEditingEffect_animated_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 40))
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) delegate];
      [v4 effectEditorViewDidBeginEditing:*(void *)(a1 + 32)];
    }
  }
  [*(id *)(a1 + 32) setIsBeginningEditing:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "beginEditingCompletionBlocks", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * i) + 16))();
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) setBeginEditingCompletionBlocks:0];
  return objc_msgSend(*(id *)(a1 + 32), "CFX_setUserInteractionEnabledIfPossible:", 1);
}

uint64_t __71__CFXEffectEditorView_beginEditingEffect_animated_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endEditingAnimated:(BOOL)a3 withCompletionBlock:(id)a4
{
  int v4 = a3;
  uint64_t v6 = (void (**)(void))a4;
  if ([(CFXEffectEditorView *)self isEditing])
  {
    if (v6) {
      [(CFXEffectEditorView *)self CFX_addEndEditingCompletionBlock:v6];
    }
    if (![(CFXEffectEditorView *)self isEndingEditing])
    {
      if ([(CFXEffectEditorView *)self isBeginningEditing])
      {
        objc_initWeak(&location, self);
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __62__CFXEffectEditorView_endEditingAnimated_withCompletionBlock___block_invoke;
        v17[3] = &unk_264C0C618;
        objc_copyWeak(&v18, &location);
        char v19 = v4;
        [(CFXEffectEditorView *)self CFX_addBeginEditingCompletionBlock:v17];
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      else
      {
        [(CFXEffectEditorView *)self setIsEndingEditing:1];
        uint64_t v7 = [(CFXEffectEditorView *)self removeButton];
        [v7 setHidden:1];

        [(CFXEffectEditorView *)self CFX_setUserInteractionEnabledIfPossible:0];
        uint64_t v8 = [(CFXEffectEditorView *)self delegate];
        char v9 = objc_opt_respondsToSelector();

        if (v9)
        {
          BOOL v10 = [(CFXEffectEditorView *)self delegate];
          long long v11 = [(CFXEffectEditorView *)self editEffect];
          int v12 = [v10 effectEditorView:self shouldDisableEditingAnimationForEffect:v11];

          v4 &= ~v12;
        }
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __62__CFXEffectEditorView_endEditingAnimated_withCompletionBlock___block_invoke_2;
        v16[3] = &unk_264C09FA8;
        v16[4] = self;
        long long v13 = (void (**)(void))MEMORY[0x237DD15A0](v16);
        if ([(CFXEffectEditorView *)self mode] == 2 && v4)
        {
          [(CFXEffectEditorView *)self CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock:v13];
        }
        else if (([(CFXEffectEditorView *)self CFX_useFaceReticle] & v4) == 1 {
               && ([(CFXEffectEditorView *)self faceTrackingReticle],
        }
                   long long v14 = objc_claimAutoreleasedReturnValue(),
                   v14,
                   v14))
        {
          int v15 = [(CFXEffectEditorView *)self faceTrackingReticle];
          [v15 fadeOutAndEndHapticWithCompletionBlock:v13];
        }
        else
        {
          v13[2](v13);
        }
      }
    }
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

void __62__CFXEffectEditorView_endEditingAnimated_withCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endEditingAnimated:*(unsigned __int8 *)(a1 + 40) withCompletionBlock:0];
}

uint64_t __62__CFXEffectEditorView_endEditingAnimated_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "CFX_endEditingEffect");
  [*(id *)(a1 + 32) setEditEffect:0];
  objc_msgSend(*(id *)(a1 + 32), "CFX_hideEditControls");
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 effectEditorViewDidEndEditing:*(void *)(a1 + 32)];

  objc_msgSend(*(id *)(a1 + 32), "CFX_stopTrackingExternalEffectChanges");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  char v3 = objc_msgSend(*(id *)(a1 + 32), "endEditingCompletionBlocks", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) setEndEditingCompletionBlocks:0];
  [*(id *)(a1 + 32) setIsEndingEditing:0];
  return objc_msgSend(*(id *)(a1 + 32), "CFX_setUserInteractionEnabledIfPossible:", 1);
}

- (void)notifyEffectTrackingDidChangeToType:(int64_t)a3
{
  if ([(CFXEffectEditorView *)self CFX_useFaceReticle])
  {
    id v5 = [(CFXEffectEditorView *)self faceTrackingReticle];
    [v5 userFeedbackForTrackingType:a3 needsHaptics:1];
  }
}

- (void)CFX_beginEditingEffect:(id)a3 isAnimating:(BOOL)a4
{
  id v6 = a3;
  [(CFXEffectEditorView *)self setEffectWasEdited:0];
  [(CFXEffectEditorView *)self setEditEffect:v6];
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v14[0] = *MEMORY[0x263F000D0];
  v14[1] = v7;
  v14[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(CFXEffectEditorView *)self setEditTransform:v14];
  uint64_t v8 = [v6 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v10 = [v6 jtEffect];
    [v10 beginInteractiveEditing];
  }
  if (!a4) {
    [(CFXEffectEditorView *)self CFX_showEditControls];
  }
  long long v11 = [(CFXEffectEditorView *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    long long v13 = [(CFXEffectEditorView *)self delegate];
    [v13 effectEditorView:self didBeginEditingEffect:v6];
  }
  [(CFXEffectEditorView *)self CFX_beginPreviewingEditEffect];
}

- (void)CFX_removeEffect
{
  [(CFXEffectEditorView *)self CFX_endPreviewingEditEffect];
  char v3 = [(CFXEffectEditorView *)self delegate];
  uint64_t v4 = [(CFXEffectEditorView *)self editEffect];
  [v3 effectEditorView:self didRemoveEffect:v4];

  [(CFXEffectEditorView *)self endEditingAnimated:1 withCompletionBlock:0];
}

- (void)CFX_endEditingEffect
{
  [(CFXEffectEditorView *)self CFX_endTextEditing:0];
  [(CFXEffectEditorView *)self CFX_hideEditControls];
  [(CFXEffectEditorView *)self CFX_endPreviewingEditEffect];
  char v3 = [(CFXEffectEditorView *)self editEffect];
  uint64_t v4 = [v3 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(CFXEffectEditorView *)self editEffect];
    long long v7 = [v6 jtEffect];
    [v7 endInteractiveEditing];
  }
  [(CFXEffectEditorView *)self setAppliedEditingGestures:0];
  uint64_t v8 = [(CFXEffectEditorView *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    long long v10 = [(CFXEffectEditorView *)self delegate];
    long long v11 = [(CFXEffectEditorView *)self editEffect];
    [v10 effectEditorView:self didEndEditingEffect:v11];
  }
  [(CFXEffectEditorView *)self setEffectWasEdited:0];
}

- (void)CFX_addBeginEditingCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXEffectEditorView *)self beginEditingCompletionBlocks];

  if (!v5)
  {
    id v6 = objc_opt_new();
    [(CFXEffectEditorView *)self setBeginEditingCompletionBlocks:v6];
  }
  id v8 = [(CFXEffectEditorView *)self beginEditingCompletionBlocks];
  long long v7 = (void *)[v4 copy];

  [v8 addObject:v7];
}

- (void)CFX_addEndEditingCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXEffectEditorView *)self endEditingCompletionBlocks];

  if (!v5)
  {
    id v6 = objc_opt_new();
    [(CFXEffectEditorView *)self setEndEditingCompletionBlocks:v6];
  }
  id v8 = [(CFXEffectEditorView *)self endEditingCompletionBlocks];
  long long v7 = (void *)[v4 copy];

  [v8 addObject:v7];
}

- (CGPoint)lastTouchLocation
{
  [(CFXEffectEditorView *)self lastTouchLocationInView];
  double v5 = v4;
  double v6 = 1.79769313e308;
  BOOL v7 = v5 == 1.79769313e308 && v3 == 1.79769313e308;
  double v8 = 1.79769313e308;
  if (!v7)
  {
    char v9 = +[CFXMediaSettings sharedInstance];
    [v9 renderSize];
    double v11 = v10;
    double v13 = v12;

    [(CFXEffectEditorView *)self lastTouchLocationInView];
    double v15 = v14;
    double v17 = v16;
    [(CFXEffectEditorView *)self bounds];
    double v6 = CGPointConvertToCoordinateSpace(2uLL, 0, v15, v17, v18, v19, v11, v13);
  }
  result.y = v8;
  result.x = v6;
  return result;
}

- (void)CFX_scaleEffect:(double)a3
{
  [(CFXEffectEditorView *)self editTransform];
  CGAffineTransformScale(&v7, &v6, a3, a3);
  CGAffineTransform v5 = v7;
  [(CFXEffectEditorView *)self setEditTransform:&v5];
  [(CFXEffectEditorView *)self CFX_applyEffectTransformChanges];
}

- (void)CFX_rotateEffect:(double)a3
{
  [(CFXEffectEditorView *)self editTransform];
  CGAffineTransformRotate(&v7, &v6, a3);
  CGAffineTransform v5 = v7;
  [(CFXEffectEditorView *)self setEditTransform:&v5];
  [(CFXEffectEditorView *)self CFX_applyEffectTransformChanges];
}

- (BOOL)CFX_updateOverlayForTranslation
{
  double v3 = [(CFXEffectEditorView *)self delegate];
  double v4 = [(CFXEffectEditorView *)self editEffect];
  [(CFXEffectEditorView *)self lastTouchLocation];
  double v6 = v5;
  double v8 = v7;
  [(CFXEffectEditorView *)self renderBounds];
  objc_msgSend(v3, "effectEditorView:spacingBetweenCenterPointOfEffect:point:relativeToBounds:", self, v4, v6, v8, v9, v10, v11, v12);
  double v14 = v13;
  double v16 = v15;

  [(CFXEffectEditorView *)self lastSpacingBetweenTouchAndCenterOfEffect];
  double v18 = v14 - v17;
  [(CFXEffectEditorView *)self lastSpacingBetweenTouchAndCenterOfEffect];
  double v20 = v16 - v19;
  BOOL v21 = v20 != *(double *)(MEMORY[0x263F00148] + 8) || v18 != *MEMORY[0x263F00148];
  if (v21)
  {
    [(CFXEffectEditorView *)self editTransform];
    CGAffineTransformTranslate(&v25, &v24, v18, v20);
    CGAffineTransform v23 = v25;
    [(CFXEffectEditorView *)self setEditTransform:&v23];
    [(CFXEffectEditorView *)self CFX_applyEffectTransformChanges];
  }
  return v21;
}

- (BOOL)CFX_updateTrackingTypeForTouchLocation
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(CFXEffectEditorView *)self lastEffectMovedNotifyTime];
  if (v4 - v5 < 0.1) {
    return 0;
  }
  [(CFXEffectEditorView *)self setLastEffectMovedNotifyTime:v4];
  double v7 = [(CFXEffectEditorView *)self editEffect];
  double v8 = [v7 jtEffect];
  if ([v8 type] == 2)
  {
    double v9 = [v7 jtEffect];
  }
  else
  {
    double v9 = 0;
  }

  double v10 = [v9 trackingProps];
  uint64_t v11 = [v10 trackingType];

  if ([(CFXEffectEditorView *)self delegateSupportsDidMoveEffect])
  {
    double v12 = [(CFXEffectEditorView *)self delegate];
    [(CFXEffectEditorView *)self lastTouchLocationInView];
    objc_msgSend(v12, "effectEditorView:didMoveEffect:withTouchPoint:", self, v7);
  }
  if ([(CFXEffectEditorView *)self CFX_useFaceReticle] && v9)
  {
    double v13 = [(CFXEffectEditorView *)self faceTrackingReticle];
    double v14 = [v9 trackingProps];
    objc_msgSend(v13, "userFeedbackForTrackingType:needsHaptics:", objc_msgSend(v14, "trackingType"), 0);
  }
  double v15 = [v9 trackingProps];
  uint64_t v16 = [v15 trackingType];

  BOOL v17 = v11 == v16;
  BOOL v6 = v11 != v16;
  if (!v17)
  {
    [(CFXEffectEditorView *)self lastSpacingBetweenTouchAndCenterOfEffect];
    if (v19 != 1.79769313e308 || v18 != 1.79769313e308)
    {
      double v20 = [(CFXEffectEditorView *)self delegate];
      BOOL v21 = [(CFXEffectEditorView *)self editEffect];
      [(CFXEffectEditorView *)self lastTouchLocation];
      double v23 = v22;
      double v25 = v24;
      [(CFXEffectEditorView *)self renderBounds];
      objc_msgSend(v20, "effectEditorView:spacingBetweenCenterPointOfEffect:point:relativeToBounds:", self, v21, v23, v25, v26, v27, v28, v29);
      -[CFXEffectEditorView setLastSpacingBetweenTouchAndCenterOfEffect:](self, "setLastSpacingBetweenTouchAndCenterOfEffect:");
    }
  }

  return v6;
}

- (void)CFX_applyEffectTransformChanges
{
  [(CFXEffectEditorView *)self editTransform];
  if (!CGAffineTransformIsIdentity(&v10))
  {
    double v3 = [(CFXEffectEditorView *)self delegate];
    double v4 = [(CFXEffectEditorView *)self editEffect];
    [(CFXEffectEditorView *)self editTransform];
    [(CFXEffectEditorView *)self renderBounds];
    objc_msgSend(v3, "effectEditorView:didTransformEffect:transform:relativeToBounds:", self, v4, v9);

    double v5 = [(CFXEffectEditorView *)self effectRenderingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__CFXEffectEditorView_CFX_applyEffectTransformChanges__block_invoke;
    block[3] = &unk_264C09FA8;
    block[4] = self;
    dispatch_async(v5, block);

    long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v7[0] = *MEMORY[0x263F000D0];
    v7[1] = v6;
    v7[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [(CFXEffectEditorView *)self setEditTransform:v7];
    [(CFXEffectEditorView *)self setEffectWasEdited:1];
  }
}

uint64_t __54__CFXEffectEditorView_CFX_applyEffectTransformChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_previewEditEffectIfNeeded");
}

- (void)CFX_setupControls
{
  if ([(CFXEffectEditorView *)self CFX_isRemoveAvailableInCurrentMode])
  {
    double v3 = objc_opt_new();
    [(CFXEffectEditorView *)self setRemoveButton:v3];

    double v4 = [(CFXEffectEditorView *)self removeButton];
    [v4 addTarget:self action:sel_tapRemoveButton_ forControlEvents:64];

    double v5 = [MEMORY[0x263F1C6B0] systemImageNamed:@"xmark.circle.fill"];
    long long v6 = [(CFXEffectEditorView *)self removeButton];
    [v6 setImage:v5 forState:0];

    double v7 = [(CFXEffectEditorView *)self removeButton];
    [(CFXEffectEditorView *)self addSubview:v7];

    double v8 = [(CFXEffectEditorView *)self removeButton];
    [v8 sizeToFit];

    double v9 = [(CFXEffectEditorView *)self removeButton];
    [v9 setHidden:1];

    CGAffineTransform v10 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v11 = [(CFXEffectEditorView *)self removeButton];
    [v11 setTintColor:v10];

    id v12 = [MEMORY[0x263F1C550] blackColor];
    uint64_t v13 = [v12 CGColor];
    double v14 = [(CFXEffectEditorView *)self removeButton];
    double v15 = [v14 layer];
    [v15 setShadowColor:v13];

    uint64_t v16 = [(CFXEffectEditorView *)self removeButton];
    BOOL v17 = [v16 layer];
    LODWORD(v18) = 0.25;
    [v17 setShadowOpacity:v18];

    double v19 = [(CFXEffectEditorView *)self removeButton];
    double v20 = [v19 layer];
    [v20 setShadowRadius:1.0];

    BOOL v21 = [(CFXEffectEditorView *)self removeButton];
    double v22 = [v21 layer];
    objc_msgSend(v22, "setShadowOffset:", 1.0, 1.0);
  }
  if ([(CFXEffectEditorView *)self CFX_useFaceReticle])
  {
    double v23 = [CFXFaceReticleView alloc];
    [(CFXEffectEditorView *)self bounds];
    double v24 = -[CFXFaceReticleView initWithFrame:reticleType:](v23, "initWithFrame:reticleType:", 0);
    [(CFXEffectEditorView *)self setFaceTrackingReticle:v24];

    id v25 = [(CFXEffectEditorView *)self faceTrackingReticle];
    [(CFXEffectEditorView *)self addSubview:v25];
  }
}

- (void)CFX_hideEditControls
{
}

- (void)CFX_forceHideEditControls
{
}

- (void)CFX_hideEditControls:(BOOL)a3
{
  if (a3
    || ![(CFXEffectEditorView *)self CFX_isRemoveAlwaysAvailableInCurrentMode])
  {
    double v4 = [(CFXEffectEditorView *)self removeButton];
    [v4 setHidden:1];
  }
  [(CFXEffectEditorView *)self CFX_updateExternalEffectTrackingRunningState];
}

- (CGRect)renderBounds
{
  v2 = +[CFXMediaSettings sharedInstance];
  [v2 renderSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v4;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)CFX_updateEditControlsLayout
{
  if (![(CFXEffectEditorView *)self CFX_isRemoveAvailableInCurrentMode]) {
    return;
  }
  double v3 = [(CFXEffectEditorView *)self removeButton];
  char v4 = [v3 isHidden];

  if (v4) {
    return;
  }
  double v5 = [(CFXEffectEditorView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_8;
  }
  double v6 = [(CFXEffectEditorView *)self delegate];
  int v7 = [v6 removeButtonRelativeBoundsIsViewSpace];

  if (v7)
  {
LABEL_8:
    id v29 = [(CFXEffectEditorView *)self delegate];
    double v23 = [(CFXEffectEditorView *)self editEffect];
    [(CFXEffectEditorView *)self bounds];
    objc_msgSend(v29, "effectEditorView:removeButtonPositionForEffect:relativeToBounds:", self, v23);
    double v25 = v24;
    double v27 = v26;
    double v28 = [(CFXEffectEditorView *)self removeButton];
    objc_msgSend(v28, "setCenter:", v25, v27);

    goto LABEL_9;
  }
  double v8 = [(CFXEffectEditorView *)self delegate];
  double v9 = [(CFXEffectEditorView *)self editEffect];
  [(CFXEffectEditorView *)self renderBounds];
  objc_msgSend(v8, "effectEditorView:removeButtonPositionForEffect:relativeToBounds:", self, v9);
  double v11 = v10;
  double v13 = v12;

  [(CFXEffectEditorView *)self renderBounds];
  double v15 = v14;
  double v17 = v16;
  [(CFXEffectEditorView *)self bounds];
  double v20 = CGPointConvertToCoordinateSpace(1uLL, 0, v11, v13, v15, v17, v18, v19);
  double v22 = v21;
  id v29 = [(CFXEffectEditorView *)self removeButton];
  objc_msgSend(v29, "setCenter:", v20, v22);
LABEL_9:
}

- (BOOL)CFX_isRemoveAlwaysAvailableInCurrentMode
{
  if ([(CFXEffectEditorView *)self mode] != 2) {
    return 0;
  }
  return [(CFXEffectEditorView *)self isEditing];
}

- (BOOL)CFX_isRemoveAvailableInCurrentMode
{
  return [(CFXEffectEditorView *)self mode] != 1;
}

- (void)CFX_showEditControls
{
  if ([(CFXEffectEditorView *)self CFX_isRemoveAvailableInCurrentMode])
  {
    double v3 = [(CFXEffectEditorView *)self removeButton];
    [v3 setHidden:0];

    [(CFXEffectEditorView *)self CFX_updateEditControlsLayout];
  }
  [(CFXEffectEditorView *)self CFX_updateExternalEffectTrackingRunningState];
}

- (void)CFX_startTrackingExternalEffectChanges
{
  double v3 = [(CFXEffectEditorView *)self editControlsTrackingDisplayLink];

  if (!v3)
  {
    char v4 = [(CFXEffectEditorView *)self editControlsTrackingDisplayLink];
    [v4 invalidate];

    double v5 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_externalEffectTrackingDisplayLinkFired_];
    [(CFXEffectEditorView *)self setEditControlsTrackingDisplayLink:v5];

    double v6 = [(CFXEffectEditorView *)self editControlsTrackingDisplayLink];
    [v6 setPreferredFramesPerSecond:60];

    id v8 = [(CFXEffectEditorView *)self editControlsTrackingDisplayLink];
    int v7 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v8 addToRunLoop:v7 forMode:*MEMORY[0x263EFF588]];
  }
}

- (void)CFX_stopTrackingExternalEffectChanges
{
  double v3 = [(CFXEffectEditorView *)self editControlsTrackingDisplayLink];

  if (v3)
  {
    char v4 = [(CFXEffectEditorView *)self editControlsTrackingDisplayLink];
    [v4 invalidate];

    [(CFXEffectEditorView *)self setEditControlsTrackingDisplayLink:0];
  }
}

- (void)CFX_updateExternalEffectTrackingRunningState
{
  if ([(CFXEffectEditorView *)self mode] == 2
    || (([(CFXEffectEditorView *)self lastTouchLocation], v4 == 1.79769313e308)
      ? (BOOL v5 = v3 == 1.79769313e308)
      : (BOOL v5 = 0),
        v5
     && ([(CFXEffectEditorView *)self mode]
      || ([(CFXEffectEditorView *)self removeButton],
          int v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 isHidden],
          v7,
          (v8 & 1) != 0))))
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = [(CFXEffectEditorView *)self editControlsTrackingDisplayLink];

    if (v6) {
      uint64_t v6 = 0;
    }
    else {
      [(CFXEffectEditorView *)self CFX_startTrackingExternalEffectChanges];
    }
  }
  id v9 = [(CFXEffectEditorView *)self editControlsTrackingDisplayLink];
  [v9 setPaused:v6];
}

- (void)externalEffectTrackingDisplayLinkFired:(id)a3
{
  [(CFXEffectEditorView *)self lastTouchLocationInView];
  BOOL v6 = v5 == 1.79769313e308 && v4 == 1.79769313e308;
  if (!v6
    && [(CFXEffectEditorView *)self CFX_updateOverlayForTranslation]
    && [(CFXEffectEditorView *)self CFX_updateTrackingTypeForTouchLocation])
  {
    [(CFXEffectEditorView *)self CFX_updateOverlayForTranslation];
  }
  [(CFXEffectEditorView *)self CFX_updateEditControlsLayout];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v8 = v7;
  [(CFXEffectEditorView *)self lastFaceRectacleUpdateTime];
  if (v8 - v9 >= 0.0333333333)
  {
    BOOL v10 = [(CFXEffectEditorView *)self CFX_useFaceReticle];
    double v11 = [(CFXEffectEditorView *)self faceTrackingReticle];
    id v13 = v11;
    if (v10)
    {
      [v11 setHidden:0];

      double v12 = [(CFXEffectEditorView *)self faceTrackingReticle];
      [(CFXEffectEditorView *)self bounds];
      objc_msgSend(v12, "updateFrameForDisplayRelativeToBounds:");

      [(CFXEffectEditorView *)self setLastFaceRectacleUpdateTime:v8];
    }
    else
    {
      [v11 setHidden:1];
    }
  }
}

- (void)CFX_beginTextEditing
{
  if (![(CFXEffectEditorView *)self isTextEditing])
  {
    double v3 = [(CFXEffectEditorView *)self delegate];
    double v4 = [(CFXEffectEditorView *)self editEffect];
    int v5 = [v3 effectEditorView:self shouldEditTextForEffect:v4];

    if (v5)
    {
      BOOL v6 = [(CFXEffectEditorView *)self CFX_getTextEditingProperties];
      if (v6)
      {
        double v7 = [(CFXEffectEditorView *)self delegate];
        char v8 = objc_opt_respondsToSelector();

        if ((v8 & 1) == 0
          || ([(CFXEffectEditorView *)self delegate],
              double v9 = objc_claimAutoreleasedReturnValue(),
              [(CFXEffectEditorView *)self editEffect],
              BOOL v10 = objc_claimAutoreleasedReturnValue(),
              char v11 = [v9 effectEditorView:self presentCustomTextEditingUI:v10],
              v10,
              v9,
              (v11 & 1) == 0))
        {
          [(CFXEffectEditorView *)self CFX_hideEditControls];
          [(CFXEffectEditorView *)self setIsTextEditing:1];
          double v12 = [(CFXEffectEditorView *)self delegate];
          id v13 = [(CFXEffectEditorView *)self editEffect];
          double v14 = [v12 effectEditorView:self textForEffect:v13];
          [(CFXEffectEditorView *)self setOldEditText:v14];

          double v15 = [(CFXEffectEditorView *)self delegate];
          uint64_t v16 = [(CFXEffectEditorView *)self editEffect];
          [v15 effectEditorView:self didBeginEditingTextForEffect:v16];

          double v17 = [(CFXEffectEditorView *)self effectRenderingQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __43__CFXEffectEditorView_CFX_beginTextEditing__block_invoke;
          block[3] = &unk_264C09FA8;
          block[4] = self;
          dispatch_async(v17, block);

          double v18 = [(CFXEffectEditorView *)self delegate];
          LOBYTE(v16) = objc_opt_respondsToSelector();

          if (v16)
          {
            double v19 = [(CFXEffectEditorView *)self delegate];
            double v20 = [(CFXEffectEditorView *)self editEffect];
            -[CFXEffectEditorView setMaximumTextLength:](self, "setMaximumTextLength:", [v19 effectEditorView:self maximumTextLengthForEffect:v20]);
          }
          else
          {
            [(CFXEffectEditorView *)self setMaximumTextLength:-1];
          }
          [(CFXEffectEditorView *)self bounds];
          double v21 = +[CFXTextEffectEditorView viewWithFrame:textEditingProperties:](CFXTextEffectEditorView, "viewWithFrame:textEditingProperties:", v6);
          [(CFXEffectEditorView *)self setTextEditorView:v21];

          double v22 = [(CFXEffectEditorView *)self textEditorView];
          [v22 setDelegate:self];

          [(CFXEffectEditorView *)self setTruncateTextToMaximumLength:0];
          double v23 = [MEMORY[0x263F1C408] sharedApplication];
          [v23 setApplicationSupportsShakeToEdit:0];

          double v24 = [(CFXEffectEditorView *)self textEditorView];
          [(CFXEffectEditorView *)self addSubview:v24];

          if ([(CFXEffectEditorView *)self CFX_isRemoveAvailableInCurrentMode])
          {
            double v25 = [(CFXEffectEditorView *)self removeButton];
            [(CFXEffectEditorView *)self bringSubviewToFront:v25];
          }
          double v26 = [(CFXEffectEditorView *)self textEditorView];
          [v26 applyTextEditingProperties:v6];

          double v27 = [(CFXEffectEditorView *)self textEditorView];
          [v27 selectAll];
        }
      }
    }
  }
}

uint64_t __43__CFXEffectEditorView_CFX_beginTextEditing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_previewEditEffectIfNeeded");
}

- (id)CFX_getTextEditingProperties
{
  double v3 = [(CFXEffectEditorView *)self delegate];
  double v4 = [(CFXEffectEditorView *)self editEffect];
  [(CFXEffectEditorView *)self bounds];
  int v5 = objc_msgSend(v3, "effectEditorView:textEditingPropertiesForEffect:relativeToBounds:", self, v4);

  return v5;
}

- (void)CFX_updateTextEditFieldLayout
{
  if ([(CFXEffectEditorView *)self isTextEditing])
  {
    id v4 = [(CFXEffectEditorView *)self CFX_getTextEditingProperties];
    double v3 = [(CFXEffectEditorView *)self textEditorView];
    [v3 applyTextEditingProperties:v4];
  }
}

- (void)CFX_endTextEditing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CFXEffectEditorView *)self isTextEditing])
  {
    if (v3)
    {
      id v12 = [(CFXEffectEditorView *)self oldEditText];
    }
    else
    {
      int v5 = [(CFXEffectEditorView *)self delegate];
      BOOL v6 = [(CFXEffectEditorView *)self editEffect];
      id v12 = [v5 effectEditorView:self textForEffect:v6];
    }
    [(CFXEffectEditorView *)self CFX_updateEffectText:v12 updateTextProperties:0];
    double v7 = [(CFXEffectEditorView *)self textEditorView];
    [v7 endTextEditing];

    char v8 = [(CFXEffectEditorView *)self textEditorView];
    [v8 removeFromSuperview];

    [(CFXEffectEditorView *)self setTextEditorView:0];
    double v9 = [MEMORY[0x263F1C408] sharedApplication];
    [v9 setApplicationSupportsShakeToEdit:1];

    [(CFXEffectEditorView *)self setIsTextEditing:0];
    BOOL v10 = [(CFXEffectEditorView *)self delegate];
    char v11 = [(CFXEffectEditorView *)self editEffect];
    [v10 effectEditorView:self didEndEditingTextForEffect:v11 wasCancelled:v3];

    [(CFXEffectEditorView *)self CFX_showEditControls];
  }
}

- (void)CFX_updateEffectText:(id)a3 updateTextProperties:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((CFX_updateEffectText_updateTextProperties__applyingEffectAttributes & 1) == 0)
  {
    CFX_updateEffectText_updateTextProperties__applyingEffectAttributes = 1;
    if ([(CFXEffectEditorView *)self truncateTextToMaximumLength])
    {
      uint64_t v7 = objc_msgSend(v6, "substringWithRange:", 0, (unint64_t)fmin((double)(unint64_t)objc_msgSend(v6, "length"), (double)-[CFXEffectEditorView maximumTextLength](self, "maximumTextLength")));

      [(CFXEffectEditorView *)self setTruncateTextToMaximumLength:0];
      id v6 = (id)v7;
    }
    char v8 = [(CFXEffectEditorView *)self delegate];
    double v9 = [(CFXEffectEditorView *)self editEffect];
    [v8 effectEditorView:self didEditTextForEffect:v9 newText:v6];

    if (v4)
    {
      BOOL v10 = [(CFXEffectEditorView *)self CFX_getTextEditingProperties];
      char v11 = [(CFXEffectEditorView *)self textEditorView];
      [v11 applyTextEditingProperties:v10];
    }
    [(CFXEffectEditorView *)self CFX_updateEditControlsLayout];
    id v12 = [(CFXEffectEditorView *)self effectRenderingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__CFXEffectEditorView_CFX_updateEffectText_updateTextProperties___block_invoke;
    block[3] = &unk_264C09FA8;
    block[4] = self;
    dispatch_async(v12, block);

    CFX_updateEffectText_updateTextProperties__applyingEffectAttributes = 0;
  }
}

uint64_t __65__CFXEffectEditorView_CFX_updateEffectText_updateTextProperties___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_previewEditEffectIfNeeded");
}

- (CGRect)CFX_textEditingFrame
{
  BOOL v3 = [(CFXEffectEditorView *)self textEditorView];
  [v3 textEditingFrameRelativeToView:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)textEffectEditorView:(id)a3 textChanged:(id)a4 shouldUpdateTextEditingProperties:(BOOL)a5
{
}

- (BOOL)textEffectEditorView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  id v8 = a3;
  id v9 = a5;
  if ([(CFXEffectEditorView *)self maximumTextLength] != -1)
  {
    double v10 = [v8 text];
    uint64_t v11 = [v10 length];
    unint64_t v12 = v11 - length + [v9 length];
    if (v12 > [(CFXEffectEditorView *)self maximumTextLength]) {
      [(CFXEffectEditorView *)self setTruncateTextToMaximumLength:1];
    }
  }
  return 1;
}

- (JFXEffectsPreviewGenerator)previewGenerator
{
  previewGenerator = self->_previewGenerator;
  if (!previewGenerator)
  {
    double v4 = objc_alloc_init(JFXEffectsPreviewGenerator);
    double v5 = self->_previewGenerator;
    self->_previewGenerator = v4;

    [(JFXEffectsPreviewGenerator *)self->_previewGenerator trackStats:0];
    [(JFXEffectsPreviewGenerator *)self->_previewGenerator setName:@"EffectEditorPreview"];
    previewGenerator = self->_previewGenerator;
  }
  return previewGenerator;
}

- (void)CFX_beginPreviewingEditEffect
{
  BOOL v3 = [(CFXEffectEditorView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(CFXEffectEditorView *)self delegate];
    int v6 = [v5 effectEditorViewShouldPreviewEditEffect:self];

    if (v6)
    {
      double v7 = objc_alloc_init(JFXImageView);
      [(CFXEffectEditorView *)self setEditEffectPreview:v7];

      id v8 = [(CFXEffectEditorView *)self editEffectPreview];
      [v8 setUserInteractionEnabled:0];

      id v9 = [MEMORY[0x263F1C550] clearColor];
      double v10 = [(CFXEffectEditorView *)self editEffectPreview];
      [v10 setBackgroundColor:v9];

      uint64_t v11 = [(CFXEffectEditorView *)self editEffectPreview];
      [v11 setContentMode:2];

      unint64_t v12 = [(CFXEffectEditorView *)self editEffectPreview];
      [v12 setPreferIOSurfaceForYUV:1];

      double v13 = [(CFXEffectEditorView *)self editEffectPreview];
      [v13 setPreferMetalKit:1];

      double v14 = [(CFXEffectEditorView *)self editEffectPreview];
      [(CFXEffectEditorView *)self addSubview:v14];

      if ([(CFXEffectEditorView *)self CFX_isRemoveAvailableInCurrentMode])
      {
        double v15 = [(CFXEffectEditorView *)self removeButton];
        [(CFXEffectEditorView *)self bringSubviewToFront:v15];
      }
      uint64_t v16 = [(CFXEffectEditorView *)self editEffectPreview];
      [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v17 = [(CFXEffectEditorView *)self editEffectPreview];
      double v18 = [v17 leftAnchor];
      double v19 = [(CFXEffectEditorView *)self leftAnchor];
      double v20 = [v18 constraintEqualToAnchor:v19];
      [v20 setActive:1];

      double v21 = [(CFXEffectEditorView *)self editEffectPreview];
      double v22 = [v21 rightAnchor];
      double v23 = [(CFXEffectEditorView *)self rightAnchor];
      double v24 = [v22 constraintEqualToAnchor:v23];
      [v24 setActive:1];

      double v25 = [(CFXEffectEditorView *)self editEffectPreview];
      double v26 = [v25 topAnchor];
      double v27 = [(CFXEffectEditorView *)self topAnchor];
      double v28 = [v26 constraintEqualToAnchor:v27];
      [v28 setActive:1];

      id v29 = [(CFXEffectEditorView *)self editEffectPreview];
      uint64_t v30 = [v29 bottomAnchor];
      v31 = [(CFXEffectEditorView *)self bottomAnchor];
      v32 = [(id)v30 constraintEqualToAnchor:v31];
      [v32 setActive:1];

      v33 = [(CFXEffectEditorView *)self delegate];
      LOBYTE(v30) = objc_opt_respondsToSelector();

      if (v30)
      {
        v34 = [(CFXEffectEditorView *)self delegate];
        [v34 effectEditorViewWillBeginPreviewingEditEffect:self];
      }
      v35 = [(CFXEffectEditorView *)self effectRenderingQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __52__CFXEffectEditorView_CFX_beginPreviewingEditEffect__block_invoke;
      block[3] = &unk_264C09FA8;
      block[4] = self;
      dispatch_async(v35, block);
    }
  }
}

uint64_t __52__CFXEffectEditorView_CFX_beginPreviewingEditEffect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_previewEditEffectIfNeeded");
}

- (BOOL)CFX_isPreviewingEditEffect
{
  v2 = [(CFXEffectEditorView *)self editEffectPreview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)CFX_previewEditEffectIfNeeded
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "effect editor preview render dropped", v2, v3, v4, v5, v6);
}

void __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 409) = 0;
  uint64_t v5 = [WeakRetained editEffectPreview];

  if (v5)
  {
    if (v3)
    {
      uint8_t v6 = [v3 objectEnumerator];
      double v7 = [v6 nextObject];

      if (v7) {
        id v8 = [[JTImage alloc] initWithPVImage:v7];
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
    kdebug_trace();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke_2;
    block[3] = &unk_264C0A888;
    uint64_t v11 = v8;
    id v12 = WeakRetained;
    uint64_t v13 = *(void *)(a1 + 32);
    id v9 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke_2(uint64_t a1)
{
  kdebug_trace();
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) editEffectPreview];
    [v3 setJtImage:v2];
  }
  uint64_t v4 = CFXLog_DebugEffectEditorRenderer();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke_2_cold_2();
  }

  if (*(unsigned char *)(*(void *)(a1 + 48) + 410))
  {
    uint64_t v5 = CFXLog_DebugEffectEditorRenderer();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke_2_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 40), "CFX_previewEditEffectIfNeeded");
  }
}

- (void)CFX_endPreviewingEditEffect
{
  if ([(CFXEffectEditorView *)self CFX_isPreviewingEditEffect])
  {
    id v3 = [(CFXEffectEditorView *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      uint64_t v5 = [(CFXEffectEditorView *)self delegate];
      [v5 effectEditorViewDidEndPreviewingEditingEffect:self];
    }
    self->_isRenderingEditEffect = 0;
    uint8_t v6 = [(CFXEffectEditorView *)self editEffectPreview];
    [v6 removeFromSuperview];

    [(CFXEffectEditorView *)self setEditEffectPreview:0];
  }
}

- (BOOL)CFX_useFaceReticle
{
  id v3 = [(CFXEffectEditorView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(CFXEffectEditorView *)self delegate];
  char v6 = [v5 effectEditorViewShouldShowFaceReticle:self];

  return v6;
}

- (id)CFX_springForTextEditAnimation
{
  uint64_t v2 = [MEMORY[0x263F15890] animation];
  [v2 setDamping:40.0];
  [v2 setStiffness:400.0];
  [v2 setMass:1.0];
  [v2 setStiffness:400.0];
  [v2 setDamping:40.0];
  [v2 setInitialVelocity:0.0];
  [v2 settlingDuration];
  objc_msgSend(v2, "setDuration:");
  return v2;
}

- (void)CFX_startApplyingEffectAnimationViewDisplayLink
{
  id v3 = [(CFXEffectEditorView *)self effectAnimationDisplayLink];
  [v3 invalidate];

  char v4 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_CFX_effectAnimationDisplayLinkFired_];
  [(CFXEffectEditorView *)self setEffectAnimationDisplayLink:v4];

  uint64_t v5 = [(CFXEffectEditorView *)self effectAnimationDisplayLink];
  [v5 setPreferredFramesPerSecond:60];

  id v7 = [(CFXEffectEditorView *)self effectAnimationDisplayLink];
  char v6 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v7 addToRunLoop:v6 forMode:*MEMORY[0x263EFF588]];
}

- (void)CFX_stopApplyingEffectAnimationViewDisplayLink
{
  id v3 = [(CFXEffectEditorView *)self effectAnimationDisplayLink];

  if (v3)
  {
    char v4 = [(CFXEffectEditorView *)self effectAnimationDisplayLink];
    [v4 invalidate];

    [(CFXEffectEditorView *)self setEffectAnimationDisplayLink:0];
  }
}

- (void)CFX_effectAnimationDisplayLinkFired:(id)a3
{
  id v4 = a3;
  if (self->_isRenderingEditEffect)
  {
    kdebug_trace();
    uint64_t v5 = CFXLog_DebugEffectEditorRenderer();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CFXEffectEditorView CFX_effectAnimationDisplayLinkFired:]();
    }
  }
  else if (self->_displayLinkBusyOnRenderQueue)
  {
    char v6 = CFXLog_DebugEffectEditorRenderer();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CFXEffectEditorView CFX_effectAnimationDisplayLinkFired:]();
    }

    kdebug_trace();
  }
  else
  {
    kdebug_trace();
    [(CFXEffectEditorView *)self CFX_applyEffectAnimationView:[(CFXEffectEditorView *)self isEndingEditing]];
  }
}

- (void)CFX_applyEffectAnimationView:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CFXEffectEditorView *)self effectAnimationView];
  id v6 = [v5 currentEffectTransforms];

  if (v3)
  {
    id v7 = [(CFXEffectEditorView *)self delegate];
    id v8 = [(CFXEffectEditorView *)self editEffect];
    int v9 = [v7 effectEditorView:self isFaceTrackingEffect:v8];

    if (v9)
    {
      if ([(CFXEffectEditorView *)self delegateSupportsCalculatingAnimatedFaceTrackingTransform])
      {
        double v10 = [(CFXEffectEditorView *)self delegate];
        double v26 = [(CFXEffectEditorView *)self effectAnimationView];
        uint64_t v11 = [v26 fromEffectFrame];
        uint64_t v12 = [v11 trackingType];
        uint64_t v13 = [v6 faceTrackingTransform];
        double v14 = [(CFXEffectEditorView *)self effectAnimationView];
        double v15 = [v14 toEffectFrame];
        uint64_t v16 = [v15 trackingType];
        double v17 = [(CFXEffectEditorView *)self effectAnimationView];
        [v17 fractionComplete];
        *(float *)&double v18 = v18;
        double v19 = [v10 effectEditorView:self calculateAnimatedFaceTrackingTransformWithCurrentFaceTrackingDataFromTrackingType:v12 interpolatedWithFaceTrackingTransform:v13 toTrackingType:v16 atAnimationProgress:v18];

        double v20 = [(CFXEffectEditorView *)self editEffectPreview];
        double v21 = v20;
        if (!v19)
        {
          [v20 setHidden:1];

          goto LABEL_7;
        }
        [v20 setHidden:0];

        double v22 = [v6 transform];
        double v23 = [v6 transformAnimation];
        uint64_t v24 = +[JFXOverlayEffectTransforms transformsWithTransform:v22 transformAnimation:v23 faceTrackingTransform:v19];

        id v6 = (id)v24;
      }
    }
  }
  double v25 = [(CFXEffectEditorView *)self effectRenderingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CFXEffectEditorView_CFX_applyEffectAnimationView___block_invoke;
  block[3] = &unk_264C09F10;
  void block[4] = self;
  id v6 = v6;
  id v28 = v6;
  dispatch_async(v25, block);

LABEL_7:
}

uint64_t __52__CFXEffectEditorView_CFX_applyEffectAnimationView___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 408) = 1;
  kdebug_trace();
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [v3 editEffect];
  [v2 effectEditorView:v3 applyAnimationTransformsToEffect:v4 transforms:*(void *)(a1 + 40)];

  kdebug_trace();
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "CFX_previewEditEffectIfNeeded");
  *(unsigned char *)(*(void *)(a1 + 32) + 408) = 0;
  return result;
}

- (void)CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [(CFXEffectEditorView *)self effectAnimationView];

  if (!v5)
  {
    id v6 = [(CFXEffectEditorView *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      goto LABEL_13;
    }
    id v8 = [(CFXEffectEditorView *)self delegate];
    int v9 = [(CFXEffectEditorView *)self editEffect];
    [v8 effectEditorView:self durationForBeginEditingAnimationForEffect:v9];
    double v11 = v10;

    if (v11 <= 0.0) {
      goto LABEL_13;
    }
    uint64_t v12 = [(CFXEffectEditorView *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    double v14 = [(CFXEffectEditorView *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    uint64_t v16 = [(CFXEffectEditorView *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    double v18 = [(CFXEffectEditorView *)self delegate];
    char v19 = objc_opt_respondsToSelector();

    double v20 = [(CFXEffectEditorView *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      goto LABEL_13;
    }
    if (v19 & 1) != 0 && (v15 & 1) != 0 && (v17 & 1) != 0 && (v21)
    {
      double v22 = [(CFXEffectEditorView *)self delegate];
      double v23 = [(CFXEffectEditorView *)self editEffect];
      [v22 effectEditorView:self willBeginAnimationBeforeEditingEffect:v23];

      uint64_t v24 = [(CFXEffectEditorView *)self editEffect];
      double v25 = [v24 jtEffect];
      double v26 = [v25 renderEffect];
      [v26 outputSize];
      double v28 = v27;
      double v30 = v29;

      v31 = [(CFXEffectEditorView *)self delegate];
      v32 = [(CFXEffectEditorView *)self editEffect];
      v33 = objc_msgSend(v31, "effectEditorView:beginEditingAnimationFromFrameForEffect:relativeToBounds:", self, v32, 0.0, 0.0, v28, v30);

      v34 = [(CFXEffectEditorView *)self delegate];
      v35 = [(CFXEffectEditorView *)self editEffect];
      v36 = objc_msgSend(v34, "effectEditorView:beginEditingAnimationToFrameForEffect:relativeToBounds:", self, v35, 0.0, 0.0, v28, v30);

      v37 = [(CFXEffectEditorView *)self editEffect];
      v38 = [v37 jtEffect];

      v39 = [(CFXEffectEditorView *)self delegate];
      v40 = [(CFXEffectEditorView *)self editEffect];
      int v41 = [v39 effectEditorView:self isFaceTrackingEffect:v40];

      v42 = [(CFXEffectEditorView *)self delegate];
      v43 = [(CFXEffectEditorView *)self editEffect];
      char v44 = [v42 effectEditorView:self isFaceTrackingDataAvailableForEffect:v43];

      if (v41 && (v44 & 1) == 0)
      {
        id v45 = v36;

        v33 = v45;
      }
      v46 = [[JFXOverlayEffectAnimationView alloc] initWithEffectFrame:v33 toEffectFrame:v36];
      [(CFXEffectEditorView *)self setEffectAnimationView:v46];

      v47 = [(CFXEffectEditorView *)self effectAnimationView];
      [(CFXEffectEditorView *)self addSubview:v47];

      [v38 setHidden:0];
      [v38 beginEditingFaceTrackingTransforms];
      [(CFXEffectEditorView *)self CFX_applyEffectAnimationView:1];
      v48 = [(CFXEffectEditorView *)self delegate];
      v49 = [(CFXEffectEditorView *)self editEffect];
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __84__CFXEffectEditorView_CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock___block_invoke;
      v51[3] = &unk_264C0A418;
      v51[4] = self;
      id v52 = v38;
      v53 = v4;
      id v50 = v38;
      [v48 effectEditorView:self didStartBeginEditingAnimationForEffect:v49 completion:v51];
    }
    else
    {
LABEL_13:
      v4[2](v4);
    }
  }
}

void __84__CFXEffectEditorView_CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "CFX_startApplyingEffectAnimationViewDisplayLink");
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "CFX_springForTextEditAnimation");
  BOOL v3 = [*(id *)(a1 + 32) effectAnimationView];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__CFXEffectEditorView_CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock___block_invoke_2;
  v5[3] = &unk_264C0B2F0;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 animate:v2 completion:v5];
}

uint64_t __84__CFXEffectEditorView_CFX_performTextEditOnlyModeEnterAnimationWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "CFX_stopApplyingEffectAnimationViewDisplayLink");
  objc_msgSend(*(id *)(a1 + 32), "CFX_applyEffectAnimationView:", objc_msgSend(*(id *)(a1 + 32), "isEndingEditing"));
  objc_msgSend(*(id *)(a1 + 32), "CFX_showEditControls");
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [v3 editEffect];
  [v2 effectEditorView:v3 didCompleteBeginEditingAnimationForEffect:v4];

  uint64_t v5 = [*(id *)(a1 + 32) effectAnimationView];
  [v5 removeFromSuperview];

  [*(id *)(a1 + 32) setEffectAnimationView:0];
  [*(id *)(a1 + 40) endEditingFaceTrackingTransforms];
  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v6();
}

- (void)CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [(CFXEffectEditorView *)self effectAnimationView];

  if (!v5)
  {
    id v6 = [(CFXEffectEditorView *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      goto LABEL_10;
    }
    id v8 = [(CFXEffectEditorView *)self delegate];
    int v9 = [(CFXEffectEditorView *)self editEffect];
    [v8 effectEditorView:self durationForEndEditingAnimationForEffect:v9];
    double v11 = v10;

    if (v11 <= 0.0) {
      goto LABEL_10;
    }
    uint64_t v12 = [(CFXEffectEditorView *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    double v14 = [(CFXEffectEditorView *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    uint64_t v16 = [(CFXEffectEditorView *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      goto LABEL_10;
    }
    if (v15 & 1) != 0 && (v17)
    {
      [(CFXEffectEditorView *)self CFX_endTextEditing:0];
      double v18 = [(CFXEffectEditorView *)self delegate];
      char v19 = [(CFXEffectEditorView *)self editEffect];
      [v18 effectEditorView:self willBeginAnimationAfterEditingEffect:v19];

      double v20 = [(CFXEffectEditorView *)self editEffect];
      char v21 = [v20 jtEffect];
      double v22 = [v21 renderEffect];
      [v22 outputSize];
      double v24 = v23;
      double v26 = v25;

      double v27 = [(CFXEffectEditorView *)self delegate];
      double v28 = [(CFXEffectEditorView *)self editEffect];
      double v29 = objc_msgSend(v27, "effectEditorView:endEditingAnimationFromFrameForEffect:relativeToBounds:", self, v28, 0.0, 0.0, v24, v26);

      double v30 = [(CFXEffectEditorView *)self delegate];
      v31 = [(CFXEffectEditorView *)self editEffect];
      v32 = objc_msgSend(v30, "effectEditorView:endEditingAnimationToFrameForEffect:relativeToBounds:", self, v31, 0.0, 0.0, v24, v26);

      v33 = [[JFXOverlayEffectAnimationView alloc] initWithEffectFrame:v29 toEffectFrame:v32];
      [(CFXEffectEditorView *)self setEffectAnimationView:v33];

      v34 = [(CFXEffectEditorView *)self effectAnimationView];
      [(CFXEffectEditorView *)self addSubview:v34];

      v35 = [(CFXEffectEditorView *)self editEffect];
      v36 = [v35 jtEffect];

      [v36 beginEditingFaceTrackingTransforms];
      [(CFXEffectEditorView *)self CFX_applyEffectAnimationView:[(CFXEffectEditorView *)self isEndingEditing]];
      [(CFXEffectEditorView *)self CFX_startApplyingEffectAnimationViewDisplayLink];
      v37 = [(CFXEffectEditorView *)self CFX_springForTextEditAnimation];
      v38 = [(CFXEffectEditorView *)self effectAnimationView];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __83__CFXEffectEditorView_CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock___block_invoke;
      v44[3] = &unk_264C0B2F0;
      v44[4] = self;
      id v39 = v36;
      id v45 = v39;
      v46 = v4;
      [v38 animate:v37 completion:v44];

      v40 = [(CFXEffectEditorView *)self delegate];
      char v41 = objc_opt_respondsToSelector();

      if (v41)
      {
        v42 = [(CFXEffectEditorView *)self delegate];
        v43 = [(CFXEffectEditorView *)self editEffect];
        [v42 effectEditorView:self didStartEndEditingAnimationForEffect:v43];
      }
      [(CFXEffectEditorView *)self CFX_forceHideEditControls];
    }
    else
    {
LABEL_10:
      v4[2](v4);
    }
  }
}

void __83__CFXEffectEditorView_CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock___block_invoke(uint64_t a1)
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__CFXEffectEditorView_CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock___block_invoke_2;
  v11[3] = &unk_264C0A418;
  uint64_t v2 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v2;
  id v13 = *(id *)(a1 + 48);
  BOOL v3 = (void (**)(void))MEMORY[0x237DD15A0](v11);
  objc_msgSend(*(id *)(a1 + 32), "CFX_stopApplyingEffectAnimationViewDisplayLink");
  objc_msgSend(*(id *)(a1 + 32), "CFX_applyEffectAnimationView:", objc_msgSend(*(id *)(a1 + 32), "isEndingEditing"));
  id v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    char v7 = *(void **)(a1 + 32);
    id v8 = [v7 editEffect];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __83__CFXEffectEditorView_CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock___block_invoke_3;
    v9[3] = &unk_264C0A3F0;
    double v10 = v3;
    [v6 effectEditorView:v7 didCompleteEndEditingAnimationForEffect:v8 completion:v9];
  }
  else
  {
    v3[2](v3);
  }
}

uint64_t __83__CFXEffectEditorView_CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) effectAnimationView];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) setEffectAnimationView:0];
  [*(id *)(a1 + 40) endEditingFaceTrackingTransforms];
  BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

uint64_t __83__CFXEffectEditorView_CFX_performTextEditOnlyModeExitAnimationWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (JFXOverlayEffectDebugView)debugOverlayView
{
  if (JFX_isDrawOverlayBoundsEnabled() && !self->_debugOverlayView)
  {
    BOOL v3 = [JFXOverlayEffectDebugView alloc];
    id v4 = -[JFXOverlayEffectDebugView initWithFrame:delegate:](v3, "initWithFrame:delegate:", self, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    debugOverlayView = self->_debugOverlayView;
    self->_debugOverlayView = v4;

    [(CFXEffectEditorView *)self addSubview:self->_debugOverlayView];
  }
  id v6 = self->_debugOverlayView;
  return v6;
}

- (void)startUpdatingDebugOverlayView
{
  if (JFX_isDrawOverlayBoundsEnabled())
  {
    BOOL v3 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_onDebugDisplayLink_];
    [(CFXEffectEditorView *)self setDebugDisplayLink:v3];

    id v5 = [(CFXEffectEditorView *)self debugDisplayLink];
    id v4 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v5 addToRunLoop:v4 forMode:*MEMORY[0x263EFF588]];
  }
}

- (void)stopUpdatingDebugOverlayView
{
  if (JFX_isDrawOverlayBoundsEnabled())
  {
    BOOL v3 = [(CFXEffectEditorView *)self debugDisplayLink];
    [v3 invalidate];

    [(CFXEffectEditorView *)self setDebugDisplayLink:0];
  }
}

- (void)onDebugDisplayLink:(id)a3
{
  if (JFX_isDrawOverlayBoundsEnabled())
  {
    id v4 = [(CFXEffectEditorView *)self editEffect];

    if (v4)
    {
      [(CFXEffectEditorView *)self bounds];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      [(CFXEffectEditorView *)self renderBounds];
      double v17 = CGRectFillRectToAspectInRect(v6, v8, v10, v12, v13, v14, v15, v16);
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v24 = [(CFXEffectEditorView *)self delegate];
      double v25 = [(CFXEffectEditorView *)self editEffect];
      objc_msgSend(v24, "effectEditorView:overlayEffectFrameForEffect:relativeToBounds:", self, v25, v17, v19, v21, v23);
      id v33 = (id)objc_claimAutoreleasedReturnValue();

      double v26 = [(CFXEffectEditorView *)self debugOverlayView];
      [v26 updateWithEffectFrame:v33];

      double v27 = [(CFXEffectEditorView *)self debugOverlayView];
      [v27 frame];
      double v29 = v28;
      double v31 = v30;

      v32 = [(CFXEffectEditorView *)self debugOverlayView];
      objc_msgSend(v32, "setFrame:", v17, v19, v29, v31);
    }
  }
}

- (id)overlayEffectDebugViewOptions
{
  uint64_t v2 = JFX_getDrawOverlayBoundsOptionsDictionary();
  BOOL v3 = +[JFXOverlayEffectDebugViewOptions debugViewOptionsWithDictionary:v2];

  return v3;
}

- (CFXEffectEditorViewDelegate)delegate
{
  return self->_delegate;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (CFXEffect)editEffect
{
  return self->_editEffect;
}

- (void)setEditEffect:(id)a3
{
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (BOOL)isTextEditing
{
  return self->_isTextEditing;
}

- (void)setIsTextEditing:(BOOL)a3
{
  self->_isTextEditing = a3;
}

- (CGAffineTransform)editTransform
{
  long long v3 = *(_OWORD *)&self[13].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[13].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[13].ty;
  return self;
}

- (void)setEditTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_editTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_editTransform.c = v4;
  *(_OWORD *)&self->_editTransform.tx = v3;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (BOOL)effectWasEdited
{
  return self->_effectWasEdited;
}

- (void)setEffectWasEdited:(BOOL)a3
{
  self->_effectWasEdited = a3;
}

- (UIButton)removeButton
{
  return self->_removeButton;
}

- (void)setRemoveButton:(id)a3
{
}

- (void)setDebugOverlayView:(id)a3
{
}

- (CADisplayLink)debugDisplayLink
{
  return self->_debugDisplayLink;
}

- (void)setDebugDisplayLink:(id)a3
{
}

- (CFXTextEffectEditorView)textEditorView
{
  return self->_textEditorView;
}

- (void)setTextEditorView:(id)a3
{
}

- (void)setPreviewGenerator:(id)a3
{
}

- (JFXImageView)editEffectPreview
{
  return self->_editEffectPreview;
}

- (void)setEditEffectPreview:(id)a3
{
}

- (OS_dispatch_queue)effectRenderingQueue
{
  return self->_effectRenderingQueue;
}

- (NSString)oldEditText
{
  return self->_oldEditText;
}

- (void)setOldEditText:(id)a3
{
}

- (BOOL)truncateTextToMaximumLength
{
  return self->_truncateTextToMaximumLength;
}

- (void)setTruncateTextToMaximumLength:(BOOL)a3
{
  self->_truncateTextToMaximumLength = a3;
}

- (unint64_t)maximumTextLength
{
  return self->_maximumTextLength;
}

- (void)setMaximumTextLength:(unint64_t)a3
{
  self->_maximumTextLength = a3;
}

- (CADisplayLink)editControlsTrackingDisplayLink
{
  return self->_editControlsTrackingDisplayLink;
}

- (void)setEditControlsTrackingDisplayLink:(id)a3
{
}

- (CFXFaceReticleView)faceTrackingReticle
{
  return self->_faceTrackingReticle;
}

- (void)setFaceTrackingReticle:(id)a3
{
}

- (CGPoint)lastTouchLocationInView
{
  double x = self->_lastTouchLocationInView.x;
  double y = self->_lastTouchLocationInView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastTouchLocationInView:(CGPoint)a3
{
  self->_lastTouchLocationInView = a3;
}

- (CGPoint)lastSpacingBetweenTouchAndCenterOfEffect
{
  double x = self->_lastSpacingBetweenTouchAndCenterOfEffect.x;
  double y = self->_lastSpacingBetweenTouchAndCenterOfEffect.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastSpacingBetweenTouchAndCenterOfEffect:(CGPoint)a3
{
  self->_lastSpacingBetweenTouchAndCenterOfEffect = a3;
}

- (JFXOverlayEffectAnimationView)effectAnimationView
{
  return self->_effectAnimationView;
}

- (void)setEffectAnimationView:(id)a3
{
}

- (CADisplayLink)effectAnimationDisplayLink
{
  return self->_effectAnimationDisplayLink;
}

- (void)setEffectAnimationDisplayLink:(id)a3
{
}

- (unint64_t)appliedEditingGestures
{
  return self->_appliedEditingGestures;
}

- (double)lastFaceRectacleUpdateTime
{
  return self->_lastFaceRectacleUpdateTime;
}

- (void)setLastFaceRectacleUpdateTime:(double)a3
{
  self->_lastFaceRectacleUpdateTime = a3;
}

- (double)lastEffectMovedNotifyTime
{
  return self->_lastEffectMovedNotifyTime;
}

- (void)setLastEffectMovedNotifyTime:(double)a3
{
  self->_lastEffectMovedNotifyTime = a3;
}

- (BOOL)isEndingEditing
{
  return self->_isEndingEditing;
}

- (void)setIsEndingEditing:(BOOL)a3
{
  self->_isEndingEditing = a3;
}

- (BOOL)isBeginningEditing
{
  return self->_isBeginningEditing;
}

- (void)setIsBeginningEditing:(BOOL)a3
{
  self->_isBeginningEditing = a3;
}

- (NSMutableArray)beginEditingCompletionBlocks
{
  return self->_beginEditingCompletionBlocks;
}

- (void)setBeginEditingCompletionBlocks:(id)a3
{
}

- (NSMutableArray)endEditingCompletionBlocks
{
  return self->_endEditingCompletionBlocks;
}

- (void)setEndEditingCompletionBlocks:(id)a3
{
}

- (BOOL)delegateSupportsCalculatingAnimatedFaceTrackingTransform
{
  return self->_delegateSupportsCalculatingAnimatedFaceTrackingTransform;
}

- (BOOL)delegateSupportsDidMoveEffect
{
  return self->_delegateSupportsDidMoveEffect;
}

- (BOOL)delegateSupportsApplyAnimationTransformsToEffect
{
  return self->_delegateSupportsApplyAnimationTransformsToEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEditingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_beginEditingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_effectAnimationDisplayLink, 0);
  objc_storeStrong((id *)&self->_effectAnimationView, 0);
  objc_storeStrong((id *)&self->_faceTrackingReticle, 0);
  objc_storeStrong((id *)&self->_editControlsTrackingDisplayLink, 0);
  objc_storeStrong((id *)&self->_oldEditText, 0);
  objc_storeStrong((id *)&self->_effectRenderingQueue, 0);
  objc_storeStrong((id *)&self->_editEffectPreview, 0);
  objc_storeStrong((id *)&self->_previewGenerator, 0);
  objc_storeStrong((id *)&self->_textEditorView, 0);
  objc_storeStrong((id *)&self->_debugDisplayLink, 0);
  objc_storeStrong((id *)&self->_debugOverlayView, 0);
  objc_storeStrong((id *)&self->_removeButton, 0);
  objc_storeStrong((id *)&self->_editEffect, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "effect editor preview render pending", v2, v3, v4, v5, v6);
}

void __52__CFXEffectEditorView_CFX_previewEditEffectIfNeeded__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "effect editor preview rendered", v2, v3, v4, v5, v6);
}

- (void)CFX_effectAnimationDisplayLinkFired:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "effect editor animation render dropped", v2, v3, v4, v5, v6);
}

@end