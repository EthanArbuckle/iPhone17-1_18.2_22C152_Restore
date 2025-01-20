@interface CARSettingsCollectionViewHeader
+ (id)reuseIdentifier;
- (CARSettingsCollectionViewHeader)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)leadingConstraint;
- (NSString)title;
- (UIEdgeInsets)sectionInsets;
- (UILabel)titleLabel;
- (void)setLeadingConstraint:(id)a3;
- (void)setSectionInsets:(UIEdgeInsets)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation CARSettingsCollectionViewHeader

+ (id)reuseIdentifier
{
  return @"CARSettingsCollectionViewHeader";
}

- (CARSettingsCollectionViewHeader)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CARSettingsCollectionViewHeader;
  v3 = -[CARSettingsCollectionViewHeader initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = +[UIFont systemFontOfSize:13.0 weight:UIFontWeightBold];
    [(UILabel *)v3->_titleLabel setFont:v6];

    v7 = +[UIColor labelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v7];

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CARSettingsCollectionViewHeader *)v3 addSubview:v3->_titleLabel];
    v8 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v9 = [(CARSettingsCollectionViewHeader *)v3 leadingAnchor];
    uint64_t v10 = [v8 constraintEqualToAnchor:v9 constant:0.0];
    leadingConstraint = v3->_leadingConstraint;
    v3->_leadingConstraint = (NSLayoutConstraint *)v10;

    v21[0] = v3->_leadingConstraint;
    v12 = [(CARSettingsCollectionViewHeader *)v3 trailingAnchor];
    v13 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v21[1] = v14;
    v15 = [(CARSettingsCollectionViewHeader *)v3 bottomAnchor];
    v16 = [(UILabel *)v3->_titleLabel lastBaselineAnchor];
    v17 = [v15 constraintEqualToAnchor:v16 constant:6.0];
    v21[2] = v17;
    v18 = +[NSArray arrayWithObjects:v21 count:3];
    +[NSLayoutConstraint activateConstraints:v18];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsCollectionViewHeader *)self titleLabel];
  [v5 setText:v4];
}

- (void)setSectionInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double left = a3.left;
  v6 = [(CARSettingsCollectionViewHeader *)self traitCollection];
  if ([v6 layoutDirection] != (id)1) {
    double right = left;
  }

  id v7 = [(CARSettingsCollectionViewHeader *)self leadingConstraint];
  [v7 setConstant:right];
}

- (NSString)title
{
  return self->_title;
}

- (UIEdgeInsets)sectionInsets
{
  double top = self->_sectionInsets.top;
  double left = self->_sectionInsets.left;
  double bottom = self->_sectionInsets.bottom;
  double right = self->_sectionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end