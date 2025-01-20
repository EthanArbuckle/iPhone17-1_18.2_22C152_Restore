@interface ASCompetitionParticipantScoreView
- (ASCompetitionParticipantScoreView)initWithConfiguration:(id)a3;
- (BOOL)secondaryScoreEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)name;
- (UIColor)scoreColor;
- (double)_availableScoreWidthForWidth:(double)a3;
- (double)_computeFontSizeReductionForLabel:(id)a3 width:(double)a4 maxReduction:(double)a5 updateBlock:(id)a6;
- (double)computeNameFontSizeReductionForWidth:(double)a3;
- (double)computePrimaryScoreFontSizeReductionForWidth:(double)a3;
- (double)nameBaselineY;
- (double)nameFontSizeReduction;
- (double)primaryScoreFontSizeReduction;
- (double)scoreLeftMargin;
- (double)scoreRightMargin;
- (unint64_t)primaryScore;
- (unint64_t)secondaryScore;
- (void)_updateNameLabelWithFontSizeReduction:(double)a3;
- (void)_updatePrimaryScoreLabelWithFontSizeReduction:(double)a3;
- (void)_updateSecondaryScoreLabel;
- (void)layoutForWidth:(double)a3;
- (void)layoutSubviews;
- (void)setName:(id)a3;
- (void)setNameFontSizeReduction:(double)a3;
- (void)setPrimaryScore:(unint64_t)a3;
- (void)setPrimaryScoreFontSizeReduction:(double)a3;
- (void)setScoreColor:(id)a3;
- (void)setScoreLeftMargin:(double)a3;
- (void)setScoreRightMargin:(double)a3;
- (void)setSecondaryScore:(unint64_t)a3;
- (void)setSecondaryScoreEnabled:(BOOL)a3;
@end

@implementation ASCompetitionParticipantScoreView

- (ASCompetitionParticipantScoreView)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASCompetitionParticipantScoreView;
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  v10 = -[ASCompetitionParticipantScoreView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x263F001A8], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_configuration, a3);
    if ([v5 showsNames])
    {
      uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v6, v7, v8, v9);
      nameLabel = v11->_nameLabel;
      v11->_nameLabel = (UILabel *)v12;

      v14 = [v5 nameFont];
      [(UILabel *)v11->_nameLabel setFont:v14];

      v15 = [MEMORY[0x263F825C8] whiteColor];
      [(UILabel *)v11->_nameLabel setTextColor:v15];

      [(UILabel *)v11->_nameLabel setLineBreakMode:4];
      [(UILabel *)v11->_nameLabel setAllowsDefaultTighteningForTruncation:1];
      if ([v5 alignment] == 1) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = 4;
      }
      [(UILabel *)v11->_nameLabel setTextAlignment:v16];
      [(ASCompetitionParticipantScoreView *)v11 addSubview:v11->_nameLabel];
    }
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v6, v7, v8, v9);
    primaryScoreLabel = v11->_primaryScoreLabel;
    v11->_primaryScoreLabel = (UILabel *)v17;

    [(UILabel *)v11->_primaryScoreLabel setLineBreakMode:4];
    if ([v5 alignment] == 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = 4;
    }
    [(UILabel *)v11->_primaryScoreLabel setTextAlignment:v19];
    [(ASCompetitionParticipantScoreView *)v11 addSubview:v11->_primaryScoreLabel];
  }

  return v11;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[ASCompetitionParticipantScoreView layoutForWidth:](self, "layoutForWidth:", a3.width, a3.height);
  secondaryScoreLabel = self->_secondaryScoreLabel;
  if (!secondaryScoreLabel) {
    secondaryScoreLabel = self->_primaryScoreLabel;
  }
  [(UILabel *)secondaryScoreLabel _lastLineBaselineFrameOriginY];
  double v7 = v6;
  double v8 = width;
  result.height = v7;
  result.CGFloat width = v8;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)ASCompetitionParticipantScoreView;
  [(ASCompetitionParticipantScoreView *)&v4 layoutSubviews];
  [(ASCompetitionParticipantScoreView *)self bounds];
  [(ASCompetitionParticipantScoreView *)self layoutForWidth:v3];
}

