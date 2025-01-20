@interface CKThrowAnimationManager
- (BOOL)_transcriptWillShiftDueToThrowAnimation;
- (CGPoint)_sendMessageAndCalculateDesiredTranscriptOffset;
- (CGRect)audioMessageSourceRect;
- (CGRect)sourceRect;
- (CKChatControllerDummyAnimator)animator;
- (CKSendAnimationBalloonProvider)sendAnimationBalloonProvider;
- (CKSendAnimationContext)currentContext;
- (CKSendAnimationManagerDelegate)sendAnimationManagerDelegate;
- (CKThrowAnimationManager)init;
- (CKThrowAnimationManagerDelegate)throwManagerDelegate;
- (CKTranscriptLabelCell)fakeKeyTransparencyCell;
- (CKTranscriptNotifyAnywayButtonCell)fakeNotifyAnywayButtonCell;
- (CKTranscriptTypingIndicatorCell)fakeTypingIndicatorCell;
- (CKTranscriptUnavailabilityIndicatorCell)fakeUnavailabilityIndicatorCell;
- (UIImageView)audioRecordingPillViewSnapshot;
- (UIView)quickReplySnapshot;
- (UIView)sendAnimationWindow;
- (double)_changeInEntryViewHeight;
- (double)scrollViewOffsetForBottomAligningChatItemAtIndex:(int64_t)a3;
- (id)_collectionViewController;
- (id)_entryView;
- (id)lastVisibleCellOfType:(Class)a3 inCollectionView:(id)a4;
- (int64_t)_indexOfLastChatItemThatWillNotStickToTheBottom:(id)a3;
- (unint64_t)_indexOfLastVisibleChatItemForChatItems:(id)a3;
- (void)_hideAddedChatItems;
- (void)_prepareToAnimateMessages:(id)a3;
- (void)_removeAllAnimations;
- (void)_removeFakeTypingIndicatorIfNecessary;
- (void)_setupThrowBalloonViews;
- (void)_setupThrowFrames;
- (void)_snapshotLiveBubbleIfNecessary;
- (void)animateMessages:(id)a3;
- (void)animateQuickReplyMessages:(id)a3;
- (void)animationDidFinishWithContext:(id)a3;
- (void)animationWillBeginWithContext:(id)a3;
- (void)setAnimator:(id)a3;
- (void)setAudioMessageSourceRect:(CGRect)a3;
- (void)setAudioRecordingPillViewSnapshot:(id)a3;
- (void)setCurrentContext:(id)a3;
- (void)setFakeKeyTransparencyCell:(id)a3;
- (void)setFakeNotifyAnywayButtonCell:(id)a3;
- (void)setFakeTypingIndicatorCell:(id)a3;
- (void)setFakeUnavailabilityIndicatorCell:(id)a3;
- (void)setQuickReplySnapshot:(id)a3;
- (void)setSendAnimationBalloonProvider:(id)a3;
- (void)setSendAnimationManagerDelegate:(id)a3;
- (void)setSendAnimationWindow:(id)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setThrowManagerDelegate:(id)a3;
@end

@implementation CKThrowAnimationManager

