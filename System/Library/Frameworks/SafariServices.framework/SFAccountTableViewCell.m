@interface SFAccountTableViewCell
- (BOOL)isIconMonogram;
- (BOOL)safari_hasOneTimeCodeGenerator;
- (BOOL)safari_hasWebsite;
- (NSString)searchPattern;
- (SFAccountTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SFAccountTableViewCellDelegate)delegate;
- (WBSSavedAccount)savedAccount;
- (void)_layoutReusedPasswordWarningImageViewIfNecessary;
- (void)_updateAccessibilityIdentifiers;
- (void)_updateSharedAccountBadgeImageViewIfNecessary;
- (void)layoutSubviews;
- (void)safari_copyOneTimeCode;
- (void)safari_copyPassword;
- (void)safari_copyUserName;
- (void)safari_copyWebsite;
- (void)setDelegate:(id)a3;
- (void)setIcon:(id)a3;
- (void)setSavedAccount:(id)a3 searchPattern:(id)a4 emphasizeUserName:(BOOL)a5;
- (void)setSavedAccount:(id)a3 searchPattern:(id)a4 emphasizeUserName:(BOOL)a5 isReusedPassword:(BOOL)a6;
- (void)setSavedAccount:(id)a3 searchPattern:(id)a4 emphasizeUserName:(BOOL)a5 shouldDifferentiateWithGroupName:(BOOL)a6;
- (void)setSavedAccount:(id)a3 withWarnings:(id)a4 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a5;
- (void)showPlaceholderImageForDomain:(id)a3 backgroundColor:(id)a4;
@end

@implementation SFAccountTableViewCell

- (SFAccountTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SFAccountTableViewCell;
  v4 = [(SFAccountTableViewCell *)&v14 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [SFAccountIconSharingBadgeImageCoordinator alloc];
    v6 = [(SFAccountTableViewCell *)v4 imageView];
    [MEMORY[0x1E4F18B30] tableViewIconSize];
    double v8 = v7;
    v9 = [(SFAccountTableViewCell *)v4 contentView];
    uint64_t v10 = [(SFAccountIconSharingBadgeImageCoordinator *)v5 initWithIconImageView:v6 iconDiameter:v9 parentView:v8];
    badgeImageCoordinator = v4->_badgeImageCoordinator;
    v4->_badgeImageCoordinator = (SFAccountIconSharingBadgeImageCoordinator *)v10;

    v12 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFAccountTableViewCell;
  [(SFAccountTableViewCell *)&v3 layoutSubviews];
  [(SFAccountIconSharingBadgeImageCoordinator *)self->_badgeImageCoordinator containerDidLayoutSubviews];
}

- (void)setIcon:(id)a3
{
  monogramLabel = self->_monogramLabel;
  id v5 = a3;
  [(UILabel *)monogramLabel setHidden:1];
  [(UIView *)self->_monogramBackgroundView setHidden:1];
  id v7 = [(SFAccountTableViewCell *)self imageView];
  v6 = [v7 layer];
  [v6 setMasksToBounds:1];

  [v7 _setContinuousCornerRadius:7.0];
  [v7 setImage:v5];

  [(SFAccountTableViewCell *)self _updateAccessibilityIdentifiers];
  [(SFAccountTableViewCell *)self _updateSharedAccountBadgeImageViewIfNecessary];
}

- (void)showPlaceholderImageForDomain:(id)a3 backgroundColor:(id)a4
{
  id v5 = a4;
  id v25 = [(SFAccountTableViewCell *)self imageView];
  [v25 _setContinuousCornerRadius:0.0];
  v6 = [v25 layer];
  [v6 setMasksToBounds:0];

  if (!self->_monogramLabel)
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    [MEMORY[0x1E4F18B30] tableViewIconSize];
    double v10 = v9;
    double v12 = v11;
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    monogramBackgroundView = self->_monogramBackgroundView;
    self->_monogramBackgroundView = v13;

    -[UIView setFrame:](self->_monogramBackgroundView, "setFrame:", v7, v8, v10, v12);
    v15 = [(UIView *)self->_monogramBackgroundView layer];
    [v15 setMasksToBounds:1];

    [(UIView *)self->_monogramBackgroundView _setContinuousCornerRadius:7.0];
    [(UIView *)self->_monogramBackgroundView _setAllowsHighContrastForBackgroundColor:1];
    [v25 addSubview:self->_monogramBackgroundView];
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    monogramLabel = self->_monogramLabel;
    self->_monogramLabel = v16;

    [(UILabel *)self->_monogramLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_monogramLabel setTextAlignment:1];
    [(UILabel *)self->_monogramLabel setNumberOfLines:0];
    v18 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)self->_monogramLabel setTextColor:v18];

    -[UILabel setFrame:](self->_monogramLabel, "setFrame:", v7, v8, v10, v12);
    v19 = objc_msgSend(MEMORY[0x1E4FB1798], "_sf_roundedSystemFontOfSize:weight:", 23, *MEMORY[0x1E4FB29C8]);
    [(UILabel *)self->_monogramLabel setFont:v19];

    [(UILabel *)self->_monogramLabel setIsAccessibilityElement:0];
    [v25 addSubview:self->_monogramLabel];
  }
  if (blankImage_onceToken != -1) {
    dispatch_once(&blankImage_onceToken, &__block_literal_global_30);
  }
  [v25 setImage:blankImage_image];
  [(UIView *)self->_monogramBackgroundView setBackgroundColor:v5];

  [(UIView *)self->_monogramBackgroundView setHidden:0];
  [(UILabel *)self->_monogramLabel setHidden:0];
  v20 = (void *)MEMORY[0x1E4F98F18];
  v21 = [(WBSSavedAccount *)self->_savedAccount customTitle];
  v22 = [(WBSSavedAccount *)self->_savedAccount highLevelDomain];
  v23 = objc_msgSend(v22, "safari_bestURLForUserTypedString");
  v24 = [v20 monogramStringForTitle:v21 url:v23 shouldRemoveGrammaticalArticles:0];
  [(UILabel *)self->_monogramLabel setText:v24];

  [(SFAccountTableViewCell *)self _updateSharedAccountBadgeImageViewIfNecessary];
}

