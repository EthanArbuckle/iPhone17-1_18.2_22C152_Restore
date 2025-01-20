@interface CKTranscriptCollectionView
- (BOOL)adjustContentOffsetForContentSizeChangeIfNeeded;
- (BOOL)dynamicsDisabled;
- (BOOL)ignoresAutomaticScrollsTowardBottom;
- (BOOL)ignoresReloadDataRequests;
- (BOOL)isHoldingContentOffsetUpdates;
- (BOOL)isTemporarilyOverridingContentOffsetRestriction;
- (CABasicAnimation)transcriptCustomScrollAnimation;
- (CGRect)targetFrameForItemAtIndexPath:(id)a3;
- (CKTranscriptBalloonCell)swipeTargetBalloonCell;
- (CKTranscriptCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (CKTranscriptHighlightedMessageScrollContext)highlightedMessageScrollContext;
- (NSCountedSet)contentOffsetDisabledReasons;
- (NSCountedSet)transcriptDynamicsDisabledReasons;
- (double)insertScrollDelta;
- (id)_customScrollAnimation;
- (id)indexPathForItemAtPoint:(CGPoint)a3;
- (id)indexPathForItemAtPoint:(CGPoint)a3 inSection:(int64_t)a4;
- (id)needsScrollIntentEnforcementBlock;
- (int64_t)transcriptScrollIntent;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
- (void)__ck_scrollToBottom:(BOOL)a3;
- (void)_updateScrollingLockStateForRecognizer:(id)a3;
- (void)beginDisablingTranscriptDynamicsForReason:(id)a3;
- (void)beginHoldingContentOffsetUpdatesForReason:(id)a3;
- (void)configureAppEntityForConversationId:(id)a3;
- (void)endDisablingTranscriptDynamicsForReason:(id)a3;
- (void)endHoldingContentOffsetUpdatesForAllReasons;
- (void)endHoldingContentOffsetUpdatesForReason:(id)a3;
- (void)enforceTranscriptScrollIntentWithAnimationProperties:(id)a3;
- (void)invalidateNeedsContentOffsetAdjustmentForNextContentSizeChange;
- (void)layoutSubviews;
- (void)performContentOffsetUpdateTemporarilyOverridingHoldStatus:(id)a3;
- (void)reloadData;
- (void)scrollToBottomHidingMessageAtIndexPath:(id)a3 animationProperties:(id)a4;
- (void)scrollToBottomWithAnimationProperties:(id)a3;
- (void)setAdjustContentOffsetForContentSizeChangeIfNeeded:(BOOL)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setContentOffset:(CGPoint)a3 animationProperties:(id)a4;
- (void)setContentOffsetDisabledReasons:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setHighlightedMessageScrollContext:(id)a3;
- (void)setIgnoresAutomaticScrollsTowardBottom:(BOOL)a3;
- (void)setIgnoresReloadDataRequests:(BOOL)a3;
- (void)setInsertScrollDelta:(double)a3;
- (void)setIsTemporarilyOverridingContentOffsetRestriction:(BOOL)a3;
- (void)setNeedsContentOffsetAdjustmentForNextContentSizeChange;
- (void)setNeedsScrollIntentEnforced;
- (void)setNeedsScrollIntentEnforcementBlock:(id)a3;
- (void)setSwipeTargetBalloonCell:(id)a3;
- (void)setTranscriptCustomScrollAnimation:(id)a3;
- (void)setTranscriptDynamicsDisabledReasons:(id)a3;
- (void)setTranscriptScrollIntent:(int64_t)a3;
- (void)swipeToReplyGestureHandler:(id)a3;
@end

@implementation CKTranscriptCollectionView

- (CKTranscriptCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)CKTranscriptCollectionView;
  v4 = -[CKEditableCollectionView initWithFrame:collectionViewLayout:](&v17, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(CKTranscriptCollectionView *)v4 setPrefetchingEnabled:0];
    v6 = +[CKUIBehavior sharedBehaviors];
    int v7 = [v6 forceMinTranscriptMarginInsets];

    if (v7)
    {
      v8 = +[CKUIBehavior sharedBehaviors];
      [v8 minTranscriptMarginInsets];
      -[CKEditableCollectionView setMarginInsets:](v5, "setMarginInsets:");
    }
    v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    transcriptDynamicsDisabledReasons = v5->_transcriptDynamicsDisabledReasons;
    v5->_transcriptDynamicsDisabledReasons = v9;

    v5->_transcriptScrollIntent = 6;
    v11 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    contentOffsetDisabledReasons = v5->_contentOffsetDisabledReasons;
    v5->_contentOffsetDisabledReasons = v11;

    v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v14 = [v13 isSwipeToReplyEnabled];

    if (v14)
    {
      v15 = [(CKTranscriptCollectionView *)v5 panGestureRecognizer];
      [v15 addTarget:v5 action:sel_swipeToReplyGestureHandler_];
    }
  }
  return v5;
}

