@interface CNFRegNavigationBarTitleView
- (BOOL)_useSilverLookForBarStyle:(int64_t)a3;
- (CGSize)_currentTextShadowOffsetForBarStyle:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNFRegNavigationBarTitleView)initWithFrame:(CGRect)a3;
- (CNFRegNavigationBarTitleView)initWithNavigationItem:(id)a3;
- (UINavigationItem)item;
- (id)_currentTextColorForBarStyle:(int64_t)a3;
- (id)_currentTextShadowColorForBarStyle:(int64_t)a3;
- (id)_defaultFont;
- (id)_titleTextColorForBarStyle:(int64_t)a3;
- (void)_updateTitleLabel;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)setItem:(id)a3;
@end

@implementation CNFRegNavigationBarTitleView

- (CNFRegNavigationBarTitleView)initWithNavigationItem:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = -[CNFRegNavigationBarTitleView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    [(CNFRegNavigationBarTitleView *)v9 setItem:v4];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v5, v6, v7, v8);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = (UILabel *)v11;

    v13 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v10->_titleLabel setBackgroundColor:v13];

    [(UILabel *)v10->_titleLabel setOpaque:0];
    [(CNFRegNavigationBarTitleView *)v10 _updateTitleLabel];
    [(CNFRegNavigationBarTitleView *)v10 addSubview:v10->_titleLabel];
  }

  return v10;
}

- (CNFRegNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CNFRegNavigationBarTitleView;
  v3 = -[CNFRegNavigationBarTitleView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(CNFRegNavigationBarTitleView *)v3 setOpaque:0];
    [(CNFRegNavigationBarTitleView *)v4 setUserInteractionEnabled:0];
    double v5 = +[CNFRegAppearanceController globalAppearanceController];
    uint64_t v6 = [v5 navigationBarActivityIndicatorStyle];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:v6];
    activityIndicator = v4->_activityIndicator;
    v4->_activityIndicator = (UIActivityIndicatorView *)v7;

    [(UIActivityIndicatorView *)v4->_activityIndicator startAnimating];
    [(CNFRegNavigationBarTitleView *)v4 addSubview:v4->_activityIndicator];
  }
  return v4;
}

- (void)dealloc
{
  [(UIActivityIndicatorView *)self->_activityIndicator removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)CNFRegNavigationBarTitleView;
  [(CNFRegNavigationBarTitleView *)&v3 dealloc];
}

- (id)_titleTextColorForBarStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL) {
    [MEMORY[0x263F825C8] whiteColor];
  }
  else {
  objc_super v3 = [MEMORY[0x263F825C8] blackColor];
  }
  return v3;
}

- (id)_defaultFont
{
  v2 = [(CNFRegNavigationBarTitleView *)self item];
  objc_super v3 = [v2 navigationBar];
  id v4 = [v3 _defaultTitleFont];

  return v4;
}

- (BOOL)_useSilverLookForBarStyle:(int64_t)a3
{
  double v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  uint64_t v7 = [(CNFRegNavigationBarTitleView *)self item];
  double v8 = [v7 navigationBar];
  v9 = [v8 barTintColor];

  return v6 == 1 && v9 == 0 && a3 == 0;
}

- (id)_currentTextColorForBarStyle:(int64_t)a3
{
  BOOL v5 = -[CNFRegNavigationBarTitleView _useSilverLookForBarStyle:](self, "_useSilverLookForBarStyle:");
  if (v5 && !_currentTextColorForBarStyle____silverLookTextColor)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F825C8]) initWithRed:0.443137258 green:0.470588237 blue:0.501960814 alpha:1.0];
    uint64_t v7 = (void *)_currentTextColorForBarStyle____silverLookTextColor;
    _currentTextColorForBarStyle____silverLookTextColor = v6;
  }
  if (v5)
  {
    id v8 = (id)_currentTextColorForBarStyle____silverLookTextColor;
  }
  else
  {
    id v8 = [(CNFRegNavigationBarTitleView *)self _titleTextColorForBarStyle:a3];
  }
  return v8;
}

- (id)_currentTextShadowColorForBarStyle:(int64_t)a3
{
  BOOL v4 = [(CNFRegNavigationBarTitleView *)self _useSilverLookForBarStyle:a3];
  if (v4 && !_currentTextShadowColorForBarStyle____silverLookShadowColor)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F825C8]) initWithWhite:1.0 alpha:0.5];
    uint64_t v6 = (void *)_currentTextShadowColorForBarStyle____silverLookShadowColor;
    _currentTextShadowColorForBarStyle____silverLookShadowColor = v5;
  }
  if (v4)
  {
    id v7 = (id)_currentTextShadowColorForBarStyle____silverLookShadowColor;
  }
  else
  {
    id v8 = [(UINavigationItem *)self->_item navigationBar];
    id v7 = [v8 buttonItemShadowColor];
  }
  return v7;
}

