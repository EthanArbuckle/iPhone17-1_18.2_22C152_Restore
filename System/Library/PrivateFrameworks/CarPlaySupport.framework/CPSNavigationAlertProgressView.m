@interface CPSNavigationAlertProgressView
- (CGSize)intrinsicContentSize;
- (CPSNavigationAlertProgressView)initWithFrame:(CGRect)a3;
- (UIView)progressView;
- (double)duration;
- (void)setDuration:(double)a3;
- (void)setProgressView:(id)a3;
@end

@implementation CPSNavigationAlertProgressView

- (CPSNavigationAlertProgressView)initWithFrame:(CGRect)a3
{
  CGRect v17 = a3;
  SEL v15 = a2;
  v16 = 0;
  v14.receiver = self;
  v14.super_class = (Class)CPSNavigationAlertProgressView;
  v13 = -[CPSNavigationAlertProgressView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v16 = v13;
  objc_storeStrong((id *)&v16, v13);
  if (v13)
  {
    id v6 = (id)[MEMORY[0x263F1C550] clearColor];
    -[CPSNavigationAlertProgressView setBackgroundColor:](v16, "setBackgroundColor:");

    [(CPSNavigationAlertProgressView *)v16 intrinsicContentSize];
    double v7 = v3 / 2.0;
    id v8 = (id)[(CPSNavigationAlertProgressView *)v16 layer];
    [v8 setCornerRadius:v7];

    id v9 = (id)[(CPSNavigationAlertProgressView *)v16 layer];
    [v9 setMaskedCorners:15];

    uint64_t v10 = *MEMORY[0x263F15A20];
    id v11 = (id)[(CPSNavigationAlertProgressView *)v16 layer];
    [v11 setCornerCurve:v10];

    id v12 = (id)[(CPSNavigationAlertProgressView *)v16 layer];
    [v12 setMasksToBounds:1];
  }
  v5 = v16;
  objc_storeStrong((id *)&v16, 0);
  return v5;
}

- (CGSize)intrinsicContentSize
{
  CGSizeMake_11();
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (UIView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end