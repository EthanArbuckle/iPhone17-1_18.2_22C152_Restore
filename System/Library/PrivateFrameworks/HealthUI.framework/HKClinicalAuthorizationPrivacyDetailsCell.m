@interface HKClinicalAuthorizationPrivacyDetailsCell
- (HKClinicalAuthorizationPrivacyDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HKSource)source;
- (NSLayoutConstraint)contentsTextViewLastBaselineToSuperviewBottomConstraint;
- (NSLayoutConstraint)superviewTopToContentsTextViewFirstBaselineConstraint;
- (UITextView)contentsTextView;
- (_HKClinicalBulletedListLayoutManager)bulletLayoutManager;
- (id)_attributedContentsTextViewStringForCurrentContentSizeCategory;
- (id)_attributedStringForBullet;
- (id)_attributedStringForBulletAtIndex:(int64_t)a3;
- (id)_bodyEmph;
- (id)_bulletContentFont;
- (id)_bulletContentParagraphStyle;
- (id)_bulletFont;
- (id)_createContentsTextViewWithLayoutManager:(id)a3;
- (id)_localizedBulletContentStringForBulletAtIndex:(int64_t)a3;
- (id)_titleParagraphStyle;
- (void)_setUpConstraints;
- (void)_setUpSubviews;
- (void)_updateForCurrentContentSizeCategory;
- (void)setSource:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKClinicalAuthorizationPrivacyDetailsCell

- (HKClinicalAuthorizationPrivacyDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKClinicalAuthorizationPrivacyDetailsCell;
  v4 = [(HKClinicalAuthorizationPrivacyDetailsCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HKClinicalAuthorizationPrivacyDetailsCell *)v4 setPreservesSuperviewLayoutMargins:1];
    [(HKClinicalAuthorizationPrivacyDetailsCell *)v5 setSelectionStyle:0];
    [(HKClinicalAuthorizationPrivacyDetailsCell *)v5 _setUpSubviews];
    [(HKClinicalAuthorizationPrivacyDetailsCell *)v5 _setUpConstraints];
    [(HKClinicalAuthorizationPrivacyDetailsCell *)v5 _updateForCurrentContentSizeCategory];
  }
  return v5;
}

- (void)setSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);
  char v5 = [WeakRetained isEqual:obj];

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_source, obj);
    [(HKClinicalAuthorizationPrivacyDetailsCell *)self _updateForCurrentContentSizeCategory];
  }
}

- (void)_setUpSubviews
{
  id v8 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self contentView];
  [v8 setPreservesSuperviewLayoutMargins:1];
  v3 = objc_alloc_init(_HKClinicalBulletedListLayoutManager);
  bulletLayoutManager = self->_bulletLayoutManager;
  self->_bulletLayoutManager = v3;
  char v5 = v3;

  v6 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self _createContentsTextViewWithLayoutManager:v5];
  [v8 addSubview:v6];
  contentsTextView = self->_contentsTextView;
  self->_contentsTextView = v6;
}

- (void)_setUpConstraints
{
  id v20 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self contentView];
  v3 = [v20 layoutMarginsGuide];
  v4 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self contentsTextView];
  char v5 = [v4 leadingAnchor];
  v6 = [v3 leadingAnchor];
  objc_super v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  id v8 = [v4 trailingAnchor];
  v9 = [v3 trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  v11 = [v4 firstBaselineAnchor];
  v12 = [v20 topAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];

  [(NSLayoutConstraint *)v13 setActive:1];
  superviewTopToContentsTextViewFirstBaselineConstraint = self->_superviewTopToContentsTextViewFirstBaselineConstraint;
  self->_superviewTopToContentsTextViewFirstBaselineConstraint = v13;
  v15 = v13;

  v16 = [v20 bottomAnchor];
  v17 = [v4 lastBaselineAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];

  [(NSLayoutConstraint *)v18 setActive:1];
  contentsTextViewLastBaselineToSuperviewBottomConstraint = self->_contentsTextViewLastBaselineToSuperviewBottomConstraint;
  self->_contentsTextViewLastBaselineToSuperviewBottomConstraint = v18;
}

- (id)_createContentsTextViewWithLayoutManager:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4FB08B8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 addLayoutManager:v4];
  id v6 = objc_alloc(MEMORY[0x1E4FB0880]);
  objc_super v7 = objc_msgSend(v6, "initWithSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [v4 addTextContainer:v7];

  id v8 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  v9 = objc_msgSend(v8, "initWithFrame:textContainer:", v7, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  v10 = [MEMORY[0x1E4FB1618] clearColor];
  [v9 setBackgroundColor:v10];

  v11 = [MEMORY[0x1E4FB1618] labelColor];
  [v9 setTextColor:v11];

  [v9 setEditable:0];
  [v9 setScrollEnabled:0];
  v12 = [v9 textContainer];
  [v12 setLineFragmentPadding:0.0];

  objc_msgSend(v9, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setUserInteractionEnabled:0];

  return v9;
}

- (id)_attributedContentsTextViewStringForCurrentContentSizeCategory
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v5 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self _attributedStringForBulletAtIndex:i];
    [v3 appendAttributedString:v5];
  }
  return v3;
}