- (void)layoutSubviews
{
  v3 = [(CKTranscriptCollectionView *)self needsScrollIntentEnforcementBlock];
  if (!v3
    || ([(CKTranscriptCollectionView *)self isDecelerating] & 1) != 0
    || ([(CKTranscriptCollectionView *)self isScrollAnimating] & 1) != 0
    || ([(CKTranscriptCollectionView *)self isDragging] & 1) != 0)
  {
    goto LABEL_7;
  }
  char v4 = [(CKTranscriptCollectionView *)self isTracking];

  if ((v4 & 1) == 0)
  {
    v3 = [(CKTranscriptCollectionView *)self needsScrollIntentEnforcementBlock];
    dispatch_async(MEMORY[0x1E4F14428], v3);
LABEL_7:
  }
  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptCollectionView;
  [(CKTranscriptCollectionView *)&v5 layoutSubviews];
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 10;
}

- (void)setTranscriptScrollIntent:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t transcriptScrollIntent = self->_transcriptScrollIntent;
  if (transcriptScrollIntent != a3)
  {
    v6 = CKDebugNameForCKTranscriptScrollIntent(transcriptScrollIntent);
    int v7 = CKDebugNameForCKTranscriptScrollIntent(a3);
    v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138543618;
      v11 = v6;
      __int16 v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Transcript scroll intent changing from %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);
    }

    self->_unint64_t transcriptScrollIntent = a3;
    if (a3 != 2)
    {
      highlightedMessageScrollContext = self->_highlightedMessageScrollContext;
      self->_highlightedMessageScrollContext = 0;
    }
  }
}

- (void)enforceTranscriptScrollIntentWithAnimationProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptCollectionView *)self delegate];
  [v5 transcriptCollectionViewNeedsScrollIntentEnforced:self withAnimationProperties:v4];
}

- (void)setNeedsScrollIntentEnforced
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "setNeedsScrollIntentEnforced, already has an enforcement scheduled.", v2, v3, v4, v5, v6);
}

void __58__CKTranscriptCollectionView_setNeedsScrollIntentEnforced__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__CKTranscriptCollectionView_setNeedsScrollIntentEnforced__block_invoke_cold_2();
  }

  if (WeakRetained)
  {
    [WeakRetained setNeedsScrollIntentEnforcementBlock:0];
    uint64_t v3 = +[CKScrollViewAnimationProperties inheritedAnimation];
    [WeakRetained enforceTranscriptScrollIntentWithAnimationProperties:v3];
  }
  else
  {
    uint64_t v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __58__CKTranscriptCollectionView_setNeedsScrollIntentEnforced__block_invoke_cold_1();
    }
  }
}

- (void)setNeedsContentOffsetAdjustmentForNextContentSizeChange
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "setNeedsContentOffsetAdjustmentForNextContentSizeChange", v4, 2u);
    }
  }
  [(CKTranscriptCollectionView *)self setAdjustContentOffsetForContentSizeChangeIfNeeded:1];
}

- (void)invalidateNeedsContentOffsetAdjustmentForNextContentSizeChange
{
  if ([(CKTranscriptCollectionView *)self adjustContentOffsetForContentSizeChangeIfNeeded])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "invalidateNeedsContentOffsetAdjustmentForNextContentSizeChange -- Not previously invalidated", v4, 2u);
      }
    }
    [(CKTranscriptCollectionView *)self setAdjustContentOffsetForContentSizeChangeIfNeeded:0];
    [(CKTranscriptCollectionView *)self setInsertScrollDelta:0.0];
  }
}

