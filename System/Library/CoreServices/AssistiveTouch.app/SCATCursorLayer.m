@interface SCATCursorLayer
- (BOOL)isDark;
- (BOOL)isSimpleRect;
- (BOOL)usesHighVisibility;
- (SCATCursorLayer)init;
- (UIColor)restingFillColor;
- (UIColor)restingStrokeColor;
- (double)_borderWidthForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (double)_boundsInsetForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (double)_opacityForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (double)boundsInset;
- (id)_borderPatternForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (id)_fillColorForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (id)_strokeColorForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (id)description;
- (id)styleProvider;
- (int64_t)level;
- (int64_t)theme;
- (void)_updatePresentationProperties:(int)a3;
- (void)ensureHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setBoundsInset:(double)a3;
- (void)setIsDark:(BOOL)a3;
- (void)setLevel:(int64_t)a3;
- (void)setRestingFillColor:(id)a3;
- (void)setRestingStrokeColor:(id)a3;
- (void)setSimpleRect:(BOOL)a3;
- (void)setTheme:(int64_t)a3;
- (void)updateLevel:(int64_t)a3 animated:(BOOL)a4 options:(int)a5;
- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6 options:(int)a7;
- (void)updateTheme:(int64_t)a3 animated:(BOOL)a4 options:(int)a5;
@end

@implementation SCATCursorLayer

- (SCATCursorLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCATCursorLayer;
  v2 = [(SCATCursorLayer *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SCATCursorLayer *)v2 setLevel:0];
    [(SCATCursorLayer *)v3 setTheme:0];
    [(SCATCursorLayer *)v3 setOpaque:0];
    [(SCATCursorLayer *)v3 _updatePresentationProperties:0];
  }
  return v3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = +[NSNumber numberWithBool:self->_ensureHidden];
  v6 = +[NSNumber numberWithInteger:[(SCATCursorLayer *)self theme]];
  v7 = +[NSNumber numberWithInteger:[(SCATCursorLayer *)self level]];
  v8 = +[NSNumber numberWithBool:[(SCATCursorLayer *)self usesHighVisibility]];
  v9 = +[NSNumber numberWithBool:[(SCATCursorLayer *)self isHidden]];
  v13.receiver = self;
  v13.super_class = (Class)SCATCursorLayer;
  v10 = [(SCATCursorLayer *)&v13 debugDescription];
  v11 = +[NSString stringWithFormat:@"%@<%p>. ensureHidden:%@ theme:%@ level:%@ highViz:%@. hidden:%@ %@", v4, self, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (BOOL)usesHighVisibility
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchScannerCursorHighVisibilityEnabled];

  return v3;
}

- (id)styleProvider
{
  return +[SCATStyleProvider sharedStyleProvider];
}

- (void)ensureHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_ensureHidden != a3)
  {
    self->_ensureHidden = a3;
    if (a4)
    {
      [(SCATCursorLayer *)self _updatePresentationProperties:0];
    }
    else
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      [(SCATCursorLayer *)self _updatePresentationProperties:0];
      +[CATransaction commit];
    }
  }
}

- (void)updateTheme:(int64_t)a3 animated:(BOOL)a4 options:(int)a5
{
  if (self->_theme != a3)
  {
    uint64_t v5 = *(void *)&a5;
    self->_theme = a3;
    if (a4)
    {
      [(SCATCursorLayer *)self _updatePresentationProperties:*(void *)&a5];
    }
    else
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      [(SCATCursorLayer *)self _updatePresentationProperties:v5];
      +[CATransaction commit];
    }
  }
}

- (void)updateLevel:(int64_t)a3 animated:(BOOL)a4 options:(int)a5
{
  if (self->_level != a3)
  {
    uint64_t v5 = *(void *)&a5;
    self->_level = a3;
    if (a4)
    {
      [(SCATCursorLayer *)self _updatePresentationProperties:*(void *)&a5];
    }
    else
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      [(SCATCursorLayer *)self _updatePresentationProperties:v5];
      +[CATransaction commit];
    }
  }
}

- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6 options:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v9 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  [(SCATCursorLayer *)self setSimpleRect:v9];
  if ((v7 & 2) != 0 || !a6)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
  }
  if (v15)
  {
    -[SCATCursorLayer setFrame:](self, "setFrame:", x, y, width, height);
    [(SCATCursorLayer *)self _updatePresentationProperties:v7];
    -[SCATCursorLayer setPath:](self, "setPath:", [v15 CGPath]);
    if (a6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [(SCATCursorLayer *)self _updatePresentationProperties:v7];
  if (!a6) {
LABEL_6:
  }
    +[CATransaction commit];
LABEL_7:
}

- (void)_updatePresentationProperties:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int64_t v5 = [(SCATCursorLayer *)self theme];
  int64_t v6 = [(SCATCursorLayer *)self level];
  BOOL v7 = [(SCATCursorLayer *)self usesHighVisibility];
  if (v6) {
    BOOL ensureHidden = self->_ensureHidden;
  }
  else {
    BOOL ensureHidden = 1;
  }
  [(SCATCursorLayer *)self setHidden:ensureHidden];
  BOOL v9 = [(SCATCursorLayer *)self _strokeColorForTheme:v5 level:v6 highVisibility:v7 options:v3];
  [(SCATCursorLayer *)self setRestingStrokeColor:v9];

  id v10 = [(SCATCursorLayer *)self restingStrokeColor];
  -[SCATCursorLayer setStrokeColor:](self, "setStrokeColor:", [v10 CGColor]);

  v11 = [(SCATCursorLayer *)self _fillColorForTheme:v5 level:v6 highVisibility:v7 options:v3];
  [(SCATCursorLayer *)self setRestingFillColor:v11];

  id v12 = [(SCATCursorLayer *)self restingFillColor];
  -[SCATCursorLayer setFillColor:](self, "setFillColor:", [v12 CGColor]);

  [(SCATCursorLayer *)self _boundsInsetForTheme:v5 level:v6 highVisibility:v7 options:v3];
  -[SCATCursorLayer setBoundsInset:](self, "setBoundsInset:");
  [(SCATCursorLayer *)self _borderWidthForTheme:v5 level:v6 highVisibility:v7 options:v3];
  -[SCATCursorLayer setLineWidth:](self, "setLineWidth:");
  objc_super v13 = [(SCATCursorLayer *)self _borderPatternForTheme:v5 level:v6 highVisibility:v7 options:v3];
  [(SCATCursorLayer *)self setLineDashPattern:v13];

  [(SCATCursorLayer *)self _opacityForTheme:v5 level:v6 highVisibility:v7 options:v3];
  *(float *)&double v14 = v14;

  [(SCATCursorLayer *)self setOpacity:v14];
}

- (id)_strokeColorForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  int64_t v6 = +[AXSettings sharedInstance];
  [v6 assistiveTouchCursorColor];

  uint64_t v7 = AXSAssistiveTouchCursorColor();

  return +[UIColor colorWithCGColor:v7];
}

- (id)_fillColorForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  return 0;
}

- (double)_boundsInsetForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  return 0.0;
}

- (double)_borderWidthForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  return 0.0;
}

- (id)_borderPatternForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  return 0;
}

- (double)_opacityForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  if (a3 == 2)
  {
    int64_t v6 = [(SCATCursorLayer *)self styleProvider];
    [v6 cursorContainerOpacity];
    double v8 = v7;

    return v8;
  }
  else
  {
    double result = 0.6;
    if (a4 != 2) {
      return 1.0;
    }
  }
  return result;
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

- (BOOL)isSimpleRect
{
  return self->_simpleRect;
}

- (void)setSimpleRect:(BOOL)a3
{
  self->_simpleRect = a3;
}

- (double)boundsInset
{
  return self->_boundsInset;
}

- (void)setBoundsInset:(double)a3
{
  self->_boundsInset = a3;
}

- (int64_t)theme
{
  return self->_theme;
}

- (void)setTheme:(int64_t)a3
{
  self->_theme = a3;
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (BOOL)isDark
{
  return self->_isDark;
}

- (void)setIsDark:(BOOL)a3
{
  self->_isDark = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restingFillColor, 0);

  objc_storeStrong((id *)&self->_restingStrokeColor, 0);
}

@end