void __74__CKThrowAnimationManager__sendMessageAndCalculateDesiredTranscriptOffset__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)_setupThrowFrames
{
  v3 = [(CKThrowAnimationManager *)self currentContext];
  int v56 = [v3 shouldUseQuickReplySourceRect];

  v4 = [(CKThrowAnimationManager *)self _collectionViewController];
  v5 = [v4 collectionView];
  v54 = [(CKThrowAnimationManager *)self _entryView];
  v53 = [(CKThrowAnimationManager *)self sendAnimationWindow];
  v6 = [(CKThrowAnimationManager *)self throwManagerDelegate];
  v52 = v5;
  [v5 marginInsets];
  uint64_t v50 = v8;
  uint64_t v51 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  v13 = [(CKThrowAnimationManager *)self currentContext];
  v14 = [v4 chatItems];
  v55 = v13;
  v15 = [v13 messages];
  v16 = objc_msgSend(v14, "__ck_indexesOfPartsOfMessages:", v15);
  unint64_t v17 = [v16 lastIndex];
  uint64_t v18 = [v14 count];
  v19 = [v4 latestScheduledMessageIndexPath];
  v49 = v15;
  v20 = [v15 firstObject];
  uint64_t v21 = [v20 scheduleType];

  if (v21 == 2 || !v19)
  {
    if (v17 >= v18 - 1) {
      unint64_t v17 = v18 - 1;
    }
    uint64_t v22 = [v14 count] - 1;
  }
  else
  {
    unint64_t v17 = objc_msgSend(v19, "indexAtPosition:", objc_msgSend(v19, "length") - 1);
    uint64_t v22 = v17;
  }
  [(CKThrowAnimationManager *)self scrollViewOffsetForBottomAligningChatItemAtIndex:v22];
  double v24 = v23;
  [(CKThrowAnimationManager *)self scrollViewOffsetForBottomAligningChatItemAtIndex:v17];
  double v26 = v25;
  v27 = [v14 lastObject];
  +[CKTranscriptCompositionalLayout bottomTranscriptSpaceWithLastChatItem:v27];
  double v29 = v28;
  v30 = +[CKUIBehavior sharedBehaviors];
  if ([v30 isEntryViewInputAccessory]) {
    [v6 throwAnimationKeyboardFrame:self];
  }
  else {
    [v54 frame];
  }
  double MinY = CGRectGetMinY(*(CGRect *)&v31);

  [v6 throwAnimationManagerTopHeaderHeight:self];
  double v37 = v36;
  [v6 throwAnimationFinalFrameOffset:self];
  uint64_t v39 = v38;
  uint64_t v73 = 0;
  v74 = (double *)&v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 0;
  int v40 = [(CKThrowAnimationManager *)self _transcriptWillShiftDueToThrowAnimation] & (v56 ^ 1);
  double v41 = MinY - (v26 + v37);
  if (v40 == 1) {
    double v41 = v24 - v26 + v29 + MinY;
  }
  v74[3] = v41;
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __44__CKThrowAnimationManager__setupThrowFrames__block_invoke;
  v57[3] = &unk_1E562C038;
  id v43 = v52;
  id v58 = v43;
  id v44 = v4;
  uint64_t v66 = v51;
  uint64_t v67 = v50;
  uint64_t v68 = v10;
  uint64_t v69 = v12;
  id v59 = v44;
  v60 = self;
  char v71 = v40;
  id v45 = v6;
  id v61 = v45;
  id v46 = v54;
  id v62 = v46;
  char v72 = v56;
  id v47 = v42;
  id v63 = v47;
  v65 = &v73;
  uint64_t v70 = v39;
  id v48 = v53;
  id v64 = v48;
  [v14 enumerateObjectsAtIndexes:v16 options:2 usingBlock:v57];
  [v55 setFramesOfAddedChatItems:v47];

  _Block_object_dispose(&v73, 8);
}

- (CGPoint)_sendMessageAndCalculateDesiredTranscriptOffset
{
  v3 = [(CKThrowAnimationManager *)self _collectionViewController];
  v4 = [v3 collectionView];
  v5 = [v3 chatItems];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  double v36 = __Block_byref_object_copy__72;
  double v37 = __Block_byref_object_dispose__72;
  id v38 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __74__CKThrowAnimationManager__sendMessageAndCalculateDesiredTranscriptOffset__block_invoke;
  v28[3] = &unk_1E56271D0;
  v28[4] = &v33;
  v28[5] = &v29;
  [v5 enumerateObjectsWithOptions:2 usingBlock:v28];

  uint64_t v6 = v30[3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:0];
    uint64_t v9 = [v4 layoutAttributesForItemAtIndexPath:v8];
    [v9 frame];
    double v7 = v10;
  }
  [v4 contentOffset];
  double v12 = v11;
  double v14 = v13;
  v15 = [(CKThrowAnimationManager *)self throwManagerDelegate];
  v16 = [(CKThrowAnimationManager *)self currentContext];
  unint64_t v17 = [v16 messages];
  [v15 throwAnimationManager:self canNowSendMessages:v17];

  uint64_t v18 = [v3 chatItems];
  uint64_t v19 = [v18 indexOfObject:v34[5]];
  v30[3] = v19;
  v20 = (void *)v34[5];
  v34[5] = 0;

  uint64_t v21 = v30[3];
  double v22 = v7;
  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v23 = [MEMORY[0x1E4F28D58] indexPathForItem:v21 inSection:0];
    double v24 = [v4 layoutAttributesForItemAtIndexPath:v23];
    [v24 frame];
    double v22 = v25;
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  double v26 = v12;
  double v27 = v14 + v22 - v7;
  result.y = v27;
  result.x = v26;
  return result;
}

