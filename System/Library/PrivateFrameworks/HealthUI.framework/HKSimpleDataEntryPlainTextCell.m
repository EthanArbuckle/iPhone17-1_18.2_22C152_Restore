@interface HKSimpleDataEntryPlainTextCell
- (BOOL)editDisabled;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (HKCaretOptionalTextField)inputTextField;
- (HKSimpleDataEntryCellDelegate)delegate;
- (HKSimpleDataEntryPlainTextCell)initWithIntention:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)lastChangedText;
- (UILabel)titleLabel;
- (void)_informDelegateForContentChange;
- (void)_setupInputTextFieldWithIntention:(int64_t)a3;
- (void)_setupLabels;
- (void)_setupLayoutConstraints;
- (void)_updateForCurrentSizeCategory;
- (void)beginEditing;
- (void)layoutMarginsDidChange;
- (void)setDelegate:(id)a3;
- (void)setEditDisabled:(BOOL)a3;
- (void)setInputTextField:(id)a3;
- (void)setLastChangedText:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKSimpleDataEntryPlainTextCell

- (HKSimpleDataEntryPlainTextCell)initWithIntention:(int64_t)a3 reuseIdentifier:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)HKSimpleDataEntryPlainTextCell;
  v5 = [(HKSimpleDataEntryPlainTextCell *)&v22 initWithStyle:0 reuseIdentifier:a4];
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v6;

    [(UILabel *)v5->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v5->_titleLabel setMinimumScaleFactor:0.7];
    [(UILabel *)v5->_titleLabel setAllowsDefaultTighteningForTruncation:1];
    v8 = v5->_titleLabel;
    v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v8 setTextColor:v9];

    v10 = objc_alloc_init(HKCaretOptionalTextField);
    inputTextField = v5->_inputTextField;
    v5->_inputTextField = v10;

    [(HKSimpleDataEntryPlainTextCell *)v5 _setupInputTextFieldWithIntention:a3];
    v12 = v5->_inputTextField;
    v13 = [MEMORY[0x1E4FB1618] labelColor];
    [(HKCaretOptionalTextField *)v12 setTextColor:v13];

    v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    horizontalSeparator = v5->_horizontalSeparator;
    v5->_horizontalSeparator = v14;

    [(UILabel *)v5->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HKCaretOptionalTextField *)v5->_inputTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v5->_horizontalSeparator setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [(HKSimpleDataEntryPlainTextCell *)v5 contentView];
    [v16 addSubview:v5->_titleLabel];

    v17 = [(HKSimpleDataEntryPlainTextCell *)v5 contentView];
    [v17 addSubview:v5->_inputTextField];

    v18 = [(HKSimpleDataEntryPlainTextCell *)v5 contentView];
    [v18 addSubview:v5->_horizontalSeparator];

    [(HKCaretOptionalTextField *)v5->_inputTextField setDelegate:v5];
    [(HKCaretOptionalTextField *)v5->_inputTextField addTarget:v5 action:sel_textFieldDidChangeValue_ forControlEvents:0x20000];
    v19 = v5->_horizontalSeparator;
    v20 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v19 setBackgroundColor:v20];

    [(HKSimpleDataEntryPlainTextCell *)v5 _setupLabels];
    [(HKSimpleDataEntryPlainTextCell *)v5 _setupLayoutConstraints];
    [(HKSimpleDataEntryPlainTextCell *)v5 _updateForCurrentSizeCategory];
    [(HKSimpleDataEntryPlainTextCell *)v5 setSelectionStyle:0];
  }
  return v5;
}

- (void)_setupInputTextFieldWithIntention:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      inputTextField = self->_inputTextField;
      v5 = (void *)MEMORY[0x1E4FB2F88];
      goto LABEL_5;
    case 1:
      inputTextField = self->_inputTextField;
      v5 = (void *)MEMORY[0x1E4FB2F90];
      goto LABEL_5;
    case 2:
      inputTextField = self->_inputTextField;
      v5 = (void *)MEMORY[0x1E4FB2F78];
LABEL_5:
      [(HKCaretOptionalTextField *)inputTextField setTextContentType:*v5];
      goto LABEL_11;
    case 3:
      [(HKCaretOptionalTextField *)self->_inputTextField setTextContentType:*MEMORY[0x1E4FB2F68]];
      [(HKCaretOptionalTextField *)self->_inputTextField setKeyboardType:7];
      [(HKCaretOptionalTextField *)self->_inputTextField setAutocapitalizationType:0];
      [(HKCaretOptionalTextField *)self->_inputTextField setAutocorrectionType:1];
      goto LABEL_11;
    case 4:
      v6 = self->_inputTextField;
      v7 = (void *)MEMORY[0x1E4FB2FC0];
      goto LABEL_10;
    case 5:
      v6 = self->_inputTextField;
      v7 = (void *)MEMORY[0x1E4FB2FC8];
      goto LABEL_10;
    case 6:
      v6 = self->_inputTextField;
      v7 = (void *)MEMORY[0x1E4FB2F50];
