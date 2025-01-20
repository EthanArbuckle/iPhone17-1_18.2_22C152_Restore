@interface HUEditableTextViewCell
- (BOOL)editEnabled;
- (BOOL)isDisabled;
- (BOOL)showingPlaceholder;
- (HUEditableTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)placeholderText;
- (NSString)text;
- (UITextView)textView;
- (UITextViewDelegate)textViewDelegate;
- (id)trimmedStringForText:(id)a3;
- (void)handleUITextViewTextDidBeginEditingNotification:(id)a3;
- (void)handleUITextViewTextDidEndEditingNotification:(id)a3;
- (void)prepareForReuse;
- (void)setDisabled:(BOOL)a3;
- (void)setEditEnabled:(BOOL)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowingPlaceholder:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextView:(id)a3;
- (void)setTextViewDelegate:(id)a3;
- (void)updateTextColor;
@end

@implementation HUEditableTextViewCell

- (HUEditableTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v40.receiver = self;
  v40.super_class = (Class)HUEditableTextViewCell;
  v4 = [(HUEditableTextViewCell *)&v40 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42F58]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:textContainer:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textView = v4->_textView;
    v4->_textView = (UITextView *)v6;

    [(UITextView *)v4->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UITextView *)v4->_textView setFont:v8];

    [(UITextView *)v4->_textView setAdjustsFontForContentSizeCategory:1];
    -[UITextView setTextContainerInset:](v4->_textView, "setTextContainerInset:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
    v9 = [(UITextView *)v4->_textView textContainer];
    [v9 setLineFragmentPadding:0.0];

    v10 = [MEMORY[0x1E4F428B8] clearColor];
    [(UITextView *)v4->_textView setBackgroundColor:v10];

    v11 = [(HUEditableTextViewCell *)v4 contentView];
    [v11 addSubview:v4->_textView];

    v12 = [MEMORY[0x1E4F1CA48] array];
    v13 = [(UITextView *)v4->_textView leadingAnchor];
    v14 = [(HUEditableTextViewCell *)v4 contentView];
    v15 = [v14 layoutMarginsGuide];
    v16 = [v15 leadingAnchor];
    v17 = [v13 constraintEqualToAnchor:v16];
    [v12 addObject:v17];

    v18 = [(UITextView *)v4->_textView trailingAnchor];
    v19 = [(HUEditableTextViewCell *)v4 contentView];
    v20 = [v19 layoutMarginsGuide];
    v21 = [v20 trailingAnchor];
    v22 = [v18 constraintEqualToAnchor:v21];
    [v12 addObject:v22];

    v23 = [(UITextView *)v4->_textView topAnchor];
    v24 = [(HUEditableTextViewCell *)v4 contentView];
    v25 = [v24 layoutMarginsGuide];
    v26 = [v25 topAnchor];
    v27 = [v23 constraintEqualToAnchor:v26];
    [v12 addObject:v27];

    v28 = [(UITextView *)v4->_textView bottomAnchor];
    v29 = [(HUEditableTextViewCell *)v4 contentView];
    v30 = [v29 layoutMarginsGuide];
    v31 = [v30 bottomAnchor];
    v32 = [v28 constraintEqualToAnchor:v31];
    [v12 addObject:v32];

    v33 = [(HUEditableTextViewCell *)v4 contentView];
    v34 = [v33 heightAnchor];
    v35 = [v34 constraintEqualToConstant:176.0];

    LODWORD(v36) = 1144750080;
    [v35 setPriority:v36];
    [v12 addObject:v35];
    [MEMORY[0x1E4F28DC8] activateConstraints:v12];
    v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v37 addObserver:v4 selector:sel_handleUITextViewTextDidBeginEditingNotification_ name:*MEMORY[0x1E4F43E90] object:0];

    v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v38 addObserver:v4 selector:sel_handleUITextViewTextDidEndEditingNotification_ name:*MEMORY[0x1E4F43EA0] object:0];
  }
  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    id v4 = [(HUEditableTextViewCell *)self textView];
    [v4 becomeFirstResponder];
  }
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)HUEditableTextViewCell;
  [(HUEditableTextViewCell *)&v5 prepareForReuse];
  [(HUEditableTextViewCell *)self setText:0];
  [(HUEditableTextViewCell *)self setPlaceholderText:0];
  [(HUEditableTextViewCell *)self setShowingPlaceholder:0];
  v3 = [(HUEditableTextViewCell *)self textView];
  [v3 setText:0];

  id v4 = [(HUEditableTextViewCell *)self textView];
  [v4 setDelegate:0];

  [(HUEditableTextViewCell *)self updateTextColor];
}

- (void)handleUITextViewTextDidBeginEditingNotification:(id)a3
{
  id v7 = [a3 object];
  id v4 = [(HUEditableTextViewCell *)self textView];

  objc_super v5 = v7;
  if (v7 == v4)
  {
    if ([(HUEditableTextViewCell *)self showingPlaceholder])
    {
      [(HUEditableTextViewCell *)self setShowingPlaceholder:0];
      uint64_t v6 = [(HUEditableTextViewCell *)self textView];
      [v6 setText:0];
    }
    [(HUEditableTextViewCell *)self updateTextColor];
    objc_super v5 = v7;
  }
}

