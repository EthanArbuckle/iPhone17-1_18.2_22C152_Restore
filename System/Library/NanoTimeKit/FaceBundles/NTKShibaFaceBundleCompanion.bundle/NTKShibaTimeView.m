@interface NTKShibaTimeView
- (BOOL)shouldUseCustomDialBackground;
- (NTKShibaColorPalette)palette;
- (NTKShibaTimeView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 andDevice:(id)a5;
- (id)_customDialBackgroundView;
- (id)_hourMinuteHandFillColorForColorPalette:(id)a3;
- (id)_hourMinuteHandStrokeColorForColorPalette:(id)a3;
- (id)_secondHandColorForColorPalette:(id)a3;
- (id)_secondTickActiveColorForColorPalette:(id)a3;
- (id)_secondTickInactiveColorForColorPalette:(id)a3;
- (unint64_t)_hourTickCount;
- (unint64_t)_minuteTickCount;
- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 animateElements:(BOOL)a6;
- (void)layoutSubviews;
- (void)setPalette:(id)a3;
@end

@implementation NTKShibaTimeView

- (NTKShibaTimeView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 andDevice:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)NTKShibaTimeView;
  v5 = -[NTKShibaTimeView initWithFrame:style:andDevice:](&v12, "initWithFrame:style:andDevice:", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v7 = [(NTKShibaTimeView *)v5 digitalTimeLabel];
    [v7 setHidden:1];

    v8 = +[UIColor blackColor];
    v9 = [(NTKShibaTimeView *)v6 analogHandsView];
    v10 = [v9 secondHandView];
    [v10 setHandDotColor:v8];
  }
  return v6;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKShibaTimeView;
  [(NTKShibaTimeView *)&v8 layoutSubviews];
  v3 = [(NTKShibaTimeView *)self digitalContainerView];
  [v3 setClipsToBounds:1];

  v4 = [(NTKShibaTimeView *)self digitalContainerView];
  v5 = [v4 layer];
  v6 = [(NTKShibaTimeView *)self digitalContainerView];
  [v6 bounds];
  [v5 setCornerRadius:v7 * 0.5];
}

- (unint64_t)_hourTickCount
{
  return 0;
}

- (unint64_t)_minuteTickCount
{
  return 0;
}

- (BOOL)shouldUseCustomDialBackground
{
  return 1;
}

- (id)_customDialBackgroundView
{
  v2 = objc_opt_new();

  return v2;
}

- (void)setPalette:(id)a3
{
  id v4 = a3;
  v5 = [v4 activeTickColor];
  activeColor = self->_activeColor;
  self->_activeColor = v5;

  double v7 = [v4 inactiveTickColor];
  inactiveColor = self->_inactiveColor;
  self->_inactiveColor = v7;

  v9 = [v4 secondHandColor];

  secondHandColor = self->_secondHandColor;
  self->_secondHandColor = v9;

  [(NTKShibaTimeView *)self _applyColorToAnalogHands];

  [(NTKShibaTimeView *)self _refreshDigitalTicks];
}

- (void)applyTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5 animateElements:(BOOL)a6
{
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 activeTickColor];
  v11 = [v8 activeTickColor];
  NTKInterpolateBetweenColors();
  objc_super v12 = (UIColor *)objc_claimAutoreleasedReturnValue();
  activeColor = self->_activeColor;
  self->_activeColor = v12;

  v14 = [v9 inactiveTickColor];
  v15 = [v8 inactiveTickColor];
  NTKInterpolateBetweenColors();
  v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
  inactiveColor = self->_inactiveColor;
  self->_inactiveColor = v16;

  v18 = [v9 secondHandColor];

  v19 = [v8 secondHandColor];

  NTKInterpolateBetweenColors();
  v20 = (UIColor *)objc_claimAutoreleasedReturnValue();
  secondHandColor = self->_secondHandColor;
  self->_secondHandColor = v20;

  [(NTKShibaTimeView *)self _applyColorToAnalogHands];

  [(NTKShibaTimeView *)self _refreshDigitalTicks];
}

- (id)_secondTickActiveColorForColorPalette:(id)a3
{
  id v4 = a3;
  double tritiumOnFraction = self->_tritiumOnFraction;
  if (tritiumOnFraction >= 1.0)
  {
    v11.receiver = self;
    v11.super_class = (Class)NTKShibaTimeView;
    id v8 = [(NTKShibaTimeView *)&v11 _secondTickInactiveColorForColorPalette:v4];
  }
  else
  {
    if (tritiumOnFraction > 0.0)
    {
      v10.receiver = self;
      v10.super_class = (Class)NTKShibaTimeView;
      v6 = [(NTKShibaTimeView *)&v10 _secondTickInactiveColorForColorPalette:v4];
      double v7 = NTKInterpolateBetweenColors();

      goto LABEL_7;
    }
    id v8 = self->_activeColor;
  }
  double v7 = v8;
LABEL_7:

  return v7;
}

- (id)_secondTickInactiveColorForColorPalette:(id)a3
{
  id v4 = a3;
  double tritiumOnFraction = self->_tritiumOnFraction;
  if (tritiumOnFraction >= 1.0)
  {
    v11.receiver = self;
    v11.super_class = (Class)NTKShibaTimeView;
    id v8 = [(NTKShibaTimeView *)&v11 _secondTickInactiveColorForColorPalette:v4];
  }
  else
  {
    if (tritiumOnFraction > 0.0)
    {
      v10.receiver = self;
      v10.super_class = (Class)NTKShibaTimeView;
      v6 = [(NTKShibaTimeView *)&v10 _secondTickInactiveColorForColorPalette:v4];
      double v7 = NTKInterpolateBetweenColors();

      goto LABEL_7;
    }
    id v8 = self->_inactiveColor;
  }
  double v7 = v8;
LABEL_7:

  return v7;
}

- (id)_hourMinuteHandFillColorForColorPalette:(id)a3
{
  return +[UIColor whiteColor];
}

- (id)_hourMinuteHandStrokeColorForColorPalette:(id)a3
{
  return +[UIColor whiteColor];
}

- (id)_secondHandColorForColorPalette:(id)a3
{
  return self->_secondHandColor;
}

- (NTKShibaColorPalette)palette
{
  return self->_palette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_secondHandColor, 0);
  objc_storeStrong((id *)&self->_inactiveColor, 0);

  objc_storeStrong((id *)&self->_activeColor, 0);
}

@end