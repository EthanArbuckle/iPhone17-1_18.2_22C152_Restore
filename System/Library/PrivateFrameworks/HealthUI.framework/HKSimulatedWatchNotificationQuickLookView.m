@interface HKSimulatedWatchNotificationQuickLookView
- (HKSimulatedWatchNotificationQuickLookView)initWithIconImage:(id)a3 titleText:(id)a4 detailText:(id)a5 tintColor:(id)a6;
- (NSString)detailLabelText;
- (NSString)titleLabelText;
- (UIColor)tintColor;
- (UIImage)iconImage;
- (UIImageView)quickLookIconView;
- (UILabel)quickLookSubtitleLabel;
- (UILabel)quickLookTitleLabel;
- (UIView)quickLookSubtitleContainer;
- (UIView)quickLookTitleContainer;
- (void)_layoutQuickLook;
- (void)_setUpSubviews;
- (void)setDetailLabelText:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setQuickLookIconView:(id)a3;
- (void)setQuickLookSubtitleContainer:(id)a3;
- (void)setQuickLookSubtitleLabel:(id)a3;
- (void)setQuickLookTitleContainer:(id)a3;
- (void)setQuickLookTitleLabel:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setTitleLabelText:(id)a3;
@end

@implementation HKSimulatedWatchNotificationQuickLookView

- (HKSimulatedWatchNotificationQuickLookView)initWithIconImage:(id)a3 titleText:(id)a4 detailText:(id)a5 tintColor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HKSimulatedWatchNotificationQuickLookView;
  v14 = -[HKSimulatedWatchNotificationQuickLookView initWithFrame:](&v17, sel_initWithFrame_, 0.0, 0.0, 156.0, 195.0);
  v15 = v14;
  if (v14)
  {
    [(HKSimulatedWatchNotificationQuickLookView *)v14 setIconImage:v10];
    [(HKSimulatedWatchNotificationQuickLookView *)v15 setTitleLabelText:v11];
    [(HKSimulatedWatchNotificationQuickLookView *)v15 setDetailLabelText:v12];
    [(HKSimulatedWatchNotificationQuickLookView *)v15 setTintColor:v13];
    [(HKSimulatedWatchNotificationQuickLookView *)v15 _setUpSubviews];
    [(HKSimulatedWatchNotificationQuickLookView *)v15 _layoutQuickLook];
  }

  return v15;
}

- (void)_setUpSubviews
{
  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  quickLookIconView = self->_quickLookIconView;
  self->_quickLookIconView = v3;

  [(UIImageView *)self->_quickLookIconView setImage:self->_iconImage];
  [(HKSimulatedWatchNotificationQuickLookView *)self addSubview:self->_quickLookIconView];
  v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  quickLookTitleContainer = self->_quickLookTitleContainer;
  self->_quickLookTitleContainer = v5;

  v7 = self->_quickLookTitleContainer;
  v8 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIView *)v7 setBackgroundColor:v8];

  [(HKSimulatedWatchNotificationQuickLookView *)self addSubview:self->_quickLookTitleContainer];
  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  quickLookTitleLabel = self->_quickLookTitleLabel;
  self->_quickLookTitleLabel = v9;

  [(UILabel *)self->_quickLookTitleLabel setMinimumScaleFactor:0.8];
  id v11 = self->_quickLookTitleLabel;
  id v12 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UILabel *)v11 setTextColor:v12];

  [(UILabel *)self->_quickLookTitleLabel setTextAlignment:1];
  [(UILabel *)self->_quickLookTitleLabel setLineBreakMode:4];
  id v13 = self->_quickLookTitleLabel;
  v14 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)v13 setBackgroundColor:v14];

  [(UILabel *)self->_quickLookTitleLabel setNumberOfLines:2];
  [(UIView *)self->_quickLookTitleContainer addSubview:self->_quickLookTitleLabel];
  v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  quickLookSubtitleContainer = self->_quickLookSubtitleContainer;
  self->_quickLookSubtitleContainer = v15;

  objc_super v17 = self->_quickLookSubtitleContainer;
  v18 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIView *)v17 setBackgroundColor:v18];

  [(HKSimulatedWatchNotificationQuickLookView *)self addSubview:self->_quickLookSubtitleContainer];
  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  quickLookSubtitleLabel = self->_quickLookSubtitleLabel;
  self->_quickLookSubtitleLabel = v19;

  [(UILabel *)self->_quickLookSubtitleLabel setNumberOfLines:1];
  v21 = self->_quickLookSubtitleContainer;
  v22 = self->_quickLookSubtitleLabel;
  [(UIView *)v21 addSubview:v22];
}

