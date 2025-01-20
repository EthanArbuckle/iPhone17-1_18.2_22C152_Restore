@interface SRGuideViewHeader
+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4;
+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4 edgeInsets:(UIEdgeInsets)a5;
+ (UIEdgeInsets)_edgeInsets;
+ (double)defaultHeight;
+ (double)firstLineBaselineOffsetFromTop;
+ (id)_font;
+ (id)elementKind;
+ (id)reuseIdentifier;
- (NSString)title;
- (SRGuideViewHeader)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)edgeInsets;
- (void)layoutSubviews;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setTitle:(id)a3;
@end

@implementation SRGuideViewHeader

- (SRGuideViewHeader)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SRGuideViewHeader;
  v3 = -[SRGuideViewHeader initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    contentView = v3->_contentView;
    v3->_contentView = v4;

    uint64_t v6 = +[SiriSharedUIContentLabel label];
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = (UILabel *)v6;

    v8 = v3->_headerLabel;
    v9 = +[UIColor siriui_lightTextColor];
    [(UILabel *)v8 setTextColor:v9];

    v10 = v3->_headerLabel;
    v11 = [(id)objc_opt_class() _font];
    [(UILabel *)v10 setFont:v11];

    [(UILabel *)v3->_headerLabel setNumberOfLines:0];
    [(id)objc_opt_class() _edgeInsets];
    -[SRGuideViewHeader setEdgeInsets:](v3, "setEdgeInsets:");
    [(UIView *)v3->_contentView addSubview:v3->_headerLabel];
    [(SRGuideViewHeader *)v3 addSubview:v3->_contentView];
    if (SiriLanguageIsRTL())
    {
      v12 = v3->_contentView;
      CGAffineTransformMakeScale(&v16, -1.0, 1.0);
      [(UIView *)v12 setTransform:&v16];
      v13 = v3->_headerLabel;
      CGAffineTransformMakeScale(&v15, -1.0, 1.0);
      [(UILabel *)v13 setTransform:&v15];
    }
  }
  return v3;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)SRGuideViewHeader;
  [(SRGuideViewHeader *)&v24 layoutSubviews];
  [(SRGuideViewHeader *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SRGuideViewHeader *)self edgeInsets];
  double v23 = v11;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", CGRectGetWidth(v25) - v13 - v17, 1.79769313e308);
  double v19 = v18;
  double v21 = v20;
  if (v15 <= 0.0)
  {
    double v22 = v23;
  }
  else
  {
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    double v22 = CGRectGetMaxY(v26) - v21 - v15;
  }
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  -[UILabel setFrame:](self->_headerLabel, "setFrame:", v13, v22, v19, v21);
}

+ (double)defaultHeight
{
  if (SiriUIIsLargePhoneLayout() && !SiriUIIsCompactWidth()) {
    return 116.0;
  }
  if (SiriUIIsCompactWidth()) {
    return 157.0;
  }
  double v3 = +[UIScreen mainScreen];
  [v3 scale];
  double v5 = v4;
  double v6 = +[UIScreen mainScreen];
  [v6 bounds];
  double v7 = CGRectGetHeight(v10) * 0.11328125 + 57.5;
  double v8 = ceil(v7);
  if (v5 < 2.0) {
    double v2 = v8;
  }
  else {
    double v2 = v7;
  }

  return v2;
}

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4 edgeInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double width = a3.width;
  NSAttributedStringKey v26 = NSFontAttributeName;
  id v11 = a4;
  double v12 = [a1 _font];
  v27 = v12;
  double v13 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];

  [v11 boundingRectWithSize:3 options:v13 attributes:0 context:width - left - right 1.79769313e308];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v29.origin.x = v15;
  v29.origin.y = v17;
  v29.size.double width = v19;
  v29.size.height = v21;
  CGFloat v22 = CGRectGetWidth(v29);
  v30.origin.x = v15;
  v30.origin.y = v17;
  v30.size.double width = v19;
  v30.size.height = v21;
  double MaxY = CGRectGetMaxY(v30);

  double v24 = bottom + top + MaxY;
  double v25 = v22;
  result.height = v24;
  result.double width = v25;
  return result;
}

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [a1 _edgeInsets];
  [a1 sizeThatFits:v7 text:width height:height edgeInsets:v8, v9, v10, v11];
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

+ (double)firstLineBaselineOffsetFromTop
{
  double v2 = [(id)objc_opt_class() _font];
  [v2 ascender];
  double v4 = v3;

  return v4;
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    [(UILabel *)self->_headerLabel setText:v5];
  }
}

+ (id)reuseIdentifier
{
  double v2 = (objc_class *)objc_opt_class();
  double v3 = NSStringFromClass(v2);
  double v4 = [v3 stringByAppendingString:@"ReuseIdentifier"];

  return v4;
}

+ (id)elementKind
{
  return UICollectionElementKindSectionHeader;
}

+ (UIEdgeInsets)_edgeInsets
{
  if (SiriUIIsCompactWidth())
  {
    double v2 = 21.5;
  }
  else if (SiriUIIsLargePhoneLayout())
  {
    double v2 = 21.5;
  }
  else
  {
    double v2 = 45.5;
  }
  double v3 = 36.0;
  double v4 = 0.0;
  double v5 = 24.0;
  result.double right = v3;
  result.double bottom = v2;
  result.double left = v5;
  result.double top = v4;
  return result;
}

+ (id)_font
{
  return +[UIFont siriui_dynamicTitle0Font];
}

- (NSString)title
{
  return self->_title;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end