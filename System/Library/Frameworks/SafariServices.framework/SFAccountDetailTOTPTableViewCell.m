@interface SFAccountDetailTOTPTableViewCell
- (SFAccountDetailTOTPTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)overrideVerificationCodeLabelTextColor;
- (id)_attributedSubtitleString;
- (id)_attributedSubtitleStringWithRemainingSeconds:(unint64_t)a3;
- (id)_formattedCode;
- (void)_startTOTPTimerIfNeeded;
- (void)_updateCodeAndLabels;
- (void)_updateTitleAndVerificationCodeStackView;
- (void)_updateVerificationCodeLabelTextColor;
- (void)configureWithGenerator:(id)a3;
- (void)dealloc;
- (void)setOverrideVerificationCodeLabelTextColor:(id)a3;
@end

@implementation SFAccountDetailTOTPTableViewCell

- (SFAccountDetailTOTPTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v52[2] = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)SFAccountDetailTOTPTableViewCell;
  v4 = [(SFAccountDetailTOTPTableViewCell *)&v48 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v6 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v5 setFont:v6];

    v7 = [MEMORY[0x1E4FB1618] labelColor];
    [v5 setTextColor:v7];

    [v5 setNumberOfLines:0];
    [v5 setAdjustsFontForContentSizeCategory:1];
    v8 = _WBSLocalizedString();
    v47 = v5;
    [v5 setText:v8];

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v9;

    v11 = subtitleFont();
    [(UILabel *)v4->_subtitleLabel setFont:v11];

    v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v4->_subtitleLabel setTextColor:v12];

    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v4->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    v13 = [(SFAccountDetailTOTPTableViewCell *)v4 _attributedSubtitleStringWithRemainingSeconds:0];
    [(UILabel *)v4->_subtitleLabel setAttributedText:v13];

    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    verificationCodeLabel = v4->_verificationCodeLabel;
    v4->_verificationCodeLabel = v14;

    v16 = verificationCodeFont();
    [(UILabel *)v4->_verificationCodeLabel setFont:v16];

    v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v4->_verificationCodeLabel setTextColor:v17];

    [(UILabel *)v4->_verificationCodeLabel setTextAlignment:2];
    [(UILabel *)v4->_verificationCodeLabel setNumberOfLines:1];
    [(UILabel *)v4->_verificationCodeLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_verificationCodeLabel setText:@" "];
    LODWORD(v18) = 1144766464;
    [(UILabel *)v4->_verificationCodeLabel setContentHuggingPriority:0 forAxis:v18];
    id v19 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v52[0] = v5;
    v52[1] = v4->_verificationCodeLabel;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    uint64_t v21 = [v19 initWithArrangedSubviews:v20];
    titleAndVerificationCodeStackView = v4->_titleAndVerificationCodeStackView;
    v4->_titleAndVerificationCodeStackView = (UIStackView *)v21;

    id v23 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v51[0] = v4->_titleAndVerificationCodeStackView;
    v51[1] = v4->_subtitleLabel;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    v25 = (void *)[v23 initWithArrangedSubviews:v24];

    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v25 setAxis:1];
    [v25 setSpacing:6.0];
    v26 = [(SFAccountDetailTOTPTableViewCell *)v4 contentView];
    [v26 addSubview:v25];

    v27 = [(SFAccountDetailTOTPTableViewCell *)v4 contentView];
    v28 = [v27 layoutMarginsGuide];

    v41 = (void *)MEMORY[0x1E4F28DC8];
    v46 = [v25 leadingAnchor];
    v45 = [v28 leadingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v50[0] = v44;
    v43 = [v25 trailingAnchor];
    v42 = [v28 trailingAnchor];
    v40 = [v43 constraintEqualToAnchor:v42];
    v50[1] = v40;
    v29 = [v25 topAnchor];
    v30 = [v28 topAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v50[2] = v31;
    v32 = [v25 bottomAnchor];
    v33 = [v28 bottomAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    v50[3] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
    [v41 activateConstraints:v35];

    [(SFAccountDetailTOTPTableViewCell *)v4 _updateTitleAndVerificationCodeStackView];
    [(SFAccountDetailTOTPTableViewCell *)v4 _updateVerificationCodeLabelTextColor];
    uint64_t v49 = objc_opt_class();
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    id v37 = (id)[(SFAccountDetailTOTPTableViewCell *)v4 registerForTraitChanges:v36 withTarget:v4 action:sel__updateTitleAndVerificationCodeStackView];

    v38 = v4;
  }

  return v4;
}

- (void)dealloc
{
  [(NSTimer *)self->_codeUpdateTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SFAccountDetailTOTPTableViewCell;
  [(SFAccountDetailTOTPTableViewCell *)&v3 dealloc];
}

- (void)configureWithGenerator:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_generator, a3);
  if (self->_generator)
  {
    [(SFAccountDetailTOTPTableViewCell *)self _updateCodeAndLabels];
    [(SFAccountDetailTOTPTableViewCell *)self _startTOTPTimerIfNeeded];
  }
  else
  {
    [(NSTimer *)self->_codeUpdateTimer invalidate];
    codeUpdateTimer = self->_codeUpdateTimer;
    self->_codeUpdateTimer = 0;
  }
}