- (void)handleUITextViewTextDidEndEditingNotification:(id)a3
{
  id v14 = [a3 object];
  id v4 = [(HUEditableTextViewCell *)self textView];

  objc_super v5 = v14;
  if (v14 == v4)
  {
    uint64_t v6 = [v14 text];
    id v7 = [(HUEditableTextViewCell *)self trimmedStringForText:v6];
    v8 = [(HUEditableTextViewCell *)self textView];
    [v8 setText:v7];

    v9 = [(HUEditableTextViewCell *)self textView];
    v10 = [v9 text];
    if ([v10 isEqualToString:&stru_1F18F92B8])
    {
      v11 = [(HUEditableTextViewCell *)self placeholderText];

      objc_super v5 = v14;
      if (!v11) {
        goto LABEL_7;
      }
      [(HUEditableTextViewCell *)self setShowingPlaceholder:1];
      placeholderText = self->_placeholderText;
      v13 = [(HUEditableTextViewCell *)self textView];
      [v13 setText:placeholderText];

      [(HUEditableTextViewCell *)self updateTextColor];
    }
    else
    {
    }
    objc_super v5 = v14;
  }
LABEL_7:
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  [(HUEditableTextViewCell *)self updateTextColor];
}

- (void)setEditEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUEditableTextViewCell *)self textView];
  [v4 setEditable:v3];
}

- (UITextViewDelegate)textViewDelegate
{
  v2 = [(HUEditableTextViewCell *)self textView];
  BOOL v3 = [v2 delegate];

  return (UITextViewDelegate *)v3;
}

- (void)setTextViewDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HUEditableTextViewCell *)self textView];
  [v5 setDelegate:v4];
}

- (NSString)text
{
  if ([(HUEditableTextViewCell *)self showingPlaceholder]) {
    goto LABEL_3;
  }
  BOOL v3 = [(HUEditableTextViewCell *)self textView];
  id v4 = [v3 text];
  id v5 = [(HUEditableTextViewCell *)self placeholderText];
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
LABEL_3:
    id v7 = 0;
  }
  else
  {
    v8 = [(HUEditableTextViewCell *)self textView];
    v9 = [v8 text];
    id v7 = [(HUEditableTextViewCell *)self trimmedStringForText:v9];
  }

  return (NSString *)v7;
}

- (void)setText:(id)a3
{
  id v4 = [(HUEditableTextViewCell *)self trimmedStringForText:a3];
  text = self->_text;
  self->_text = v4;

  if ([(NSString *)self->_text isEqualToString:&stru_1F18F92B8])
  {
    char v6 = [(HUEditableTextViewCell *)self placeholderText];

    if (!v6) {
      goto LABEL_6;
    }
    [(HUEditableTextViewCell *)self setShowingPlaceholder:1];
    id v7 = [(HUEditableTextViewCell *)self placeholderText];
    v8 = [(HUEditableTextViewCell *)self textView];
    [v8 setText:v7];
  }
  else
  {
    [(HUEditableTextViewCell *)self setShowingPlaceholder:0];
    v9 = self->_text;
    id v7 = [(HUEditableTextViewCell *)self textView];
    [v7 setText:v9];
  }

LABEL_6:

  [(HUEditableTextViewCell *)self updateTextColor];
}

- (void)setPlaceholderText:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_placeholderText, a3);
  id v5 = [(HUEditableTextViewCell *)self textView];
  char v6 = [v5 text];
  int v7 = [v6 isEqualToString:&stru_1F18F92B8];

  if (v7)
  {
    [(HUEditableTextViewCell *)self setShowingPlaceholder:1];
    placeholderText = self->_placeholderText;
    v9 = [(HUEditableTextViewCell *)self textView];
    [v9 setText:placeholderText];
  }
  else
  {
    [(HUEditableTextViewCell *)self setShowingPlaceholder:0];
  }
  [(HUEditableTextViewCell *)self updateTextColor];
}

- (void)updateTextColor
{
  if ([(HUEditableTextViewCell *)self showingPlaceholder]
    || [(HUEditableTextViewCell *)self isDisabled])
  {
    id v6 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    int v3 = 0;
    int v4 = 1;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F428B8] labelColor];
    int v4 = 0;
    int v3 = 1;
  }
  id v5 = [(HUEditableTextViewCell *)self textView];
  [v5 setTextColor:v6];

  if (v3) {
  if (v4)
  }
  {
  }
}

- (id)trimmedStringForText:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  id v5 = [v3 whitespaceAndNewlineCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (BOOL)editEnabled
{
  return self->_editEnabled;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (BOOL)showingPlaceholder
{
  return self->_showingPlaceholder;
}

- (void)setShowingPlaceholder:(BOOL)a3
{
  self->_showingPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end