- (void)_layoutQuickLook
{
  v3 = self->_titleLabelText;
  v4 = [(NSString *)self->_detailLabelText localizedUppercaseString];
  v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:19.0];
  v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
  [(UILabel *)self->_quickLookTitleLabel setFont:v5];
  [(UILabel *)self->_quickLookSubtitleLabel setFont:v6];
  [(UILabel *)self->_quickLookTitleLabel setText:v3];
  -[UILabel sizeThatFits:](self->_quickLookTitleLabel, "sizeThatFits:", 156.0, 47.0);
  double v31 = v7;
  double v9 = v8;
  quickLookSubtitleLabel = self->_quickLookSubtitleLabel;
  if (v8 <= 25.0)
  {
    [(UILabel *)quickLookSubtitleLabel setNumberOfLines:2];
    uint64_t v18 = [v4 length];
    v19 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    v20 = (void *)[v19 mutableCopy];

    [v20 setLineSpacing:2.5];
    [v20 setAlignment:1];
    [v20 setLineBreakMode:0];
    LODWORD(v21) = 1.0;
    [v20 setHyphenationFactor:v21];
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v4];
    objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], self->_tintColor, 0, v18);
    objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v6, 0, v18);
    objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v20, 0, v18);
    [(UILabel *)self->_quickLookSubtitleLabel setAttributedText:v22];
    -[UILabel sizeThatFits:](self->_quickLookSubtitleLabel, "sizeThatFits:", 156.0, 37.5);
    double v14 = v23;
    double v13 = v24;

    double v16 = 27.0;
    double v15 = 69.5;
    double v17 = 163.0;
  }
  else
  {
    [(UILabel *)quickLookSubtitleLabel setAttributedText:0];
    [(UILabel *)self->_quickLookSubtitleLabel setLineBreakMode:4];
    [(UILabel *)self->_quickLookSubtitleLabel setText:v4];
    [(UILabel *)self->_quickLookSubtitleLabel setTextColor:self->_tintColor];
    [(UILabel *)self->_quickLookSubtitleLabel sizeToFit];
    [(UILabel *)self->_quickLookSubtitleLabel frame];
    double v13 = v12;
    if (v11 <= 153.0) {
      double v14 = v11;
    }
    else {
      double v14 = 153.0;
    }
    double v15 = 62.5;
    double v16 = 25.5;
    double v17 = 178.0;
  }
  quickLookIconView = self->_quickLookIconView;
  long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v32[0] = *MEMORY[0x1E4F1DAB8];
  v32[1] = v26;
  v32[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIImageView *)quickLookIconView setTransform:v32];
  -[UIImageView setFrame:](self->_quickLookIconView, "setFrame:", 0.0, 0.0, 98.0, 98.0);
  -[UIImageView setCenter:](self->_quickLookIconView, "setCenter:", 78.0, v15);
  double v27 = fmin(v31, 156.0);
  -[UILabel setFrame:](self->_quickLookTitleLabel, "setFrame:", 0.0, 0.0, v27, v9);
  [(UILabel *)self->_quickLookTitleLabel _firstLineBaselineOffsetFromBoundsTop];
  double v29 = v16 - v28;
  [(UIImageView *)self->_quickLookIconView frame];
  double v30 = v29 + CGRectGetMaxY(v33);
  [(UILabel *)self->_quickLookTitleLabel frame];
  -[UIView setFrame:](self->_quickLookTitleContainer, "setFrame:", 0.0, 0.0, v27);
  -[UIView setCenter:](self->_quickLookTitleContainer, "setCenter:", 78.0, v9 * 0.5 + v30);
  -[UILabel setFrame:](self->_quickLookSubtitleLabel, "setFrame:", 0.0, 0.0, v14, v13);
  [(UILabel *)self->_quickLookSubtitleLabel frame];
  -[UIView setFrame:](self->_quickLookSubtitleContainer, "setFrame:", 0.0, 0.0, v14);
  -[UIView setCenter:](self->_quickLookSubtitleContainer, "setCenter:", 78.0, v17);
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (NSString)titleLabelText
{
  return self->_titleLabelText;
}

- (void)setTitleLabelText:(id)a3
{
}

- (NSString)detailLabelText
{
  return self->_detailLabelText;
}

- (void)setDetailLabelText:(id)a3
{
}

- (UIImageView)quickLookIconView
{
  return self->_quickLookIconView;
}

- (void)setQuickLookIconView:(id)a3
{
}

- (UILabel)quickLookTitleLabel
{
  return self->_quickLookTitleLabel;
}

- (void)setQuickLookTitleLabel:(id)a3
{
}

- (UILabel)quickLookSubtitleLabel
{
  return self->_quickLookSubtitleLabel;
}

- (void)setQuickLookSubtitleLabel:(id)a3
{
}

- (UIView)quickLookTitleContainer
{
  return self->_quickLookTitleContainer;
}

- (void)setQuickLookTitleContainer:(id)a3
{
}

- (UIView)quickLookSubtitleContainer
{
  return self->_quickLookSubtitleContainer;
}

- (void)setQuickLookSubtitleContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLookSubtitleContainer, 0);
  objc_storeStrong((id *)&self->_quickLookTitleContainer, 0);
  objc_storeStrong((id *)&self->_quickLookSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_quickLookTitleLabel, 0);
  objc_storeStrong((id *)&self->_quickLookIconView, 0);
  objc_storeStrong((id *)&self->_detailLabelText, 0);
  objc_storeStrong((id *)&self->_titleLabelText, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
}

@end