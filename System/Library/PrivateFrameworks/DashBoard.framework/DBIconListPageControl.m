@interface DBIconListPageControl
- (BOOL)showsButtons;
- (CGSize)intrinsicContentSize;
- (DBIconListPageControl)initWithFrame:(CGRect)a3;
- (double)_indicatorSpacing;
- (double)defaultHeight;
- (void)setShowsButtons:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBIconListPageControl

- (DBIconListPageControl)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DBIconListPageControl;
  v3 = -[SBIconListPageControl initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] labelColor];
    v5 = [(DBIconListPageControl *)v3 traitCollection];
    v6 = [v4 resolvedColorWithTraitCollection:v5];
    [(UIPageControl *)v3 setCurrentPageIndicatorTintColor:v6];

    v7 = [MEMORY[0x263F825C8] _carSystemTertiaryColor];
    v8 = [(DBIconListPageControl *)v3 traitCollection];
    v9 = [v7 resolvedColorWithTraitCollection:v8];
    [(UIPageControl *)v3 setPageIndicatorTintColor:v9];

    [(UIPageControl *)v3 setAllowsContinuousInteraction:0];
  }
  return v3;
}

- (double)defaultHeight
{
  return 28.0;
}

- (double)_indicatorSpacing
{
  return 10.0;
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DBIconListPageControl;
  [(DBIconListPageControl *)&v10 traitCollectionDidChange:a3];
  v4 = [MEMORY[0x263F825C8] labelColor];
  v5 = [(DBIconListPageControl *)self traitCollection];
  v6 = [v4 resolvedColorWithTraitCollection:v5];
  [(UIPageControl *)self setCurrentPageIndicatorTintColor:v6];

  v7 = [MEMORY[0x263F825C8] _carSystemTertiaryColor];
  v8 = [(DBIconListPageControl *)self traitCollection];
  v9 = [v7 resolvedColorWithTraitCollection:v8];
  [(UIPageControl *)self setPageIndicatorTintColor:v9];
}

- (CGSize)intrinsicContentSize
{
  v8.receiver = self;
  v8.super_class = (Class)DBIconListPageControl;
  [(UIPageControl *)&v8 intrinsicContentSize];
  double v4 = v3;
  BOOL v5 = [(DBIconListPageControl *)self showsButtons];
  double v6 = 21.0;
  if (!v5) {
    double v6 = 10.0;
  }
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)setShowsButtons:(BOOL)a3
{
  if (self->_showsButtons != a3)
  {
    self->_showsButtons = a3;
    [(DBIconListPageControl *)self setNeedsLayout];
  }
}

- (BOOL)showsButtons
{
  return self->_showsButtons;
}

@end