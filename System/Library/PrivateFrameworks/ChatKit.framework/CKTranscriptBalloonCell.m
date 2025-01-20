@interface CKTranscriptBalloonCell
- (BOOL)_isCommSafetyRestrictedForChatItem:(id)a3;
- (BOOL)allowsSwipeToReply;
- (BOOL)animatingInDarkEffect;
- (BOOL)canInlineReply;
- (BOOL)canShowQuickActionButton;
- (BOOL)hasQueuedQuickActionButtonRemoval;
- (BOOL)isAudioMessage;
- (BOOL)isInsertingReply;
- (BOOL)isPointInAllowedSwipingArea:(CGPoint)a3;
- (BOOL)isRichLink;
- (BOOL)lineIsExtended;
- (BOOL)mayReparentPluginViews;
- (CGRect)_createLineViewFrameForThreadGroupLayoutAttributes:(id)a3;
- (CGRect)_swipeToReplySafeSwipeRect;
- (CKBalloonSwipeController)balloonSwipeController;
- (CKBalloonView)balloonView;
- (CKLineView)lineView;
- (CKQuickActionButton)quickActionButton;
- (CKTranscriptBalloonCell)init;
- (CKTranscriptBalloonCellDelegate)balloonCellDelegate;
- (CKTranscriptBalloonCellTextEffectsDelegate)textEffectsDelegate;
- (CKTranscriptCollectionViewLayoutAttributes)layoutAttributes;
- (NSArray)syndicationIdentifiers;
- (NSArray)threadGroupLayoutAttributes;
- (NSArray)threadLineDescription;
- (NSString)description;
- (double)insertionDurationForInsertionType:(int64_t)a3;
- (double)lineHorizontalOffset;
- (double)lineViewExpansionFactor;
- (double)lineViewReferenceY;
- (double)swipeToReplyLayoutOffset;
- (id)_createLinePathForFrame:(CGRect)a3 withThreadGroupLayoutAttributes:(id)a4;
- (id)_drawLowerBracketLoopForPath:(id)a3 withLayout:(id)a4 lineViewMaxY:(double)a5;
- (id)_extendPath:(id *)a3 withFrame:(CGRect)a4;
- (id)_lineDescriptionForThreadGroupLayoutAttributes:(id)a3 setLineType:(BOOL)a4;
- (id)animationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5 beginTime:(double)a6 duration:(double)a7 timingFunction:(id)a8;
- (id)animationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5 beginTime:(double)a6 duration:(double)a7 timingFunctionName:(id)a8;
- (id)customTextRenderingDisplayLinkForTextBalloonViewTextView:(id)a3;
- (id)messageDisplayViewLayoutAttributesForMessageDisplayViewFrame:(CGRect)a3 inContainerFrame:(CGRect)a4;
- (id)quickActionButtonTappedCallback;
- (int64_t)insertionAnimationType;
- (unint64_t)lineType;
- (unint64_t)numberOfMomentSharePhotos;
- (unint64_t)numberOfMomentShareSavedAssets;
- (unint64_t)numberOfMomentShareVideos;
- (unint64_t)textBalloonViewAllowedLayoutActionForTextBalloonView:(id)a3;
- (void)_addQuickActionButtonIfNeededAnimated:(BOOL)a3;
- (void)_animateLineExtension:(id)a3;
- (void)_animateLowerBracketToLoop:(id)a3;
- (void)_animateReplyContextPreview:(id)a3;
- (void)_animateUpperBracket:(id)a3;
- (void)_ck_setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)_drawLoopForPath:(id *)a3 withLayout:(id)a4;
- (void)_drawLowerBracketForPath:(id *)a3 lineViewMaxX:(double)a4 lineViewMaxY:(double)a5;
- (void)_drawStraightLineForPath:(id *)a3 withLayout:(id)a4 lineViewMaxY:(double)a5 isTerminal:(BOOL)a6 prevLineSegmentType:(unint64_t)a7;
- (void)_drawUpperBracketForPath:(id *)a3 withLayout:(id)a4 lineViewMaxX:(double)a5 lineViewMaxY:(double)a6;
- (void)_fadeInBalloonAlpha:(double)a3 atBeginTime:(double)a4;
- (void)_fadeInContactImageAlpha:(double)a3 atBeginTime:(double)a4;
- (void)_removeQuickActionButtonIfNeededAnimated:(BOOL)a3;
- (void)_slideContactImageWithTranslate:(double)a3 duration:(double)a4 beginTime:(double)a5;
- (void)_updateLineForThreadGroupLayoutAttributes:(id)a3;
- (void)addFilter:(id)a3;
- (void)addFilter:(id)a3 fromTriggeringMessage:(BOOL)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)clearFilters;
- (void)configureAppEntityForMessage:(id)a3;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)configureQuickActionButtonForChatItem:(id)a3;
- (void)dealloc;
- (void)layoutSubviewsForAlignmentContents;
- (void)layoutSubviewsForContents;
- (void)performInsertion:(id)a3;
- (void)prepareForReuse;
- (void)quickActionButtonAnimationDidEnd:(id)a3;
- (void)quickActionButtonWasTapped:(id)a3;
- (void)setAnimatingInDarkEffect:(BOOL)a3;
- (void)setAnimationPauseReasons:(int64_t)a3;
- (void)setBalloonCellDelegate:(id)a3;
- (void)setBalloonSwipeController:(id)a3;
- (void)setBalloonView:(id)a3;
- (void)setCanInlineReply:(BOOL)a3;
- (void)setCanShowQuickActionButton:(BOOL)a3;
- (void)setHasQueuedQuickActionButtonRemoval:(BOOL)a3;
- (void)setInsertingReply:(BOOL)a3;
- (void)setIsRichLink:(BOOL)a3;
- (void)setLayoutAttributes:(id)a3;
- (void)setLineHorizontalOffset:(double)a3;
- (void)setLineType:(unint64_t)a3;
- (void)setLineView:(id)a3;
- (void)setLineViewExpansionFactor:(double)a3;
- (void)setLineViewReferenceY:(double)a3;
- (void)setMayReparentPluginViews:(BOOL)a3;
- (void)setNumberOfMomentSharePhotos:(unint64_t)a3;
- (void)setNumberOfMomentShareSavedAssets:(unint64_t)a3;
- (void)setNumberOfMomentShareVideos:(unint64_t)a3;
- (void)setQuickActionButtonTappedCallback:(id)a3;
- (void)setSyndicationIdentifiers:(id)a3;
- (void)setTextEffectsDelegate:(id)a3;
- (void)setThreadGroupLayoutAttributes:(id)a3;
- (void)setThreadLineDescription:(id)a3;
- (void)swipeToReplyGestureHandler:(id)a3;
- (void)textBalloonViewDidLayoutSubviews:(id)a3;
- (void)textBalloonViewTextView:(id)a3 didChangeTextEffectPlaybackCandidateStatus:(BOOL)a4;
- (void)textBalloonViewTextViewDidChangeRenderBounds:(id)a3;
- (void)textBalloonViewWillLayoutSubviews:(id)a3;
- (void)updateQuickActionButtonVisibility;
- (void)willLayoutDrawerLabelFrame:(CGRect *)a3;
@end

@implementation CKTranscriptBalloonCell

- (CKTranscriptBalloonCell)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptBalloonCell;
  v2 = [(CKTranscriptBalloonCell *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CKTranscriptBalloonCell *)v2 setMayReparentPluginViews:1];
  }
  return v3;
}

- (void)dealloc
{
  [(CKBalloonView *)self->_balloonView removeFromSuperview];
  CKBalloonViewReuse(self->_balloonView);
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptBalloonCell;
  [(CKPhoneTranscriptMessageCell *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptBalloonCell;
  v4 = [(CKTranscriptMessageCell *)&v8 description];
  objc_super v5 = [(CKTranscriptBalloonCell *)self balloonView];
  v6 = [v3 stringWithFormat:@"%@ balloonView:%@", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isAudioMessage
{
  v2 = [(CKTranscriptBalloonCell *)self balloonView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_ck_setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptBalloonCell;
  [(CKEditableCollectionViewCell *)&v7 _ck_setEditing:a3 animated:a4];
  v6 = [(CKTranscriptBalloonCell *)self balloonView];
  [v6 setUserInteractionEnabled:!v4];
}

- (void)applyLayoutAttributes:(id)a3
{
  BOOL v4 = (id *)a3;
  if (![(CKTranscriptCollectionViewLayoutAttributes *)self->_layoutAttributes isEqual:v4])
  {
    v7.receiver = self;
    v7.super_class = (Class)CKTranscriptBalloonCell;
    [(CKTranscriptBalloonCell *)&v7 applyLayoutAttributes:v4];
    [(CKTranscriptBalloonCell *)self setLayoutAttributes:v4];
    if (v4)
    {
      objc_super v5 = (void *)[v4[81] mutableCopy];
      [v5 addObject:v4];
      [(CKTranscriptBalloonCell *)self setThreadGroupLayoutAttributes:v5];
    }
    if ([v4 isInsertingReply]) {
      [(CKTranscriptBalloonCell *)self setInsertingReply:1];
    }
    if ([(CKTranscriptCell *)self suppressesAnimationsForLineUpdates])
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __49__CKTranscriptBalloonCell_applyLayoutAttributes___block_invoke;
      v6[3] = &unk_1E5620C40;
      v6[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v6];
    }
    else
    {
      [(CKTranscriptBalloonCell *)self _updateLineForThreadGroupLayoutAttributes:self->_threadGroupLayoutAttributes];
    }
  }
}

uint64_t __49__CKTranscriptBalloonCell_applyLayoutAttributes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLineForThreadGroupLayoutAttributes:*(void *)(*(void *)(a1 + 32) + 1024)];
}

- (id)messageDisplayViewLayoutAttributesForMessageDisplayViewFrame:(CGRect)a3 inContainerFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)CKTranscriptBalloonCell;
  v13 = -[CKTranscriptMessageContentCell messageDisplayViewLayoutAttributesForMessageDisplayViewFrame:inContainerFrame:](&v22, sel_messageDisplayViewLayoutAttributesForMessageDisplayViewFrame_inContainerFrame_);
  v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v15 = [v14 isExpressiveTextEnabled];

  if (v15 && (id v16 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate), v16, v16))
  {
    v17 = [(CKTranscriptBalloonCell *)self balloonView];
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v18 = v17;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
      objc_msgSend(WeakRetained, "transcriptBalloonCell:layoutAttributesForTextBalloonView:messageDisplayViewFrame:inContainerFrame:proposedAttributes:", self, v18, v13, v11, v10, v9, v8, x, y, width, height);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v20 = v13;
    }
  }
  else
  {
    id v20 = v13;
  }

  return v20;
}

