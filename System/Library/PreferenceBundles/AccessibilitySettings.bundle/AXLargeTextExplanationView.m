@interface AXLargeTextExplanationView
- (AXLargeTextExplanationView)initWithSpecifier:(id)a3;
- (NSString)categoryName;
- (UILabel)bodyExampleLabel;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (void)layoutForWidth:(double)a3 inTableView:(id)a4;
- (void)layoutSubviews;
- (void)setBodyExampleLabel:(id)a3;
- (void)setCategoryName:(id)a3;
@end

@implementation AXLargeTextExplanationView

- (AXLargeTextExplanationView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AXLargeTextExplanationView;
  v5 = -[AXLargeTextExplanationView initWithFrame:](&v18, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    uint64_t v6 = [v4 propertyForKey:@"BundleIdentifier"];
    appID = v5->_appID;
    v5->_appID = (NSString *)v6;

    v8 = (UILabel *)objc_alloc_init((Class)UILabel);
    bodyExampleLabel = v5->_bodyExampleLabel;
    v5->_bodyExampleLabel = v8;

    v10 = +[UIColor clearColor];
    [(UILabel *)v5->_bodyExampleLabel setBackgroundColor:v10];

    v11 = +[PSListController appearance];
    v12 = [v11 textColor];
    [(UILabel *)v5->_bodyExampleLabel setTextColor:v12];

    [(UILabel *)v5->_bodyExampleLabel setNumberOfLines:0];
    [(UILabel *)v5->_bodyExampleLabel setLineBreakMode:0];
    [(UILabel *)v5->_bodyExampleLabel setTextAlignment:1];
    v13 = settingsLocString(@"PERAPPSETTINGS_DYNAMIC_TYPE_DESCRIPTION", @"Accessibility");
    v14 = AXAppNameForBundleId();
    v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v14);
    [(UILabel *)v5->_bodyExampleLabel setText:v15];

    LODWORD(v16) = 0.5;
    [(UILabel *)v5->_bodyExampleLabel _setHyphenationFactor:v16];
    [(AXLargeTextExplanationView *)v5 addSubview:v5->_bodyExampleLabel];
  }

  return v5;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)AXLargeTextExplanationView;
  [(AXLargeTextExplanationView *)&v6 layoutSubviews];
  [(AXLargeTextExplanationView *)self bounds];
  double v4 = v3;
  v5 = [(AXLargeTextExplanationView *)self superview];
  [(AXLargeTextExplanationView *)self layoutForWidth:v5 inTableView:v4];
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  [(AXLargeTextExplanationView *)self layoutForWidth:a4 inTableView:a3];
  [(UILabel *)self->_bodyExampleLabel frame];
  return CGRectGetMaxY(v6) + 10.0;
}

- (void)layoutForWidth:(double)a3 inTableView:(id)a4
{
  objc_msgSend(a4, "bounds", a3);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  [(AXLargeTextExplanationView *)self frame];
  double MinX = CGRectGetMinX(v20);
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  double v14 = v10 + (MinX - CGRectGetMinX(v21) + 25.0) * -2.0;
  if (v14 > 0.0)
  {
    v15 = [(AXLargeTextExplanationView *)self categoryName];
    id v18 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v15];

    double v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v18];
    [(UILabel *)self->_bodyExampleLabel setFont:v16];
    [(UILabel *)self->_bodyExampleLabel frame];
    -[UILabel sizeThatFits:](self->_bodyExampleLabel, "sizeThatFits:", v14, 1.79769313e308);
    -[UILabel setFrame:](self->_bodyExampleLabel, "setFrame:", 25.0, 10.0, v14, v17);
  }
}

- (UILabel)bodyExampleLabel
{
  return self->_bodyExampleLabel;
}

- (void)setBodyExampleLabel:(id)a3
{
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryName, 0);
  objc_storeStrong((id *)&self->_bodyExampleLabel, 0);

  objc_storeStrong((id *)&self->_appID, 0);
}

@end