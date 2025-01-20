@interface SFCreditCardCollectionViewCell
+ (NSString)reuseIdentifier;
- (SFCreditCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (WBSCreditCardData)cardData;
- (void)configureViewWithCardData:(id)a3;
- (void)setCardData:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SFCreditCardCollectionViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"CreditCardCell";
}

- (SFCreditCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  v96[2] = *MEMORY[0x1E4F143B8];
  v90.receiver = self;
  v90.super_class = (Class)SFCreditCardCollectionViewCell;
  v3 = -[SFCreditCardCollectionViewCell initWithFrame:](&v90, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SFCreditCardCollectionViewCell *)v3 setAccessibilityIdentifier:@"CreditCardCell"];
    v89 = [(SFCreditCardCollectionViewCell *)v4 contentView];
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    cardNameLabel = v4->_cardNameLabel;
    v4->_cardNameLabel = v5;

    v7 = (void *)MEMORY[0x1E4FB1798];
    uint64_t v8 = *MEMORY[0x1E4FB28F0];
    uint64_t v9 = *MEMORY[0x1E4FB27D0];
    v10 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
    v11 = [v7 preferredFontForTextStyle:v8 compatibleWithTraitCollection:v10];
    [(UILabel *)v4->_cardNameLabel setFont:v11];

    id v12 = objc_alloc(MEMORY[0x1E4FB1838]);
    v13 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"wallet.fill"];
    v14 = (void *)[v12 initWithImage:v13];

    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v14 setTintColor:v15];

    v16 = (void *)MEMORY[0x1E4F28DC8];
    v17 = [v14 heightAnchor];
    v18 = [v17 constraintEqualToConstant:18.0];
    v96[0] = v18;
    v19 = [v14 widthAnchor];
    v20 = [v19 constraintEqualToConstant:20.0];
    v96[1] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:2];
    [v16 activateConstraints:v21];

    v22 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    vibrantWalletImageView = v4->_vibrantWalletImageView;
    v4->_vibrantWalletImageView = v22;

    v87 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
    v24 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v87 style:1];
    [(UIVisualEffectView *)v4->_vibrantWalletImageView setEffect:v24];

    [(UIVisualEffectView *)v4->_vibrantWalletImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = [(UIVisualEffectView *)v4->_vibrantWalletImageView contentView];
    v88 = v14;
    [v25 addSubview:v14];

    v26 = (void *)MEMORY[0x1E4F28DC8];
    v27 = [(UIVisualEffectView *)v4->_vibrantWalletImageView contentView];
    v28 = objc_msgSend(v26, "safari_constraintsMatchingFrameOfView:withFrameOfView:", v14, v27);
    [v26 activateConstraints:v28];

    v29 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    cardDescriptionLabel = v4->_cardDescriptionLabel;
    v4->_cardDescriptionLabel = v29;

    v31 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v4->_cardDescriptionLabel setTextColor:v31];

    v32 = (void *)MEMORY[0x1E4FB1798];
    uint64_t v33 = *MEMORY[0x1E4FB28D8];
    v34 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v9];
    v35 = [v32 preferredFontForTextStyle:v33 compatibleWithTraitCollection:v34];
    [(UILabel *)v4->_cardDescriptionLabel setFont:v35];

    [(UILabel *)v4->_cardDescriptionLabel setLineBreakMode:5];
    [(UILabel *)v4->_cardDescriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    id v36 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
    v37 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v87 style:1];
    [v36 setEffect:v37];

    [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
    v38 = [v36 contentView];
    [v38 addSubview:v4->_cardDescriptionLabel];

    v39 = (void *)MEMORY[0x1E4F28DC8];
    v40 = v4->_cardDescriptionLabel;
    id v41 = v36;
    v86 = v36;
    v42 = [v36 contentView];
    v43 = objc_msgSend(v39, "safari_constraintsMatchingFrameOfView:withFrameOfView:", v40, v42);
    [v39 activateConstraints:v43];

    id v44 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v95[0] = v4->_vibrantWalletImageView;
    v95[1] = v41;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:2];
    uint64_t v46 = [v44 initWithArrangedSubviews:v45];
    cardDescriptionStackView = v4->_cardDescriptionStackView;
    v4->_cardDescriptionStackView = (UIStackView *)v46;

    [(UIStackView *)v4->_cardDescriptionStackView setAxis:0];
    [(UIStackView *)v4->_cardDescriptionStackView setAlignment:3];
    [(UIStackView *)v4->_cardDescriptionStackView setSpacing:4.0];
    [(UIStackView *)v4->_cardDescriptionStackView setLayoutMarginsRelativeArrangement:1];
    id v48 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v94[0] = v4->_cardNameLabel;
    v94[1] = v4->_cardDescriptionStackView;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
    v50 = (void *)[v48 initWithArrangedSubviews:v49];

    [v50 setAxis:1];
    [v50 setDistribution:2];
    [v50 setTranslatesAutoresizingMaskIntoConstraints:0];
    v85 = v50;
    [v50 setSpacing:2.0];
    id v51 = objc_alloc(MEMORY[0x1E4FB1838]);
    v52 = SFLargeCreditCardIconForType();
    uint64_t v53 = [v51 initWithImage:v52];
    cardArt = v4->_cardArt;
    v4->_cardArt = (UIImageView *)v53;

    v55 = (void *)MEMORY[0x1E4F28DC8];
    v56 = [(UIImageView *)v4->_cardArt widthAnchor];
    v57 = [v56 constraintEqualToConstant:56.0];
    v93[0] = v57;
    v58 = [(UIImageView *)v4->_cardArt heightAnchor];
    v59 = [v58 constraintEqualToConstant:36.0];
    v93[1] = v59;
    v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
    [v55 activateConstraints:v60];

    [(UIImageView *)v4->_cardArt setContentMode:8];
    id v61 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v92[0] = v4->_cardArt;
    v92[1] = v50;
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
    uint64_t v63 = [v61 initWithArrangedSubviews:v62];
    topLevelStackView = v4->_topLevelStackView;
    v4->_topLevelStackView = (UIStackView *)v63;

    [(UIStackView *)v4->_topLevelStackView setAxis:0];
    [(UIStackView *)v4->_topLevelStackView setDistribution:2];
    [(UIStackView *)v4->_topLevelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_topLevelStackView setSpacing:10.0];
    [(UIStackView *)v4->_topLevelStackView directionalLayoutMargins];
    [(UIStackView *)v4->_topLevelStackView setDirectionalLayoutMargins:v65 + 8.0];
    [(UIStackView *)v4->_topLevelStackView setLayoutMarginsRelativeArrangement:1];
    [v89 addSubview:v4->_topLevelStackView];
    v78 = (void *)MEMORY[0x1E4F28DC8];
    v84 = [(UIStackView *)v4->_topLevelStackView centerYAnchor];
    v83 = [v89 centerYAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v91[0] = v82;
    v81 = [(UIStackView *)v4->_topLevelStackView topAnchor];
    v80 = [v89 topAnchor];
    v79 = [v81 constraintEqualToAnchor:v80];
    v91[1] = v79;
    v66 = [(UIStackView *)v4->_topLevelStackView leadingAnchor];
    v67 = [v89 layoutMarginsGuide];
    v68 = [v67 leadingAnchor];
    v69 = [v66 constraintEqualToAnchor:v68];
    v91[2] = v69;
    v70 = [(UIStackView *)v4->_topLevelStackView trailingAnchor];
    v71 = [v89 layoutMarginsGuide];
    v72 = [v71 trailingAnchor];
    v73 = [v70 constraintEqualToAnchor:v72];
    v91[3] = v73;
    v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:4];
    [v78 activateConstraints:v74];

    id v75 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v75 _setContinuousCornerRadius:12.0];
    [(SFCreditCardCollectionViewCell *)v4 setBackgroundView:v75];
    v76 = v4;
  }
  return v4;
}

