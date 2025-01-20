@interface GestureInstructionItemView
- (BOOL)_usesLargeSize;
- (CGSize)_descriptionSizeThatFitsSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (GestureInstructionItemView)initWithImageName:(id)a3 title:(id)a4 description:(id)a5;
- (void)layoutSubviews;
@end

@implementation GestureInstructionItemView

- (GestureInstructionItemView)initWithImageName:(id)a3 title:(id)a4 description:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v39.receiver = self;
  v39.super_class = (Class)GestureInstructionItemView;
  v11 = [(GestureInstructionItemView *)&v39 init];
  if (v11)
  {
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = objc_alloc((Class)UIImageView);
    v14 = +[UIImage imageNamed:v8 inBundle:v12];
    v15 = (UIImageView *)[v13 initWithImage:v14];
    imageView = v11->_imageView;
    v11->_imageView = v15;

    [(UIImageView *)v11->_imageView setContentMode:4];
    [(GestureInstructionItemView *)v11 addSubview:v11->_imageView];
    v17 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    [v17 _scaledValueForValue:14.0];
    double v19 = v18;

    v20 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = v20;

    [(UILabel *)v11->_titleLabel setText:v9];
    v22 = v11->_titleLabel;
    v23 = +[UIColor systemGrayColor];
    [(UILabel *)v22 setTextColor:v23];

    [(UILabel *)v11->_titleLabel setNumberOfLines:0];
    v24 = v11->_titleLabel;
    v25 = +[UIFont boldSystemFontOfSize:v19];
    [(UILabel *)v24 setFont:v25];

    [(UILabel *)v11->_titleLabel sizeToFit];
    [(GestureInstructionItemView *)v11 addSubview:v11->_titleLabel];
    v26 = (UILabel *)objc_alloc_init((Class)UILabel);
    descriptionLabel = v11->_descriptionLabel;
    v11->_descriptionLabel = v26;

    [(UILabel *)v11->_descriptionLabel setText:v10];
    v28 = v11->_descriptionLabel;
    v29 = +[UIColor whiteColor];
    [(UILabel *)v28 setTextColor:v29];

    [(UILabel *)v11->_descriptionLabel setNumberOfLines:0];
    v30 = v11->_descriptionLabel;
    v31 = +[UIFont systemFontOfSize:v19];
    [(UILabel *)v30 setFont:v31];

    [(UILabel *)v11->_descriptionLabel sizeToFit];
    [(GestureInstructionItemView *)v11 addSubview:v11->_descriptionLabel];
    v32 = +[UIApplication sharedApplication];
    v33 = [v32 preferredContentSizeCategory];
    int IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

    if (IsAccessibilityContentSizeCategory)
    {
      LODWORD(v35) = 1.0;
      [(UILabel *)v11->_titleLabel _setHyphenationFactor:v35];
      LODWORD(v36) = 1.0;
      [(UILabel *)v11->_descriptionLabel _setHyphenationFactor:v36];
    }
    v37 = v11;
  }
  return v11;
}

- (BOOL)_usesLargeSize
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 preferredContentSizeCategory];
  char IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  return IsAccessibilityContentSizeCategory;
}

- (void)layoutSubviews
{
  UIUserInterfaceLayoutDirection v3 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(GestureInstructionItemView *)self semanticContentAttribute]];
  unsigned int v4 = [(GestureInstructionItemView *)self _usesLargeSize];
  double v5 = 30.0;
  if (v4)
  {
    double v5 = 0.0;
    double v6 = 0.0;
  }
  else
  {
    double v6 = 80.0;
  }
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v8 = v6;
  }
  else {
    double v8 = v5;
  }
  [(GestureInstructionItemView *)self bounds];
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  double v15 = v11;
  double v16 = v12;
  if (v4)
  {
    [(UIImageView *)self->_imageView removeFromSuperview];
  }
  else
  {
    if (v3 == UIUserInterfaceLayoutDirectionRightToLeft) {
      double v17 = CGRectGetMaxX(*(CGRect *)&v9) + -40.0;
    }
    else {
      double v17 = 40.0;
    }
    imageView = self->_imageView;
    double v19 = [(UIImageView *)imageView image];
    [v19 size];
    -[UIImageView setCenter:](imageView, "setCenter:", v17, v20 * 0.5);
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v15 - v7 - v8, 1.79769313e308);
  double v22 = v21;
  double v24 = v23;
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    v32.origin.x = v13;
    v32.origin.y = v14;
    v32.size.width = v15;
    v32.size.height = v16;
    double v6 = CGRectGetMaxX(v32) - v6 - v22;
  }
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v6, 0.0, v22, v24);
  -[GestureInstructionItemView _descriptionSizeThatFitsSize:](self, "_descriptionSizeThatFitsSize:", v15, v16);
  double v26 = v25;
  double v28 = v27;
  descriptionLabel = self->_descriptionLabel;
  [(UILabel *)self->_titleLabel frame];
  double MaxY = CGRectGetMaxY(v33);

  -[UILabel setFrame:](descriptionLabel, "setFrame:", v7, MaxY, v26, v28);
}

- (CGSize)_descriptionSizeThatFitsSize:(CGSize)a3
{
  double width = a3.width;
  unsigned int v5 = [(GestureInstructionItemView *)self _usesLargeSize];
  double v6 = 80.0;
  double v7 = 0.0;
  if (v5) {
    double v6 = 0.0;
  }
  else {
    double v7 = 30.0;
  }
  double v8 = width - v6 - v7;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v8, 3.40282347e38);
  double v10 = v8;
  result.height = v9;
  result.double width = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UILabel *)self->_titleLabel frame];
  double v7 = v6;
  -[GestureInstructionItemView _descriptionSizeThatFitsSize:](self, "_descriptionSizeThatFitsSize:", width, height);
  double v9 = v7 + v8;
  double v10 = width;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end