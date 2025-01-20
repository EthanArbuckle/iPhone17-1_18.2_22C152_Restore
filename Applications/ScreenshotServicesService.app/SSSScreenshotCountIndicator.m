@interface SSSScreenshotCountIndicator
+ (id)_labelFont;
- (CGSize)intrinsicContentSize;
- (SSSScreenshotCountIndicator)initWithFrame:(CGRect)a3;
- (int64_t)count;
- (int64_t)index;
- (void)layoutSubviews;
- (void)setCount:(int64_t)a3;
- (void)setIndex:(int64_t)a3;
@end

@implementation SSSScreenshotCountIndicator

+ (id)_labelFont
{
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:0 options:3];
  v3 = +[UIFont fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (SSSScreenshotCountIndicator)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SSSScreenshotCountIndicator;
  v3 = -[SSSScreenshotCountIndicator initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UIPageControl *)objc_alloc_init((Class)UIPageControl);
  pageControl = v3->_pageControl;
  v3->_pageControl = v4;

  v6 = v3->_pageControl;
  v7 = +[UIColor colorWithRed:0.8359375 green:0.87890625 blue:0.9453125 alpha:1.0];
  [(UIPageControl *)v6 setCurrentPageIndicatorTintColor:v7];

  [(UIPageControl *)v3->_pageControl setUserInteractionEnabled:0];
  v8 = (UILabel *)objc_alloc_init((Class)UILabel);
  label = v3->_label;
  v3->_label = v8;

  v10 = v3->_label;
  v11 = +[UIColor colorWithWhite:1.0 alpha:0.75];
  [(UILabel *)v10 setTextColor:v11];

  v12 = v3->_label;
  v13 = [(id)objc_opt_class() _labelFont];
  [(UILabel *)v12 setFont:v13];

  [(UILabel *)v3->_label setTextAlignment:1];
  [(SSSScreenshotCountIndicator *)v3 addSubview:v3->_pageControl];
  [(SSSScreenshotCountIndicator *)v3 addSubview:v3->_label];
  return v3;
}

- (void)layoutSubviews
{
  [(SSSScreenshotCountIndicator *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIPageControl setFrame:](self->_pageControl, "setFrame:");
  -[UILabel setFrame:](self->_label, "setFrame:", v4, v6, v8, v10);
  [(UIPageControl *)self->_pageControl setNumberOfPages:[(SSSScreenshotCountIndicator *)self count]];
  [(UIPageControl *)self->_pageControl setCurrentPage:[(SSSScreenshotCountIndicator *)self index]];
  [(UIPageControl *)self->_pageControl intrinsicContentSize];
  double v12 = v11;
  double v13 = (v8 + v8) / 3.0;
  if (v11 > v13) {
    double v14 = 0.0;
  }
  else {
    double v14 = 1.0;
  }
  if (v12 > v13) {
    double v15 = 1.0;
  }
  else {
    double v15 = 0.0;
  }
  [(UIPageControl *)self->_pageControl setAlpha:v14];
  [(UILabel *)self->_label setAlpha:v15];
  if (v12 > v13)
  {
    v17 = (char *)[(SSSScreenshotCountIndicator *)self index] + 1;
    v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"INDEX_OF_SCREENSHOT_IN_TOTAL_FORMAT" value:&stru_10009B8B0 table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v17, [(SSSScreenshotCountIndicator *)self count]);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    [(UILabel *)self->_label setText:v20];
  }
  else
  {
    label = self->_label;
    [(UILabel *)label setText:0];
  }
}

- (CGSize)intrinsicContentSize
{
  [(UIPageControl *)self->_pageControl intrinsicContentSize];
  double v4 = v3;
  [(UILabel *)self->_label intrinsicContentSize];
  if (v4 < v5) {
    double v4 = v5;
  }
  [(UIPageControl *)self->_pageControl intrinsicContentSize];
  double v7 = v6;
  [(UILabel *)self->_label intrinsicContentSize];
  if (v7 >= v8) {
    double v8 = v7;
  }
  double v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)setCount:(int64_t)a3
{
  if (self->_count != a3)
  {
    self->_count = a3;
    [(SSSScreenshotCountIndicator *)self setNeedsLayout];
    [(SSSScreenshotCountIndicator *)self layoutIfNeeded];
  }
}

- (void)setIndex:(int64_t)a3
{
  if (self->_index != a3)
  {
    self->_index = a3;
    [(SSSScreenshotCountIndicator *)self setNeedsLayout];
    [(SSSScreenshotCountIndicator *)self layoutIfNeeded];
  }
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_pageControl, 0);
}

@end