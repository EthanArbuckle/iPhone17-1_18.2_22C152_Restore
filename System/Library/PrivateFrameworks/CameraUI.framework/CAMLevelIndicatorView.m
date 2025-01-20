@interface CAMLevelIndicatorView
- (CAMLevelCrosshair)_goalCrosshair;
- (CAMLevelCrosshair)_userCrosshair;
- (CAMLevelIndicatorView)initWithCoder:(id)a3;
- (CAMLevelIndicatorView)initWithFrame:(CGRect)a3;
- (CAMLevelIndicatorView)initWithViewModel:(id)a3;
- (CAMLevelViewModel)viewModel;
- (void)_commonCAMLevelIndicatorViewInitializationWithViewModel:(id)a3;
- (void)_updateCrosshairAlphasWithAlpha:(double)a3 indicatorMode:(int64_t)a4;
- (void)_updateCrosshairHighlightWithOffset:(UIOffset)a3;
- (void)layoutSubviews;
- (void)observable:(id)a3 didPublishChange:(unint64_t)a4 withContext:(void *)a5;
@end

@implementation CAMLevelIndicatorView

- (CAMLevelIndicatorView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMLevelIndicatorView;
  v3 = [(CAMLevelIndicatorView *)&v6 initWithCoder:a3];
  if (v3)
  {
    v4 = objc_alloc_init(CAMLevelViewModel);
    [(CAMLevelIndicatorView *)v3 _commonCAMLevelIndicatorViewInitializationWithViewModel:v4];
  }
  return v3;
}

- (CAMLevelIndicatorView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMLevelIndicatorView;
  v3 = -[CAMLevelIndicatorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CAMLevelViewModel);
    [(CAMLevelIndicatorView *)v3 _commonCAMLevelIndicatorViewInitializationWithViewModel:v4];
  }
  return v3;
}

- (CAMLevelIndicatorView)initWithViewModel:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMLevelIndicatorView;
  v5 = -[CAMLevelIndicatorView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_super v6 = v5;
  if (v5) {
    [(CAMLevelIndicatorView *)v5 _commonCAMLevelIndicatorViewInitializationWithViewModel:v4];
  }

  return v6;
}

- (void)_commonCAMLevelIndicatorViewInitializationWithViewModel:(id)a3
{
  p_viewModel = &self->_viewModel;
  objc_storeStrong((id *)&self->_viewModel, a3);
  id v6 = a3;
  [(CAMObservable *)*p_viewModel registerChangeObserver:self context:0];
  v7 = objc_alloc_init(CAMLevelCrosshair);
  userCrosshair = self->__userCrosshair;
  self->__userCrosshair = v7;

  v9 = objc_alloc_init(CAMLevelCrosshair);
  goalCrosshair = self->__goalCrosshair;
  self->__goalCrosshair = v9;

  [(CAMLevelIndicatorView *)self addSubview:self->__userCrosshair];
  [(CAMLevelIndicatorView *)self addSubview:self->__goalCrosshair];
  [(CAMLevelIndicatorView *)self bounds];
  UIRectGetCenter();
  -[CAMLevelCrosshair setCenter:](self->__goalCrosshair, "setCenter:");
  [(CAMLevelCrosshair *)self->__goalCrosshair setAutoresizingMask:45];
  -[CAMLevelCrosshair setBounds:](self->__userCrosshair, "setBounds:", 0.0, 0.0, 32.0, 32.0);
  -[CAMLevelCrosshair setBounds:](self->__goalCrosshair, "setBounds:", 0.0, 0.0, 32.0, 32.0);
  [(CAMLevelViewModel *)*p_viewModel currentIndicatorAlpha];
  double v12 = v11;
  [(CAMLevelViewModel *)*p_viewModel currentIndicatorOffset];
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [(CAMLevelViewModel *)*p_viewModel currentIndicatorMode];

  [(CAMLevelIndicatorView *)self _updateCrosshairAlphasWithAlpha:v17 indicatorMode:v12];
  -[CAMLevelIndicatorView _updateCrosshairHighlightWithOffset:](self, "_updateCrosshairHighlightWithOffset:", v14, v16);
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CAMLevelIndicatorView;
  [(CAMLevelIndicatorView *)&v13 layoutSubviews];
  v3 = [(CAMLevelIndicatorView *)self viewModel];
  if ([v3 currentIndicatorMode] == 1)
  {
    [(CAMLevelIndicatorView *)self bounds];
    UIRectGetCenter();
    double v5 = v4;
    double v7 = v6;
    [v3 currentIndicatorOffset];
    double v9 = v5 + v8;
    double v11 = v7 + v10;
    double v12 = [(CAMLevelIndicatorView *)self _userCrosshair];
    objc_msgSend(v12, "setCenter:", v9, v11);
  }
}

- (void)_updateCrosshairHighlightWithOffset:(UIOffset)a3
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  id v8 = [(CAMLevelIndicatorView *)self _goalCrosshair];
  double v6 = [(CAMLevelIndicatorView *)self _userCrosshair];
  BOOL v7 = vertical == *(double *)(MEMORY[0x263F838D8] + 8) && horizontal == *MEMORY[0x263F838D8];
  [v8 setHighlighted:v7];
  [v6 setHighlighted:1];
}

- (void)_updateCrosshairAlphasWithAlpha:(double)a3 indicatorMode:(int64_t)a4
{
  if (a4 != 1) {
    a3 = 0.0;
  }
  id v7 = [(CAMLevelIndicatorView *)self _userCrosshair];
  double v6 = [(CAMLevelIndicatorView *)self _goalCrosshair];
  [v7 setAlpha:a3];
  [v6 setAlpha:a3];
}

- (void)observable:(id)a3 didPublishChange:(unint64_t)a4 withContext:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if (!a5)
  {
    id v10 = v8;
    if ((v6 & 3) != 0)
    {
      [v8 currentIndicatorOffset];
      -[CAMLevelIndicatorView _updateCrosshairHighlightWithOffset:](self, "_updateCrosshairHighlightWithOffset:");
      [(CAMLevelIndicatorView *)self setNeedsLayout];
      id v8 = v10;
    }
    if ((v6 & 5) != 0)
    {
      [v10 currentIndicatorAlpha];
      -[CAMLevelIndicatorView _updateCrosshairAlphasWithAlpha:indicatorMode:](self, "_updateCrosshairAlphasWithAlpha:indicatorMode:", [v10 currentIndicatorMode], v9);
      id v8 = v10;
    }
  }
}

- (CAMLevelViewModel)viewModel
{
  return self->_viewModel;
}

- (CAMLevelCrosshair)_goalCrosshair
{
  return self->__goalCrosshair;
}

- (CAMLevelCrosshair)_userCrosshair
{
  return self->__userCrosshair;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__userCrosshair, 0);
  objc_storeStrong((id *)&self->__goalCrosshair, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end