LABEL_10:
      [(HKCaretOptionalTextField *)v6 setTextContentType:*v7];
      [(HKCaretOptionalTextField *)self->_inputTextField setAutocapitalizationType:1];
LABEL_11:
      [(HKCaretOptionalTextField *)self->_inputTextField setReturnKeyType:4];
      break;
    case 7:
      characterCountLimit = self->_characterCountLimit;
      self->_characterCountLimit = (NSNumber *)&unk_1F3C20740;

      [(HKCaretOptionalTextField *)self->_inputTextField setDisableActions:1];
      [(HKCaretOptionalTextField *)self->_inputTextField setTextContentType:*MEMORY[0x1E4FB2FB8]];
      goto LABEL_15;
    case 8:
      v10 = self->_characterCountLimit;
      self->_characterCountLimit = (NSNumber *)&unk_1F3C20758;

      [(HKCaretOptionalTextField *)self->_inputTextField setDisableActions:1];
      [(HKCaretOptionalTextField *)self->_inputTextField setSecureTextEntry:1];
LABEL_15:
      [(HKCaretOptionalTextField *)self->_inputTextField setKeyboardType:4];
      break;
    case 9:
      v9 = self->_characterCountLimit;
      self->_characterCountLimit = (NSNumber *)&unk_1F3C20770;

      break;
    default:
      break;
  }
  v11 = self->_inputTextField;
  v12 = self->_characterCountLimit;
  if (v12) {
    BOOL v13 = [(NSNumber *)v12 integerValue] != 0;
  }
  else {
    BOOL v13 = 1;
  }
  [(HKCaretOptionalTextField *)v11 setAllowsSelection:v13];
}

- (void)_setupLabels
{
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory()) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  [(UILabel *)self->_titleLabel setNumberOfLines:v3];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 2);
  [(UILabel *)self->_titleLabel setFont:v5];

  objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", v4, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(HKCaretOptionalTextField *)self->_inputTextField setFont:v6];
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HKSimpleDataEntryPlainTextCell;
  [(HKSimpleDataEntryPlainTextCell *)&v3 layoutMarginsDidChange];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_regularConstraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_largeTextConstraints];
  [(HKSimpleDataEntryPlainTextCell *)self _setupLayoutConstraints];
  [(HKSimpleDataEntryPlainTextCell *)self _updateForCurrentSizeCategory];
}

