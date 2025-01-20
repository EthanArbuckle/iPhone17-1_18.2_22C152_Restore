@interface SFAccountHeaderViewCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (SFAccountHeaderViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SFAccountHeaderViewCellDelegate)delegate;
- (UITextField)titleTextField;
- (WBSSavedAccount)savedAccount;
- (void)_hideMonogramIcon;
- (void)_showMonogramIconWithBackgroundColor:(id)a3;
- (void)_textFieldChanged:(id)a3;
- (void)_updateSharedAccountBadgeImageViewIfNecessary;
- (void)commitCustomTitle;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHeaderTitleForHighLevelDomain:(id)a3 customTitle:(id)a4;
- (void)setIcon:(id)a3;
- (void)setLastModifiedDateString:(id)a3;
- (void)setSavedAccount:(id)a3;
- (void)setTitleTextField:(id)a3;
@end

@implementation SFAccountHeaderViewCell

- (SFAccountHeaderViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v65[2] = *MEMORY[0x1E4F143B8];
  v63.receiver = self;
  v63.super_class = (Class)SFAccountHeaderViewCell;
  v4 = [(SFAccountHeaderViewCell *)&v63 initWithStyle:0 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SFAccountHeaderViewCell *)v4 contentView];
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconImageView = v5->_iconImageView;
    v5->_iconImageView = v7;

    [(UIImageView *)v5->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 addSubview:v5->_iconImageView];
    v9 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    titleTextField = v5->_titleTextField;
    v5->_titleTextField = v9;

    [(UITextField *)v5->_titleTextField setDelegate:v5];
    v11 = +[_SFAccountManagerAppearanceValues titleFontForStackViewLabel];
    [(UITextField *)v5->_titleTextField setFont:v11];

    v12 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextField *)v5->_titleTextField setBackgroundColor:v12];

    [(UITextField *)v5->_titleTextField addTarget:v5 action:sel__textFieldChanged_ forControlEvents:0x20000];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    lastModifiedDateLabel = v5->_lastModifiedDateLabel;
    v5->_lastModifiedDateLabel = v13;

    v15 = +[_SFAccountManagerAppearanceValues subtitleFontForStackViewLabel];
    [(UILabel *)v5->_lastModifiedDateLabel setFont:v15];

    v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v5->_lastModifiedDateLabel setTextColor:v16];

    [(UILabel *)v5->_lastModifiedDateLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v5->_lastModifiedDateLabel setNumberOfLines:0];
    v17 = (objc_class *)MEMORY[0x1E4FB1C60];
    v62 = v5->_titleTextField;
    id v18 = [v17 alloc];
    v65[0] = v62;
    v65[1] = v5->_lastModifiedDateLabel;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
    uint64_t v20 = [v18 initWithArrangedSubviews:v19];
    labelStackView = v5->_labelStackView;
    v5->_labelStackView = (UIStackView *)v20;

    [(UIStackView *)v5->_labelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v5->_labelStackView setAxis:1];
    [(UIStackView *)v5->_labelStackView setSpacing:1.0];
    v61 = v6;
    [v6 addSubview:v5->_labelStackView];
    v22 = [v6 layoutMarginsGuide];
    v48 = (void *)MEMORY[0x1E4F28DC8];
    v60 = [(UIImageView *)v5->_iconImageView leadingAnchor];
    v59 = [v22 leadingAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v64[0] = v58;
    v57 = [(UIImageView *)v5->_iconImageView centerYAnchor];
    v56 = [v22 centerYAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v64[1] = v55;
    v54 = [(UIImageView *)v5->_iconImageView heightAnchor];
    v53 = [v54 constraintEqualToConstant:56.0];
    v64[2] = v53;
    v52 = [(UIImageView *)v5->_iconImageView widthAnchor];
    v50 = [v52 constraintEqualToConstant:56.0];
    v64[3] = v50;
    v49 = [v22 bottomAnchor];
    v47 = [(UIImageView *)v5->_iconImageView bottomAnchor];
    v46 = [v49 constraintGreaterThanOrEqualToAnchor:v47];
    v64[4] = v46;
    v45 = [(UIImageView *)v5->_iconImageView trailingAnchor];
    v44 = [(UIStackView *)v5->_labelStackView leadingAnchor];
    v43 = [v45 constraintEqualToAnchor:v44 constant:-11.0];
    v64[5] = v43;
    v42 = [(UIStackView *)v5->_labelStackView trailingAnchor];
    v51 = v22;
    v41 = [v22 trailingAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v64[6] = v40;
    v39 = [(UIStackView *)v5->_labelStackView centerYAnchor];
    v23 = [(UIImageView *)v5->_iconImageView centerYAnchor];
    v24 = [v39 constraintEqualToAnchor:v23];
    v64[7] = v24;
    v25 = [v22 bottomAnchor];
    v26 = [(UIStackView *)v5->_labelStackView bottomAnchor];
    v27 = [v25 constraintGreaterThanOrEqualToAnchor:v26];
    v64[8] = v27;
    v28 = [(UITextField *)v5->_titleTextField heightAnchor];
    v29 = +[_SFAccountManagerAppearanceValues titleFontForStackViewLabel];
    [v29 lineHeight];
    v30 = objc_msgSend(v28, "constraintGreaterThanOrEqualToConstant:");
    v64[9] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:10];
    [v48 activateConstraints:v31];

    v32 = [SFAccountIconSharingBadgeImageCoordinator alloc];
    v33 = v5->_iconImageView;
    v34 = [(SFAccountHeaderViewCell *)v5 contentView];
    uint64_t v35 = [(SFAccountIconSharingBadgeImageCoordinator *)v32 initWithIconImageView:v33 iconDiameter:v34 parentView:56.0];
    badgeImageCoordinator = v5->_badgeImageCoordinator;
    v5->_badgeImageCoordinator = (SFAccountIconSharingBadgeImageCoordinator *)v35;

    v37 = v5;
  }

  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFAccountHeaderViewCell;
  [(SFAccountHeaderViewCell *)&v3 layoutSubviews];
  [(SFAccountIconSharingBadgeImageCoordinator *)self->_badgeImageCoordinator containerDidLayoutSubviews];
}

