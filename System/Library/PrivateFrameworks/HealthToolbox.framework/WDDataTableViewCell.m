@interface WDDataTableViewCell
- (BOOL)displayValueAdjustsFontSizeToFitWidth;
- (CGRect)detailTextLabelFrame;
- (CGRect)imageViewFrame;
- (CGRect)textLabelFrame;
- (HKSource)source;
- (NSString)dateString;
- (NSString)displayValue;
- (UIFont)bodyFont;
- (WDDataTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)detailTextLabel;
- (id)imageView;
- (id)textLabel;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBodyFont:(id)a3;
- (void)setDateString:(id)a3;
- (void)setDisplayValue:(id)a3;
- (void)setDisplayValueAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setSource:(id)a3;
@end

@implementation WDDataTableViewCell

- (WDDataTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)WDDataTableViewCell;
  v4 = [(WDDataTableViewCell *)&v19 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    imageView = v4->_imageView;
    v4->_imageView = v5;

    [(UIImageView *)v4->_imageView setContentMode:1];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    textLabel = v4->_textLabel;
    v4->_textLabel = v7;

    [(UILabel *)v4->_textLabel setTextAlignment:4];
    v9 = [MEMORY[0x263F1C550] labelColor];
    [(UILabel *)v4->_textLabel setTextColor:v9];

    [(UILabel *)v4->_textLabel setAdjustsFontSizeToFitWidth:1];
    uint64_t v10 = 2
        * ([(WDDataTableViewCell *)v4 effectiveUserInterfaceLayoutDirection] == 0);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    detailTextLabel = v4->_detailTextLabel;
    v4->_detailTextLabel = v11;

    [(UILabel *)v4->_detailTextLabel setTextAlignment:v10];
    v13 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)v4->_detailTextLabel setTextColor:v13];

    [(UILabel *)v4->_detailTextLabel setNumberOfLines:0];
    [(UILabel *)v4->_detailTextLabel setAdjustsFontSizeToFitWidth:1];
    v14 = [(WDDataTableViewCell *)v4 contentView];
    [v14 addSubview:v4->_imageView];

    [(WDDataTableViewCell *)v4 imageViewFrame];
    -[UIImageView setFrame:](v4->_imageView, "setFrame:");
    v15 = [(WDDataTableViewCell *)v4 contentView];
    [v15 addSubview:v4->_textLabel];

    [(WDDataTableViewCell *)v4 textLabelFrame];
    -[UILabel setFrame:](v4->_textLabel, "setFrame:");
    v16 = [(WDDataTableViewCell *)v4 contentView];
    [v16 addSubview:v4->_detailTextLabel];

    [(WDDataTableViewCell *)v4 detailTextLabelFrame];
    -[UILabel setFrame:](v4->_detailTextLabel, "setFrame:");
    [(WDDataTableViewCell *)v4 _contentSizeCategoryDidChange:0];
    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v4 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WDDataTableViewCell;
  [(WDDataTableViewCell *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)WDDataTableViewCell;
  [(WDDataTableViewCell *)&v6 layoutSubviews];
  [(WDDataTableViewCell *)self imageViewFrame];
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  [(WDDataTableViewCell *)self detailTextLabelFrame];
  -[UILabel setFrame:](self->_detailTextLabel, "setFrame:");
  [(WDDataTableViewCell *)self textLabelFrame];
  -[UILabel setFrame:](self->_textLabel, "setFrame:");
  v3 = [(WDDataTableViewCell *)self imageView];
  objc_super v4 = [v3 image];
  if (v4) {
    double v5 = 48.0;
  }
  else {
    double v5 = 16.0;
  }

  -[WDDataTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v5, 0.0, 0.0);
}

- (UIFont)bodyFont
{
  bodyFont = self->_bodyFont;
  if (!bodyFont)
  {
    objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
    objc_super v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    double v5 = self->_bodyFont;
    self->_bodyFont = v4;

    bodyFont = self->_bodyFont;
  }

  return bodyFont;
}

- (id)imageView
{
  return self->_imageView;
}

