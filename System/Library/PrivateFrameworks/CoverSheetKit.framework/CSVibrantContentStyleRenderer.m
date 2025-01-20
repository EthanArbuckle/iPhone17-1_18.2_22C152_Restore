@interface CSVibrantContentStyleRenderer
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (BSUIVibrancyEffectView)vibrancyView;
- (CGRect)styleBoundingRect;
- (CSContentStyleGradientView)gradientView;
- (CSVibrantContentStyleRenderer)initWithVibrancyView:(id)a3 styleBoundingRect:(CGRect)a4;
- (UIView)contentView;
- (void)_removeGradientIfNeeded;
- (void)_updateForVibrantStyle:(id)a3;
- (void)applyStyle:(id)a3;
- (void)clearAllStyling;
- (void)renderGradientStyle:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setStyleBoundingRect:(CGRect)a3;
- (void)setVibrancyConfiguration:(id)a3;
@end

@implementation CSVibrantContentStyleRenderer

- (CSVibrantContentStyleRenderer)initWithVibrancyView:(id)a3 styleBoundingRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CSVibrantContentStyleRenderer;
  v11 = [(CSVibrantContentStyleRenderer *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_vibrancyView, a3);
    uint64_t v13 = [v10 contentView];
    contentView = v12->_contentView;
    v12->_contentView = (UIView *)v13;

    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    if (CGRectIsEmpty(v21))
    {
      [(UIView *)v12->_contentView bounds];
      CGFloat x = v15;
      CGFloat y = v16;
      CGFloat width = v17;
      CGFloat height = v18;
    }
    v12->_styleBoundingRect.origin.CGFloat x = x;
    v12->_styleBoundingRect.origin.CGFloat y = y;
    v12->_styleBoundingRect.size.CGFloat width = width;
    v12->_styleBoundingRect.size.CGFloat height = height;
  }

  return v12;
}

- (void)setStyleBoundingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_styleBoundingRect))
  {
    self->_styleBoundingRect.origin.CGFloat x = x;
    self->_styleBoundingRect.origin.CGFloat y = y;
    self->_styleBoundingRect.size.CGFloat width = width;
    self->_styleBoundingRect.size.CGFloat height = height;
  }
}

- (void)clearAllStyling
{
  [(CSVibrantContentStyleRenderer *)self _removeGradientIfNeeded];
  vibrancyConfiguration = self->_vibrancyConfiguration;
  self->_vibrancyConfiguration = 0;

  vibrancyView = self->_vibrancyView;

  [(BSUIVibrancyEffectView *)vibrancyView setIsEnabled:0];
}

- (void)_removeGradientIfNeeded
{
  [(CSContentStyleGradientView *)self->_gradientView removeFromSuperview];
  gradientView = self->_gradientView;
  self->_gradientView = 0;
}

- (void)_updateForVibrantStyle:(id)a3
{
  id v9 = a3;
  [(CSVibrantContentStyleRenderer *)self _removeGradientIfNeeded];
  if (!self->_vibrancyConfiguration)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F4F8E8]);
    uint64_t v5 = [v9 vibrancyEffectType];
    v6 = [v9 vibrancyEffectColor];
    v7 = (BSUIVibrancyConfiguration *)[v4 initWithEffectType:v5 backgroundType:0 color:v6];
    vibrancyConfiguration = self->_vibrancyConfiguration;
    self->_vibrancyConfiguration = v7;
  }
  [(BSUIVibrancyEffectView *)self->_vibrancyView setIsEnabled:1];
  [(BSUIVibrancyEffectView *)self->_vibrancyView setConfiguration:self->_vibrancyConfiguration];
}

- (void)applyStyle:(id)a3
{
}

- (void)renderGradientStyle:(id)a3
{
  id v4 = a3;
  [(BSUIVibrancyEffectView *)self->_vibrancyView setIsEnabled:0];
  uint64_t v5 = [v4 colors];
  v6 = objc_msgSend(v5, "bs_map:", &__block_literal_global_0);

  [(UIView *)self->_contentView bounds];
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  CGFloat v11 = CGRectGetWidth(v29);
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v30);
  CGFloat v13 = CGRectGetWidth(self->_styleBoundingRect);
  CGFloat v14 = CGRectGetMinX(self->_styleBoundingRect);
  double v15 = [v4 locations];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __53__CSVibrantContentStyleRenderer_renderGradientStyle___block_invoke_2;
  v28[3] = &__block_descriptor_64_e18__16__0__NSNumber_8l;
  *(CGFloat *)&v28[4] = v13;
  *(CGFloat *)&v28[5] = v14;
  *(CGFloat *)&v28[6] = MinX;
  *(CGFloat *)&v28[7] = v11;
  double v16 = objc_msgSend(v15, "bs_map:", v28);

  gradientView = self->_gradientView;
  if (!gradientView)
  {
    double v18 = -[CSContentStyleGradientView initWithFrame:]([CSContentStyleGradientView alloc], "initWithFrame:", x, y, width, height);
    v19 = [(CSContentStyleGradientView *)v18 layer];
    [v19 setCompositingFilter:*MEMORY[0x1E4F3A308]];

    [v4 startPoint];
    double v21 = v20;
    double v23 = v22;
    [v4 endPoint];
    -[CSContentStyleGradientView setStartPoint:endPoint:](v18, "setStartPoint:endPoint:", v21, v23, v24, v25);
    v26 = self->_gradientView;
    self->_gradientView = v18;
    v27 = v18;

    [(UIView *)self->_contentView addSubview:v27];
    [(CSContentStyleGradientView *)self->_gradientView setAutoresizingMask:18];

    gradientView = self->_gradientView;
  }
  [(CSContentStyleGradientView *)gradientView setColors:v6 locations:v16 type:*MEMORY[0x1E4F3A390]];
}

uint64_t __53__CSVibrantContentStyleRenderer_renderGradientStyle___block_invoke(int a1, id a2)
{
  id v2 = a2;

  return [v2 CGColor];
}

id __53__CSVibrantContentStyleRenderer_renderGradientStyle___block_invoke_2(double *a1, void *a2)
{
  id v3 = a2;
  [v3 floatValue];
  double v5 = v4;
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne())
  {
    id v6 = v3;
  }
  else
  {
    id v6 = [NSNumber numberWithDouble:(a1[5] - a1[6] + a1[4] * v5) / a1[7]];
  }
  v7 = v6;

  return v7;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (void)setVibrancyConfiguration:(id)a3
{
}

- (BSUIVibrancyEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGRect)styleBoundingRect
{
  double x = self->_styleBoundingRect.origin.x;
  double y = self->_styleBoundingRect.origin.y;
  double width = self->_styleBoundingRect.size.width;
  double height = self->_styleBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CSContentStyleGradientView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);

  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
}

@end