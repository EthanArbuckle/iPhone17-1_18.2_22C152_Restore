@interface CLKUIAnalogTimeView
+ (double)dialContainerSizeForDevice:(id)a3;
- (CLKUIAnalogTimeView)initWithDevice:(id)a3 clockTimer:(id)a4;
- (void)layoutSubviews;
- (void)setAodTransform:(CGAffineTransform *)a3;
- (void)setConfiguration:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation CLKUIAnalogTimeView

- (CLKUIAnalogTimeView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLKUIAnalogTimeView;
  v7 = [(CLKUITimeView *)&v16 initWithDevice:v6 clockTimer:a4];
  if (v7)
  {
    v8 = [CLKUIHandsView alloc];
    _LayoutConstants_1(v6, (uint64_t)v14);
    uint64_t v9 = [(CLKUIHandsView *)v8 initWithDiameter:v6 forDevice:v15];
    handsView = v7->_handsView;
    v7->_handsView = (CLKUIHandsView *)v9;

    v11 = [(CLKUIAnalogHandsView *)v7->_handsView hourHandView];
    [v11 setEnableBackgroundColorAction:1];

    v12 = [(CLKUIAnalogHandsView *)v7->_handsView minuteHandView];
    [v12 setEnableBackgroundColorAction:1];

    [(CLKUIAnalogTimeView *)v7 addSubview:v7->_handsView];
  }

  return v7;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CLKUIAnalogTimeView;
  [(CLKUIAnalogTimeView *)&v19 layoutSubviews];
  MEMORY[0x1D94315A0]([(CLKUIAnalogTimeView *)self bounds]);
  -[CLKUIHandsView setCenter:](self->_handsView, "setCenter:");
  if (self->_ticksView)
  {
    [(CLKUIAnalogTimeView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(CLKUITimeView *)self dialInset];
    CGFloat v12 = v11;
    [(CLKUITimeView *)self dialInset];
    CGFloat v14 = v13;
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    CGRect v21 = CGRectInset(v20, v12, v14);
    -[CLKUIDualTimeAnalogTicksView setFrame:](self->_ticksView, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
  }
  if (self->_backgroundView)
  {
    [(CLKUIAnalogTimeView *)self bounds];
    double MidX = CGRectGetMidX(v22);
    objc_super v16 = [(UIView *)self->_backgroundView layer];
    [v16 setCornerRadius:MidX];

    [(CLKUIAnalogTimeView *)self bounds];
    -[UIView setFrame:](self->_backgroundView, "setFrame:");
  }
  if (self->_inactiveBackgroundView)
  {
    [(CLKUIAnalogTimeView *)self bounds];
    double v17 = CGRectGetMidX(v23);
    v18 = [(UIView *)self->_inactiveBackgroundView layer];
    [v18 setCornerRadius:v17];

    [(CLKUIAnalogTimeView *)self bounds];
    -[UIView setFrame:](self->_inactiveBackgroundView, "setFrame:");
  }
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CLKUIAnalogTimeView;
  [(CLKUITimeView *)&v43 setConfiguration:v4];
  int v5 = [v4 showsDialTicks];
  ticksView = self->_ticksView;
  if (v5)
  {
    if (ticksView)
    {
      [(CLKUIDualTimeAnalogTicksView *)ticksView setHidden:0];
    }
    else
    {
      uint64_t v42 = 0;
      long long v40 = 0u;
      long long v41 = 0u;
      double v7 = [(CLKUITimeView *)self device];
      _LayoutConstants_1(v7, (uint64_t)&v40);

      uint64_t v8 = v42;
      double v9 = [CLKUIDualTimeAnalogTicksView alloc];
      v35[0] = xmmword_1D31B68D0;
      v35[1] = v41;
      v35[2] = v41;
      uint64_t v36 = v8;
      uint64_t v37 = v8;
      char v38 = 1;
      v39[0] = 0;
      *(_DWORD *)((char *)v39 + 3) = 0;
      CGFloat v10 = [(CLKUIDualTimeAnalogTicksView *)v9 initWithConfiguration:v35];
      double v11 = self->_ticksView;
      self->_ticksView = v10;

      [(CLKUIAnalogTimeView *)self insertSubview:self->_ticksView atIndex:0];
    }
    CGFloat v12 = [v4 majorTickColor];
    double v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [(CLKUITimeView *)self timeColor];
    }
    double v15 = v14;

    objc_super v16 = self->_ticksView;
    double v17 = [v15 colorWithAlphaComponent:0.5];
    [(CLKUIDualTimeAnalogTicksView *)v16 setHourTickColor:v15 minuteTickColor:v17];
  }
  else if (ticksView)
  {
    [(CLKUIDualTimeAnalogTicksView *)ticksView setHidden:1];
  }
  v18 = [v4 backgroundView];

  backgroundView = self->_backgroundView;
  if (v18)
  {
    if (backgroundView) {
      [(UIView *)backgroundView removeFromSuperview];
    }
    CGRect v20 = [v4 backgroundView];
    CGRect v21 = self->_backgroundView;
    self->_backgroundView = v20;

    [(UIView *)self->_backgroundView setClipsToBounds:1];
    [(CLKUIAnalogTimeView *)self insertSubview:self->_backgroundView atIndex:0];
  }
  else if (backgroundView)
  {
    [(UIView *)backgroundView removeFromSuperview];
    CGRect v22 = self->_backgroundView;
    self->_backgroundView = 0;
  }
  CGRect v23 = [v4 inactiveBackgroundView];

  inactiveBackgroundView = self->_inactiveBackgroundView;
  if (v23)
  {
    if (inactiveBackgroundView) {
      [(UIView *)inactiveBackgroundView removeFromSuperview];
    }
    v25 = [v4 inactiveBackgroundView];
    v26 = self->_inactiveBackgroundView;
    self->_inactiveBackgroundView = v25;

    [(UIView *)self->_inactiveBackgroundView setClipsToBounds:1];
    [(UIView *)self->_inactiveBackgroundView setAlpha:0.0];
    [(CLKUIAnalogTimeView *)self insertSubview:self->_inactiveBackgroundView atIndex:0];
  }
  else if (inactiveBackgroundView)
  {
    [(UIView *)inactiveBackgroundView removeFromSuperview];
    v27 = self->_inactiveBackgroundView;
    self->_inactiveBackgroundView = 0;
  }
  -[CLKUIAnalogHandsView setSecondHandDisabled:](self->_handsView, "setSecondHandDisabled:", [v4 secondHandDisabled]);
  v28 = [v4 secondHandColor];
  v29 = [v4 hourMinuteHandInlayColor];
  v30 = [v4 hourMinuteHandOutlineColor];
  [(CLKUIAnalogHandsView *)self->_handsView applySecondHandColor:v28];
  [(CLKUIAnalogHandsView *)self->_handsView setInlayColor:v29];
  v31 = [(CLKUIAnalogHandsView *)self->_handsView minuteHandView];
  [v31 setColor:v30];

  v32 = [(CLKUIAnalogHandsView *)self->_handsView hourHandView];
  [v32 setColor:v30];

  v33 = [MEMORY[0x1E4FB1618] blackColor];
  v34 = [(CLKUIAnalogHandsView *)self->_handsView secondHandView];
  [v34 setHandDotColor:v33];
}

- (void)setState:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLKUIAnalogTimeView;
  -[CLKUITimeView setState:](&v6, sel_setState_);
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(CLKUIAnalogHandsView *)self->_handsView setFrozen:v5];
}