- (CKThrowAnimationManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKThrowAnimationManager;
  v2 = [(CKThrowAnimationManager *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(CKChatControllerDummyAnimator);
    [(CKChatControllerDummyAnimator *)v3 setAnimationDelegate:v2];
    [(CKThrowAnimationManager *)v2 setAnimator:v3];
  }
  return v2;
}

- (void)animationDidFinishWithContext:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F43058] _synchronizeDrawing];
  objc_super v5 = [(CKThrowAnimationManager *)self _collectionViewController];
  [v5 setHiddenItems:0];

  uint64_t v6 = [(CKThrowAnimationManager *)self fakeUnavailabilityIndicatorCell];
  [v6 removeFromSuperview];

  [(CKThrowAnimationManager *)self setFakeUnavailabilityIndicatorCell:0];
  double v7 = [(CKThrowAnimationManager *)self fakeNotifyAnywayButtonCell];
  [v7 removeFromSuperview];

  [(CKThrowAnimationManager *)self setFakeNotifyAnywayButtonCell:0];
  uint64_t v8 = [(CKThrowAnimationManager *)self fakeKeyTransparencyCell];
  [v8 removeFromSuperview];

  [(CKThrowAnimationManager *)self setFakeKeyTransparencyCell:0];
  uint64_t v9 = (void *)MEMORY[0x1E4F39CF8];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __57__CKThrowAnimationManager_animationDidFinishWithContext___block_invoke;
  double v14 = &unk_1E5620AF8;
  v15 = self;
  id v16 = v4;
  id v10 = v4;
  [v9 setCompletionBlock:&v11];
  objc_msgSend(MEMORY[0x1E4F39CF8], "commit", v11, v12, v13, v14, v15);
  [MEMORY[0x1E4F39CF8] flush];
}

void __57__CKThrowAnimationManager_animationDidFinishWithContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sendAnimationWindow];
  [v2 removeFromSuperview];

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = 0;

  [*(id *)(a1 + 32) _removeAllAnimations];
  objc_super v5 = [*(id *)(a1 + 32) fakeTypingIndicatorCell];
  [v5 removeFromSuperview];

  [*(id *)(a1 + 32) setFakeTypingIndicatorCell:0];
  uint64_t v6 = [*(id *)(a1 + 32) sendAnimationManagerDelegate];
  [v6 sendAnimationManagerDidStopAnimation:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];

  id v7 = [NSString stringWithFormat:@"%@-LiveBubbleSendAnimation", @"ShelfIdentifier"];
  +[CKSnapshotUtilities _cacheSnapshotView:0 forGUID:v7];
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CKThrowAnimationManager *)self sendAnimationManagerDelegate];
  [v5 sendAnimationManagerWillStartAnimation:self context:v4];
}

- (void)_prepareToAnimateMessages:(id)a3
{
  id v4 = a3;
  id v10 = objc_alloc_init(CKSendAnimationContext);
  [(CKSendAnimationContext *)v10 setMessages:v4];

  id v5 = [(CKThrowAnimationManager *)self sendAnimationWindow];
  [(CKSendAnimationContext *)v10 setContainerView:v5];

  [(CKThrowAnimationManager *)self sourceRect];
  -[CKSendAnimationContext setQuickReplySourceRect:](v10, "setQuickReplySourceRect:");
  [(CKThrowAnimationManager *)self setCurrentContext:v10];
  uint64_t v6 = [(CKThrowAnimationManager *)self throwManagerDelegate];
  [v6 throwAnimationManagerPrepareForThrowAnimation:self context:v10];
  [(CKThrowAnimationManager *)self _snapshotLiveBubbleIfNecessary];
  [(CKThrowAnimationManager *)self _sendMessageAndCalculateDesiredTranscriptOffset];
  [(CKThrowAnimationManager *)self _removeFakeTypingIndicatorIfNecessary];
  [(CKThrowAnimationManager *)self _setupThrowBalloonViews];
  [(CKThrowAnimationManager *)self _setupThrowFrames];
  id v7 = [(CKThrowAnimationManager *)self _entryView];
  [v7 invalidateCompositionForReason:1];

  uint64_t v8 = [(CKThrowAnimationManager *)self _entryView];
  [v8 clearAudioRecordingUI];

  uint64_t v9 = [(CKThrowAnimationManager *)self sendAnimationWindow];
  [v9 setHidden:0];

  [(CKThrowAnimationManager *)self _hideAddedChatItems];
}

