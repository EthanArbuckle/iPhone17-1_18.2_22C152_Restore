@interface FIUIWorkoutSummaryColoredDetailTableViewCell
+ (double)rowHeightWithNoDataString:(id)a3;
+ (double)rowHeightWithSecondMetric;
- (BOOL)showBackgroundButton;
- (FIUIWorkoutSummaryColoredDetailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIButton)customAccessoryButton;
- (UIView)optionalButtonView;
- (void)_resizeFontsIfNeededToFitWidth:(double)a3;
- (void)_setDefaultValueFontSizes;
- (void)_setupUI;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCustomAccessoryButton:(id)a3;
- (void)setDetailString:(id)a3 suffixString:(id)a4 textColor:(id)a5 shouldForceLTRForDetailString:(BOOL)a6;
- (void)setLineHidden:(BOOL)a3;
- (void)setNoDataString:(id)a3 textColor:(id)a4;
- (void)setOptionalButtonView:(id)a3;
- (void)setSecondMetricTitle:(id)a3 detailString:(id)a4 detailColor:(id)a5;
- (void)setShowBackgroundButton:(BOOL)a3;
- (void)setTitleString:(id)a3;
@end

@implementation FIUIWorkoutSummaryColoredDetailTableViewCell

+ (double)rowHeightWithNoDataString:(id)a3
{
  if (!a3) {
    return 49.0;
  }
  id v3 = a3;
  v4 = _NoDataLabel();
  [v4 setText:v3];

  v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 bounds];
  double v7 = v6;

  objc_msgSend(v4, "sizeThatFits:", v7 + 5.5 * -2.0, 1.79769313e308);
  double v9 = v8;

  return v9 + 17.0 + 9.0;
}

- (FIUIWorkoutSummaryColoredDetailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FIUIWorkoutSummaryColoredDetailTableViewCell;
  v4 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(FIUIWorkoutSummaryColoredDetailTableViewCell *)v4 _setupUI];
  }
  return v5;
}

- (void)_setupUI
{
  [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self _setDefaultValueFontSizes];
  id v3 = objc_alloc(MEMORY[0x263F828E0]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v8;

  v10 = [MEMORY[0x263F825C8] whiteColor];
  [(UILabel *)self->_titleLabel setTextColor:v10];

  [(UILabel *)self->_titleLabel setAllowsDefaultTighteningForTruncation:1];
  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  v11 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  [(UILabel *)self->_titleLabel setFont:v11];

  v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v4, v5, v6, v7);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v12;

  v14 = -[FIUIDividerView initWithFrame:]([FIUIDividerView alloc], "initWithFrame:", v4, v5, v6, v7);
  dividerView = self->_dividerView;
  self->_dividerView = &v14->super;

  v16 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
  optionalButtonView = self->_optionalButtonView;
  self->_optionalButtonView = v16;

  v18 = [MEMORY[0x263F825C8] colorWithWhite:0.15 alpha:1.0];
  [(UIView *)self->_optionalButtonView setBackgroundColor:v18];

  v19 = [(UIView *)self->_optionalButtonView layer];
  [v19 setCornerRadius:6.0];

  [(UIView *)self->_optionalButtonView setHidden:1];
  v20 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
  [v20 addSubview:self->_optionalButtonView];

  v21 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
  [v21 addSubview:self->_titleLabel];

  v22 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
  [v22 addSubview:self->_detailLabel];

  id v23 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
  [v23 addSubview:self->_dividerView];
}

- (void)_setDefaultValueFontSizes
{
  objc_msgSend(MEMORY[0x263F81708], "fu_sausageFontOfSize:", 25.5);
  id v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  detailFont = self->_detailFont;
  self->_detailFont = v3;

  objc_msgSend(MEMORY[0x263F81708], "fu_mediumSausageFontOfSize:", 18.0);
  self->_suffixFont = (UIFont *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x270F9A758]();
}

- (void)setShowBackgroundButton:(BOOL)a3
{
  self->_showBackgroundButton = a3;
  [(UIView *)self->_optionalButtonView setHidden:!a3];
}

- (void)setTitleString:(id)a3
{
  id v4 = [a3 localizedUppercaseString];
  [(UILabel *)self->_titleLabel setText:v4];
}