- (void)setOverrideDate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKUIAnalogTimeView;
  id v4 = a3;
  [(CLKUITimeView *)&v5 setOverrideDate:v4];
  -[CLKUIHandsView setOverrideDate:](self->_handsView, "setOverrideDate:", v4, v5.receiver, v5.super_class);
}

- (void)setAodTransform:(CGAffineTransform *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLKUIAnalogTimeView;
  long long v5 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v5;
  v8[2] = *(_OWORD *)&a3->tx;
  [(CLKUITimeView *)&v9 setAodTransform:v8];
  long long v6 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->tx;
  [(CLKUIAnalogTimeView *)self setTransform:v7];
}

+ (double)dialContainerSizeForDevice:(id)a3
{
  _LayoutConstants_1(a3, (uint64_t)v4);
  return v4[0];
}

- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = a4;
  long long v6 = [(CLKUIAnalogTimeView *)self traitCollection];
  uint64_t v7 = [v6 activeAppearance];
  uint64_t v8 = [v5 activeAppearance];

  if (v7 != v8)
  {
    objc_super v9 = [(CLKUIAnalogTimeView *)self traitCollection];
    uint64_t v10 = [v9 activeAppearance];

    if (v10) {
      double v11 = 1.0;
    }
    else {
      double v11 = 0.0;
    }
    CGFloat v12 = [(CLKUITimeView *)self configuration];
    id v28 = v12;
    if (v10)
    {
      double v13 = [v12 hourMinuteHandInlayColor];
      id v14 = [v28 hourMinuteHandOutlineColor];
      id v15 = v13;
      objc_super v16 = v15;
    }
    else
    {
      objc_super v16 = [v12 inactiveHourMinuteHandInlayColor];
      id v14 = [v28 inactiveHourMinuteHandOutlineColor];
      id v15 = [MEMORY[0x1E4FB1618] blackColor];
    }
    [(CLKUIAnalogHandsView *)self->_handsView setInlayColor:v16];
    double v17 = [(CLKUIAnalogHandsView *)self->_handsView minuteHandView];
    [v17 setColor:v14];

    v18 = [(CLKUIAnalogHandsView *)self->_handsView hourHandView];
    [v18 setColor:v14];

    objc_super v19 = [(CLKUIAnalogHandsView *)self->_handsView minuteHandView];
    [v19 setHandDotColor:v15];

    CGRect v20 = [(CLKUIAnalogHandsView *)self->_handsView secondHandView];
    [v20 setAlpha:v11];

    if (self->_ticksView)
    {
      if (v10)
      {
        CGRect v21 = [v28 majorTickColor];
        CGRect v22 = v21;
        if (v21)
        {
          id v23 = v21;
        }
        else
        {
          id v23 = [(CLKUITimeView *)self timeColor];
        }
        v24 = v23;
      }
      else
      {
        v24 = [v28 inactiveMajorTickColor];
      }
      ticksView = self->_ticksView;
      v26 = [v24 colorWithAlphaComponent:0.5];
      [(CLKUIDualTimeAnalogTicksView *)ticksView setHourTickColor:v24 minuteTickColor:v26];
    }
    inactiveBackgroundView = self->_inactiveBackgroundView;
    if (inactiveBackgroundView)
    {
      [(UIView *)inactiveBackgroundView setAlpha:1.0 - v11];
      [(UIView *)self->_backgroundView setAlpha:v11];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_ticksView, 0);
  objc_storeStrong((id *)&self->_handsView, 0);
}

@end