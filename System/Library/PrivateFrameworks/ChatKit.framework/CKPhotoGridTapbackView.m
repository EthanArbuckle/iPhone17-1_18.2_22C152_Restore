@interface CKPhotoGridTapbackView
- (BOOL)invertTail;
- (BOOL)isDisplayedInGridView;
- (BOOL)isFromMe;
- (BOOL)needsAnimation;
- (BOOL)shouldAnimate;
- (CGRect)clippingRect;
- (CKAggregateAcknowledgmentBalloonView)tapbackBalloonView;
- (Class)balloonViewClass;
- (PXAssetReference)userData;
- (id)_imAggregateAcknowledgmentChatItem;
- (id)asset;
- (id)gradientReferenceView;
- (id)tapbackUserData;
- (unint64_t)decorationOptions;
- (void)_setupBalloonView;
- (void)_tearDownBalloonView;
- (void)balloonViewTapped:(id)a3 withModifierFlags:(int64_t)a4 selectedText:(id)a5;
- (void)layoutSubviews;
- (void)performInsertion:(id)a3;
- (void)setClippingRect:(CGRect)a3;
- (void)setDecorationOptions:(unint64_t)a3;
- (void)setNeedsAnimation:(BOOL)a3;
- (void)setTapbackBalloonView:(id)a3;
- (void)setUserData:(id)a3;
@end

@implementation CKPhotoGridTapbackView

- (void)setUserData:(id)a3
{
  v5 = (PXAssetReference *)a3;
  if (self->_userData != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userData, a3);
    [(CKPhotoGridTapbackView *)self _tearDownBalloonView];
    [(CKPhotoGridTapbackView *)self _setupBalloonView];
    v5 = v6;
  }
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)CKPhotoGridTapbackView;
  [(CKPhotoGridTapbackView *)&v27 layoutSubviews];
  v3 = [(CKPhotoGridTapbackView *)self tapbackBalloonView];
  [v3 prepareForDisplayIfNeeded];

  [(CKPhotoGridTapbackView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  v8 = +[CKUIBehavior sharedBehaviors];
  [v8 aggregateAcknowledgmentTranscriptBalloonSize];
  double v10 = v9;
  double v12 = v11;

  double v13 = v7 - v12;
  if ([(CKPhotoGridTapbackView *)self isDisplayedInGridView])
  {
    v14 = +[CKUIBehavior sharedBehaviors];
    [v14 messageAcknowledgmentPhotoGridXOffsetScalar];
    double v16 = v15;

    v17 = +[CKUIBehavior sharedBehaviors];
    [v17 messageAcknowledgmentPhotoGridYOffsetScalar];
    double v19 = v18;

    double v20 = v10 * v16;
    double v21 = v13 - v12 * v19;
  }
  else
  {
    v22 = +[CKUIBehavior sharedBehaviors];
    [v22 messageAcknowledgmentPhotoCarouselXOffsetScalar];
    double v24 = v23;

    double v20 = (v5 - v10) * 0.5 - v10 * v24;
    double v21 = v13 * 0.5;
  }
  v25 = [(CKPhotoGridTapbackView *)self tapbackBalloonView];
  objc_msgSend(v25, "setFrame:", v20, v21, v10, v12);

  if ([(CKPhotoGridTapbackView *)self needsAnimation])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__CKPhotoGridTapbackView_layoutSubviews__block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    [(CKPhotoGridTapbackView *)self setNeedsAnimation:0];
  }
}

uint64_t __40__CKPhotoGridTapbackView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performInsertion:&__block_literal_global_46];
}

- (id)tapbackUserData
{
  v3 = [(CKPhotoGridTapbackView *)self userData];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(CKPhotoGridTapbackView *)self userData];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)_setupBalloonView
{
  [(CKPhotoGridTapbackView *)self setNeedsAnimation:[(CKPhotoGridTapbackView *)self shouldAnimate]];
  CKBalloonViewForClass([(CKPhotoGridTapbackView *)self balloonViewClass]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(CKPhotoGridTapbackView *)self setTapbackBalloonView:v6];
  [(CKPhotoGridTapbackView *)self addSubview:v6];
  v3 = [(CKPhotoGridTapbackView *)self asset];
  double v4 = [v3 acknowledgmentChatItem];
  [v6 configureForAggregateAcknowledgmentChatItem:v4];

  double v5 = [(CKPhotoGridTapbackView *)self gradientReferenceView];
  [v6 setGradientReferenceView:v5];

  objc_msgSend(v6, "setInvertTailDirection:", -[CKPhotoGridTapbackView invertTail](self, "invertTail"));
  [v6 setNeedsPrepareForDisplay];
  [v6 setNeedsLayout];
  [v6 setHidesFirstTapbackTail:1];
  [v6 setDelegate:self];
  [(CKPhotoGridTapbackView *)self setNeedsLayout];
}

