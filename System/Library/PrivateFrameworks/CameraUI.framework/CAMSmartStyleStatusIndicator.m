@interface CAMSmartStyleStatusIndicator
+ (CGPoint)centerPositionForNormalizedValue:(CGPoint)a3 inGridOfSize:(CGSize)a4 strokeWidth:(double)a5 strokeToDotSpacing:(double)a6 gridDotWidth:(double)a7;
+ (id)gridImageWithSize:(CGSize)a3 cornerRadius:(double)a4 strokeWidth:(double)a5 strokeToDotSpacing:(double)a6 gridDotWidth:(double)a7 valueDotWidth:(double)a8 value:(CGPoint)a9 color:(id)a10;
+ (void)_drawCircleInContext:(id)a3 atCenter:(CGPoint)a4 diameter:(double)a5;
- (BOOL)isActive;
- (BOOL)shouldUseActiveTintForCurrentState;
- (BOOL)shouldUseOutline;
- (BOOL)shouldUseSlash;
- (BOOL)showDisabled;
- (BOOL)showValueDot;
- (CAMSmartStyleStatusIndicator)initWithFrame:(CGRect)a3;
- (CEKSmartStyle)smartStyle;
- (CGPoint)_normalizedStyleValue;
- (id)accessibilityIdentifier;
- (id)imageForAXHUD;
- (id)imageForCurrentState;
- (id)imageSymbolColorConfiguration;
- (void)_setNormalizedStyleValue:(CGPoint)a3;
- (void)setActive:(BOOL)a3;
- (void)setShowDisabled:(BOOL)a3;
- (void)setShowDisabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowValueDot:(BOOL)a3;
- (void)setSmartStyle:(id)a3;
- (void)setSmartStyle:(id)a3 animated:(BOOL)a4;
@end

@implementation CAMSmartStyleStatusIndicator

- (CAMSmartStyleStatusIndicator)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMSmartStyleStatusIndicator;
  v3 = -[CAMControlStatusIndicator initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)setSmartStyle:(id)a3
{
}

- (void)setSmartStyle:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  uint64_t smartStyle = (uint64_t)self->_smartStyle;
  if ((id)smartStyle != v6)
  {
    v11 = v6;
    uint64_t smartStyle = [(id)smartStyle isEqualToSmartStyle:v6];
    id v6 = v11;
    if ((smartStyle & 1) == 0)
    {
      objc_storeStrong((id *)&self->_smartStyle, a3);
      [v11 colorBias];
      double v9 = v8;
      [v11 toneBias];
      uint64_t smartStyle = -[CAMSmartStyleStatusIndicator _setNormalizedStyleValue:](self, "_setNormalizedStyleValue:", v9, v10);
      id v6 = v11;
    }
  }
  MEMORY[0x270F9A758](smartStyle, v6);
}

- (void)setShowDisabled:(BOOL)a3
{
}

- (void)setShowDisabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showDisabled != a3)
  {
    self->_showDisabled = a3;
    [(CAMControlStatusIndicator *)self updateImageAnimated:a4];
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    [(CAMControlStatusIndicator *)self updateImageAnimated:0];
  }
}

- (void)setShowValueDot:(BOOL)a3
{
  if (self->_showValueDot != a3)
  {
    self->_showValueDot = a3;
    [(CAMControlStatusIndicator *)self updateImageAnimated:0];
  }
}

- (void)_setNormalizedStyleValue:(CGPoint)a3
{
  if (self->__normalizedStyleValue.x != a3.x || self->__normalizedStyleValue.y != a3.y)
  {
    self->__normalizedStyleValue = a3;
    if ([(CAMSmartStyleStatusIndicator *)self showValueDot])
    {
      [(CAMControlStatusIndicator *)self updateImage];
    }
  }
}

- (id)imageForCurrentState
{
  if ([(CAMSmartStyleStatusIndicator *)self isActive]) {
    [MEMORY[0x263F825C8] systemYellowColor];
  }
  else {
  v3 = [MEMORY[0x263F825C8] whiteColor];
  }
  if ([(CAMSmartStyleStatusIndicator *)self showValueDot]) {
    double v4 = 4.33333333;
  }
  else {
    double v4 = 0.0;
  }
  v5 = objc_opt_class();
  [(CAMSmartStyleStatusIndicator *)self _normalizedStyleValue];
  double v8 = objc_msgSend(v5, "gridImageWithSize:cornerRadius:strokeWidth:strokeToDotSpacing:gridDotWidth:valueDotWidth:value:color:", v3, 24.0, 24.0, 5.0, 1.0, 3.0, 1.33333333, v4, v6, v7);

  return v8;
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  v2 = [(CAMSmartStyleStatusIndicator *)self smartStyle];
  char v3 = [v2 isCustomizable];

  return v3;
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (id)imageSymbolColorConfiguration
{
  v2 = (void *)MEMORY[0x263F82818];
  char v3 = [MEMORY[0x263F825C8] tintColor];
  double v4 = [v2 configurationWithHierarchicalColor:v3];

  return v4;
}

- (id)imageForAXHUD
{
  v2 = objc_opt_class();
  char v3 = [MEMORY[0x263F825C8] whiteColor];
  double v4 = objc_msgSend(v2, "gridImageWithSize:cornerRadius:strokeWidth:strokeToDotSpacing:gridDotWidth:valueDotWidth:value:color:", v3, 48.0, 48.0, 10.0, 2.0, 6.0, 2.66666667, 8.66666667, 0x3FE0000000000000, 0x3FE0000000000000);

  return v4;
}

+ (id)gridImageWithSize:(CGSize)a3 cornerRadius:(double)a4 strokeWidth:(double)a5 strokeToDotSpacing:(double)a6 gridDotWidth:(double)a7 valueDotWidth:(double)a8 value:(CGPoint)a9 color:(id)a10
{
  double height = a3.height;
  double width = a3.width;
  id v17 = a10;
  if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    v31 = 0;
  }
  else
  {
    v19 = [MEMORY[0x263F827B0] preferredFormat];
    v20 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:format:", v19, width, height);
    CEKRectWithSize();
    double v33 = a4;
    double v34 = a8;
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    double v25 = a7;
    uint64_t v27 = v26;
    double v28 = a6;
    uint64_t v30 = v29;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __133__CAMSmartStyleStatusIndicator_gridImageWithSize_cornerRadius_strokeWidth_strokeToDotSpacing_gridDotWidth_valueDotWidth_value_color___block_invoke;
    v36[3] = &unk_263FA1110;
    id v37 = v17;
    uint64_t v38 = v22;
    uint64_t v39 = v24;
    uint64_t v40 = v27;
    uint64_t v41 = v30;
    double v42 = a5;
    double v43 = v33;
    id v44 = a1;
    double v45 = width;
    double v46 = height;
    double v47 = v28;
    double v48 = v25;
    double v49 = v34;
    CGPoint v50 = a9;
    v31 = [v20 imageWithActions:v36];
  }
  return v31;
}

