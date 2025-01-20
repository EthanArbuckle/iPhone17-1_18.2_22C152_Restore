@interface CPSVibrantLabel
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)isUserInteractionEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CPSVibrantLabel)initWithTextStyle:(id)a3 textVariant:(int64_t)a4 vibrancyEffectStyle:(int64_t)a5;
- (NSString)text;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)lineBreakMode;
- (int64_t)numberOfLines;
- (int64_t)textAlignment;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
@end

@implementation CPSVibrantLabel

- (CPSVibrantLabel)initWithTextStyle:(id)a3 textVariant:(int64_t)a4 vibrancyEffectStyle:(int64_t)a5
{
  v40[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [MEMORY[0x1E4F427D8] effectWithStyle:8];
  v10 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v9 style:a5];
  v39.receiver = self;
  v39.super_class = (Class)CPSVibrantLabel;
  v11 = [(CPSVibrantLabel *)&v39 initWithEffect:v10];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    v37 = v9;
    label = v11->_label;
    v11->_label = (UILabel *)v12;

    [(UILabel *)v11->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:v8 variant:a4];
    [(UILabel *)v11->_label setFont:v14];

    [(UILabel *)v11->_label setAdjustsFontForContentSizeCategory:1];
    v15 = [(CPSVibrantLabel *)v11 contentView];
    [v15 addSubview:v11->_label];

    v28 = (void *)MEMORY[0x1E4F28DC8];
    v34 = [(UILabel *)v11->_label topAnchor];
    v35 = [(CPSVibrantLabel *)v11 contentView];
    v33 = [v35 topAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v40[0] = v32;
    v30 = [(UILabel *)v11->_label leadingAnchor];
    v31 = [(CPSVibrantLabel *)v11 contentView];
    v29 = [v31 leadingAnchor];
    v27 = [v30 constraintEqualToAnchor:v29];
    v40[1] = v27;
    [(UILabel *)v11->_label bottomAnchor];
    v16 = v36 = v10;
    v17 = [(CPSVibrantLabel *)v11 contentView];
    [v17 bottomAnchor];
    v18 = id v38 = v8;
    v19 = [v16 constraintEqualToAnchor:v18];
    v40[2] = v19;
    v20 = [(UILabel *)v11->_label trailingAnchor];
    v21 = [(CPSVibrantLabel *)v11 contentView];
    v22 = [v21 trailingAnchor];
    v23 = [v20 constraintEqualToAnchor:v22];
    v40[3] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
    [v28 activateConstraints:v24];

    v9 = v37;
    id v8 = v38;

    v10 = v36;
    v25 = v11;
  }

  return v11;
}

- (void)setNumberOfLines:(int64_t)a3
{
}

- (int64_t)numberOfLines
{
  return [(UILabel *)self->_label numberOfLines];
}

- (void)setTextAlignment:(int64_t)a3
{
}

- (int64_t)textAlignment
{
  return [(UILabel *)self->_label textAlignment];
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return [(UILabel *)self->_label text];
}

- (id)viewForFirstBaselineLayout
{
  return self->_label;
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return [(UILabel *)self->_label adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return [(UILabel *)self->_label adjustsFontSizeToFitWidth];
}

- (void)setLineBreakMode:(int64_t)a3
{
}

- (int64_t)lineBreakMode
{
  return [(UILabel *)self->_label lineBreakMode];
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (void).cxx_destruct
{
}

@end