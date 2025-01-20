@interface SRButtonTrayCell
- (SRButtonTrayCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIButton)firstButton;
- (UIButton)secondButton;
- (void)dealloc;
@end

@implementation SRButtonTrayCell

- (SRButtonTrayCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SRButtonTrayCell;
  v4 = [(SRButtonTrayCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(SRButtonTrayCell *)v4 setSelectionStyle:0];
    v5->_firstButton = sub_100004528();
    v5->_secondButton = sub_100004528();
    id v6 = objc_alloc((Class)UIStackView);
    v11[0] = v5->_firstButton;
    v11[1] = v5->_secondButton;
    id v7 = objc_msgSend(v6, "initWithArrangedSubviews:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    [v7 setAxis:1];
    [v7 setSpacing:5.0];
    [v7 setAlignment:0];
    [v7 setDistribution:1];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend(-[SRButtonTrayCell contentView](v5, "contentView"), "addSubview:", v7);
    v10[0] = objc_msgSend(-[UIButton heightAnchor](v5->_firstButton, "heightAnchor"), "constraintEqualToConstant:", 50.0);
    v10[1] = objc_msgSend(-[UIButton heightAnchor](v5->_secondButton, "heightAnchor"), "constraintEqualToConstant:", 50.0);
    v10[2] = objc_msgSend(objc_msgSend(v7, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRButtonTrayCell contentView](v5, "contentView"), "layoutMarginsGuide"), "topAnchor"));
    v10[3] = objc_msgSend(objc_msgSend(v7, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRButtonTrayCell contentView](v5, "contentView"), "layoutMarginsGuide"), "leadingAnchor"));
    v10[4] = objc_msgSend(objc_msgSend(v7, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRButtonTrayCell contentView](v5, "contentView"), "layoutMarginsGuide"), "trailingAnchor"));
    v10[5] = objc_msgSend(objc_msgSend(v7, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRButtonTrayCell contentView](v5, "contentView"), "layoutMarginsGuide"), "bottomAnchor"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:v10 count:6]);
  }
  return v5;
}

- (void)dealloc
{
  self->_firstButton = 0;
  self->_secondButton = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRButtonTrayCell;
  [(SRButtonTrayCell *)&v3 dealloc];
}

- (UIButton)firstButton
{
  return self->_firstButton;
}

- (UIButton)secondButton
{
  return self->_secondButton;
}

@end