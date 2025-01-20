@interface HKMedicalIDEditorMultilineStringCell
+ (BOOL)showsLabelAndValue;
- (CGRect)_cursorRectForTextView:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HKMedicalIDEditorCellHeightChangeDelegate)heightChangeDelegate;
- (HKMedicalIDEditorMultilineStringCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)placeholder;
- (NSString)stringValue;
- (UIEdgeInsets)textViewExtraMargins;
- (UILabel)placeholderLabel;
- (UITextView)textView;
- (double)estimatedHeightWithWidth:(double)a3;
- (id)label;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_labelTapped:(id)a3;
- (void)commitEditing;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setHeightChangeDelegate:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setTextViewExtraMargins:(UIEdgeInsets)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation HKMedicalIDEditorMultilineStringCell

- (HKMedicalIDEditorMultilineStringCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)HKMedicalIDEditorMultilineStringCell;
  v4 = [(HKMedicalIDEditorCell *)&v20 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    labelLabel = v4->_labelLabel;
    v4->_labelLabel = v5;

    v7 = HKHealthKeyColor();
    [(UILabel *)v4->_labelLabel setTextColor:v7];

    [(UILabel *)v4->_labelLabel setTextAlignment:4];
    [(UILabel *)v4->_labelLabel setNumberOfLines:0];
    v8 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    textView = v4->_textView;
    v4->_textView = v8;

    [(UITextView *)v4->_textView setDelegate:v4];
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v4->_textView setBackgroundColor:v10];

    -[UITextView setContentInset:](v4->_textView, "setContentInset:", -5.0, 0.0, -5.0, 0.0);
    [(UITextView *)v4->_textView setTextAlignment:4];
    [(UITextView *)v4->_textView setScrollEnabled:0];
    v11 = [MEMORY[0x1E4FB1618] labelColor];
    [(UITextView *)v4->_textView setTextColor:v11];

    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    placeholderLabel = v4->_placeholderLabel;
    v4->_placeholderLabel = v12;

    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v4->_placeholderLabel setTextColor:v14];

    [(UILabel *)v4->_placeholderLabel setTextAlignment:4];
    v15 = [(HKMedicalIDEditorMultilineStringCell *)v4 contentView];
    [v15 addSubview:v4->_labelLabel];

    v16 = [(HKMedicalIDEditorMultilineStringCell *)v4 contentView];
    [v16 addSubview:v4->_textView];

    v17 = [(HKMedicalIDEditorMultilineStringCell *)v4 contentView];
    [v17 addSubview:v4->_placeholderLabel];

    v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__labelTapped_];
    [(UILabel *)v4->_labelLabel addGestureRecognizer:v18];
    [(UILabel *)v4->_labelLabel setUserInteractionEnabled:1];
    [(HKMedicalIDEditorMultilineStringCell *)v4 setAccessoryType:0];
    [(HKMedicalIDEditorMultilineStringCell *)v4 _contentSizeCategoryDidChange:0];
  }
  return v4;
}

- (void)dealloc
{
  [(UITextView *)self->_textView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorMultilineStringCell;
  [(HKMedicalIDEditorCell *)&v3 dealloc];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDEditorMultilineStringCell;
  [(HKMedicalIDEditorCell *)&v7 _contentSizeCategoryDidChange:a3];
  v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [(UILabel *)self->_labelLabel setFont:v4];

  v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UITextView *)self->_textView setFont:v5];

  v6 = [(UITextView *)self->_textView font];
  [(UILabel *)self->_placeholderLabel setFont:v6];
}