- (void)animateMessages:(id)a3
{
  id v4 = a3;
  id v5 = [(CKThrowAnimationManager *)self _collectionViewController];
  id v8 = [v5 collectionView];

  [v8 setTranscriptScrollIntent:3];
  [(CKThrowAnimationManager *)self _prepareToAnimateMessages:v4];

  uint64_t v6 = [(CKThrowAnimationManager *)self animator];
  id v7 = [(CKThrowAnimationManager *)self currentContext];
  [v6 beginAnimationWithSendAnimationContext:v7];
}

- (void)animateQuickReplyMessages:(id)a3
{
  [(CKThrowAnimationManager *)self _prepareToAnimateMessages:a3];
  id v5 = [(CKThrowAnimationManager *)self animator];
  id v4 = [(CKThrowAnimationManager *)self currentContext];
  [v5 beginQuickReplyAnimationWithSendAnimationContext:v4];
}

- (UIView)sendAnimationWindow
{
  if (!self->_sendAnimationWindow)
  {
    uint64_t v3 = +[CKUIBehavior sharedBehaviors];
    int v4 = [v3 canUseWindowedSendAnimation];

    id v5 = [(CKThrowAnimationManager *)self throwManagerDelegate];
    uint64_t v6 = [v5 throwAnimationManagerEntryView:self];

    if (v4)
    {
      id v7 = [CKSendAnimationWindow alloc];
      id v8 = [v6 window];
      uint64_t v9 = [v8 windowScene];
      id v10 = [(CKThrowAnimationManager *)self throwManagerDelegate];
      [v10 throwAnimationWindowFrame:self];
      uint64_t v11 = -[CKSendAnimationWindow initWithWindowScene:frame:](v7, "initWithWindowScene:frame:", v9);

      [(UIView *)v11 setUserInteractionEnabled:0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_sendAnimationBalloonProvider);
      LODWORD(v8) = [WeakRetained wantsOverKeyboardAnimationForSendAnimationContext:self->_currentContext];

      double v13 = -1.0;
      if (v8) {
        double v13 = 2.0;
      }
      [(UIView *)v11 setWindowLevel:*MEMORY[0x1E4F43C70] + v13];
      sendAnimationWindow = self->_sendAnimationWindow;
      self->_sendAnimationWindow = v11;
    }
    else
    {
      v15 = [v6 window];
      id v16 = [v15 windowScene];
      unint64_t v17 = [v16 screen];
      [v17 bounds];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;

      double v26 = -[CKSendAnimationContainerView initWithFrame:]([CKSendAnimationContainerView alloc], "initWithFrame:", v19, v21, v23, v25);
      [(CKSendAnimationContainerView *)v26 setUserInteractionEnabled:0];
      double v27 = [(CKThrowAnimationManager *)self throwManagerDelegate];
      sendAnimationWindow = [v27 throwAnimationContainerSuperview:self];

      [sendAnimationWindow addSubview:v26];
      double v28 = self->_sendAnimationWindow;
      self->_sendAnimationWindow = &v26->super;
    }
  }
  uint64_t v29 = self->_sendAnimationWindow;

  return v29;
}

- (id)_collectionViewController
{
  uint64_t v3 = [(CKThrowAnimationManager *)self sendAnimationManagerDelegate];
  int v4 = [v3 collectionViewControllerForImpactEffectManager:self];

  return v4;
}

- (id)_entryView
{
  uint64_t v3 = [(CKThrowAnimationManager *)self throwManagerDelegate];
  int v4 = [v3 throwAnimationManagerEntryView:self];

  return v4;
}

- (void)_snapshotLiveBubbleIfNecessary
{
  id v7 = [NSString stringWithFormat:@"%@-LiveBubbleSendAnimation", @"ShelfIdentifier"];
  uint64_t v3 = [(CKThrowAnimationManager *)self _entryView];
  int v4 = [v3 contentView];
  id v5 = [v4 pluginView];
  uint64_t v6 = [v5 snapshotViewAfterScreenUpdates:0];

  +[CKSnapshotUtilities _cacheSnapshotView:v6 forGUID:v7];
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
}

- (unint64_t)_indexOfLastVisibleChatItemForChatItems:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    unint64_t v4 = [v3 count] - 1;
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

