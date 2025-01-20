@interface HKPopulationNormsClassificationCollectionViewCell
- (BOOL)isHighlighted;
- (HKPopulationNormsClassificationCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIColor)highlightColor;
- (UILabel)classificationLabel;
- (void)_setupFonts;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setClassificationLabel:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setIsHighlighted:(BOOL)a3;
- (void)setSoftHighlightState:(BOOL)a3;
- (void)setTitle:(id)a3 classificationIdentifier:(id)a4 highlighted:(BOOL)a5;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKPopulationNormsClassificationCollectionViewCell

- (HKPopulationNormsClassificationCollectionViewCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HKPopulationNormsClassificationCollectionViewCell;
  v3 = -[HKPopulationNormsClassificationCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    classificationLabel = v3->_classificationLabel;
    v3->_classificationLabel = v4;

    [(HKPopulationNormsClassificationCollectionViewCell *)v3 addSubview:v3->_classificationLabel];
    [(UILabel *)v3->_classificationLabel hk_constrainToSuperviewAlongEdges:&unk_1F3C1F360 constant:6.0];
    [(UILabel *)v3->_classificationLabel hk_constrainToSuperviewAlongEdges:&unk_1F3C1F378 constant:12.0];
    v6 = [(HKPopulationNormsClassificationCollectionViewCell *)v3 widthAnchor];
    v7 = [v6 constraintGreaterThanOrEqualToConstant:90.0];
    [v7 setActive:1];

    v8 = [(HKPopulationNormsClassificationCollectionViewCell *)v3 heightAnchor];
    v9 = [v8 constraintGreaterThanOrEqualToConstant:28.0];
    [v9 setActive:1];

    [(HKPopulationNormsClassificationCollectionViewCell *)v3 _setupFonts];
  }
  return v3;
}

- (void)setTitle:(id)a3 classificationIdentifier:(id)a4 highlighted:(BOOL)a5
{
  BOOL v5 = a5;
  v13[4] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  self->_isHighlighted = v5;
  id v9 = a3;
  [(HKPopulationNormsClassificationCollectionViewCell *)self setSoftHighlightState:v5];
  if (v5) {
    [MEMORY[0x1E4FB1618] systemWhiteColor];
  }
  else {
  v10 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_populationChartTextColor");
  }
  [(UILabel *)self->_classificationLabel setTextColor:v10];

  [(UILabel *)self->_classificationLabel setText:v9];
  [(UILabel *)self->_classificationLabel setTextAlignment:1];
  if (v8)
  {
    v13[0] = @"Cell";
    v13[1] = @"PopulationNorms";
    v13[2] = @"Classification";
    v13[3] = v8;
    objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
    v12 = HKUIJoinStringsForAutomationIdentifier(v11);
    [(HKPopulationNormsClassificationCollectionViewCell *)self setAccessibilityIdentifier:v12];
  }
  else
  {
    [(HKPopulationNormsClassificationCollectionViewCell *)self setAccessibilityIdentifier:0];
  }
  [(UILabel *)self->_classificationLabel sizeToFit];
}

- (void)setSoftHighlightState:(BOOL)a3
{
  if (self->_isHighlighted || a3)
  {
    uint64_t v4 = [(HKPopulationNormsClassificationCollectionViewCell *)self highlightColor];
  }
  else
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_populationChartLevelBackgroundColor");
  }
  id v5 = (id)v4;
  [(HKPopulationNormsClassificationCollectionViewCell *)self setBackgroundColor:v4];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HKPopulationNormsClassificationCollectionViewCell;
  [(HKPopulationNormsClassificationCollectionViewCell *)&v3 prepareForReuse];
  [(HKPopulationNormsClassificationCollectionViewCell *)self setTitle:&stru_1F3B9CF20 classificationIdentifier:0 highlighted:0];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)HKPopulationNormsClassificationCollectionViewCell;
  [(HKPopulationNormsClassificationCollectionViewCell *)&v7 layoutSubviews];
  [(HKPopulationNormsClassificationCollectionViewCell *)self frame];
  CGFloat Height = CGRectGetHeight(v8);
  double v4 = HKUIFloorToScreenScale(Height * 0.5);
  id v5 = [(HKPopulationNormsClassificationCollectionViewCell *)self layer];
  [v5 setCornerRadius:v4];

  v6 = [(HKPopulationNormsClassificationCollectionViewCell *)self layer];
  [v6 setMasksToBounds:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKPopulationNormsClassificationCollectionViewCell;
  [(HKPopulationNormsClassificationCollectionViewCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HKPopulationNormsClassificationCollectionViewCell *)self traitCollection];
    v6 = [v5 preferredContentSizeCategory];
    objc_super v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKPopulationNormsClassificationCollectionViewCell *)self _setupFonts];
    }
  }
}

- (void)_setupFonts
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:maximumContentSizeCategory:", *MEMORY[0x1E4FB28F0], 32770, *MEMORY[0x1E4FB2798]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_classificationLabel setFont:v3];
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (UILabel)classificationLabel
{
  return self->_classificationLabel;
}

- (void)setClassificationLabel:(id)a3
{
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (void)setIsHighlighted:(BOOL)a3
{
  self->_isHighlighted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationLabel, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end