- (void)layoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)HKMedicalIDEditorMultilineStringCell;
  [(HKMedicalIDEditorMultilineStringCell *)&v49 layoutSubviews];
  BOOL v3 = [(UIView *)self hk_isLeftToRight];
  [(HKMedicalIDEditorMultilineStringCell *)self textViewExtraMargins];
  double v5 = v4;
  [(HKMedicalIDEditorMultilineStringCell *)self textViewExtraMargins];
  double v6 = 0.0;
  if (v7 > 0.0)
  {
    [(HKMedicalIDEditorMultilineStringCell *)self textViewExtraMargins];
    double v9 = v8;
    [(HKMedicalIDEditorMultilineStringCell *)self separatorInset];
    double v6 = v9 + v10 + -16.0;
  }
  double v11 = v5 + 9.0;
  if (v3)
  {
    double v12 = v6 + 16.0;
    v13 = [(HKMedicalIDEditorMultilineStringCell *)self contentView];
    [v13 bounds];
    double v15 = v14 - (v6 + 16.0) - 14.0;
  }
  else
  {
    v16 = [(HKMedicalIDEditorMultilineStringCell *)self contentView];
    [v16 bounds];
    double v15 = v17 - (v6 + 16.0) - 14.0;

    v13 = [(HKMedicalIDEditorMultilineStringCell *)self contentView];
    [v13 bounds];
    double v12 = v18 - v15 + -16.0 - v6;
  }

  -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:", v15, 100000.0);
  CGFloat v20 = v19;
  v50.origin.x = v12;
  v50.origin.y = v11;
  v50.size.width = v15;
  v50.size.height = v20;
  double MaxY = CGRectGetMaxY(v50);
  if (v3)
  {
    double v22 = v12 + -5.0;
  }
  else
  {
    v51.origin.x = v12;
    v51.origin.y = v11;
    v51.size.width = v15;
    v51.size.height = v20;
    double v22 = CGRectGetMaxX(v51) - (v15 + 10.0) + 5.0;
  }
  unint64_t v48 = *(void *)&v22;
  double v23 = MaxY + -4.0;
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v15 + 10.0, 100000.0, *(void *)&v11);
  double v25 = v24;
  v26 = [(UITextView *)self->_textView font];
  [v26 lineHeight];
  double v28 = v27 + 20.0;

  if (v25 < v28) {
    double v25 = v28;
  }
  v29 = [(UILabel *)self->_placeholderLabel font];
  [v29 lineHeight];
  unint64_t v31 = v30;

  v32.n128_f64[0] = v12;
  v33.n128_u64[0] = v47;
  v34.n128_f64[0] = v15;
  v35.n128_f64[0] = v20;
  HKUIRectIntegralToScreenScale(v32, v33, v34, v35, v36);
  -[UILabel setFrame:](self->_labelLabel, "setFrame:");
  v37.n128_u64[0] = v48;
  v38.n128_f64[0] = v23;
  v39.n128_f64[0] = v15 + 10.0;
  v40.n128_f64[0] = v25;
  HKUIRectIntegralToScreenScale(v37, v38, v39, v40, v41);
  -[UITextView setFrame:](self->_textView, "setFrame:");
  v42.n128_f64[0] = v12;
  v43.n128_f64[0] = v23 + 8.0;
  v44.n128_f64[0] = v15;
  v45.n128_u64[0] = v31;
  HKUIRectIntegralToScreenScale(v42, v43, v44, v45, v46);
  -[UILabel setFrame:](self->_placeholderLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(UITextView *)self->_textView frame];
  double v6 = v5;
  textView = self->_textView;
  [(UITextView *)textView bounds];
  -[UITextView sizeThatFits:](textView, "sizeThatFits:", CGRectGetWidth(v17), 100000.0);
  double v9 = v8;
  double v10 = [(UITextView *)self->_textView font];
  [v10 lineHeight];
  double v12 = v11 + 20.0;

  if (v9 >= v12) {
    double v13 = v9;
  }
  else {
    double v13 = v12;
  }
  double v14 = v6 + v13 + 23.0;
  double v15 = width;
  result.height = v14;
  result.CGFloat width = v15;
  return result;
}

- (double)estimatedHeightWithWidth:(double)a3
{
  [(HKMedicalIDEditorMultilineStringCell *)self textViewExtraMargins];
  double v5 = 16.0;
  if (v6 > 0.0)
  {
    [(HKMedicalIDEditorMultilineStringCell *)self textViewExtraMargins];
    double v8 = v7;
    [(HKMedicalIDEditorMultilineStringCell *)self separatorInset];
    double v5 = v8 + v9 + -16.0 + 16.0;
  }
  [(HKMedicalIDEditorMultilineStringCell *)self textViewExtraMargins];
  CGFloat v11 = v10 + 9.0;
  CGFloat v12 = a3 - v5 - 14.0;
  -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:", v12, 100000.0);
  v27.size.height = v13;
  double v14 = v5 + -5.0;
  v27.origin.x = v5;
  v27.origin.y = v11;
  v27.size.CGFloat width = v12;
  double v15 = CGRectGetMaxY(v27) + -4.0;
  double v16 = v12 + 10.0;
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v16, 100000.0);
  double v18 = v17;
  double v19 = [(UITextView *)self->_textView font];
  [v19 lineHeight];
  double v21 = v20 + 20.0;

  if (v18 >= v21) {
    double v22 = v18;
  }
  else {
    double v22 = v21;
  }
  double v23 = v14;
  double v24 = v15;
  double v25 = v16;
  return CGRectGetMaxY(*(CGRect *)(&v22 - 3)) + 23.0;
}

+ (BOOL)showsLabelAndValue
{
  return 0;
}

- (void)setLabel:(id)a3
{
  id v4 = (id)[a3 copy];
  [(UILabel *)self->_labelLabel setText:v4];
}

