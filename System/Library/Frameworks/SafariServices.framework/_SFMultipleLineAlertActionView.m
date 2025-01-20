@interface _SFMultipleLineAlertActionView
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (_SFMultipleLineAlertActionView)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation _SFMultipleLineAlertActionView

- (_SFMultipleLineAlertActionView)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)_SFMultipleLineAlertActionView;
  v3 = -[_SFMultipleLineAlertActionView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = v6;

    [(_SFMultipleLineAlertActionView *)v3 addSubview:v3->_titleLabel];
    [(_SFMultipleLineAlertActionView *)v3 addSubview:v3->_detailLabel];
    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_titleLabel setNumberOfLines:1];
    [(UILabel *)v3->_detailLabel setNumberOfLines:1];
    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_detailLabel setTextAlignment:1];
    v8 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v3->_titleLabel setFont:v8];
    v9 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    [(UILabel *)v3->_detailLabel setFont:v9];
    [(_SFMultipleLineAlertActionView *)v3 tintColorDidChange];
    [v8 _bodyLeading];
    double v11 = v10;
    v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_titleLabel attribute:11 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:v10 * 48.0 / 44.0];
    [(_SFMultipleLineAlertActionView *)v3 addConstraint:v12];

    v13 = (void *)MEMORY[0x1E4F28DC8];
    v14 = v3->_detailLabel;
    v15 = v3->_titleLabel;
    [v9 _bodyLeading];
    v17 = [v13 constraintWithItem:v14 attribute:11 relatedBy:0 toItem:v15 attribute:11 multiplier:1.0 constant:v16 * 40.0 * 0.03125];
    [(_SFMultipleLineAlertActionView *)v3 addConstraint:v17];

    v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:4 relatedBy:0 toItem:v3->_detailLabel attribute:11 multiplier:1.0 constant:v11 * 24.0 / 44.0];
    LODWORD(v19) = 1144750080;
    [v18 setPriority:v19];
    [(_SFMultipleLineAlertActionView *)v3 addConstraint:v18];
    v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_titleLabel attribute:5 relatedBy:0 toItem:v3 attribute:17 multiplier:1.0 constant:0.0];
    [(_SFMultipleLineAlertActionView *)v3 addConstraint:v20];

    v21 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_titleLabel attribute:6 relatedBy:0 toItem:v3 attribute:18 multiplier:1.0 constant:0.0];
    [(_SFMultipleLineAlertActionView *)v3 addConstraint:v21];

    v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_detailLabel attribute:5 relatedBy:0 toItem:v3 attribute:17 multiplier:1.0 constant:0.0];
    [(_SFMultipleLineAlertActionView *)v3 addConstraint:v22];

    v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_detailLabel attribute:6 relatedBy:0 toItem:v3 attribute:18 multiplier:1.0 constant:0.0];
    [(_SFMultipleLineAlertActionView *)v3 addConstraint:v23];

    v24 = v3;
  }

  return v3;
}

- (void)tintColorDidChange
{
  id v3 = [(_SFMultipleLineAlertActionView *)self tintColor];
  [(UILabel *)self->_titleLabel setTextColor:v3];
  [(UILabel *)self->_detailLabel setTextColor:v3];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end