- (void)_tearDownBalloonView
{
  v3 = [(CKPhotoGridTapbackView *)self tapbackBalloonView];

  if (v3)
  {
    double v4 = [(CKPhotoGridTapbackView *)self tapbackBalloonView];
    [v4 removeFromSuperview];

    double v5 = [(CKPhotoGridTapbackView *)self tapbackBalloonView];
    [v5 prepareForReuse];

    id v6 = [(CKPhotoGridTapbackView *)self tapbackBalloonView];
    CKBalloonViewReuse(v6);

    [(CKPhotoGridTapbackView *)self setTapbackBalloonView:0];
  }
}

- (id)asset
{
  v3 = [(CKPhotoGridTapbackView *)self userData];
  double v4 = [v3 asset];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(CKPhotoGridTapbackView *)self userData];
  }
  else {
  id v6 = [(CKPhotoGridTapbackView *)self tapbackUserData];
  }
  double v7 = [v6 asset];

  return v7;
}

- (id)gradientReferenceView
{
  v3 = [(CKPhotoGridTapbackView *)self tapbackUserData];
  double v4 = v3;
  if (v3 && ([v3 isDisplayedInGridView] & 1) == 0)
  {
    double v5 = [v4 gradientReferenceView];
  }
  else
  {
    double v5 = self;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)isDisplayedInGridView
{
  v2 = [(CKPhotoGridTapbackView *)self tapbackUserData];
  char v3 = [v2 isDisplayedInGridView];

  return v3;
}

- (BOOL)isFromMe
{
  v2 = [(CKPhotoGridTapbackView *)self asset];
  char v3 = [v2 acknowledgmentChatItem];
  char v4 = [v3 isFromMe];

  return v4;
}

- (BOOL)shouldAnimate
{
  v2 = [(CKPhotoGridTapbackView *)self tapbackUserData];
  char v3 = [v2 shouldAnimate];

  return v3;
}

- (BOOL)invertTail
{
  v2 = [(CKPhotoGridTapbackView *)self tapbackUserData];
  char v3 = [v2 invertTailDirection];

  return v3;
}

- (Class)balloonViewClass
{
  [(CKPhotoGridTapbackView *)self isFromMe];
  id v2 = (id)objc_opt_class();

  return (Class)v2;
}

- (id)_imAggregateAcknowledgmentChatItem
{
  id v2 = [(CKPhotoGridTapbackView *)self asset];
  char v3 = [v2 acknowledgmentChatItem];
  char v4 = [v3 IMChatItem];

  return v4;
}

- (void)performInsertion:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F39CF8] flush];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:2.0];
  double v5 = [(CKPhotoGridTapbackView *)self tapbackBalloonView];
  id v6 = [v5 layer];
  [v6 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v8 = v7;

  double v9 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v9 setFromValue:&unk_1EDF162C8];
  [v9 setMass:1.0];
  [v9 setStiffness:80.0];
  [v9 setDamping:20.0];
  [v9 setBeginTime:v8];
  LODWORD(v10) = 3.0;
  [v9 setSpeed:v10];
  [v9 setDuration:1.0];
  [v9 setFillMode:*MEMORY[0x1E4F39FA8]];
  double v11 = [(CKPhotoGridTapbackView *)self tapbackBalloonView];
  double v12 = [v11 layer];
  [v12 addAnimation:v9 forKey:@"transform.scale.xy"];

  double v13 = [(CKPhotoGridTapbackView *)self tapbackBalloonView];
  v14 = [v13 glyphView];

  [v14 animationDuration];
  [v14 animateWithBeginTime:0 completionDelay:v8 completion:v15];
  double v16 = (void *)MEMORY[0x1E4F39CF8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __43__CKPhotoGridTapbackView_performInsertion___block_invoke;
  v18[3] = &unk_1E5620F48;
  id v19 = v4;
  id v17 = v4;
  [v16 setCompletionBlock:v18];
  [MEMORY[0x1E4F39CF8] commit];
  [MEMORY[0x1E4F39CF8] flush];
}

uint64_t __43__CKPhotoGridTapbackView_performInsertion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)balloonViewTapped:(id)a3 withModifierFlags:(int64_t)a4 selectedText:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (IMOSLoggingEnabled())
  {
    double v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Detected tap on view: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  double v10 = [(CKPhotoGridTapbackView *)self tapbackUserData];
  double v11 = [v10 photoGridTapbackPileDelegate];
  double v12 = [(CKPhotoGridTapbackView *)self asset];
  [v11 tapbackPileViewTapped:v7 asset:v12];
}

- (unint64_t)decorationOptions
{
  return self->_decorationOptions;
}

- (void)setDecorationOptions:(unint64_t)a3
{
  self->_decorationOptions = a3;
}

- (PXAssetReference)userData
{
  return self->_userData;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CKAggregateAcknowledgmentBalloonView)tapbackBalloonView
{
  return self->_tapbackBalloonView;
}

- (void)setTapbackBalloonView:(id)a3
{
}

- (BOOL)needsAnimation
{
  return self->_needsAnimation;
}

- (void)setNeedsAnimation:(BOOL)a3
{
  self->_needsAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapbackBalloonView, 0);

  objc_storeStrong((id *)&self->_userData, 0);
}

@end