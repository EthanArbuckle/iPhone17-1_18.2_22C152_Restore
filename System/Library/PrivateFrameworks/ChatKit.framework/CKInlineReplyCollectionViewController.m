@interface CKInlineReplyCollectionViewController
+ (id)chatItemsDidChangeNotification;
+ (id)initialTextEffectsState;
- (BOOL)_canUseOpaqueMask;
- (BOOL)_shouldMakeTextEffectStateReadyInViewDidAppearDeferredSetup;
- (BOOL)isAnimatingIn;
- (BOOL)isAnimatingOut;
- (BOOL)isInline;
- (BOOL)isModal;
- (BOOL)shouldEndShowingEditHistoryOnViewDisappearance;
- (CKInlineReplyCollectionViewController)initWithConversation:(id)a3 delegate:(id)a4 notifications:(id)a5 balloonMaxWidth:(double)a6 marginInsets:(UIEdgeInsets)a7 collectionViewSize:(CGSize)a8;
- (CKInlineReplyTransitionProperties)transitionProperties;
- (NSDictionary)currentBalloonOffsetMap;
- (NSDictionary)currentFrameMapForNextReload;
- (NSDictionary)targetFrameMapForAnimateOut;
- (id)_replyTranscriptBubbleFilterForUserInterfaceStyle:(int64_t)a3;
- (id)balloonOffsetMapForLayout:(id)a3 resetsOffsetMapAfterUse:(BOOL)a4;
- (id)imChatItems;
- (id)overrideCurrentFrameMapForLayout:(id)a3;
- (id)transcriptBackgroundColor;
- (void)configureCell:(id)a3 forCKChatItem:(id)a4 atIndexPath:(id)a5 animated:(BOOL)a6 animationDuration:(double)a7 animationCurve:(int64_t)a8;
- (void)fetchEarlierMessagesForConversation:(id)a3;
- (void)fetchRecentMessagesForConversation:(id)a3;
- (void)loadEarlierMessagesForConversation;
- (void)loadRecentMessagesForConversation;
- (void)performCollectionViewReloadForAnimateOut;
- (void)setAnimatingIn:(BOOL)a3;
- (void)setAnimatingOut:(BOOL)a3;
- (void)setCurrentBalloonOffsetMap:(id)a3;
- (void)setCurrentFrameMapForNextReload:(id)a3;
- (void)setScrollAnchor:(double)a3;
- (void)setTargetFrameMapForAnimateOut:(id)a3;
- (void)setTransitionProperties:(id)a3;
@end

@implementation CKInlineReplyCollectionViewController

- (CKInlineReplyCollectionViewController)initWithConversation:(id)a3 delegate:(id)a4 notifications:(id)a5 balloonMaxWidth:(double)a6 marginInsets:(UIEdgeInsets)a7 collectionViewSize:(CGSize)a8
{
  v17.receiver = self;
  v17.super_class = (Class)CKInlineReplyCollectionViewController;
  v8 = -[CKTranscriptCollectionViewController initWithConversation:delegate:notifications:balloonMaxWidth:marginInsets:collectionViewSize:](&v17, sel_initWithConversation_delegate_notifications_balloonMaxWidth_marginInsets_collectionViewSize_, a3, a4, a5, a6, a7.top, a7.left, a7.bottom, a7.right, a8.width, a8.height);
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v10 = [(id)objc_opt_class() chatItemsDidChangeNotification];
    v11 = [(CKTranscriptCollectionViewController *)v8 chat];
    v12 = [v11 inlineReplyController];
    [v9 addObserver:v8 selector:sel_chatItemsDidChange_ name:v10 object:v12];

    if (![(CKInlineReplyCollectionViewController *)v8 isModal])
    {
      v13 = [(CKTranscriptCollectionViewController *)v8 collectionView];
      v14 = [v13 collectionViewLayout];

      [v14 setUseOverlayLayout:1];
      v15 = [(CKTranscriptCollectionViewController *)v8 collectionView];
      [v15 beginHoldingContentOffsetUpdatesForReason:@"InlineReplyChatController"];

      [v14 setNeedsDynamicsUpdate];
    }
  }
  return v8;
}

