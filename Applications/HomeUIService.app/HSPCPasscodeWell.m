@interface HSPCPasscodeWell
- (HSPCPasscodeWell)initWithFrame:(CGRect)a3;
- (UILabel)label;
@end

@implementation HSPCPasscodeWell

- (HSPCPasscodeWell)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)HSPCPasscodeWell;
  v3 = -[HSPCPasscodeWell initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HSPCPasscodeWell *)v3 setUserInteractionEnabled:0];
    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    label = v4->_label;
    v4->_label = v5;

    [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HSPCPasscodeWell *)v4 addSubview:v4->_label];
    v7 = [(UILabel *)v4->_label centerXAnchor];
    v8 = [(HSPCPasscodeWell *)v4 centerXAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v17[0] = v9;
    v10 = [(UILabel *)v4->_label centerYAnchor];
    v11 = [(HSPCPasscodeWell *)v4 centerYAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v17[1] = v12;
    v13 = +[NSArray arrayWithObjects:v17 count:2];
    +[NSLayoutConstraint activateConstraints:v13];

    v14 = v4;
  }

  return v4;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
}

@end