- (void)beginHoldingContentOffsetUpdatesForReason:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSCountedSet *)a3;
  uint64_t v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543362;
    v13 = v4;
    _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "DISABLE: Content Offset changes for Reason: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  [(NSCountedSet *)self->_contentOffsetDisabledReasons addObject:v4];
  unint64_t v6 = [(NSCountedSet *)self->_contentOffsetDisabledReasons count];
  int v7 = IMLogHandleForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6 < 2)
  {
    if (v8)
    {
      contentOffsetDisabledReasons = self->_contentOffsetDisabledReasons;
      int v12 = 138543362;
      v13 = contentOffsetDisabledReasons;
      int v10 = "Content Offset changes are now disabled for one reason: %{public}@";
      goto LABEL_8;
    }
  }
  else if (v8)
  {
    v9 = self->_contentOffsetDisabledReasons;
    int v12 = 138543362;
    v13 = v9;
    int v10 = "Content Offset changes are now disabled for multiple reasons: %{public}@";
LABEL_8:
    _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v12, 0xCu);
  }
}

- (void)endHoldingContentOffsetUpdatesForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSCountedSet *)a3;
  uint64_t v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543362;
    uint64_t v14 = v4;
    _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "ENABLE: Content Offset changes for Reason: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  [(NSCountedSet *)self->_contentOffsetDisabledReasons removeObject:v4];
  uint64_t v6 = [(NSCountedSet *)self->_contentOffsetDisabledReasons count];
  int v7 = IMLogHandleForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      contentOffsetDisabledReasons = self->_contentOffsetDisabledReasons;
      int v13 = 138543362;
      uint64_t v14 = contentOffsetDisabledReasons;
      int v10 = "Content Offset changes are still disabled for reasons: %{public}@";
      v11 = v7;
      uint32_t v12 = 12;
LABEL_8:
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, v12);
    }
  }
  else if (v8)
  {
    LOWORD(v13) = 0;
    int v10 = "Content Offset changes are now enabled";
    v11 = v7;
    uint32_t v12 = 2;
    goto LABEL_8;
  }
}

- (void)endHoldingContentOffsetUpdatesForAllReasons
{
  [(NSCountedSet *)self->_contentOffsetDisabledReasons removeAllObjects];
  uint64_t v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Transcript scroll offset - ended holding updates ALL keys", v3, 2u);
  }
}

- (BOOL)isHoldingContentOffsetUpdates
{
  return ![(CKTranscriptCollectionView *)self isTemporarilyOverridingContentOffsetRestriction]&& [(NSCountedSet *)self->_contentOffsetDisabledReasons count] != 0;
}

- (void)performContentOffsetUpdateTemporarilyOverridingHoldStatus:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = [(NSCountedSet *)self->_contentOffsetDisabledReasons count];
  uint64_t v6 = IMLogHandleForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    contentOffsetDisabledReasons = self->_contentOffsetDisabledReasons;
    *(_DWORD *)uint32_t v12 = 138543362;
    *(void *)&v12[4] = contentOffsetDisabledReasons;
    v9 = "Transcript scroll offset - temporarily overriding reasons: %{public}@";
    int v10 = v6;
    uint32_t v11 = 12;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_WORD *)uint32_t v12 = 0;
    v9 = "Transcript scroll offset - content offset is not currently disabled";
    int v10 = v6;
    uint32_t v11 = 2;
  }
  _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, v9, v12, v11);
LABEL_7:

  [(CKTranscriptCollectionView *)self setIsTemporarilyOverridingContentOffsetRestriction:1];
  if (v4) {
    v4[2](v4);
  }
  -[CKTranscriptCollectionView setIsTemporarilyOverridingContentOffsetRestriction:](self, "setIsTemporarilyOverridingContentOffsetRestriction:", 0, *(_OWORD *)v12);
}

- (void)__ck_scrollToBottom:(BOOL)a3
{
  if (![(CKTranscriptCollectionView *)self ignoresAutomaticScrollsTowardBottom])
  {
    if (a3)
    {
      [(CKTranscriptCollectionView *)self setTranscriptScrollIntent:6];
      v5.receiver = self;
      v5.super_class = (Class)CKTranscriptCollectionView;
      [(UIScrollView *)&v5 __ck_scrollToBottom:1];
    }
    else
    {
      [(CKTranscriptCollectionView *)self beginDisablingTranscriptDynamicsForReason:@"ScrollToBottom"];
      [(CKTranscriptCollectionView *)self setTranscriptScrollIntent:6];
      v5.receiver = self;
      v5.super_class = (Class)CKTranscriptCollectionView;
      [(UIScrollView *)&v5 __ck_scrollToBottom:0];
      [(CKTranscriptCollectionView *)self endDisablingTranscriptDynamicsForReason:@"ScrollToBottom"];
    }
  }
}