- (void)layoutSubviewsForContents
{
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double v4 = v3;
  [(CKEditableCollectionViewCell *)self contentAlignmentInsets];
  [(CKEditableCollectionViewCell *)self contentAlignmentInsets];
  double v6 = v5;
  [(CKTranscriptMessageCell *)self safeAreaInsets];
  double v8 = v7;
  [(CKEditableCollectionViewCell *)self contentAlignmentInsets];
  [(CKEditableCollectionViewCell *)self contentAlignmentInsets];
  [(CKTranscriptMessageCell *)self safeAreaInsets];
  double v9 = +[CKUIBehavior sharedBehaviors];
  if ([v9 forceMinTranscriptMarginInsets])
  {
    double v10 = +[CKUIBehavior sharedBehaviors];
    [v10 minTranscriptMarginInsets];
    double v12 = v11;
  }
  else
  {
    [(CKEditableCollectionViewCell *)self marginInsets];
    double v12 = v13;
  }

  double v14 = v4 - (v6 - v8);
  int v15 = +[CKUIBehavior sharedBehaviors];
  [v15 contactPhotoTranscriptInsets];
  double v17 = v12 + v16;

  self->_lineHorizontalOffset = v14 + v17;
  id v18 = +[CKUIBehavior sharedBehaviors];
  [v18 transcriptContactImageDiameter];
  double v20 = v19;
  v21 = +[CKUIBehavior sharedBehaviors];
  [v21 contactPhotoBalloonMargin];
  double v23 = v20 + v22;

  [(CKTranscriptCell *)self drawerPercentRevealed];
  double v25 = v24;
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  self->_lineHorizontalOffset = self->_lineHorizontalOffset - v25 * (v23 + v26);
  v27.receiver = self;
  v27.super_class = (Class)CKTranscriptBalloonCell;
  [(CKPhoneTranscriptMessageCell *)&v27 layoutSubviewsForContents];
  [(CKTranscriptBalloonCell *)self _updateLineForThreadGroupLayoutAttributes:self->_threadGroupLayoutAttributes];
}

- (void)layoutSubviewsForAlignmentContents
{
  v24.receiver = self;
  v24.super_class = (Class)CKTranscriptBalloonCell;
  [(CKTranscriptMessageContentCell *)&v24 layoutSubviewsForAlignmentContents];
  if (self->_quickActionButton)
  {
    double v3 = +[CKUIBehavior sharedBehaviors];
    [v3 transcriptQuickActionButtonDiameter];
    double v5 = v4;

    double v6 = [(CKEditableCollectionViewCell *)self contentView];
    [v6 bounds];
    double v9 = v8 + floor((v7 - v5) * 0.5);

    double v10 = [(CKTranscriptBalloonCell *)self balloonView];
    [v10 frame];
    double v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    if ([(CKEditableCollectionViewCell *)self orientation])
    {
      double v19 = 0.0;
      if ([(CKEditableCollectionViewCell *)self orientation] != 2)
      {
LABEL_7:
        -[CKQuickActionButton setFrame:](self->_quickActionButton, "setFrame:", v19, v9, v5, v5);
        return;
      }
      double v20 = +[CKUIBehavior sharedBehaviors];
      [v20 transcriptQuickActionButtonHorizontalSpacing];
      double v19 = v12 - v5 - v21;
    }
    else
    {
      v25.origin.double x = v12;
      v25.origin.double y = v14;
      v25.size.double width = v16;
      v25.size.double height = v18;
      double MaxX = CGRectGetMaxX(v25);
      double v20 = +[CKUIBehavior sharedBehaviors];
      [v20 transcriptQuickActionButtonHorizontalSpacing];
      double v19 = MaxX + v23;
    }

    goto LABEL_7;
  }
}

- (void)performInsertion:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CKTranscriptCell *)self insertionType];
  if ([(CKTranscriptMessageCell *)self isReplyContextPreview] && v5)
  {
    [(CKTranscriptBalloonCell *)self _animateReplyContextPreview:v4];
  }
  else
  {
    switch(v5)
    {
      case 3:
        [(CKTranscriptBalloonCell *)self _animateLowerBracketToLoop:v4];
        break;
      case 2:
        [(CKTranscriptBalloonCell *)self _animateLineExtension:v4];
        break;
      case 1:
        [(CKTranscriptBalloonCell *)self _animateUpperBracket:v4];
        break;
      default:
        [(CKTranscriptBalloonCell *)self setInsertingReply:0];
        v6.receiver = self;
        v6.super_class = (Class)CKTranscriptBalloonCell;
        [(CKEditableCollectionViewCell *)&v6 performInsertion:v4];
        break;
    }
  }
}

- (int64_t)insertionAnimationType
{
  unint64_t lineType = self->_lineType;
  if (lineType == 1 || self->_lineIsExtended) {
    return 2;
  }
  int64_t v4 = 3;
  if (lineType != 5) {
    int64_t v4 = 0;
  }
  if (lineType == 2) {
    return 1;
  }
  else {
    return v4;
  }
}

- (double)insertionDurationForInsertionType:(int64_t)a3
{
  BOOL v5 = [(CKTranscriptMessageCell *)self isReplyContextPreview];
  double result = 0.3;
  if (!v5 && a3 != 1)
  {
    if (a3 == 3)
    {
      return 1.1;
    }
    else if (a3 == 2)
    {
      -[CKTranscriptBalloonCell _createLineViewFrameForThreadGroupLayoutAttributes:](self, "_createLineViewFrameForThreadGroupLayoutAttributes:", self->_threadGroupLayoutAttributes, 0.3);
      return fmax(fmin(v7 * 0.0026 + 0.06868, 0.3), 0.1);
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (void)addFilter:(id)a3
{
}

- (void)addFilter:(id)a3 fromTriggeringMessage:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  objc_super v6 = [(CKTranscriptBalloonCell *)self balloonView];
  [v6 prepareForDisplayIfNeeded];

  uint64_t v7 = [(CKTranscriptBalloonCell *)self balloonView];
  if (v7)
  {
    double v8 = (void *)v7;
    BOOL v9 = [(CKTranscriptBalloonCell *)self animatingInDarkEffect];

    if (v9 || v4)
    {
      double v10 = [(CKTranscriptBalloonCell *)self balloonView];
      [v10 addFilter:v15];
    }
  }
  uint64_t v11 = [(CKTranscriptBalloonCell *)self lineView];
  if (v11)
  {
    double v12 = (void *)v11;
    BOOL v13 = [(CKTranscriptBalloonCell *)self animatingInDarkEffect];

    if (v13)
    {
      CGFloat v14 = [(CKTranscriptBalloonCell *)self lineView];
      [v14 addFilter:v15];
    }
  }
}

- (void)clearFilters
{
  double v3 = [(CKTranscriptBalloonCell *)self balloonView];
  [v3 clearFilters];

  BOOL v4 = [(CKTranscriptBalloonCell *)self lineView];

  if (v4)
  {
    id v5 = [(CKTranscriptBalloonCell *)self lineView];
    [v5 clearFilters];
  }
}

- (void)willLayoutDrawerLabelFrame:(CGRect *)a3
{
  id v5 = +[CKUIBehavior sharedBehaviors];
  long long v15 = 0u;
  objc_super v6 = [(CKTranscriptBalloonCell *)self balloonView];
  uint64_t v7 = v6;
  if (v6) {
    [v6 balloonDescriptor];
  }
  else {
    long long v15 = 0u;
  }

  if (BYTE9(v15))
  {
    [v5 balloonMaskTailSizeForTailShape:0];
    if (v8 > 0.0)
    {
      double v9 = v8;
      double v10 = [(CKEditableCollectionViewCell *)self contentView];
      uint64_t v11 = [v10 layer];
      double v12 = v11;
      if (v11)
      {
        [v11 transform];
        double v13 = v14;
      }
      else
      {
        double v13 = 0.0;
      }

      a3->size.double height = a3->size.height - v9 * v13;
    }
  }
}

- (void)setAnimationPauseReasons:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptBalloonCell;
  -[CKTranscriptMessageContentCell setAnimationPauseReasons:](&v7, sel_setAnimationPauseReasons_);
  id v5 = [(CKTranscriptBalloonCell *)self balloonView];
  [v5 setInvisibleInkEffectPaused:a3 != 0];

  objc_super v6 = [(CKTranscriptBalloonCell *)self balloonView];
  [v6 setAnimationPaused:((unint64_t)a3 >> 1) & 1];
}

- (CKBalloonSwipeController)balloonSwipeController
{
  balloonSwipeController = self->_balloonSwipeController;
  if (balloonSwipeController)
  {
    [(CKBalloonSwipeController *)balloonSwipeController setBalloonView:self->_balloonView];
    BOOL v4 = self->_balloonSwipeController;
  }
  else
  {
    id location = 0;
    objc_initWeak(&location, self);
    id v5 = [CKBalloonSwipeController alloc];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__CKTranscriptBalloonCell_balloonSwipeController__block_invoke;
    v11[3] = &unk_1E56222B8;
    objc_copyWeak(&v12, &location);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__CKTranscriptBalloonCell_balloonSwipeController__block_invoke_2;
    v9[3] = &unk_1E56222E0;
    objc_copyWeak(&v10, &location);
    objc_super v6 = [(CKBalloonSwipeController *)v5 initForCell:self swipeCompletionHandler:v11 swipeChangedHandler:v9];
    objc_super v7 = self->_balloonSwipeController;
    self->_balloonSwipeController = v6;

    [(CKBalloonSwipeController *)self->_balloonSwipeController setBalloonView:self->_balloonView];
    BOOL v4 = self->_balloonSwipeController;
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __49__CKTranscriptBalloonCell_balloonSwipeController__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained balloonCellDelegate];
  id v3 = objc_loadWeakRetained(v1);
  [v3 swipeToReplyLayoutOffset];
  objc_msgSend(v2, "transcriptBalloonCell:didEndBalloonSwipeWithDelta:swipeVelocity:", v3);
}

void __49__CKTranscriptBalloonCell_balloonSwipeController__block_invoke_2(uint64_t a1, double a2)
{
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained balloonCellDelegate];
  id v6 = objc_loadWeakRetained(v3);
  [v5 transcriptBalloonCell:v6 didTranslateBalloonByDelta:a2];

  id v7 = objc_loadWeakRetained(v3);
  [v7 setNeedsLayout];

  id v8 = objc_loadWeakRetained(v3);
  [v8 layoutIfNeeded];
}

- (void)setBalloonView:(id)a3
{
  id v5 = (CKBalloonView *)a3;
  p_balloonView = &self->_balloonView;
  if (self->_balloonView != v5)
  {
    double v17 = v5;
    id v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v8 = [v7 isExpressiveTextEnabled];

    if (v8)
    {
      double v9 = [(CKBalloonView *)*p_balloonView asTextBalloonView];
      [v9 setTextEffectsDelegate:0];
    }
    [(CKBalloonView *)*p_balloonView removeFromSuperview];
    objc_storeStrong((id *)&self->_balloonView, a3);
    id v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v11 = [v10 isExpressiveTextEnabled];

    if (v11)
    {
      id v12 = [(CKBalloonView *)*p_balloonView asTextBalloonView];
      [v12 setTextEffectsDelegate:self];
    }
    double v13 = *p_balloonView;
    double v14 = [(CKTranscriptBalloonCell *)self balloonSwipeController];
    [v14 setBalloonView:v13];

    long long v15 = [(CKEditableCollectionViewCell *)self contentView];
    [v15 addSubview:*p_balloonView];

    CGFloat v16 = [(CKTranscriptBalloonCell *)self layer];
    objc_msgSend(v16, "setAllowsGroupOpacity:", -[CKBalloonView needsGroupOpacity](*p_balloonView, "needsGroupOpacity"));

    [(CKTranscriptBalloonCell *)self setNeedsLayout];
    id v5 = v17;
  }
}

- (double)swipeToReplyLayoutOffset
{
  uint64_t v3 = [(CKTranscriptBalloonCell *)self layoutAttributes];
  BOOL v4 = (void *)v3;
  if (!v3 || (double v5 = *(double *)(v3 + 448), v5 <= 0.0))
  {
    id v6 = [(CKTranscriptBalloonCell *)self balloonSwipeController];
    [v6 offsetDelta];
    double v5 = v7;
  }
  return v5;
}

- (BOOL)allowsSwipeToReply
{
  BOOL v3 = [(CKTranscriptBalloonCell *)self canInlineReply];
  char v4 = [(CKTranscriptMessageCell *)self isReplyContextPreview];
  BOOL v5 = [(CKEditableCollectionViewCell *)self isInReplyContext];
  return v3 & ~v4 & ((v5 | [(CKTranscriptBalloonCell *)self isAudioMessage]) ^ 1);
}

