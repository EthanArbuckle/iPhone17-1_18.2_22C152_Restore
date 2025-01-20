@interface MULabeledValueActionTextFieldRowView
- (BOOL)becomeFirstResponder;
- (BOOL)isEditing;
- (BOOL)resignFirstResponder;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (MULabeledValueActionTextFieldRowView)initWithFrame:(CGRect)a3;
- (MULabeledValueActionTextFieldRowViewDelegate)delegate;
- (NSString)currentTextFieldValue;
- (NSString)placeholderText;
- (NSString)titleText;
- (UIColor)placeholderColor;
- (id)textView;
- (unint64_t)maximumNumberOfCharacters;
- (unint64_t)maximumNumberOfLines;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)setCurrentTextFieldValue:(id)a3;
- (void)setCurrentTextFieldValueIfNeeded:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximumNumberOfCharacters:(unint64_t)a3;
- (void)setMaximumNumberOfLines:(unint64_t)a3;
- (void)setPlaceholderColor:(id)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation MULabeledValueActionTextFieldRowView

- (MULabeledValueActionTextFieldRowView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MULabeledValueActionTextFieldRowView;
  v3 = -[MUPlaceSectionRowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_maximumNumberOfCharacters = 100;
    [(MULabeledValueActionTextFieldRowView *)v3 _setupSubviews];
    [(MULabeledValueActionTextFieldRowView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupSubviews
{
  v3 = +[MUInfoCardStyle labelForProminence:1];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [MEMORY[0x1E4F30EA8] sharedManager];
  v5 = [v4 sectionHeaderFont];
  [v3 setFont:v5];

  objc_super v6 = +[MUInfoCardStyle secondaryTextColor];
  [v3 setTextColor:v6];

  titleLabel = self->_titleLabel;
  self->_titleLabel = (MULabelViewProtocol *)v3;

  [(MULabelViewProtocol *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MULabelViewProtocol *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
  [(MULabeledValueActionTextFieldRowView *)self addSubview:self->_titleLabel];
  objc_msgSend(MEMORY[0x1E4FB1DD8], "_mapsui_defaultTextView");
  v8 = (UITextView *)objc_claimAutoreleasedReturnValue();
  valueTextField = self->_valueTextField;
  self->_valueTextField = v8;

  [(UITextView *)self->_valueTextField setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextView *)self->_valueTextField setAdjustsFontForContentSizeCategory:1];
  v10 = [MEMORY[0x1E4F30EA8] sharedManager];
  v11 = [v10 bodyFont];
  [(UITextView *)self->_valueTextField setFont:v11];

  [(UITextView *)self->_valueTextField setEditable:1];
  [(UITextView *)self->_valueTextField setScrollEnabled:0];
  v12 = [MEMORY[0x1E4FB1618] clearColor];
  [(UITextView *)self->_valueTextField setBackgroundColor:v12];

  v13 = [(UITextView *)self->_valueTextField textContainer];
  [v13 setMaximumNumberOfLines:5];

  [(UITextView *)self->_valueTextField setDelegate:self];
  [(MULabeledValueActionTextFieldRowView *)self addSubview:self->_valueTextField];
  v14 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  titleValueLayoutGuide = self->_titleValueLayoutGuide;
  self->_titleValueLayoutGuide = v14;

  v16 = self->_titleValueLayoutGuide;
  [(MULabeledValueActionTextFieldRowView *)self addLayoutGuide:v16];
}

- (void)_setupConstraints
{
  v38[11] = *MEMORY[0x1E4F143B8];
  v25 = (void *)MEMORY[0x1E4F28DC8];
  v37 = [(MULabelViewProtocol *)self->_titleLabel leadingAnchor];
  v36 = [(UILayoutGuide *)self->_titleValueLayoutGuide leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v38[0] = v35;
  v34 = [(MULabelViewProtocol *)self->_titleLabel topAnchor];
  v33 = [(UILayoutGuide *)self->_titleValueLayoutGuide topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v38[1] = v32;
  v31 = [(MULabelViewProtocol *)self->_titleLabel trailingAnchor];
  v30 = [(UILayoutGuide *)self->_titleValueLayoutGuide trailingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v38[2] = v29;
  v28 = [(MULabelViewProtocol *)self->_titleLabel bottomAnchor];
  v27 = [(UITextView *)self->_valueTextField topAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v38[3] = v26;
  v24 = [(UITextView *)self->_valueTextField leadingAnchor];
  v23 = [(UILayoutGuide *)self->_titleValueLayoutGuide leadingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v38[4] = v22;
  v21 = [(UITextView *)self->_valueTextField trailingAnchor];
  v20 = [(UILayoutGuide *)self->_titleValueLayoutGuide trailingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v38[5] = v19;
  v18 = [(UITextView *)self->_valueTextField bottomAnchor];
  v17 = [(UILayoutGuide *)self->_titleValueLayoutGuide bottomAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v38[6] = v16;
  v15 = [(UILayoutGuide *)self->_titleValueLayoutGuide leadingAnchor];
  v14 = [(MULabeledValueActionTextFieldRowView *)self leadingAnchor];
  v13 = [v15 constraintEqualToAnchor:v14 constant:16.0];
  v38[7] = v13;
  v3 = [(UILayoutGuide *)self->_titleValueLayoutGuide trailingAnchor];
  v4 = [(MULabeledValueActionTextFieldRowView *)self trailingAnchor];
  v5 = [v3 constraintEqualToAnchor:v4 constant:-16.0];
  v38[8] = v5;
  objc_super v6 = [(UILayoutGuide *)self->_titleValueLayoutGuide topAnchor];
  v7 = [(MULabeledValueActionTextFieldRowView *)self topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:12.0];
  v38[9] = v8;
  v9 = [(UILayoutGuide *)self->_titleValueLayoutGuide bottomAnchor];
  v10 = [(MULabeledValueActionTextFieldRowView *)self bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:-12.0];
  v38[10] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:11];
  [v25 activateConstraints:v12];
}

- (unint64_t)maximumNumberOfLines
{
  v2 = [(UITextView *)self->_valueTextField textContainer];
  unint64_t v3 = [v2 maximumNumberOfLines];

  return v3;
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  id v4 = [(UITextView *)self->_valueTextField textContainer];
  [v4 setMaximumNumberOfLines:a3];
}

- (id)textView
{
  return self->_valueTextField;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  v8 = [v7 text];
  v9 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v10 = [v8 componentsSeparatedByCharactersInSet:v9];

  v11 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v12 = [v6 componentsSeparatedByCharactersInSet:v11];

  uint64_t v13 = [v10 count];
  unint64_t v14 = v13 + [v12 count] - 1;
  v15 = [v7 textContainer];

  LOBYTE(v7) = v14 <= [v15 maximumNumberOfLines];
  return (char)v7;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = [(MULabeledValueActionTextFieldRowView *)self delegate];
  [v4 textFieldRowViewDidBeginEditing:self];
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = [(MULabeledValueActionTextFieldRowView *)self delegate];
  [v4 textFieldRowViewDidEndEditing:self];
}

- (void)textViewDidChange:(id)a3
{
  id v12 = a3;
  id v4 = [v12 text];
  v5 = [v12 text];
  unint64_t v6 = [v5 length];

  if (v6 >= self->_maximumNumberOfCharacters) {
    unint64_t maximumNumberOfCharacters = self->_maximumNumberOfCharacters;
  }
  else {
    unint64_t maximumNumberOfCharacters = v6;
  }
  v8 = objc_msgSend(v4, "substringWithRange:", 0, maximumNumberOfCharacters);

  v9 = [v12 text];
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0) {
    [v12 setText:v8];
  }
  v11 = [(MULabeledValueActionTextFieldRowView *)self delegate];
  [v11 textFieldRowViewDidChange:self];
}

- (BOOL)becomeFirstResponder
{
  return [(UITextView *)self->_valueTextField becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  return [(UITextView *)self->_valueTextField resignFirstResponder];
}

- (BOOL)isEditing
{
  return [(UITextView *)self->_valueTextField isFirstResponder];
}

- (void)setCurrentTextFieldValue:(id)a3
{
}

- (NSString)currentTextFieldValue
{
  return [(UITextView *)self->_valueTextField text];
}

- (void)setTitleText:(id)a3
{
}

- (NSString)titleText
{
  return (NSString *)[(MULabelViewProtocol *)self->_titleLabel text];
}

- (void)setPlaceholderText:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  id v7 = [MEMORY[0x1E4F30EA8] sharedManager];
  v8 = [v7 bodyFont];
  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  char v10 = (void *)[v6 initWithString:v5 attributes:v9];

  [(UITextView *)self->_valueTextField setAttributedPlaceholder:v10];
}

- (NSString)placeholderText
{
  v2 = [(UITextView *)self->_valueTextField attributedPlaceholder];
  unint64_t v3 = [v2 string];

  return (NSString *)v3;
}

- (void)setCurrentTextFieldValueIfNeeded:(id)a3
{
  id v4 = a3;
  if (![(MULabeledValueActionTextFieldRowView *)self isEditing]) {
    [(MULabeledValueActionTextFieldRowView *)self setCurrentTextFieldValue:v4];
  }
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (void)setPlaceholderColor:(id)a3
{
}

- (MULabeledValueActionTextFieldRowViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MULabeledValueActionTextFieldRowViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)maximumNumberOfCharacters
{
  return self->_maximumNumberOfCharacters;
}

- (void)setMaximumNumberOfCharacters:(unint64_t)a3
{
  self->_unint64_t maximumNumberOfCharacters = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_titleValueLayoutGuide, 0);
  objc_storeStrong((id *)&self->_valueTextField, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end