- (CGSize)_currentTextShadowOffsetForBarStyle:(int64_t)a3
{
  BOOL v3 = [(CNFRegNavigationBarTitleView *)self _useSilverLookForBarStyle:a3];
  double v4 = 1.0;
  if (!v3) {
    double v4 = -1.0;
  }
  double v5 = 0.0;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CNFRegNavigationBarTitleView *)self frame];
  if (v9 != width || v8 != height) {
    [(CNFRegNavigationBarTitleView *)self setNeedsLayout];
  }
  v11.receiver = self;
  v11.super_class = (Class)CNFRegNavigationBarTitleView;
  -[CNFRegNavigationBarTitleView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)_updateTitleLabel
{
  BOOL v3 = [(CNFRegNavigationBarTitleView *)self item];
  double v4 = [v3 navigationBar];
  uint64_t v5 = [v4 barStyle];

  id v12 = [(CNFRegNavigationBarTitleView *)self _defaultFont];
  [(UILabel *)self->_titleLabel setBaselineAdjustment:1];
  uint64_t v6 = [(CNFRegNavigationBarTitleView *)self item];
  id v7 = [v6 title];
  [(UILabel *)self->_titleLabel setText:v7];

  [(UILabel *)self->_titleLabel setFont:v12];
  double v8 = [(CNFRegNavigationBarTitleView *)self _currentTextColorForBarStyle:v5];
  [(UILabel *)self->_titleLabel setTextColor:v8];

  [(CNFRegNavigationBarTitleView *)self _currentTextShadowOffsetForBarStyle:v5];
  -[UILabel setShadowOffset:](self->_titleLabel, "setShadowOffset:");
  double v9 = [(CNFRegNavigationBarTitleView *)self _currentTextShadowColorForBarStyle:v5];
  [(UILabel *)self->_titleLabel setShadowColor:v9];

  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_titleLabel setNumberOfLines:1];
  [v12 pointSize];
  if (v10 != 0.0)
  {
    [v12 pointSize];
    [(UILabel *)self->_titleLabel setMinimumScaleFactor:12.0 / v11];
  }
}

- (void)layoutSubviews
{
  [(CNFRegNavigationBarTitleView *)self _updateTitleLabel];
  [(CNFRegNavigationBarTitleView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIActivityIndicatorView *)self->_activityIndicator bounds];
  CGFloat v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v21.origin.double x = v4;
  v21.origin.double y = v6;
  v21.size.double width = v8;
  v21.size.double height = v10;
  double MidY = CGRectGetMidY(v21);
  v22.origin.double x = 0.0;
  v22.origin.double y = v12;
  v22.size.double width = v14;
  v22.size.double height = v16;
  CGFloat v18 = floor(MidY + CGRectGetHeight(v22) * -0.5);
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", 0.0, v18, v14, v16);
  v23.origin.double x = 0.0;
  v23.origin.double y = v18;
  v23.size.double width = v14;
  v23.size.double height = v16;
  CGRectGetMaxX(v23);
  titleLabel = self->_titleLabel;
  -[UILabel setFrame:](titleLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  [(CNFRegNavigationBarTitleView *)self _updateTitleLabel];
  CGFloat v4 = [(UILabel *)self->_titleLabel text];
  double v5 = [(UILabel *)self->_titleLabel font];
  CGFloat v6 = [MEMORY[0x263F81658] defaultParagraphStyle];
  double v7 = (void *)[v6 mutableCopy];

  [v7 setLineBreakMode:4];
  uint64_t v8 = *MEMORY[0x263F81540];
  v25[0] = *MEMORY[0x263F814F0];
  v25[1] = v8;
  v26[0] = v5;
  v26[1] = v7;
  double v9 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  id v10 = objc_alloc_init(MEMORY[0x263F81668]);
  [(UILabel *)self->_titleLabel minimumScaleFactor];
  objc_msgSend(v10, "setMinimumScaleFactor:");
  if ([v4 length])
  {
    double v11 = [(CNFRegNavigationBarTitleView *)self item];
    CGFloat v12 = [v11 navigationBar];
    [v12 bounds];
    objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 0, v9, v10, v13, v14);
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v16 = *MEMORY[0x263F001B0];
    double v18 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  [(UIActivityIndicatorView *)self->_activityIndicator bounds];
  double v20 = v19;
  [(UIActivityIndicatorView *)self->_activityIndicator bounds];
  double v22 = v21;

  double v23 = v16 + 7.0 + v20;
  double v24 = fmax(v18 + 1.0 + 2.0, v22);
  result.double height = v24;
  result.double width = v23;
  return result;
}

- (UINavigationItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  self->_item = (UINavigationItem *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end