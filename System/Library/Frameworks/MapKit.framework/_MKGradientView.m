@interface _MKGradientView
+ (Class)layerClass;
- (BOOL)shouldReduceTransparency;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (NSArray)colors;
- (NSArray)locations;
- (UIColor)accessibilityColor;
- (_MKGradientView)initWithCoder:(id)a3;
- (_MKGradientView)initWithFrame:(CGRect)a3;
- (void)_setup;
- (void)_transparencyStatusDidChange;
- (void)_update;
- (void)setAccessibilityColor:(id)a3;
- (void)setColors:(id)a3;
- (void)setEndPoint:(CGPoint)a3;
- (void)setLocations:(id)a3;
- (void)setShouldReduceTransparency:(BOOL)a3;
- (void)setStartPoint:(CGPoint)a3;
@end

@implementation _MKGradientView

- (_MKGradientView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_MKGradientView;
  v3 = -[_MKGradientView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_MKGradientView *)v3 _setup];
  }
  return v4;
}

- (_MKGradientView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_MKGradientView;
  v3 = [(_MKGradientView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(_MKGradientView *)v3 _setup];
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_setup
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__transparencyStatusDidChange name:*MEMORY[0x1E4F43480] object:0];

  self->_shouldReduceTransparency = UIAccessibilityIsReduceTransparencyEnabled();
  v4 = [(_MKGradientView *)self gradientLayer];
  [v4 startPoint];
  self->_startPoint.x = v5;
  self->_startPoint.y = v6;

  v7 = [(_MKGradientView *)self gradientLayer];
  [v7 endPoint];
  self->_endPoint.x = v8;
  self->_endPoint.y = v9;

  [(_MKGradientView *)self _update];
}

- (void)setShouldReduceTransparency:(BOOL)a3
{
  if (self->_shouldReduceTransparency != a3)
  {
    self->_shouldReduceTransparency = a3;
    [(_MKGradientView *)self _update];
  }
}

- (UIColor)accessibilityColor
{
  accessibilityColor = self->_accessibilityColor;
  if (!accessibilityColor)
  {
    v4 = [MEMORY[0x1E4F428B8] clearColor];
    CGFloat v5 = self->_accessibilityColor;
    self->_accessibilityColor = v4;

    accessibilityColor = self->_accessibilityColor;
  }

  return accessibilityColor;
}

- (void)setAccessibilityColor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_accessibilityColor;
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id v11 = (id)v6;
    char v7 = [(id)v5 isEqual:v6];

    unint64_t v6 = (unint64_t)v11;
    if ((v7 & 1) == 0)
    {
      CGFloat v8 = (UIColor *)[v11 copy];
      accessibilityColor = self->_accessibilityColor;
      self->_accessibilityColor = v8;

      BOOL v10 = [(_MKGradientView *)self shouldReduceTransparency];
      unint64_t v6 = (unint64_t)v11;
      if (v10)
      {
        [(_MKGradientView *)self _update];
        unint64_t v6 = (unint64_t)v11;
      }
    }
  }
}

- (void)setColors:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_colors;
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id v11 = (id)v6;
    char v7 = [(id)v5 isEqual:v6];

    unint64_t v6 = (unint64_t)v11;
    if ((v7 & 1) == 0)
    {
      CGFloat v8 = (NSArray *)[v11 copy];
      colors = self->_colors;
      self->_colors = v8;

      BOOL v10 = [(_MKGradientView *)self shouldReduceTransparency];
      unint64_t v6 = (unint64_t)v11;
      if (!v10)
      {
        [(_MKGradientView *)self _update];
        unint64_t v6 = (unint64_t)v11;
      }
    }
  }
}

- (void)setLocations:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_locations;
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id v11 = (id)v6;
    char v7 = [(id)v5 isEqual:v6];

    unint64_t v6 = (unint64_t)v11;
    if ((v7 & 1) == 0)
    {
      CGFloat v8 = (NSArray *)[v11 copy];
      locations = self->_locations;
      self->_locations = v8;

      BOOL v10 = [(_MKGradientView *)self shouldReduceTransparency];
      unint64_t v6 = (unint64_t)v11;
      if (!v10)
      {
        [(_MKGradientView *)self _update];
        unint64_t v6 = (unint64_t)v11;
      }
    }
  }
}

- (void)setStartPoint:(CGPoint)a3
{
  if (self->_startPoint.x != a3.x || self->_startPoint.y != a3.y)
  {
    self->_startPoint = a3;
    if (![(_MKGradientView *)self shouldReduceTransparency])
    {
      [(_MKGradientView *)self _update];
    }
  }
}

- (void)setEndPoint:(CGPoint)a3
{
  if (self->_endPoint.x != a3.x || self->_endPoint.y != a3.y)
  {
    self->_endPoint = a3;
    if (![(_MKGradientView *)self shouldReduceTransparency])
    {
      [(_MKGradientView *)self _update];
    }
  }
}

- (void)_update
{
  v27[2] = *MEMORY[0x1E4F143B8];
  if ([(_MKGradientView *)self shouldReduceTransparency])
  {
    v3 = [(_MKGradientView *)self accessibilityColor];
    v27[0] = v3;
    id v4 = [(_MKGradientView *)self accessibilityColor];
    v27[1] = v4;
    unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

    unint64_t v6 = [(_MKGradientView *)self gradientLayer];
    [v6 setLocations:0];
  }
  else
  {
    unint64_t v5 = [(_MKGradientView *)self colors];
    unint64_t v6 = [(_MKGradientView *)self locations];
    char v7 = [(_MKGradientView *)self gradientLayer];
    [v7 setLocations:v6];
  }
  CGFloat v8 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v22 + 1) + 8 * v13);
        objc_msgSend(v8, "addObject:", objc_msgSend(v14, "CGColor", (void)v22));
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  v15 = [(_MKGradientView *)self gradientLayer];
  [v15 setColors:v8];

  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  v18 = [(_MKGradientView *)self gradientLayer];
  objc_msgSend(v18, "setStartPoint:", x, y);

  double v19 = self->_endPoint.x;
  double v20 = self->_endPoint.y;
  v21 = [(_MKGradientView *)self gradientLayer];
  objc_msgSend(v21, "setEndPoint:", v19, v20);
}

- (void)_transparencyStatusDidChange
{
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();

  [(_MKGradientView *)self setShouldReduceTransparency:IsReduceTransparencyEnabled];
}

- (NSArray)colors
{
  return self->_colors;
}

- (NSArray)locations
{
  return self->_locations;
}

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x = self->_endPoint.x;
  double y = self->_endPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)shouldReduceTransparency
{
  return self->_shouldReduceTransparency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);

  objc_storeStrong((id *)&self->_accessibilityColor, 0);
}

@end