void __44__CKThrowAnimationManager__setupThrowFrames__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  id v7 = (objc_class *)[v5 cellClass];
  id v8 = [*(id *)(a1 + 32) collectionViewLayout];
  uint64_t v9 = [v8 layoutAttributesForItemAtIndexPath:v6];

  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  id v16 = objc_msgSend([v7 alloc], "initWithFrame:", v10, v12, v14, v15);
  [v16 applyLayoutAttributes:v9];
  [*(id *)(a1 + 40) configureCell:v16 forCKChatItem:v5 atIndexPath:v6 animated:0 animationDuration:3 animationCurve:0.0];
  [v16 setNeedsLayout];
  [v16 layoutIfNeeded];
  objc_opt_class();
  double v82 = v13;
  double v17 = v11;
  if (objc_opt_isKindOfClass())
  {
    id v18 = [v16 balloonView];
  }
  else
  {
    id v18 = v16;
  }
  double v19 = v18;
  [v18 frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [v9 bounds];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  [v5 contentInsets];
  double v35 = v34 + *(double *)(a1 + 96);
  double v37 = v36 + *(double *)(a1 + 104);
  double v39 = v38 + *(double *)(a1 + 112);
  v85.origin.x = v27 + v37;
  v85.origin.y = v29 + v35;
  v85.size.width = v31 - (v37 + v40 + *(double *)(a1 + 120));
  v85.size.height = v33 - (v35 + v39);
  double MaxX = CGRectGetMaxX(v85);
  [v19 frame];
  double v43 = MaxX - v42;
  id v44 = [v19 superview];
  objc_msgSend(v16, "convertRect:fromView:", v44, v43, v21, v23, v25);
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;

  v53 = [*(id *)(a1 + 32) cellForItemAtIndexPath:v6];
  if (v53) {
    [*(id *)(a1 + 40) configureCell:v53 forCKChatItem:v5 atIndexPath:v6 animated:0 animationDuration:3 animationCurve:0.0];
  }
  [*(id *)(a1 + 48) scrollViewOffsetForBottomAligningChatItemAtIndex:a3];
  double v55 = v54;
  double v56 = v17;
  if (*(unsigned char *)(a1 + 136))
  {
    v57 = +[CKUIBehavior sharedBehaviors];
    double v58 = v82;
    if ([v57 isEntryViewInputAccessory])
    {
      [*(id *)(a1 + 56) throwAnimationManagerAccessoryViewHeight:*(void *)(a1 + 48)];
      double v60 = v59;
    }
    else
    {
      [*(id *)(a1 + 64) bounds];
      double v60 = v61;
    }

    [*(id *)(a1 + 64) placeholderHeight];
    double v55 = v55 - (v60 - v62);
  }
  else
  {
    double v58 = v82;
  }
  double v63 = v58 + v48;
  double v64 = v56 + v46;
  if (*(unsigned char *)(a1 + 137))
  {
    v65 = [*(id *)(a1 + 32) superview];
    objc_msgSend(v65, "convertRect:fromView:", *(void *)(a1 + 32), v64, v63, v50, v52);
    uint64_t v67 = v66;
    uint64_t v69 = v68;
    uint64_t v71 = v70;
    uint64_t v73 = v72;

    v84[0] = v67;
    v84[1] = v69;
    v84[2] = v71;
    v84[3] = v73;
    v74 = [MEMORY[0x1E4F29238] valueWithBytes:v84 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    [*(id *)(a1 + 72) insertObject:v74 atIndex:0];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 80), "convertRect:fromView:", *(void *)(a1 + 64), v64, v63 - (v55 + *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) - *(double *)(a1 + 128)), v50, v52);
    double v76 = v75;
    v83[0] = v77;
    v83[1] = v78;
    v83[2] = v79;
    *(double *)&v83[3] = v75;
    v74 = [MEMORY[0x1E4F29238] valueWithBytes:v83 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    [*(id *)(a1 + 72) insertObject:v74 atIndex:0];
    *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v76
                                                                + *(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 24);
    v80 = +[CKUIBehavior sharedBehaviors];
    [v80 balloonContiguousSpace];
    *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v81
                                                                + *(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 24);
  }
}