void __133__CAMSmartStyleStatusIndicator_gridImageWithSize_cornerRadius_strokeWidth_strokeToDotSpacing_gridDotWidth_valueDotWidth_value_color___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v10 = a2;
  char v3 = [*(id *)(a1 + 32) colorWithAlphaComponent:0.8];
  [v3 setStroke];
  [v3 setFill];
  CGRect v16 = CGRectInset(*(CGRect *)(a1 + 40), *(double *)(a1 + 72) * 0.5, *(double *)(a1 + 72) * 0.5);
  double v4 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height, *(double *)(a1 + 80));
  [v4 setLineWidth:*(double *)(a1 + 72)];
  [v4 stroke];
  v5 = [*(id *)(a1 + 32) colorWithAlphaComponent:0.6];
  [v5 setFill];
  uint64_t v6 = 0;
  uint64_t v12 = 0;
  long long v11 = xmmword_209C79010;
  long long v13 = xmmword_209C79020;
  do
  {
    uint64_t v7 = 0;
    double v8 = *((double *)&v11 + v6);
    do
    {
      objc_msgSend(*(id *)(a1 + 88), "centerPositionForNormalizedValue:inGridOfSize:strokeWidth:strokeToDotSpacing:gridDotWidth:", v8, *(double *)((char *)&v11 + v7), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 72), *(double *)(a1 + 112), *(double *)(a1 + 120));
      objc_msgSend(*(id *)(a1 + 88), "_drawCircleInContext:atCenter:diameter:", v10);
      v7 += 8;
    }
    while (v7 != 40);
    ++v6;
  }
  while (v6 != 5);
  if (*(double *)(a1 + 128) > 0.0)
  {
    double v9 = [*(id *)(a1 + 32) colorWithAlphaComponent:1.0];
    [v9 setFill];
    objc_msgSend(*(id *)(a1 + 88), "centerPositionForNormalizedValue:inGridOfSize:strokeWidth:strokeToDotSpacing:gridDotWidth:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 72), *(double *)(a1 + 112), *(double *)(a1 + 120));
    objc_msgSend(*(id *)(a1 + 88), "_drawCircleInContext:atCenter:diameter:", v10);
  }
}

+ (CGPoint)centerPositionForNormalizedValue:(CGPoint)a3 inGridOfSize:(CGSize)a4 strokeWidth:(double)a5 strokeToDotSpacing:(double)a6 gridDotWidth:(double)a7
{
  double y = a3.y;
  double x = a3.x;
  CEKRectWithSize();
  CGRect v20 = CGRectInset(v19, a5 + a6 + a7 * 0.5, a5 + a6 + a7 * 0.5);
  double width = v20.size.width;
  double height = v20.size.height;
  UIRectGetCenter();
  double v14 = v13 + x * width * 0.5;
  double v16 = v15 - y * height * 0.5;
  result.double y = v16;
  result.double x = v14;
  return result;
}

+ (void)_drawCircleInContext:(id)a3 atCenter:(CGPoint)a4 diameter:(double)a5
{
  double v6 = a5 * 0.5;
  CGFloat v7 = a4.x - v6;
  CGFloat v8 = a4.y - v6;
  double v9 = (CGContext *)[a3 CGContext];
  CGFloat v10 = v7;
  CGFloat v11 = v8;
  double v12 = a5;
  double v13 = a5;
  CGContextFillEllipseInRect(v9, *(CGRect *)&v10);
}

- (id)accessibilityIdentifier
{
  return @"StatusBarSmartStylesButton";
}

- (CEKSmartStyle)smartStyle
{
  return self->_smartStyle;
}

- (BOOL)showDisabled
{
  return self->_showDisabled;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)showValueDot
{
  return self->_showValueDot;
}

- (CGPoint)_normalizedStyleValue
{
  double x = self->__normalizedStyleValue.x;
  double y = self->__normalizedStyleValue.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end