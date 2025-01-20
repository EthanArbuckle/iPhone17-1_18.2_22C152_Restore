@interface NLWorkoutComplicationAnimatedWrapperView
- (BOOL)usesLegibility;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKImageProvider)imageProvider;
- (NLWorkoutComplicationAnimatedWrapperView)initWithAnimationImages:(id)a3;
- (UIColor)color;
- (UIColor)overrideColor;
- (void)_applyAnimationForPauseState:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateState;
- (void)_updateTint;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setOverrideColor:(id)a3;
- (void)setUsesLegibility:(BOOL)a3;
@end

@implementation NLWorkoutComplicationAnimatedWrapperView

- (NLWorkoutComplicationAnimatedWrapperView)initWithAnimationImages:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = objc_alloc_init(NLWorkoutImageView);
    [(NLWorkoutImageView *)v5 setAnimationImages:v4];
    -[NLWorkoutImageView setAnimationDuration:](v5, "setAnimationDuration:", (double)(unint64_t)[v4 count] / 60.0);
    v6 = [v4 objectAtIndex:0];
    v7 = [v6 imageWithRenderingMode:2];
    [(NLWorkoutImageView *)v5 setImage:v7];

    v8 = [(NLWorkoutImageView *)v5 image];
    [v8 size];
    v14.receiver = self;
    v14.super_class = (Class)NLWorkoutComplicationAnimatedWrapperView;
    v11 = -[NLWorkoutComplicationAnimatedWrapperView initWithFrame:](&v14, "initWithFrame:", 0.0, 0.0, v9, v10);

    if (v11)
    {
      objc_storeStrong((id *)&v11->_imageView, v5);
      [(NLWorkoutComplicationAnimatedWrapperView *)v11 addSubview:v11->_imageView];
    }
    v12 = v11;
  }
  else
  {

    v12 = 0;
  }

  return v12;
}

- (void)setImageProvider:(id)a3
{
  v5 = (CLKImageProvider *)a3;
  p_imageProvider = &self->_imageProvider;
  if (self->_imageProvider != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_imageProvider, a3);
    p_imageProvider = (CLKImageProvider **)[(NLWorkoutComplicationAnimatedWrapperView *)self _updateState];
    v5 = v7;
  }

  _objc_release_x1(p_imageProvider, v5);
}

- (void)setColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_color] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    [(NLWorkoutComplicationAnimatedWrapperView *)self _updateTint];
  }
}

- (void)_updateTint
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(UIImageView *)self->_imageView setTintColor:self->_color];
  +[CATransaction commit];
  v3 = [(UIColor *)self->_color CGColor];
  id v4 = [(UIImageView *)self->_imageView layer];
  [v4 setContentsMultiplyColor:v3];
}

- (void)_applyAnimationForPauseState:(BOOL)a3 animated:(BOOL)a4
{
  imageView = self->_imageView;
  if (a3)
  {
    BOOL v6 = a4;
    [(UIImageView *)imageView stopAnimating];
    if (v6)
    {
      id v12 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
      [v12 setToValue:&off_CB68];
      [v12 setAutoreverses:1];
      [v12 setDuration:0.8];
      LODWORD(v7) = 2139095039;
      [v12 setRepeatCount:v7];
      v8 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
      [v12 setTimingFunction:v8];

      double v9 = [(UIImageView *)self->_imageView layer];
      [v9 addAnimation:v12 forKey:@"pulse"];
    }
  }
  else
  {
    double v10 = [(UIImageView *)imageView layer];
    [v10 removeAllAnimations];

    v11 = self->_imageView;
    [(UIImageView *)v11 startAnimating];
  }
}

- (void)_updateState
{
  id v3 = [(CLKImageProvider *)self->_imageProvider isPaused];

  [(NLWorkoutComplicationAnimatedWrapperView *)self _applyAnimationForPauseState:v3 animated:1];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = [(UIImageView *)self->_imageView image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  [(NLWorkoutComplicationAnimatedWrapperView *)self bounds];
  -[UIImageView setFrame:](self->_imageView, "setFrame:");

  [(NLWorkoutComplicationAnimatedWrapperView *)self _updateTint];
}

- (UIColor)overrideColor
{
  overrideColor = self->_overrideColor;
  if (overrideColor)
  {
    id v3 = overrideColor;
  }
  else
  {
    id v3 = [(CLKImageProvider *)self->_imageProvider tintColor];
  }

  return v3;
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (UIColor)color
{
  return self->_color;
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (void)setUsesLegibility:(BOOL)a3
{
  self->_usesLegibility = a3;
}

- (void)setOverrideColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end