- (void)_setupLayoutConstraints
{
  v38[6] = *MEMORY[0x1E4F143B8];
  v35 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelInpu.isa, self->_titleLabel, self->_inputTextField, self->_horizontalSeparator, 0);
  [(HKSimpleDataEntryPlainTextCell *)self directionalLayoutMargins];
  double v4 = v3;
  [(HKSimpleDataEntryPlainTextCell *)self directionalLayoutMargins];
  double v6 = v5;
  v37[0] = @"onePixel";
  v7 = [NSNumber numberWithDouble:HKUIOnePixel()];
  v38[0] = v7;
  v37[1] = @"left";
  v8 = [NSNumber numberWithDouble:v4];
  v38[1] = v8;
  v37[2] = @"right";
  v9 = [NSNumber numberWithDouble:v6];
  v38[2] = v9;
  v37[3] = @"edge";
  if (v4 >= v6) {
    double v10 = v4;
  }
  else {
    double v10 = v6;
  }
  v11 = [NSNumber numberWithDouble:v10];
  v38[3] = v11;
  v38[4] = &unk_1F3C229C0;
  v37[4] = @"inputLeft";
  v37[5] = @"titleInputMin";
  v38[5] = &unk_1F3C229D0;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:6];

  BOOL v13 = (void *)MEMORY[0x1E4F1CA48];
  v34 = [(UILabel *)self->_titleLabel centerYAnchor];
  v14 = [(HKSimpleDataEntryPlainTextCell *)self contentView];
  v15 = [v14 centerYAnchor];
  v16 = [v34 constraintEqualToAnchor:v15];
  v36[0] = v16;
  v17 = [(UILabel *)self->_titleLabel centerYAnchor];
  v18 = [(HKCaretOptionalTextField *)self->_inputTextField centerYAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v36[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v21 = [v13 arrayWithArray:v20];

  objc_super v22 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(edge)-[_titleLabel]" options:0 metrics:v12 views:v35];
  [(NSArray *)v21 addObjectsFromArray:v22];

  v23 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(inputLeft)-[_inputTextField]-(edge)-|" options:0 metrics:v12 views:v35];
  [(NSArray *)v21 addObjectsFromArray:v23];

  v24 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:[_titleLabel]-(>=titleInputMin)-[_inputTextField]" options:0 metrics:v12 views:v35];
  [(NSArray *)v21 addObjectsFromArray:v24];

  v25 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(left)-[_horizontalSeparator]-(right)-|" options:0 metrics:v12 views:v35];
  [(NSArray *)v21 addObjectsFromArray:v25];

  v26 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[_horizontalSeparator(onePixel)]-(0)-|" options:0 metrics:v12 views:v35];
  [(NSArray *)v21 addObjectsFromArray:v26];

  regularConstraints = self->_regularConstraints;
  self->_regularConstraints = v21;
  v28 = v21;

  v29 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v30 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(edge)-[_titleLabel]-(edge)-|" options:0 metrics:v12 views:v35];
  [(NSArray *)v29 addObjectsFromArray:v30];

  v31 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(edge)-[_inputTextField]-(edge)-|" options:0 metrics:v12 views:v35];
  [(NSArray *)v29 addObjectsFromArray:v31];

  v32 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-(edge)-[_titleLabel]-(5)-[_inputTextField]-(edge)-|" options:0 metrics:v12 views:v35];
  [(NSArray *)v29 addObjectsFromArray:v32];

  largeTextConstraints = self->_largeTextConstraints;
  self->_largeTextConstraints = v29;
}

- (void)_updateForCurrentSizeCategory
{
  [(HKSimpleDataEntryPlainTextCell *)self _setupLabels];
  BOOL IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  if (IsUsingAccessibilityContentSizeCategory) {
    double v4 = &OBJC_IVAR___HKSimpleDataEntryPlainTextCell__regularConstraints;
  }
  else {
    double v4 = &OBJC_IVAR___HKSimpleDataEntryPlainTextCell__largeTextConstraints;
  }
  if (IsUsingAccessibilityContentSizeCategory) {
    double v5 = &OBJC_IVAR___HKSimpleDataEntryPlainTextCell__largeTextConstraints;
  }
  else {
    double v5 = &OBJC_IVAR___HKSimpleDataEntryPlainTextCell__regularConstraints;
  }
  [MEMORY[0x1E4F28DC8] deactivateConstraints:*(Class *)((char *)&self->super.super.super.super.super.isa + *v4)];
  double v6 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + *v5);
  [v6 activateConstraints:v7];
}

- (void)beginEditing
{
}

- (BOOL)editDisabled
{
  return self->_editDisabled;
}

- (void)setEditDisabled:(BOOL)a3
{
  self->_editDisabled = a3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSimpleDataEntryPlainTextCell;
  [(HKSimpleDataEntryPlainTextCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(HKSimpleDataEntryPlainTextCell *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    uint64_t v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKSimpleDataEntryPlainTextCell *)self _updateForCurrentSizeCategory];
    }
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return !self->_editDisabled;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = [a3 text];
  char v5 = [v4 isEqualToString:self->_lastChangedText];

  if ((v5 & 1) == 0)
  {
    [(HKSimpleDataEntryPlainTextCell *)self _informDelegateForContentChange];
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  characterCountLimit = self->_characterCountLimit;
  if (characterCountLimit)
  {
    if ([(NSNumber *)characterCountLimit integerValue])
    {
      v12 = [v9 text];
      BOOL v13 = objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v10);

      unint64_t v14 = [v13 length];
      BOOL v15 = v14 <= [(NSNumber *)self->_characterCountLimit integerValue];
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  double v3 = [a3 _nextKeyResponder];
  [v3 becomeFirstResponder];

  return 1;
}

- (void)_informDelegateForContentChange
{
  double v3 = [(HKSimpleDataEntryPlainTextCell *)self delegate];
  [v3 textFieldDidChangeValue:self->_inputTextField forCell:self];

  id v4 = [(HKCaretOptionalTextField *)self->_inputTextField text];
  lastChangedText = self->_lastChangedText;
  self->_lastChangedText = v4;
  MEMORY[0x1F41817F8](v4, lastChangedText);
}

- (HKSimpleDataEntryCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKSimpleDataEntryCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (HKCaretOptionalTextField)inputTextField
{
  return self->_inputTextField;
}

- (void)setInputTextField:(id)a3
{
}

- (NSString)lastChangedText
{
  return self->_lastChangedText;
}

- (void)setLastChangedText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChangedText, 0);
  objc_storeStrong((id *)&self->_inputTextField, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);
  objc_storeStrong((id *)&self->_characterCountLimit, 0);
  objc_storeStrong((id *)&self->_horizontalSeparator, 0);
}

@end