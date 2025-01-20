@interface CKTranscriptPreviewController
- (BOOL)isInitialLayout;
- (BOOL)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 shouldSelectChatItem:(id)a5;
- (BOOL)transcriptCollectionViewController:(id)a3 balloonViewDidRequestCommitPayload:(id)a4 forPlugin:(id)a5 allowAllCommits:(BOOL)a6 error:(id *)a7;
- (BOOL)transcriptCollectionViewController:(id)a3 balloonViewDidRequestCommitSticker:(id)a4 forPlugin:(id)a5 allowAllCommits:(BOOL)a6 error:(id *)a7;
- (BOOL)transcriptCollectionViewController:(id)a3 shouldCleanupFullscreenEffectUI:(id)a4;
- (BOOL)transcriptCollectionViewController:(id)a3 shouldSetupFullscreenEffectUI:(id)a4;
- (BOOL)transcriptCollectionViewControllerPlaybackForOutgoingEffectsIsAllowed:(id)a3;
- (BOOL)transcriptCollectionViewControllerShouldLayoutFullscreenEffects:(id)a3;
- (BOOL)transcriptCollectionViewControllerShouldPlayAudio:(id)a3;
- (BOOL)transcriptCollectionViewControllerShouldScrollToBottomForLocalSentMessage:(id)a3;
- (BOOL)transcriptCollectionViewControllerShouldShouldScrollToTopForStatusBarTap:(id)a3;
- (CKConversation)conversation;
- (CKTranscriptCollectionView)collectionView;
- (CKTranscriptPreviewController)initWithConversation:(id)a3 transcriptWidth:(double)a4 layoutMargins:(UIEdgeInsets)a5;
- (UIEdgeInsets)layoutMargins;
- (double)transcriptCollectionViewController:(id)a3 targetAlphaForChatItem:(id)a4;
- (double)transcriptWidth;
- (id)currentlyFocusedChatItemForTapbackInTranscriptCollectionViewController:(id)a3;
- (id)textInputContextIdentifier;
- (id)transcriptCollectionViewControllerAdditionalFullscreenEffectViews:(id)a3;
- (id)transcriptCollectionViewControllerOuterEffectPresentingView:(id)a3;
- (int64_t)transcriptCollectionViewControllerWantsCurrentDesiredIntent:(id)a3;
- (void)loadView;
- (void)setCollectionView:(id)a3;
- (void)setConversation:(id)a3;
- (void)setIsInitialLayout:(BOOL)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setTranscriptWidth:(double)a3;
- (void)transcriptCollectionViewController:(id)a3 collectionViewContentSizeDidChange:(CGSize)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation CKTranscriptPreviewController

- (CKTranscriptPreviewController)initWithConversation:(id)a3 transcriptWidth:(double)a4 layoutMargins:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKTranscriptPreviewController;
  v12 = [(CKTranscriptPreviewController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(CKTranscriptPreviewController *)v12 setConversation:v11];
    [(CKTranscriptPreviewController *)v13 setTranscriptWidth:a4];
    -[CKTranscriptPreviewController setLayoutMargins:](v13, "setLayoutMargins:", top, left, bottom, right);
    [(CKTranscriptPreviewController *)v13 setIsInitialLayout:1];
  }

  return v13;
}

- (void)loadView
{
  v3 = [CKGradientReferenceView alloc];
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  v8 = -[CKGradientReferenceView initWithFrame:](v3, "initWithFrame:");

  [(CKGradientReferenceView *)v8 setAutoresizingMask:18];
  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 theme];
  v7 = [v6 transcriptBackgroundColor];
  [(CKGradientReferenceView *)v8 setBackgroundColor:v7];

  [(CKTranscriptPreviewController *)self setView:v8];
}