- (BOOL)isPointInAllowedSwipingArea:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CKTranscriptBalloonCell *)self _swipeToReplySafeSwipeRect];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (CGRect)_swipeToReplySafeSwipeRect
{
  [(CKBalloonView *)self->_balloonView frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int v11 = [(CKTranscriptBalloonCell *)self _shouldReverseLayoutDirection];
  int v12 = [(CKEditableCollectionViewCell *)self orientation];
  double v13 = v4 + -28.0;
  if (!v12) {
    double v13 = v4;
  }
  double v14 = v4 + 28.0;
  if (v12) {
    double v14 = v4;
  }
  if (v11) {
    double v15 = v13;
  }
  else {
    double v15 = v14;
  }
  if (v8 < 156.0)
  {
    int v16 = [(CKEditableCollectionViewCell *)self orientation];
    double v17 = 0.0;
    if (v16) {
      double v17 = 156.0 - v8;
    }
    double v15 = v15 - v17;
    double v8 = v8 + 156.0 - v8;
  }
  double v18 = v15;
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)swipeToReplyGestureHandler:(id)a3
{
  id v6 = a3;
  [(CKTranscriptCell *)self drawerPercentRevealed];
  if (v4 <= 0.0)
  {
    double v5 = [(CKTranscriptBalloonCell *)self balloonSwipeController];
    [v5 swipeToReplyGestureHandler:v6];
  }
}

- (void)prepareForReuse
{
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isExpressiveTextEnabled];

  if (v4)
  {
    double v5 = [(CKTranscriptBalloonCell *)self balloonView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v7 = [(CKTranscriptBalloonCell *)self balloonView];
      double v8 = [v7 textView];
      if ([v8 allowsTextAnimations]) {
        objc_msgSend(v8, "ck_invalidateAllAnimators");
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptBalloonCell;
  [(CKTranscriptCell *)&v20 prepareForReuse];
  [(CKTranscriptBalloonCell *)self setLayoutAttributes:0];
  [(CKTranscriptBalloonCell *)self setThreadGroupLayoutAttributes:0];
  [(CKTranscriptBalloonCell *)self setInsertingReply:0];
  [(CKTranscriptBalloonCell *)self setLineType:0];
  double v9 = [(CKPhoneTranscriptMessageCell *)self contactImageView];
  double v10 = [v9 layer];

  LODWORD(v11) = 1.0;
  [v10 setOpacity:v11];
  [v10 removeAllAnimations];
  int v12 = [(CKTranscriptBalloonCell *)self balloonView];
  double v13 = [v12 layer];

  LODWORD(v14) = 1.0;
  [v13 setOpacity:v14];
  [v13 removeAllAnimations];
  double v15 = [(CKTranscriptBalloonCell *)self quickActionButton];
  [v15 removeFromSuperview];

  quickActionButton = self->_quickActionButton;
  self->_quickActionButton = 0;

  double v17 = [MEMORY[0x1E4F6BD68] sharedInstance];
  [v17 unregisterPhotoLibraryPersistenceManagerListener:self];

  [(CKTranscriptBalloonCell *)self setHasQueuedQuickActionButtonRemoval:0];
  double v18 = [(CKTranscriptBalloonCell *)self balloonView];
  [v18 setHidden:0];

  double v19 = [(CKTranscriptBalloonCell *)self balloonSwipeController];
  [v19 prepareForReuse];

  [(CKTranscriptBalloonCell *)self setBalloonCellDelegate:0];
}

- (void)setThreadGroupLayoutAttributes:(id)a3
{
  id v21 = a3;
  double v5 = [(CKTranscriptBalloonCell *)self threadGroupLayoutAttributes];
  char v6 = [v21 isEqualToArray:v5];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_threadGroupLayoutAttributes, a3);
    threadGroupLayoutAttributes = self->_threadGroupLayoutAttributes;
    double v8 = [(CKTranscriptBalloonCell *)self lineView];
    double v9 = v8;
    if (threadGroupLayoutAttributes)
    {

      if (!v9)
      {
        double v10 = [CKLineView alloc];
        double v11 = -[CKLineView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        int v12 = [(CKLineView *)v11 lineShapeLayer];
        [v12 setFillColor:0];

        double v13 = [(CKLineView *)v11 lineShapeLayer];
        double v14 = +[CKUIBehavior sharedBehaviors];
        double v15 = [v14 theme];
        id v16 = [v15 replyLineColor];
        objc_msgSend(v13, "setStrokeColor:", objc_msgSend(v16, "CGColor"));

        double v17 = [(CKLineView *)v11 lineShapeLayer];
        double v18 = +[CKUIBehavior sharedBehaviors];
        [v18 replyLineWidth];
        objc_msgSend(v17, "setLineWidth:");

        double v19 = [(CKLineView *)v11 lineShapeLayer];
        [v19 setLineCap:*MEMORY[0x1E4F3A458]];

        objc_super v20 = [(CKLineView *)v11 lineShapeLayer];
        [v20 setLineJoin:*MEMORY[0x1E4F3A478]];

        [(CKTranscriptBalloonCell *)self setLineView:v11];
        [(CKTranscriptBalloonCell *)self addSubview:v11];
      }
    }
    else
    {
      [v8 removeFromSuperview];

      [(CKTranscriptBalloonCell *)self setLineView:0];
    }
    [(CKTranscriptBalloonCell *)self setNeedsLayout];
  }
}

- (void)_updateLineForThreadGroupLayoutAttributes:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_insertingReply)
    {
      id v17 = v4;
      BOOL v5 = [(CKTranscriptCell *)self shouldFreezeReplyDecorationsForTimestampReveal];
      id v4 = v17;
      if (!v5)
      {
        [(CKTranscriptBalloonCell *)self _createLineViewFrameForThreadGroupLayoutAttributes:v17];
        double v7 = v6;
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        -[CKLineView setFrame:](self->_lineView, "setFrame:");
        double v14 = -[CKTranscriptBalloonCell _createLinePathForFrame:withThreadGroupLayoutAttributes:](self, "_createLinePathForFrame:withThreadGroupLayoutAttributes:", v17, v7, v9, v11, v13);
        double v15 = [(CKLineView *)self->_lineView lineShapeLayer];
        id v16 = v14;
        objc_msgSend(v15, "setPath:", objc_msgSend(v16, "CGPath"));

        id v4 = v17;
      }
    }
  }
}

- (CGRect)_createLineViewFrameForThreadGroupLayoutAttributes:(id)a3
{
  if (self->_lineView)
  {
    id v4 = a3;
    [(CKEditableCollectionViewCell *)self contentAlignmentRect];
    v70.origin.CGFloat x = v5;
    v70.origin.CGFloat y = v6;
    v70.size.double width = v7;
    v70.size.double height = v8;
    double v9 = [v4 firstObject];
    [(CGFloat *)v9 frame];
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    CGFloat v19 = v9[44];
    CGFloat v18 = v9[45];
    CGFloat v71 = v9[46];
    CGFloat v72 = v9[47];
    objc_super v20 = [(CGFloat *)v9 chatItem];
    id v21 = [v4 lastObject];

    [v21 frame];
    v68.origin.CGFloat x = v22;
    v68.origin.CGFloat y = v23;
    v68.size.double width = v24;
    v68.size.double height = v25;
    v69.origin.CGFloat x = (CGFloat)v21[44];
    v69.origin.CGFloat y = (CGFloat)v21[45];
    v69.size.double width = (CGFloat)v21[46];
    v69.size.double height = (CGFloat)v21[47];
    double v26 = [v21 chatItem];
    objc_super v27 = +[CKUIBehavior sharedBehaviors];
    [v27 transcriptContactImageDiameter];
    double v73 = v28;

    v29 = +[CKUIBehavior sharedBehaviors];
    [v29 replyLineViewVerticalPadding];
    double v31 = v30;

    v32 = +[CKUIBehavior sharedBehaviors];
    [v32 replyLineWidth];
    double v34 = v33;

    int v35 = [v20 itemIsFromMe];
    uint64_t v36 = v11;
    uint64_t v37 = v13;
    uint64_t v38 = v15;
    uint64_t v39 = v17;
    if (v35)
    {
      CGFloat MidY = CGRectGetMidY(*(CGRect *)&v36);
      v74.origin.CGFloat x = v19;
      v74.origin.CGFloat y = v18;
      v74.size.double width = v71;
      v74.size.double height = v72;
      double v41 = CGRectGetMidY(v74);
    }
    else
    {
      CGFloat MidY = v31 + CGRectGetMaxY(*(CGRect *)&v36);
      v75.origin.CGFloat x = v19;
      v75.origin.CGFloat y = v18;
      v75.size.double width = v71;
      v75.size.double height = v72;
      double v41 = v31 + CGRectGetMaxY(v75);
    }
    self->_lineViewReferenceY = MidY;
    double v46 = v34;
    if ([v26 itemIsFromMe])
    {
      double v47 = v34 + 1.0;
      double v48 = v47 + CGRectGetMidY(v68);
      double v49 = v47 + CGRectGetMidY(v69);
      double v50 = v47 + CGRectGetMidY(v70);
      BOOL v51 = [(CKTranscriptMessageCell *)self chatEligibleForContactImage];
      double v52 = 0.0;
      if (v51) {
        double v52 = 1.0;
      }
      double v53 = v50 + v52;
      double v54 = v73;
    }
    else
    {
      v55 = [(CKPhoneTranscriptMessageCell *)self contactImageView];

      double v54 = v73;
      if (v55)
      {
        double v56 = v73 + v31;
        double v48 = CGRectGetMaxY(v68) - v56;
        double v49 = CGRectGetMaxY(v69) - v56;
        double v53 = CGRectGetMaxY(v70) - v56 + 1.0;
      }
      else
      {
        double v48 = CGRectGetMinY(v68) - v31;
        double v49 = CGRectGetMinY(v69) - v31;
        double v53 = CGRectGetMinY(v70) - v31;
      }
    }
    double v57 = v48 - MidY;
    self->_lineViewExpansionFactor = v57 / (v49 - v41);
    double v58 = v53 - v57;
    double v59 = self->_lineHorizontalOffset + v54 * 0.5 - v46 * 0.5;
    v60 = +[CKUIBehavior sharedBehaviors];
    [v60 replyLineViewMaxWidth];
    double v62 = v61;

    if (CKMainScreenScale_once_12 != -1) {
      dispatch_once(&CKMainScreenScale_once_12, &__block_literal_global_27);
    }
    double v63 = *(double *)&CKMainScreenScale_sMainScreenScale_12;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_12 == 0.0) {
      double v63 = 1.0;
    }
    double v42 = round(v59 * v63) / v63;
    double v43 = round(v58 * v63) / v63;
    double v44 = round(v62 * v63) / v63;
    double v45 = round(v57 * v63) / v63;
  }
  else
  {
    double v42 = *MEMORY[0x1E4F1DB28];
    double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v44 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v64 = v42;
  double v65 = v43;
  double v66 = v44;
  double v67 = v45;
  result.size.double height = v67;
  result.size.double width = v66;
  result.origin.CGFloat y = v65;
  result.origin.CGFloat x = v64;
  return result;
}

