@interface CSStatusTextView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CSStatusTextView)initWithFrame:(CGRect)a3;
- (NSArray)deviceInformationText;
- (NSString)internalLegalText;
- (NSString)provisionalEnrollmentText;
- (NSString)supervisionText;
- (_UILegibilitySettings)legibilitySettings;
- (double)_lineHeightOfNonLegalLabels;
- (double)_nonLegalLabelFontLeading;
- (double)_nonLegalTextParagraphSpacing;
- (double)_spacingBetweenNonLegalLabels;
- (double)strength;
- (id)_font;
- (id)_largeFont;
- (void)_updateDeviceInformationLabel;
- (void)_updateInternalLegalLabel;
- (void)_updateLegibilityStrength;
- (void)_updateProvisionalEnrollmentLabel;
- (void)_updateSupervisionLabel;
- (void)_updateTextViews;
- (void)_updateTextViewsIfNecessary;
- (void)layoutSubviews;
- (void)setDeviceInformationText:(id)a3;
- (void)setInternalLegalText:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setProvisionalEnrollmentText:(id)a3;
- (void)setStrength:(double)a3;
- (void)setSupervisionText:(id)a3;
- (void)updateTextsWithBlock:(id)a3;
@end

@implementation CSStatusTextView

- (CSStatusTextView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CSStatusTextView;
  v3 = -[CSStatusTextView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:2];
    legibilitySettings = v3->_legibilitySettings;
    v3->_legibilitySettings = (_UILegibilitySettings *)v4;

    v6 = [MEMORY[0x1E4FA5F38] rootSettings];
    [v6 statusTextStrengthForStyle:2];
    v3->_strength = v7;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FA7CA0]) initWithSettings:v3->_legibilitySettings strength:v3->_strength];
    supervisionLabel = v3->_supervisionLabel;
    v3->_supervisionLabel = (SBUILegibilityLabel *)v8;

    [(SBUILegibilityLabel *)v3->_supervisionLabel setHidden:1];
    [(SBUILegibilityLabel *)v3->_supervisionLabel setOptions:2];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FA7CA0]) initWithSettings:v3->_legibilitySettings strength:v3->_strength];
    provisionalEnrollmentLabel = v3->_provisionalEnrollmentLabel;
    v3->_provisionalEnrollmentLabel = (SBUILegibilityLabel *)v10;

    [(SBUILegibilityLabel *)v3->_provisionalEnrollmentLabel setHidden:1];
    [(SBUILegibilityLabel *)v3->_provisionalEnrollmentLabel setOptions:2];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FA7CA0]) initWithSettings:v3->_legibilitySettings strength:v3->_strength];
    deviceInformationLabel = v3->_deviceInformationLabel;
    v3->_deviceInformationLabel = (SBUILegibilityLabel *)v12;

    [(SBUILegibilityLabel *)v3->_deviceInformationLabel setHidden:1];
    [(SBUILegibilityLabel *)v3->_deviceInformationLabel setOptions:2];
  }
  return v3;
}

- (void)setSupervisionText:(id)a3
{
  if (self->_supervisionText != a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    supervisionText = self->_supervisionText;
    self->_supervisionText = v4;

    [(CSStatusTextView *)self _updateTextViewsIfNecessary];
  }
}

- (void)setProvisionalEnrollmentText:(id)a3
{
  if (self->_provisionalEnrollmentText != a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    provisionalEnrollmentText = self->_provisionalEnrollmentText;
    self->_provisionalEnrollmentText = v4;

    [(CSStatusTextView *)self _updateTextViewsIfNecessary];
  }
}

- (void)setDeviceInformationText:(id)a3
{
  if (self->_deviceInformationText != a3)
  {
    uint64_t v4 = (NSArray *)[a3 copy];
    deviceInformationText = self->_deviceInformationText;
    self->_deviceInformationText = v4;

    [(CSStatusTextView *)self _updateTextViewsIfNecessary];
  }
}

