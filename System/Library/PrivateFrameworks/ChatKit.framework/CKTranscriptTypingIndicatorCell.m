@interface CKTranscriptTypingIndicatorCell
- (CKTranscriptTypingIndicatorCell)initWithFrame:(CGRect)a3;
- (CKTypingIndicatorLayerProtocol)indicatorLayer;
- (CKTypingView)typingView;
- (void)ckLayerDidBecomeVisible:(BOOL)a3;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)performInsertion:(id)a3;
- (void)performRemoval:(id)a3;
- (void)prepareForReuse;
- (void)resetTypingView;
- (void)setIndicatorLayer:(id)a3;
- (void)setOrientation:(char)a3;
- (void)setTraitCollectionForIndicatorLayer:(id)a3;
- (void)setTypingView:(id)a3;
- (void)startGrowAnimation;
- (void)startPulseAnimation;
- (void)startShrinkAnimation;
- (void)stopPulseAnimation;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKTranscriptTypingIndicatorCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16.receiver = self;
    v16.super_class = (Class)CKTranscriptTypingIndicatorCell;
    [(CKTranscriptCell *)&v16 configureForChatItem:v12 context:v13 animated:v9 animationDuration:a7 animationCurve:a6];
    v14 = [v12 indicatorLayer];
    [(CKTranscriptTypingIndicatorCell *)self setIndicatorLayer:v14];

    v15 = [v12 transcriptTraitCollection];
    [(CKTranscriptTypingIndicatorCell *)self setTraitCollection:v15];
    [(CKTranscriptTypingIndicatorCell *)self startPulseAnimation];
  }
  else
  {
    v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CKTranscriptTypingIndicatorCell(CKChatItem) configureForChatItem:context:animated:animationDuration:animationCurve:]();
    }
  }
}

- (CKTranscriptTypingIndicatorCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptTypingIndicatorCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKTranscriptTypingIndicatorCell *)v3 layer];
    [v5 setAllowsGroupOpacity:1];

    [(CKTranscriptTypingIndicatorCell *)v4 resetTypingView];
  }
  return v4;
}