- (void)scrollToBottomWithAnimationProperties:(id)a3
{
  id v4 = a3;
  if (![(CKTranscriptCollectionView *)self ignoresAutomaticScrollsTowardBottom])
  {
    if ([v4 animationType])
    {
      [(UIScrollView *)self __ck_bottomOffset];
      -[CKTranscriptCollectionView setContentOffset:animationProperties:](self, "setContentOffset:animationProperties:", v4);
    }
    else
    {
      [(CKTranscriptCollectionView *)self beginDisablingTranscriptDynamicsForReason:@"ScrollToBottom"];
      [(UIScrollView *)self __ck_bottomOffset];
      -[CKTranscriptCollectionView setContentOffset:animationProperties:](self, "setContentOffset:animationProperties:", v4);
      [(CKTranscriptCollectionView *)self endDisablingTranscriptDynamicsForReason:@"ScrollToBottom"];
    }
  }
}

- (void)scrollToBottomHidingMessageAtIndexPath:(id)a3 animationProperties:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(CKTranscriptCollectionView *)self ignoresAutomaticScrollsTowardBottom])
  {
    uint64_t v7 = [v6 animationType];
    if (v8 || v7)
    {
      [(CKTranscriptCollectionView *)self beginDisablingTranscriptDynamicsForReason:@"ScrollTowardBottomHidingMessage"];
      [(UICollectionView *)self __ck_bottomOffsetHidingIndexPath:v8];
      -[CKTranscriptCollectionView setContentOffset:animationProperties:](self, "setContentOffset:animationProperties:", v6);
      [(CKTranscriptCollectionView *)self endDisablingTranscriptDynamicsForReason:@"ScrollTowardBottomHidingMessage"];
    }
    else
    {
      [(UICollectionView *)self __ck_bottomOffsetHidingIndexPath:0];
      -[CKTranscriptCollectionView setContentOffset:animationProperties:](self, "setContentOffset:animationProperties:", v6);
    }
  }
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if ([(CKTranscriptCollectionView *)self isHoldingContentOffsetUpdates])
  {
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CKTranscriptCollectionView setContentOffset:animated:](x, y);
    }
  }
  else
  {
    [(CKTranscriptCollectionView *)self contentOffset];
    if (v10 == x && v9 == y)
    {
      v18 = IMLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[CKTranscriptCollectionView setContentOffset:animated:](x, y);
      }
    }
    else
    {
      if (v4)
      {
        if (CKMainScreenScale_once_92 != -1) {
          dispatch_once(&CKMainScreenScale_once_92, &__block_literal_global_238);
        }
        double v12 = *(double *)&CKMainScreenScale_sMainScreenScale_92;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_92 == 0.0) {
          double v12 = 1.0;
        }
        double v13 = round(x * v12) / v12;
        double v14 = round(y * v12) / v12;
        [(CKTranscriptCollectionView *)self contentOffset];
        BOOL v17 = v14 != v16 || v13 != v15;
      }
      else
      {
        BOOL v17 = 0;
      }
      v19 = [(CKTranscriptCollectionView *)self delegate];
      [v19 collectionViewWillProgrammaticallyScroll:self animated:v17];

      v20.receiver = self;
      v20.super_class = (Class)CKTranscriptCollectionView;
      -[CKTranscriptCollectionView setContentOffset:animated:](&v20, sel_setContentOffset_animated_, v4, x, y);
    }
  }
}

