@interface HNDBubbleCursorLayer
- (BOOL)isSimpleRect;
- (HNDBubbleCursorLayer)init;
- (UIColor)restingFillColor;
- (UIColor)restingStrokeColor;
- (double)_borderWidthForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
- (double)_boundsInsetForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
- (double)_opacityForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
- (double)boundsInset;
- (double)valueForPointerSizeMultipler:(double)a3 withBaseValue:(double)a4;
- (id)_borderPatternForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
- (id)_fillColorForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
- (id)_strokeColorForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5;
- (id)description;
- (int)level;
- (int)theme;
- (void)_updatePresentationProperties;
- (void)ensureHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setBoundsInset:(double)a3;
- (void)setLevel:(int)a3;
- (void)setRestingFillColor:(id)a3;
- (void)setRestingStrokeColor:(id)a3;
- (void)setSimpleRect:(BOOL)a3;
- (void)setTheme:(int)a3;
- (void)updateLevel:(int)a3 animated:(BOOL)a4;
- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6;
- (void)updateTheme:(int)a3 animated:(BOOL)a4;
@end

@implementation HNDBubbleCursorLayer

- (HNDBubbleCursorLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)HNDBubbleCursorLayer;
  v2 = [(HNDBubbleCursorLayer *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(HNDBubbleCursorLayer *)v2 setLevel:0];
    [(HNDBubbleCursorLayer *)v3 setTheme:0];
    [(HNDBubbleCursorLayer *)v3 setOpaque:0];
    [(HNDBubbleCursorLayer *)v3 _updatePresentationProperties];
  }
  return v3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = +[NSNumber numberWithBool:self->_ensureHidden];
  v6 = +[NSNumber numberWithUnsignedInt:[(HNDBubbleCursorLayer *)self theme]];
  v7 = +[NSNumber numberWithUnsignedInt:[(HNDBubbleCursorLayer *)self level]];
  v8 = +[NSNumber numberWithDouble:sub_10004119C()];
  v9 = +[NSNumber numberWithBool:[(HNDBubbleCursorLayer *)self isHidden]];
  v13.receiver = self;
  v13.super_class = (Class)HNDBubbleCursorLayer;
  v10 = [(HNDBubbleCursorLayer *)&v13 debugDescription];
  v11 = +[NSString stringWithFormat:@"%@<%p>. ensureHidden:%@ theme:%@ level:%@ normalizedPointerSizeMultiplier:%@. hidden:%@ %@", v4, self, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (void)ensureHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_ensureHidden != a3)
  {
    self->_ensureHidden = a3;
    if (a4)
    {
      [(HNDBubbleCursorLayer *)self _updatePresentationProperties];
    }
    else
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      [(HNDBubbleCursorLayer *)self _updatePresentationProperties];
      +[CATransaction commit];
    }
  }
}

- (void)updateTheme:(int)a3 animated:(BOOL)a4
{
  if (self->_theme != a3)
  {
    self->_theme = a3;
    if (a4)
    {
      [(HNDBubbleCursorLayer *)self _updatePresentationProperties];
    }
    else
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      [(HNDBubbleCursorLayer *)self _updatePresentationProperties];
      +[CATransaction commit];
    }
  }
}

- (void)updateLevel:(int)a3 animated:(BOOL)a4
{
  if (self->_level != a3)
  {
    self->_level = a3;
    if (a4)
    {
      [(HNDBubbleCursorLayer *)self _updatePresentationProperties];
    }
    else
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      [(HNDBubbleCursorLayer *)self _updatePresentationProperties];
      +[CATransaction commit];
    }
  }
}

- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v7 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  [(HNDBubbleCursorLayer *)self setSimpleRect:v7];
  if (!a6)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
  }
  if (v13)
  {
    -[HNDBubbleCursorLayer setFrame:](self, "setFrame:", x, y, width, height);
    [(HNDBubbleCursorLayer *)self _updatePresentationProperties];
    -[HNDBubbleCursorLayer setPath:](self, "setPath:", [v13 CGPath]);
    if (a6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [(HNDBubbleCursorLayer *)self _updatePresentationProperties];
  if (!a6) {
LABEL_5:
  }
    +[CATransaction commit];
LABEL_6:
}

- (void)_updatePresentationProperties
{
  uint64_t v3 = [(HNDBubbleCursorLayer *)self theme];
  uint64_t v4 = [(HNDBubbleCursorLayer *)self level];
  double v5 = sub_10004119C();
  if (v4) {
    BOOL ensureHidden = self->_ensureHidden;
  }
  else {
    BOOL ensureHidden = 1;
  }
  [(HNDBubbleCursorLayer *)self setHidden:ensureHidden];
  BOOL v7 = [(HNDBubbleCursorLayer *)self _strokeColorForTheme:v3 level:v4 pointerSizeMultiplier:v5];
  [(HNDBubbleCursorLayer *)self setRestingStrokeColor:v7];

  id v8 = [(HNDBubbleCursorLayer *)self restingStrokeColor];
  -[HNDBubbleCursorLayer setStrokeColor:](self, "setStrokeColor:", [v8 CGColor]);

  v9 = [(HNDBubbleCursorLayer *)self _fillColorForTheme:v3 level:v4 pointerSizeMultiplier:v5];
  [(HNDBubbleCursorLayer *)self setRestingFillColor:v9];

  id v10 = [(HNDBubbleCursorLayer *)self restingFillColor];
  -[HNDBubbleCursorLayer setFillColor:](self, "setFillColor:", [v10 CGColor]);

  [(HNDBubbleCursorLayer *)self _boundsInsetForTheme:v3 level:v4 pointerSizeMultiplier:v5];
  -[HNDBubbleCursorLayer setBoundsInset:](self, "setBoundsInset:");
  [(HNDBubbleCursorLayer *)self _borderWidthForTheme:v3 level:v4 pointerSizeMultiplier:v5];
  -[HNDBubbleCursorLayer setLineWidth:](self, "setLineWidth:");
  v11 = [(HNDBubbleCursorLayer *)self _borderPatternForTheme:v3 level:v4 pointerSizeMultiplier:v5];
  [(HNDBubbleCursorLayer *)self setLineDashPattern:v11];

  [(HNDBubbleCursorLayer *)self _opacityForTheme:v3 level:v4 pointerSizeMultiplier:v5];
  *(float *)&double v12 = v12;

  [(HNDBubbleCursorLayer *)self setOpacity:v12];
}

- (double)valueForPointerSizeMultipler:(double)a3 withBaseValue:(double)a4
{
  if (sub_10004119C() > 0.0) {
    return (sub_10004119C() * (a3 + -1.0) + 1.0) * a4;
  }
  return a4;
}

- (id)_strokeColorForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5
{
  return 0;
}

- (id)_fillColorForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5
{
  return 0;
}

- (double)_boundsInsetForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5
{
  return 0.0;
}

- (double)_borderWidthForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5
{
  return 0.0;
}

- (id)_borderPatternForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5
{
  return 0;
}

- (double)_opacityForTheme:(int)a3 level:(int)a4 pointerSizeMultiplier:(double)a5
{
  double result = 0.6;
  if (a4 != 2) {
    return 1.0;
  }
  return result;
}

- (int)theme
{
  return self->_theme;
}

- (void)setTheme:(int)a3
{
  self->_theme = a3;
}

- (int)level
{
  return self->_level;
}

- (void)setLevel:(int)a3
{
  self->_level = a3;
}

- (BOOL)isSimpleRect
{
  return self->_isSimpleRect;
}

- (UIColor)restingStrokeColor
{
  return self->_restingStrokeColor;
}

- (void)setRestingStrokeColor:(id)a3
{
}

- (UIColor)restingFillColor
{
  return self->_restingFillColor;
}

- (void)setRestingFillColor:(id)a3
{
}

- (double)boundsInset
{
  return self->_boundsInset;
}

- (void)setBoundsInset:(double)a3
{
  self->_boundsInset = a3;
}

- (void)setSimpleRect:(BOOL)a3
{
  self->_simpleRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restingFillColor, 0);

  objc_storeStrong((id *)&self->_restingStrokeColor, 0);
}

@end