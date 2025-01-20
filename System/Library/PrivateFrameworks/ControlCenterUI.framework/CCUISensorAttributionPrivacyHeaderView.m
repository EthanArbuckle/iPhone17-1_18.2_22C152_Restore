@interface CCUISensorAttributionPrivacyHeaderView
- (CCUISensorAttributionPrivacyHeaderView)initWithTitle:(id)a3 systemImageName:(id)a4;
- (CGRect)cachedExpandedRect;
- (NSString)trailingText;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UILabel)trailingLabel;
- (void)_ensureTrailingLabel;
- (void)_removeTrailingLabel;
- (void)setBlurRadius:(double)a3;
- (void)setCachedExpandedRect:(CGRect)a3;
- (void)setImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTrailingLabel:(id)a3;
- (void)setTrailingText:(id)a3;
@end

@implementation CCUISensorAttributionPrivacyHeaderView

- (void)setTrailingText:(id)a3
{
  id v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)[v6 copy];
    trailingText = self->_trailingText;
    self->_trailingText = v4;

    if (v6)
    {
      [(CCUISensorAttributionPrivacyHeaderView *)self _ensureTrailingLabel];
      [(UILabel *)self->_trailingLabel setText:v6];
    }
    else
    {
      [(CCUISensorAttributionPrivacyHeaderView *)self _removeTrailingLabel];
    }
  }
}

- (void)_ensureTrailingLabel
{
  v23[4] = *MEMORY[0x1E4F143B8];
  if (!self->_trailingLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UILabel *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v4 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    v22 = [v4 preferredFontForTextStyle:*MEMORY[0x1E4FB2918] hiFontStyle:4];

    [(UILabel *)v3 setFont:v22];
    [(UILabel *)v3 setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v3 setMaximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
    [(UILabel *)v3 setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v3 setMinimumScaleFactor:0.5];
    v5 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v3 setTextColor:v5];

    [(CCUISensorAttributionPrivacyHeaderView *)self addSubview:v3];
    trailingLabel = self->_trailingLabel;
    self->_trailingLabel = v3;
    v7 = v3;

    v17 = (void *)MEMORY[0x1E4F28DC8];
    v21 = [(UILabel *)v7 topAnchor];
    v20 = [(CCUISensorAttributionPrivacyHeaderView *)self topAnchor];
    v19 = [v21 constraintEqualToAnchor:v20];
    v23[0] = v19;
    v18 = [(UILabel *)v7 bottomAnchor];
    v8 = [(CCUISensorAttributionPrivacyHeaderView *)self bottomAnchor];
    v9 = [v18 constraintEqualToAnchor:v8];
    v23[1] = v9;
    v10 = [(UILabel *)v7 leadingAnchor];
    v11 = [(UILabel *)self->_titleLabel trailingAnchor];
    v12 = [v10 constraintGreaterThanOrEqualToAnchor:v11 constant:16.0];
    v23[2] = v12;
    v13 = [(UILabel *)v7 trailingAnchor];
    v14 = [(CCUISensorAttributionPrivacyHeaderView *)self trailingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:-8.0];
    v23[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    [v17 activateConstraints:v16];
  }
}

- (CCUISensorAttributionPrivacyHeaderView)initWithTitle:(id)a3 systemImageName:(id)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)CCUISensorAttributionPrivacyHeaderView;
  v8 = [(CCUISensorAttributionPrivacyHeaderView *)&v50 init];
  if (v8)
  {
    v47 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    v9 = [(CCUISensorAttributionPrivacyHeaderView *)v8 layer];
    v52[0] = v47;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    [v9 setFilters:v10];

    [(SBFView *)v8 setAnimatedLayerProperties:&unk_1F2F4B7E8];
    [(CCUISensorAttributionPrivacyHeaderView *)v8 setClipsToBounds:0];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UILabel *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    v13 = [v12 preferredFontForTextStyle:*MEMORY[0x1E4FB2918] hiFontStyle:4];

    v46 = v13;
    [(UILabel *)v11 setFont:v13];
    [(UILabel *)v11 setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v11 setMaximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
    [(UILabel *)v11 setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v11 setMinimumScaleFactor:0.5];
    v14 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v11 setTextColor:v14];

    [(UILabel *)v11 setText:v6];
    [(CCUISensorAttributionPrivacyHeaderView *)v8 addSubview:v11];
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v11;
    v16 = v11;

    [v13 pointSize];
    v45 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:weight:");
    v44 = [MEMORY[0x1E4FB1830] configurationWithFont:v45 scale:0];
    v43 = [MEMORY[0x1E4FB1818] systemImageNamed:v7 withConfiguration:v44];
    v17 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v43];
    [(UIImageView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [(UIImageView *)v17 setTintColor:v18];

    [(CCUISensorAttributionPrivacyHeaderView *)v8 addSubview:v17];
    imageView = v8->_imageView;
    v8->_imageView = v17;
    v20 = v17;

    v33 = (void *)MEMORY[0x1E4F28DC8];
    v42 = [(UILabel *)v16 topAnchor];
    v41 = [(CCUISensorAttributionPrivacyHeaderView *)v8 topAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v51[0] = v40;
    v39 = [(UILabel *)v16 bottomAnchor];
    v38 = [(CCUISensorAttributionPrivacyHeaderView *)v8 bottomAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v51[1] = v37;
    v36 = [(UILabel *)v16 leadingAnchor];
    v35 = [(CCUISensorAttributionPrivacyHeaderView *)v8 leadingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:28.0];
    v51[2] = v34;
    v32 = [(UILabel *)v16 trailingAnchor];
    v31 = [(CCUISensorAttributionPrivacyHeaderView *)v8 trailingAnchor];
    [v32 constraintLessThanOrEqualToAnchor:v31];
    v30 = id v48 = v7;
    v51[3] = v30;
    v21 = v20;
    [(UIImageView *)v20 leadingAnchor];
    v22 = id v49 = v6;
    v23 = [(CCUISensorAttributionPrivacyHeaderView *)v8 leadingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v51[4] = v24;
    v25 = [(UIImageView *)v20 centerYAnchor];
    v26 = [(CCUISensorAttributionPrivacyHeaderView *)v8 centerYAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v51[5] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:6];
    [v33 activateConstraints:v28];

    id v6 = v49;
    id v7 = v48;
  }
  return v8;
}

- (void)setBlurRadius:(double)a3
{
  id v5 = [(CCUISensorAttributionPrivacyHeaderView *)self layer];
  v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (void)_removeTrailingLabel
{
  [(UILabel *)self->_trailingLabel removeFromSuperview];
  trailingLabel = self->_trailingLabel;
  self->_trailingLabel = 0;
}

- (CGRect)cachedExpandedRect
{
  double x = self->cachedExpandedRect.origin.x;
  double y = self->cachedExpandedRect.origin.y;
  double width = self->cachedExpandedRect.size.width;
  double height = self->cachedExpandedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->cachedExpandedRect = a3;
}

- (NSString)trailingText
{
  return self->_trailingText;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)trailingLabel
{
  return self->_trailingLabel;
}

- (void)setTrailingLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_trailingText, 0);
}

@end