- (id)label
{
  return [(UILabel *)self->_labelLabel text];
}

- (void)setStringValue:(id)a3
{
  textView = self->_textView;
  id v5 = a3;
  [(UITextView *)textView setText:v5];
  uint64_t v6 = [v5 length];

  placeholderLabel = self->_placeholderLabel;
  [(UILabel *)placeholderLabel setHidden:v6 != 0];
}

- (NSString)stringValue
{
  return [(UITextView *)self->_textView text];
}

- (void)setPlaceholder:(id)a3
{
  id v4 = (id)[a3 copy];
  [(UILabel *)self->_placeholderLabel setText:v4];
}

- (NSString)placeholder
{
  return [(UILabel *)self->_placeholderLabel text];
}

- (UILabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (CGRect)_cursorRectForTextView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 selectedTextRange];
  uint64_t v6 = [v5 end];
  [v4 caretRectForPosition:v6];
  double v8 = v7;
  double v10 = v9;

  [v4 bounds];
  double MaxX = CGRectGetMaxX(v29);
  if (MaxX < v8) {
    double v8 = MaxX;
  }
  [v4 bounds];
  double MaxY = CGRectGetMaxY(v30);
  if (MaxY < v10) {
    double v10 = MaxY;
  }
  [v4 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v31.origin.x = v14;
  v31.origin.y = v16;
  v31.size.CGFloat width = v18;
  v31.size.height = v20;
  CGFloat Width = CGRectGetWidth(v31);
  double v22 = [(UITextView *)self->_textView font];
  [v22 pointSize];
  double v24 = v23;

  double v25 = v8;
  double v26 = v10;
  double v27 = Width;
  double v28 = v24;
  result.size.height = v28;
  result.size.CGFloat width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v15 = a3;
  id v4 = [v15 selectedTextRange];
  int v5 = [v4 isEmpty];

  if (v5)
  {
    [(HKMedicalIDEditorMultilineStringCell *)self _cursorRectForTextView:v15];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_heightChangeDelegate);
    objc_msgSend(WeakRetained, "medicalIDEditorCellDidChangeSelection:keepRectVisible:inView:", self, v15, v7, v9, v11, v13);
  }
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKMedicalIDEditorMultilineStringCell;
  [(HKMedicalIDEditorCell *)&v8 beginEditing];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__HKMedicalIDEditorMultilineStringCell_textViewDidBeginEditing___block_invoke;
  v6[3] = &unk_1E6D513B0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __64__HKMedicalIDEditorMultilineStringCell_textViewDidBeginEditing___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cursorRectForTextView:*(void *)(a1 + 40)];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1096));
  objc_msgSend(WeakRetained, "medicalIDEditorCellDidBeginEditing:keepRectVisible:inView:", *(void *)(a1 + 32), *(void *)(a1 + 40), v3, v5, v7, v9);
}

- (void)textViewDidChange:(id)a3
{
  id v15 = a3;
  [(HKMedicalIDEditorMultilineStringCell *)self setNeedsLayout];
  double v4 = [v15 text];
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", [v4 length] != 0);

  [v15 bounds];
  objc_msgSend(v15, "sizeThatFits:", CGRectGetWidth(v17), 100000.0);
  if (self->_lastSeenTextViewContentHeight != v5)
  {
    self->_lastSeenTextViewContentHeight = v5;
    [(HKMedicalIDEditorMultilineStringCell *)self _cursorRectForTextView:v15];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_heightChangeDelegate);
    objc_msgSend(WeakRetained, "medicalIDEditorCell:didChangeHeight:keepRectVisible:inView:", self, v15, self->_lastSeenTextViewContentHeight, v7, v9, v11, v13);
  }
}

- (void)textViewDidEndEditing:(id)a3
{
  double v4 = [a3 text];
  [(HKMedicalIDEditorMultilineStringCell *)self setStringValue:v4];

  [(HKMedicalIDEditorCell *)self valueDidChange];
}

- (void)_labelTapped:(id)a3
{
}

- (void)commitEditing
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (HKMedicalIDEditorCellHeightChangeDelegate)heightChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_heightChangeDelegate);
  return (HKMedicalIDEditorCellHeightChangeDelegate *)WeakRetained;
}

- (void)setHeightChangeDelegate:(id)a3
{
}

- (UIEdgeInsets)textViewExtraMargins
{
  double top = self->_textViewExtraMargins.top;
  double left = self->_textViewExtraMargins.left;
  double bottom = self->_textViewExtraMargins.bottom;
  double right = self->_textViewExtraMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextViewExtraMargins:(UIEdgeInsets)a3
{
  self->_textViewExtraMargins = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_heightChangeDelegate);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
}

@end