- (CKTypingView)typingView
{
  typingView = self->_typingView;
  if (!typingView)
  {
    v4 = [CKTypingView alloc];
    v5 = -[CKTypingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = [(CKTypingView *)v5 baseLayer];
    [v6 setCkLayerDelegate:self];

    objc_super v7 = self->_typingView;
    self->_typingView = v5;

    typingView = self->_typingView;
  }

  return typingView;
}

- (void)resetTypingView
{
  [(CKTypingView *)self->_typingView removeFromSuperview];
  typingView = self->_typingView;
  self->_typingView = 0;

  id v5 = [(CKEditableCollectionViewCell *)self contentView];
  v4 = [(CKTranscriptTypingIndicatorCell *)self typingView];
  [v5 addSubview:v4];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptTypingIndicatorCell;
  [(CKTranscriptCell *)&v3 prepareForReuse];
  [(CKTranscriptTypingIndicatorCell *)self resetTypingView];
}

- (void)setOrientation:(char)a3
{
  uint64_t v3 = a3;
  if ([(CKEditableCollectionViewCell *)self orientation] != a3)
  {
    v16.receiver = self;
    v16.super_class = (Class)CKTranscriptTypingIndicatorCell;
    [(CKEditableCollectionViewCell *)&v16 setOrientation:v3];
    if (v3 == 2)
    {
      long long v15 = 0uLL;
      double v5 = 1.0;
      double v6 = -1.0;
      long long v14 = 0uLL;
    }
    else
    {
      double v6 = *MEMORY[0x1E4F1DAB8];
      long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 8);
      double v5 = *(double *)(MEMORY[0x1E4F1DAB8] + 24);
      long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      long long v15 = v7;
    }
    v8 = [(CKTranscriptTypingIndicatorCell *)self typingView];
    BOOL v9 = [v8 layer];
    double v10 = v6;
    long long v11 = v15;
    double v12 = v5;
    long long v13 = v14;
    [v9 setAffineTransform:&v10];

    [(CKTranscriptTypingIndicatorCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviewsForAlignmentContents
{
  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptTypingIndicatorCell;
  [(CKEditableCollectionViewCell *)&v20 layoutSubviewsForAlignmentContents];
  [(CKEditableCollectionViewCell *)self contentAlignmentRect];
  double v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  long long v11 = [(CKTranscriptTypingIndicatorCell *)self typingView];
  double v12 = [v11 layer];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;

  double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if ([(CKEditableCollectionViewCell *)self orientation])
  {
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    double v4 = CGRectGetMaxX(v21) - v14;
  }
  v18 = [(CKTranscriptTypingIndicatorCell *)self typingView];
  v19 = [v18 layer];
  objc_msgSend(v19, "setFrame:", v4, v17, v14, v16);
}

- (void)performInsertion:(id)a3
{
  id v4 = a3;
  [(CKTranscriptTypingIndicatorCell *)self startGrowAnimation];
  id v5 = v4;
  im_dispatch_after();
}

uint64_t __52__CKTranscriptTypingIndicatorCell_performInsertion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)performRemoval:(id)a3
{
  id v5 = a3;
  [(CKTranscriptTypingIndicatorCell *)self stopPulseAnimation];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    id v4 = v5;
  }
}

- (void)ckLayerDidBecomeVisible:(BOOL)a3
{
  if (a3) {
    [(CKTranscriptTypingIndicatorCell *)self startPulseAnimation];
  }
  else {
    [(CKTranscriptTypingIndicatorCell *)self stopPulseAnimation];
  }
}

- (void)setIndicatorLayer:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptTypingIndicatorCell *)self typingView];
  [v5 setIndicatorLayer:v4];

  [(CKTranscriptTypingIndicatorCell *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptTypingIndicatorCell;
  id v4 = a3;
  [(CKTranscriptTypingIndicatorCell *)&v8 traitCollectionDidChange:v4];
  id v5 = [(CKTranscriptTypingIndicatorCell *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6)
  {
    double v7 = [(CKTranscriptTypingIndicatorCell *)self traitCollection];
    [(CKTranscriptTypingIndicatorCell *)self setTraitCollectionForIndicatorLayer:v7];
  }
}

- (void)setTraitCollectionForIndicatorLayer:(id)a3
{
  id v5 = a3;
  id v4 = [(CKTranscriptTypingIndicatorCell *)self indicatorLayer];
  if (objc_opt_respondsToSelector()) {
    [v4 setTraitCollection:v5];
  }
}

- (CKTypingIndicatorLayerProtocol)indicatorLayer
{
  v2 = [(CKTranscriptTypingIndicatorCell *)self typingView];
  double v3 = [v2 indicatorLayer];

  return (CKTypingIndicatorLayerProtocol *)v3;
}

- (void)startGrowAnimation
{
  id v3 = [(CKTranscriptTypingIndicatorCell *)self typingView];
  v2 = [v3 indicatorLayer];
  [v2 startGrowAnimation];
}

- (void)startPulseAnimation
{
  id v3 = [(CKTranscriptTypingIndicatorCell *)self typingView];
  v2 = [v3 indicatorLayer];
  [v2 startPulseAnimation];
}

- (void)stopPulseAnimation
{
  id v3 = [(CKTranscriptTypingIndicatorCell *)self typingView];
  v2 = [v3 indicatorLayer];
  [v2 stopPulseAnimation];
}

- (void)startShrinkAnimation
{
  id v3 = [(CKTranscriptTypingIndicatorCell *)self typingView];
  v2 = [v3 indicatorLayer];
  [v2 startShrinkAnimationWithCompletionBlock:0];
}

- (void)setTypingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end