- (id)_createLinePathForFrame:(CGRect)a3 withThreadGroupLayoutAttributes:(id)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  uint64_t v10 = +[CKUIBehavior sharedBehaviors];
  [v10 replyLineWidth];
  double v12 = v11;

  double v13 = v12 * 0.5;
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.double height = height;
  double v14 = CGRectGetHeight(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.double height = height;
  double v15 = CGRectGetWidth(v40);
  uint64_t v16 = [MEMORY[0x1E4F427D0] bezierPath];
  objc_msgSend(v16, "moveToPoint:", v13, v13);
  uint64_t v17 = [(CKTranscriptBalloonCell *)self _lineDescriptionForThreadGroupLayoutAttributes:v9 setLineType:1];
  threadLineDescription = self->_threadLineDescription;
  self->_threadLineDescription = v17;

  if ([(NSArray *)self->_threadLineDescription count])
  {
    unint64_t v19 = 0;
    double v20 = v14 - v13;
    double v21 = v15 - v13;
    do
    {
      CGFloat v22 = [v9 objectAtIndex:v19];
      CGFloat v23 = [(NSArray *)self->_threadLineDescription objectAtIndex:v19];
      uint64_t v24 = [v23 unsignedIntegerValue];

      switch(v24)
      {
        case 1:
          if (self->_lineType != 3
            || (+[CKUIBehavior sharedBehaviors],
                CGFloat v25 = objc_claimAutoreleasedReturnValue(),
                [v25 replyLineBracketRadius],
                double v27 = v26 * 1.52866,
                v25,
                v27 <= height))
          {
            if (v19)
            {
              double v28 = [(NSArray *)self->_threadLineDescription objectAtIndex:v19 - 1];
              uint64_t v29 = [v28 unsignedIntegerValue];
            }
            else
            {
              uint64_t v29 = 0;
            }
            BOOL v31 = v19 + 1 == [(NSArray *)self->_threadLineDescription count];
            uint64_t v37 = v16;
            double v30 = &v37;
            [(CKTranscriptBalloonCell *)self _drawStraightLineForPath:&v37 withLayout:v22 lineViewMaxY:v31 isTerminal:v29 prevLineSegmentType:v20];
            goto LABEL_13;
          }
          break;
        case 2:
          uint64_t v36 = v16;
          double v30 = &v36;
          [(CKTranscriptBalloonCell *)self _drawUpperBracketForPath:&v36 withLayout:v22 lineViewMaxX:v21 lineViewMaxY:v20];
          goto LABEL_13;
        case 3:
          int v35 = v16;
          double v30 = &v35;
          [(CKTranscriptBalloonCell *)self _drawLowerBracketForPath:&v35 lineViewMaxX:v21 lineViewMaxY:v20];
          goto LABEL_13;
        case 4:
          double v34 = v16;
          double v30 = &v34;
          [(CKTranscriptBalloonCell *)self _drawLoopForPath:&v34 withLayout:v22];
LABEL_13:
          id v32 = *v30;

          uint64_t v16 = v32;
          break;
        default:
          break;
      }

      ++v19;
    }
    while (v19 < [(NSArray *)self->_threadLineDescription count]);
  }

  return v16;
}

- (id)_lineDescriptionForThreadGroupLayoutAttributes:(id)a3 setLineType:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v32 = 0;
    double v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 1;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__9;
    v26[4] = __Block_byref_object_dispose__9;
    id v27 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    uint64_t v24 = 0;
    uint64_t v24 = [v6 count];
    uint64_t v17 = 0;
    CGFloat v18 = &v17;
    uint64_t v19 = 0x3032000000;
    double v20 = __Block_byref_object_copy__9;
    double v21 = __Block_byref_object_dispose__9;
    id v22 = 0;
    id v22 = [MEMORY[0x1E4F1CA48] array];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__CKTranscriptBalloonCell__lineDescriptionForThreadGroupLayoutAttributes_setLineType___block_invoke;
    v9[3] = &unk_1E5622308;
    double v11 = v23;
    id v10 = v6;
    double v12 = v26;
    double v13 = &v32;
    double v14 = &v28;
    double v15 = v25;
    uint64_t v16 = &v17;
    [v10 enumerateObjectsUsingBlock:v9];
    if (v4)
    {
      self->_unint64_t lineType = v33[3];
      self->_lineIsExtended = *((unsigned char *)v29 + 24);
    }
    id v7 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v26, 8);

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    if (v4) {
      self->_unint64_t lineType = 0;
    }
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

void __86__CKTranscriptBalloonCell__lineDescriptionForThreadGroupLayoutAttributes_setLineType___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 chatItem];
  if (!v7)
  {
    *a4 = 1;
    goto LABEL_34;
  }
  id obj = v7;
  if ((unint64_t)(a3 + 1) >= *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v9 = 0;
  }
  else
  {
    CGFloat v8 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
    id v9 = [v8 chatItem];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) || ![obj itemIsFromMe])
  {
    if (v9)
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if ([obj itemIsFromMe]
          && (isKindOfClass & 1) == 0
          && ([v9 itemIsFromMe] & 1) == 0)
        {
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 5;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
          uint64_t v10 = 4;
          goto LABEL_33;
        }
        uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        uint64_t v10 = 1;
        if (v12 != 4 && v12 != 2)
        {
          if (v12 != 1) {
            goto LABEL_33;
          }
          uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
          uint64_t v10 = 1;
LABEL_30:
          *(unsigned char *)(v14 + 24) = 1;
          goto LABEL_33;
        }
LABEL_19:
        uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
        goto LABEL_30;
      }
    }
    else
    {
      if ([obj itemIsFromMe])
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v10 = 3;
        if (*(void *)(v15 + 24) == 2) {
          uint64_t v16 = 4;
        }
        else {
          uint64_t v16 = 3;
        }
        *(void *)(v15 + 24) = v16;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        goto LABEL_33;
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) && ([obj itemIsFromMe] & 1) == 0)
      {
        uint64_t v10 = 1;
        if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) != 1) {
          goto LABEL_33;
        }
        goto LABEL_19;
      }
    }
    uint64_t v10 = 0;
    goto LABEL_33;
  }
  uint64_t v10 = 2;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
LABEL_33:
  uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  CGFloat v18 = [NSNumber numberWithUnsignedInteger:v10];
  [v17 addObject:v18];

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v10;

  id v7 = obj;
LABEL_34:
}

- (void)_drawStraightLineForPath:(id *)a3 withLayout:(id)a4 lineViewMaxY:(double)a5 isTerminal:(BOOL)a6 prevLineSegmentType:(unint64_t)a7
{
  BOOL v8 = a6;
  id v16 = a4;
  if (a3)
  {
    [*a3 currentPoint];
    double v14 = v13;
    double v15 = v12;
    if (!v8)
    {
      [v16 frame];
      a5 = fmin(CGRectGetMidY(v18) - self->_lineViewReferenceY, a5);
      if (a5 <= v15) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    if (a7 != 2 || v12 + 5.0 < a5) {
LABEL_7:
    }
      objc_msgSend(*a3, "addLineToPoint:", v14, a5);
  }
LABEL_8:
}

- (void)_drawUpperBracketForPath:(id *)a3 withLayout:(id)a4 lineViewMaxX:(double)a5 lineViewMaxY:(double)a6
{
  id v10 = a4;
  if (a3)
  {
    CGFloat v23 = v10;
    double v11 = +[CKUIBehavior sharedBehaviors];
    [v11 replyLineBracketRadius];
    double v13 = v12;

    [*a3 currentPoint];
    double v15 = v14;
    double v17 = v16;
    [*a3 moveToPoint:a5];
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v15 + v13 * 0.631494, v17 + v13 * 0.0749114, v15 + v13 * 1.08849, v17, v15 + v13 * 0.868407, v17);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v15 + v13 * 0.0749114, v17 + v13 * 0.631494, v15 + v13 * 0.372824, v17 + v13 * 0.16906, v15 + v13 * 0.16906, v17 + v13 * 0.372824);
    double v18 = fmin(a6, v17 + v13 * 1.52866);
    int v19 = CKIsRunningInMacCatalyst();
    id v10 = v23;
    if (v18 <= a6)
    {
      double v20 = fmax(v18, v17 + v13 * 1.08849);
      double v21 = 4.0;
      if (!v19) {
        double v21 = 1.0;
      }
      if (v20 <= v21 + a6)
      {
        objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v15, v18, v15, v17 + v13 * 0.868407, v15);
        [v23 frame];
        CGFloat MaxY = CGRectGetMaxY(v25);
        id v10 = v23;
        if (fmin(a6, MaxY - self->_lineViewReferenceY) > v18)
        {
          [*a3 addLineToPoint:v15];
          id v10 = v23;
        }
      }
    }
  }
}

- (void)_drawLowerBracketForPath:(id *)a3 lineViewMaxX:(double)a4 lineViewMaxY:(double)a5
{
  if (a3)
  {
    BOOL v8 = +[CKUIBehavior sharedBehaviors];
    [v8 replyLineBracketRadius];
    double v10 = v9;

    [*a3 currentPoint];
    double v12 = v11;
    double v14 = fmax(v13, a5 + v10 * -1.52866);
    objc_msgSend(*a3, "addLineToPoint:", v11, v14);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v12 + v10 * 0.0749114, a5 - v10 * 0.631494, v12, fmax(v14, a5 - v10 * 1.08849), v12, a5 - v10 * 0.868407);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v12 + v10 * 0.631494, a5 - v10 * 0.0749114, v12 + v10 * 0.16906, a5 - v10 * 0.372824, v12 + v10 * 0.372824, a5 - v10 * 0.16906);
    id v15 = *a3;
    objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", a4, a5, v12 + v10 * 0.868407, a5, v12 + v10 * 1.08849, a5);
  }
}

- (void)_drawLoopForPath:(id *)a3 withLayout:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = +[CKUIBehavior sharedBehaviors];
    [v7 textBalloonMinHeight];
    double v9 = v8;
    double v30 = v8;

    double lineViewExpansionFactor = self->_lineViewExpansionFactor;
    double v11 = fmax(lineViewExpansionFactor * -2.77777778 + 9.37777778, 3.5);
    [v6 frame];
    CGFloat v12 = CGRectGetMidY(v33) - self->_lineViewReferenceY;
    double v13 = fmax(lineViewExpansionFactor * -1.11111111 + 4.41111111, 2.0);
    double v14 = v13 * 0.3333;
    [*a3 currentPoint];
    double v16 = v15;
    double v31 = v13 * 0.8333 + v15;
    double v17 = v11 + v13 + v15;
    [v6 frame];
    double v18 = CGRectGetMinY(v34) - self->_lineViewReferenceY;
    [v6 frame];
    double v19 = fmax(v18, CGRectGetMidY(v35) - self->_lineViewReferenceY - v9 * 0.5);
    objc_msgSend(*a3, "addLineToPoint:", v16, v19);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v31, v12, v16, v19 + (v12 - v11 - v19) * 0.552285);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v17, v11 + v12);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:");
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v17);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v31, v12, v17 - v11 * 0.552285, v12 - v11, v14 + v31, v12 - v11 * 0.552285);
    [v6 frame];
    double v20 = CGRectGetMaxY(v36) - self->_lineViewReferenceY;
    [v6 frame];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;

    v37.origin.CGFloat x = v22;
    v37.origin.CGFloat y = v24;
    v37.size.CGFloat width = v26;
    v37.size.double height = v28;
    fmin(v20, CGRectGetMidY(v37) - self->_lineViewReferenceY + v30 * 0.5);
    id v29 = *a3;
    objc_msgSend(v29, "addCurveToPoint:controlPoint1:controlPoint2:");
  }
}