- (void)setNoDataString:(id)a3 textColor:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v14 && (uint64_t v7 = [v14 length], v8 = v14, v7))
  {
    noDataLabel = self->_noDataLabel;
    if (!noDataLabel)
    {
      _NoDataLabel();
      v10 = (UILabel *)objc_claimAutoreleasedReturnValue();
      v11 = self->_noDataLabel;
      self->_noDataLabel = v10;

      v12 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
      [v12 addSubview:self->_noDataLabel];

      id v8 = v14;
      noDataLabel = self->_noDataLabel;
    }
    [(UILabel *)noDataLabel setText:v8];
    [(UILabel *)self->_noDataLabel setTextColor:v6];
  }
  else
  {
    [(UILabel *)self->_noDataLabel removeFromSuperview];
    v13 = self->_noDataLabel;
    self->_noDataLabel = 0;
  }
}

- (void)setDetailString:(id)a3 suffixString:(id)a4 textColor:(id)a5 shouldForceLTRForDetailString:(BOOL)a6
{
  v10 = (UIColor *)a5;
  self->_shouldForceLTRForDetailString = a6;
  if (a3) {
    v11 = (__CFString *)a3;
  }
  else {
    v11 = &stru_26CF5F1B8;
  }
  v12 = v11;
  v13 = (__CFString *)a4;
  id v14 = v13;
  if (v13) {
    v15 = v13;
  }
  else {
    v15 = &stru_26CF5F1B8;
  }
  v16 = v15;

  v17 = [(__CFString *)v12 localizedUppercaseString];

  v18 = [(__CFString *)v16 localizedUppercaseString];

  detailString = self->_detailString;
  self->_detailString = v17;
  v20 = v17;

  suffixString = self->_suffixString;
  self->_suffixString = v18;
  v22 = v18;

  textColor = self->_textColor;
  self->_textColor = v10;
  v24 = v10;

  BOOL IsRightToLeft = FIUILocaleIsRightToLeft();
  NLSessionFormatDetailLabel(self->_detailString, self->_suffixString, self->_detailFont, self->_suffixFont, self->_textColor, IsRightToLeft, self->_shouldForceLTRForDetailString);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_detailLabel setAttributedText:v26];
}

- (void)setSecondMetricTitle:(id)a3 detailString:(id)a4 detailColor:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  secondTitleLabel = self->_secondTitleLabel;
  if (!secondTitleLabel)
  {
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    v13 = self->_secondTitleLabel;
    self->_secondTitleLabel = v12;

    [(UILabel *)self->_secondTitleLabel setAllowsDefaultTighteningForTruncation:1];
    [(UILabel *)self->_secondTitleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_secondTitleLabel setFont:v10];
    id v14 = self->_secondTitleLabel;
    v15 = [MEMORY[0x263F23950] systemGrayTextColor];
    [(UILabel *)v14 setTextColor:v15];

    v16 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
    [v16 addSubview:self->_secondTitleLabel];

    secondTitleLabel = self->_secondTitleLabel;
  }
  v17 = [v23 localizedUppercaseString];
  [(UILabel *)secondTitleLabel setText:v17];

  secondDetailLabel = self->_secondDetailLabel;
  if (!secondDetailLabel)
  {
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    v20 = self->_secondDetailLabel;
    self->_secondDetailLabel = v19;

    [(UILabel *)self->_secondDetailLabel setFont:v10];
    [(UILabel *)self->_secondDetailLabel setTextColor:v9];
    v21 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
    [v21 addSubview:self->_secondDetailLabel];

    secondDetailLabel = self->_secondDetailLabel;
  }
  v22 = [v8 localizedUppercaseString];
  [(UILabel *)secondDetailLabel setText:v22];
}