- (void)_removeAllAnimations
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  double v42 = [(CKThrowAnimationManager *)self currentContext];
  [v42 throwBalloonViews];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v66;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v66 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v65 + 1) + 8 * v5);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = [v6 textView];
          id v8 = [v7 text];
          int v9 = [v8 _isNaturallyRTL];

          if (v9) {
            [v7 setHidden:0];
          }
        }
        double v10 = [v6 layer];
        [v10 removeAllAnimations];

        [v6 removeFromSuperview];
        CKBalloonViewReuse(v6);
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
    }
    while (v3);
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v45 = [v42 throwBalloonViewAttributesCollection];
  uint64_t v11 = [v45 countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v62;
    uint64_t v43 = *(void *)v62;
    do
    {
      uint64_t v14 = 0;
      uint64_t v44 = v12;
      do
      {
        if (*(void *)v62 != v13) {
          objc_enumerationMutation(v45);
        }
        double v15 = *(void **)(*((void *)&v61 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v48 = v14;
          id v16 = [v15 throwBalloonView];
          double v17 = [v16 layer];
          [v17 removeAllAnimations];

          [v16 removeFromSuperview];
          double v47 = v16;
          CKBalloonViewReuse(v16);
          id v18 = [v15 supplementaryViews];
          double v19 = [v18 allKeys];
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v57 objects:v71 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v58;
            do
            {
              uint64_t v23 = 0;
              do
              {
                if (*(void *)v58 != v22) {
                  objc_enumerationMutation(v19);
                }
                double v24 = [v18 objectForKey:*(void *)(*((void *)&v57 + 1) + 8 * v23)];
                double v25 = [v24 layer];
                [v25 removeAllAnimations];

                [v24 removeFromSuperview];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  double v26 = [v24 textView];
                  double v27 = [v26 text];
                  int v28 = [v27 _isNaturallyRTL];

                  if (v28) {
                    [v26 setHidden:0];
                  }
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  CKBalloonViewReuse(v24);
                }

                ++v23;
              }
              while (v21 != v23);
              uint64_t v21 = [v19 countByEnumeratingWithState:&v57 objects:v71 count:16];
            }
            while (v21);
          }

          uint64_t v13 = v43;
          uint64_t v12 = v44;
          uint64_t v14 = v48;
        }
        ++v14;
      }
      while (v14 != v12);
      uint64_t v12 = [v45 countByEnumeratingWithState:&v61 objects:v72 count:16];
    }
    while (v12);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  double v29 = [v42 animatableViews];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v53 objects:v70 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v54;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v54 != v32) {
          objc_enumerationMutation(v29);
        }
        double v34 = [*(id *)(*((void *)&v53 + 1) + 8 * v33) layer];
        [v34 removeAllAnimations];

        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v53 objects:v70 count:16];
    }
    while (v31);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  double v35 = [v42 animatableTextViews];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v69 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v50;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v50 != v38) {
          objc_enumerationMutation(v35);
        }
        double v40 = *(void **)(*((void *)&v49 + 1) + 8 * v39);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          double v41 = [v40 layer];
          [v41 removeAllAnimations];
        }
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [v35 countByEnumeratingWithState:&v49 objects:v69 count:16];
    }
    while (v37);
  }
}

- (id)lastVisibleCellOfType:(Class)a3 inCollectionView:(id)a4
{
  id v4 = a4;
  uint64_t v5 = [v4 numberOfItemsInSection:0];
  if (v5 < 1)
  {
LABEL_5:
    id v8 = 0;
  }
  else
  {
    uint64_t v6 = v5 + 1;
    while (1)
    {
      id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 - 2 inSection:0];
      id v8 = [v4 cellForItemAtIndexPath:v7];
      if (objc_opt_isKindOfClass()) {
        break;
      }

      if ((unint64_t)--v6 <= 1) {
        goto LABEL_5;
      }
    }
  }

  return v8;
}

- (void)_removeFakeTypingIndicatorIfNecessary
{
  id v6 = [(CKThrowAnimationManager *)self _collectionViewController];
  uint64_t v3 = [v6 chatItems];
  id v4 = [v3 lastObject];
  if (!v4)
  {
    uint64_t v5 = [(CKThrowAnimationManager *)self fakeTypingIndicatorCell];
    [v5 removeFromSuperview];
    [(CKThrowAnimationManager *)self setFakeTypingIndicatorCell:0];
  }
}