- (void)_animateReplyContextPreview:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, uint64_t))a3;
  [MEMORY[0x1E4F39CF8] begin];
  CGFloat v5 = [(CKTranscriptBalloonCell *)self layer];
  [(CKTranscriptCell *)self insertionBeginTime];
  objc_msgSend(v5, "convertTime:fromLayer:", 0);
  double v7 = v6;

  double v8 = +[CKUIBehavior sharedBehaviors];
  [v8 transcriptReplyPreviewContextContactAlpha];
  -[CKTranscriptBalloonCell _fadeInContactImageAlpha:atBeginTime:](self, "_fadeInContactImageAlpha:atBeginTime:");

  double v9 = [(CKTranscriptBalloonCell *)self balloonView];
  objc_opt_class();
  double v10 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v11 = +[CKUIBehavior sharedBehaviors];
    [v11 replyPreviewBalloonAlpha];
    double v10 = v12;
  }
  [(CKTranscriptBalloonCell *)self _fadeInBalloonAlpha:v10 atBeginTime:v7];
  [MEMORY[0x1E4F39CF8] commit];
  double v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v14 = [v13 fullTranscriptLoggingEnabled];

  if (v14 && IMOSLoggingEnabled())
  {
    double v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 134217984;
      double v17 = v7;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "INSERTION: Reply Preview: Begin:%f", (uint8_t *)&v16, 0xCu);
    }
  }
  [(CKTranscriptBalloonCell *)self setInsertingReply:0];
  if (v4) {
    v4[2](v4, 1);
  }
}

- (void)_animateUpperBracket:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, uint64_t))a3;
  [(CKTranscriptCell *)self insertionDuration];
  double v6 = v5;
  [MEMORY[0x1E4F39CF8] begin];
  double v7 = -[NSArray subarrayWithRange:](self->_threadGroupLayoutAttributes, "subarrayWithRange:", 0, [(NSArray *)self->_threadGroupLayoutAttributes count] - 1);
  double v8 = [v7 lastObject];
  uint64_t v44 = [v8 chatItem];

  double v9 = [(CKTranscriptBalloonCell *)self balloonCellDelegate];
  double v10 = [v9 cellForChatItem:v44];

  double v11 = [v7 lastObject];
  [v11 frame];
  double v13 = v12;
  int v14 = [v10 layer];
  double v15 = [v14 presentationLayer];
  [v15 frame];
  double v17 = v13 - v16;

  [(CKTranscriptBalloonCell *)self _createLineViewFrameForThreadGroupLayoutAttributes:self->_threadGroupLayoutAttributes];
  uint64_t v22 = v21;
  if (v17 >= 0.0)
  {
    uint64_t v25 = *MEMORY[0x1E4F1DB28];
    uint64_t v22 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
    uint64_t v23 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
    uint64_t v24 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    uint64_t v23 = v19;
    uint64_t v24 = v20;
    uint64_t v25 = v18;
  }
  -[CKLineView setFrame:](self->_lineView, "setFrame:");
  [(CKLineView *)self->_lineView frame];
  CGFloat v26 = -[CKTranscriptBalloonCell _createLinePathForFrame:withThreadGroupLayoutAttributes:](self, "_createLinePathForFrame:withThreadGroupLayoutAttributes:", self->_threadGroupLayoutAttributes);
  double v27 = [(CKLineView *)self->_lineView lineShapeLayer];
  id v28 = v26;
  objc_msgSend(v27, "setPath:", objc_msgSend(v28, "CGPath"));

  id v29 = [(CKLineView *)self->_lineView lineShapeLayer];
  [v29 setStrokeEnd:0.0];

  if ([(CKTranscriptCell *)self insertingWithReplyPreview]) {
    double v30 = 0.3;
  }
  else {
    double v30 = 0.0;
  }
  double v31 = [(CKTranscriptBalloonCell *)self layer];
  [(CKTranscriptCell *)self insertionBeginTime];
  objc_msgSend(v31, "convertTime:fromLayer:", 0);
  double v33 = v32;

  if (v17 < 0.0)
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __48__CKTranscriptBalloonCell__animateUpperBracket___block_invoke;
    v46[3] = &unk_1E5621968;
    v46[4] = self;
    v46[5] = v25;
    v46[6] = v22;
    v46[7] = v23;
    v46[8] = v24;
    [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v46 options:0 animations:0.3 completion:0.0];
  }
  double v34 = v30 + v33;
  CGRect v35 = [(CKTranscriptBalloonCell *)self animationWithKeyPath:@"strokeEnd" fromValue:&unk_1EDF16F88 toValue:&unk_1EDF16F98 beginTime:*MEMORY[0x1E4F3A488] duration:v30 + v33 timingFunctionName:v6];
  CGRect v36 = [(CKLineView *)self->_lineView lineShapeLayer];
  [v36 addAnimation:v35 forKey:@"lineStrokeEnd"];

  CGRect v37 = [(CKLineView *)self->_lineView lineShapeLayer];
  [v37 setStrokeEnd:1.0];

  double v38 = v6 + v34;
  [(CKTranscriptBalloonCell *)self _fadeInContactImageAlpha:1.0 atBeginTime:v6 + v34];
  [(CKTranscriptBalloonCell *)self _fadeInBalloonAlpha:1.0 atBeginTime:v6 + v34];
  [MEMORY[0x1E4F39CF8] commit];
  CGRect v39 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v40 = [v39 fullTranscriptLoggingEnabled];

  if (v40)
  {
    [(CKTranscriptCell *)self insertionBeginTime];
    double v42 = v41;
    if (IMOSLoggingEnabled())
    {
      double v43 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218752;
        double v48 = v34;
        __int16 v49 = 2048;
        double v50 = v6;
        __int16 v51 = 2048;
        double v52 = v38 - v34;
        __int16 v53 = 2048;
        double v54 = v38 + 0.3 - v42;
        _os_log_impl(&dword_18EF18000, v43, OS_LOG_TYPE_INFO, "INSERTION: Upper Bracket: Begin:%f, Duration:%f, Fade:%f, Total:%f", buf, 0x2Au);
      }
    }
  }
  [(CKTranscriptBalloonCell *)self setInsertingReply:0];
  if (v4) {
    v4[2](v4, 1);
  }
}

uint64_t __48__CKTranscriptBalloonCell__animateUpperBracket___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_animateLineExtension:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, uint64_t))a3;
  [(CKTranscriptCell *)self insertionDuration];
  double v6 = v5;
  [MEMORY[0x1E4F39CF8] begin];
  double v7 = -[NSArray subarrayWithRange:](self->_threadGroupLayoutAttributes, "subarrayWithRange:", 0, [(NSArray *)self->_threadGroupLayoutAttributes count] - 1);
  double v8 = [v7 lastObject];
  double v9 = [v8 chatItem];

  double v10 = [(CKTranscriptBalloonCell *)self balloonCellDelegate];
  double v11 = [v10 cellForChatItem:v9];

  double v12 = [v7 lastObject];
  [v12 frame];
  double v14 = v13;
  double v15 = [v11 layer];
  double v16 = [v15 presentationLayer];
  [v16 frame];
  double v18 = v14 - v17;

  [(CKTranscriptBalloonCell *)self _createLineViewFrameForThreadGroupLayoutAttributes:v7];
  double v54 = v19;
  uint64_t v20 = -[CKTranscriptBalloonCell _createLinePathForFrame:withThreadGroupLayoutAttributes:](self, "_createLinePathForFrame:withThreadGroupLayoutAttributes:", v7);
  [v20 currentPoint];
  double v22 = v21;
  double v24 = v23;
  [(CKTranscriptBalloonCell *)self _createLineViewFrameForThreadGroupLayoutAttributes:self->_threadGroupLayoutAttributes];
  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  if (v18 >= 0.0)
  {
    double v57 = *MEMORY[0x1E4F1DB28];
    double v58 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v55 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v56 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  }
  else
  {
    double v57 = v25;
    double v58 = v26;
    double v30 = v26 - v18;
    double v55 = v28;
    double v56 = v27;
  }
  -[CKLineView setFrame:](self->_lineView, "setFrame:", v25, v30, v27, v28);
  id v61 = v20;
  double v33 = -[CKTranscriptBalloonCell _extendPath:withFrame:](self, "_extendPath:withFrame:", &v61, v29, v30, v31, v32);
  id v59 = v61;

  double v34 = [(CKLineView *)self->_lineView lineShapeLayer];
  id v35 = v33;
  objc_msgSend(v34, "setPath:", objc_msgSend(v35, "CGPath"));

  NSUInteger v36 = [(NSArray *)self->_threadLineDescription count];
  double v37 = 0.0;
  if (v36 >= 2) {
    double v37 = calculateLengthPercentageToPointInLine((const CGPath *)[v35 CGPath], v22, v24);
  }
  BOOL v38 = v18 < 0.0;
  if ([(CKTranscriptCell *)self insertingWithReplyPreview]) {
    double v39 = 0.15;
  }
  else {
    double v39 = 0.0;
  }
  int v40 = [(CKTranscriptBalloonCell *)self layer];
  [(CKTranscriptCell *)self insertionBeginTime];
  objc_msgSend(v40, "convertTime:fromLayer:", 0);
  double v42 = v41;

  if (v38)
  {
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __49__CKTranscriptBalloonCell__animateLineExtension___block_invoke;
    v60[3] = &unk_1E5621968;
    v60[4] = self;
    *(double *)&v60[5] = v57;
    *(double *)&v60[6] = v58;
    *(double *)&v60[7] = v56;
    *(double *)&v60[8] = v55;
    [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v60 options:0 animations:0.3 completion:0.0];
  }
  BOOL v43 = v36 < 2;
  uint64_t v44 = [NSNumber numberWithDouble:v37];
  double v45 = v39 + v42;
  double v46 = [(CKTranscriptBalloonCell *)self animationWithKeyPath:@"strokeEnd" fromValue:v44 toValue:&unk_1EDF16F98 beginTime:*MEMORY[0x1E4F3A4A0] duration:v45 timingFunctionName:v6];

  double v47 = [(CKLineView *)self->_lineView lineShapeLayer];
  [v47 addAnimation:v46 forKey:@"lineStrokeEnd"];

  double v48 = v6 + v45;
  if (v43)
  {
    [(CKTranscriptBalloonCell *)self _fadeInBalloonAlpha:1.0 atBeginTime:v6 + v45];
    [(CKTranscriptBalloonCell *)self _fadeInContactImageAlpha:1.0 atBeginTime:v6 + v45];
  }
  else
  {
    double v48 = v48 + -0.1;
    [(CKTranscriptBalloonCell *)self _fadeInBalloonAlpha:1.0 atBeginTime:v48];
    [(CKTranscriptBalloonCell *)self _slideContactImageWithTranslate:v54 - v32 duration:v6 beginTime:v45];
  }
  [MEMORY[0x1E4F39CF8] commit];
  __int16 v49 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v50 = [v49 fullTranscriptLoggingEnabled];

  if (v50)
  {
    [(CKTranscriptCell *)self insertionBeginTime];
    double v52 = v51;
    if (IMOSLoggingEnabled())
    {
      __int16 v53 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218752;
        double v63 = v45;
        __int16 v64 = 2048;
        double v65 = v6;
        __int16 v66 = 2048;
        double v67 = v48 - v45;
        __int16 v68 = 2048;
        double v69 = v48 + 0.3 - v52;
        _os_log_impl(&dword_18EF18000, v53, OS_LOG_TYPE_INFO, "INSERTION: Line Extension: Begin:%f, Duration:%f, Fade:%f, Total:%f", buf, 0x2Au);
      }
    }
  }
  [(CKTranscriptBalloonCell *)self setInsertingReply:0];
  if (v4) {
    v4[2](v4, 1);
  }
}