- (BOOL)isModal
{
  v3 = [(CKTranscriptCollectionViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  v5 = [(CKTranscriptCollectionViewController *)self delegate];
  char v6 = [v5 transcriptCollectionViewControllerIsPresentedInModalInlineReply:self];

  return v6;
}

- (BOOL)isInline
{
  return 1;
}

- (id)transcriptBackgroundColor
{
  return 0;
}

- (BOOL)_canUseOpaqueMask
{
  return 0;
}

+ (id)chatItemsDidChangeNotification
{
  return (id)*MEMORY[0x1E4F6BB30];
}

- (id)imChatItems
{
  v2 = [(CKTranscriptCollectionViewController *)self chat];
  v3 = [v2 inlineReplyController];
  char v4 = [v3 chatItems];

  return v4;
}

- (void)configureCell:(id)a3 forCKChatItem:(id)a4 atIndexPath:(id)a5 animated:(BOOL)a6 animationDuration:(double)a7 animationCurve:(int64_t)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  [v14 setIsInReplyContext:1];
  v32.receiver = self;
  v32.super_class = (Class)CKInlineReplyCollectionViewController;
  [(CKTranscriptCollectionViewController *)&v32 configureCell:v14 forCKChatItem:v15 atIndexPath:v16 animated:v10 animationDuration:a8 animationCurve:a7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v14;
    v18 = [v17 balloonView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    BOOL v20 = (objc_opt_respondsToSelector() & 1) != 0 && [v15 color] != 1;
    v21 = [(CKInlineReplyCollectionViewController *)self traitCollection];
    uint64_t v22 = [v21 userInterfaceStyle];

    v23 = +[CKUIBehavior sharedBehaviors];
    v24 = [v23 theme];
    if ([v24 shouldBlendReplyBalloons]
      && ![(CKInlineReplyCollectionViewController *)self isAnimatingOut]
      && ((isKindOfClass & 1) != 0 || [v18 isAudioMessage]))
    {

      if (v20)
      {
        v28 = (void *)MEMORY[0x1E4F39BC0];
        v29 = [(CKInlineReplyCollectionViewController *)self _replyTranscriptBubbleFilterForUserInterfaceStyle:v22];
        v26 = [v28 filterWithType:v29];

        v30 = [v18 layer];
        [v30 setCompositingFilter:v26];

        v27 = [v17 contentView];
        v31 = [v27 layer];
        [v31 setAllowsGroupBlending:0];

        goto LABEL_9;
      }
    }
    else
    {
    }
    v25 = [v18 layer];
    [v25 setCompositingFilter:0];

    v26 = [v17 contentView];
    v27 = [v26 layer];
    [v27 setAllowsGroupBlending:1];
LABEL_9:
  }
}

- (void)loadEarlierMessagesForConversation
{
  v3 = [(CKTranscriptCollectionViewController *)self chat];
  id v12 = [v3 inlineReplyController];

  char v4 = [v12 threadIdentifier];
  v5 = [v12 firstMessage];
  char v6 = [v5 guid];
  uint64_t v7 = [v12 capacity];
  v8 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v12, "setCapacity:", objc_msgSend(v8, "defaultConversationLoadMoreCount") + v7);

  v9 = [(CKTranscriptCollectionViewController *)self chat];
  BOOL v10 = +[CKUIBehavior sharedBehaviors];
  id v11 = (id)objc_msgSend(v9, "loadMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:loadImmediately:threadIdentifier:", v6, objc_msgSend(v10, "defaultConversationLoadMoreCount"), 0, 1, v4);
}

- (void)fetchEarlierMessagesForConversation:(id)a3
{
  id v4 = a3;
  id v11 = [(CKTranscriptCollectionViewController *)self chat];
  v5 = [v11 inlineReplyController];
  char v6 = [v5 threadIdentifier];
  uint64_t v7 = [v5 firstMessage];
  v8 = [v7 guid];
  v9 = +[CKUIBehavior sharedBehaviors];
  uint64_t v10 = [v9 defaultConversationLoadMoreCount];

  objc_msgSend(v5, "setCapacity:", objc_msgSend(v5, "capacity") + v10);
  [v11 fetchMessagesBeforeAndAfterGUID:v8 numberOfMessagesToLoadBeforeGUID:v10 numberOfMessagesToLoadAfterGUID:0 threadIdentifier:v6 completion:v4];
}

- (void)loadRecentMessagesForConversation
{
  v3 = [(CKTranscriptCollectionViewController *)self chat];
  id v12 = [v3 inlineReplyController];

  id v4 = [v12 threadIdentifier];
  v5 = [v12 lastMessage];
  char v6 = [v5 guid];
  uint64_t v7 = [v12 capacity];
  v8 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v12, "setCapacity:", objc_msgSend(v8, "defaultConversationLoadMoreCount") + v7);

  v9 = [(CKTranscriptCollectionViewController *)self chat];
  uint64_t v10 = +[CKUIBehavior sharedBehaviors];
  id v11 = (id)objc_msgSend(v9, "loadMessagesBeforeAndAfterGUID:numberOfMessagesToLoadBeforeGUID:numberOfMessagesToLoadAfterGUID:loadImmediately:threadIdentifier:", v6, 0, objc_msgSend(v10, "defaultConversationLoadMoreCount"), 1, v4);
}