- (void)layoutForWidth:(double)a3
{
  previousLayoutWidth = self->_previousLayoutWidth;
  if (!previousLayoutWidth
    || ([(NSNumber *)previousLayoutWidth floatValue], vabdd_f64(v6, a3) >= 0.00000011920929))
  {
    [(UILabel *)self->_nameLabel sizeToFit];
    [(UILabel *)self->_primaryScoreLabel sizeToFit];
    [(UILabel *)self->_secondaryScoreLabel sizeToFit];
    if (self->_nameLabel)
    {
      [(ASCompetitionScoreViewConfiguration *)self->_configuration nameBaselineOffset];
      double v8 = v7;
      if ([(ASCompetitionScoreViewConfiguration *)self->_configuration wantsScaledBaselineAlignment])
      {
        double v9 = [(UILabel *)self->_nameLabel font];
        [(ASCompetitionScoreViewConfiguration *)self->_configuration nameBaselineOffset];
        objc_msgSend(v9, "_scaledValueForValue:");
        double v8 = v10;
      }
      [(UILabel *)self->_nameLabel bounds];
      -[UILabel setFrame:](self->_nameLabel, "setFrame:", 0.0, 0.0, a3, CGRectGetHeight(v28));
      [(UILabel *)self->_nameLabel _setFirstLineBaselineFrameOriginY:v8];
    }
    else
    {
      double v8 = 0.0;
    }
    [(ASCompetitionScoreViewConfiguration *)self->_configuration primaryScoreBaselineOffset];
    double v12 = v11;
    if ([(ASCompetitionScoreViewConfiguration *)self->_configuration wantsScaledBaselineAlignment])
    {
      v13 = [(UILabel *)self->_primaryScoreLabel font];
      [(ASCompetitionScoreViewConfiguration *)self->_configuration primaryScoreBaselineOffset];
      objc_msgSend(v13, "_scaledValueForValue:");
      double v12 = v14;
    }
    [(UILabel *)self->_primaryScoreLabel bounds];
    double v15 = (a3 - CGRectGetWidth(v29)) * -0.5;
    double scoreLeftMargin = self->_scoreLeftMargin;
    float v17 = scoreLeftMargin;
    float scoreRightMargin = self->_scoreRightMargin;
    double v19 = fmaxf(v17, scoreRightMargin);
    double v20 = v19 + v15 + v19 + v15;
    double v21 = 0.0;
    if (v20 <= 0.0)
    {
      double v22 = a3;
    }
    else
    {
      if (scoreLeftMargin > 0.0) {
        double v21 = v20 + 0.0;
      }
      double v22 = a3 - v20;
    }
    double v23 = v8 + v12;
    [(UILabel *)self->_primaryScoreLabel bounds];
    -[UILabel setFrame:](self->_primaryScoreLabel, "setFrame:", v21, 0.0, v22, CGRectGetHeight(v30));
    [(UILabel *)self->_primaryScoreLabel _setFirstLineBaselineFrameOriginY:v23];
    if (self->_secondaryScoreLabel)
    {
      [(ASCompetitionScoreViewConfiguration *)self->_configuration secondaryScoreBaselineOffset];
      double v25 = v23 + v24;
      double v26 = self->_scoreLeftMargin;
      [(UILabel *)self->_secondaryScoreLabel bounds];
      -[UILabel setFrame:](self->_secondaryScoreLabel, "setFrame:", v26, 0.0, v22, CGRectGetHeight(v31));
      [(UILabel *)self->_secondaryScoreLabel _setFirstLineBaselineFrameOriginY:v25];
    }
    self->_previousLayoutWidth = [NSNumber numberWithDouble:a3];
    MEMORY[0x270F9A758]();
  }
}