- (void)_updateCodeAndLabels
{
  objc_super v3 = [(SFAccountDetailTOTPTableViewCell *)self _formattedCode];
  [(UILabel *)self->_verificationCodeLabel setAttributedText:v3];

  v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "pm_defaults");
  char v5 = objc_msgSend(v4, "pm_passwordManagerIsInDemoMode");

  if ((v5 & 1) == 0)
  {
    id v6 = [(UILabel *)self->_verificationCodeLabel layer];
    [v6 setDisableUpdateMask:18];
  }
  v7 = [(SFAccountDetailTOTPTableViewCell *)self _attributedSubtitleString];
  [(UILabel *)self->_subtitleLabel setAttributedText:v7];

  [(SFAccountDetailTOTPTableViewCell *)self setNeedsLayout];
}

- (id)_formattedCode
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28E48]);
  generator = self->_generator;
  char v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [(WBSTOTPGenerator *)generator codeForDate:v5];
  v7 = (void *)[v3 initWithString:v6];

  if ((unint64_t)[v7 length] >= 5)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    objc_msgSend(v7, "insertAttributedString:atIndex:", v8, (unint64_t)-[WBSTOTPGenerator numberOfDigitsInCode](self->_generator, "numberOfDigitsInCode") >> 1);
  }
  v9 = verificationCodeFont();
  v10 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB28C8]];
  v11 = [v10 scaledFontForFont:v9];

  uint64_t v12 = *MEMORY[0x1E4FB12E0];
  v18[0] = *MEMORY[0x1E4FB12B0];
  v18[1] = v12;
  v19[0] = v9;
  v13 = NSNumber;
  [v11 pointSize];
  v15 = [v13 numberWithDouble:v14 * 0.15];
  v19[1] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  objc_msgSend(v7, "addAttributes:range:", v16, 0, objc_msgSend(v7, "length"));

  return v7;
}

- (void)_startTOTPTimerIfNeeded
{
  if (!self->_codeUpdateTimer)
  {
    objc_initWeak(&location, self);
    id v3 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = __59__SFAccountDetailTOTPTableViewCell__startTOTPTimerIfNeeded__block_invoke;
    v10 = &unk_1E5C733A8;
    objc_copyWeak(&v11, &location);
    v4 = [v3 timerWithTimeInterval:1 repeats:&v7 block:0.25];
    codeUpdateTimer = self->_codeUpdateTimer;
    self->_codeUpdateTimer = v4;

    id v6 = objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop", v7, v8, v9, v10);
    [v6 addTimer:self->_codeUpdateTimer forMode:*MEMORY[0x1E4F1C4B0]];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __59__SFAccountDetailTOTPTableViewCell__startTOTPTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCodeAndLabels];
}

- (id)_attributedSubtitleString
{
  generator = self->_generator;
  v4 = [MEMORY[0x1E4F1C9C8] date];
  char v5 = [(WBSTOTPGenerator *)generator startDateOfIntervalContainingDate:v4];

  [v5 timeIntervalSinceNow];
  uint64_t v7 = [(SFAccountDetailTOTPTableViewCell *)self _attributedSubtitleStringWithRemainingSeconds:[(WBSTOTPGenerator *)self->_generator codeGenerationPeriod] - vcvtmd_u64_f64(-v6)];

  return v7;
}

- (id)_attributedSubtitleStringWithRemainingSeconds:(unint64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  char v5 = [MEMORY[0x1E4F98ED8] countdownStringForSecondsRemaining:a3];
  uint64_t v10 = *MEMORY[0x1E4FB12B0];
  double v6 = subtitleFont();
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = (void *)[v4 initWithString:v5 attributes:v7];

  return v8;
}

- (void)_updateTitleAndVerificationCodeStackView
{
  id v3 = [(SFAccountDetailTOTPTableViewCell *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [(UIStackView *)self->_titleAndVerificationCodeStackView setAxis:IsAccessibilityCategory];
  [(UIStackView *)self->_titleAndVerificationCodeStackView setAlignment:v6];
  uint64_t v7 = [(SFAccountDetailTOTPTableViewCell *)self traitCollection];
  uint64_t v8 = [v7 layoutDirection];

  if ((unint64_t)(v8 + 1) >= 2)
  {
    if (v8 != 1) {
      return;
    }
    if (IsAccessibilityCategory) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else if (IsAccessibilityCategory)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 2;
  }
  verificationCodeLabel = self->_verificationCodeLabel;

  [(UILabel *)verificationCodeLabel setTextAlignment:v9];
}

- (void)setOverrideVerificationCodeLabelTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideVerificationCodeLabelTextColor, a3);

  [(SFAccountDetailTOTPTableViewCell *)self _updateVerificationCodeLabelTextColor];
}

- (void)_updateVerificationCodeLabelTextColor
{
  if (self->_overrideVerificationCodeLabelTextColor)
  {
    verificationCodeLabel = self->_verificationCodeLabel;
    -[UILabel setTextColor:](verificationCodeLabel, "setTextColor:");
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)self->_verificationCodeLabel setTextColor:v4];
  }
}

- (UIColor)overrideVerificationCodeLabelTextColor
{
  return self->_overrideVerificationCodeLabelTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideVerificationCodeLabelTextColor, 0);
  objc_storeStrong((id *)&self->_codeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_titleAndVerificationCodeStackView, 0);
  objc_storeStrong((id *)&self->_verificationCodeLabel, 0);

  objc_storeStrong((id *)&self->_subtitleLabel, 0);
}

@end