- (void)_hideAddedChatItems
{
  uint64_t v3 = [(CKThrowAnimationManager *)self _collectionViewController];
  id v4 = [v3 chatItems];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__72;
  double v15 = __Block_byref_object_dispose__72;
  id v16 = 0;
  uint64_t v5 = [(CKThrowAnimationManager *)self currentContext];
  id v6 = [v5 messages];
  id v7 = objc_msgSend(v4, "__ck_indexesOfPartsOfMessages:", v6);
  id v16 = (id)[v7 mutableCopy];

  id v8 = [(CKThrowAnimationManager *)self currentContext];
  int v9 = [v8 throwBalloonViewAttributesCollection];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__CKThrowAnimationManager__hideAddedChatItems__block_invoke;
  v10[3] = &unk_1E562C060;
  v10[4] = &v11;
  [v9 enumerateObjectsUsingBlock:v10];
  [v3 setHiddenItems:v12[5]];

  _Block_object_dispose(&v11, 8);
}

void __46__CKThrowAnimationManager__hideAddedChatItems__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (void *)MEMORY[0x1E4F1CA98];
  id v7 = a2;
  id v8 = [v6 null];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    double v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v11 = [v10 firstIndex];
    [v10 removeIndex:v11];
  }
  else
  {
    *a4 = 1;
  }
}

- (BOOL)_transcriptWillShiftDueToThrowAnimation
{
  uint64_t v3 = [(CKThrowAnimationManager *)self currentContext];
  id v4 = [(CKThrowAnimationManager *)self _collectionViewController];
  uint64_t v5 = [v4 chatItems];

  id v6 = [v3 messages];
  id v7 = objc_msgSend(v5, "__ck_indexesOfPartsOfMessages:", v6);
  unint64_t v8 = [v7 lastIndex];
  uint64_t v9 = [v5 count];
  if (v8 >= v9 - 1) {
    uint64_t v10 = v9 - 1;
  }
  else {
    uint64_t v10 = v8;
  }
  uint64_t v11 = [(CKThrowAnimationManager *)self _collectionViewController];
  uint64_t v12 = [v11 latestScheduledMessageIndexPath];

  uint64_t v13 = [v6 firstObject];
  uint64_t v14 = [v13 scheduleType];

  if (v14 != 2 && v12) {
    uint64_t v10 = [v12 indexAtPosition:0] - 1;
  }
  [(CKThrowAnimationManager *)self scrollViewOffsetForBottomAligningChatItemAtIndex:v10];
  double v16 = v15;
  double v17 = [(CKThrowAnimationManager *)self throwManagerDelegate];
  id v18 = [(CKThrowAnimationManager *)self _entryView];
  double v19 = +[CKUIBehavior sharedBehaviors];
  if ([v19 isEntryViewInputAccessory])
  {
    [v17 throwAnimationManagerAccessoryViewHeight:self];
    double v21 = v20;
  }
  else
  {
    [v18 bounds];
    double v21 = v22;
  }

  [v18 placeholderHeight];
  double v24 = v21 - v23;
  [v17 throwAnimationManagerTopHeaderHeight:self];
  BOOL v26 = v16 - v24 > -v25;

  return v26;
}

- (double)_changeInEntryViewHeight
{
  uint64_t v2 = [(CKThrowAnimationManager *)self _entryView];
  [v2 bounds];
  double Height = CGRectGetHeight(v7);
  [v2 placeholderHeight];
  double v5 = Height - v4;

  return v5;
}

- (void)_setupThrowBalloonViews
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CKThrowAnimationManager *)self currentContext];
  double v4 = [(CKThrowAnimationManager *)self sendAnimationBalloonProvider];
  double v5 = [v4 throwBalloonsForSendAnimationContext:v3];

  [v3 setThrowBalloonViewAttributesCollection:v5];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = [v11 throwBalloonView];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [v11 supplementaryViews];
            uint64_t v14 = [v13 objectForKey:@"CKSendAnimationSupplementaryViewTextViewContainerView"];

            [v14 setHidden:1];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (double)scrollViewOffsetForBottomAligningChatItemAtIndex:(int64_t)a3
{
  double v4 = [(CKThrowAnimationManager *)self _collectionViewController];
  double v5 = [v4 collectionView];

  [v5 contentInset];
  double v7 = -v6;
  int64_t v8 = [v5 numberOfItemsInSection:0];
  int64_t v9 = v8 - 1;
  if (v8 >= 1)
  {
    int64_t v10 = v8;
    if (a3 < 0 || v8 <= a3)
    {
      if (_IMWillLog())
      {
        int64_t v18 = a3;
        int64_t v19 = v10;
        _IMAlwaysLog();
      }
    }
    else
    {
      int64_t v9 = a3;
    }
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v9, 0, v18, v19);
    uint64_t v12 = [v5 layoutAttributesForItemAtIndexPath:v11];
    [v12 frame];
    double MaxY = CGRectGetMaxY(v20);
    [v5 bounds];
    double v15 = v14;
    [v5 contentInset];
    if (MaxY - (v15 - v16) >= v7) {
      double v7 = MaxY - (v15 - v16);
    }
  }
  return v7;
}

