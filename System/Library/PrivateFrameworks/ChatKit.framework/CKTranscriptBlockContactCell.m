@interface CKTranscriptBlockContactCell
+ (id)blockContactButton;
- (CKTranscriptBlockContactCell)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedButtonText;
- (UIButton)blockContactButton;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)layoutSubviewsForAlignmentContents;
- (void)setAttributedButtonText:(id)a3;
- (void)setBlockContactButton:(id)a3;
@end

@implementation CKTranscriptBlockContactCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKTranscriptBlockContactCell;
  [(CKTranscriptStampCell *)&v15 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  v13 = [v12 transcriptText];
  [(CKTranscriptLabelCell *)self setAttributedText:v13];

  if (!CKIsRunningInMessagesNotificationExtension() && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = [v12 transcriptButtonText];
    [(CKTranscriptBlockContactCell *)self setAttributedButtonText:v14];
  }
}

- (CKTranscriptBlockContactCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptBlockContactCell;
  v3 = -[CKTranscriptLabelCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [(id)objc_opt_class() blockContactButton];
    v5 = [(CKEditableCollectionViewCell *)v3 contentView];
    [v5 addSubview:v4];

    [(CKTranscriptBlockContactCell *)v3 setBlockContactButton:v4];
  }
  return v3;
}

- (void)layoutSubviewsForAlignmentContents
{
  v31.receiver = self;
  v31.super_class = (Class)CKTranscriptBlockContactCell;
  [(CKTranscriptStampCell *)&v31 layoutSubviewsForAlignmentContents];
  v3 = +[CKUIBehavior sharedBehaviors];
  [(CKTranscriptStampCell *)self contentAlignmentRect];
  double v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  [v3 transcriptBoldTextHeight];
  double v13 = v12;
  v14 = [(CKTranscriptBlockContactCell *)self blockContactButton];
  [v14 sizeToFit];
  [v14 frame];
  double v16 = v15;
  double v18 = v17;
  v32.origin.x = v5;
  v32.origin.y = v7;
  v32.size.width = v9;
  v32.size.height = v11;
  double v19 = CGRectGetMaxY(v32) - v18;
  v20 = [(CKEditableCollectionViewCell *)self contentView];
  [v20 bounds];
  float v21 = (CGRectGetWidth(v33) - v16) * 0.5;
  double v22 = roundf(v21);

  objc_msgSend(v14, "setFrame:", v22, v19, v16, v18);
  v23 = [(CKTranscriptLabelCell *)self label];
  uint64_t v24 = [(CKTranscriptLabelCell *)self label];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(CKTranscriptLabelCell *)self label];
    v27 = [v26 attributedText];

    if (v27)
    {
      v28 = [(CKTranscriptLabelCell *)self label];
      v29 = [v28 attributedText];
      objc_msgSend(v29, "boundingRectWithSize:options:context:", 1, 0, v9, 1.79769313e308);
      double v13 = v30;
    }
  }
  [v23 setNumberOfLines:0];
  objc_msgSend(v23, "setFrame:", v5, v19 - v13, v9, v13);
}

- (void)addFilter:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptBlockContactCell;
  id v4 = a3;
  [(CKTranscriptStampCell *)&v8 addFilter:v4];
  double v5 = [(CKTranscriptBlockContactCell *)self blockContactButton];
  [v4 contentAlpha];
  double v7 = v6;

  [v5 setAlpha:v7];
}

- (void)clearFilters
{
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptBlockContactCell;
  [(CKTranscriptStampCell *)&v4 clearFilters];
  v3 = [(CKTranscriptBlockContactCell *)self blockContactButton];
  [v3 setAlpha:1.0];
}

- (void)setAttributedButtonText:(id)a3
{
  id v6 = a3;
  id v4 = [(CKTranscriptBlockContactCell *)self attributedButtonText];

  if (v4 != v6)
  {
    double v5 = [(CKTranscriptBlockContactCell *)self blockContactButton];
    [v5 setAttributedTitle:v6 forState:0];

    [(CKTranscriptBlockContactCell *)self setNeedsLayout];
  }
}

- (NSAttributedString)attributedButtonText
{
  v2 = [(CKTranscriptBlockContactCell *)self blockContactButton];
  v3 = [v2 attributedTitleForState:0];

  return (NSAttributedString *)v3;
}

+ (id)blockContactButton
{
  v2 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 transcriptButtonContentEdgeInsets];
  objc_msgSend(v2, "setContentEdgeInsets:");

  id v4 = [v2 titleLabel];
  [v4 setNumberOfLines:0];

  return v2;
}

- (UIButton)blockContactButton
{
  return self->_blockContactButton;
}

- (void)setBlockContactButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end