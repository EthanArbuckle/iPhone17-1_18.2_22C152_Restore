@interface EKEventDetailTextCell
- (BOOL)isTruncatingText;
- (BOOL)update;
- (CGSize)_sizeForTextViewGivenWidth:(double)a3 outTruncatingText:(BOOL *)a4;
- (EKEventDetailTextCell)initWithEvent:(id)a3 editable:(BOOL)a4 title:(id)a5 textFromEventBlock:(id)a6;
- (EKEventDetailTextCellDelegate)delegate;
- (double)_layoutForWidth:(double)a3;
- (id)_createNewTextView;
- (id)_headerView;
- (id)_sizingTextView;
- (id)_textView;
- (void)cellHeaderTapped;
- (void)layoutForWidth:(double)a3 position:(int)a4;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setIsTruncatingText:(BOOL)a3;
@end

@implementation EKEventDetailTextCell

- (EKEventDetailTextCell)initWithEvent:(id)a3 editable:(BOOL)a4 title:(id)a5 textFromEventBlock:(id)a6
{
  BOOL v8 = a4;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)EKEventDetailTextCell;
  v13 = [(EKEventDetailCell *)&v19 initWithEvent:a3 editable:v8];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_title, a5);
    v15 = _Block_copy(v12);
    id textFromEventBlock = v14->_textFromEventBlock;
    v14->_id textFromEventBlock = v15;

    v17 = [NSString stringWithFormat:@"EventDetails-%@", v11];
    [(EKEventDetailTextCell *)v14 setAccessibilityIdentifier:v17];
  }
  return v14;
}

- (BOOL)update
{
  v3 = (*((void (**)(void))self->_textFromEventBlock + 2))();
  v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if (![v5 length] || !CUIKShouldDisplayNotes())
  {
    v17 = [(EKEventDetailTextCell *)self _textView];
    [v17 setText:0];
    char v16 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v6 = [(EKEventDetailTextCell *)self _textView];
  v7 = [v6 font];
  uint64_t v8 = *MEMORY[0x1E4FB28C8];
  v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  char v10 = [v7 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    id v11 = [(EKEventDetailTextCell *)self _textView];
    id v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v8];
    [v11 setFont:v12];
  }
  v13 = [(EKEventDetailTextCell *)self _textView];
  v14 = [v13 text];
  char v15 = [v14 isEqualToString:v5];

  if ((v15 & 1) == 0)
  {
    v17 = [(EKEventDetailTextCell *)self _textView];
    [v17 setText:v5];
    char v16 = 1;
    goto LABEL_8;
  }
  char v16 = v10 ^ 1;
LABEL_9:

  return v16;
}

- (id)_createNewTextView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1DD8]);
  v3 = [v2 textLayoutManager];
  [v3 setLimitsLayoutForSuspiciousContents:1];

  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v2 setBackgroundColor:v4];

  [v2 setEditable:0];
  [v2 setDataDetectorTypes:-1];
  v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v2 setTextColor:v5];

  [v2 setScrollEnabled:0];
  objc_msgSend(v2, "setTextContainerInset:", 4.0, 0.0, 8.0, 0.0);
  v6 = [v2 textContainer];
  [v6 setLineFragmentPadding:0.0];

  return v2;
}

- (id)_textView
{
  textView = self->_textView;
  if (!textView)
  {
    v4 = [(EKEventDetailTextCell *)self _createNewTextView];
    v5 = self->_textView;
    self->_textView = v4;

    v6 = [(EKEventDetailTextCell *)self contentView];
    [v6 addSubview:self->_textView];

    textView = self->_textView;
  }

  return textView;
}

- (id)_sizingTextView
{
  sizingTextView = self->_sizingTextView;
  if (!sizingTextView)
  {
    v4 = [(EKEventDetailTextCell *)self _createNewTextView];
    v5 = self->_sizingTextView;
    self->_sizingTextView = v4;

    sizingTextView = self->_sizingTextView;
  }

  return sizingTextView;
}

- (id)_headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = [[EKEventDetailTextCellHeader alloc] initWithTitle:self->_title];
    v5 = self->_headerView;
    self->_headerView = v4;

    [(EKEventDetailTextCellHeader *)self->_headerView setDelegate:self];
    v6 = [(EKEventDetailTextCell *)self contentView];
    [v6 addSubview:self->_headerView];

    headerView = self->_headerView;
  }

  return headerView;
}

- (void)setIsTruncatingText:(BOOL)a3
{
  if (self->_isTruncatingText != a3)
  {
    BOOL v3 = a3;
    self->_BOOL isTruncatingText = a3;
    v5 = [(EKEventDetailTextCell *)self _textView];
    v6 = [v5 textContainer];
    v7 = v6;
    if (v3) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = 0;
    }
    [v6 setLineBreakMode:v8];

    BOOL isTruncatingText = self->_isTruncatingText;
    id v10 = [(EKEventDetailTextCell *)self _headerView];
    [v10 setShowsShowMoreLabel:isTruncatingText];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailTextCell;
  [(EKUITableViewCell *)&v4 layoutSubviews];
  [(EKEventDetailTextCell *)self bounds];
  [(EKEventDetailTextCell *)self _layoutForWidth:v3];
}