- (void)setIcon:(id)a3
{
  id v4 = a3;
  [(SFAccountHeaderViewCell *)self _hideMonogramIcon];
  [(UIImageView *)self->_iconImageView _setContinuousCornerRadius:12.0];
  v5 = [(UIImageView *)self->_iconImageView layer];
  [v5 setMasksToBounds:1];

  [(UIImageView *)self->_iconImageView setImage:v4];

  [(SFAccountHeaderViewCell *)self _updateSharedAccountBadgeImageViewIfNecessary];
}

- (void)setHeaderTitleForHighLevelDomain:(id)a3 customTitle:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v8) {
    v9 = (void *)[v6 copy];
  }
  else {
    v9 = 0;
  }
  p_highLevelDomain = (id *)&self->_highLevelDomain;
  objc_storeStrong((id *)&self->_highLevelDomain, v9);
  if (v8) {

  }
  uint64_t v11 = [v7 length];
  if (v11) {
    v12 = (void *)[v7 copy];
  }
  else {
    v12 = 0;
  }
  p_customTitle = &self->_customTitle;
  objc_storeStrong((id *)&self->_customTitle, v12);
  if (v11) {

  }
  v14 = _WBSLocalizedString();
  id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (*p_highLevelDomain) {
    id v16 = *p_highLevelDomain;
  }
  else {
    id v16 = v14;
  }
  uint64_t v29 = *MEMORY[0x1E4FB12B8];
  v17 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  v30[0] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  v19 = (void *)[v15 initWithString:v16 attributes:v18];
  [(UITextField *)self->_titleTextField setAttributedPlaceholder:v19];

  if ([(NSString *)*p_customTitle length]) {
    [(UITextField *)self->_titleTextField setText:*p_customTitle];
  }
  uint64_t v20 = [(UIImageView *)self->_iconImageView image];

  if (!v20)
  {
    v21 = objc_msgSend(*p_highLevelDomain, "safari_stringByTrimmingWhitespace");
    if ([v21 length])
    {
    }
    else
    {
      v22 = [(NSString *)*p_customTitle safari_stringByTrimmingWhitespace];
      uint64_t v23 = [v22 length];

      if (!v23)
      {
        [(UIImageView *)self->_keyIconImageView setHidden:0];
        p_monogramLabel = &self->_monogramLabel;
        uint64_t v28 = 1;
        goto LABEL_21;
      }
    }
    v24 = (void *)MEMORY[0x1E4F98F18];
    v25 = objc_msgSend(v6, "safari_bestURLForUserTypedString");
    v26 = [v24 monogramStringForTitle:v7 url:v25 shouldRemoveGrammaticalArticles:0];
    p_monogramLabel = &self->_monogramLabel;
    [(UILabel *)self->_monogramLabel setText:v26];

    [(UIImageView *)self->_keyIconImageView setHidden:1];
    uint64_t v28 = 0;
LABEL_21:
    [(UILabel *)*p_monogramLabel setHidden:v28];
  }
}