- (void)setSavedAccount:(id)a3 searchPattern:(id)a4 emphasizeUserName:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = (WBSSavedAccount *)a3;
  double v9 = (NSString *)a4;
  savedAccount = self->_savedAccount;
  self->_savedAccount = v8;
  double v11 = v8;

  searchPattern = self->_searchPattern;
  self->_searchPattern = v9;
  v13 = v9;

  objc_super v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v15 = [(SFAccountTableViewCell *)self detailTextLabel];
  [v15 setTextColor:v14];

  id v21 = 0;
  id v22 = 0;
  [(WBSSavedAccount *)v11 safari_getTitle:&v22 detail:&v21 forTableViewCell:self withSearchPattern:v13 emphasizeUserName:v5];
  id v16 = v22;
  id v17 = v21;
  v18 = [(SFAccountTableViewCell *)self textLabel];
  [v18 setAttributedText:v16];

  v19 = [(SFAccountTableViewCell *)self detailTextLabel];
  [v19 setAttributedText:v17];

  v20 = [(SFAccountTableViewCell *)self detailTextLabel];
  [v20 setLineBreakMode:4];

  [(SFAccountTableViewCell *)self _updateAccessibilityIdentifiers];
  [(SFAccountTableViewCell *)self _updateSharedAccountBadgeImageViewIfNecessary];
}

- (void)setSavedAccount:(id)a3 withWarnings:(id)a4 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a5
{
  BOOL v5 = a5;
  id v22 = a3;
  objc_storeStrong((id *)&self->_savedAccount, a3);
  id v9 = a4;
  double v10 = +[_SFAccountManagerAppearanceValues titleFontForNarrowCell];
  double v11 = [(SFAccountTableViewCell *)self textLabel];
  [v11 setFont:v10];

  if (v5)
  {
    double v12 = [v22 effectiveTitle];
    v13 = [(SFAccountTableViewCell *)self textLabel];
    [v13 setText:v12];
  }
  else
  {
    objc_super v14 = NSString;
    double v12 = [v22 effectiveTitle];
    v13 = [v22 user];
    v15 = [v14 stringWithFormat:@"%@ — %@", v12, v13];
    id v16 = [(SFAccountTableViewCell *)self textLabel];
    [v16 setText:v15];
  }
  id v17 = +[_SFAccountManagerAppearanceValues subtitleFontForNarrowCellWithText:v9];
  v18 = [(SFAccountTableViewCell *)self detailTextLabel];
  [v18 setFont:v17];

  v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v20 = [(SFAccountTableViewCell *)self detailTextLabel];
  [v20 setTextColor:v19];

  id v21 = [(SFAccountTableViewCell *)self detailTextLabel];
  [v21 setText:v9];

  [(SFAccountTableViewCell *)self _updateAccessibilityIdentifiers];
}

