@interface _MKEnvironmentLabel
- (NSString)text;
- (_MKEnvironmentLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setText:(id)a3;
- (void)sizeToFit;
@end

@implementation _MKEnvironmentLabel

- (_MKEnvironmentLabel)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)_MKEnvironmentLabel;
  v3 = -[_MKEnvironmentLabel initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    v7 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.5];
    [(_MKEnvironmentLabel *)v3 setBackgroundColor:v7];

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UILabel *)v3->_label setTextColor:v8];

    v9 = [MEMORY[0x1E4F42A30] systemFontOfSize:12.0];
    [(UILabel *)v3->_label setFont:v9];

    [(UILabel *)v3->_label setTextAlignment:2];
    [(_MKEnvironmentLabel *)v3 addSubview:v3->_label];
    id v10 = objc_alloc_init(MEMORY[0x1E4F42B48]);
    [(_MKEnvironmentLabel *)v3 addLayoutGuide:v10];
    v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v10 attribute:1 relatedBy:0 toItem:v3 attribute:1 multiplier:1.0 constant:0.0];
    [(_MKEnvironmentLabel *)v3 addConstraint:v11];

    v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v10 attribute:7 relatedBy:0 toItem:v3 attribute:8 multiplier:0.5 constant:0.0];
    [(_MKEnvironmentLabel *)v3 addConstraint:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F42B48]);
    [(_MKEnvironmentLabel *)v3 addLayoutGuide:v13];
    v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:v13 attribute:2 relatedBy:0 toItem:v3 attribute:2 multiplier:1.0 constant:0.0];
    [(_MKEnvironmentLabel *)v3 addConstraint:v14];

    v15 = [MEMORY[0x1E4F28DC8] constraintWithItem:v13 attribute:7 relatedBy:0 toItem:v3 attribute:8 multiplier:0.5 constant:0.0];
    [(_MKEnvironmentLabel *)v3 addConstraint:v15];

    v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_label attribute:1 relatedBy:0 toItem:v10 attribute:2 multiplier:1.0 constant:0.0];
    [(_MKEnvironmentLabel *)v3 addConstraint:v16];

    v17 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_label attribute:2 relatedBy:0 toItem:v13 attribute:1 multiplier:1.0 constant:0.0];
    [(_MKEnvironmentLabel *)v3 addConstraint:v17];

    v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_label attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:0.0];
    [(_MKEnvironmentLabel *)v3 addConstraint:v18];

    v19 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_label attribute:4 relatedBy:0 toItem:v3 attribute:4 multiplier:1.0 constant:0.0];
    [(_MKEnvironmentLabel *)v3 addConstraint:v19];

    v20 = v3;
  }

  return v3;
}

- (void)sizeToFit
{
  [(UIView *)self _mapkit_fittingSize];
  [(_MKEnvironmentLabel *)self frame];
  double v4 = v3;
  [(_MKEnvironmentLabel *)self frame];

  [(_MKEnvironmentLabel *)self setFrame:v4];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)_MKEnvironmentLabel;
  [(_MKEnvironmentLabel *)&v6 layoutSubviews];
  [(_MKEnvironmentLabel *)self bounds];
  double v4 = v3 * 0.5;
  uint64_t v5 = [(_MKEnvironmentLabel *)self layer];
  [v5 setCornerRadius:v4];
}

- (NSString)text
{
  return [(UILabel *)self->_label text];
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end