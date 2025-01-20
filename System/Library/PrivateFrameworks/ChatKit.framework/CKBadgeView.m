@interface CKBadgeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKBadgeView)initWithFrame:(CGRect)a3;
- (UILabel)countLabel;
- (unint64_t)value;
- (void)layoutSubviews;
- (void)setValue:(unint64_t)a3;
@end

@implementation CKBadgeView

- (CKBadgeView)initWithFrame:(CGRect)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)CKBadgeView;
  v3 = -[CKBadgeView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKBadgeView *)v3 layer];
    [v5 setCornerRadius:7.0];

    id v6 = [MEMORY[0x1E4F428B8] systemRedColor];
    uint64_t v7 = [v6 CGColor];
    v8 = [(CKBadgeView *)v4 layer];
    [v8 setBackgroundColor:v7];

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(UILabel *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43888]];
    uint64_t v11 = *MEMORY[0x1E4FB0960];
    v24[0] = *MEMORY[0x1E4FB0968];
    v24[1] = v11;
    v25[0] = &unk_1EDF162E0;
    v25[1] = &unk_1EDF162F8;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    v26[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];

    uint64_t v22 = *MEMORY[0x1E4FB0910];
    v23 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v15 = [v10 fontDescriptorByAddingAttributes:v14];

    v16 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v15 size:11.0];
    [(UILabel *)v9 setFont:v16];
    v17 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UILabel *)v9 setTextColor:v17];

    [(UILabel *)v9 setTextAlignment:1];
    [(UILabel *)v9 setLineBreakMode:4];
    countLabel = v4->_countLabel;
    v4->_countLabel = v9;
    v19 = v9;

    [(CKBadgeView *)v4 addSubview:v19];
  }
  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKBadgeView;
  [(CKBadgeView *)&v4 layoutSubviews];
  v3 = [(CKBadgeView *)self countLabel];
  [(CKBadgeView *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(CKBadgeView *)self countLabel];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;

  double v8 = 14.0;
  if (v7 > 14.0) {
    double v8 = v7 + 14.0;
  }
  double v9 = 14.0;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)setValue:(unint64_t)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    if (a3)
    {
      objc_super v4 = (void *)MEMORY[0x1E4F28EE0];
      v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      id v7 = [v4 localizedStringFromNumber:v5 numberStyle:0];

      [(UILabel *)self->_countLabel setText:v7];
    }
    else
    {
      countLabel = self->_countLabel;
      [(UILabel *)countLabel setText:&stru_1EDE4CA38];
    }
  }
}

- (unint64_t)value
{
  return self->_value;
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void).cxx_destruct
{
}

@end