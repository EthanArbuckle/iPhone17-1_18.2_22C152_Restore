@interface SRBulletedListItem
- (NSLayoutConstraint)stackViewLeadingConstraintHorizontal;
- (NSLayoutConstraint)stackViewLeadingConstraintVertical;
- (SRBulletedListItem)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 textStyle:(id)a6;
- (UIImageView)imageView;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (UIView)imageContainer;
- (void)_updateImageViewLayout;
- (void)dealloc;
- (void)setDescriptionLabel:(id)a3;
- (void)setImageContainer:(id)a3;
- (void)setImageView:(id)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewLeadingConstraintHorizontal:(id)a3;
- (void)setStackViewLeadingConstraintVertical:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation SRBulletedListItem

- (SRBulletedListItem)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 textStyle:(id)a6
{
  if (!((unint64_t)a3 | (unint64_t)a4)) {
    return 0;
  }
  v28.receiver = self;
  v28.super_class = (Class)SRBulletedListItem;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v6 = -[SRBulletedListItem initWithFrame:](&v28, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v6)
  {
    v14 = +[UIFont preferredFontForTextStyle:a6];
    [(UIFont *)v14 pointSize];
    v15 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
    id v16 = [objc_alloc((Class)UIImageView) initWithImage:a5];
    [(SRBulletedListItem *)v6 setImageView:v16];

    [(UIImageView *)[(SRBulletedListItem *)v6 imageView] setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)[(SRBulletedListItem *)v6 imageView] setContentMode:1];
    v17 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v6->_imageContainer = v17;
    [(UIView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v6->_imageContainer addSubview:v6->_imageView];
    if ([a3 length])
    {
      id v18 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      [(SRBulletedListItem *)v6 setTitleLabel:v18];

      [(UILabel *)[(SRBulletedListItem *)v6 titleLabel] setNumberOfLines:0];
      [(UILabel *)[(SRBulletedListItem *)v6 titleLabel] setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)[(SRBulletedListItem *)v6 titleLabel] setFont:v15];
      [(UILabel *)[(SRBulletedListItem *)v6 titleLabel] setText:a3];
      v19 = [(SRBulletedListItem *)v6 titleLabel];
      LODWORD(v20) = 1148846080;
      [(UILabel *)v19 setContentHuggingPriority:1 forAxis:v20];
    }
    if ([a4 length])
    {
      id v21 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      [(SRBulletedListItem *)v6 setDescriptionLabel:v21];

      [(UILabel *)[(SRBulletedListItem *)v6 descriptionLabel] setNumberOfLines:0];
      [(UILabel *)[(SRBulletedListItem *)v6 descriptionLabel] setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)[(SRBulletedListItem *)v6 descriptionLabel] setFont:v14];
      [(UILabel *)[(SRBulletedListItem *)v6 descriptionLabel] setText:a4];
      [(UILabel *)[(SRBulletedListItem *)v6 descriptionLabel] setTextColor:+[UIColor colorWithRed:0.56 green:0.56 blue:0.58 alpha:1.0]];
      v22 = [(SRBulletedListItem *)v6 descriptionLabel];
      LODWORD(v23) = 1148846080;
      [(UILabel *)v22 setContentHuggingPriority:1 forAxis:v23];
    }
    else
    {
      [(UILabel *)[(SRBulletedListItem *)v6 titleLabel] setFont:v14];
    }
    id v24 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(SRBulletedListItem *)v6 setStackView:v24];

    [(UIStackView *)[(SRBulletedListItem *)v6 stackView] setAxis:1];
    [(UIStackView *)[(SRBulletedListItem *)v6 stackView] setAlignment:1];
    [(UIStackView *)[(SRBulletedListItem *)v6 stackView] setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)[(SRBulletedListItem *)v6 stackView] addArrangedSubview:[(SRBulletedListItem *)v6 titleLabel]];
    [(UIStackView *)[(SRBulletedListItem *)v6 stackView] addArrangedSubview:[(SRBulletedListItem *)v6 descriptionLabel]];
    [(SRBulletedListItem *)v6 addSubview:v6->_imageContainer];
    [(SRBulletedListItem *)v6 addSubview:[(SRBulletedListItem *)v6 stackView]];
    [[(UIImageView *)[(SRBulletedListItem *)v6 imageView] image] size];
    double v26 = v25;
    v29[0] = objc_msgSend(-[UIImageView widthAnchor](-[SRBulletedListItem imageView](v6, "imageView"), "widthAnchor"), "constraintEqualToConstant:", v25);
    v29[1] = objc_msgSend(-[UIImageView heightAnchor](-[SRBulletedListItem imageView](v6, "imageView"), "heightAnchor"), "constraintEqualToConstant:", v26);
    v29[2] = objc_msgSend(-[UIImageView centerXAnchor](-[SRBulletedListItem imageView](v6, "imageView"), "centerXAnchor"), "constraintEqualToAnchor:", -[UIView centerXAnchor](-[SRBulletedListItem imageContainer](v6, "imageContainer"), "centerXAnchor"));
    v29[3] = objc_msgSend(-[UIImageView centerYAnchor](-[SRBulletedListItem imageView](v6, "imageView"), "centerYAnchor"), "constraintEqualToAnchor:", -[UIView centerYAnchor](-[SRBulletedListItem imageContainer](v6, "imageContainer"), "centerYAnchor"));
    v29[4] = objc_msgSend(-[UIStackView trailingAnchor](-[SRBulletedListItem stackView](v6, "stackView"), "trailingAnchor"), "constraintEqualToAnchor:constant:", -[SRBulletedListItem trailingAnchor](v6, "trailingAnchor"), -0.0);
    v29[5] = objc_msgSend(-[UIStackView topAnchor](-[SRBulletedListItem stackView](v6, "stackView"), "topAnchor"), "constraintGreaterThanOrEqualToAnchor:constant:", -[SRBulletedListItem topAnchor](v6, "topAnchor"), 0.0);
    v29[6] = objc_msgSend(-[SRBulletedListItem bottomAnchor](v6, "bottomAnchor"), "constraintGreaterThanOrEqualToAnchor:constant:", -[UIStackView bottomAnchor](-[SRBulletedListItem stackView](v6, "stackView"), "bottomAnchor"), 0.0);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:v29 count:7]);
    [(SRBulletedListItem *)v6 _updateImageViewLayout];
  }
  return v6;
}

