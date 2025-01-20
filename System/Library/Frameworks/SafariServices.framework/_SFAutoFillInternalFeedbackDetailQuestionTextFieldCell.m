@interface _SFAutoFillInternalFeedbackDetailQuestionTextFieldCell
+ (NSString)reuseIdentifier;
- (NSString)placeholder;
- (NSString)text;
- (_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell)initWithFrame:(CGRect)a3;
- (_SFAutoFillInternalFeedbackDetailQuestionTextFieldCellDelegate)delegate;
- (void)_setShowPlaceholder:(BOOL)a3;
- (void)_updateTextViewHeight;
- (void)setDelegate:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setText:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation _SFAutoFillInternalFeedbackDetailQuestionTextFieldCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"_SFAutoFillInternalFeedbackDetailQuestionTextFieldCellReuseIdentifier";
}

- (_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell)initWithFrame:(CGRect)a3
{
  v38[5] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell;
  v3 = -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *)v3 setAutomaticallyUpdatesBackgroundConfiguration:0];
    v5 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    textView = v4->_textView;
    v4->_textView = v5;

    [(UITextView *)v4->_textView setDelegate:v4];
    v7 = (void *)MEMORY[0x1E4FB1798];
    [MEMORY[0x1E4FB1798] labelFontSize];
    v8 = objc_msgSend(v7, "systemFontOfSize:");
    [(UITextView *)v4->_textView setFont:v8];

    v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v4->_textView setBackgroundColor:v9];

    [(UITextView *)v4->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v10 = *MEMORY[0x1E4FB2848];
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    -[UITextView setContentInset:](v4->_textView, "setContentInset:", *MEMORY[0x1E4FB2848], v11, v12, v13);
    -[UITextView setTextContainerInset:](v4->_textView, "setTextContainerInset:", v10, v11, v12, v13);
    [(UITextView *)v4->_textView setEditable:1];
    v36 = [(_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *)v4 contentView];
    [v36 addSubview:v4->_textView];
    v14 = [(UITextView *)v4->_textView heightAnchor];
    [(UITextView *)v4->_textView contentSize];
    uint64_t v16 = [v14 constraintEqualToConstant:v15];
    textViewHeightConstraint = v4->_textViewHeightConstraint;
    v4->_textViewHeightConstraint = (NSLayoutConstraint *)v16;

    objc_msgSend(v36, "setLayoutMargins:", 8.0, 16.0, 8.0, 16.0);
    v18 = [(_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *)v4 contentView];
    v19 = [v18 layoutMarginsGuide];

    v30 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [(UITextView *)v4->_textView leadingAnchor];
    v34 = [v19 leadingAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v38[0] = v33;
    v32 = [(UITextView *)v4->_textView trailingAnchor];
    v31 = [v19 trailingAnchor];
    v20 = [v32 constraintEqualToAnchor:v31];
    v38[1] = v20;
    v21 = [(UITextView *)v4->_textView topAnchor];
    v22 = [v19 topAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v38[2] = v23;
    v24 = [(UITextView *)v4->_textView bottomAnchor];
    v25 = [v19 bottomAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v38[3] = v26;
    v38[4] = v4->_textViewHeightConstraint;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:5];
    [v30 activateConstraints:v27];

    [(_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *)v4 _setShowPlaceholder:1];
    v28 = v4;
  }
  return v4;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v6 = (id)[a3 copy];
  [v6 setHighlighted:0];
  [v6 setSelected:0];
  v4 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  v5 = [v4 updatedConfigurationForState:v6];
  [(_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *)self setBackgroundConfiguration:v5];
}

- (void)setText:(id)a3
{
  textView = self->_textView;
  id v5 = a3;
  [(UITextView *)textView setText:v5];
  uint64_t v6 = [v5 length];

  [(_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *)self _setShowPlaceholder:v6 == 0];

  [(_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *)self _updateTextViewHeight];
}

- (NSString)text
{
  return [(UITextView *)self->_textView text];
}

- (void)setPlaceholder:(id)a3
{
  v4 = (NSString *)[a3 copy];
  placeholder = self->_placeholder;
  self->_placeholder = v4;

  if (self->_isShowingPlaceholder)
  {
    [(UITextView *)self->_textView setText:self->_placeholder];
    [(_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *)self _updateTextViewHeight];
  }
}

- (void)textViewDidBeginEditing:(id)a3
{
}

- (void)textViewDidChange:(id)a3
{
  [(_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *)self _updateTextViewHeight];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained textFieldCellTextDidChange:self];
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = [a3 text];
  -[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell _setShowPlaceholder:](self, "_setShowPlaceholder:", [v4 length] == 0);
}

- (void)_setShowPlaceholder:(BOOL)a3
{
  if (self->_isShowingPlaceholder != a3)
  {
    self->_isShowingPlaceholder = a3;
    if (a3) {
      placeholder = self->_placeholder;
    }
    else {
      placeholder = 0;
    }
    [(UITextView *)self->_textView setText:placeholder];
    if (self->_isShowingPlaceholder) {
      [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    else {
    id v5 = [MEMORY[0x1E4FB1618] labelColor];
    }
    [(UITextView *)self->_textView setTextColor:v5];

    [(_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *)self _updateTextViewHeight];
  }
}

- (void)_updateTextViewHeight
{
  [(UITextView *)self->_textView contentSize];
  [(NSLayoutConstraint *)self->_textViewHeightConstraint setConstant:v3];

  [(_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell *)self invalidateIntrinsicContentSize];
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (_SFAutoFillInternalFeedbackDetailQuestionTextFieldCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFAutoFillInternalFeedbackDetailQuestionTextFieldCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_textViewHeightConstraint, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end