- (void)setInternalLegalText:(id)a3
{
  if (self->_internalLegalText != a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    internalLegalText = self->_internalLegalText;
    self->_internalLegalText = v4;

    [(CSStatusTextView *)self _updateTextViewsIfNecessary];
  }
}

- (void)updateTextsWithBlock:(id)a3
{
  unint64_t transactionCount = self->_transactionCount;
  self->_unint64_t transactionCount = transactionCount + 1;
  if (a3)
  {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    unint64_t transactionCount = self->_transactionCount - 1;
  }
  self->_unint64_t transactionCount = transactionCount;

  [(CSStatusTextView *)self _updateTextViewsIfNecessary];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = (double *)MEMORY[0x1E4F43B90];
  if (self->_supervisionText)
  {
    -[SBUILegibilityLabel systemLayoutSizeFittingSize:](self->_supervisionLabel, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
  }
  else if (!self->_deviceInformationText)
  {
    if (self->_internalLegalText)
    {
      -[SBUILegibilityLabel sizeThatFits:](self->_internalLegalTextLabel, "sizeThatFits:", a3.width, a3.height);
      double v8 = v12;
    }
    else
    {
      double width = *MEMORY[0x1E4F1DB30];
      double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    goto LABEL_10;
  }
  if (self->_provisionalEnrollmentText) {
    -[SBUILegibilityLabel systemLayoutSizeFittingSize:](self->_provisionalEnrollmentLabel, "systemLayoutSizeFittingSize:", *v6, v6[1]);
  }
  if (self->_deviceInformationText) {
    -[SBUILegibilityLabel systemLayoutSizeFittingSize:](self->_deviceInformationLabel, "systemLayoutSizeFittingSize:", *v6, v6[1]);
  }
  [(CSStatusTextView *)self _spacingBetweenNonLegalLabels];
  SBFMainScreenScale();
  BSFloatCeilForScale();
  double v8 = v7;
  if (self->_internalLegalText)
  {
    -[SBUILegibilityLabel sizeThatFits:](self->_internalLegalTextLabel, "sizeThatFits:", width, height);
    double v8 = v8 + v9 + 2.0;
  }
LABEL_10:
  double v10 = width;
  double v11 = v8;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  [(CSStatusTextView *)self bounds];
  double v4 = v3;
  -[SBUILegibilityLabel sizeThatFits:](self->_internalLegalTextLabel, "sizeThatFits:", v5, v3);
  SBFMainScreenScale();
  uint64_t v25 = v6;
  UIRectCenteredXInRectScale();
  double v8 = v7;
  [(SBUILegibilityLabel *)self->_internalLegalTextLabel setFrame:v25];
  double v9 = (double *)MEMORY[0x1E4F43B90];
  if (self->_provisionalEnrollmentText)
  {
    -[SBUILegibilityLabel systemLayoutSizeFittingSize:](self->_provisionalEnrollmentLabel, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
    double v11 = v10;
  }
  else
  {
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_supervisionText)
  {
    -[SBUILegibilityLabel systemLayoutSizeFittingSize:](self->_supervisionLabel, "systemLayoutSizeFittingSize:", *v9, v9[1]);
    double v29 = v12;
  }
  else
  {
    double v29 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_deviceInformationText)
  {
    -[SBUILegibilityLabel systemLayoutSizeFittingSize:](self->_deviceInformationLabel, "systemLayoutSizeFittingSize:", *v9, v9[1]);
    double v30 = v13;
  }
  else
  {
    double v30 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (self->_internalLegalText) {
    double v14 = v4 - v8 + -2.0;
  }
  else {
    double v14 = v4;
  }
  SBFMainScreenScale();
  uint64_t v26 = v15;
  UIRectCenteredXInRectScale();
  [(SBUILegibilityLabel *)self->_provisionalEnrollmentLabel setFrame:v26];
  provisionalEnrollmentLabel = self->_provisionalEnrollmentLabel;
  if (self->_provisionalEnrollmentText && v11 <= v14)
  {
    [(SBUILegibilityLabel *)provisionalEnrollmentLabel setHidden:0];
    [(CSStatusTextView *)self _spacingBetweenNonLegalLabels];
    double v14 = v14 - (v11 + v17);
  }
  else
  {
    [(SBUILegibilityLabel *)provisionalEnrollmentLabel setHidden:1];
  }
  SBFMainScreenScale();
  uint64_t v27 = v18;
  UIRectCenteredXInRectScale();
  [(SBUILegibilityLabel *)self->_supervisionLabel setFrame:v27];
  supervisionLabel = self->_supervisionLabel;
  if (self->_supervisionText && v29 <= v14)
  {
    [(SBUILegibilityLabel *)supervisionLabel setHidden:0];
    [(CSStatusTextView *)self _spacingBetweenNonLegalLabels];
    double v14 = v14 - (v29 + v20);
  }
  else
  {
    [(SBUILegibilityLabel *)supervisionLabel setHidden:1];
  }
  SBFMainScreenScale();
  uint64_t v28 = v21;
  UIRectCenteredXInRectScale();
  [(SBUILegibilityLabel *)self->_deviceInformationLabel setFrame:v28];
  BOOL v23 = v30 > v14 || self->_deviceInformationText == 0;
  deviceInformationLabel = self->_deviceInformationLabel;

  [(SBUILegibilityLabel *)deviceInformationLabel setHidden:v23];
}

- (void)setLegibilitySettings:(id)a3
{
  id v4 = a3;
  if (![v4 style])
  {
    uint64_t v5 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:2];

    id v4 = (id)v5;
  }
  legibilitySettings = self->_legibilitySettings;
  self->_legibilitySettings = (_UILegibilitySettings *)v4;
  id v7 = v4;

  [(SBUILegibilityLabel *)self->_supervisionLabel setLegibilitySettings:self->_legibilitySettings];
  [(SBUILegibilityLabel *)self->_provisionalEnrollmentLabel setLegibilitySettings:self->_legibilitySettings];
  [(SBUILegibilityLabel *)self->_deviceInformationLabel setLegibilitySettings:self->_legibilitySettings];
  [(SBUILegibilityLabel *)self->_internalLegalTextLabel setLegibilitySettings:self->_legibilitySettings];

  [(CSStatusTextView *)self _updateLegibilityStrength];
}

- (void)_updateTextViewsIfNecessary
{
  if (!self->_transactionCount) {
    [(CSStatusTextView *)self _updateTextViews];
  }
}

- (void)_updateTextViews
{
  [(CSStatusTextView *)self _updateInternalLegalLabel];
  [(CSStatusTextView *)self _updateSupervisionLabel];
  [(CSStatusTextView *)self _updateProvisionalEnrollmentLabel];
  [(CSStatusTextView *)self _updateDeviceInformationLabel];

  [(CSStatusTextView *)self setNeedsLayout];
}

- (void)_updateLegibilityStrength
{
  uint64_t v3 = [(_UILegibilitySettings *)self->_legibilitySettings style];
  id v4 = [MEMORY[0x1E4FA5F38] rootSettings];
  [v4 statusTextStrengthForStyle:v3];
  double v6 = v5;

  [(CSStatusTextView *)self setStrength:v6];
  [(SBUILegibilityLabel *)self->_internalLegalTextLabel setStrength:self->_strength];
  [(SBUILegibilityLabel *)self->_supervisionLabel setStrength:self->_strength];
  [(SBUILegibilityLabel *)self->_provisionalEnrollmentLabel setStrength:self->_strength];
  deviceInformationLabel = self->_deviceInformationLabel;
  double strength = self->_strength;

  [(SBUILegibilityLabel *)deviceInformationLabel setStrength:strength];
}

- (id)_font
{
  return (id)[MEMORY[0x1E4F42A30] systemFontOfSize:10.0];
}

- (id)_largeFont
{
  return (id)[MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
}

- (void)_updateInternalLegalLabel
{
  internalLegalText = self->_internalLegalText;
  internalLegalTextLabel = self->_internalLegalTextLabel;
  if (internalLegalText)
  {
    if (!internalLegalTextLabel)
    {
      legibilitySettings = self->_legibilitySettings;
      if (legibilitySettings)
      {
        double v6 = legibilitySettings;
      }
      else
      {
        double v6 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
      }
      double v8 = v6;
      id v9 = objc_alloc(MEMORY[0x1E4FA7CA0]);
      double strength = self->_strength;
      double v11 = self->_internalLegalText;
      double v12 = [(CSStatusTextView *)self _font];
      double v13 = (SBUILegibilityLabel *)[v9 initWithSettings:v8 strength:v11 string:v12 font:strength];
      double v14 = self->_internalLegalTextLabel;
      self->_internalLegalTextLabel = v13;

      [(SBUILegibilityLabel *)self->_internalLegalTextLabel setOptions:2];
      uint64_t v15 = self->_internalLegalTextLabel;
      v16 = [MEMORY[0x1E4FA5F38] rootSettings];
      objc_msgSend(v16, "statusTextStrengthForStyle:", -[_UILegibilitySettings style](v8, "style"));
      -[SBUILegibilityLabel setStrength:](v15, "setStrength:");

      internalLegalTextLabel = self->_internalLegalTextLabel;
    }
    [(SBUILegibilityLabel *)internalLegalTextLabel sizeToFit];
    [(CSStatusTextView *)self addSubview:self->_internalLegalTextLabel];
  }
  else if (internalLegalTextLabel)
  {
    [(SBUILegibilityLabel *)internalLegalTextLabel removeFromSuperview];
    id v7 = self->_internalLegalTextLabel;
    self->_internalLegalTextLabel = 0;
  }

  [(CSStatusTextView *)self setNeedsLayout];
}

- (void)_updateSupervisionLabel
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CSStatusTextView *)self _font];
  if ([(NSString *)self->_supervisionText length])
  {
    id v4 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
    double v5 = (void *)[v4 mutableCopy];

    [(CSStatusTextView *)self _nonLegalLabelFontLeading];
    double v7 = v6;
    [v3 lineHeight];
    [v5 setLineSpacing:v7 - v8];
    [v5 setAlignment:1];
    [v5 setLineBreakMode:4];
    uint64_t v9 = *MEMORY[0x1E4F42508];
    v12[0] = *MEMORY[0x1E4F42540];
    v12[1] = v9;
    v13[0] = v5;
    v13[1] = v3;
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    double v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_supervisionText attributes:v10];
    [(CSStatusTextView *)self addSubview:self->_supervisionLabel];
  }
  else
  {
    [(SBUILegibilityLabel *)self->_supervisionLabel removeFromSuperview];
    double v11 = 0;
  }
  [(SBUILegibilityLabel *)self->_supervisionLabel setAttributedText:v11];
  [(SBUILegibilityLabel *)self->_supervisionLabel setNumberOfLines:1];
  [(CSStatusTextView *)self setNeedsLayout];
}