- (void)fetchRecentMessagesForConversation:(id)a3
{
  id v4 = a3;
  id v11 = [(CKTranscriptCollectionViewController *)self chat];
  v5 = [v11 inlineReplyController];
  char v6 = [v5 threadIdentifier];
  uint64_t v7 = [v5 firstMessage];
  v8 = [v7 guid];
  v9 = +[CKUIBehavior sharedBehaviors];
  uint64_t v10 = [v9 defaultConversationLoadMoreCount];

  objc_msgSend(v5, "setCapacity:", objc_msgSend(v5, "capacity") + v10);
  [v11 fetchMessagesBeforeAndAfterGUID:v8 numberOfMessagesToLoadBeforeGUID:0 numberOfMessagesToLoadAfterGUID:v10 threadIdentifier:v6 completion:v4];
}

- (BOOL)shouldEndShowingEditHistoryOnViewDisappearance
{
  return 0;
}

- (BOOL)_shouldMakeTextEffectStateReadyInViewDidAppearDeferredSetup
{
  return 0;
}

+ (id)initialTextEffectsState
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKInlineReplyCollectionViewController;
  v2 = objc_msgSendSuper2(&v4, sel_initialTextEffectsState);
  [v2 setIsReady:0];

  return v2;
}

- (void)setScrollAnchor:(double)a3
{
  if ([(CKInlineReplyCollectionViewController *)self isModal])
  {
    -[CKTranscriptCollectionViewController setScrollAnchor:](&v7, sel_setScrollAnchor_, a3, self, CKInlineReplyCollectionViewController, v8.receiver, v8.super_class);
  }
  else
  {
    v5 = [(CKInlineReplyCollectionViewController *)self currentFrameMapForNextReload];
    if (v5)
    {
    }
    else
    {
      char v6 = [(CKInlineReplyCollectionViewController *)self targetFrameMapForAnimateOut];

      if (!v6) {
        -[CKTranscriptCollectionViewController setScrollAnchor:](&v8, sel_setScrollAnchor_, a3, v7.receiver, v7.super_class, self, CKInlineReplyCollectionViewController);
      }
    }
  }
}