- (double)nameBaselineY
{
  [(UILabel *)self->_nameLabel _lastLineBaselineFrameOriginY];
  return result;
}

- (void)setName:(id)a3
{
  [(UILabel *)self->_nameLabel setText:a3];
  previousLayoutWidth = self->_previousLayoutWidth;
  self->_previousLayoutWidth = 0;

  [(ASCompetitionParticipantScoreView *)self setNeedsLayout];
}

- (void)setNameFontSizeReduction:(double)a3
{
  if (vabdd_f64(self->_nameFontSizeReduction, a3) > 0.00000011920929)
  {
    -[ASCompetitionParticipantScoreView _updateNameLabelWithFontSizeReduction:](self, "_updateNameLabelWithFontSizeReduction:");
    previousLayoutWidth = self->_previousLayoutWidth;
    self->_previousLayoutWidth = 0;

    [(ASCompetitionParticipantScoreView *)self setNeedsLayout];
  }
}

- (void)setPrimaryScore:(unint64_t)a3
{
  self->_primaryScore = a3;
  [(ASCompetitionParticipantScoreView *)self _updatePrimaryScoreLabelWithFontSizeReduction:self->_primaryScoreFontSizeReduction];
  previousLayoutWidth = self->_previousLayoutWidth;
  self->_previousLayoutWidth = 0;

  [(ASCompetitionParticipantScoreView *)self setNeedsLayout];
}

- (void)setPrimaryScoreFontSizeReduction:(double)a3
{
  if (vabdd_f64(self->_primaryScoreFontSizeReduction, a3) > 0.00000011920929)
  {
    -[ASCompetitionParticipantScoreView _updatePrimaryScoreLabelWithFontSizeReduction:](self, "_updatePrimaryScoreLabelWithFontSizeReduction:");
    previousLayoutWidth = self->_previousLayoutWidth;
    self->_previousLayoutWidth = 0;

    [(ASCompetitionParticipantScoreView *)self setNeedsLayout];
  }
}

- (void)setSecondaryScore:(unint64_t)a3
{
  self->_secondaryScore = a3;
  [(ASCompetitionParticipantScoreView *)self _updateSecondaryScoreLabel];
}

- (void)setScoreColor:(id)a3
{
  p_scoreColor = &self->_scoreColor;
  objc_storeStrong((id *)&self->_scoreColor, a3);
  id v6 = a3;
  [(UILabel *)self->_secondaryScoreLabel setTextColor:*p_scoreColor];
}

- (void)setSecondaryScoreEnabled:(BOOL)a3
{
  if (self->_secondaryScoreEnabled != a3)
  {
    self->_secondaryScoreEnabled = a3;
    secondaryScoreLabel = self->_secondaryScoreLabel;
    if (a3)
    {
      if (!secondaryScoreLabel)
      {
        id v5 = objc_alloc(MEMORY[0x263F828E0]);
        id v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        double v7 = self->_secondaryScoreLabel;
        self->_secondaryScoreLabel = v6;

        [(UILabel *)self->_secondaryScoreLabel setLineBreakMode:4];
        if ([(ASCompetitionScoreViewConfiguration *)self->_configuration alignment] == 1) {
          uint64_t v8 = 1;
        }
        else {
          uint64_t v8 = 4;
        }
        [(UILabel *)self->_secondaryScoreLabel setTextAlignment:v8];
        double v9 = [(ASCompetitionScoreViewConfiguration *)self->_configuration secondaryScoreFont];
        [(UILabel *)self->_secondaryScoreLabel setFont:v9];

        [(UILabel *)self->_secondaryScoreLabel setTextColor:self->_scoreColor];
        [(ASCompetitionParticipantScoreView *)self addSubview:self->_secondaryScoreLabel];
        [(ASCompetitionParticipantScoreView *)self _updateSecondaryScoreLabel];
      }
    }
    else if (secondaryScoreLabel)
    {
      [(UILabel *)secondaryScoreLabel removeFromSuperview];
      double v10 = self->_secondaryScoreLabel;
      self->_secondaryScoreLabel = 0;
    }
    previousLayoutWidth = self->_previousLayoutWidth;
    self->_previousLayoutWidth = 0;

    [(ASCompetitionParticipantScoreView *)self setNeedsLayout];
  }
}