- (void)_updateProvisionalEnrollmentLabel
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CSStatusTextView *)self _largeFont];
  if ([(NSString *)self->_provisionalEnrollmentText length])
  {
    id v4 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
    double v5 = (void *)[v4 mutableCopy];

    [(CSStatusTextView *)self _nonLegalLabelFontLeading];
    double v7 = v6;
    [v3 lineHeight];
    [v5 setLineSpacing:v7 - v8];
    [v5 setAlignment:1];
    [v5 setLineBreakMode:4];
    uint64_t v9 = *MEMORY[0x1E4F42508];
    v12[0] = *MEMORY[0x1E4F42540];
    v12[1] = v9;
    v13[0] = v5;
    v13[1] = v3;
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    double v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_provisionalEnrollmentText attributes:v10];
    [(CSStatusTextView *)self addSubview:self->_provisionalEnrollmentLabel];
  }
  else
  {
    [(SBUILegibilityLabel *)self->_provisionalEnrollmentLabel removeFromSuperview];
    double v11 = 0;
  }
  [(SBUILegibilityLabel *)self->_provisionalEnrollmentLabel setAttributedText:v11];
  [(SBUILegibilityLabel *)self->_provisionalEnrollmentLabel setNumberOfLines:1];
  [(CSStatusTextView *)self setNeedsLayout];
}