- (void)viewDidLayoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)CKTranscriptPreviewController;
  [(CKTranscriptPreviewController *)&v26 viewDidLayoutSubviews];
  if ([(CKTranscriptPreviewController *)self isInitialLayout])
  {
    v3 = [(CKTranscriptPreviewController *)self view];
    [v3 bounds];
    double Width = CGRectGetWidth(v27);

    [(CKTranscriptPreviewController *)self transcriptWidth];
    if (Width >= v5) {
      double Width = v5;
    }
    v6 = +[CKUIBehavior sharedBehaviors];
    [(CKTranscriptPreviewController *)self layoutMargins];
    objc_msgSend(v6, "balloonMaxWidthForTranscriptWidth:marginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCoverSendButton:isStewieMode:", 1, 0, 0, 0, Width, v7, v8, v9, v10);
    double v12 = v11;

    v13 = [CKTranscriptCollectionViewController alloc];
    v14 = [(CKTranscriptPreviewController *)self conversation];
    [(CKTranscriptPreviewController *)self layoutMargins];
    v19 = -[CKTranscriptCollectionViewController initWithConversation:delegate:balloonMaxWidth:marginInsets:](v13, "initWithConversation:delegate:balloonMaxWidth:marginInsets:", v14, self, v12, v15, v16, v17, v18);

    v20 = [(CKTranscriptPreviewController *)self view];
    [(CKTranscriptCollectionViewController *)v19 setGradientReferenceView:v20];

    v21 = +[CKUIBehavior sharedBehaviors];
    -[CKTranscriptCollectionViewController setShouldLoadDefaultConversationViewingMessageCountOnAppear:](v19, "setShouldLoadDefaultConversationViewingMessageCountOnAppear:", [v21 shouldLoadInitialViewingMessageCount]);

    v22 = [(CKTranscriptCollectionViewController *)v19 collectionView];
    [v22 setUserInteractionEnabled:0];
    [v22 setAutoresizingMask:18];
    [(CKTranscriptPreviewController *)self setCollectionView:v22];
    [(CKTranscriptPreviewController *)self addChildViewController:v19];
    v23 = [(CKTranscriptPreviewController *)self view];
    [v23 addSubview:v22];

    v24 = [(CKTranscriptPreviewController *)self view];
    [v24 bounds];
    objc_msgSend(v22, "setFrame:");

    [(CKTranscriptPreviewController *)self setIsInitialLayout:0];
    [(CKTranscriptCollectionViewController *)v19 scrollTranscriptToEntryViewInsertionTimeWithAnimation:0];
  }
  v25 = [(CKTranscriptPreviewController *)self collectionView];
  objc_msgSend(v25, "__ck_scrollToBottom:", 0);
}

- (id)textInputContextIdentifier
{
  v2 = [(CKTranscriptPreviewController *)self conversation];
  v3 = [v2 deviceIndependentID];
  v4 = CKTextInputIdentifier();

  return v4;
}

- (BOOL)transcriptCollectionViewControllerShouldPlayAudio:(id)a3
{
  return 0;
}

- (BOOL)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 shouldSelectChatItem:(id)a5
{
  return 0;
}

- (void)transcriptCollectionViewController:(id)a3 collectionViewContentSizeDidChange:(CGSize)a4
{
  id v4 = a3;
  id v5 = [v4 gradientReferenceView];
  [v5 bounds];
  objc_msgSend(v5, "setGradientFrame:");
  [v4 scrollTranscriptToEntryViewInsertionTimeWithAnimation:0];
}

- (BOOL)transcriptCollectionViewControllerShouldShouldScrollToTopForStatusBarTap:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewControllerShouldScrollToBottomForLocalSentMessage:(id)a3
{
  return 1;
}

- (double)transcriptCollectionViewController:(id)a3 targetAlphaForChatItem:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double result = 1.0;
  if (isKindOfClass) {
    return 0.5;
  }
  return result;
}

- (BOOL)transcriptCollectionViewControllerPlaybackForOutgoingEffectsIsAllowed:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewController:(id)a3 shouldSetupFullscreenEffectUI:(id)a4
{
  return 1;
}

- (BOOL)transcriptCollectionViewControllerShouldLayoutFullscreenEffects:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewController:(id)a3 shouldCleanupFullscreenEffectUI:(id)a4
{
  return 1;
}

- (id)transcriptCollectionViewControllerAdditionalFullscreenEffectViews:(id)a3
{
  return 0;
}

- (id)transcriptCollectionViewControllerOuterEffectPresentingView:(id)a3
{
  v3 = [a3 view];
  id v4 = [v3 window];

  return v4;
}

- (BOOL)transcriptCollectionViewController:(id)a3 balloonViewDidRequestCommitPayload:(id)a4 forPlugin:(id)a5 allowAllCommits:(BOOL)a6 error:(id *)a7
{
  return 0;
}

- (BOOL)transcriptCollectionViewController:(id)a3 balloonViewDidRequestCommitSticker:(id)a4 forPlugin:(id)a5 allowAllCommits:(BOOL)a6 error:(id *)a7
{
  return 0;
}

- (int64_t)transcriptCollectionViewControllerWantsCurrentDesiredIntent:(id)a3
{
  return 6;
}

- (id)currentlyFocusedChatItemForTapbackInTranscriptCollectionViewController:(id)a3
{
  return 0;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (CKTranscriptCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (double)transcriptWidth
{
  return self->_transcriptWidth;
}

- (void)setTranscriptWidth:(double)a3
{
  self->_transcriptdouble Width = a3;
}

- (UIEdgeInsets)layoutMargins
{
  double top = self->_layoutMargins.top;
  double left = self->_layoutMargins.left;
  double bottom = self->_layoutMargins.bottom;
  double right = self->_layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (BOOL)isInitialLayout
{
  return self->_isInitialLayout;
}

- (void)setIsInitialLayout:(BOOL)a3
{
  self->_isInitialLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_conversation, 0);
}

@end