- (double)_layoutForWidth:(double)a3
{
  [(EKEventDetailTextCell *)self update];
  unsigned __int8 v35 = 0;
  [(EKEventDetailTextCell *)self _sizeForTextViewGivenWidth:&v35 outTruncatingText:a3];
  double v6 = v5;
  double v8 = v7;
  [(EKEventDetailTextCell *)self setIsTruncatingText:v35];
  [(EKEventDetailCell *)self detailsLeftInset];
  double v10 = v9;
  [(EKEventDetailTextCell *)self layoutMargins];
  double v12 = a3 - v11;
  [(EKEventDetailTextCell *)self layoutMargins];
  double v14 = v12 - v13;
  char v15 = [(EKEventDetailTextCell *)self _headerView];
  objc_msgSend(v15, "systemLayoutSizeFittingSize:", v14, 9999.0);
  double v17 = v16;

  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    CGFloat v18 = *MEMORY[0x1E4F1DB28];
    CGFloat v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    [(EKEventDetailTextCell *)self safeAreaInsets];
    double v21 = a3 - v20;
    [(EKEventDetailTextCell *)self safeAreaInsets];
    double v23 = v21 - v22;
    v36.origin.x = v18;
    v36.origin.y = v19;
    v36.size.width = v14;
    v36.size.height = v17;
    double v24 = v23 - CGRectGetWidth(v36);
    [(EKEventDetailCell *)self detailsLeftInset];
    double v10 = v24 - v25;
  }
  -[EKEventDetailTextCellHeader setFrame:](self->_headerView, "setFrame:", v10, 11.0, v14, v17);
  v37.origin.y = 11.0;
  v37.origin.x = v10;
  v37.size.width = v14;
  v37.size.height = v17;
  double Height = CGRectGetHeight(v37);
  [(EKEventDetailCell *)self detailsLeftInset];
  double v28 = v27;
  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    [(EKEventDetailTextCell *)self safeAreaInsets];
    double v30 = a3 - v29;
    [(EKEventDetailTextCell *)self safeAreaInsets];
    double v32 = v30 - v31 - v6;
    [(EKEventDetailCell *)self detailsLeftInset];
    double v28 = v32 - v33;
  }
  -[UITextView setFrame:](self->_textView, "setFrame:", v28, Height + 11.0, v6, v8);
  return v8 + Height + 11.0;
}

- (CGSize)_sizeForTextViewGivenWidth:(double)a3 outTruncatingText:(BOOL *)a4
{
  double v7 = [(EKEventDetailTextCell *)self _sizingTextView];
  double v8 = [(EKEventDetailTextCell *)self _textView];
  double v9 = [v8 text];
  [v7 setText:v9];

  double v10 = [(EKEventDetailTextCell *)self _sizingTextView];
  double v11 = [(EKEventDetailTextCell *)self _textView];
  double v12 = [v11 font];
  [v10 setFont:v12];

  double v13 = [(EKEventDetailTextCell *)self _sizingTextView];
  [(EKEventDetailTextCell *)self layoutMargins];
  double v15 = a3 - v14;
  [(EKEventDetailTextCell *)self layoutMargins];
  objc_msgSend(v13, "sizeThatFits:", v15 - v16, 9999.0);
  double v18 = v17;
  double v20 = v19;

  double v21 = v20 + -8.0;
  uint64_t v22 = *MEMORY[0x1E4FB28C8];
  double v23 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v23 lineHeight];
  double v25 = v24;
  v26 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v22];
  [v26 descender];
  double v28 = v27 + v25 * 10.0;

  if (v20 + -8.0 > v28)
  {
    double v29 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v22];
    [v29 lineHeight];
    double v31 = v30;
    double v32 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v22];
    [v32 descender];
    double v20 = v33 + v31 * 10.0;
  }
  if (a4) {
    *a4 = v21 > v28;
  }
  double v34 = v18;
  double v35 = v20;
  result.height = v35;
  result.width = v34;
  return result;
}

- (void)layoutForWidth:(double)a3 position:(int)a4
{
  v15.receiver = self;
  v15.super_class = (Class)EKEventDetailTextCell;
  -[EKEventDetailCell layoutForWidth:position:](&v15, sel_layoutForWidth_position_, *(void *)&a4);
  [(EKEventDetailTextCell *)self _layoutForWidth:a3];
  double v7 = v6;
  [(EKEventDetailTextCell *)self frame];
  double v9 = v8;
  double v11 = v10;
  if (self->_isTruncatingText)
  {
    double v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v12 descender];
    double v14 = CalCeilToScreenScale(v7 + v13);
  }
  else
  {
    double v14 = CalCeilToScreenScale(v7);
  }
  -[EKEventDetailTextCell setFrame:](self, "setFrame:", v9, v11, a3, v14);
}

- (void)cellHeaderTapped
{
  id v2 = [(EKEventDetailTextCell *)self delegate];
  [v2 requestShowCellDetail];
}

- (BOOL)isTruncatingText
{
  return self->_isTruncatingText;
}

- (EKEventDetailTextCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKEventDetailTextCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_sizingTextView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_textFromEventBlock, 0);
}

@end