- (void)setContentOffset:(CGPoint)a3 animationProperties:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  BOOL v8 = [(CKTranscriptCollectionView *)self isHoldingContentOffsetUpdates];
  if (objc_opt_respondsToSelector()) {
    [(CKTranscriptCollectionView *)self _animationTargetContentOffset];
  }
  else {
    [(CKTranscriptCollectionView *)self contentOffset];
  }
  double v11 = v9;
  double v12 = v10;
  BOOL v13 = CKPointApproximatelyEqualToPointWithTolerance(v9, v10, x, y, 0.001);
  if (v8)
  {
    double v14 = IMLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CKTranscriptCollectionView setContentOffset:animationProperties:](x, y);
    }
  }
  else if (v13)
  {
    double v14 = IMLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[CKTranscriptCollectionView setContentOffset:animationProperties:](x, y);
    }
  }
  else
  {
    if (CKMainScreenScale_once_92 != -1) {
      dispatch_once(&CKMainScreenScale_once_92, &__block_literal_global_238);
    }
    double v15 = *(double *)&CKMainScreenScale_sMainScreenScale_92;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_92 == 0.0) {
      double v15 = 1.0;
    }
    BOOL v16 = round(x * v15) / v15 != v11;
    unsigned int v17 = round(y * v15) / v15 != v12 || v16;
    if ([v7 animationType]) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
    double v14 = [(CKTranscriptCollectionView *)self delegate];
    [v14 collectionViewWillProgrammaticallyScroll:self animated:v18];
    uint64_t v19 = [v7 animationType];
    switch(v19)
    {
      case 2:
        v27.receiver = self;
        v27.super_class = (Class)CKTranscriptCollectionView;
        -[CKTranscriptCollectionView setContentOffset:animated:](&v27, sel_setContentOffset_animated_, 1, x, y);
        break;
      case 1:
        objc_super v20 = [v7 caBasicAnimation];
        v21 = self->_transcriptCustomScrollAnimation;
        transcriptCustomScrollAnimation = self->_transcriptCustomScrollAnimation;
        self->_transcriptCustomScrollAnimation = v20;
        v23 = v20;

        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __67__CKTranscriptCollectionView_setContentOffset_animationProperties___block_invoke;
        v26[3] = &unk_1E5625B88;
        *(double *)&v26[5] = x;
        *(double *)&v26[6] = y;
        v26[4] = self;
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:v26];
        v24 = self->_transcriptCustomScrollAnimation;
        self->_transcriptCustomScrollAnimation = v21;
        v25 = v21;

        break;
      case 0:
        v28.receiver = self;
        v28.super_class = (Class)CKTranscriptCollectionView;
        -[CKTranscriptCollectionView setContentOffset:animated:](&v28, sel_setContentOffset_animated_, 0, x, y);
        break;
    }
  }
}

id __67__CKTranscriptCollectionView_setContentOffset_animationProperties___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)CKTranscriptCollectionView;
  return objc_msgSendSuper2(&v2, sel_setContentOffset_animated_, 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CGPoint v15 = a3;
  if ([(CKTranscriptCollectionView *)self isHoldingContentOffsetUpdates])
  {
    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CKTranscriptCollectionView setContentOffset:](x, y);
    }
  }
  else
  {
    [(CKTranscriptCollectionView *)self contentOffset];
    if (v8 != x || v7 != y)
    {
      if ([(CKTranscriptCollectionView *)self adjustContentOffsetForContentSizeChangeIfNeeded])
      {
        [(CKTranscriptCollectionView *)self contentOffset];
        double v11 = y - v10;
        if (v11 > 0.0)
        {
          if (IMOSLoggingEnabled())
          {
            double v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              double v17 = v11;
              _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "adjustContentOffsetForContentSizeChangeIfNeeded flag set, stashing scroll delta %.2f", buf, 0xCu);
            }
          }
          [(CKTranscriptCollectionView *)self setInsertScrollDelta:v11];
        }
      }
      BOOL v13 = [(CKTranscriptCollectionView *)self delegate];
      [v13 collectionViewWillScroll:self targetContentOffset:&v15];

      v14.receiver = self;
      v14.super_class = (Class)CKTranscriptCollectionView;
      -[CKTranscriptCollectionView setContentOffset:](&v14, sel_setContentOffset_, v15.x, v15.y);
    }
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  UIEdgeInsets v18 = a3;
  [(CKTranscriptCollectionView *)self contentInset];
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    CGPoint v15 = [(CKTranscriptCollectionView *)self delegate];
    [v15 collectionViewWillInset:self targetContentInset:&v18];

    [(CKTranscriptCollectionView *)self _setAutomaticContentOffsetAdjustmentEnabled:0];
    v17.receiver = self;
    v17.super_class = (Class)CKTranscriptCollectionView;
    -[CKTranscriptCollectionView setContentInset:](&v17, sel_setContentInset_, v18.top, v18.left, v18.bottom, v18.right);
    -[CKTranscriptCollectionView setScrollIndicatorInsets:](self, "setScrollIndicatorInsets:", v18.top, v18.left, v18.bottom, v18.right);
    BOOL v16 = [(CKTranscriptCollectionView *)self delegate];
    [v16 collectionViewDidInset:self];
  }
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(CKTranscriptCollectionView *)self contentSize];
  if (v7 != width || v6 != height)
  {
    [(CKTranscriptCollectionView *)self contentSize];
    double v10 = v9;
    v20.receiver = self;
    v20.super_class = (Class)CKTranscriptCollectionView;
    -[CKTranscriptCollectionView setContentSize:](&v20, sel_setContentSize_, width, height);
    if ([(CKTranscriptCollectionView *)self adjustContentOffsetForContentSizeChangeIfNeeded])
    {
      [(CKTranscriptCollectionView *)self contentOffset];
      double v12 = v11;
      double v14 = v13;
      [(CKTranscriptCollectionView *)self insertScrollDelta];
      double v15 = height - v10;
      if (v16 != 0.0 && v15 < 0.0)
      {
        [(CKTranscriptCollectionView *)self insertScrollDelta];
        double v15 = v15 + v17;
        if (IMOSLoggingEnabled())
        {
          UIEdgeInsets v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            double v22 = v15;
            _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "setContentSize: insert op using stashed insert scroll delta to adjust to %.2f", buf, 0xCu);
          }
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          double v22 = v15;
          _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "setContentSize: insert op adjusting contentOffset y by %.2f", buf, 0xCu);
        }
      }
      -[CKTranscriptCollectionView setContentOffset:](self, "setContentOffset:", v12, v14 + v15);
      [(CKTranscriptCollectionView *)self invalidateNeedsContentOffsetAdjustmentForNextContentSizeChange];
    }
  }
}

