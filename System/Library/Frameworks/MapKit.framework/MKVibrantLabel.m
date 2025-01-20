@interface MKVibrantLabel
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)allowsDefaultTighteningForTruncation;
- (CGSize)intrinsicContentSize;
- (MKVibrantLabel)initWithStyle:(int64_t)a3;
- (NSAttributedString)attributedText;
- (NSString)text;
- (UIColor)textColor;
- (UIFont)font;
- (double)idealWidth;
- (float)_hyphenationFactor;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)lineBreakMode;
- (int64_t)numberOfLines;
- (int64_t)textAlignment;
- (void)_setHyphenationFactor:(float)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAllowsDefaultTighteningForTruncation:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setFont:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation MKVibrantLabel

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(UILabel *)self->_label text];
  if (v3)
  {
  }
  else
  {
    v4 = [(UILabel *)self->_label attributedText];

    if (!v4)
    {
      double v5 = *MEMORY[0x1E4F1DB30];
      double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_6;
    }
  }
  [(UILabel *)self->_label intrinsicContentSize];
LABEL_6:
  result.height = v6;
  result.width = v5;
  return result;
}

- (MKVibrantLabel)initWithStyle:(int64_t)a3
{
  v28[4] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)MKVibrantLabel;
  v4 = [(MKVibrantView *)&v27 initWithEffect:0];
  double v5 = v4;
  if (v4)
  {
    [(MKVibrantView *)v4 setStyle:a3];
    double v6 = [MEMORY[0x1E4F428B8] clearColor];
    v7 = [(MKVibrantLabel *)v5 contentView];
    [v7 setBackgroundColor:v6];

    id v8 = objc_alloc(MEMORY[0x1E4F42B38]);
    [(MKVibrantLabel *)v5 bounds];
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:");
    label = v5->_label;
    v5->_label = (UILabel *)v9;

    [(UILabel *)v5->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(MKVibrantLabel *)v5 contentView];
    [v11 addSubview:v5->_label];

    v22 = (void *)MEMORY[0x1E4F28DC8];
    v26 = [(UILabel *)v5->_label topAnchor];
    v25 = [(MKVibrantLabel *)v5 topAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v28[0] = v24;
    v23 = [(UILabel *)v5->_label leadingAnchor];
    v12 = [(MKVibrantLabel *)v5 leadingAnchor];
    v13 = [v23 constraintEqualToAnchor:v12];
    v28[1] = v13;
    v14 = [(UILabel *)v5->_label bottomAnchor];
    v15 = [(MKVibrantLabel *)v5 bottomAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v28[2] = v16;
    v17 = [(UILabel *)v5->_label trailingAnchor];
    v18 = [(MKVibrantLabel *)v5 trailingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v28[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    [v22 activateConstraints:v20];
  }
  return v5;
}

- (void)setText:(id)a3
{
}

- (void)setFont:(id)a3
{
}

- (id)viewForFirstBaselineLayout
{
  return self->_label;
}

- (NSString)text
{
  return [(UILabel *)self->_label text];
}

- (void)setAttributedText:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return [(UILabel *)self->_label attributedText];
}

- (UIFont)font
{
  return [(UILabel *)self->_label font];
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

- (void)_setHyphenationFactor:(float)a3
{
}

- (float)_hyphenationFactor
{
  [(UILabel *)self->_label _hyphenationFactor];
  return result;
}

- (double)idealWidth
{
  [(UILabel *)self->_label intrinsicContentSize];
  return result;
}

- (BOOL)allowsDefaultTighteningForTruncation
{
  return [(UILabel *)self->_label allowsDefaultTighteningForTruncation];
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)a3
{
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return [(UILabel *)self->_label adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
}

- (int64_t)lineBreakMode
{
  return [(UILabel *)self->_label lineBreakMode];
}

- (void)setLineBreakMode:(int64_t)a3
{
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)textColor
{
  return [(UILabel *)self->_label textColor];
}

- (void).cxx_destruct
{
}

@end