- (void)setSavedAccount:(id)a3 searchPattern:(id)a4 emphasizeUserName:(BOOL)a5 shouldDifferentiateWithGroupName:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = a3;
  -[SFAccountTableViewCell setSavedAccount:searchPattern:emphasizeUserName:](self, "setSavedAccount:searchPattern:emphasizeUserName:");
  if (v6)
  {
    double v8 = [v14 sharedGroupName];

    if (v8)
    {
      id v9 = NSString;
      double v10 = [v14 user];
      double v11 = [v14 sharedGroupName];
      double v12 = [v9 stringWithFormat:@"%@ — %@", v10, v11];
      v13 = [(SFAccountTableViewCell *)self detailTextLabel];
      [v13 setText:v12];
    }
  }
}

- (void)setSavedAccount:(id)a3 searchPattern:(id)a4 emphasizeUserName:(BOOL)a5 isReusedPassword:(BOOL)a6
{
  BOOL v6 = a6;
  [(SFAccountTableViewCell *)self setSavedAccount:a3 searchPattern:a4 emphasizeUserName:a5];
  if (v6) {
    [(SFAccountTableViewCell *)self _layoutReusedPasswordWarningImageViewIfNecessary];
  }
  reusedPasswordWarningImageView = self->_reusedPasswordWarningImageView;

  [(UIImageView *)reusedPasswordWarningImageView setHidden:!v6];
}

- (void)_layoutReusedPasswordWarningImageViewIfNecessary
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if (!self->_reusedPasswordWarningImageView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
    v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.triangle.fill"];
    BOOL v5 = (UIImageView *)[v3 initWithImage:v4];

    BOOL v6 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [(UIImageView *)v5 setTintColor:v6];

    [(UIImageView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    reusedPasswordWarningImageView = self->_reusedPasswordWarningImageView;
    self->_reusedPasswordWarningImageView = v5;
    v19 = v5;

    double v8 = [(SFAccountTableViewCell *)self contentView];
    [v8 addSubview:self->_reusedPasswordWarningImageView];

    id v9 = (void *)MEMORY[0x1E4F28DC8];
    double v10 = [(UIImageView *)self->_reusedPasswordWarningImageView centerYAnchor];
    double v11 = [(SFAccountTableViewCell *)self contentView];
    double v12 = [v11 centerYAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    v20[0] = v13;
    id v14 = [(UIImageView *)self->_reusedPasswordWarningImageView trailingAnchor];
    v15 = [(SFAccountTableViewCell *)self contentView];
    id v16 = [v15 trailingAnchor];
    id v17 = [v14 constraintEqualToAnchor:v16 constant:-10.0];
    v20[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    [v9 activateConstraints:v18];
  }
}

- (void)safari_copyUserName
{
  id v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  id v3 = [(WBSSavedAccount *)self->_savedAccount user];
  objc_msgSend(v4, "safari_setSensitiveString:", v3);
}

- (void)safari_copyPassword
{
  id v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  id v3 = [(WBSSavedAccount *)self->_savedAccount password];
  objc_msgSend(v4, "safari_setSensitiveString:", v3);
}

- (BOOL)safari_hasOneTimeCodeGenerator
{
  v2 = [(WBSSavedAccount *)self->_savedAccount totpGenerators];
  id v3 = [v2 firstObject];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)safari_copyOneTimeCode
{
  id v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  id v3 = [(WBSSavedAccount *)self->_savedAccount currentOneTimeCode];
  objc_msgSend(v4, "safari_setSensitiveString:", v3);
}

- (BOOL)isIconMonogram
{
  return [(UILabel *)self->_monogramLabel isHidden] ^ 1;
}

- (void)_updateAccessibilityIdentifiers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained updateAccessibilityIdentifierForAccountCell:self];
  }
}

- (BOOL)safari_hasWebsite
{
  v2 = [(WBSSavedAccount *)self->_savedAccount userVisibleDomain];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)safari_copyWebsite
{
  id v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  BOOL v3 = [(WBSSavedAccount *)self->_savedAccount userVisibleDomain];
  [v4 setString:v3];
}

- (void)_updateSharedAccountBadgeImageViewIfNecessary
{
  badgeImageCoordinator = self->_badgeImageCoordinator;
  uint64_t v3 = [(WBSSavedAccount *)self->_savedAccount isSavedInPersonalKeychain] ^ 1;

  [(SFAccountIconSharingBadgeImageCoordinator *)badgeImageCoordinator setShowsBadge:v3];
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (NSString)searchPattern
{
  return self->_searchPattern;
}

- (SFAccountTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAccountTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchPattern, 0);
  objc_storeStrong((id *)&self->_savedAccount, 0);
  objc_storeStrong((id *)&self->_reusedPasswordWarningImageView, 0);
  objc_storeStrong((id *)&self->_badgeImageCoordinator, 0);
  objc_storeStrong((id *)&self->_monogramBackgroundView, 0);

  objc_storeStrong((id *)&self->_monogramLabel, 0);
}

@end