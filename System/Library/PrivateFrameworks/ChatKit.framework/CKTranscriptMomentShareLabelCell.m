@interface CKTranscriptMomentShareLabelCell
+ (CGSize)sizeThatFits:(CGSize)a3 attributedText:(id)a4 displayScale:(double)a5;
+ (id)reuseIdentifier;
- (CKTranscriptMomentShareLabelCell)initWithFrame:(CGRect)a3;
- (id)attributedText;
- (id)cellView;
- (id)label;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)setAttributedText:(id)a3;
@end

@implementation CKTranscriptMomentShareLabelCell

- (CKTranscriptMomentShareLabelCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptMomentShareLabelCell;
  v3 = -[CKTranscriptAbstractLabelCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = _CreateLabel();
    label = v3->_label;
    v3->_label = (UILabel *)v4;

    v6 = [(CKEditableCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_label];
  }
  return v3;
}

+ (id)reuseIdentifier
{
  return @"CKTranscriptMomentShareLabelCell";
}

+ (CGSize)sizeThatFits:(CGSize)a3 attributedText:(id)a4 displayScale:(double)a5
{
  double width = a3.width;
  id v6 = a4;
  if ([v6 length])
  {
    v7 = _CreateLabel();
    [v7 setAttributedText:v6];
    objc_msgSend(v7, "sizeThatFits:", width, 1.79769313e308);
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.double width = v12;
  return result;
}

- (void)setAttributedText:(id)a3
{
}

- (id)attributedText
{
  return [(UILabel *)self->_label attributedText];
}

- (id)cellView
{
  return self->_label;
}

- (id)label
{
  return self->_label;
}

- (void).cxx_destruct
{
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKTranscriptMomentShareLabelCell;
  id v12 = a3;
  [(CKTranscriptCell *)&v14 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  double v13 = objc_msgSend(v12, "transcriptText", v14.receiver, v14.super_class);

  [(CKTranscriptMomentShareLabelCell *)self setAttributedText:v13];
}

@end