- (double)computePrimaryScoreFontSizeReductionForWidth:(double)a3
{
  [(ASCompetitionParticipantScoreView *)self _availableScoreWidthForWidth:a3];
  double v5 = v4;
  id v6 = [(ASCompetitionScoreViewConfiguration *)self->_configuration primaryScoreFont];
  [v6 pointSize];
  double v8 = v7 * 0.3;

  primaryScoreLabel = self->_primaryScoreLabel;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__ASCompetitionParticipantScoreView_computePrimaryScoreFontSizeReductionForWidth___block_invoke;
  v11[3] = &unk_264C19798;
  v11[4] = self;
  [(ASCompetitionParticipantScoreView *)self _computeFontSizeReductionForLabel:primaryScoreLabel width:v11 maxReduction:v5 updateBlock:v8];
  return result;
}

uint64_t __82__ASCompetitionParticipantScoreView_computePrimaryScoreFontSizeReductionForWidth___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePrimaryScoreLabelWithFontSizeReduction:");
}

- (double)computeNameFontSizeReductionForWidth:(double)a3
{
  BOOL v5 = [(ASCompetitionScoreViewConfiguration *)self->_configuration showsNames];
  double result = 0.0;
  if (v5)
  {
    double v7 = [(ASCompetitionScoreViewConfiguration *)self->_configuration nameFont];
    [v7 pointSize];
    double v9 = v8 * 0.3;

    nameLabel = self->_nameLabel;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __74__ASCompetitionParticipantScoreView_computeNameFontSizeReductionForWidth___block_invoke;
    v11[3] = &unk_264C19798;
    v11[4] = self;
    [(ASCompetitionParticipantScoreView *)self _computeFontSizeReductionForLabel:nameLabel width:v11 maxReduction:a3 updateBlock:v9];
  }
  return result;
}

uint64_t __74__ASCompetitionParticipantScoreView_computeNameFontSizeReductionForWidth___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateNameLabelWithFontSizeReduction:");
}