- (int64_t)_indexOfLastChatItemThatWillNotStickToTheBottom:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  int64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v10 = [v3 count] - 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__CKThrowAnimationManager__indexOfLastChatItemThatWillNotStickToTheBottom___block_invoke;
  v6[3] = &unk_1E5623C50;
  v6[4] = &v7;
  [v3 enumerateObjectsWithOptions:2 usingBlock:v6];
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __75__CKThrowAnimationManager__indexOfLastChatItemThatWillNotStickToTheBottom___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 && (v9 & 1) == 0 && (v10 & 1) == 0 && (v11 & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (CKSendAnimationManagerDelegate)sendAnimationManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sendAnimationManagerDelegate);

  return (CKSendAnimationManagerDelegate *)WeakRetained;
}

- (void)setSendAnimationManagerDelegate:(id)a3
{
}

- (CKSendAnimationBalloonProvider)sendAnimationBalloonProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sendAnimationBalloonProvider);

  return (CKSendAnimationBalloonProvider *)WeakRetained;
}

- (void)setSendAnimationBalloonProvider:(id)a3
{
}

- (CKThrowAnimationManagerDelegate)throwManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_throwManagerDelegate);

  return (CKThrowAnimationManagerDelegate *)WeakRetained;
}

- (void)setThrowManagerDelegate:(id)a3
{
}

- (UIView)quickReplySnapshot
{
  return self->_quickReplySnapshot;
}

- (void)setQuickReplySnapshot:(id)a3
{
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (CGRect)audioMessageSourceRect
{
  double x = self->_audioMessageSourceRect.origin.x;
  double y = self->_audioMessageSourceRect.origin.y;
  double width = self->_audioMessageSourceRect.size.width;
  double height = self->_audioMessageSourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAudioMessageSourceRect:(CGRect)a3
{
  self->_audioMessageSourceRect = a3;
}

- (UIImageView)audioRecordingPillViewSnapshot
{
  return self->_audioRecordingPillViewSnapshot;
}

- (void)setAudioRecordingPillViewSnapshot:(id)a3
{
}

- (CKSendAnimationContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
}

- (void)setSendAnimationWindow:(id)a3
{
}

- (CKChatControllerDummyAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
}

- (CKTranscriptTypingIndicatorCell)fakeTypingIndicatorCell
{
  return self->_fakeTypingIndicatorCell;
}

- (void)setFakeTypingIndicatorCell:(id)a3
{
}

- (CKTranscriptUnavailabilityIndicatorCell)fakeUnavailabilityIndicatorCell
{
  return self->_fakeUnavailabilityIndicatorCell;
}

- (void)setFakeUnavailabilityIndicatorCell:(id)a3
{
}

- (CKTranscriptNotifyAnywayButtonCell)fakeNotifyAnywayButtonCell
{
  return self->_fakeNotifyAnywayButtonCell;
}

- (void)setFakeNotifyAnywayButtonCell:(id)a3
{
}

- (CKTranscriptLabelCell)fakeKeyTransparencyCell
{
  return self->_fakeKeyTransparencyCell;
}

- (void)setFakeKeyTransparencyCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeKeyTransparencyCell, 0);
  objc_storeStrong((id *)&self->_fakeNotifyAnywayButtonCell, 0);
  objc_storeStrong((id *)&self->_fakeUnavailabilityIndicatorCell, 0);
  objc_storeStrong((id *)&self->_fakeTypingIndicatorCell, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_sendAnimationWindow, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_audioRecordingPillViewSnapshot, 0);
  objc_storeStrong((id *)&self->_quickReplySnapshot, 0);
  objc_destroyWeak((id *)&self->_throwManagerDelegate);
  objc_destroyWeak((id *)&self->_sendAnimationBalloonProvider);

  objc_destroyWeak((id *)&self->_sendAnimationManagerDelegate);
}

@end