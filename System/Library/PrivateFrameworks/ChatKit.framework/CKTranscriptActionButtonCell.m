@interface CKTranscriptActionButtonCell
+ (CGSize)sizeThatFits:(CGSize)a3 attributedText:(id)a4 displayScale:(double)a5;
+ (id)reuseIdentifier;
- (CKTranscriptActionButtonCell)initWithFrame:(CGRect)a3;
- (CKTranscriptActionButtonCellDelegate)delegate;
- (id)attributedText;
- (id)cellView;
- (id)label;
- (void)buttonPrimaryActionTriggered:(id)a3;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)setAttributedText:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CKTranscriptActionButtonCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  BOOL v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKTranscriptActionButtonCell;
  id v12 = a3;
  [(CKTranscriptCell *)&v14 configureForChatItem:v12 context:a4 animated:v9 animationDuration:a7 animationCurve:a6];
  v13 = objc_msgSend(v12, "transcriptText", v14.receiver, v14.super_class);

  [(CKTranscriptActionButtonCell *)self setAttributedText:v13];
}

- (CKTranscriptActionButtonCell)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptActionButtonCell;
  v3 = -[CKTranscriptAbstractLabelCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = _CreateActionButton();
    actionButton = v3->_actionButton;
    v3->_actionButton = (UIButton *)v4;

    [(UIButton *)v3->_actionButton addTarget:v3 action:sel_buttonPrimaryActionTriggered_ forControlEvents:0x2000];
    v6 = v3->_actionButton;
    v7 = +[CKUIBehavior sharedBehaviors];
    [v7 smallTranscriptSpace];
    double v9 = -v8;
    v10 = +[CKUIBehavior sharedBehaviors];
    [v10 smallTranscriptSpace];
    double v12 = -v11;
    v13 = +[CKUIBehavior sharedBehaviors];
    [v13 smallTranscriptSpace];
    double v15 = -v14;
    v16 = +[CKUIBehavior sharedBehaviors];
    [v16 smallTranscriptSpace];
    -[UIButton _setTouchInsets:](v6, "_setTouchInsets:", v9, v12, v15, -v17);

    v18 = [(CKEditableCollectionViewCell *)v3 contentView];
    [v18 addSubview:v3->_actionButton];
  }
  return v3;
}

+ (id)reuseIdentifier
{
  return @"CKTranscriptActionButtonCell";
}

+ (CGSize)sizeThatFits:(CGSize)a3 attributedText:(id)a4 displayScale:(double)a5
{
  double width = a3.width;
  id v6 = a4;
  if ([v6 length])
  {
    v7 = _CreateActionButton();
    double v8 = [v7 configuration];
    [v8 setAttributedTitle:v6];
    [v7 setConfiguration:v8];
    objc_msgSend(v7, "sizeThatFits:", width, 1.79769313e308);
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB30];
    double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.double width = v13;
  return result;
}

- (void)setAttributedText:(id)a3
{
  actionButton = self->_actionButton;
  id v5 = a3;
  id v6 = [(UIButton *)actionButton configuration];
  [v6 setAttributedTitle:v5];

  [(UIButton *)self->_actionButton setConfiguration:v6];
}

- (id)attributedText
{
  v2 = [(UIButton *)self->_actionButton configuration];
  v3 = [v2 attributedTitle];

  return v3;
}

- (id)cellView
{
  return self->_actionButton;
}

- (id)label
{
  return [(UIButton *)self->_actionButton titleLabel];
}

- (void)buttonPrimaryActionTriggered:(id)a3
{
  id v4 = [(CKTranscriptActionButtonCell *)self delegate];
  [v4 didTapTranscriptActionButtonCell:self];
}

- (CKTranscriptActionButtonCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKTranscriptActionButtonCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end