uint64_t __49__CKTranscriptBalloonCell__animateLineExtension___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_animateLowerBracketToLoop:(id)a3
{
  id v75 = a3;
  [(CKTranscriptCell *)self insertionDuration];
  double v5 = v4;
  [MEMORY[0x1E4F39CF8] begin];
  double v6 = -[NSArray subarrayWithRange:](self->_threadGroupLayoutAttributes, "subarrayWithRange:", 0, [(NSArray *)self->_threadGroupLayoutAttributes count] - 1);
  [(CKTranscriptBalloonCell *)self _createLineViewFrameForThreadGroupLayoutAttributes:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [v6 lastObject];
  uint64_t v16 = [v15 chatItem];

  double v17 = [(CKTranscriptBalloonCell *)self balloonCellDelegate];
  v76 = (void *)v16;
  double v18 = [v17 cellForChatItem:v16];

  double v19 = [v6 lastObject];
  [v19 frame];
  double v21 = v20;
  CGRect v74 = v18;
  double v22 = [v18 layer];
  double v23 = [v22 presentationLayer];
  [v23 frame];
  double v25 = v21 - v24;

  double v26 = 0.0;
  if (v25 >= 0.0) {
    double v26 = v25;
  }
  double v27 = -[CKTranscriptBalloonCell _createLinePathForFrame:withThreadGroupLayoutAttributes:](self, "_createLinePathForFrame:withThreadGroupLayoutAttributes:", v6, v8, v10, v12, v14 - v26);
  [v27 currentPoint];
  double v29 = v28;
  double v31 = v30;
  [(CKTranscriptBalloonCell *)self _createLineViewFrameForThreadGroupLayoutAttributes:self->_threadGroupLayoutAttributes];
  CGFloat v36 = v32;
  double v37 = v33;
  CGFloat v38 = v34;
  CGFloat v39 = v35;
  if (v25 >= 0.0)
  {
    -[CKLineView setFrame:](self->_lineView, "setFrame:", v32, v33, v34, v35, *(void *)(MEMORY[0x1E4F1DB28] + 24), *(void *)(MEMORY[0x1E4F1DB28] + 16), *MEMORY[0x1E4F1DB28], *(void *)(MEMORY[0x1E4F1DB28] + 8));
  }
  else
  {
    double v37 = v33 - v25;
    -[CKLineView setFrame:](self->_lineView, "setFrame:", v32, v33 - v25, v34, v35, *(void *)&v35, *(void *)&v34, *(void *)&v32, *(void *)&v33);
  }
  uint64_t v40 = [v6 lastObject];
  v80.origin.CGFloat x = v36;
  v80.origin.CGFloat y = v37;
  v80.size.CGFloat width = v38;
  v80.size.double height = v39;
  double Height = CGRectGetHeight(v80);
  double v42 = +[CKUIBehavior sharedBehaviors];
  [v42 replyLineWidth];
  double v44 = Height + v43 * -0.5;

  double v73 = (void *)v40;
  id v45 = [(CKTranscriptBalloonCell *)self _drawLowerBracketLoopForPath:v27 withLayout:v40 lineViewMaxY:v44];
  double v46 = calculateLengthPercentageToPointInLine((const CGPath *)[v45 CGPath], v29, v31);
  [(CKLineView *)self->_lineView frame];
  double v47 = -[CKTranscriptBalloonCell _createLinePathForFrame:withThreadGroupLayoutAttributes:](self, "_createLinePathForFrame:withThreadGroupLayoutAttributes:", self->_threadGroupLayoutAttributes);
  if (v25 < 0.0)
  {
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __54__CKTranscriptBalloonCell__animateLowerBracketToLoop___block_invoke;
    v79[3] = &unk_1E5621968;
    v79[4] = self;
    v79[5] = v71;
    v79[6] = v72;
    v79[7] = v70;
    v79[8] = v69;
    [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v79 options:0 animations:0.3 completion:0.0];
  }
  double v48 = [(CKTranscriptBalloonCell *)self layer];
  [(CKTranscriptCell *)self insertionBeginTime];
  objc_msgSend(v48, "convertTime:fromLayer:", 0);
  double v50 = v49;

  LODWORD(v51) = 1060424070;
  LODWORD(v52) = 995640528;
  LODWORD(v53) = 1047918333;
  LODWORD(v54) = 1065366638;
  double v55 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v51 :v52 :v53 :v54];
  id v56 = v45;
  uint64_t v57 = [v56 CGPath];
  id v58 = v47;
  id v59 = -[CKTranscriptBalloonCell animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunction:](self, "animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunction:", @"path", v57, [v58 CGPath], v55, v50, v5);
  v60 = [(CKLineView *)self->_lineView lineShapeLayer];
  [v60 addAnimation:v59 forKey:@"linePath"];

  id v61 = [(CKLineView *)self->_lineView lineShapeLayer];
  id v62 = v58;
  objc_msgSend(v61, "setPath:", objc_msgSend(v62, "CGPath"));

  double v63 = [NSNumber numberWithDouble:v46];
  __int16 v64 = [(CKTranscriptBalloonCell *)self animationWithKeyPath:@"strokeEnd" fromValue:v63 toValue:&unk_1EDF16F98 beginTime:v55 duration:v50 timingFunction:v5];

  double v65 = [(CKLineView *)self->_lineView lineShapeLayer];
  [v65 addAnimation:v64 forKey:@"lineStrokeEnd"];

  __int16 v66 = [(CKLineView *)self->_lineView lineShapeLayer];
  [v66 setStrokeEnd:1.0];

  [(CKTranscriptBalloonCell *)self _fadeInContactImageAlpha:1.0 atBeginTime:v5 + v50 + -0.25];
  [(CKTranscriptBalloonCell *)self _fadeInBalloonAlpha:1.0 atBeginTime:v5 + v50 + -0.25];
  [MEMORY[0x1E4F39CF8] commit];
  dispatch_time_t v67 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CKTranscriptBalloonCell__animateLowerBracketToLoop___block_invoke_2;
  block[3] = &unk_1E5622330;
  block[4] = self;
  id v78 = v75;
  id v68 = v75;
  dispatch_after(v67, MEMORY[0x1E4F14428], block);
}

uint64_t __54__CKTranscriptBalloonCell__animateLowerBracketToLoop___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __54__CKTranscriptBalloonCell__animateLowerBracketToLoop___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setInsertingReply:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_slideContactImageWithTranslate:(double)a3 duration:(double)a4 beginTime:(double)a5
{
  double v9 = [(CKPhoneTranscriptMessageCell *)self contactImageView];
  double v10 = [v9 layer];
  double v11 = v10;
  long long v12 = 0uLL;
  memset(&v18, 0, sizeof(v18));
  if (v10)
  {
    [v10 transform];
    long long v12 = 0uLL;
  }
  *(_OWORD *)&v17.m41 = v12;
  *(_OWORD *)&v17.m43 = v12;
  *(_OWORD *)&v17.m31 = v12;
  *(_OWORD *)&v17.m33 = v12;
  *(_OWORD *)&v17.m21 = v12;
  *(_OWORD *)&v17.m23 = v12;
  *(_OWORD *)&v17.m11 = v12;
  *(_OWORD *)&v17.m13 = v12;
  CATransform3D v16 = v18;
  CATransform3DTranslate(&v17, &v16, 0.0, a3, 0.0);
  CATransform3D v16 = v17;
  double v13 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v16];
  CATransform3D v16 = v18;
  double v14 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v16];
  double v15 = [(CKTranscriptBalloonCell *)self animationWithKeyPath:@"transform" fromValue:v13 toValue:v14 beginTime:*MEMORY[0x1E4F3A4A0] duration:a5 timingFunctionName:a4];

  [v11 addAnimation:v15 forKey:@"contactImageSlide"];
}

- (void)_fadeInContactImageAlpha:(double)a3 atBeginTime:(double)a4
{
  id v11 = [(CKPhoneTranscriptMessageCell *)self contactImageView];
  double v7 = [v11 layer];
  [v7 setOpacity:0.0];
  double v8 = [NSNumber numberWithDouble:a3];
  double v9 = [(CKTranscriptBalloonCell *)self animationWithKeyPath:@"opacity" fromValue:&unk_1EDF16F88 toValue:v8 beginTime:*MEMORY[0x1E4F3A480] duration:a4 timingFunctionName:0.3];

  [v7 addAnimation:v9 forKey:@"contactImageFadeIn"];
  *(float *)&double v10 = a3;
  [v7 setOpacity:v10];
}

- (void)_fadeInBalloonAlpha:(double)a3 atBeginTime:(double)a4
{
  id v11 = [(CKTranscriptBalloonCell *)self balloonView];
  double v7 = [v11 layer];
  [v7 setOpacity:0.0];
  double v8 = [NSNumber numberWithDouble:a3];
  double v9 = [(CKTranscriptBalloonCell *)self animationWithKeyPath:@"opacity" fromValue:&unk_1EDF16F88 toValue:v8 beginTime:*MEMORY[0x1E4F3A480] duration:a4 timingFunctionName:0.3];

  [v7 addAnimation:v9 forKey:@"balloonFadeIn"];
  *(float *)&double v10 = a3;
  [v7 setOpacity:v10];
}

- (id)animationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5 beginTime:(double)a6 duration:(double)a7 timingFunctionName:(id)a8
{
  double v13 = (void *)MEMORY[0x1E4F39B48];
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  CATransform3D v17 = [v13 animationWithKeyPath:a3];
  [v17 setFromValue:v16];

  [v17 setToValue:v15];
  [v17 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v17 setRemovedOnCompletion:1];
  CATransform3D v18 = [MEMORY[0x1E4F39C10] functionWithName:v14];

  [v17 setTimingFunction:v18];
  [v17 setBeginTime:a6];
  [v17 setDuration:a7];

  return v17;
}

- (id)animationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5 beginTime:(double)a6 duration:(double)a7 timingFunction:(id)a8
{
  double v13 = (void *)MEMORY[0x1E4F39B48];
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  CATransform3D v17 = [v13 animationWithKeyPath:a3];
  [v17 setFromValue:v16];

  [v17 setToValue:v15];
  [v17 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v17 setRemovedOnCompletion:1];
  [v17 setTimingFunction:v14];

  [v17 setBeginTime:a6];
  [v17 setDuration:a7];

  return v17;
}

- (id)_drawLowerBracketLoopForPath:(id)a3 withLayout:(id)a4 lineViewMaxY:(double)a5
{
  id v8 = a3;
  lineView = self->_lineView;
  id v10 = a4;
  [(CKLineView *)lineView frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v19 = +[CKUIBehavior sharedBehaviors];
  [v19 replyLineWidth];
  double v21 = v20;

  double v22 = v21 * 0.5;
  v42.origin.CGFloat x = v12;
  v42.origin.CGFloat y = v14;
  v42.size.CGFloat width = v16;
  v42.size.double height = v18;
  double v23 = v22 + CGRectGetWidth(v42) * 0.5;
  id v24 = v8;
  [v24 currentPoint];
  double v26 = v25 + -30.0;
  [v24 addCurveToPoint:v23 controlPoint1:v25 + -30.0 controlPoint2:v27 + 15.0];
  double v28 = v26 + 5.0;
  [v10 frame];
  CGFloat v29 = CGRectGetMidY(v43) - self->_lineViewReferenceY + -10.0;
  [v10 frame];
  objc_msgSend(v24, "addCurveToPoint:controlPoint1:controlPoint2:", v22, CGRectGetMidY(v44) - self->_lineViewReferenceY, v22, v28, v22, v29);
  [v10 frame];
  CGFloat v30 = CGRectGetMidY(v45) - self->_lineViewReferenceY + 15.0;
  [v10 frame];
  CGFloat v31 = CGRectGetMaxY(v46) - self->_lineViewReferenceY + -15.0;
  [v10 frame];
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;

  v47.origin.CGFloat x = v33;
  v47.origin.CGFloat y = v35;
  v47.size.CGFloat width = v37;
  v47.size.double height = v39;
  objc_msgSend(v24, "addCurveToPoint:controlPoint1:controlPoint2:", v22, CGRectGetMaxY(v47) - self->_lineViewReferenceY, v22, v30, v22, v31);
  objc_msgSend(v24, "addLineToPoint:", v22, a5);

  return v24;
}

- (id)_extendPath:(id *)a3 withFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = +[CKUIBehavior sharedBehaviors];
  [v9 replyLineWidth];
  double v11 = v10;

  double v12 = v11 * -0.5;
  double v13 = (void *)[*a3 copy];
  [v13 currentPoint];
  double v15 = v14;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  objc_msgSend(v13, "addLineToPoint:", v15, CGRectGetHeight(v18) + v12);

  return v13;
}

