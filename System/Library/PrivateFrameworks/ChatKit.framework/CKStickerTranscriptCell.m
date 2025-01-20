@interface CKStickerTranscriptCell
- (BOOL)hasCommittedFirstFrame;
- (BOOL)userExplicitlyUnpausedAnimation;
- (CKAnimatedImage)animatedImage;
- (CKBalloonImageView)imageView;
- (CKStickerTranscriptCell)initWithFrame:(CGRect)a3;
- (NSArray)frames;
- (UIImage)image;
- (int64_t)commSafetyState;
- (unint64_t)initialFrameIndex;
- (void)_commitFirstFrameWithAnimationTime:(double)a3;
- (void)animationTimerFired:(double)a3;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)prepareForReuse;
- (void)setAnimatedImage:(id)a3;
- (void)setCommSafetyState:(int64_t)a3;
- (void)setCurrentFrameIndex:(int64_t)a3;
- (void)setFrames:(id)a3;
- (void)setHasCommittedFirstFrame:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setInitialFrameIndex:(unint64_t)a3;
- (void)setSticker:(id)a3;
- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3;
- (void)updateAnimationTimerObserving;
@end

@implementation CKStickerTranscriptCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v56.receiver = self;
  v56.super_class = (Class)CKStickerTranscriptCell;
  id v12 = a3;
  [(CKAssociatedStickerTranscriptCell *)&v56 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  v13 = [v12 mediaObject];

  v14 = +[CKUIBehavior sharedBehaviors];
  [v14 previewMaxWidth];
  v15 = objc_msgSend(v13, "previewForWidth:orientation:", 0);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CKStickerTranscriptCell *)self setAnimatedImage:v15];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(CKStickerTranscriptCell *)self setImage:v15];
    }
  }
  v16 = [v13 transfer];
  v17 = [v16 attributionInfo];
  v18 = [v17 objectForKey:*MEMORY[0x1E4F6D3C0]];

  if ([v18 length])
  {
    v19 = [(CKStickerTranscriptCell *)self imageView];
    [v19 setStickerAccessibilityDescription:v18];
  }
  v20 = [v13 transfer];
  -[CKStickerTranscriptCell setCommSafetyState:](self, "setCommSafetyState:", [v20 commSafetySensitive]);

  v21 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v22 = [v21 isClingEnabled];

  if (!v22) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  id v23 = v13;
  uint64_t v24 = [v23 stickerEffectType];
  v25 = [(CKAssociatedStickerTranscriptCell *)self sticker];
  [v25 setStickerEffectType:v24];

  if ([v23 needsAnimation] & 1) != 0 || (IMStickerEffectTypeShouldAvoidEffectView())
  {

LABEL_12:
    v26 = [(CKStickerTranscriptCell *)self imageView];
    v27 = [v26 layer];
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v52 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v53 = v28;
    long long v29 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v54 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v55 = v29;
    long long v30 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v48 = *MEMORY[0x1E4F39B10];
    long long v49 = v30;
    long long v31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v50 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v51 = v31;
    [v27 setTransform:&v48];

    v32 = [(CKStickerTranscriptCell *)self imageView];
    v33 = [v32 layer];
    [v33 removeAllAnimations];

    id v23 = [(CKStickerTranscriptCell *)self imageView];
    [(CKAssociatedStickerTranscriptCell *)self setAssociatedItemView:v23];
    goto LABEL_13;
  }
  v34 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v35 = MTLCreateSystemDefaultDevice();
    v36 = (void *)[objc_alloc(MEMORY[0x1E4FB3FF8]) initWithDevice:v35];

    [v36 setContentMode:1];
    v37 = [v36 layer];
    long long v38 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v52 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v53 = v38;
    long long v39 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v54 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v55 = v39;
    long long v40 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v48 = *MEMORY[0x1E4F39B10];
    long long v49 = v40;
    long long v41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v50 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v51 = v41;
    [v37 setTransform:&v48];

    v42 = [v36 layer];
    [v42 removeAllAnimations];

    v43 = [(CKStickerTranscriptCell *)self image];
    [v36 setImage:v43];

    v44 = (void *)MEMORY[0x1E4FB3FF0];
    v45 = [(CKAssociatedStickerTranscriptCell *)self sticker];
    v46 = objc_msgSend(v44, "effectWithType:", objc_msgSend(v45, "stickerEffectType"));
    [v36 setEffect:v46];

    [(CKAssociatedStickerTranscriptCell *)self setAssociatedItemView:v36];
    v34 = v36;
  }
  v47 = [(CKStickerTranscriptCell *)self imageView];
  [v47 frame];
  objc_msgSend(v34, "setFrame:");