- (id)overrideCurrentFrameMapForLayout:(id)a3
{
  objc_super v4 = [(CKInlineReplyCollectionViewController *)self currentFrameMapForNextReload];
  v5 = (void *)[v4 copy];

  [(CKInlineReplyCollectionViewController *)self setCurrentFrameMapForNextReload:0];

  return v5;
}

- (id)balloonOffsetMapForLayout:(id)a3 resetsOffsetMapAfterUse:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = [(CKInlineReplyCollectionViewController *)self currentBalloonOffsetMap];
  objc_super v7 = (void *)[v6 copy];

  if (v4) {
    [(CKInlineReplyCollectionViewController *)self setCurrentBalloonOffsetMap:0];
  }

  return v7;
}

- (void)performCollectionViewReloadForAnimateOut
{
  v3 = [(CKTranscriptCollectionViewController *)self collectionView];
  id v5 = [v3 collectionViewLayout];

  [v5 setNeedsDynamicsUpdate];
  BOOL v4 = [(CKTranscriptCollectionViewController *)self collectionView];
  [v4 reloadData];
}

- (void)setTransitionProperties:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_transitionProperties, a3);
  char v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  objc_super v7 = [v5 chatItemGUIDs];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * v11);
        v13 = NSNumber;
        [v5 initialBalloonOffsetX];
        id v14 = objc_msgSend(v13, "numberWithDouble:");
        [v6 setObject:v14 forKey:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = objc_msgSend(v5, "associatedChatItemGUIDs", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * v19);
        v21 = NSNumber;
        [v5 initialBalloonOffsetX];
        uint64_t v22 = objc_msgSend(v21, "numberWithDouble:");
        [v6 setObject:v22 forKey:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v17);
  }

  v23 = (void *)[v6 copy];
  [(CKInlineReplyCollectionViewController *)self setCurrentBalloonOffsetMap:v23];
}

- (void)setAnimatingOut:(BOOL)a3
{
  if (self->_animatingOut != a3)
  {
    BOOL v3 = a3;
    self->_animatingOut = a3;
    BOOL v4 = [(CKTranscriptCollectionViewController *)self collectionView];
    id v5 = [v4 collectionViewLayout];

    [v5 setInlineAnimatingOut:v3];
  }
}

- (id)_replyTranscriptBubbleFilterForUserInterfaceStyle:(int64_t)a3
{
  if (UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityIsReduceMotionEnabled()) {
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    BOOL v4 = (id *)MEMORY[0x1E4F3A2E0];
    goto LABEL_11;
  }
  if (a3 != 2)
  {
LABEL_6:
    id v5 = 0;
    goto LABEL_7;
  }
  BOOL v4 = (id *)MEMORY[0x1E4F3A2E8];
LABEL_11:
  id v5 = *v4;
LABEL_7:

  return v5;
}

- (BOOL)isAnimatingIn
{
  return self->_animatingIn;
}

- (void)setAnimatingIn:(BOOL)a3
{
  self->_animatingIn = a3;
}

- (BOOL)isAnimatingOut
{
  return self->_animatingOut;
}

- (CKInlineReplyTransitionProperties)transitionProperties
{
  return self->_transitionProperties;
}

- (NSDictionary)currentFrameMapForNextReload
{
  return self->_currentFrameMapForNextReload;
}

- (void)setCurrentFrameMapForNextReload:(id)a3
{
}

- (NSDictionary)targetFrameMapForAnimateOut
{
  return self->_targetFrameMapForAnimateOut;
}

- (void)setTargetFrameMapForAnimateOut:(id)a3
{
}

- (NSDictionary)currentBalloonOffsetMap
{
  return self->_currentBalloonOffsetMap;
}

- (void)setCurrentBalloonOffsetMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBalloonOffsetMap, 0);
  objc_storeStrong((id *)&self->_targetFrameMapForAnimateOut, 0);
  objc_storeStrong((id *)&self->_currentFrameMapForNextReload, 0);

  objc_storeStrong((id *)&self->_transitionProperties, 0);
}

@end