- (void)commitCustomTitle
{
  objc_super v3 = [(UITextField *)self->_titleTextField text];
  objc_msgSend(v3, "safari_stringByTrimmingWhitespace");
  id obj = (id)objc_claimAutoreleasedReturnValue();

  if (([obj isEqualToString:self->_highLevelDomain] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_customTitle, obj);
    [(UITextField *)self->_titleTextField setText:self->_customTitle];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFAccountHeaderViewCell;
  [(SFAccountHeaderViewCell *)&v7 setEditing:a3 animated:a4];
  [(UITextField *)self->_titleTextField setUserInteractionEnabled:v4];
  if (![(NSString *)self->_customTitle length]
    || self->_savedAccount
    && [(NSString *)self->_customTitle isEqualToString:self->_highLevelDomain])
  {
    if (v4) {
      highLevelDomain = 0;
    }
    else {
      highLevelDomain = self->_highLevelDomain;
    }
    [(UITextField *)self->_titleTextField setText:highLevelDomain];
  }
}

- (void)setLastModifiedDateString:(id)a3
{
}

- (void)_showMonogramIconWithBackgroundColor:(id)a3
{
  v32 = self->_iconImageView;
  id v5 = a3;
  [(UIImageView *)v32 _setContinuousCornerRadius:0.0];
  id v6 = [(UIImageView *)v32 layer];
  [v6 setMasksToBounds:0];

  if (!self->_monogramBackgroundView)
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    monogramBackgroundView = self->_monogramBackgroundView;
    self->_monogramBackgroundView = v9;

    -[UIView setFrame:](self->_monogramBackgroundView, "setFrame:", v7, v8, 56.0, 56.0);
    uint64_t v11 = [(UIView *)self->_monogramBackgroundView layer];
    [v11 setMasksToBounds:1];

    [(UIView *)self->_monogramBackgroundView _setContinuousCornerRadius:12.0];
    [(UIView *)self->_monogramBackgroundView _setAllowsHighContrastForBackgroundColor:1];
    [(UIImageView *)v32 addSubview:self->_monogramBackgroundView];
    v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"key.fill"];
    v13 = objc_msgSend(v12, "imageWithAlignmentRectInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

    v14 = [MEMORY[0x1E4FB1618] whiteColor];
    id v15 = [v13 imageWithTintColor:v14 renderingMode:1];

    id v16 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v15];
    keyIconImageView = self->_keyIconImageView;
    self->_keyIconImageView = v16;

    [(UIImageView *)self->_keyIconImageView setContentMode:4];
    id v18 = [MEMORY[0x1E4FB1830] configurationWithPointSize:30.0];
    [(UIImageView *)self->_keyIconImageView setPreferredSymbolConfiguration:v18];

    [(UIImageView *)v32 bounds];
    -[UIImageView setFrame:](self->_keyIconImageView, "setFrame:");
    [(UIImageView *)self->_keyIconImageView setAutoresizingMask:18];
    [(UIImageView *)v32 addSubview:self->_keyIconImageView];
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    monogramLabel = self->_monogramLabel;
    self->_monogramLabel = v19;

    [(UILabel *)self->_monogramLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_monogramLabel setTextAlignment:1];
    [(UILabel *)self->_monogramLabel setNumberOfLines:0];
    v21 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)self->_monogramLabel setTextColor:v21];

    -[UILabel setFrame:](self->_monogramLabel, "setFrame:", v7, v8, 56.0, 56.0);
    v22 = objc_msgSend(MEMORY[0x1E4FB1798], "_sf_roundedSystemFontOfSize:weight:", 42, *MEMORY[0x1E4FB29C8]);
    [(UILabel *)self->_monogramLabel setFont:v22];

    [(UILabel *)self->_monogramLabel setIsAccessibilityElement:0];
    [(UIImageView *)v32 addSubview:self->_monogramLabel];
  }
  [(UIImageView *)v32 setImage:0];
  [(UIView *)self->_monogramBackgroundView setBackgroundColor:v5];

  [(UIView *)self->_monogramBackgroundView setHidden:0];
  [(UILabel *)self->_monogramLabel setHidden:0];
  uint64_t v23 = [(NSString *)self->_highLevelDomain safari_stringByTrimmingWhitespace];
  if ([v23 length])
  {

LABEL_6:
    v26 = (void *)MEMORY[0x1E4F98F18];
    customTitle = self->_customTitle;
    uint64_t v28 = [(NSString *)self->_highLevelDomain safari_bestURLForUserTypedString];
    uint64_t v29 = [v26 monogramStringForTitle:customTitle url:v28 shouldRemoveGrammaticalArticles:0];
    [(UILabel *)self->_monogramLabel setText:v29];

    uint64_t v30 = 0;
    uint64_t v31 = 1;
    goto LABEL_7;
  }
  v24 = [(NSString *)self->_customTitle safari_stringByTrimmingWhitespace];
  uint64_t v25 = [v24 length];

  if (v25) {
    goto LABEL_6;
  }
  uint64_t v31 = 0;
  uint64_t v30 = 1;