- (id)_customScrollAnimation
{
  return self->_transcriptCustomScrollAnimation;
}

- (CGRect)targetFrameForItemAtIndexPath:(id)a3
{
  uint64_t v3 = [(CKTranscriptCollectionView *)self layoutAttributesForItemAtIndexPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = v3[44];
    double v5 = v3[45];
    double v6 = v3[46];
    double v7 = v3[47];
  }
  else
  {
    [v3 frame];
    double v4 = v8;
    double v5 = v9;
    double v6 = v10;
    double v7 = v11;
  }

  double v12 = v4;
  double v13 = v5;
  double v14 = v6;
  double v15 = v7;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)reloadData
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_ignoresReloadDataRequests)
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        int v6 = 136315138;
        double v7 = "-[CKTranscriptCollectionView reloadData]";
        _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%s IGNORING RELOAD DATA CALL", (uint8_t *)&v6, 0xCu);
      }
    }
  }
  else
  {
    if ((IMEnableModernTranscript() & 1) == 0)
    {
      double v4 = [(CKTranscriptCollectionView *)self collectionViewLayout];
      [v4 reloadData];
    }
    v5.receiver = self;
    v5.super_class = (Class)CKTranscriptCollectionView;
    [(CKTranscriptCollectionView *)&v5 reloadData];
  }
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptCollectionView;
  int v6 = -[CKTranscriptCollectionView indexPathForItemAtPoint:](&v12, sel_indexPathForItemAtPoint_);
  if ([v6 section] != 1)
  {
LABEL_10:
    id v9 = v6;
    goto LABEL_11;
  }
  double v7 = [(CKTranscriptCollectionView *)self delegate];
  uint64_t v8 = objc_msgSend(v7, "transcriptCollectionView:preferredIndexPathForAssociatedItemAtPoint:", self, x, y);
  id v9 = v8;
  if (!v8 || [v8 item] == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v9, "section") == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (IMOSLoggingEnabled())
    {
      double v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        double v14 = "-[CKTranscriptCollectionView indexPathForItemAtPoint:]";
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "%s: Did not find preferredIndexPath for associatedItem", buf, 0xCu);
      }
    }
    goto LABEL_10;
  }

LABEL_11:

  return v9;
}