- (void)setCustomAccessoryButton:(id)a3
{
  id v10 = a3;
  p_customAccessoryButton = &self->_customAccessoryButton;
  id v6 = [(UIButton *)self->_customAccessoryButton superview];
  uint64_t v7 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];

  if (v6 == v7) {
    [(UIButton *)*p_customAccessoryButton removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_customAccessoryButton, a3);
  if (v10)
  {
    id v8 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
    [v8 addSubview:*p_customAccessoryButton];

    id v9 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
    [v9 bringSubviewToFront:*p_customAccessoryButton];
  }
  [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  id v3 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;

  v59.origin.x = v9;
  memset(&v59.origin.y, 0, 24);
  [(UILabel *)self->_titleLabel sizeThatFits:v9 + 5.5 * -2.0];
  double v13 = v12;
  double v14 = 17.0 - v12;
  [(UILabel *)self->_titleLabel _baselineOffsetFromBottom];
  double v16 = v14 + v15;
  v17 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
  double v52 = v16;
  double v53 = v13;
  [(UILabel *)self->_titleLabel setFrame:FIUIRoundFrameToViewScale(v17)];

  customAccessoryButton = self->_customAccessoryButton;
  CGFloat v51 = v11;
  if (customAccessoryButton)
  {
    [(UIButton *)customAccessoryButton sizeToFit];
    v19 = [(UIButton *)self->_customAccessoryButton imageView];
    [v19 frame];
    double v50 = v20;

    [(UIButton *)self->_customAccessoryButton frame];
    double v22 = v21;
    id v23 = [(UIButton *)self->_customAccessoryButton imageView];
    [v23 frame];
    double v25 = v24;
    id v26 = [(UIButton *)self->_customAccessoryButton imageView];
    [v26 frame];
    double v28 = v22 - (v25 + v27);

    [(UIButton *)self->_customAccessoryButton bounds];
    double v30 = v29;
    v59.size.width = v31;
    v59.size.height = v29;
    v59.origin.x = v28 + v9 - v31 + -6.0;
    v60.origin.x = v5;
    v60.origin.y = v7;
    v60.size.width = v9;
    v60.size.height = v11;
    double v32 = CGRectGetMidY(v60) + v30 * -0.5;
    [(UILabel *)self->_titleLabel frame];
    if (v59.origin.x <= CGRectGetMaxX(v61))
    {
      [(UILabel *)self->_titleLabel frame];
      if (v32 <= CGRectGetMaxY(v62)) {
        double v32 = 21.0 - v50;
      }
    }
    v59.origin.y = v32;
    FIUIFlipFrameRightToLeftIfNeeded(&v59.origin.x, v5, v7, v9, v11);
    -[UIButton setFrame:](self->_customAccessoryButton, "setFrame:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
    CGFloat v33 = v7;
    CGFloat v34 = v5;
  }
  else
  {
    CGFloat v33 = v7;
    CGFloat v34 = v5;
  }
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v9 + 5.5 * -2.0, 1.79769313e308);
  CGRectGetWidth(v59);
  [(UILabel *)self->_detailLabel _baselineOffsetFromBottom];
  v35 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
  double v55 = FIUIRoundFrameToViewScale(v35);
  double v56 = v36;
  double v57 = v37;
  double v58 = v38;

  FIUIFlipFrameRightToLeftIfNeeded(&v55, v34, v33, v9, v51);
  -[UILabel setFrame:](self->_detailLabel, "setFrame:", v55, v56, v57, v58);
  [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self _resizeFontsIfNeededToFitWidth:v57];
  noDataLabel = self->_noDataLabel;
  if (noDataLabel)
  {
    -[UILabel sizeThatFits:](noDataLabel, "sizeThatFits:", v9 + 5.5 * -2.0, 1.79769313e308);
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    [(UILabel *)self->_detailLabel _baselineOffsetFromBottom];
    v54[0] = 5.5;
    v54[1] = v44 + 17.0;
    v54[2] = v41;
    v54[3] = v43;
    FIUIFlipFrameRightToLeftIfNeeded(v54, v34, v33, v9, v51);
    v45 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
    [(UILabel *)self->_noDataLabel setFrame:FIUIRoundFrameToViewScale(v45)];
  }
  -[UILabel setFrame:](self->_secondTitleLabel, "setFrame:", 5.5, v52 + 38.25, v9 + 5.5 * -2.0, v53);
  v46 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
  [(UILabel *)self->_secondDetailLabel setFrame:FIUIRoundFrameToViewScale(v46)];

  -[UIView sizeThatFits:](self->_dividerView, "sizeThatFits:", v9 + 5.5 * -2.0, 1.79769313e308);
  v63.origin.x = v34;
  double v48 = v47;
  v63.origin.y = v33;
  v63.size.width = v9;
  v63.size.height = v51;
  -[UIView setFrame:](self->_dividerView, "setFrame:", 5.5, CGRectGetMaxY(v63) - v48, v9 + 5.5 * -2.0, v48);
  if (![(UIView *)self->_optionalButtonView isHidden])
  {
    if (FIUIOnePixel_onceToken != -1) {
      dispatch_once(&FIUIOnePixel_onceToken, &__block_literal_global_4);
    }
    v64.origin.x = v34;
    v64.origin.y = v33;
    v64.size.width = v9;
    v64.size.height = v51;
    CGRectInset(v64, 1.0, *(double *)&FIUIOnePixel_onePixel * 2.0 + 1.0);
    if (FIUIOnePixel_onceToken != -1) {
      dispatch_once(&FIUIOnePixel_onceToken, &__block_literal_global_4);
    }
    v49 = [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self contentView];
    [(UIView *)self->_optionalButtonView setFrame:FIUIRoundFrameToViewScale(v49)];
  }
}

- (void)_resizeFontsIfNeededToFitWidth:(double)a3
{
  id v21 = [(UIFont *)self->_detailFont fontDescriptor];
  CGFloat v5 = [(UIFont *)self->_suffixFont fontDescriptor];
  if (a3 > 0.0)
  {
    double v6 = [(UILabel *)self->_detailLabel attributedText];
    [v6 size];
    if (v7 <= a3)
    {
LABEL_5:
    }
    else
    {
      while (1)
      {
        [(UIFont *)self->_detailFont pointSize];
        double v9 = v8;

        if (v9 < 15.0) {
          break;
        }
        double v10 = (void *)MEMORY[0x263F81708];
        [(UIFont *)self->_detailFont pointSize];
        double v12 = [v10 fontWithDescriptor:v21 size:v11 * 0.9];
        detailFont = self->_detailFont;
        self->_detailFont = v12;

        double v14 = (void *)MEMORY[0x263F81708];
        [(UIFont *)self->_suffixFont pointSize];
        double v16 = [v14 fontWithDescriptor:v5 size:v15 * 0.9];
        suffixFont = self->_suffixFont;
        self->_suffixFont = v16;

        BOOL IsRightToLeft = FIUILocaleIsRightToLeft();
        v19 = NLSessionFormatDetailLabel(self->_detailString, self->_suffixString, self->_detailFont, self->_suffixFont, self->_textColor, IsRightToLeft, self->_shouldForceLTRForDetailString);
        [(UILabel *)self->_detailLabel setAttributedText:v19];

        double v6 = [(UILabel *)self->_detailLabel attributedText];
        [v6 size];
        if (v20 <= a3) {
          goto LABEL_5;
        }
      }
    }
  }
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)FIUIWorkoutSummaryColoredDetailTableViewCell;
  [(FIUIWorkoutSummaryColoredDetailTableViewCell *)&v5 prepareForReuse];
  [(FIUIWorkoutSummaryColoredDetailTableViewCell *)self _setDefaultValueFontSizes];
  self->_shouldForceLTRForDetailString = 0;
  [(UILabel *)self->_secondTitleLabel removeFromSuperview];
  secondTitleLabel = self->_secondTitleLabel;
  self->_secondTitleLabel = 0;

  [(UILabel *)self->_secondDetailLabel removeFromSuperview];
  secondDetailLabel = self->_secondDetailLabel;
  self->_secondDetailLabel = 0;
}

+ (double)rowHeightWithSecondMetric
{
  [a1 rowHeightWithNoDataString:0];
  return v2 + 15.25 + 13.75;
}

- (void)setLineHidden:(BOOL)a3
{
}

- (BOOL)showBackgroundButton
{
  return self->_showBackgroundButton;
}

- (UIButton)customAccessoryButton
{
  return self->_customAccessoryButton;
}

- (UIView)optionalButtonView
{
  return self->_optionalButtonView;
}

- (void)setOptionalButtonView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalButtonView, 0);
  objc_storeStrong((id *)&self->_customAccessoryButton, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_suffixString, 0);
  objc_storeStrong((id *)&self->_detailString, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_suffixFont, 0);
  objc_storeStrong((id *)&self->_detailFont, 0);
  objc_storeStrong((id *)&self->_noDataLabel, 0);
  objc_storeStrong((id *)&self->_secondDetailLabel, 0);
  objc_storeStrong((id *)&self->_secondTitleLabel, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end