LABEL_7:
  [(UIImageView *)self->_keyIconImageView setHidden:v31];
  [(UILabel *)self->_monogramLabel setHidden:v30];
  [(SFAccountHeaderViewCell *)self _updateSharedAccountBadgeImageViewIfNecessary];
}

- (void)_hideMonogramIcon
{
  [(UIView *)self->_monogramBackgroundView setHidden:1];
  [(UIImageView *)self->_keyIconImageView setHidden:1];
  monogramLabel = self->_monogramLabel;

  [(UILabel *)monogramLabel setHidden:1];
}

- (void)setSavedAccount:(id)a3
{
  objc_storeStrong((id *)&self->_savedAccount, a3);

  [(SFAccountHeaderViewCell *)self _updateSharedAccountBadgeImageViewIfNecessary];
}

- (void)_updateSharedAccountBadgeImageViewIfNecessary
{
  badgeImageCoordinator = self->_badgeImageCoordinator;
  savedAccount = self->_savedAccount;
  if (savedAccount) {
    uint64_t v4 = [(WBSSavedAccount *)savedAccount isSavedInPersonalKeychain] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  [(SFAccountIconSharingBadgeImageCoordinator *)badgeImageCoordinator setShowsBadge:v4];
}

- (void)_textFieldChanged:(id)a3
{
  [(SFAccountHeaderViewCell *)self invalidateIntrinsicContentSize];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained accountDetailHeaderViewCell:self titleTextFieldDidChange:self->_titleTextField];
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  id v8 = a5;
  v9 = [a3 text];
  uint64_t v10 = [v9 length];
  uint64_t v11 = [v8 length];

  unint64_t v12 = *MEMORY[0x1E4F99530];
  if (v12 <= [(NSString *)self->_customTitle length]) {
    unint64_t v12 = [(NSString *)self->_customTitle length];
  }

  return v10 - length + v11 <= v12;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if (self->_titleTextField == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained returnKeyActivatedInAccountDetailHeaderViewCell:self];
    }
  }
  return 0;
}

- (SFAccountHeaderViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAccountHeaderViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITextField)titleTextField
{
  return self->_titleTextField;
}

- (void)setTitleTextField:(id)a3
{
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAccount, 0);
  objc_storeStrong((id *)&self->_titleTextField, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_badgeImageCoordinator, 0);
  objc_storeStrong((id *)&self->_highLevelDomain, 0);
  objc_storeStrong((id *)&self->_lastModifiedDateLabel, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_monogramBackgroundView, 0);
  objc_storeStrong((id *)&self->_keyIconImageView, 0);
  objc_storeStrong((id *)&self->_monogramLabel, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end