- (void)_updateDeviceInformationLabel
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CSStatusTextView *)self _font];
  if ([(NSArray *)self->_deviceInformationText count])
  {
    id v4 = [(NSArray *)self->_deviceInformationText componentsJoinedByString:@" "];
    double v5 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
    double v6 = (void *)[v5 mutableCopy];

    [(CSStatusTextView *)self _nonLegalLabelFontLeading];
    double v8 = v7;
    [v3 lineHeight];
    [v6 setLineSpacing:v8 - v9];
    [v6 setAlignment:1];
    [v6 setLineBreakMode:4];
    uint64_t v10 = *MEMORY[0x1E4F42508];
    v13[0] = *MEMORY[0x1E4F42540];
    v13[1] = v10;
    v14[0] = v6;
    v14[1] = v3;
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v11];
    [(CSStatusTextView *)self addSubview:self->_deviceInformationLabel];
  }
  else
  {
    [(SBUILegibilityLabel *)self->_deviceInformationLabel removeFromSuperview];
    double v12 = 0;
  }
  [(SBUILegibilityLabel *)self->_deviceInformationLabel setAttributedText:v12];
  [(SBUILegibilityLabel *)self->_deviceInformationLabel setNumberOfLines:1];
  [(CSStatusTextView *)self setNeedsLayout];
}

