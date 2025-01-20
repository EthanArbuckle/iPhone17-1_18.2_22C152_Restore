@interface SFAccountNoteTableViewCell
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (SFAccountNoteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SFAccountNoteTableViewCellDelegate)delegate;
- (UITextView)textView;
- (id)textDidChange;
- (void)_didTapTextView;
- (void)_updateHeightConstraint;
- (void)layoutMarginsDidChange;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setTextDidChange:(id)a3;
- (void)setTextView:(id)a3;
- (void)textViewDidChange:(id)a3;
@end

@implementation SFAccountNoteTableViewCell

- (SFAccountNoteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)SFAccountNoteTableViewCell;
  v4 = [(SFAccountNoteTableViewCell *)&v41 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F78280]) initWithMaxHeight:350.0];
    textView = v4->_textView;
    v4->_textView = (UITextView *)v5;

    v7 = +[_SFAccountManagerAppearanceValues subtitleFontForLargerCell];
    [(UITextView *)v4->_textView setFont:v7];

    v8 = [(UITextView *)v4->_textView textContainer];
    [v8 setLineFragmentPadding:0.0];

    v9 = [(SFAccountNoteTableViewCell *)v4 contentView];
    [v9 layoutMargins];
    -[UITextView setTextContainerInset:](v4->_textView, "setTextContainerInset:");

    id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
    v11 = _WBSLocalizedString();
    uint64_t v43 = *MEMORY[0x1E4FB12B8];
    v12 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    v44[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    v14 = (void *)[v10 initWithString:v11 attributes:v13];
    [(UITextView *)v4->_textView setAttributedPlaceholder:v14];

    [(UITextView *)v4->_textView setDelegate:v4];
    v15 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v4->_textView setBackgroundColor:v15];

    v16 = [MEMORY[0x1E4FB1618] tintColor];
    [(UITextView *)v4->_textView setTintColor:v16];

    v17 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__didTapTextView];
    [(UITextView *)v4->_textView addGestureRecognizer:v17];
    textViewTapGestureRecognizer = v4->_textViewTapGestureRecognizer;
    v4->_textViewTapGestureRecognizer = v17;
    v36 = v17;

    v19 = [(SFAccountNoteTableViewCell *)v4 contentView];
    [v19 addSubview:v4->_textView];

    [(UITextView *)v4->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFAccountNoteTableViewCell *)v4 _updateHeightConstraint];
    v32 = (void *)MEMORY[0x1E4F28DC8];
    v39 = [(UITextView *)v4->_textView leadingAnchor];
    v40 = [(SFAccountNoteTableViewCell *)v4 contentView];
    v38 = [v40 leadingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v42[0] = v37;
    v34 = [(UITextView *)v4->_textView trailingAnchor];
    v35 = [(SFAccountNoteTableViewCell *)v4 contentView];
    v33 = [v35 trailingAnchor];
    v31 = [v34 constraintEqualToAnchor:v33];
    v42[1] = v31;
    v20 = [(UITextView *)v4->_textView topAnchor];
    v21 = [(SFAccountNoteTableViewCell *)v4 contentView];
    v22 = [v21 topAnchor];
    v23 = [v20 constraintEqualToAnchor:v22];
    v42[2] = v23;
    v24 = [(UITextView *)v4->_textView bottomAnchor];
    v25 = [(SFAccountNoteTableViewCell *)v4 contentView];
    v26 = [v25 bottomAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    v42[3] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
    [v32 activateConstraints:v28];

    v29 = v4;
  }

  return v4;
}

- (void)layoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)SFAccountNoteTableViewCell;
  [(SFAccountNoteTableViewCell *)&v4 layoutMarginsDidChange];
  v3 = [(SFAccountNoteTableViewCell *)self contentView];
  [v3 layoutMargins];
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFAccountNoteTableViewCell;
  [(SFAccountNoteTableViewCell *)&v7 setEditing:a3 animated:a4];
  v6 = [(SFAccountNoteTableViewCell *)self textView];
  [v6 setEditable:v4];

  [(UITapGestureRecognizer *)self->_textViewTapGestureRecognizer setEnabled:v4 ^ 1];
  [(SFAccountNoteTableViewCell *)self _updateHeightConstraint];
}

- (void)_updateHeightConstraint
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SFAccountNoteTableViewCell *)self textView];
  if ([v3 isEditable])
  {

LABEL_6:
    heightConstraint = self->_heightConstraint;
    if (!heightConstraint)
    {
      id v10 = [(UITextView *)self->_textView heightAnchor];
      v11 = [v10 constraintGreaterThanOrEqualToConstant:62.0];
      v12 = self->_heightConstraint;
      self->_heightConstraint = v11;

      LODWORD(v13) = 1144750080;
      [(NSLayoutConstraint *)self->_heightConstraint setPriority:v13];
      heightConstraint = self->_heightConstraint;
    }
    v14 = (void *)MEMORY[0x1E4F28DC8];
    v15 = heightConstraint;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v14 activateConstraints:v8];
    goto LABEL_9;
  }
  BOOL v4 = [(SFAccountNoteTableViewCell *)self textView];
  uint64_t v5 = [v4 text];
  uint64_t v6 = [v5 length];

  if (!v6) {
    goto LABEL_6;
  }
  if (!self->_heightConstraint) {
    return;
  }
  objc_super v7 = (void *)MEMORY[0x1E4F28DC8];
  v16[0] = self->_heightConstraint;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v7 deactivateConstraints:v8];
LABEL_9:
}

- (void)_didTapTextView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained noteTableViewCellTextViewTapped:self];
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  id v7 = a5;
  v8 = [a3 text];
  uint64_t v9 = [v8 length];
  uint64_t v10 = [v7 length];

  LOBYTE(length) = v9 - length + v10 <= *MEMORY[0x1E4F99538];
  return length;
}

- (void)textViewDidChange:(id)a3
{
  [a3 invalidateIntrinsicContentSize];
  id textDidChange = self->_textDidChange;
  if (textDidChange)
  {
    uint64_t v5 = (void (*)(void))*((void *)textDidChange + 2);
    v5();
  }
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (id)textDidChange
{
  return self->_textDidChange;
}

- (void)setTextDidChange:(id)a3
{
}

- (SFAccountNoteTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAccountNoteTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_textDidChange, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textViewTapGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end