- (void)_removeQuickActionButtonIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKQuickActionButton *)self->_quickActionButton isAnimating])
  {
    [(CKTranscriptBalloonCell *)self setHasQueuedQuickActionButtonRemoval:1];
  }
  else if (self->_quickActionButton)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__CKTranscriptBalloonCell__removeQuickActionButtonIfNeededAnimated___block_invoke;
    aBlock[3] = &unk_1E5620C40;
    aBlock[4] = self;
    double v5 = (void (**)(void))_Block_copy(aBlock);
    double v6 = v5;
    if (v3)
    {
      double v7 = (void *)MEMORY[0x1E4F42FF0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __68__CKTranscriptBalloonCell__removeQuickActionButtonIfNeededAnimated___block_invoke_2;
      v10[3] = &unk_1E5620C40;
      v10[4] = self;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __68__CKTranscriptBalloonCell__removeQuickActionButtonIfNeededAnimated___block_invoke_3;
      v8[3] = &unk_1E5622358;
      double v9 = v5;
      [v7 animateWithDuration:v10 animations:v8 completion:0.300000012];
    }
    else
    {
      v5[2](v5);
    }
  }
}

void __68__CKTranscriptBalloonCell__removeQuickActionButtonIfNeededAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1008) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 1008);
  *(void *)(v2 + 1008) = 0;
}

uint64_t __68__CKTranscriptBalloonCell__removeQuickActionButtonIfNeededAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1008) setAlpha:0.0];
}

uint64_t __68__CKTranscriptBalloonCell__removeQuickActionButtonIfNeededAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_addQuickActionButtonIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKTranscriptBalloonCell *)self hasQueuedQuickActionButtonRemoval]) {
    [(CKTranscriptBalloonCell *)self setHasQueuedQuickActionButtonRemoval:0];
  }
  if (!self->_quickActionButton)
  {
    BOOL v5 = [(CKTranscriptBalloonCell *)self isRichLink];
    double v6 = off_1E561DF70;
    if (!v5) {
      double v6 = off_1E561DF78;
    }
    double v7 = (CKQuickActionButton *)objc_alloc_init(*v6);
    quickActionButton = self->_quickActionButton;
    self->_quickActionButton = v7;

    [(CKQuickActionButton *)self->_quickActionButton setAnimationDelegate:self];
    [(CKQuickActionButton *)self->_quickActionButton setDelegate:self];
    if (v3)
    {
      [(CKQuickActionButton *)self->_quickActionButton setAlpha:0.0];
      double v9 = [(CKEditableCollectionViewCell *)self contentView];
      [v9 addSubview:self->_quickActionButton];

      double v10 = [(CKEditableCollectionViewCell *)self contentView];
      [v10 sendSubviewToBack:self->_quickActionButton];

      [(CKTranscriptBalloonCell *)self setNeedsLayout];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __65__CKTranscriptBalloonCell__addQuickActionButtonIfNeededAnimated___block_invoke;
      v13[3] = &unk_1E5620C40;
      v13[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:v13 animations:0.300000012];
    }
    else
    {
      double v11 = [(CKEditableCollectionViewCell *)self contentView];
      [v11 addSubview:self->_quickActionButton];

      double v12 = [(CKEditableCollectionViewCell *)self contentView];
      [v12 sendSubviewToBack:self->_quickActionButton];

      [(CKTranscriptBalloonCell *)self setNeedsLayout];
    }
  }
}

uint64_t __65__CKTranscriptBalloonCell__addQuickActionButtonIfNeededAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1008) setAlpha:1.0];
}

- (void)setCanShowQuickActionButton:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CKEditableCollectionViewCell *)self isInReplyContext]
    && self->_canShowQuickActionButton != v3)
  {
    self->_canShowQuickActionButton = v3;
    [(CKTranscriptBalloonCell *)self updateQuickActionButtonVisibility];
  }
}

- (void)setSyndicationIdentifiers:(id)a3
{
  BOOL v5 = (NSArray *)a3;
  if (self->_syndicationIdentifiers != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_syndicationIdentifiers, a3);
    [(CKTranscriptBalloonCell *)self updateQuickActionButtonVisibility];
    BOOL v5 = v6;
  }
}

- (void)updateQuickActionButtonVisibility
{
  if (![(CKTranscriptBalloonCell *)self canShowQuickActionButton]) {
    goto LABEL_11;
  }
  if ([(CKTranscriptBalloonCell *)self isRichLink])
  {
    BOOL v3 = 1;
  }
  else
  {
    char v14 = 0;
    unint64_t v4 = [(CKTranscriptBalloonCell *)self numberOfMomentSharePhotos];
    unint64_t v5 = [(CKTranscriptBalloonCell *)self numberOfMomentShareVideos] + v4;
    if (v5)
    {
      if ([(CKTranscriptBalloonCell *)self numberOfMomentShareSavedAssets] == v5)
      {
LABEL_11:
        [(CKTranscriptBalloonCell *)self _removeQuickActionButtonIfNeededAnimated:1];
        return;
      }
LABEL_8:
      [(CKTranscriptBalloonCell *)self _addQuickActionButtonIfNeededAnimated:0];
      return;
    }
    double v6 = [MEMORY[0x1E4F6BD68] sharedInstance];
    [v6 registerPhotoLibraryPersistenceManagerListener:self];
    double v7 = [(CKTranscriptBalloonCell *)self syndicationIdentifiers];
    uint64_t v8 = [v7 count];

    double v9 = [MEMORY[0x1E4F6BD68] sharedInstance];
    double v10 = (void *)MEMORY[0x1E4F1CAD0];
    double v11 = [(CKTranscriptBalloonCell *)self syndicationIdentifiers];
    double v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v9 cachedCountOfSyndicationIdentifiersSavedToSystemPhotoLibrary:v12 shouldFetchAndNotifyAsNeeded:1 didStartFetch:&v14];

    BOOL v3 = v13 != v8;
    if (!v14)
    {
LABEL_10:
      if (!v3) {
        goto LABEL_11;
      }
      goto LABEL_8;
    }
  }
  if ([(CKTranscriptBalloonCell *)self isRichLink]) {
    goto LABEL_10;
  }
}

- (void)quickActionButtonWasTapped:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CKTranscriptBalloonCell *)self quickActionButtonTappedCallback];

  if (v5)
  {
    uint64_t v6 = [(CKTranscriptBalloonCell *)self quickActionButtonTappedCallback];
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
  else
  {
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptBalloonCell quickActionButtonWasTapped:]((os_log_t)v6);
    }
  }
}

- (void)quickActionButtonAnimationDidEnd:(id)a3
{
  if ([(CKTranscriptBalloonCell *)self hasQueuedQuickActionButtonRemoval])
  {
    [(CKTranscriptBalloonCell *)self _removeQuickActionButtonIfNeededAnimated:1];
  }
}

- (void)textBalloonViewWillLayoutSubviews:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
    [v5 transcriptBalloonCell:self willLayoutTextBalloonView:v6];
  }
}

- (void)textBalloonViewDidLayoutSubviews:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
    [v5 transcriptBalloonCell:self didLayoutTextBalloonView:v6];
  }
}

- (unint64_t)textBalloonViewAllowedLayoutActionForTextBalloonView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
    unint64_t v7 = [v6 transcriptBalloonCell:self allowedLayoutActionForTextBalloonView:v4];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)textBalloonViewTextViewDidChangeRenderBounds:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
    [v5 transcriptBalloonCell:self didChangeRenderBoundsOfTextBalloonView:v6];
  }
}

- (id)customTextRenderingDisplayLinkForTextBalloonViewTextView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
    unint64_t v7 = [v6 transcriptBalloonCell:self customTextRenderingDisplayLinkForTextBalloonViewTextView:v4];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)textBalloonViewTextView:(id)a3 didChangeTextEffectPlaybackCandidateStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
    [v7 transcriptBalloonCell:self textBalloonView:v8 didChangeTextEffectPlaybackCandidateStatus:v4];
  }
}

- (CKBalloonView)balloonView
{
  return self->_balloonView;
}

- (CKTranscriptBalloonCellDelegate)balloonCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_balloonCellDelegate);

  return (CKTranscriptBalloonCellDelegate *)WeakRetained;
}

- (void)setBalloonCellDelegate:(id)a3
{
}

- (CKTranscriptBalloonCellTextEffectsDelegate)textEffectsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  return (CKTranscriptBalloonCellTextEffectsDelegate *)WeakRetained;
}

- (void)setTextEffectsDelegate:(id)a3
{
}

- (BOOL)mayReparentPluginViews
{
  return self->_mayReparentPluginViews;
}

- (void)setMayReparentPluginViews:(BOOL)a3
{
  self->_mayReparentPluginViews = a3;
}

- (BOOL)isInsertingReply
{
  return self->_insertingReply;
}

- (void)setInsertingReply:(BOOL)a3
{
  self->_insertingReplCGFloat y = a3;
}

- (unint64_t)lineType
{
  return self->_lineType;
}

- (void)setLineType:(unint64_t)a3
{
  self->_unint64_t lineType = a3;
}

- (BOOL)lineIsExtended
{
  return self->_lineIsExtended;
}

- (BOOL)animatingInDarkEffect
{
  return self->_animatingInDarkEffect;
}

- (void)setAnimatingInDarkEffect:(BOOL)a3
{
  self->_animatingInDarkEffect = a3;
}

- (BOOL)canInlineReply
{
  return self->_canInlineReply;
}

- (void)setCanInlineReply:(BOOL)a3
{
  self->_canInlineReplCGFloat y = a3;
}

- (BOOL)isRichLink
{
  return self->_isRichLink;
}

- (void)setIsRichLink:(BOOL)a3
{
  self->_isRichLink = a3;
}

- (NSArray)syndicationIdentifiers
{
  return self->_syndicationIdentifiers;
}

- (unint64_t)numberOfMomentShareSavedAssets
{
  return self->_numberOfMomentShareSavedAssets;
}

- (void)setNumberOfMomentShareSavedAssets:(unint64_t)a3
{
  self->_numberOfMomentShareSavedAssets = a3;
}

- (unint64_t)numberOfMomentSharePhotos
{
  return self->_numberOfMomentSharePhotos;
}

- (void)setNumberOfMomentSharePhotos:(unint64_t)a3
{
  self->_numberOfMomentSharePhotos = a3;
}

- (unint64_t)numberOfMomentShareVideos
{
  return self->_numberOfMomentShareVideos;
}

- (void)setNumberOfMomentShareVideos:(unint64_t)a3
{
  self->_numberOfMomentShareVideos = a3;
}

- (BOOL)canShowQuickActionButton
{
  return self->_canShowQuickActionButton;
}

- (id)quickActionButtonTappedCallback
{
  return self->_quickActionButtonTappedCallback;
}