- (id)indexPathForItemAtPoint:(CGPoint)a3 inSection:(int64_t)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [(CKTranscriptCollectionView *)self indexPathsForVisibleItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v13 section] == a4)
        {
          double v14 = [(CKTranscriptCollectionView *)self layoutAttributesForItemAtIndexPath:v13];
          [v14 frame];
          v24.CGFloat x = x;
          v24.CGFloat y = y;
          if (CGRectContainsPoint(v25, v24))
          {
            id v15 = v13;

            goto LABEL_13;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_13:

  return v15;
}

- (void)beginDisablingTranscriptDynamicsForReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v4 = (NSCountedSet *)a3;
  objc_super v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    uint64_t v9 = v4;
    _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Beginning Disabling Transcript Dynamics for Reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [(NSCountedSet *)self->_transcriptDynamicsDisabledReasons addObject:v4];
  if ((unint64_t)[(NSCountedSet *)self->_transcriptDynamicsDisabledReasons count] >= 2)
  {
    int v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      transcriptDynamicsDisabledReasons = self->_transcriptDynamicsDisabledReasons;
      int v8 = 138543362;
      uint64_t v9 = transcriptDynamicsDisabledReasons;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Transcript Dynamics are now disabled for multiple reasons: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)endDisablingTranscriptDynamicsForReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v4 = (NSCountedSet *)a3;
  objc_super v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    uint64_t v9 = v4;
    _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Ending Disabling Transcript Dynamics for Reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [(NSCountedSet *)self->_transcriptDynamicsDisabledReasons removeObject:v4];
  if ([(NSCountedSet *)self->_transcriptDynamicsDisabledReasons count])
  {
    int v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      transcriptDynamicsDisabledReasons = self->_transcriptDynamicsDisabledReasons;
      int v8 = 138543362;
      uint64_t v9 = transcriptDynamicsDisabledReasons;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Transcript Dynamics are still disabled for reasons: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (BOOL)dynamicsDisabled
{
  return [(NSCountedSet *)self->_transcriptDynamicsDisabledReasons count] != 0;
}

- (void)swipeToReplyGestureHandler:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 state];
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 2)
    {
      int v8 = [(CKTranscriptCollectionView *)self swipeTargetBalloonCell];
      [v8 swipeToReplyGestureHandler:v9];

      [(CKTranscriptCollectionView *)self _updateScrollingLockStateForRecognizer:v9];
    }
    else if (v4 == 1)
    {
      int v6 = +[CKSwipeToReplyRules balloonCellFromGestureRecognizer:v9 inTranscriptCollectionView:self];
      if (v6) {
        [(CKTranscriptCollectionView *)self setSwipeTargetBalloonCell:v6];
      }
      double v7 = [(CKTranscriptCollectionView *)self swipeTargetBalloonCell];
      [v7 swipeToReplyGestureHandler:v9];
    }
  }
  else
  {
    objc_super v5 = [(CKTranscriptCollectionView *)self swipeTargetBalloonCell];
    [v5 swipeToReplyGestureHandler:v9];

    [(CKTranscriptCollectionView *)self _updateScrollingLockStateForRecognizer:v9];
    [(CKTranscriptCollectionView *)self setSwipeTargetBalloonCell:0];
  }
}

- (void)_updateScrollingLockStateForRecognizer:(id)a3
{
  id v11 = a3;
  if ([v11 state] == 4
    || [v11 state] == 5
    || [v11 state] == 3
    || ([(CKTranscriptCollectionView *)self swipeTargetBalloonCell],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    BOOL v10 = 1;
    id v9 = v11;
  }
  else
  {
    objc_super v5 = [(CKTranscriptCollectionView *)self swipeTargetBalloonCell];
    int v6 = [v5 contentView];
    [v11 translationInView:v6];
    double v8 = v7;

    id v9 = v11;
    BOOL v10 = v8 <= 0.0;
  }
  [v9 _setCanPanVertically:v10];
}

- (BOOL)ignoresReloadDataRequests
{
  return self->_ignoresReloadDataRequests;
}

- (void)setIgnoresReloadDataRequests:(BOOL)a3
{
  self->_ignoresReloadDataRequests = a3;
}

- (BOOL)ignoresAutomaticScrollsTowardBottom
{
  return self->_ignoresAutomaticScrollsTowardBottom;
}

- (void)setIgnoresAutomaticScrollsTowardBottom:(BOOL)a3
{
  self->_ignoresAutomaticScrollsTowardBottom = a3;
}

- (int64_t)transcriptScrollIntent
{
  return self->_transcriptScrollIntent;
}

- (CKTranscriptHighlightedMessageScrollContext)highlightedMessageScrollContext
{
  return self->_highlightedMessageScrollContext;
}

- (void)setHighlightedMessageScrollContext:(id)a3
{
}

- (CABasicAnimation)transcriptCustomScrollAnimation
{
  return self->_transcriptCustomScrollAnimation;
}

- (void)setTranscriptCustomScrollAnimation:(id)a3
{
}

- (CKTranscriptBalloonCell)swipeTargetBalloonCell
{
  return self->_swipeTargetBalloonCell;
}

- (void)setSwipeTargetBalloonCell:(id)a3
{
}

- (NSCountedSet)transcriptDynamicsDisabledReasons
{
  return self->_transcriptDynamicsDisabledReasons;
}

- (void)setTranscriptDynamicsDisabledReasons:(id)a3
{
}

- (NSCountedSet)contentOffsetDisabledReasons
{
  return self->_contentOffsetDisabledReasons;
}

- (void)setContentOffsetDisabledReasons:(id)a3
{
}

- (BOOL)isTemporarilyOverridingContentOffsetRestriction
{
  return self->_isTemporarilyOverridingContentOffsetRestriction;
}

- (void)setIsTemporarilyOverridingContentOffsetRestriction:(BOOL)a3
{
  self->_isTemporarilyOverridingContentOffsetRestriction = a3;
}

- (id)needsScrollIntentEnforcementBlock
{
  return self->_needsScrollIntentEnforcementBlock;
}

- (void)setNeedsScrollIntentEnforcementBlock:(id)a3
{
}

- (BOOL)adjustContentOffsetForContentSizeChangeIfNeeded
{
  return self->_adjustContentOffsetForContentSizeChangeIfNeeded;
}

- (void)setAdjustContentOffsetForContentSizeChangeIfNeeded:(BOOL)a3
{
  self->_adjustContentOffsetForContentSizeChangeIfNeeded = a3;
}

- (double)insertScrollDelta
{
  return self->_insertScrollDelta;
}

- (void)setInsertScrollDelta:(double)a3
{
  self->_insertScrollDelta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_needsScrollIntentEnforcementBlock, 0);
  objc_storeStrong((id *)&self->_contentOffsetDisabledReasons, 0);
  objc_storeStrong((id *)&self->_transcriptDynamicsDisabledReasons, 0);
  objc_storeStrong((id *)&self->_swipeTargetBalloonCell, 0);
  objc_storeStrong((id *)&self->_transcriptCustomScrollAnimation, 0);

  objc_storeStrong((id *)&self->_highlightedMessageScrollContext, 0);
}

