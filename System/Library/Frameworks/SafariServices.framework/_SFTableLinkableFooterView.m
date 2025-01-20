@interface _SFTableLinkableFooterView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_SFTableLinkableFooterView)initWithReuseIdentifier:(id)a3;
- (_SFTableLinkableFooterViewDelegate)delegate;
- (id)_attributedStringTextColor;
- (void)_configureSubviewsAndConstraints;
- (void)_updateAttributedString;
- (void)setDelegate:(id)a3;
- (void)setText:(id)a3 linkPlaceholderString:(id)a4 linkReplacementString:(id)a5;
@end

@implementation _SFTableLinkableFooterView

- (_SFTableLinkableFooterView)initWithReuseIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SFTableLinkableFooterView;
  v3 = [(_SFTableLinkableFooterView *)&v7 initWithReuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    [(_SFTableLinkableFooterView *)v3 _configureSubviewsAndConstraints];
    v5 = v4;
  }

  return v4;
}

- (void)_configureSubviewsAndConstraints
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v3 = [(_SFTableLinkableFooterView *)self contentView];
  v4 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
  textView = self->_textView;
  self->_textView = v4;

  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [MEMORY[0x1E4FB1618] clearColor];
  [(UITextView *)self->_textView setBackgroundColor:v6];

  [(UITextView *)self->_textView setShowsVerticalScrollIndicator:0];
  [(UITextView *)self->_textView setEditable:0];
  [(UITextView *)self->_textView setSelectable:1];
  [(UITextView *)self->_textView setScrollEnabled:0];
  objc_super v7 = [(UITextView *)self->_textView textContainer];
  [v7 setLineFragmentPadding:0.0];

  [(UITextView *)self->_textView _setInteractiveTextSelectionDisabled:1];
  [(UITextView *)self->_textView setDelegate:self];
  [(UITextView *)self->_textView setAdjustsFontForContentSizeCategory:1];
  [v3 addSubview:self->_textView];
  PreferencesTableViewCellLeftPad();
  double v9 = v8;
  v10 = [(UITextView *)self->_textView leadingAnchor];
  v11 = [v3 safeAreaLayoutGuide];
  v12 = [v11 leadingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 constant:v9];
  textViewLeadingConstraint = self->_textViewLeadingConstraint;
  self->_textViewLeadingConstraint = v13;

  v15 = [v3 safeAreaLayoutGuide];
  v16 = [v15 trailingAnchor];
  v17 = [(UITextView *)self->_textView trailingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:v9];
  textViewTrailingConstraint = self->_textViewTrailingConstraint;
  self->_textViewTrailingConstraint = v18;

  v20 = (void *)MEMORY[0x1E4F28DC8];
  v21 = self->_textViewTrailingConstraint;
  v29[0] = self->_textViewLeadingConstraint;
  v29[1] = v21;
  v22 = [(UITextView *)self->_textView topAnchor];
  v23 = [v3 topAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v29[2] = v24;
  v25 = [(UITextView *)self->_textView bottomAnchor];
  v26 = [v3 bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v29[3] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v20 activateConstraints:v28];
}

- (void)setText:(id)a3 linkPlaceholderString:(id)a4 linkReplacementString:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (NSString *)[a3 copy];
  text = self->_text;
  self->_text = v10;

  v12 = (NSString *)[v9 copy];
  linkPlaceholderString = self->_linkPlaceholderString;
  self->_linkPlaceholderString = v12;

  v14 = (NSString *)[v8 copy];
  linkReplacementString = self->_linkReplacementString;
  self->_linkReplacementString = v14;

  [(_SFTableLinkableFooterView *)self _updateAttributedString];
}

- (void)_updateAttributedString
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28E48]);
  text = self->_text;
  uint64_t v5 = *MEMORY[0x1E4FB12B0];
  v27[0] = *MEMORY[0x1E4FB12B0];
  uint64_t v6 = *MEMORY[0x1E4FB28F0];
  objc_super v7 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v28[0] = v7;
  v27[1] = *MEMORY[0x1E4FB12B8];
  id v8 = [(_SFTableLinkableFooterView *)self _attributedStringTextColor];
  v28[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  v10 = (void *)[v3 initWithString:text attributes:v9];

  v11 = [(_SFTableLinkableFooterView *)self traitCollection];
  v12 = [v11 preferredContentSizeCategory];
  LODWORD(v8) = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if (v8)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1378]);
    LODWORD(v14) = 1055286886;
    [v13 setHyphenationFactor:v14];
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4FB12D0], v13, 0, objc_msgSend(v10, "length"));
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
  linkReplacementString = self->_linkReplacementString;
  v25[0] = v5;
  v17 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:v6];
  uint64_t v18 = *MEMORY[0x1E4FB12E8];
  v26[0] = v17;
  v26[1] = MEMORY[0x1E4F1CC28];
  uint64_t v19 = *MEMORY[0x1E4FB12C8];
  v25[1] = v18;
  v25[2] = v19;
  v20 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EFB97EB8];
  v26[2] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v22 = (void *)[v15 initWithString:linkReplacementString attributes:v21];

  uint64_t v23 = [(NSString *)self->_text rangeOfString:self->_linkPlaceholderString];
  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", v23, v24, v22);
  [(UITextView *)self->_textView setAttributedText:v10];
}

- (id)_attributedStringTextColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained linkableFooterViewDidInteractWithLink:self];

  return 0;
}

- (_SFTableLinkableFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFTableLinkableFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_linkReplacementString, 0);
  objc_storeStrong((id *)&self->_linkPlaceholderString, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textViewLeadingConstraint, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end