LABEL_13:
}

- (CKStickerTranscriptCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKStickerTranscriptCell;
  v3 = -[CKAssociatedStickerTranscriptCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKBalloonImageView alloc];
    uint64_t v5 = -[CKBalloonImageView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    imageView = v3->_imageView;
    v3->_imageView = (CKBalloonImageView *)v5;

    [(CKBalloonImageView *)v3->_imageView setContentMode:1];
    [(CKAssociatedStickerTranscriptCell *)v3 setAssociatedItemView:v3->_imageView];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[CKImageAnimationTimer sharedTimer];
  [v3 removeAnimationTimerObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKStickerTranscriptCell;
  [(CKPhoneTranscriptMessageCell *)&v4 dealloc];
}

- (void)prepareForReuse
{
  v13.receiver = self;
  v13.super_class = (Class)CKStickerTranscriptCell;
  [(CKAssociatedStickerTranscriptCell *)&v13 prepareForReuse];
  v3 = [(CKStickerTranscriptCell *)self imageView];
  objc_super v4 = [v3 layer];
  [v4 removeAllAnimations];

  uint64_t v5 = [(CKStickerTranscriptCell *)self imageView];
  [v5 setImage:0];

  v6 = [(CKStickerTranscriptCell *)self imageView];
  v7 = [v6 layer];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v12[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v12[5] = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v12[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v12[7] = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v12[0] = *MEMORY[0x1E4F39B10];
  v12[1] = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v12[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v12[3] = v11;
  [v7 setTransform:v12];

  [(CKStickerTranscriptCell *)self setImage:0];
  [(CKStickerTranscriptCell *)self setAnimatedImage:0];
  [(CKStickerTranscriptCell *)self setCommSafetyState:0];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CKStickerTranscriptCell;
  [(CKStickerTranscriptCell *)&v3 didMoveToWindow];
  [(CKStickerTranscriptCell *)self updateAnimationTimerObserving];
}

- (void)setImage:(id)a3
{
  v6 = (UIImage *)a3;
  if (self->_image != v6)
  {
    objc_storeStrong((id *)&self->_image, a3);
    uint64_t v5 = [(CKStickerTranscriptCell *)self imageView];
    [v5 setImage:v6];
  }
}

- (void)setCurrentFrameIndex:(int64_t)a3
{
  id v4 = [(CKStickerTranscriptCell *)self imageView];
  [v4 setCurrentFrameIndex:a3];
}

- (void)setSticker:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKAssociatedStickerTranscriptCell *)self sticker];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)CKStickerTranscriptCell;
    [(CKAssociatedStickerTranscriptCell *)&v8 setSticker:v4];
    v7 = [(CKAssociatedStickerTranscriptCell *)self sticker];
    -[CKStickerTranscriptCell setInitialFrameIndex:](self, "setInitialFrameIndex:", [v7 initialFrameIndex]);

    [(CKStickerTranscriptCell *)self updateAnimationTimerObserving];
  }
}

- (void)setAnimatedImage:(id)a3
{
  uint64_t v5 = (CKAnimatedImage *)a3;
  if (self->_animatedImage != v5)
  {
    long long v9 = v5;
    objc_storeStrong((id *)&self->_animatedImage, a3);
    char v6 = [(CKAnimatedImage *)self->_animatedImage frames];
    [(CKStickerTranscriptCell *)self setFrames:v6];
    [(CKStickerTranscriptCell *)self updateAnimationTimerObserving];
    if (+[CKImageAnimationTimer accessibilityAnimatedImagesDisabled])
    {
      v7 = [(CKStickerTranscriptCell *)self frames];
      objc_super v8 = [v7 objectAtIndex:0];

      [(CKStickerTranscriptCell *)self setImage:v8];
    }

    uint64_t v5 = v9;
  }
}

- (void)setCommSafetyState:(int64_t)a3
{
  if (self->_commSafetyState != a3)
  {
    self->_commSafetyState = a3;
    BOOL v3 = a3 == 1;
    id v4 = [(CKEditableCollectionViewCell *)self contentView];
    [v4 setHidden:v3];
  }
}