- (void)configureViewWithCardData:(id)a3
{
  id v5 = a3;
  if (WBSIsEqual()) {
    goto LABEL_21;
  }
  objc_storeStrong((id *)&self->_cardData, a3);
  v6 = [v5 cardName];
  if ([v6 length]) {
    [v5 cardName];
  }
  else {
  v7 = _WBSLocalizedString();
  }

  [(UILabel *)self->_cardNameLabel setText:v7];
  [(UIStackView *)self->_cardDescriptionStackView directionalLayoutMargins];
  double v9 = v8;
  double v11 = v10;
  if ([v5 isVirtualCard]) {
    double v12 = -2.0;
  }
  else {
    double v12 = 0.0;
  }
  if ([v5 isVirtualCard]) {
    double v13 = -4.0;
  }
  else {
    double v13 = 0.0;
  }
  -[UIStackView setDirectionalLayoutMargins:](self->_cardDescriptionStackView, "setDirectionalLayoutMargins:", v9, v12, v13, v11);
  -[UIVisualEffectView setHidden:](self->_vibrantWalletImageView, "setHidden:", [v5 isVirtualCard] ^ 1);
  v14 = [v5 cardNumber];
  v15 = WBSLastDigitsOfCreditCardNumber();

  if (![v5 isVirtualCard])
  {
    v19 = NSString;
    v16 = _WBSLocalizedString();
    uint64_t v20 = objc_msgSend(v19, "localizedStringWithFormat:", v16, v15);
LABEL_16:
    v17 = (void *)v20;
    [(UILabel *)self->_cardDescriptionLabel setText:v20];
    goto LABEL_17;
  }
  v16 = [v5 balance];
  if (!v16)
  {
    uint64_t v20 = WBSDisplayTextForCreditCardNumber();
    goto LABEL_16;
  }
  v17 = [v5 balance];
  v18 = [v17 formattedStringValue];
  [(UILabel *)self->_cardDescriptionLabel setText:v18];

LABEL_17:
  if ([v5 isVirtualCard])
  {
    [(UIImageView *)self->_cardArt setAlpha:0.0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __60__SFCreditCardCollectionViewCell_configureViewWithCardData___block_invoke;
    v23[3] = &unk_1E5C740C8;
    v23[4] = self;
    id v24 = v5;
    objc_msgSend(v24, "virtualCardArtworkWithSize:completionHandler:", v23, 56.0, 36.0);
  }
  else
  {
    v21 = [v5 cardNumber];
    WBSCreditCardTypeFromNumber();
    v22 = SFLargeCreditCardIconForType();
    [(UIImageView *)self->_cardArt setImage:v22];

    [(UIImageView *)self->_cardArt setAlpha:1.0];
  }
  [(SFCreditCardCollectionViewCell *)self setNeedsLayout];

LABEL_21:
}

void __60__SFCreditCardCollectionViewCell_configureViewWithCardData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (WBSIsEqual())
  {
    [*(id *)(*(void *)(a1 + 32) + 656) setImage:v3];
    [*(id *)(*(void *)(a1 + 32) + 656) setAlpha:1.0];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SFCreditCardCollectionViewCell *)self isHighlighted];
  v8.receiver = self;
  v8.super_class = (Class)SFCreditCardCollectionViewCell;
  [(SFCreditCardCollectionViewCell *)&v8 setHighlighted:v3];
  if (v5 != v3)
  {
    if (v3) {
      [MEMORY[0x1E4FB1618] systemFillColor];
    }
    else {
    v6 = [MEMORY[0x1E4FB1618] clearColor];
    }
    v7 = [(SFCreditCardCollectionViewCell *)self backgroundView];
    [v7 setBackgroundColor:v6];
  }
}

- (WBSCreditCardData)cardData
{
  return self->_cardData;
}

- (void)setCardData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardData, 0);
  objc_storeStrong((id *)&self->_cardDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_vibrantWalletImageView, 0);
  objc_storeStrong((id *)&self->_cardNameLabel, 0);
  objc_storeStrong((id *)&self->_cardArt, 0);
  objc_storeStrong((id *)&self->_cardDescriptionStackView, 0);

  objc_storeStrong((id *)&self->_topLevelStackView, 0);
}

@end