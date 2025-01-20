@interface CKTruncatedTextBalloonView
- (BOOL)avoidTextLineBreaks;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)wantsChevron;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKTruncatedTextBalloonView)initWithFrame:(CGRect)a3;
- (UIImageView)chevron;
- (void)configureForMessagePart:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)setAvoidTextLineBreaks:(BOOL)a3;
- (void)setChevron:(id)a3;
- (void)setWantsChevron:(BOOL)a3;
@end

@implementation CKTruncatedTextBalloonView

- (CKTruncatedTextBalloonView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKTruncatedTextBalloonView;
  v3 = -[CKHyperlinkBalloonView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKTextBalloonView *)v3 textView];
    v6 = [v5 textContainer];
    [v6 setMaximumNumberOfLines:8];
    [v6 setLineBreakMode:4];
  }
  return v4;
}

- (void)layoutSubviews
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)CKTruncatedTextBalloonView;
  [(CKTextBalloonView *)&v34 layoutSubviews];
  v3 = [(CKTextBalloonView *)self textView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v12 = [(CKTruncatedTextBalloonView *)self chevron];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;

  v36.origin.x = v5;
  v36.origin.y = v7;
  v36.size.width = v9;
  v36.size.height = v11;
  double MaxY = CGRectGetMaxY(v36);
  [(CKBalloonView *)self textAlignmentInsets];
  double v19 = MaxY - v18 - v16;
  v37.origin.x = v5;
  v37.origin.y = v7;
  v37.size.width = v9;
  v37.size.height = v11;
  double v20 = CGRectGetMaxX(v37) - v14;
  if (![(CKTruncatedTextBalloonView *)self avoidTextLineBreaks])
  {
    v21 = [v3 textContainer];
    v22 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", v20, v19, v14, v16);
    v35[0] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    [v21 setExclusionPaths:v23];
  }
  -[CKTruncatedTextBalloonView convertRect:fromView:](self, "convertRect:fromView:", v3, v20, v19, v14, v16);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  if ([(CKBalloonView *)self hasSuggestedActionsMenu])
  {
    [(CKBalloonView *)self suggestedActionsMenuAdditionalHeight];
    double v25 = v25 + 0.0;
    double v27 = v27 - v32;
  }
  v33 = [(CKTruncatedTextBalloonView *)self chevron];
  objc_msgSend(v33, "setFrame:", v25, v27, v29, v31);
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
  long long v18 = *MEMORY[0x1E4F437F8];
  long long v19 = v6;
  v17.receiver = self;
  v17.super_class = (Class)CKTruncatedTextBalloonView;
  -[CKTextBalloonView sizeThatFits:textAlignmentInsets:](&v17, sel_sizeThatFits_textAlignmentInsets_, &v18, a3.width, a3.height);
  double v8 = v7;
  double v10 = v9;
  if ([(CKTruncatedTextBalloonView *)self avoidTextLineBreaks])
  {
    CGFloat v11 = [(CKTruncatedTextBalloonView *)self chevron];
    v12 = [v11 image];
    [v12 size];
    double v8 = v8 + v13;
  }
  if (a4)
  {
    long long v14 = v19;
    *(_OWORD *)&a4->top = v18;
    *(_OWORD *)&a4->bottom = v14;
  }
  double v15 = v8;
  double v16 = v10;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)setWantsChevron:(BOOL)a3
{
  self->_wantsChevron = a3;
  chevron = self->_chevron;
  if (a3)
  {
    if (chevron) {
      return;
    }
    id v5 = objc_alloc(MEMORY[0x1E4F42AA0]);
    long long v6 = +[CKUIBehavior sharedBehaviors];
    double v7 = [v6 chevronImageForColorType:0xFFFFFFFFLL];
    double v8 = (UIImageView *)[v5 initWithImage:v7];

    [(UIImageView *)v8 setContentMode:4];
    [(CKTruncatedTextBalloonView *)self addSubview:v8];
  }
  else
  {
    if (!chevron) {
      return;
    }
    [(UIImageView *)chevron removeFromSuperview];
    double v8 = 0;
  }
  double v9 = self->_chevron;
  self->_chevron = v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v4 = objc_msgSend(a4, "view", a3);
  uint64_t v5 = objc_opt_class();
  LOBYTE(v5) = v5 != objc_opt_class();

  return v5;
}

- (void)prepareForDisplay
{
  v6.receiver = self;
  v6.super_class = (Class)CKTruncatedTextBalloonView;
  [(CKTextBalloonView *)&v6 prepareForDisplay];
  v3 = [(CKTruncatedTextBalloonView *)self chevron];
  double v4 = +[CKUIBehavior sharedBehaviors];
  uint64_t v5 = objc_msgSend(v4, "chevronImageForColorType:", -[CKBalloonView color](self, "color"));
  [v3 setImage:v5];
}

- (BOOL)avoidTextLineBreaks
{
  return self->_avoidTextLineBreaks;
}

- (void)setAvoidTextLineBreaks:(BOOL)a3
{
  self->_avoidTextLineBreaks = a3;
}

- (BOOL)wantsChevron
{
  return self->_wantsChevron;
}

- (UIImageView)chevron
{
  return self->_chevron;
}

- (void)setChevron:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)configureForMessagePart:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKTruncatedTextBalloonView;
  id v4 = a3;
  [(CKTextBalloonView *)&v6 configureForMessagePart:v4];
  -[CKTruncatedTextBalloonView setWantsChevron:](self, "setWantsChevron:", objc_msgSend(v4, "isReplyContextPreview", v6.receiver, v6.super_class) ^ 1);
  uint64_t v5 = [v4 isCorrupt];

  [(CKTruncatedTextBalloonView *)self setAvoidTextLineBreaks:v5];
}

@end