- (void)animationTimerFired:(double)a3
{
  if (([(CKTranscriptMessageContentCell *)self animationPauseReasons] & 2) == 0)
  {
    if ([(CKStickerTranscriptCell *)self hasCommittedFirstFrame])
    {
      unint64_t v5 = [(CKAnimatedImage *)self->_animatedImage frameIndexForAnimationTime:a3];
      char v6 = [(CKStickerTranscriptCell *)self frames];
      unint64_t v7 = [v6 count];

      if (v7 >= 2)
      {
        unint64_t v8 = [(CKStickerTranscriptCell *)self initialFrameIndex] + v5;
        long long v9 = [(CKStickerTranscriptCell *)self frames];
        unint64_t v5 = v8 % [v9 count];
      }
      long long v10 = [(CKStickerTranscriptCell *)self frames];
      id v11 = [v10 objectAtIndex:v5];

      [(CKStickerTranscriptCell *)self setImage:v11];
      [(CKStickerTranscriptCell *)self setCurrentFrameIndex:v5];
    }
    else
    {
      [(CKStickerTranscriptCell *)self _commitFirstFrameWithAnimationTime:a3];
    }
  }
}

- (void)_commitFirstFrameWithAnimationTime:(double)a3
{
  id v4 = [(CKAssociatedStickerTranscriptCell *)self sticker];
  unint64_t v5 = [v4 initialFrameIndex];

  char v6 = [(CKStickerTranscriptCell *)self animatedImage];
  unint64_t v7 = [v6 frames];
  unint64_t v8 = [v7 count];

  long long v9 = [(CKStickerTranscriptCell *)self animatedImage];
  long long v10 = [v9 frames];
  id v11 = v10;
  if (v5 >= v8) {
    [v10 firstObject];
  }
  else {
  id v12 = [v10 objectAtIndex:v5];
  }

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  objc_super v13 = [(CKStickerTranscriptCell *)self imageView];
  [v13 setImage:v12];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__CKStickerTranscriptCell__commitFirstFrameWithAnimationTime___block_invoke;
  v14[3] = &unk_1E5622950;
  v14[4] = self;
  v14[5] = v5;
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v14];
  [MEMORY[0x1E4F39CF8] commit];
}

void __62__CKStickerTranscriptCell__commitFirstFrameWithAnimationTime___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasCommittedFirstFrame:1];
  v2 = [*(id *)(a1 + 32) animatedImage];
  BOOL v3 = [v2 durations];
  id v4 = [v3 objectAtIndex:*(void *)(a1 + 40)];
  [v4 doubleValue];
  double v6 = v5;

  unint64_t v7 = +[CKImageAnimationTimer sharedTimer];
  [v7 animationTime];
  double v9 = v8;

  id v10 = [*(id *)(a1 + 32) animatedImage];
  [v10 setAnimationStartTimeOffset:v6 + v9];
}

- (void)updateAnimationTimerObserving
{
  BOOL v3 = [(CKStickerTranscriptCell *)self frames];
  if ((unint64_t)[v3 count] <= 1)
  {

    goto LABEL_5;
  }
  id v4 = [(CKStickerTranscriptCell *)self window];
  if (!v4)
  {
    double v5 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
    double v6 = [v5 window];

    if (v6) {
      goto LABEL_7;
    }
LABEL_5:
    id v7 = +[CKImageAnimationTimer sharedTimer];
    [v7 removeAnimationTimerObserver:self];
    goto LABEL_8;
  }

LABEL_7:
  [(CKStickerTranscriptCell *)self setHasCommittedFirstFrame:0];
  id v7 = +[CKImageAnimationTimer sharedTimer];
  [v7 addAnimationTimerObserver:self];
LABEL_8:
}

- (CKBalloonImageView)imageView
{
  return self->_imageView;
}

- (UIImage)image
{
  return self->_image;
}

- (CKAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (int64_t)commSafetyState
{
  return self->_commSafetyState;
}

- (BOOL)userExplicitlyUnpausedAnimation
{
  return self->_userExplicitlyUnpausedAnimation;
}

- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3
{
  self->_userExplicitlyUnpausedAnimation = a3;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (unint64_t)initialFrameIndex
{
  return self->_initialFrameIndex;
}

- (void)setInitialFrameIndex:(unint64_t)a3
{
  self->_initialFrameIndex = a3;
}

- (BOOL)hasCommittedFirstFrame
{
  return self->_hasCommittedFirstFrame;
}

- (void)setHasCommittedFirstFrame:(BOOL)a3
{
  self->_hasCommittedFirstFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_animatedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end