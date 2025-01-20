@interface HKFitnessDiagnosticsPrivacyDetailsCell
- (HKFitnessDiagnosticsPrivacyDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSLayoutConstraint)contentsTextViewLastBaselineToSuperviewBottomConstraint;
- (NSLayoutConstraint)superviewTopToContentsTextViewFirstBaselineConstraint;
- (UITextView)contentsTextView;
- (_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager)bulletLayoutManager;
- (id)_attributedContentsTextViewStringForCurrentContentSizeCategory;
- (id)_attributedStringForBullet;
- (id)_attributedStringForBulletAtIndex:(int64_t)a3;
- (id)_attributedTitleString;
- (id)_bodyEmph;
- (id)_bulletContentFont;
- (id)_bulletContentParagraphStyle;
- (id)_bulletFont;
- (id)_createContentsTextViewWithLayoutManager:(id)a3;
- (id)_localizedBulletContentStringForBulletAtIndex:(int64_t)a3;
- (id)_localizedTitleString;
- (id)_newLineAttributedString;
- (id)_titleParagraphStyle;
- (void)_setUpConstraints;
- (void)_setUpSubviews;
- (void)_updateForCurrentContentSizeCategory;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKFitnessDiagnosticsPrivacyDetailsCell

- (HKFitnessDiagnosticsPrivacyDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKFitnessDiagnosticsPrivacyDetailsCell;
  v4 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HKFitnessDiagnosticsPrivacyDetailsCell *)v4 setPreservesSuperviewLayoutMargins:1];
    [(HKFitnessDiagnosticsPrivacyDetailsCell *)v5 setSelectionStyle:0];
    [(HKFitnessDiagnosticsPrivacyDetailsCell *)v5 _setUpSubviews];
    [(HKFitnessDiagnosticsPrivacyDetailsCell *)v5 _setUpConstraints];
    [(HKFitnessDiagnosticsPrivacyDetailsCell *)v5 _updateForCurrentContentSizeCategory];
  }
  return v5;
}

- (void)_setUpSubviews
{
  id v8 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self contentView];
  [v8 setPreservesSuperviewLayoutMargins:1];
  v3 = objc_alloc_init(_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager);
  bulletLayoutManager = self->_bulletLayoutManager;
  self->_bulletLayoutManager = v3;
  v5 = v3;

  v6 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _createContentsTextViewWithLayoutManager:v5];
  [v8 addSubview:v6];
  contentsTextView = self->_contentsTextView;
  self->_contentsTextView = v6;
}

- (void)_setUpConstraints
{
  id v20 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self contentView];
  v3 = [v20 layoutMarginsGuide];
  v4 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self contentsTextView];
  v5 = [v4 leadingAnchor];
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
  id v3 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v4 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _attributedTitleString];
  id v5 = (void *)[v3 initWithAttributedString:v4];

  id v6 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _newLineAttributedString];
  [v5 appendAttributedString:v6];

  for (uint64_t i = 0; i != 7; ++i)
  {
    id v8 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _attributedStringForBulletAtIndex:i];
    [v5 appendAttributedString:v8];

    id v9 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _newLineAttributedString];
    [v5 appendAttributedString:v9];
  }
  return v5;
}

- (id)_newLineAttributedString
{
  id v2 = objc_alloc(MEMORY[0x1E4F28B18]);
  return (id)[v2 initWithString:@"\n"];
}

- (id)_localizedTitleString
{
  id v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v3 = [v2 localizedStringForKey:@"DATA_COLLECTION_BODY_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)_attributedTitleString
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4FB06F8];
  id v3 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _bodyEmph];
  v11[0] = v3;
  v10[1] = *MEMORY[0x1E4FB0738];
  id v4 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _titleParagraphStyle];
  v11[1] = v4;
  v10[2] = *MEMORY[0x1E4FB0700];
  id v5 = [MEMORY[0x1E4FB1618] labelColor];
  v11[2] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  objc_super v7 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _localizedTitleString];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v6];

  return v8;
}

- (id)_titleParagraphStyle
{
  id v2 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _bulletContentFont];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v2 _scaledValueForValue:8.0];
  objc_msgSend(v3, "setParagraphSpacing:");

  return v3;
}

- (id)_localizedBulletContentStringForBulletAtIndex:(int64_t)a3
{
  if ((unint64_t)a3 >= 7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKFitnessDiagnosticsPrivacyDetailsCell.m", 153, @"Invalid parameter not satisfying: %@", @"index >= 0 && index < _BulletCount" object file lineNumber description];
  }
  id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"DATA_COLLECTION_BODY_BULLET_%ld", a3 + 1);
  id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v6 = [v5 localizedStringForKey:v4 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v6;
}

- (id)_attributedStringForBulletAtIndex:(int64_t)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v14[0] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = *MEMORY[0x1E4FB06F8];
  v13[0] = @"_IsBulletedAttributeName";
  v13[1] = v5;
  id v6 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _bulletContentFont];
  v14[1] = v6;
  v13[2] = *MEMORY[0x1E4FB0738];
  objc_super v7 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _bulletContentParagraphStyle];
  v14[2] = v7;
  v13[3] = *MEMORY[0x1E4FB0700];
  id v8 = [MEMORY[0x1E4FB1618] labelColor];
  v14[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  v10 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _localizedBulletContentStringForBulletAtIndex:a3];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10 attributes:v9];

  return v11;
}

- (id)_bulletContentParagraphStyle
{
  id v3 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _bulletContentFont];
  id v4 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _attributedStringForBullet];
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
  id v2 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _bulletFont];
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
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
}

- (void)_updateForCurrentContentSizeCategory
{
  id v3 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _bodyEmph];
  [v3 _scaledValueForValue:36.0];
  double v5 = v4;
  double v6 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self superviewTopToContentsTextViewFirstBaselineConstraint];
  [v6 setConstant:v5];

  id v7 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _bulletContentFont];
  [v7 _scaledValueForValue:32.0];
  double v9 = v8;
  double v10 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self contentsTextViewLastBaselineToSuperviewBottomConstraint];
  [v10 setConstant:v9];

  v11 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _attributedStringForBullet];
  v12 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self bulletLayoutManager];
  [v12 setBullet:v11];

  id v14 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _attributedContentsTextViewStringForCurrentContentSizeCategory];
  v13 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self contentsTextView];
  [v13 setAttributedText:v14];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFitnessDiagnosticsPrivacyDetailsCell;
  [(HKFitnessDiagnosticsPrivacyDetailsCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(HKFitnessDiagnosticsPrivacyDetailsCell *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKFitnessDiagnosticsPrivacyDetailsCell *)self _updateForCurrentContentSizeCategory];
    }
  }
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

- (_HKFitnessDiagnosticsPrivacyBulletedListLayoutManager)bulletLayoutManager
{
  return self->_bulletLayoutManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletLayoutManager, 0);
  objc_storeStrong((id *)&self->_contentsTextView, 0);
  objc_storeStrong((id *)&self->_contentsTextViewLastBaselineToSuperviewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_superviewTopToContentsTextViewFirstBaselineConstraint, 0);
}

@end