- (void)configureAppEntityForConversationId:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922B8B0);
  MEMORY[0x1F4188790](v5 - 8);
  double v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_18F7B5780();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v12 = sub_18F7B97E0();
    uint64_t v14 = v13;
    type metadata accessor for ConversationEntity();
    v16[0] = v12;
    v16[1] = v14;
    sub_18EF2C80C();
    id v15 = self;
    sub_18F7B6CA0();
    sub_18F7B5770();
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v7, v11, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    sub_18F7B9F50();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

    swift_bridgeObjectRelease();
  }
}

void __58__CKTranscriptCollectionView_setNeedsScrollIntentEnforced__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "Can't enforce transcriptScrollIntent, lost reference to self.", v2, v3, v4, v5, v6);
}

void __58__CKTranscriptCollectionView_setNeedsScrollIntentEnforced__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "Enforcing transcriptScrollIntent", v2, v3, v4, v5, v6);
}

- (void)setContentOffset:(double)a1 animated:(double)a2 .cold.1(double a1, double a2)
{
  uint64_t v2 = NSStringFromCGPoint(*(CGPoint *)&a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_18EF18000, v3, v4, "not scrolling %@", v5, v6, v7, v8, v9);
}

- (void)setContentOffset:(double)a1 animated:(double)a2 .cold.2(double a1, double a2)
{
  uint64_t v2 = NSStringFromCGPoint(*(CGPoint *)&a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_2(&dword_18EF18000, v3, v4, "not scrolling to %@ (animated: %@) because we're already at that point.", v5, v6, v7, v8, v9);
}

- (void)setContentOffset:(double)a1 animationProperties:(double)a2 .cold.1(double a1, double a2)
{
  uint64_t v2 = NSStringFromCGPoint(*(CGPoint *)&a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_18EF18000, v3, v4, "Not scrolling to %@ due to hold on content offset changes.", v5, v6, v7, v8, v9);
}

- (void)setContentOffset:(double)a1 animationProperties:(double)a2 .cold.2(double a1, double a2)
{
  uint64_t v2 = NSStringFromCGPoint(*(CGPoint *)&a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_2(&dword_18EF18000, v3, v4, "Not scrolling to %@ (animation: %@) because we're already at or targeting that content offset.", v5, v6, v7, v8, v9);
}

- (void)setContentOffset:(double)a1 .cold.1(double a1, double a2)
{
  uint64_t v2 = NSStringFromCGPoint(*(CGPoint *)&a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_18EF18000, v3, v4, "not scrolling %@", v5, v6, v7, v8, v9);
}

@end