- (void)dealloc
{
  [(SRBulletedListItem *)self setImageView:0];
  [(SRBulletedListItem *)self setImageContainer:0];
  [(SRBulletedListItem *)self setStackView:0];
  [(SRBulletedListItem *)self setTitleLabel:0];
  [(SRBulletedListItem *)self setDescriptionLabel:0];
  [(SRBulletedListItem *)self setStackViewLeadingConstraintVertical:0];
  [(SRBulletedListItem *)self setStackViewLeadingConstraintHorizontal:0];
  v3.receiver = self;
  v3.super_class = (Class)SRBulletedListItem;
  [(SRBulletedListItem *)&v3 dealloc];
}

- (void)_updateImageViewLayout
{
  [(UIView *)[(SRBulletedListItem *)self imageContainer] removeFromSuperview];
  [[(UIImageView *)[(SRBulletedListItem *)self imageView] image] size];
  double v4 = v3;
  [(SRBulletedListItem *)self addSubview:[(SRBulletedListItem *)self imageContainer]];
  if (![(SRBulletedListItem *)self stackViewLeadingConstraintHorizontal]) {
    -[SRBulletedListItem setStackViewLeadingConstraintHorizontal:](self, "setStackViewLeadingConstraintHorizontal:", objc_msgSend(-[UIStackView leadingAnchor](-[SRBulletedListItem stackView](self, "stackView"), "leadingAnchor"), "constraintEqualToAnchor:constant:", -[UIView trailingAnchor](-[SRBulletedListItem imageContainer](self, "imageContainer"), "trailingAnchor"), 14.0));
  }
  [(NSLayoutConstraint *)[(SRBulletedListItem *)self stackViewLeadingConstraintHorizontal] setActive:1];
  [(NSLayoutConstraint *)[(SRBulletedListItem *)self stackViewLeadingConstraintVertical] setActive:0];
  v5[1] = -[NSLayoutDimension constraintEqualToConstant:](-[UIView widthAnchor](-[SRBulletedListItem imageContainer](self, "imageContainer", objc_msgSend(-[SRBulletedListItem topAnchor](self, "topAnchor"), "constraintEqualToAnchor:", -[UIView topAnchor](-[SRBulletedListItem imageContainer](self, "imageContainer"), "topAnchor"))), "widthAnchor"), "constraintEqualToConstant:", v4);
  v5[2] = objc_msgSend(-[SRBulletedListItem leadingAnchor](self, "leadingAnchor"), "constraintEqualToAnchor:constant:", -[UIView leadingAnchor](-[SRBulletedListItem imageContainer](self, "imageContainer"), "leadingAnchor"), -10.0);
  v5[3] = [(NSLayoutXAxisAnchor *)[(UIView *)[(SRBulletedListItem *)self imageContainer] trailingAnchor] constraintEqualToAnchor:[(UIStackView *)[(SRBulletedListItem *)self stackView] leadingAnchor] constant:-14.0];
  v5[4] = objc_msgSend(-[UIStackView centerYAnchor](-[SRBulletedListItem stackView](self, "stackView"), "centerYAnchor"), "constraintEqualToAnchor:", -[UIView centerYAnchor](-[SRBulletedListItem imageContainer](self, "imageContainer"), "centerYAnchor"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:v5 count:5]);
}

- (UIView)imageContainer
{
  return self->_imageContainer;
}

- (void)setImageContainer:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (NSLayoutConstraint)stackViewLeadingConstraintVertical
{
  return self->_stackViewLeadingConstraintVertical;
}

- (void)setStackViewLeadingConstraintVertical:(id)a3
{
}

- (NSLayoutConstraint)stackViewLeadingConstraintHorizontal
{
  return self->_stackViewLeadingConstraintHorizontal;
}

- (void)setStackViewLeadingConstraintHorizontal:(id)a3
{
}

@end