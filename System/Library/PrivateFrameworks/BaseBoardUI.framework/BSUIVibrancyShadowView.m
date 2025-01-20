@interface BSUIVibrancyShadowView
+ (CGPoint)defaultShadowEndPoint;
+ (CGPoint)defaultShadowStartPoint;
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BSUIVibrancyShadowView)initWithFrame:(CGRect)a3;
- (CGPoint)shadowEndPoint;
- (CGPoint)shadowStartPoint;
- (id)_defaultGradientColors;
- (void)setShadowEndPoint:(CGPoint)a3;
- (void)setShadowStartPoint:(CGPoint)a3;
- (void)updateFilters;
@end

@implementation BSUIVibrancyShadowView

- (BSUIVibrancyShadowView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BSUIVibrancyShadowView;
  v3 = -[BSUIVibrancyView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(BSUIVibrancyShadowView *)v3 gradientLayer];
    [v5 setType:*MEMORY[0x1E4F3A390]];
    [(id)objc_opt_class() defaultShadowStartPoint];
    objc_msgSend(v5, "setStartPoint:");
    [(id)objc_opt_class() defaultShadowEndPoint];
    objc_msgSend(v5, "setEndPoint:");
    v6 = [(BSUIVibrancyShadowView *)v4 _defaultGradientColors];
    [v5 setColors:v6];

    [v5 setNoiseScale:25.0];
  }
  return v4;
}

- (CGPoint)shadowStartPoint
{
  v2 = [(BSUIVibrancyShadowView *)self gradientLayer];
  [v2 startPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)shadowEndPoint
{
  v2 = [(BSUIVibrancyShadowView *)self gradientLayer];
  [v2 endPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setShadowStartPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(BSUIVibrancyShadowView *)self gradientLayer];
  objc_msgSend(v5, "setStartPoint:", x, y);
}

- (void)setShadowEndPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(BSUIVibrancyShadowView *)self gradientLayer];
  objc_msgSend(v5, "setEndPoint:", x, y);
}

+ (CGPoint)defaultShadowStartPoint
{
  double v2 = 0.5;
  double v3 = 1.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

+ (CGPoint)defaultShadowEndPoint
{
  double v2 = 0.5;
  double v3 = 0.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"filters"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BSUIVibrancyShadowView;
    BOOL v5 = [(BSUIVibrancyShadowView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)updateFilters
{
  v18[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(BSUIVibrancyView *)self configuration];
  if ([v3 effectType] == 3
    || +[BSUIVibrancyView isDisabled])
  {
    id v4 = 0;
    BOOL v5 = 0;
  }
  else
  {
    double v6 = [v3 shadowValues];
    values = self->_values;
    self->_values = v6;

    double v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
    [v8 setName:@"vibrantColor"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    v9 = self->_values;
    if (v9) {
      [(BSUIVibrancyShadowValues *)v9 vibrantColorMatrix];
    }
    v12[2] = v15;
    v12[3] = v16;
    v12[4] = v17;
    v12[0] = v13;
    v12[1] = v14;
    v10 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v12];
    [v8 setValue:v10 forKey:*MEMORY[0x1E4F3A168]];

    v18[0] = v8;
    BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v4 = [(BSUIVibrancyShadowView *)self _defaultGradientColors];
  }
  v11 = [(BSUIVibrancyShadowView *)self gradientLayer];
  [v11 setColors:v4];
  _setLayerFilters(v11, v5);
}

- (id)_defaultGradientColors
{
  v7[2] = *MEMORY[0x1E4F143B8];
  double v2 = [MEMORY[0x1E4F428B8] redColor];
  id v3 = [v2 colorWithAlphaComponent:0.0];
  v7[0] = [v3 CGColor];
  id v4 = v2;
  v7[1] = [v4 CGColor];
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_vibrantColorFilter, 0);
}

@end