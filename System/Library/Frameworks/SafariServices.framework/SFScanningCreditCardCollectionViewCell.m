@interface SFScanningCreditCardCollectionViewCell
+ (NSString)reuseIdentifier;
+ (double)desiredCellWidth;
- (SFScanningCreditCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SFScanningCreditCardCollectionViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"ScanCreditCardCell";
}

+ (double)desiredCellWidth
{
  if (desiredCellWidth_onceToken != -1) {
    dispatch_once(&desiredCellWidth_onceToken, &__block_literal_global_53);
  }
  return *(double *)&desiredCellWidth_cellWidth;
}

void __58__SFScanningCreditCardCollectionViewCell_desiredCellWidth__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4FB1838]);
  v1 = [MEMORY[0x1E4FB1818] systemImageNamed:@"creditcard.viewfinder"];
  id v11 = (id)[v0 initWithImage:v1];

  id v2 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v3 = (void *)MEMORY[0x1E4FB1798];
  uint64_t v4 = *MEMORY[0x1E4FB28D0];
  v5 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
  v6 = [v3 preferredFontForTextStyle:v4 compatibleWithTraitCollection:v5];
  [v2 setFont:v6];

  v7 = _WBSLocalizedString();
  [v2 setText:v7];

  [v11 intrinsicContentSize];
  double v9 = v8;
  [v2 intrinsicContentSize];
  *(double *)&desiredCellWidth_cellWidth = v9 + v10 + 4.0 + 40.0;
}

- (SFScanningCreditCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  v39[2] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)SFScanningCreditCardCollectionViewCell;
  v3 = -[SFScanningCreditCardCollectionViewCell initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    [(SFScanningCreditCardCollectionViewCell *)v3 setAccessibilityIdentifier:@"ScanCreditCardCell"];
    v5 = [(SFScanningCreditCardCollectionViewCell *)v4 contentView];
    id v36 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v36 _setContinuousCornerRadius:12.0];
    [(SFScanningCreditCardCollectionViewCell *)v4 setBackgroundView:v36];
    id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
    v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"creditcard.viewfinder"];
    uint64_t v8 = [v6 initWithImage:v7];
    scanningImageView = v4->_scanningImageView;
    v4->_scanningImageView = (UIImageView *)v8;

    double v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    scanCardLabel = v4->_scanCardLabel;
    v4->_scanCardLabel = v10;

    v12 = (void *)MEMORY[0x1E4FB1798];
    uint64_t v13 = *MEMORY[0x1E4FB28D0];
    v14 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
    v15 = [v12 preferredFontForTextStyle:v13 compatibleWithTraitCollection:v14];
    [(UILabel *)v4->_scanCardLabel setFont:v15];

    v16 = _WBSLocalizedString();
    [(UILabel *)v4->_scanCardLabel setText:v16];

    id v17 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v39[0] = v4->_scanningImageView;
    v39[1] = v4->_scanCardLabel;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    v19 = (void *)[v17 initWithArrangedSubviews:v18];

    [v19 setAxis:0];
    [v19 setDistribution:0];
    [v19 setAlignment:3];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v19 setSpacing:4.0];
    v20 = v5;
    [v5 addSubview:v19];
    v31 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [v19 centerXAnchor];
    v34 = [v5 centerXAnchor];
    v32 = [v35 constraintEqualToAnchor:v34];
    v38[0] = v32;
    v21 = [v19 centerYAnchor];
    v33 = v20;
    v22 = [v20 centerYAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v38[1] = v23;
    v24 = [v19 widthAnchor];
    v25 = [v20 layoutMarginsGuide];
    v26 = [v25 widthAnchor];
    v27 = [v24 constraintLessThanOrEqualToAnchor:v26];
    v38[2] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
    [v31 activateConstraints:v28];

    v29 = v4;
  }

  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SFScanningCreditCardCollectionViewCell *)self isHighlighted];
  v8.receiver = self;
  v8.super_class = (Class)SFScanningCreditCardCollectionViewCell;
  [(SFScanningCreditCardCollectionViewCell *)&v8 setHighlighted:v3];
  if (v5 != v3)
  {
    if (v3) {
      [MEMORY[0x1E4FB1618] systemFillColor];
    }
    else {
    id v6 = [MEMORY[0x1E4FB1618] clearColor];
    }
    v7 = [(SFScanningCreditCardCollectionViewCell *)self backgroundView];
    [v7 setBackgroundColor:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanCardLabel, 0);

  objc_storeStrong((id *)&self->_scanningImageView, 0);
}

@end