- (double)_computeFontSizeReductionForLabel:(id)a3 width:(double)a4 maxReduction:(double)a5 updateBlock:(id)a6
{
  id v9 = a3;
  double v10 = (void (**)(void, double))a6;
  double v11 = 0.0;
  if (a4 > 1.0)
  {
    double v11 = -1.0;
    if (a5 >= -1.0)
    {
      do
      {
        double v11 = v11 + 1.0;
        v10[2](v10, v11);
        objc_msgSend(v9, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      }
      while (v11 <= a5 && v12 > a4);
    }
  }

  return v11;
}

- (double)_availableScoreWidthForWidth:(double)a3
{
  return a3 - self->_scoreLeftMargin - self->_scoreRightMargin;
}

- (void)_updateNameLabelWithFontSizeReduction:(double)a3
{
  BOOL v5 = [(ASCompetitionScoreViewConfiguration *)self->_configuration nameFont];
  id v6 = v5;
  if (fabs(a3) > 0.00000011920929)
  {
    id v9 = v5;
    [v5 pointSize];
    uint64_t v8 = [v9 fontWithSize:v7 - a3];

    id v6 = (void *)v8;
  }
  id v10 = v6;
  [(UILabel *)self->_nameLabel setFont:v6];
  self->_nameFontSizeReduction = a3;
}

- (void)_updatePrimaryScoreLabelWithFontSizeReduction:(double)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  BOOL v5 = [(ASCompetitionScoreViewConfiguration *)self->_configuration primaryScoreFont];
  id v6 = [(ASCompetitionScoreViewConfiguration *)self->_configuration primaryScoreUnitFont];
  if (fabs(a3) > 0.00000011920929)
  {
    [v5 pointSize];
    double v8 = v7;
    [v6 pointSize];
    double v10 = v9;
    uint64_t v11 = [v5 fontWithSize:v8 - a3];

    uint64_t v12 = [v6 fontWithSize:v10 - a3];

    id v6 = (void *)v12;
    BOOL v5 = (void *)v11;
  }
  if ([(ASCompetitionScoreViewConfiguration *)self->_configuration showsPrimaryScoreUnits])
  {
    v13 = ASPointsStringWithScore(self->_primaryScore, v5, v6, self->_scoreColor);
    [(UILabel *)self->_primaryScoreLabel setAttributedText:v13];
  }
  else
  {
    if ([(ASCompetitionScoreViewConfiguration *)self->_configuration zeroPadPrimaryScore])
    {
      v13 = ASCompetitionZeroPaddedScoreString(self->_primaryScore);
    }
    else
    {
      double v14 = (void *)MEMORY[0x263F3F170];
      double v15 = [NSNumber numberWithUnsignedInteger:self->_primaryScore];
      v13 = [v14 stringWithNumber:v15 decimalPrecision:1];
    }
    id v16 = objc_alloc(MEMORY[0x263F086A0]);
    scoreColor = self->_scoreColor;
    uint64_t v18 = *MEMORY[0x263F814F0];
    v21[0] = *MEMORY[0x263F81500];
    v21[1] = v18;
    v22[0] = scoreColor;
    v22[1] = v5;
    double v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    double v20 = (void *)[v16 initWithString:v13 attributes:v19];
    [(UILabel *)self->_primaryScoreLabel setAttributedText:v20];
  }
  self->_primaryScoreFontSizeReduction = a3;
}

- (void)_updateSecondaryScoreLabel
{
  double v3 = (void *)MEMORY[0x263F3F170];
  double v4 = [NSNumber numberWithUnsignedInteger:self->_secondaryScore];
  id v9 = [v3 stringWithNumber:v4 decimalPrecision:1];

  BOOL v5 = NSString;
  id v6 = ActivitySharingBundle();
  double v7 = [v6 localizedStringForKey:@"COMPETITION_TODAY_SCORE_SUBTEXT" value:&stru_26E8035F0 table:@"Localizable"];
  double v8 = objc_msgSend(v5, "stringWithFormat:", v7, v9);
  [(UILabel *)self->_secondaryScoreLabel setText:v8];
}

- (NSString)name
{
  return self->_name;
}

- (double)nameFontSizeReduction
{
  return self->_nameFontSizeReduction;
}

- (unint64_t)primaryScore
{
  return self->_primaryScore;
}

- (double)primaryScoreFontSizeReduction
{
  return self->_primaryScoreFontSizeReduction;
}

- (unint64_t)secondaryScore
{
  return self->_secondaryScore;
}

- (UIColor)scoreColor
{
  return self->_scoreColor;
}

- (BOOL)secondaryScoreEnabled
{
  return self->_secondaryScoreEnabled;
}

- (double)scoreLeftMargin
{
  return self->_scoreLeftMargin;
}

- (void)setScoreLeftMargin:(double)a3
{
  self->_double scoreLeftMargin = a3;
}

- (double)scoreRightMargin
{
  return self->_scoreRightMargin;
}

- (void)setScoreRightMargin:(double)a3
{
  self->_float scoreRightMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_previousLayoutWidth, 0);
  objc_storeStrong((id *)&self->_secondaryScoreLabel, 0);
  objc_storeStrong((id *)&self->_primaryScoreLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end