- (id)_titleParagraphStyle
{
  v2 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self _bulletContentFont];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v2 _scaledValueForValue:8.0];
  objc_msgSend(v3, "setParagraphSpacing:");

  return v3;
}

- (id)_localizedBulletContentStringForBulletAtIndex:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKClinicalAuthorizationPrivacyDetailsCell.m", 142, @"Invalid parameter not satisfying: %@", @"index >= 0 && index < _BulletCount" object file lineNumber description];
  }
  id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"YOU_SHOULD_KNOW_PRIVACY_DETAILS_BULLET_%ld", a3 + 1);
  id v5 = HKHealthRecordsAPILocalizedString(v4);
  id v6 = [v5 stringByAppendingString:@"\n"];

  return v6;
}

- (id)_attributedStringForBulletAtIndex:(int64_t)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v14[0] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = *MEMORY[0x1E4FB06F8];
  v13[0] = @"_IsBulletedAttributeName";
  v13[1] = v5;
  id v6 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self _bulletContentFont];
  v14[1] = v6;
  v13[2] = *MEMORY[0x1E4FB0738];
  objc_super v7 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self _bulletContentParagraphStyle];
  v14[2] = v7;
  v13[3] = *MEMORY[0x1E4FB0700];
  id v8 = [MEMORY[0x1E4FB1618] labelColor];
  v14[3] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  v10 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self _localizedBulletContentStringForBulletAtIndex:a3];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10 attributes:v9];

  return v11;
}

- (id)_bulletContentParagraphStyle
{
  id v3 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self _bulletContentFont];
  id v4 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self _attributedStringForBullet];
  [v4 size];
  double v6 = v5 + 14.0;
  id v7 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v7 setFirstLineHeadIndent:v6];
  [v7 setHeadIndent:v6];
  [v3 _scaledValueForValue:34.0];
  double v9 = v8;
  [v3 lineHeight];
  [v7 setParagraphSpacingBefore:v9 - v10];

  return v7;
}

- (id)_attributedStringForBullet
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = *MEMORY[0x1E4FB06F8];
  v2 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self _bulletFont];
  v8[0] = v2;
  v7[1] = *MEMORY[0x1E4FB0700];
  id v3 = [MEMORY[0x1E4FB1618] labelColor];
  v8[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"⦁" attributes:v4];
  return v5;
}

- (id)_bodyEmph
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 2);
}

- (id)_bulletFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 2);
}

- (id)_bulletContentFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

- (void)_updateForCurrentContentSizeCategory
{
  id v3 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self _bodyEmph];
  [v3 _scaledValueForValue:36.0];
  double v5 = v4;
  double v6 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self superviewTopToContentsTextViewFirstBaselineConstraint];
  [v6 setConstant:v5];

  id v7 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self _bulletContentFont];
  [v7 _scaledValueForValue:32.0];
  double v9 = v8;
  double v10 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self contentsTextViewLastBaselineToSuperviewBottomConstraint];
  [v10 setConstant:v9];

  v11 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self _attributedStringForBullet];
  v12 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self bulletLayoutManager];
  [v12 setBullet:v11];

  id v14 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self _attributedContentsTextViewStringForCurrentContentSizeCategory];
  v13 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self contentsTextView];
  [v13 setAttributedText:v14];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalAuthorizationPrivacyDetailsCell;
  [(HKClinicalAuthorizationPrivacyDetailsCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(HKClinicalAuthorizationPrivacyDetailsCell *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKClinicalAuthorizationPrivacyDetailsCell *)self _updateForCurrentContentSizeCategory];
    }
  }
}

- (HKSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);
  return (HKSource *)WeakRetained;
}

- (NSLayoutConstraint)superviewTopToContentsTextViewFirstBaselineConstraint
{
  return self->_superviewTopToContentsTextViewFirstBaselineConstraint;
}

- (NSLayoutConstraint)contentsTextViewLastBaselineToSuperviewBottomConstraint
{
  return self->_contentsTextViewLastBaselineToSuperviewBottomConstraint;
}

- (UITextView)contentsTextView
{
  return self->_contentsTextView;
}

- (_HKClinicalBulletedListLayoutManager)bulletLayoutManager
{
  return self->_bulletLayoutManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletLayoutManager, 0);
  objc_storeStrong((id *)&self->_contentsTextView, 0);
  objc_storeStrong((id *)&self->_contentsTextViewLastBaselineToSuperviewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_superviewTopToContentsTextViewFirstBaselineConstraint, 0);
  objc_destroyWeak((id *)&self->_source);
}

@end