- (CGRect)imageViewFrame
{
  v3 = [(WDDataTableViewCell *)self imageView];
  objc_super v4 = [v3 image];

  if (v4)
  {
    if ([(WDDataTableViewCell *)self effectiveUserInterfaceLayoutDirection])
    {
      double v5 = [(WDDataTableViewCell *)self contentView];
      [v5 bounds];
      double v7 = v6 + -24.0 + -16.0;

      v8 = [(WDDataTableViewCell *)self contentView];
      [v8 bounds];
      double v10 = round((v9 + -24.0) * 0.5);

      double v11 = 24.0;
    }
    else
    {
      [(WDDataTableViewCell *)self bounds];
      double v10 = round((v13 + -24.0) * 0.5);
      double v11 = 24.0;
      double v7 = 16.0;
    }
    double v12 = 24.0;
  }
  else
  {
    double v7 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v14 = v7;
  double v15 = v10;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)textLabel
{
  return self->_textLabel;
}

- (CGRect)textLabelFrame
{
  v3 = [(WDDataTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;

  if ([(WDDataTableViewCell *)self effectiveUserInterfaceLayoutDirection])
  {
    [(WDDataTableViewCell *)self detailTextLabelFrame];
    double v6 = CGRectGetMaxX(v20) + 8.0;
    [(WDDataTableViewCell *)self imageViewFrame];
    if (CGRectIsEmpty(v21))
    {
      double v7 = [(WDDataTableViewCell *)self contentView];
      [v7 bounds];
      double MinX = v8;
    }
    else
    {
      [(WDDataTableViewCell *)self imageViewFrame];
      double MinX = CGRectGetMinX(v24);
    }
    double v14 = MinX - v6;
    double v15 = -16.0;
  }
  else
  {
    [(WDDataTableViewCell *)self imageViewFrame];
    double MaxX = CGRectGetMaxX(v22);
    double v11 = [(WDDataTableViewCell *)self imageView];
    double v12 = [v11 image];

    double v13 = 8.0;
    if (!v12) {
      double v13 = 16.0;
    }
    double v6 = MaxX + v13;
    [(WDDataTableViewCell *)self detailTextLabelFrame];
    double v14 = CGRectGetMinX(v23) - v6;
    double v15 = -8.0;
  }
  double v16 = v14 + v15;
  double v17 = v5 + -8.0;
  double v18 = 4.0;
  double v19 = v6;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v18;
  result.origin.x = v19;
  return result;
}

- (id)detailTextLabel
{
  return self->_detailTextLabel;
}

- (CGRect)detailTextLabelFrame
{
  v3 = [(WDDataTableViewCell *)self textLabel];
  double v4 = [(WDDataTableViewCell *)self contentView];
  [v4 bounds];
  objc_msgSend(v3, "sizeThatFits:", 0.0, v5);
  double v7 = v6;

  double v8 = [(WDDataTableViewCell *)self detailTextLabel];
  double v9 = [(WDDataTableViewCell *)self contentView];
  [v9 bounds];
  objc_msgSend(v8, "sizeThatFits:", 0.0, v10);
  double v12 = v11;

  double v13 = [(WDDataTableViewCell *)self contentView];
  [v13 bounds];
  double v15 = v14 + -32.0;
  [(WDDataTableViewCell *)self imageViewFrame];
  double v17 = v15 - v16 + -8.0 + -4.0;

  double v18 = v7 + v12;
  if (v7 + v12 > v17)
  {
    double v19 = v17 - v7;
    CGRect v20 = [(WDDataTableViewCell *)self contentView];
    [v20 bounds];
    double v22 = v21 / 3.0;
    CGRect v23 = [(WDDataTableViewCell *)self contentView];
    [v23 bounds];
    double v25 = v24;

    v26 = [(WDDataTableViewCell *)self detailTextLabel];
    objc_msgSend(v26, "sizeThatFits:", v22, v25);
    double v12 = v27;

    if (v12 < v19) {
      double v12 = v19;
    }
  }
  v28 = [(WDDataTableViewCell *)self contentView];
  [v28 bounds];
  double v30 = v29;

  double v31 = 16.0;
  if (![(WDDataTableViewCell *)self effectiveUserInterfaceLayoutDirection])
  {
    v32 = [(WDDataTableViewCell *)self contentView];
    [v32 bounds];
    double v31 = v33 - v12 + -16.0;
  }
  double v34 = v30 + -8.0;
  double v35 = v31;
  double v36 = 4.0;
  double v37 = v12;
  result.size.height = v34;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (void)setDisplayValue:(id)a3
{
  id v4 = a3;
  double v5 = (NSString *)[v4 copy];
  displayValue = self->_displayValue;
  self->_displayValue = v5;

  double v7 = [(WDDataTableViewCell *)self textLabel];
  [v7 setText:v4];

  [(WDDataTableViewCell *)self setNeedsLayout];
}

- (void)setDateString:(id)a3
{
  id v4 = a3;
  double v5 = (NSString *)[v4 copy];
  dateString = self->_dateString;
  self->_dateString = v5;

  double v7 = [(WDDataTableViewCell *)self detailTextLabel];
  [v7 setText:v4];

  [(WDDataTableViewCell *)self setNeedsLayout];
}

- (void)setDisplayValueAdjustsFontSizeToFitWidth:(BOOL)a3
{
  BOOL v3 = a3;
  self->_displayValueAdjustsFontSizeToFitWidth = a3;
  id v4 = [(WDDataTableViewCell *)self textLabel];
  [v4 setAdjustsFontSizeToFitWidth:v3];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  bodyFont = self->_bodyFont;
  self->_bodyFont = 0;

  double v5 = [(WDDataTableViewCell *)self bodyFont];
  double v6 = [(WDDataTableViewCell *)self textLabel];
  [v6 setFont:v5];

  double v7 = [(WDDataTableViewCell *)self bodyFont];
  double v8 = [(WDDataTableViewCell *)self detailTextLabel];
  [v8 setFont:v7];

  [(WDDataTableViewCell *)self setNeedsLayout];
}

- (HKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSString)displayValue
{
  return self->_displayValue;
}

- (NSString)dateString
{
  return self->_dateString;
}

- (BOOL)displayValueAdjustsFontSizeToFitWidth
{
  return self->_displayValueAdjustsFontSizeToFitWidth;
}

- (void)setBodyFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_displayValue, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end