- (double)_nonLegalLabelFontLeading
{
  return 13.0;
}

- (double)_nonLegalTextParagraphSpacing
{
  if (__sb__runningInSpringBoard())
  {
    int v2 = SBFEffectiveDeviceClass();
    double result = 23.0;
    if (v2 != 2) {
      return result;
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    double result = 23.0;
    if (v5 != 1) {
      return result;
    }
  }
  uint64_t v6 = objc_msgSend((id)*MEMORY[0x1E4F43630], "activeInterfaceOrientation", result);
  double result = 18.5;
  if ((unint64_t)(v6 - 1) < 2) {
    return 23.0;
  }
  return result;
}

- (double)_lineHeightOfNonLegalLabels
{
  int v2 = [(CSStatusTextView *)self _font];
  [v2 lineHeight];
  SBFMainScreenScale();
  BSFloatCeilForScale();
  double v4 = v3;

  return v4;
}

- (double)_spacingBetweenNonLegalLabels
{
  [(CSStatusTextView *)self _nonLegalTextParagraphSpacing];
  [(CSStatusTextView *)self _lineHeightOfNonLegalLabels];
  SBFMainScreenScale();

  BSFloatFloorForScale();
  return result;
}

- (double)strength
{
  return self->_strength;
}

- (void)setStrength:(double)a3
{
  self->_double strength = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (NSString)internalLegalText
{
  return self->_internalLegalText;
}

- (NSString)supervisionText
{
  return self->_supervisionText;
}

- (NSArray)deviceInformationText
{
  return self->_deviceInformationText;
}

- (NSString)provisionalEnrollmentText
{
  return self->_provisionalEnrollmentText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisionalEnrollmentText, 0);
  objc_storeStrong((id *)&self->_deviceInformationText, 0);
  objc_storeStrong((id *)&self->_supervisionText, 0);
  objc_storeStrong((id *)&self->_internalLegalText, 0);
  objc_storeStrong((id *)&self->_provisionalEnrollmentLabel, 0);
  objc_storeStrong((id *)&self->_supervisionLabel, 0);
  objc_storeStrong((id *)&self->_deviceInformationLabel, 0);
  objc_storeStrong((id *)&self->_internalLegalTextLabel, 0);

  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end