- (void)setQuickActionButtonTappedCallback:(id)a3
{
}

- (CKQuickActionButton)quickActionButton
{
  return self->_quickActionButton;
}

- (CKTranscriptCollectionViewLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setLayoutAttributes:(id)a3
{
}

- (NSArray)threadGroupLayoutAttributes
{
  return self->_threadGroupLayoutAttributes;
}

- (NSArray)threadLineDescription
{
  return self->_threadLineDescription;
}

- (void)setThreadLineDescription:(id)a3
{
}

- (CKLineView)lineView
{
  return self->_lineView;
}

- (void)setLineView:(id)a3
{
}

- (double)lineHorizontalOffset
{
  return self->_lineHorizontalOffset;
}

- (void)setLineHorizontalOffset:(double)a3
{
  self->_lineHorizontalOffset = a3;
}

- (double)lineViewReferenceY
{
  return self->_lineViewReferenceY;
}

- (void)setLineViewReferenceY:(double)a3
{
  self->_lineViewReferenceY = a3;
}

- (double)lineViewExpansionFactor
{
  return self->_lineViewExpansionFactor;
}

- (void)setLineViewExpansionFactor:(double)a3
{
  self->_double lineViewExpansionFactor = a3;
}

- (BOOL)hasQueuedQuickActionButtonRemoval
{
  return self->_hasQueuedQuickActionButtonRemoval;
}

- (void)setHasQueuedQuickActionButtonRemoval:(BOOL)a3
{
  self->_hasQueuedQuickActionButtonRemoval = a3;
}

- (void)setBalloonSwipeController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonSwipeController, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
  objc_storeStrong((id *)&self->_threadLineDescription, 0);
  objc_storeStrong((id *)&self->_threadGroupLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_quickActionButton, 0);
  objc_storeStrong(&self->_quickActionButtonTappedCallback, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifiers, 0);
  objc_destroyWeak((id *)&self->_textEffectsDelegate);
  objc_destroyWeak((id *)&self->_balloonCellDelegate);

  objc_storeStrong((id *)&self->_balloonView, 0);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v72.receiver = self;
  v72.super_class = (Class)CKTranscriptBalloonCell;
  [(CKTranscriptMessageContentCell *)&v72 configureForChatItem:v12 context:v13 animated:v9 animationDuration:a7 animationCurve:a6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([v12 itemIsReplyContextPreview] & 1) == 0)
    {
      -[CKTranscriptMessageCell setFailed:](self, "setFailed:", [v12 failed]);
      char v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v15 = [v14 stewieEnabled];

      if (v15)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = [v12 stewieConversationID];
          int v17 = [v12 failed];
          int v18 = v16 >= 0 ? v17 : 0;
          if (v18 == 1)
          {
            double v19 = [v12 message];
            double v20 = [v19 messageSubject];
            BOOL v21 = [v20 length] == 0;

            if (!v21)
            {
              if (IMOSLoggingEnabled())
              {
                double v22 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 134217984;
                  uint64_t v74 = v16;
                  _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Disable failure button on initial Stewie start message for conversation ID: %ld", buf, 0xCu);
                }
              }
              [(CKTranscriptMessageCell *)self setFailed:0];
            }
          }
        }
      }
      if ([v12 isBlackholed])
      {
        double v23 = [(CKTranscriptMessageCell *)self failureButton];
        id v24 = +[CKUIBehavior sharedBehaviors];
        double v25 = [v24 theme];
        double v26 = [v25 statusTextColor];
        [v23 setTintColor:v26];
      }
    }
    double v27 = (objc_class *)[v12 balloonViewClass];
    double v28 = [(CKTranscriptBalloonCell *)self balloonView];
    if (v28 && (objc_class *)objc_opt_class() == v27)
    {
      CGFloat v29 = v28;
    }
    else
    {
      CGFloat v29 = CKBalloonViewForClass(v27);
      [(CKTranscriptBalloonCell *)self setBalloonView:v29];
      if (v28)
      {
        [v28 frame];
        objc_msgSend(v29, "setFrame:");
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v29 configureForLocatingChatItem:v12];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v29 configureForLocationShareOfferChatItem:v12];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v50 = v29;
        uint64_t v51 = [v50 mayReparentPluginViews];
        objc_msgSend(v50, "setMayReparentPluginViews:", -[CKTranscriptBalloonCell mayReparentPluginViews](self, "mayReparentPluginViews"));
        [v50 configureForTranscriptPlugin:v12 context:v13];
        [v50 setMayReparentPluginViews:v51];

        [(CKTranscriptBalloonCell *)self configureQuickActionButtonForChatItem:v12];
        goto LABEL_31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_31:
        [v29 frame];
        uint64_t v32 = v31;
        uint64_t v34 = v33;
        double v36 = v35;
        double v38 = v37;
        [v12 size];
        double v40 = v39;
        double v42 = v41;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (v40 != *MEMORY[0x1E4F1DB30] || v42 != *(double *)(MEMORY[0x1E4F1DB30] + 8)))
        {
          [(CKTranscriptBalloonCell *)self bounds];
          double v45 = v44 / v40;
          double v46 = 0.0;
          if (v40 == 0.0) {
            double v45 = 0.0;
          }
          if (v42 != 0.0) {
            double v46 = v43 / v42;
          }
          double v47 = fmin(v45, v46);
          double v40 = v40 * v47;
          double v42 = v42 * v47;
        }
        if (v36 != v40 || v38 != v42)
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __110__CKTranscriptBalloonCell_CKChatItem__configureForChatItem_context_animated_animationDuration_animationCurve___block_invoke;
          aBlock[3] = &unk_1E56290E8;
          uint64_t v67 = v32;
          uint64_t v68 = v34;
          double v69 = v40;
          double v70 = v42;
          id v65 = v29;
          __int16 v66 = self;
          BOOL v71 = v9;
          double v48 = _Block_copy(aBlock);
          double v49 = v48;
          if (v9) {
            [MEMORY[0x1E4F42FF0] animateWithDuration:a7 << 16 delay:v48 options:0 animations:a6 completion:0.0];
          }
          else {
            (*((void (**)(void *))v48 + 2))(v48);
          }
        }
        double v52 = +[CKUIBehavior sharedBehaviors];
        if (v12)
        {
          [v12 balloonDescriptor];
        }
        else
        {
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v59 = 0u;
        }
        [v52 balloonMaskSizeWithBalloonDescriptor:&v59];
        objc_msgSend(v29, "setWantsSkinnyMask:", v40 < v53, v59, v60, v61, v62, v63);

        int v54 = [v12 itemIsReplyContextPreview];
        double v55 = +[CKUIBehavior sharedBehaviors];
        id v56 = v55;
        if (v54) {
          [v55 textReplyPreviewBalloonMinHeight];
        }
        else {
          [v55 textBalloonMinHeight];
        }
        [v29 setWantsMultilineMask:v42 > v57];

        -[CKTranscriptBalloonCell setCanInlineReply:](self, "setCanInlineReply:", [v12 canInlineReply]);
        goto LABEL_55;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v29 configureForTUConversationChatItem:v12];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v58 = v12;
            [v29 configureForMessagePart:v58];
            [(CKTranscriptBalloonCell *)self configureQuickActionButtonForChatItem:v58];
          }
          else
          {
            [v29 configureForChatItem:v12];
          }
        }
        goto LABEL_31;
      }
    }
    [v29 configureForTranscriptPlugin:v12];
    goto LABEL_31;
  }
  CGFloat v30 = IMLogHandleForCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    -[CKTranscriptBalloonCell(CKChatItem) configureForChatItem:context:animated:animationDuration:animationCurve:]();
  }

  CGFloat v29 = [(CKTranscriptBalloonCell *)self balloonView];
  [v29 prepareForReuse];
LABEL_55:
}

uint64_t __110__CKTranscriptBalloonCell_CKChatItem__configureForChatItem_context_animated_animationDuration_animationCurve___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t result = [*(id *)(a1 + 40) setNeedsLayout];
  if (*(unsigned char *)(a1 + 80))
  {
    BOOL v3 = *(void **)(a1 + 40);
    return [v3 layoutIfNeeded];
  }
  return result;
}

- (void)configureQuickActionButtonForChatItem:(id)a3
{
  id v20 = a3;
  BOOL v4 = [MEMORY[0x1E4F59080] sharedSystemShellSwitcher];
  int v5 = [v4 isClarityBoardEnabled];

  if (CKIsRunningInMessagesViewService()
    || CKIsRunningInMessagesNotificationExtension()
    || CKIsRunningInRemoteIntentClient())
  {
    int v6 = 0;
  }
  else
  {
    int v6 = [v20 canPerformQuickAction] & (v5 ^ 1);
  }
  id v7 = [v20 IMChatItem];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 type];
  }
  else
  {
    id v8 = 0;
  }
  if ([v8 isEqualToString:@"com.apple.messages.URLBalloonProvider"])
  {
    [(CKTranscriptBalloonCell *)self setIsRichLink:1];
    [(CKTranscriptBalloonCell *)self updateQuickActionButtonVisibility];
    if (v6)
    {
LABEL_10:
      uint64_t v9 = [(CKTranscriptBalloonCell *)self _isCommSafetyRestrictedForChatItem:v20] ^ 1;
      goto LABEL_18;
    }
  }
  else
  {
    double v10 = [v20 IMChatItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v12 = [v20 IMChatItem];
      [(CKTranscriptBalloonCell *)self setIsRichLink:0];
      -[CKTranscriptBalloonCell setNumberOfMomentShareSavedAssets:](self, "setNumberOfMomentShareSavedAssets:", [v12 numberOfMomentShareSavedAssets]);
      -[CKTranscriptBalloonCell setNumberOfMomentSharePhotos:](self, "setNumberOfMomentSharePhotos:", [v12 numberOfMomentSharePhotos]);
      -[CKTranscriptBalloonCell setNumberOfMomentShareVideos:](self, "setNumberOfMomentShareVideos:", [v12 numberOfMomentShareVideos]);
    }
    objc_opt_class();
    int v13 = objc_opt_isKindOfClass();
    if ((v13 & v6) == 1)
    {
      char v14 = [v20 layoutRecipe];
      int v15 = [v14 isLastItem];
    }
    else
    {
      int v15 = v6 & ~v13;
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F6BD68];
    int v17 = [v20 message];
    int v18 = [v20 IMChatItem];
    double v19 = [v16 photosSyndicationIdentifiersForMessage:v17 transcriptChatItem:v18];

    [(CKTranscriptBalloonCell *)self setSyndicationIdentifiers:v19];
    if (v15) {
      goto LABEL_10;
    }
  }
  uint64_t v9 = 0;
LABEL_18:
  [(CKTranscriptBalloonCell *)self setCanShowQuickActionButton:v9];
}

- (BOOL)_isCommSafetyRestrictedForChatItem:(id)a3
{
  id v3 = a3;
  if ([v3 supportsCommunicationSafety]
    && ([v3 commSafetyTransferGUID],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v5))
  {
    int v6 = [MEMORY[0x1E4F6BCC8] sharedInstance];
    id v7 = [v3 commSafetyTransferGUID];
    id v8 = [v6 transferForGUID:v7];

    BOOL v9 = +[CKCommSafetyHelper shouldDisableTranscriptCapabilitiesForFileTransfer:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)configureAppEntityForMessage:(id)a3
{
  id v5 = a3;
  int v6 = self;
  CKTranscriptBalloonCell.configureAppEntity(forMessage:)((CKChatItem_optional *)a3);
}

- (void)quickActionButtonWasTapped:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Received quick save button tapped delegate callback, but quickActionButtonTappedCallback wasn't set on the cell.", v1, 2u);
}

@end